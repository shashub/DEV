//Generated by FuseIT WSDL2Apex (http://www.fuseit.com/Solutions/SFDC-Explorer/Help-WSDL-Parser.aspx)
//Warning: Ignoring <s:element ref="s:schema"/> sequence Element
//Warning: '<xsd:any>' element type has been changed to dataType List<DOM.XmlNode> called anyElement
//Methods Included: GetQuote, GetQuickQuote, GetQuoteDataSet
// Primary Port Class Name: DelayedStockQuoteSoap 
public class wsCdyneCom {
 public static DateTime parseDateTime(String nodeText){
   String iso8601 = nodeText;
   JSONParser parser = JSON.createParser( '{"t":"' + iso8601 + '"}');
   parser.nextToken();
   parser.nextValue();
   DateTime dt = parser.getDateTimeValue();
   //System.debug('dt: ' + dt);
   return dt;
  }
 
 //Warning: Ignoring <s:element ref="s:schema"/> sequence Element
 public class DataSet_element {
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{};
  public DataSet_element(DOM.XmlNode responseNode){
   Set<DOM.XmlNode> nodesParsed = new Set<DOM.XmlNode>();
  }
 }
 public class DelayedStockQuoteSoap {
  public String endpoint_x = 'https://ws.cdyne.com/delayedstockquote/delayedstockquote.asmx';
  public Map<String,String> inputHttpHeaders_x;
  public Map<String,String> outputHttpHeaders_x;
  public String clientCertName_x;
  public String clientCert_x;
  public String clientCertPasswd_x;
  public Integer timeout_x;
  private String[] ns_map_type_info = new String[]{'http://ws.cdyne.com/','wsCdyneCom'};

  public Decimal GetQuickQuote(String StockSymbol,String LicenseKey) {
   wsCdyneCom.GetQuickQuote_element request_x = new wsCdyneCom.GetQuickQuote_element();
   wsCdyneCom.GetQuickQuoteResponse_element response_x;
   request_x.StockSymbol = StockSymbol;
   request_x.LicenseKey = LicenseKey;
   Map<String, wsCdyneCom.GetQuickQuoteResponse_element> response_map_x = new Map<String, wsCdyneCom.GetQuickQuoteResponse_element>();
   response_map_x.put('response_x', response_x);
   WebServiceCallout.invoke(
    this,
    request_x,
    response_map_x,
    new String[]{endpoint_x,
    'http://ws.cdyne.com/GetQuickQuote',
    'http://ws.cdyne.com/',
    'GetQuickQuote',
    'http://ws.cdyne.com/',
    'GetQuickQuoteResponse',
    'wsCdyneCom.GetQuickQuoteResponse_element'}
   );
   response_x = response_map_x.get('response_x');
   return response_x.GetQuickQuoteResult;
  }

  public wsCdyneCom.QuoteData GetQuote(String StockSymbol,String LicenseKey) {
   wsCdyneCom.GetQuote_element request_x = new wsCdyneCom.GetQuote_element();
   wsCdyneCom.GetQuoteResponse_element response_x;
   request_x.StockSymbol = StockSymbol;
   request_x.LicenseKey = LicenseKey;
   Map<String, wsCdyneCom.GetQuoteResponse_element> response_map_x = new Map<String, wsCdyneCom.GetQuoteResponse_element>();
   response_map_x.put('response_x', response_x);
   WebServiceCallout.invoke(
    this,
    request_x,
    response_map_x,
    new String[]{endpoint_x,
    'http://ws.cdyne.com/GetQuote',
    'http://ws.cdyne.com/',
    'GetQuote',
    'http://ws.cdyne.com/',
    'GetQuoteResponse',
    'wsCdyneCom.GetQuoteResponse_element'}
   );
   response_x = response_map_x.get('response_x');
   return response_x.GetQuoteResult;
  }

