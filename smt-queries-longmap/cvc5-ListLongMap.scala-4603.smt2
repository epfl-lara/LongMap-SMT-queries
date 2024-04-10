; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64192 () Bool)

(assert start!64192)

(declare-fun b!720995 () Bool)

(declare-fun res!483088 () Bool)

(declare-fun e!404319 () Bool)

(assert (=> b!720995 (=> (not res!483088) (not e!404319))))

(declare-datatypes ((array!40830 0))(
  ( (array!40831 (arr!19539 (Array (_ BitVec 32) (_ BitVec 64))) (size!19960 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40830)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!720995 (= res!483088 (and (= (size!19960 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19960 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19960 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720996 () Bool)

(declare-fun e!404317 () Bool)

(declare-fun e!404318 () Bool)

(assert (=> b!720996 (= e!404317 e!404318)))

(declare-fun res!483083 () Bool)

(assert (=> b!720996 (=> (not res!483083) (not e!404318))))

(declare-datatypes ((SeekEntryResult!7139 0))(
  ( (MissingZero!7139 (index!30924 (_ BitVec 32))) (Found!7139 (index!30925 (_ BitVec 32))) (Intermediate!7139 (undefined!7951 Bool) (index!30926 (_ BitVec 32)) (x!61931 (_ BitVec 32))) (Undefined!7139) (MissingVacant!7139 (index!30927 (_ BitVec 32))) )
))
(declare-fun lt!319935 () SeekEntryResult!7139)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40830 (_ BitVec 32)) SeekEntryResult!7139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720996 (= res!483083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19539 a!3186) j!159) mask!3328) (select (arr!19539 a!3186) j!159) a!3186 mask!3328) lt!319935))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720996 (= lt!319935 (Intermediate!7139 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720997 () Bool)

(declare-fun lt!319937 () (_ BitVec 32))

(assert (=> b!720997 (= e!404318 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319937 #b00000000000000000000000000000000) (bvsge lt!319937 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!720997 (= lt!319937 (toIndex!0 (select (store (arr!19539 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!720998 () Bool)

(declare-fun res!483086 () Bool)

(assert (=> b!720998 (=> (not res!483086) (not e!404317))))

(declare-datatypes ((List!13541 0))(
  ( (Nil!13538) (Cons!13537 (h!14588 (_ BitVec 64)) (t!19856 List!13541)) )
))
(declare-fun arrayNoDuplicates!0 (array!40830 (_ BitVec 32) List!13541) Bool)

(assert (=> b!720998 (= res!483086 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13538))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!720999 () Bool)

(declare-fun e!404321 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40830 (_ BitVec 32)) SeekEntryResult!7139)

(assert (=> b!720999 (= e!404321 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19539 a!3186) j!159) a!3186 mask!3328) (Found!7139 j!159)))))

(declare-fun b!721000 () Bool)

(declare-fun res!483084 () Bool)

(assert (=> b!721000 (=> (not res!483084) (not e!404318))))

(assert (=> b!721000 (= res!483084 e!404321)))

(declare-fun c!79327 () Bool)

