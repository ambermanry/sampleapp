<cfcomponent displayname="LocationManager" output="false">

<cffunction name="getStates" access="public" output="false" returntype="Query">
  
  <cfscript>
  var rsStates = queryNew("state_code, state_name", "varchar,varchar");
  queryAddRow(rsStates);
  querySetCell(rsStates,'state_code', 'VA');
  querySetCell(rsStates, 'state_name', 'Virginia');
  </cfscript>

  <cfquery name="rsStates" datasource="#request.dsn#">
  select * from tbl_state
  order by state_name
  </cfquery>

  <cfreturn rsStates />

</cffunction>
	
<cffunction name="test" access="public" returntype="any">

</cffunction>
	
</cfcomponent>