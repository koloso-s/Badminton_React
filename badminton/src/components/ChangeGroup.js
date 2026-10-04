import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import "../styles/ChangeGroup.css";

const ChangeGroup = () => {
  const [primaryGroup, setPrimaryGroup] = useState([]);
  const [intermediateGroup, setIntermediateGroup] = useState([]);
  const [advancedGroup, setAdvancedGroup] = useState([]);

  const [selectedPlayer, setSelectedPlayer] = useState(null);
  const [selectedCurrentGroup, setSelectedCurrentGroup] = useState(null);
  const [selectedNewGroup, setSelectedNewGroup] = useState("");

  const groups = [
    {
      key: "podstawowa",
      label: "Grupa podstawowa",
      players: primaryGroup,
    },
    {
      key: "sredniozaawansowana",
      label: "Grupa średniozaawansowana",
      players: intermediateGroup,
    },
    {
      key: "zaawansowana",
      label: "Grupa zaawansowana",
      players: advancedGroup,
    },
  ];

  // ==========================================
  // POBIERANIE GRUP
  // ==========================================

  const fetchGroups = async () => {
    try {
      const [primaryRes, intermediateRes, advancedRes] = await Promise.all([
        fetch("http://localhost:5000/api/players/podstawowa"),
        fetch("http://localhost:5000/api/players/średniozaawansowana"),
        fetch("http://localhost:5000/api/players/zaawansowana"),
      ]);

      const primaryData = await primaryRes.json();
      const intermediateData = await intermediateRes.json();
      const advancedData = await advancedRes.json();

      setPrimaryGroup(primaryData);
      setIntermediateGroup(intermediateData);
      setAdvancedGroup(advancedData);
    } catch (error) {
      console.error("Błąd podczas pobierania grup:", error);
    }
  };

  useEffect(() => {
    fetchGroups();
  }, []);

  // ==========================================
  // OTWIERANIE MODALA
  // ==========================================

  const handleDoubleClick = (player, currentGroup) => {
    if (player.group_change_date) {
      alert("Ten zawodnik już wykorzystał zmianę grupy.");
      return;
    }

    setSelectedPlayer(player);
    setSelectedCurrentGroup(currentGroup);
    setSelectedNewGroup("");
  };

  // ==========================================
  // ZAMYKANIE MODALA
  // ==========================================

  const closeModal = () => {
    setSelectedPlayer(null);
    setSelectedCurrentGroup(null);
    setSelectedNewGroup("");
  };

  // ==========================================
  // ZMIANA GRUPY
  // ==========================================

  const changeGroup = async () => {
    if (!selectedPlayer || !selectedNewGroup) {
      return;
    }

    if (selectedNewGroup === selectedCurrentGroup) {
      alert("Zawodnik jest już w tej grupie.");
      return;
    }

    try {
      const response = await fetch(
        `http://localhost:5000/api/players/${selectedPlayer.id}/change-group`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            newGroup: selectedNewGroup,
          }),
        }
      );

      const data = await response.json();

      if (!response.ok) {
        alert(data.error);
        return;
      }

      closeModal();
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
        onDoubleClick={() => handleDoubleClick(player, currentGroup)}
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
        <Link to="/" className="change-group-back">
          ← Powrót do strony głównej
        </Link>

        <h1>Zmiana grupy zawodników</h1>

        <p>
          Kliknij dwukrotnie zawodnika, a następnie wybierz grupę docelową.
        </p>
      </div>

      <div className="change-group-grid">
        {groups.map((group) => (
          <section className="change-group-card" key={group.key}>
            <div className="change-group-card-header">
              <h2>{group.label}</h2>

              <span className="change-group-count">
                {group.players.length}
              </span>
            </div>

            <div className="change-group-list">
              {group.players.length > 0 ? (
                group.players.map((player) =>
                  renderPlayer(player, group.key)
                )
              ) : (
                <div className="change-group-empty">
                  Brak zawodników
                </div>
              )}
            </div>
          </section>
        ))}
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

      {selectedPlayer && (
        <div className="change-group-modal-overlay" onClick={closeModal}>
          <div
            className="change-group-modal"
            onClick={(e) => e.stopPropagation()}
          >
            <h2>Zmiana grupy</h2>

            <p>
              Zawodnik:
              <strong>
                {" "}
                {selectedPlayer.fname} {selectedPlayer.lname}
              </strong>
            </p>

            <p>
              Aktualna grupa:
              <strong> {selectedCurrentGroup}</strong>
            </p>

            <div className="change-group-modal-options">
              {groups
                .filter((group) => group.key !== selectedCurrentGroup)
                .map((group) => (
                  <button
                    key={group.key}
                    type="button"
                    className={`change-group-modal-option ${selectedNewGroup === group.key
                      ? "change-group-modal-option--selected"
                      : ""
                      }`}
                    onClick={() => setSelectedNewGroup(group.key)}
                  >
                    {group.label}
                  </button>
                ))}
            </div>

            <div className="change-group-modal-actions">
              <button
                type="button"
                className="change-group-modal-cancel"
                onClick={closeModal}
              >
                Anuluj
              </button>

              <button
                type="button"
                className="change-group-modal-confirm"
                onClick={changeGroup}
                disabled={!selectedNewGroup}
              >
                Zmień grupę
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default ChangeGroup;