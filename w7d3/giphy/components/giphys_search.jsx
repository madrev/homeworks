import React, { Component } from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  render() {
    return <div>
      <form className="search-bar">
        <input type="text" onChange={this.handleChange} value={this.state.searchTerm}></input>
        <button onClick={this.handleSubmit}>Search</button>
      </form>
      <GiphysIndex giphys={this.props.giphys}/>
    </div>;
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    this.setState({ searchTerm:""});
  }
  //
  handleChange(e) {
    this.setState({ searchTerm:e.target.value});
  }



}

export default GiphysSearch;
