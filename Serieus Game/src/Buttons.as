package  
{
	import flash.text.TextField;
	import org.flixel.*;
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class Buttons  
	{
		private var texts:Texts = new Texts();
		
		private var buttonA:FlxButton; 
		private var buttonB:FlxButton; 
		private var buttonC:FlxButton; 
		
		private var buttonAText:FlxText;
		private var buttonBText:FlxText;
		private var buttonCText:FlxText;
		
		private var buttonPositions_Y:Array = new Array(350, 430, 510);
		
		public function Buttons() 
		{
			buttonA = new FlxButton(20, buttonPositions_Y[0], "", updateButtonA);
			buttonA.makeGraphic(500, 80);
			buttonAText = new FlxText(buttonA.x, buttonA.y, buttonA.width, "");
			buttonAText.setFormat(null, 12, 0xff282828, "left", 0xff000000);

			
			buttonB = new FlxButton(20, buttonPositions_Y[1], "", updateButtonB);
			buttonB.makeGraphic(500, 80);
			buttonBText = new FlxText(buttonB.x, buttonB.y, buttonB.width, "");
			buttonBText.setFormat(null, 12, 0xff282828, "left", 0xff000000);
			
			
			buttonC = new FlxButton(20, buttonPositions_Y[2], "", updateButtonC);
			buttonC.makeGraphic(500, 80);	
			buttonCText = new FlxText(buttonC.x+10, buttonC.y, buttonC.width, "");
			buttonCText.setFormat(null, 12, 0xff282828, "left", 0xff000000);
			
		}
		
		public function create():void {
			
			FlxG.state.add(buttonA);
			FlxG.state.add(buttonB);
			FlxG.state.add(buttonC);
		}
		
		public function update():void
		{				
			if (Texts._questionsLoaded) {
				
				buttonAText.text = Texts._questions[0 + (3 * (PlayState.questionNr - 1))];
				buttonA.label = buttonAText;
				//buttonAText.fadeAndDie();
				
				buttonBText.text = Texts._questions[1 + (3 * (PlayState.questionNr - 1))];
				buttonB.label = buttonBText
				//buttonBText.fadeAndDie();
				
				buttonCText.text = Texts._questions[2 + (3*(PlayState.questionNr-1))];
				buttonC.label = buttonCText
				//buttonCText.fadeAndDie();
			}
		}
		
		private function updateButtonA():void {
			Score.updateScore(10);
			Answer.updatetext("A");
			PlayState.questionNr += 1;
			PlayState.updateEmotion = true;
			PlayState.emotionNr = 0;
			updateRandomPositions();

		}
		private function updateButtonB():void {
			Score.updateScore(5);
			Answer.updatetext("B");
			PlayState.questionNr += 1;
			PlayState.emotionNr = 7;
			updateRandomPositions();
			
		}
		private function updateButtonC():void {
			Score.updateScore(1);
			Answer.updatetext("C");
			PlayState.questionNr += 1;
			PlayState.updateEmotion = true;
			PlayState.emotionNr = 14;
			updateRandomPositions();
			
		}
		
		private function updateRandomPositions():void {
			arrayShuffle(buttonPositions_Y);
			buttonA.y = buttonPositions_Y[0];
			buttonB.y = buttonPositions_Y[1];
			buttonC.y = buttonPositions_Y[2];
		}
		
		private function arrayShuffle(array:Array):Array
        {
           for(var i:Number = 0; i < array.length; i++)
           {
              var randomNum_num:Number = Math.floor(Math.random() * array.length)
              var arrayIndex:int = array[i];
              array[i] = array[randomNum_num];
              array[randomNum_num] = arrayIndex;
           }
           return array;
        }
		
	}

}