; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50216 () Bool)

(assert start!50216)

(declare-fun b!549524 () Bool)

(declare-fun e!317299 () Bool)

(assert (=> b!549524 (= e!317299 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34678 0))(
  ( (array!34679 (arr!16655 (Array (_ BitVec 32) (_ BitVec 64))) (size!17020 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34678)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34678 (_ BitVec 32)) Bool)

(assert (=> b!549524 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16962 0))(
  ( (Unit!16963) )
))
(declare-fun lt!250110 () Unit!16962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16962)

(assert (=> b!549524 (= lt!250110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549525 () Bool)

(declare-fun e!317301 () Bool)

(assert (=> b!549525 (= e!317301 e!317299)))

(declare-fun res!342810 () Bool)

(assert (=> b!549525 (=> (not res!342810) (not e!317299))))

(declare-datatypes ((SeekEntryResult!5101 0))(
  ( (MissingZero!5101 (index!22631 (_ BitVec 32))) (Found!5101 (index!22632 (_ BitVec 32))) (Intermediate!5101 (undefined!5913 Bool) (index!22633 (_ BitVec 32)) (x!51570 (_ BitVec 32))) (Undefined!5101) (MissingVacant!5101 (index!22634 (_ BitVec 32))) )
))
(declare-fun lt!250111 () SeekEntryResult!5101)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549525 (= res!342810 (or (= lt!250111 (MissingZero!5101 i!1132)) (= lt!250111 (MissingVacant!5101 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34678 (_ BitVec 32)) SeekEntryResult!5101)

(assert (=> b!549525 (= lt!250111 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549526 () Bool)

(declare-fun res!342818 () Bool)

(assert (=> b!549526 (=> (not res!342818) (not e!317299))))

(assert (=> b!549526 (= res!342818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549527 () Bool)

(declare-fun res!342817 () Bool)

(assert (=> b!549527 (=> (not res!342817) (not e!317301))))

(declare-fun arrayContainsKey!0 (array!34678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549527 (= res!342817 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549528 () Bool)

(declare-fun res!342813 () Bool)

(assert (=> b!549528 (=> (not res!342813) (not e!317301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549528 (= res!342813 (validKeyInArray!0 (select (arr!16655 a!3118) j!142)))))

(declare-fun b!549529 () Bool)

(declare-fun res!342814 () Bool)

(assert (=> b!549529 (=> (not res!342814) (not e!317301))))

(assert (=> b!549529 (= res!342814 (and (= (size!17020 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17020 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17020 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549530 () Bool)

(declare-fun res!342815 () Bool)

(assert (=> b!549530 (=> (not res!342815) (not e!317299))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34678 (_ BitVec 32)) SeekEntryResult!5101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549530 (= res!342815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16655 a!3118) j!142) mask!3119) (select (arr!16655 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16655 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16655 a!3118) i!1132 k0!1914) j!142) (array!34679 (store (arr!16655 a!3118) i!1132 k0!1914) (size!17020 a!3118)) mask!3119)))))

(declare-fun b!549531 () Bool)

(declare-fun res!342812 () Bool)

(assert (=> b!549531 (=> (not res!342812) (not e!317301))))

(assert (=> b!549531 (= res!342812 (validKeyInArray!0 k0!1914))))

(declare-fun res!342811 () Bool)

(assert (=> start!50216 (=> (not res!342811) (not e!317301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50216 (= res!342811 (validMask!0 mask!3119))))

(assert (=> start!50216 e!317301))

(assert (=> start!50216 true))

(declare-fun array_inv!12538 (array!34678) Bool)

(assert (=> start!50216 (array_inv!12538 a!3118)))

(declare-fun b!549532 () Bool)

(declare-fun res!342816 () Bool)

(assert (=> b!549532 (=> (not res!342816) (not e!317299))))

(declare-datatypes ((List!10774 0))(
  ( (Nil!10771) (Cons!10770 (h!11743 (_ BitVec 64)) (t!16993 List!10774)) )
))
(declare-fun arrayNoDuplicates!0 (array!34678 (_ BitVec 32) List!10774) Bool)

(assert (=> b!549532 (= res!342816 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10771))))

(assert (= (and start!50216 res!342811) b!549529))

(assert (= (and b!549529 res!342814) b!549528))

(assert (= (and b!549528 res!342813) b!549531))

(assert (= (and b!549531 res!342812) b!549527))

(assert (= (and b!549527 res!342817) b!549525))

(assert (= (and b!549525 res!342810) b!549526))

(assert (= (and b!549526 res!342818) b!549532))

(assert (= (and b!549532 res!342816) b!549530))

(assert (= (and b!549530 res!342815) b!549524))

(declare-fun m!525959 () Bool)

(assert (=> b!549532 m!525959))

(declare-fun m!525961 () Bool)

(assert (=> b!549528 m!525961))

(assert (=> b!549528 m!525961))

(declare-fun m!525963 () Bool)

(assert (=> b!549528 m!525963))

(declare-fun m!525965 () Bool)

(assert (=> b!549527 m!525965))

(declare-fun m!525967 () Bool)

(assert (=> b!549531 m!525967))

(declare-fun m!525969 () Bool)

(assert (=> b!549524 m!525969))

(declare-fun m!525971 () Bool)

(assert (=> b!549524 m!525971))

(declare-fun m!525973 () Bool)

(assert (=> b!549526 m!525973))

(assert (=> b!549530 m!525961))

(declare-fun m!525975 () Bool)

(assert (=> b!549530 m!525975))

(assert (=> b!549530 m!525961))

(declare-fun m!525977 () Bool)

(assert (=> b!549530 m!525977))

(declare-fun m!525979 () Bool)

(assert (=> b!549530 m!525979))

(assert (=> b!549530 m!525977))

(declare-fun m!525981 () Bool)

(assert (=> b!549530 m!525981))

(assert (=> b!549530 m!525975))

(assert (=> b!549530 m!525961))

(declare-fun m!525983 () Bool)

(assert (=> b!549530 m!525983))

(declare-fun m!525985 () Bool)

(assert (=> b!549530 m!525985))

(assert (=> b!549530 m!525977))

(assert (=> b!549530 m!525979))

(declare-fun m!525987 () Bool)

(assert (=> start!50216 m!525987))

(declare-fun m!525989 () Bool)

(assert (=> start!50216 m!525989))

(declare-fun m!525991 () Bool)

(assert (=> b!549525 m!525991))

(check-sat (not b!549525) (not b!549530) (not b!549524) (not start!50216) (not b!549532) (not b!549527) (not b!549531) (not b!549526) (not b!549528))
(check-sat)
