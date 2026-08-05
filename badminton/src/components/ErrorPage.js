import { Link } from "react-router-dom";

const ErrorPage = () => {
    return (
        <>
            <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                <h1 style={{ backgroundColor: "#f5f5f5" }}>404 - Strona nie znaleziona</h1>
            </div>
            <Link to="/" className="back-link" style={{ margin: "1.4rem" }}>← Powrót do strony głównej</Link>

        </>
    );
};

export default ErrorPage;