package  
{
	import flash.events.KeyboardEvent;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	/**
	 * ...
	 * @author Gert-jan
	 */
	public class EditTextState extends FlxState
	{
		private var texts:Texts = new Texts();
		
		private var questionButtons:Array = new Array();
		
		private var editQuestionsButton:FlxButton;
		private var editQuestionsButtonText:FlxText;
		
		private var editAnswersButton:FlxButton;
		private var editAnswersButtonText:FlxText;
		
		private var backButton:FlxButtonPlus;
		private var backButton2:FlxButtonPlus;
		
		private var questionOrAnswerButtonIsPushed:Boolean = false;
		
		private var newQuestion:FlxText;
		
		override public function create(): void	
		{
			FlxG.bgColor = 0xffFFFFFF;
			FlxG.mouse.show();
			
			editQuestionsButton = new FlxButton(FlxG.stage.width / 2 - 100, 200, "", showQuestions);
			editQuestionsButton.makeGraphic(200, 50);
			editQuestionsButtonText = new FlxText(editQuestionsButton.x, editQuestionsButton.y, editQuestionsButton.width, "Vragen");
			editQuestionsButtonText.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			editQuestionsButton.label = editQuestionsButtonText;
			
			editAnswersButton = new FlxButton(FlxG.stage.width / 2 - 100, 350, "", showAnswers);
			editAnswersButton.makeGraphic(200, 50);
			editAnswersButtonText = new FlxText(editAnswersButton.x, editAnswersButton.y, editAnswersButton.width, "Antwoorden");
			editAnswersButtonText.setFormat(null, 18, 0xff282828, "center", 0xff000000);
			editAnswersButton.label = editAnswersButtonText;
			
			backButton = new FlxButtonPlus(100,550, back,null,"Terug", 100, 40);
			backButton.buttonNormal.alpha = 0;
			backButton.buttonHighlight.alpha = 0;
			backButton.textNormal.setFormat(null, 16, 0x000000, "center", 0);
			backButton.textHighlight.setFormat(null, 16, 0x000000, "center", 0);
			add(backButton);
			
			backButton2 = new FlxButtonPlus(700,10, back2,null,"Terug", 100, 40);
			backButton2.buttonNormal.alpha = 0;
			backButton2.buttonHighlight.alpha = 0;
			backButton2.textNormal.setFormat(null, 16, 0x000000, "center", 0);
			backButton2.textHighlight.setFormat(null, 16, 0x000000, "center", 0);
			
			add(editQuestionsButton);
			add(editAnswersButton);
			
			super.create();
	    }
		
		override public function update() : void 
		{
			super.update();				
			
			if (questionOrAnswerButtonIsPushed) 
			{
				if (FlxG.mouse.wheel < 0) {
					if (FlxG.camera.y > -2000) {
						FlxG.camera.y -= 30;
					}
				}
				
				if (FlxG.mouse.wheel > 0) {
					if (FlxG.camera.y < 0) {
						FlxG.camera.y += 30;
					}
				}
			}
			
		}
		
		private function showQuestions():void {
			editQuestionsButton.kill();
			editAnswersButton.kill();
			questionOrAnswerButtonIsPushed = true;
			backButton.kill()
			add(backButton2);
			
			if (Texts._questionsLoaded) {
				for (var i:int = 0; i < Texts._questions.length; i++) {
					var questionButton:FlxButtonPlus = new FlxButtonPlus(50, 50 + (i * 50), editQuestion,[i],"", 900, 40);
					//questionButton.makeGraphic(900, 40);
					questionButton.text = Texts._questions[i];
					questionButton.buttonNormal.alpha = 0;
					questionButton.buttonHighlight.alpha = 0;
					//var question:FlxText = new FlxText(questionButton.x, questionButton.y, questionButton.width, Texts._questions[i]);
					//question.setFormat(null, 12, 0xff282828, "left", 0);
					questionButton.textNormal.setFormat(null, 12, 0xff282828, "left", 0);
					questionButton.textHighlight.setFormat(null, 12, 0xff000000, "left", 0);
					add(questionButton);
					//questionButtons.push(questionButton);
				}
			}
		}
		
		private function showAnswers():void {
			editQuestionsButton.kill();
			editAnswersButton.kill();
			backButton.kill();
			add(backButton2);
			
			questionOrAnswerButtonIsPushed = true;
			
			if (Texts._answersLoaded) {
				for (var i:int=0; i < Texts._answers.length; i++) {
					var answerButton:FlxButtonPlus = new FlxButtonPlus(50, 50 + (i * 80), editAnswer,[i],"", 900, 40);
					//questionButton.makeGraphic(900, 40);
					answerButton.text = Texts._answers[i];
					answerButton.buttonNormal.alpha = 0;
					answerButton.buttonHighlight.alpha = 0;
					//var question:FlxText = new FlxText(questionButton.x, questionButton.y, questionButton.width, Texts._questions[i]);
					//question.setFormat(null, 12, 0xff282828, "left", 0);
					answerButton.textNormal.setFormat(null, 12, 0xff282828, "left", 0);
					answerButton.textHighlight.setFormat(null, 12, 0xff000000, "left", 0);
					add(answerButton);
					//questionButtons.push(questionButton);
				}
			}
		}
		
		private function editQuestion(questionNr:int):void {
			var nextState:FlxState = new EditQuestion(questionNr);

			FlxG.switchState(nextState);
		}
		
		private function editAnswer(answerNr:int):void {
			var nextState:FlxState = new EditAnswer(answerNr);

			FlxG.switchState(nextState);
		}
		
		private function back():void {
			FlxG.switchState(new MenuState());
		}
		
		private function back2():void {
			FlxG.switchState(new EditTextState());
		}
		
	}

}