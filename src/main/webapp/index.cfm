<cfsilent>
<cfscript>
request.dsn = 'sample_app';
request.lMan = createObject("component", "com.LocationManager");
request.rsStates = request.lMan.getStates();

populateMenu = false;
numStates = 0;	

if ( structKeyExists(request, 'rsStates') ) {
  numStates = request.rsStates.recordCount;
  if ( numStates gt 0 )  {
    populateMenu = true;
  }
}

</cfscript>
</cfsilent>

<cfinclude template="view/state_select.cfm">
