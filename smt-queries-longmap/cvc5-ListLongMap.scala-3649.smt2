; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50330 () Bool)

(assert start!50330)

(declare-fun b!550682 () Bool)

(declare-fun res!343647 () Bool)

(declare-fun e!317877 () Bool)

(assert (=> b!550682 (=> (not res!343647) (not e!317877))))

(declare-datatypes ((array!34726 0))(
  ( (array!34727 (arr!16677 (Array (_ BitVec 32) (_ BitVec 64))) (size!17041 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34726)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34726 (_ BitVec 32)) Bool)

(assert (=> b!550682 (= res!343647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550683 () Bool)

(declare-fun e!317879 () Bool)

(assert (=> b!550683 (= e!317879 e!317877)))

(declare-fun res!343651 () Bool)

(assert (=> b!550683 (=> (not res!343651) (not e!317877))))

(declare-datatypes ((SeekEntryResult!5126 0))(
  ( (MissingZero!5126 (index!22731 (_ BitVec 32))) (Found!5126 (index!22732 (_ BitVec 32))) (Intermediate!5126 (undefined!5938 Bool) (index!22733 (_ BitVec 32)) (x!51662 (_ BitVec 32))) (Undefined!5126) (MissingVacant!5126 (index!22734 (_ BitVec 32))) )
))
(declare-fun lt!250600 () SeekEntryResult!5126)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550683 (= res!343651 (or (= lt!250600 (MissingZero!5126 i!1132)) (= lt!250600 (MissingVacant!5126 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34726 (_ BitVec 32)) SeekEntryResult!5126)

(assert (=> b!550683 (= lt!250600 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!343644 () Bool)

(assert (=> start!50330 (=> (not res!343644) (not e!317879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50330 (= res!343644 (validMask!0 mask!3119))))

(assert (=> start!50330 e!317879))

(assert (=> start!50330 true))

(declare-fun array_inv!12473 (array!34726) Bool)

(assert (=> start!50330 (array_inv!12473 a!3118)))

(declare-fun b!550684 () Bool)

(declare-fun res!343643 () Bool)

(assert (=> b!550684 (=> (not res!343643) (not e!317877))))

(declare-datatypes ((List!10757 0))(
  ( (Nil!10754) (Cons!10753 (h!11729 (_ BitVec 64)) (t!16985 List!10757)) )
))
(declare-fun arrayNoDuplicates!0 (array!34726 (_ BitVec 32) List!10757) Bool)

(assert (=> b!550684 (= res!343643 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10754))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!550685 () Bool)

(declare-fun e!317878 () Bool)

(assert (=> b!550685 (= e!317878 (= (seekEntryOrOpen!0 (select (arr!16677 a!3118) j!142) a!3118 mask!3119) (Found!5126 j!142)))))

(declare-fun b!550686 () Bool)

(declare-fun res!343649 () Bool)

(assert (=> b!550686 (=> (not res!343649) (not e!317879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550686 (= res!343649 (validKeyInArray!0 k!1914))))

(declare-fun b!550687 () Bool)

(declare-fun res!343646 () Bool)

(assert (=> b!550687 (=> (not res!343646) (not e!317879))))

(assert (=> b!550687 (= res!343646 (and (= (size!17041 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17041 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17041 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550688 () Bool)

(declare-fun res!343650 () Bool)

(assert (=> b!550688 (=> (not res!343650) (not e!317879))))

(declare-fun arrayContainsKey!0 (array!34726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550688 (= res!343650 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550689 () Bool)

(declare-fun res!343652 () Bool)

(assert (=> b!550689 (=> (not res!343652) (not e!317877))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34726 (_ BitVec 32)) SeekEntryResult!5126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550689 (= res!343652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16677 a!3118) j!142) mask!3119) (select (arr!16677 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16677 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16677 a!3118) i!1132 k!1914) j!142) (array!34727 (store (arr!16677 a!3118) i!1132 k!1914) (size!17041 a!3118)) mask!3119)))))

(declare-fun b!550690 () Bool)

(declare-fun res!343648 () Bool)

(assert (=> b!550690 (=> (not res!343648) (not e!317879))))

(assert (=> b!550690 (= res!343648 (validKeyInArray!0 (select (arr!16677 a!3118) j!142)))))

(declare-fun b!550691 () Bool)

(assert (=> b!550691 (= e!317877 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!550691 e!317878))

(declare-fun res!343645 () Bool)

(assert (=> b!550691 (=> (not res!343645) (not e!317878))))

(assert (=> b!550691 (= res!343645 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17026 0))(
  ( (Unit!17027) )
))
(declare-fun lt!250599 () Unit!17026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17026)

(assert (=> b!550691 (= lt!250599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50330 res!343644) b!550687))

(assert (= (and b!550687 res!343646) b!550690))

(assert (= (and b!550690 res!343648) b!550686))

(assert (= (and b!550686 res!343649) b!550688))

(assert (= (and b!550688 res!343650) b!550683))

(assert (= (and b!550683 res!343651) b!550682))

(assert (= (and b!550682 res!343647) b!550684))

(assert (= (and b!550684 res!343643) b!550689))

(assert (= (and b!550689 res!343652) b!550691))

(assert (= (and b!550691 res!343645) b!550685))

(declare-fun m!527661 () Bool)

(assert (=> b!550688 m!527661))

(declare-fun m!527663 () Bool)

(assert (=> b!550682 m!527663))

(declare-fun m!527665 () Bool)

(assert (=> b!550683 m!527665))

(declare-fun m!527667 () Bool)

(assert (=> b!550691 m!527667))

(declare-fun m!527669 () Bool)

(assert (=> b!550691 m!527669))

(declare-fun m!527671 () Bool)

(assert (=> b!550685 m!527671))

(assert (=> b!550685 m!527671))

(declare-fun m!527673 () Bool)

(assert (=> b!550685 m!527673))

(declare-fun m!527675 () Bool)

(assert (=> b!550686 m!527675))

(assert (=> b!550689 m!527671))

(declare-fun m!527677 () Bool)

(assert (=> b!550689 m!527677))

(assert (=> b!550689 m!527671))

(declare-fun m!527679 () Bool)

(assert (=> b!550689 m!527679))

(declare-fun m!527681 () Bool)

(assert (=> b!550689 m!527681))

(assert (=> b!550689 m!527679))

(declare-fun m!527683 () Bool)

(assert (=> b!550689 m!527683))

(assert (=> b!550689 m!527677))

(assert (=> b!550689 m!527671))

(declare-fun m!527685 () Bool)

(assert (=> b!550689 m!527685))

(declare-fun m!527687 () Bool)

(assert (=> b!550689 m!527687))

(assert (=> b!550689 m!527679))

(assert (=> b!550689 m!527681))

(declare-fun m!527689 () Bool)

(assert (=> start!50330 m!527689))

(declare-fun m!527691 () Bool)

(assert (=> start!50330 m!527691))

(declare-fun m!527693 () Bool)

(assert (=> b!550684 m!527693))

(assert (=> b!550690 m!527671))

(assert (=> b!550690 m!527671))

(declare-fun m!527695 () Bool)

(assert (=> b!550690 m!527695))

(push 1)

