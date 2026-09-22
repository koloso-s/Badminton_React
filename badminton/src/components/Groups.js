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

  const normalizeName = (name) => {
    return name.trim().toLowerCase();
  };

  const formatName = (name) => {
    const trimmed = name.trim();

    if (!trimmed) return "";

    return (
      trimmed.charAt(0).toUpperCase() +
      trimmed.slice(1).toLowerCase()
    );
  };

  const fetchTournamentPlayers = async () => {
    try {
      setLoading(true);

      const response = await axios.get(
        "http://localhost:5000/api/tournament/players",
        {
          params: {
            date: selectedDate,
            group,
          },
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

  const fetchAvailablePlayers = async () => {
    try {
      const res = await axios.get(
        `http://localhost:5000/api/players/${group}`,
      );

      setAvailablePlayers(res.data);
    } catch (err) {
      console.error("Error fetching available players:", err);
    }
  };

  useEffect(() => {
    if (group) {
      fetchAvailablePlayers();
      fetchTournamentPlayers();
    }
  }, [group, selectedDate]);

  const filteredAvailablePlayers = availablePlayers.filter(
    (ap) => !players.some((p) => p.id === ap.id),
  );

  useEffect(() => {
    if (!firstName.trim() && !lastName.trim()) {
      setSuggestions([]);
      return;
    }

    const normalizedFirstName = normalizeName(firstName);
    const normalizedLastName = normalizeName(lastName);

    const filtered = filteredAvailablePlayers.filter((p) => {
      const playerFirstName = normalizeName(p.fname);
      const playerLastName = normalizeName(p.lname);

      const matchFirst = playerFirstName.includes(normalizedFirstName);
      const matchLast = playerLastName.includes(normalizedLastName);

      return matchFirst && matchLast;
    });

    setSuggestions(filtered);
  }, [firstName, lastName, availablePlayers, players]);

  const handleSelectPlayer = (player) => {
    setFirstName(player.fname);
    setLastName(player.lname);
    setSelectedPlayerId(player.id);
    setShowSuggestions(false);
    setError("");
  };

  const handleInputChange = (e, type) => {
    const val = e.target.value;

    if (type === "fname") {
      setFirstName(val);
    }

    if (type === "lname") {
      setLastName(val);
    }

    setSelectedPlayerId("");
    setShowSuggestions(true);
  };

  useEffect(() => {
    if (!firstName.trim() || !lastName.trim()) {
      return;
    }

    const exactMatch = availablePlayers.find(
      (p) =>
        normalizeName(p.fname) === normalizeName(firstName) &&
        normalizeName(p.lname) === normalizeName(lastName),
    );

    if (exactMatch) {
      setSelectedPlayerId(exactMatch.id);
    }
  }, [firstName, lastName, availablePlayers]);

  const clearInputs = () => {
    setFirstName("");
    setLastName("");
    setSelectedPlayerId("");
    setSuggestions([]);
    setShowSuggestions(false);
  };

  const handleAddPlayer = async () => {
    const formattedFirstName = formatName(firstName);
    const formattedLastName = formatName(lastName);

    if (!formattedFirstName || !formattedLastName) {
      setError("Podaj imię i nazwisko.");
      return;
    }

    const existingPlayer = availablePlayers.find(
      (p) =>
        normalizeName(p.fname) === normalizeName(formattedFirstName) &&
        normalizeName(p.lname) === normalizeName(formattedLastName),
    );

    try {
      if (existingPlayer) {
        await axios.post(
          "http://localhost:5000/api/tournament/players",
          {
            date: selectedDate,
            zawodnik_id: existingPlayer.id,
          },
        );

        await fetchTournamentPlayers();

        clearInputs();
        setError("");

        return;
      }

      await axios.post(
        "http://localhost:5000/api/tournament/players/add",
        {
          date: selectedDate,
          fname: formattedFirstName,
          lname: formattedLastName,
          grupa: group,
        },
      );

      await fetchAvailablePlayers();
      await fetchTournamentPlayers();

      clearInputs();
      setError("");
    } catch (err) {
      console.error("Error adding player:", err);

      if (err.response?.status === 409) {
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
                  <li
                    key={p.id}
                    onClick={() => handleSelectPlayer(p)}
                  >
                    {p.fname} {p.lname}
                  </li>
                ))}
              </ul>
            )}
          </div>

          <button
            className="add-player-btn"
            onClick={handleAddPlayer}
          >
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
                  <td
                    colSpan="2"
                    style={{ textAlign: "center" }}
                  >
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
                  <td
                    colSpan="2"
                    style={{ textAlign: "center" }}
                  >
                    Brak zawodników w tym dniu.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>

        <Link
          to="/starttournament"
          className="back-link"
        >
          ← Powrót
        </Link>
      </div>
    </div>
  );
};

export default Groups;