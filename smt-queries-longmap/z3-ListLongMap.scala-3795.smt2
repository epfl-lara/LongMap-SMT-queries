; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52112 () Bool)

(assert start!52112)

(declare-fun b!568562 () Bool)

(declare-fun e!327137 () Bool)

(assert (=> b!568562 (= e!327137 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5560 0))(
  ( (MissingZero!5560 (index!24467 (_ BitVec 32))) (Found!5560 (index!24468 (_ BitVec 32))) (Intermediate!5560 (undefined!6372 Bool) (index!24469 (_ BitVec 32)) (x!53358 (_ BitVec 32))) (Undefined!5560) (MissingVacant!5560 (index!24470 (_ BitVec 32))) )
))
(declare-fun lt!258910 () SeekEntryResult!5560)

(declare-fun lt!258908 () SeekEntryResult!5560)

(declare-datatypes ((array!35644 0))(
  ( (array!35645 (arr!17114 (Array (_ BitVec 32) (_ BitVec 64))) (size!17479 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35644)

(get-info :version)

(assert (=> b!568562 (and (= lt!258908 (Found!5560 j!142)) (or (undefined!6372 lt!258910) (not ((_ is Intermediate!5560) lt!258910)) (= (select (arr!17114 a!3118) (index!24469 lt!258910)) (select (arr!17114 a!3118) j!142)) (not (= (select (arr!17114 a!3118) (index!24469 lt!258910)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!258908 (MissingZero!5560 (index!24469 lt!258910)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35644 (_ BitVec 32)) SeekEntryResult!5560)

(assert (=> b!568562 (= lt!258908 (seekEntryOrOpen!0 (select (arr!17114 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35644 (_ BitVec 32)) Bool)

(assert (=> b!568562 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17808 0))(
  ( (Unit!17809) )
))
(declare-fun lt!258906 () Unit!17808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17808)

(assert (=> b!568562 (= lt!258906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568563 () Bool)

(declare-fun e!327136 () Bool)

(assert (=> b!568563 (= e!327136 e!327137)))

(declare-fun res!358730 () Bool)

(assert (=> b!568563 (=> (not res!358730) (not e!327137))))

(declare-fun lt!258905 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35644 (_ BitVec 32)) SeekEntryResult!5560)

(assert (=> b!568563 (= res!358730 (= lt!258910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258905 (select (store (arr!17114 a!3118) i!1132 k0!1914) j!142) (array!35645 (store (arr!17114 a!3118) i!1132 k0!1914) (size!17479 a!3118)) mask!3119)))))

(declare-fun lt!258909 () (_ BitVec 32))

(assert (=> b!568563 (= lt!258910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258909 (select (arr!17114 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568563 (= lt!258905 (toIndex!0 (select (store (arr!17114 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568563 (= lt!258909 (toIndex!0 (select (arr!17114 a!3118) j!142) mask!3119))))

(declare-fun b!568564 () Bool)

(declare-fun e!327138 () Bool)

(assert (=> b!568564 (= e!327138 e!327136)))

(declare-fun res!358723 () Bool)

(assert (=> b!568564 (=> (not res!358723) (not e!327136))))

(declare-fun lt!258907 () SeekEntryResult!5560)

(assert (=> b!568564 (= res!358723 (or (= lt!258907 (MissingZero!5560 i!1132)) (= lt!258907 (MissingVacant!5560 i!1132))))))

(assert (=> b!568564 (= lt!258907 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!358728 () Bool)

(assert (=> start!52112 (=> (not res!358728) (not e!327138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52112 (= res!358728 (validMask!0 mask!3119))))

(assert (=> start!52112 e!327138))

(assert (=> start!52112 true))

(declare-fun array_inv!12997 (array!35644) Bool)

(assert (=> start!52112 (array_inv!12997 a!3118)))

(declare-fun b!568565 () Bool)

(declare-fun res!358725 () Bool)

(assert (=> b!568565 (=> (not res!358725) (not e!327138))))

(assert (=> b!568565 (= res!358725 (and (= (size!17479 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17479 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17479 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568566 () Bool)

(declare-fun res!358726 () Bool)

(assert (=> b!568566 (=> (not res!358726) (not e!327138))))

(declare-fun arrayContainsKey!0 (array!35644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568566 (= res!358726 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568567 () Bool)

(declare-fun res!358722 () Bool)

(assert (=> b!568567 (=> (not res!358722) (not e!327136))))

(assert (=> b!568567 (= res!358722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568568 () Bool)

(declare-fun res!358724 () Bool)

(assert (=> b!568568 (=> (not res!358724) (not e!327138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568568 (= res!358724 (validKeyInArray!0 (select (arr!17114 a!3118) j!142)))))

(declare-fun b!568569 () Bool)

(declare-fun res!358727 () Bool)

(assert (=> b!568569 (=> (not res!358727) (not e!327138))))

(assert (=> b!568569 (= res!358727 (validKeyInArray!0 k0!1914))))

(declare-fun b!568570 () Bool)

(declare-fun res!358729 () Bool)

(assert (=> b!568570 (=> (not res!358729) (not e!327136))))

(declare-datatypes ((List!11233 0))(
  ( (Nil!11230) (Cons!11229 (h!12250 (_ BitVec 64)) (t!17452 List!11233)) )
))
(declare-fun arrayNoDuplicates!0 (array!35644 (_ BitVec 32) List!11233) Bool)

(assert (=> b!568570 (= res!358729 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11230))))

(assert (= (and start!52112 res!358728) b!568565))

(assert (= (and b!568565 res!358725) b!568568))

(assert (= (and b!568568 res!358724) b!568569))

(assert (= (and b!568569 res!358727) b!568566))

(assert (= (and b!568566 res!358726) b!568564))

(assert (= (and b!568564 res!358723) b!568567))

(assert (= (and b!568567 res!358722) b!568570))

(assert (= (and b!568570 res!358729) b!568563))

(assert (= (and b!568563 res!358730) b!568562))

(declare-fun m!546545 () Bool)

(assert (=> b!568569 m!546545))

(declare-fun m!546547 () Bool)

(assert (=> b!568567 m!546547))

(declare-fun m!546549 () Bool)

(assert (=> b!568563 m!546549))

(declare-fun m!546551 () Bool)

(assert (=> b!568563 m!546551))

(assert (=> b!568563 m!546549))

(declare-fun m!546553 () Bool)

(assert (=> b!568563 m!546553))

(assert (=> b!568563 m!546549))

(declare-fun m!546555 () Bool)

(assert (=> b!568563 m!546555))

(assert (=> b!568563 m!546555))

(declare-fun m!546557 () Bool)

(assert (=> b!568563 m!546557))

(declare-fun m!546559 () Bool)

(assert (=> b!568563 m!546559))

(assert (=> b!568563 m!546555))

(declare-fun m!546561 () Bool)

(assert (=> b!568563 m!546561))

(declare-fun m!546563 () Bool)

(assert (=> b!568570 m!546563))

(declare-fun m!546565 () Bool)

(assert (=> b!568566 m!546565))

(declare-fun m!546567 () Bool)

(assert (=> b!568564 m!546567))

(declare-fun m!546569 () Bool)

(assert (=> start!52112 m!546569))

(declare-fun m!546571 () Bool)

(assert (=> start!52112 m!546571))

(assert (=> b!568562 m!546549))

(declare-fun m!546573 () Bool)

(assert (=> b!568562 m!546573))

(assert (=> b!568562 m!546549))

(declare-fun m!546575 () Bool)

(assert (=> b!568562 m!546575))

(declare-fun m!546577 () Bool)

(assert (=> b!568562 m!546577))

(declare-fun m!546579 () Bool)

(assert (=> b!568562 m!546579))

(assert (=> b!568568 m!546549))

(assert (=> b!568568 m!546549))

(declare-fun m!546581 () Bool)

(assert (=> b!568568 m!546581))

(check-sat (not b!568567) (not b!568569) (not b!568570) (not b!568563) (not b!568564) (not b!568566) (not b!568562) (not b!568568) (not start!52112))
(check-sat)
