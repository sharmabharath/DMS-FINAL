var logbtn =document.getElementById('btn-logn');
logbtn.addEventListener("click",function(){

//window.open("dashboard.html");
if ( (document.getElementById('uname').value)== "admin" && (document.getElementById('pwd').value) == "1234") {
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

var cancel =document.getElementById('cnl');
cancel.addEventListener("click",function(){
//yaha 

window.open("indexx.html","_self");
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

var srch =document.getElementById('srch');
srch.addEventListener("click",function(){
//yaha 

alert("PLEASE LOGIN TO ACCESS REPORT");
})

