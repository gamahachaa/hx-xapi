package xapi;
import haxe.ds.StringMap;
import xapi.types.IUnique;

/**
 * ...
 * @author bb
 */
class Verb implements IUnique
{
	
	////////////////////////// STATICS /////////////////////////////////////////////////////////////////
	public static inline var VERB_RECIEVED:String = "http://activitystrea.ms/schema/1.0/receive";
	public static inline var VERB_MENTORED:String = "http://id.tincanapi.com/verb/mentored";
	// A
	public static var abandoned:Verb = new Verb("https://w3id.org/xapi/adl/verbs/abandoned");
	public static var answered:Verb = new Verb("http://adlnet.gov/expapi/verbs/answered");
	public static var aligned:Verb = new Verb("https://w3id.org/xapi/dod-isd/verbs/aligned");
	
	public static var asked:Verb = new Verb("http://adlnet.gov/expapi/verbs/asked");
	public static var attempted:Verb = new Verb("http://adlnet.gov/expapi/verbs/attempted");
	public static var attended:Verb = new Verb("http://adlnet.gov/expapi/verbs/attended");
	// C 
	public static var commented	:Verb = new Verb("http://adlnet.gov/expapi/verbs/commented");
	public static var completed	:Verb = new Verb("http://adlnet.gov/expapi/verbs/completed");
	public static var calibrated	:Verb = new Verb("https://w3id.org/xapi/dod-isd/verbs/calibrated");
	// E
	public static var exited :Verb = new Verb("http://adlnet.gov/expapi/verbs/exited");
	public static var experienced :Verb = new Verb("http://adlnet.gov/expapi/verbs/experienced");
	// F
	public static var failed:Verb = new Verb("http://adlnet.gov/expapi/verbs/failed");
	// I
	public static var imported:Verb = new Verb("http://adlnet.gov/expapi/verbs/imported");
	public static var initialized:Verb = new Verb("http://adlnet.gov/expapi/verbs/initialized");
	public static var interacted:Verb = new Verb("http://adlnet.gov/expapi/verbs/interacted");
	// L 
	public static var launched:Verb = new Verb("http://adlnet.gov/expapi/verbs/launched");
	public static var loggedIn:Verb = new Verb("https://w3id.org/xapi/adl/verbs/logged-in");
	public static var loggedOut:Verb = new Verb("https://w3id.org/xapi/adl/verbs/logged-out");
	// M
	public static var mastered:Verb = new Verb("http://adlnet.gov/expapi/verbs/mastered");
	public static var mentoored:Verb = new Verb(VERB_MENTORED);
	// P
	public static var passed:Verb = new Verb("http://adlnet.gov/expapi/verbs/passed");
	public static var preferred:Verb = new Verb("http://adlnet.gov/expapi/verbs/preferred");
	public static var progressed:Verb = new Verb("http://adlnet.gov/expapi/verbs/progressed");
	// R
	public static var registered:Verb = new Verb("http://adlnet.gov/expapi/verbs/registered");
	public static var responded:Verb = new Verb("http://adlnet.gov/expapi/verbs/responded");
	public static var resolved:Verb = new Verb("http://activitystrea.ms/schema/1.0/resolve", ["en" => "resolved"] );
	public static var recieved:Verb = new Verb(VERB_RECIEVED);
	public static var resumed:Verb = new Verb("http://adlnet.gov/expapi/verbs/resumed");
	public static var recalled:Verb = new Verb("https://w3id.org/xapi/dod-isd/verbs/recalled");
	// S
	public static var satisfied:Verb = new Verb("https://w3id.org/xapi/adl/verbs/satisfied");

	public static var scored:Verb = new Verb("http://adlnet.gov/expapi/verbs/scored");
	public static var shared:Verb = new Verb("http://adlnet.gov/expapi/verbs/shared");
	public static var suspended:Verb = new Verb("http://adlnet.gov/expapi/verbs/suspended");
	public static var submitted:Verb = new Verb("http://activitystrea.ms/schema/1.0/submit", ["en"=>"submitted"]);
	
	// T
	public static var terminated:Verb = new Verb("http://adlnet.gov/expapi/verbs/terminated");
	// V
	public static var voided:Verb = new Verb("http://adlnet.gov/expapi/verbs/voided");
	// W
	public static var waived:Verb = new Verb("https://w3id.org/xapi/adl/verbs/waived");
	
	
	
	
	// API /////////////////////////////////////////////////////////////////////////////////////////////
	public var id(get, null):String;
	@:isVar public var display(get, set):StringMap<String>;
	////////////////////////////////////////////////////////////////////////////////////////////////////
	public function new( uri:String, ?display:StringMap<String> ) 
	{
		
		this.id = uri;
		if (display == null || !display.exists("en") || display.get("en")=="")
		{
			initDefault( this.id );
		}
		else{
			this.display = display;
		}
	}
	function initDefault( s:String ):Void
	{
		var temp = s.split("/");
		var d = temp[temp.length - 1] == "" ? temp[temp.length - 2]: temp[temp.length - 1];
		this.display = new StringMap<String>();
		this.display.set("en", d);
	}
	////////////////////////////////////////////////////////////////////////////
	function get_id():String 
	{
		return id;
	}
	function get_display():StringMap<String>
	{
		return display;
	}
	
	function set_display(value:StringMap<String>):StringMap<String> 
	{
		return display = value;
	}
	function toString()
	{
		return 'xapi.Verb : {id:$id, display: $display}';
	}
}