<!-- Header -->
<header id="header">

	<!-- Logo -->
		<h1 id="logo">iPersonality</h1>
		<cfset local.fe_menu_query = application.menuService.getFeMenu()>
	<!-- Nav -->
		<nav id="nav">
			<ul>
				<cfoutput query ="local.fe_menu_query">
					<li>
						<a href="#local.fe_menu_query.menu_link#" id="fe_menu_#local.fe_menu_query.menu_id#" title="#local.fe_menu_query.menu_description#">
							#local.fe_menu_query.menu_name#
						</a>
					</li>
				</cfoutput>
			</ul>
		</nav>

</header>