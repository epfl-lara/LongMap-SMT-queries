; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51600 () Bool)

(assert start!51600)

(declare-fun b!564658 () Bool)

(declare-fun e!325203 () Bool)

(declare-fun e!325202 () Bool)

(assert (=> b!564658 (= e!325203 e!325202)))

(declare-fun res!355815 () Bool)

(assert (=> b!564658 (=> (not res!355815) (not e!325202))))

(declare-datatypes ((SeekEntryResult!5482 0))(
  ( (MissingZero!5482 (index!24155 (_ BitVec 32))) (Found!5482 (index!24156 (_ BitVec 32))) (Intermediate!5482 (undefined!6294 Bool) (index!24157 (_ BitVec 32)) (x!53025 (_ BitVec 32))) (Undefined!5482) (MissingVacant!5482 (index!24158 (_ BitVec 32))) )
))
(declare-fun lt!257638 () SeekEntryResult!5482)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564658 (= res!355815 (or (= lt!257638 (MissingZero!5482 i!1132)) (= lt!257638 (MissingVacant!5482 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35465 0))(
  ( (array!35466 (arr!17033 (Array (_ BitVec 32) (_ BitVec 64))) (size!17397 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35465)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35465 (_ BitVec 32)) SeekEntryResult!5482)

(assert (=> b!564658 (= lt!257638 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564659 () Bool)

(declare-fun res!355814 () Bool)

(assert (=> b!564659 (=> (not res!355814) (not e!325203))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564659 (= res!355814 (and (= (size!17397 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17397 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17397 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355816 () Bool)

(assert (=> start!51600 (=> (not res!355816) (not e!325203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51600 (= res!355816 (validMask!0 mask!3119))))

(assert (=> start!51600 e!325203))

(assert (=> start!51600 true))

(declare-fun array_inv!12829 (array!35465) Bool)

(assert (=> start!51600 (array_inv!12829 a!3118)))

(declare-fun b!564660 () Bool)

(assert (=> b!564660 (= e!325202 false)))

(declare-fun lt!257637 () (_ BitVec 32))

(declare-fun lt!257641 () SeekEntryResult!5482)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35465 (_ BitVec 32)) SeekEntryResult!5482)

(assert (=> b!564660 (= lt!257641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257637 (select (store (arr!17033 a!3118) i!1132 k!1914) j!142) (array!35466 (store (arr!17033 a!3118) i!1132 k!1914) (size!17397 a!3118)) mask!3119))))

(declare-fun lt!257640 () SeekEntryResult!5482)

(declare-fun lt!257639 () (_ BitVec 32))

(assert (=> b!564660 (= lt!257640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257639 (select (arr!17033 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564660 (= lt!257637 (toIndex!0 (select (store (arr!17033 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!564660 (= lt!257639 (toIndex!0 (select (arr!17033 a!3118) j!142) mask!3119))))

(declare-fun b!564661 () Bool)

(declare-fun res!355812 () Bool)

(assert (=> b!564661 (=> (not res!355812) (not e!325203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564661 (= res!355812 (validKeyInArray!0 (select (arr!17033 a!3118) j!142)))))

(declare-fun b!564662 () Bool)

(declare-fun res!355817 () Bool)

(assert (=> b!564662 (=> (not res!355817) (not e!325203))))

(declare-fun arrayContainsKey!0 (array!35465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564662 (= res!355817 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564663 () Bool)

(declare-fun res!355813 () Bool)

(assert (=> b!564663 (=> (not res!355813) (not e!325202))))

(declare-datatypes ((List!11113 0))(
  ( (Nil!11110) (Cons!11109 (h!12112 (_ BitVec 64)) (t!17341 List!11113)) )
))
(declare-fun arrayNoDuplicates!0 (array!35465 (_ BitVec 32) List!11113) Bool)

(assert (=> b!564663 (= res!355813 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11110))))

(declare-fun b!564664 () Bool)

(declare-fun res!355810 () Bool)

(assert (=> b!564664 (=> (not res!355810) (not e!325203))))

(assert (=> b!564664 (= res!355810 (validKeyInArray!0 k!1914))))

(declare-fun b!564665 () Bool)

(declare-fun res!355811 () Bool)

(assert (=> b!564665 (=> (not res!355811) (not e!325202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35465 (_ BitVec 32)) Bool)

(assert (=> b!564665 (= res!355811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51600 res!355816) b!564659))

(assert (= (and b!564659 res!355814) b!564661))

(assert (= (and b!564661 res!355812) b!564664))

(assert (= (and b!564664 res!355810) b!564662))

(assert (= (and b!564662 res!355817) b!564658))

(assert (= (and b!564658 res!355815) b!564665))

(assert (= (and b!564665 res!355811) b!564663))

(assert (= (and b!564663 res!355813) b!564660))

(declare-fun m!543111 () Bool)

(assert (=> b!564661 m!543111))

(assert (=> b!564661 m!543111))

(declare-fun m!543113 () Bool)

(assert (=> b!564661 m!543113))

(declare-fun m!543115 () Bool)

(assert (=> b!564665 m!543115))

(assert (=> b!564660 m!543111))

(declare-fun m!543117 () Bool)

(assert (=> b!564660 m!543117))

(assert (=> b!564660 m!543111))

(declare-fun m!543119 () Bool)

(assert (=> b!564660 m!543119))

(declare-fun m!543121 () Bool)

(assert (=> b!564660 m!543121))

(assert (=> b!564660 m!543119))

(declare-fun m!543123 () Bool)

(assert (=> b!564660 m!543123))

(assert (=> b!564660 m!543119))

(declare-fun m!543125 () Bool)

(assert (=> b!564660 m!543125))

(assert (=> b!564660 m!543111))

(declare-fun m!543127 () Bool)

(assert (=> b!564660 m!543127))

(declare-fun m!543129 () Bool)

(assert (=> start!51600 m!543129))

(declare-fun m!543131 () Bool)

(assert (=> start!51600 m!543131))

(declare-fun m!543133 () Bool)

(assert (=> b!564664 m!543133))

(declare-fun m!543135 () Bool)

(assert (=> b!564658 m!543135))

(declare-fun m!543137 () Bool)

(assert (=> b!564662 m!543137))

(declare-fun m!543139 () Bool)

(assert (=> b!564663 m!543139))

(push 1)

(assert (not b!564663))

