package xapi;

import xapi.activities.Definition;
import xapi.types.IObject;
import xapi.types.IUnique;
/**
 * ...
 * @author bb
 */

class Activity implements IObject implements IUnique
{
	@:isVar public var definition(get, set):Definition;
	//public var display(get, null):Map<Lang,String>;
	public var id(get, null):String;
	public var objectType(get, null):String;
	public function new( uri:String, ?definition:Definition = null) 
	{
		objectType = "Activity";
		this.id = uri;
		this.definition = definition;
		//initDefault( uri );
	}
	
	function get_id():String 
	{
		return id;
	}
	function get_objectType():String 
	{
		return objectType;
	}
	/**
	 * @todo put in helper
	 */
	public function makeBasicDefinintion( ?urlLevels:Int = 1)
	{
		var index = 0;
		if (definition == null)
		{
			definition = new Definition();
			var split = id.split("/");
			if (split[split.length -1] == "")
				split.splice(split.length -1,1);
			index = split.length - urlLevels;
			split.splice(0, index);
			var a = split.join("/");
			
			definition.name.set("en", a);
			definition.name.set("fr", a);
			definition.name.set("de", a);
			definition.name.set("it", a);
		}
	}
	
	function get_definition():Definition 
	{
		return definition;
	}
	
	function set_definition(value:Definition):Definition 
	{
		return definition = value;
	}
	
}