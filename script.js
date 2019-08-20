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


