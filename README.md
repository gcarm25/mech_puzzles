# mech_puzzles

## Software Used
Godot - Chosen for its free use and publishing license. Also has built in physics engine which will save time coding.

Piskel - Pixel art creator, chosen for its free use and ability to export as spritesheet.

## Code and Functionality
Godot has 2 primary types of files to determine how the code works.

.tcsn files contain nodes such as RigidBody nodes, Collision nodes, RayCast nodes, and Animation nodes. Nodes have inherent functions that can be used in their code as well as several options in the menu that can determine aspects of their functionality (these can also be edited in code). These files can be imported into one another as nodes, and are used as the 'levels' in godot.

An example of a CharacterBody2D node menu

![image](https://github.com/user-attachments/assets/65d8cafe-5bf2-4868-ae82-a4178043d993)

An example of a 'level' in godot

![image](https://github.com/user-attachments/assets/4dde7bfc-0ce1-4d40-be08-9d4a5a547af9)

.gd files contain code. Every node can have a .gd file attached to it, although usually only the parent node needs code attached to it. All .gd files have the '_ready()' and '_process()' functions when created, which run when created and on each frame respectively.

An example of a projectile's code.

![image](https://github.com/user-attachments/assets/662958d0-af20-4b61-a984-0b3d30aaf82a)

## Notable Functions
There are a few notable sections of code I want to share.

This code is what is used to switch from the menu to the first level

![image](https://github.com/user-attachments/assets/b27e8d25-2316-463b-81a1-3e6ad5eab74c)

This code is how the player moves on a grid.

![image](https://github.com/user-attachments/assets/fcd26515-95c1-4526-b620-f204a1967af3)
