; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52320 () Bool)

(assert start!52320)

(declare-fun b!571108 () Bool)

(declare-fun res!360902 () Bool)

(declare-fun e!328463 () Bool)

(assert (=> b!571108 (=> (not res!360902) (not e!328463))))

(declare-datatypes ((array!35780 0))(
  ( (array!35781 (arr!17180 (Array (_ BitVec 32) (_ BitVec 64))) (size!17544 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35780)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571108 (= res!360902 (validKeyInArray!0 (select (arr!17180 a!3118) j!142)))))

(declare-fun b!571109 () Bool)

(declare-fun res!360899 () Bool)

(assert (=> b!571109 (=> (not res!360899) (not e!328463))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571109 (= res!360899 (and (= (size!17544 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17544 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17544 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!260420 () array!35780)

(declare-fun e!328459 () Bool)

(declare-fun b!571110 () Bool)

(declare-datatypes ((SeekEntryResult!5629 0))(
  ( (MissingZero!5629 (index!24743 (_ BitVec 32))) (Found!5629 (index!24744 (_ BitVec 32))) (Intermediate!5629 (undefined!6441 Bool) (index!24745 (_ BitVec 32)) (x!53609 (_ BitVec 32))) (Undefined!5629) (MissingVacant!5629 (index!24746 (_ BitVec 32))) )
))
(declare-fun lt!260424 () SeekEntryResult!5629)

(declare-fun lt!260422 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35780 (_ BitVec 32)) SeekEntryResult!5629)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35780 (_ BitVec 32)) SeekEntryResult!5629)

(assert (=> b!571110 (= e!328459 (= (seekEntryOrOpen!0 lt!260422 lt!260420 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53609 lt!260424) (index!24745 lt!260424) (index!24745 lt!260424) lt!260422 lt!260420 mask!3119)))))

(declare-fun b!571111 () Bool)

(declare-fun res!360901 () Bool)

(assert (=> b!571111 (=> (not res!360901) (not e!328463))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!571111 (= res!360901 (validKeyInArray!0 k!1914))))

(declare-fun b!571113 () Bool)

(declare-fun res!360900 () Bool)

(declare-fun e!328461 () Bool)

(assert (=> b!571113 (=> (not res!360900) (not e!328461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35780 (_ BitVec 32)) Bool)

(assert (=> b!571113 (= res!360900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571114 () Bool)

(declare-fun res!360895 () Bool)

(assert (=> b!571114 (=> (not res!360895) (not e!328463))))

(declare-fun arrayContainsKey!0 (array!35780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571114 (= res!360895 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571115 () Bool)

(declare-fun e!328467 () Bool)

(declare-fun e!328465 () Bool)

(assert (=> b!571115 (= e!328467 (not e!328465))))

(declare-fun res!360898 () Bool)

(assert (=> b!571115 (=> res!360898 e!328465)))

(assert (=> b!571115 (= res!360898 (or (undefined!6441 lt!260424) (not (is-Intermediate!5629 lt!260424))))))

(declare-fun e!328464 () Bool)

(assert (=> b!571115 e!328464))

(declare-fun res!360891 () Bool)

(assert (=> b!571115 (=> (not res!360891) (not e!328464))))

(declare-fun lt!260417 () SeekEntryResult!5629)

(assert (=> b!571115 (= res!360891 (= lt!260417 (Found!5629 j!142)))))

(assert (=> b!571115 (= lt!260417 (seekEntryOrOpen!0 (select (arr!17180 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571115 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17960 0))(
  ( (Unit!17961) )
))
(declare-fun lt!260418 () Unit!17960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17960)

(assert (=> b!571115 (= lt!260418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571116 () Bool)

(declare-fun e!328460 () Bool)

(declare-fun e!328466 () Bool)

(assert (=> b!571116 (= e!328460 e!328466)))

(declare-fun res!360893 () Bool)

(assert (=> b!571116 (=> res!360893 e!328466)))

(declare-fun lt!260423 () (_ BitVec 64))

(assert (=> b!571116 (= res!360893 (or (= lt!260423 (select (arr!17180 a!3118) j!142)) (= lt!260423 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571116 (= lt!260423 (select (arr!17180 a!3118) (index!24745 lt!260424)))))

(declare-fun b!571117 () Bool)

(assert (=> b!571117 (= e!328466 (= lt!260417 (seekKeyOrZeroReturnVacant!0 (x!53609 lt!260424) (index!24745 lt!260424) (index!24745 lt!260424) (select (arr!17180 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571118 () Bool)

(assert (=> b!571118 (= e!328463 e!328461)))

(declare-fun res!360894 () Bool)

(assert (=> b!571118 (=> (not res!360894) (not e!328461))))

(declare-fun lt!260425 () SeekEntryResult!5629)

(assert (=> b!571118 (= res!360894 (or (= lt!260425 (MissingZero!5629 i!1132)) (= lt!260425 (MissingVacant!5629 i!1132))))))

(assert (=> b!571118 (= lt!260425 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571119 () Bool)

(assert (=> b!571119 (= e!328465 e!328459)))

(declare-fun res!360890 () Bool)

(assert (=> b!571119 (=> res!360890 e!328459)))

(declare-fun lt!260419 () (_ BitVec 64))

(assert (=> b!571119 (= res!360890 (or (= lt!260419 (select (arr!17180 a!3118) j!142)) (= lt!260419 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571119 (= lt!260419 (select (arr!17180 a!3118) (index!24745 lt!260424)))))

(declare-fun b!571112 () Bool)

(declare-fun res!360889 () Bool)

(assert (=> b!571112 (=> (not res!360889) (not e!328461))))

(declare-datatypes ((List!11260 0))(
  ( (Nil!11257) (Cons!11256 (h!12280 (_ BitVec 64)) (t!17488 List!11260)) )
))
(declare-fun arrayNoDuplicates!0 (array!35780 (_ BitVec 32) List!11260) Bool)

(assert (=> b!571112 (= res!360889 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11257))))

(declare-fun res!360897 () Bool)

(assert (=> start!52320 (=> (not res!360897) (not e!328463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52320 (= res!360897 (validMask!0 mask!3119))))

(assert (=> start!52320 e!328463))

(assert (=> start!52320 true))

(declare-fun array_inv!12976 (array!35780) Bool)

(assert (=> start!52320 (array_inv!12976 a!3118)))

(declare-fun b!571120 () Bool)

(assert (=> b!571120 (= e!328461 e!328467)))

(declare-fun res!360896 () Bool)

(assert (=> b!571120 (=> (not res!360896) (not e!328467))))

(declare-fun lt!260421 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35780 (_ BitVec 32)) SeekEntryResult!5629)

(assert (=> b!571120 (= res!360896 (= lt!260424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260421 lt!260422 lt!260420 mask!3119)))))

(declare-fun lt!260416 () (_ BitVec 32))

(assert (=> b!571120 (= lt!260424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260416 (select (arr!17180 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571120 (= lt!260421 (toIndex!0 lt!260422 mask!3119))))

(assert (=> b!571120 (= lt!260422 (select (store (arr!17180 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571120 (= lt!260416 (toIndex!0 (select (arr!17180 a!3118) j!142) mask!3119))))

(assert (=> b!571120 (= lt!260420 (array!35781 (store (arr!17180 a!3118) i!1132 k!1914) (size!17544 a!3118)))))

(declare-fun b!571121 () Bool)

(assert (=> b!571121 (= e!328464 e!328460)))

(declare-fun res!360892 () Bool)

(assert (=> b!571121 (=> res!360892 e!328460)))

(assert (=> b!571121 (= res!360892 (or (undefined!6441 lt!260424) (not (is-Intermediate!5629 lt!260424))))))

(assert (= (and start!52320 res!360897) b!571109))

(assert (= (and b!571109 res!360899) b!571108))

(assert (= (and b!571108 res!360902) b!571111))

(assert (= (and b!571111 res!360901) b!571114))

(assert (= (and b!571114 res!360895) b!571118))

(assert (= (and b!571118 res!360894) b!571113))

(assert (= (and b!571113 res!360900) b!571112))

(assert (= (and b!571112 res!360889) b!571120))

(assert (= (and b!571120 res!360896) b!571115))

(assert (= (and b!571115 res!360891) b!571121))

(assert (= (and b!571121 (not res!360892)) b!571116))

(assert (= (and b!571116 (not res!360893)) b!571117))

(assert (= (and b!571115 (not res!360898)) b!571119))

(assert (= (and b!571119 (not res!360890)) b!571110))

(declare-fun m!550057 () Bool)

(assert (=> b!571116 m!550057))

(declare-fun m!550059 () Bool)

(assert (=> b!571116 m!550059))

(declare-fun m!550061 () Bool)

(assert (=> b!571111 m!550061))

(declare-fun m!550063 () Bool)

(assert (=> start!52320 m!550063))

(declare-fun m!550065 () Bool)

(assert (=> start!52320 m!550065))

(declare-fun m!550067 () Bool)

(assert (=> b!571118 m!550067))

(declare-fun m!550069 () Bool)

(assert (=> b!571110 m!550069))

(declare-fun m!550071 () Bool)

(assert (=> b!571110 m!550071))

(assert (=> b!571108 m!550057))

(assert (=> b!571108 m!550057))

(declare-fun m!550073 () Bool)

(assert (=> b!571108 m!550073))

(declare-fun m!550075 () Bool)

(assert (=> b!571114 m!550075))

(declare-fun m!550077 () Bool)

(assert (=> b!571112 m!550077))

(declare-fun m!550079 () Bool)

(assert (=> b!571120 m!550079))

(assert (=> b!571120 m!550057))

(declare-fun m!550081 () Bool)

(assert (=> b!571120 m!550081))

(declare-fun m!550083 () Bool)

(assert (=> b!571120 m!550083))

(assert (=> b!571120 m!550057))

(declare-fun m!550085 () Bool)

(assert (=> b!571120 m!550085))

(assert (=> b!571120 m!550057))

(declare-fun m!550087 () Bool)

(assert (=> b!571120 m!550087))

(declare-fun m!550089 () Bool)

(assert (=> b!571120 m!550089))

(assert (=> b!571117 m!550057))

(assert (=> b!571117 m!550057))

(declare-fun m!550091 () Bool)

(assert (=> b!571117 m!550091))

(assert (=> b!571115 m!550057))

(assert (=> b!571115 m!550057))

(declare-fun m!550093 () Bool)

(assert (=> b!571115 m!550093))

(declare-fun m!550095 () Bool)

(assert (=> b!571115 m!550095))

(declare-fun m!550097 () Bool)

(assert (=> b!571115 m!550097))

(declare-fun m!550099 () Bool)

(assert (=> b!571113 m!550099))

(assert (=> b!571119 m!550057))

(assert (=> b!571119 m!550059))

(push 1)

(assert (not b!571120))

(assert (not b!571110))

(assert (not start!52320))

(assert (not b!571113))

(assert (not b!571114))

(assert (not b!571117))

(assert (not b!571111))

(assert (not b!571112))

(assert (not b!571108))

(assert (not b!571118))

(assert (not b!571115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84727 () Bool)

(assert (=> d!84727 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52320 d!84727))

(declare-fun d!84739 () Bool)

(assert (=> d!84739 (= (array_inv!12976 a!3118) (bvsge (size!17544 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52320 d!84739))

(declare-fun d!84741 () Bool)

(declare-fun lt!260476 () SeekEntryResult!5629)

(assert (=> d!84741 (and (or (is-Undefined!5629 lt!260476) (not (is-Found!5629 lt!260476)) (and (bvsge (index!24744 lt!260476) #b00000000000000000000000000000000) (bvslt (index!24744 lt!260476) (size!17544 a!3118)))) (or (is-Undefined!5629 lt!260476) (is-Found!5629 lt!260476) (not (is-MissingVacant!5629 lt!260476)) (not (= (index!24746 lt!260476) (index!24745 lt!260424))) (and (bvsge (index!24746 lt!260476) #b00000000000000000000000000000000) (bvslt (index!24746 lt!260476) (size!17544 a!3118)))) (or (is-Undefined!5629 lt!260476) (ite (is-Found!5629 lt!260476) (= (select (arr!17180 a!3118) (index!24744 lt!260476)) (select (arr!17180 a!3118) j!142)) (and (is-MissingVacant!5629 lt!260476) (= (index!24746 lt!260476) (index!24745 lt!260424)) (= (select (arr!17180 a!3118) (index!24746 lt!260476)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!328549 () SeekEntryResult!5629)

(assert (=> d!84741 (= lt!260476 e!328549)))

(declare-fun c!65512 () Bool)

(assert (=> d!84741 (= c!65512 (bvsge (x!53609 lt!260424) #b01111111111111111111111111111110))))

(declare-fun lt!260477 () (_ BitVec 64))

(assert (=> d!84741 (= lt!260477 (select (arr!17180 a!3118) (index!24745 lt!260424)))))

(assert (=> d!84741 (validMask!0 mask!3119)))

(assert (=> d!84741 (= (seekKeyOrZeroReturnVacant!0 (x!53609 lt!260424) (index!24745 lt!260424) (index!24745 lt!260424) (select (arr!17180 a!3118) j!142) a!3118 mask!3119) lt!260476)))

(declare-fun b!571251 () Bool)

(declare-fun e!328550 () SeekEntryResult!5629)

(assert (=> b!571251 (= e!328550 (MissingVacant!5629 (index!24745 lt!260424)))))

(declare-fun b!571252 () Bool)

(declare-fun e!328548 () SeekEntryResult!5629)

(assert (=> b!571252 (= e!328548 (Found!5629 (index!24745 lt!260424)))))

(declare-fun b!571253 () Bool)

(declare-fun c!65511 () Bool)

(assert (=> b!571253 (= c!65511 (= lt!260477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571253 (= e!328548 e!328550)))

(declare-fun b!571254 () Bool)

(assert (=> b!571254 (= e!328549 e!328548)))

(declare-fun c!65513 () Bool)

(assert (=> b!571254 (= c!65513 (= lt!260477 (select (arr!17180 a!3118) j!142)))))

(declare-fun b!571255 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571255 (= e!328550 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53609 lt!260424) #b00000000000000000000000000000001) (nextIndex!0 (index!24745 lt!260424) (x!53609 lt!260424) mask!3119) (index!24745 lt!260424) (select (arr!17180 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571256 () Bool)

(assert (=> b!571256 (= e!328549 Undefined!5629)))

(assert (= (and d!84741 c!65512) b!571256))

(assert (= (and d!84741 (not c!65512)) b!571254))

(assert (= (and b!571254 c!65513) b!571252))

(assert (= (and b!571254 (not c!65513)) b!571253))

(assert (= (and b!571253 c!65511) b!571251))

(assert (= (and b!571253 (not c!65511)) b!571255))

(declare-fun m!550163 () Bool)

(assert (=> d!84741 m!550163))

(declare-fun m!550165 () Bool)

(assert (=> d!84741 m!550165))

(assert (=> d!84741 m!550059))

(assert (=> d!84741 m!550063))

(declare-fun m!550167 () Bool)

(assert (=> b!571255 m!550167))

(assert (=> b!571255 m!550167))

(assert (=> b!571255 m!550057))

(declare-fun m!550169 () Bool)

(assert (=> b!571255 m!550169))

(assert (=> b!571117 d!84741))

(declare-fun bm!32612 () Bool)

(declare-fun call!32615 () Bool)

(declare-fun c!65516 () Bool)

(assert (=> bm!32612 (= call!32615 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65516 (Cons!11256 (select (arr!17180 a!3118) #b00000000000000000000000000000000) Nil!11257) Nil!11257)))))

(declare-fun b!571267 () Bool)

(declare-fun e!328562 () Bool)

(declare-fun e!328560 () Bool)

(assert (=> b!571267 (= e!328562 e!328560)))

(declare-fun res!360951 () Bool)

(assert (=> b!571267 (=> (not res!360951) (not e!328560))))

(declare-fun e!328561 () Bool)

(assert (=> b!571267 (= res!360951 (not e!328561))))

(declare-fun res!360949 () Bool)

(assert (=> b!571267 (=> (not res!360949) (not e!328561))))

(assert (=> b!571267 (= res!360949 (validKeyInArray!0 (select (arr!17180 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84755 () Bool)

(declare-fun res!360950 () Bool)

(assert (=> d!84755 (=> res!360950 e!328562)))

(assert (=> d!84755 (= res!360950 (bvsge #b00000000000000000000000000000000 (size!17544 a!3118)))))

(assert (=> d!84755 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11257) e!328562)))

(declare-fun b!571268 () Bool)

(declare-fun e!328559 () Bool)

(assert (=> b!571268 (= e!328559 call!32615)))

(declare-fun b!571269 () Bool)

(assert (=> b!571269 (= e!328560 e!328559)))

(assert (=> b!571269 (= c!65516 (validKeyInArray!0 (select (arr!17180 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571270 () Bool)

(assert (=> b!571270 (= e!328559 call!32615)))

(declare-fun b!571271 () Bool)

(declare-fun contains!2881 (List!11260 (_ BitVec 64)) Bool)

(assert (=> b!571271 (= e!328561 (contains!2881 Nil!11257 (select (arr!17180 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84755 (not res!360950)) b!571267))

(assert (= (and b!571267 res!360949) b!571271))

(assert (= (and b!571267 res!360951) b!571269))

(assert (= (and b!571269 c!65516) b!571268))

(assert (= (and b!571269 (not c!65516)) b!571270))

(assert (= (or b!571268 b!571270) bm!32612))

(declare-fun m!550171 () Bool)

(assert (=> bm!32612 m!550171))

(declare-fun m!550173 () Bool)

(assert (=> bm!32612 m!550173))

(assert (=> b!571267 m!550171))

(assert (=> b!571267 m!550171))

(declare-fun m!550175 () Bool)

(assert (=> b!571267 m!550175))

(assert (=> b!571269 m!550171))

(assert (=> b!571269 m!550171))

(assert (=> b!571269 m!550175))

(assert (=> b!571271 m!550171))

(assert (=> b!571271 m!550171))

(declare-fun m!550177 () Bool)

(assert (=> b!571271 m!550177))

(assert (=> b!571112 d!84755))

(declare-fun b!571358 () Bool)

(declare-fun e!328613 () SeekEntryResult!5629)

(declare-fun e!328612 () SeekEntryResult!5629)

(assert (=> b!571358 (= e!328613 e!328612)))

(declare-fun lt!260525 () (_ BitVec 64))

(declare-fun lt!260526 () SeekEntryResult!5629)

(assert (=> b!571358 (= lt!260525 (select (arr!17180 a!3118) (index!24745 lt!260526)))))

(declare-fun c!65556 () Bool)

(assert (=> b!571358 (= c!65556 (= lt!260525 k!1914))))

(declare-fun e!328611 () SeekEntryResult!5629)

(declare-fun b!571359 () Bool)

(assert (=> b!571359 (= e!328611 (seekKeyOrZeroReturnVacant!0 (x!53609 lt!260526) (index!24745 lt!260526) (index!24745 lt!260526) k!1914 a!3118 mask!3119))))

(declare-fun b!571360 () Bool)

(assert (=> b!571360 (= e!328611 (MissingZero!5629 (index!24745 lt!260526)))))

(declare-fun b!571361 () Bool)

(assert (=> b!571361 (= e!328612 (Found!5629 (index!24745 lt!260526)))))

(declare-fun d!84757 () Bool)

(declare-fun lt!260527 () SeekEntryResult!5629)

(assert (=> d!84757 (and (or (is-Undefined!5629 lt!260527) (not (is-Found!5629 lt!260527)) (and (bvsge (index!24744 lt!260527) #b00000000000000000000000000000000) (bvslt (index!24744 lt!260527) (size!17544 a!3118)))) (or (is-Undefined!5629 lt!260527) (is-Found!5629 lt!260527) (not (is-MissingZero!5629 lt!260527)) (and (bvsge (index!24743 lt!260527) #b00000000000000000000000000000000) (bvslt (index!24743 lt!260527) (size!17544 a!3118)))) (or (is-Undefined!5629 lt!260527) (is-Found!5629 lt!260527) (is-MissingZero!5629 lt!260527) (not (is-MissingVacant!5629 lt!260527)) (and (bvsge (index!24746 lt!260527) #b00000000000000000000000000000000) (bvslt (index!24746 lt!260527) (size!17544 a!3118)))) (or (is-Undefined!5629 lt!260527) (ite (is-Found!5629 lt!260527) (= (select (arr!17180 a!3118) (index!24744 lt!260527)) k!1914) (ite (is-MissingZero!5629 lt!260527) (= (select (arr!17180 a!3118) (index!24743 lt!260527)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5629 lt!260527) (= (select (arr!17180 a!3118) (index!24746 lt!260527)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84757 (= lt!260527 e!328613)))

(declare-fun c!65555 () Bool)

(assert (=> d!84757 (= c!65555 (and (is-Intermediate!5629 lt!260526) (undefined!6441 lt!260526)))))

(assert (=> d!84757 (= lt!260526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84757 (validMask!0 mask!3119)))

(assert (=> d!84757 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!260527)))

(declare-fun b!571362 () Bool)

(declare-fun c!65557 () Bool)

(assert (=> b!571362 (= c!65557 (= lt!260525 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571362 (= e!328612 e!328611)))

(declare-fun b!571363 () Bool)

(assert (=> b!571363 (= e!328613 Undefined!5629)))

(assert (= (and d!84757 c!65555) b!571363))

(assert (= (and d!84757 (not c!65555)) b!571358))

(assert (= (and b!571358 c!65556) b!571361))

(assert (= (and b!571358 (not c!65556)) b!571362))

(assert (= (and b!571362 c!65557) b!571360))

(assert (= (and b!571362 (not c!65557)) b!571359))

(declare-fun m!550269 () Bool)

(assert (=> b!571358 m!550269))

(declare-fun m!550271 () Bool)

(assert (=> b!571359 m!550271))

(declare-fun m!550273 () Bool)

(assert (=> d!84757 m!550273))

(declare-fun m!550275 () Bool)

(assert (=> d!84757 m!550275))

(declare-fun m!550277 () Bool)

(assert (=> d!84757 m!550277))

(assert (=> d!84757 m!550063))

(assert (=> d!84757 m!550273))

(declare-fun m!550279 () Bool)

(assert (=> d!84757 m!550279))

(declare-fun m!550281 () Bool)

(assert (=> d!84757 m!550281))

(assert (=> b!571118 d!84757))

(declare-fun b!571390 () Bool)

(declare-fun e!328630 () Bool)

(declare-fun call!32620 () Bool)

(assert (=> b!571390 (= e!328630 call!32620)))

(declare-fun b!571391 () Bool)

(declare-fun e!328632 () Bool)

(assert (=> b!571391 (= e!328632 call!32620)))

(declare-fun bm!32617 () Bool)

(assert (=> bm!32617 (= call!32620 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84781 () Bool)

(declare-fun res!360973 () Bool)

(declare-fun e!328631 () Bool)

(assert (=> d!84781 (=> res!360973 e!328631)))

(assert (=> d!84781 (= res!360973 (bvsge #b00000000000000000000000000000000 (size!17544 a!3118)))))

