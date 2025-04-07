import logo from "./logo.svg";
import "./App.css";

function App() {
  // Adding console log outside of JSX
  console.log(process.env.REACT_APP_EXAMPLE);
  
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit feat4 demo changes <code>src/App.js</code> and save to reload.
          <br />
          Environment variable: {process.env.REACT_APP_EXAMPLE || "Not defined"}
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
