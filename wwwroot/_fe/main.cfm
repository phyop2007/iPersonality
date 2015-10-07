<cfparam name="url.p_action" default="intro">

<cfswitch expression="#url.p_action#">
	<cfcase value="intro">
		<cfinclude template="misc/dsp_intro.cfm">
	</cfcase>
	<cfcase value="per">
		<cfinclude template="per/dsp_per.cfm">
	</cfcase>
	<cfcase value="work">
		<cfinclude template="work/dsp_work.cfm">
	</cfcase>
	<cfcase value="per_work">
		<cfinclude template="per_work/dsp_per_work.cfm">
	</cfcase>
	<cfcase value="contact">
		<cfinclude template="misc/dsp_contact.cfm">
	</cfcase>
	<cfdefaultcase>
	
	</cfdefaultcase>
</cfswitch>	