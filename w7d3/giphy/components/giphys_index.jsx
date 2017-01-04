import React, { Component } from 'react';

const GiphysIndex = ({giphys}) => (
  <ul>
    { giphys.map( (gif, idx) => {
      return <li key={idx} className="giphy-li">
        <img src={gif.images.fixed_height.url}/>
      </li>;
    })}
  </ul>
);

export default GiphysIndex;
