package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	
	public class ProjectModel extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var accountId:String;
		[Bindable]
		public var archived:String;
		[Bindable]
		public var createdAt:String;
		[Bindable]
		public var description:String;
		[Bindable]
		public var size:String;
		[Bindable]
		public var enableTimeTracking:String;
		[Bindable]
		public var id:String;
		[Bindable]
		public var shortName:String;
		[Bindable]
		public var theme:String;
		[Bindable]
		public var title:String;
		[Bindable]
		public var updatedAt:String;
		
		public function ProjectModel()
		{
			//TODO: implement function
		}
		
		public function parse(xml:XML):void {
			
			//trace("Parsing:",xml)
			this.accountId = xml.project["account-id"];
			this.archived = xml.project["archived"];
			this.createdAt = xml.project["created-at"];
			this.description = xml.project["description"];
			this.size = xml.project["disk-usage"];
			this.enableTimeTracking = xml.project["enable-time-tracking"];
			this.id = xml.project["id"];
			this.shortName = xml.project["short-name"];
			this.theme = xml.project["theme"];
			this.title = xml.project["title"];
			this.updatedAt = xml.project["updated-at"];
			
		}
	}
}