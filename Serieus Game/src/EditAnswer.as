package  
{
	import flash.events.KeyboardEvent;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class EditAnswer extends FlxState
	{
		private var oldAnswer:FlxText;
		private var oldAnswer2:FlxText;
			
		private var typeNewAnswer:FlxText;
		private var newAnswer:FlxText;
			
		private var saveButton:FlxButtonPlus;
		private var backButton:FlxButtonPlus;
			
		private var answerNr:int = 0;
		
		public function EditAnswer(answerNr:int) {
			this.answerNr = answerNr;
		}
		
		override public function create(): void	
		{
			oldAnswer = new FlxText(FlxG.stage.width / 2 - 100, 200, 200, "Oude vraag: ");
			oldAnswer.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			add(oldAnswer);
			
			oldAnswer2 = new FlxText(50 , 250, 900, Texts._answers[answerNr] );
			oldAnswer2.setFormat(null, 12, 0xff282828, "left", 0);
			add(oldAnswer2);
			
			typeNewAnswer = new FlxText(FlxG.stage.width / 2 - 100, 400, 200, "Type de nieuwe vraag: ");
			typeNewAnswer.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			add(typeNewAnswer);
			
			newAnswer = new FlxText(50, 450, 900, "");
			newAnswer.setFormat(null, 12, 0xff282828, "left", 0xff000000);
			FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, questionKeyboardHandler);
			add(newAnswer);
			
			saveButton = new FlxButtonPlus(800,550, saveQuestion,[answerNr],"Opslaan", 100, 40);
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
				newAnswer.text += String.fromCharCode(e.charCode);
			}
		}
		
		private function back():void {
			FlxG.switchState(new EditTextState());
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, questionKeyboardHandler);
		}
		
		private function saveQuestion(questionNr:int):void {
			Texts._questions[answerNr] = newAnswer.text;
			FlxG.switchState(new EditTextState());
			FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, questionKeyboardHandler);
		}
		
		
	}

}