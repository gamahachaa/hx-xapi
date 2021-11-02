package xapi.activities;
/**
 * ...
 * @author bb
 */
class LongFillinDefinition extends InteractionDefinition
{

	public function new(corrects:Map<String,String>, ?caseMatters:Bool = false) 
	{
		this.interactionType = "long-fill-in";
		this.correctResponsesPattern = [];
		var it = corrects.keys();
		var lang = "";
		var long = "";
		while ( it.hasNext())
		{
			lang = it.next();
			long = corrects.get(lang);
			this.correctResponsesPattern.push('{case_matters=$caseMatters}{lang=$lang}$long');
		}
		}
		
	}
	
}