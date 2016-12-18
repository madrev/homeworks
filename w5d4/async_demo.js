// window.setTimeout(function() {
//   alert('HAMMERTIME');
// }, 5000);
//
// let hammerTime = function(time) {
//   window.setTimeout(function() {
//     alert(`${time} is hammertime!`);
//   }, 5000);
// };
//
// hammerTime("now");

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let teaResponse, biscuitsResponse;

const teaAndBiscuits = function(){
  reader.question("Would you like tea?", function(res){
    teaResponse = res;
    console.log(`You replied ${res}`);
    reader.question("Would you like biscuits?", function(res){
      biscuitsResponse = res;
      console.log(`You replied ${res}`);

      const firstRes = (teaResponse === 'yes') ? 'do' : 'don\'t';
      const secondRes = (biscuitsResponse === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
};

teaAndBiscuits();
