; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65500 () Bool)

(assert start!65500)

(declare-fun b!746965 () Bool)

(declare-fun e!417102 () Bool)

(declare-fun e!417109 () Bool)

(assert (=> b!746965 (= e!417102 e!417109)))

(declare-fun res!503683 () Bool)

(assert (=> b!746965 (=> (not res!503683) (not e!417109))))

(declare-datatypes ((SeekEntryResult!7550 0))(
  ( (MissingZero!7550 (index!32568 (_ BitVec 32))) (Found!7550 (index!32569 (_ BitVec 32))) (Intermediate!7550 (undefined!8362 Bool) (index!32570 (_ BitVec 32)) (x!63516 (_ BitVec 32))) (Undefined!7550) (MissingVacant!7550 (index!32571 (_ BitVec 32))) )
))
(declare-fun lt!332010 () SeekEntryResult!7550)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746965 (= res!503683 (or (= lt!332010 (MissingZero!7550 i!1173)) (= lt!332010 (MissingVacant!7550 i!1173))))))

(declare-datatypes ((array!41673 0))(
  ( (array!41674 (arr!19950 (Array (_ BitVec 32) (_ BitVec 64))) (size!20371 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41673)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41673 (_ BitVec 32)) SeekEntryResult!7550)

(assert (=> b!746965 (= lt!332010 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746966 () Bool)

(declare-fun res!503669 () Bool)

(assert (=> b!746966 (=> (not res!503669) (not e!417102))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746966 (= res!503669 (validKeyInArray!0 (select (arr!19950 a!3186) j!159)))))

(declare-fun b!746967 () Bool)

(declare-datatypes ((Unit!25580 0))(
  ( (Unit!25581) )
))
(declare-fun e!417103 () Unit!25580)

(declare-fun Unit!25582 () Unit!25580)

(assert (=> b!746967 (= e!417103 Unit!25582)))

(declare-fun b!746968 () Bool)

(declare-fun res!503674 () Bool)

(assert (=> b!746968 (=> (not res!503674) (not e!417109))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746968 (= res!503674 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20371 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20371 a!3186))))))

(declare-fun b!746969 () Bool)

(declare-fun res!503681 () Bool)

(assert (=> b!746969 (=> (not res!503681) (not e!417102))))

(assert (=> b!746969 (= res!503681 (validKeyInArray!0 k!2102))))

(declare-fun b!746970 () Bool)

(declare-fun e!417107 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41673 (_ BitVec 32)) SeekEntryResult!7550)

(assert (=> b!746970 (= e!417107 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19950 a!3186) j!159) a!3186 mask!3328) (Found!7550 j!159)))))

(declare-fun b!746971 () Bool)

(declare-fun res!503671 () Bool)

(assert (=> b!746971 (=> (not res!503671) (not e!417102))))

(assert (=> b!746971 (= res!503671 (and (= (size!20371 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20371 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20371 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!503668 () Bool)

(assert (=> start!65500 (=> (not res!503668) (not e!417102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65500 (= res!503668 (validMask!0 mask!3328))))

(assert (=> start!65500 e!417102))

(assert (=> start!65500 true))

(declare-fun array_inv!15746 (array!41673) Bool)

(assert (=> start!65500 (array_inv!15746 a!3186)))

(declare-fun b!746972 () Bool)

(declare-fun e!417110 () Bool)

(assert (=> b!746972 (= e!417109 e!417110)))

(declare-fun res!503673 () Bool)

(assert (=> b!746972 (=> (not res!503673) (not e!417110))))

(declare-fun lt!332012 () SeekEntryResult!7550)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41673 (_ BitVec 32)) SeekEntryResult!7550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746972 (= res!503673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19950 a!3186) j!159) mask!3328) (select (arr!19950 a!3186) j!159) a!3186 mask!3328) lt!332012))))

(assert (=> b!746972 (= lt!332012 (Intermediate!7550 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746973 () Bool)

(declare-fun e!417105 () Bool)

(assert (=> b!746973 (= e!417110 e!417105)))

(declare-fun res!503679 () Bool)

(assert (=> b!746973 (=> (not res!503679) (not e!417105))))

(declare-fun lt!332015 () SeekEntryResult!7550)

(declare-fun lt!332011 () SeekEntryResult!7550)

(assert (=> b!746973 (= res!503679 (= lt!332015 lt!332011))))

(declare-fun lt!332007 () (_ BitVec 64))

(declare-fun lt!332006 () array!41673)

(assert (=> b!746973 (= lt!332011 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332007 lt!332006 mask!3328))))

(assert (=> b!746973 (= lt!332015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332007 mask!3328) lt!332007 lt!332006 mask!3328))))

