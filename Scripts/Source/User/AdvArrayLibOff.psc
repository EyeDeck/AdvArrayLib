ScriptName AdvArrayLibOff
{Component of AdvArrayLib for the Official compiler, NOT Caprica

Only strictly required for VarArrToStringArr(), which Caprica cannot compile
because of a bug, but includes examples and test cases as well.

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

import AdvArrayLib

string[] Function VarArrToStringArr(Var[] v) global
{Required for some of AdvArrayLib's functions, because Caprica has a bug that prevents cast of Var[] to string[]}
	return v as string[]
EndFunction

; cgf "AdvArrayLibOff.AutoTest"
Function AutoTest() global
	; usually takes about 15 seconds in my testing
	Debug.Trace("Running automated tests for AdvArrayLib...")
	int passed = 0
	int total = 0
	
	passed += AutoTestArr(64, None, false) as int
	passed += AutoTestArr(128, None, false) as int
	passed += AutoTestArr(129, None, false) as int
	passed += AutoTestArr(200, None, false) as int
	passed += AutoTestArr(1024, None, false) as int
	passed += AutoTestArr(3138, None, false) as int
	total += 6

	passed += AutoTestArr(8192, None, false) as int
	passed += AutoTestArr(16384, None, false) as int
	passed += AutoTestArr(16385, None, false) as int
	passed += AutoTestArr(20000, None, true) as int
	passed += AutoTestArr(32768, None, true) as int
	passed += AutoTestArr(40000, None, false) as int
	total += 6
	
	passed += AutoTestArr(100000, None, true) as int
	passed += AutoTestArr(1000000, None, true) as int
	passed += AutoTestArr(2097152, None, true) as int
	total += 3
	
	passed += AutoTestArr(64, 123456, false) as int
	passed += AutoTestArr(128, 123456, false) as int
	passed += AutoTestArr(200, 123456, false) as int
	passed += AutoTestArr(256, 123456, false) as int
	passed += AutoTestArr(16384, 123456, false) as int
	passed += AutoTestArr(32768, 123456, false) as int
	total += 6
	
	passed += AutoTestArr(16384, 9000.1, true) as int
	passed += AutoTestArr(16384, Game.GetPlayer(), true) as int
	passed += AutoTestArr(16384, "test string", true) as int
	total += 3
	
	; ran this once and it took 6m03s, which means about 5777 read or write ops/s
	;passed += AutoTestArr(2097152, 1232, false) as int
	;total += 1
	
	; passed += TestCallGlobalFunctionWithArray() as int ; doesn't work, so just skip it
	passed += TestCallFunction() as int
	passed += TestVarToVarArray() as int
	passed += TestVarToVarArrayToVar() as int
	total += 3
	
	passed += TestFind2D() as int
	passed += TestFind3D() as int
	total += 2
	
	passed += TestFindAbstracted(128) as int
	passed += TestFindAbstracted(1024) as int
	passed += TestFindAbstracted(2723) as int
	passed += TestFindAbstracted(16384) as int
	passed += TestFindAbstracted(16385) as int
	passed += TestFindAbstracted(100000) as int
	total += 6
	
	Debug.Trace("###########################################")
	Debug.Trace("AdvArrayLib tests complete: Passed " + passed + " / " + total + "!")
	Debug.Trace("###########################################")
EndFunction

bool Function TestFindAbstracted(int size) global
	BigArr arr = GetBigArr(size, None)
	
	int[] x = new int[0]
	int inc = size / 62
	int i = 0
	while (i < size)
		x.Add(i)
		i += inc
	endwhile
	x.Add(size-1)
	int len = x.Length
	
	i = 0
	while (i < len)
		Set(arr, x[i], 123)
		int verify = Get(arr, x[i]) as int
		if (verify != 123)
			Debug.Trace("\tFAILED TestFindAbstracted() size " + size + "		Failed to set index " + x[i] + " to " + verify)
			DeleteArr(arr)
			return false
		endif
		i += 1
	endwhile
	
	int r
	i = 0
	while (i < len)
		r = Find(arr, 123, r)
		; Debug.Trace("got " + r + ", expected " + x[i])
		if (r != x[i])
			Debug.Trace("\tFAILED TestFindAbstracted() size " + size + " forward search: got " + r + ", expected " + x[i])
			DeleteArr(arr)
			return false
		endif
		r += 1
		i += 1
	endwhile
	
	; check again in reverse...
	r -= 1
	i -= 1
	while (i > 0)
		r = RFind(arr, 123, r)
		; Debug.Trace("got " + r + ", expected " + x[i])
		if (r != x[i])
			Debug.Trace("\tFAILED TestFindAbstracted() size " + size + " reverse search: got " + x[i] + ", expected " + r)
			DeleteArr(arr)
			return false
		endif
		
		r -= 1
		i -= 1
	endwhile
	
	Debug.Trace("\tPASSED TestFindAbstracted() size " + size)
	DeleteArr(arr)
	return true
EndFunction

bool Function TestFind2D() global
	int len = 7
	int[] x = new int[len]
	int[] y = new int[len]
	int arrSize = 32
	
	x[1] = 0
	y[1] = 1
	x[2] = 1
	y[2] = 0
	x[3] = 5
	y[3] = 5
	x[4] = 10
	y[4] = 10
	x[5] = 20
	y[5] = 10
	x[6] = 31
	y[6] = 31
	
	BigArr arr = GetArr2D(arrSize, arrSize, None)
	int i = 0
	while (i < len)
		Set2D(arr, x[i], y[i], 123)
		i += 1
	endwhile
	
	int[] r = new int[2]
	i = 0
	while (i < len)
		r = Find2D(arr, 123, r[0], r[1])
		; Debug.Trace("got " + r + ", expected (" + x[i] + "," + y[i] + ")")
		if (r == None || r[0] != x[i] || r[1] != y[i])
			Debug.Trace("\tFAILED TestFind2D() forward search: got " + r + ", expected (" + x[i] + "," + y[i] + ")")
			DeleteArr(arr)
			return false
		endif
		
		; 30,31+1 -> 30,32 -> 31,0
		r[1] += 1
		if (r[1] > arrSize-1)
			r[1] = 0
			r[0] += 1
		endif
		
		i += 1
	endwhile
	
	r[0] = arrSize-1
	r[1] = arrSize-1
	; check again in reverse...
	i -= 1
	while (i > 0)
		r = RFind2D(arr, 123, r[0], r[1])
		; Debug.Trace("got " + r + ", expected (" + x[i] + "," + y[i] + ")")
		if (r == None || r[0] != x[i] || r[1] != y[i])
			Debug.Trace("\tFAILED TestFind2D() reverse search: got " + r + ", expected (" + x[i] + "," + y[i] + ")")
			DeleteArr(arr)
			return false
		endif
		
		; 1,0-1 -> 1,-1 -> 0,31
		r[1] -= 1
		if (r[1] < 0)
			r[1] = arrSize-1
			r[0] -= 1
		endif
		
		i -= 1
	endwhile
	
	Debug.Trace("\tPASSED TestFind2D()")
	DeleteArr(arr)
	return true
EndFunction

bool Function TestFind3D() global
	int len = 7
	int[] x = new int[len]
	int[] y = new int[len]
	int[] z = new int[len]
	int arrSize = 32
	
	x[1] = 0
	y[1] = 0
	z[1] = 1
	x[2] = 0
	y[2] = 1
	z[2] = 0
	x[3] = 1
	y[3] = 0
	z[3] = 0
	x[4] = 5
	y[4] = 5
	z[4] = 5
	x[5] = 31
	y[5] = 31
	z[5] = 0
	x[6] = 31
	y[6] = 31
	z[6] = 31
	
	BigArr arr = GetArr3D(arrSize, arrSize, arrSize, None)
	int i = 0
	while (i < len)
		Set3D(arr, x[i], y[i], z[i], 123)
		i += 1
	endwhile
	
	int[] r = new int[3]
	i = 0
	while (i < len)
		r = Find3D(arr, 123, r[0], r[1], r[2])
		; Debug.Trace("got " + r + ", expected (" + x[i] + "," + y[i] + "," + z[i] + ")")
		if (r[0] != x[i] || r[1] != y[i] || r[2] != z[i])
			Debug.Trace("\tFAILED TestFind3D() forward search: got " + r + ", expected (" + x[i] + "," + y[i] + "," + z[i] + ")")
			DeleteArr(arr)
			return false
		endif
		
		; 30,31,31+1 -> 30,32,0 -> 31,0,0
		r[2] += 1
		if (r[2] > arrSize-1)
			r[2] = 0
			r[1] += 1
		endif
		if (r[1] > arrSize-1)
			r[1] = 0
			r[0] += 1
		endif
		
		i += 1
	endwhile
	
	; check again in reverse...
	r[0] = arrSize-1
	r[1] = arrSize-1
	r[2] = arrSize-1
	i -= 1
	while (i > 0)
		r = RFind3D(arr, 123, r[0], r[1], r[2])
		; Debug.Trace("got " + r + ", expected (" + x[i] + "," + y[i] + "," + z[i] + ")")
		if (r[0] != x[i] || r[1] != y[i] || r[2] != z[i])
			Debug.Trace("\tFAILED TestFind3D() reverse search: got " + r + ", expected (" + x[i] + "," + y[i] + "," + z[i] + ")")
			DeleteArr(arr)
			return false
		endif
		
		; 1,0,0-1 -> 1,-1,31 -> 0,31,31
		r[2] -= 1
		if (r[2] < 0)
			r[2] = arrSize-1
			r[1] -= 1
		endif
		if (r[1] < 0)
			r[1] = arrSize-1
			r[0] -= 1
		endif
		
		i -= 1
	endwhile
	
	Debug.Trace("\tPASSED TestFind3D()")
	DeleteArr(arr)
	return true
EndFunction

; unfortunately non-functional
bool Function TestCallGlobalFunctionWithArray() global
	int i = 0
	int[] arr = new int[10]
	while (i < 10)
		arr[i] = i
		i += 1
	endWhile
	;Debug.Trace(arr)
	var[] asVarray = arr as Var[]
	;Debug.Trace(asVarray)
	
	var[] args = new var[1]
	args[0] = VarArrayToVar(asVarray)
	;Debug.Trace(args)
	
	; at this point we've got an int[], cast to a Var[], stuffed into a Var, and then inserted as an element into another Var[]
	; sadly, the script engine doesn't seem to be clever enough to try to unpack the int[]->var back to an int[]
	int[] arr2 = VarToVarArray(Utility.CallGlobalFunction("AdvArrayLibOff", "IntArrayReturner", args)) as int[]
	if (arr[5] == arr2[5])
		Debug.Trace("\tPASSED TestCallGlobalFunctionWithArray() 		" + arr + " -> " + arr2)
		return true
	else
		Debug.Trace("\tFAILED TestCallGlobalFunctionWithArray() 		" + arr + " -> " + arr2)
		return false
	endif
EndFunction

bool Function TestVarToVarArray() global
	var[] args = new var[2]
	args[0] = 1024.0
	args[1] = 256.0
	var v = Game.GetPlayer().CallFunction("GetSafePosition", args)
	var[] vA = VarToVarArray(v)
	float[] f = vA as float[]
	if (f != None)
		Debug.Trace("\tPASSED TestVarToVarArray()		" + v + "->" + vA + " -> " + f)
		return true
	else
		Debug.Trace("\tFAILED TestVarToVarArray()		" + v + "->" + vA + " -> " + f)
		return false
	endif
EndFunction

; does not work (VarArrayToVar non-functional)
bool Function TestVarToVarArrayToVar() global
	var[] varr = new var[3]
	varr[0] = 1
	varr[1] = "a"
	varr[2] = 1.0
	
	var asVar = VarArrayToVar(varr)
	var asVar2 = VarReturner(asVar)
	var[] varr2 = VarToVarArray(asVar)
	if (varr[0] as int == varr2[0] as int && varr[1] as string == varr2[1] as string && varr[2] as float == varr2[2] as float)
		Debug.Trace("\tPASSED TestVarToVarArrayToVar()		" + varr + "->" + varr2)
		return true
	else
		Debug.Trace("\tFAILED TestVarToVarArrayToVar()		" + varr + "->" + varr2)
		return false
	endif
EndFunction

bool Function TestCallFunction() global
	var[] args = new var[2]
	args[0] = 1024.0
	args[1] = 256.0
	float[] f = AdvArrayLib.CallFunction(Game.GetPlayer(), "GetSafePosition", args) as float[]
	if (f != None)
		Debug.Trace("\tPASSED AdvArrayLib.CallFunction(Game.GetPlayer, \"GetSafePosition\", args) = " + f)
		return true
	else
		Debug.Trace("\tFAILED AdvArrayLib.CallFunction(Game.GetPlayer, \"GetSafePosition\", args) = " + f)
		return false
	endif
EndFunction

bool Function AutoTestArr(int size, Var init, bool spotCheck) global
	Debug.Trace("\tTesting array size " + size + ", initial value " + init + ", spot check only: " + spotCheck)
	BigArr arr = GetBigArr(size, init)
	
	bool passed
	int i = 0
	if (spotCheck)
		int[] indicies = new int[0]
		int inc = size / 126
		while (i < size)
			indicies.Add(i)
			i += inc
		endwhile
		indicies.Add(size-1)
		; Debug.Trace("indicies:" + indicies)
		
		inc = indicies.Length
		
		; vars cannot be directly compared, so we have to cast it to a string and check that
		if ((init as string) != None as string)
			i = 0
			while (i < indicies.Length)
				int j = indicies[i]
				i += 1
				
				Var val = Get(arr, j)
				if (val as string != init as string)
					Debug.Trace("\tFAILED Test size " + size + " at index " + j + " (testing initial fill value, got " + val + ", expected " + init + ")")
					DeleteArr(arr)
					return false
				endif
			endwhile
		endif
		
		i = 0
		while (i < inc)
			int j = indicies[i]
			i += 1
			Set(arr, j, j)
		endwhile
		
		i = 0
		while (i < inc)
			int j = indicies[i]
			i += 1
			
			Var val = Get(arr, j)
			passed = val as int == j
			if (!passed)
				Debug.Trace("\tFAILED Test size " + size + " at index " + j + " (testing read/write, got " + val + ", expected " + j + ")")
				DeleteArr(arr)
				return false
			endif
		endwhile
	else
		if (init as string != None as string)
			while (i < size)
				var val = Get(arr, i)
				if (val as string != init as string)
					; Debug.Trace("val, init=" + val + "," + init + "    val == init=" + (val == init) + "    val == None=" + (val as string == None as string))
					Debug.Trace("\tFAILED Test size " + size + " at index " + i + " (testing initial fill value, got " + val + ", expected " + init + ")")
					DeleteArr(arr)
					return false
				endif
				i += 1
			endwhile
		endif
		
		i = 0
		while (i < size)
			Set(arr, i, i)
			i += 1
		endwhile
		
		i = 0
		while (i < size)
			int val = Get(arr, i) as int
			passed = val == i
			if (!passed)
				Debug.Trace("\tFAILED Test size " + size + " at index " + i + " (testing read/write, got " + val + ", expected " + i + ")")
				DeleteArr(arr)
				return false
			endif
			
			i += 1
		endwhile
	endif
	
	Debug.Trace("\tPASSED Test size " + size)
	DeleteArr(arr)
	return true
EndFunction

int[] Function IntArrayReturner(int[] arr) global
	return arr
EndFunction

var Function VarReturner(Var v) global
	return v
EndFunction
