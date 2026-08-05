import { useState } from "react";
import axios from "axios";

const StartMatch = ({
  match,
  onClose,
  box_id,
  group,
  table,
  onMatchSaved,
  courts,
  status,
}) => {
  const [court, setCourt] = useState("");

  const startMatch = async () => {
    try {
      await axios.post("http://localhost:5000/api/matches/start", {
        date: new Date().toISOString().split("T")[0],
        match: match,
        court: court,
        box_id: box_id,
        group: group,
        table: table,
      });

      onMatchSaved();
      onClose();
    } catch (error) {
      console.error(error);
    }
  };

  const checkCourt = (number) => {
    if (!courts) return false;

    return courts.some((m) => m.boisko === number && m.status === "trwajacy");
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <div className="modal-content start-match-content">
          <div className="match-info">
            <h2>Mecz {status}</h2>

            <div>
              <h3>Zawodnicy</h3>
              <p>
                {match.p1.fname} {match.p1.lname}
              </p>
              <p>
                {match.p2.fname} {match.p2.lname}
              </p>
              <h3>Grupa:</h3>
              <p>{group}</p>
            </div>

            <div>
              <h3>Boisko</h3>
              <p>{court || "Brak"}</p>
            </div>
          </div>
          <div className="courts">
            {[1, 4, 2, 5, 3, 6].map((number) => (
              <div
                key={number}
                className="court"
                onClick={() => (checkCourt(number) ? null : setCourt(number))}
                style={{
                  backgroundColor: checkCourt(number)
                    ? "#ff0000ff"
                    : court === number
                      ? "#ffc400"
                      : "#2ecc71",
                  fontWeight: "bold",
                  fontSize: "1.5rem",
                }}
              >
                {number}
              </div>
            ))}
          </div>
        </div>

        <div className="modal-buttons">
          <button onClick={onClose}>Zamknij</button>
          <button
            onClick={() => {
              startMatch();
            }}
            disabled={court === ""}
          >
            Rozpocznij
          </button>
        </div>
      </div>
    </div>
  );
};

const EndMatch = ({
  match,
  onClose,
  box_id,
  group,
  table,
  onMatchSaved,
  court,
  status,
}) => {
  const [winner, setWinner] = useState("");
  const [p1Points, setP1Points] = useState(0);
  const [p2Points, setP2Points] = useState(0);

  const endMatch = async () => {
    try {
      await axios.post("http://localhost:5000/api/matches/end", {
        date: new Date().toISOString().split("T")[0],
        match: match,
        winner: winner,
        group: group,
        table: table,
        box_id: box_id,
        p1Points: p1Points,
        p2Points: p2Points,
      });

      onMatchSaved();
      onClose();
    } catch (error) {
      console.error(error);
    }
    console.log(winner);
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <div className="modal-content">
          <div className="match-info">
            <h2>Mecz {status}</h2>
            <h3>Boisko {court}</h3>

            <div>
              <h3>Zawodnicy</h3>
              <p>
                {match.p1.fname} {match.p1.lname}
              </p>
              <p>
                {match.p2.fname} {match.p2.lname}
              </p>
            </div>
          </div>
          <div className="match-actions">
            <div className="winner-section">
              <h3>Wybierz zwycięzcę</h3>
              <div className="winner-options">
                <button
                  className={`winner-btn ${winner === match.p1.fname + " " + match.p1.lname ? "selected" : ""}`}
                  onClick={() => {
                    setWinner(match.p1.fname + " " + match.p1.lname);
                    setP1Points(11);
                    setP2Points(0);
                  }}
                >
                  {match.p1.fname} {match.p1.lname}
                </button>
                <button
                  className={`winner-btn ${winner === match.p2.fname + " " + match.p2.lname ? "selected" : ""}`}
                  onClick={() => {
                    setWinner(match.p2.fname + " " + match.p2.lname);
                    setP1Points(0);
                    setP2Points(11);
                  }}
                >
                  {match.p2.fname} {match.p2.lname}
                </button>
              </div>
            </div>
            <div className="points-section">
              <h3>Punkty</h3>
              <label>
                {match.p1.fname} {match.p1.lname}:
                <input
                  type="number"
                  value={p1Points}
                  onChange={(e) => setP1Points(Number(e.target.value))}
                  min="0"
                />
              </label>
              <label>
                {match.p2.fname} {match.p2.lname}:
                <input
                  type="number"
                  value={p2Points}
                  onChange={(e) => setP2Points(Number(e.target.value))}
                  min="0"
                />
              </label>
            </div>
          </div>
        </div>

        <div className="modal-buttons">
          <button onClick={onClose}>Zamknij</button>
          <button
            onClick={() => {
              endMatch();
            }}
            disabled={winner === ""}
          >
            Zakoncz
          </button>
        </div>
      </div>
    </div>
  );
};

