public class ActionRegionWithRequiredField 
{
    public Account objAccount {get; set;}
    private string strAccountId {get; set;}
    public boolean IsContact {get; set;}
    public list<WrapContact> lstWrapContact {get; set;}
    
    public ActionRegionWithRequiredField()
    {
        IsContact = false;
        objAccount = new Account(); 
        strAccountId = Apexpages.currentPage().getParameters().get('Id');
        lstWrapContact = new list<WrapContact>();
        BindData();
    }
    
    private void BindData()
    {
        list<Account> lstAccount = [select Id, Name ,
                                        (select id, FirstName, LastName, AssistantName, AssistantPhone, Birthdate from Contacts)
                                      from Account where Id =: strAccountId
                                    ];
        
        if(lstAccount != null && lstAccount.size() > 0)
        {
            for(contact objContact : lstAccount[0].Contacts)
            {
                WrapContact objTempContact = new WrapContact();
                objTempContact.objContact =  objContact;
                lstWrapContact.add(objTempContact);
            }
        }
    }
    
    public class WrapContact
    {
        public boolean IsDelete {get; set;}
        public contact objContact {get; set;}
        public string strName {get; set;}
        public WrapContact()
        {    
            IsDelete = false;
            objContact = new contact();
        }
    }
    
    public void Add()
    {
        system.debug('lstWrapContact???' + lstWrapContact);
        lstWrapContact.add(new WrapContact());
    }
    
    public void DeleteRow()
    {
        
    }
    
    public void Save()
    {
        system.debug('lstWrapContact???' + lstWrapContact);
    }
    
    public boolean Validate()
    {
        if(string.isBlank(objAccount.name))
        {
            objAccount.name.addError('Required');
            
        }
        return true;
    }
}