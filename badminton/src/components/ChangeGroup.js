import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import "../styles/ChangeGroup.css";

const ChangeGroup = () => {
  const [primaryGroup, setPrimaryGroup] = useState([]);
  const [advancedGroup, setAdvancedGroup] = useState([]);

  // ==========================================
  // POBIERANIE GRUP
  // ==========================================

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
      console.error("Błąd podczas pobierania grup:", error);
    }
  };

  useEffect(() => {
    fetchGroups();
  }, []);

  // ==========================================
  // ZMIANA GRUPY
  // ==========================================

  const handleDoubleClick = async (player, currentGroup) => {
    if (player.group_change_date) {
      alert("Ten zawodnik już wykorzystał zmianę grupy.");
      return;
    }

    const newGroup =
      currentGroup === "podstawowa"
        ? "zaawansowana"
        : "podstawowa";

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
        }
      );

      const data = await response.json();

      if (!response.ok) {
        alert(data.error);
        return;
      }

      fetchGroups();
    } catch (error) {
      console.error("Błąd podczas zmiany grupy:", error);
    }
  };

  // ==========================================
  // RENDER ZAWODNIKA
  // ==========================================

  const renderPlayer = (player, currentGroup) => {
    const changed = Boolean(player.group_change_date);

    return (
      <div
        key={player.id}
        className={`change-group-player ${changed
          ? "change-group-player--changed"
          : "change-group-player--available"
          }`}
        onDoubleClick={() =>
          handleDoubleClick(player, currentGroup)
        }
        title={
          changed
            ? "Ten zawodnik już zmienił grupę"
            : "Kliknij dwukrotnie, aby zmienić grupę"
        }
      >
        <span className="change-group-player-name">
          {player.fname} {player.lname}
        </span>

        <span
          className={`change-group-status ${changed
            ? "change-group-status--blocked"
            : "change-group-status--available"
            }`}
        >
          {changed ? "❌" : "✅"}
        </span>
      </div>
    );
  };

  // ==========================================
  // RENDER
  // ==========================================

  return (
    <div className="change-group-page">

      <div className="change-group-header">

        <Link
          to="/"
          className="change-group-back"
        >
          ← Powrót do strony głównej
        </Link>

        <h1>Zmiana grupy zawodników</h1>

        <p>
          Kliknij dwukrotnie zawodnika, aby przenieść go do drugiej grupy.
        </p>

      </div>

      <div className="change-group-grid">

        {/* ================================
            GRUPA PODSTAWOWA
        ================================ */}

        <section className="change-group-card">

          <div className="change-group-card-header">
            <h2>Grupa podstawowa</h2>

            <span className="change-group-count">
              {primaryGroup.length}
            </span>
          </div>

          <div className="change-group-list">

            {primaryGroup.length > 0 ? (
              primaryGroup.map((player) =>
                renderPlayer(
                  player,
                  "podstawowa"
                )
              )
            ) : (
              <div className="change-group-empty">
                Brak zawodników
              </div>
            )}

          </div>

        </section>

        {/* ================================
            GRUPA ZAAWANSOWANA
        ================================ */}

        <section className="change-group-card">

          <div className="change-group-card-header">
            <h2>Grupa zaawansowana</h2>

            <span className="change-group-count">
              {advancedGroup.length}
            </span>
          </div>

          <div className="change-group-list">

            {advancedGroup.length > 0 ? (
              advancedGroup.map((player) =>
                renderPlayer(
                  player,
                  "zaawansowana"
                )
              )
            ) : (
              <div className="change-group-empty">
                Brak zawodników
              </div>
            )}

          </div>

        </section>

      </div>

      <div className="change-group-legend">

        <div>
          <span>✅</span>
          Zawodnik może zmienić grupę
        </div>

        <div>
          <span>❌</span>
          Zawodnik wykorzystał już zmianę grupy
        </div>

      </div>

    </div>
  );
};

export default ChangeGroup;