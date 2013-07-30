<cfcomponent extends="mxunit.framework.TestCase">

    <!--- this will run before every single test in this test case --->
    <cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">
		<cfscript>
		// set dsn name
		request.dsn = 'sample_app';
		// instantiate a locationManager called lMan
		request.lMan = createObject("component", "sampleapp.com.LocationManager");
		</cfscript> 
    </cffunction>

    <!--- this will run after every single test in this test case --->
    <cffunction name="tearDown" returntype="void" access="public" hint="put things here that you want to run after each test">
    </cffunction>

        <!--- this will run once after initialization and before setUp() --->
    <cffunction name="beforeTests" returntype="void" access="public" hint="put things here that you want to run before all tests">
<!--- 
        <cfset obj = createObject("component","ObjectUnderTest")>
 --->
    </cffunction>

    <!--- this will run once after all tests have been run --->
    <cffunction name="afterTests" returntype="void" access="public" hint="put things here that you want to run after all tests">
    </cffunction>

    <cffunction name="verify51States" returntype="void" access="public" hint="This test verifies that there are 51 states in the recordset to populate the US States dropdown.">
	  <cfscript>	  
	  var rs = request.lMan.getStates();
	  var expected = 51;
	  var result = rs.recordCount;
	  </cfscript>             
	  <!--- if you want to "see" your data -- including complex variables, you can pass them to debug() and they will be available to you either in the HTML output or in the Eclipse plugin via rightclick- "Open TestCase results in browser" --->
      <cfset debug(result)>      
	  <!--- make some assertion based on the result of exercising the component --->
      <cfset assertEquals(expected,result,"result should've been 51, but was #result#")>    
	</cffunction>
	
	<cffunction name="verifyStateNames" returntype="void" access="public" hint="this test verifies that the list of states returned matches the correct list of 50 states + DC.">		
		<cfscript>
	  	var rs = request.lMan.getStates();
	  	var expected = 'Alabama,Alaska,Arizona,Arkansas,California,Colorado,Connecticut,Delaware,District of Columbia,Florida,Georgia,Hawaii,Idaho,Illinois,Indiana,Iowa,Kansas,Kentucky,Louisiana,Maine,Maryland,Massachusetts,Michigan,Minnesota,Mississippi,Missouri,Montana,Nebraska,Nevada,New Hampshire,New Jersey,New Mexico,New York,North Carolina,North Dakota,Ohio,Oklahoma,Oregon,Pennsylvania,Rhode Island,South Carolina,South Dakota,Tennessee,Texas,Utah,Vermont,Virginia,Washington,West Virginia,Wisconsin,Wyoming';
		var result = valueList(rs.state_name, ',');
		</cfscript>		
		<!--- if you want to "see" your data -- including complex variables, you can pass them to debug() and they will be available to you either in the HTML output or in the Eclipse plugin via rightclick- "Open TestCase results in browser" --->
      	<cfset debug(result)>      
	  	<!--- make some assertion based on the result of exercising the component --->
      	<cfset assertEquals(expected,result,"result should've been [#expected#], but was [#result#]")>		
	</cffunction>
	
	<cffunction name="verifyStateRSFields" returntype="void" access="public" hint="this test verifies that the columns returned by the state list query matches what the code is expecting.">		
		<cfscript>
	  	var rs = request.lMan.getStates();
	  	var expected = 'state_name,state_code';
		var result = rs.columnList;
		</cfscript>		
		<!--- if you want to "see" your data -- including complex variables, you can pass them to debug() and they will be available to you either in the HTML output or in the Eclipse plugin via rightclick- "Open TestCase results in browser" --->
      	<cfset debug(result)>      
	  	<!--- make some assertion based on the result of exercising the component --->
      	<cfset assertEquals(expected,result,"result should've been [#expected#], but was [#result#]")>		
	</cffunction>
   
 <cffunction name="somePrivateFunction" access="private">
    </cffunction>
</cfcomponent>
