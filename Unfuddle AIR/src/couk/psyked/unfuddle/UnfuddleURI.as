package couk.psyked.unfuddle
{
	public class UnfuddleURI
	{
		public static var ACCOUNT_URL:String = ".unfuddle.com/api/v1/account.xml?formatted=true";
		public static var ACTIVITY_URL:String = ".unfuddle.com/api/v1/activity.xml?formatted=true";
		public static var PROJECTS_URL:String = ".unfuddle.com/api/v1/projects.xml?formatted=true";
		public static var REPOSITORIES_URL:String = ".unfuddle.com/api/v1/repositories.xml?formatted=true";
		public static var PEOPLE_URL:String = ".unfuddle.com/api/v1/people.xml?formatted=true";
		public static var MESSAGES_URL:String = ".unfuddle.com/api/v1/projects/1/messages.xml?formatted=true";
		public static var MILESTONES_URL:String = ".unfuddle.com/api/v1/projects/1/milestones.xml?formatted=true";
		public static var NOTEBOOKS_URL:String = ".unfuddle.com/api/v1/notebooks.xml?formatted=true";
		public static var TICKETS_URL:String = ".unfuddle.com/api/v1/projects/1/tickets.xml?formatted=true";
		
		public static var SINGLE_MESSAGES_URL:String = ".unfuddle.com/api/v1/projects/1/messages/1.xml?formatted=true";
		public static var SINGLE_TICKET_URL:String = ".unfuddle.com/api/v1/projects/1/tickets/1.xml?formatted=true";
		public static var SINGLE_MILESTONE_URL:String = ".unfuddle.com/api/v1/projects/1/milestones/1.xml?formatted=true";
		
		private static var _project:uint;
		private static var _itemid:uint;
		
		public function UnfuddleURI()
		{
			//
		}
		
		public static function set projectid(id:uint):void {
			_project = id;
			ACTIVITY_URL = ".unfuddle.com/api/v1/projects/" + _project + "/activity.xml?formatted=true";
			MESSAGES_URL = ".unfuddle.com/api/v1/projects/" + _project + "/messages.xml?formatted=true";
			TICKETS_URL = ".unfuddle.com/api/v1/projects/" + _project + "/tickets.xml?formatted=true";
			MILESTONES_URL = ".unfuddle.com/api/v1/projects/" + _project + "/milestones.xml?formatted=true";
		}
		
		public static function set itemid(id:uint):void {
			_itemid = id;
			SINGLE_MESSAGES_URL = ".unfuddle.com/api/v1/projects/" + _project + "/messages/" + _itemid + ".xml?formatted=true";
			SINGLE_TICKET_URL = ".unfuddle.com/api/v1/projects/" + _project + "/tickets/" + _itemid + ".xml?formatted=true";
			SINGLE_MILESTONE_URL = ".unfuddle.com/api/v1/projects/" + _project + "/milestones/" + _itemid + ".xml?formatted=true";
		}
	}
}