(assert (=> b!721000 (= c!79327 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!483091 () Bool)

(assert (=> start!64192 (=> (not res!483091) (not e!404319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64192 (= res!483091 (validMask!0 mask!3328))))

(assert (=> start!64192 e!404319))

(assert (=> start!64192 true))

(declare-fun array_inv!15335 (array!40830) Bool)

(assert (=> start!64192 (array_inv!15335 a!3186)))

(declare-fun b!721001 () Bool)

(declare-fun res!483085 () Bool)

(assert (=> b!721001 (=> (not res!483085) (not e!404319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721001 (= res!483085 (validKeyInArray!0 k!2102))))

(declare-fun b!721002 () Bool)

(declare-fun res!483087 () Bool)

(assert (=> b!721002 (=> (not res!483087) (not e!404319))))

(assert (=> b!721002 (= res!483087 (validKeyInArray!0 (select (arr!19539 a!3186) j!159)))))

(declare-fun b!721003 () Bool)

(declare-fun res!483081 () Bool)

(assert (=> b!721003 (=> (not res!483081) (not e!404318))))

(assert (=> b!721003 (= res!483081 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19539 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721004 () Bool)

(assert (=> b!721004 (= e!404321 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19539 a!3186) j!159) a!3186 mask!3328) lt!319935))))

(declare-fun b!721005 () Bool)

(declare-fun res!483092 () Bool)

(assert (=> b!721005 (=> (not res!483092) (not e!404317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40830 (_ BitVec 32)) Bool)

(assert (=> b!721005 (= res!483092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721006 () Bool)

(declare-fun res!483082 () Bool)

(assert (=> b!721006 (=> (not res!483082) (not e!404319))))

(declare-fun arrayContainsKey!0 (array!40830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721006 (= res!483082 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721007 () Bool)

(assert (=> b!721007 (= e!404319 e!404317)))

(declare-fun res!483089 () Bool)

(assert (=> b!721007 (=> (not res!483089) (not e!404317))))

(declare-fun lt!319936 () SeekEntryResult!7139)

(assert (=> b!721007 (= res!483089 (or (= lt!319936 (MissingZero!7139 i!1173)) (= lt!319936 (MissingVacant!7139 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40830 (_ BitVec 32)) SeekEntryResult!7139)

(assert (=> b!721007 (= lt!319936 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721008 () Bool)

(declare-fun res!483090 () Bool)

(assert (=> b!721008 (=> (not res!483090) (not e!404317))))

(assert (=> b!721008 (= res!483090 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19960 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19960 a!3186))))))

(assert (= (and start!64192 res!483091) b!720995))

(assert (= (and b!720995 res!483088) b!721002))

(assert (= (and b!721002 res!483087) b!721001))

(assert (= (and b!721001 res!483085) b!721006))

(assert (= (and b!721006 res!483082) b!721007))

(assert (= (and b!721007 res!483089) b!721005))

(assert (= (and b!721005 res!483092) b!720998))

(assert (= (and b!720998 res!483086) b!721008))

(assert (= (and b!721008 res!483090) b!720996))

(assert (= (and b!720996 res!483083) b!721003))

(assert (= (and b!721003 res!483081) b!721000))

(assert (= (and b!721000 c!79327) b!721004))

(assert (= (and b!721000 (not c!79327)) b!720999))

(assert (= (and b!721000 res!483084) b!720997))

(declare-fun m!675967 () Bool)

(assert (=> b!721001 m!675967))

(declare-fun m!675969 () Bool)

(assert (=> b!720999 m!675969))

(assert (=> b!720999 m!675969))

(declare-fun m!675971 () Bool)

(assert (=> b!720999 m!675971))

(declare-fun m!675973 () Bool)

(assert (=> b!721005 m!675973))

(assert (=> b!721002 m!675969))

(assert (=> b!721002 m!675969))

(declare-fun m!675975 () Bool)

(assert (=> b!721002 m!675975))

(assert (=> b!720996 m!675969))

(assert (=> b!720996 m!675969))

(declare-fun m!675977 () Bool)

(assert (=> b!720996 m!675977))

(assert (=> b!720996 m!675977))

(assert (=> b!720996 m!675969))

(declare-fun m!675979 () Bool)

(assert (=> b!720996 m!675979))

(declare-fun m!675981 () Bool)

(assert (=> b!721006 m!675981))

(declare-fun m!675983 () Bool)

(assert (=> b!721007 m!675983))

(declare-fun m!675985 () Bool)

(assert (=> b!720997 m!675985))

(declare-fun m!675987 () Bool)

(assert (=> b!720997 m!675987))

(assert (=> b!720997 m!675987))

(declare-fun m!675989 () Bool)

(assert (=> b!720997 m!675989))

(declare-fun m!675991 () Bool)

(assert (=> b!720998 m!675991))

(declare-fun m!675993 () Bool)

(assert (=> b!721003 m!675993))

(declare-fun m!675995 () Bool)

(assert (=> start!64192 m!675995))

(declare-fun m!675997 () Bool)

(assert (=> start!64192 m!675997))

(assert (=> b!721004 m!675969))

(assert (=> b!721004 m!675969))

(declare-fun m!675999 () Bool)

(assert (=> b!721004 m!675999))

(push 1)

(assert (not b!720997))

(assert (not b!721007))

(assert (not b!721002))

(assert (not b!721001))

(assert (not b!720999))

(assert (not b!720996))

(assert (not start!64192))

(assert (not b!721006))

(assert (not b!721004))

(assert (not b!720998))

(assert (not b!721005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99187 () Bool)

(declare-fun res!483169 () Bool)

(declare-fun e!404356 () Bool)

(assert (=> d!99187 (=> res!483169 e!404356)))

(assert (=> d!99187 (= res!483169 (= (select (arr!19539 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99187 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!404356)))

(declare-fun b!721097 () Bool)

(declare-fun e!404357 () Bool)

(assert (=> b!721097 (= e!404356 e!404357)))

(declare-fun res!483170 () Bool)

(assert (=> b!721097 (=> (not res!483170) (not e!404357))))

(assert (=> b!721097 (= res!483170 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19960 a!3186)))))

(declare-fun b!721098 () Bool)

(assert (=> b!721098 (= e!404357 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99187 (not res!483169)) b!721097))

(assert (= (and b!721097 res!483170) b!721098))

(declare-fun m!676069 () Bool)

(assert (=> d!99187 m!676069))

(declare-fun m!676071 () Bool)

(assert (=> b!721098 m!676071))

(assert (=> b!721006 d!99187))

(declare-fun bm!34767 () Bool)

(declare-fun call!34770 () Bool)

(assert (=> bm!34767 (= call!34770 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!721125 () Bool)

(declare-fun e!404374 () Bool)

(declare-fun e!404376 () Bool)

(assert (=> b!721125 (= e!404374 e!404376)))

(declare-fun c!79342 () Bool)

(assert (=> b!721125 (= c!79342 (validKeyInArray!0 (select (arr!19539 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721127 () Bool)

(assert (=> b!721127 (= e!404376 call!34770)))

(declare-fun b!721128 () Bool)

(declare-fun e!404375 () Bool)

(assert (=> b!721128 (= e!404376 e!404375)))

(declare-fun lt!319967 () (_ BitVec 64))

(assert (=> b!721128 (= lt!319967 (select (arr!19539 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24674 0))(
  ( (Unit!24675) )
))
(declare-fun lt!319968 () Unit!24674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40830 (_ BitVec 64) (_ BitVec 32)) Unit!24674)

(assert (=> b!721128 (= lt!319968 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319967 #b00000000000000000000000000000000))))

(assert (=> b!721128 (arrayContainsKey!0 a!3186 lt!319967 #b00000000000000000000000000000000)))

(declare-fun lt!319966 () Unit!24674)

(assert (=> b!721128 (= lt!319966 lt!319968)))

(declare-fun res!483181 () Bool)

(assert (=> b!721128 (= res!483181 (= (seekEntryOrOpen!0 (select (arr!19539 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7139 #b00000000000000000000000000000000)))))

(assert (=> b!721128 (=> (not res!483181) (not e!404375))))

(declare-fun b!721126 () Bool)

(assert (=> b!721126 (= e!404375 call!34770)))

(declare-fun d!99189 () Bool)

(declare-fun res!483182 () Bool)

(assert (=> d!99189 (=> res!483182 e!404374)))

(assert (=> d!99189 (= res!483182 (bvsge #b00000000000000000000000000000000 (size!19960 a!3186)))))

(assert (=> d!99189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!404374)))

(assert (= (and d!99189 (not res!483182)) b!721125))

(assert (= (and b!721125 c!79342) b!721128))

(assert (= (and b!721125 (not c!79342)) b!721127))

(assert (= (and b!721128 res!483181) b!721126))

(assert (= (or b!721126 b!721127) bm!34767))

(declare-fun m!676073 () Bool)

(assert (=> bm!34767 m!676073))

(assert (=> b!721125 m!676069))

(assert (=> b!721125 m!676069))

(declare-fun m!676075 () Bool)

(assert (=> b!721125 m!676075))

(assert (=> b!721128 m!676069))

(declare-fun m!676077 () Bool)

(assert (=> b!721128 m!676077))

(declare-fun m!676079 () Bool)

(assert (=> b!721128 m!676079))

(assert (=> b!721128 m!676069))

(declare-fun m!676081 () Bool)

(assert (=> b!721128 m!676081))

(assert (=> b!721005 d!99189))

(declare-fun b!721198 () Bool)

(declare-fun e!404422 () SeekEntryResult!7139)

(assert (=> b!721198 (= e!404422 Undefined!7139)))

(declare-fun lt!319992 () SeekEntryResult!7139)

(declare-fun e!404421 () SeekEntryResult!7139)

(declare-fun b!721199 () Bool)

(assert (=> b!721199 (= e!404421 (seekKeyOrZeroReturnVacant!0 (x!61931 lt!319992) (index!30926 lt!319992) (index!30926 lt!319992) k!2102 a!3186 mask!3328))))

(declare-fun b!721200 () Bool)

(declare-fun c!79365 () Bool)

(declare-fun lt!319993 () (_ BitVec 64))

(assert (=> b!721200 (= c!79365 (= lt!319993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404423 () SeekEntryResult!7139)

(assert (=> b!721200 (= e!404423 e!404421)))

(declare-fun b!721201 () Bool)

(assert (=> b!721201 (= e!404422 e!404423)))

(assert (=> b!721201 (= lt!319993 (select (arr!19539 a!3186) (index!30926 lt!319992)))))

(declare-fun c!79364 () Bool)

(assert (=> b!721201 (= c!79364 (= lt!319993 k!2102))))

(declare-fun d!99193 () Bool)

(declare-fun lt!319991 () SeekEntryResult!7139)

(assert (=> d!99193 (and (or (is-Undefined!7139 lt!319991) (not (is-Found!7139 lt!319991)) (and (bvsge (index!30925 lt!319991) #b00000000000000000000000000000000) (bvslt (index!30925 lt!319991) (size!19960 a!3186)))) (or (is-Undefined!7139 lt!319991) (is-Found!7139 lt!319991) (not (is-MissingZero!7139 lt!319991)) (and (bvsge (index!30924 lt!319991) #b00000000000000000000000000000000) (bvslt (index!30924 lt!319991) (size!19960 a!3186)))) (or (is-Undefined!7139 lt!319991) (is-Found!7139 lt!319991) (is-MissingZero!7139 lt!319991) (not (is-MissingVacant!7139 lt!319991)) (and (bvsge (index!30927 lt!319991) #b00000000000000000000000000000000) (bvslt (index!30927 lt!319991) (size!19960 a!3186)))) (or (is-Undefined!7139 lt!319991) (ite (is-Found!7139 lt!319991) (= (select (arr!19539 a!3186) (index!30925 lt!319991)) k!2102) (ite (is-MissingZero!7139 lt!319991) (= (select (arr!19539 a!3186) (index!30924 lt!319991)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7139 lt!319991) (= (select (arr!19539 a!3186) (index!30927 lt!319991)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99193 (= lt!319991 e!404422)))

(declare-fun c!79366 () Bool)

(assert (=> d!99193 (= c!79366 (and (is-Intermediate!7139 lt!319992) (undefined!7951 lt!319992)))))

(assert (=> d!99193 (= lt!319992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99193 (validMask!0 mask!3328)))

(assert (=> d!99193 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319991)))

(declare-fun b!721202 () Bool)

(assert (=> b!721202 (= e!404421 (MissingZero!7139 (index!30926 lt!319992)))))

(declare-fun b!721203 () Bool)

(assert (=> b!721203 (= e!404423 (Found!7139 (index!30926 lt!319992)))))

(assert (= (and d!99193 c!79366) b!721198))

(assert (= (and d!99193 (not c!79366)) b!721201))

(assert (= (and b!721201 c!79364) b!721203))

(assert (= (and b!721201 (not c!79364)) b!721200))

(assert (= (and b!721200 c!79365) b!721202))

(assert (= (and b!721200 (not c!79365)) b!721199))

(declare-fun m!676111 () Bool)

(assert (=> b!721199 m!676111))

(declare-fun m!676113 () Bool)

(assert (=> b!721201 m!676113))

(declare-fun m!676115 () Bool)

(assert (=> d!99193 m!676115))

(assert (=> d!99193 m!675995))

(declare-fun m!676117 () Bool)

(assert (=> d!99193 m!676117))

(assert (=> d!99193 m!676115))

(declare-fun m!676119 () Bool)

(assert (=> d!99193 m!676119))

(declare-fun m!676121 () Bool)

(assert (=> d!99193 m!676121))

(declare-fun m!676123 () Bool)

(assert (=> d!99193 m!676123))

(assert (=> b!721007 d!99193))

(declare-fun d!99211 () Bool)

(assert (=> d!99211 (= (validKeyInArray!0 (select (arr!19539 a!3186) j!159)) (and (not (= (select (arr!19539 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19539 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721002 d!99211))

(declare-fun d!99213 () Bool)

(assert (=> d!99213 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721001 d!99213))

(declare-fun b!721252 () Bool)

(declare-fun e!404454 () SeekEntryResult!7139)

(declare-fun e!404456 () SeekEntryResult!7139)

(assert (=> b!721252 (= e!404454 e!404456)))

(declare-fun c!79385 () Bool)

(declare-fun lt!320016 () (_ BitVec 64))

(assert (=> b!721252 (= c!79385 (or (= lt!320016 (select (arr!19539 a!3186) j!159)) (= (bvadd lt!320016 lt!320016) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721253 () Bool)

(assert (=> b!721253 (= e!404456 (Intermediate!7139 false (toIndex!0 (select (arr!19539 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721254 () Bool)

(declare-fun lt!320017 () SeekEntryResult!7139)

(assert (=> b!721254 (and (bvsge (index!30926 lt!320017) #b00000000000000000000000000000000) (bvslt (index!30926 lt!320017) (size!19960 a!3186)))))

(declare-fun res!483223 () Bool)

(assert (=> b!721254 (= res!483223 (= (select (arr!19539 a!3186) (index!30926 lt!320017)) (select (arr!19539 a!3186) j!159)))))

(declare-fun e!404453 () Bool)

(assert (=> b!721254 (=> res!483223 e!404453)))

(declare-fun e!404455 () Bool)

(assert (=> b!721254 (= e!404455 e!404453)))

(declare-fun d!99215 () Bool)

(declare-fun e!404452 () Bool)

(assert (=> d!99215 e!404452))

(declare-fun c!79387 () Bool)

(assert (=> d!99215 (= c!79387 (and (is-Intermediate!7139 lt!320017) (undefined!7951 lt!320017)))))

(assert (=> d!99215 (= lt!320017 e!404454)))

(declare-fun c!79386 () Bool)

(assert (=> d!99215 (= c!79386 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99215 (= lt!320016 (select (arr!19539 a!3186) (toIndex!0 (select (arr!19539 a!3186) j!159) mask!3328)))))

(assert (=> d!99215 (validMask!0 mask!3328)))

(assert (=> d!99215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19539 a!3186) j!159) mask!3328) (select (arr!19539 a!3186) j!159) a!3186 mask!3328) lt!320017)))

(declare-fun b!721255 () Bool)

(assert (=> b!721255 (= e!404452 e!404455)))

(declare-fun res!483225 () Bool)

(assert (=> b!721255 (= res!483225 (and (is-Intermediate!7139 lt!320017) (not (undefined!7951 lt!320017)) (bvslt (x!61931 lt!320017) #b01111111111111111111111111111110) (bvsge (x!61931 lt!320017) #b00000000000000000000000000000000) (bvsge (x!61931 lt!320017) #b00000000000000000000000000000000)))))

(assert (=> b!721255 (=> (not res!483225) (not e!404455))))

(declare-fun b!721256 () Bool)

(assert (=> b!721256 (and (bvsge (index!30926 lt!320017) #b00000000000000000000000000000000) (bvslt (index!30926 lt!320017) (size!19960 a!3186)))))

(declare-fun res!483224 () Bool)

(assert (=> b!721256 (= res!483224 (= (select (arr!19539 a!3186) (index!30926 lt!320017)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721256 (=> res!483224 e!404453)))

(declare-fun b!721257 () Bool)

(assert (=> b!721257 (= e!404452 (bvsge (x!61931 lt!320017) #b01111111111111111111111111111110))))

(declare-fun b!721258 () Bool)

(assert (=> b!721258 (= e!404454 (Intermediate!7139 true (toIndex!0 (select (arr!19539 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721259 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721259 (= e!404456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19539 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19539 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721260 () Bool)

(assert (=> b!721260 (and (bvsge (index!30926 lt!320017) #b00000000000000000000000000000000) (bvslt (index!30926 lt!320017) (size!19960 a!3186)))))

(assert (=> b!721260 (= e!404453 (= (select (arr!19539 a!3186) (index!30926 lt!320017)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!99215 c!79386) b!721258))

(assert (= (and d!99215 (not c!79386)) b!721252))

(assert (= (and b!721252 c!79385) b!721253))

(assert (= (and b!721252 (not c!79385)) b!721259))

(assert (= (and d!99215 c!79387) b!721257))

(assert (= (and d!99215 (not c!79387)) b!721255))

(assert (= (and b!721255 res!483225) b!721254))

(assert (= (and b!721254 (not res!483223)) b!721256))

(assert (= (and b!721256 (not res!483224)) b!721260))

(declare-fun m!676147 () Bool)

(assert (=> b!721260 m!676147))

(assert (=> b!721254 m!676147))

(assert (=> d!99215 m!675977))

(declare-fun m!676149 () Bool)

(assert (=> d!99215 m!676149))

(assert (=> d!99215 m!675995))

(assert (=> b!721259 m!675977))

(declare-fun m!676151 () Bool)

(assert (=> b!721259 m!676151))

(assert (=> b!721259 m!676151))

(assert (=> b!721259 m!675969))

(declare-fun m!676153 () Bool)

(assert (=> b!721259 m!676153))

(assert (=> b!721256 m!676147))

(assert (=> b!720996 d!99215))

(declare-fun d!99225 () Bool)

(declare-fun lt!320023 () (_ BitVec 32))

(declare-fun lt!320022 () (_ BitVec 32))

(assert (=> d!99225 (= lt!320023 (bvmul (bvxor lt!320022 (bvlshr lt!320022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99225 (= lt!320022 ((_ extract 31 0) (bvand (bvxor (select (arr!19539 a!3186) j!159) (bvlshr (select (arr!19539 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99225 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483226 (let ((h!14592 ((_ extract 31 0) (bvand (bvxor (select (arr!19539 a!3186) j!159) (bvlshr (select (arr!19539 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61938 (bvmul (bvxor h!14592 (bvlshr h!14592 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61938 (bvlshr x!61938 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483226 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483226 #b00000000000000000000000000000000))))))

(assert (=> d!99225 (= (toIndex!0 (select (arr!19539 a!3186) j!159) mask!3328) (bvand (bvxor lt!320023 (bvlshr lt!320023 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!720996 d!99225))

(declare-fun b!721301 () Bool)

(declare-fun e!404483 () Bool)

(declare-fun call!34779 () Bool)

(assert (=> b!721301 (= e!404483 call!34779)))

(declare-fun b!721302 () Bool)

(declare-fun e!404482 () Bool)

(assert (=> b!721302 (= e!404482 e!404483)))

(declare-fun c!79405 () Bool)

(assert (=> b!721302 (= c!79405 (validKeyInArray!0 (select (arr!19539 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34776 () Bool)

(assert (=> bm!34776 (= call!34779 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79405 (Cons!13537 (select (arr!19539 a!3186) #b00000000000000000000000000000000) Nil!13538) Nil!13538)))))

(declare-fun b!721303 () Bool)

(declare-fun e!404481 () Bool)

(assert (=> b!721303 (= e!404481 e!404482)))

(declare-fun res!483234 () Bool)

(assert (=> b!721303 (=> (not res!483234) (not e!404482))))

(declare-fun e!404480 () Bool)

(assert (=> b!721303 (= res!483234 (not e!404480))))

(declare-fun res!483235 () Bool)

(assert (=> b!721303 (=> (not res!483235) (not e!404480))))

(assert (=> b!721303 (= res!483235 (validKeyInArray!0 (select (arr!19539 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721304 () Bool)

(assert (=> b!721304 (= e!404483 call!34779)))

(declare-fun b!721305 () Bool)

(declare-fun contains!4044 (List!13541 (_ BitVec 64)) Bool)

(assert (=> b!721305 (= e!404480 (contains!4044 Nil!13538 (select (arr!19539 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99227 () Bool)

(declare-fun res!483233 () Bool)

(assert (=> d!99227 (=> res!483233 e!404481)))

(assert (=> d!99227 (= res!483233 (bvsge #b00000000000000000000000000000000 (size!19960 a!3186)))))

(assert (=> d!99227 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13538) e!404481)))

(assert (= (and d!99227 (not res!483233)) b!721303))

(assert (= (and b!721303 res!483235) b!721305))

(assert (= (and b!721303 res!483234) b!721302))

(assert (= (and b!721302 c!79405) b!721304))

(assert (= (and b!721302 (not c!79405)) b!721301))

(assert (= (or b!721304 b!721301) bm!34776))

(assert (=> b!721302 m!676069))

(assert (=> b!721302 m!676069))

(assert (=> b!721302 m!676075))

(assert (=> bm!34776 m!676069))

(declare-fun m!676161 () Bool)

(assert (=> bm!34776 m!676161))

(assert (=> b!721303 m!676069))

(assert (=> b!721303 m!676069))

(assert (=> b!721303 m!676075))

(assert (=> b!721305 m!676069))

(assert (=> b!721305 m!676069))

(declare-fun m!676163 () Bool)

(assert (=> b!721305 m!676163))

(assert (=> b!720998 d!99227))

(declare-fun d!99231 () Bool)

(declare-fun lt!320035 () (_ BitVec 32))

(declare-fun lt!320034 () (_ BitVec 32))

(assert (=> d!99231 (= lt!320035 (bvmul (bvxor lt!320034 (bvlshr lt!320034 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99231 (= lt!320034 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19539 a!3186) i!1173 k!2102) j!159) (bvlshr (select (store (arr!19539 a!3186) i!1173 k!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99231 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483226 (let ((h!14592 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19539 a!3186) i!1173 k!2102) j!159) (bvlshr (select (store (arr!19539 a!3186) i!1173 k!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61938 (bvmul (bvxor h!14592 (bvlshr h!14592 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61938 (bvlshr x!61938 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483226 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483226 #b00000000000000000000000000000000))))))

(assert (=> d!99231 (= (toIndex!0 (select (store (arr!19539 a!3186) i!1173 k!2102) j!159) mask!3328) (bvand (bvxor lt!320035 (bvlshr lt!320035 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!720997 d!99231))

(declare-fun b!721345 () Bool)

(declare-fun e!404508 () SeekEntryResult!7139)

(assert (=> b!721345 (= e!404508 Undefined!7139)))

(declare-fun b!721346 () Bool)

(declare-fun e!404509 () SeekEntryResult!7139)

(assert (=> b!721346 (= e!404509 (Found!7139 index!1321))))

(declare-fun b!721347 () Bool)

(declare-fun c!79423 () Bool)

(declare-fun lt!320060 () (_ BitVec 64))

(assert (=> b!721347 (= c!79423 (= lt!320060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404507 () SeekEntryResult!7139)

(assert (=> b!721347 (= e!404509 e!404507)))

(declare-fun d!99233 () Bool)

(declare-fun lt!320059 () SeekEntryResult!7139)

(assert (=> d!99233 (and (or (is-Undefined!7139 lt!320059) (not (is-Found!7139 lt!320059)) (and (bvsge (index!30925 lt!320059) #b00000000000000000000000000000000) (bvslt (index!30925 lt!320059) (size!19960 a!3186)))) (or (is-Undefined!7139 lt!320059) (is-Found!7139 lt!320059) (not (is-MissingVacant!7139 lt!320059)) (not (= (index!30927 lt!320059) resIntermediateIndex!5)) (and (bvsge (index!30927 lt!320059) #b00000000000000000000000000000000) (bvslt (index!30927 lt!320059) (size!19960 a!3186)))) (or (is-Undefined!7139 lt!320059) (ite (is-Found!7139 lt!320059) (= (select (arr!19539 a!3186) (index!30925 lt!320059)) (select (arr!19539 a!3186) j!159)) (and (is-MissingVacant!7139 lt!320059) (= (index!30927 lt!320059) resIntermediateIndex!5) (= (select (arr!19539 a!3186) (index!30927 lt!320059)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99233 (= lt!320059 e!404508)))

(declare-fun c!79422 () Bool)

(assert (=> d!99233 (= c!79422 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99233 (= lt!320060 (select (arr!19539 a!3186) index!1321))))

(assert (=> d!99233 (validMask!0 mask!3328)))

(assert (=> d!99233 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19539 a!3186) j!159) a!3186 mask!3328) lt!320059)))

(declare-fun b!721348 () Bool)

(assert (=> b!721348 (= e!404507 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19539 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721349 () Bool)

(assert (=> b!721349 (= e!404507 (MissingVacant!7139 resIntermediateIndex!5))))

(declare-fun b!721350 () Bool)

(assert (=> b!721350 (= e!404508 e!404509)))

(declare-fun c!79421 () Bool)

(assert (=> b!721350 (= c!79421 (= lt!320060 (select (arr!19539 a!3186) j!159)))))

(assert (= (and d!99233 c!79422) b!721345))

(assert (= (and d!99233 (not c!79422)) b!721350))

(assert (= (and b!721350 c!79421) b!721346))

(assert (= (and b!721350 (not c!79421)) b!721347))

(assert (= (and b!721347 c!79423) b!721349))

(assert (= (and b!721347 (not c!79423)) b!721348))

(declare-fun m!676189 () Bool)

(assert (=> d!99233 m!676189))

(declare-fun m!676191 () Bool)

(assert (=> d!99233 m!676191))

(declare-fun m!676193 () Bool)

(assert (=> d!99233 m!676193))

(assert (=> d!99233 m!675995))

(declare-fun m!676195 () Bool)

(assert (=> b!721348 m!676195))

(assert (=> b!721348 m!676195))

(assert (=> b!721348 m!675969))

(declare-fun m!676197 () Bool)

(assert (=> b!721348 m!676197))

(assert (=> b!720999 d!99233))

(declare-fun d!99245 () Bool)

(assert (=> d!99245 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64192 d!99245))

(declare-fun d!99251 () Bool)

(assert (=> d!99251 (= (array_inv!15335 a!3186) (bvsge (size!19960 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64192 d!99251))

(declare-fun b!721399 () Bool)

(declare-fun e!404544 () SeekEntryResult!7139)

(declare-fun e!404546 () SeekEntryResult!7139)

(assert (=> b!721399 (= e!404544 e!404546)))

(declare-fun c!79439 () Bool)

(declare-fun lt!320072 () (_ BitVec 64))

(assert (=> b!721399 (= c!79439 (or (= lt!320072 (select (arr!19539 a!3186) j!159)) (= (bvadd lt!320072 lt!320072) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721400 () Bool)

(assert (=> b!721400 (= e!404546 (Intermediate!7139 false index!1321 x!1131))))

(declare-fun b!721401 () Bool)

(declare-fun lt!320073 () SeekEntryResult!7139)

(assert (=> b!721401 (and (bvsge (index!30926 lt!320073) #b00000000000000000000000000000000) (bvslt (index!30926 lt!320073) (size!19960 a!3186)))))

(declare-fun res!483264 () Bool)

(assert (=> b!721401 (= res!483264 (= (select (arr!19539 a!3186) (index!30926 lt!320073)) (select (arr!19539 a!3186) j!159)))))

(declare-fun e!404543 () Bool)

(assert (=> b!721401 (=> res!483264 e!404543)))

(declare-fun e!404545 () Bool)

(assert (=> b!721401 (= e!404545 e!404543)))

(declare-fun d!99253 () Bool)

(declare-fun e!404542 () Bool)

(assert (=> d!99253 e!404542))

(declare-fun c!79441 () Bool)

(assert (=> d!99253 (= c!79441 (and (is-Intermediate!7139 lt!320073) (undefined!7951 lt!320073)))))

(assert (=> d!99253 (= lt!320073 e!404544)))

(declare-fun c!79440 () Bool)

(assert (=> d!99253 (= c!79440 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99253 (= lt!320072 (select (arr!19539 a!3186) index!1321))))

(assert (=> d!99253 (validMask!0 mask!3328)))

(assert (=> d!99253 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19539 a!3186) j!159) a!3186 mask!3328) lt!320073)))

(declare-fun b!721402 () Bool)

(assert (=> b!721402 (= e!404542 e!404545)))

(declare-fun res!483266 () Bool)

(assert (=> b!721402 (= res!483266 (and (is-Intermediate!7139 lt!320073) (not (undefined!7951 lt!320073)) (bvslt (x!61931 lt!320073) #b01111111111111111111111111111110) (bvsge (x!61931 lt!320073) #b00000000000000000000000000000000) (bvsge (x!61931 lt!320073) x!1131)))))

(assert (=> b!721402 (=> (not res!483266) (not e!404545))))

(declare-fun b!721403 () Bool)

(assert (=> b!721403 (and (bvsge (index!30926 lt!320073) #b00000000000000000000000000000000) (bvslt (index!30926 lt!320073) (size!19960 a!3186)))))

(declare-fun res!483265 () Bool)

(assert (=> b!721403 (= res!483265 (= (select (arr!19539 a!3186) (index!30926 lt!320073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721403 (=> res!483265 e!404543)))

(declare-fun b!721404 () Bool)

(assert (=> b!721404 (= e!404542 (bvsge (x!61931 lt!320073) #b01111111111111111111111111111110))))

(declare-fun b!721405 () Bool)

(assert (=> b!721405 (= e!404544 (Intermediate!7139 true index!1321 x!1131))))

(declare-fun b!721406 () Bool)

(assert (=> b!721406 (= e!404546 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19539 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721407 () Bool)

(assert (=> b!721407 (and (bvsge (index!30926 lt!320073) #b00000000000000000000000000000000) (bvslt (index!30926 lt!320073) (size!19960 a!3186)))))

(assert (=> b!721407 (= e!404543 (= (select (arr!19539 a!3186) (index!30926 lt!320073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!99253 c!79440) b!721405))

(assert (= (and d!99253 (not c!79440)) b!721399))

(assert (= (and b!721399 c!79439) b!721400))

(assert (= (and b!721399 (not c!79439)) b!721406))

(assert (= (and d!99253 c!79441) b!721404))

(assert (= (and d!99253 (not c!79441)) b!721402))

(assert (= (and b!721402 res!483266) b!721401))

(assert (= (and b!721401 (not res!483264)) b!721403))

(assert (= (and b!721403 (not res!483265)) b!721407))

(declare-fun m!676227 () Bool)

(assert (=> b!721407 m!676227))

(assert (=> b!721401 m!676227))

(assert (=> d!99253 m!676193))

(assert (=> d!99253 m!675995))

(assert (=> b!721406 m!676195))

(assert (=> b!721406 m!676195))

(assert (=> b!721406 m!675969))

(declare-fun m!676229 () Bool)

(assert (=> b!721406 m!676229))

(assert (=> b!721403 m!676227))

(assert (=> b!721004 d!99253))

(push 1)

(assert (not d!99215))

(assert (not b!721125))

(assert (not d!99193))

(assert (not b!721128))

(assert (not d!99253))

(assert (not b!721303))

(assert (not bm!34767))

(assert (not b!721406))

(assert (not bm!34776))

(assert (not b!721199))

(assert (not b!721302))

(assert (not b!721259))

(assert (not b!721305))

(assert (not b!721348))

(assert (not d!99233))

(assert (not b!721098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

