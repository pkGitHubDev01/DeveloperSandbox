@isTest
public class LeadProcessorTest 
{
   static testMethod void testMethod1()
   {
       List<Lead> leads = new List<Lead>();
       for(Integer i=0; i <200; i++)
       {
           Lead led = new Lead();
           led.FirstName ='WERTY';
           led.LastName ='GFDSA'+i;
           led.Company ='demo'+i;
           leads.add(led);
       }
       insert leads;
       
       Test.startTest();
       LeadProcessor obj = new LeadProcessor();
       DataBase.executeBatch(obj);
       Test.stopTest();
   }
}