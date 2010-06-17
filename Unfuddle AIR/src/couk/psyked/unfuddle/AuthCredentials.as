package couk.psyked.unfuddle 
{  
	import mx.utils.Base64Encoder;
            
    public class AuthCredentials  
    {  
      
        private static var instance:AuthCredentials;  
  
        private static var _username:String;
        private static var _password:String;
        
        private static var encoder:Base64Encoder = new Base64Encoder();
        
          
        public static function getInstance():AuthCredentials  
        {  
            if(instance==null)  instance = new AuthCredentials();
            return instance;  
        }  
  
        public function AuthCredentials()  
        {  
              
            if(instance!=null) throw new Error("Error: Singletons can only be instantiated via getInstance() method!");  
            AuthCredentials.instance = this;  
        }  
        
        public static function set username(str:String):void {
        	_username = str;
        }
        
        public static function set password(str:String):void {
        	_password = str;
        }
        
        public static function get authheader():String {
        	encoder.encode(_username+":"+_password);
	        var authCode:String = "Basic " + encoder.toString();
	        return authCode;
        }
        
    }  
}