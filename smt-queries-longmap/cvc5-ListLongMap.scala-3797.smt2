; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52136 () Bool)

(assert start!52136)

(declare-fun b!568995 () Bool)

(declare-fun e!327381 () Bool)

(assert (=> b!568995 (= e!327381 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5570 0))(
  ( (MissingZero!5570 (index!24507 (_ BitVec 32))) (Found!5570 (index!24508 (_ BitVec 32))) (Intermediate!5570 (undefined!6382 Bool) (index!24509 (_ BitVec 32)) (x!53389 (_ BitVec 32))) (Undefined!5570) (MissingVacant!5570 (index!24510 (_ BitVec 32))) )
))
(declare-fun lt!259252 () SeekEntryResult!5570)

(declare-fun lt!259248 () SeekEntryResult!5570)

(declare-datatypes ((array!35659 0))(
  ( (array!35660 (arr!17121 (Array (_ BitVec 32) (_ BitVec 64))) (size!17485 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35659)

(assert (=> b!568995 (and (= lt!259252 (Found!5570 j!142)) (or (undefined!6382 lt!259248) (not (is-Intermediate!5570 lt!259248)) (= (select (arr!17121 a!3118) (index!24509 lt!259248)) (select (arr!17121 a!3118) j!142)) (not (= (select (arr!17121 a!3118) (index!24509 lt!259248)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259252 (MissingZero!5570 (index!24509 lt!259248)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35659 (_ BitVec 32)) SeekEntryResult!5570)

(assert (=> b!568995 (= lt!259252 (seekEntryOrOpen!0 (select (arr!17121 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35659 (_ BitVec 32)) Bool)

(assert (=> b!568995 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17842 0))(
  ( (Unit!17843) )
))
(declare-fun lt!259251 () Unit!17842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17842)

(assert (=> b!568995 (= lt!259251 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359021 () Bool)

(declare-fun e!327383 () Bool)

(assert (=> start!52136 (=> (not res!359021) (not e!327383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52136 (= res!359021 (validMask!0 mask!3119))))

(assert (=> start!52136 e!327383))

(assert (=> start!52136 true))

(declare-fun array_inv!12917 (array!35659) Bool)

(assert (=> start!52136 (array_inv!12917 a!3118)))

(declare-fun b!568996 () Bool)

(declare-fun res!359016 () Bool)

(declare-fun e!327384 () Bool)

(assert (=> b!568996 (=> (not res!359016) (not e!327384))))

(declare-datatypes ((List!11201 0))(
  ( (Nil!11198) (Cons!11197 (h!12218 (_ BitVec 64)) (t!17429 List!11201)) )
))
(declare-fun arrayNoDuplicates!0 (array!35659 (_ BitVec 32) List!11201) Bool)

(assert (=> b!568996 (= res!359016 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11198))))

(declare-fun b!568997 () Bool)

(assert (=> b!568997 (= e!327384 e!327381)))

(declare-fun res!359017 () Bool)

(assert (=> b!568997 (=> (not res!359017) (not e!327381))))

(declare-fun lt!259247 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35659 (_ BitVec 32)) SeekEntryResult!5570)

(assert (=> b!568997 (= res!359017 (= lt!259248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259247 (select (store (arr!17121 a!3118) i!1132 k!1914) j!142) (array!35660 (store (arr!17121 a!3118) i!1132 k!1914) (size!17485 a!3118)) mask!3119)))))

(declare-fun lt!259250 () (_ BitVec 32))

(assert (=> b!568997 (= lt!259248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259250 (select (arr!17121 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568997 (= lt!259247 (toIndex!0 (select (store (arr!17121 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568997 (= lt!259250 (toIndex!0 (select (arr!17121 a!3118) j!142) mask!3119))))

(declare-fun b!568998 () Bool)

(declare-fun res!359013 () Bool)

(assert (=> b!568998 (=> (not res!359013) (not e!327383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568998 (= res!359013 (validKeyInArray!0 k!1914))))

(declare-fun b!568999 () Bool)

(declare-fun res!359019 () Bool)

(assert (=> b!568999 (=> (not res!359019) (not e!327383))))

(assert (=> b!568999 (= res!359019 (validKeyInArray!0 (select (arr!17121 a!3118) j!142)))))

(declare-fun b!569000 () Bool)

(declare-fun res!359018 () Bool)

(assert (=> b!569000 (=> (not res!359018) (not e!327384))))

(assert (=> b!569000 (= res!359018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569001 () Bool)

(assert (=> b!569001 (= e!327383 e!327384)))

(declare-fun res!359014 () Bool)

(assert (=> b!569001 (=> (not res!359014) (not e!327384))))

(declare-fun lt!259249 () SeekEntryResult!5570)

(assert (=> b!569001 (= res!359014 (or (= lt!259249 (MissingZero!5570 i!1132)) (= lt!259249 (MissingVacant!5570 i!1132))))))

(assert (=> b!569001 (= lt!259249 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569002 () Bool)

(declare-fun res!359020 () Bool)

(assert (=> b!569002 (=> (not res!359020) (not e!327383))))

(assert (=> b!569002 (= res!359020 (and (= (size!17485 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17485 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17485 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569003 () Bool)

(declare-fun res!359015 () Bool)

(assert (=> b!569003 (=> (not res!359015) (not e!327383))))

(declare-fun arrayContainsKey!0 (array!35659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569003 (= res!359015 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52136 res!359021) b!569002))

(assert (= (and b!569002 res!359020) b!568999))

(assert (= (and b!568999 res!359019) b!568998))

(assert (= (and b!568998 res!359013) b!569003))

(assert (= (and b!569003 res!359015) b!569001))

(assert (= (and b!569001 res!359014) b!569000))

(assert (= (and b!569000 res!359018) b!568996))

(assert (= (and b!568996 res!359016) b!568997))

(assert (= (and b!568997 res!359017) b!568995))

(declare-fun m!547545 () Bool)

(assert (=> b!569001 m!547545))

(declare-fun m!547547 () Bool)

(assert (=> b!569003 m!547547))

(declare-fun m!547549 () Bool)

(assert (=> start!52136 m!547549))

(declare-fun m!547551 () Bool)

(assert (=> start!52136 m!547551))

(declare-fun m!547553 () Bool)

(assert (=> b!568998 m!547553))

(declare-fun m!547555 () Bool)

(assert (=> b!568997 m!547555))

(declare-fun m!547557 () Bool)

(assert (=> b!568997 m!547557))

(declare-fun m!547559 () Bool)

(assert (=> b!568997 m!547559))

(declare-fun m!547561 () Bool)

(assert (=> b!568997 m!547561))

(assert (=> b!568997 m!547555))

(assert (=> b!568997 m!547559))

(declare-fun m!547563 () Bool)

(assert (=> b!568997 m!547563))

(assert (=> b!568997 m!547555))

(declare-fun m!547565 () Bool)

(assert (=> b!568997 m!547565))

(assert (=> b!568997 m!547559))

(declare-fun m!547567 () Bool)

(assert (=> b!568997 m!547567))

(declare-fun m!547569 () Bool)

(assert (=> b!569000 m!547569))

(declare-fun m!547571 () Bool)

(assert (=> b!568996 m!547571))

(assert (=> b!568999 m!547555))

(assert (=> b!568999 m!547555))

(declare-fun m!547573 () Bool)

(assert (=> b!568999 m!547573))

(assert (=> b!568995 m!547555))

(declare-fun m!547575 () Bool)

(assert (=> b!568995 m!547575))

(declare-fun m!547577 () Bool)

(assert (=> b!568995 m!547577))

(declare-fun m!547579 () Bool)

(assert (=> b!568995 m!547579))

(assert (=> b!568995 m!547555))

(declare-fun m!547581 () Bool)

(assert (=> b!568995 m!547581))

(push 1)

