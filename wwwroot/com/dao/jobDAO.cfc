component
	displayname="JobDAO" 
	accessors="true"
	output="true" {

	property String dsn;
	
	public function init(required String dsn) {
		setDSN(arguments.dsn);
	}


	public query function getJobCat() {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.setSQL("
			select job_cat_id, job_cat_name, job_cat_description
			from be_job_cat 
			where job_cat_enabled = 1
			order by job_cat_name
		");
		var qResult = qService.execute();
		var qData = qResult.getResult();
		
		return qData;
		
	}
	
	public query function getJobCatWithPersonality(required numeric perCatId, required numeric perId) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		
		qService.addParam(name='perCatId', value=arguments.perCatId, cfsqltype='cf_sql_integer');
		qService.addParam(name='perId', value=arguments.perId, cfsqltype='cf_sql_integer');
		
		qService.setSQL("
			select j.job_cat_id, j.job_cat_name, j.job_cat_description, pj.personality_cat_id, pj.personality_id
			from be_job_cat j 
				inner join be_personality_job pj on pj.job_cat_id = j.job_cat_id
					and pj.personality_cat_id = (:perCatId)
					and pj.personality_id = (:perId)
			where j.job_cat_enabled = 1
			order by j.job_cat_name, j.job_cat_id
		");
		var qResult = qService.execute();
		var qData = qResult.getResult();
		
		return qData;
		
	}
	
	public boolean function updateJobCat(required numeric jobCatId, any jobCatName, any jobCatDesc) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='jobCatId', value=arguments.jobCatId, cfsqltype='cf_sql_integer');
		qService.addParam(name='jobCatName', value=arguments.jobCatName, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.jobCatName)) eq 0?true:false#");
		qService.addParam(name='jobCatDesc', value=arguments.jobCatDesc, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.jobCatDesc)) eq 0?true:false#");
		qService.setSQL("
			update be_job_cat 
			set job_cat_name = (:jobCatName),
				job_cat_description = (:jobCatDesc)
			where job_cat_id = (:jobCatId)
		");
		var qResult = qService.execute();
		
		return true;
		
	}

	public boolean function insertJobCat(required string jobCatName, any jobCatDesc) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='jobCatName', value=arguments.jobCatName, cfsqltype='cf_sql_varchar');
		qService.addParam(name='jobCatDesc', value=arguments.jobCatDesc, cfsqltype='cf_sql_varchar', null="#len(trim(arguments.jobCatDesc)) eq 0?true:false#");
		qService.setSQL("
			insert into be_job_cat (job_cat_name, job_cat_description)
			values ((:jobCatName), (:jobCatDesc))
		");
		var qResult = qService.execute();
		
		return true;
		
	}
	
	public boolean function insertLinkJobAndPersonality(required numeric perCatId, required numeric perId, required numeric jobCatId) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='perCatId', value=arguments.perCatId, cfsqltype='cf_sql_integer');
		qService.addParam(name='perId', value=arguments.perId, cfsqltype='cf_sql_integer');
		qService.addParam(name='jobCatId', value=arguments.jobCatId, cfsqltype='cf_sql_integer');

		qService.setSQL("
			insert into be_personality_job (personality_cat_id, personality_id, job_cat_id)
			values ((:perCatId), (:perId), (:jobCatId))
		");
		var qResult = qService.execute();
		
		return true;
		
	}
	
	public boolean function deleteLinkJobAndPersonality(required numeric perCatId, required numeric perId) {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.addParam(name='perCatId', value=arguments.perCatId, cfsqltype='cf_sql_integer');
		qService.addParam(name='perId', value=arguments.perId, cfsqltype='cf_sql_integer');

		qService.setSQL("
			delete from be_personality_job where personality_cat_id= (:perCatId) and personality_id = (:perId);
		");
		var qResult = qService.execute();
		
		return true;
		
	}
	
}
