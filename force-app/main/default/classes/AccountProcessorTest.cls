@IsTest
public class AccountProcessorTest
{
    public static testmethod void TestAccountProcessorTest()
    {
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact con = New Contact();
        con.FirstName = 'Test';
        con.LastName = 'Account';
        con.AccountId = a.Id;
        
        List<Id> acclst = new List<Id>();
        acclst.add(a.id);
        Test.startTest();
        AccountProcessor.countContacts(acclst);
        Test.stopTest();
        
        Account acc = [Select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
        //System.assertEquals (Integer.valueOf(acc.Number_of_Contacts__c  ),1);
    }
}