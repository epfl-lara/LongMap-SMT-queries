; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51356 () Bool)

(assert start!51356)

(declare-fun b!560633 () Bool)

(declare-fun res!351796 () Bool)

(declare-fun e!323031 () Bool)

(assert (=> b!560633 (=> (not res!351796) (not e!323031))))

(declare-datatypes ((array!35221 0))(
  ( (array!35222 (arr!16911 (Array (_ BitVec 32) (_ BitVec 64))) (size!17275 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35221)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560633 (= res!351796 (validKeyInArray!0 (select (arr!16911 a!3118) j!142)))))

(declare-fun b!560634 () Bool)

(declare-fun e!323026 () Bool)

(declare-fun e!323027 () Bool)

(assert (=> b!560634 (= e!323026 e!323027)))

(declare-fun res!351786 () Bool)

(assert (=> b!560634 (=> (not res!351786) (not e!323027))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5360 0))(
  ( (MissingZero!5360 (index!23667 (_ BitVec 32))) (Found!5360 (index!23668 (_ BitVec 32))) (Intermediate!5360 (undefined!6172 Bool) (index!23669 (_ BitVec 32)) (x!52583 (_ BitVec 32))) (Undefined!5360) (MissingVacant!5360 (index!23670 (_ BitVec 32))) )
))
(declare-fun lt!254952 () SeekEntryResult!5360)

(declare-fun lt!254951 () SeekEntryResult!5360)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35221 (_ BitVec 32)) SeekEntryResult!5360)

