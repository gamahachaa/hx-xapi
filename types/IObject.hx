package xapi.types;

/**
 * ...
 * @author bb
 */
enum ObjectTypes{
	Activity;
	Agent;
	Group;
	SubStatement;
	StatementRef;
}
interface IObject 
{
	public var objectType(get, null):String;
	function get_objectType():String;
	
}