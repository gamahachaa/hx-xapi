package xapi.types;
import EReg;
/**
 * ...
 * @author 
 */
class Standards 
{

	static public var EMAIL:EReg = ~/^mailto:[^@]{1,64}@[^@]{1,255}$/i;
	static public var AUTH:EReg = ~/^[0-9]{4}-[0-9]{2}-[0-9]{2}_[0-9]{4}-[0-9]{2}-[0-9]{2}_/i;
	static public var UUID:EReg = ~/[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}/;
	static public var ISO8601_DURATION:EReg = ~/^P(?!$)(\d+(?:\.\d+)?Y)?(\d+(?:\.\d+)?M)?(\d+(?:\.\d+)?W)?(\d+(?:\.\d+)?D)?(T(?=\d)(\d+(?:\.\d+)?H)?(\d+(?:\.\d+)?M)?(\d+(?:\.\d+)?S)?)?$/;
	public static var ISO_8601:EReg = ~/^\d{4}(-\d\d(-\d\d(T\d\d:\d\d(:\d\d)?(\.\d+)?(([+-]\d\d:\d\d)|Z)?)?)?)?$/i;
	public static var ISO_8601_FULL:EReg = ~/^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(\.\d+)?(([+-]\d\d:\d\d)|Z)?$/i;
}