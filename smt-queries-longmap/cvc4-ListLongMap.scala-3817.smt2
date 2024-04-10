; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52392 () Bool)

(assert start!52392)

(declare-fun b!571607 () Bool)

(declare-fun e!328770 () Bool)

(declare-fun e!328768 () Bool)

(assert (=> b!571607 (= e!328770 e!328768)))

(declare-fun res!361116 () Bool)

(assert (=> b!571607 (=> res!361116 e!328768)))

(declare-datatypes ((SeekEntryResult!5632 0))(
  ( (MissingZero!5632 (index!24755 (_ BitVec 32))) (Found!5632 (index!24756 (_ BitVec 32))) (Intermediate!5632 (undefined!6444 Bool) (index!24757 (_ BitVec 32)) (x!53629 (_ BitVec 32))) (Undefined!5632) (MissingVacant!5632 (index!24758 (_ BitVec 32))) )
))
(declare-fun lt!260660 () SeekEntryResult!5632)

(assert (=> b!571607 (= res!361116 (or (undefined!6444 lt!260660) (not (is-Intermediate!5632 lt!260660))))))

(declare-fun b!571608 () Bool)

(declare-fun res!361122 () Bool)

(declare-fun e!328764 () Bool)

(assert (=> b!571608 (=> (not res!361122) (not e!328764))))

