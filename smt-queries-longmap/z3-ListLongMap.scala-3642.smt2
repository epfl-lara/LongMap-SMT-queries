; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50230 () Bool)

(assert start!50230)

(declare-fun b!549822 () Bool)

(declare-fun res!342968 () Bool)

(declare-fun e!317484 () Bool)

(assert (=> b!549822 (=> (not res!342968) (not e!317484))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549822 (= res!342968 (validKeyInArray!0 k0!1914))))

(declare-fun b!549823 () Bool)

(declare-fun res!342966 () Bool)

(assert (=> b!549823 (=> (not res!342966) (not e!317484))))

(declare-datatypes ((array!34683 0))(
  ( (array!34684 (arr!16657 (Array (_ BitVec 32) (_ BitVec 64))) (size!17021 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34683)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!549823 (= res!342966 (validKeyInArray!0 (select (arr!16657 a!3118) j!142)))))

(declare-fun b!549824 () Bool)

(declare-fun e!317483 () Bool)

(assert (=> b!549824 (= e!317483 (not true))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34683 (_ BitVec 32)) Bool)

(assert (=> b!549824 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16986 0))(
  ( (Unit!16987) )
))
(declare-fun lt!250351 () Unit!16986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16986)

(assert (=> b!549824 (= lt!250351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!342974 () Bool)

(assert (=> start!50230 (=> (not res!342974) (not e!317484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50230 (= res!342974 (validMask!0 mask!3119))))

(assert (=> start!50230 e!317484))

(assert (=> start!50230 true))

(declare-fun array_inv!12453 (array!34683) Bool)

(assert (=> start!50230 (array_inv!12453 a!3118)))

(declare-fun b!549825 () Bool)

(declare-fun res!342967 () Bool)

(assert (=> b!549825 (=> (not res!342967) (not e!317484))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549825 (= res!342967 (and (= (size!17021 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17021 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17021 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549826 () Bool)

(declare-fun res!342973 () Bool)

(assert (=> b!549826 (=> (not res!342973) (not e!317483))))

(assert (=> b!549826 (= res!342973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549827 () Bool)

(declare-fun res!342970 () Bool)

(assert (=> b!549827 (=> (not res!342970) (not e!317483))))

(declare-datatypes ((SeekEntryResult!5106 0))(
  ( (MissingZero!5106 (index!22651 (_ BitVec 32))) (Found!5106 (index!22652 (_ BitVec 32))) (Intermediate!5106 (undefined!5918 Bool) (index!22653 (_ BitVec 32)) (x!51580 (_ BitVec 32))) (Undefined!5106) (MissingVacant!5106 (index!22654 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34683 (_ BitVec 32)) SeekEntryResult!5106)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549827 (= res!342970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16657 a!3118) j!142) mask!3119) (select (arr!16657 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16657 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16657 a!3118) i!1132 k0!1914) j!142) (array!34684 (store (arr!16657 a!3118) i!1132 k0!1914) (size!17021 a!3118)) mask!3119)))))

(declare-fun b!549828 () Bool)

(declare-fun res!342972 () Bool)

(assert (=> b!549828 (=> (not res!342972) (not e!317483))))

(declare-datatypes ((List!10737 0))(
  ( (Nil!10734) (Cons!10733 (h!11706 (_ BitVec 64)) (t!16965 List!10737)) )
))
(declare-fun arrayNoDuplicates!0 (array!34683 (_ BitVec 32) List!10737) Bool)

(assert (=> b!549828 (= res!342972 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10734))))

(declare-fun b!549829 () Bool)

(assert (=> b!549829 (= e!317484 e!317483)))

(declare-fun res!342969 () Bool)

(assert (=> b!549829 (=> (not res!342969) (not e!317483))))

(declare-fun lt!250350 () SeekEntryResult!5106)

(assert (=> b!549829 (= res!342969 (or (= lt!250350 (MissingZero!5106 i!1132)) (= lt!250350 (MissingVacant!5106 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34683 (_ BitVec 32)) SeekEntryResult!5106)

(assert (=> b!549829 (= lt!250350 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549830 () Bool)

(declare-fun res!342971 () Bool)

(assert (=> b!549830 (=> (not res!342971) (not e!317484))))

(declare-fun arrayContainsKey!0 (array!34683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549830 (= res!342971 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50230 res!342974) b!549825))

(assert (= (and b!549825 res!342967) b!549823))

(assert (= (and b!549823 res!342966) b!549822))

(assert (= (and b!549822 res!342968) b!549830))

(assert (= (and b!549830 res!342971) b!549829))

(assert (= (and b!549829 res!342969) b!549826))

(assert (= (and b!549826 res!342973) b!549828))

(assert (= (and b!549828 res!342972) b!549827))

(assert (= (and b!549827 res!342970) b!549824))

(declare-fun m!526765 () Bool)

(assert (=> b!549827 m!526765))

(declare-fun m!526767 () Bool)

(assert (=> b!549827 m!526767))

(assert (=> b!549827 m!526765))

(declare-fun m!526769 () Bool)

(assert (=> b!549827 m!526769))

(declare-fun m!526771 () Bool)

(assert (=> b!549827 m!526771))

(assert (=> b!549827 m!526769))

(declare-fun m!526773 () Bool)

(assert (=> b!549827 m!526773))

(assert (=> b!549827 m!526767))

(assert (=> b!549827 m!526765))

(declare-fun m!526775 () Bool)

(assert (=> b!549827 m!526775))

(declare-fun m!526777 () Bool)

(assert (=> b!549827 m!526777))

(assert (=> b!549827 m!526769))

(assert (=> b!549827 m!526771))

(assert (=> b!549823 m!526765))

(assert (=> b!549823 m!526765))

(declare-fun m!526779 () Bool)

(assert (=> b!549823 m!526779))

(declare-fun m!526781 () Bool)

(assert (=> b!549830 m!526781))

(declare-fun m!526783 () Bool)

(assert (=> b!549829 m!526783))

(declare-fun m!526785 () Bool)

(assert (=> b!549822 m!526785))

(declare-fun m!526787 () Bool)

(assert (=> b!549824 m!526787))

(declare-fun m!526789 () Bool)

(assert (=> b!549824 m!526789))

(declare-fun m!526791 () Bool)

(assert (=> b!549826 m!526791))

(declare-fun m!526793 () Bool)

(assert (=> start!50230 m!526793))

(declare-fun m!526795 () Bool)

(assert (=> start!50230 m!526795))

(declare-fun m!526797 () Bool)

(assert (=> b!549828 m!526797))

(check-sat (not b!549829) (not b!549826) (not b!549828) (not b!549823) (not b!549830) (not b!549824) (not b!549822) (not start!50230) (not b!549827))
(check-sat)
