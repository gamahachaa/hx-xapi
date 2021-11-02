package xapi;
import xapi.types.IActor;
import xapi.types.Standards;
import xapi.types.StatementRef;

/**
 * ...
 * @author bb
 */
enum ContextActivity
{
	parent;
	grouping;
	category;
	other;
}
class Context 
{
	@:isVar public var language(get, set):String;
	public var extensions:Map<String,Dynamic>;
	public var statement:StatementRef;
	@:isVar public var platform(get, set):String;
	public var revision:String;
	public var contextActivities(get, null):Map<String, Array<Map<String,String>>>;
	@:isVar public var instructor(get, set):IActor;
	public var registration(get, null):String;

	public function new(
							?uuid:String, 
							?instructor:IActor, 
							?team:Group,
							?context_activities:Map<ContextActivity,Array<Map<String,String>>>= null,
							?revision:String,
							?platform:String,
							?language:String,
							?statement:StatementRef,
							?extensions:Map<String,Dynamic>
							)
	{
		this.language = language;
		this.extensions = extensions;
		this.statement = statement;
		this.platform = platform;
		this.revision = revision;
		//trace(contextActivities);
		/**
		 * @todo validate map keys againts enum
		 */
		//this.contextActivities = context_activities);
		initContextActivities();
		this.instructor = instructor;
		this.registration = Standards.UUID.match(uuid) || uuid == null ? uuid : throw 'Context.new :: uuid "$uuid" is not valid UUID';
		
	}
	public function reset()
	{
		this.language = null;
		this.extensions = null;
		this.statement = null;
		this.platform = null;
		this.revision = null;
		this.contextActivities = new Map<String,Array<Map<String,String>>>();
	}
	function initContextActivities():Map<String,Array<Map<String,String>>>
	{
		if (contextActivities == null)
			contextActivities = new Map<String,Array<Map<String,String>>>();
		if (!contextActivities.exists("parent"))
			this.contextActivities.set("parent", []);
	
		if (!contextActivities.exists("grouping"))
			contextActivities.set("grouping", []);
	
		if (!contextActivities.exists("other"))
			contextActivities.set("other", []);
		if (!contextActivities.exists("category"))
			contextActivities.set("category", []);
		
		return contextActivities;
		/**/
	}
	public function addContextActivity( type:ContextActivity, activity:Activity ):Map<String, Array<Map<String,String>>>
	{
		contextActivities.get(Std.string(type)).push(["id" => activity.id]);
		return contextActivities;
	}
	/**
	 * @todo double check usage
	 * @param	map
	 * @param	Array<Map<String
	 * @param	String>>
	 * @return
	 */
	/*
	function prepareContextActivities(map:Map<ContextActivity, Array<Map<String, String>>>):Map<String, Array<Map<String, String>>> 
	{
		if (map == null) return null;
		var m = new Map<String, Array<Map<String, String>>>();
		var it = map.keys();
		var k;
		while ( it.hasNext() )
		{
			k = it.next();
			m.set(Std.string(k), map.get(k));
		}
		return m;
	}*/
	////////////////////////////////////////////////////////////////////////////////////////////////
	function get_registration():String 
	{
		return registration;
	}
	
	function get_contextActivities():Map<String, Array<Map<String, String>>> 
	{
		return contextActivities;
	}
	
	function get_platform():String 
	{
		return platform;
	}
	
	function set_platform(value:String):String 
	{
		return platform = value;
	}
	
	function get_language():String 
	{
		return language;
	}
	function set_language( value:String ):String 
	{
		return language = value;
	}
	
	function get_instructor():IActor 
	{
		return instructor;
	}
	
	function set_instructor(value:IActor):IActor 
	{
		return instructor = value;
	}
}