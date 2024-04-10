; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52778 () Bool)

(assert start!52778)

(declare-fun b!575481 () Bool)

(declare-fun e!331122 () Bool)

(declare-fun e!331126 () Bool)

(assert (=> b!575481 (= e!331122 e!331126)))

(declare-fun res!363907 () Bool)

(assert (=> b!575481 (=> res!363907 e!331126)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5693 0))(
  ( (MissingZero!5693 (index!24999 (_ BitVec 32))) (Found!5693 (index!25000 (_ BitVec 32))) (Intermediate!5693 (undefined!6505 Bool) (index!25001 (_ BitVec 32)) (x!53894 (_ BitVec 32))) (Undefined!5693) (MissingVacant!5693 (index!25002 (_ BitVec 32))) )
))
(declare-fun lt!263084 () SeekEntryResult!5693)

(declare-fun lt!263083 () SeekEntryResult!5693)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35923 0))(
  ( (array!35924 (arr!17244 (Array (_ BitVec 32) (_ BitVec 64))) (size!17608 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35923)

(declare-fun lt!263078 () (_ BitVec 64))

(declare-fun lt!263074 () SeekEntryResult!5693)

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!575481 (= res!363907 (or (bvslt (index!25001 lt!263084) #b00000000000000000000000000000000) (bvsge (index!25001 lt!263084) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53894 lt!263084) #b01111111111111111111111111111110) (bvslt (x!53894 lt!263084) #b00000000000000000000000000000000) (not (= lt!263078 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17244 a!3118) i!1132 k!1914) (index!25001 lt!263084)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263074 lt!263083))))))

(declare-fun lt!263086 () SeekEntryResult!5693)

(declare-fun lt!263075 () SeekEntryResult!5693)

(assert (=> b!575481 (= lt!263086 lt!263075)))

(declare-fun lt!263081 () array!35923)

(declare-fun lt!263079 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35923 (_ BitVec 32)) SeekEntryResult!5693)

(assert (=> b!575481 (= lt!263075 (seekKeyOrZeroReturnVacant!0 (x!53894 lt!263084) (index!25001 lt!263084) (index!25001 lt!263084) lt!263079 lt!263081 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35923 (_ BitVec 32)) SeekEntryResult!5693)

(assert (=> b!575481 (= lt!263086 (seekEntryOrOpen!0 lt!263079 lt!263081 mask!3119))))

(declare-fun lt!263073 () SeekEntryResult!5693)

(assert (=> b!575481 (= lt!263073 lt!263074)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575481 (= lt!263074 (seekKeyOrZeroReturnVacant!0 (x!53894 lt!263084) (index!25001 lt!263084) (index!25001 lt!263084) (select (arr!17244 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!363900 () Bool)

(declare-fun e!331127 () Bool)

(assert (=> start!52778 (=> (not res!363900) (not e!331127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52778 (= res!363900 (validMask!0 mask!3119))))

(assert (=> start!52778 e!331127))

(assert (=> start!52778 true))

(declare-fun array_inv!13040 (array!35923) Bool)

(assert (=> start!52778 (array_inv!13040 a!3118)))

(declare-fun b!575482 () Bool)

(declare-fun res!363899 () Bool)

(assert (=> b!575482 (=> (not res!363899) (not e!331127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575482 (= res!363899 (validKeyInArray!0 k!1914))))

(declare-fun b!575483 () Bool)

(declare-fun e!331128 () Bool)

(assert (=> b!575483 (= e!331128 e!331122)))

(declare-fun res!363908 () Bool)

(assert (=> b!575483 (=> res!363908 e!331122)))

(assert (=> b!575483 (= res!363908 (or (= lt!263078 (select (arr!17244 a!3118) j!142)) (= lt!263078 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575483 (= lt!263078 (select (arr!17244 a!3118) (index!25001 lt!263084)))))

(declare-fun b!575484 () Bool)

(declare-fun e!331124 () Bool)

(assert (=> b!575484 (= e!331127 e!331124)))

(declare-fun res!363906 () Bool)

(assert (=> b!575484 (=> (not res!363906) (not e!331124))))

(declare-fun lt!263076 () SeekEntryResult!5693)

(assert (=> b!575484 (= res!363906 (or (= lt!263076 (MissingZero!5693 i!1132)) (= lt!263076 (MissingVacant!5693 i!1132))))))

(assert (=> b!575484 (= lt!263076 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575485 () Bool)

(declare-fun res!363897 () Bool)

(assert (=> b!575485 (=> (not res!363897) (not e!331124))))

(declare-datatypes ((List!11324 0))(
  ( (Nil!11321) (Cons!11320 (h!12359 (_ BitVec 64)) (t!17552 List!11324)) )
))
(declare-fun arrayNoDuplicates!0 (array!35923 (_ BitVec 32) List!11324) Bool)

(assert (=> b!575485 (= res!363897 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11321))))

(declare-fun b!575486 () Bool)

(declare-fun res!363903 () Bool)

(assert (=> b!575486 (=> (not res!363903) (not e!331124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35923 (_ BitVec 32)) Bool)

(assert (=> b!575486 (= res!363903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575487 () Bool)

(declare-fun e!331125 () Bool)

(assert (=> b!575487 (= e!331124 e!331125)))

(declare-fun res!363901 () Bool)

(assert (=> b!575487 (=> (not res!363901) (not e!331125))))

(declare-fun lt!263085 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35923 (_ BitVec 32)) SeekEntryResult!5693)

(assert (=> b!575487 (= res!363901 (= lt!263084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263085 lt!263079 lt!263081 mask!3119)))))

(declare-fun lt!263080 () (_ BitVec 32))

(assert (=> b!575487 (= lt!263084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263080 (select (arr!17244 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575487 (= lt!263085 (toIndex!0 lt!263079 mask!3119))))

(assert (=> b!575487 (= lt!263079 (select (store (arr!17244 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575487 (= lt!263080 (toIndex!0 (select (arr!17244 a!3118) j!142) mask!3119))))

(assert (=> b!575487 (= lt!263081 (array!35924 (store (arr!17244 a!3118) i!1132 k!1914) (size!17608 a!3118)))))

(declare-fun b!575488 () Bool)

(declare-fun res!363898 () Bool)

(assert (=> b!575488 (=> (not res!363898) (not e!331127))))

(assert (=> b!575488 (= res!363898 (and (= (size!17608 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17608 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17608 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575489 () Bool)

(declare-fun res!363905 () Bool)

(assert (=> b!575489 (=> (not res!363905) (not e!331127))))

(declare-fun arrayContainsKey!0 (array!35923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575489 (= res!363905 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575490 () Bool)

(declare-fun res!363902 () Bool)

(assert (=> b!575490 (=> (not res!363902) (not e!331127))))

(assert (=> b!575490 (= res!363902 (validKeyInArray!0 (select (arr!17244 a!3118) j!142)))))

(declare-fun b!575491 () Bool)

(assert (=> b!575491 (= e!331126 true)))

(assert (=> b!575491 (= lt!263074 lt!263075)))

(declare-datatypes ((Unit!18088 0))(
  ( (Unit!18089) )
))
(declare-fun lt!263077 () Unit!18088)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18088)

(assert (=> b!575491 (= lt!263077 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53894 lt!263084) (index!25001 lt!263084) (index!25001 lt!263084) mask!3119))))

(declare-fun b!575492 () Bool)

(assert (=> b!575492 (= e!331125 (not e!331128))))

(declare-fun res!363904 () Bool)

(assert (=> b!575492 (=> res!363904 e!331128)))

(assert (=> b!575492 (= res!363904 (or (undefined!6505 lt!263084) (not (is-Intermediate!5693 lt!263084))))))

(assert (=> b!575492 (= lt!263073 lt!263083)))

(assert (=> b!575492 (= lt!263083 (Found!5693 j!142))))

(assert (=> b!575492 (= lt!263073 (seekEntryOrOpen!0 (select (arr!17244 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575492 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263082 () Unit!18088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18088)

(assert (=> b!575492 (= lt!263082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52778 res!363900) b!575488))

(assert (= (and b!575488 res!363898) b!575490))

(assert (= (and b!575490 res!363902) b!575482))

(assert (= (and b!575482 res!363899) b!575489))

(assert (= (and b!575489 res!363905) b!575484))

(assert (= (and b!575484 res!363906) b!575486))

(assert (= (and b!575486 res!363903) b!575485))

(assert (= (and b!575485 res!363897) b!575487))

(assert (= (and b!575487 res!363901) b!575492))

(assert (= (and b!575492 (not res!363904)) b!575483))

(assert (= (and b!575483 (not res!363908)) b!575481))

(assert (= (and b!575481 (not res!363907)) b!575491))

(declare-fun m!554349 () Bool)

(assert (=> b!575483 m!554349))

(declare-fun m!554351 () Bool)

(assert (=> b!575483 m!554351))

(assert (=> b!575490 m!554349))

(assert (=> b!575490 m!554349))

(declare-fun m!554353 () Bool)

(assert (=> b!575490 m!554353))

(declare-fun m!554355 () Bool)

(assert (=> b!575489 m!554355))

(assert (=> b!575481 m!554349))

(declare-fun m!554357 () Bool)

(assert (=> b!575481 m!554357))

(declare-fun m!554359 () Bool)

(assert (=> b!575481 m!554359))

(declare-fun m!554361 () Bool)

(assert (=> b!575481 m!554361))

(declare-fun m!554363 () Bool)

(assert (=> b!575481 m!554363))

(assert (=> b!575481 m!554349))

(declare-fun m!554365 () Bool)

(assert (=> b!575481 m!554365))

(declare-fun m!554367 () Bool)

(assert (=> start!52778 m!554367))

(declare-fun m!554369 () Bool)

(assert (=> start!52778 m!554369))

(assert (=> b!575492 m!554349))

(assert (=> b!575492 m!554349))

(declare-fun m!554371 () Bool)

(assert (=> b!575492 m!554371))

(declare-fun m!554373 () Bool)

(assert (=> b!575492 m!554373))

(declare-fun m!554375 () Bool)

(assert (=> b!575492 m!554375))

(declare-fun m!554377 () Bool)

(assert (=> b!575482 m!554377))

(declare-fun m!554379 () Bool)

(assert (=> b!575487 m!554379))

(assert (=> b!575487 m!554349))

(declare-fun m!554381 () Bool)

(assert (=> b!575487 m!554381))

(assert (=> b!575487 m!554349))

(declare-fun m!554383 () Bool)

(assert (=> b!575487 m!554383))

(assert (=> b!575487 m!554349))

(declare-fun m!554385 () Bool)

(assert (=> b!575487 m!554385))

(assert (=> b!575487 m!554363))

(declare-fun m!554387 () Bool)

(assert (=> b!575487 m!554387))

(declare-fun m!554389 () Bool)

(assert (=> b!575485 m!554389))

(declare-fun m!554391 () Bool)

(assert (=> b!575484 m!554391))

(declare-fun m!554393 () Bool)

(assert (=> b!575491 m!554393))

(declare-fun m!554395 () Bool)

(assert (=> b!575486 m!554395))

(push 1)

