var logbtn =document.getElementById('lgn');
logbtn.addEventListener("click",function(){

//window.open("dashboard.html");
if ( (document.getElementById('uid').value)== "admin" && (document.getElementById('pid').value) == "1234") {
window.open("dashboard.html");
}
else
{
	alert("wrong credentials!!!");
}
//console.log(" login pe clicking");
})
var logbtn =document.getElementById('fgt');
logbtn.addEventListener("click",function(){
//yaha 

alert("needs database");
})


var bcgbtn =document.getElementById('drk');
var i =0;
bcgbtn.addEventListener("click",function(){

i++;
if (i==5) {
window.open("credits.html");
}


//console.log(" login pe clicking");
})
var dashbrd =document.getElementById('dash');
dashbrd.addEventListener("click",function(){


alert(" PLEASE LOGIN TO ACCESS DASHBOARD");
})


var sett =document.getElementById('set');
sett.addEventListener("click",function(){


alert("PLEASE LOGIN TO ACCESS SETTINGS");
})

var actt =document.getElementById('act');
actt.addEventListener("click",function(){
//yaha 

alert("PLEASE LOGIN TO ACCESS ACTIVITY");
})

var rept =document.getElementById('rep');
rept.addEventListener("click",function(){
//yaha 

alert("PLEASE LOGIN TO ACCESS REPORT");
})




var dark = document.getElementById("drk");
dark.addEventListener("click", function setBcg() {
  document.body.style.backgroundColor = "#282828";
});

var ligt = document.getElementById("lgt");
ligt.addEventListener("click", function setBcg() {
  document.body.style.backgroundColor = "white";
});


var srch =document.getElementById('srch');
srch.addEventListener("click",function(){
//yaha 

alert("PLEASE LOGIN TO ACCESS REPORT");
})

