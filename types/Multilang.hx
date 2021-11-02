package xapi.types;

/**
 * @author bb
 */


class Multilang
{
	public var display(get, null):Dynamic;
	public function new (?display:Dynamic)
	{
		//trace('Multilang.Multilang :: ');		
		this.display = display;
	}
	/**
	 * 
	 * @param	s
	 * @return
	 */
	public function initDefault( s:String ):Dynamic
	{
		if (display == null) 
			display = {};
		var t = Type.allEnums( Lang );
		var temp = s.split("/");
		/**
		 * if string is uri take the last resource as default name
		 */ 
		var d = temp[temp.length - 1] == "" ? temp[temp.length - 2]: temp[temp.length - 1];
		for( i in t )
		{
			if( !Reflect.hasField(display, Std.string(i) ))
				Reflect.setProperty(display, Std.string(i), d );
		}
		//trace(display);
		return display;
	}
	
	function get_display():Dynamic
	{
		//trace('Multilang.get_display :: ');
		return display;
	}
}

enum Lang {
	en;
	fr;
	de;
	it;
}