  public wsCdyneCom.GetQuoteDataSetResponse_GetQuoteDataSetResult_element GetQuoteDataSet(String StockSymbols,String LicenseKey) {
   wsCdyneCom.GetQuoteDataSet_element request_x = new wsCdyneCom.GetQuoteDataSet_element();
   wsCdyneCom.GetQuoteDataSetResponse_element response_x;
   request_x.StockSymbols = StockSymbols;
   request_x.LicenseKey = LicenseKey;
   Map<String, wsCdyneCom.GetQuoteDataSetResponse_element> response_map_x = new Map<String, wsCdyneCom.GetQuoteDataSetResponse_element>();
   response_map_x.put('response_x', response_x);
   WebServiceCallout.invoke(
    this,
    request_x,
    response_map_x,
    new String[]{endpoint_x,
    'http://ws.cdyne.com/GetQuoteDataSet',
    'http://ws.cdyne.com/',
    'GetQuoteDataSet',
    'http://ws.cdyne.com/',
    'GetQuoteDataSetResponse',
    'wsCdyneCom.GetQuoteDataSetResponse_element'}
   );
   response_x = response_map_x.get('response_x');
   return response_x.GetQuoteDataSetResult;
  }
  
  private DOM.XmlNode populateDoc(DOM.Document doc){
   String env = 'http://schemas.xmlsoap.org/soap/envelope/';
   String xsi = 'http://www.w3.org/2001/XMLSchema-instance';
   String xsd = 'http://www.w3.org/2001/XMLSchema';
            
   DOM.XmlNode envelope = doc.createRootElement('Envelope', env, 'env');
   envelope.setNamespace('xsd', xsd);
   envelope.setNamespace('xsi', xsi);
   DOM.XmlNode header = envelope.addChildElement('Header', env, '');
   AddHeader(header);
   //System.debug(doc.toXmlString());
   DOM.XmlNode body = envelope.addChildElement('Body', env, '');
   return body;
  }

  private void AddHeader(DOM.XmlNode header){
  }

  public Decimal GetQuickQuote_Http(String StockSymbol,String LicenseKey) {
   DOM.Document doc = new DOM.Document();
   DOM.XmlNode body = populateDoc(doc);
   DOM.XmlNode methodNode = body.addChildElement('GetQuickQuote', 'http://ws.cdyne.com/', '');   
   wsCdyneCom.GetQuickQuote_element request_x = new wsCdyneCom.GetQuickQuote_element(StockSymbol,LicenseKey);
   request_x.populateXmlNode(methodNode);
   
   HttpRequest req = new HttpRequest();
   req.setEndpoint(endpoint_x);
   req.setMethod('POST');
   req.setHeader('Content-Type', 'text/xml; charset=UTF-8');
   req.setHeader('SOAPAction', 'http://ws.cdyne.com/GetQuickQuote');
   req.setBodyDocument(doc);
   //System.debug(req.getBody());
   Http http = new Http();
   HTTPResponse res = http.send(req);
   //System.debug(res.getBody());
   Dom.Document responseDoc = res.getBodyDocument();
   Dom.XmlNode rootNode = responseDoc.getRootElement();
   Dom.XmlNode bodyNode = rootNode.getChildElement('Body','http://schemas.xmlsoap.org/soap/envelope/');
   Dom.XmlNode GetQuickQuoteResponseNode = bodyNode.getChildElement('GetQuickQuoteResponse', 'http://ws.cdyne.com/');
      
   wsCdyneCom.GetQuickQuoteResponse_element response_x = new wsCdyneCom.GetQuickQuoteResponse_element(GetQuickQuoteResponseNode);
   return response_x.GetQuickQuoteResult;
  }
 
