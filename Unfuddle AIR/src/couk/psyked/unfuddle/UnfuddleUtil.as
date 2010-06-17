package couk.psyked.unfuddle
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	
	import mx.managers.CursorManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.InvokeEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class UnfuddleUtil implements IUFUtil
	{
		private var rtnObject:IUFDataModel;
		
		public static var account:String;
		private var srv:HTTPService = new HTTPService();
		private var urlloader:URLLoader = new URLLoader();
		private var urlrequest:URLRequest = new URLRequest();
		private var requestUrl:String;
		private var resultFormat:String = "e4x";
		
		public function UnfuddleUtil(str:String)
		{
			this.requestUrl = "http://" + UnfuddleUtil.account + str;
			this.srv.headers["Authorization"] = AuthCredentials.authheader;
	        this.srv.headers["Accept"] = "application/xml";
	        this.srv.headers["Content-type"] = "application/xml";
	        this.srv.addEventListener(ResultEvent.RESULT, onGetSuccess);
			this.srv.addEventListener(InvokeEvent.INVOKE, onInvoke);
			this.srv.addEventListener(FaultEvent.FAULT, onError);
			this.srv.resultFormat = this.resultFormat;
			this.srv.url = this.requestUrl;
			this.srv.method = URLRequestMethod.GET;
			
			this.urlrequest.requestHeaders = new Array(new URLRequestHeader("Content-Type", "application/xml"), 
	            							 new URLRequestHeader("Accept", "application/xml"), 
	            							 new URLRequestHeader("Authorization", AuthCredentials.authheader));
	        this.urlloader.addEventListener(Event.COMPLETE, onPostSuccess);
			this.urlloader.addEventListener(InvokeEvent.INVOKE, onInvoke);
			this.urlloader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			this.urlloader.dataFormat = this.resultFormat;
			this.urlrequest.url = this.requestUrl;	            
		}
		
		public function postDetails(_postXML:XML):void
		{
			this.urlrequest.method = URLRequestMethod.POST;
			this.urlrequest.data = _postXML;
			this.urlloader.load(this.urlrequest);
			this.urlloader.dispatchEvent(new InvokeEvent(InvokeEvent.INVOKE));		
		}
		
		public function putDetails(_postXML:XML):void
		{
			this.urlrequest.method = URLRequestMethod.PUT;
			this.urlrequest.data = _postXML;			
			this.urlloader.load(this.urlrequest);
			this.urlloader.dispatchEvent(new InvokeEvent(InvokeEvent.INVOKE));		
		}
		
		public function deleteDetails():void {
			this.urlrequest.method = URLRequestMethod.DELETE;
			this.urlloader.load(this.urlrequest);
			this.urlloader.dispatchEvent(new InvokeEvent(InvokeEvent.INVOKE));
		}
		
		public function getDetails(_rtnObject:IUFDataModel):void
		{
			rtnObject = _rtnObject;
			this.srv.send();
		}
		
		private function onPostSuccess(e:Event):void {
			CursorManager.removeBusyCursor();
			//this.getDetails(rtnObject);
		}
		
		private function onGetSuccess(e:ResultEvent):void {
			CursorManager.removeBusyCursor();
			rtnObject.parse(XML(e.result));
		}
		
		private function onInvoke(e:InvokeEvent):void {
			CursorManager.setBusyCursor();
		}
		
		private function onIOError(e:IOErrorEvent):void {
			CursorManager.removeBusyCursor();
			//trace("onIOError", e.errorID)
		}
		
		private function onError(e:FaultEvent):void {
			CursorManager.removeBusyCursor();
			//trace("onFault", e.message)
		}
	}
}