package xapi.types;
import haxe.ds.StringMap;

/**
 * ...
 * @author bb
 */
abstract LanguageMap(StringMap<String>)
{
	public function new (i:StringMap<String>)
	{
		this = i;
	}
	public function set (k:String, v:String)
	{
		return this.set(k, v);
	}
	public function get(k:String):String
	{
		return this.get(k);
	}
	public function exists(k:String):Bool
	{
		return this.exists(k);
	}
	public function iterator():Iterator<String>
	{
		return this.iterator();
	}
	public function keys():Iterator<String>
	{
		return this.keys();
	}
	public function remove(k:String):Bool
	{
		return this.remove(k);
	}
	public function toString():String
	{
		return this.toString();
	}
	
}