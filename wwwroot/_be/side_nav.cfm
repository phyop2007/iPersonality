<cfset local.beMenu = application.menuService.getBeMenu()>
<div class="wrapper">
  <nav class="vertical">
    <ul>
		<cfoutput query="local.beMenu" group="menu_group_id">
	      <li>
	        <a href="#local.beMenu.menu_group_link#" title="#local.beMenu.menu_group_description#">#local.beMenu.menu_group_name#</a>
	        <div>
	          <ul>
				<cfoutput>
		            <li><a href="#local.beMenu.menu_link#" title="#local.beMenu.menu_description#">#local.beMenu.menu_name#</a></li>
				</cfoutput>
	          </ul>
	        </div>
	      </li>
		</cfoutput>
    </ul>
  </nav>
  <p><em>@iPersonality</em></p>
</div>