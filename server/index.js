const express = require("express");
const cors = require("cors");
const db = require("./db");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// pobieranie graczów z określonej grupy
app.get("/api/players/:group", async (req, res) => {
  try {
    const { group } = req.params;

    const [rows] = await db.query(
      `
      SELECT 
        zawodnik.*,
        DATE_FORMAT(group_change_date, '%Y-%m-%d') AS group_change_date
      FROM zawodnik
      WHERE grupa = ?
      `,
      [group]
    );

    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// Zmiana grupy gracza
app.put("/api/players/:id/change-group", async (req, res) => {
  try {
    const { id } = req.params;
    const { newGroup } = req.body;

    const [player] = await db.query("SELECT * FROM zawodnik WHERE id = ?", [
      id,
    ]);

    if (player.length === 0) {
      return res.status(404).json({
        error: "Player not found",
      });
    }

    if (player[0].group_change_date) {
      return res.status(400).json({
        error: "Player already changed group",
      });
    }

    await db.query(
      `UPDATE zawodnik 
       SET grupa = ?, group_change_date = CURDATE()
       WHERE id = ?`,
      [newGroup, id],
    );

    res.json({
      message: "Group changed successfully",
      playerId: id,
      newGroup,
      changeDate: new Date(),
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({
      error: "Database error",
    });
  }
});

// pobieranie zawodników zapisanych na turniej w określonym dniu i grupie
app.get("/api/tournament/players", async (req, res) => {
  try {
    const { date, group } = req.query;
    console.log(date + " " + group);

    if (!date || !group)
      return res.status(400).json({ error: "Missing date or group" });

    const [rows] = await db.query(
      `SELECT z.id, z.fname, z.lname, tz.id as registration_id 
       FROM turniej_zawodnik tz 
       JOIN zawodnik z ON tz.zawodnik_id = z.id 
       WHERE tz.turniej_data = ? AND z.grupa = ?
       ORDER BY tz.id ASC`,
      [date, group],
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// pobieranie zawodników zapisanych na turniej w określonym dniu i grupie
app.post("/api/tournament/players", async (req, res) => {
  try {
    const { date, zawodnik_id } = req.body;
    if (!date || !zawodnik_id)
      return res.status(400).json({ error: "Missing date or player ID" });

    const [existing] = await db.query(
      "SELECT id FROM turniej_zawodnik WHERE turniej_data = ? AND zawodnik_id = ?",
      [date, zawodnik_id],
    );

    if (existing.length > 0) {
      return res.status(409).json({ error: "Player already registered" });
    }

    await db.query(
      "INSERT INTO turniej_zawodnik (turniej_data, zawodnik_id) VALUES (?, ?)",
      [date, zawodnik_id],
    );
    res.json({ message: "Player added successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// dodawanie nowego zawodnika i rejestracja go na turniej
app.post("/api/tournament/players/add", async (req, res) => {
  try {
    const { date, fname, lname, grupa } = req.body;
    if (!date || !fname || !lname || !grupa)
      return res.status(400).json({ error: "Missing date or player data" });

    await db.query(
      "INSERT INTO zawodnik (fname, lname, grupa) VALUES (?, ?, ?)",
      [fname, lname, grupa],
    );
    const [zawodnik_id] = await db.query(
      "SELECT id FROM zawodnik WHERE fname = ? AND lname = ? AND grupa = ?",
      [fname, lname, grupa],
    );
    await db.query(
      "INSERT INTO turniej_zawodnik (turniej_data, zawodnik_id) VALUES (?, ?)",
      [date, zawodnik_id[0].id],
    );
    res.json({ message: "Player added successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// start turnieju - tworzenie tabeli turniejowej na podstawie zapisanych zawodników
app.post("/api/tournament/start", async (req, res) => {
  try {
    const [tabele] = await db.query(
      "SELECT COUNT(*) as count FROM turniej_tabele where data = ?",
      [new Date().toISOString().split("T")[0]],
    );
    if (parseInt(tabele[0].count) === 0) {
      const grupy = ["podstawowa", "zaawansowana"];
      const date = new Date().toISOString().split("T")[0];

      async function addTable(tableName, group, date, players) {
        await db.query(`INSERT INTO ${tableName} (grupa, data) VALUES (?, ?)`, [
          group,
          date,
        ]);
        await db.query(
          "INSERT INTO turniej_tabele (tabela, grupa, data) VALUES (?, ?, ?)",
          [tableName, group, date],
        );
        for (let i = 0; i < players.length; i++) {
          const column = `main${i + 1}`;
          await db.query(
            `UPDATE ${tableName} SET ${column} = ? WHERE grupa = ? AND data = ?`,
            [players[i].id, group, date],
          );
        }
      }

      for (const grupa of grupy) {
        const [countContent] = await db.query(
          "SELECT COUNT(*) as count FROM turniej_zawodnik JOIN zawodnik ON turniej_zawodnik.zawodnik_id = zawodnik.id WHERE zawodnik.grupa = ? AND turniej_zawodnik.turniej_data = ?",
          [grupa, date],
        );
        const count = countContent[0].count;

        const [rows] = await db.query(
          `SELECT z.id, z.fname, z.lname, tz.id as registration_id 
                FROM turniej_zawodnik tz 
                JOIN zawodnik z ON tz.zawodnik_id = z.id 
                WHERE tz.turniej_data = ? AND z.grupa = ?
                ORDER BY tz.id ASC`,
          [date, grupa],
        );

        if (count > 0) {
          if (count <= 8) {
            await addTable("tabela_8x", grupa, date, rows);
          } else if (count > 8 && count <= 16) {
            await addTable("tabela_16x", grupa, date, rows);
          } else if (count > 16 && count <= 24) {
            await addTable("tabela_24x", grupa, date, rows);
          } else if (count > 24 && count <= 32) {
            await addTable("tabela_32x", grupa, date, rows);
          } else if (count > 32 && count <= 40) {
            await addTable("tabela_40x", grupa, date, rows);
          }
        }
      }
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// pobieranie tabeli turniejowej dla określonej grupy
app.get("/api/tournament/gettournament/:grupa", async (req, res) => {
  try {
    const { grupa } = req.params;
    if (!grupa) {
      return res.status(400).json({ error: "Missing group" });
    }

    const date = new Date().toLocaleDateString("sv-SE");

    const [tabelaRows] = await db.query(
      "SELECT tabela FROM turniej_tabele WHERE data = ? AND grupa = ?",
      [date, grupa],
    );

    if (tabelaRows.length === 0) {
      return res.json([]);
    }

    const tableName = tabelaRows[0].tabela;

    const query_x8 = `    
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main1\`) AS main1_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main1\`) AS main1_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main2\`) AS main2_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main2\`) AS main2_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main3\`) AS main3_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main3\`) AS main3_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main4\`) AS main4_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main4\`) AS main4_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main5\`) AS main5_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main5\`) AS main5_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main6\`) AS main6_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main6\`) AS main6_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main7\`) AS main7_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main7\`) AS main7_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main8\`) AS main8_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main8\`) AS main8_lname,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_4_1\`) AS p1_4_1_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_4_1\`) AS p1_4_1_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_4_2\`) AS p1_4_2_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_4_2\`) AS p1_4_2_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_4_3\`) AS p1_4_3_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_4_3\`) AS p1_4_3_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_4_4\`) AS p1_4_4_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_4_4\`) AS p1_4_4_lname,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_2_1\`) AS p1_2_1_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_2_1\`) AS p1_2_1_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_2_2\`) AS p1_2_2_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_2_2\`) AS p1_2_2_lname,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_1\`) AS l_1_4_1_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_1\`) AS l_1_4_1_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_2\`) AS l_1_4_2_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_2\`) AS l_1_4_2_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_3\`) AS l_1_4_3_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_3\`) AS l_1_4_3_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_4\`) AS l_1_4_4_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_4\`) AS l_1_4_4_lname,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_c1\`) AS l_1_4_c1_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_c1\`) AS l_1_4_c1_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_c2\`) AS l_1_4_c2_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_c2\`) AS l_1_4_c2_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_c3\`) AS l_1_4_c3_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_c3\`) AS l_1_4_c3_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_4_c4\`) AS l_1_4_c4_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_4_c4\`) AS l_1_4_c4_lname,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_2_1\`) AS l_1_2_1_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_2_1\`) AS l_1_2_1_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_2_2\`) AS l_1_2_2_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_2_2\`) AS l_1_2_2_lname,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_2_c1\`) AS l_1_2_c1_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_2_c1\`) AS l_1_2_c1_lname,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l_1_2_c2\`) AS l_1_2_c2_fname,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l_1_2_c2\`) AS l_1_2_c2_lname,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`7_8_1\`) AS \`7_8_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`7_8_1\`) AS \`7_8_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`7_8_2\`) AS \`7_8_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`7_8_2\`) AS \`7_8_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`5_6_1\`) AS \`5_6_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`5_6_1\`) AS \`5_6_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`5_6_2\`) AS \`5_6_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`5_6_2\`) AS \`5_6_2_lname\`,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`1\`) AS \`1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`1\`) AS \`1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`2\`) AS \`2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`2\`) AS \`2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`3\`) AS \`3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`3\`) AS \`3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`4\`) AS \`4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`4\`) AS \`4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`5\`) AS \`5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`5\`) AS \`5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`6\`) AS \`6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`6\`) AS \`6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`7\`) AS \`7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`7\`) AS \`7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`8\`) AS \`8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`8\`) AS \`8_lname\`,
            
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`1_2_1\`) AS \`1_2_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`1_2_1\`) AS \`1_2_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`1_2_2\`) AS \`1_2_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`1_2_2\`) AS \`1_2_2_lname\`
        `;

    const query_x16 =
      query_x8 +
      `,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main9\`) AS \`main9_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main9\`) AS \`main9_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main10\`) AS \`main10_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main10\`) AS \`main10_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main11\`) AS \`main11_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main11\`) AS \`main11_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main12\`) AS \`main12_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main12\`) AS \`main12_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main13\`) AS \`main13_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main13\`) AS \`main13_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main14\`) AS \`main14_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main14\`) AS \`main14_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main15\`) AS \`main15_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main15\`) AS \`main15_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main16\`) AS \`main16_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main16\`) AS \`main16_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_1\`) AS \`p1_8_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_1\`) AS \`p1_8_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_2\`) AS \`p1_8_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_2\`) AS \`p1_8_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_3\`) AS \`p1_8_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_3\`) AS \`p1_8_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_4\`) AS \`p1_8_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_4\`) AS \`p1_8_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_5\`) AS \`p1_8_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_5\`) AS \`p1_8_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_6\`) AS \`p1_8_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_6\`) AS \`p1_8_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_7\`) AS \`p1_8_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_7\`) AS \`p1_8_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_8_8\`) AS \`p1_8_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_8_8\`) AS \`p1_8_8_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_1\`) AS \`l1_8_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_1\`) AS \`l1_8_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_2\`) AS \`l1_8_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_2\`) AS \`l1_8_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_3\`) AS \`l1_8_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_3\`) AS \`l1_8_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_4\`) AS \`l1_8_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_4\`) AS \`l1_8_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_5\`) AS \`l1_8_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_5\`) AS \`l1_8_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_6\`) AS \`l1_8_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_6\`) AS \`l1_8_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_7\`) AS \`l1_8_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_7\`) AS \`l1_8_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_8\`) AS \`l1_8_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_8\`) AS \`l1_8_8_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c1\`) AS \`l1_8_c1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c1\`) AS \`l1_8_c1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c2\`) AS \`l1_8_c2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c2\`) AS \`l1_8_c2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c3\`) AS \`l1_8_c3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c3\`) AS \`l1_8_c3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c4\`) AS \`l1_8_c4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c4\`) AS \`l1_8_c4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c5\`) AS \`l1_8_c5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c5\`) AS \`l1_8_c5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c6\`) AS \`l1_8_c6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c6\`) AS \`l1_8_c6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c7\`) AS \`l1_8_c7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c7\`) AS \`l1_8_c7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_8_c8\`) AS \`l1_8_c8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_8_c8\`) AS \`l1_8_c8_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`9\`) AS \`9_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`9\`) AS \`9_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`10\`) AS \`10_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`10\`) AS \`10_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`11\`) AS \`11_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`11\`) AS \`11_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`12\`) AS \`12_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`12\`) AS \`12_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`13\`) AS \`13_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`13\`) AS \`13_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`14\`) AS \`14_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`14\`) AS \`14_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`15\`) AS \`15_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`15\`) AS \`15_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`16\`) AS \`16_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`16\`) AS \`16_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`9_12_1\`) AS \`9_12_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`9_12_1\`) AS \`9_12_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`9_12_2\`) AS \`9_12_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`9_12_2\`) AS \`9_12_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`9_12_3\`) AS \`9_12_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`9_12_3\`) AS \`9_12_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`9_12_4\`) AS \`9_12_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`9_12_4\`) AS \`9_12_4_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`13_16_1\`) AS \`13_16_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`13_16_1\`) AS \`13_16_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`13_16_2\`) AS \`13_16_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`13_16_2\`) AS \`13_16_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`13_16_3\`) AS \`13_16_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`13_16_3\`) AS \`13_16_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`13_16_4\`) AS \`13_16_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`13_16_4\`) AS \`13_16_4_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`13_14_1\`) AS \`13_14_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`13_14_1\`) AS \`13_14_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`13_14_2\`) AS \`13_14_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`13_14_2\`) AS \`13_14_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`15_16_1\`) AS \`15_16_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`15_16_1\`) AS \`15_16_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`15_16_2\`) AS \`15_16_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`15_16_2\`) AS \`15_16_2_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`9_10_1\`) AS \`9_10_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`9_10_1\`) AS \`9_10_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`9_10_2\`) AS \`9_10_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`9_10_2\`) AS \`9_10_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`11_12_1\`) AS \`11_12_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`11_12_1\`) AS \`11_12_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`11_12_2\`) AS \`11_12_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`11_12_2\`) AS \`11_12_2_lname\``;

    const query_x24_temp =
      query_x16 +
      `,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17\`) AS \`17_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17\`) AS \`17_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`18\`) AS \`18_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`18\`) AS \`18_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`19\`) AS \`19_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`19\`) AS \`19_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`20\`) AS \`20_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`20\`) AS \`20_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`21\`) AS \`21_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`21\`) AS \`21_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`22\`) AS \`22_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`22\`) AS \`22_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`23\`) AS \`23_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`23\`) AS \`23_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`24\`) AS \`24_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`24\`) AS \`24_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main17\`) AS \`main17_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main17\`) AS \`main17_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main18\`) AS \`main18_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main18\`) AS \`main18_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main19\`) AS \`main19_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main19\`) AS \`main19_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main20\`) AS \`main20_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main20\`) AS \`main20_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main21\`) AS \`main21_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main21\`) AS \`main21_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main22\`) AS \`main22_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main22\`) AS \`main22_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main23\`) AS \`main23_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main23\`) AS \`main23_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main24\`) AS \`main24_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main24\`) AS \`main24_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_1\`) AS \`17_24_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_1\`) AS \`17_24_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_2\`) AS \`17_24_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_2\`) AS \`17_24_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_3\`) AS \`17_24_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_3\`) AS \`17_24_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_4\`) AS \`17_24_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_4\`) AS \`17_24_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_5\`) AS \`17_24_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_5\`) AS \`17_24_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_6\`) AS \`17_24_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_6\`) AS \`17_24_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_7\`) AS \`17_24_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_7\`) AS \`17_24_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_24_8\`) AS \`17_24_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_24_8\`) AS \`17_24_8_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_20_1\`) AS \`17_20_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_20_1\`) AS \`17_20_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_20_2\`) AS \`17_20_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_20_2\`) AS \`17_20_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_20_3\`) AS \`17_20_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_20_3\`) AS \`17_20_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_20_4\`) AS \`17_20_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_20_4\`) AS \`17_20_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`21_24_1\`) AS \`21_24_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`21_24_1\`) AS \`21_24_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`21_24_2\`) AS \`21_24_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`21_24_2\`) AS \`21_24_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`21_24_3\`) AS \`21_24_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`21_24_3\`) AS \`21_24_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`21_24_4\`) AS \`21_24_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`21_24_4\`) AS \`21_24_4_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_18_1\`) AS \`17_18_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_18_1\`) AS \`17_18_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`17_18_2\`) AS \`17_18_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`17_18_2\`) AS \`17_18_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`19_20_1\`) AS \`19_20_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`19_20_1\`) AS \`19_20_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`19_20_2\`) AS \`19_20_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`19_20_2\`) AS \`19_20_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`21_22_1\`) AS \`21_22_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`21_22_1\`) AS \`21_22_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`21_22_2\`) AS \`21_22_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`21_22_2\`) AS \`21_22_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`23_24_1\`) AS \`23_24_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`23_24_1\`) AS \`23_24_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`23_24_2\`) AS \`23_24_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`23_24_2\`) AS \`23_24_2_lname\`

        `;
    const query_x24 =
      query_x24_temp +
      `,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_1\`) AS \`Pmain_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_1\`) AS \`Pmain_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_2\`) AS \`Pmain_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_2\`) AS \`Pmain_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_3\`) AS \`Pmain_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_3\`) AS \`Pmain_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_4\`) AS \`Pmain_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_4\`) AS \`Pmain_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_5\`) AS \`Pmain_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_5\`) AS \`Pmain_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_6\`) AS \`Pmain_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_6\`) AS \`Pmain_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_7\`) AS \`Pmain_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_7\`) AS \`Pmain_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Pmain_8\`) AS \`Pmain_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Pmain_8\`) AS \`Pmain_8_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_1\`) AS \`Lmain_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_1\`) AS \`Lmain_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_2\`) AS \`Lmain_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_2\`) AS \`Lmain_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_3\`) AS \`Lmain_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_3\`) AS \`Lmain_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_4\`) AS \`Lmain_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_4\`) AS \`Lmain_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_5\`) AS \`Lmain_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_5\`) AS \`Lmain_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_6\`) AS \`Lmain_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_6\`) AS \`Lmain_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_7\`) AS \`Lmain_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_7\`) AS \`Lmain_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_8\`) AS \`Lmain_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_8\`) AS \`Lmain_8_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_9\`) AS \`Lmain_9_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_9\`) AS \`Lmain_9_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_10\`) AS \`Lmain_10_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_10\`) AS \`Lmain_10_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_11\`) AS \`Lmain_11_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_11\`) AS \`Lmain_11_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_12\`) AS \`Lmain_12_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_12\`) AS \`Lmain_12_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_13\`) AS \`Lmain_13_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_13\`) AS \`Lmain_13_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_14\`) AS \`Lmain_14_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_14\`) AS \`Lmain_14_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_15\`) AS \`Lmain_15_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_15\`) AS \`Lmain_15_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`Lmain_16\`) AS \`Lmain_16_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`Lmain_16\`) AS \`Lmain_16_lname\`
        `;

    const query_x32 =
      query_x24_temp +
      `,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main25\`) AS \`main25_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main25\`) AS \`main25_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main26\`) AS \`main26_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main26\`) AS \`main26_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main27\`) AS \`main27_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main27\`) AS \`main27_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main28\`) AS \`main28_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main28\`) AS \`main28_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main29\`) AS \`main29_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main29\`) AS \`main29_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main30\`) AS \`main30_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main30\`) AS \`main30_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main31\`) AS \`main31_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main31\`) AS \`main31_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`main32\`) AS \`main32_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`main32\`) AS \`main32_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_1\`) AS \`l1_16_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_1\`) AS \`l1_16_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_2\`) AS \`l1_16_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_2\`) AS \`l1_16_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_3\`) AS \`l1_16_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_3\`) AS \`l1_16_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_4\`) AS \`l1_16_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_4\`) AS \`l1_16_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_5\`) AS \`l1_16_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_5\`) AS \`l1_16_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_6\`) AS \`l1_16_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_6\`) AS \`l1_16_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_7\`) AS \`l1_16_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_7\`) AS \`l1_16_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_8\`) AS \`l1_16_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_8\`) AS \`l1_16_8_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_9\`) AS \`l1_16_9_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_9\`) AS \`l1_16_9_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_10\`) AS \`l1_16_10_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_10\`) AS \`l1_16_10_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_11\`) AS \`l1_16_11_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_11\`) AS \`l1_16_11_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_12\`) AS \`l1_16_12_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_12\`) AS \`l1_16_12_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_13\`) AS \`l1_16_13_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_13\`) AS \`l1_16_13_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_14\`) AS \`l1_16_14_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_14\`) AS \`l1_16_14_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_15\`) AS \`l1_16_15_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_15\`) AS \`l1_16_15_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_16\`) AS \`l1_16_16_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_16\`) AS \`l1_16_16_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c1\`) AS \`l1_16_c1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c1\`) AS \`l1_16_c1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c2\`) AS \`l1_16_c2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c2\`) AS \`l1_16_c2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c3\`) AS \`l1_16_c3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c3\`) AS \`l1_16_c3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c4\`) AS \`l1_16_c4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c4\`) AS \`l1_16_c4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c5\`) AS \`l1_16_c5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c5\`) AS \`l1_16_c5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c6\`) AS \`l1_16_c6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c6\`) AS \`l1_16_c6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c7\`) AS \`l1_16_c7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c7\`) AS \`l1_16_c7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c8\`) AS \`l1_16_c8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c8\`) AS \`l1_16_c8_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c9\`) AS \`l1_16_c9_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c9\`) AS \`l1_16_c9_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c10\`) AS \`l1_16_c10_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c10\`) AS \`l1_16_c10_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c11\`) AS \`l1_16_c11_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c11\`) AS \`l1_16_c11_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c12\`) AS \`l1_16_c12_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c12\`) AS \`l1_16_c12_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c13\`) AS \`l1_16_c13_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c13\`) AS \`l1_16_c13_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c14\`) AS \`l1_16_c14_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c14\`) AS \`l1_16_c14_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c15\`) AS \`l1_16_c15_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c15\`) AS \`l1_16_c15_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`l1_16_c16\`) AS \`l1_16_c16_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`l1_16_c16\`) AS \`l1_16_c16_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_1\`) AS \`p1_16_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_1\`) AS \`p1_16_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_2\`) AS \`p1_16_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_2\`) AS \`p1_16_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_3\`) AS \`p1_16_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_3\`) AS \`p1_16_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_4\`) AS \`p1_16_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_4\`) AS \`p1_16_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_5\`) AS \`p1_16_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_5\`) AS \`p1_16_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_6\`) AS \`p1_16_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_6\`) AS \`p1_16_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_7\`) AS \`p1_16_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_7\`) AS \`p1_16_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_8\`) AS \`p1_16_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_8\`) AS \`p1_16_8_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_9\`) AS \`p1_16_9_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_9\`) AS \`p1_16_9_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_10\`) AS \`p1_16_10_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_10\`) AS \`p1_16_10_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_11\`) AS \`p1_16_11_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_11\`) AS \`p1_16_11_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_12\`) AS \`p1_16_12_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_12\`) AS \`p1_16_12_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_13\`) AS \`p1_16_13_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_13\`) AS \`p1_16_13_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_14\`) AS \`p1_16_14_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_14\`) AS \`p1_16_14_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_15\`) AS \`p1_16_15_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_15\`) AS \`p1_16_15_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`p1_16_16\`) AS \`p1_16_16_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`p1_16_16\`) AS \`p1_16_16_lname\`,

            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25\`) AS \`25_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25\`) AS \`25_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`26\`) AS \`26_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`26\`) AS \`26_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`27\`) AS \`27_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`27\`) AS \`27_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`28\`) AS \`28_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`28\`) AS \`28_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`29\`) AS \`29_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`29\`) AS \`29_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`30\`) AS \`30_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`30\`) AS \`30_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`31\`) AS \`31_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`31\`) AS \`31_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`32\`) AS \`32_fname\`,
                
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_1\`) AS \`25_32_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_1\`) AS \`25_32_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_2\`) AS \`25_32_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_2\`) AS \`25_32_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_3\`) AS \`25_32_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_3\`) AS \`25_32_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_4\`) AS \`25_32_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_4\`) AS \`25_32_4_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_5\`) AS \`25_32_5_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_5\`) AS \`25_32_5_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_6\`) AS \`25_32_6_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_6\`) AS \`25_32_6_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_7\`) AS \`25_32_7_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_7\`) AS \`25_32_7_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_32_8\`) AS \`25_32_8_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_32_8\`) AS \`25_32_8_lname\`,
                
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_28_1\`) AS \`25_28_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_28_1\`) AS \`25_28_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_28_2\`) AS \`25_28_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_28_2\`) AS \`25_28_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_28_3\`) AS \`25_28_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_28_3\`) AS \`25_28_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_28_4\`) AS \`25_28_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_28_4\`) AS \`25_28_4_lname\`,
                
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`29_32_1\`) AS \`29_32_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`29_32_1\`) AS \`29_32_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`29_32_2\`) AS \`29_32_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`29_32_2\`) AS \`29_32_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`29_32_3\`) AS \`29_32_3_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`29_32_3\`) AS \`29_32_3_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`29_32_4\`) AS \`29_32_4_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`29_32_4\`) AS \`29_32_4_lname\`,
                
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_26_1\`) AS \`25_26_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_26_1\`) AS \`25_26_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`25_26_2\`) AS \`25_26_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`25_26_2\`) AS \`25_26_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`27_28_1\`) AS \`27_28_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`27_28_1\`) AS \`27_28_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`27_28_2\`) AS \`27_28_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`27_28_2\`) AS \`27_28_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`29_30_1\`) AS \`29_30_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`29_30_1\`) AS \`29_30_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`29_30_2\`) AS \`29_30_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`29_30_2\`) AS \`29_30_2_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`31_32_1\`) AS \`31_32_1_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`31_32_1\`) AS \`31_32_1_lname\`,
            (SELECT z.fname FROM zawodnik z WHERE z.id = t.\`31_32_2\`) AS \`31_32_2_fname\`,
            (SELECT z.lname FROM zawodnik z WHERE z.id = t.\`31_32_2\`) AS \`31_32_2_lname\`
        `;

    const sql = `SELECT ${tableName === "tabela_8x" ? query_x8 : tableName === "tabela_16x" ? query_x16 : tableName === "tabela_24x" ? query_x24 : query_x32} FROM ?? t WHERE t.grupa = ? AND t.data = ?`;
    const [rows] = await db.query(sql, [tableName, grupa, date]);
    const [matchs] = await db.query(
      `SELECT w.status, z1.fname AS player1_fname, z1.lname AS player1_lname, z2.fname AS player2_fname, z2.lname AS player2_lname,box_id,w.boisko,w.grupa,w.tabela FROM wyniki w LEFT JOIN zawodnik z1 ON z1.id = w.player1_id LEFT JOIN zawodnik z2 ON z2.id = w.player2_id WHERE DATE(w.data) = ?;`,
      [date],
    );
    const mapRowsToPlayers = rows.map((row) => {
      // MAIN

      const mainOrder =
        tableName === "tabela_8x"
          ? [
            "main1",
            "main8",
            "main5",
            "main4",
            "main3",
            "main6",
            "main7",
            "main2",
          ]
          : tableName === "tabela_16x"
            ? [
              "main1",
              "main16",
              "main9",
              "main8",
              "main5",
              "main12",
              "main13",
              "main4",
              "main3",
              "main14",
              "main11",
              "main6",
              "main7",
              "main10",
              "main15",
              "main2",
            ]
            : tableName === "tabela_32x"
              ? [
                "main1",
                "main32",
                "main17",
                "main16",
                "main9",
                "main24",
                "main25",
                "main8",
                "main5",
                "main28",
                "main21",
                "main12",
                "main13",
                "main20",
                "main29",
                "main4",
                "main3",
                "main30",
                "main19",
                "main14",
                "main11",
                "main22",
                "main27",
                "main6",
                "main7",
                "main26",
                "main23",
                "main10",
                "main15",
                "main18",
                "main31",
                "main2",
              ]
              : [
                "main17",
                "main16",
                "main9",
                "main24",
                "main21",
                "main12",
                "main13",
                "main20",
                "main19",
                "main14",
                "main11",
                "main22",
                "main23",
                "main10",
                "main15",
                "main18",
              ];
      const main = mainOrder.map((key) => ({
        fname: row[`${key}_fname`] || "",
        lname: row[`${key}_lname`] || "",
      }));

      function setTable_32xContent() {
        //cols25_32
        const cols25_32 = Array.from({ length: 8 }, (_, i) => ({
          fname: row[`25_32_${i + 1}_fname`] || "",
          lname: row[`25_32_${i + 1}_lname`] || "",
        }));
        //cols25_28
        const cols25_28 = Array.from({ length: 4 }, (_, i) => ({
          fname: row[`25_28_${i + 1}_fname`] || "",
          lname: row[`25_28_${i + 1}_lname`] || "",
        }));
        //cols29_32
        const cols29_32 = Array.from({ length: 4 }, (_, i) => ({
          fname: row[`29_32_${i + 1}_fname`] || "",
          lname: row[`29_32_${i + 1}_lname`] || "",
        }));
        //P1_16
        const P1_16 = Array.from({ length: 16 }, (_, i) => ({
          fname: row[`p1_16_${i + 1}_fname`] || "",
          lname: row[`p1_16_${i + 1}_lname`] || "",
        }));

        // L1_16
        const L1_16 = Array.from({ length: 16 }, (_, i) => ({
          fname: row[`l1_16_${i + 1}_fname`] || "",
          lname: row[`l1_16_${i + 1}_lname`] || "",
        }));

        // L1_16_c
        const L1_16_c = Array.from({ length: 16 }, (_, i) => ({
          fname: row[`l1_16_c${i + 1}_fname`] || "",
          lname: row[`l1_16_c${i + 1}_lname`] || "",
        }));
        return {
          "25_32": cols25_32,
          "25_28": cols25_28,
          "29_32": cols29_32,
          L1_16_c: L1_16_c,
          L1_16: L1_16,
          P1_16: P1_16,
          "25_26_1": {
            fname: row[`25_26_1_fname`] || "",
            lname: row[`25_26_1_lname`] || "",
          },
          "25_26_2": {
            fname: row[`25_26_2_fname`] || "",
            lname: row[`25_26_2_lname`] || "",
          },
          "27_28_1": {
            fname: row[`27_28_1_fname`] || "",
            lname: row[`27_28_1_lname`] || "",
          },
          "27_28_2": {
            fname: row[`27_28_2_fname`] || "",
            lname: row[`27_28_2_lname`] || "",
          },
          "29_30_1": {
            fname: row[`29_30_1_fname`] || "",
            lname: row[`29_30_1_lname`] || "",
          },
          "29_30_2": {
            fname: row[`29_30_2_fname`] || "",
            lname: row[`29_30_2_lname`] || "",
          },
          "31_32_1": {
            fname: row[`31_32_1_fname`] || "",
            lname: row[`31_32_1_lname`] || "",
          },
          "31_32_2": {
            fname: row[`31_32_2_fname`] || "",
            lname: row[`31_32_2_lname`] || "",
          },
          "23_24_1": {
            fname: row[`23_24_1_fname`] || "",
            lname: row[`23_24_1_lname`] || "",
          },
          "23_24_2": {
            fname: row[`23_24_2_fname`] || "",
            lname: row[`23_24_2_lname`] || "",
          },
        };
      }

      function setTable_24x_tempContent() {
        const mainOrder = [
          "main1",
          "Pmain_1",
          "Pmain_2",
          "main8",
          "main5",
          "Pmain_3",
          "Pmain_4",
          "main4",
          "main3",
          "Pmain_5",
          "Pmain_6",
          "main6",
          "main7",
          "Pmain_7",
          "Pmain_8",
          "main2",
        ];

        const Pmain = mainOrder.map((key) => ({
          fname: row[`${key}_fname`] || "",
          lname: row[`${key}_lname`] || "",
        }));
        const Lmain = Array.from({ length: 16 }, (_, i) => ({
          fname: row[`Lmain_${i + 1}_fname`] || "",
          lname: row[`Lmain_${i + 1}_lname`] || "",
        }));
        return {
          Pmain,
          Lmain,
        };
      }

      function setTable_24xContent() {
        //cols17_24
        const cols17_24 = Array.from({ length: 8 }, (_, i) => ({
          fname: row[`17_24_${i + 1}_fname`] || "",
          lname: row[`17_24_${i + 1}_lname`] || "",
        }));
        //cols17_20
        const cols17_20 = Array.from({ length: 4 }, (_, i) => ({
          fname: row[`17_20_${i + 1}_fname`] || "",
          lname: row[`17_20_${i + 1}_lname`] || "",
        }));
        //cols21_24
        const cols21_24 = Array.from({ length: 4 }, (_, i) => ({
          fname: row[`21_24_${i + 1}_fname`] || "",
          lname: row[`21_24_${i + 1}_lname`] || "",
        }));

        return {
          "17_24": cols17_24,
          "17_20": cols17_20,
          "21_24": cols21_24,
          "21_24_1": {
            fname: row[`21_24_1_fname`] || "",
            lname: row[`21_24_1_lname`] || "",
          },
          "21_24_2": {
            fname: row[`21_24_2_fname`] || "",
            lname: row[`21_24_2_lname`] || "",
          },
          "17_18_1": {
            fname: row[`17_18_1_fname`] || "",
            lname: row[`17_18_1_lname`] || "",
          },
          "17_18_2": {
            fname: row[`17_18_2_fname`] || "",
            lname: row[`17_18_2_lname`] || "",
          },
          "19_20_1": {
            fname: row[`19_20_1_fname`] || "",
            lname: row[`19_20_1_lname`] || "",
          },
          "19_20_2": {
            fname: row[`19_20_2_fname`] || "",
            lname: row[`19_20_2_lname`] || "",
          },
          "21_22_1": {
            fname: row[`21_22_1_fname`] || "",
            lname: row[`21_22_1_lname`] || "",
          },
          "21_22_2": {
            fname: row[`21_22_2_fname`] || "",
            lname: row[`21_22_2_lname`] || "",
          },
          "23_24_1": {
            fname: row[`23_24_1_fname`] || "",
            lname: row[`23_24_1_lname`] || "",
          },
          "23_24_2": {
            fname: row[`23_24_2_fname`] || "",
            lname: row[`23_24_2_lname`] || "",
          },
        };
      }
      function setTable_16xContent() {
        // P1_8
        const P1_8 = Array.from({ length: 8 }, (_, i) => ({
          fname: row[`p1_8_${i + 1}_fname`] || "",
          lname: row[`p1_8_${i + 1}_lname`] || "",
        }));

        // L1_8
        const L1_8 = Array.from({ length: 8 }, (_, i) => ({
          fname: row[`l1_8_${i + 1}_fname`] || "",
          lname: row[`l1_8_${i + 1}_lname`] || "",
        }));

        // L1_8_c
        const L1_8_c = Array.from({ length: 8 }, (_, i) => ({
          fname: row[`l1_8_c${i + 1}_fname`] || "",
          lname: row[`l1_8_c${i + 1}_lname`] || "",
        }));
        // cols13_16
        const cols13_16 = Array.from({ length: 4 }, (_, i) => ({
          fname: row[`13_16_${i + 1}_fname`] || "",
          lname: row[`13_16_${i + 1}_lname`] || "",
        }));
        // cols9_12
        const cols9_12 = Array.from({ length: 4 }, (_, i) => ({
          fname: row[`9_12_${i + 1}_fname`] || "",
          lname: row[`9_12_${i + 1}_lname`] || "",
        }));

        return {
          P1_8,
          L1_8,
          L1_8_c,
          "13_16": cols13_16,
          "9_12": cols9_12,
          "13_14_1": {
            fname: row[`13_14_1_fname`] || "",
            lname: row[`13_14_1_lname`] || "",
          },
          "13_14_2": {
            fname: row[`13_14_2_fname`] || "",
            lname: row[`13_14_2_lname`] || "",
          },
          "15_16_1": {
            fname: row[`15_16_1_fname`] || "",
            lname: row[`15_16_1_lname`] || "",
          },
          "15_16_2": {
            fname: row[`15_16_2_fname`] || "",
            lname: row[`15_16_2_lname`] || "",
          },
          "9_10_1": {
            fname: row[`9_10_1_fname`] || "",
            lname: row[`9_10_1_lname`] || "",
          },
          "9_10_2": {
            fname: row[`9_10_2_fname`] || "",
            lname: row[`9_10_2_lname`] || "",
          },
          "11_12_1": {
            fname: row[`11_12_1_fname`] || "",
            lname: row[`11_12_1_lname`] || "",
          },
          "11_12_2": {
            fname: row[`11_12_2_fname`] || "",
            lname: row[`11_12_2_lname`] || "",
          },
        };
      }
      // P1_4
      const P1_4 = Array.from({ length: 4 }, (_, i) => ({
        fname: row[`p1_4_${i + 1}_fname`] || "",
        lname: row[`p1_4_${i + 1}_lname`] || "",
      }));

      // L1_4
      const L1_4 = Array.from({ length: 4 }, (_, i) => ({
        fname: row[`l_1_4_${i + 1}_fname`] || "",
        lname: row[`l_1_4_${i + 1}_lname`] || "",
      }));

      // P1_2
      const P1_2 = Array.from({ length: 2 }, (_, i) => ({
        fname: row[`p1_2_${i + 1}_fname`] || "",
        lname: row[`p1_2_${i + 1}_lname`] || "",
      }));

      // L1_4_c
      const L1_4_c = Array.from({ length: 4 }, (_, i) => ({
        fname: row[`l_1_4_c${i + 1}_fname`] || "",
        lname: row[`l_1_4_c${i + 1}_lname`] || "",
      }));

      // L1_2
      const L1_2 = Array.from({ length: 2 }, (_, i) => ({
        fname: row[`l_1_2_${i + 1}_fname`] || "",
        lname: row[`l_1_2_${i + 1}_lname`] || "",
      }));

      // L1_2_c
      const L1_2_c = Array.from({ length: 2 }, (_, i) => ({
        fname: row[`l_1_2_c${i + 1}_fname`] || "",
        lname: row[`l_1_2_c${i + 1}_lname`] || "",
      }));

      // 7_8
      const cols_7_8 = Array.from({ length: 2 }, (_, i) => ({
        fname: row[`7_8_${i + 1}_fname`] || "",
        lname: row[`7_8_${i + 1}_lname`] || "",
      }));

      // 5_6
      const cols_5_6 = Array.from({ length: 2 }, (_, i) => ({
        fname: row[`5_6_${i + 1}_fname`] || "",
        lname: row[`5_6_${i + 1}_lname`] || "",
      }));

      // 1_2
      const cols_1_2 = Array.from({ length: 2 }, (_, i) => ({
        fname: row[`1_2_${i + 1}_fname`] || "",
        lname: row[`1_2_${i + 1}_lname`] || "",
      }));

      // Pojedyncze kolumny 1–8
      const singleCols = {};
      switch (tableName) {
        case "tabela_8x":
          for (let i = 1; i <= 8; i++) {
            singleCols[i] = {
              fname: row[`${i}_fname`] || "",
              lname: row[`${i}_lname`] || "",
            };
          }
          break;
        case "tabela_16x":
          for (let i = 1; i <= 16; i++) {
            singleCols[i] = {
              fname: row[`${i}_fname`] || "",
              lname: row[`${i}_lname`] || "",
            };
          }
          break;
        case "tabela_24x":
          for (let i = 1; i <= 24; i++) {
            singleCols[i] = {
              fname: row[`${i}_fname`] || "",
              lname: row[`${i}_lname`] || "",
            };
          }
          break;
        case "tabela_32x":
          for (let i = 1; i <= 32; i++) {
            singleCols[i] = {
              fname: row[`${i}_fname`] || "",
              lname: row[`${i}_lname`] || "",
            };
          }
          break;
      }

      return {
        ...(tableName === "tabela_32x"
          ? {
            ...setTable_32xContent(),
            ...setTable_24xContent(),
            ...setTable_16xContent(),
          }
          : {}),
        ...(tableName === "tabela_24x"
          ? {
            ...setTable_24x_tempContent(),
            ...setTable_24xContent(),
            ...setTable_16xContent(),
          }
          : {}),
        ...(tableName === "tabela_16x" ? { ...setTable_16xContent() } : {}),
        main,
        P1_4,
        L1_4,
        P1_2,
        L1_4_c,
        L1_2,
        L1_2_c,
        "7_8": cols_7_8,
        "5_6": cols_5_6,
        "1_2": cols_1_2,
        ...singleCols,
        tabela: tableName,
        mecze: matchs,
      };
    });

    res.json(mapRowsToPlayers[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

//start match
app.post("/api/matches/start", async (req, res) => {
  const { date, match, court, box_id, group, table } = req.body;
  const query = `INSERT INTO wyniki (data,tabela, grupa, player1_id, player2_id, box_id, status,boisko)
    VALUES (?, ?, ?, ?, ?, ?, 'trwajacy',?)
    `;
  async function getPlayerId(player) {
    const query = `
        SELECT id 
        FROM zawodnik 
        WHERE TRIM(fname) = TRIM(?) 
        AND TRIM(lname) = TRIM(?) 
        LIMIT 1
    `;

    const [rows] = await db.query(query, [
      player?.fname || "",
      player?.lname || "",
    ]);

    if (rows.length === 0) return null;

    return rows[0].id;
  }

  try {
    const p1 = await getPlayerId(match.p1);
    const p2 = await getPlayerId(match.p2);
    await db.query(query, [date, table, group, p1, p2, box_id, court]);
    res.json({
      p1: p1,
      p2: p2,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

async function updateTable(box_id, group, date, table, winnerId, loserId) {
  let kolumnaWin;
  let kolumnaLose;

  switch (box_id) {
    case "main_1":
      if (table == "tabela_8x") {
        kolumnaWin = "p1_4_1";
        kolumnaLose = "l_1_4_1";
      } else if (table == "tabela_16x") {
        kolumnaWin = "p1_8_1";
        kolumnaLose = "l1_8_1";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_1";
        kolumnaLose = "Lmain_2";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_1";
        kolumnaLose = "l1_16_1";
      }
      break;

    case "main_2":
      if (table == "tabela_8x") {
        kolumnaWin = "p1_4_2";
        kolumnaLose = "l_1_4_2";
      } else if (table == "tabela_16x") {
        kolumnaWin = "p1_8_2";
        kolumnaLose = "l1_8_2";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_2";
        kolumnaLose = "Lmain_3";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_2";
        kolumnaLose = "l1_16_2";
      }
      break;

    case "main_3":
      if (table == "tabela_8x") {
        kolumnaWin = "p1_4_3";
        kolumnaLose = "l_1_4_3";
      } else if (table == "tabela_16x") {
        kolumnaWin = "p1_8_3";
        kolumnaLose = "l1_8_3";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_3";
        kolumnaLose = "Lmain_6";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_3";
        kolumnaLose = "l1_16_3";
      }
      break;

    case "main_4":
      if (table == "tabela_8x") {
        kolumnaWin = "p1_4_4";
        kolumnaLose = "l_1_4_4";
      } else if (table == "tabela_16x") {
        kolumnaWin = "p1_8_4";
        kolumnaLose = "l1_8_4";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_4";
        kolumnaLose = "Lmain_7";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_4";
        kolumnaLose = "l1_16_4";
      }
      break;

    case "main_5":
      if (table == "tabela_16x") {
        kolumnaWin = "p1_8_5";
        kolumnaLose = "l1_8_5";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_5";
        kolumnaLose = "Lmain_10";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_5";
        kolumnaLose = "l1_16_5";
      }
      break;

    case "main_6":
      if (table == "tabela_16x") {
        kolumnaWin = "p1_8_6";
        kolumnaLose = "l1_8_6";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_6";
        kolumnaLose = "Lmain_11";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_6";
        kolumnaLose = "l1_16_6";
      }
      break;

    case "main_7":
      if (table == "tabela_16x") {
        kolumnaWin = "p1_8_7";
        kolumnaLose = "l1_8_7";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_7";
        kolumnaLose = "Lmain_14";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_7";
        kolumnaLose = "l1_16_7";
      }
      break;

    case "main_8":
      if (table == "tabela_16x") {
        kolumnaWin = "p1_8_8";
        kolumnaLose = "l1_8_8";
      } else if (table == "tabela_24x") {
        kolumnaWin = "Pmain_8";
        kolumnaLose = "Lmain_15";
      } else if (table == "tabela_32x") {
        kolumnaWin = "p1_16_8";
        kolumnaLose = "l1_16_8";
      }
      break;
    case "main_9":
      kolumnaWin = "p1_16_9";
      kolumnaLose = "l1_16_9";
      break;

    case "main_10":
      kolumnaWin = "p1_16_10";
      kolumnaLose = "l1_16_10";
      break;

    case "main_11":
      kolumnaWin = "p1_16_11";
      kolumnaLose = "l1_16_11";
      break;

    case "main_12":
      kolumnaWin = "p1_16_12";
      kolumnaLose = "l1_16_12";
      break;

    case "main_13":
      kolumnaWin = "p1_16_13";
      kolumnaLose = "l1_16_13";
      break;

    case "main_14":
      kolumnaWin = "p1_16_14";
      kolumnaLose = "l1_16_14";
      break;

    case "main_15":
      kolumnaWin = "p1_16_15";
      kolumnaLose = "l1_16_15";
      break;

    case "main_16":
      kolumnaWin = "p1_16_16";
      kolumnaLose = "l1_16_16";
      break;
    case "L1_16_1":
      kolumnaWin = "l1_16_c1";
      kolumnaLose = "25_32_1";
      break;

    case "L1_16_2":
      kolumnaWin = "l1_16_c3";
      kolumnaLose = "25_32_2";
      break;

    case "L1_16_3":
      kolumnaWin = "l1_16_c5";
      kolumnaLose = "25_32_3";
      break;

    case "L1_16_4":
      kolumnaWin = "l1_16_c7";
      kolumnaLose = "25_32_4";
      break;

    case "L1_16_5":
      kolumnaWin = "l1_16_c9";
      kolumnaLose = "25_32_5";
      break;

    case "L1_16_6":
      kolumnaWin = "l1_16_c11";
      kolumnaLose = "25_32_6";
      break;

    case "L1_16_7":
      kolumnaWin = "l1_16_c13";
      kolumnaLose = "25_32_7";
      break;

    case "L1_16_8":
      kolumnaWin = "l1_16_c15";
      kolumnaLose = "25_32_8";
      break;

    case "P1_16_1":
      kolumnaWin = "p1_8_1";
      kolumnaLose = "l1_16_c16";
      break;

    case "P1_16_2":
      kolumnaWin = "p1_8_2";
      kolumnaLose = "l1_16_c14";
      break;

    case "P1_16_3":
      kolumnaWin = "p1_8_3";
      kolumnaLose = "l1_16_c12";
      break;

    case "P1_16_4":
      kolumnaWin = "p1_8_4";
      kolumnaLose = "l1_16_c10";
      break;

    case "P1_16_5":
      kolumnaWin = "p1_8_5";
      kolumnaLose = "l1_16_c8";
      break;

    case "P1_16_6":
      kolumnaWin = "p1_8_6";
      kolumnaLose = "l1_16_c6";
      break;

    case "P1_16_7":
      kolumnaWin = "p1_8_7";
      kolumnaLose = "l1_16_c4";
      break;

    case "P1_16_8":
      kolumnaWin = "p1_8_8";
      kolumnaLose = "l1_16_c2";
      break;
    case "P1_8_1":
      kolumnaWin = "p1_4_1";
      if (table == "tabela_32x") {
        kolumnaLose = "l1_8_c4";
      } else {
        kolumnaLose = "l1_8_c8";
      }
      break;

    case "P1_8_2":
      kolumnaWin = "p1_4_2";
      if (table == "tabela_32x") {
        kolumnaLose = "l1_8_c2";
      } else {
        kolumnaLose = "l1_8_c6";
      }
      break;

    case "P1_8_3":
      kolumnaWin = "p1_4_3";
      if (table == "tabela_32x") {
        kolumnaLose = "l1_8_c8";
      } else {
        kolumnaLose = "l1_8_c4";
      }
      break;

    case "P1_8_4":
      kolumnaWin = "p1_4_4";
      if (table == "tabela_32x") {
        kolumnaLose = "l1_8_c6";
      } else {
        kolumnaLose = "l1_8_c2";
      }
      break;
    case "L1_8_1":
      kolumnaWin = "l1_8_c1";
      kolumnaLose = "13_16_1";
      break;

    case "L1_8_2":
      kolumnaWin = "l1_8_c3";
      kolumnaLose = "13_16_2";
      break;

    case "L1_8_3":
      kolumnaWin = "l1_8_c5";
      kolumnaLose = "13_16_3";
      break;

    case "L1_8_4":
      kolumnaWin = "l1_8_c7";
      kolumnaLose = "13_16_4";
      break;

    case "L1_8_c_1":
      kolumnaWin = "l_1_4_1";
      kolumnaLose = "9_12_1";
      break;

    case "L1_8_c_2":
      kolumnaWin = "l_1_4_2";
      kolumnaLose = "9_12_2";
      break;

    case "L1_8_c_3":
      kolumnaWin = "l_1_4_3";
      kolumnaLose = "9_12_3";
      break;

    case "L1_8_c_4":
      kolumnaWin = "l_1_4_4";
      kolumnaLose = "9_12_4";
      break;
    case "Pmain_1":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_1";
        kolumnaLose = "Lmain_8";
      }
      break;

    case "Pmain_2":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_2";
        kolumnaLose = "Lmain_5";
      }
      break;

    case "Pmain_3":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_3";
        kolumnaLose = "Lmain_4";
      }
      break;

    case "Pmain_4":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_4";
        kolumnaLose = "Lmain_1";
      }
      break;

    case "Pmain_5":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_5";
        kolumnaLose = "Lmain_16";
      }
      break;

    case "Pmain_6":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_6";
        kolumnaLose = "Lmain_13";
      }
      break;

    case "Pmain_7":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_7";
        kolumnaLose = "Lmain_12";
      }
      break;

    case "Pmain_8":
      if (table == "tabela_24x") {
        kolumnaWin = "p1_8_8";
        kolumnaLose = "Lmain_9";
      }
      break;
    case "Lmain_1":
    case "L1_16_c_1":
      kolumnaWin = "l1_8_1";
      kolumnaLose = "17_24_1";
      break;

    case "Lmain_2":
    case "L1_16_c_2":
      kolumnaWin = "l1_8_2";
      kolumnaLose = "17_24_2";
      break;

    case "Lmain_3":
    case "L1_16_c_3":
      kolumnaWin = "l1_8_3";
      kolumnaLose = "17_24_3";
      break;

    case "Lmain_4":
    case "L1_16_c_4":
      kolumnaWin = "l1_8_4";
      kolumnaLose = "17_24_4";
      break;

    case "Lmain_5":
    case "L1_16_c_5":
      kolumnaWin = "l1_8_5";
      kolumnaLose = "17_24_5";
      break;

    case "Lmain_6":
    case "L1_16_c_6":
      kolumnaWin = "l1_8_6";
      kolumnaLose = "17_24_6";
      break;

    case "Lmain_7":
    case "L1_16_c_7":
      kolumnaWin = "l1_8_7";
      kolumnaLose = "17_24_7";
      break;

    case "Lmain_8":
    case "L1_16_c_8":
      kolumnaWin = "l1_8_8";
      kolumnaLose = "17_24_8";
      break;
    case "P1_4_1":
      kolumnaWin = "p1_2_1";
      if (table == "tabela_8x" || table == "tabela_32x") {
        kolumnaLose = "l_1_4_c4";
      } else {
        kolumnaLose = "l_1_4_c2";
      }
      break;

    case "P1_4_2":
      kolumnaWin = "p1_2_2";
      if (table == "tabela_8x" || table == "tabela_32x") {
        kolumnaLose = "l_1_4_c2";
      } else {
        kolumnaLose = "l_1_4_c4";
      }
      break;

    ///////////////////////

    case "L1_4_1":
      kolumnaWin = "l_1_4_c1";
      kolumnaLose = "7_8_1";
      break;

    case "L1_4_2":
      kolumnaWin = "l_1_4_c3";
      kolumnaLose = "7_8_2";
      break;

    case "L1_4_c_1":
      kolumnaWin = "l_1_2_1";
      kolumnaLose = "5_6_1";
      break;

    case "L1_4_c_2":
      kolumnaWin = "l_1_2_2";
      kolumnaLose = "5_6_2";
      break;

    case "P1_2_1":
      kolumnaWin = "1_2_1";
      kolumnaLose = "l_1_2_c2";
      break;

    case "L1_2_1":
      kolumnaWin = "l_1_2_c1";
      kolumnaLose = "4";
      break;
    case "9_12_1":
      kolumnaWin = "9_10_1";
      kolumnaLose = "11_12_1";
      break;

    case "9_12_2":
      kolumnaWin = "9_10_2";
      kolumnaLose = "11_12_2";
      break;

    case "9_10":
      kolumnaWin = "9";
      kolumnaLose = "10";
      break;

    case "11_12":
      kolumnaWin = "11";
      kolumnaLose = "12";
      break;

    case "13_16_1":
      kolumnaWin = "13_14_1";
      kolumnaLose = "15_16_1";
      break;

    case "13_16_2":
      kolumnaWin = "13_14_2";
      kolumnaLose = "15_16_2";
      break;

    case "13_14":
      kolumnaWin = "13";
      kolumnaLose = "14";
      break;

    case "15_16":
      kolumnaWin = "15";
      kolumnaLose = "16";
      break;

    // 9-16

    case "L1_2_c_1":
      kolumnaWin = "1_2_2";
      kolumnaLose = "3";
      break;

    case "7_8":
      kolumnaWin = "7";
      kolumnaLose = "8";
      break;

    case "5_6":
      kolumnaWin = "5";
      kolumnaLose = "6";
      break;

    case "1_2":
      kolumnaWin = "1";
      kolumnaLose = "2";
      break;

    case "17_24_1":
      kolumnaWin = "17_20_1";
      kolumnaLose = "21_24_1";
      break;

    case "17_24_2":
      kolumnaWin = "17_20_2";
      kolumnaLose = "21_24_2";
      break;

    case "17_24_3":
      kolumnaWin = "17_20_3";
      kolumnaLose = "21_24_3";
      break;

    case "17_24_4":
      kolumnaWin = "17_20_4";
      kolumnaLose = "21_24_4";
      break;

    case "17_20_1":
      kolumnaWin = "17_18_1";
      kolumnaLose = "19_20_1";
      break;

    case "17_20_2":
      kolumnaWin = "17_18_2";
      kolumnaLose = "19_20_2";
      break;

    case "21_24_1":
      kolumnaWin = "21_22_1";
      kolumnaLose = "23_24_1";
      break;

    case "21_24_2":
      kolumnaWin = "21_22_2";
      kolumnaLose = "23_24_2";
      break;

    case "17_18":
      kolumnaWin = "17";
      kolumnaLose = "18";
      break;

    case "19_20":
      kolumnaWin = "19";
      kolumnaLose = "20";
      break;

    case "21_22":
      kolumnaWin = "21";
      kolumnaLose = "22";
      break;

    case "23_24":
      kolumnaWin = "23";
      kolumnaLose = "24";
      break;

    case "25_32_1":
      kolumnaWin = "25_28_1";
      kolumnaLose = "29_32_1";
      break;

    case "25_32_2":
      kolumnaWin = "25_28_2";
      kolumnaLose = "29_32_2";
      break;

    case "25_32_3":
      kolumnaWin = "25_28_3";
      kolumnaLose = "29_32_3";
      break;

    case "25_32_4":
      kolumnaWin = "25_28_4";
      kolumnaLose = "29_32_4";
      break;

    case "25_28_1":
      kolumnaWin = "25_26_1";
      kolumnaLose = "27_28_1";
      break;

    case "25_28_2":
      kolumnaWin = "25_26_2";
      kolumnaLose = "27_28_2";
      break;

    case "29_32_1":
      kolumnaWin = "29_30_1";
      kolumnaLose = "31_32_1";
      break;

    case "29_32_2":
      kolumnaWin = "29_30_2";
      kolumnaLose = "31_32_2";
      break;

    case "25_26":
      kolumnaWin = "25";
      kolumnaLose = "26";
      break;

    case "27_28":
      kolumnaWin = "27";
      kolumnaLose = "28";
      break;

    case "29_30":
      kolumnaWin = "29";
      kolumnaLose = "30";
      break;

    case "31_32":
      kolumnaWin = "31";
      kolumnaLose = "32";
      break;
    case "7_8_1":
      kolumnaWin = "7";
      kolumnaLose = "8";
      break;
    case "5_6_1":
      kolumnaWin = "5";
      kolumnaLose = "6";
      break;
    case "1_2_1":
      kolumnaWin = "1";
      kolumnaLose = "2";
      break;
  }

  if (!table || !kolumnaWin || !kolumnaLose) {
    return res.status(400).json({
      error: "Invalid match configuration",
    });
  }
  const query = `
UPDATE ${table}
SET \`${kolumnaWin}\`=?, \`${kolumnaLose}\`=?
WHERE grupa=? AND data=?
`;
  await db.query(query, [winnerId, loserId, group, date]);
}

// zakończenie meczu
app.post("/api/matches/end", async (req, res) => {
  const { date, match, winner, group, table, box_id, p1Points, p2Points } =
    req.body;

  async function getPlayerId(player, group) {
    if (!player) return null;

    const query = `
      SELECT id 
      FROM zawodnik 
      WHERE TRIM(fname) = TRIM(?) AND TRIM(lname) = TRIM(?) AND grupa = ?
      LIMIT 1
    `;
    const [rows] = await db.query(query, [player.fname, player.lname, group]);
    return rows.length ? rows[0].id : null;
  }

  try {
    const p1 = await getPlayerId(match.p1, group);
    const p2 = await getPlayerId(match.p2, group);

    if (!p1 && !p2) return res.status(400).json({ error: "Players not found" });

    let winnerId, loserId;
    const winnerTab = winner.split(" ");
    if (
      match?.p1?.fname === winnerTab[0] &&
      match?.p1?.lname === winnerTab[1]
    ) {
      winnerId = p1;
      loserId = p2;
    } else {
      winnerId = p2;
      loserId = p1;
    }

    await updateTable(box_id, group, date, table, winnerId, loserId);

    const query2 = `
      UPDATE wyniki w
      LEFT JOIN zawodnik z1 ON z1.id = w.player1_id
      LEFT JOIN zawodnik z2 ON z2.id = w.player2_id
      SET w.status = 'zakonczony', w.player1_points = ?, w.player2_points = ?
      WHERE w.grupa = ? AND w.data = ? AND w.tabela = ? AND w.status = 'trwajacy'
      AND (
        (z1.id = ? AND z2.id = ?)
        OR (z1.id = ? AND z2.id = ?)
        OR (z1.id = ? AND (z2.id IS NULL OR z2.id = ''))
        OR (z2.id = ? AND (z1.id IS NULL OR z1.id = ''))
      )
      ORDER BY w.data DESC
      LIMIT 1
    `;

    await db.query(query2, [
      p1Points,
      p2Points,
      group,
      date,
      table,
      winnerId,
      loserId,
      loserId,
      winnerId,
      winnerId,
      winnerId,
      loserId,
      winnerId,
    ]);

    res.json({ p1, p2 });
  } catch (err) {
    console.error("DB ERROR:", err);
    res.status(500).json({ error: err.message });
  }
});

// obsluga walkowera
app.post("/api/matches/walkover", async (req, res) => {
  const { date, match, box_id, group, table } = req.body;

  const query = `INSERT INTO wyniki
    (data, tabela, grupa, player1_id, player2_id, box_id, status, boisko, player1_points, player2_points)
    VALUES (?, ?, ?, ?, ?, ?, 'zakonczony', 7, ?, ?)
  `;

  async function getPlayerId(player) {
    if (!player) return null;
    const query = `
      SELECT id 
      FROM zawodnik 
      WHERE TRIM(fname) = TRIM(?) 
        AND TRIM(lname) = TRIM(?) 
      LIMIT 1
    `;
    const [rows] = await db.query(query, [
      player.fname || "",
      player.lname || "",
    ]);
    return rows.length > 0 ? rows[0].id : null;
  }

  try {
    const p1Exists = match.p1?.fname && match.p1?.lname;
    const p2Exists = match.p2?.fname && match.p2?.lname;

    if ((p1Exists && !p2Exists) || (!p1Exists && p2Exists)) {
      const p1Id = await getPlayerId(match.p1);
      const p2Id = await getPlayerId(match.p2);

      const winnerId = p1Id || p2Id;
      await updateTable(box_id, group, date, table, winnerId, null);

      const winner = p1Exists ? match.p1 : match.p2;
      const p1Points = p1Exists ? 11 : 0;
      const p2Points = p2Exists ? 11 : 0;

      await db.query(query, [
        date,
        table,
        group,
        p1Id,
        p2Id,
        box_id,
        p1Points,
        p2Points,
      ]);

      res.json({ message: "Walkover match saved", winner });
    } else {
      res.status(400).json({
        error:
          "Walkover can only be applied when exactly one player is present",
      });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// pobranie wyników dla danej grupy
app.get("/api/results/:group", async (req, res) => {
  const { group } = req.params;

  // Sprawdzenie poprawności grupy
  if (group !== "podstawowa" && group !== "zaawansowana") {
    return res.status(400).json({
      error: "Nieprawidłowa grupa",
    });
  }

  try {
    // Pobieramy wszystkie turnieje dla danej grupy
    // DATE_FORMAT gwarantuje, że data przyjdzie jako zwykły tekst YYYY-MM-DD
    const [tournaments] = await db.query(
      `
      SELECT
        DATE_FORMAT(data, '%Y-%m-%d') AS date,
        tabela
      FROM turniej_tabele
      WHERE grupa = ?
      ORDER BY data ASC
      `,
      [group]
    );

    const results = {};

    for (const tournament of tournaments) {
      const date = String(tournament.date);
      const table = tournament.tabela;

      let maxPositions;

      // Ustalamy liczbę miejsc na podstawie tabeli
      switch (table) {
        case "tabela_8x":
          maxPositions = 8;
          break;

        case "tabela_16x":
          maxPositions = 16;
          break;

        case "tabela_24x":
          maxPositions = 24;
          break;

        case "tabela_32x":
          maxPositions = 32;
          break;

        default:
          console.warn(
            `Nieznana tabela "${table}" dla grupy "${group}" i daty "${date}"`
          );
          continue;
      }

      // Tworzymy listę kolumn:
      // `1`,`2`,`3`... itd.
      const columns = Array.from(
        { length: maxPositions },
        (_, index) => `\`${index + 1}\``
      ).join(",");

      // Pobieramy konkretną tabelę wyników
      const query = `
        SELECT ${columns}
        FROM ${table}
        WHERE grupa = ?
          AND DATE(data) = ?
        LIMIT 1
      `;

      const [rows] = await db.query(query, [group, date]);

      if (!rows.length) {
        console.warn(
          `Brak wyników w ${table} dla grupy "${group}" i daty "${date}"`
        );
        continue;
      }

      const row = rows[0];

      // Tworzymy wyniki:
      // [
      //   { id: 117, miejsce: 1 },
      //   { id: 110, miejsce: 2 },
      //   ...
      // ]
      results[date] = Array.from(
        { length: maxPositions },
        (_, index) => {
          const miejsce = index + 1;

          return {
            id: row[miejsce],
            miejsce: miejsce,
          };
        }
      );
    }

    console.log(
      `Wyniki grupy "${group}":`,
      Object.keys(results)
    );

    res.json(results);
  } catch (error) {
    console.error(
      `Błąd /api/results/${group}:`,
      error
    );

    res.status(500).json({
      error: "Błąd serwera podczas pobierania wyników",
    });
  }
}); app.get("/api/results/:group", async (req, res) => {
  const { group } = req.params;

  // Sprawdzenie poprawności grupy
  if (group !== "podstawowa" && group !== "zaawansowana") {
    return res.status(400).json({
      error: "Nieprawidłowa grupa",
    });
  }

  try {
    // Pobieramy wszystkie turnieje dla danej grupy
    // DATE_FORMAT gwarantuje, że data przyjdzie jako zwykły tekst YYYY-MM-DD
    const [tournaments] = await db.query(
      `
      SELECT
        DATE_FORMAT(data, '%Y-%m-%d') AS date,
        tabela
      FROM turniej_tabele
      WHERE grupa = ?
      ORDER BY data ASC
      `,
      [group]
    );

    const results = {};

    for (const tournament of tournaments) {
      const date = String(tournament.date);
      const table = tournament.tabela;

      let maxPositions;

      // Ustalamy liczbę miejsc na podstawie tabeli
      switch (table) {
        case "tabela_8x":
          maxPositions = 8;
          break;

        case "tabela_16x":
          maxPositions = 16;
          break;

        case "tabela_24x":
          maxPositions = 24;
          break;

        case "tabela_32x":
          maxPositions = 32;
          break;

        default:
          console.warn(
            `Nieznana tabela "${table}" dla grupy "${group}" i daty "${date}"`
          );
          continue;
      }

      // Tworzymy listę kolumn:
      // `1`,`2`,`3`... itd.
      const columns = Array.from(
        { length: maxPositions },
        (_, index) => `\`${index + 1}\``
      ).join(",");

      // Pobieramy konkretną tabelę wyników
      const query = `
        SELECT ${columns}
        FROM ${table}
        WHERE grupa = ?
          AND DATE(data) = ?
        LIMIT 1
      `;

      const [rows] = await db.query(query, [group, date]);

      if (!rows.length) {
        console.warn(
          `Brak wyników w ${table} dla grupy "${group}" i daty "${date}"`
        );
        continue;
      }

      const row = rows[0];

      // Tworzymy wyniki:
      // [
      //   { id: 117, miejsce: 1 },
      //   { id: 110, miejsce: 2 },
      //   ...
      // ]
      results[date] = Array.from(
        { length: maxPositions },
        (_, index) => {
          const miejsce = index + 1;

          return {
            id: row[miejsce],
            miejsce: miejsce,
          };
        }
      );
    }

    console.log(
      `Wyniki grupy "${group}":`,
      Object.keys(results)
    );

    res.json(results);
  } catch (error) {
    console.error(
      `Błąd /api/results/${group}:`,
      error
    );

    res.status(500).json({
      error: "Błąd serwera podczas pobierania wyników",
    });
  }
});
// sprawdzenie czy turniej się rozpoczął
app.get("/api/tournament/started", async (req, res) => {
  try {
    const [rows] = await db.query(
      `
      SELECT id, data
      FROM turniej_tabele
      WHERE data >= CURDATE()
      AND data < CURDATE() + INTERVAL 1 DAY
      LIMIT 1
      `,
    );

    res.json(rows.length > 0);
  } catch (err) {
    console.error(err);
    res.status(500).json({
      error: "Database error",
    });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
