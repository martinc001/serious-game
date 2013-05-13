package  
{
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class Score 
	{
		public static var score:int = 0;
		public static var grade:Number = 0;
		
		public function Score() 
		{
			
		}
		
		public static function updateScore(score_increaseBy:int):void {
			score += score_increaseBy;
			updateGrade();
		}
		
		private static function updateGrade():void 
		{
			grade = score / PlayState.questionNr;
		}
		
		private static function roundNumber(numb:Number, decimal:Number):Number
		{
			var precision:Number = Math.pow(10,decimal);
			return Math.round(numb*precision )/precision;
		}
		
	}

}