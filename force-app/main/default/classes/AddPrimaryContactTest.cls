@isTest
public class AddPrimaryContactTest
{
    @testSetup static void setup()
    {
        List<Account> Testt = new List<Account>();
        for(Integer i=0; i<50; i++)
        {
            Testt.add(new Account(BillingState = 'CA', name = 'Test'+i));
        }
           for(Integer j=50; j<100; j++)
        {
            Testt.add(new Account(BillingState = 'NY', name = 'Test'+j));
        } 
        insert Testt;
     }
          static testMethod void testQue()
          {
            Contact co = new Contact();
            co.FirstName ='demo';
            co.LastName = 'demo';
            insert co;
            String state = 'CA';
           
            AddPrimaryContact apc = new AddPrimaryContact(co,state);
            Test.startTest();
            System.enqueueJob(apc);
            Test.stopTest();
            System.assertEquals(50,[Select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = : state)]);
           }
}