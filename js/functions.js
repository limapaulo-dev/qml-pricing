.pragma library
.import "prices.js" as Prices

function fCrescemte(a,b) {
    return a - b;
}

function fDecrescente(a,b) {
    return a - b;
}

function fArrayCrescemte(a,b) {
    return a[0]-b[0]
}

function fArrayDecrescente(a,b) {
    return b[0]-a[0]
}

function twoDecimals(number) {
    return (number < 10 ? '0' : '') + number
}


function logArrayElements(element, index, array) {
    console.log("a[" + index + "] = " + element)
}

function logSimpleArrayElements(element) {
    console.log(element)
}

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
}

function capitalizeWords(str) {
   var splitStr = str.toLowerCase().split(' ');
   for (var i = 0; i < splitStr.length; i++) {
       // You do not need to check if i is larger than splitStr length, as your for does that for you
       // Assign it back to the array
       splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);
   }
   // Directly return the joined string
   return splitStr.join(' ');
}
