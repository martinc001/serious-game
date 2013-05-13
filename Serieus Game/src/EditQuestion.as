package  
{
	import flash.events.KeyboardEvent;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class EditQuestion extends FlxState
	{
		private var oldQuestion:FlxText;
		private var oldQuestion2:FlxText;
		
		private var typeNewQuestion:FlxText;
		private var newQuestion:FlxText;
		
		private var saveButton:FlxButtonPlus;
		private var backButton:FlxButtonPlus;
		
		private var questionNr:int = 0;
		
		public function EditQuestion(questionNr:int) {
			this.questionNr = questionNr;
		}
		
		override public function create(): void	
		{
			oldQuestion = new FlxText(FlxG.stage.width / 2 - 100, 200, 200, "Oude vraag: ");
			oldQuestion.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			add(oldQuestion);
			
			oldQuestion2 = new FlxText(50 , 250, 900, Texts._questions[questionNr] );
			oldQuestion2.setFormat(null, 12, 0xff282828, "left", 0);
			add(oldQuestion2);
			
			typeNewQuestion = new FlxText(FlxG.stage.width / 2 - 100, 400, 200, "Type de nieuwe vraag: ");
			typeNewQuestion.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			add(typeNewQuestion);
			
			newQuestion = new FlxText(50, 450, 900, "");
			newQuestion.setFormat(null, 12, 0xff282828, "left", 0xff000000);
			FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, questionKeyboardHandler);
			add(newQuestion);
			
			saveButton = new FlxButtonPlus(800,550, saveQuestion,[questionNr],"Opslaan", 100, 40);
			saveButton.buttonNormal.alpha = 0;
			saveButton.buttonHighlight.alpha = 0;
			saveButton.textNormal.setFormat(null, 18, 0x00FF00, "center", 0);
			saveButton.textHighlight.setFormat(null, 18, 0x00FF00, "center", 0);
			add(saveButton);
			
			backButton = new FlxButtonPlus(100,550, back,null,"Terug", 100, 40);
			backButton.buttonNormal.alpha = 0;
			backButton.buttonHighlight.alpha = 0;
			backButton.textNormal.setFormat(null, 16, 0x000000, "center", 0);
			backButton.textHighlight.setFormat(null, 16, 0x000000, "center", 0);
			add(backButton);
			
			super.create();
		}
		
		private function questionKeyboardHandler(e:KeyboardEvent):void {
			if (e.charCode != 13) {
				newQuestion.text += String.fromCharCode(e.charCode);
			}
		
		}
		
		private function back():void {
			FlxG.switchState(new EditTextState());
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, questionKeyboardHandler);
		}
		
		private function saveQuestion(questionNr:int):void {
			Texts._questions[questionNr] = newQuestion.text;
			FlxG.switchState(new EditTextState());
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, questionKeyboardHandler);
		}
		
	}

}