(assert (=> b!746973 (= lt!332007 (select (store (arr!19950 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746973 (= lt!332006 (array!41674 (store (arr!19950 a!3186) i!1173 k!2102) (size!20371 a!3186)))))

(declare-fun b!746974 () Bool)

(declare-fun e!417108 () Bool)

(assert (=> b!746974 (= e!417105 (not e!417108))))

(declare-fun res!503677 () Bool)

(assert (=> b!746974 (=> res!503677 e!417108)))

(assert (=> b!746974 (= res!503677 (or (not (is-Intermediate!7550 lt!332011)) (bvslt x!1131 (x!63516 lt!332011)) (not (= x!1131 (x!63516 lt!332011))) (not (= index!1321 (index!32570 lt!332011)))))))

(declare-fun e!417104 () Bool)

(assert (=> b!746974 e!417104))

(declare-fun res!503684 () Bool)

(assert (=> b!746974 (=> (not res!503684) (not e!417104))))

(declare-fun lt!332014 () SeekEntryResult!7550)

(declare-fun lt!332008 () SeekEntryResult!7550)

(assert (=> b!746974 (= res!503684 (= lt!332014 lt!332008))))

(assert (=> b!746974 (= lt!332008 (Found!7550 j!159))))

(assert (=> b!746974 (= lt!332014 (seekEntryOrOpen!0 (select (arr!19950 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41673 (_ BitVec 32)) Bool)

(assert (=> b!746974 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332013 () Unit!25580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25580)

(assert (=> b!746974 (= lt!332013 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746975 () Bool)

(assert (=> b!746975 (= e!417107 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19950 a!3186) j!159) a!3186 mask!3328) lt!332012))))

(declare-fun b!746976 () Bool)

(declare-fun res!503680 () Bool)

(assert (=> b!746976 (=> (not res!503680) (not e!417109))))

(assert (=> b!746976 (= res!503680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746977 () Bool)

(declare-fun res!503676 () Bool)

(assert (=> b!746977 (=> res!503676 e!417108)))

(assert (=> b!746977 (= res!503676 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19950 a!3186) j!159) a!3186 mask!3328) lt!332008)))))

(declare-fun b!746978 () Bool)

(declare-fun res!503678 () Bool)

(assert (=> b!746978 (=> (not res!503678) (not e!417109))))

(declare-datatypes ((List!13952 0))(
  ( (Nil!13949) (Cons!13948 (h!15020 (_ BitVec 64)) (t!20267 List!13952)) )
))
(declare-fun arrayNoDuplicates!0 (array!41673 (_ BitVec 32) List!13952) Bool)

(assert (=> b!746978 (= res!503678 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13949))))

(declare-fun b!746979 () Bool)

(assert (=> b!746979 (= e!417104 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19950 a!3186) j!159) a!3186 mask!3328) lt!332008))))

(declare-fun b!746980 () Bool)

(declare-fun Unit!25583 () Unit!25580)

(assert (=> b!746980 (= e!417103 Unit!25583)))

(assert (=> b!746980 false))

(declare-fun b!746981 () Bool)

(declare-fun res!503682 () Bool)

(assert (=> b!746981 (=> res!503682 e!417108)))

(assert (=> b!746981 (= res!503682 (= (select (store (arr!19950 a!3186) i!1173 k!2102) index!1321) lt!332007))))

(declare-fun b!746982 () Bool)

(declare-fun res!503670 () Bool)

(assert (=> b!746982 (=> (not res!503670) (not e!417110))))

