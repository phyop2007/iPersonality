<!--- BE --->
<cfset local.getpersonalityCatQuery = application.personalityService.getpersonalityCat()>
<h1 class="custom-h1"> Personality List </h1>
<div class="box"><span>*</span>Please choose one of the personality detail to map the jobs. </div>
<div class="pure-g">
	<div class="pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
		<cfoutput query="local.getpersonalityCatQuery">
	     <div class="1-box">
	         <h2>
		         <a class="heading-link" href="index.cfm?p_action=per_detail&per_cat_id=#local.getpersonalityCatQuery.personality_cat_id#" title="#local.getpersonalityCatQuery.personality_cat_description#">
		         	#local.getpersonalityCatQuery.personality_cat_name#
		         </a>
			 </h2>
	         <p>
		         <cfset local.getpersonalityQuery = application.personalityService.getpersonality(categoryId = local.getpersonalityCatQuery.personality_cat_id)>
		         <cfloop query="local.getpersonalityQuery">
		         <ul>
		         	<li>
			         	<a class="pad-link" href="index.cfm?p_action=per_work_detail&per_cat_id=#local.getpersonalityCatQuery.personality_cat_id#&per_id=#local.getpersonalityQuery.personality_id#" title="#local.getpersonalityQuery.personality_description#">
			         		#local.getpersonalityQuery.personality_name#
						</a>
					</li>
		         </ul>
		         </cfloop>
	         </p>
	     </div>
	     </cfoutput>
	 </div>
</div>
 
