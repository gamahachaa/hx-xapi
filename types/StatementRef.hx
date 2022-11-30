package xapi.types;

/**
 * @author bb
 */
class StatementRef implements IUnique implements IObject
{
	public var id(get, null):String;
	public var objectType(get, null):String;
	public function new(statementId:String)
	{
		
		id = Standards.UUID.match( statementId) ? statementId : throw 'EXCEPTION xapi.types.StatementRef :: invalid statementId : $statementId';
		objectType = "StatementRef";
	}
	
	public function get_objectType():String 
	{
		return objectType;
	}
	
	function get_id():String 
	{
		return id;
	}
}