global class WSCountriesUpdateSchedule implements Schedulable {
   global void execute(SchedulableContext sc) {
      	CalloutCountryWS.getInfoFromExternalService();   
   }
}