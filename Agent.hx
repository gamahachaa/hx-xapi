package xapi;
import xapi.types.IActor;
import xapi.types.Standards;


/**
 * ...
 * @author bb
 */
class Agent implements IActor
{
	//private var MAIL_VALIDATOR:EReg = ~/@.+\./; 
	public var mbox(get, null):String;
	public var name(get, null):String;
	public var objectType(get,null):String;
/**
 * @todo create function to create instance from JSON
 * @param	email
 * @param	name
 */
	public function new(
		email:String, 
		?name:String = ""
		)
	{
		objectType = "Agent";
		mbox = "";
		#if debug
		//trace('Agent.Agent :: ', email);
		#end
		if( email.indexOf("mailto:")  == -1)
			mbox = "mailto:";
		mbox += email.toLowerCase();
		//trace('Agent.Agent :: ', mbox);
		this.name = name == ""?email:name.toLowerCase();
		if (mbox == "mailto:")
			throw new MissingActorIri(this);
		if (! Standards.EMAIL.match ( mbox ))
			throw new BadEmailFormat( mbox );
		
	}
	inline public function prepareMbox(m:String):String
	{
		var mb = "" ;
		if( m.indexOf("mailto:")  == -1)
			mb = "mailto:";
		mb += StringTools.trim(m).toLowerCase();
		return mb;
		
	}
	public function getSimpleEmail():String
	{
		return StringTools.replace(mbox, "mailto:","");
	}
	public function getActorUrl():String
	{
		return "&actor=" + StringTools.urlEncode('{"name":"$name","mbox":"$mbox"}');
	}
	
	public function getFirstName():String 
	{
		return StringTools.replace(mbox.split(".")[0],"mailto:","");
		//return mbox.split(".")[0];
		
	}
	public function getLastName():String 
	{
		//return mbox.split(".")[1];
		return mbox.split(".")[1].split("@")[0];
	}
	function get_name():String 
	{
		return name;
	}
	
	function get_mbox():String 
	{
		return mbox;
	}
	
	public function get_objectType():String 
	{
		return objectType;
	}
	public static function FROM_JSON(json:Dynamic):Agent
	{
		return try{
			  new Agent(Reflect.field(json, "mbox"), Reflect.field(json, "name"));
		}
		catch(e){
			null;
		}
	}
}
/**
 * Exception
 */
class MissingActorIri
{
	public var msg:String;
	public var agent:Agent;
	
	public function new(agent:Agent)
	{
		this.agent = agent;
		msg = "Agent IRI is empty";
	}
}
class BadEmailFormat
{
	public var email(get, null):String;
	public function new(mail:String)
	{
		this.email = mail;
	}
	function get_email():String 
	{
		return email;
	}
}