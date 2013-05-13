package  
{
	import flash.events.KeyboardEvent;
	import org.flixel.*;
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class SecurityState extends FlxState
	{
		private var PASSWORD:String = "admin";
		private var insertPasswordText:FlxText;
		private var incorrectPasswordtext:FlxText;
		
		private var insertedPassword:String = "";
		private var insertedPasswordText:FlxText;
		private var MAX_LENGTH:int = 10;
		
		override public function create(): void	
		{
			FlxG.bgColor = 0xffFFFFFF;
			FlxG.mouse.show();
			
			insertPasswordText = new FlxText(FlxG.stage.width / 2 - 150, 100,300, "voer wachtwoord in:");
			insertPasswordText.setFormat(null, 20, 0xff282828, "center", 0xff000000);
			
			incorrectPasswordtext = new FlxText(FlxG.stage.width / 2 - 150, 300,300, "onjuist wachtwoord");
			incorrectPasswordtext.setFormat(null, 20, 0xffFF0000, "center", 0xff000000);
			incorrectPasswordtext.alpha = 0;
			
			insertedPasswordText = new FlxText(FlxG.stage.width / 2 - 150, 150,300, "");
			insertedPasswordText.setFormat(null, 20, 0xff0000FF, "center", 0);
			
			FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, myKeyHandler);
			
			add(insertPasswordText);
			add(incorrectPasswordtext);
			add(insertedPasswordText);
	    }
		
		override public function update():void {
			insertedPasswordText.text = insertedPassword;
			
			if (FlxG.keys.justPressed("ENTER")) {
				if (insertedPassword == PASSWORD) {
					FlxG.switchState(new EditTextState());
					FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, myKeyHandler);
				}
				else {
					incorrectPasswordtext.alpha = 1;
					insertedPassword = "";
				}
			}
			
			if (incorrectPasswordtext.alpha == 1) {
				incorrectPasswordtext.alpha -= 0.1;
			}
			if (incorrectPasswordtext.alpha <= 0) {
				incorrectPasswordtext.alpha = 0;
			}
		}
		
		private function myKeyHandler(e:KeyboardEvent):void {
			
			if (insertedPassword.length < MAX_LENGTH && e.charCode != 13) {
				insertedPassword += String.fromCharCode(e.charCode);
			}
		
		}
	}

}