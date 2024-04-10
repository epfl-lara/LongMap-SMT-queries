; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52198 () Bool)

(assert start!52198)

(declare-fun b!569837 () Bool)

(declare-fun res!359857 () Bool)

(declare-fun e!327754 () Bool)

(assert (=> b!569837 (=> (not res!359857) (not e!327754))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35721 0))(
  ( (array!35722 (arr!17152 (Array (_ BitVec 32) (_ BitVec 64))) (size!17516 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35721)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!569837 (= res!359857 (and (= (size!17516 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17516 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17516 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359863 () Bool)

(assert (=> start!52198 (=> (not res!359863) (not e!327754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52198 (= res!359863 (validMask!0 mask!3119))))

(assert (=> start!52198 e!327754))

(assert (=> start!52198 true))

(declare-fun array_inv!12948 (array!35721) Bool)

(assert (=> start!52198 (array_inv!12948 a!3118)))

(declare-fun b!569838 () Bool)

(declare-fun res!359860 () Bool)

(declare-fun e!327756 () Bool)

(assert (=> b!569838 (=> (not res!359860) (not e!327756))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5601 0))(
  ( (MissingZero!5601 (index!24631 (_ BitVec 32))) (Found!5601 (index!24632 (_ BitVec 32))) (Intermediate!5601 (undefined!6413 Bool) (index!24633 (_ BitVec 32)) (x!53500 (_ BitVec 32))) (Undefined!5601) (MissingVacant!5601 (index!24634 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35721 (_ BitVec 32)) SeekEntryResult!5601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569838 (= res!359860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17152 a!3118) j!142) mask!3119) (select (arr!17152 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) (array!35722 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118)) mask!3119)))))

(declare-fun b!569839 () Bool)

(declare-fun res!359859 () Bool)

(assert (=> b!569839 (=> (not res!359859) (not e!327754))))

(declare-fun arrayContainsKey!0 (array!35721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569839 (= res!359859 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569840 () Bool)

(assert (=> b!569840 (= e!327754 e!327756)))

(declare-fun res!359862 () Bool)

(assert (=> b!569840 (=> (not res!359862) (not e!327756))))

(declare-fun lt!259786 () SeekEntryResult!5601)

(assert (=> b!569840 (= res!359862 (or (= lt!259786 (MissingZero!5601 i!1132)) (= lt!259786 (MissingVacant!5601 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35721 (_ BitVec 32)) SeekEntryResult!5601)

(assert (=> b!569840 (= lt!259786 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569841 () Bool)

(declare-fun res!359861 () Bool)

(assert (=> b!569841 (=> (not res!359861) (not e!327754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569841 (= res!359861 (validKeyInArray!0 (select (arr!17152 a!3118) j!142)))))

(declare-fun b!569842 () Bool)

(declare-fun res!359864 () Bool)

(assert (=> b!569842 (=> (not res!359864) (not e!327756))))

(declare-datatypes ((List!11232 0))(
  ( (Nil!11229) (Cons!11228 (h!12249 (_ BitVec 64)) (t!17460 List!11232)) )
))
(declare-fun arrayNoDuplicates!0 (array!35721 (_ BitVec 32) List!11232) Bool)

(assert (=> b!569842 (= res!359864 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11229))))

(declare-fun b!569843 () Bool)

(declare-fun e!327755 () Bool)

(assert (=> b!569843 (= e!327755 (= (seekEntryOrOpen!0 (select (arr!17152 a!3118) j!142) a!3118 mask!3119) (Found!5601 j!142)))))

(declare-fun b!569844 () Bool)

(assert (=> b!569844 (= e!327756 (not true))))

(assert (=> b!569844 e!327755))

(declare-fun res!359856 () Bool)

(assert (=> b!569844 (=> (not res!359856) (not e!327755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35721 (_ BitVec 32)) Bool)

(assert (=> b!569844 (= res!359856 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17904 0))(
  ( (Unit!17905) )
))
(declare-fun lt!259785 () Unit!17904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17904)

(assert (=> b!569844 (= lt!259785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569845 () Bool)

(declare-fun res!359858 () Bool)

(assert (=> b!569845 (=> (not res!359858) (not e!327754))))

(assert (=> b!569845 (= res!359858 (validKeyInArray!0 k0!1914))))

(declare-fun b!569846 () Bool)

(declare-fun res!359855 () Bool)

(assert (=> b!569846 (=> (not res!359855) (not e!327756))))

(assert (=> b!569846 (= res!359855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52198 res!359863) b!569837))

(assert (= (and b!569837 res!359857) b!569841))

(assert (= (and b!569841 res!359861) b!569845))

(assert (= (and b!569845 res!359858) b!569839))

(assert (= (and b!569839 res!359859) b!569840))

(assert (= (and b!569840 res!359862) b!569846))

(assert (= (and b!569846 res!359855) b!569842))

(assert (= (and b!569842 res!359864) b!569838))

(assert (= (and b!569838 res!359860) b!569844))

(assert (= (and b!569844 res!359856) b!569843))

(declare-fun m!548721 () Bool)

(assert (=> b!569846 m!548721))

(declare-fun m!548723 () Bool)

(assert (=> b!569844 m!548723))

(declare-fun m!548725 () Bool)

(assert (=> b!569844 m!548725))

(declare-fun m!548727 () Bool)

(assert (=> start!52198 m!548727))

(declare-fun m!548729 () Bool)

(assert (=> start!52198 m!548729))

(declare-fun m!548731 () Bool)

(assert (=> b!569838 m!548731))

(declare-fun m!548733 () Bool)

(assert (=> b!569838 m!548733))

(assert (=> b!569838 m!548731))

(declare-fun m!548735 () Bool)

(assert (=> b!569838 m!548735))

(declare-fun m!548737 () Bool)

(assert (=> b!569838 m!548737))

(assert (=> b!569838 m!548735))

(declare-fun m!548739 () Bool)

(assert (=> b!569838 m!548739))

(assert (=> b!569838 m!548733))

(assert (=> b!569838 m!548731))

(declare-fun m!548741 () Bool)

(assert (=> b!569838 m!548741))

(declare-fun m!548743 () Bool)

(assert (=> b!569838 m!548743))

(assert (=> b!569838 m!548735))

(assert (=> b!569838 m!548737))

(assert (=> b!569841 m!548731))

(assert (=> b!569841 m!548731))

(declare-fun m!548745 () Bool)

(assert (=> b!569841 m!548745))

(declare-fun m!548747 () Bool)

(assert (=> b!569842 m!548747))

(declare-fun m!548749 () Bool)

(assert (=> b!569845 m!548749))

(assert (=> b!569843 m!548731))

(assert (=> b!569843 m!548731))

(declare-fun m!548751 () Bool)

(assert (=> b!569843 m!548751))

(declare-fun m!548753 () Bool)

(assert (=> b!569839 m!548753))

(declare-fun m!548755 () Bool)

(assert (=> b!569840 m!548755))

(check-sat (not b!569842) (not start!52198) (not b!569846) (not b!569845) (not b!569843) (not b!569841) (not b!569839) (not b!569844) (not b!569840) (not b!569838))
(check-sat)
