<!DOCTYPE HTML>
<cfif structKeyExists(url,'showDebug')>
	<cfset client.showDebug = url.showDebug>	
</cfif>

<cfif structKeyExists(client,'showDebug')>
	<cfif client.showDebug>
		<cfsetting showdebugoutput="true">
	<cfelse>
		<cfsetting showdebugoutput="false">
	</cfif>
</cfif>
<html>
	<head>
		<title>iPersonality</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="../assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
		<cfinclude template="header.cfm">
		<cfinclude template="main.cfm">
		<cfinclude template="footer.cfm">
		<cfinclude template="js.cfm">
	</body>
</html>