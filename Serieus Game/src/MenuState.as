package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class MenuState extends FlxState
	{
		private var playButton:FlxButton;
		private var playButtonText:FlxText;
		
		private var editTextsButton:FlxButton;
		private var editTextsButtonText:FlxText;
		
		override public function create(): void	
		{
			FlxG.bgColor = 0xffFFFFFF;
			FlxG.mouse.show();
			
			playButton = new FlxButton(FlxG.stage.width / 2 - 100, 200, "", gotoPlayState);
			playButton.makeGraphic(200, 50);
			playButtonText = new FlxText(playButton.x, playButton.y, playButton.width, "Play!");
			playButtonText.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			playButton.label = playButtonText;
			
			editTextsButton = new FlxButton(FlxG.stage.width / 2 - 200, 350, "", gotoEditTexts);
			editTextsButton.makeGraphic(400, 50);
			editTextsButtonText = new FlxText(editTextsButton.x, editTextsButton.y, editTextsButton.width, "Vragen / Antwoorden wijzigen");
			editTextsButtonText.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			editTextsButton.label = editTextsButtonText;
			
			add(playButton);
			add(editTextsButton);
			
			FlxG.camera.setBounds(0, 0, 1000, 4000, true);
			FlxG.worldBounds = new FlxRect (0,0, 4000,200);
	    }
		
		override public function update() : void 
		{
			super.update();			
			
		}
		
		private function gotoPlayState():void {
			FlxG.switchState(new PlayState());
		}
		
		private function gotoEditTexts():void {
			FlxG.switchState(new SecurityState());
			
		}
		
	}

}