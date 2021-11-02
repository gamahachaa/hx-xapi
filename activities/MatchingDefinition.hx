package xapi.activities;
import xapi.activities.interactionComponents.Components;

/**
 * ...
 * @author bb
 */
class MatchingDefinition extends InteractionDefinition 
{
	public var target(get, null):Array<Components>;
	public var source(get, null):Array<Components>;

	public function new(source:Array<Components>, target:Array<Components>, corrects:Map<String,String>) 
	{
		super();
		this.target = target;
		this.source = source;
		this.correctResponsesPattern = [];
		var s = "";
		//var first = true;
		for (i in corrects.keys())
		{
			//if (!first) s += "[,]";
			s = '$i[.]${corrects.get(i)}';
			correctResponsesPattern.push(s);
			//first = false;

		}
		
	}
	
	function get_source():Array<Components> 
	{
		return source;
	}
	
	function get_target():Array<Components> 
	{
		return target;
	}
	
}