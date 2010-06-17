package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	import mx.collections.ArrayCollection;
	
	public class MilestoneCollection extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var items:ArrayCollection = new ArrayCollection();
		
		public function MilestoneCollection()
		{
			//
		}
		
		public function parse(_xml:XML):void
		{
			this.clearItems();
			var blank:MilestoneModel = new MilestoneModel();
				blank.title = "No Milestone set";
			this.items.addItem(blank);
			for each (var node:XML in _xml..milestone) {
				var a:MilestoneModel = new MilestoneModel();
					a.parse(XML("<items>" + node + "</items>"));
				this.items.addItem(a);
			}
		}
		
		private function clearItems():void {
			items.removeAll();
		}
	}
}