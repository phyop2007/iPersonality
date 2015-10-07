<cfparam name="url.p_action" default="">

<cfswitch expression="#url.p_action#">
	<cfcase value="per">
		<cfinclude template="per/dsp_per.cfm">
	</cfcase>
	<cfcase value="per_detail">
		<cfinclude template="per/dsp_per_detail.cfm">
	</cfcase>
	<cfcase value="work">
		<cfinclude template="work/dsp_work.cfm">
	</cfcase>
	<cfcase value="per_work">
		<cfinclude template="work/dsp_per_work.cfm">
	</cfcase>
	<cfcase value="per_work_detail">
		<cfinclude template="work/dsp_per_work_detail.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="work/dsp_per_work.cfm">
	</cfdefaultcase>
</cfswitch>	