export const GoMatch = ({ GMatch, onClose, courts }) => {
  const [court, setCourt] = useState("");
  const [match, setMatch] = useState({});

  const checkCourt = (number) => {
    if (!courts) return false;

    return courts.some((m) => m.boisko === number && m.status === "trwajacy");
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <div className="modal-content start-match-content">
          <div className="match-info">
            <div>
              <h3>Zawodnicy:</h3>

              {match?.p1?.fname &&
              match?.p1?.lname &&
              match?.p2?.fname &&
              match?.p2?.lname ? (
                <>
                  <p>
                    {match?.p1?.fname} {match?.p1?.lname}
                  </p>
                  <p>
                    {match?.p2?.fname} {match?.p2?.lname}
                  </p>
                  <h3>Grupa:</h3>
                  <p>{match?.group}</p>
                </>
              ) : (
                <p>brak</p>
              )}
            </div>

            <div>
              <h3>Boisko</h3>
              <p>{court || "Brak"}</p>
            </div>
          </div>
          <div className="courts">
            {[1, 4, 2, 5, 3, 6].map((number) => (
              <div
                key={number}
                className="court"
                onClick={() => {
                  if (!checkCourt(number)) return;

                  setCourt(number);

                  setMatch(() => {
                    const matchData = courts.find(
                      (el) => el.status === "trwajacy" && el.boisko === number,
                    );

                    return {
                      p1: {
                        fname: matchData?.player1_fname,
                        lname: matchData?.player1_lname,
                      },
                      p2: {
                        fname: matchData?.player2_fname,
                        lname: matchData?.player2_lname,
                      },
                      box_id: matchData?.box_id,
                      group: matchData?.grupa,
                    };
                  });
                }}
                style={{
                  backgroundColor: !checkCourt(number)
                    ? "#2ecc71"
                    : court === number
                      ? "#830000"
                      : "#ff0000ff",
                  fontWeight: "bold",
                  fontSize: "1.5rem",
                }}
              >
                {number}
              </div>
            ))}
          </div>
        </div>

        <div className="modal-buttons">
          <button onClick={onClose}>Zamknij</button>
          <button
            onClick={() => {
              GMatch(match, match.group);
            }}
            disabled={court === ""}
          >
            Przejdź do meczu
          </button>
        </div>
      </div>
    </div>
  );
};

const MatchModal = ({
  match,
  onClose,
  box_id,
  group,
  table,
  onMatchSaved,
  courts,
}) => {
  const currentMatch = courts?.find(
    (m) => m.box_id === box_id && m.grupa === group,
  );

  const status = currentMatch?.status || "nie rozpoczety";
  const court = currentMatch?.boisko;

  if (status === "nie rozpoczety") {
    return (
      <StartMatch
        match={match}
        onClose={onClose}
        box_id={box_id}
        group={group}
        table={table}
        onMatchSaved={onMatchSaved}
        courts={courts}
        status={status}
      />
    );
  } else if (status === "trwajacy") {
    return (
      <EndMatch
        match={match}
        onClose={onClose}
        box_id={box_id}
        group={group}
        table={table}
        onMatchSaved={onMatchSaved}
        court={court}
        status={status}
      />
    );
  }
};

export default MatchModal;
