import React from "react";
import ReactDOM from "react-dom/client"; // Update this import
import App from "./App";
import "./styles/global.scss";

// Create a root container
const root = ReactDOM.createRoot(document.getElementById("root"));

// Render the app
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
