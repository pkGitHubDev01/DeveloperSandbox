public class firstclass {
    
    public String strName;
    public String strEmail;
	
    
    public void UpdateContactDetail(String strNameP, String strEmailP)
    {
        system.debug('Result?????' + strEmail == strEmailP);
        system.debug('Result>>>>>' + strName == strNameP);
    }
    
    public void UpdateAccountDetail()
    {
        strName = 'Shivam';
        system.debug('strName?????' + strName);
    }
    
}