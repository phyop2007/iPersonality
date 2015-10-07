<!--BE Work -->
<cfif structKeyExists(form,'fieldNames')>
	<cfset local.getpersonalityCatQuery = application.personalityService.savepersonalityCat(fStruct = form)>
</cfif>
<cfset local.getpersonalityCatQuery = application.personalityService.getpersonalityCat()>
<form class="pure-form" id="personality_cat_form" name="personality_cat_form" method="post">
	<fieldset class="custom-fieldset">
	    <legend class="custom-legend">Personality Categories</legend>
	    <cfoutput query="local.getpersonalityCatQuery">
	    	<div class="box">
	    		 <input type="text" 
	    		 	name="personality_cat_name_#local.getpersonalityCatQuery.personality_cat_id#" 
	    		 	id = "personality_cat_name_#local.getpersonalityCatQuery.personality_cat_id#" 
	    		 	placeholder="Personality Category Name" 
	    		 	value="#local.getpersonalityCatQuery.personality_cat_name#"
	    		 >
		    	 
		    	 <input type="text" class="long"
		    	 	name="personality_cat_desc_#local.getpersonalityCatQuery.personality_cat_id#" 
		    	 	id="personality_cat_desc_#local.getpersonalityCatQuery.personality_cat_id#" 
		    	 	placeholder="Personality Category Description" 
		    	 	value="#local.getpersonalityCatQuery.personality_cat_description#"
		    	 >
		    	 
		    	 <a href="index.cfm?p_action=per_detail&per_cat_id=#local.getpersonalityCatQuery.personality_cat_id#"> Details </a>
	    	</div>
	    </cfoutput>
		<cfoutput>
			<div class="cloneBox box">
			    <input type="text" 
			    	name="personality_cat_name_new_0" 
			    	id="personality_cat_name_new_0" 
			    	placeholder="Personality Category Name"
			    >
			    <input type="text" 
			    	name="personality_cat_desc_new_0" 
			    	id="personality_cat_name_new_0" 
			    	class="long" 
			    	placeholder="Personality Category Description"
			    >
		    </div>
	   
	    </cfoutput>
	</fieldset>
</form>

<div class="box">
	<button class="pure-button pure-button-primary" id="cloneButton" name="cloneButton">Add</button>
	<button class="pure-button " id="reset" name="reset">Reset</button>
	<button class="pure-button pure-button-primary" id="save" name="save" data-link='personality_save'>Save All</button>
</div>
