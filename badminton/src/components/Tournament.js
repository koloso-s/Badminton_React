import axios from "axios";
import { useEffect, useState } from "react";
import "../styles/Tournament.css";
import MatchBox, { FinalMatchBox } from "./MatchBox";
import { Link } from "react-router-dom";
import MatchModal from "./MatchesOperation";
import { GoMatch } from "./MatchesOperation";

const Tournament = ({ show }) => {
  useEffect(() => {
    if (!show) return;

    let animationFrame;
    let timeout;

    const startScrolling = () => {
      const startPosition = window.scrollY;

      const bottomPosition =
        document.documentElement.scrollHeight -
        window.innerHeight;

      const speed = 45;

      const distance =
        bottomPosition - startPosition;

      const duration =
        distance > 0
          ? (distance / speed) * 1000
          : 0;

      const startTime = performance.now();

      const animateScroll = (currentTime) => {
        const elapsed =
          currentTime - startTime;

        const progress =
          duration > 0
            ? Math.min(
              elapsed / duration,
              1
            )
            : 1;

        const position =
          startPosition +
          distance * progress;

        window.scrollTo({
          top: position,
          behavior: "auto",
        });

        if (progress < 1) {
          animationFrame =
            requestAnimationFrame(
              animateScroll
            );
        } else {
          timeout = setTimeout(() => {
            setGroup((prevGroup) =>
              prevGroup === "podstawowa"
                ? "zaawansowana"
                : "podstawowa"
            );
            timeout = setTimeout(() => {
              window.scrollTo({
                top: 0,
                behavior: "auto",
              });

              timeout = setTimeout(() => {
                startScrolling();
              }, 2000);
            }, 1000);
          }, 3000);
        }
      };

      animationFrame =
        requestAnimationFrame(
          animateScroll
        );
    };

    window.scrollTo({
      top: 0,
      behavior: "auto",
    });

    timeout = setTimeout(() => {
      startScrolling();
    }, 2000);

    return () => {
      cancelAnimationFrame(animationFrame);
      clearTimeout(timeout);
    };
  }, [show]);
  const [tournament, setTournament] = useState({});
  const [group, setGroup] = useState("podstawowa");
  const [columns, setColumns] = useState([]);
  const [columnsBottom, setColumnsBottom] = useState([]);
  const [selectedMatch, setSelectedMatch] = useState(null);
  const [goMatch, setGoMatch] = useState(null);

  const fetchTournamentPlayers = async (selectedGroup) => {
    try {
      const response = await axios.get(
        `http://localhost:5000/api/tournament/gettournament/${selectedGroup}`,
      );
      setTournament(response.data);
    } catch (err) {
      console.error("Error fetching tournament players:", err);
    }
  };

  useEffect(() => {
    fetchTournamentPlayers(group);
  }, [group]);

  useEffect(() => {
    if (!tournament?.tabela) return;

    switch (tournament.tabela) {
      case "tabela_8x":
        setColumns([
          "L1_2_c",
          "L1_2",
          "L1_4_c",
          "L1_4",
          "main",
          "P1_4",
          "P1_2",
        ]);
        setColumnsBottom(["7_8", "5_6", "4", "3", "1_2"]);
        break;
      case "tabela_16x":
        setColumns([
          "L1_2_c",
          "L1_2",
          "L1_4_c",
          "L1_4",
          "L1_8_c",
          "L1_8",
          "main",
          "P1_8",
          "P1_4",
          "P1_2",
        ]);
        setColumnsBottom(["13_16", "9_12", "7_8", "5_6", "4", "3", "1_2"]);
        break;
      case "tabela_24x":
        setColumns([
          "L1_2_c",
          "L1_2",
          "L1_4_c",
          "L1_4",
          "L1_8_c",
          "L1_8",
          "Lmain",
          "main",
          "Pmain",
          "P1_8",
          "P1_4",
          "P1_2",
        ]);
        setColumnsBottom([
          "17_24",
          "21_24",
          "17_20",
          "13_16",
          "9_12",
          "7_8",
          "5_6",
          "4",
          "3",
          "1_2",
        ]);
        break;
      case "tabela_32x":
        setColumns([
          "L1_2_c",
          "L1_2",
          "L1_4_c",
          "L1_4",
          "L1_8_c",
          "L1_8",
          "L1_16_c",
          "L1_16",
          "main",
          "P1_16",
          "P1_8",
          "P1_4",
          "P1_2",
        ]);
        setColumnsBottom([
          "25_32",
          "29_32",
          "25_28",
          "17_24",
          "21_24",
          "17_20",
          "13_16",
          "9_12",
          "7_8",
          "5_6",
          "4",
          "3",
          "1_2",
        ]);
        break;
    }
  }, [tournament]);

  //   useEffect(() => {
  //     console.log(tournament);
  //   }, [columns]);

  const getColumnLabel = (column) => {
    switch (column) {
      case "L1_2_c":
        return "3";
      case "L1_2":
        return "4";
      case "L1_4_c":
        return "5 - 6";
      case "L1_4":
        return "7 - 8";
      case "L1_8_c":
        return "9 - 12";
      case "L1_8":
        return "13 - 16";
      case "L1_16_c":
        return "17 - 24";
      case "L1_16":
        return "25 - 32";
      case "main":
        return "main";
      case "Pmain":
        return "1 / 16";
      case "Lmain":
        return "17 - 24";
      case "P1_16":
        return "1 / 16";
      case "P1_8":
        return "1 / 8";
      case "P1_4":
        return "1 / 4";
      case "P1_2":
        return "1 / 2";
      default:
        return "";
    }
  };

  const getMatchColor = (boxId, top, bottom, tournament) => {
    if (!tournament?.mecze) return "#ffffffff";

    const fullTop = `${top?.fname ?? ""} ${top?.lname ?? ""}`.trim();
    const fullBottom = `${bottom?.fname ?? ""} ${bottom?.lname ?? ""}`.trim();

    const foundMatch = tournament.mecze.find((el) => {
      if (el.box_id !== boxId) return false;

      const p1 = `${el.player1_fname ?? ""} ${el.player1_lname ?? ""}`.trim();
      const p2 = `${el.player2_fname ?? ""} ${el.player2_lname ?? ""}`.trim();

      const bothEmpty = !p1 && !p2;

      const sameOrder = p1 === fullTop && p2 === fullBottom;

      const reversedOrder = p1 === fullBottom && p2 === fullTop;

      const oneMissingButMatch =
        (p1 === fullTop && !p2) ||
        (!p1 && p2 === fullBottom) ||
        (!p2 && p1 === fullBottom);

      return sameOrder || reversedOrder || oneMissingButMatch || bothEmpty;
    });

    if (!foundMatch) return "#ffffffff";

    if (foundMatch?.status === "zakonczony") {
      return "#4CAF50";
    }

    if (foundMatch?.status === "trwajacy") {
      return "rgb(255, 0, 0)";
    }

    return "#ffffffff";
  };

  const handleClickMatch = (match) => {
    const player1Exists = match.p1?.fname && match.p1?.lname;
    const player2Exists = match.p2?.fname && match.p2?.lname;

    if (player1Exists && player2Exists) {
      setSelectedMatch(match);
    } else {
      console.log("dps");
    }
  };

  const handleDoubleClickWalkover = async (match, BoxId) => {
    const player1Exists = match.p1?.fname && match.p1?.lname;
    const player2Exists = match.p2?.fname && match.p2?.lname;

    if (
      (player1Exists && !player2Exists) ||
      (!player1Exists && player2Exists)
    ) {
      const winner = player1Exists
        ? match.p1.fname + " " + match.p1.lname
        : match.p2.fname + " " + match.p2.lname;

      try {
        await axios.post("http://localhost:5000/api/matches/walkover", {
          date: new Date().toISOString().split("T")[0],
          match: match,
          group: group,
          table: tournament.tabela,
          box_id: BoxId,
          court: 7,
        });

        fetchTournamentPlayers(group);
        setSelectedMatch(null);
      } catch (error) {
        console.error(error);
      }
    }
  };

  const renderColumnMatchesTwo = (column) => {
    const matches = tournament[column];
    if (!matches) return null;

    const matchPairs = [];
    let j = 1;
    for (let i = 0; i < matches.length; i += 2) {
      const BoxId = column + "_" + j++;
      const match = {
        p1: matches[i],
        p2: matches[i + 1],
        box_id: BoxId,
      };

      matchPairs.push(
        <MatchBox
          onClick={() => handleClickMatch(match)}
          onDoubleClick={() => handleDoubleClickWalkover(match, BoxId)}
          key={column + "_" + i}
          p1_fname={matches[i]?.fname || null}
          p1_lname={matches[i]?.lname || null}
          p2_fname={matches[i + 1]?.fname || null}
          p2_lname={matches[i + 1]?.lname || null}
          background={getMatchColor(
            BoxId,
            matches[i],
            matches[i + 1],
            tournament,
          )}
        />,
      );
    }

    return matchPairs;
  };

  const renderColumnMatchesFour = (column) => {
    const columnLayouts = {
      "25_28": ["25_26", "match", "27_28"],
      "29_32": ["29_30", "match", "31_32"],
      "17_20": ["17_18", "match", "19_20"],
      "21_24": ["21_22", "match", "23_24"],
      "13_16": ["13_14", "match", "15_16"],
      "9_12": ["9_10", "match", "11_12"],
    };

    const layout = columnLayouts[column];

    const matches = tournament[column];
    if (!matches) return null;

    const matchPairs = [];
    const matchPairs2 = [];

    layout.forEach((item) => {
      if (item === "match") {
        let j = 1;
        for (let i = 0; i < matches.length; i += 2) {
          const boxId = column + "_" + j++;

          const match = {
            p1: matches[i],
            p2: matches[i + 1],
            box_id: boxId,
          };

          matchPairs.push(
            <MatchBox
              key={boxId}
              onClick={() => handleClickMatch(match)}
              onDoubleClick={() => handleDoubleClickWalkover(match, boxId)}
              p1_fname={matches[i]?.fname || null}
              p1_lname={matches[i]?.lname || null}
              p2_fname={matches[i + 1]?.fname || null}
              p2_lname={matches[i + 1]?.lname || null}
              background={getMatchColor(
                boxId,
                matches[i],
                matches[i + 1],
                tournament,
              )}
            />,
          );
        }
      } else {
        const places = item.split("_");
        const boxId = places[0] + "_" + places[1];

        const match = {
          p1: tournament[boxId + "_1"],
          p2: tournament[boxId + "_2"],
          box_id: boxId,
        };

        matchPairs2.push(
          <MatchBox
            key={boxId}
            onClick={() => handleClickMatch(match)}
            onDoubleClick={() => handleDoubleClickWalkover(match, boxId)}
            p1_fname={tournament[boxId + "_1"]?.fname || null}
            p1_lname={tournament[boxId + "_1"]?.lname || null}
            p2_fname={tournament[boxId + "_2"]?.fname || null}
            p2_lname={tournament[boxId + "_2"]?.lname || null}
            background={getMatchColor(
              boxId,
              {
                fname: tournament[boxId + "_1"]?.fname,
                lname: tournament[boxId + "_1"]?.lname,
              },
              {
                fname: tournament[boxId + "_2"]?.fname,
                lname: tournament[boxId + "_2"]?.lname,
              },
              tournament,
            )}
          />,
        );
      }
    });

    return (
      <>
        {matchPairs2[0]}
        <div className="tournament-table-column">{matchPairs}</div>
        {matchPairs2[1]}
      </>
    );
  };

  const renderColumnMatchesEight = (column) => {
    const matches = tournament[column];
    if (!matches) return null;

    const matchPairs = [];

    let j = 1;
    for (let i = 0; i < matches.length; i += 2) {
      const boxId = column + "_" + j++;

      const match = {
        p1: matches[i],
        p2: matches[i + 1],
        box_id: boxId,
      };

      matchPairs.push(
        <MatchBox
          key={boxId}
          onClick={() => handleClickMatch(match)}
          onDoubleClick={() => handleDoubleClickWalkover(match, boxId)}
          p1_fname={matches[i]?.fname || null}
          p1_lname={matches[i]?.lname || null}
          p2_fname={matches[i + 1]?.fname || null}
          p2_lname={matches[i + 1]?.lname || null}
          background={getMatchColor(
            boxId,
            matches[i],
            matches[i + 1],
            tournament,
          )}
        />,
      );
    }

    return <div className="tournament-table-column">{matchPairs}</div>;
  };

  const renderColumnMatchesBottom = (column) => {
    const columnLayouts = {
      "25_32": ["match"],
      "29_32": [[29, 30], "match", [31, 32]],
      "25_28": [[25, 26], "match", [27, 28]],
      "17_24": ["match"],
      "21_24": [[21, 22], "match", [23, 24]],
      "17_20": [[17, 18], "match", [19, 20]],
      "13_16": [[13, 14], "match", [15, 16]],
      "9_12": [[9, 10], "match", [11, 12]],
      "7_8": [7, "match", 8],
      "5_6": [5, "match", 6],
      "4": [4],
      "3": [3],
      "1_2": [1, "match", 2],
    };

    const layout = columnLayouts[column];

    if (!layout) return null;

    return (
      <div className="tournament-table-bottom">
        {layout.map((item, index) => {
          if (item === "match") {
            if (column === "1_2" || column === "5_6" || column === "7_8")
              return renderColumnMatchesTwo(column);
            if (
              column === "9_12" ||
              column === "13_16" ||
              column === "17_20" ||
              column === "21_24" ||
              column === "29_32" ||
              column === "25_28"
            )
              return renderColumnMatchesFour(column);
            if (column === "17_24" || column === "25_32")
              return renderColumnMatchesEight(column);
          }

          if (Array.isArray(item)) {
            return (
              <div key={index} className="tournament-table-column">
                {item.map((place, idx) => (
                  <FinalMatchBox
                    key={idx}
                    p_fname={tournament[place]?.fname}
                    p_lname={tournament[place]?.lname}
                    place={place}
                  />
                ))}
              </div>
            );
          }

          return (
            <FinalMatchBox
              key={item}
              p_fname={tournament[item]?.fname}
              p_lname={tournament[item]?.lname}
              place={item}
            />
          );
        })}
      </div>
    );
  };
  return (
    <div className="tournament">
      <div className="tournament-header">
        {!show && <Link to="/" className="back-link" style={{ margin: "1.4rem" }}>
          ← Powrót do strony głównej
        </Link>}
        {selectedMatch && (
          <MatchModal
            match={selectedMatch}
            onClose={() => setSelectedMatch(null)}
            box_id={selectedMatch.box_id}
            group={group}
            table={tournament.tabela}
            onMatchSaved={() => fetchTournamentPlayers(group)}
            courts={tournament.mecze}
          />
        )}
        <h1>Grupa {group}</h1>
        <div style={{ marginBottom: "1rem" }} className="tournament-buttons">
          <button onClick={() => setGroup("podstawowa")} className={group === "podstawowa" ? "btn-select" : ""}>
            Grupa Podstawowa
          </button>
          <button onClick={() => setGroup("zaawansowana")} className={group === "zaawansowana" ? "btn-select" : ""}>
            Grupa Zaawansowana
          </button>
        </div>
      </div>
      {tournament && (
        <div className="tournament-table">
          <h2>Główna Tabela</h2>
          <div className="tournament-table-body">
            {columns.map((column, idx) => (
              <div key={idx} className="tournament-column">
                <div
                  key={column + "_header"}
                  className="tournament-column-header"
                >
                  {getColumnLabel(column)}
                </div>
                <div
                  key={column + "_content"}
                  className="tournament-column-contnet"
                >
                  {renderColumnMatchesTwo(column)}
                </div>
              </div>
            ))}
          </div>
          {columnsBottom.map((column, idx) => (
            <div
              className={"tournament-table-" + column}
              style={{
                width: "100vw",
                minHeight: "250px",
                display: "flex",
                justifyContent: "space-evenly",
                flexDirection: "column",
                alignItems: "center",
                padding: "10px",
              }}
              key={idx}
            >
              <h2>{(column === "3" || column === "4") ? "Miejsce" : "Miejsca"}: {column}</h2>
              {renderColumnMatchesBottom(column)}
            </div>
          ))}
        </div>
      )}

      <div className="Button-courts">
        <button
          onClick={() => {
            setGoMatch(true);
          }}
        >
          Boiska
        </button>
      </div>
      {goMatch && (
        <GoMatch
          courts={tournament.mecze}
          onClose={() => setGoMatch(null)}
          GMatch={(match, group) => {
            setGroup(group);
            setSelectedMatch(match);
            setGoMatch(null);
          }}
        ></GoMatch>
      )}
    </div>
  );
};

export default Tournament;
