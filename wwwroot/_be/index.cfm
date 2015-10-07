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
		<link rel="stylesheet" href="../assets/css/be.css" />
		<link rel="stylesheet" href="../assets/css/pure-release-0.6.0/pure-min.css" />
		
	</head>
	<body>
		<cfinclude template="side_nav.cfm">
		<div class="main">
		  <cfinclude template="main.cfm">
		</div>  
		<cfinclude template="js.cfm">
	</body>
</html>