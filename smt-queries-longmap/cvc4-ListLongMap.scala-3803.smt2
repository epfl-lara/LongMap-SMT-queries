; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52176 () Bool)

(assert start!52176)

(declare-fun b!569535 () Bool)

(declare-fun e!327621 () Bool)

(declare-fun e!327623 () Bool)

(assert (=> b!569535 (= e!327621 e!327623)))

(declare-fun res!359557 () Bool)

(assert (=> b!569535 (=> (not res!359557) (not e!327623))))

(declare-datatypes ((SeekEntryResult!5590 0))(
  ( (MissingZero!5590 (index!24587 (_ BitVec 32))) (Found!5590 (index!24588 (_ BitVec 32))) (Intermediate!5590 (undefined!6402 Bool) (index!24589 (_ BitVec 32)) (x!53457 (_ BitVec 32))) (Undefined!5590) (MissingVacant!5590 (index!24590 (_ BitVec 32))) )
))
(declare-fun lt!259609 () SeekEntryResult!5590)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569535 (= res!359557 (or (= lt!259609 (MissingZero!5590 i!1132)) (= lt!259609 (MissingVacant!5590 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35699 0))(
  ( (array!35700 (arr!17141 (Array (_ BitVec 32) (_ BitVec 64))) (size!17505 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35699)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35699 (_ BitVec 32)) SeekEntryResult!5590)

(assert (=> b!569535 (= lt!259609 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!359560 () Bool)

(assert (=> start!52176 (=> (not res!359560) (not e!327621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52176 (= res!359560 (validMask!0 mask!3119))))

(assert (=> start!52176 e!327621))

(assert (=> start!52176 true))

(declare-fun array_inv!12937 (array!35699) Bool)

(assert (=> start!52176 (array_inv!12937 a!3118)))

(declare-fun b!569536 () Bool)

(declare-fun res!359561 () Bool)

(assert (=> b!569536 (=> (not res!359561) (not e!327623))))

(declare-datatypes ((List!11221 0))(
  ( (Nil!11218) (Cons!11217 (h!12238 (_ BitVec 64)) (t!17449 List!11221)) )
))
(declare-fun arrayNoDuplicates!0 (array!35699 (_ BitVec 32) List!11221) Bool)

(assert (=> b!569536 (= res!359561 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11218))))

(declare-fun b!569537 () Bool)

(declare-fun res!359554 () Bool)

(assert (=> b!569537 (=> (not res!359554) (not e!327621))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569537 (= res!359554 (validKeyInArray!0 (select (arr!17141 a!3118) j!142)))))

(declare-fun b!569538 () Bool)

(declare-fun e!327622 () Bool)

(assert (=> b!569538 (= e!327622 (not true))))

(declare-fun lt!259610 () SeekEntryResult!5590)

(declare-fun lt!259611 () SeekEntryResult!5590)

(assert (=> b!569538 (and (= lt!259611 (Found!5590 j!142)) (or (undefined!6402 lt!259610) (not (is-Intermediate!5590 lt!259610)) (= (select (arr!17141 a!3118) (index!24589 lt!259610)) (select (arr!17141 a!3118) j!142)) (not (= (select (arr!17141 a!3118) (index!24589 lt!259610)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259611 (MissingZero!5590 (index!24589 lt!259610)))))))

(assert (=> b!569538 (= lt!259611 (seekEntryOrOpen!0 (select (arr!17141 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35699 (_ BitVec 32)) Bool)

(assert (=> b!569538 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17882 0))(
  ( (Unit!17883) )
))
(declare-fun lt!259607 () Unit!17882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17882)

(assert (=> b!569538 (= lt!259607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569539 () Bool)

(declare-fun res!359558 () Bool)

(assert (=> b!569539 (=> (not res!359558) (not e!327621))))

(assert (=> b!569539 (= res!359558 (and (= (size!17505 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17505 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17505 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569540 () Bool)

(assert (=> b!569540 (= e!327623 e!327622)))

(declare-fun res!359559 () Bool)

(assert (=> b!569540 (=> (not res!359559) (not e!327622))))

(declare-fun lt!259612 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35699 (_ BitVec 32)) SeekEntryResult!5590)

(assert (=> b!569540 (= res!359559 (= lt!259610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259612 (select (store (arr!17141 a!3118) i!1132 k!1914) j!142) (array!35700 (store (arr!17141 a!3118) i!1132 k!1914) (size!17505 a!3118)) mask!3119)))))

(declare-fun lt!259608 () (_ BitVec 32))

(assert (=> b!569540 (= lt!259610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259608 (select (arr!17141 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569540 (= lt!259612 (toIndex!0 (select (store (arr!17141 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569540 (= lt!259608 (toIndex!0 (select (arr!17141 a!3118) j!142) mask!3119))))

(declare-fun b!569541 () Bool)

(declare-fun res!359556 () Bool)

(assert (=> b!569541 (=> (not res!359556) (not e!327621))))

(assert (=> b!569541 (= res!359556 (validKeyInArray!0 k!1914))))

(declare-fun b!569542 () Bool)

(declare-fun res!359555 () Bool)

(assert (=> b!569542 (=> (not res!359555) (not e!327623))))

(assert (=> b!569542 (= res!359555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569543 () Bool)

(declare-fun res!359553 () Bool)

(assert (=> b!569543 (=> (not res!359553) (not e!327621))))

(declare-fun arrayContainsKey!0 (array!35699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569543 (= res!359553 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52176 res!359560) b!569539))

(assert (= (and b!569539 res!359558) b!569537))

(assert (= (and b!569537 res!359554) b!569541))

(assert (= (and b!569541 res!359556) b!569543))

(assert (= (and b!569543 res!359553) b!569535))

(assert (= (and b!569535 res!359557) b!569542))

(assert (= (and b!569542 res!359555) b!569536))

(assert (= (and b!569536 res!359561) b!569540))

(assert (= (and b!569540 res!359559) b!569538))

(declare-fun m!548305 () Bool)

(assert (=> b!569535 m!548305))

(declare-fun m!548307 () Bool)

(assert (=> b!569540 m!548307))

(declare-fun m!548309 () Bool)

(assert (=> b!569540 m!548309))

(assert (=> b!569540 m!548307))

(declare-fun m!548311 () Bool)

(assert (=> b!569540 m!548311))

(declare-fun m!548313 () Bool)

(assert (=> b!569540 m!548313))

(assert (=> b!569540 m!548311))

(assert (=> b!569540 m!548307))

(declare-fun m!548315 () Bool)

(assert (=> b!569540 m!548315))

(declare-fun m!548317 () Bool)

(assert (=> b!569540 m!548317))

(assert (=> b!569540 m!548311))

(declare-fun m!548319 () Bool)

(assert (=> b!569540 m!548319))

(declare-fun m!548321 () Bool)

(assert (=> b!569536 m!548321))

(declare-fun m!548323 () Bool)

(assert (=> b!569541 m!548323))

(assert (=> b!569537 m!548307))

(assert (=> b!569537 m!548307))

(declare-fun m!548325 () Bool)

(assert (=> b!569537 m!548325))

(declare-fun m!548327 () Bool)

(assert (=> b!569543 m!548327))

(declare-fun m!548329 () Bool)

(assert (=> b!569542 m!548329))

(assert (=> b!569538 m!548307))

(declare-fun m!548331 () Bool)

(assert (=> b!569538 m!548331))

(declare-fun m!548333 () Bool)

(assert (=> b!569538 m!548333))

(declare-fun m!548335 () Bool)

(assert (=> b!569538 m!548335))

(assert (=> b!569538 m!548307))

(declare-fun m!548337 () Bool)

(assert (=> b!569538 m!548337))

(declare-fun m!548339 () Bool)

(assert (=> start!52176 m!548339))

(declare-fun m!548341 () Bool)

(assert (=> start!52176 m!548341))

(push 1)

