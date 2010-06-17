package couk.psyked.unfuddle
{
	import flash.events.EventDispatcher;
	/**
	 * 
	 * @author James
	 * 
	 * <event>
     *	<project-id type="integer"> </project-id>
	 *   <created-at type="datetime"> </created-at>
	 *   <record-type> [Message, Milestone, Ticket, TimeEntry, Changeset, Comment] </record-type>
	 *   <record-id type="integer"> </record-id>
	 *   <event> [accept, close, commit, create, delete, reopen, resolve, unaccept, status_update] </event>
	 *   <description> </description>
	 *   <person-id type="integer"> </person-id>
	 *   <summary> </summary>
	 *   
	 *   <!--
	 *     if a record exists, then it will be included here.
	 *     note that only ONE of these will exist, corresponding to record-type
	 *     see data model documentation for format.
	 *   -->
	 *   <record>
	 *     <message> ... </message>
	 *     <milestone> ... </milestone>
	 *     <ticket> ... </ticket>
	 *     <time-entry> ... </time-entry>
	 *     <changeset> ... </changeset>
	 *     <comment> ... </comment>
	 *   </event>
     * 
	 */	
	public class ActivityModel extends EventDispatcher implements IUFDataModel
	{
		[Bindable]
		public var projectid:String;
		[Bindable]
		public var createdat:String;
		[Bindable]
		public var recordtype:String;
		[Bindable]
		public var recordid:String;
		[Bindable]
		public var event:String;
		[Bindable]
		public var description:String;
		[Bindable]
		public var personid:String;
		[Bindable]
		public var summary:String;
		[Bindable]
		public var record:IUFDataModel;
		
		public function ActivityModel()
		{
			//TODO: implement function
		}
		
		public function parse(xml:XML):void {
			
			//trace("Parsing:",xml)
			this.projectid = xml.event["project-id"];
			this.createdat = xml.event["created-at"];
			this.recordtype = xml.event["record-type"];
			this.recordid = xml.event["record-id"];
			this.event = xml.event["event"];
			this.description = xml.event["description"];
			this.personid = xml.event["person-id"];
			this.summary = xml.event["summary"];
			this.record = parseDataModel(xml.event["record"] as XML);
		}
		
		protected function parseDataModel(xml:XML):IUFDataModel {
			var _rtnObj:IUFDataModel;
			if(xml != null){
				if(xml.message != null){
					_rtnObj = new MessageModel();
				}
				if(xml.milestone != null){
					_rtnObj = new MilestoneModel();
				}
				if(xml.ticket != null){
					_rtnObj = new TicketModel();
				}
				if(_rtnObj != null){
					_rtnObj.parse(xml);
				}
				trace(xml);
			}
			return _rtnObj;
		}
	}
}