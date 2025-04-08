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


# Beta Release
(Demonstration in Person)

## REQUIREMENTS MET/NOT MET
Looking back at my proposal, I was much more ambishous with what I aimed to complete. I ultimately did not allot enough time for the basics of the program, the building blocks that the rest of the tower of cards was to be built on. I haven't even started on enemies, the story hasn't been implemented at all, and I still only have one level complete. It is far from a finished product. I did suffer from several delays, but even without those, I would probably need another block to complete what I had initially set out to do.

What I did meet though, I think I did well. The sprites and animations look nice (except maybe the boxes), the tools all work as intended with only a few exceptions, and the player's movement (and turning!) work flawlessly. Unfortunately, those building blocks took up *all* the time I had with countless hours of bug fixing and troubleshooting and the back and forth of importing the sprite only to find I missed a detail and needing to edit it again.

## METHODS
Game Engine Used: Godot

App for Pixel Art: Piskel

### Folder Organization

![image](https://github.com/user-attachments/assets/9e775171-c14e-4b85-8fa6-846cc90d59d0)
![image](https://github.com/user-attachments/assets/4454c1b0-f028-4373-bb56-6bfc532066b5)

![image](https://github.com/user-attachments/assets/61a1ba72-74ac-47b1-b042-a07ae7765bdf)

## PROJECT MANAGEMENT
Project Management is probably where I suffered the most time lost. I had a solid plan going into the block, but it didn't last, and as I started falling behind my schedule, I lost a lot of motivation to make progress. I did eventaully pick myself back up, which is why you're still seeing this. I tracked my progress with the timeline in my proposal paper, using each activity as a goal for the day. Using that metric, I completed 1 week of work in the first 2 weeks.

## WHAT YOU LEARNED
The most important skill I developed this block was learning how to learn. Okay that sounds stupid, by that I mean it was learning a new language in 2 weeks. It was something I meant to do in block 5 & 6, but after a surgery and switching classes, I never had the time to learn the language when I planned to, so I had to learn it in the first 2 weeks of the block to be able to make progress. Being able to pick up a new language in a short time is certainly a helpful skill to have.

I also learned how *not* to divide my work, mainly by failling to properly divide my work and suffering for it.

## PROBLEMS AND SOLUTIONS
Games are very buggy during development. Most of these I wouldn't consider significant problems, but there are a few I'd like to share.

Exploding buds spawning in the wrong position (corrected by changing the position in the bud code rather than the plant's code)

![image](https://github.com/user-attachments/assets/624338d0-b443-44af-b854-7c3a4270367d)

Collision rays colliding with parent of parent node because "exclude parent node" only goes up one layer I guess

![image](https://github.com/user-attachments/assets/8ccb09a1-7f57-4ff2-8d5f-2ab51498c4fa)
![image](https://github.com/user-attachments/assets/9db26c27-f931-4933-8435-7c6499934899)

If the bridge node lost power before it finnished extending, the second bridge segment would stay there (fixed by making it only retract after fully extending)

![image](https://github.com/user-attachments/assets/3e03cbb4-a861-446f-8e6f-88666480e854)


All of these problems I fixed myself, the ones I needed more outside help with were in the Alpha release

## WHAT NEXT?
With more time, I would like to make this game into a full game I consider worth publishing for the general public. Even with one more block I believe I could get it to a state that would be publishable, but I have no way of knowing without going for it at this point.
