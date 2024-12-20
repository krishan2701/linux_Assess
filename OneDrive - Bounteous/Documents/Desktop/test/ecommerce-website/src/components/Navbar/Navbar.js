import React, { useState } from "react";
import "./Navbar.scss";

const Navbar = () => {
  const [dropdown, setDropdown] = useState(null);

  const categories = {
    Mobiles: ["Samsung", "Apple", "OnePlus"],
    Laptops: ["Dell", "HP", "Lenovo"],
    Televisions: ["Sony", "LG", "Samsung"],
  };

  const handleMouseEnter = (category) => setDropdown(category);
  const handleMouseLeave = () => setDropdown(null);

  return (
    <nav className="navbar">
      <ul className="navbar__list">
        {Object.keys(categories).map((category) => (
          <li
            key={category}
            className="navbar__item"
            onMouseEnter={() => handleMouseEnter(category)}
            onMouseLeave={handleMouseLeave}
          >
            {category}
            {dropdown === category && (
              <ul className="dropdown">
                {categories[category].map((brand) => (
                  <li key={brand} className="dropdown__item">
                    {brand}
                  </li>
                ))}
              </ul>
            )}
          </li>
        ))}
      </ul>
    </nav>
  );
};

export default Navbar;
