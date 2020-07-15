AdvArrayLib, or: How I Learned to Stop Worrying and Abuse the Script Engine

I decided to write a little Papyrus library that exposes some nifty features to vanilla Papyrus programmers that would traditionally either be impossible, or require F4SE. But, though the magic of deliberately abusing the script engine, this functionality can be yours!

Usage:

The library is currently split into two parts:
- AdvArrayLib.psc, which is intended to be compiled with Caprica, and
- AdvArrayLibOff.psc, which is intended to be compiled with the official compiler.
Most important code is in AdvArrayLib.psc, however there is certain functionality that Caprica can't handle, which is offloaded to AdvArrayLibOff.psc
AdvArrayLibOff.psc also includes examples of library usage, and a series of automated tests to validate the correctness of most functions.

If you want to use this library in a project, you'll want to grab:
- Scripts\AdvArrayLib.pex
- Scripts\AdvArrayLibOff.pex
- Scripts\Source\User\AdvArrayLib.psc
- Scripts\Source\User\AdvArrayLibOff.psc

I do not recommend attempting to recompile any of these scripts.
	
In your script, simply call the functions like so:
```	BigArr arr = AdvArrayLib.GetBigArr(8192, None)
	AdvArrayLib.Set(arr, 0, 123)
	AdvArrayLib.Set(arr, 5000, "some string")
	int i = AdvArrayLib.Get(arr, 0) as int
	string s = AdvArrayLib.Get(arr, 5000) as string
```
and so on.
	
If you want to release code using these libraries, be sure to include the precompiled AdvArrayLib.pex and AdvArrayLibOff.pex along with the rest of your scripts.
	
	
Arrays--features and limitations:

The principal feature of this library is the BigArray:
- You may create Var arrays with a maximum size of 128^3, or 2097152.
- 2D and 3D arrays may be created, with a max size of 128 per axis.
- All storage is done via arrays and structs, and no external function calls.
- Relatively low overhead: a full 2097152-element array storing ints adds ~13.3MB to a save, which is only slightly higher than the theoretical minimum of ~8.4MB using 32-bits per int. A full array of ObjectReferences adds about 28.4MB to a save.
- Interacting with array elements is slower than a standard array, but not by a huge amount: I benchmarked get/set access of an abstracted 1D array of size ~1m at about 5777 gets/sets per second. Smaller arrays between 1 and 16384 inclusive would be slightly faster.


And caveats/considerations:
- Arrays created are always fixed-size, so no Add(), Insert(), Remove() or RemoveLast()
- In Papyrus, a Var may hold anything at all--integers, Forms, ObjectRefs, even other arrays! However, you'll have to remember what types are stored where, so be wary when using mixed-type arrays.
- 3D arrays are inherently little slower to access than 2D arrays.
- Likewise, abstracted 1D arrays of size 16385+ are a little slower to access than 129-16384, which are in turn a little slower to access than 1-128. This is because these are, in actuality, 3D, 2D and 1D arrays.
- Dereferencing very large arrays is hard on the game engine's garbage collector, which only seems to clean old data up when the game is saved. Dereferencing a couple 128^3 size arrays may cause the game to take several minutes to save, seemingly hanging in the process.


Supported functions are:

Abstracted 1D arrays:
```
BigArr Function GetBigArr(int size, Var init = None) global
	{Creates a pseudo-Var[] with a max size of 2^21}

Function DeleteArr(BigArr arr) global
	{Dismantles any BigArray's (1D, 2D, or 3D) internal data structures, which may or may not
	help the engine's garbage collector clean up dereferenced arrays faster--may be placebo}

Var Function Get(BigArr arr, int index) global
	{Gets an element of an abstracted 1d array}

Function Set(BigArr arr, int index, var val) global
	{Sets an element of an abstracted 1d array at the given index to the given value}

int Function Find(BigArr arr, Var element, int index = -1, bool reverse = false) global
	{Like Array.Find, looks for the first occurrence of 'element', in array 'arr', starting at 'index'
	IMPORTANT: For technical reasons, this must cast everything to a string before searching.
	This means that if you pass in 1 (int), and have "1" (string) in the array, the function
	may find the string "1" first.}

int Function RFind(BigArr arr, Var element, int index = -1) global
	{Like Array.RFind, looks backwards for the first occurrence of 'element', in array 'arr', starting at 'index'
		The same note about strings as Find() applies.}
```
2D arrays:
```
BigArr Function GetArr2D(int x, int y, Var init = None) global
	{Creates a "rectangular" 2d array of size (x,y), with a maximum axis size of 128.}

v[] Function Getv2D(int x, int y, Var init = None) global
	{Mostly for internal use, creates a 2D array without the BigArr wrapper object.}

Var Function Get2D(BigArr arr, int x, int y) global
	{Gets the element of the given 2D array at index (x,y)}

Function Set2D(BigArr arr, int x, int y, var val) global
	{Sets an element of the given 2D array at index (x,y) to val}

int[] Function Find2D(BigArr arr, Var element, int x = 0, int y = 0) global
	{Like Array.Find, Looks for elements in y, then x, so (0,0) < (0,1) < (1,0) < (0,32) < (32,0) < (32,64) etc
		The same note about strings as Find() applies.}

int[] Function RFind2D(BigArr arr, Var element, int x = -1, int y = -1) global
	{Like Array.RFind, looks for elements in y, then x, so (0,0) < (0,1) < (1,0) < (0,32) < (32,0) < (32,64) etc
		The same note about strings as Find() applies.}
```
3D arrays:
```
BigArr Function GetArr3D(int x, int y, int z, Var init = None) global
	{Creates a "rectangular prismatic" 3d array of size (x,y,z), with a maximum axis size of 128.}

v[] Function Getv3D(int x, int y, int z, Var init = None) global
	{Mostly for internal use, creates a 3D array without the BigArr wrapper object.}

Var Function Get3D(BigArr arr, int x, int y, int z) global
	{Gets the element of the given 3D array at index (x,y,z)}

Function Set3D(BigArr arr, int x, int y, int z, var val) global
	{Sets an element of the given 2D array at index (x,y,z) to val}

int[] Function Find3D(BigArr arr, Var element, int x = 0, int y = 0, int z = 0) global
	{Like Array.Find, looks for elements in z, then y, then x, so (0,0,0) < (0,1,0) < (1,0,0) < (1,32,0) < (2,0,0) etc
		The same note about strings as Find() applies.}

int[] Function RFind3D(BigArr arr, Var element, int x = -1, int y = -1, int z = -1) global
	{Like Array.RFind, looks for elements in z, then y, then x, so (0,0,0) < (0,1,0) < (1,0,0) < (1,32,0) < (2,0,0) etc
		The same note about strings as Find() applies.}
```
Var[] <-> Var stuff:
```
Var[] Function CallFunction(ScriptObject obj, string asFuncName, Var[] aParams) global
	{Nearly the same as ScriptObject.CallFunction, except for functions that return an array.}

Var[] Function CallGlobalFunction(string asScriptName, string asFuncName, Var[] aParams) global
	{Nearly the same as Utility.CallGlobalFunction, except for functions that return an array.}

Var[] Function VarToVarArray(Var v) global
	{Attempts to cast a Var to a Var[]}

Var Function VarArrayToVar(Var[] v) global
	{Attempts to cast a Var[] to a Var}
```