(assert (=> b!560634 (= res!351786 (= lt!254952 (seekKeyOrZeroReturnVacant!0 (x!52583 lt!254951) (index!23669 lt!254951) (index!23669 lt!254951) (select (arr!16911 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560635 () Bool)

(declare-fun res!351787 () Bool)

(assert (=> b!560635 (=> (not res!351787) (not e!323031))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560635 (= res!351787 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560636 () Bool)

(declare-fun e!323029 () Bool)

(assert (=> b!560636 (= e!323031 e!323029)))

(declare-fun res!351795 () Bool)

(assert (=> b!560636 (=> (not res!351795) (not e!323029))))

(declare-fun lt!254954 () SeekEntryResult!5360)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560636 (= res!351795 (or (= lt!254954 (MissingZero!5360 i!1132)) (= lt!254954 (MissingVacant!5360 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35221 (_ BitVec 32)) SeekEntryResult!5360)

(assert (=> b!560636 (= lt!254954 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560637 () Bool)

(declare-fun e!323030 () Bool)

(assert (=> b!560637 (= e!323030 e!323026)))

(declare-fun res!351794 () Bool)

(assert (=> b!560637 (=> res!351794 e!323026)))

(declare-fun lt!254959 () (_ BitVec 64))

(assert (=> b!560637 (= res!351794 (or (= lt!254959 (select (arr!16911 a!3118) j!142)) (= lt!254959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560637 (= lt!254959 (select (arr!16911 a!3118) (index!23669 lt!254951)))))

(declare-fun b!560638 () Bool)

(declare-fun e!323025 () Bool)

(assert (=> b!560638 (= e!323025 e!323030)))

(declare-fun res!351788 () Bool)

(assert (=> b!560638 (=> res!351788 e!323030)))

(assert (=> b!560638 (= res!351788 (or (undefined!6172 lt!254951) (not (is-Intermediate!5360 lt!254951))))))

(declare-fun b!560639 () Bool)

(declare-fun res!351797 () Bool)

(assert (=> b!560639 (=> (not res!351797) (not e!323029))))

(declare-datatypes ((List!10991 0))(
  ( (Nil!10988) (Cons!10987 (h!11990 (_ BitVec 64)) (t!17219 List!10991)) )
))
(declare-fun arrayNoDuplicates!0 (array!35221 (_ BitVec 32) List!10991) Bool)

(assert (=> b!560639 (= res!351797 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10988))))

(declare-fun b!560640 () Bool)

(declare-fun res!351785 () Bool)

(assert (=> b!560640 (=> (not res!351785) (not e!323031))))

(assert (=> b!560640 (= res!351785 (and (= (size!17275 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17275 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17275 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560641 () Bool)

(declare-fun res!351793 () Bool)

(assert (=> b!560641 (=> (not res!351793) (not e!323031))))

(assert (=> b!560641 (= res!351793 (validKeyInArray!0 k!1914))))

(declare-fun b!560642 () Bool)

(declare-fun e!323024 () Bool)

(assert (=> b!560642 (= e!323029 e!323024)))

(declare-fun res!351789 () Bool)

(assert (=> b!560642 (=> (not res!351789) (not e!323024))))

(declare-fun lt!254956 () array!35221)

(declare-fun lt!254957 () (_ BitVec 32))

(declare-fun lt!254955 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35221 (_ BitVec 32)) SeekEntryResult!5360)

(assert (=> b!560642 (= res!351789 (= lt!254951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254957 lt!254955 lt!254956 mask!3119)))))

(declare-fun lt!254953 () (_ BitVec 32))

(assert (=> b!560642 (= lt!254951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254953 (select (arr!16911 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560642 (= lt!254957 (toIndex!0 lt!254955 mask!3119))))

(assert (=> b!560642 (= lt!254955 (select (store (arr!16911 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560642 (= lt!254953 (toIndex!0 (select (arr!16911 a!3118) j!142) mask!3119))))

(assert (=> b!560642 (= lt!254956 (array!35222 (store (arr!16911 a!3118) i!1132 k!1914) (size!17275 a!3118)))))

(declare-fun b!560643 () Bool)

(assert (=> b!560643 (= e!323027 (= (seekEntryOrOpen!0 lt!254955 lt!254956 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52583 lt!254951) (index!23669 lt!254951) (index!23669 lt!254951) lt!254955 lt!254956 mask!3119)))))

(declare-fun b!560644 () Bool)

(declare-fun res!351792 () Bool)

(assert (=> b!560644 (=> (not res!351792) (not e!323029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35221 (_ BitVec 32)) Bool)

(assert (=> b!560644 (= res!351792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560645 () Bool)

(assert (=> b!560645 (= e!323024 (not true))))

(assert (=> b!560645 e!323025))

(declare-fun res!351791 () Bool)

(assert (=> b!560645 (=> (not res!351791) (not e!323025))))

(assert (=> b!560645 (= res!351791 (= lt!254952 (Found!5360 j!142)))))

(assert (=> b!560645 (= lt!254952 (seekEntryOrOpen!0 (select (arr!16911 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560645 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17494 0))(
  ( (Unit!17495) )
))
(declare-fun lt!254958 () Unit!17494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17494)

(assert (=> b!560645 (= lt!254958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!351790 () Bool)

(assert (=> start!51356 (=> (not res!351790) (not e!323031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51356 (= res!351790 (validMask!0 mask!3119))))

(assert (=> start!51356 e!323031))

(assert (=> start!51356 true))

(declare-fun array_inv!12707 (array!35221) Bool)

(assert (=> start!51356 (array_inv!12707 a!3118)))

(assert (= (and start!51356 res!351790) b!560640))

(assert (= (and b!560640 res!351785) b!560633))

(assert (= (and b!560633 res!351796) b!560641))

(assert (= (and b!560641 res!351793) b!560635))

(assert (= (and b!560635 res!351787) b!560636))

(assert (= (and b!560636 res!351795) b!560644))

(assert (= (and b!560644 res!351792) b!560639))

(assert (= (and b!560639 res!351797) b!560642))

(assert (= (and b!560642 res!351789) b!560645))

(assert (= (and b!560645 res!351791) b!560638))

(assert (= (and b!560638 (not res!351788)) b!560637))

(assert (= (and b!560637 (not res!351794)) b!560634))

(assert (= (and b!560634 res!351786) b!560643))

(declare-fun m!538425 () Bool)

(assert (=> b!560644 m!538425))

(declare-fun m!538427 () Bool)

(assert (=> b!560635 m!538427))

(declare-fun m!538429 () Bool)

(assert (=> b!560642 m!538429))

(declare-fun m!538431 () Bool)

(assert (=> b!560642 m!538431))

(assert (=> b!560642 m!538429))

(assert (=> b!560642 m!538429))

(declare-fun m!538433 () Bool)

(assert (=> b!560642 m!538433))

(declare-fun m!538435 () Bool)

(assert (=> b!560642 m!538435))

(declare-fun m!538437 () Bool)

(assert (=> b!560642 m!538437))

(declare-fun m!538439 () Bool)

(assert (=> b!560642 m!538439))

(declare-fun m!538441 () Bool)

(assert (=> b!560642 m!538441))

(assert (=> b!560633 m!538429))

(assert (=> b!560633 m!538429))

(declare-fun m!538443 () Bool)

(assert (=> b!560633 m!538443))

(assert (=> b!560645 m!538429))

(assert (=> b!560645 m!538429))

(declare-fun m!538445 () Bool)

(assert (=> b!560645 m!538445))

(declare-fun m!538447 () Bool)

(assert (=> b!560645 m!538447))

(declare-fun m!538449 () Bool)

(assert (=> b!560645 m!538449))

(declare-fun m!538451 () Bool)

(assert (=> b!560643 m!538451))

(declare-fun m!538453 () Bool)

(assert (=> b!560643 m!538453))

(declare-fun m!538455 () Bool)

(assert (=> b!560636 m!538455))

(declare-fun m!538457 () Bool)

(assert (=> b!560641 m!538457))

(assert (=> b!560634 m!538429))

(assert (=> b!560634 m!538429))

(declare-fun m!538459 () Bool)

(assert (=> b!560634 m!538459))

(declare-fun m!538461 () Bool)

(assert (=> b!560639 m!538461))

(assert (=> b!560637 m!538429))

(declare-fun m!538463 () Bool)

(assert (=> b!560637 m!538463))

(declare-fun m!538465 () Bool)

(assert (=> start!51356 m!538465))

(declare-fun m!538467 () Bool)

(assert (=> start!51356 m!538467))

(push 1)

