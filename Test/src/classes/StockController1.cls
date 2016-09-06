public class StockController1 {
@AuraEnabled
public static string ServergetQuote(string symbol) {
    	//StockQuote stub = new StockQuote();
		//stub.timeout_x = 2000; // timeout in milliseconds
		wsCdyneCom.DelayedStockQuoteSoap stub = new wsCdyneCom.DelayedStockQuoteSoap() ;
        decimal cost = stub.GetQuickQuote(symbol,'0');
        Account account = [SELECT Id FROM Account WHERE name  = 'Technology Stocks'];
        Contact contact = [SELECT Id FROM Contact WHERE lastname  = 'Sirikonda'];
        Opportunity a = new Opportunity();
				//Intialize Opportunity Object
        a.AccountId  = account.Id ;
        //a.ContactId = contact.Id;
        a.StageName = 'Prospecting';
        a.Amount = cost;
        a.CloseDate = System.today();
        a.Name = symbol;
        upsert(a);
        //ast.add(a);
    	return cost.toPlainString();
    }
}
