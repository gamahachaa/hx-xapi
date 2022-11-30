package xapi.types;

/**
 * ...
 * @author bb
 */
class Score 
{
	@:isVar public var scaled(get, null):Float;
	@:isVar public var raw(get, set):Float;
	@:isVar public var min(get, set):Float;
	@:isVar public var max(get, set):Float;
	public function new( 
		?raw:Float = 0, 
		?max:Float = 100, 
		?min:Float = 0) 
	{
		this.max = max;
		this.min = min;
		this.raw = raw;
		scaled = max==0?0:raw / max;
	}
	public function reset()
	{
		 raw = 0;
		 max = 100;
		 min = 0;
		 scaled = 0.0;
	}
	function get_scaled():Float 
	{
		//return Math.floor( scaled * 100 ) / 100;
		return scaled = max==0?0:raw / max;
	}
	
	
	function get_raw():Float 
	{
		return raw;
	}
	
	function set_raw(value:Float):Float 
	{
		raw = value;
		get_scaled();
		return raw = value;
	}
	
	function get_min():Float 
	{
		return min;
	}
	
	function set_min(value:Float):Float 
	{
		return min = value;
	}
	
	function get_max():Float 
	{
		return max;
	}
	
	function set_max(value:Float):Float 
	{
		max = value;
		get_scaled();
		return max;
	}
	
}