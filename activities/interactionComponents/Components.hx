package xapi.activities.interactionComponents;
import haxe.ds.StringMap;
import xapi.types.IUnique;

/**
 * ...
 * @author bb
 */
class Components implements IUnique
{
	public var id(get, null):String;
	@:isVar public var description(get, set):StringMap<String>;
	public function new(id:String, ?description:StringMap<String> = null) 
	{
		this.description = description == null ? new StringMap<String>():description;
		//trace(description);
		this.id = id;
	}
	
	function get_id():String 
	{
		return id;
	}
	
	function get_description():StringMap<String>
	{
		return description;
	}
	
	function set_description(value:StringMap<String>):StringMap<String> 
	{
		return description = value;
	}
	
}