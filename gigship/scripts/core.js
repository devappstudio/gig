function _(x){
	return document.getElementById(x);
}
function __(x){
	return document.getElementsByClassName(x);
}
function ajaxObject(){
	var xmlHttp;
	if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}else if(window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else{
		xmlHttp = false;
	}
	
	return xmlHttp;
}
function ajaxObj(meth, url){
	var x = ajaxObject();
	if(x.readyState == 0 || x.readyState == 4){
		x.open(meth, url, true);
		//x.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	}else{
		var time = setTimeout('ajaxObj', 1000)
	}
	clearTimeout(time);
	return x;
}