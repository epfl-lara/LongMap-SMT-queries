; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51250 () Bool)

(assert start!51250)

(declare-fun b!559516 () Bool)

(declare-fun e!322341 () Bool)

(declare-fun e!322339 () Bool)

(assert (=> b!559516 (= e!322341 e!322339)))

(declare-fun res!350909 () Bool)

(assert (=> b!559516 (=> (not res!350909) (not e!322339))))

(declare-datatypes ((SeekEntryResult!5340 0))(
  ( (MissingZero!5340 (index!23587 (_ BitVec 32))) (Found!5340 (index!23588 (_ BitVec 32))) (Intermediate!5340 (undefined!6152 Bool) (index!23589 (_ BitVec 32)) (x!52498 (_ BitVec 32))) (Undefined!5340) (MissingVacant!5340 (index!23590 (_ BitVec 32))) )
))
(declare-fun lt!254285 () SeekEntryResult!5340)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559516 (= res!350909 (or (= lt!254285 (MissingZero!5340 i!1132)) (= lt!254285 (MissingVacant!5340 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35178 0))(
  ( (array!35179 (arr!16891 (Array (_ BitVec 32) (_ BitVec 64))) (size!17255 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35178)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35178 (_ BitVec 32)) SeekEntryResult!5340)

(assert (=> b!559516 (= lt!254285 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!559517 () Bool)

(declare-fun res!350911 () Bool)

(assert (=> b!559517 (=> (not res!350911) (not e!322341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559517 (= res!350911 (validKeyInArray!0 k0!1914))))

(declare-fun b!559518 () Bool)

(declare-fun res!350910 () Bool)

(assert (=> b!559518 (=> (not res!350910) (not e!322341))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!559518 (= res!350910 (validKeyInArray!0 (select (arr!16891 a!3118) j!142)))))

(declare-fun b!559519 () Bool)

(declare-fun res!350915 () Bool)

(assert (=> b!559519 (=> (not res!350915) (not e!322341))))

(assert (=> b!559519 (= res!350915 (and (= (size!17255 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17255 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17255 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559520 () Bool)

(declare-fun res!350914 () Bool)

(assert (=> b!559520 (=> (not res!350914) (not e!322339))))

(declare-datatypes ((List!10971 0))(
  ( (Nil!10968) (Cons!10967 (h!11967 (_ BitVec 64)) (t!17199 List!10971)) )
))
(declare-fun arrayNoDuplicates!0 (array!35178 (_ BitVec 32) List!10971) Bool)

(assert (=> b!559520 (= res!350914 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10968))))

(declare-fun res!350912 () Bool)

(assert (=> start!51250 (=> (not res!350912) (not e!322341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51250 (= res!350912 (validMask!0 mask!3119))))

(assert (=> start!51250 e!322341))

(assert (=> start!51250 true))

(declare-fun array_inv!12687 (array!35178) Bool)

(assert (=> start!51250 (array_inv!12687 a!3118)))

(declare-fun b!559521 () Bool)

(declare-fun e!322343 () Bool)

(declare-fun e!322342 () Bool)

(assert (=> b!559521 (= e!322343 e!322342)))

(declare-fun res!350905 () Bool)

(assert (=> b!559521 (=> res!350905 e!322342)))

(declare-fun lt!254289 () SeekEntryResult!5340)

(get-info :version)

(assert (=> b!559521 (= res!350905 (or (undefined!6152 lt!254289) (not ((_ is Intermediate!5340) lt!254289)) (= (select (arr!16891 a!3118) (index!23589 lt!254289)) (select (arr!16891 a!3118) j!142)) (= (select (arr!16891 a!3118) (index!23589 lt!254289)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559522 () Bool)

(declare-fun e!322344 () Bool)

(assert (=> b!559522 (= e!322344 (not true))))

(assert (=> b!559522 e!322343))

(declare-fun res!350908 () Bool)

(assert (=> b!559522 (=> (not res!350908) (not e!322343))))

(declare-fun lt!254286 () SeekEntryResult!5340)

(assert (=> b!559522 (= res!350908 (= lt!254286 (Found!5340 j!142)))))

(assert (=> b!559522 (= lt!254286 (seekEntryOrOpen!0 (select (arr!16891 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35178 (_ BitVec 32)) Bool)

(assert (=> b!559522 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17454 0))(
  ( (Unit!17455) )
))
(declare-fun lt!254288 () Unit!17454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17454)

(assert (=> b!559522 (= lt!254288 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559523 () Bool)

(assert (=> b!559523 (= e!322339 e!322344)))

(declare-fun res!350906 () Bool)

(assert (=> b!559523 (=> (not res!350906) (not e!322344))))

(declare-fun lt!254290 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35178 (_ BitVec 32)) SeekEntryResult!5340)

(assert (=> b!559523 (= res!350906 (= lt!254289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254290 (select (store (arr!16891 a!3118) i!1132 k0!1914) j!142) (array!35179 (store (arr!16891 a!3118) i!1132 k0!1914) (size!17255 a!3118)) mask!3119)))))

(declare-fun lt!254287 () (_ BitVec 32))

(assert (=> b!559523 (= lt!254289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254287 (select (arr!16891 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559523 (= lt!254290 (toIndex!0 (select (store (arr!16891 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!559523 (= lt!254287 (toIndex!0 (select (arr!16891 a!3118) j!142) mask!3119))))

(declare-fun b!559524 () Bool)

(declare-fun res!350907 () Bool)

(assert (=> b!559524 (=> (not res!350907) (not e!322339))))

(assert (=> b!559524 (= res!350907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559525 () Bool)

(declare-fun res!350913 () Bool)

(assert (=> b!559525 (=> (not res!350913) (not e!322341))))

(declare-fun arrayContainsKey!0 (array!35178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559525 (= res!350913 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559526 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35178 (_ BitVec 32)) SeekEntryResult!5340)

(assert (=> b!559526 (= e!322342 (= lt!254286 (seekKeyOrZeroReturnVacant!0 (x!52498 lt!254289) (index!23589 lt!254289) (index!23589 lt!254289) (select (arr!16891 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51250 res!350912) b!559519))

(assert (= (and b!559519 res!350915) b!559518))

(assert (= (and b!559518 res!350910) b!559517))

(assert (= (and b!559517 res!350911) b!559525))

(assert (= (and b!559525 res!350913) b!559516))

(assert (= (and b!559516 res!350909) b!559524))

(assert (= (and b!559524 res!350907) b!559520))

(assert (= (and b!559520 res!350914) b!559523))

(assert (= (and b!559523 res!350906) b!559522))

(assert (= (and b!559522 res!350908) b!559521))

(assert (= (and b!559521 (not res!350905)) b!559526))

(declare-fun m!537331 () Bool)

(assert (=> b!559517 m!537331))

(declare-fun m!537333 () Bool)

(assert (=> b!559521 m!537333))

(declare-fun m!537335 () Bool)

(assert (=> b!559521 m!537335))

(assert (=> b!559522 m!537335))

(assert (=> b!559522 m!537335))

(declare-fun m!537337 () Bool)

(assert (=> b!559522 m!537337))

(declare-fun m!537339 () Bool)

(assert (=> b!559522 m!537339))

(declare-fun m!537341 () Bool)

(assert (=> b!559522 m!537341))

(assert (=> b!559518 m!537335))

(assert (=> b!559518 m!537335))

(declare-fun m!537343 () Bool)

(assert (=> b!559518 m!537343))

(declare-fun m!537345 () Bool)

(assert (=> start!51250 m!537345))

(declare-fun m!537347 () Bool)

(assert (=> start!51250 m!537347))

(assert (=> b!559523 m!537335))

(declare-fun m!537349 () Bool)

(assert (=> b!559523 m!537349))

(assert (=> b!559523 m!537335))

(declare-fun m!537351 () Bool)

(assert (=> b!559523 m!537351))

(assert (=> b!559523 m!537351))

(declare-fun m!537353 () Bool)

(assert (=> b!559523 m!537353))

(declare-fun m!537355 () Bool)

(assert (=> b!559523 m!537355))

(assert (=> b!559523 m!537335))

(declare-fun m!537357 () Bool)

(assert (=> b!559523 m!537357))

(assert (=> b!559523 m!537351))

(declare-fun m!537359 () Bool)

(assert (=> b!559523 m!537359))

(assert (=> b!559526 m!537335))

(assert (=> b!559526 m!537335))

(declare-fun m!537361 () Bool)

(assert (=> b!559526 m!537361))

(declare-fun m!537363 () Bool)

(assert (=> b!559520 m!537363))

(declare-fun m!537365 () Bool)

(assert (=> b!559525 m!537365))

(declare-fun m!537367 () Bool)

(assert (=> b!559524 m!537367))

(declare-fun m!537369 () Bool)

(assert (=> b!559516 m!537369))

(check-sat (not b!559524) (not b!559520) (not b!559518) (not b!559522) (not b!559516) (not b!559523) (not b!559525) (not start!51250) (not b!559526) (not b!559517))
(check-sat)
