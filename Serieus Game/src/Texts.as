package  
{
	import flash.events.*;
	import flash.net.*;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class Texts 
	{
		private var questionsLoader:URLLoader = new URLLoader();
		private var answersLoader:URLLoader = new URLLoader();
			
		public static var _questions:Array = new Array();
		public static var _questionsLoaded:Boolean = false;
		
		public static var _answers:Array = new Array();
		public static var _answersLoaded:Boolean = false;
		
		public function Texts() 
		{		
			questionsLoader.addEventListener(Event.COMPLETE, loadQuestions);			
			questionsLoader.load(new URLRequest("questionsFile.txt"));	
			
			answersLoader.addEventListener(Event.COMPLETE, loadAnswers);			
			answersLoader.load(new URLRequest("answersFile.txt"));		
		}
		
		private function loadQuestions(e:Event):void {
			if (!_questionsLoaded)
			{
			_questions = e.target.data.split(/\n/);	
			_questionsLoaded = true;
			trace("questionsLoader loaded");
			}
		}
		
		private function loadAnswers(e:Event):void {
			if (!_answersLoaded)
			{
				_answers = e.target.data.split(/\n/);	
			
			_answersLoaded = true;
			trace("answers loaded");
			}
		}
		
	}

}