  public wsCdyneCom.QuoteData GetQuote_Http(String StockSymbol,String LicenseKey) {
   DOM.Document doc = new DOM.Document();
   DOM.XmlNode body = populateDoc(doc);
   DOM.XmlNode methodNode = body.addChildElement('GetQuote', 'http://ws.cdyne.com/', '');   
   wsCdyneCom.GetQuote_element request_x = new wsCdyneCom.GetQuote_element(StockSymbol,LicenseKey);
   request_x.populateXmlNode(methodNode);
   
   HttpRequest req = new HttpRequest();
   req.setEndpoint(endpoint_x);
   req.setMethod('POST');
   req.setHeader('Content-Type', 'text/xml; charset=UTF-8');
   req.setHeader('SOAPAction', 'http://ws.cdyne.com/GetQuote');
   req.setBodyDocument(doc);
   //System.debug(req.getBody());
   Http http = new Http();
   HTTPResponse res = http.send(req);
   //System.debug(res.getBody());
   Dom.Document responseDoc = res.getBodyDocument();
   Dom.XmlNode rootNode = responseDoc.getRootElement();
   Dom.XmlNode bodyNode = rootNode.getChildElement('Body','http://schemas.xmlsoap.org/soap/envelope/');
   Dom.XmlNode GetQuoteResponseNode = bodyNode.getChildElement('GetQuoteResponse', 'http://ws.cdyne.com/');
      
   wsCdyneCom.GetQuoteResponse_element response_x = new wsCdyneCom.GetQuoteResponse_element(GetQuoteResponseNode);
   return response_x.GetQuoteResult;
  }
 
