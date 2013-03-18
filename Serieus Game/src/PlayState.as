package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Serieus Game Team

	 */
	public class PlayState extends FlxState
	{
		
		override public function create(): void	
		{
			add(new FlxText(0, 0, 100, "Hello Fake world"));
			}
		
	}

}