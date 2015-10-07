<cfparam name="url.p_action" default="none">
<cfsetting enablecfoutputonly="true">
<cfsetting showdebugoutput="false">

<cfswitch expression="#url.p_action#">
	<cfcase value="show_per_result">
		<cfset returnJobList = application.jobService.getJobsByPersonality(fstruct = form)>
		<cfoutput>#returnJobList#</cfoutput>
	</cfcase>
	
	<cfdefaultcase>
	
	</cfdefaultcase>
</cfswitch>	