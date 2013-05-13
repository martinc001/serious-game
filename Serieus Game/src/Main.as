package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.*;
	
	[SWF(width="1000", height="600", backgroundColor="#FFFFFF")]
	/**
	 * ...
	 * @author Serieus Game Team
	 */
	public class Main extends FlxGame
	{
		
		public function Main() {
			
			super(1000, 4000, MenuState, 1);
		}
		
	}
	
}