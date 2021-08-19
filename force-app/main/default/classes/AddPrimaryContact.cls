public class AddPrimaryContact implements Queueable
{
    private contact c;
    private string state;
    public AddPrimaryContact(Contact c, String state)
    {
        this.c = c;
        this.state = state;
     }
     public void execute(QueueableContext context)
     {
         List<Account> ListAccount= [Select Id, Name, (select id, FirstName, LastName from contacts) from Account Where BillingState = : state limit 200];
         system.debug('Size'+ ListAccount.size());
         List<Contact> cons = new List<Contact>();
         for(Account a: ListAccount)
         {
             Contact con = this.c.clone(false,false,false,false);
             con.AccountId = a.Id;
             cons.add(con);
         }
         if(cons.size()>0)
         {
           insert cons;  
         }
     }
}