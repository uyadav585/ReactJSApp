import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';


// Creating a root element for rendering the React application
const root = ReactDOM.createRoot(document.getElementById('root'));


// Rendering the App component within React.StrictMode for highlighting potential problems
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);