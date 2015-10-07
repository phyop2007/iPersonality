component
	displayname="MenuDAO" 
	accessors="true"
	output="true" {

	property String dsn;
	
	public function init(required String dsn) {
		setDSN(arguments.dsn);
	}


	public query function getFeMenu() {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.setSQL("
			select menu_id, menu_name, menu_description, menu_link, menu_sequence
			from fe_menu 
			where menu_enabled = 1
			order by menu_sequence
		");
		var qResult = qService.execute();
		var qData = qResult.getResult();
		
		return qData;
		
	}
	
	public query function getBeMenu() {
		var qService = new Query();
		qService.setDatasource(getDSN());
		qService.setSQL("
			select bm.menu_id, bm.menu_name, bm.menu_description, bm.menu_link, bm.menu_sequence,
				bmg.menu_group_id, bmg.menu_group_name, bmg.menu_group_description, bmg.menu_group_link, bmg.menu_group_sequence
			from be_menu bm 
				inner join be_menu_group bmg on bmg.menu_group_id = bm.menu_group_id
			where bm.menu_enabled = 1 and bmg.menu_group_enabled = 1
			order by bmg.menu_group_sequence, bm.menu_sequence
		");
		var qResult = qService.execute();
		var qData = qResult.getResult();
		
		return qData;
		
	}
	
}
