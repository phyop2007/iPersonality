component
	displayname='Application Front End'
	output='true'
	 {

	//include 'app_config.cfm';
	variables.app_name = 'iPersonality';
	variables.app_name_prefix = '_back';
	this.name = '#variables.app_name##variables.app_name_prefix#';
	this.applicationTimeout = CreateTimeSpan(0,3,0,0);
	this.sessionManagement = false;
	this.setClientCookies = false;
	this.clientManagement = true;
	this.scriptProtect =  'all';
	
	this.comDir = left(getBaseTemplatePath(), len(getBaseTemplatePath()) - find(reverse('wwwroot'), reverse(getBaseTemplatePath())) + 2) & 'com';
	
	this.mappings['/com'] = this.comDir;
	
	public void function onApplicationStart() {
		initializeFramework();
	}

	public void function onRequestStart(required string targetPage) {
		
		if(StructKeyExists(url,"app_refresh")) {
			OnApplicationStart();
		}	
	}
	
	public void function initializeFramework() {

		// auto-refresh the application @1

		local.params = structNew();
		local.params['dsn'] = 'iPer';
		lock scope='Application' type='exclusive' timeout='60' {

			// initialize coldspring
			application.coldspring = new coldspring.beans.DefaultXmlBeanFactory().init(StructNew(), params);
			application.coldspring.loadBeans('/com/coldspring.xml.cfm');
		    local.services = [
				'MenuService',
				'JobService',
				'PersonalityService'
		    ];
			for(var i=1; i<=arrayLen(local.services); i++) {
				application[local.services[i]] = application.coldspring.getBean(local.services[i]);
			}
		}

	}
}
