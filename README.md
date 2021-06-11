<h1> Space Frogger </h1>

Elizabeth Stansberry and Aidan Fingeret

<h2> Project Description: </h2>
A frog stranded in space needs to make his way back to his froggy home planet. The frog avoids asteroids coming from right to left while trying to shoot enemy spaceships. Once all the enemy spaceships he must make his way across the level to get to the wormhole. After the first level the enemy spaceships will start shooting back at the frog. Player will use WASD or arrow movement and use the spacebar to shoot. If the player succeeds in all levels, the frog is reunited with his friends and family on his planet. The player will have three lives for the entire game; if the player dies, by asteroid or enemy fire, the level will restart and the player will lose a life.

<h2>Link to Prototype: </h2>
https://docs.google.com/document/d/170Zhcxiy1f5RUTc2yg8nOsAyw1jsenJ-h1eg3fg3TxA/edit?usp=sharing

<h2>Run Instructions: </h2>
Open SpaceFrogger.pde, hit the play button, and follow in game instructions.

<h2> Elizabeth's Development log: <br/> </h2>
5/24/21 - I created all of the classes and individual files, basically just the skeleton of the program, and then I added a few new methods that we discussed in class. <br/>
5/26/21 - I wrote the code for the frog's basic appearance and wrote a loop to add stars to the background. <br/>
5/28/21 - I fixed an issue with the background <br/>
5/31/21 - I made a fix with the instantiation of our ArrayLists, and added the code for the design of the Alien spaceship. <br/>
6/3/21 - I added limits to the movement of the frog, added the wormhole design, added design fixes for the asteroids, and coded the movement of the Alien spaceships. <br/>
6/7/21 - I added the intro story that sets up the game. </br>
6/9/21 - I added a skip intro button, changed the intro, and changed the ship colors per level </br>
6/10/21 - I added the ending story, changed the movement and speed of the ships by level. </br>

<h2> Aidan's Development log: <br/> </h2>
5/24/21 - I created the constructors for each of the classes and then wrote some barebones code for the move methods in each class. <br/>
5/26/21 - I updated all the double variables to float and starting working on the SpaceFrogger code: I instantiated some ArrayLists for the different classes, wrote the keyPressed method, and starting working on the setup and draw methods.  <br/>
5/28/21 - Made entity an abstract class, fixed keyPressed, cleaned up Frog constructor and display variable names, and changed move methods to use dx and dy. <br/>
5/31/21 - The Frog is now able to shoot bullets and draw method goes through the bullets and moves them accordingly. <br/>
6/1/21 - There is now a limit on the bullets and they are removed once off screen. The Bullets now effect the enemy ships, asteroids, and user, destroying the enemies on impact and lowering the hp of the asteroids and user. <br/>
6/3/21 - Added a new collide method for the Frog class and added in the asteroids. <br/>
6/7/21 - Enemies now shoot bullets that kill user when hit. Frog and enemy bullets cancel each other out now. <br/>
6/8/21 - We now have 5 levels and the game restarts when the Frog loses his three lives. <br/>
6/9/21 - Fixed some bugs related to the wormhole and the levels. Also increased speed of asteroids as levels increase to increase difficulty. <br/>
