; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52196 () Bool)

(assert start!52196)

(declare-fun b!569807 () Bool)

(declare-fun res!359830 () Bool)

(declare-fun e!327742 () Bool)

(assert (=> b!569807 (=> (not res!359830) (not e!327742))))

(declare-datatypes ((array!35719 0))(
  ( (array!35720 (arr!17151 (Array (_ BitVec 32) (_ BitVec 64))) (size!17515 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35719)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35719 (_ BitVec 32)) Bool)

(assert (=> b!569807 (= res!359830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569808 () Bool)

(declare-fun res!359832 () Bool)

(declare-fun e!327743 () Bool)

(assert (=> b!569808 (=> (not res!359832) (not e!327743))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569808 (= res!359832 (validKeyInArray!0 (select (arr!17151 a!3118) j!142)))))

(declare-fun b!569809 () Bool)

(declare-fun res!359831 () Bool)

(assert (=> b!569809 (=> (not res!359831) (not e!327742))))

(declare-datatypes ((List!11231 0))(
  ( (Nil!11228) (Cons!11227 (h!12248 (_ BitVec 64)) (t!17459 List!11231)) )
))
(declare-fun arrayNoDuplicates!0 (array!35719 (_ BitVec 32) List!11231) Bool)

(assert (=> b!569809 (= res!359831 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11228))))

(declare-fun b!569810 () Bool)

(assert (=> b!569810 (= e!327742 (not true))))

(declare-fun e!327744 () Bool)

(assert (=> b!569810 e!327744))

(declare-fun res!359827 () Bool)

(assert (=> b!569810 (=> (not res!359827) (not e!327744))))

(assert (=> b!569810 (= res!359827 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17902 0))(
  ( (Unit!17903) )
))
(declare-fun lt!259779 () Unit!17902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17902)

(assert (=> b!569810 (= lt!259779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569811 () Bool)

(declare-fun res!359829 () Bool)

(assert (=> b!569811 (=> (not res!359829) (not e!327743))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!569811 (= res!359829 (validKeyInArray!0 k!1914))))

(declare-fun b!569812 () Bool)

(assert (=> b!569812 (= e!327743 e!327742)))

(declare-fun res!359834 () Bool)

(assert (=> b!569812 (=> (not res!359834) (not e!327742))))

(declare-datatypes ((SeekEntryResult!5600 0))(
  ( (MissingZero!5600 (index!24627 (_ BitVec 32))) (Found!5600 (index!24628 (_ BitVec 32))) (Intermediate!5600 (undefined!6412 Bool) (index!24629 (_ BitVec 32)) (x!53499 (_ BitVec 32))) (Undefined!5600) (MissingVacant!5600 (index!24630 (_ BitVec 32))) )
))
(declare-fun lt!259780 () SeekEntryResult!5600)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569812 (= res!359834 (or (= lt!259780 (MissingZero!5600 i!1132)) (= lt!259780 (MissingVacant!5600 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35719 (_ BitVec 32)) SeekEntryResult!5600)

(assert (=> b!569812 (= lt!259780 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569813 () Bool)

(declare-fun res!359828 () Bool)

(assert (=> b!569813 (=> (not res!359828) (not e!327743))))

(assert (=> b!569813 (= res!359828 (and (= (size!17515 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17515 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17515 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569814 () Bool)

(declare-fun res!359825 () Bool)

(assert (=> b!569814 (=> (not res!359825) (not e!327742))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35719 (_ BitVec 32)) SeekEntryResult!5600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569814 (= res!359825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17151 a!3118) j!142) mask!3119) (select (arr!17151 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17151 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17151 a!3118) i!1132 k!1914) j!142) (array!35720 (store (arr!17151 a!3118) i!1132 k!1914) (size!17515 a!3118)) mask!3119)))))

(declare-fun res!359826 () Bool)

(assert (=> start!52196 (=> (not res!359826) (not e!327743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52196 (= res!359826 (validMask!0 mask!3119))))

(assert (=> start!52196 e!327743))

(assert (=> start!52196 true))

(declare-fun array_inv!12947 (array!35719) Bool)

(assert (=> start!52196 (array_inv!12947 a!3118)))

(declare-fun b!569815 () Bool)

(declare-fun res!359833 () Bool)

(assert (=> b!569815 (=> (not res!359833) (not e!327743))))

(declare-fun arrayContainsKey!0 (array!35719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569815 (= res!359833 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569816 () Bool)

(assert (=> b!569816 (= e!327744 (= (seekEntryOrOpen!0 (select (arr!17151 a!3118) j!142) a!3118 mask!3119) (Found!5600 j!142)))))

(assert (= (and start!52196 res!359826) b!569813))

(assert (= (and b!569813 res!359828) b!569808))

(assert (= (and b!569808 res!359832) b!569811))

(assert (= (and b!569811 res!359829) b!569815))

(assert (= (and b!569815 res!359833) b!569812))

(assert (= (and b!569812 res!359834) b!569807))

(assert (= (and b!569807 res!359830) b!569809))

(assert (= (and b!569809 res!359831) b!569814))

(assert (= (and b!569814 res!359825) b!569810))

(assert (= (and b!569810 res!359827) b!569816))

(declare-fun m!548685 () Bool)

(assert (=> b!569810 m!548685))

(declare-fun m!548687 () Bool)

(assert (=> b!569810 m!548687))

(declare-fun m!548689 () Bool)

(assert (=> b!569812 m!548689))

(declare-fun m!548691 () Bool)

(assert (=> b!569808 m!548691))

(assert (=> b!569808 m!548691))

(declare-fun m!548693 () Bool)

(assert (=> b!569808 m!548693))

(declare-fun m!548695 () Bool)

(assert (=> b!569809 m!548695))

(assert (=> b!569814 m!548691))

(declare-fun m!548697 () Bool)

(assert (=> b!569814 m!548697))

(assert (=> b!569814 m!548691))

(declare-fun m!548699 () Bool)

(assert (=> b!569814 m!548699))

(declare-fun m!548701 () Bool)

(assert (=> b!569814 m!548701))

(assert (=> b!569814 m!548699))

(declare-fun m!548703 () Bool)

(assert (=> b!569814 m!548703))

(assert (=> b!569814 m!548697))

(assert (=> b!569814 m!548691))

(declare-fun m!548705 () Bool)

(assert (=> b!569814 m!548705))

(declare-fun m!548707 () Bool)

(assert (=> b!569814 m!548707))

(assert (=> b!569814 m!548699))

(assert (=> b!569814 m!548701))

(declare-fun m!548709 () Bool)

(assert (=> b!569811 m!548709))

(assert (=> b!569816 m!548691))

(assert (=> b!569816 m!548691))

(declare-fun m!548711 () Bool)

(assert (=> b!569816 m!548711))

(declare-fun m!548713 () Bool)

(assert (=> b!569815 m!548713))

(declare-fun m!548715 () Bool)

(assert (=> b!569807 m!548715))

(declare-fun m!548717 () Bool)

(assert (=> start!52196 m!548717))

(declare-fun m!548719 () Bool)

(assert (=> start!52196 m!548719))

(push 1)

