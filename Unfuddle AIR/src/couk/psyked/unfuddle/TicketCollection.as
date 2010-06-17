package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	import mx.collections.ArrayCollection;
	
	public class TicketCollection extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var items:ArrayCollection = new ArrayCollection();
		
		public function TicketCollection()
		{
			//
		}
		
		public function parse(_xml:XML):void
		{
			this.clearItems();
			for each (var node:XML in _xml..ticket) {
				var a:TicketModel = new TicketModel();
					a.parse(XML("<items>" + node + "</items>"));
				this.items.addItem(a);
			}
		}
		
		private function clearItems():void {
			items.removeAll();
		}
	}
}