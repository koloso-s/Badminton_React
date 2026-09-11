import { Link } from "react-router-dom";
import "../styles/HomePage.css";
import { useState, useEffect } from "react";

const HomePage = () => {
  const [tournamentStarted, setTournamentStarted] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const checkTournamentStarted = async () => {
      try {
        const response = await fetch(
          "http://localhost:5000/api/tournament/started",
        );

        const data = await response.json();

        setTournamentStarted(data);
      } catch (error) {
        console.error("Błąd sprawdzania statusu turnieju:", error);
      } finally {
        setLoading(false);
      }
    };

    checkTournamentStarted();
  }, []);

  return (
    <div className="home-page">
      <div className="home-page-buttons">
        <Link to="/showresults">Zobacz Wyniki</Link>

        <Link
          to={tournamentStarted ? "#" : "/starttournament"}
          onClick={(e) => {
            if (tournamentStarted) {
              e.preventDefault();
              alert("Turniej na dzisiaj został już rozpoczęty.");
            }
          }}
          className={tournamentStarted ? "disabled-link" : ""}
        >
          {loading ? "Sprawdzanie..." : "Rozpocznij Turniej"}
        </Link>

        <Link to={!tournamentStarted ? "#" : "/tournament"}
          onClick={(e) => {
            if (!tournamentStarted) {
              e.preventDefault();
              alert("Turniej nie został jeszcze rozpoczęty.");
            }
          }}
          className={!tournamentStarted ? "disabled-link" : ""}
        >Przejdź do Turnieju</Link>

        <Link to="/changegroup">Zmień Grupę</Link>
      </div>
    </div>
  );
};

export default HomePage;
