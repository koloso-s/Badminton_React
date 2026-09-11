import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import HomePage from "./components/HomePage";
import ErrorPage from "./components/ErrorPage";
import StartTournament from "./components/StartTournament";
import Groups from "./components/Groups";
import Tournament from "./components/Tournament";
import MatchBox from "./components/MatchBox";
import "./App.css";
import Results from "./components/Results";
import ChangeGroup from "./components/ChangeGroup";

function App() {
  return (
    <Router>
      <div className="App">
        <h1>Turniej Badmintona Gwoźnica Górna 2026/2027</h1>
        <Routes className="App-routes">
          <Route path="/" element={<HomePage />} />
          <Route path="*" element={<ErrorPage />} />
          <Route path="/starttournament" element={<StartTournament />} />
          <Route path="/group/:group" element={<Groups />} />
          <Route path="/tournament" element={<Tournament show={false} />} />
          <Route path="/tournament/show" element={<Tournament show={true} />} />
          <Route path="/showresults" element={<Results />} />
          <Route path="/changegroup" element={<ChangeGroup />} />
          <Route
            path="/matchbox"
            element={
              <MatchBox
                p1_fname="Adam"
                p1_lname="Nowak"
                p2_fname="Jan"
                p2_lname="Kowalski"
              />
            }
          />
        </Routes>
        <div className="home-page-footer">
          <p>Gwoźnica Górna 2026/2027 Turniej Badmintona Zarych Krystian</p>
        </div>
      </div>
    </Router>
  );
}

export default App;
