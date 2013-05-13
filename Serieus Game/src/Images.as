package  
{
	import org.flixel.*;
	
	
	public class Images  
	{
		//Images
		[Embed(source = "Images/Blij.png")] private static var A1:Class;
		[Embed(source = "Images/Blij.png")] private static var A2:Class;
		[Embed(source = "Images/Blij2.png")] private static var A3:Class;
		[Embed(source = "Images/Enthousiast.png")] private static var A4:Class;
		[Embed(source = "Images/Enthousiast.png")] private static var A5:Class;
		[Embed(source = "Images/Enthousiast2.png")] private static var A6:Class;
		[Embed(source = "Images/Blij.png")] private static var A7:Class; 
		
		
		[Embed(source = "Images/Neutraal.png")] private static var B1:Class;
		[Embed(source = "Images/Neutraal.png")] private static var B2:Class;
		[Embed(source = "Images/Neutraal.png")] private static var B3:Class;
		[Embed(source = "Images/Neutraal.png")] private static var B4:Class; 
		[Embed(source = "Images/Neutraal.png")] private static var B5:Class;
		[Embed(source = "Images/Neutraal.png")] private static var B6:Class;
		[Embed(source = "Images/Neutraal.png")] private static var B7:Class;
		
		
		[Embed(source = "Images/Verbaasd.png")] private static var C1:Class; 
		[Embed(source = "Images/Verward.png")] private static var C2:Class;
		[Embed(source = "Images/Neutraal.png")] private static var C3:Class;
		[Embed(source = "Images/Boos.png")] private static var C4:Class;
		[Embed(source = "Images/Verward.png")] private static var C5:Class; 
		[Embed(source = "Images/Boos.png")] private static var C6:Class;
		[Embed(source = "Images/Boos2.png")] private static var C7:Class;
		
		//Neutralen
		[Embed(source = "Images/Blij.png")] private static var higher_neutral:Class;
		[Embed(source = "Images/Neutraal.png")] private static var Neutral:Class;
		[Embed(source = "Images/Bedroefd.png")] private static var lower_neutral:Class;
		
		//0-6 button A,  7-13 button B,  14-20 button C.
		public static var emotionImages:Array = new Array(A1, A2, A3, A4, A5, A6, A7, B1, B2, B3, B4, B5, B6, B7, C1, C2, C3, C4, C5, C6, C7);
		public static var basisImages:Array = new Array(lower_neutral, Neutral, higher_neutral);	
		
	}

}