package xapi.activities;

/**
 * ...
 * @author bb
 */
class InteractionDefinition extends Definition
{
	@:isVar public  var interactionType(get, set):String;
	@:isVar public  var correctResponsesPattern(get, set):Array<String>;
	public function new() 
	{
		super();
		this.type = "http://adlnet.gov/expapi/activities/interaction";
		correctResponsesPattern = [];
	}
	
	function get_correctResponsesPattern():Array<String> 
	{
		return correctResponsesPattern;
	}
	
	function set_correctResponsesPattern(value:Array<String>):Array<String> 
	{
		return correctResponsesPattern = value;
	}
	
	function get_interactionType():String 
	{
		return interactionType;
	}
	
	function set_interactionType(value:String):String 
	{
		return interactionType = value;
	}
	
}