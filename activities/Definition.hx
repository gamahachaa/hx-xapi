package xapi.activities;
import haxe.ds.StringMap;
/**
 * ...
 * @author bb
 */
class Definition
{
	@:isVar public  var name(get, set):StringMap<String>; //language map
	//@:isVar public  var name(get, set):Map<String,String>; //language map
	@:isVar public  var description(get, set):StringMap<String>;//language map
	//@:isVar public  var description(get, set):Map<String,String>;//language map
	@:isVar public  var type(get, set):String; //IRI
	@:isVar public  var moreInfo(get, set):String; //IRI
	@:isVar public  var extensions(get, set):Map<String,Dynamic>;

	
	public function new() 
	{
		name = new StringMap<String>();
		description = new StringMap<String>();
		extensions = new Map<String,Dynamic>();
		type = null;
		moreInfo = null;	
	}
	
	function get_name():StringMap<String>
	{
		return name;
	}
	
	function set_name(value:StringMap<String>):StringMap<String> 
	{
		return name = value;
	}
	
	function get_description():StringMap<String>
	{
		return description;
	}
	
	function set_description(value:StringMap<String>):StringMap<String>
	{
		return description = value;
	}
	
	function get_type():String 
	{
		return type;
	}
	
	function set_type(value:String):String 
	{
		return type = value;
	}
	
	function get_moreInfo():String 
	{
		return moreInfo;
	}
	
	function set_moreInfo(value:String):String 
	{
		return moreInfo = value;
	}

	
	function get_extensions():Map<String,Dynamic> 
	{
		return extensions;
	}
	
	function set_extensions(value:Map<String,Dynamic> ):Map<String,Dynamic>
	{
		return extensions = value;
	}
	
}