; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50338 () Bool)

(assert start!50338)

(declare-fun b!550802 () Bool)

(declare-fun res!343764 () Bool)

(declare-fun e!317928 () Bool)

(assert (=> b!550802 (=> (not res!343764) (not e!317928))))

(declare-datatypes ((array!34734 0))(
  ( (array!34735 (arr!16681 (Array (_ BitVec 32) (_ BitVec 64))) (size!17045 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34734)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550802 (= res!343764 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550803 () Bool)

(declare-fun res!343771 () Bool)

(declare-fun e!317926 () Bool)

(assert (=> b!550803 (=> (not res!343771) (not e!317926))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34734 (_ BitVec 32)) Bool)

(assert (=> b!550803 (= res!343771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!343768 () Bool)

(assert (=> start!50338 (=> (not res!343768) (not e!317928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50338 (= res!343768 (validMask!0 mask!3119))))

(assert (=> start!50338 e!317928))

(assert (=> start!50338 true))

(declare-fun array_inv!12477 (array!34734) Bool)

(assert (=> start!50338 (array_inv!12477 a!3118)))

(declare-fun b!550804 () Bool)

(assert (=> b!550804 (= e!317926 (not true))))

(declare-fun e!317927 () Bool)

(assert (=> b!550804 e!317927))

(declare-fun res!343770 () Bool)

(assert (=> b!550804 (=> (not res!343770) (not e!317927))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!550804 (= res!343770 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17034 0))(
  ( (Unit!17035) )
))
(declare-fun lt!250623 () Unit!17034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17034)

(assert (=> b!550804 (= lt!250623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550805 () Bool)

(declare-fun res!343769 () Bool)

(assert (=> b!550805 (=> (not res!343769) (not e!317926))))

(declare-datatypes ((List!10761 0))(
  ( (Nil!10758) (Cons!10757 (h!11733 (_ BitVec 64)) (t!16989 List!10761)) )
))
(declare-fun arrayNoDuplicates!0 (array!34734 (_ BitVec 32) List!10761) Bool)

(assert (=> b!550805 (= res!343769 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10758))))

(declare-fun b!550806 () Bool)

(assert (=> b!550806 (= e!317928 e!317926)))

(declare-fun res!343763 () Bool)

(assert (=> b!550806 (=> (not res!343763) (not e!317926))))

(declare-datatypes ((SeekEntryResult!5130 0))(
  ( (MissingZero!5130 (index!22747 (_ BitVec 32))) (Found!5130 (index!22748 (_ BitVec 32))) (Intermediate!5130 (undefined!5942 Bool) (index!22749 (_ BitVec 32)) (x!51674 (_ BitVec 32))) (Undefined!5130) (MissingVacant!5130 (index!22750 (_ BitVec 32))) )
))
(declare-fun lt!250624 () SeekEntryResult!5130)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550806 (= res!343763 (or (= lt!250624 (MissingZero!5130 i!1132)) (= lt!250624 (MissingVacant!5130 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34734 (_ BitVec 32)) SeekEntryResult!5130)

(assert (=> b!550806 (= lt!250624 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550807 () Bool)

(declare-fun res!343772 () Bool)

(assert (=> b!550807 (=> (not res!343772) (not e!317928))))

(assert (=> b!550807 (= res!343772 (and (= (size!17045 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17045 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17045 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550808 () Bool)

(declare-fun res!343765 () Bool)

(assert (=> b!550808 (=> (not res!343765) (not e!317928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550808 (= res!343765 (validKeyInArray!0 k0!1914))))

(declare-fun b!550809 () Bool)

(declare-fun res!343767 () Bool)

(assert (=> b!550809 (=> (not res!343767) (not e!317928))))

(assert (=> b!550809 (= res!343767 (validKeyInArray!0 (select (arr!16681 a!3118) j!142)))))

(declare-fun b!550810 () Bool)

(declare-fun res!343766 () Bool)

(assert (=> b!550810 (=> (not res!343766) (not e!317926))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34734 (_ BitVec 32)) SeekEntryResult!5130)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550810 (= res!343766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16681 a!3118) j!142) mask!3119) (select (arr!16681 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16681 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16681 a!3118) i!1132 k0!1914) j!142) (array!34735 (store (arr!16681 a!3118) i!1132 k0!1914) (size!17045 a!3118)) mask!3119)))))

(declare-fun b!550811 () Bool)

(assert (=> b!550811 (= e!317927 (= (seekEntryOrOpen!0 (select (arr!16681 a!3118) j!142) a!3118 mask!3119) (Found!5130 j!142)))))

(assert (= (and start!50338 res!343768) b!550807))

(assert (= (and b!550807 res!343772) b!550809))

(assert (= (and b!550809 res!343767) b!550808))

(assert (= (and b!550808 res!343765) b!550802))

(assert (= (and b!550802 res!343764) b!550806))

(assert (= (and b!550806 res!343763) b!550803))

(assert (= (and b!550803 res!343771) b!550805))

(assert (= (and b!550805 res!343769) b!550810))

(assert (= (and b!550810 res!343766) b!550804))

(assert (= (and b!550804 res!343770) b!550811))

(declare-fun m!527805 () Bool)

(assert (=> b!550806 m!527805))

(declare-fun m!527807 () Bool)

(assert (=> b!550810 m!527807))

(declare-fun m!527809 () Bool)

(assert (=> b!550810 m!527809))

(assert (=> b!550810 m!527807))

(declare-fun m!527811 () Bool)

(assert (=> b!550810 m!527811))

(declare-fun m!527813 () Bool)

(assert (=> b!550810 m!527813))

(assert (=> b!550810 m!527811))

(declare-fun m!527815 () Bool)

(assert (=> b!550810 m!527815))

(assert (=> b!550810 m!527809))

(assert (=> b!550810 m!527807))

(declare-fun m!527817 () Bool)

(assert (=> b!550810 m!527817))

(declare-fun m!527819 () Bool)

(assert (=> b!550810 m!527819))

(assert (=> b!550810 m!527811))

(assert (=> b!550810 m!527813))

(declare-fun m!527821 () Bool)

(assert (=> b!550803 m!527821))

(declare-fun m!527823 () Bool)

(assert (=> b!550805 m!527823))

(declare-fun m!527825 () Bool)

(assert (=> b!550808 m!527825))

(declare-fun m!527827 () Bool)

(assert (=> b!550802 m!527827))

(assert (=> b!550809 m!527807))

(assert (=> b!550809 m!527807))

(declare-fun m!527829 () Bool)

(assert (=> b!550809 m!527829))

(declare-fun m!527831 () Bool)

(assert (=> b!550804 m!527831))

(declare-fun m!527833 () Bool)

(assert (=> b!550804 m!527833))

(declare-fun m!527835 () Bool)

(assert (=> start!50338 m!527835))

(declare-fun m!527837 () Bool)

(assert (=> start!50338 m!527837))

(assert (=> b!550811 m!527807))

(assert (=> b!550811 m!527807))

(declare-fun m!527839 () Bool)

(assert (=> b!550811 m!527839))

(check-sat (not b!550805) (not b!550808) (not b!550811) (not b!550806) (not b!550804) (not b!550802) (not b!550810) (not b!550803) (not start!50338) (not b!550809))
(check-sat)
