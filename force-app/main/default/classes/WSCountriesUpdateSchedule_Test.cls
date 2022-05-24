//test class for WSCountriesUpdateSchedule
//test coverage: 100% also privedes test coverage for CalloutCountryWS (97%)
@isTest
public class WSCountriesUpdateSchedule_Test {
    @isTest
    static void testWSCountriesUpdateSchedule() {
		Test.StartTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        CalloutCountryWS.getInfoFromExternalService();
		WSCountriesUpdateSchedule sh1 = new WSCountriesUpdateSchedule();
    	String sch = '0 0 0 * * ?'; 
    	system.schedule('Test Daily', sch, sh1); 
    	Test.stopTest();
    }
}