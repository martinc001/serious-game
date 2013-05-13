package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Serieus Game Team

	 */
	public class PlayState extends FlxState
	{
		[Embed(source = "Images/test.png")] private static var testButtonImage:Class;
		public static var questionNr:int = 1;
		public static var stage:int = 3;
		public static var updateEmotion:Boolean = false;
		public static var emotionNr:int = 7;
		public static var score:int = 0;
		
		private var buttons:Buttons = new Buttons();
		private var answer:Answer = new Answer();
		private var scoreText:FlxText;
		private var gradeText:FlxText;
		
		private var emotion:FlxSprite = new FlxSprite();
		private var basis:FlxSprite = new FlxSprite();		
		private var basisStage:int = 1;
		
		private var testLine:FlxText = new FlxText(20, 400, 100, null);
		
		override public function create(): void	
		{
			FlxG.bgColor = 0xffFFFFFF;
			FlxG.mouse.show();
			emotion.x = 650;
			emotion.y = 100;
			basis.x = 650;
			basis.y = 100;
			
			basis.loadGraphic(Images.basisImages[1]);
			emotion.loadGraphic(Images.emotionImages[7]);
			
			buttons.create();
			answer.create();
			scoreText = new FlxText(FlxG.stage.width - 120, 20, 100, "Score: " + Score.score);
			scoreText.setFormat(null, 12, 0xff282828, "left", 0xff000000);
			gradeText = new FlxText(FlxG.stage.width - 120, 40, 100, "Grade: " + Score.grade.toPrecision(2));
			gradeText.setFormat(null, 12, 0xff282828, "left", 0xff000000);
			
			add(basis);
			add(emotion);		
			add(testLine);
			add(scoreText);
			add(gradeText);
			
			
			super.create();
	    }
		
		override public function update() : void {
			super.update();
			if (questionNr == 8) {
				FlxG.switchState(new EndState());
			}
			else{
				buttons.update();
			}
			scoreText.text = "Score: " + Score.score;
			gradeText.text = "Grade: " + Score.grade.toPrecision(2);
			stage = new int(Score.grade);
				
			if (stage >= 1 && stage <= 3 ) { basisStage = 0 };
			if (stage >= 4 && stage <= 6 ) { basisStage = 1 };			
			if (stage >= 7 && stage <= 10 ) { basisStage = 2 };
		
			if (updateEmotion) {
				basis.loadGraphic(Images.basisImages[basisStage]);
				trace(emotionNr + questionNr);
				emotion.loadGraphic(Images.emotionImages[(emotionNr + questionNr)-2]);				
				emotion.alpha = 1;
				basis.alpha = 0;
				updateEmotion = false;
			}
			if (emotion.alpha >= 0) {
				emotion.alpha -= 0.02;
				basis.alpha += 0.02;
			}
			
			
			
		}
	}
}