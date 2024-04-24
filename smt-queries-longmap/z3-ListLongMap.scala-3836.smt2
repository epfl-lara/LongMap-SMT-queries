; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52812 () Bool)

(assert start!52812)

(declare-fun b!575465 () Bool)

(declare-fun res!363787 () Bool)

(declare-fun e!331130 () Bool)

(assert (=> b!575465 (=> (not res!363787) (not e!331130))))

(declare-datatypes ((array!35904 0))(
  ( (array!35905 (arr!17233 (Array (_ BitVec 32) (_ BitVec 64))) (size!17597 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35904)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575465 (= res!363787 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575466 () Bool)

(declare-fun e!331127 () Bool)

(declare-fun e!331128 () Bool)

(assert (=> b!575466 (= e!331127 (not e!331128))))

(declare-fun res!363780 () Bool)

(assert (=> b!575466 (=> res!363780 e!331128)))

(declare-datatypes ((SeekEntryResult!5638 0))(
  ( (MissingZero!5638 (index!24779 (_ BitVec 32))) (Found!5638 (index!24780 (_ BitVec 32))) (Intermediate!5638 (undefined!6450 Bool) (index!24781 (_ BitVec 32)) (x!53826 (_ BitVec 32))) (Undefined!5638) (MissingVacant!5638 (index!24782 (_ BitVec 32))) )
))
(declare-fun lt!262937 () SeekEntryResult!5638)

(get-info :version)

(assert (=> b!575466 (= res!363780 (or (undefined!6450 lt!262937) (not ((_ is Intermediate!5638) lt!262937))))))

(declare-fun lt!262935 () SeekEntryResult!5638)

(declare-fun lt!262933 () SeekEntryResult!5638)

(assert (=> b!575466 (= lt!262935 lt!262933)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575466 (= lt!262933 (Found!5638 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35904 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!575466 (= lt!262935 (seekEntryOrOpen!0 (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35904 (_ BitVec 32)) Bool)

(assert (=> b!575466 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18049 0))(
  ( (Unit!18050) )
))
(declare-fun lt!262945 () Unit!18049)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18049)

(assert (=> b!575466 (= lt!262945 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575467 () Bool)

(declare-fun res!363786 () Bool)

(assert (=> b!575467 (=> (not res!363786) (not e!331130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575467 (= res!363786 (validKeyInArray!0 k0!1914))))

(declare-fun b!575468 () Bool)

(declare-fun res!363785 () Bool)

(assert (=> b!575468 (=> (not res!363785) (not e!331130))))

(assert (=> b!575468 (= res!363785 (validKeyInArray!0 (select (arr!17233 a!3118) j!142)))))

(declare-fun b!575469 () Bool)

(declare-fun e!331126 () Bool)

(declare-fun e!331131 () Bool)

(assert (=> b!575469 (= e!331126 e!331131)))

(declare-fun res!363781 () Bool)

(assert (=> b!575469 (=> res!363781 e!331131)))

(declare-fun lt!262936 () SeekEntryResult!5638)

(declare-fun lt!262941 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575469 (= res!363781 (or (bvslt (index!24781 lt!262937) #b00000000000000000000000000000000) (bvsge (index!24781 lt!262937) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53826 lt!262937) #b01111111111111111111111111111110) (bvslt (x!53826 lt!262937) #b00000000000000000000000000000000) (not (= lt!262941 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17233 a!3118) i!1132 k0!1914) (index!24781 lt!262937)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262936 lt!262933))))))

(declare-fun lt!262934 () SeekEntryResult!5638)

(declare-fun lt!262939 () SeekEntryResult!5638)

(assert (=> b!575469 (= lt!262934 lt!262939)))

(declare-fun lt!262940 () array!35904)

(declare-fun lt!262943 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35904 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!575469 (= lt!262939 (seekKeyOrZeroReturnVacant!0 (x!53826 lt!262937) (index!24781 lt!262937) (index!24781 lt!262937) lt!262943 lt!262940 mask!3119))))

(assert (=> b!575469 (= lt!262934 (seekEntryOrOpen!0 lt!262943 lt!262940 mask!3119))))

(assert (=> b!575469 (= lt!262935 lt!262936)))

(assert (=> b!575469 (= lt!262936 (seekKeyOrZeroReturnVacant!0 (x!53826 lt!262937) (index!24781 lt!262937) (index!24781 lt!262937) (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575470 () Bool)

(declare-fun res!363783 () Bool)

(assert (=> b!575470 (=> (not res!363783) (not e!331130))))

(assert (=> b!575470 (= res!363783 (and (= (size!17597 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17597 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17597 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575471 () Bool)

(declare-fun e!331129 () Bool)

(assert (=> b!575471 (= e!331130 e!331129)))

(declare-fun res!363782 () Bool)

(assert (=> b!575471 (=> (not res!363782) (not e!331129))))

(declare-fun lt!262944 () SeekEntryResult!5638)

(assert (=> b!575471 (= res!363782 (or (= lt!262944 (MissingZero!5638 i!1132)) (= lt!262944 (MissingVacant!5638 i!1132))))))

(assert (=> b!575471 (= lt!262944 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575472 () Bool)

(assert (=> b!575472 (= e!331131 true)))

(assert (=> b!575472 (= lt!262936 lt!262939)))

(declare-fun lt!262942 () Unit!18049)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35904 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18049)

(assert (=> b!575472 (= lt!262942 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53826 lt!262937) (index!24781 lt!262937) (index!24781 lt!262937) mask!3119))))

(declare-fun b!575473 () Bool)

(declare-fun res!363777 () Bool)

(assert (=> b!575473 (=> (not res!363777) (not e!331129))))

(assert (=> b!575473 (= res!363777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575474 () Bool)

(assert (=> b!575474 (= e!331129 e!331127)))

(declare-fun res!363778 () Bool)

(assert (=> b!575474 (=> (not res!363778) (not e!331127))))

(declare-fun lt!262932 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35904 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!575474 (= res!363778 (= lt!262937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262932 lt!262943 lt!262940 mask!3119)))))

(declare-fun lt!262938 () (_ BitVec 32))

(assert (=> b!575474 (= lt!262937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262938 (select (arr!17233 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575474 (= lt!262932 (toIndex!0 lt!262943 mask!3119))))

(assert (=> b!575474 (= lt!262943 (select (store (arr!17233 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575474 (= lt!262938 (toIndex!0 (select (arr!17233 a!3118) j!142) mask!3119))))

(assert (=> b!575474 (= lt!262940 (array!35905 (store (arr!17233 a!3118) i!1132 k0!1914) (size!17597 a!3118)))))

(declare-fun res!363784 () Bool)

(assert (=> start!52812 (=> (not res!363784) (not e!331130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52812 (= res!363784 (validMask!0 mask!3119))))

(assert (=> start!52812 e!331130))

(assert (=> start!52812 true))

(declare-fun array_inv!13092 (array!35904) Bool)

(assert (=> start!52812 (array_inv!13092 a!3118)))

(declare-fun b!575475 () Bool)

(assert (=> b!575475 (= e!331128 e!331126)))

(declare-fun res!363779 () Bool)

(assert (=> b!575475 (=> res!363779 e!331126)))

(assert (=> b!575475 (= res!363779 (or (= lt!262941 (select (arr!17233 a!3118) j!142)) (= lt!262941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575475 (= lt!262941 (select (arr!17233 a!3118) (index!24781 lt!262937)))))

(declare-fun b!575476 () Bool)

(declare-fun res!363776 () Bool)

(assert (=> b!575476 (=> (not res!363776) (not e!331129))))

(declare-datatypes ((List!11220 0))(
  ( (Nil!11217) (Cons!11216 (h!12258 (_ BitVec 64)) (t!17440 List!11220)) )
))
(declare-fun arrayNoDuplicates!0 (array!35904 (_ BitVec 32) List!11220) Bool)

(assert (=> b!575476 (= res!363776 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11217))))

(assert (= (and start!52812 res!363784) b!575470))

(assert (= (and b!575470 res!363783) b!575468))

(assert (= (and b!575468 res!363785) b!575467))

(assert (= (and b!575467 res!363786) b!575465))

(assert (= (and b!575465 res!363787) b!575471))

(assert (= (and b!575471 res!363782) b!575473))

(assert (= (and b!575473 res!363777) b!575476))

(assert (= (and b!575476 res!363776) b!575474))

(assert (= (and b!575474 res!363778) b!575466))

(assert (= (and b!575466 (not res!363780)) b!575475))

(assert (= (and b!575475 (not res!363779)) b!575469))

(assert (= (and b!575469 (not res!363781)) b!575472))

(declare-fun m!554399 () Bool)

(assert (=> start!52812 m!554399))

(declare-fun m!554401 () Bool)

(assert (=> start!52812 m!554401))

(declare-fun m!554403 () Bool)

(assert (=> b!575475 m!554403))

(declare-fun m!554405 () Bool)

(assert (=> b!575475 m!554405))

(declare-fun m!554407 () Bool)

(assert (=> b!575467 m!554407))

(assert (=> b!575474 m!554403))

(declare-fun m!554409 () Bool)

(assert (=> b!575474 m!554409))

(declare-fun m!554411 () Bool)

(assert (=> b!575474 m!554411))

(declare-fun m!554413 () Bool)

(assert (=> b!575474 m!554413))

(assert (=> b!575474 m!554403))

(declare-fun m!554415 () Bool)

(assert (=> b!575474 m!554415))

(assert (=> b!575474 m!554403))

(declare-fun m!554417 () Bool)

(assert (=> b!575474 m!554417))

(declare-fun m!554419 () Bool)

(assert (=> b!575474 m!554419))

(assert (=> b!575466 m!554403))

(assert (=> b!575466 m!554403))

(declare-fun m!554421 () Bool)

(assert (=> b!575466 m!554421))

(declare-fun m!554423 () Bool)

(assert (=> b!575466 m!554423))

(declare-fun m!554425 () Bool)

(assert (=> b!575466 m!554425))

(declare-fun m!554427 () Bool)

(assert (=> b!575472 m!554427))

(declare-fun m!554429 () Bool)

(assert (=> b!575476 m!554429))

(declare-fun m!554431 () Bool)

(assert (=> b!575469 m!554431))

(declare-fun m!554433 () Bool)

(assert (=> b!575469 m!554433))

(assert (=> b!575469 m!554403))

(assert (=> b!575469 m!554403))

(declare-fun m!554435 () Bool)

(assert (=> b!575469 m!554435))

(assert (=> b!575469 m!554413))

(declare-fun m!554437 () Bool)

(assert (=> b!575469 m!554437))

(declare-fun m!554439 () Bool)

(assert (=> b!575473 m!554439))

(declare-fun m!554441 () Bool)

(assert (=> b!575471 m!554441))

(declare-fun m!554443 () Bool)

(assert (=> b!575465 m!554443))

(assert (=> b!575468 m!554403))

(assert (=> b!575468 m!554403))

(declare-fun m!554445 () Bool)

(assert (=> b!575468 m!554445))

(check-sat (not b!575476) (not b!575471) (not b!575473) (not b!575474) (not b!575467) (not b!575465) (not b!575466) (not b!575468) (not b!575472) (not b!575469) (not start!52812))
(check-sat)
