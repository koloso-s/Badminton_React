import { Link } from "react-router-dom";
import axios from 'axios';
import '../styles/StartTournament.css';

const StartTournament = () => {
    async function startTournament() {
        await axios.post('http://localhost:5000/api/tournament/start');
    }
    return (
        <div className="start-tournament">
            <h1>Rozpocznij Turniej</h1>
            <div className="groups">
                <Link to="/group/podstawowa">Grupa Podstawowa</Link>
                <Link to="/group/zaawansowana">Grupa Zaawansowana</Link>
            </div>
            <Link to="/tournament" className="start-tournament-button" onClick={startTournament}>Rozpocznij nowy turniej</Link>
            <Link to="/" className="back-link" style={{ margin: "1.4rem" }}>← Powrót do strony głównej</Link>
        </div>
    );
};

export default StartTournament;