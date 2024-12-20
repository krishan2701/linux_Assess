import React from "react";
import Navbar from "./components/Navbar/Navbar";
import "./styles/global.scss";

const App = () => {
  return (
    <div>
      <Navbar />
      <main>
        <h1>Welcome to the E-Commerce Website</h1>
      </main>
    </div>
  );
};

export default App;
