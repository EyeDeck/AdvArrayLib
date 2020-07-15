.info
  .source "E:\\Bethesda Softworks\\Mod Organizer FO4\\mods\\AdvPapyrusUtil\\Scripts\\Source\\User\\AdvArrayLib.psc"
  .modifyTime 1594629938
  .compileTime 1594630061
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
            STRUCTCREATE ::temp0 ;@line 52
            ASSIGN base ::temp0 ;@line 52
            COMPAREGT ::temp1 size 16384 ;@line 56
            JUMPF ::temp1 label0 ;@line 56
            ASSIGN levels 3 ;@line 57
            IDIVIDE ::temp2 size 16384 ;@line 61
            ASSIGN x ::temp2 ;@line 61
            ASSIGN y 128 ;@line 62
            ASSIGN z 128 ;@line 63
            CALLSTATIC advarraylib Getv3D ::temp3 x y z init ;@line 64
            ASSIGN a ::temp3 ;@line 64
            IMOD ::temp2 size 16384 ;@line 67
            ASSIGN xRem ::temp2 ;@line 67
            CAST ::temp1 xRem ;@line 68
            JUMPF ::temp1 label1 ;@line 68
            IDIVIDE ::temp2 xRem 128 ;@line 70
            ASSIGN yFull ::temp2 ;@line 70
            IMOD ::temp2 xRem 128 ;@line 71
            ASSIGN zLast ::temp2 ;@line 71
            CAST ::temp1 yFull ;@line 74
            JUMPF ::temp1 label2 ;@line 74
            STRUCTCREATE ::temp0 ;@line 76
            ASSIGN exX ::temp0 ;@line 76
            CALLSTATIC advarraylib Getv2D ::temp3 yFull 128 init ;@line 77
            STRUCTSET exX a ::temp3 ;@line 77
            ARRAYADDELEMENTS a exX 1 ;@line 78
            JUMP label2 ;@line 74
            label2:
            CAST ::temp1 zLast ;@line 86
            JUMPF ::temp1 label3 ;@line 86
            ARRAYLENGTH ::temp2 a ;@line 88
            IADD ::temp2 ::temp2 -1 ;@line 88
            ARRAYGETELEMENT ::temp0 a ::temp2 ;@line 88
            STRUCTGET ::temp3 ::temp0 a ;@line 88
            ASSIGN xFA ::temp3 ;@line 88
            ARRAYLENGTH ::temp2 xFA ;@line 89
            COMPAREEQ ::temp1 ::temp2 128 ;@line 89
            JUMPF ::temp1 label4 ;@line 89
            STRUCTCREATE ::temp0 ;@line 91
            ASSIGN ::mangled_exX_0 ::temp0 ;@line 91
            ARRAYCREATE ::temp3 0 ;@line 92
            STRUCTSET ::mangled_exX_0 a ::temp3 ;@line 92
            ARRAYADDELEMENTS a ::mangled_exX_0 1 ;@line 93
            STRUCTGET ::temp3 ::mangled_exX_0 a ;@line 94
            ASSIGN xFA ::temp3 ;@line 94
            JUMP label4 ;@line 89
            label4:
            CALLSTATIC advarraylib Getv2D ::temp3 1 zLast init ;@line 96
            ARRAYGETELEMENT ::temp0 ::temp3 0 ;@line 96
            ARRAYADDELEMENTS xFA ::temp0 1 ;@line 96
            JUMP label3 ;@line 86
            label3:
            JUMP label1 ;@line 68
            label1:
            STRUCTSET base a a ;@line 100
            JUMP label5 ;@line 56
            label0:
            COMPAREGT ::temp1 size 128 ;@line 101
            JUMPF ::temp1 label6 ;@line 56
            ASSIGN levels 2 ;@line 103
            IDIVIDE ::temp2 size 128 ;@line 105
            ASSIGN ::mangled_x_0 ::temp2 ;@line 105
            CALLSTATIC advarraylib Getv2D ::temp3 ::mangled_x_0 128 init ;@line 106
            ASSIGN a ::temp3 ;@line 106
            IMOD ::temp2 size 128 ;@line 108
            ASSIGN rem ::temp2 ;@line 108
            CAST ::temp1 rem ;@line 109
            JUMPF ::temp1 label7 ;@line 109
            STRUCTCREATE ::temp0 ;@line 110
            ASSIGN extra ::temp0 ;@line 110
            ARRAYCREATE ::temp4 rem ;@line 111
            ASSIGN e ::temp4 ;@line 111
            STRUCTSET extra e e ;@line 112
            ARRAYADDELEMENTS a extra 1 ;@line 113
            CAST ::temp5 init ;@line 115
            COMPAREEQ ::temp1 ::temp5 "None" ;@line 115
            NOT ::temp1 ::temp1 ;@line 115
            JUMPF ::temp1 label8 ;@line 115
            ASSIGN i 0 ;@line 116
            ISUBTRACT ::temp6 rem 1 ;@line 116
            ASSIGN ::temp2 ::temp6 ;@line 116
            label10:
            COMPARELTE ::temp1 i ::temp2 ;@line 116
            JUMPF ::temp1 label9 ;@line 116
            ARRAYSETELEMENT e i init ;@line 117
            IADD i i 1 ;@line 116
            JUMP label10 ;@line 116
            label9:
            JUMP label8 ;@line 115
            label8:
            JUMP label7 ;@line 109
            label7:
            STRUCTSET base a a ;@line 122
            JUMP label5 ;@line 56
            label6:
            ASSIGN levels 1 ;@line 125
            ARRAYCREATE ::temp4 size ;@line 127
            ASSIGN e ::temp4 ;@line 127
            STRUCTSET base e e ;@line 128
            CAST ::temp5 init ;@line 130
            COMPAREEQ ::temp1 ::temp5 "None" ;@line 130
            NOT ::temp1 ::temp1 ;@line 130
            JUMPF ::temp1 label5 ;@line 130
            ASSIGN ::mangled_i_0 0 ;@line 131
            ISUBTRACT ::temp6 size 1 ;@line 131
            ASSIGN ::temp2 ::temp6 ;@line 131
            label12:
            COMPARELTE ::temp1 ::mangled_i_0 ::temp2 ;@line 131
            JUMPF ::temp1 label11 ;@line 131
            ARRAYSETELEMENT e ::mangled_i_0 init ;@line 132
            IADD ::mangled_i_0 ::mangled_i_0 1 ;@line 131
            JUMP label12 ;@line 131
            label11:
            JUMP label5 ;@line 130
            label5:
            STRUCTCREATE ::temp7 ;@line 137
            ASSIGN arr ::temp7 ;@line 137
            STRUCTSET arr size size ;@line 138
            STRUCTSET arr levels levels ;@line 139
            STRUCTSET arr a base ;@line 140
            RETURN arr ;@line 143
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
            ARRAYCREATE ::temp0 1 ;@line 151
            ASSIGN params ::temp0 ;@line 151
            CAST ::temp1 arr ;@line 152
            ARRAYSETELEMENT params 0 ::temp1 ;@line 152
            CALLSTATIC utility CallGlobalFunctionNoWait ::nonevar "AdvArrayLib" "DeleteArrPRIVATE" params ;@line 153
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
            STRUCTGET ::temp0 arr levels ;@line 157
            ASSIGN i ::temp0 ;@line 157
            COMPAREEQ ::temp1 i 3 ;@line 162
            JUMPF ::temp1 label0 ;@line 162
            STRUCTGET ::temp2 arr a ;@line 164
            ASSIGN baseV ::temp2 ;@line 164
            ASSIGN x 0 ;@line 165
            STRUCTGET ::temp3 baseV a ;@line 165
            ARRAYLENGTH ::temp4 ::temp3 ;@line 165
            IADD ::temp4 ::temp4 -1 ;@line 165
            ASSIGN ::temp0 ::temp4 ;@line 165
            label4:
            COMPARELTE ::temp1 x ::temp0 ;@line 165
            JUMPF ::temp1 label1 ;@line 165
            STRUCTGET ::temp3 baseV a ;@line 166
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 166
            ASSIGN xV ::temp2 ;@line 166
            ASSIGN y 0 ;@line 167
            STRUCTGET ::temp3 xV a ;@line 167
            ARRAYLENGTH ::temp5 ::temp3 ;@line 167
            IADD ::temp5 ::temp5 -1 ;@line 167
            ASSIGN ::temp4 ::temp5 ;@line 167
            label3:
            COMPARELTE ::temp1 y ::temp4 ;@line 167
            JUMPF ::temp1 label2 ;@line 167
            STRUCTGET ::temp3 xV a ;@line 172
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 172
            STRUCTGET ::temp6 ::temp2 e ;@line 172
            ARRAYCLEARELEMENTS ::temp6 ;@line 172
            CAST ::temp6 None ;@line 173
            STRUCTGET ::temp3 xV a ;@line 173
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 173
            STRUCTSET ::temp2 e ::temp6 ;@line 173
            CAST ::temp2 None ;@line 174
            STRUCTGET ::temp3 xV a ;@line 174
            ARRAYSETELEMENT ::temp3 y ::temp2 ;@line 174
            IADD ::temp5 y 1 ;@line 167
            ASSIGN y ::temp5 ;@line 167
            JUMP label3 ;@line 167
            label2:
            CAST ::temp3 None ;@line 176
            STRUCTSET xV a ::temp3 ;@line 176
            IADD ::temp4 x 1 ;@line 165
            ASSIGN x ::temp4 ;@line 165
            JUMP label4 ;@line 165
            label1:
            CAST ::temp3 None ;@line 178
            STRUCTSET baseV a ::temp3 ;@line 178
            JUMP label5 ;@line 162
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 179
            JUMPF ::temp1 label6 ;@line 162
            STRUCTGET ::temp2 arr a ;@line 181
            ASSIGN ::mangled_baseV_0 ::temp2 ;@line 181
            ASSIGN x 0 ;@line 182
            STRUCTGET ::temp3 ::mangled_baseV_0 a ;@line 182
            ARRAYLENGTH ::temp4 ::temp3 ;@line 182
            IADD ::temp4 ::temp4 -1 ;@line 182
            ASSIGN ::temp0 ::temp4 ;@line 182
            label8:
            COMPARELTE ::temp1 x ::temp0 ;@line 182
            JUMPF ::temp1 label7 ;@line 182
            CAST ::temp6 None ;@line 183
            STRUCTGET ::temp3 ::mangled_baseV_0 a ;@line 183
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 183
            STRUCTSET ::temp2 e ::temp6 ;@line 183
            CAST ::temp2 None ;@line 184
            STRUCTGET ::temp3 ::mangled_baseV_0 a ;@line 184
            ARRAYSETELEMENT ::temp3 x ::temp2 ;@line 184
            IADD ::temp4 x 1 ;@line 182
            ASSIGN x ::temp4 ;@line 182
            JUMP label8 ;@line 182
            label7:
            CAST ::temp3 None ;@line 186
            STRUCTSET ::mangled_baseV_0 a ::temp3 ;@line 186
            JUMP label5 ;@line 162
            label6:
            CAST ::temp6 None ;@line 188
            STRUCTGET ::temp2 arr a ;@line 188
            STRUCTSET ::temp2 e ::temp6 ;@line 188
            label5:
            CAST ::temp2 None ;@line 191
            STRUCTSET arr a ::temp2 ;@line 191
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
            STRUCTGET ::temp0 arr levels ;@line 195
            ASSIGN i ::temp0 ;@line 195
            COMPAREEQ ::temp1 i 3 ;@line 199
            JUMPF ::temp1 label0 ;@line 199
            IDIVIDE ::temp0 index 16384 ;@line 200
            ASSIGN x ::temp0 ;@line 200
            IDIVIDE ::temp0 index 128 ;@line 201
            IMOD ::temp0 ::temp0 128 ;@line 201
            ASSIGN y ::temp0 ;@line 201
            IMOD ::temp0 index 128 ;@line 202
            ASSIGN z ::temp0 ;@line 202
            STRUCTGET ::temp2 arr a ;@line 203
            STRUCTGET ::temp3 ::temp2 a ;@line 203
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 203
            STRUCTGET ::temp3 ::temp2 a ;@line 203
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 203
            STRUCTGET ::temp4 ::temp2 e ;@line 203
            ARRAYGETELEMENT ::temp5 ::temp4 z ;@line 203
            RETURN ::temp5 ;@line 203
            JUMP label1 ;@line 199
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 204
            JUMPF ::temp1 label2 ;@line 199
            IDIVIDE ::temp0 index 128 ;@line 205
            ASSIGN x ::temp0 ;@line 205
            IMOD ::temp0 index 128 ;@line 206
            ASSIGN y ::temp0 ;@line 206
            STRUCTGET ::temp2 arr a ;@line 207
            STRUCTGET ::temp3 ::temp2 a ;@line 207
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 207
            STRUCTGET ::temp4 ::temp2 e ;@line 207
            ARRAYGETELEMENT ::temp5 ::temp4 y ;@line 207
            RETURN ::temp5 ;@line 207
            JUMP label1 ;@line 199
            label2:
            COMPAREEQ ::temp1 i 1 ;@line 208
            JUMPF ::temp1 label3 ;@line 199
            STRUCTGET ::temp2 arr a ;@line 209
            STRUCTGET ::temp4 ::temp2 e ;@line 209
            ARRAYGETELEMENT ::temp5 ::temp4 index ;@line 209
            RETURN ::temp5 ;@line 209
            JUMP label1 ;@line 199
            label3:
            CAST ::temp5 None ;@line 211
            RETURN ::temp5 ;@line 211
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
            STRUCTGET ::temp0 arr levels ;@line 221
            ASSIGN i ::temp0 ;@line 221
            COMPAREEQ ::temp1 i 3 ;@line 225
            JUMPF ::temp1 label0 ;@line 225
            IDIVIDE ::temp0 index 16384 ;@line 226
            ASSIGN x ::temp0 ;@line 226
            IDIVIDE ::temp0 index 128 ;@line 227
            IMOD ::temp0 ::temp0 128 ;@line 227
            ASSIGN y ::temp0 ;@line 227
            IMOD ::temp0 index 128 ;@line 228
            ASSIGN z ::temp0 ;@line 228
            CALLSTATIC advarraylib Find3D ::temp2 arr element x y z ;@line 229
            ASSIGN r ::temp2 ;@line 229
            CAST ::temp2 None ;@line 230
            COMPAREEQ ::temp1 r ::temp2 ;@line 230
            JUMPF ::temp1 label1 ;@line 230
            RETURN -1 ;@line 231
            JUMP label2 ;@line 230
            label1:
            ARRAYGETELEMENT ::temp0 r 0 ;@line 233
            IMULTIPLY ::temp0 ::temp0 16384 ;@line 233
            ARRAYGETELEMENT ::temp3 r 1 ;@line 233
            IMULTIPLY ::temp3 ::temp3 128 ;@line 233
            IADD ::temp3 ::temp0 ::temp3 ;@line 233
            ARRAYGETELEMENT ::temp0 r 2 ;@line 233
            IADD ::temp0 ::temp3 ::temp0 ;@line 233
            RETURN ::temp0 ;@line 233
            label2:
            JUMP label3 ;@line 225
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 235
            JUMPF ::temp1 label4 ;@line 225
            IDIVIDE ::temp0 index 128 ;@line 236
            ASSIGN x ::temp0 ;@line 236
            IMOD ::temp0 index 128 ;@line 237
            ASSIGN y ::temp0 ;@line 237
            CALLSTATIC advarraylib Find2D ::temp2 arr element x y ;@line 238
            ASSIGN ::mangled_r_0 ::temp2 ;@line 238
            CAST ::temp2 None ;@line 239
            COMPAREEQ ::temp1 ::mangled_r_0 ::temp2 ;@line 239
            JUMPF ::temp1 label5 ;@line 239
            RETURN -1 ;@line 240
            JUMP label6 ;@line 239
            label5:
            ARRAYGETELEMENT ::temp0 ::mangled_r_0 0 ;@line 242
            IMULTIPLY ::temp0 ::temp0 128 ;@line 242
            ARRAYGETELEMENT ::temp3 ::mangled_r_0 1 ;@line 242
            IADD ::temp3 ::temp0 ::temp3 ;@line 242
            RETURN ::temp3 ;@line 242
            label6:
            JUMP label3 ;@line 225
            label4:
            COMPAREEQ ::temp1 i 1 ;@line 244
            JUMPF ::temp1 label7 ;@line 225
            STRUCTGET ::temp4 arr a ;@line 245
            STRUCTGET ::temp5 ::temp4 e ;@line 245
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 245
            CAST ::temp7 element ;@line 245
            ARRAYFINDELEMENT ::temp6 ::temp3 ::temp7 index ;@line 245
            RETURN ::temp3 ;@line 245
            JUMP label3 ;@line 225
            label7:
            RETURN -1 ;@line 247
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
            STRUCTGET ::temp0 arr levels ;@line 257
            ASSIGN i ::temp0 ;@line 257
            COMPAREEQ ::temp1 i 3 ;@line 261
            JUMPF ::temp1 label0 ;@line 261
            IDIVIDE ::temp0 index 16384 ;@line 262
            ASSIGN x ::temp0 ;@line 262
            IDIVIDE ::temp0 index 128 ;@line 263
            IMOD ::temp0 ::temp0 128 ;@line 263
            ASSIGN y ::temp0 ;@line 263
            IMOD ::temp0 index 128 ;@line 264
            ASSIGN z ::temp0 ;@line 264
            CALLSTATIC advarraylib RFind3D ::temp2 arr element x y z ;@line 266
            ASSIGN r ::temp2 ;@line 266
            CAST ::temp2 None ;@line 268
            COMPAREEQ ::temp1 r ::temp2 ;@line 268
            JUMPF ::temp1 label1 ;@line 268
            RETURN -1 ;@line 269
            JUMP label2 ;@line 268
            label1:
            ARRAYGETELEMENT ::temp0 r 0 ;@line 271
            IMULTIPLY ::temp0 ::temp0 16384 ;@line 271
            ARRAYGETELEMENT ::temp3 r 1 ;@line 271
            IMULTIPLY ::temp3 ::temp3 128 ;@line 271
            IADD ::temp3 ::temp0 ::temp3 ;@line 271
            ARRAYGETELEMENT ::temp0 r 2 ;@line 271
            IADD ::temp0 ::temp3 ::temp0 ;@line 271
            RETURN ::temp0 ;@line 271
            label2:
            JUMP label3 ;@line 261
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 273
            JUMPF ::temp1 label4 ;@line 261
            IDIVIDE ::temp0 index 128 ;@line 274
            ASSIGN x ::temp0 ;@line 274
            IMOD ::temp0 index 128 ;@line 275
            ASSIGN y ::temp0 ;@line 275
            CALLSTATIC advarraylib RFind2D ::temp2 arr element x y ;@line 276
            ASSIGN ::mangled_r_0 ::temp2 ;@line 276
            CAST ::temp2 None ;@line 277
            COMPAREEQ ::temp1 ::mangled_r_0 ::temp2 ;@line 277
            JUMPF ::temp1 label5 ;@line 277
            RETURN -1 ;@line 278
            JUMP label6 ;@line 277
            label5:
            ARRAYGETELEMENT ::temp0 ::mangled_r_0 0 ;@line 280
            IMULTIPLY ::temp0 ::temp0 128 ;@line 280
            ARRAYGETELEMENT ::temp3 ::mangled_r_0 1 ;@line 280
            IADD ::temp3 ::temp0 ::temp3 ;@line 280
            RETURN ::temp3 ;@line 280
            label6:
            JUMP label3 ;@line 261
            label4:
            COMPAREEQ ::temp1 i 1 ;@line 282
            JUMPF ::temp1 label7 ;@line 261
            STRUCTGET ::temp4 arr a ;@line 284
            STRUCTGET ::temp5 ::temp4 e ;@line 284
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 284
            CAST ::temp7 element ;@line 284
            ARRAYRFINDELEMENT ::temp6 ::temp3 ::temp7 index ;@line 284
            RETURN ::temp3 ;@line 284
            JUMP label3 ;@line 261
            label7:
            RETURN -1 ;@line 286
            label3:
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
            CAST ::temp0 element ;@line 343
            ASSIGN asStr ::temp0 ;@line 343
            STRUCTGET ::temp1 arr a ;@line 344
            STRUCTGET ::temp2 ::temp1 a ;@line 344
            ASSIGN base ::temp2 ;@line 344
            ARRAYLENGTH ::temp3 base ;@line 345
            ASSIGN xLen ::temp3 ;@line 345
            label2:
            COMPARELT ::temp4 x xLen ;@line 346
            JUMPF ::temp4 label0 ;@line 346
            ARRAYGETELEMENT ::temp1 base x ;@line 350
            STRUCTGET ::temp5 ::temp1 e ;@line 350
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 350
            ARRAYFINDELEMENT ::temp6 ::temp3 asStr y ;@line 350
            ASSIGN y ::temp3 ;@line 350
            COMPAREGTE ::temp4 y 0 ;@line 352
            JUMPF ::temp4 label1 ;@line 352
            ARRAYCREATE ::temp7 2 ;@line 353
            ASSIGN r ::temp7 ;@line 353
            ARRAYSETELEMENT r 0 x ;@line 354
            ARRAYSETELEMENT r 1 y ;@line 355
            RETURN r ;@line 356
            JUMP label1 ;@line 352
            label1:
            ASSIGN y 0 ;@line 358
            IADD ::temp3 x 1 ;@line 359
            ASSIGN x ::temp3 ;@line 359
            JUMP label2 ;@line 346
            label0:
            CAST ::temp7 None ;@line 362
            RETURN ::temp7 ;@line 362
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
            CAST ::temp0 element ;@line 372
            ASSIGN asStr ::temp0 ;@line 372
            STRUCTGET ::temp1 arr a ;@line 373
            STRUCTGET ::temp2 ::temp1 a ;@line 373
            ASSIGN base ::temp2 ;@line 373
            ARRAYLENGTH ::temp3 base ;@line 374
            ASSIGN xLen ::temp3 ;@line 374
            COMPAREEQ ::temp4 x -1 ;@line 375
            JUMPF ::temp4 label0 ;@line 375
            ISUBTRACT ::temp3 xLen 1 ;@line 376
            ASSIGN x ::temp3 ;@line 376
            JUMP label0 ;@line 375
            label0:
            COMPAREGTE ::temp4 x 0 ;@line 378
            JUMPF ::temp4 label1 ;@line 378
            ARRAYGETELEMENT ::temp1 base x ;@line 381
            STRUCTGET ::temp5 ::temp1 e ;@line 381
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 381
            ARRAYRFINDELEMENT ::temp6 ::temp3 asStr y ;@line 381
            ASSIGN y ::temp3 ;@line 381
            COMPAREGTE ::temp4 y 0 ;@line 382
            JUMPF ::temp4 label2 ;@line 382
            ARRAYCREATE ::temp7 2 ;@line 383
            ASSIGN r ::temp7 ;@line 383
            ARRAYSETELEMENT r 0 x ;@line 384
            ARRAYSETELEMENT r 1 y ;@line 385
            RETURN r ;@line 386
            JUMP label2 ;@line 382
            label2:
            ISUBTRACT ::temp3 x 1 ;@line 388
            ASSIGN x ::temp3 ;@line 388
            JUMP label0 ;@line 378
            label1:
            CAST ::temp7 None ;@line 391
            RETURN ::temp7 ;@line 391
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
            STRUCTGET ::temp0 arr a ;@line 401
            STRUCTGET ::temp1 ::temp0 a ;@line 401
            ASSIGN base ::temp1 ;@line 401
            CAST ::temp2 element ;@line 402
            ASSIGN asStr ::temp2 ;@line 402
            ARRAYLENGTH ::temp3 base ;@line 403
            ASSIGN xLen ::temp3 ;@line 403
            label4:
            COMPARELT ::temp4 x xLen ;@line 404
            JUMPF ::temp4 label0 ;@line 404
            ARRAYGETELEMENT ::temp0 base x ;@line 405
            STRUCTGET ::temp1 ::temp0 a ;@line 405
            ASSIGN xV ::temp1 ;@line 405
            ARRAYLENGTH ::temp3 xV ;@line 406
            ASSIGN yLen ::temp3 ;@line 406
            label3:
            COMPARELT ::temp4 y yLen ;@line 407
            JUMPF ::temp4 label1 ;@line 407
            ARRAYGETELEMENT ::temp0 xV y ;@line 409
            STRUCTGET ::temp5 ::temp0 e ;@line 409
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 409
            ARRAYFINDELEMENT ::temp6 ::temp3 asStr z ;@line 409
            ASSIGN z ::temp3 ;@line 409
            COMPAREGTE ::temp4 z 0 ;@line 410
            JUMPF ::temp4 label2 ;@line 410
            ARRAYCREATE ::temp7 3 ;@line 411
            ASSIGN r ::temp7 ;@line 411
            ARRAYSETELEMENT r 0 x ;@line 412
            ARRAYSETELEMENT r 1 y ;@line 413
            ARRAYSETELEMENT r 2 z ;@line 414
            RETURN r ;@line 415
            JUMP label2 ;@line 410
            label2:
            ASSIGN z 0 ;@line 417
            IADD ::temp3 y 1 ;@line 418
            ASSIGN y ::temp3 ;@line 418
            JUMP label3 ;@line 407
            label1:
            ASSIGN y 0 ;@line 420
            IADD ::temp3 x 1 ;@line 421
            ASSIGN x ::temp3 ;@line 421
            JUMP label4 ;@line 404
            label0:
            CAST ::temp7 None ;@line 424
            RETURN ::temp7 ;@line 424
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
            STRUCTGET ::temp0 arr a ;@line 434
            STRUCTGET ::temp1 ::temp0 a ;@line 434
            ASSIGN base ::temp1 ;@line 434
            CAST ::temp2 element ;@line 435
            ASSIGN asStr ::temp2 ;@line 435
            COMPAREEQ ::temp3 x -1 ;@line 436
            JUMPF ::temp3 label0 ;@line 436
            ARRAYLENGTH ::temp4 base ;@line 437
            IADD ::temp4 ::temp4 -1 ;@line 437
            ASSIGN x ::temp4 ;@line 437
            JUMP label0 ;@line 436
            label0:
            COMPAREEQ ::temp3 y -1 ;@line 439
            JUMPF ::temp3 label1 ;@line 439
            ARRAYGETELEMENT ::temp0 base x ;@line 440
            STRUCTGET ::temp1 ::temp0 a ;@line 440
            ARRAYLENGTH ::temp4 ::temp1 ;@line 440
            IADD ::temp4 ::temp4 -1 ;@line 440
            ASSIGN y ::temp4 ;@line 440
            JUMP label1 ;@line 439
            label1:
            ARRAYGETELEMENT ::temp0 base 0 ;@line 442
            STRUCTGET ::temp1 ::temp0 a ;@line 442
            ARRAYLENGTH ::temp4 ::temp1 ;@line 442
            IADD ::temp4 ::temp4 -1 ;@line 442
            ASSIGN yBase ::temp4 ;@line 442
            label6:
            COMPAREGTE ::temp3 x 0 ;@line 443
            JUMPF ::temp3 label2 ;@line 443
            ARRAYGETELEMENT ::temp0 base x ;@line 444
            STRUCTGET ::temp1 ::temp0 a ;@line 444
            ASSIGN xV ::temp1 ;@line 444
            label5:
            COMPAREGTE ::temp3 y 0 ;@line 445
            JUMPF ::temp3 label3 ;@line 445
            ARRAYGETELEMENT ::temp0 xV y ;@line 447
            STRUCTGET ::temp5 ::temp0 e ;@line 447
            CALLSTATIC advarrayliboff VarArrToStringArr ::temp6 ::temp5 ;@line 447
            ARRAYRFINDELEMENT ::temp6 ::temp4 asStr z ;@line 447
            ASSIGN z ::temp4 ;@line 447
            COMPAREGTE ::temp3 z 0 ;@line 449
            JUMPF ::temp3 label4 ;@line 449
            ARRAYCREATE ::temp7 3 ;@line 450
            ASSIGN r ::temp7 ;@line 450
            ARRAYSETELEMENT r 0 x ;@line 451
            ARRAYSETELEMENT r 1 y ;@line 452
            ARRAYSETELEMENT r 2 z ;@line 453
            RETURN r ;@line 454
            JUMP label4 ;@line 449
            label4:
            ISUBTRACT ::temp4 y 1 ;@line 456
            ASSIGN y ::temp4 ;@line 456
            JUMP label5 ;@line 445
            label3:
            ISUBTRACT ::temp4 x 1 ;@line 458
            ASSIGN x ::temp4 ;@line 458
            ASSIGN y yBase ;@line 459
            JUMP label6 ;@line 443
            label2:
            CAST ::temp7 None ;@line 462
            RETURN ::temp7 ;@line 462
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
            STRUCTGET ::temp0 arr levels ;@line 466
            ASSIGN i ::temp0 ;@line 466
            COMPAREEQ ::temp1 i 3 ;@line 470
            JUMPF ::temp1 label0 ;@line 470
            IDIVIDE ::temp0 index 16384 ;@line 471
            ASSIGN x ::temp0 ;@line 471
            IDIVIDE ::temp0 index 128 ;@line 472
            IMOD ::temp0 ::temp0 128 ;@line 472
            ASSIGN y ::temp0 ;@line 472
            IMOD ::temp0 index 128 ;@line 473
            ASSIGN z ::temp0 ;@line 473
            STRUCTGET ::temp2 arr a ;@line 474
            STRUCTGET ::temp3 ::temp2 a ;@line 474
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 474
            STRUCTGET ::temp3 ::temp2 a ;@line 474
            ARRAYGETELEMENT ::temp2 ::temp3 y ;@line 474
            STRUCTGET ::temp4 ::temp2 e ;@line 474
            ARRAYSETELEMENT ::temp4 z val ;@line 474
            JUMP label1 ;@line 470
            label0:
            COMPAREEQ ::temp1 i 2 ;@line 475
            JUMPF ::temp1 label2 ;@line 470
            IDIVIDE ::temp0 index 128 ;@line 476
            ASSIGN x ::temp0 ;@line 476
            IMOD ::temp0 index 128 ;@line 477
            ASSIGN y ::temp0 ;@line 477
            STRUCTGET ::temp2 arr a ;@line 478
            STRUCTGET ::temp3 ::temp2 a ;@line 478
            ARRAYGETELEMENT ::temp2 ::temp3 x ;@line 478
            STRUCTGET ::temp4 ::temp2 e ;@line 478
            ARRAYSETELEMENT ::temp4 y val ;@line 478
            JUMP label1 ;@line 470
            label2:
            STRUCTGET ::temp2 arr a ;@line 480
            STRUCTGET ::temp4 ::temp2 e ;@line 480
            ARRAYSETELEMENT ::temp4 index val ;@line 480
            label1:
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
            ARRAYCREATE ::temp0 x ;@line 487
            ASSIGN vx ::temp0 ;@line 487
            CAST ::temp1 init ;@line 489
            COMPAREEQ ::temp2 ::temp1 "None" ;@line 489
            JUMPF ::temp2 label0 ;@line 489
            ASSIGN i 0 ;@line 490
            ISUBTRACT ::temp4 x 1 ;@line 490
            ASSIGN ::temp3 ::temp4 ;@line 490
            label2:
            COMPARELTE ::temp2 i ::temp3 ;@line 490
            JUMPF ::temp2 label1 ;@line 490
            STRUCTCREATE ::temp5 ;@line 491
            ARRAYSETELEMENT vx i ::temp5 ;@line 491
            ARRAYCREATE ::temp6 y ;@line 492
            ASSIGN vy ::temp6 ;@line 492
            ARRAYGETELEMENT ::temp5 vx i ;@line 493
            STRUCTSET ::temp5 e vy ;@line 493
            IADD i i 1 ;@line 490
            JUMP label2 ;@line 490
            label1:
            JUMP label3 ;@line 489
            label0:
            ASSIGN ::mangled_i_0 0 ;@line 496
            ISUBTRACT ::temp4 x 1 ;@line 496
            ASSIGN ::temp3 ::temp4 ;@line 496
            label6:
            COMPARELTE ::temp2 ::mangled_i_0 ::temp3 ;@line 496
            JUMPF ::temp2 label3 ;@line 496
            STRUCTCREATE ::temp5 ;@line 497
            ARRAYSETELEMENT vx ::mangled_i_0 ::temp5 ;@line 497
            ARRAYCREATE ::temp6 y ;@line 498
            ASSIGN ::mangled_vy_0 ::temp6 ;@line 498
            ARRAYGETELEMENT ::temp5 vx ::mangled_i_0 ;@line 499
            STRUCTSET ::temp5 e ::mangled_vy_0 ;@line 499
            ASSIGN j 0 ;@line 500
            ISUBTRACT ::temp7 y 1 ;@line 500
            ASSIGN ::temp4 ::temp7 ;@line 500
            label5:
            COMPARELTE ::temp2 j ::temp4 ;@line 500
            JUMPF ::temp2 label4 ;@line 500
            ARRAYSETELEMENT ::mangled_vy_0 j init ;@line 501
            IADD j j 1 ;@line 500
            JUMP label5 ;@line 500
            label4:
            IADD ::mangled_i_0 ::mangled_i_0 1 ;@line 496
            JUMP label6 ;@line 496
            label3:
            RETURN vx ;@line 506
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
            STRUCTCREATE ::temp0 ;@line 512
            ASSIGN arr ::temp0 ;@line 512
            STRUCTCREATE ::temp1 ;@line 513
            ASSIGN v ::temp1 ;@line 513
            CALLSTATIC advarraylib Getv2D ::temp2 x y init ;@line 514
            STRUCTSET v a ::temp2 ;@line 514
            STRUCTSET arr a v ;@line 515
            IMULTIPLY ::temp3 x y ;@line 516
            STRUCTSET arr size ::temp3 ;@line 516
            STRUCTSET arr levels 2 ;@line 517
            RETURN arr ;@line 518
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
            STRUCTGET ::temp0 arr a ;@line 522
            STRUCTGET ::temp1 ::temp0 a ;@line 522
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 522
            STRUCTGET ::temp2 ::temp0 e ;@line 522
            ARRAYSETELEMENT ::temp2 y val ;@line 522
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
            STRUCTGET ::temp0 arr a ;@line 526
            STRUCTGET ::temp1 ::temp0 a ;@line 526
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 526
            STRUCTGET ::temp2 ::temp0 e ;@line 526
            ARRAYGETELEMENT ::temp3 ::temp2 y ;@line 526
            RETURN ::temp3 ;@line 526
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
            ARRAYCREATE ::temp0 x ;@line 532
            ASSIGN vx ::temp0 ;@line 532
            CAST ::temp1 init ;@line 534
            COMPAREEQ ::temp2 ::temp1 "None" ;@line 534
            JUMPF ::temp2 label0 ;@line 534
            ASSIGN i 0 ;@line 535
            ISUBTRACT ::temp4 x 1 ;@line 535
            ASSIGN ::temp3 ::temp4 ;@line 535
            label4:
            COMPARELTE ::temp2 i ::temp3 ;@line 535
            JUMPF ::temp2 label1 ;@line 535
            STRUCTCREATE ::temp5 ;@line 536
            ARRAYSETELEMENT vx i ::temp5 ;@line 536
            ARRAYCREATE ::temp0 y ;@line 537
            ASSIGN vy ::temp0 ;@line 537
            ARRAYGETELEMENT ::temp5 vx i ;@line 538
            STRUCTSET ::temp5 a vy ;@line 538
            ASSIGN j 0 ;@line 539
            ISUBTRACT ::temp6 y 1 ;@line 539
            ASSIGN ::temp4 ::temp6 ;@line 539
            label3:
            COMPARELTE ::temp2 j ::temp4 ;@line 539
            JUMPF ::temp2 label2 ;@line 539
            STRUCTCREATE ::temp5 ;@line 540
            ARRAYSETELEMENT vy j ::temp5 ;@line 540
            ARRAYCREATE ::temp7 z ;@line 541
            ASSIGN vz ::temp7 ;@line 541
            ARRAYGETELEMENT ::temp5 vy j ;@line 542
            STRUCTSET ::temp5 e vz ;@line 542
            IADD j j 1 ;@line 539
            JUMP label3 ;@line 539
            label2:
            IADD i i 1 ;@line 535
            JUMP label4 ;@line 535
            label1:
            JUMP label5 ;@line 534
            label0:
            ASSIGN ::mangled_i_0 0 ;@line 546
            ISUBTRACT ::temp4 x 1 ;@line 546
            ASSIGN ::temp3 ::temp4 ;@line 546
            label10:
            COMPARELTE ::temp2 ::mangled_i_0 ::temp3 ;@line 546
            JUMPF ::temp2 label5 ;@line 546
            STRUCTCREATE ::temp5 ;@line 547
            ARRAYSETELEMENT vx ::mangled_i_0 ::temp5 ;@line 547
            ARRAYCREATE ::temp0 y ;@line 548
            ASSIGN ::mangled_vy_0 ::temp0 ;@line 548
            ARRAYGETELEMENT ::temp5 vx ::mangled_i_0 ;@line 549
            STRUCTSET ::temp5 a ::mangled_vy_0 ;@line 549
            ASSIGN ::mangled_j_0 0 ;@line 550
            ISUBTRACT ::temp6 y 1 ;@line 550
            ASSIGN ::temp4 ::temp6 ;@line 550
            label9:
            COMPARELTE ::temp2 ::mangled_j_0 ::temp4 ;@line 550
            JUMPF ::temp2 label6 ;@line 550
            STRUCTCREATE ::temp5 ;@line 551
            ARRAYSETELEMENT ::mangled_vy_0 ::mangled_j_0 ::temp5 ;@line 551
            ARRAYCREATE ::temp7 z ;@line 552
            ASSIGN ::mangled_vz_0 ::temp7 ;@line 552
            ARRAYGETELEMENT ::temp5 ::mangled_vy_0 ::mangled_j_0 ;@line 553
            STRUCTSET ::temp5 e ::mangled_vz_0 ;@line 553
            ASSIGN k 0 ;@line 554
            ISUBTRACT ::temp8 z 1 ;@line 554
            ASSIGN ::temp6 ::temp8 ;@line 554
            label8:
            COMPARELTE ::temp2 k ::temp6 ;@line 554
            JUMPF ::temp2 label7 ;@line 554
            ARRAYSETELEMENT ::mangled_vz_0 k init ;@line 555
            IADD k k 1 ;@line 554
            JUMP label8 ;@line 554
            label7:
            IADD ::mangled_j_0 ::mangled_j_0 1 ;@line 550
            JUMP label9 ;@line 550
            label6:
            IADD ::mangled_i_0 ::mangled_i_0 1 ;@line 546
            JUMP label10 ;@line 546
            label5:
            RETURN vx ;@line 561
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
            STRUCTCREATE ::temp0 ;@line 567
            ASSIGN arr ::temp0 ;@line 567
            STRUCTCREATE ::temp1 ;@line 568
            ASSIGN v ::temp1 ;@line 568
            CALLSTATIC advarraylib Getv3D ::temp2 x y z init ;@line 569
            STRUCTSET v a ::temp2 ;@line 569
            STRUCTSET arr a v ;@line 570
            IMULTIPLY ::temp3 x y ;@line 571
            IMULTIPLY ::temp3 ::temp3 z ;@line 571
            STRUCTSET arr size ::temp3 ;@line 571
            STRUCTSET arr levels 3 ;@line 572
            RETURN arr ;@line 573
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
            STRUCTGET ::temp0 arr a ;@line 577
            STRUCTGET ::temp1 ::temp0 a ;@line 577
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 577
            STRUCTGET ::temp1 ::temp0 a ;@line 577
            ARRAYGETELEMENT ::temp0 ::temp1 y ;@line 577
            STRUCTGET ::temp2 ::temp0 e ;@line 577
            ARRAYSETELEMENT ::temp2 z val ;@line 577
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
            STRUCTGET ::temp0 arr a ;@line 581
            STRUCTGET ::temp1 ::temp0 a ;@line 581
            ARRAYGETELEMENT ::temp0 ::temp1 x ;@line 581
            STRUCTGET ::temp1 ::temp0 a ;@line 581
            ARRAYGETELEMENT ::temp0 ::temp1 y ;@line 581
            STRUCTGET ::temp2 ::temp0 e ;@line 581
            ARRAYGETELEMENT ::temp3 ::temp2 z ;@line 581
            RETURN ::temp3 ;@line 581
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
            CALLMETHOD CallFunction obj ::temp0 asFuncName aParams ;@line 601
            CAST ::temp1 ::temp0 ;@line 601
            RETURN ::temp1 ;@line 601
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
            CALLSTATIC utility CallGlobalFunction ::temp0 asScriptName asFuncName aParams ;@line 616
            CAST ::temp1 ::temp0 ;@line 616
            RETURN ::temp1 ;@line 616
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
            CAST ::temp0 v ;@line 621
            RETURN ::temp0 ;@line 621
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
            STRUCTCREATE ::temp0 ;@line 627
            ASSIGN vS ::temp0 ;@line 627
            STRUCTSET vS e v ;@line 628
            ARRAYCREATE ::temp1 1 ;@line 629
            ASSIGN args ::temp1 ;@line 629
            CAST ::temp2 vS ;@line 630
            ARRAYSETELEMENT args 0 ::temp2 ;@line 630
            CALLSTATIC utility CallGlobalFunction ::temp2 "AdvArrayLib" "VarArrayToVarPRIVATE" args ;@line 632
            RETURN ::temp2 ;@line 632
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
            STRUCTGET ::temp0 v e ;@line 636
            RETURN ::temp0 ;@line 636
          .endCode
        .endFunction
      .endState
    .endStateTable
  .endObject
.endObjectTable
