component
	displayname="personalityDAO" 
	accessors="true"
	output="true" {

	property String dsn;
	
	public function init(required String dsn) {
		setDSN(arguments.dsn);
	}


	public query function getPersonalityCat(numeric categoryId) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		local.mainSql = "
			select personality_cat_id, personality_cat_name, personality_cat_description
			from be_personality_cat 
		";
		local.whereSql = " where personality_cat_enabled = 1 ";
		if(structKeyExists(arguments,'categoryId')){
			qService.addParam(name='categoryId', value=arguments.categoryId, cfsqltype='cf_sql_integer');
			local.whereSql &= " and personality_cat_id = (:categoryId) ";
		}
		local.orderBySql = " order by personality_cat_name ";
		
		qService.setSQL(local.mainSql & local.whereSql & local.orderBySql);
		var qResult = qService.execute();
		var qData = qResult.getResult();
		
		return qData;
		
	}
	
	public query function getPersonality(numeric categoryId, numeric personalityId) {
		var qService = new Query();
		qService.setDatasource(getDSN());		
		local.mainSql = "
			select bp.personality_id, bp.personality_name, bp.personality_description, bp.personality_cat_id,
				 bpc.personality_cat_id ,bpc.personality_cat_name, bpc.personality_cat_description
			from be_personality bp
				inner join be_personality_cat bpc on bpc.personality_cat_id = bp.personality_cat_id 
		";
		local.whereSql = " where bp.personality_enabled = 1 ";
		
		if(structKeyExists(arguments,'categoryId')){
			qService.addParam(name='categoryId', value=arguments.categoryId, cfsqltype='cf_sql_integer');
			local.whereSql &= " and bp.personality_cat_id = (:categoryId) ";
		}
				
		if(structKeyExists(arguments,'personalityId')){
			qService.addParam(name='personalityId', value=arguments.personalityId, cfsqltype='cf_sql_integer');
			local.whereSql &= " and bp.personality_id = (:personalityId) ";
		}
		local.orderBySql = " order by bpc.personality_cat_name, bpc.personality_cat_id, bp.personality_name ";
		qService.setSQL(local.mainSql & local.whereSql & local.orderBySql);
		var qResult = qService.execute();
		var qData = qResult.getResult();
		
		return qData;
		
	}
	
	public boolean function updatepersonalityCat(required numeric personalityCatId, any personalityCatName, any personalityCatDesc) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='personalityCatId', value=arguments.personalityCatId, cfsqltype='cf_sql_integer');
		qService.addParam(name='personalityCatName', value=arguments.personalityCatName, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.personalityCatName)) eq 0?true:false#");
		qService.addParam(name='personalityCatDesc', value=arguments.personalityCatDesc, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.personalityCatDesc)) eq 0?true:false#");
		qService.setSQL("
			update be_personality_cat 
			set personality_cat_name = (:personalityCatName),
				personality_cat_description = (:personalityCatDesc)
			where personality_cat_id = (:personalityCatId)
		");
		var qResult = qService.execute();
		
		return true;
		
	}

	public boolean function insertpersonalityCat(required string personalityCatName, any personalityCatDesc) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='personalityCatName', value=arguments.personalityCatName, cfsqltype='cf_sql_varchar');
		qService.addParam(name='personalityCatDesc', value=arguments.personalityCatDesc, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.personalityCatDesc)) eq 0?true:false#");
		qService.setSQL("
			insert into be_personality_cat (personality_cat_name, personality_cat_description)
			values ((:personalityCatName), (:personalityCatDesc))
		");
		var qResult = qService.execute();
		
		return true;
		
	}
	
	public boolean function updatepersonality(required numeric personalityCatId, required numeric personalityId, any personalityName, any personalityDesc) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='personalityCatId', value=arguments.personalityCatId, cfsqltype='cf_sql_integer');
		qService.addParam(name='personalityId', value=arguments.personalityId, cfsqltype='cf_sql_integer');
		qService.addParam(name='personalityName', value=arguments.personalityName, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.personalityName)) eq 0?true:false#");
		qService.addParam(name='personalityDesc', value=arguments.personalityDesc, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.personalityDesc)) eq 0?true:false#");
		qService.setSQL("
			update be_personality 
			set personality_name = (:personalityName),
				personality_description = (:personalityDesc)
			where personality_id = (:personalityId)
				and personality_cat_id = (:personalityCatId)
		");
		var qResult = qService.execute();
		
		return true;
		
	}

	public boolean function insertpersonality(required numeric personalityCatId, required string personalityName, any personalityDesc) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='personalityCatId', value=arguments.personalityCatId, cfsqltype='cf_sql_integer');
		qService.addParam(name='personalityName', value=arguments.personalityName, cfsqltype='cf_sql_varchar');
		qService.addParam(name='personalityDesc', value=arguments.personalityDesc, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.personalityDesc)) eq 0?true:false#");
		qService.setSQL("
			insert into be_personality (personality_cat_id, personality_name, personality_description)
			values ((:personalityCatId), (:personalityName), (:personalityDesc))
		");
		var qResult = qService.execute();
		
		return true;
	}
	
}
