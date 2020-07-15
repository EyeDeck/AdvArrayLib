ScriptName AdvArrayLib
{ A utility library that allows users of the reference Papyrus compiler
 to do things that the compiler would normally forbid.

 DO NOT attempt to recompile (though it won't work anyway)

           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                   Version 2, December 2004
 
Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.
 
           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

 0. You just DO WHAT THE FUCK YOU WANT TO.
}

Struct v
	; just ignore this
	bool dummy
EndStruct

Struct BigArr
	; The base data structure that most functions use
	int size
	int levels
	; v a
EndStruct

; reloadscript "AdvArrayLib"

; Generic big arrays
BigArr Function GetBigArr(int size, Var init = None) global
{Creates a pseudo-Var[] with a max size of 2^21, with minimal overhead.

Example:
AdvArrayLib:BigArr arr = AdvArrayLib.GetBigArr(80000)

AdvArrayLib.Set(arr, 10000, 1.0)
AdvArrayLib.Set(arr, 20000, 6)
AdvArrayLib.Set(arr, 70000, Game.GetPlayer())

float a = AdvArrayLib.Get(10000) as float	; 1.0
int b = AdvArrayLib.Get(20000) as int		; 6
Actor c = AdvArrayLib.Get(70000) as Actor	; PlayerRef
}
	return None
EndFunction

Function DeleteArr(BigArr arr) global
{Dismantles the array's internal data structures, which may or may not help the
engine's garbage collector clean up dereferenced arrays faster--may be placebo}
EndFunction

Var Function Get(BigArr arr, int index) global
{Gets an element of an abstracted 1d array}
	return None
EndFunction

Function Set(BigArr arr, int index, var val) global
{Sets an element of an abstracted 1d array at the given index to the given value}
EndFunction

int Function Find(BigArr arr, Var element, int index = -1, bool reverse = false) global
{Like Array.RFind, looks backwards for the first occurrence of 'element', in array 'arr', starting at 'index'

IMPORTANT: For technical reasons, this must cast everything to a string before searching.
This means that if you pass in 1 (int), and have "1" (string) in the array, the function
may find the string "1" first.}
	return -1
EndFunction

int Function RFind(BigArr arr, Var element, int index = -1) global
{Like Array.RFind, looks backwards for the first occurrence of 'element', in array 'arr', starting at 'index'

IMPORTANT: For technical reasons, this must cast everything to a string before searching.
This means that if you pass in 1 (int), and have "1" (string) in the array, the function
may find the string "1" first.}
	return -1
EndFunction


int[] Function Find2D(BigArr arr, Var element, int x = 0, int y = 0) global
{Like Array.Find, Looks for elements in y, then x, so (0,0) < (0,1) < (1,0) < (0,32) < (32,0) < (32,64) etc

IMPORTANT: For technical reasons, this must cast everything to a string before searching.
This means that if you pass in 1 (int), and have "1" (string) in the array, the function
may find the string "1" first.}
	return None
EndFunction

int[] Function RFind2D(BigArr arr, Var element, int x = -1, int y = -1) global
{Like Array.RFind, looks for elements in y, then x, so (0,0) < (0,1) < (1,0) < (0,32) < (32,0) < (32,64) etc

IMPORTANT: For technical reasons, this must cast everything to a string before searching.
This means that if you pass in 1 (int), and have "1" (string) in the array, the function
may find the string "1" first.}
	return None
EndFunction

int[] Function Find3D(BigArr arr, Var element, int x = 0, int y = 0, int z = 0) global
{Like Array.Find, looks for elements in z, then y, then x, so (0,0,0) < (0,1,0) < (1,0,0) < (1,32,0) < (2,0,0) etc

IMPORTANT: For technical reasons, this must cast everything to a string before searching.
This means that if you pass in 1 (int), and have "1" (string) in the array, the function
may find the string "1" first.}
	return None
EndFunction

int[] Function RFind3D(BigArr arr, Var element, int x = -1, int y = -1, int z = -1) global
{Like Array.RFind, looks for elements in z, then y, then x, so (0,0,0) < (0,1,0) < (1,0,0) < (1,32,0) < (2,0,0) etc

IMPORTANT: For technical reasons, this must cast everything to a string before searching.
This means that if you pass in 1 (int), and have "1" (string) in the array, the function
may find the string "1" first.}
	return None
EndFunction

; end big arrays, begin 2d arrays

v[] Function Getv2D(int x, int y, Var init = None) global
	return None
EndFunction

BigArr Function GetArr2D(int x, int y, Var init = None) global
{Creates a "rectangular" 2d array of size (x,y)
Note that x and y must be <= 128}
	return None
EndFunction

Function Set2D(BigArr arr, int x, int y, var val) global
{Sets an element of the given 2D array at index (x,y) to val}
EndFunction

Var Function Get2D(BigArr arr, int x, int y) global
{Gets the element of the given 2D array at index (x,y)}
EndFunction

; end 2d arrays, begin 3d arrays

v[] Function Getv3D(int x, int y, int z, Var init = None) global
	return None
EndFunction

BigArr Function GetArr3D(int x, int y, int z, Var init = None) global
{Creates a "rectangular prismatic" 3d array of size (x,y,z)
Note that x, y and z must be <= 128}
	return None
EndFunction

Function Set3D(BigArr arr, int x, int y, int z, var val) global
{Sets an element of the given 2D array at index (x,y,z) to val}
EndFunction

Var Function Get3D(BigArr arr, int x, int y, int z) global
{Gets the element of the given 3D array at index (x,y,z)}
	return None
EndFunction

; end arrays, begin Var[] <-> Var stuff

Var[] Function CallFunction(ScriptObject obj, string asFuncName, Var[] aParams) global
{Nearly the same as ScriptObject.CallFunction, except for functions that return an array.

Example:
float[] Function ObjectReference.GetSafePosition(float aSearchRadius, float aSafeRadius)
	
If the compiler worked sanely, you would be able to do:
	var[] args = new var[2]
	var[0] = 1024.0
	var[1] = 256.0
	float[] f = ref.CallFunction("GetSafePosition", args) as float[]
	
Through this library, you can do:
	float[] f = AdvArrayLib.CallFunction(ref, "GetSafePosition", args) as float[]
}
	return None
EndFunction

Var[] Function CallGlobalFunction(string asScriptName, string asFuncName, Var[] aParams) global
{Nearly the same as Utility.CallGlobalFunction, except for functions that return an array.

Example:
Actor[] Function Game.GetPlayerFollowers() native global
	
If the compiler worked sanely, you would be able to do:
	Actor[] a = Utility.CallGlobalFunction("Game", "GetPlayerFollowers", new var[0]) as Actor[]
	
Through this library, you can do:
	Actor[] a = AdvArrayLib.CallGlobalFunction("Game", "GetPlayerFollowers", new var[0]) as Actor[]
}
	return None
EndFunction

Var[] Function VarToVarArray(Var v) global
{Attempts to cast a Var to a Var[]}
	return None
EndFunction

Var Function VarArrayToVar(Var[] v) global
{Attempts to cast a Var[] to a Var}
	return None
EndFunction
