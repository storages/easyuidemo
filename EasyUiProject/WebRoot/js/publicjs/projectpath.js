function getPath() {
		var currPath = window.document.location.href;
		var currName = window.document.location.pathname;
		var pos = currPath.indexOf(currName);
		var localhostPath = currPath.substring(0, pos);
		var projectName = currName.substring(0,currName.substr(1).indexOf("/") + 1);
		return (localhostPath + projectName);
}