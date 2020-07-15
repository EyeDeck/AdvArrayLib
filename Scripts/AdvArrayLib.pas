.info
  .source "E:\\Bethesda Softworks\\Mod Organizer FO4\\mods\\AdvPapyrusUtil\\Scripts\\Source\\User\\AdvArrayLib.psc"
  .modifyTime 1594829356
  .compileTime 1594829466
  .user "clovis"
  .computer "CLOVIS_RIG"
.endInfo
.userFlagsRef
.endUserFlagsRef
.objectTable
  .object AdvArrayLib 
    .userFlags 0
    .docString "A utility library that allows users of the reference Papyrus compiler\n to do things that the compiler would normally forbid.\n\n Will only compile with Caprica, so using the pre-compiled .pex is recommended.\n\n           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE\n                   Version 2, December 2004\n \nCopyright (C) 2004 Sam Hocevar <sam@hocevar.net>\n\nEveryone is permitted to copy and distribute verbatim or modified\ncopies of this license document, and changing it is allowed as long\nas the name is changed.\n \n           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE\n  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION\n\n 0. You just DO WHAT THE FUCK YOU WANT TO."
    .autoState 
    .structTable
      .struct v
        .variable e Var[]
          .userFlags 0
          .initialValue None
          .docString ""
        .endVariable
        .variable a advarraylib#v[]
          .userFlags 0
          .initialValue None
          .docString ""
        .endVariable
      .endStruct
      .struct BigArr
        .variable size Int
          .userFlags 0
          .initialValue None
          .docString ""
        .endVariable
        .variable levels Int
          .userFlags 0
          .initialValue None
          .docString ""
        .endVariable
        .variable a advarraylib#v
          .userFlags 0
          .initialValue None
          .docString ""
        .endVariable
      .endStruct
    .endStructTable
    .variableTable
    .endVariableTable
    .propertyTable
    .endPropertyTable
    .propertyGroupTable
    .endPropertyGroupTable
    .stateTable
      .state
        .function GetBigArr static
          .userFlags 0
          .docString "Creates a pseudo-Var[] with a max size of 2^21, with minimal overhead.\n\nExample:\nAdvArrayLib:BigArr arr = AdvArrayLib.GetBigArr(80000)\n\nAdvArrayLib.Set(arr, 10000, 1.0)\nAdvArrayLib.Set(arr, 20000, 6)\nAdvArrayLib.Set(arr, 70000, Game.GetPlayer())\n\nfloat a = AdvArrayLib.Get(10000) as float\t; 1.0\nint b = AdvArrayLib.Get(20000) as int\t\t; 6\nActor c = AdvArrayLib.Get(70000) as Actor\t; PlayerRef"
          .return advarraylib#bigarr
          .paramTable
            .param size Int
            .param init Var
          .endParamTable
          .localTable
            .local levels Int
            .local base advarraylib#v
            .local ::temp0 advarraylib#v
            .local a advarraylib#v[]
            .local e Var[]
            .local ::temp1 Bool
            .local x Int
            .local ::temp2 Int
            .local y Int
            .local z Int
            .local ::temp3 advarraylib#v[]
            .local xRem Int
            .local yFull Int
            .local zLast Int
            .local exX advarraylib#v
            .local xFA advarraylib#v[]
            .local ::mangled_exX_0 advarraylib#v
            .local ::mangled_x_0 Int
            .local rem Int
            .local extra advarraylib#v
            .local ::temp4 Var[]
            .local ::temp5 String
            .local i Int
            .local ::temp6 Int
            .local ::mangled_i_0 Int
            .local arr advarraylib#bigarr
            .local ::temp7 advarraylib#bigarr
          .endLocalTable
          .code
            STRUCTCREATE ::temp0 ;@line 51
            ASSIGN base ::temp0 ;@line 51
            COMPAREGT ::temp1 size 16384 ;@line 55
            JUMPF ::temp1 label0 ;@line 55
            ASSIGN levels 3 ;@line 56
            IDIVIDE ::temp2 size 16384 ;@line 60
            ASSIGN x ::temp2 ;@line 60
            ASSIGN y 128 ;@line 61
            ASSIGN z 128 ;@line 62
            CALLSTATIC advarraylib Getv3D ::temp3 x y z init ;@line 63
            ASSIGN a ::temp3 ;@line 63
            IMOD ::temp2 size 16384 ;@line 66
            ASSIGN xRem ::temp2 ;@line 66
            CAST ::temp1 xRem ;@line 67
            JUMPF ::temp1 label1 ;@line 67
            IDIVIDE ::temp2 xRem 128 ;@line 69
            ASSIGN yFull ::temp2 ;@line 69
            IMOD ::temp2 xRem 128 ;@line 70
            ASSIGN zLast ::temp2 ;@line 70
            CAST ::temp1 yFull ;@line 73
            JUMPF ::temp1 label2 ;@line 73
            STRUCTCREATE ::temp0 ;@line 75
            ASSIGN exX ::temp0 ;@line 75
            CALLSTATIC advarraylib Getv2D ::temp3 yFull 128 init ;@line 76
            STRUCTSET exX a ::temp3 ;@line 76
            ARRAYADDELEMENTS a exX 1 ;@line 77
            JUMP label2 ;@line 73
            label2:
            CAST ::temp1 zLast ;@line 85
            JUMPF ::temp1 label3 ;@line 85
            ARRAYLENGTH ::temp2 a ;@line 87
            IADD ::temp2 ::temp2 -1 ;@line 87
            ARRAYGETELEMENT ::temp0 a ::temp2 ;@line 87
            STRUCTGET ::temp3 ::temp0 a ;@line 87
            ASSIGN xFA ::temp3 ;@line 87
            ARRAYLENGTH ::temp2 xFA ;@line 88
            COMPAREEQ ::temp1 ::temp2 128 ;@line 88
            JUMPF ::temp1 label4 ;@line 88
            STRUCTCREATE ::temp0 ;@line 90
            ASSIGN ::mangled_exX_0 ::temp0 ;@line 90
            ARRAYCREATE ::temp3 0 ;@line 91
            STRUCTSET ::mangled_exX_0 a ::temp3 ;@line 91
            ARRAYADDELEMENTS a ::mangled_exX_0 1 ;@line 92
            STRUCTGET ::temp3 ::mangled_exX_0 a ;@line 93
            ASSIGN xFA ::temp3 ;@line 93
            JUMP label4 ;@line 88
            label4:
            CALLSTATIC advarraylib Getv2D ::temp3 1 zLast init ;@line 95
            ARRAYGETELEMENT ::temp0 ::temp3 0 ;@line 95
            ARRAYADDELEMENTS xFA ::temp0 1 ;@line 95
            JUMP label3 ;@line 85
            label3:
            JUMP label1 ;@line 67
            label1:
            STRUCTSET base a a ;@line 99
            JUMP label5 ;@line 55
            label0:
            COMPAREGT ::temp1 size 128 ;@line 100
            JUMPF ::temp1 label6 ;@line 55
            ASSIGN levels 2 ;@line 102
            IDIVIDE ::temp2 size 128 ;@line 104
            ASSIGN ::mangled_x_0 ::temp2 ;@line 104
            CALLSTATIC advarraylib Getv2D ::temp3 ::mangled_x_0 128 init ;@line 105
            ASSIGN a ::temp3 ;@line 105
            IMOD ::temp2 size 128 ;@line 107
            ASSIGN rem ::temp2 ;@line 107
            CAST ::temp1 rem ;@line 108
            JUMPF ::temp1 label7 ;@line 108
            STRUCTCREATE ::temp0 ;@line 109
            ASSIGN extra ::temp0 ;@line 109
            ARRAYCREATE ::temp4 rem ;@line 110
            ASSIGN e ::temp4 ;@line 110
            STRUCTSET extra e e ;@line 111
            ARRAYADDELEMENTS a extra 1 ;@line 112
            CAST ::temp5 init ;@line 114
            COMPAREEQ ::temp1 ::temp5 "None" ;@line 114
            NOT ::temp1 ::temp1 ;@line 114
            JUMPF ::temp1 label8 ;@line 114
            ASSIGN i 0 ;@line 115
            ISUBTRACT ::temp6 rem 1 ;@line 115
            ASSIGN ::temp2 ::temp6 ;@line 115
            label10:
            COMPARELTE ::temp1 i ::temp2 ;@line 115
            JUMPF ::temp1 label9 ;@line 115
            ARRAYSETELEMENT e i init ;@line 116
            IADD i i 1 ;@line 115
            JUMP label10 ;@line 115
            label9:
            JUMP label8 ;@line 114
            label8:
            JUMP label7 ;@line 108
            label7:
            STRUCTSET base a a ;@line 121
            JUMP label5 ;@line 55
            label6:
            ASSIGN levels 1 ;@line 124
            ARRAYCREATE ::temp4 size ;@line 126
            ASSIGN e ::temp4 ;@line 126
            STRUCTSET base e e ;@line 127
            CAST ::temp5 init ;@line 129
            COMPAREEQ ::temp1 ::temp5 "None" ;@line 129
            NOT ::temp1 ::temp1 ;@line 129
            JUMPF ::temp1 label5 ;@line 129
            ASSIGN ::mangled_i_0 0 ;@line 130
            ISUBTRACT ::temp6 size 1 ;@line 130
            ASSIGN ::temp2 ::temp6 ;@line 130
            label12:
            COMPARELTE ::temp1 ::mangled_i_0 ::temp2 ;@line 130
            JUMPF ::temp1 label11 ;@line 130
            ARRAYSETELEMENT e ::mangled_i_0 init ;@line 131
            IADD ::mangled_i_0 ::mangled_i_0 1 ;@line 130
            JUMP label12 ;@line 130
            label11:
            JUMP label5 ;@line 129
            label5:
            STRUCTCREATE ::temp7 ;@line 136
            ASSIGN arr ::temp7 ;@line 136
            STRUCTSET arr size size ;@line 137
            STRUCTSET arr levels levels ;@line 138
            STRUCTSET arr a base ;@line 139
            RETURN arr ;@line 142
          .endCode
        .endFunction
        .function DeleteArr static
          .userFlags 0
          .docString "Dismantles the array's internal data structures, which may or may not help the\nengine's garbage collector clean up dereferenced arrays faster--may be placebo"
          .return None
          .paramTable
            .param arr advarraylib#bigarr
          .endParamTable
          .localTable
            .local params Var[]
            .local ::temp0 Var[]
            .local ::temp1 Var
            .local ::nonevar None
          .endLocalTable
          .code
            ARRAYCREATE ::temp0 1 ;@line 150
            ASSIGN params ::temp0 ;@line 150
            CAST ::temp1 arr ;@line 151
            ARRAYSETELEMENT params 0 ::temp1 ;@line 151
            CALLSTATIC utility CallGlobalFunctionNoWait ::nonevar "AdvArrayLib" "DeleteArrPRIVATE" params ;@line 152
          .endCode
        .endFunction
        .function DeleteArrPRIVATE static
          .userFlags 0
          .docString ""
          .return None
          .paramTable
            .param arr advarraylib#bigarr
          .endParamTable
          .localTable
            .local i Int
            .local ::temp0 Int
            .local x Int
            .local y Int
            .local z Int
            .local ::temp1 Bool
            .local baseV advarraylib#v
            .local ::temp2 advarraylib#v
            .local ::temp3 advarraylib#v[]
            .local ::temp4 Int
            .local xV advarraylib#v
            .local ::temp5 Int
            .local ::temp6 Var[]
            .local ::mangled_baseV_0 advarraylib#v
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr levels ;@line 156
            ASSIGN i ::temp0 ;@line 156
            COMPAREEQ ::temp1 i 3 ;@line 161
            JUMPF ::temp1 label0 ;@line 161
            STRUCTGET ::temp2 arr a ;@line 163
            ASSIGN baseV ::temp2 ;@line 163
            ASSIGN x 0 ;@line 164
            STRUCTGET ::temp3 baseV a ;@line 164
            ARRAYLENGTH ::temp4 ::temp3 ;@line 164
            IADD ::temp4 ::temp4 -1 ;@line 164
            ASSIGN ::temp0 ::temp4 ;@line 164
            label4:
            COMPARELTE ::temp1 x ::temp0 ;@line 164
            JUMPF ::temp1 label1 ;@line 164
            STRUCTGET ::temp3 baseV a ;@line 165
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 165
            ASSIGN xV ::temp2 ;@line 165
            ASSIGN y 0 ;@line 166
            STRUCTGET ::temp3 xV a ;@line 166
            ARRAYLENGTH ::temp5 ::temp3 ;@line 166
            IADD ::temp5 ::temp5 -1 ;@line 166
            ASSIGN ::temp4 ::temp5 ;@line 166
            label3:
            COMPARELTE ::temp1 y ::temp4 ;@line 166
            JUMPF ::temp1 label2 ;@line 166
            STRUCTGET ::temp3 xV a ;@line 171
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 171
            STRUCTGET ::temp6 ::temp2 e ;@line 171
            ARRAYCLEARELEMENTS ::temp6 ;@line 171
            CAST ::temp6 None ;@line 172
            STRUCTGET ::temp3 xV a ;@line 172
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 172
            STRUCTSET ::temp2 e ::temp6 ;@line 172
            CAST ::temp2 None ;@line 173
            STRUCTGET ::temp3 xV a ;@line 173
            ARRAYSETELEMENT ::temp3 y ::temp2 ;@line 173
            IADD ::temp5 y 1 ;@line 166
            ASSIGN y ::temp5 ;@line 166
            JUMP label3 ;@line 166
            label2:
            CAST ::temp3 None ;@line 175
            STRUCTSET xV a ::temp3 ;@line 175
            IADD ::temp4 x 1 ;@line 164
            ASSIGN x ::temp4 ;@line 164
            JUMP label4 ;@line 164
            label1:
            CAST ::temp3 None ;@line 177
            STRUCTSET baseV a ::temp3 ;@line 177
            JUMP label5 ;@line 161
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 178
            JUMPF ::temp1 label6 ;@line 161
            STRUCTGET ::temp2 arr a ;@line 180
            ASSIGN ::mangled_baseV_0 ::temp2 ;@line 180
            ASSIGN x 0 ;@line 181
            STRUCTGET ::temp3 ::mangled_baseV_0 a ;@line 181
            ARRAYLENGTH ::temp4 ::temp3 ;@line 181
            IADD ::temp4 ::temp4 -1 ;@line 181
            ASSIGN ::temp0 ::temp4 ;@line 181
            label8:
            COMPARELTE ::temp1 x ::temp0 ;@line 181
            JUMPF ::temp1 label7 ;@line 181
            CAST ::temp6 None ;@line 182
            STRUCTGET ::temp3 ::mangled_baseV_0 a ;@line 182
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 182
            STRUCTSET ::temp2 e ::temp6 ;@line 182
            CAST ::temp2 None ;@line 183
            STRUCTGET ::temp3 ::mangled_baseV_0 a ;@line 183
            ARRAYSETELEMENT ::temp3 x ::temp2 ;@line 183
            IADD ::temp4 x 1 ;@line 181
            ASSIGN x ::temp4 ;@line 181
            JUMP label8 ;@line 181
            label7:
            CAST ::temp3 None ;@line 185
            STRUCTSET ::mangled_baseV_0 a ::temp3 ;@line 185
            JUMP label5 ;@line 161
            label6:
            CAST ::temp6 None ;@line 187
            STRUCTGET ::temp2 arr a ;@line 187
            STRUCTSET ::temp2 e ::temp6 ;@line 187
            label5:
            CAST ::temp2 None ;@line 190
            STRUCTSET arr a ::temp2 ;@line 190
          .endCode
        .endFunction
        .function Get static
          .userFlags 0
          .docString ""
          .return Var
          .paramTable
            .param arr advarraylib#bigarr
            .param index Int
          .endParamTable
          .localTable
            .local i Int
            .local ::temp0 Int
            .local x Int
            .local y Int
            .local z Int
            .local ::temp1 Bool
            .local ::temp2 advarraylib#v
            .local ::temp3 advarraylib#v[]
            .local ::temp4 Var[]
            .local ::temp5 Var
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr levels ;@line 194
            ASSIGN i ::temp0 ;@line 194
            COMPAREEQ ::temp1 i 3 ;@line 198
            JUMPF ::temp1 label0 ;@line 198
            IDIVIDE ::temp0 index 16384 ;@line 199
            ASSIGN x ::temp0 ;@line 199
            IDIVIDE ::temp0 index 128 ;@line 200
            IMOD ::temp0 ::temp0 128 ;@line 200
            ASSIGN y ::temp0 ;@line 200
            IMOD ::temp0 index 128 ;@line 201
            ASSIGN z ::temp0 ;@line 201
            STRUCTGET ::temp2 arr a ;@line 202
            STRUCTGET ::temp3 ::temp2 a ;@line 202
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 202
            STRUCTGET ::temp3 ::temp2 a ;@line 202
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 202
            STRUCTGET ::temp4 ::temp2 e ;@line 202
            ARRAYGETELEMENT ::temp5 ::temp4 z ;@line 202
            RETURN ::temp5 ;@line 202
            JUMP label1 ;@line 198
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 203
            JUMPF ::temp1 label2 ;@line 198
            IDIVIDE ::temp0 index 128 ;@line 204
            ASSIGN x ::temp0 ;@line 204
            IMOD ::temp0 index 128 ;@line 205
            ASSIGN y ::temp0 ;@line 205
            STRUCTGET ::temp2 arr a ;@line 206
            STRUCTGET ::temp3 ::temp2 a ;@line 206
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 206
            STRUCTGET ::temp4 ::temp2 e ;@line 206
            ARRAYGETELEMENT ::temp5 ::temp4 y ;@line 206
            RETURN ::temp5 ;@line 206
            JUMP label1 ;@line 198
            label2:
            COMPAREEQ ::temp1 i 1 ;@line 207
            JUMPF ::temp1 label3 ;@line 198
            STRUCTGET ::temp2 arr a ;@line 208
            STRUCTGET ::temp4 ::temp2 e ;@line 208
            ARRAYGETELEMENT ::temp5 ::temp4 index ;@line 208
            RETURN ::temp5 ;@line 208
            JUMP label1 ;@line 198
            label3:
            CAST ::temp5 None ;@line 210
            RETURN ::temp5 ;@line 210
            label1:
          .endCode
        .endFunction
        .function Find static
          .userFlags 0
          .docString "Like Array.RFind, looks backwards for the first occurrence of 'element', in array 'arr', starting at 'index'\n\nIMPORTANT: For technical reasons, this must cast everything to a string before searching.\nThis means that if you pass in 1 (int), and have \"1\" (string) in the array, the function\nmay find the string \"1\" first."
          .return Int
          .paramTable
            .param arr advarraylib#bigarr
            .param element Var
            .param index Int
            .param reverse Bool
          .endParamTable
          .localTable
            .local i Int
            .local ::temp0 Int
            .local x Int
            .local y Int
            .local z Int
            .local ::temp1 Bool
            .local r Int[]
            .local ::temp2 Int[]
            .local ::temp3 Int
            .local ::mangled_r_0 Int[]
            .local ::temp4 advarraylib#v
            .local ::temp5 Var[]
            .local ::temp6 String[]
            .local ::temp7 String
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr levels ;@line 220
            ASSIGN i ::temp0 ;@line 220
            COMPAREEQ ::temp1 i 3 ;@line 224
            JUMPF ::temp1 label0 ;@line 224
            IDIVIDE ::temp0 index 16384 ;@line 225
            ASSIGN x ::temp0 ;@line 225
            IDIVIDE ::temp0 index 128 ;@line 226
            IMOD ::temp0 ::temp0 128 ;@line 226
            ASSIGN y ::temp0 ;@line 226
            IMOD ::temp0 index 128 ;@line 227
            ASSIGN z ::temp0 ;@line 227
            CALLSTATIC advarraylib Find3D ::temp2 arr element x y z ;@line 228
            ASSIGN r ::temp2 ;@line 228
            CAST ::temp2 None ;@line 229
            COMPAREEQ ::temp1 r ::temp2 ;@line 229
            JUMPF ::temp1 label1 ;@line 229
            RETURN -1 ;@line 230
            JUMP label2 ;@line 229
            label1:
            ARRAYGETELEMENT ::temp0 r 0 ;@line 232
            IMULTIPLY ::temp0 ::temp0 16384 ;@line 232
            ARRAYGETELEMENT ::temp3 r 1 ;@line 232
            IMULTIPLY ::temp3 ::temp3 128 ;@line 232
            IADD ::temp3 ::temp0 ::temp3 ;@line 232
            ARRAYGETELEMENT ::temp0 r 2 ;@line 232
            IADD ::temp0 ::temp3 ::temp0 ;@line 232
            RETURN ::temp0 ;@line 232
            label2:
            JUMP label3 ;@line 224
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 234
            JUMPF ::temp1 label4 ;@line 224
            IDIVIDE ::temp0 index 128 ;@line 235
            ASSIGN x ::temp0 ;@line 235
            IMOD ::temp0 index 128 ;@line 236
            ASSIGN y ::temp0 ;@line 236
            CALLSTATIC advarraylib Find2D ::temp2 arr element x y ;@line 237
            ASSIGN ::mangled_r_0 ::temp2 ;@line 237
            CAST ::temp2 None ;@line 238
            COMPAREEQ ::temp1 ::mangled_r_0 ::temp2 ;@line 238
            JUMPF ::temp1 label5 ;@line 238
            RETURN -1 ;@line 239
            JUMP label6 ;@line 238
            label5:
            ARRAYGETELEMENT ::temp0 ::mangled_r_0 0 ;@line 241
            IMULTIPLY ::temp0 ::temp0 128 ;@line 241
            ARRAYGETELEMENT ::temp3 ::mangled_r_0 1 ;@line 241
            IADD ::temp3 ::temp0 ::temp3 ;@line 241
            RETURN ::temp3 ;@line 241
            label6:
            JUMP label3 ;@line 224
            label4:
            COMPAREEQ ::temp1 i 1 ;@line 243
            JUMPF ::temp1 label7 ;@line 224
            STRUCTGET ::temp4 arr a ;@line 244
            STRUCTGET ::temp5 ::temp4 e ;@line 244
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 244
            CAST ::temp7 element ;@line 244
            ARRAYFINDELEMENT ::temp6 ::temp3 ::temp7 index ;@line 244
            RETURN ::temp3 ;@line 244
            JUMP label3 ;@line 224
            label7:
            RETURN -1 ;@line 246
            label3:
          .endCode
        .endFunction
        .function RFind static
          .userFlags 0
          .docString "Like Array.RFind, looks backwards for the first occurrence of 'element', in array 'arr', starting at 'index'\n\nIMPORTANT: For technical reasons, this must cast everything to a string before searching.\nThis means that if you pass in 1 (int), and have \"1\" (string) in the array, the function\nmay find the string \"1\" first."
          .return Int
          .paramTable
            .param arr advarraylib#bigarr
            .param element Var
            .param index Int
          .endParamTable
          .localTable
            .local i Int
            .local ::temp0 Int
            .local x Int
            .local y Int
            .local z Int
            .local ::temp1 Bool
            .local r Int[]
            .local ::temp2 Int[]
            .local ::temp3 Int
            .local ::mangled_r_0 Int[]
            .local ::temp4 advarraylib#v
            .local ::temp5 Var[]
            .local ::temp6 String[]
            .local ::temp7 String
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr levels ;@line 256
            ASSIGN i ::temp0 ;@line 256
            COMPAREEQ ::temp1 i 3 ;@line 260
            JUMPF ::temp1 label0 ;@line 260
            IDIVIDE ::temp0 index 16384 ;@line 261
            ASSIGN x ::temp0 ;@line 261
            IDIVIDE ::temp0 index 128 ;@line 262
            IMOD ::temp0 ::temp0 128 ;@line 262
            ASSIGN y ::temp0 ;@line 262
            IMOD ::temp0 index 128 ;@line 263
            ASSIGN z ::temp0 ;@line 263
            CALLSTATIC advarraylib RFind3D ::temp2 arr element x y z ;@line 265
            ASSIGN r ::temp2 ;@line 265
            CAST ::temp2 None ;@line 267
            COMPAREEQ ::temp1 r ::temp2 ;@line 267
            JUMPF ::temp1 label1 ;@line 267
            RETURN -1 ;@line 268
            JUMP label2 ;@line 267
            label1:
            ARRAYGETELEMENT ::temp0 r 0 ;@line 270
            IMULTIPLY ::temp0 ::temp0 16384 ;@line 270
            ARRAYGETELEMENT ::temp3 r 1 ;@line 270
            IMULTIPLY ::temp3 ::temp3 128 ;@line 270
            IADD ::temp3 ::temp0 ::temp3 ;@line 270
            ARRAYGETELEMENT ::temp0 r 2 ;@line 270
            IADD ::temp0 ::temp3 ::temp0 ;@line 270
            RETURN ::temp0 ;@line 270
            label2:
            JUMP label3 ;@line 260
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 272
            JUMPF ::temp1 label4 ;@line 260
            IDIVIDE ::temp0 index 128 ;@line 273
            ASSIGN x ::temp0 ;@line 273
            IMOD ::temp0 index 128 ;@line 274
            ASSIGN y ::temp0 ;@line 274
            CALLSTATIC advarraylib RFind2D ::temp2 arr element x y ;@line 275
            ASSIGN ::mangled_r_0 ::temp2 ;@line 275
            CAST ::temp2 None ;@line 276
            COMPAREEQ ::temp1 ::mangled_r_0 ::temp2 ;@line 276
            JUMPF ::temp1 label5 ;@line 276
            RETURN -1 ;@line 277
            JUMP label6 ;@line 276
            label5:
            ARRAYGETELEMENT ::temp0 ::mangled_r_0 0 ;@line 279
            IMULTIPLY ::temp0 ::temp0 128 ;@line 279
            ARRAYGETELEMENT ::temp3 ::mangled_r_0 1 ;@line 279
            IADD ::temp3 ::temp0 ::temp3 ;@line 279
            RETURN ::temp3 ;@line 279
            label6:
            JUMP label3 ;@line 260
            label4:
            COMPAREEQ ::temp1 i 1 ;@line 281
            JUMPF ::temp1 label7 ;@line 260
            STRUCTGET ::temp4 arr a ;@line 283
            STRUCTGET ::temp5 ::temp4 e ;@line 283
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 283
            CAST ::temp7 element ;@line 283
            ARRAYRFINDELEMENT ::temp6 ::temp3 ::temp7 index ;@line 283
            RETURN ::temp3 ;@line 283
            JUMP label3 ;@line 260
            label7:
            RETURN -1 ;@line 285
            label3:
          .endCode
        .endFunction
        .function Set static
          .userFlags 0
          .docString ""
          .return None
          .paramTable
            .param arr advarraylib#bigarr
            .param index Int
            .param val Var
          .endParamTable
          .localTable
            .local i Int
            .local ::temp0 Int
            .local x Int
            .local y Int
            .local z Int
            .local ::temp1 Bool
            .local ::temp2 advarraylib#v
            .local ::temp3 advarraylib#v[]
            .local ::temp4 Var[]
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr levels ;@line 290
            ASSIGN i ::temp0 ;@line 290
            COMPAREEQ ::temp1 i 3 ;@line 294
            JUMPF ::temp1 label0 ;@line 294
            IDIVIDE ::temp0 index 16384 ;@line 295
            ASSIGN x ::temp0 ;@line 295
            IDIVIDE ::temp0 index 128 ;@line 296
            IMOD ::temp0 ::temp0 128 ;@line 296
            ASSIGN y ::temp0 ;@line 296
            IMOD ::temp0 index 128 ;@line 297
            ASSIGN z ::temp0 ;@line 297
            STRUCTGET ::temp2 arr a ;@line 298
            STRUCTGET ::temp3 ::temp2 a ;@line 298
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 298
            STRUCTGET ::temp3 ::temp2 a ;@line 298
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 298
            STRUCTGET ::temp4 ::temp2 e ;@line 298
            ARRAYSETELEMENT ::temp4 z val ;@line 298
            JUMP label1 ;@line 294
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 299
            JUMPF ::temp1 label2 ;@line 294
            IDIVIDE ::temp0 index 128 ;@line 300
            ASSIGN x ::temp0 ;@line 300
            IMOD ::temp0 index 128 ;@line 301
            ASSIGN y ::temp0 ;@line 301
            STRUCTGET ::temp2 arr a ;@line 302
            STRUCTGET ::temp3 ::temp2 a ;@line 302
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 302
            STRUCTGET ::temp4 ::temp2 e ;@line 302
            ARRAYSETELEMENT ::temp4 y val ;@line 302
            JUMP label1 ;@line 294
            label2:
            STRUCTGET ::temp2 arr a ;@line 304
            STRUCTGET ::temp4 ::temp2 e ;@line 304
            ARRAYSETELEMENT ::temp4 index val ;@line 304
            label1:
          .endCode
        .endFunction
        .function GetArr2D static
          .userFlags 0
          .docString "Creates a \"rectangular\" 2d array of size (x,y)\nNote that x and y must be <= 128"
          .return advarraylib#bigarr
          .paramTable
            .param x Int
            .param y Int
            .param init Var
          .endParamTable
          .localTable
            .local arr advarraylib#bigarr
            .local ::temp0 advarraylib#bigarr
            .local v advarraylib#v
            .local ::temp1 advarraylib#v
            .local ::temp2 advarraylib#v[]
            .local ::temp3 Int
          .endLocalTable
          .code
            STRUCTCREATE ::temp0 ;@line 313
            ASSIGN arr ::temp0 ;@line 313
            STRUCTCREATE ::temp1 ;@line 314
            ASSIGN v ::temp1 ;@line 314
            CALLSTATIC advarraylib Getv2D ::temp2 x y init ;@line 315
            STRUCTSET v a ::temp2 ;@line 315
            STRUCTSET arr a v ;@line 316
            IMULTIPLY ::temp3 x y ;@line 317
            STRUCTSET arr size ::temp3 ;@line 317
            STRUCTSET arr levels 2 ;@line 318
            RETURN arr ;@line 319
          .endCode
        .endFunction
        .function Getv2D static
          .userFlags 0
          .docString ""
          .return advarraylib#v[]
          .paramTable
            .param x Int
            .param y Int
            .param init Var
          .endParamTable
          .localTable
            .local vx advarraylib#v[]
            .local ::temp0 advarraylib#v[]
            .local ::temp1 String
            .local ::temp2 Bool
            .local i Int
            .local ::temp3 Int
            .local ::temp4 Int
            .local ::temp5 advarraylib#v
            .local vy Var[]
            .local ::temp6 Var[]
            .local ::mangled_i_0 Int
            .local ::mangled_vy_0 Var[]
            .local j Int
            .local ::temp7 Int
          .endLocalTable
          .code
            ARRAYCREATE ::temp0 x ;@line 323
            ASSIGN vx ::temp0 ;@line 323
            CAST ::temp1 init ;@line 325
            COMPAREEQ ::temp2 ::temp1 "None" ;@line 325
            JUMPF ::temp2 label0 ;@line 325
            ASSIGN i 0 ;@line 326
            ISUBTRACT ::temp4 x 1 ;@line 326
            ASSIGN ::temp3 ::temp4 ;@line 326
            label2:
            COMPARELTE ::temp2 i ::temp3 ;@line 326
            JUMPF ::temp2 label1 ;@line 326
            STRUCTCREATE ::temp5 ;@line 327
            ARRAYSETELEMENT vx i ::temp5 ;@line 327
            ARRAYCREATE ::temp6 y ;@line 328
            ASSIGN vy ::temp6 ;@line 328
            ARRAYGETELEMENT ::temp5 vx i ;@line 329
            STRUCTSET ::temp5 e vy ;@line 329
            IADD i i 1 ;@line 326
            JUMP label2 ;@line 326
            label1:
            JUMP label3 ;@line 325
            label0:
            ASSIGN ::mangled_i_0 0 ;@line 332
            ISUBTRACT ::temp4 x 1 ;@line 332
            ASSIGN ::temp3 ::temp4 ;@line 332
            label6:
            COMPARELTE ::temp2 ::mangled_i_0 ::temp3 ;@line 332
            JUMPF ::temp2 label3 ;@line 332
            STRUCTCREATE ::temp5 ;@line 333
            ARRAYSETELEMENT vx ::mangled_i_0 ::temp5 ;@line 333
            ARRAYCREATE ::temp6 y ;@line 334
            ASSIGN ::mangled_vy_0 ::temp6 ;@line 334
            ARRAYGETELEMENT ::temp5 vx ::mangled_i_0 ;@line 335
            STRUCTSET ::temp5 e ::mangled_vy_0 ;@line 335
            ASSIGN j 0 ;@line 336
            ISUBTRACT ::temp7 y 1 ;@line 336
            ASSIGN ::temp4 ::temp7 ;@line 336
            label5:
            COMPARELTE ::temp2 j ::temp4 ;@line 336
            JUMPF ::temp2 label4 ;@line 336
            ARRAYSETELEMENT ::mangled_vy_0 j init ;@line 337
            IADD j j 1 ;@line 336
            JUMP label5 ;@line 336
            label4:
            IADD ::mangled_i_0 ::mangled_i_0 1 ;@line 332
            JUMP label6 ;@line 332
            label3:
            RETURN vx ;@line 342
          .endCode
        .endFunction
        .function Get2D static
          .userFlags 0
          .docString ""
          .return Var
          .paramTable
            .param arr advarraylib#bigarr
            .param x Int
            .param y Int
          .endParamTable
          .localTable
            .local ::temp0 advarraylib#v
            .local ::temp1 advarraylib#v[]
            .local ::temp2 Var[]
            .local ::temp3 Var
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr a ;@line 346
            STRUCTGET ::temp1 ::temp0 a ;@line 346
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 346
            STRUCTGET ::temp2 ::temp0 e ;@line 346
            ARRAYGETELEMENT ::temp3 ::temp2 y ;@line 346
            RETURN ::temp3 ;@line 346
          .endCode
        .endFunction
        .function Set2D static
          .userFlags 0
          .docString ""
          .return None
          .paramTable
            .param arr advarraylib#bigarr
            .param x Int
            .param y Int
            .param val Var
          .endParamTable
          .localTable
            .local ::temp0 advarraylib#v
            .local ::temp1 advarraylib#v[]
            .local ::temp2 Var[]
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr a ;@line 350
            STRUCTGET ::temp1 ::temp0 a ;@line 350
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 350
            STRUCTGET ::temp2 ::temp0 e ;@line 350
            ARRAYSETELEMENT ::temp2 y val ;@line 350
          .endCode
        .endFunction
        .function Find2D static
          .userFlags 0
          .docString "Like Array.Find, Looks for elements in y, then x, so (0,0) < (0,1) < (1,0) < (0,32) < (32,0) < (32,64) etc\n\nIMPORTANT: For technical reasons, this must cast everything to a string before searching.\nThis means that if you pass in 1 (int), and have \"1\" (string) in the array, the function\nmay find the string \"1\" first."
          .return Int[]
          .paramTable
            .param arr advarraylib#bigarr
            .param element Var
            .param x Int
            .param y Int
          .endParamTable
          .localTable
            .local r Int[]
            .local asStr String
            .local ::temp0 String
            .local base advarraylib#v[]
            .local ::temp1 advarraylib#v
            .local ::temp2 advarraylib#v[]
            .local xLen Int
            .local ::temp3 Int
            .local ::temp4 Bool
            .local ::temp5 Var[]
            .local ::temp6 String[]
            .local ::temp7 Int[]
          .endLocalTable
          .code
            CAST ::temp0 element ;@line 360
            ASSIGN asStr ::temp0 ;@line 360
            STRUCTGET ::temp1 arr a ;@line 361
            STRUCTGET ::temp2 ::temp1 a ;@line 361
            ASSIGN base ::temp2 ;@line 361
            ARRAYLENGTH ::temp3 base ;@line 362
            ASSIGN xLen ::temp3 ;@line 362
            label2:
            COMPARELT ::temp4 x xLen ;@line 363
            JUMPF ::temp4 label0 ;@line 363
            ARRAYGETELEMENT ::temp1 base x ;@line 367
            STRUCTGET ::temp5 ::temp1 e ;@line 367
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 367
            ARRAYFINDELEMENT ::temp6 ::temp3 asStr y ;@line 367
            ASSIGN y ::temp3 ;@line 367
            COMPAREGTE ::temp4 y 0 ;@line 369
            JUMPF ::temp4 label1 ;@line 369
            ARRAYCREATE ::temp7 2 ;@line 370
            ASSIGN r ::temp7 ;@line 370
            ARRAYSETELEMENT r 0 x ;@line 371
            ARRAYSETELEMENT r 1 y ;@line 372
            RETURN r ;@line 373
            JUMP label1 ;@line 369
            label1:
            ASSIGN y 0 ;@line 375
            IADD ::temp3 x 1 ;@line 376
            ASSIGN x ::temp3 ;@line 376
            JUMP label2 ;@line 363
            label0:
            CAST ::temp7 None ;@line 379
            RETURN ::temp7 ;@line 379
          .endCode
        .endFunction
        .function RFind2D static
          .userFlags 0
          .docString "Like Array.RFind, looks for elements in y, then x, so (0,0) < (0,1) < (1,0) < (0,32) < (32,0) < (32,64) etc\n\nIMPORTANT: For technical reasons, this must cast everything to a string before searching.\nThis means that if you pass in 1 (int), and have \"1\" (string) in the array, the function\nmay find the string \"1\" first."
          .return Int[]
          .paramTable
            .param arr advarraylib#bigarr
            .param element Var
            .param x Int
            .param y Int
          .endParamTable
          .localTable
            .local r Int[]
            .local asStr String
            .local ::temp0 String
            .local base advarraylib#v[]
            .local ::temp1 advarraylib#v
            .local ::temp2 advarraylib#v[]
            .local xLen Int
            .local ::temp3 Int
            .local ::temp4 Bool
            .local ::temp5 Var[]
            .local ::temp6 String[]
            .local ::temp7 Int[]
          .endLocalTable
          .code
            CAST ::temp0 element ;@line 389
            ASSIGN asStr ::temp0 ;@line 389
            STRUCTGET ::temp1 arr a ;@line 390
            STRUCTGET ::temp2 ::temp1 a ;@line 390
            ASSIGN base ::temp2 ;@line 390
            ARRAYLENGTH ::temp3 base ;@line 391
            ASSIGN xLen ::temp3 ;@line 391
            COMPAREEQ ::temp4 x -1 ;@line 392
            JUMPF ::temp4 label0 ;@line 392
            ISUBTRACT ::temp3 xLen 1 ;@line 393
            ASSIGN x ::temp3 ;@line 393
            JUMP label0 ;@line 392
            label0:
            COMPAREGTE ::temp4 x 0 ;@line 395
            JUMPF ::temp4 label1 ;@line 395
            ARRAYGETELEMENT ::temp1 base x ;@line 398
            STRUCTGET ::temp5 ::temp1 e ;@line 398
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 398
            ARRAYRFINDELEMENT ::temp6 ::temp3 asStr y ;@line 398
            ASSIGN y ::temp3 ;@line 398
            COMPAREGTE ::temp4 y 0 ;@line 399
            JUMPF ::temp4 label2 ;@line 399
            ARRAYCREATE ::temp7 2 ;@line 400
            ASSIGN r ::temp7 ;@line 400
            ARRAYSETELEMENT r 0 x ;@line 401
            ARRAYSETELEMENT r 1 y ;@line 402
            RETURN r ;@line 403
            JUMP label2 ;@line 399
            label2:
            ISUBTRACT ::temp3 x 1 ;@line 405
            ASSIGN x ::temp3 ;@line 405
            JUMP label0 ;@line 395
            label1:
            CAST ::temp7 None ;@line 408
            RETURN ::temp7 ;@line 408
          .endCode
        .endFunction
        .function GetArr3D static
          .userFlags 0
          .docString "Creates a \"rectangular prismatic\" 3d array of size (x,y,z)\nNote that x, y and z must be <= 128"
          .return advarraylib#bigarr
          .paramTable
            .param x Int
            .param y Int
            .param z Int
            .param init Var
          .endParamTable
          .localTable
            .local arr advarraylib#bigarr
            .local ::temp0 advarraylib#bigarr
            .local v advarraylib#v
            .local ::temp1 advarraylib#v
            .local ::temp2 advarraylib#v[]
            .local ::temp3 Int
          .endLocalTable
          .code
            STRUCTCREATE ::temp0 ;@line 416
            ASSIGN arr ::temp0 ;@line 416
            STRUCTCREATE ::temp1 ;@line 417
            ASSIGN v ::temp1 ;@line 417
            CALLSTATIC advarraylib Getv3D ::temp2 x y z init ;@line 418
            STRUCTSET v a ::temp2 ;@line 418
            STRUCTSET arr a v ;@line 419
            IMULTIPLY ::temp3 x y ;@line 420
            IMULTIPLY ::temp3 ::temp3 z ;@line 420
            STRUCTSET arr size ::temp3 ;@line 420
            STRUCTSET arr levels 3 ;@line 421
            RETURN arr ;@line 422
          .endCode
        .endFunction
        .function Getv3D static
          .userFlags 0
          .docString ""
          .return advarraylib#v[]
          .paramTable
            .param x Int
            .param y Int
            .param z Int
            .param init Var
          .endParamTable
          .localTable
            .local vx advarraylib#v[]
            .local ::temp0 advarraylib#v[]
            .local ::temp1 String
            .local ::temp2 Bool
            .local i Int
            .local ::temp3 Int
            .local ::temp4 Int
            .local ::temp5 advarraylib#v
            .local vy advarraylib#v[]
            .local j Int
            .local ::temp6 Int
            .local vz Var[]
            .local ::temp7 Var[]
            .local ::mangled_i_0 Int
            .local ::mangled_vy_0 advarraylib#v[]
            .local ::mangled_j_0 Int
            .local ::mangled_vz_0 Var[]
            .local k Int
            .local ::temp8 Int
          .endLocalTable
          .code
            ARRAYCREATE ::temp0 x ;@line 426
            ASSIGN vx ::temp0 ;@line 426
            CAST ::temp1 init ;@line 428
            COMPAREEQ ::temp2 ::temp1 "None" ;@line 428
            JUMPF ::temp2 label0 ;@line 428
            ASSIGN i 0 ;@line 429
            ISUBTRACT ::temp4 x 1 ;@line 429
            ASSIGN ::temp3 ::temp4 ;@line 429
            label4:
            COMPARELTE ::temp2 i ::temp3 ;@line 429
            JUMPF ::temp2 label1 ;@line 429
            STRUCTCREATE ::temp5 ;@line 430
            ARRAYSETELEMENT vx i ::temp5 ;@line 430
            ARRAYCREATE ::temp0 y ;@line 431
            ASSIGN vy ::temp0 ;@line 431
            ARRAYGETELEMENT ::temp5 vx i ;@line 432
            STRUCTSET ::temp5 a vy ;@line 432
            ASSIGN j 0 ;@line 433
            ISUBTRACT ::temp6 y 1 ;@line 433
            ASSIGN ::temp4 ::temp6 ;@line 433
            label3:
            COMPARELTE ::temp2 j ::temp4 ;@line 433
            JUMPF ::temp2 label2 ;@line 433
            STRUCTCREATE ::temp5 ;@line 434
            ARRAYSETELEMENT vy j ::temp5 ;@line 434
            ARRAYCREATE ::temp7 z ;@line 435
            ASSIGN vz ::temp7 ;@line 435
            ARRAYGETELEMENT ::temp5 vy j ;@line 436
            STRUCTSET ::temp5 e vz ;@line 436
            IADD j j 1 ;@line 433
            JUMP label3 ;@line 433
            label2:
            IADD i i 1 ;@line 429
            JUMP label4 ;@line 429
            label1:
            JUMP label5 ;@line 428
            label0:
            ASSIGN ::mangled_i_0 0 ;@line 440
            ISUBTRACT ::temp4 x 1 ;@line 440
            ASSIGN ::temp3 ::temp4 ;@line 440
            label10:
            COMPARELTE ::temp2 ::mangled_i_0 ::temp3 ;@line 440
            JUMPF ::temp2 label5 ;@line 440
            STRUCTCREATE ::temp5 ;@line 441
            ARRAYSETELEMENT vx ::mangled_i_0 ::temp5 ;@line 441
            ARRAYCREATE ::temp0 y ;@line 442
            ASSIGN ::mangled_vy_0 ::temp0 ;@line 442
            ARRAYGETELEMENT ::temp5 vx ::mangled_i_0 ;@line 443
            STRUCTSET ::temp5 a ::mangled_vy_0 ;@line 443
            ASSIGN ::mangled_j_0 0 ;@line 444
            ISUBTRACT ::temp6 y 1 ;@line 444
            ASSIGN ::temp4 ::temp6 ;@line 444
            label9:
            COMPARELTE ::temp2 ::mangled_j_0 ::temp4 ;@line 444
            JUMPF ::temp2 label6 ;@line 444
            STRUCTCREATE ::temp5 ;@line 445
            ARRAYSETELEMENT ::mangled_vy_0 ::mangled_j_0 ::temp5 ;@line 445
            ARRAYCREATE ::temp7 z ;@line 446
            ASSIGN ::mangled_vz_0 ::temp7 ;@line 446
            ARRAYGETELEMENT ::temp5 ::mangled_vy_0 ::mangled_j_0 ;@line 447
            STRUCTSET ::temp5 e ::mangled_vz_0 ;@line 447
            ASSIGN k 0 ;@line 448
            ISUBTRACT ::temp8 z 1 ;@line 448
            ASSIGN ::temp6 ::temp8 ;@line 448
            label8:
            COMPARELTE ::temp2 k ::temp6 ;@line 448
            JUMPF ::temp2 label7 ;@line 448
            ARRAYSETELEMENT ::mangled_vz_0 k init ;@line 449
            IADD k k 1 ;@line 448
            JUMP label8 ;@line 448
            label7:
            IADD ::mangled_j_0 ::mangled_j_0 1 ;@line 444
            JUMP label9 ;@line 444
            label6:
            IADD ::mangled_i_0 ::mangled_i_0 1 ;@line 440
            JUMP label10 ;@line 440
            label5:
            RETURN vx ;@line 455
          .endCode
        .endFunction
        .function Set3D static
          .userFlags 0
          .docString ""
          .return None
          .paramTable
            .param arr advarraylib#bigarr
            .param x Int
            .param y Int
            .param z Int
            .param val Var
          .endParamTable
          .localTable
            .local ::temp0 advarraylib#v
            .local ::temp1 advarraylib#v[]
            .local ::temp2 Var[]
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr a ;@line 459
            STRUCTGET ::temp1 ::temp0 a ;@line 459
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 459
            STRUCTGET ::temp1 ::temp0 a ;@line 459
            ARRAYGETELEMENT ::temp0 ::temp1 y ;@line 459
            STRUCTGET ::temp2 ::temp0 e ;@line 459
            ARRAYSETELEMENT ::temp2 z val ;@line 459
          .endCode
        .endFunction
        .function Get3D static
          .userFlags 0
          .docString ""
          .return Var
          .paramTable
            .param arr advarraylib#bigarr
            .param x Int
            .param y Int
            .param z Int
          .endParamTable
          .localTable
            .local ::temp0 advarraylib#v
            .local ::temp1 advarraylib#v[]
            .local ::temp2 Var[]
            .local ::temp3 Var
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr a ;@line 463
            STRUCTGET ::temp1 ::temp0 a ;@line 463
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 463
            STRUCTGET ::temp1 ::temp0 a ;@line 463
            ARRAYGETELEMENT ::temp0 ::temp1 y ;@line 463
            STRUCTGET ::temp2 ::temp0 e ;@line 463
            ARRAYGETELEMENT ::temp3 ::temp2 z ;@line 463
            RETURN ::temp3 ;@line 463
          .endCode
        .endFunction
        .function Find3D static
          .userFlags 0
          .docString "Like Array.Find, looks for elements in z, then y, then x, so (0,0,0) < (0,1,0) < (1,0,0) < (1,32,0) < (2,0,0) etc\n\nIMPORTANT: For technical reasons, this must cast everything to a string before searching.\nThis means that if you pass in 1 (int), and have \"1\" (string) in the array, the function\nmay find the string \"1\" first."
          .return Int[]
          .paramTable
            .param arr advarraylib#bigarr
            .param element Var
            .param x Int
            .param y Int
            .param z Int
          .endParamTable
          .localTable
            .local r Int[]
            .local base advarraylib#v[]
            .local ::temp0 advarraylib#v
            .local ::temp1 advarraylib#v[]
            .local asStr String
            .local ::temp2 String
            .local xLen Int
            .local ::temp3 Int
            .local ::temp4 Bool
            .local xV advarraylib#v[]
            .local yLen Int
            .local ::temp5 Var[]
            .local ::temp6 String[]
            .local ::temp7 Int[]
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr a ;@line 473
            STRUCTGET ::temp1 ::temp0 a ;@line 473
            ASSIGN base ::temp1 ;@line 473
            CAST ::temp2 element ;@line 474
            ASSIGN asStr ::temp2 ;@line 474
            ARRAYLENGTH ::temp3 base ;@line 475
            ASSIGN xLen ::temp3 ;@line 475
            label4:
            COMPARELT ::temp4 x xLen ;@line 476
            JUMPF ::temp4 label0 ;@line 476
            ARRAYGETELEMENT ::temp0 base x ;@line 477
            STRUCTGET ::temp1 ::temp0 a ;@line 477
            ASSIGN xV ::temp1 ;@line 477
            ARRAYLENGTH ::temp3 xV ;@line 478
            ASSIGN yLen ::temp3 ;@line 478
            label3:
            COMPARELT ::temp4 y yLen ;@line 479
            JUMPF ::temp4 label1 ;@line 479
            ARRAYGETELEMENT ::temp0 xV y ;@line 481
            STRUCTGET ::temp5 ::temp0 e ;@line 481
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 481
            ARRAYFINDELEMENT ::temp6 ::temp3 asStr z ;@line 481
            ASSIGN z ::temp3 ;@line 481
            COMPAREGTE ::temp4 z 0 ;@line 482
            JUMPF ::temp4 label2 ;@line 482
            ARRAYCREATE ::temp7 3 ;@line 483
            ASSIGN r ::temp7 ;@line 483
            ARRAYSETELEMENT r 0 x ;@line 484
            ARRAYSETELEMENT r 1 y ;@line 485
            ARRAYSETELEMENT r 2 z ;@line 486
            RETURN r ;@line 487
            JUMP label2 ;@line 482
            label2:
            ASSIGN z 0 ;@line 489
            IADD ::temp3 y 1 ;@line 490
            ASSIGN y ::temp3 ;@line 490
            JUMP label3 ;@line 479
            label1:
            ASSIGN y 0 ;@line 492
            IADD ::temp3 x 1 ;@line 493
            ASSIGN x ::temp3 ;@line 493
            JUMP label4 ;@line 476
            label0:
            CAST ::temp7 None ;@line 496
            RETURN ::temp7 ;@line 496
          .endCode
        .endFunction
        .function RFind3D static
          .userFlags 0
          .docString "Like Array.RFind, looks for elements in z, then y, then x, so (0,0,0) < (0,1,0) < (1,0,0) < (1,32,0) < (2,0,0) etc\n\nIMPORTANT: For technical reasons, this must cast everything to a string before searching.\nThis means that if you pass in 1 (int), and have \"1\" (string) in the array, the function\nmay find the string \"1\" first."
          .return Int[]
          .paramTable
            .param arr advarraylib#bigarr
            .param element Var
            .param x Int
            .param y Int
            .param z Int
          .endParamTable
          .localTable
            .local r Int[]
            .local base advarraylib#v[]
            .local ::temp0 advarraylib#v
            .local ::temp1 advarraylib#v[]
            .local asStr String
            .local ::temp2 String
            .local ::temp3 Bool
            .local ::temp4 Int
            .local yBase Int
            .local xV advarraylib#v[]
            .local ::temp5 Var[]
            .local ::temp6 String[]
            .local ::temp7 Int[]
          .endLocalTable
          .code
            STRUCTGET ::temp0 arr a ;@line 506
            STRUCTGET ::temp1 ::temp0 a ;@line 506
            ASSIGN base ::temp1 ;@line 506
            CAST ::temp2 element ;@line 507
            ASSIGN asStr ::temp2 ;@line 507
            COMPAREEQ ::temp3 x -1 ;@line 508
            JUMPF ::temp3 label0 ;@line 508
            ARRAYLENGTH ::temp4 base ;@line 509
            IADD ::temp4 ::temp4 -1 ;@line 509
            ASSIGN x ::temp4 ;@line 509
            JUMP label0 ;@line 508
            label0:
            COMPAREEQ ::temp3 y -1 ;@line 511
            JUMPF ::temp3 label1 ;@line 511
            ARRAYGETELEMENT ::temp0 base x ;@line 512
            STRUCTGET ::temp1 ::temp0 a ;@line 512
            ARRAYLENGTH ::temp4 ::temp1 ;@line 512
            IADD ::temp4 ::temp4 -1 ;@line 512
            ASSIGN y ::temp4 ;@line 512
            JUMP label1 ;@line 511
            label1:
            ARRAYGETELEMENT ::temp0 base 0 ;@line 514
            STRUCTGET ::temp1 ::temp0 a ;@line 514
            ARRAYLENGTH ::temp4 ::temp1 ;@line 514
            IADD ::temp4 ::temp4 -1 ;@line 514
            ASSIGN yBase ::temp4 ;@line 514
            label6:
            COMPAREGTE ::temp3 x 0 ;@line 515
            JUMPF ::temp3 label2 ;@line 515
            ARRAYGETELEMENT ::temp0 base x ;@line 516
            STRUCTGET ::temp1 ::temp0 a ;@line 516
            ASSIGN xV ::temp1 ;@line 516
            label5:
            COMPAREGTE ::temp3 y 0 ;@line 517
            JUMPF ::temp3 label3 ;@line 517
            ARRAYGETELEMENT ::temp0 xV y ;@line 519
            STRUCTGET ::temp5 ::temp0 e ;@line 519
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 519
            ARRAYRFINDELEMENT ::temp6 ::temp4 asStr z ;@line 519
            ASSIGN z ::temp4 ;@line 519
            COMPAREGTE ::temp3 z 0 ;@line 521
            JUMPF ::temp3 label4 ;@line 521
            ARRAYCREATE ::temp7 3 ;@line 522
            ASSIGN r ::temp7 ;@line 522
            ARRAYSETELEMENT r 0 x ;@line 523
            ARRAYSETELEMENT r 1 y ;@line 524
            ARRAYSETELEMENT r 2 z ;@line 525
            RETURN r ;@line 526
            JUMP label4 ;@line 521
            label4:
            ISUBTRACT ::temp4 y 1 ;@line 528
            ASSIGN y ::temp4 ;@line 528
            JUMP label5 ;@line 517
            label3:
            ISUBTRACT ::temp4 x 1 ;@line 530
            ASSIGN x ::temp4 ;@line 530
            ASSIGN y yBase ;@line 531
            JUMP label6 ;@line 515
            label2:
            CAST ::temp7 None ;@line 534
            RETURN ::temp7 ;@line 534
          .endCode
        .endFunction
        .function CallFunction static
          .userFlags 0
          .docString "Nearly the same as ScriptObject.CallFunction, except for functions that return an array.\n\nExample:\nfloat[] Function ObjectReference.GetSafePosition(float aSearchRadius, float aSafeRadius)\n\t\nIf the compiler worked sanely, you would be able to do:\n\tvar[] args = new var[2]\n\tvar[0] = 1024.0\n\tvar[1] = 256.0\n\tfloat[] f = ref.CallFunction(\"GetSafePosition\", args) as float[]\n\t\nThrough this library, you can do:\n\tfloat[] f = AdvArrayLib.CallFunction(ref, \"GetSafePosition\", args) as float[]"
          .return Var[]
          .paramTable
            .param obj scriptobject
            .param asFuncName String
            .param aParams Var[]
          .endParamTable
          .localTable
            .local ::temp0 Var
            .local ::temp1 Var[]
          .endLocalTable
          .code
            CALLMETHOD CallFunction obj ::temp0 asFuncName aParams ;@line 554
            CAST ::temp1 ::temp0 ;@line 554
            RETURN ::temp1 ;@line 554
          .endCode
        .endFunction
        .function CallGlobalFunction static
          .userFlags 0
          .docString "Nearly the same as Utility.CallGlobalFunction, except for functions that return an array.\n\nExample:\nActor[] Function Game.GetPlayerFollowers() native global\n\t\nIf the compiler worked sanely, you would be able to do:\n\tActor[] a = Utility.CallGlobalFunction(\"Game\", \"GetPlayerFollowers\", new var[0]) as Actor[]\n\t\nThrough this library, you can do:\n\tActor[] a = AdvArrayLib.CallGlobalFunction(\"Game\", \"GetPlayerFollowers\", new var[0]) as Actor[]"
          .return Var[]
          .paramTable
            .param asScriptName String
            .param asFuncName String
            .param aParams Var[]
          .endParamTable
          .localTable
            .local ::temp0 Var
            .local ::temp1 Var[]
          .endLocalTable
          .code
            CALLSTATIC utility CallGlobalFunction ::temp0 asScriptName asFuncName aParams ;@line 569
            CAST ::temp1 ::temp0 ;@line 569
            RETURN ::temp1 ;@line 569
          .endCode
        .endFunction
        .function VarToVarArray static
          .userFlags 0
          .docString "Attempts to cast a Var to a Var[]"
          .return Var[]
          .paramTable
            .param v Var
          .endParamTable
          .localTable
            .local ::temp0 Var[]
          .endLocalTable
          .code
            CAST ::temp0 v ;@line 574
            RETURN ::temp0 ;@line 574
          .endCode
        .endFunction
        .function VarArrayToVar static
          .userFlags 0
          .docString "Attempts to cast a Var[] to a Var"
          .return Var
          .paramTable
            .param v Var[]
          .endParamTable
          .localTable
            .local vS advarraylib#v
            .local ::temp0 advarraylib#v
            .local args Var[]
            .local ::temp1 Var[]
            .local ::temp2 Var
          .endLocalTable
          .code
            STRUCTCREATE ::temp0 ;@line 580
            ASSIGN vS ::temp0 ;@line 580
            STRUCTSET vS e v ;@line 581
            ARRAYCREATE ::temp1 1 ;@line 582
            ASSIGN args ::temp1 ;@line 582
            CAST ::temp2 vS ;@line 583
            ARRAYSETELEMENT args 0 ::temp2 ;@line 583
            CALLSTATIC utility CallGlobalFunction ::temp2 "AdvArrayLib" "VarArrayToVarPRIVATE" args ;@line 585
            RETURN ::temp2 ;@line 585
          .endCode
        .endFunction
        .function VarArrayToVarPRIVATE static
          .userFlags 0
          .docString ""
          .return Var[]
          .paramTable
            .param v advarraylib#v
          .endParamTable
          .localTable
            .local ::temp0 Var[]
          .endLocalTable
          .code
            STRUCTGET ::temp0 v e ;@line 589
            RETURN ::temp0 ;@line 589
          .endCode
        .endFunction
      .endState
    .endStateTable
  .endObject
.endObjectTable
