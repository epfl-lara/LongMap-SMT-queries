; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51954 () Bool)

(assert start!51954)

(declare-fun b!567613 () Bool)

(declare-fun res!358096 () Bool)

(declare-fun e!326638 () Bool)

(assert (=> b!567613 (=> (not res!358096) (not e!326638))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35595 0))(
  ( (array!35596 (arr!17092 (Array (_ BitVec 32) (_ BitVec 64))) (size!17456 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35595)

(declare-datatypes ((SeekEntryResult!5497 0))(
  ( (MissingZero!5497 (index!24215 (_ BitVec 32))) (Found!5497 (index!24216 (_ BitVec 32))) (Intermediate!5497 (undefined!6309 Bool) (index!24217 (_ BitVec 32)) (x!53237 (_ BitVec 32))) (Undefined!5497) (MissingVacant!5497 (index!24218 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35595 (_ BitVec 32)) SeekEntryResult!5497)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567613 (= res!358096 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17092 a!3118) j!142) mask!3119) (select (arr!17092 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17092 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17092 a!3118) i!1132 k0!1914) j!142) (array!35596 (store (arr!17092 a!3118) i!1132 k0!1914) (size!17456 a!3118)) mask!3119)))))

(declare-fun b!567614 () Bool)

(declare-fun res!358094 () Bool)

(declare-fun e!326637 () Bool)

(assert (=> b!567614 (=> (not res!358094) (not e!326637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567614 (= res!358094 (validKeyInArray!0 k0!1914))))

(declare-fun b!567615 () Bool)

(declare-fun res!358102 () Bool)

(assert (=> b!567615 (=> (not res!358102) (not e!326637))))

(assert (=> b!567615 (= res!358102 (and (= (size!17456 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17456 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17456 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567616 () Bool)

(declare-fun res!358099 () Bool)

(assert (=> b!567616 (=> (not res!358099) (not e!326638))))

(declare-datatypes ((List!11079 0))(
  ( (Nil!11076) (Cons!11075 (h!12090 (_ BitVec 64)) (t!17299 List!11079)) )
))
(declare-fun arrayNoDuplicates!0 (array!35595 (_ BitVec 32) List!11079) Bool)

(assert (=> b!567616 (= res!358099 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11076))))

(declare-fun res!358101 () Bool)

(assert (=> start!51954 (=> (not res!358101) (not e!326637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51954 (= res!358101 (validMask!0 mask!3119))))

(assert (=> start!51954 e!326637))

(assert (=> start!51954 true))

(declare-fun array_inv!12951 (array!35595) Bool)

(assert (=> start!51954 (array_inv!12951 a!3118)))

(declare-fun b!567617 () Bool)

(declare-fun res!358093 () Bool)

(assert (=> b!567617 (=> (not res!358093) (not e!326637))))

(assert (=> b!567617 (= res!358093 (validKeyInArray!0 (select (arr!17092 a!3118) j!142)))))

(declare-fun b!567618 () Bool)

(declare-fun res!358098 () Bool)

(assert (=> b!567618 (=> (not res!358098) (not e!326637))))

(declare-fun arrayContainsKey!0 (array!35595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567618 (= res!358098 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567619 () Bool)

(assert (=> b!567619 (= e!326637 e!326638)))

(declare-fun res!358100 () Bool)

(assert (=> b!567619 (=> (not res!358100) (not e!326638))))

(declare-fun lt!258621 () SeekEntryResult!5497)

(assert (=> b!567619 (= res!358100 (or (= lt!258621 (MissingZero!5497 i!1132)) (= lt!258621 (MissingVacant!5497 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35595 (_ BitVec 32)) SeekEntryResult!5497)

(assert (=> b!567619 (= lt!258621 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567620 () Bool)

(declare-fun e!326640 () Bool)

(assert (=> b!567620 (= e!326640 (= (seekEntryOrOpen!0 (select (arr!17092 a!3118) j!142) a!3118 mask!3119) (Found!5497 j!142)))))

(declare-fun b!567621 () Bool)

(assert (=> b!567621 (= e!326638 (not true))))

(assert (=> b!567621 e!326640))

(declare-fun res!358097 () Bool)

(assert (=> b!567621 (=> (not res!358097) (not e!326640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35595 (_ BitVec 32)) Bool)

(assert (=> b!567621 (= res!358097 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17767 0))(
  ( (Unit!17768) )
))
(declare-fun lt!258622 () Unit!17767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17767)

(assert (=> b!567621 (= lt!258622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567622 () Bool)

(declare-fun res!358095 () Bool)

(assert (=> b!567622 (=> (not res!358095) (not e!326638))))

(assert (=> b!567622 (= res!358095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51954 res!358101) b!567615))

(assert (= (and b!567615 res!358102) b!567617))

(assert (= (and b!567617 res!358093) b!567614))

(assert (= (and b!567614 res!358094) b!567618))

(assert (= (and b!567618 res!358098) b!567619))

(assert (= (and b!567619 res!358100) b!567622))

(assert (= (and b!567622 res!358095) b!567616))

(assert (= (and b!567616 res!358099) b!567613))

(assert (= (and b!567613 res!358096) b!567621))

(assert (= (and b!567621 res!358097) b!567620))

(declare-fun m!546335 () Bool)

(assert (=> b!567613 m!546335))

(declare-fun m!546337 () Bool)

(assert (=> b!567613 m!546337))

(assert (=> b!567613 m!546335))

(declare-fun m!546339 () Bool)

(assert (=> b!567613 m!546339))

(declare-fun m!546341 () Bool)

(assert (=> b!567613 m!546341))

(assert (=> b!567613 m!546339))

(declare-fun m!546343 () Bool)

(assert (=> b!567613 m!546343))

(assert (=> b!567613 m!546337))

(assert (=> b!567613 m!546335))

(declare-fun m!546345 () Bool)

(assert (=> b!567613 m!546345))

(declare-fun m!546347 () Bool)

(assert (=> b!567613 m!546347))

(assert (=> b!567613 m!546339))

(assert (=> b!567613 m!546341))

(declare-fun m!546349 () Bool)

(assert (=> b!567619 m!546349))

(assert (=> b!567617 m!546335))

(assert (=> b!567617 m!546335))

(declare-fun m!546351 () Bool)

(assert (=> b!567617 m!546351))

(declare-fun m!546353 () Bool)

(assert (=> b!567616 m!546353))

(assert (=> b!567620 m!546335))

(assert (=> b!567620 m!546335))

(declare-fun m!546355 () Bool)

(assert (=> b!567620 m!546355))

(declare-fun m!546357 () Bool)

(assert (=> b!567614 m!546357))

(declare-fun m!546359 () Bool)

(assert (=> b!567622 m!546359))

(declare-fun m!546361 () Bool)

(assert (=> b!567618 m!546361))

(declare-fun m!546363 () Bool)

(assert (=> b!567621 m!546363))

(declare-fun m!546365 () Bool)

(assert (=> b!567621 m!546365))

(declare-fun m!546367 () Bool)

(assert (=> start!51954 m!546367))

(declare-fun m!546369 () Bool)

(assert (=> start!51954 m!546369))

(check-sat (not b!567616) (not b!567620) (not b!567617) (not b!567621) (not start!51954) (not b!567619) (not b!567613) (not b!567622) (not b!567618) (not b!567614))
(check-sat)
