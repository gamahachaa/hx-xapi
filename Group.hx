package xapi;

import xapi.types.IActor;
import xapi.types.IUnique;

/**
 * ...
 * @author bb
 */
class Group implements IUnique implements IActor
{
	public var member(get, null):Array<Agent>;
	public var id(get, null):String;
	public function new(?id:String, ?uri:String, ?members:Array<Agent>) 
	{
		this.id =  id;
		this.uri = uri;
		objectType = "Group";
		this.member = members;
	}
	
	
	/* INTERFACE lrs.xapi.interfaces.IUnique */
	
	public var uri(get, null):String;
	public var objectType(get,null):String;
	
	function get_uri():String 
	{
		return uri;
	}
	
	public function get_objectType():String 
	{
		return objectType;
	}
	
	function get_member():Array<Agent>
	{
		return member;
	}
	
	function get_id():String 
	{
		return id;
	}
	
}