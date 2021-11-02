package xapi.activities;
import xapi.activities.interactionComponents.Components;

/**
 * ...
 * @author bb
 */
class ChoicesDefinition extends InteractionDefinition 
{
	public var choices(get, null):Array<Components>;

	public function new(choices:Array<Components>, corrects:Array<String>) 
	{
		super();
		this.choices = choices;
		this.interactionType = "choice";
		this.correctResponsesPattern = corrects;
		
		for ( i in correctResponsesPattern)
		{
			/**
			 * @todo match complexe responses ex: ["foo[,]bar","foo"]
			 */
			//if ( this.choices.indexOf( ) == 0 ) throw "ChoicesDefinition:: correct item id not listed in pattern";
		}
	}
	
	function get_choices():Array<Components> 
	{
		return choices;
	}
	
}