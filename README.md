# mech_puzzles

## Software Used
Godot - Chosen for its free use and publishing license. Also has built in physics engine which will save time coding.

Piskel - Pixel art creator, chosen for its free use and ability to export as spritesheet.

## Code and Functionality
Godot has 2 primary types of files to determine how the code works.

.tcsn files (or 'scene' files) contain nodes such as RigidBody nodes, Collision nodes, RayCast nodes, and Animation nodes. Nodes have inherent functions that can be used in their code as well as several options in the menu that can determine aspects of their functionality (these can also be edited in code). These files can be imported into one another as nodes, and are used as the 'levels' in godot.

An example of a CharacterBody2D node menu

![image](https://github.com/user-attachments/assets/65d8cafe-5bf2-4868-ae82-a4178043d993)

An example of a 'level' in godot

![image](https://github.com/user-attachments/assets/4dde7bfc-0ce1-4d40-be08-9d4a5a547af9)

.gd files contain code. Every node can have a .gd file attached to it, although usually only the parent node needs code attached to it. All .gd files have the '_ready()' and '_process()' functions when created, which run when created and on each frame respectively.

An example of a projectile's code.

![image](https://github.com/user-attachments/assets/662958d0-af20-4b61-a984-0b3d30aaf82a)

Godot is most similar visually to Python, although it is its own coding language. Variables are defined with a "var" tag before them. Godot also doesn't really have global variables. There is a way to make variables that can be shared between files, but it isn't as intuitive as global variables in other programming languages. On that note, Godot doesn't have imports, at least not in the way that other languages do. Each .gd file can only extend one file, which is almost always the type of node. The most notable change to a specific function in Godot is the Match function from Python. In Python, each case of the match statement has "case" before the condition, Godot forgoes this entirely. Other than that difference though, the syntax is the same.

# Alpha Release

My project, if not already apparent, is a puzzle-solving video game. You play as a pilot in a mech suit trying to leave the planet. The game takes a 2D top-down perspective and all movement is based on a tile grid. Each tile is 64 x 64 pixels. The philosophy behind the game is that no level should have only one solution. Given the tools at hand, and a variety of environmental features, you should be able to solve the level in multiple ways.

## Notable Functions
There are a few notable sections of code I want to share from my Alpha release

This code is what is used to switch from the menu to the first level

![image](https://github.com/user-attachments/assets/b27e8d25-2316-463b-81a1-3e6ad5eab74c)

This code is how the player moves on a grid.

![image](https://github.com/user-attachments/assets/fcd26515-95c1-4526-b620-f204a1967af3)

## Notable Problems
As is with any new coding language, there are bound to be confusing issues. I've run into bugs where the player would rotate off the 90 degree rotations I meant them to be on, or the gravity orb that began spinning around one corner of its hit-box when I first implemented rotation. I also found a bug that caused the player to move in unexpected ways, enabling them to move inside walls. While the former two of the problems were solved with changes to the code and parameters to change what the objects would do during runtime, the latter one I fixed by not allowing the player to move during certain actions, preventing the case where they would move unnexpectedly in the first place.

## Looking Forward
As far as progress goes, I have completed 1 of 10 levels and 8 other scene files. I estimate that the completed project will have around 40 scene files (not including levels), so I have a long ways to go.

Some things I intend to add before the end of the block are

1. All of the Tool Functionalities
2. A Level Select screen
3. An Options screen
4. Basic enemies
5. At least 4 more levels
