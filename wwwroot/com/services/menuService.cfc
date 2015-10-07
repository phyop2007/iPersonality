component 
	output="true" 
	displayname="MenuService"
	accessors="true" {

	property any dao;
	
	public function init(required any dao) {
		setDAO(arguments.dao);
		return this;
	}

	public query function getFeMenu() {
		return getDAO().getFeMenu();
	}
	
	public query function getBeMenu() {
		return getDAO().getBeMenu();
	}
	
}
