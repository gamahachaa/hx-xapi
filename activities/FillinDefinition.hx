package xapi.activities;
import xapi.activities.interactionComponents.Components;

/**
 * ...
 * @author bb
 */
class FillinDefinition extends InteractionDefinition 
{

	public function new(correctResponses:Array<String>) 
	{
		super();
		this.interactionType = "fill-in";
		this.correctResponsesPattern = correctResponses;
	}
	
}