  public wsCdyneCom.GetQuoteDataSetResponse_GetQuoteDataSetResult_element GetQuoteDataSet_Http(String StockSymbols,String LicenseKey) {
   DOM.Document doc = new DOM.Document();
   DOM.XmlNode body = populateDoc(doc);
   DOM.XmlNode methodNode = body.addChildElement('GetQuoteDataSet', 'http://ws.cdyne.com/', '');   
   wsCdyneCom.GetQuoteDataSet_element request_x = new wsCdyneCom.GetQuoteDataSet_element(StockSymbols,LicenseKey);
   request_x.populateXmlNode(methodNode);
   
   HttpRequest req = new HttpRequest();
   req.setEndpoint(endpoint_x);
   req.setMethod('POST');
   req.setHeader('Content-Type', 'text/xml; charset=UTF-8');
   req.setHeader('SOAPAction', 'http://ws.cdyne.com/GetQuoteDataSet');
   req.setBodyDocument(doc);
   //System.debug(req.getBody());
   Http http = new Http();
   HTTPResponse res = http.send(req);
   //System.debug(res.getBody());
   Dom.Document responseDoc = res.getBodyDocument();
   Dom.XmlNode rootNode = responseDoc.getRootElement();
   Dom.XmlNode bodyNode = rootNode.getChildElement('Body','http://schemas.xmlsoap.org/soap/envelope/');
   Dom.XmlNode GetQuoteDataSetResponseNode = bodyNode.getChildElement('GetQuoteDataSetResponse', 'http://ws.cdyne.com/');
      
   wsCdyneCom.GetQuoteDataSetResponse_element response_x = new wsCdyneCom.GetQuoteDataSetResponse_element(GetQuoteDataSetResponseNode);
   return response_x.GetQuoteDataSetResult;
  }
  }
 public class GetQuickQuote_element {
  public String StockSymbol;
  public String LicenseKey;
  private String[] StockSymbol_type_info = new String[]{'StockSymbol','http://ws.cdyne.com/','string','0','1','false'};
  private String[] LicenseKey_type_info = new String[]{'LicenseKey','http://ws.cdyne.com/','string','0','1','false'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'StockSymbol','LicenseKey'};
  public GetQuickQuote_element(){
  }
  public GetQuickQuote_element(String StockSymbol,String LicenseKey){
   this.StockSymbol = StockSymbol;
   this.LicenseKey = LicenseKey;
  }
  public void populateXmlNode(Dom.XmlNode outerNode){
   
   //System.assertEquals('GetQuickQuote', outerNode.getName());
   Dom.XmlNode StockSymbolNode = outerNode.addChildElement('StockSymbol', 'http://ws.cdyne.com/', '');
   StockSymbolNode.addTextNode((this.StockSymbol == null) ? '' : this.StockSymbol);
   Dom.XmlNode LicenseKeyNode = outerNode.addChildElement('LicenseKey', 'http://ws.cdyne.com/', '');
   LicenseKeyNode.addTextNode((this.LicenseKey == null) ? '' : this.LicenseKey);
  }
 }
 public class GetQuickQuoteResponse_element {
  public Decimal GetQuickQuoteResult;
  private String[] GetQuickQuoteResult_type_info = new String[]{'GetQuickQuoteResult','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'GetQuickQuoteResult'};
  public GetQuickQuoteResponse_element(){
  }
  public GetQuickQuoteResponse_element(DOM.XmlNode responseNode){
   Set<DOM.XmlNode> nodesParsed = new Set<DOM.XmlNode>();
   //System.assertEquals('GetQuickQuoteResponse', responseNode.getName());
   DOM.XmlNode GetQuickQuoteResultNode = responseNode.getChildElement('GetQuickQuoteResult', 'http://ws.cdyne.com/');
   this.GetQuickQuoteResult = (GetQuickQuoteResultNode == null) ? null : Decimal.valueOf(GetQuickQuoteResultNode.getText());
   nodesParsed.add(GetQuickQuoteResultNode);
   //System.debug(this.GetQuickQuoteResult);   
  }
 }
 public class GetQuote_element {
  public String StockSymbol;
  public String LicenseKey;
  private String[] StockSymbol_type_info = new String[]{'StockSymbol','http://ws.cdyne.com/','string','0','1','false'};
  private String[] LicenseKey_type_info = new String[]{'LicenseKey','http://ws.cdyne.com/','string','0','1','false'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'StockSymbol','LicenseKey'};
  public GetQuote_element(){
  }
  public GetQuote_element(String StockSymbol,String LicenseKey){
   this.StockSymbol = StockSymbol;
   this.LicenseKey = LicenseKey;
  }
  public void populateXmlNode(Dom.XmlNode outerNode){
   
   //System.assertEquals('GetQuote', outerNode.getName());
   Dom.XmlNode StockSymbolNode = outerNode.addChildElement('StockSymbol', 'http://ws.cdyne.com/', '');
   StockSymbolNode.addTextNode((this.StockSymbol == null) ? '' : this.StockSymbol);
   Dom.XmlNode LicenseKeyNode = outerNode.addChildElement('LicenseKey', 'http://ws.cdyne.com/', '');
   LicenseKeyNode.addTextNode((this.LicenseKey == null) ? '' : this.LicenseKey);
  }
 }
 public class GetQuoteDataSet_element {
  public String StockSymbols;
  public String LicenseKey;
  private String[] StockSymbols_type_info = new String[]{'StockSymbols','http://ws.cdyne.com/','string','0','1','false'};
  private String[] LicenseKey_type_info = new String[]{'LicenseKey','http://ws.cdyne.com/','string','0','1','false'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'StockSymbols','LicenseKey'};
  public GetQuoteDataSet_element(){
  }
  public GetQuoteDataSet_element(String StockSymbols,String LicenseKey){
   this.StockSymbols = StockSymbols;
   this.LicenseKey = LicenseKey;
  }
  public void populateXmlNode(Dom.XmlNode outerNode){
   
   //System.assertEquals('GetQuoteDataSet', outerNode.getName());
   Dom.XmlNode StockSymbolsNode = outerNode.addChildElement('StockSymbols', 'http://ws.cdyne.com/', '');
   StockSymbolsNode.addTextNode((this.StockSymbols == null) ? '' : this.StockSymbols);
   Dom.XmlNode LicenseKeyNode = outerNode.addChildElement('LicenseKey', 'http://ws.cdyne.com/', '');
   LicenseKeyNode.addTextNode((this.LicenseKey == null) ? '' : this.LicenseKey);
  }
 }
 public class GetQuoteDataSetResponse_element {
  public wsCdyneCom.GetQuoteDataSetResponse_GetQuoteDataSetResult_element GetQuoteDataSetResult;
  private String[] GetQuoteDataSetResult_type_info = new String[]{'GetQuoteDataSetResult','http://ws.cdyne.com/','','0','1','false'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'GetQuoteDataSetResult'};
  public GetQuoteDataSetResponse_element(){
  }
  public GetQuoteDataSetResponse_element(DOM.XmlNode responseNode){
   Set<DOM.XmlNode> nodesParsed = new Set<DOM.XmlNode>();
   //System.assertEquals('GetQuoteDataSetResponse', responseNode.getName());
   DOM.XmlNode GetQuoteDataSetResultNode = responseNode.getChildElement('GetQuoteDataSetResult', 'http://ws.cdyne.com/');
   if(GetQuoteDataSetResultNode == null){
    this.GetQuoteDataSetResult = null;
   } else{
    wsCdyneCom.GetQuoteDataSetResponse_GetQuoteDataSetResult_element GetQuoteDataSetResultObj = new wsCdyneCom.GetQuoteDataSetResponse_GetQuoteDataSetResult_element(GetQuoteDataSetResultNode);
    nodesParsed.add(GetQuoteDataSetResultNode);
    this.GetQuoteDataSetResult = GetQuoteDataSetResultObj;
   }
   //System.debug(this.GetQuoteDataSetResult);   
  }
 }
 
