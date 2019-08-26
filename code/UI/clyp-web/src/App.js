import React, {Component} from 'react';
import {BrowserRouter} from 'react-router-dom'
import logo from './logo.svg';
import './App.css';

class App extends Component {
  
 render() {
    return (
      <BrowserRouter>
      <div className="App">
        {/* <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header> */}
        <h1>Murali Mohan</h1>
      </div>
      </BrowserRouter>
    );
  }
}
export default App;
