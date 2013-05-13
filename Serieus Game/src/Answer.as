package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class Answer 
	{
		private static var answerText:FlxText;
		
		public function Answer() 
		{
			answerText = new FlxText(FlxG.stage.width / 2 - 100, 100, 400, "");
			answerText.setFormat(null, 12, 0xff282828, "left", 0xff000000);
			
		}
		
		public function create(): void {
			FlxG.state.add(answerText);
		}
		
		public static function updatetext(question:String):void {
			if (Texts._answersLoaded)
			{
				if (question == "A") {
					answerText.text = Texts._answers[0 + (3 * (PlayState.questionNr - 1))];
				}
				else if (question == "B") {
					answerText.text = Texts._answers[1 + (3 * (PlayState.questionNr - 1))];
				}
				else if (question == "C") {
					answerText.text = Texts._answers[2 + (3 * (PlayState.questionNr - 1))];
				}
			}
		}
		
	}

}