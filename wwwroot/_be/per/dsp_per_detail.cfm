<!--BE Work -->
<cfparam name="url.per_cat_id" default="0">

<cfif structKeyExists(form,'fieldNames')>
	<cfset local.getpersonalityQuery = application.personalityService.savepersonality(fStruct = form, categoryId = form.personality_cat_id)>
</cfif>
<cfset local.getpersonalityCatQuery = application.personalityService.getpersonalityCat(categoryId=val(url.per_cat_id))>
<cfset local.getpersonalityQuery = application.personalityService.getpersonality(categoryId=val(url.per_cat_id))>
<cfset local.perCatName = local.getpersonalityCatQuery.personality_cat_name >

<form class="pure-form" id="personality_cat_form" name="personality_cat_form" method="post">
	<fieldset class="custom-fieldset">
	    <legend class="custom-legend"><cfoutput>Personality Detials for #local.perCatName#</cfoutput></legend>
	    <cfoutput query="local.getpersonalityQuery">
	    	<div class="box">
	    		 <input type="text" 
	    		 	name="personality_name_#local.getpersonalityQuery.personality_id#" 
	    		 	id = "personality_name_#local.getpersonalityQuery.personality_id#" 
	    		 	placeholder="Personality Name for #local.perCatName#" 
	    		 	value="#local.getpersonalityQuery.personality_name#"
	    		 >
		    	 
		    	 <input type="text" class="long"
		    	 	name="personality_desc_#local.getpersonalityQuery.personality_id#" 
		    	 	id="personality_desc_#local.getpersonalityQuery.personality_id#" 
		    	 	placeholder="Personality Description for #local.perCatName#" 
		    	 	value="#local.getpersonalityQuery.personality_description#"
		    	 >
		    	  <a href="index.cfm?p_action=per_work_detail&per_cat_id=#local.getpersonalityQuery.personality_cat_id#&per_id=#local.getpersonalityQuery.personality_id#"> Details </a>
	    	</div>
	    </cfoutput>
		<cfoutput>
			<div class="cloneBox box">
			    <input type="text" 
			    	name="personality_name_new_0" 
			    	id="personality_name_new_0" 
			    	placeholder="Personality Name for #local.perCatName#"
			    >
			    <input type="text" 
			    	name="personality_desc_new_0" 
			    	id="personality_name_new_0" 
			    	class="long" 
			    	placeholder="Personality Description for #local.perCatName# "
			    >
		    </div>
	    </cfoutput>
	    <cfoutput>
	    	<input type="hidden" name="personality_cat_id" id="personality_cat_id" value="#url.per_cat_id#">
	    </cfoutput>
	</fieldset>
</form>

<div class="box">
	<button class="pure-button pure-button-primary" id="cloneButton" name="cloneButton">Add</button>
	<button class="pure-button " id="reset" name="reset">Reset</button>
	<button class="pure-button pure-button-primary" id="save" name="save" data-link='personality_save'>Save All</button>
</div>
