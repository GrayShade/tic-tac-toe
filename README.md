# tic-tac-toe
## Description:
  This is an oop based project done in ruby. As the name suggests, it is a game. It comprises of three classes. `game.rb` is the main class file.
  Game class in game.rb requires other files `board.rb` & `player.rb` & creates required objects of Player & Board classes. Classes other than the Game class have no objects created in their files. Player & Board classes don't have any access to Game class or to each other directly in anyway. Game class can access them. All methods not necessary to be public are private across all classes. There There are no inherited classes in the project. There was no seeming need or possibility(due to heavy dependecy of methods on other instance methods) of class methods, class variables  too. Inline private access modifiers were used in all classes for the sake of readability.

  ## Why More Lines Of Code:
  This is longer than it could be because of multiple reasons. A few things come to mind. First, I had made it while ensuring its being dynamic in nature. You only have to specify the size of board you want to make, like 4 or 5 instead of 3 only. `--------` below each row of displayed board is hardcoded for now. That got to be changed. Otherwise it must work as intended. The winning positions, due to dynamic nature of project, were not pre stored in any way. It would had been too easy anyway. Third is being readability, proper validations & adhering to good code practices. Not using numbers only for input is a reason too. It required more validation. 

  ## How To Run:
  Open terminal / cd to project roo directory & run below line in terminal: <br />
  `ruby game.rb`

  ## Future Work:
  Not that I can think of anything. Yet anyway...
  Check if OOP best practices are adhered.
  Changing input to numbers instead of row & columns for readability