(declare-datatypes ((array!35789 0))(
  ( (array!35790 (arr!17183 (Array (_ BitVec 32) (_ BitVec 64))) (size!17547 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35789)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35789 (_ BitVec 32)) Bool)

(assert (=> b!571608 (= res!361122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571609 () Bool)

(declare-fun e!328769 () Bool)

(declare-fun e!328767 () Bool)

(assert (=> b!571609 (= e!328769 e!328767)))

(declare-fun res!361119 () Bool)

(assert (=> b!571609 (=> (not res!361119) (not e!328767))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260668 () SeekEntryResult!5632)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35789 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!571609 (= res!361119 (= lt!260668 (seekKeyOrZeroReturnVacant!0 (x!53629 lt!260660) (index!24757 lt!260660) (index!24757 lt!260660) (select (arr!17183 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!361115 () Bool)

(declare-fun e!328765 () Bool)

(assert (=> start!52392 (=> (not res!361115) (not e!328765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52392 (= res!361115 (validMask!0 mask!3119))))

(assert (=> start!52392 e!328765))

(assert (=> start!52392 true))

(declare-fun array_inv!12979 (array!35789) Bool)

(assert (=> start!52392 (array_inv!12979 a!3118)))

(declare-fun b!571610 () Bool)

(declare-fun e!328763 () Bool)

(assert (=> b!571610 (= e!328763 (not true))))

(assert (=> b!571610 e!328770))

(declare-fun res!361123 () Bool)

(assert (=> b!571610 (=> (not res!361123) (not e!328770))))

(assert (=> b!571610 (= res!361123 (= lt!260668 (Found!5632 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35789 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!571610 (= lt!260668 (seekEntryOrOpen!0 (select (arr!17183 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571610 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17966 0))(
  ( (Unit!17967) )
))
(declare-fun lt!260663 () Unit!17966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17966)

(assert (=> b!571610 (= lt!260663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571611 () Bool)

(declare-fun res!361120 () Bool)

(assert (=> b!571611 (=> (not res!361120) (not e!328765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571611 (= res!361120 (validKeyInArray!0 (select (arr!17183 a!3118) j!142)))))

(declare-fun b!571612 () Bool)

(declare-fun res!361125 () Bool)

(assert (=> b!571612 (=> (not res!361125) (not e!328765))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!571612 (= res!361125 (validKeyInArray!0 k!1914))))

(declare-fun b!571613 () Bool)

(assert (=> b!571613 (= e!328764 e!328763)))

(declare-fun res!361127 () Bool)

(assert (=> b!571613 (=> (not res!361127) (not e!328763))))

(declare-fun lt!260662 () (_ BitVec 32))

(declare-fun lt!260661 () array!35789)

(declare-fun lt!260665 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35789 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!571613 (= res!361127 (= lt!260660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260662 lt!260665 lt!260661 mask!3119)))))

(declare-fun lt!260664 () (_ BitVec 32))

(assert (=> b!571613 (= lt!260660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260664 (select (arr!17183 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571613 (= lt!260662 (toIndex!0 lt!260665 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571613 (= lt!260665 (select (store (arr!17183 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571613 (= lt!260664 (toIndex!0 (select (arr!17183 a!3118) j!142) mask!3119))))

(assert (=> b!571613 (= lt!260661 (array!35790 (store (arr!17183 a!3118) i!1132 k!1914) (size!17547 a!3118)))))

(declare-fun b!571614 () Bool)

(assert (=> b!571614 (= e!328768 e!328769)))

(declare-fun res!361121 () Bool)

(assert (=> b!571614 (=> res!361121 e!328769)))

(declare-fun lt!260666 () (_ BitVec 64))

(assert (=> b!571614 (= res!361121 (or (= lt!260666 (select (arr!17183 a!3118) j!142)) (= lt!260666 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571614 (= lt!260666 (select (arr!17183 a!3118) (index!24757 lt!260660)))))

(declare-fun b!571615 () Bool)

(declare-fun res!361124 () Bool)

(assert (=> b!571615 (=> (not res!361124) (not e!328764))))

(declare-datatypes ((List!11263 0))(
  ( (Nil!11260) (Cons!11259 (h!12286 (_ BitVec 64)) (t!17491 List!11263)) )
))
(declare-fun arrayNoDuplicates!0 (array!35789 (_ BitVec 32) List!11263) Bool)

(assert (=> b!571615 (= res!361124 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11260))))

(declare-fun b!571616 () Bool)

(declare-fun res!361117 () Bool)

(assert (=> b!571616 (=> (not res!361117) (not e!328765))))

(assert (=> b!571616 (= res!361117 (and (= (size!17547 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17547 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17547 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571617 () Bool)

(declare-fun res!361126 () Bool)

(assert (=> b!571617 (=> (not res!361126) (not e!328765))))

(declare-fun arrayContainsKey!0 (array!35789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571617 (= res!361126 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571618 () Bool)

(assert (=> b!571618 (= e!328767 (= (seekEntryOrOpen!0 lt!260665 lt!260661 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53629 lt!260660) (index!24757 lt!260660) (index!24757 lt!260660) lt!260665 lt!260661 mask!3119)))))

(declare-fun b!571619 () Bool)

(assert (=> b!571619 (= e!328765 e!328764)))

(declare-fun res!361118 () Bool)

(assert (=> b!571619 (=> (not res!361118) (not e!328764))))

(declare-fun lt!260667 () SeekEntryResult!5632)

(assert (=> b!571619 (= res!361118 (or (= lt!260667 (MissingZero!5632 i!1132)) (= lt!260667 (MissingVacant!5632 i!1132))))))

(assert (=> b!571619 (= lt!260667 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52392 res!361115) b!571616))

(assert (= (and b!571616 res!361117) b!571611))

(assert (= (and b!571611 res!361120) b!571612))

(assert (= (and b!571612 res!361125) b!571617))

(assert (= (and b!571617 res!361126) b!571619))

(assert (= (and b!571619 res!361118) b!571608))

(assert (= (and b!571608 res!361122) b!571615))

(assert (= (and b!571615 res!361124) b!571613))

(assert (= (and b!571613 res!361127) b!571610))

(assert (= (and b!571610 res!361123) b!571607))

(assert (= (and b!571607 (not res!361116)) b!571614))

(assert (= (and b!571614 (not res!361121)) b!571609))

(assert (= (and b!571609 res!361119) b!571618))

(declare-fun m!550477 () Bool)

(assert (=> b!571617 m!550477))

(declare-fun m!550479 () Bool)

(assert (=> b!571619 m!550479))

(declare-fun m!550481 () Bool)

(assert (=> b!571610 m!550481))

(assert (=> b!571610 m!550481))

(declare-fun m!550483 () Bool)

(assert (=> b!571610 m!550483))

(declare-fun m!550485 () Bool)

(assert (=> b!571610 m!550485))

(declare-fun m!550487 () Bool)

(assert (=> b!571610 m!550487))

(declare-fun m!550489 () Bool)

(assert (=> b!571612 m!550489))

(assert (=> b!571609 m!550481))

(assert (=> b!571609 m!550481))

(declare-fun m!550491 () Bool)

(assert (=> b!571609 m!550491))

(assert (=> b!571614 m!550481))

(declare-fun m!550493 () Bool)

(assert (=> b!571614 m!550493))

(declare-fun m!550495 () Bool)

(assert (=> b!571615 m!550495))

(assert (=> b!571613 m!550481))

(declare-fun m!550497 () Bool)

(assert (=> b!571613 m!550497))

(assert (=> b!571613 m!550481))

(declare-fun m!550499 () Bool)

(assert (=> b!571613 m!550499))

(assert (=> b!571613 m!550481))

(declare-fun m!550501 () Bool)

(assert (=> b!571613 m!550501))

(declare-fun m!550503 () Bool)

(assert (=> b!571613 m!550503))

(declare-fun m!550505 () Bool)

(assert (=> b!571613 m!550505))

(declare-fun m!550507 () Bool)

(assert (=> b!571613 m!550507))

(declare-fun m!550509 () Bool)

(assert (=> b!571608 m!550509))

(declare-fun m!550511 () Bool)

(assert (=> b!571618 m!550511))

(declare-fun m!550513 () Bool)

(assert (=> b!571618 m!550513))

(assert (=> b!571611 m!550481))

(assert (=> b!571611 m!550481))

(declare-fun m!550515 () Bool)

(assert (=> b!571611 m!550515))

(declare-fun m!550517 () Bool)

(assert (=> start!52392 m!550517))

(declare-fun m!550519 () Bool)

(assert (=> start!52392 m!550519))

(push 1)

