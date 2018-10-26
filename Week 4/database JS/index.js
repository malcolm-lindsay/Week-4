function getData() {
  var oReq = new XMLHttpRequest();
  oReq.open("GET", localhost:8080/cinema-app2/api/movie/getAllMovies, false);
  oReq.send();
  console.log(oReq.response());

}

function reqListener () {
  console.log(this.responseText);
}


oReq.send();
function removeData() {

}

function addData() {

}
