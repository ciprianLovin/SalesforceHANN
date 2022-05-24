Manual actions:

//Run the following scripts in the Execute Anonymous Window after deployment:

//Script to Schedule the WScountry update

WSCountriesUpdateSchedule sh1 = new WSCountriesUpdateSchedule();
String sch = '0 0 0 * * ?'; 
system.schedule('Daily WSCountry refresh', sch, sh1);


//Script to update historical Leads:


Id batchJobId = Database.executeBatch(new LeadUpdateWSCountryBatch(), 200);


