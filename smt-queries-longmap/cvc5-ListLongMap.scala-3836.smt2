; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52766 () Bool)

(assert start!52766)

(declare-fun b!575265 () Bool)

(declare-fun e!330997 () Bool)

(declare-fun e!331002 () Bool)

(assert (=> b!575265 (= e!330997 e!331002)))

(declare-fun res!363686 () Bool)

(assert (=> b!575265 (=> res!363686 e!331002)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!262824 () (_ BitVec 64))

(declare-datatypes ((array!35911 0))(
  ( (array!35912 (arr!17238 (Array (_ BitVec 32) (_ BitVec 64))) (size!17602 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35911)

(assert (=> b!575265 (= res!363686 (or (= lt!262824 (select (arr!17238 a!3118) j!142)) (= lt!262824 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5687 0))(
  ( (MissingZero!5687 (index!24975 (_ BitVec 32))) (Found!5687 (index!24976 (_ BitVec 32))) (Intermediate!5687 (undefined!6499 Bool) (index!24977 (_ BitVec 32)) (x!53872 (_ BitVec 32))) (Undefined!5687) (MissingVacant!5687 (index!24978 (_ BitVec 32))) )
))
(declare-fun lt!262833 () SeekEntryResult!5687)

(assert (=> b!575265 (= lt!262824 (select (arr!17238 a!3118) (index!24977 lt!262833)))))

(declare-fun b!575266 () Bool)

(declare-fun e!330998 () Bool)

(assert (=> b!575266 (= e!330998 true)))

(declare-fun lt!262822 () SeekEntryResult!5687)

(declare-fun lt!262827 () SeekEntryResult!5687)

(assert (=> b!575266 (= lt!262822 lt!262827)))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((Unit!18076 0))(
  ( (Unit!18077) )
))
(declare-fun lt!262834 () Unit!18076)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35911 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18076)

(assert (=> b!575266 (= lt!262834 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53872 lt!262833) (index!24977 lt!262833) (index!24977 lt!262833) mask!3119))))

(declare-fun b!575267 () Bool)

(declare-fun e!330999 () Bool)

(declare-fun e!331001 () Bool)

(assert (=> b!575267 (= e!330999 e!331001)))

(declare-fun res!363681 () Bool)

(assert (=> b!575267 (=> (not res!363681) (not e!331001))))

(declare-fun lt!262821 () SeekEntryResult!5687)

(assert (=> b!575267 (= res!363681 (or (= lt!262821 (MissingZero!5687 i!1132)) (= lt!262821 (MissingVacant!5687 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35911 (_ BitVec 32)) SeekEntryResult!5687)

(assert (=> b!575267 (= lt!262821 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575268 () Bool)

(declare-fun e!331000 () Bool)

(assert (=> b!575268 (= e!331000 (not e!330997))))

(declare-fun res!363685 () Bool)

(assert (=> b!575268 (=> res!363685 e!330997)))

(assert (=> b!575268 (= res!363685 (or (undefined!6499 lt!262833) (not (is-Intermediate!5687 lt!262833))))))

(declare-fun lt!262828 () SeekEntryResult!5687)

(declare-fun lt!262832 () SeekEntryResult!5687)

(assert (=> b!575268 (= lt!262828 lt!262832)))

(assert (=> b!575268 (= lt!262832 (Found!5687 j!142))))

(assert (=> b!575268 (= lt!262828 (seekEntryOrOpen!0 (select (arr!17238 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35911 (_ BitVec 32)) Bool)

(assert (=> b!575268 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262826 () Unit!18076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18076)

(assert (=> b!575268 (= lt!262826 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575269 () Bool)

(declare-fun res!363687 () Bool)

(assert (=> b!575269 (=> (not res!363687) (not e!330999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575269 (= res!363687 (validKeyInArray!0 (select (arr!17238 a!3118) j!142)))))

(declare-fun b!575270 () Bool)

(declare-fun res!363689 () Bool)

(assert (=> b!575270 (=> (not res!363689) (not e!330999))))

(assert (=> b!575270 (= res!363689 (validKeyInArray!0 k!1914))))

(declare-fun b!575271 () Bool)

(assert (=> b!575271 (= e!331001 e!331000)))

(declare-fun res!363692 () Bool)

(assert (=> b!575271 (=> (not res!363692) (not e!331000))))

(declare-fun lt!262830 () (_ BitVec 64))

(declare-fun lt!262831 () array!35911)

(declare-fun lt!262829 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35911 (_ BitVec 32)) SeekEntryResult!5687)

(assert (=> b!575271 (= res!363692 (= lt!262833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262829 lt!262830 lt!262831 mask!3119)))))

(declare-fun lt!262825 () (_ BitVec 32))

(assert (=> b!575271 (= lt!262833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262825 (select (arr!17238 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575271 (= lt!262829 (toIndex!0 lt!262830 mask!3119))))

(assert (=> b!575271 (= lt!262830 (select (store (arr!17238 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575271 (= lt!262825 (toIndex!0 (select (arr!17238 a!3118) j!142) mask!3119))))

(assert (=> b!575271 (= lt!262831 (array!35912 (store (arr!17238 a!3118) i!1132 k!1914) (size!17602 a!3118)))))

(declare-fun b!575272 () Bool)

(declare-fun res!363682 () Bool)

(assert (=> b!575272 (=> (not res!363682) (not e!330999))))

(assert (=> b!575272 (= res!363682 (and (= (size!17602 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17602 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17602 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575273 () Bool)

(declare-fun res!363688 () Bool)

(assert (=> b!575273 (=> (not res!363688) (not e!331001))))

(assert (=> b!575273 (= res!363688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575274 () Bool)

(assert (=> b!575274 (= e!331002 e!330998)))

(declare-fun res!363684 () Bool)

(assert (=> b!575274 (=> res!363684 e!330998)))

(assert (=> b!575274 (= res!363684 (or (bvslt (index!24977 lt!262833) #b00000000000000000000000000000000) (bvsge (index!24977 lt!262833) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53872 lt!262833) #b01111111111111111111111111111110) (bvslt (x!53872 lt!262833) #b00000000000000000000000000000000) (not (= lt!262824 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17238 a!3118) i!1132 k!1914) (index!24977 lt!262833)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262822 lt!262832))))))

(declare-fun lt!262823 () SeekEntryResult!5687)

(assert (=> b!575274 (= lt!262823 lt!262827)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35911 (_ BitVec 32)) SeekEntryResult!5687)

(assert (=> b!575274 (= lt!262827 (seekKeyOrZeroReturnVacant!0 (x!53872 lt!262833) (index!24977 lt!262833) (index!24977 lt!262833) lt!262830 lt!262831 mask!3119))))

(assert (=> b!575274 (= lt!262823 (seekEntryOrOpen!0 lt!262830 lt!262831 mask!3119))))

(assert (=> b!575274 (= lt!262828 lt!262822)))

(assert (=> b!575274 (= lt!262822 (seekKeyOrZeroReturnVacant!0 (x!53872 lt!262833) (index!24977 lt!262833) (index!24977 lt!262833) (select (arr!17238 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!363683 () Bool)

(assert (=> start!52766 (=> (not res!363683) (not e!330999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52766 (= res!363683 (validMask!0 mask!3119))))

(assert (=> start!52766 e!330999))

(assert (=> start!52766 true))

(declare-fun array_inv!13034 (array!35911) Bool)

(assert (=> start!52766 (array_inv!13034 a!3118)))

(declare-fun b!575275 () Bool)

(declare-fun res!363690 () Bool)

(assert (=> b!575275 (=> (not res!363690) (not e!330999))))

(declare-fun arrayContainsKey!0 (array!35911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575275 (= res!363690 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575276 () Bool)

(declare-fun res!363691 () Bool)

(assert (=> b!575276 (=> (not res!363691) (not e!331001))))

(declare-datatypes ((List!11318 0))(
  ( (Nil!11315) (Cons!11314 (h!12353 (_ BitVec 64)) (t!17546 List!11318)) )
))
(declare-fun arrayNoDuplicates!0 (array!35911 (_ BitVec 32) List!11318) Bool)

(assert (=> b!575276 (= res!363691 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11315))))

(assert (= (and start!52766 res!363683) b!575272))

(assert (= (and b!575272 res!363682) b!575269))

(assert (= (and b!575269 res!363687) b!575270))

(assert (= (and b!575270 res!363689) b!575275))

(assert (= (and b!575275 res!363690) b!575267))

(assert (= (and b!575267 res!363681) b!575273))

(assert (= (and b!575273 res!363688) b!575276))

(assert (= (and b!575276 res!363691) b!575271))

(assert (= (and b!575271 res!363692) b!575268))

(assert (= (and b!575268 (not res!363685)) b!575265))

(assert (= (and b!575265 (not res!363686)) b!575274))

(assert (= (and b!575274 (not res!363684)) b!575266))

(declare-fun m!554061 () Bool)

(assert (=> b!575275 m!554061))

(declare-fun m!554063 () Bool)

(assert (=> b!575276 m!554063))

(declare-fun m!554065 () Bool)

(assert (=> b!575273 m!554065))

(declare-fun m!554067 () Bool)

(assert (=> start!52766 m!554067))

(declare-fun m!554069 () Bool)

(assert (=> start!52766 m!554069))

(declare-fun m!554071 () Bool)

(assert (=> b!575266 m!554071))

(declare-fun m!554073 () Bool)

(assert (=> b!575274 m!554073))

(declare-fun m!554075 () Bool)

(assert (=> b!575274 m!554075))

(declare-fun m!554077 () Bool)

(assert (=> b!575274 m!554077))

(assert (=> b!575274 m!554075))

(declare-fun m!554079 () Bool)

(assert (=> b!575274 m!554079))

(declare-fun m!554081 () Bool)

(assert (=> b!575274 m!554081))

(declare-fun m!554083 () Bool)

(assert (=> b!575274 m!554083))

(assert (=> b!575268 m!554075))

(assert (=> b!575268 m!554075))

(declare-fun m!554085 () Bool)

(assert (=> b!575268 m!554085))

(declare-fun m!554087 () Bool)

(assert (=> b!575268 m!554087))

(declare-fun m!554089 () Bool)

(assert (=> b!575268 m!554089))

(assert (=> b!575271 m!554075))

(declare-fun m!554091 () Bool)

(assert (=> b!575271 m!554091))

(assert (=> b!575271 m!554075))

(declare-fun m!554093 () Bool)

(assert (=> b!575271 m!554093))

(assert (=> b!575271 m!554075))

(declare-fun m!554095 () Bool)

(assert (=> b!575271 m!554095))

(assert (=> b!575271 m!554081))

(declare-fun m!554097 () Bool)

(assert (=> b!575271 m!554097))

(declare-fun m!554099 () Bool)

(assert (=> b!575271 m!554099))

(assert (=> b!575265 m!554075))

(declare-fun m!554101 () Bool)

(assert (=> b!575265 m!554101))

(declare-fun m!554103 () Bool)

(assert (=> b!575267 m!554103))

(assert (=> b!575269 m!554075))

(assert (=> b!575269 m!554075))

(declare-fun m!554105 () Bool)

(assert (=> b!575269 m!554105))

(declare-fun m!554107 () Bool)

(assert (=> b!575270 m!554107))

(push 1)

