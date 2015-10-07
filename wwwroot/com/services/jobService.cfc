component 
	output="true" 
	displayname="JobService"
	accessors="true" {

	property any dao;
	
	public function init(required any dao) {
		setDAO(arguments.dao);
		return this;
	}

	public query function getJobCat() {
		return getDAO().getJobCat();
	}
	
	public query function getJobCatWithPersonality(required numeric perCatId, required numeric perId){
		return getDAO().getJobCatWithPersonality(argumentCollection = arguments);
	}
	
	public boolean function saveJobCat(struct fStruct) {
		
		if(len(trim(arguments.fStruct.job_cat_name_new_0))) {
			// add new	
			local.aName = listToArray(arguments.fStruct.job_cat_name_new_0);
			local.aDesc = listToArray(arguments.fStruct.job_cat_desc_new_0);
			for (local.i = 1; local.i lte arrayLen(local.aName); local.i++) {
				local.jobCatName = local.aName[local.i];
				if(not arrayIsEmpty(local.aDesc) and arrayLen(local.aDesc) gte local.i)
					local.jobCatDesc = local.aDesc[local.i];
				else
					local.jobCatDesc = '';
				getDAO().insertJobCat(jobCatName = local.jobCatName, jobCatDesc = local.jobCatDesc);		
			}
		}
		else {
			// update old
			for(local.key in arguments.fStruct) {
				if(findNoCase('job_cat_name_', local.key) and not findNoCase('_new_', local.key)) {
					local.jobCatId = listLast(local.key,'_');
					local.jobCatName = arguments.fStruct[local.key];
					local.jobCatDesc = arguments.fStruct['job_cat_desc_' & local.jobCatId];
					getDAO().updateJobCat(jobCatId = local.jobCatId, jobCatName = local.jobCatName, jobCatDesc = local.jobCatDesc);
				}	
			}	
		}
		
		return true;
	}
	
	public boolean function linkJobAndPersonality(struct fStruct) {
		transaction action='begin' {
			try{
				getDAO().deleteLinkJobAndPersonality (perCatId = arguments.fStruct.perCatId, perId = arguments.fStruct.perId);	
				for(local.key in arguments.fStruct) {
					if(findNoCase('cat_', local.key)) {
						// format is in cat_2_per_5_job_3
						local.jobCatId = listLast(local.key,'_');
						getDAO().insertLinkJobAndPersonality (perCatId = arguments.fStruct.perCatId, perId = arguments.fStruct.perId, jobCatId = local.jobCatId);
					}		
				}
				transaction action = "commit";	
				return true;
			
			} catch (any e) {
				transaction action='rollback';
				//rethrow;
				writeDump(e);
				return false;
			
			}
				
		}
	}
	
	public string function getJobsByPersonality(struct fstruct) {
		local.jobList = '';
		local.allJobList = getAllJobsByPersonality (fstruct = arguments.fstruct);
		if(listLen(local.allJobList)) {
			local.sortedJobList = listSort(local.allJobList,'textnocase','asc','|');
			local.jobList = getCommonJobsByPersonality(sortedJobList = local.sortedJobList);
			//if(listLen(local.jobList) eq 0) local.jobList = local.allJobList;
		}
		return local.jobList;	
	}
	
	public string function getAllJobsByPersonality(struct fstruct){
		local.allJobList = '';
		for(local.key in arguments.fStruct) {
			if(findNoCase('cat_', local.key) && len(trim(arguments.fStruct[local.key]))) {
				local.perCatId = listLast(local.key,'_');
				local.perId = arguments.fStruct[local.key];
				local.jobQuery = getJobCatWithPersonality (perCatId = local.perCatId, perId = local.perId);
				if(local.jobQuery.recordcount) {
					local.allJobList = listAppend(local.allJoblist, valueList(local.jobQuery.job_cat_name,'|'),'|');
				}	
			}		
		}
		
		return local.allJobList;
		
	}
	
	public string function getCommonJobsByPersonality(string sortedJobList){
		local.cList = '';

		local.aJob = listToArray(arguments.sortedJobList,'|');

		for (local.i = 1; local.i lte arrayLen(local.aJob); local.i++) {
			local.nextPos = local.i + 1;
			if( (local.nextPos lte arrayLen(local.aJob)) && (local.aJob[local.i] eq local.aJob[local.nextPos])){
				local.cList = listAppend(local.cList,local.aJob[local.i],'|');	
			}
		}
		
		return local.cList;		
	}	
}
