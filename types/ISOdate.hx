package xapi.types;
import thx.DateTime;
using thx.format.NumberFormat;
/**
 * ...
 * @author bb
 */
abstract ISOdate(String) to String
{
     static var ereg = ~/(\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d\.\d+([+-][0-2]\d:[0-5]\d|Z))|(\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d([+-][0-2]\d:[0-5]\d|Z))|(\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d([+-][0-2]\d:[0-5]\d|Z))|(\d{4}-[01]\d-[0-3]\d)|(\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d)/i;
     //static var ereg = ~/^(?: (?= [02468][048]00 |[13579][26]00 |[0-9][0-9]0[48] |[0-9][0-9][2468][048] |[0-9][0-9][13579][26] ) \d{4} (?: (-|) (?: (?: 00[1-9] |0[1-9][0-9] |[1-2][0-9][0-9] |3[0-5][0-9] |36[0-6] ) | (?:01|03|05|07|08|10|12) (?: \1 (?:0[1-9]|[12][0-9]|3[01]) )? | (?:04|06|09|11) (?: \1 (?:0[1-9]|[12][0-9]|30) )? | 02 (?: \1 (?:0[1-9]|[12][0-9]) )? | W(?:0[1-9]|[1-4][0-9]|5[0-3]) (?: \1 [1-7] )? ) )? )$ | ^(?: (?! [02468][048]00 |[13579][26]00 |[0-9][0-9]0[48] |[0-9][0-9][2468][048] |[0-9][0-9][13579][26] ) \d{4} (?: (-|) (?: (?: 00[1-9] |0[1-9][0-9] |[1-2][0-9][0-9] |3[0-5][0-9] |36[0-5] ) | (?:01|03|05|07|08|10|12) (?: \2 (?:0[1-9]|[12][0-9]|3[01]) )? | (?:04|06|09|11) (?: \2 (?:0[1-9]|[12][0-9]|30) )? | (?:02) (?: \2 (?:0[1-9]|1[0-9]|2[0-8]) )? | W(?:0[1-9]|[1-4][0-9]|5[0-3]) (?: \2 [1-7] )? ) )? )$/m;
  inline public function new(?date:String = "") {
	if (date == "")
	{
		var now = Date.now();
		this = '${now.getFullYear()}-${(now.getMonth()+1).customFormat("00")}-${now.getDate().customFormat("00")}T${now.getHours().customFormat("00")}:${now.getMinutes().customFormat("00")}:${now.getSeconds().customFormat("00")}.00Z';
	}
    else if (!ereg.match(date)) throw 'ISO date "$date" is invalid';
	else this = date;
  }

  @:from inline static public function fromString(date:String) {
    return new ISOdate(date);
  }
  inline static public function fromDate(date:Date) {
	  var d = '${date.getFullYear()}-${(date.getMonth()+1).customFormat("00")}-${date.getDate().customFormat("00")}T${date.getHours().customFormat("00")}:${date.getMinutes().customFormat("00")}:${date.getSeconds().customFormat("00")}.00Z';
	  //trace(d);
    return new ISOdate(d);
  }
  inline static public function fromDateTime(date:DateTime) {
	  var d = '${date.year}-${(date.month+1).customFormat("00")}-${date.day.customFormat("00")}T${date.hour.customFormat("00")}:${date.minute.customFormat("00")}:${date.second.customFormat("00")}.00Z';
	  //trace(d);
    return new ISOdate(d);
  }
}