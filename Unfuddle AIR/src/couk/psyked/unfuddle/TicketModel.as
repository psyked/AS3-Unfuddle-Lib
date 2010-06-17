package couk.psyked.unfuddle
{
	/**
	 *	<ticket>
	 *	  <assignee-id type="integer"> </assignee-id>
	 *	  <component-id type="integer"> </component-id>
	 *	  <created-at type="datetime"> </created-at>
	 *	  <description> </description>
	 *	  <description-formatted> <!-- only available if formatted=true --> </description-formatted>
	 *	  <due-on type="date"> </due-on>
	 *	  <due-on-formatted> </due-on-formatted>
	 *	  <hours-estimate-current type="float"> </hours-estimate-current>
	 *	  <hours-estimate-initial type="float"> </hours-estimate-initial>
	 *	  <id type="integer"> </id>
	 *	  <milestone-id type="integer"> </milestone-id>
	 *	  <number type="integer"> </number>
	 *	  <priority> [1, 2, 3, 4, 5] </priority>
	 *	  <project-id type="integer"> </project-id>
	 *	  <reporter-id type="integer"> </reporter-id>
	 *	  <resolution> [fixed, works_for_me, postponed, duplicate, will_not_fix, invalid] </resolution>
	 *	  <resolution-description> </resolution-description>
	 *	  <resolution-description-formatted> <!-- only available if formatted=true --> </resolution-description-formatted>
	 *	  <severity-id type="integer"> </severity-id>
	 *	  <status> [new, unaccepted, reassigned, reopened, accepted, resolved, closed] </status>
	 *	  <summary> </summary>
	 *	  <updated-at type="datetime"> </updated-at>
	 *	  <version-id type="integer"> </version-id>
	 *	</ticket> 
	 */	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	public class TicketModel extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var assigneeId:uint;
		[Bindable]
		public var componentId:String
		[Bindable]
		public var createdAt:String;
		[Bindable]
		public var description:String;
		[Bindable]
		public var descriptionFormatted:String;
		[Bindable]
		public var dueOn:String;
		[Bindable]
		public var dueOnFormatted:String;
		[Bindable]
		public var hoursEstimateCurrent:String
		[Bindable]
		public var hoursEstimateInital:String
		[Bindable]
		public var id:uint;
		[Bindable]
		public var milestoneId:String;
		[Bindable]
		public var number:String;
		[Bindable]
		public var priority:String;
		[Bindable]
		public var projectId:String;
		[Bindable]
		public var reporterId:String;
		[Bindable]
		public var resolution:String;
		[Bindable]
		public var resolutionDescription:String;
		[Bindable]
		public var resolutionDescriptionFormatted:String;
		[Bindable]
		public var severity:String;
		[Bindable]
		public var status:String;
		[Bindable]
		public var summary:String;
		[Bindable]
		public var updatedAt:String;
		[Bindable]
		public var versionId:String;
		
		public static var STATUS_OPTIONS:Array = ["new", "unaccepted", "reassigned", "reopened", "accepted", "resolved", "closed"];
		
		public function TicketModel()
		{
			//
		}
		
		public function parse(xml:XML):void {
			this.assigneeId = xml.ticket["assignee-id"];
			this.componentId = xml.ticket["component-id"];
			this.createdAt = xml.ticket["created-at"];
			this.description = xml.ticket["description"];
			this.descriptionFormatted = xml.ticket["description-formatted"];
			this.dueOn = xml.ticket["due-on"];
			this.dueOnFormatted = xml.ticket["due-on-formatted"];
			this.hoursEstimateCurrent = xml.ticket["hours-estimate-current"];
			this.hoursEstimateInital = xml.ticket["hours-estimate-initial"];
			this.id = xml.ticket["id"];
			this.milestoneId = xml.ticket["milestone-id"];
			this.number = xml.ticket["number"];
			this.priority = xml.ticket["priority"];
			this.projectId = xml.ticket["project-id"];
			this.reporterId = xml.ticket["reporter-id"];
			this.resolution = xml.ticket["resolution"];
			this.resolutionDescription = xml.ticket["resolution-description"];
			this.resolutionDescriptionFormatted = xml.ticket["resolution-description-formatted"];
			this.severity = xml.ticket["severity-id"];
			this.status = xml.ticket["status"];
			this.summary = xml.ticket["summary"];
			this.updatedAt = xml.ticket["updated-at"];
			this.versionId = xml.ticket["version-id"];
		}
		
		public function toXML():XML {
			var rtn:XML = <ticket>
							  <assignee-id type="integer">{this.assigneeId}</assignee-id>
							  <component-id type="integer">{this.componentId}</component-id>
							  <description>{this.description}</description>
							  <!-- <due-on type="date">{new Date(this.dueOn)}</due-on> -->
							  <hours-estimate-current type="float">{this.hoursEstimateCurrent}</hours-estimate-current>
							  <hours-estimate-initial type="float">{this.hoursEstimateInital}</hours-estimate-initial>
							  <id>{this.id}</id>
							  <milestone-id type="integer">{this.milestoneId}</milestone-id>
							  <number type="integer">{this.number}</number>
							  <priority>{this.priority}</priority>
							  <resolution>{this.resolution}</resolution>
							  <resolution-description>{this.resolutionDescription}</resolution-description>
							  <severity-id type="integer">{this.severity}</severity-id>
							  <status>{this.status}</status>
							  <summary>{this.summary}</summary>
							  <version-id type="integer">{this.versionId}</version-id>
						  </ticket>;		
			return rtn;
		}
	}
}