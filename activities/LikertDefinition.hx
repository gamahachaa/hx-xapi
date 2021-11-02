package xapi.activities;
import xapi.Activity;

import xapi.Activity.Interaction;
import xapi.activities.interactionComponents.Components;

/**
 * ...
 * @author bb
 */
class LikertDefinition extends InteractionDefinition 
{
	public var scale(get, null):Array<Components>;

	public function new( scale:Array<Components>, corrects:Array<String>) 
	{
		super();
		this.scale = scale;
		this.correctResponsesPattern = corrects;
		
	}
	
	function get_scale():Array<Components> 
	{
		return scale;
	}
	
}