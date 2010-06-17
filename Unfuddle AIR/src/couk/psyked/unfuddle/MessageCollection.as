package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	public class MessageCollection extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var items:ArrayCollection = new ArrayCollection();
		
		public function MessageCollection()
		{
			//
		}
		
		public function parse(_xml:XML):void
		{
			this.clearItems();
			for each (var node:XML in _xml..message) {
				var a:MessageModel = new MessageModel();
					a.parse(XML("<items>" + node + "</items>"));
				this.items.addItem(a);
			}
		}
		
		private function clearItems():void {
			items.removeAll();
		}
	}
}