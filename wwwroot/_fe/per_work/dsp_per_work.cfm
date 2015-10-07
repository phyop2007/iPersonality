<!--- FE --->
<cfset local.getAllPersonalityQuery = application.personalityService.getAllPersonality()>
<section id="two" class="main style2 left dark fullscreen">
	<div class="content box style2">
		<header>
			<h2>Dream Jobs for ME</h2>
		</header>
		<form name="frm_per_job_result" id="frm_per_job_result">
			<cfoutput query="local.getAllPersonalityQuery" group="personality_cat_id">
				<div class="row per_entry">
					<div class="6u 12u(mobile)">
						#local.getAllPersonalityQuery.personality_cat_name#
					</div>
					
					<div class="6u 12u(mobile)">
						<select name="cat_#local.getAllPersonalityQuery.personality_cat_id#" placeholder="Your Personality Type">
							<option value="0"> Select Personality Type </option>
							<cfoutput>
								<option value="#local.getAllPersonalityQuery.personality_id#">#local.getAllPersonalityQuery.personality_name#</option>
							</cfoutput>	
						</select>
					</div>	
					
				</div>
			</cfoutput>
			<div class="row per_entry">
				<div class="6u 12u(mobile)">
					<input type="button" id="show_per_result" name="show_per_result" value="Show Dream Jobs" />
				</div>
			</div>
		</form>	
		<div class="per_result">
			<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.
			Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis arcu,
			id varius justo euismod in. Curabitur egestas consectetur magna.</p>
		</div>
	</div>
	<a href="index.cfm?p_action=contact" class="button style2 down anchored">Next</a>
</section>