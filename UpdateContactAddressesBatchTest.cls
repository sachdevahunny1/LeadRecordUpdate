@isTest 
public class UpdateContactAddressesBatchTest  // Change test class name according to object functionality
{
    static testMethod void testMethod1() //change method name according to object and data update functionality
    {
        List<Lead> leadDataList= new List<Lead>();
        for(Integer i=0 ;i <200;i++)
        {
        //Add all required fields for Lead here so that test data gets create.
            Lead leadData = new Lead();
            leadData.LastName ='Name'+i;
            leadData.Company = 'Working';
            leadData.leadsource = 'Series';
            leadData.Rating= 'Cold';
            leadData.Country= 'US';
            leadDataList.add(leadData);
        }
        
        insert leadDataList;
        
        Test.startTest();

            UpdateContactAddresses obj = new UpdateContactAddresses(); //change class name according to object functionality
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}