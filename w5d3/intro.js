function madLib(verb, adjective, noun) {
  return `we shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}!`
};

function isSubstring(searchString, subString) {
  if(searchString.indexOf(subString) === -1) {
    return false;
  } else {
    return true;
  };
};

function fizzBuzz(array) {
  var result = [];
  array.forEach(function(el) {
    if((el % 3 ===0 || el % 5 === 0) && el % 15 !== 0) {
      result.push(el);
    };
  });
  return result;
};

function isPrime(n) {
  if(n === 2) {
    return true;
  };
  for(i = 2; i < n; i++) {
    if(n % i === 0){
      return false;
    };
  };
  return false;
};

function sumOfNPrimes(n) {
  var result = [];
  var i = 2;
  while(result.length < n) {
    if(isPrime(i)){
      result.push(i);
      i++;
    };
  };
};

function celebrityName (firstName) {
    var nameIntro = "This celebrity is ";
   function lastName (theLastName) {
        return nameIntro + firstName + " " + theLastName;
    }
    return lastName;
}
​
​var mjName = celebrityName ("Michael");
