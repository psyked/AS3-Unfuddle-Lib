package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	
	public class MessageModel extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var authorid:String;
		[Bindable]
		public var body:String;
		[Bindable]
		public var bodyformatted:String;
		[Bindable]
		public var createdat:String;
		[Bindable]
		public var id:String;
		[Bindable]
		public var projectid:String;
		[Bindable]
		public var title:String;
		[Bindable]
		public var updatedat:String;
		[Bindable]
		public var categories:XMLList;
		
		public function MessageModel()
		{
			//TODO: implement function
		}
		
		public function parse(xml:XML):void {
			this.authorid = xml.message["author-id"];
			this.body = xml.message["body"];
			this.bodyformatted = xml.message["body-formatted"];
			this.createdat = xml.message["created-at"];
			this.id = xml.message["id"];
			this.projectid = xml.message["project-id"];
			this.title = xml.message["title"];
			this.updatedat = xml.message["updated-at"];
			this.categories = xml.message["categories"];
		}
	}
}