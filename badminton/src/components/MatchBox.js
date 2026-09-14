import "../styles/MatchBox.css";
import { useRef } from "react";

const MatchBox = ({
  p1_fname,
  p1_lname,
  p2_fname,
  p2_lname,
  onClick,
  onDoubleClick,
  background,
}) => {
  const clickTimeout = useRef(null);

  return (
    <div
      className="match-box"
      onClick={() => {
        if (clickTimeout.current) {
          clearTimeout(clickTimeout.current);
        }

        clickTimeout.current = setTimeout(() => {
          onClick();
          clickTimeout.current = null;
        }, 300);
      }}
      onDoubleClick={() => {
        if (clickTimeout.current) {
          clearTimeout(clickTimeout.current);
          clickTimeout.current = null;
        }

        onDoubleClick();
      }}
      style={{ background, margin: "7px" }}
    >
      <p>
        {p1_fname} {p1_lname}
      </p>
      <p>
        {p2_fname} {p2_lname}
      </p>
    </div>
  );
};

export const FinalMatchBox = ({ p_fname, p_lname, place }) => {
  return (
    <div
      className="match-box"
      style={{
        backgroundColor:
          p_fname === "" && p_lname === "" ? "#ffffffff" : "#4CAF50",
        margin: "7px",
      }}
    >
      <p>Miejsce: {place}</p>
      <p>
        {p_fname} {p_lname}
      </p>
    </div>
  );
};

export default MatchBox;
