package xapi;
import xapi.types.Score;


/**
 * ...
 * @author bb
 */
class Result 
{
	public var extensions(get, null):Map<String,Dynamic>;
	public var completion(get, null):Bool;
	public var duration(get, null):String;
	public var response(get, null):String;
	public var success(get, null):Bool;
	public var score(get, null ):Score;
	public function new( ?score:Score, ?success:Bool, ?completion:Bool, ?response:String, ?duration:Float, ?extensions:Map<String,Dynamic>= null) 
	{
		//this.extensions = extensions == null ? {} : extensions;
	/**
	 * @todo UTILS helpers
	 * standard library validators
	 */
		this.duration = duration == null ? toISO8601Duration(0) : toISO8601Duration(duration);
		this.response = response;
		this.completion = completion;
		this.success = success;
		this.score = score;
		this.extensions = extensions;
		
	}
	function toISO8601Duration( timestamp :Float ):String
	{
		//var ms = ;
		var s = 1000;
		var m = 60 * s;
		var h = 60 * m;
		var d = 24 * h;
		var temp = timestamp;
		var modulo = temp % d;
		//var temp = temp - modulo;
		var t = [];
		t.push( ((temp - modulo) / d)) ;
		//trace(timestamp, temp, t );
		temp = modulo;
		modulo = temp % h;
		//temp = temp - modulo;
		t.push(((temp - modulo) / h));
		//trace(timestamp, temp, t );
		
		temp = modulo;
		//temp = timestamp - temp;
		modulo = temp % m;
		//temp = temp - modulo;
		t.push(((temp - modulo) / m));
		
		//trace(timestamp, temp, t );
		temp = modulo;
		modulo = temp % s;
		
		t.push(((temp - modulo) / s));
		//trace(timestamp, temp, t );
		temp = modulo;
		return Std.string( 'P${t[0]}DT${t[1]}H${t[2]}M${t[3]}S' );
		
	}
	function get_score():Score 
	{
		return score;
	}
	
	function set_score(value:Score):Score 
	{
		return score = value;
	}
	
	function get_success():Bool 
	{
		return success;
	}
	
	function get_response():String 
	{
		return response;
	}
	
	function get_duration():String 
	{
		return duration;
	}
	
	function get_completion():Bool 
	{
		return completion;
	}
	
	function get_extensions():Map<String, Dynamic> 
	{
		return extensions;
	}
	
	/*function get_extensions():Dynamic 
	{
		return extensions;
	}
	*/
}