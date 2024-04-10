; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51890 () Bool)

(assert start!51890)

(declare-fun b!567143 () Bool)

(declare-fun res!357737 () Bool)

(declare-fun e!326402 () Bool)

(assert (=> b!567143 (=> (not res!357737) (not e!326402))))

(declare-datatypes ((array!35584 0))(
  ( (array!35585 (arr!17088 (Array (_ BitVec 32) (_ BitVec 64))) (size!17452 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35584)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567143 (= res!357737 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!567144 () Bool)

(declare-fun e!326401 () Bool)

(declare-datatypes ((SeekEntryResult!5537 0))(
  ( (MissingZero!5537 (index!24375 (_ BitVec 32))) (Found!5537 (index!24376 (_ BitVec 32))) (Intermediate!5537 (undefined!6349 Bool) (index!24377 (_ BitVec 32)) (x!53250 (_ BitVec 32))) (Undefined!5537) (MissingVacant!5537 (index!24378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35584 (_ BitVec 32)) SeekEntryResult!5537)

(assert (=> b!567144 (= e!326401 (= (seekEntryOrOpen!0 (select (arr!17088 a!3118) j!142) a!3118 mask!3119) (Found!5537 j!142)))))

(declare-fun b!567145 () Bool)

(declare-fun res!357735 () Bool)

(declare-fun e!326403 () Bool)

(assert (=> b!567145 (=> (not res!357735) (not e!326403))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35584 (_ BitVec 32)) SeekEntryResult!5537)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567145 (= res!357735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17088 a!3118) j!142) mask!3119) (select (arr!17088 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17088 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17088 a!3118) i!1132 k!1914) j!142) (array!35585 (store (arr!17088 a!3118) i!1132 k!1914) (size!17452 a!3118)) mask!3119)))))

(declare-fun b!567146 () Bool)

(declare-fun res!357729 () Bool)

(assert (=> b!567146 (=> (not res!357729) (not e!326402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567146 (= res!357729 (validKeyInArray!0 k!1914))))

(declare-fun b!567147 () Bool)

(declare-fun res!357736 () Bool)

(assert (=> b!567147 (=> (not res!357736) (not e!326403))))

(declare-datatypes ((List!11168 0))(
  ( (Nil!11165) (Cons!11164 (h!12176 (_ BitVec 64)) (t!17396 List!11168)) )
))
(declare-fun arrayNoDuplicates!0 (array!35584 (_ BitVec 32) List!11168) Bool)

(assert (=> b!567147 (= res!357736 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11165))))

(declare-fun b!567148 () Bool)

(declare-fun res!357734 () Bool)

(assert (=> b!567148 (=> (not res!357734) (not e!326403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35584 (_ BitVec 32)) Bool)

(assert (=> b!567148 (= res!357734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567149 () Bool)

(declare-fun res!357728 () Bool)

(assert (=> b!567149 (=> (not res!357728) (not e!326402))))

(assert (=> b!567149 (= res!357728 (and (= (size!17452 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17452 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17452 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!357732 () Bool)

(assert (=> start!51890 (=> (not res!357732) (not e!326402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51890 (= res!357732 (validMask!0 mask!3119))))

(assert (=> start!51890 e!326402))

(assert (=> start!51890 true))

(declare-fun array_inv!12884 (array!35584) Bool)

(assert (=> start!51890 (array_inv!12884 a!3118)))

(declare-fun b!567150 () Bool)

(assert (=> b!567150 (= e!326403 (not true))))

(assert (=> b!567150 e!326401))

(declare-fun res!357731 () Bool)

(assert (=> b!567150 (=> (not res!357731) (not e!326401))))

(assert (=> b!567150 (= res!357731 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17776 0))(
  ( (Unit!17777) )
))
(declare-fun lt!258456 () Unit!17776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17776)

(assert (=> b!567150 (= lt!258456 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567151 () Bool)

(assert (=> b!567151 (= e!326402 e!326403)))

(declare-fun res!357730 () Bool)

(assert (=> b!567151 (=> (not res!357730) (not e!326403))))

(declare-fun lt!258457 () SeekEntryResult!5537)

(assert (=> b!567151 (= res!357730 (or (= lt!258457 (MissingZero!5537 i!1132)) (= lt!258457 (MissingVacant!5537 i!1132))))))

(assert (=> b!567151 (= lt!258457 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567152 () Bool)

(declare-fun res!357733 () Bool)

(assert (=> b!567152 (=> (not res!357733) (not e!326402))))

(assert (=> b!567152 (= res!357733 (validKeyInArray!0 (select (arr!17088 a!3118) j!142)))))

(assert (= (and start!51890 res!357732) b!567149))

(assert (= (and b!567149 res!357728) b!567152))

(assert (= (and b!567152 res!357733) b!567146))

(assert (= (and b!567146 res!357729) b!567143))

(assert (= (and b!567143 res!357737) b!567151))

(assert (= (and b!567151 res!357730) b!567148))

(assert (= (and b!567148 res!357734) b!567147))

(assert (= (and b!567147 res!357736) b!567145))

(assert (= (and b!567145 res!357735) b!567150))

(assert (= (and b!567150 res!357731) b!567144))

(declare-fun m!545673 () Bool)

(assert (=> b!567147 m!545673))

(declare-fun m!545675 () Bool)

(assert (=> b!567152 m!545675))

(assert (=> b!567152 m!545675))

(declare-fun m!545677 () Bool)

(assert (=> b!567152 m!545677))

(declare-fun m!545679 () Bool)

(assert (=> start!51890 m!545679))

(declare-fun m!545681 () Bool)

(assert (=> start!51890 m!545681))

(declare-fun m!545683 () Bool)

(assert (=> b!567150 m!545683))

(declare-fun m!545685 () Bool)

(assert (=> b!567150 m!545685))

(declare-fun m!545687 () Bool)

(assert (=> b!567146 m!545687))

(assert (=> b!567145 m!545675))

(declare-fun m!545689 () Bool)

(assert (=> b!567145 m!545689))

(assert (=> b!567145 m!545675))

(declare-fun m!545691 () Bool)

(assert (=> b!567145 m!545691))

(declare-fun m!545693 () Bool)

(assert (=> b!567145 m!545693))

(assert (=> b!567145 m!545691))

(declare-fun m!545695 () Bool)

(assert (=> b!567145 m!545695))

(assert (=> b!567145 m!545689))

(assert (=> b!567145 m!545675))

(declare-fun m!545697 () Bool)

(assert (=> b!567145 m!545697))

(declare-fun m!545699 () Bool)

(assert (=> b!567145 m!545699))

(assert (=> b!567145 m!545691))

(assert (=> b!567145 m!545693))

(declare-fun m!545701 () Bool)

(assert (=> b!567148 m!545701))

(declare-fun m!545703 () Bool)

(assert (=> b!567151 m!545703))

(declare-fun m!545705 () Bool)

(assert (=> b!567143 m!545705))

(assert (=> b!567144 m!545675))

(assert (=> b!567144 m!545675))

(declare-fun m!545707 () Bool)

(assert (=> b!567144 m!545707))

(push 1)

