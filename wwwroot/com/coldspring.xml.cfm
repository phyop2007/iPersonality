<beans>

	<bean id="beanInjector" class="model.BeanInjector" singleton="true">
		<constructor-arg name="suffixList">
			<value></value>
		</constructor-arg>
		<constructor-arg name="debugMode">
			<value>false</value>
		</constructor-arg>
	</bean>

 	<bean id="MenuDAO" class="com.dao.MenuDAO" singleton="true">
		<constructor-arg name="dsn">
			<value>${dsn}</value>
		</constructor-arg>
	</bean>
	
	<bean id="MenuService" class="com.services.MenuService" singleton="true">
		<constructor-arg name="dao">
			<ref bean="MenuDAO" />
		</constructor-arg>
	</bean>
	
	 <bean id="JobDAO" class="com.dao.JobDAO" singleton="true">
		<constructor-arg name="dsn">
			<value>${dsn}</value>
		</constructor-arg>
	</bean>
	
	<bean id="JobService" class="com.services.JobService" singleton="true">
		<constructor-arg name="dao">
			<ref bean="JobDAO" />
		</constructor-arg>
	</bean>
	
	 <bean id="PersonalityDAO" class="com.dao.PersonalityDAO" singleton="true">
		<constructor-arg name="dsn">
			<value>${dsn}</value>
		</constructor-arg>
	</bean>
	
	<bean id="PersonalityService" class="com.services.PersonalityService" singleton="true">
		<constructor-arg name="dao">
			<ref bean="PersonalityDAO" />
		</constructor-arg>
	</bean>
</beans>
