component 
	output="true" 
	displayname="personalityService"
	accessors="true" {

	property any dao;
	
	public function init(required any dao) {
		setDAO(arguments.dao);
		return this;
	}

	public query function getPersonalityCat(numeric categoryId) {
		return getDAO().getpersonalityCat(argumentCollection=arguments);
	}
	
	public query function getAllPersonality() {
		return getDAO().getPersonality();
	}
	
	public query function getPersonality(required numeric categoryId, numeric personalityId) {
		return getDAO().getpersonality(argumentCollection=arguments);
	}
	
	public boolean function savePersonalityCat(required struct fStruct) {
		
		if(len(trim(arguments.fStruct.personality_cat_name_new_0))) {
			// add new	
			local.aName = listToArray(arguments.fStruct.personality_cat_name_new_0);
			local.aDesc = listToArray(arguments.fStruct.personality_cat_desc_new_0);
			for (local.i = 1; local.i lte arrayLen(local.aName); local.i++) {
				local.personalityCatName = local.aName[local.i];
				if(not arrayIsEmpty(local.aDesc) and arrayLen(local.aDesc) gte local.i)
					local.personalityCatDesc = local.aDesc[local.i];
				else
					local.personalityCatDesc = '';
				getDAO().insertpersonalityCat(personalityCatName = local.personalityCatName, personalityCatDesc = local.personalityCatDesc);		
			}
		}
		else {
			// update old
			for(local.key in arguments.fStruct) {
				if(findNoCase('personality_cat_name_', local.key) and not findNoCase('_new_', local.key)) {
					local.personalityCatId = listLast(local.key,'_');
					local.personalityCatName = arguments.fStruct[local.key];
					local.personalityCatDesc = arguments.fStruct['personality_cat_desc_' & local.personalityCatId];
					getDAO().updatepersonalityCat(personalityCatId = local.personalityCatId, personalityCatName = local.personalityCatName, personalityCatDesc = local.personalityCatDesc);
				}	
			}	
		}
		
		return true;
	}
	
	public boolean function savePersonality(required struct fStruct, required numeric categoryId) {
		
		if(len(trim(arguments.fStruct.personality_name_new_0))) {
			// add new	
			local.aName = listToArray(arguments.fStruct.personality_name_new_0);
			local.aDesc = listToArray(arguments.fStruct.personality_desc_new_0);
			for (local.i = 1; local.i lte arrayLen(local.aName); local.i++) {
				local.personalityName = local.aName[local.i];
				if(not arrayIsEmpty(local.aDesc) and arrayLen(local.aDesc) gte local.i)
					local.personalityDesc = local.aDesc[local.i];
				else
					local.personalityDesc = '';
				getDAO().insertpersonality(
					personalityCatId = arguments.categoryId,
					personalityName = local.personalityName, 
					personalityDesc = local.personalityDesc
				);		
			}
		}
		else {
			// update old
			for(local.key in arguments.fStruct) {
				if(findNoCase('personality_name_', local.key) and not findNoCase('_new_', local.key)) {
					local.personalityId = listLast(local.key,'_');
					local.personalityName = arguments.fStruct[local.key];
					local.personalityDesc = arguments.fStruct['personality_desc_' & local.personalityId];
					getDAO().updatepersonality(
						personalityCatId = arguments.categoryId,
						personalityId = local.personalityId, 
						personalityName = local.personalityName, 
						personalityDesc = local.personalityDesc
					);
				}	
			}	
		}
		
		return true;
	}
	
}
