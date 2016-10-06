package;

import openfl.Lib;

#if android
import openfl.utils.JNI;
#end

class NativeTest
{	
	private static var title:String;
	private static var message:String;

	public static function showAlert(title:String, message:String):Void
	{
		NativeTest.title = title;
		NativeTest.message = message;
		haxe.Timer.delay(delayAlert, 30);
	}
	
	private static function delayAlert():Void
	{
		#if(cpp && mobile && !android)
		iosAlert(title, message);
		#end
		
		#if android
		if(androidAlert == null)
		{
			androidAlert = openfl.utils.JNI.createStaticMethod("NativeTest", "showAlert", "(Ljava/lang/String;Ljava/lang/String;)V", true);
		}
		
		androidAlert([title, message]);
		#end
	}

	#if android
	private static var androidAlert:Dynamic;
	#end

	#if(cpp && mobile && !android)
	static var iosAlert = Lib.load("ios_alert", "nativetest", 2);
	#end
}