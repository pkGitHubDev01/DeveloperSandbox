@isTest
public class TestRestrictContactByName 
{
     static testMethod void TestRestrictContactByName()
     {
         List<Contact> listContact = new List<Contact>();
         Contact c1 = new Contact(FirstName= 'France', LastName='Rig');
         Contact c2 = new Contact(FirstName= 'France1', LastName='INVALIDNAME');
         listContact.add(c1);
         listContact.add(c2);
         
         Test.startTest();
         try
         {
             insert listContact;
         }
         catch(Exception ee)
         {
             
         }
     Test.stopTest();
     }
}