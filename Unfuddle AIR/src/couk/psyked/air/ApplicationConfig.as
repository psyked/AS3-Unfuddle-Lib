package couk.psyked.air
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class ApplicationConfig
	{
		internal static var _instance:ApplicationConfig;
		internal static var _initalised:Boolean = false;
		
		private static var configFile:XML;
		//private static var ns:Namespace;
		
		public function ApplicationConfig()
		{
			init();            
		}
		
		private function init():void {
			_instance = this;
			_initalised = getConfigFile();
		}
		/**
		 * Retrives the XML configuration file.
		 * 
		 * @return Returns true if the file already exists, or false if not.
		 */
		private function getConfigFile():Boolean {
			var _rtn:Boolean = false;
			var file:File = new File("app-storage:/configuration.xml");
			if(file.exists) {
				_rtn = true;
			} else {
				createBlankConfigFile();
			}
			configFile = XML(readConfigFile());
			//ns = configFile.namespace();
			
			return _rtn;
		}
		
		private function readConfigFile():String {
			var file:File = File.applicationStorageDirectory;
				file = file.resolvePath("configuration.xml");
			trace("Reading Config file from: ", file.nativePath);
				
			var fileStream:FileStream = new FileStream();
				fileStream.open(file, FileMode.READ);
			
			var _rtn:String = fileStream.readUTFBytes(fileStream.bytesAvailable);
				//fileStream.addEventListener(Event.CLOSE, fileClosed);
				//fileStream.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
				fileStream.close();
				
			//function onIOError(e:IOErrorEvent):void {
				// 
			//}
			
			//trace("readConfigfile Return: ", _rtn);
			return _rtn;
		}
		
		private function createBlankConfigFile():void {
			//trace("Creating Blank configuration file.");
			var myXML:XML = 
		    <configuration>
		        <settings>
		            <name>New Configuration file.</name>
		        </settings>
		    </configuration>;
		    
		    var file:File = File.applicationStorageDirectory;
				file = file.resolvePath("configuration.xml");
				
			var fileStream:FileStream = new FileStream();
				fileStream.open(file, FileMode.WRITE);
				try {
					fileStream.writeUTFBytes(myXML);
				} catch (e:*) {}
				//fileStream.addEventListener(Event.CLOSE, fileClosed);
				fileStream.close();
			
			//function fileClosed(e:Event):void {
			    //trace("File writing complete.");
			//} 
		}
		
		public static function getSetting(settingName:String):String {
			if(!_initalised){
				//trace("Is not initalised");
				if(_instance == null){
					//trace("Does not exist");
					new ApplicationConfig();
				}
				_instance.init();
			}
			//trace("Getting setting '" + settingName + "'");
			var _rtn:String = "";
			
			try {
				_rtn = configFile.settings.child(settingName)[0].value;
				//trace(_rtn)
			} catch (e:*) {}
			//trace("Return = "+_rtn);
			return _rtn;
		}
		/**
		 * @param settingName
		 * String name of the setting to create in the configuration file.
		 */
		public static function setSetting(settingName:String, _str:*):void {
			
			var str:String = _str.toString();
			
			if(!_initalised){
				//trace("Is not initalised");
				if(_instance == null){
					//trace("Does not exist");
					new ApplicationConfig();
				}
				_instance.init();
			}
			/**
			* In the first release of this code, a configuration file was created with the setting
			* node rather than the settings node, which caused things to fail.  This line cleans up
			* the first versions' incorrect settings by deleting them if it finds them.  
			*/			
			if(configFile.setting){
				configFile.replace("setting", "");
			}
			//trace("getSetting(" + settingName + ") = '" + getSetting(settingName) + "'");
			//trace("configFile.settings.child(settingName)[0].value.toString() = "+configFile.settings.child(settingName)[0].value.toString())
			var _newchild:XML = XML(<{settingName}><value>{str}</value></{settingName}>);
			//
			if(getSetting(settingName) == '') {
				//trace(configFile.settings)
				if(configFile.settings.toString() == '') {
					//trace("erk!")
					_newchild = XML(<settings><name /></settings>);
					configFile.appendChild(_newchild);
				} else {
					//TODO: Need to check if settings node exists, and if not, create it.
					//trace("blank")
					configFile.settings.appendChild(_newchild);
				}
			} else {
				//trace("not blank")
				configFile.settings.child(settingName)[0].value = str;
			}
			var file:File = File.applicationStorageDirectory;
				file = file.resolvePath("configuration.xml");
				
			var fileStream:FileStream = new FileStream();
				fileStream.open(file, FileMode.WRITE);
				try {
					fileStream.writeUTFBytes(configFile);
				} catch (e:*) {}
				//fileStream.addEventListener(Event.CLOSE, fileClosed);
				fileStream.close();
		}

	}
}