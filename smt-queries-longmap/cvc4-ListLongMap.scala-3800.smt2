; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52158 () Bool)

(assert start!52158)

(declare-fun b!569292 () Bool)

(declare-fun res!359317 () Bool)

(declare-fun e!327513 () Bool)

(assert (=> b!569292 (=> (not res!359317) (not e!327513))))

(declare-datatypes ((array!35681 0))(
  ( (array!35682 (arr!17132 (Array (_ BitVec 32) (_ BitVec 64))) (size!17496 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35681)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569292 (= res!359317 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569293 () Bool)

(declare-fun res!359316 () Bool)

(assert (=> b!569293 (=> (not res!359316) (not e!327513))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569293 (= res!359316 (and (= (size!17496 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17496 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17496 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569294 () Bool)

(declare-fun res!359314 () Bool)

(declare-fun e!327516 () Bool)

(assert (=> b!569294 (=> (not res!359314) (not e!327516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35681 (_ BitVec 32)) Bool)

(assert (=> b!569294 (= res!359314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569295 () Bool)

(declare-fun res!359313 () Bool)

(assert (=> b!569295 (=> (not res!359313) (not e!327516))))

(declare-datatypes ((List!11212 0))(
  ( (Nil!11209) (Cons!11208 (h!12229 (_ BitVec 64)) (t!17440 List!11212)) )
))
(declare-fun arrayNoDuplicates!0 (array!35681 (_ BitVec 32) List!11212) Bool)

(assert (=> b!569295 (= res!359313 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11209))))

(declare-fun b!569296 () Bool)

(declare-fun e!327515 () Bool)

(assert (=> b!569296 (= e!327516 e!327515)))

(declare-fun res!359318 () Bool)

(assert (=> b!569296 (=> (not res!359318) (not e!327515))))

(declare-fun lt!259446 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5581 0))(
  ( (MissingZero!5581 (index!24551 (_ BitVec 32))) (Found!5581 (index!24552 (_ BitVec 32))) (Intermediate!5581 (undefined!6393 Bool) (index!24553 (_ BitVec 32)) (x!53424 (_ BitVec 32))) (Undefined!5581) (MissingVacant!5581 (index!24554 (_ BitVec 32))) )
))
(declare-fun lt!259449 () SeekEntryResult!5581)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35681 (_ BitVec 32)) SeekEntryResult!5581)

(assert (=> b!569296 (= res!359318 (= lt!259449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259446 (select (store (arr!17132 a!3118) i!1132 k!1914) j!142) (array!35682 (store (arr!17132 a!3118) i!1132 k!1914) (size!17496 a!3118)) mask!3119)))))

(declare-fun lt!259450 () (_ BitVec 32))

(assert (=> b!569296 (= lt!259449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259450 (select (arr!17132 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569296 (= lt!259446 (toIndex!0 (select (store (arr!17132 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569296 (= lt!259450 (toIndex!0 (select (arr!17132 a!3118) j!142) mask!3119))))

(declare-fun res!359315 () Bool)

(assert (=> start!52158 (=> (not res!359315) (not e!327513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52158 (= res!359315 (validMask!0 mask!3119))))

(assert (=> start!52158 e!327513))

(assert (=> start!52158 true))

(declare-fun array_inv!12928 (array!35681) Bool)

(assert (=> start!52158 (array_inv!12928 a!3118)))

(declare-fun b!569297 () Bool)

(declare-fun res!359310 () Bool)

(assert (=> b!569297 (=> (not res!359310) (not e!327513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569297 (= res!359310 (validKeyInArray!0 (select (arr!17132 a!3118) j!142)))))

(declare-fun b!569298 () Bool)

(assert (=> b!569298 (= e!327515 (not true))))

(declare-fun lt!259448 () SeekEntryResult!5581)

(assert (=> b!569298 (and (= lt!259448 (Found!5581 j!142)) (or (undefined!6393 lt!259449) (not (is-Intermediate!5581 lt!259449)) (= (select (arr!17132 a!3118) (index!24553 lt!259449)) (select (arr!17132 a!3118) j!142)) (not (= (select (arr!17132 a!3118) (index!24553 lt!259449)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259448 (MissingZero!5581 (index!24553 lt!259449)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35681 (_ BitVec 32)) SeekEntryResult!5581)

(assert (=> b!569298 (= lt!259448 (seekEntryOrOpen!0 (select (arr!17132 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569298 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17864 0))(
  ( (Unit!17865) )
))
(declare-fun lt!259445 () Unit!17864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17864)

(assert (=> b!569298 (= lt!259445 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569299 () Bool)

(assert (=> b!569299 (= e!327513 e!327516)))

(declare-fun res!359311 () Bool)

(assert (=> b!569299 (=> (not res!359311) (not e!327516))))

(declare-fun lt!259447 () SeekEntryResult!5581)

(assert (=> b!569299 (= res!359311 (or (= lt!259447 (MissingZero!5581 i!1132)) (= lt!259447 (MissingVacant!5581 i!1132))))))

(assert (=> b!569299 (= lt!259447 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569300 () Bool)

(declare-fun res!359312 () Bool)

(assert (=> b!569300 (=> (not res!359312) (not e!327513))))

(assert (=> b!569300 (= res!359312 (validKeyInArray!0 k!1914))))

(assert (= (and start!52158 res!359315) b!569293))

(assert (= (and b!569293 res!359316) b!569297))

(assert (= (and b!569297 res!359310) b!569300))

(assert (= (and b!569300 res!359312) b!569292))

(assert (= (and b!569292 res!359317) b!569299))

(assert (= (and b!569299 res!359311) b!569294))

(assert (= (and b!569294 res!359314) b!569295))

(assert (= (and b!569295 res!359313) b!569296))

(assert (= (and b!569296 res!359318) b!569298))

(declare-fun m!547963 () Bool)

(assert (=> b!569292 m!547963))

(declare-fun m!547965 () Bool)

(assert (=> b!569295 m!547965))

(declare-fun m!547967 () Bool)

(assert (=> b!569296 m!547967))

(declare-fun m!547969 () Bool)

(assert (=> b!569296 m!547969))

(assert (=> b!569296 m!547967))

(declare-fun m!547971 () Bool)

(assert (=> b!569296 m!547971))

(assert (=> b!569296 m!547971))

(declare-fun m!547973 () Bool)

(assert (=> b!569296 m!547973))

(assert (=> b!569296 m!547967))

(declare-fun m!547975 () Bool)

(assert (=> b!569296 m!547975))

(declare-fun m!547977 () Bool)

(assert (=> b!569296 m!547977))

(assert (=> b!569296 m!547971))

(declare-fun m!547979 () Bool)

(assert (=> b!569296 m!547979))

(declare-fun m!547981 () Bool)

(assert (=> b!569294 m!547981))

(assert (=> b!569298 m!547967))

(declare-fun m!547983 () Bool)

(assert (=> b!569298 m!547983))

(declare-fun m!547985 () Bool)

(assert (=> b!569298 m!547985))

(declare-fun m!547987 () Bool)

(assert (=> b!569298 m!547987))

(assert (=> b!569298 m!547967))

(declare-fun m!547989 () Bool)

(assert (=> b!569298 m!547989))

(declare-fun m!547991 () Bool)

(assert (=> b!569299 m!547991))

(declare-fun m!547993 () Bool)

(assert (=> b!569300 m!547993))

(assert (=> b!569297 m!547967))

(assert (=> b!569297 m!547967))

(declare-fun m!547995 () Bool)

(assert (=> b!569297 m!547995))

(declare-fun m!547997 () Bool)

(assert (=> start!52158 m!547997))

(declare-fun m!547999 () Bool)

(assert (=> start!52158 m!547999))

(push 1)

