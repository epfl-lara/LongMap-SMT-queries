; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50622 () Bool)

(assert start!50622)

(declare-fun b!552745 () Bool)

(declare-fun res!345058 () Bool)

(declare-fun e!318980 () Bool)

(assert (=> b!552745 (=> (not res!345058) (not e!318980))))

(declare-datatypes ((array!34794 0))(
  ( (array!34795 (arr!16705 (Array (_ BitVec 32) (_ BitVec 64))) (size!17069 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34794)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34794 (_ BitVec 32)) Bool)

(assert (=> b!552745 (= res!345058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552746 () Bool)

(declare-fun res!345052 () Bool)

(declare-fun e!318978 () Bool)

(assert (=> b!552746 (=> (not res!345052) (not e!318978))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552746 (= res!345052 (validKeyInArray!0 (select (arr!16705 a!3118) j!142)))))

(declare-fun b!552747 () Bool)

(declare-fun res!345056 () Bool)

(assert (=> b!552747 (=> (not res!345056) (not e!318980))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5110 0))(
  ( (MissingZero!5110 (index!22667 (_ BitVec 32))) (Found!5110 (index!22668 (_ BitVec 32))) (Intermediate!5110 (undefined!5922 Bool) (index!22669 (_ BitVec 32)) (x!51755 (_ BitVec 32))) (Undefined!5110) (MissingVacant!5110 (index!22670 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34794 (_ BitVec 32)) SeekEntryResult!5110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552747 (= res!345056 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16705 a!3118) j!142) mask!3119) (select (arr!16705 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16705 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16705 a!3118) i!1132 k0!1914) j!142) (array!34795 (store (arr!16705 a!3118) i!1132 k0!1914) (size!17069 a!3118)) mask!3119)))))

(declare-fun res!345053 () Bool)

(assert (=> start!50622 (=> (not res!345053) (not e!318978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50622 (= res!345053 (validMask!0 mask!3119))))

(assert (=> start!50622 e!318978))

(assert (=> start!50622 true))

(declare-fun array_inv!12564 (array!34794) Bool)

(assert (=> start!50622 (array_inv!12564 a!3118)))

(declare-fun e!318979 () Bool)

(declare-fun b!552748 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34794 (_ BitVec 32)) SeekEntryResult!5110)

(assert (=> b!552748 (= e!318979 (= (seekEntryOrOpen!0 (select (arr!16705 a!3118) j!142) a!3118 mask!3119) (Found!5110 j!142)))))

(declare-fun b!552749 () Bool)

(assert (=> b!552749 (= e!318978 e!318980)))

(declare-fun res!345055 () Bool)

(assert (=> b!552749 (=> (not res!345055) (not e!318980))))

(declare-fun lt!251322 () SeekEntryResult!5110)

(assert (=> b!552749 (= res!345055 (or (= lt!251322 (MissingZero!5110 i!1132)) (= lt!251322 (MissingVacant!5110 i!1132))))))

(assert (=> b!552749 (= lt!251322 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552750 () Bool)

(declare-fun res!345061 () Bool)

(assert (=> b!552750 (=> (not res!345061) (not e!318978))))

(assert (=> b!552750 (= res!345061 (validKeyInArray!0 k0!1914))))

(declare-fun b!552751 () Bool)

(declare-fun res!345057 () Bool)

(assert (=> b!552751 (=> (not res!345057) (not e!318980))))

(declare-datatypes ((List!10692 0))(
  ( (Nil!10689) (Cons!10688 (h!11676 (_ BitVec 64)) (t!16912 List!10692)) )
))
(declare-fun arrayNoDuplicates!0 (array!34794 (_ BitVec 32) List!10692) Bool)

(assert (=> b!552751 (= res!345057 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10689))))

(declare-fun b!552752 () Bool)

(assert (=> b!552752 (= e!318980 (not true))))

(assert (=> b!552752 e!318979))

(declare-fun res!345060 () Bool)

(assert (=> b!552752 (=> (not res!345060) (not e!318979))))

(assert (=> b!552752 (= res!345060 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17065 0))(
  ( (Unit!17066) )
))
(declare-fun lt!251323 () Unit!17065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17065)

(assert (=> b!552752 (= lt!251323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552753 () Bool)

(declare-fun res!345059 () Bool)

(assert (=> b!552753 (=> (not res!345059) (not e!318978))))

(declare-fun arrayContainsKey!0 (array!34794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552753 (= res!345059 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552754 () Bool)

(declare-fun res!345054 () Bool)

(assert (=> b!552754 (=> (not res!345054) (not e!318978))))

(assert (=> b!552754 (= res!345054 (and (= (size!17069 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17069 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17069 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50622 res!345053) b!552754))

(assert (= (and b!552754 res!345054) b!552746))

(assert (= (and b!552746 res!345052) b!552750))

(assert (= (and b!552750 res!345061) b!552753))

(assert (= (and b!552753 res!345059) b!552749))

(assert (= (and b!552749 res!345055) b!552745))

(assert (= (and b!552745 res!345058) b!552751))

(assert (= (and b!552751 res!345057) b!552747))

(assert (= (and b!552747 res!345056) b!552752))

(assert (= (and b!552752 res!345060) b!552748))

(declare-fun m!529793 () Bool)

(assert (=> b!552749 m!529793))

(declare-fun m!529795 () Bool)

(assert (=> b!552751 m!529795))

(declare-fun m!529797 () Bool)

(assert (=> b!552752 m!529797))

(declare-fun m!529799 () Bool)

(assert (=> b!552752 m!529799))

(declare-fun m!529801 () Bool)

(assert (=> b!552753 m!529801))

(declare-fun m!529803 () Bool)

(assert (=> b!552747 m!529803))

(declare-fun m!529805 () Bool)

(assert (=> b!552747 m!529805))

(assert (=> b!552747 m!529803))

(declare-fun m!529807 () Bool)

(assert (=> b!552747 m!529807))

(declare-fun m!529809 () Bool)

(assert (=> b!552747 m!529809))

(assert (=> b!552747 m!529807))

(declare-fun m!529811 () Bool)

(assert (=> b!552747 m!529811))

(assert (=> b!552747 m!529805))

(assert (=> b!552747 m!529803))

(declare-fun m!529813 () Bool)

(assert (=> b!552747 m!529813))

(declare-fun m!529815 () Bool)

(assert (=> b!552747 m!529815))

(assert (=> b!552747 m!529807))

(assert (=> b!552747 m!529809))

(declare-fun m!529817 () Bool)

(assert (=> b!552750 m!529817))

(declare-fun m!529819 () Bool)

(assert (=> b!552745 m!529819))

(declare-fun m!529821 () Bool)

(assert (=> start!50622 m!529821))

(declare-fun m!529823 () Bool)

(assert (=> start!50622 m!529823))

(assert (=> b!552748 m!529803))

(assert (=> b!552748 m!529803))

(declare-fun m!529825 () Bool)

(assert (=> b!552748 m!529825))

(assert (=> b!552746 m!529803))

(assert (=> b!552746 m!529803))

(declare-fun m!529827 () Bool)

(assert (=> b!552746 m!529827))

(check-sat (not b!552753) (not start!50622) (not b!552746) (not b!552745) (not b!552748) (not b!552752) (not b!552749) (not b!552751) (not b!552747) (not b!552750))
(check-sat)
