package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class EndState extends FlxState
	{
		private var score:FlxText;
		private var grade:FlxText;
		
		override public function create(): void	
		{
			FlxG.state.clear();
			FlxG.bgColor = 0xffFFFFFF;
			FlxG.mouse.show();
			
			score = new FlxText(FlxG.stage.width / 2 - 50, 200, 100, "Score: " + new int(Score.score));
			score.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			
			grade = new FlxText(FlxG.stage.width / 2 - 50, 350, 100, "Cijfer: " + new int(Score.grade));
			grade.setFormat(null, 24, 0xff282828, "center", 0xff000000);
			
			add(score);
			add(grade);
			
			super.create();
	    }
		
	}

}