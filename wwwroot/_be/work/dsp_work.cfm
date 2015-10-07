<!--BE Work -->
<cfif structKeyExists(form,'fieldNames')>
	<cfset local.getJobCatQuery = application.jobService.saveJobCat(fStruct = form)>
</cfif>
<cfset local.getJobCatQuery = application.jobService.getJobCat()>
<form class="pure-form" id="job_cat_form" name="job_cat_form" method="post">
	<fieldset class="custom-fieldset">
	    <legend class="custom-legend">Job Categories</legend>
	    <cfoutput query="local.getJobCatQuery">
	    	<div class="box">
	    		 <input type="text" 
	    		 	name="job_cat_name_#local.getJobCatQuery.job_cat_id#" 
	    		 	id = "job_cat_name_#local.getJobCatQuery.job_cat_id#" 
	    		 	placeholder="Job Category Name" 
	    		 	value="#local.getJobCatQuery.job_cat_name#"
	    		 >
		    	 
		    	 <input type="text" class="long"
		    	 	name="job_cat_desc_#local.getJobCatQuery.job_cat_id#" 
		    	 	id="job_cat_desc_#local.getJobCatQuery.job_cat_id#" 
		    	 	placeholder="Job Category Description" 
		    	 	value="#local.getJobCatQuery.job_cat_description#"
		    	 >
	    	</div>
	    </cfoutput>
		<cfoutput>
			<div class="cloneBox box">
			    <input type="text" 
			    	name="job_cat_name_new_0" 
			    	id="job_cat_name_new_0" 
			    	placeholder="Job Category Name"
			    >
			    <input type="text" 
			    	name="job_cat_desc_new_0" 
			    	id="job_cat_name_new_0" 
			    	class="long" 
			    	placeholder="Job Category Description"
			    >
		    </div>
	   
	    </cfoutput>
	</fieldset>
</form>

<div class="box">
	<button class="pure-button pure-button-primary" id="cloneButton" name="cloneButton">Add</button>
	<button class="pure-button " id="reset" name="reset">Reset</button>
	<button class="pure-button pure-button-primary" id="save" name="save" data-link='job_save'>Save All</button>
</div>
