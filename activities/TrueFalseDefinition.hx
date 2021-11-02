package xapi.activities;

/**
 * ...
 * @author bb
 */
class TrueFalseDefinition extends InteractionDefinition 
{
	
	public function new( corect:Bool) 
	{
		super();
		this.interactionType = "true-false";
		this.correctResponsesPattern = [Std.string(corect)];
	}
	
}