<cfif structKeyExists(form,'fieldNames')>
	<cfset local.getJobCatQuery = application.jobService.linkJobAndPersonality(fStruct = form)>
</cfif>
<cfset local.pQuery = application.personalityService.getpersonality(categoryId = url.per_cat_id, personalityId = url.per_id)>
<h1 class="custom-h1">
	<cfoutput>
	 Matching Jobs for  
		 <a class="white-link" href="index.cfm?p_action=per_detail&per_cat_id=#local.pQuery.personality_cat_id#" title="#local.pQuery.personality_cat_description#">
		 	#local.pQuery.personality_name# 
		 </a>	
	 	(From: 
	 		<a class="white-link" href="index.cfm?p_action=per_detail&per_cat_id=#local.pQuery.personality_cat_id#" title="#local.pQuery.personality_cat_description#">
	 			#local.pQuery.personality_cat_name# 
	 		</a>
	 	) 
	 </cfoutput>
</h1>

<cfset local.jobQuery = application.jobService.getJobCatWithPersonality(perCatId = local.pQuery.personality_cat_id , perId = local.pQuery.personality_id )>
<form class="pure-form" id="per_job_form" name="per_job_form" method="post">
	<div class="pure-g">
		<cfoutput query="local.jobQuery">
			<cfsavecontent variable="job_radio">
				<div class="pure-u-1-3 box"> 
					<label for="cat_#local.pQuery.personality_cat_id#_per_#local.pQuery.personality_id#_job_#local.jobQuery.job_cat_id#">
					 	<input type="checkbox" name="cat_#local.pQuery.personality_cat_id#_per_#local.pQuery.personality_id#_job_#local.jobQuery.job_cat_id#" 
					 		id="cat_#local.pQuery.personality_cat_id#_per_#local.pQuery.personality_id#_job_#local.jobQuery.job_cat_id#" 
					 		value="#local.jobQuery.job_cat_id#"
					 		<cfif local.jobQuery.personality_cat_id eq local.pQuery.personality_cat_id> checked </cfif>
					 	> 
					 	#local.jobQuery.job_cat_name#
					 </label>	
				</div>
			</cfsavecontent>
			
			<!--- display on page --->
			<cfif local.jobQuery.currentRow % 3 eq 1>
		    	#job_radio#
		    <cfelseif local.jobQuery.currentRow % 3 eq 2>
	    		#job_radio#
		    <cfelse>
	    		#job_radio#
			</cfif>
		</cfoutput>
	</div>
	<cfoutput>
		<input type="hidden" name="perCatId" id="perCatId" value = "#local.pQuery.personality_cat_id#">
		<input type="hidden" name="perId" id="perId" value = "#local.pQuery.personality_id#">
	</cfoutput>
</form>
<div class="box">
	<button class="pure-button " id="reset" name="reset">Reset</button>
	<button class="pure-button pure-button-primary" id="save" name="save" data-link='per_job_save'>Save All</button>
	<a class="pure-button" id="back" name="back" href="index.cfm?p_action=per_work">Back</a>
</div>