public class AccountProcessor
{
    @future
    public static void countContacts(List<Id> accId)
    {
        List<Account> acclst = [Select Id, Number_of_Contacts__c, (select id from contacts)  from Account Where Id IN: accId];
       // System.debug('Acc'+ acclst);
        for(Account acc: acclst)
        {
            List<Contact> conlst = acc.contacts ;
            acc.Number_of_Contacts__c  = conlst.size();
            //system.debug('Contact'+ conlst);
        }
        update acclst;
    }
}