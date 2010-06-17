package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	
	/*
	<milestone>
	  <archived type="boolean"> [true, false] </archived>
	  <completed type="boolean"> [true, false] </completed>
	  <created-at type="datetime"> </created-at>
	  <due-on type="date"> </due-on>
	  <due-on-formatted> </due-on-formatted>
	  <id type="integer"> </id>
	  <person-responsible-id type="integer"> </person-responsible-id>
	  <project-id type="integer"> </project-id>
	  <title> </title>
	  <updated-at type="datetime"> </updated-at>
	</milestone>
	*/
	
	public class MilestoneModel extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var archived:String;
		[Bindable]
		public var completed:String;
		[Bindable]
		public var createdat:String;
		[Bindable]
		public var dueon:String;
		[Bindable]
		public var id:String;
		[Bindable]
		public var personresponsibleid:String;
		[Bindable]
		public var projectid:String;
		[Bindable]
		public var title:String;
		[Bindable]
		public var updatedat:String;
		
		public function MilestoneModel()
		{
			//TODO: implement function
		}
		
		public function parse(xml:XML):void {
			this.archived = xml.milestone["archived"];
			this.completed = xml.milestone["completed"];
			this.createdat = xml.milestone["created-at"];
			this.dueon = xml.milestone["due-on"];
			this.id = xml.milestone["id"];
			this.personresponsibleid = xml.milestone["person-responsible-id"];
			this.projectid = xml.milestone["project-id"];
			this.title = xml.milestone["title"];
			this.updatedat = xml.milestone["updated-at"];
		}
	}
}