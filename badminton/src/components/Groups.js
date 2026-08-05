import React, { useState, useEffect } from "react";
import { useParams, Link } from "react-router-dom";
import axios from "axios";
import "../styles/Groups.css";

const Groups = () => {
  const { group } = useParams();
  const [players, setPlayers] = useState([]);
  const [availablePlayers, setAvailablePlayers] = useState([]);
  const [selectedDate, setSelectedDate] = useState(
    new Date().toISOString().split("T")[0],
  );
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [suggestions, setSuggestions] = useState([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [selectedPlayerId, setSelectedPlayerId] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const fetchTournamentPlayers = async () => {
    try {
      setLoading(true);
      const response = await axios.get(
        "http://localhost:5000/api/tournament/players",
        {
          params: { date: selectedDate, group },
        },
      );
      setPlayers(response.data);
      setError("");
    } catch (err) {
      console.error("Error fetching tournament players:", err);
      setError("Nie udało się pobrać listy zawodników.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    const fetchAvailablePlayers = async () => {
      try {
        const res = await axios.get(
          `http://localhost:5000/api/players/${group}`,
        );
        setAvailablePlayers(res.data);
      } catch (err) {
        console.error(err);
      }
    };

    if (group) {
      fetchAvailablePlayers();
      fetchTournamentPlayers();
    }
  }, [group, selectedDate]);

  const filteredAvailablePlayers = availablePlayers.filter(
    (ap) => !players.some((p) => p.id === ap.id),
  );

  useEffect(() => {
    if (!firstName && !lastName) {
      setSuggestions([]);
      return;
    }

    const filtered = filteredAvailablePlayers.filter((p) => {
      const matchFirst = p.fname
        .toLowerCase()
        .includes(firstName.toLowerCase());
      const matchLast = p.lname.toLowerCase().includes(lastName.toLowerCase());
      return matchFirst && matchLast;
    });
    setSuggestions(filtered);
  }, [firstName, lastName, availablePlayers, players]); // depend on availablePlayers/players to re-filter if list changes

  const handleSelectPlayer = (player) => {
    setFirstName(player.fname);
    setLastName(player.lname);
    setSelectedPlayerId(player.id);
    setShowSuggestions(false);
  };

  const handleInputChange = (e, type) => {
    const val = e.target.value;
    if (type === "fname") setFirstName(val);
    if (type === "lname") setLastName(val);
    setSelectedPlayerId(""); // Reset ID if user types manually, forcing selection or validation (or could try to auto-match)
    setShowSuggestions(true);
  };

  // Auto-match if exact name typed (optional, but good for UX if they don't click suggestion)
  useEffect(() => {
    if (!selectedPlayerId) {
      const exactMatch = filteredAvailablePlayers.find(
        (p) =>
          p.fname.toLowerCase() === firstName.toLowerCase() &&
          p.lname.toLowerCase() === lastName.toLowerCase(),
      );
      if (exactMatch) setSelectedPlayerId(exactMatch.id);
    }
  }, [firstName, lastName, filteredAvailablePlayers]);

  const handleAddPlayer = async () => {
    if (!selectedPlayerId) {
      try {
        await axios.post("http://localhost:5000/api/tournament/players/add", {
          date: selectedDate,
          fname: firstName,
          lname: lastName,
          grupa: group,
        });
        fetchTournamentPlayers();
        setFirstName("");
        setLastName("");
        setSelectedPlayerId("");
        setError("");
      } catch (err) {
        console.error("Error adding player:", err);
        if (err.response && err.response.status === 409) {
          setError("Ten zawodnik jest już dodany.");
        } else {
          setError("Błąd podczas dodawania zawodnika.");
        }
      }
      return;
    }

    try {
      await axios.post("http://localhost:5000/api/tournament/players", {
        date: selectedDate,
        zawodnik_id: selectedPlayerId,
      });
      // Refresh list and clear inputs
      fetchTournamentPlayers();
      setFirstName("");
      setLastName("");
      setSelectedPlayerId("");
      setError("");
    } catch (err) {
      console.error("Error adding player:", err);
      if (err.response && err.response.status === 409) {
        setError("Ten zawodnik jest już dodany.");
      } else {
        setError("Błąd podczas dodawania zawodnika.");
      }
    }
  };

  return (
    <div className="groups-page">
      <div className="groups-container">
        <div className="header">
          <h1>
            Grupa {group} ({players.length}{" "}
            {players.length === 1
              ? "osoba"
              : players.length === 2 ||
                  players.length === 3 ||
                  players.length === 4 ||
                  players.length === 22 ||
                  players.length === 23 ||
                  players.length === 24 ||
                  players.length === 32 ||
                  players.length === 33 ||
                  players.length === 34
                ? "osoby"
                : "osób"}
            )
          </h1>
        </div>
        {error && <div className="error-message">{error}</div>}
        <div className="add-player-section">
          <div className="input-group">
            <input
              type="text"
              placeholder="Imię"
              value={firstName}
              onChange={(e) => handleInputChange(e, "fname")}
              onFocus={() => setShowSuggestions(true)}
              className="player-input"
            />
            <input
              type="text"
              placeholder="Nazwisko"
              value={lastName}
              onChange={(e) => handleInputChange(e, "lname")}
              onFocus={() => setShowSuggestions(true)}
              className="player-input"
            />

            {showSuggestions && suggestions.length > 0 && (
              <ul className="suggestions-list">
                {suggestions.map((p) => (
                  <li key={p.id} onClick={() => handleSelectPlayer(p)}>
                    {p.fname} {p.lname}
                  </li>
                ))}
              </ul>
            )}
          </div>

          <button className="add-player-btn" onClick={handleAddPlayer}>
            Dodaj
          </button>
        </div>

        <div className="players-list">
          <table className="players-table">
            <thead>
              <tr>
                <th>Imię</th>
                <th>Nazwisko</th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan="2" style={{ textAlign: "center" }}>
                    Ładowanie...
                  </td>
                </tr>
              ) : players.length > 0 ? (
                players.map((p) => (
                  <tr key={p.registration_id}>
                    <td>{p.fname}</td>
                    <td>{p.lname}</td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="2" style={{ textAlign: "center" }}>
                    Brak zawodników w tym dniu.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>

        <Link to="/starttournament" className="back-link">
          ← Powrót
        </Link>
      </div>
    </div>
  );
};

export default Groups;
