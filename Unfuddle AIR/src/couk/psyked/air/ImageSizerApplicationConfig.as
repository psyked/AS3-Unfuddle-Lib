package couk.psyked.air
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.binding.utils.BindingUtils;
	import mx.core.UIComponent;
	
	public class ImageSizerApplicationConfig extends UIComponent
	{
		private static var instance:ImageSizerApplicationConfig;
		
		[Bindable]
		public var START_X:int = 0;
		
		[Bindable]
		public var START_Y:int = 0;
		
		[Bindable]
		public var START_WIDTH:uint = 800;
		
		[Bindable]
		public var START_HEIGHT:uint = 600;
		
		[Bindable]
		public var ALLOW_CHECK_FOR_UPDATES:Boolean = true;
		
		[Bindable]
		public var USE_PIXEL_BENDER_FILTERS:Boolean = true;
		
		[Bindable]
		public var USE_WINDOW_TRANSITIONS:Boolean = true;
		
		[Bindable]
		public var CHECK_FOR_UPDATES_AUTO:Boolean = true;
		
		[Bindable]
		public var SAVE_WINDOW_LOCATION:Boolean = true;
		
		[Bindable]
		public var OPEN_CENTRED_ONSCREEN:Boolean = true;
			
		/**
		 * This class acts as an intermediary between the ApplicationConfig class, stores
		 * static variables and makes the settings available for data binding. 
		 */
		
		public function ImageSizerApplicationConfig()
		{
			if(instance == null) {
				instance = this;
			} else {
				throw new Error("ImageSizerApplicationConfig should be a singleton");
			}
			
			refreshConfigFile();
	
			BindingUtils.bindSetter(changeStartX, this, "START_X");
			BindingUtils.bindSetter(changeStartY, this, "START_Y");
			BindingUtils.bindSetter(changeStartWidth, this, "START_WIDTH");
			BindingUtils.bindSetter(changeStartHeight, this, "START_HEIGHT");
			BindingUtils.bindSetter(changeAllowCheckForUpdates, this, "ALLOW_CHECK_FOR_UPDATES");
			BindingUtils.bindSetter(changeUsePixelBenderFilters, this, "USE_PIXEL_BENDER_FILTERS");
			BindingUtils.bindSetter(changeUseWindowTransitions, this, "USE_WINDOW_TRANSITIONS");
			BindingUtils.bindSetter(changeCheckForUpdatesAutomatically, this, "CHECK_FOR_UPDATES_AUTO");
			BindingUtils.bindSetter(changeWindowLocation, this, "SAVE_WINDOW_LOCATION");
			BindingUtils.bindSetter(changeCentredOnScreen, this, "OPEN_CENTRED_ONSCREEN");
	    }
	    
	    public static function createDefaultConfigFile():void {
			//trace("Creating Blank configuration file.");
			var myXML:XML = 
		    <configuration>
			  <settings>
			    <startX>
			      <value>200</value>
			    </startX>
			    <startY>
			      <value>200</value>
			    </startY>
			    <startWidth>
			      <value>800</value>
			    </startWidth>
			    <startHeight>
			      <value>600</value>
			    </startHeight>
			    <allowCheckForUpdates>
			      <value>true</value>
			    </allowCheckForUpdates>
			    <usePixelBenderFilters>
			      <value>true</value>
			    </usePixelBenderFilters>
			    <useWindowTransitions>
			      <value>true</value>
			    </useWindowTransitions>
			    <checkForUpdatesAutomatically>
			      <value>true</value>
			    </checkForUpdatesAutomatically>
			    <saveWindowLocation>
			      <value>true</value>
			    </saveWindowLocation>
			  </settings>
			</configuration>;
		    
		    var file:File = File.applicationStorageDirectory;
				file = file.resolvePath("configuration.xml");
				
			var fileStream:FileStream = new FileStream();
				fileStream.open(file, FileMode.WRITE);
				try {
					fileStream.writeUTFBytes(myXML);
				} catch (e:*) {}
				fileStream.close();
	    }
	    
	    public static function refreshConfigFile():void {
	    	instance.ALLOW_CHECK_FOR_UPDATES = Boolean(ApplicationConfig.getSetting("allowCheckForUpdates") == "true");
	    	instance.CHECK_FOR_UPDATES_AUTO = Boolean(ApplicationConfig.getSetting("checkForUpdatesAutomatically") == "true");
	    	instance.SAVE_WINDOW_LOCATION = Boolean(ApplicationConfig.getSetting("saveWindowLocation") == "true");
	    	instance.START_HEIGHT = uint(ApplicationConfig.getSetting("startHeight"));
	    	instance.START_WIDTH = uint(ApplicationConfig.getSetting("startWidth"));
	    	instance.START_X = int(ApplicationConfig.getSetting("startX"));
	    	instance.START_Y = int(ApplicationConfig.getSetting("startY"));
	    	instance.USE_PIXEL_BENDER_FILTERS = Boolean(ApplicationConfig.getSetting("usePixelBenderFilters") == "true");
	    	instance.USE_WINDOW_TRANSITIONS = Boolean(ApplicationConfig.getSetting("useWindowTransitions") == "true");
	    	instance.OPEN_CENTRED_ONSCREEN = Boolean(ApplicationConfig.getSetting("changeCentredOnScreen") == "true");
	    }
        
        private function changeStartX(newValue:String):void {
			//trace("changeStartX newValue = "+newValue)
			ApplicationConfig.setSetting("startX", newValue);
		}
		
		private function changeStartY(newValue:String):void {
			//trace("changeStartY newValue = "+newValue)
			ApplicationConfig.setSetting("startY", newValue);
		}
		
        private function changeStartWidth(newValue:String):void {
			//trace("changeStartWidth newValue = "+newValue)
			ApplicationConfig.setSetting("startWidth", newValue);
		}
		
		private function changeStartHeight(newValue:String):void {
			//trace("changeStartHeight newValue = "+newValue)
			ApplicationConfig.setSetting("startHeight", newValue);
		}
		
        private function changeAllowCheckForUpdates(newValue:String):void {
			//trace("changeAllowCheckForUpdates newValue = "+newValue)
			ApplicationConfig.setSetting("allowCheckForUpdates", newValue);
		}
        
        private function changeUsePixelBenderFilters(newValue:String):void {
			//trace("changeUsePixelBenderFilters newValue = "+newValue)
			ApplicationConfig.setSetting("usePixelBenderFilters", newValue);
		}
        
        private function changeUseWindowTransitions(newValue:String):void {
			//trace("changeUseWindowTransitions newValue = "+newValue)
			ApplicationConfig.setSetting("useWindowTransitions", newValue);
		}
		
        private function changeCheckForUpdatesAutomatically(newValue:String):void {
			//trace("changeCheckForUpdatesAutomatically newValue = "+newValue)
			ApplicationConfig.setSetting("checkForUpdatesAutomatically", newValue);
		}
		
		private function changeWindowLocation(newValue:String):void {
			//trace("changeWindowLocation newValue = "+newValue)
			ApplicationConfig.setSetting("saveWindowLocation", newValue);
		}
		
		private function changeCentredOnScreen(newValue:String):void {
			//trace("openCentredOnScreen newValue = "+newValue)
			ApplicationConfig.setSetting("openCentredOnScreen", newValue);
		}
		
		public static function getInstance():ImageSizerApplicationConfig {
			if(instance == null){
				instance = new ImageSizerApplicationConfig();
			}
			return instance;
		}
	}
}