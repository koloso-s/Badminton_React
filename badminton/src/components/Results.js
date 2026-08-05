import axios from "axios";
import React, { useState, useEffect } from "react";
const Results = () => {
  const [group, setGroup] = useState("podstawowa");
  const [results, setResults] = useState([]);

  const fetchResults = async (selectedGroup) => {
    try {
      const response = await axios.get(
        `http://localhost:5000/api/results/${selectedGroup}`,
      );
      setResults(response.data);
    } catch (err) {
      console.error("Error fetching tournament players:", err);
    }
  };
  useEffect(() => {
    fetchResults(group);
  }, []);
  useEffect(() => {
    fetchResults(group);
    console.log(results);
  }, [group]);

  return (
    <div className="results">
      <div className="tournament-header">
        <h1>Grupa {group}</h1>
        <div style={{ marginBottom: "1rem" }} className="tournament-buttons">
          <button onClick={() => setGroup("podstawowa")}>
            Grupa Podstawowa
          </button>
          <button onClick={() => setGroup("zaawansowana")}>
            Grupa Zaawansowana
          </button>
        </div>
      </div>
      <table>
        <thead>
          <tr>
            <th>Gracz 1</th>
            <th>Gracz 2</th>
            <th>Wynik</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  );
};

export default Results;
