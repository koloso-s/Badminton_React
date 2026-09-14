import axios from "axios";
import { useState, useEffect, Fragment } from "react";
import "../styles/Results.css";
import { Link } from "react-router-dom";

const Results = () => {
  const [group, setGroup] = useState("podstawowa");

  const [resultsPodstawowa, setResultsPodstawowa] = useState({});
  const [resultsZaawansowana, setResultsZaawansowana] = useState({});

  const [playersPodstawowa, setPlayersPodstawowa] = useState([]);
  const [playersZaawansowana, setPlayersZaawansowana] = useState([]);

  // ==========================================
  // PUNKTY ZA MIEJSCE
  // ==========================================

  const punkty = {
    1: 100,
    2: 95,
    3: 90,
    4: 85,
    5: 81,
    6: 77,
    7: 74,
    8: 70,
    9: 65,
    10: 60,
    11: 55,
    12: 50,
    13: 45,
    14: 41,
    15: 37,
    16: 34,
    17: 31,
    18: 28,
    19: 25,
    20: 23,
    21: 20,
    22: 18,
    23: 15,
    24: 12,
    25: 10,
    26: 8,
    27: 6,
    28: 4,
    29: 2,
    30: 1,
    31: 1,
    32: 1,
    33: 1,
    34: 1,
    35: 1,
    36: 1,
    37: 1,
    38: 1,
    39: 1,
    40: 1,
  };

  // ==========================================
  // POBIERANIE DANYCH
  // ==========================================

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [
          podstawowaResults,
          zaawansowanaResults,
          podstawowaPlayers,
          zaawansowanaPlayers,
        ] = await Promise.all([
          axios.get(
            "http://localhost:5000/api/results/podstawowa"
          ),
          axios.get(
            "http://localhost:5000/api/results/zaawansowana"
          ),
          axios.get(
            "http://localhost:5000/api/players/podstawowa"
          ),
          axios.get(
            "http://localhost:5000/api/players/zaawansowana"
          ),
        ]);

        setResultsPodstawowa(
          podstawowaResults.data || {}
        );

        setResultsZaawansowana(
          zaawansowanaResults.data || {}
        );

        setPlayersPodstawowa(
          podstawowaPlayers.data || []
        );

        setPlayersZaawansowana(
          zaawansowanaPlayers.data || []
        );
      } catch (error) {
        console.error(
          "Błąd podczas pobierania danych:",
          error
        );
      }
    };

    fetchData();
  }, []);

  // ==========================================
  // NORMALIZACJA GRUPY
  // ==========================================

  const normalizeGroup = (value) => {
    const normalized = String(value || "")
      .trim()
      .toLowerCase();

    if (
      normalized === "podstawowa" ||
      normalized === "zaawansowana"
    ) {
      return normalized;
    }

    return null;
  };

  // ==========================================
  // NORMALIZACJA DATY
  // ==========================================

  const getDateOnly = (date) => {
    if (!date) {
      return null;
    }

    return String(date).substring(0, 10);
  };

  // ==========================================
  // ŁĄCZENIE ZAWODNIKÓW Z OBU GRUP
  // ==========================================

  const allPlayersMap = new Map();

  const addPlayersToMap = (
    list,
    sourceGroup
  ) => {
    list.forEach((player) => {
      const playerId = Number(player.id);

      if (!Number.isFinite(playerId)) {
        return;
      }

      const normalizedPlayer = {
        ...player,

        grupa:
          normalizeGroup(player.grupa) ||
          sourceGroup,
      };

      const existing =
        allPlayersMap.get(playerId);

      if (!existing) {
        allPlayersMap.set(
          playerId,
          normalizedPlayer
        );

        return;
      }

      /*
        Jeżeli ten sam zawodnik występuje
        w obu endpointach, preferujemy rekord
        zawierający informację o zmianie grupy.
      */

      const existingChangeDate =
        getDateOnly(
          existing.group_change_date
        );

      const newChangeDate =
        getDateOnly(
          normalizedPlayer.group_change_date
        );

      if (
        newChangeDate &&
        !existingChangeDate
      ) {
        allPlayersMap.set(
          playerId,
          normalizedPlayer
        );

        return;
      }

      /*
        Jeśli oba rekordy mają datę zmiany,
        wybieramy ten z nowszą datą.
      */

      if (
        newChangeDate &&
        existingChangeDate &&
        newChangeDate >
        existingChangeDate
      ) {
        allPlayersMap.set(
          playerId,
          normalizedPlayer
        );
      }
    });
  };

  addPlayersToMap(
    playersPodstawowa,
    "podstawowa"
  );

  addPlayersToMap(
    playersZaawansowana,
    "zaawansowana"
  );

  // ==========================================
  // ZAWODNICY AKTUALNEJ GRUPY
  // ==========================================

  /*
    Zawodnik jest wyświetlany w tabeli
    swojej AKTUALNEJ grupy.

    Jego wcześniejsze wyniki mogą jednak
    pochodzić z poprzedniej grupy.
  */

  const playersData = Array.from(
    allPlayersMap.values()
  ).filter(
    (player) =>
      normalizeGroup(player.grupa) ===
      group
  );

  // ==========================================
  // WSZYSTKIE DATY TURNIEJÓW
  // ==========================================

  const dates = Array.from(
    new Set([
      ...Object.keys(resultsPodstawowa),
      ...Object.keys(resultsZaawansowana),
    ])
  )
    .map(getDateOnly)
    .filter(Boolean)
    .sort();

  // ==========================================
  // CZY ZAWODNIK ZMIENIŁ GRUPĘ
  // ==========================================

  const hasChangedGroup = (player) => {
    return Boolean(
      player.group_change_date
    );
  };

  // ==========================================
  // POPRZEDNIA GRUPA
  // ==========================================

  const getPreviousGroup = (
    currentGroup
  ) => {
    if (
      currentGroup === "podstawowa"
    ) {
      return "zaawansowana";
    }

    if (
      currentGroup === "zaawansowana"
    ) {
      return "podstawowa";
    }

    return null;
  };

  // ==========================================
  // GRUPA ZAWODNIKA W DANEJ DACIE
  // ==========================================

  /*
    group_change_date oznacza:

    PRZED datą zmiany:
    zawodnik należał do starej grupy.

    OD daty zmiany:
    zawodnik należy do aktualnej grupy.
  */

  const getPlayerGroupForDate = (
    player,
    date
  ) => {
    const currentGroup =
      normalizeGroup(player.grupa);

    if (!currentGroup) {
      return null;
    }

    /*
      Brak zmiany grupy.
    */

    if (!hasChangedGroup(player)) {
      return currentGroup;
    }

    const tournamentDate =
      getDateOnly(date);

    const changeDate =
      getDateOnly(
        player.group_change_date
      );

    if (
      !tournamentDate ||
      !changeDate
    ) {
      return currentGroup;
    }

    /*
      Przed zmianą był
      w poprzedniej grupie.
    */

    if (
      tournamentDate < changeDate
    ) {
      return getPreviousGroup(
        currentGroup
      );
    }

    /*
      Od dnia zmiany jest
      w aktualnej grupie.
    */

    return currentGroup;
  };

  // ==========================================
  // PODSTAWOWA -> ZAAWANSOWANA
  // ==========================================

  const movedFromBasicToAdvanced = (
    player
  ) => {
    const currentGroup =
      normalizeGroup(player.grupa);

    return (
      hasChangedGroup(player) &&
      currentGroup ===
      "zaawansowana"
    );
  };

  // ==========================================
  // CZY DZIELIĆ PUNKTY PRZEZ 2
  // ==========================================

  /*
    PODSTAWOWA -> ZAAWANSOWANA

    Punkty zdobyte PRZED zmianą,
    czyli jeszcze w podstawowej,
    są dzielone przez 2.

    Punkty zdobyte OD dnia zmiany
    w zaawansowanej są liczone normalnie.


    ZAAWANSOWANA -> PODSTAWOWA

    Wszystkie punkty są liczone normalnie.
  */

  const shouldHalvePoints = (
    player,
    date
  ) => {
    if (
      !movedFromBasicToAdvanced(
        player
      )
    ) {
      return false;
    }

    const tournamentDate =
      getDateOnly(date);

    const changeDate =
      getDateOnly(
        player.group_change_date
      );

    if (
      !tournamentDate ||
      !changeDate
    ) {
      return false;
    }

    return (
      tournamentDate < changeDate
    );
  };

  // ==========================================
  // POBIERANIE WYNIKÓW GRUPY
  // ==========================================

  const getResultsForDate = (
    playerGroup,
    date
  ) => {
    if (!playerGroup) {
      return [];
    }

    const dateKey =
      getDateOnly(date);

    if (!dateKey) {
      return [];
    }

    const results =
      playerGroup === "podstawowa"
        ? resultsPodstawowa
        : resultsZaawansowana;

    /*
      Standardowy klucz YYYY-MM-DD.
    */

    if (
      Array.isArray(
        results[dateKey]
      )
    ) {
      return results[dateKey];
    }

    /*
      Zabezpieczenie gdy backend zwraca
      np. pełną datę z godziną.
    */

    const matchingKey =
      Object.keys(results).find(
        (key) =>
          getDateOnly(key) ===
          dateKey
      );

    if (
      matchingKey &&
      Array.isArray(
        results[matchingKey]
      )
    ) {
      return results[
        matchingKey
      ];
    }

    return [];
  };

  // ==========================================
  // ZNAJDŹ WYNIK ZAWODNIKA
  // ==========================================

  const getResultFromGroup = (
    playerId,
    date,
    playerGroup
  ) => {
    const resultList =
      getResultsForDate(
        playerGroup,
        date
      );

    const numericPlayerId =
      Number(playerId);

    if (
      !Number.isFinite(
        numericPlayerId
      )
    ) {
      return null;
    }

    return (
      resultList.find((item) => {
        if (
          item.id === null ||
          item.id === undefined ||
          item.id === ""
        ) {
          return false;
        }

        return (
          Number(item.id) ===
          numericPlayerId
        );
      }) || null
    );
  };

  // ==========================================
  // OBLICZANIE PUNKTÓW
  // ==========================================

  const getPoints = (
    player,
    miejsce,
    date
  ) => {
    const place =
      Number(miejsce);

    if (
      !Number.isFinite(place)
    ) {
      return 0;
    }

    const normalPoints =
      punkty[place] || 0;

    /*
      Jeżeli zawodnik przeszedł:

      PODSTAWOWA -> ZAAWANSOWANA

      to wcześniejsze punkty
      z podstawowej liczymy jako 50%.
    */

    if (
      shouldHalvePoints(
        player,
        date
      )
    ) {
      return Math.round(normalPoints / 2);
    }

    return normalPoints;
  };

  // ==========================================
  // BUDOWANIE RANKINGU
  // ==========================================

  const players = playersData
    .map((player) => {
      const playerResults = {};

      /*
        Tutaj zapisujemy TYLKO turnieje,
        w których zawodnik faktycznie brał udział.

        Nieobecność nie daje 0 punktów
        i nie bierze udziału w wyborze
        najgorszego wyniku.
      */

      const playedTournaments = [];

      dates.forEach((date) => {
        /*
          Ustalamy grupę zawodnika
          w dniu turnieju.
        */

        const playerGroup =
          getPlayerGroupForDate(
            player,
            date
          );

        if (!playerGroup) {
          return;
        }

        /*
          Szukamy wyniku zawodnika
          dokładnie w grupie,
          w której wtedy był.
        */

        const result =
          getResultFromGroup(
            player.id,
            date,
            playerGroup
          );

        /*
          BRAK WYNIKU = NIEOBECNOŚĆ

          Nie dodajemy:
          - 0 punktów,
          - pustego wyniku,
          - nie traktujemy tego
            jako najgorszego meczu.
        */

        if (!result) {
          return;
        }

        const halved =
          shouldHalvePoints(
            player,
            date
          );

        const points =
          getPoints(
            player,
            result.miejsce,
            date
          );

        playedTournaments.push({
          date,

          miejsce:
            Number(
              result.miejsce
            ),

          punkty: points,

          grupa:
            playerGroup,

          halved,
        });
      });

      // ==========================================
      // WYBÓR NAJGORSZEGO MECZU
      // ==========================================

      /*
        Jeżeli zawodnik zagrał minimum
        2 turnieje, odrzucamy jeden
        najgorszy punktowo wynik.

        Jeżeli zagrał tylko 1 turniej,
        wynik jest liczony normalnie.
      */

      let worstTournamentIndex = -1;

      if (
        playedTournaments.length >= 2
      ) {
        let lowestPoints = Infinity;

        playedTournaments.forEach(
          (tournament, index) => {
            if (
              tournament.punkty <
              lowestPoints
            ) {
              lowestPoints =
                tournament.punkty;

              worstTournamentIndex =
                index;
            }
          }
        );
      }

      // ==========================================
      // SUMOWANIE WYNIKÓW
      // ==========================================

      let totalPoints = 0;

      playedTournaments.forEach(
        (tournament, index) => {
          const excluded =
            index ===
            worstTournamentIndex;

          /*
            Wynik najgorszego meczu nadal
            wyświetlamy w tabeli.

            Dostaje tylko znacznik excluded,
            żeby nie został dodany do sumy.
          */

          playerResults[
            tournament.date
          ] = {
            miejsce:
              tournament.miejsce,

            punkty:
              tournament.punkty,

            grupa:
              tournament.grupa,

            halved:
              tournament.halved,

            excluded,
          };

          /*
            Najgorszego meczu
            nie dodajemy do wyniku ogólnego.
          */

          if (!excluded) {
            totalPoints +=
              tournament.punkty;
          }
        }
      );

      return {
        ...player,

        results:
          playerResults,

        totalPoints,
      };
    })

    // ==========================================
    // SORTOWANIE RANKINGU
    // ==========================================

    .sort((a, b) => {
      if (
        b.totalPoints !==
        a.totalPoints
      ) {
        return (
          b.totalPoints -
          a.totalPoints
        );
      }

      /*
        Przy takiej samej liczbie punktów
        niższe ID jest wyżej.
      */

      return (
        Number(a.id) -
        Number(b.id)
      );
    });

  // ==========================================
  // RENDER
  // ==========================================

  return (
    <div className="results">

      {/* ======================================
          NAGŁÓWEK
      ====================================== */}

      <div className="tournament-header">

        <h1>
          Grupa{" "}
          {group === "podstawowa"
            ? "Podstawowa"
            : "Zaawansowana"}
        </h1>

        <div className="tournament-buttons">

          <button
            className={
              group === "podstawowa"
                ? "active"
                : ""
            }
            onClick={() =>
              setGroup("podstawowa")
            }
          >
            Grupa Podstawowa
          </button>

          <button
            className={
              group === "zaawansowana"
                ? "active"
                : ""
            }
            onClick={() =>
              setGroup("zaawansowana")
            }
          >
            Grupa Zaawansowana
          </button>

        </div>

        <Link to="/" className="back-link" style={{ margin: "1.4rem" }}>← Powrót do strony głównej</Link>
      </div>

      {/* ======================================
          TABELA
      ====================================== */}

      <div className="results-table-wrapper">

        <table className="results-table">

          <thead>

            <tr>

              <th
                className="place-column"
                rowSpan="2"
              >
                #
              </th>

              <th
                className="player-column"
                rowSpan="2"
              >
                Zawodnik
              </th>

              <th
                className="points-column"
                rowSpan="2"
              >
                Punkty
              </th>

              {dates.map((date) => (
                <th
                  key={date}
                  className="date-header"
                  colSpan="2"
                >
                  {date}
                </th>
              ))}

            </tr>

            <tr>

              {dates.map((date) => (
                <Fragment key={date}>

                  <th className="place-column">
                    Miejsce
                  </th>

                  <th className="points-column">
                    Pkt.
                  </th>

                </Fragment>
              ))}

            </tr>

          </thead>

          <tbody>

            {players.length > 0 ? (

              players.map(
                (player, index) => {
                  const changed =
                    hasChangedGroup(
                      player
                    );

                  const currentGroup =
                    normalizeGroup(
                      player.grupa
                    );

                  return (
                    <tr
                      key={player.id}
                      className={
                        changed
                          ? "player-changed-group"
                          : ""
                      }
                    >

                      {/* POZYCJA */}

                      <td className="position">
                        {index + 1}
                      </td>

                      {/* ZAWODNIK */}

                      <td className="player-name">

                        {player.fname}{" "}
                        {player.lname}

                        {changed && (
                          <span
                            className="group-change"
                            title={
                              currentGroup ===
                                "zaawansowana"
                                ? `Zmiana: Podstawowa → Zaawansowana od ${getDateOnly(
                                  player.group_change_date
                                )}`
                                : `Zmiana: Zaawansowana → Podstawowa od ${getDateOnly(
                                  player.group_change_date
                                )}`
                            }
                          >
                            {" "}
                            🔄
                          </span>
                        )}

                      </td>

                      {/* SUMA PUNKTÓW */}

                      <td className="total-points">
                        {player.totalPoints}
                      </td>

                      {/* POSZCZEGÓLNE TURNIEJE */}

                      {dates.map((date) => {
                        const result =
                          player.results[
                          date
                          ];

                        return (
                          <Fragment
                            key={date}
                          >

                            {/* MIEJSCE */}

                            <td className="place">

                              {result ? (
                                <span
                                  style={
                                    result.excluded
                                      ? {
                                        textDecoration:
                                          "line-through",
                                        opacity: 0.55,
                                      }
                                      : {}
                                  }
                                >
                                  {
                                    result.miejsce
                                  }
                                </span>
                              ) : (
                                ""
                              )}

                            </td>

                            {/* PUNKTY */}

                            <td
                              className="place-points"
                              title={
                                result?.excluded
                                  ? "Najgorszy rozegrany wynik — nie jest liczony do wyniku ogólnego"
                                  : result?.halved
                                    ? "50% wcześniejszych punktów z grupy podstawowej po przejściu do zaawansowanej"
                                    : ""
                              }
                            >

                              {result ? (
                                <>

                                  <span
                                    style={
                                      result.excluded
                                        ? {
                                          textDecoration:
                                            "line-through",
                                          opacity: 0.55,
                                        }
                                        : {}
                                    }
                                  >
                                    {
                                      result.punkty
                                    }
                                  </span>

                                  {/* 50% PUNKTÓW */}

                                  {result.halved && (
                                    <span
                                      className="halved-points"
                                      title="Punkty zostały podzielone przez 2"
                                    >
                                      *
                                    </span>
                                  )}

                                  {/* NAJGORSZY MECZ */}

                                  {result.excluded && (
                                    <span
                                      className="excluded-result"
                                      style={{
                                        marginLeft:
                                          "5px",
                                      }}
                                      title="Ten wynik nie jest liczony do klasyfikacji generalnej"
                                    >
                                      ✕
                                    </span>
                                  )}

                                </>
                              ) : (
                                ""
                              )}

                            </td>

                          </Fragment>
                        );
                      })}

                    </tr>
                  );
                }
              )

            ) : (

              <tr>

                <td
                  colSpan={
                    dates.length * 2 +
                    3
                  }
                  className="no-results"
                >
                  Brak wyników
                </td>

              </tr>

            )}

          </tbody>

        </table>

      </div>

      {/* ======================================
          LEGENDA
      ====================================== */}

      <div className="results-legend">

        <div>
          🔄 Zawodnik zmienił grupę
        </div>

        <div>
          * 50% wcześniejszych punktów z grupy podstawowej po przejściu do grupy zaawansowanej
        </div>

        <div>
          ✕ Najgorszy rozegrany wynik zawodnika nie jest liczony do wyniku ogólnego
        </div>

        <div>
          Brak udziału w turnieju nie daje 0 punktów i nie jest liczony jako najgorszy wynik
        </div>

      </div>

    </div>
  );
};

export default Results;