(assert (=> b!746982 (= res!503670 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19950 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746983 () Bool)

(declare-fun res!503672 () Bool)

(assert (=> b!746983 (=> (not res!503672) (not e!417102))))

(declare-fun arrayContainsKey!0 (array!41673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746983 (= res!503672 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746984 () Bool)

(declare-fun res!503675 () Bool)

(assert (=> b!746984 (=> (not res!503675) (not e!417110))))

(assert (=> b!746984 (= res!503675 e!417107)))

(declare-fun c!82030 () Bool)

(assert (=> b!746984 (= c!82030 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746985 () Bool)

(assert (=> b!746985 (= e!417108 true)))

(assert (=> b!746985 (= (select (store (arr!19950 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332009 () Unit!25580)

(assert (=> b!746985 (= lt!332009 e!417103)))

(declare-fun c!82029 () Bool)

(assert (=> b!746985 (= c!82029 (= (select (store (arr!19950 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65500 res!503668) b!746971))

(assert (= (and b!746971 res!503671) b!746966))

(assert (= (and b!746966 res!503669) b!746969))

(assert (= (and b!746969 res!503681) b!746983))

(assert (= (and b!746983 res!503672) b!746965))

(assert (= (and b!746965 res!503683) b!746976))

(assert (= (and b!746976 res!503680) b!746978))

(assert (= (and b!746978 res!503678) b!746968))

(assert (= (and b!746968 res!503674) b!746972))

(assert (= (and b!746972 res!503673) b!746982))

(assert (= (and b!746982 res!503670) b!746984))

(assert (= (and b!746984 c!82030) b!746975))

(assert (= (and b!746984 (not c!82030)) b!746970))

(assert (= (and b!746984 res!503675) b!746973))

(assert (= (and b!746973 res!503679) b!746974))

(assert (= (and b!746974 res!503684) b!746979))

(assert (= (and b!746974 (not res!503677)) b!746977))

(assert (= (and b!746977 (not res!503676)) b!746981))

(assert (= (and b!746981 (not res!503682)) b!746985))

(assert (= (and b!746985 c!82029) b!746980))

(assert (= (and b!746985 (not c!82029)) b!746967))

(declare-fun m!697159 () Bool)

(assert (=> b!746982 m!697159))

(declare-fun m!697161 () Bool)

(assert (=> b!746976 m!697161))

(declare-fun m!697163 () Bool)

(assert (=> b!746966 m!697163))

(assert (=> b!746966 m!697163))

(declare-fun m!697165 () Bool)

(assert (=> b!746966 m!697165))

(declare-fun m!697167 () Bool)

(assert (=> b!746985 m!697167))

(declare-fun m!697169 () Bool)

(assert (=> b!746985 m!697169))

(declare-fun m!697171 () Bool)

(assert (=> b!746983 m!697171))

(assert (=> b!746979 m!697163))

(assert (=> b!746979 m!697163))

(declare-fun m!697173 () Bool)

(assert (=> b!746979 m!697173))

(assert (=> b!746974 m!697163))

(assert (=> b!746974 m!697163))

(declare-fun m!697175 () Bool)

(assert (=> b!746974 m!697175))

(declare-fun m!697177 () Bool)

(assert (=> b!746974 m!697177))

(declare-fun m!697179 () Bool)

(assert (=> b!746974 m!697179))

(declare-fun m!697181 () Bool)

(assert (=> b!746965 m!697181))

(assert (=> b!746977 m!697163))

(assert (=> b!746977 m!697163))

(declare-fun m!697183 () Bool)

(assert (=> b!746977 m!697183))

(declare-fun m!697185 () Bool)

(assert (=> b!746978 m!697185))

(declare-fun m!697187 () Bool)

(assert (=> b!746969 m!697187))

(assert (=> b!746981 m!697167))

(assert (=> b!746981 m!697169))

(assert (=> b!746970 m!697163))

(assert (=> b!746970 m!697163))

(assert (=> b!746970 m!697183))

(assert (=> b!746972 m!697163))

(assert (=> b!746972 m!697163))

(declare-fun m!697189 () Bool)

(assert (=> b!746972 m!697189))

(assert (=> b!746972 m!697189))

(assert (=> b!746972 m!697163))

(declare-fun m!697191 () Bool)

(assert (=> b!746972 m!697191))

(assert (=> b!746975 m!697163))

(assert (=> b!746975 m!697163))

(declare-fun m!697193 () Bool)

(assert (=> b!746975 m!697193))

(declare-fun m!697195 () Bool)

(assert (=> start!65500 m!697195))

(declare-fun m!697197 () Bool)

(assert (=> start!65500 m!697197))

(declare-fun m!697199 () Bool)

(assert (=> b!746973 m!697199))

(assert (=> b!746973 m!697167))

(declare-fun m!697201 () Bool)

(assert (=> b!746973 m!697201))

(declare-fun m!697203 () Bool)

(assert (=> b!746973 m!697203))

(assert (=> b!746973 m!697203))

(declare-fun m!697205 () Bool)

(assert (=> b!746973 m!697205))

(push 1)

