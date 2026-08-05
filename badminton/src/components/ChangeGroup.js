import { useState, useEffect } from "react";
import { Link } from "react-router-dom";

const ChangeGroup = () => {
  const [primaryGroup, setPrimaryGroup] = useState([]);
  const [advancedGroup, setAdvancedGroup] = useState([]);

  const fetchGroups = async () => {
    try {
      const [primaryRes, advancedRes] = await Promise.all([
        fetch("http://localhost:5000/api/players/podstawowa"),
        fetch("http://localhost:5000/api/players/zaawansowana"),
      ]);

      const primaryData = await primaryRes.json();
      const advancedData = await advancedRes.json();

      setPrimaryGroup(primaryData);
      setAdvancedGroup(advancedData);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    fetchGroups();
  }, []);

  const handleDoubleClick = async (player, currentGroup) => {
    if (player.group_change_date) {
      alert("Ten zawodnik już wykorzystał zmianę grupy.");
      return;
    }

    const newGroup =
      currentGroup === "podstawowa" ? "zaawansowana" : "podstawowa";

    try {
      const response = await fetch(
        `http://localhost:5000/api/players/${player.id}/change-group`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            newGroup,
          }),
        },
      );

      const data = await response.json();

      if (!response.ok) {
        alert(data.error);
        return;
      }

      fetchGroups();
    } catch (error) {
      console.error(error);
    }
  };

  const playerStyle = (player) => ({
    padding: "12px 15px",
    marginBottom: "10px",
    borderRadius: "8px",
    border: "1px solid #ccc",
    cursor: "pointer",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    backgroundColor: player.group_change_date ? "#ffd6d6" : "#d9f7d9",
    transition: "0.2s",
    fontSize: "16px",
  });

  return (
    <div
      style={{
        width: "90%",
        maxWidth: "1000px",
        margin: "30px auto",
      }}
    >
      <Link
        to="/"
        style={{
          textDecoration: "none",
          color: "#333",
          display: "inline-block",
          marginBottom: "20px",
        }}
      >
        ← Powrót do strony głównej
      </Link>

      <h2 style={{ textAlign: "center" }}>Zmiana grupy zawodników</h2>

      <p style={{ textAlign: "center", color: "#666" }}>
        Kliknij dwukrotnie zawodnika, aby przenieść go do drugiej grupy.
      </p>

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "1fr 1fr",
          gap: "30px",
          marginTop: "30px",
        }}
      >
        <div
          style={{
            background: "#f7f7f7",
            padding: "20px",
            borderRadius: "12px",
            boxShadow: "0 2px 8px rgba(0,0,0,0.1)",
          }}
        >
          <h3
            style={{
              textAlign: "center",
              color: "#1976d2",
            }}
          >
            Grupa podstawowa
          </h3>

          {primaryGroup.map((player) => (
            <div
              key={player.id}
              style={playerStyle(player)}
              onDoubleClick={() => handleDoubleClick(player, "podstawowa")}
            >
              <span>
                {player.fname} {player.lname}
              </span>

              <span>{player.group_change_date ? "❌" : "✅"}</span>
            </div>
          ))}
        </div>

        <div
          style={{
            background: "#f7f7f7",
            padding: "20px",
            borderRadius: "12px",
            boxShadow: "0 2px 8px rgba(0,0,0,0.1)",
          }}
        >
          <h3
            style={{
              textAlign: "center",
              color: "#d32f2f",
            }}
          >
            Grupa zaawansowana
          </h3>

          {advancedGroup.map((player) => (
            <div
              key={player.id}
              style={playerStyle(player)}
              onDoubleClick={() => handleDoubleClick(player, "zaawansowana")}
            >
              <span>
                {player.fname} {player.lname}
              </span>

              <span>{player.group_change_date ? "❌" : "✅"}</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default ChangeGroup;
