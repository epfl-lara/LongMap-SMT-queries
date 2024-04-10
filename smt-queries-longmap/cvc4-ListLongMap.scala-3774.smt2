; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51702 () Bool)

(assert start!51702)

(declare-fun b!565523 () Bool)

(declare-fun e!325596 () Bool)

(declare-fun e!325593 () Bool)

(assert (=> b!565523 (= e!325596 e!325593)))

(declare-fun res!356493 () Bool)

(assert (=> b!565523 (=> (not res!356493) (not e!325593))))

(declare-datatypes ((SeekEntryResult!5503 0))(
  ( (MissingZero!5503 (index!24239 (_ BitVec 32))) (Found!5503 (index!24240 (_ BitVec 32))) (Intermediate!5503 (undefined!6315 Bool) (index!24241 (_ BitVec 32)) (x!53108 (_ BitVec 32))) (Undefined!5503) (MissingVacant!5503 (index!24242 (_ BitVec 32))) )
))
(declare-fun lt!257904 () SeekEntryResult!5503)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565523 (= res!356493 (or (= lt!257904 (MissingZero!5503 i!1132)) (= lt!257904 (MissingVacant!5503 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35510 0))(
  ( (array!35511 (arr!17054 (Array (_ BitVec 32) (_ BitVec 64))) (size!17418 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35510)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35510 (_ BitVec 32)) SeekEntryResult!5503)

(assert (=> b!565523 (= lt!257904 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565524 () Bool)

(declare-fun res!356492 () Bool)

(assert (=> b!565524 (=> (not res!356492) (not e!325596))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565524 (= res!356492 (validKeyInArray!0 (select (arr!17054 a!3118) j!142)))))

(declare-fun res!356498 () Bool)

(assert (=> start!51702 (=> (not res!356498) (not e!325596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51702 (= res!356498 (validMask!0 mask!3119))))

(assert (=> start!51702 e!325596))

(assert (=> start!51702 true))

(declare-fun array_inv!12850 (array!35510) Bool)

(assert (=> start!51702 (array_inv!12850 a!3118)))

(declare-fun b!565525 () Bool)

(declare-fun res!356496 () Bool)

(assert (=> b!565525 (=> (not res!356496) (not e!325596))))

(assert (=> b!565525 (= res!356496 (and (= (size!17418 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17418 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17418 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565526 () Bool)

(declare-fun res!356497 () Bool)

(assert (=> b!565526 (=> (not res!356497) (not e!325596))))

(assert (=> b!565526 (= res!356497 (validKeyInArray!0 k!1914))))

(declare-fun b!565527 () Bool)

(assert (=> b!565527 (= e!325593 (not true))))

(declare-fun e!325595 () Bool)

(assert (=> b!565527 e!325595))

(declare-fun res!356499 () Bool)

(assert (=> b!565527 (=> (not res!356499) (not e!325595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35510 (_ BitVec 32)) Bool)

(assert (=> b!565527 (= res!356499 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17708 0))(
  ( (Unit!17709) )
))
(declare-fun lt!257905 () Unit!17708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17708)

(assert (=> b!565527 (= lt!257905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565528 () Bool)

(declare-fun res!356500 () Bool)

(assert (=> b!565528 (=> (not res!356500) (not e!325593))))

(declare-datatypes ((List!11134 0))(
  ( (Nil!11131) (Cons!11130 (h!12136 (_ BitVec 64)) (t!17362 List!11134)) )
))
(declare-fun arrayNoDuplicates!0 (array!35510 (_ BitVec 32) List!11134) Bool)

(assert (=> b!565528 (= res!356500 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11131))))

(declare-fun b!565529 () Bool)

(declare-fun res!356495 () Bool)

(assert (=> b!565529 (=> (not res!356495) (not e!325593))))

(assert (=> b!565529 (= res!356495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565530 () Bool)

(declare-fun res!356501 () Bool)

(assert (=> b!565530 (=> (not res!356501) (not e!325596))))

(declare-fun arrayContainsKey!0 (array!35510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565530 (= res!356501 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565531 () Bool)

(declare-fun res!356494 () Bool)

(assert (=> b!565531 (=> (not res!356494) (not e!325593))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35510 (_ BitVec 32)) SeekEntryResult!5503)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565531 (= res!356494 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17054 a!3118) j!142) mask!3119) (select (arr!17054 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17054 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17054 a!3118) i!1132 k!1914) j!142) (array!35511 (store (arr!17054 a!3118) i!1132 k!1914) (size!17418 a!3118)) mask!3119)))))

(declare-fun b!565532 () Bool)

(assert (=> b!565532 (= e!325595 (= (seekEntryOrOpen!0 (select (arr!17054 a!3118) j!142) a!3118 mask!3119) (Found!5503 j!142)))))

(assert (= (and start!51702 res!356498) b!565525))

(assert (= (and b!565525 res!356496) b!565524))

(assert (= (and b!565524 res!356492) b!565526))

(assert (= (and b!565526 res!356497) b!565530))

(assert (= (and b!565530 res!356501) b!565523))

(assert (= (and b!565523 res!356493) b!565529))

(assert (= (and b!565529 res!356495) b!565528))

(assert (= (and b!565528 res!356500) b!565531))

(assert (= (and b!565531 res!356494) b!565527))

(assert (= (and b!565527 res!356499) b!565532))

(declare-fun m!543999 () Bool)

(assert (=> b!565524 m!543999))

(assert (=> b!565524 m!543999))

(declare-fun m!544001 () Bool)

(assert (=> b!565524 m!544001))

(declare-fun m!544003 () Bool)

(assert (=> b!565528 m!544003))

(assert (=> b!565532 m!543999))

(assert (=> b!565532 m!543999))

(declare-fun m!544005 () Bool)

(assert (=> b!565532 m!544005))

(declare-fun m!544007 () Bool)

(assert (=> b!565526 m!544007))

(assert (=> b!565531 m!543999))

(declare-fun m!544009 () Bool)

(assert (=> b!565531 m!544009))

(assert (=> b!565531 m!543999))

(declare-fun m!544011 () Bool)

(assert (=> b!565531 m!544011))

(declare-fun m!544013 () Bool)

(assert (=> b!565531 m!544013))

(assert (=> b!565531 m!544011))

(declare-fun m!544015 () Bool)

(assert (=> b!565531 m!544015))

(assert (=> b!565531 m!544009))

(assert (=> b!565531 m!543999))

(declare-fun m!544017 () Bool)

(assert (=> b!565531 m!544017))

(declare-fun m!544019 () Bool)

(assert (=> b!565531 m!544019))

(assert (=> b!565531 m!544011))

(assert (=> b!565531 m!544013))

(declare-fun m!544021 () Bool)

(assert (=> b!565530 m!544021))

(declare-fun m!544023 () Bool)

(assert (=> b!565523 m!544023))

(declare-fun m!544025 () Bool)

(assert (=> start!51702 m!544025))

(declare-fun m!544027 () Bool)

(assert (=> start!51702 m!544027))

(declare-fun m!544029 () Bool)

(assert (=> b!565527 m!544029))

(declare-fun m!544031 () Bool)

(assert (=> b!565527 m!544031))

(declare-fun m!544033 () Bool)

(assert (=> b!565529 m!544033))

(push 1)

