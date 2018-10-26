function myFunction(){

document.getElementById("hoover1").innerHTML = "Hello world";

}

document.getElementById("hoover1").addEventListener("click", function(){document.getElementById("hoover1").innerHTML="Hello World";});

document.getElementById("hoover1").addEventListener("mouseover", function(){document.getElementById("hoover1").innerHTML="Goodbye World";});


// document.getElementById("hoover1").addEventListener("click", function(){ alert("Hello World!"); });
