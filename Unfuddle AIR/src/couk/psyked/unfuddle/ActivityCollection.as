package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	public class ActivityCollection extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var items:ArrayCollection = new ArrayCollection();
		
		public function ActivityCollection()
		{
			//
		}
		
		public function parse(_xml:XML):void
		{
			this.clearItems();
			for each (var node:XML in _xml..event) {
				var a:ActivityModel = new ActivityModel();
					a.parse(XML("<items>" + node + "</items>"));
				this.items.addItem(a);
			}
		}
		
		private function clearItems():void {
			items.removeAll();
		}
	}
}