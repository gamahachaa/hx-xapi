package xapi;
import xapi.types.IActor;
import xapi.types.IObject;
import xapi.types.IUnique;
import thx.DateTime;

/**
 * ...
 * @author bb
 */
class Statement implements IUnique
{
	@:isVar public var attachments(get, set):Array<Dynamic>;
	public var timestamp(get, null):String;
	@:isVar public var context(get, set):Context;
	public var result(get, null):Result;
	public var object(get, null):IObject;
	public var verb(get, null):Verb;
	public var actor(get, null):IActor;
	public var id(get, null):String;

	public function new(actor:IActor, verb:Verb, object:IObject, ?result:Result, ?context:Context)
	{
		attachments = null;
		timestamp = DateTime.now().toString();
		//trace(timestamp);
		this.context = context;
		this.result = result;
		this.object = object;
		this.verb = verb;
		this.actor = actor;
		if (object.objectType == "Agent" && context.platform != null)
		{
			throw 'The context\'s "platform" property MUST only be used if the Statement\'s Object is an Activity objectType=${object.objectType} context.platform = ${context.platform}';
		}
	}
	public function reset()
	{
		attachments = null;
		timestamp = DateTime.now().toString();
		this.context = null;
		this.result = null;
		this.object = null;
		this.verb = null;
		this.actor = null;
	}
	function get_id():String
	{
		return id;
	}

	function get_context():Context
	{
		return context;
	}
	function set_context(ctx:Context):Context
	{
		return context = ctx;
	}
	function get_result():Result
	{
		return result;
	}

	function get_object():IObject
	{
		return object;
	}

	function get_verb():Verb
	{
		return verb;
	}

	function get_actor():IActor
	{
		return actor;
	}

	function get_timestamp():String
	{
		return timestamp;
	}

	function get_attachments():Array<Dynamic>
	{
		return attachments;
	}

	function set_attachments(value:Array<Dynamic>):Array<Dynamic>
	{
		if (attachments == null)
			attachments = [];
		return attachments = value;
	}
	/**
	 * Dirty but added here to prevent sending null objects
	 */
	function initAttachement()
	{

	}
	//static public function FROM_JSON(j:String)
	//{
		//if(Reflect.hasField
	//}
}