 //Warning: Ignoring <s:element ref="s:schema"/> sequence Element
//Warning: '<xsd:any>' element type has been changed to dataType List<DOM.XmlNode> called anyElement
 public class GetQuoteDataSetResponse_GetQuoteDataSetResult_element {
  public List<DOM.XmlNode> anyElement;
  private String[] anyElement_type_info = new String[]{'anyElement','http://ws.cdyne.com/','List<DOM.XmlNode>','0','1','true'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'anyElement'};
  public GetQuoteDataSetResponse_GetQuoteDataSetResult_element(){
  }
  public GetQuoteDataSetResponse_GetQuoteDataSetResult_element(DOM.XmlNode responseNode){
   Set<DOM.XmlNode> nodesParsed = new Set<DOM.XmlNode>();
   
   this.anyElement = new List<DOM.XmlNode>();
            for(DOM.XmlNode childNode: responseNode.getChildElements()){
                if(!nodesParsed.contains(childNode)){
                    this.anyElement.add(childNode);
                }
            }
   //System.debug(this.anyElement);   
  }
  public void populateXmlNode(Dom.XmlNode outerNode){
   
   List<DOM.XmlNode> anyElementObj = this.anyElement;
   for(DOM.XmlNode anyNode: this.anyElement){
                Dom.XmlNode anyElementNode = outerNode.addChildElement(anyNode.getName(), anyNode.getNamespace(), ''); 
            }
  }
 }
 public class GetQuoteResponse_element {
  public wsCdyneCom.QuoteData GetQuoteResult;
  private String[] GetQuoteResult_type_info = new String[]{'GetQuoteResult','http://ws.cdyne.com/','QuoteData','1','1','false'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'GetQuoteResult'};
  public GetQuoteResponse_element(){
  }
  public GetQuoteResponse_element(DOM.XmlNode responseNode){
   Set<DOM.XmlNode> nodesParsed = new Set<DOM.XmlNode>();
   //System.assertEquals('GetQuoteResponse', responseNode.getName());
   DOM.XmlNode GetQuoteResultNode = responseNode.getChildElement('GetQuoteResult', 'http://ws.cdyne.com/');
   if(GetQuoteResultNode == null){
    this.GetQuoteResult = null;
   } else{
    wsCdyneCom.QuoteData GetQuoteResultObj = new wsCdyneCom.QuoteData(GetQuoteResultNode);
    nodesParsed.add(GetQuoteResultNode);
    this.GetQuoteResult = GetQuoteResultObj;
   }
   //System.debug(this.GetQuoteResult);   
  }
 }
 public class QuoteData {
  public String StockSymbol;
  public Decimal LastTradeAmount;
  public DateTime LastTradeDateTime;
  public Decimal StockChange;
  public Decimal OpenAmount;
  public Decimal DayHigh;
  public Decimal DayLow;
  public Integer StockVolume;
  public Decimal PrevCls;
  public String ChangePercent;
  public String FiftyTwoWeekRange;
  public Decimal EarnPerShare;
  public Decimal PE;
  public String CompanyName;
  public Boolean QuoteError;
  private String[] StockSymbol_type_info = new String[]{'StockSymbol','http://ws.cdyne.com/','string','0','1','false'};
  private String[] LastTradeAmount_type_info = new String[]{'LastTradeAmount','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] LastTradeDateTime_type_info = new String[]{'LastTradeDateTime','http://ws.cdyne.com/','dateTime','1','1','false'};
  private String[] StockChange_type_info = new String[]{'StockChange','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] OpenAmount_type_info = new String[]{'OpenAmount','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] DayHigh_type_info = new String[]{'DayHigh','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] DayLow_type_info = new String[]{'DayLow','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] StockVolume_type_info = new String[]{'StockVolume','http://ws.cdyne.com/','int','1','1','false'};
  private String[] PrevCls_type_info = new String[]{'PrevCls','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] ChangePercent_type_info = new String[]{'ChangePercent','http://ws.cdyne.com/','string','0','1','false'};
  private String[] FiftyTwoWeekRange_type_info = new String[]{'FiftyTwoWeekRange','http://ws.cdyne.com/','string','0','1','false'};
  private String[] EarnPerShare_type_info = new String[]{'EarnPerShare','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] PE_type_info = new String[]{'PE','http://ws.cdyne.com/','decimal','1','1','false'};
  private String[] CompanyName_type_info = new String[]{'CompanyName','http://ws.cdyne.com/','string','0','1','false'};
  private String[] QuoteError_type_info = new String[]{'QuoteError','http://ws.cdyne.com/','boolean','1','1','false'};
  private String[] apex_schema_type_info = new String[]{'http://ws.cdyne.com/','true','false'};
  private String[] field_order_type_info = new String[]{'StockSymbol','LastTradeAmount','LastTradeDateTime','StockChange','OpenAmount','DayHigh','DayLow','StockVolume','PrevCls','ChangePercent','FiftyTwoWeekRange','EarnPerShare','PE','CompanyName','QuoteError'};
  public QuoteData(){
  }
  public QuoteData(DOM.XmlNode responseNode){
   Set<DOM.XmlNode> nodesParsed = new Set<DOM.XmlNode>();
   DOM.XmlNode StockSymbolNode = responseNode.getChildElement('StockSymbol', 'http://ws.cdyne.com/');
   this.StockSymbol = (StockSymbolNode == null) ? null : StockSymbolNode.getText();
   nodesParsed.add(StockSymbolNode);
   //System.debug(this.StockSymbol);   
   DOM.XmlNode LastTradeAmountNode = responseNode.getChildElement('LastTradeAmount', 'http://ws.cdyne.com/');
   this.LastTradeAmount = (LastTradeAmountNode == null) ? null : Decimal.valueOf(LastTradeAmountNode.getText());
   nodesParsed.add(LastTradeAmountNode);
   //System.debug(this.LastTradeAmount);   
   DOM.XmlNode LastTradeDateTimeNode = responseNode.getChildElement('LastTradeDateTime', 'http://ws.cdyne.com/');
   this.LastTradeDateTime = (LastTradeDateTimeNode == null) ? null :  wsCdyneCom.parseDateTime(LastTradeDateTimeNode.getText());
   nodesParsed.add(LastTradeDateTimeNode);
   //System.debug(this.LastTradeDateTime);   
   DOM.XmlNode StockChangeNode = responseNode.getChildElement('StockChange', 'http://ws.cdyne.com/');
   this.StockChange = (StockChangeNode == null) ? null : Decimal.valueOf(StockChangeNode.getText());
   nodesParsed.add(StockChangeNode);
   //System.debug(this.StockChange);   
   DOM.XmlNode OpenAmountNode = responseNode.getChildElement('OpenAmount', 'http://ws.cdyne.com/');
   this.OpenAmount = (OpenAmountNode == null) ? null : Decimal.valueOf(OpenAmountNode.getText());
   nodesParsed.add(OpenAmountNode);
   //System.debug(this.OpenAmount);   
   DOM.XmlNode DayHighNode = responseNode.getChildElement('DayHigh', 'http://ws.cdyne.com/');
   this.DayHigh = (DayHighNode == null) ? null : Decimal.valueOf(DayHighNode.getText());
   nodesParsed.add(DayHighNode);
   //System.debug(this.DayHigh);   
   DOM.XmlNode DayLowNode = responseNode.getChildElement('DayLow', 'http://ws.cdyne.com/');
   this.DayLow = (DayLowNode == null) ? null : Decimal.valueOf(DayLowNode.getText());
   nodesParsed.add(DayLowNode);
   //System.debug(this.DayLow);   
   DOM.XmlNode StockVolumeNode = responseNode.getChildElement('StockVolume', 'http://ws.cdyne.com/');
   this.StockVolume = (StockVolumeNode == null) ? null : Integer.valueOf(StockVolumeNode.getText());
   nodesParsed.add(StockVolumeNode);
   //System.debug(this.StockVolume);   
   DOM.XmlNode PrevClsNode = responseNode.getChildElement('PrevCls', 'http://ws.cdyne.com/');
   this.PrevCls = (PrevClsNode == null) ? null : Decimal.valueOf(PrevClsNode.getText());
   nodesParsed.add(PrevClsNode);
   //System.debug(this.PrevCls);   
   DOM.XmlNode ChangePercentNode = responseNode.getChildElement('ChangePercent', 'http://ws.cdyne.com/');
   this.ChangePercent = (ChangePercentNode == null) ? null : ChangePercentNode.getText();
   nodesParsed.add(ChangePercentNode);
   //System.debug(this.ChangePercent);   
   DOM.XmlNode FiftyTwoWeekRangeNode = responseNode.getChildElement('FiftyTwoWeekRange', 'http://ws.cdyne.com/');
   this.FiftyTwoWeekRange = (FiftyTwoWeekRangeNode == null) ? null : FiftyTwoWeekRangeNode.getText();
   nodesParsed.add(FiftyTwoWeekRangeNode);
   //System.debug(this.FiftyTwoWeekRange);   
   DOM.XmlNode EarnPerShareNode = responseNode.getChildElement('EarnPerShare', 'http://ws.cdyne.com/');
   this.EarnPerShare = (EarnPerShareNode == null) ? null : Decimal.valueOf(EarnPerShareNode.getText());
   nodesParsed.add(EarnPerShareNode);
   //System.debug(this.EarnPerShare);   
   DOM.XmlNode PENode = responseNode.getChildElement('PE', 'http://ws.cdyne.com/');
   this.PE = (PENode == null) ? null : Decimal.valueOf(PENode.getText());
   nodesParsed.add(PENode);
   //System.debug(this.PE);   
   DOM.XmlNode CompanyNameNode = responseNode.getChildElement('CompanyName', 'http://ws.cdyne.com/');
   this.CompanyName = (CompanyNameNode == null) ? null : CompanyNameNode.getText();
   nodesParsed.add(CompanyNameNode);
   //System.debug(this.CompanyName);   
   DOM.XmlNode QuoteErrorNode = responseNode.getChildElement('QuoteError', 'http://ws.cdyne.com/');
   this.QuoteError = (QuoteErrorNode == null) ? null : Boolean.valueOf(QuoteErrorNode.getText());
   nodesParsed.add(QuoteErrorNode);
   //System.debug(this.QuoteError);   
  }
  public void populateXmlNode(Dom.XmlNode outerNode){
   Dom.XmlNode StockSymbolNode = outerNode.addChildElement('StockSymbol', 'http://ws.cdyne.com/', '');
   StockSymbolNode.addTextNode((this.StockSymbol == null) ? '' : this.StockSymbol);
   Dom.XmlNode LastTradeAmountNode = outerNode.addChildElement('LastTradeAmount', 'http://ws.cdyne.com/', '');
   if(this.LastTradeAmount != null){
    LastTradeAmountNode.addTextNode(String.valueOf(this.LastTradeAmount));
   }
   Dom.XmlNode LastTradeDateTimeNode = outerNode.addChildElement('LastTradeDateTime', 'http://ws.cdyne.com/', '');
   if(this.LastTradeDateTime != null){
    LastTradeDateTimeNode.addTextNode(String.valueOf(this.LastTradeDateTime));
   }
   Dom.XmlNode StockChangeNode = outerNode.addChildElement('StockChange', 'http://ws.cdyne.com/', '');
   if(this.StockChange != null){
    StockChangeNode.addTextNode(String.valueOf(this.StockChange));
   }
   Dom.XmlNode OpenAmountNode = outerNode.addChildElement('OpenAmount', 'http://ws.cdyne.com/', '');
   if(this.OpenAmount != null){
    OpenAmountNode.addTextNode(String.valueOf(this.OpenAmount));
   }
   Dom.XmlNode DayHighNode = outerNode.addChildElement('DayHigh', 'http://ws.cdyne.com/', '');
   if(this.DayHigh != null){
    DayHighNode.addTextNode(String.valueOf(this.DayHigh));
   }
   Dom.XmlNode DayLowNode = outerNode.addChildElement('DayLow', 'http://ws.cdyne.com/', '');
   if(this.DayLow != null){
    DayLowNode.addTextNode(String.valueOf(this.DayLow));
   }
   Dom.XmlNode StockVolumeNode = outerNode.addChildElement('StockVolume', 'http://ws.cdyne.com/', '');
   if(this.StockVolume != null){
    StockVolumeNode.addTextNode(String.valueOf(this.StockVolume));
   }
   Dom.XmlNode PrevClsNode = outerNode.addChildElement('PrevCls', 'http://ws.cdyne.com/', '');
   if(this.PrevCls != null){
    PrevClsNode.addTextNode(String.valueOf(this.PrevCls));
   }
   Dom.XmlNode ChangePercentNode = outerNode.addChildElement('ChangePercent', 'http://ws.cdyne.com/', '');
   ChangePercentNode.addTextNode((this.ChangePercent == null) ? '' : this.ChangePercent);
   Dom.XmlNode FiftyTwoWeekRangeNode = outerNode.addChildElement('FiftyTwoWeekRange', 'http://ws.cdyne.com/', '');
   FiftyTwoWeekRangeNode.addTextNode((this.FiftyTwoWeekRange == null) ? '' : this.FiftyTwoWeekRange);
   Dom.XmlNode EarnPerShareNode = outerNode.addChildElement('EarnPerShare', 'http://ws.cdyne.com/', '');
   if(this.EarnPerShare != null){
    EarnPerShareNode.addTextNode(String.valueOf(this.EarnPerShare));
   }
   Dom.XmlNode PENode = outerNode.addChildElement('PE', 'http://ws.cdyne.com/', '');
   if(this.PE != null){
    PENode.addTextNode(String.valueOf(this.PE));
   }
   Dom.XmlNode CompanyNameNode = outerNode.addChildElement('CompanyName', 'http://ws.cdyne.com/', '');
   CompanyNameNode.addTextNode((this.CompanyName == null) ? '' : this.CompanyName);
   Dom.XmlNode QuoteErrorNode = outerNode.addChildElement('QuoteError', 'http://ws.cdyne.com/', '');
   if(this.QuoteError != null){
    QuoteErrorNode.addTextNode(String.valueOf(this.QuoteError));
   }
  }
 }
}