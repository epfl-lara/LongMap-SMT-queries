; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51402 () Bool)

(assert start!51402)

(declare-fun b!560833 () Bool)

(declare-fun e!323159 () Bool)

(declare-fun e!323160 () Bool)

(assert (=> b!560833 (= e!323159 e!323160)))

(declare-fun res!351890 () Bool)

(assert (=> b!560833 (=> (not res!351890) (not e!323160))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5311 0))(
  ( (MissingZero!5311 (index!23471 (_ BitVec 32))) (Found!5311 (index!23472 (_ BitVec 32))) (Intermediate!5311 (undefined!6123 Bool) (index!23473 (_ BitVec 32)) (x!52537 (_ BitVec 32))) (Undefined!5311) (MissingVacant!5311 (index!23474 (_ BitVec 32))) )
))
(declare-fun lt!255069 () SeekEntryResult!5311)

(declare-fun lt!255070 () SeekEntryResult!5311)

(declare-datatypes ((array!35214 0))(
  ( (array!35215 (arr!16906 (Array (_ BitVec 32) (_ BitVec 64))) (size!17270 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35214)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35214 (_ BitVec 32)) SeekEntryResult!5311)

(assert (=> b!560833 (= res!351890 (= lt!255069 (seekKeyOrZeroReturnVacant!0 (x!52537 lt!255070) (index!23473 lt!255070) (index!23473 lt!255070) (select (arr!16906 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!351891 () Bool)

(declare-fun e!323158 () Bool)

(assert (=> start!51402 (=> (not res!351891) (not e!323158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51402 (= res!351891 (validMask!0 mask!3119))))

(assert (=> start!51402 e!323158))

(assert (=> start!51402 true))

(declare-fun array_inv!12765 (array!35214) Bool)

(assert (=> start!51402 (array_inv!12765 a!3118)))

(declare-fun b!560834 () Bool)

(declare-fun res!351880 () Bool)

(assert (=> b!560834 (=> (not res!351880) (not e!323158))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560834 (= res!351880 (and (= (size!17270 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17270 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17270 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560835 () Bool)

(declare-fun e!323157 () Bool)

(declare-fun e!323154 () Bool)

(assert (=> b!560835 (= e!323157 e!323154)))

(declare-fun res!351885 () Bool)

(assert (=> b!560835 (=> res!351885 e!323154)))

(get-info :version)

(assert (=> b!560835 (= res!351885 (or (undefined!6123 lt!255070) (not ((_ is Intermediate!5311) lt!255070))))))

(declare-fun b!560836 () Bool)

(declare-fun res!351887 () Bool)

(assert (=> b!560836 (=> (not res!351887) (not e!323158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560836 (= res!351887 (validKeyInArray!0 (select (arr!16906 a!3118) j!142)))))

(declare-fun lt!255066 () array!35214)

(declare-fun lt!255067 () (_ BitVec 64))

(declare-fun b!560837 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35214 (_ BitVec 32)) SeekEntryResult!5311)

(assert (=> b!560837 (= e!323160 (= (seekEntryOrOpen!0 lt!255067 lt!255066 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52537 lt!255070) (index!23473 lt!255070) (index!23473 lt!255070) lt!255067 lt!255066 mask!3119)))))

(declare-fun b!560838 () Bool)

(declare-fun e!323153 () Bool)

(assert (=> b!560838 (= e!323153 (not true))))

(assert (=> b!560838 e!323157))

(declare-fun res!351889 () Bool)

(assert (=> b!560838 (=> (not res!351889) (not e!323157))))

(assert (=> b!560838 (= res!351889 (= lt!255069 (Found!5311 j!142)))))

(assert (=> b!560838 (= lt!255069 (seekEntryOrOpen!0 (select (arr!16906 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35214 (_ BitVec 32)) Bool)

(assert (=> b!560838 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17467 0))(
  ( (Unit!17468) )
))
(declare-fun lt!255063 () Unit!17467)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17467)

(assert (=> b!560838 (= lt!255063 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560839 () Bool)

(declare-fun res!351882 () Bool)

(assert (=> b!560839 (=> (not res!351882) (not e!323158))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560839 (= res!351882 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560840 () Bool)

(declare-fun e!323155 () Bool)

(assert (=> b!560840 (= e!323155 e!323153)))

(declare-fun res!351884 () Bool)

(assert (=> b!560840 (=> (not res!351884) (not e!323153))))

(declare-fun lt!255065 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35214 (_ BitVec 32)) SeekEntryResult!5311)

(assert (=> b!560840 (= res!351884 (= lt!255070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255065 lt!255067 lt!255066 mask!3119)))))

(declare-fun lt!255064 () (_ BitVec 32))

(assert (=> b!560840 (= lt!255070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255064 (select (arr!16906 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560840 (= lt!255065 (toIndex!0 lt!255067 mask!3119))))

(assert (=> b!560840 (= lt!255067 (select (store (arr!16906 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560840 (= lt!255064 (toIndex!0 (select (arr!16906 a!3118) j!142) mask!3119))))

(assert (=> b!560840 (= lt!255066 (array!35215 (store (arr!16906 a!3118) i!1132 k0!1914) (size!17270 a!3118)))))

(declare-fun b!560841 () Bool)

(declare-fun res!351883 () Bool)

(assert (=> b!560841 (=> (not res!351883) (not e!323158))))

(assert (=> b!560841 (= res!351883 (validKeyInArray!0 k0!1914))))

(declare-fun b!560842 () Bool)

(declare-fun res!351881 () Bool)

(assert (=> b!560842 (=> (not res!351881) (not e!323155))))

(declare-datatypes ((List!10893 0))(
  ( (Nil!10890) (Cons!10889 (h!11895 (_ BitVec 64)) (t!17113 List!10893)) )
))
(declare-fun arrayNoDuplicates!0 (array!35214 (_ BitVec 32) List!10893) Bool)

(assert (=> b!560842 (= res!351881 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10890))))

(declare-fun b!560843 () Bool)

(assert (=> b!560843 (= e!323158 e!323155)))

(declare-fun res!351888 () Bool)

(assert (=> b!560843 (=> (not res!351888) (not e!323155))))

(declare-fun lt!255068 () SeekEntryResult!5311)

(assert (=> b!560843 (= res!351888 (or (= lt!255068 (MissingZero!5311 i!1132)) (= lt!255068 (MissingVacant!5311 i!1132))))))

(assert (=> b!560843 (= lt!255068 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560844 () Bool)

(assert (=> b!560844 (= e!323154 e!323159)))

(declare-fun res!351892 () Bool)

(assert (=> b!560844 (=> res!351892 e!323159)))

(declare-fun lt!255062 () (_ BitVec 64))

(assert (=> b!560844 (= res!351892 (or (= lt!255062 (select (arr!16906 a!3118) j!142)) (= lt!255062 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560844 (= lt!255062 (select (arr!16906 a!3118) (index!23473 lt!255070)))))

(declare-fun b!560845 () Bool)

(declare-fun res!351886 () Bool)

(assert (=> b!560845 (=> (not res!351886) (not e!323155))))

(assert (=> b!560845 (= res!351886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51402 res!351891) b!560834))

(assert (= (and b!560834 res!351880) b!560836))

(assert (= (and b!560836 res!351887) b!560841))

(assert (= (and b!560841 res!351883) b!560839))

(assert (= (and b!560839 res!351882) b!560843))

(assert (= (and b!560843 res!351888) b!560845))

(assert (= (and b!560845 res!351886) b!560842))

(assert (= (and b!560842 res!351881) b!560840))

(assert (= (and b!560840 res!351884) b!560838))

(assert (= (and b!560838 res!351889) b!560835))

(assert (= (and b!560835 (not res!351885)) b!560844))

(assert (= (and b!560844 (not res!351892)) b!560833))

(assert (= (and b!560833 res!351890) b!560837))

(declare-fun m!538763 () Bool)

(assert (=> start!51402 m!538763))

(declare-fun m!538765 () Bool)

(assert (=> start!51402 m!538765))

(declare-fun m!538767 () Bool)

(assert (=> b!560838 m!538767))

(assert (=> b!560838 m!538767))

(declare-fun m!538769 () Bool)

(assert (=> b!560838 m!538769))

(declare-fun m!538771 () Bool)

(assert (=> b!560838 m!538771))

(declare-fun m!538773 () Bool)

(assert (=> b!560838 m!538773))

(declare-fun m!538775 () Bool)

(assert (=> b!560845 m!538775))

(assert (=> b!560844 m!538767))

(declare-fun m!538777 () Bool)

(assert (=> b!560844 m!538777))

(declare-fun m!538779 () Bool)

(assert (=> b!560843 m!538779))

(assert (=> b!560833 m!538767))

(assert (=> b!560833 m!538767))

(declare-fun m!538781 () Bool)

(assert (=> b!560833 m!538781))

(declare-fun m!538783 () Bool)

(assert (=> b!560842 m!538783))

(declare-fun m!538785 () Bool)

(assert (=> b!560837 m!538785))

(declare-fun m!538787 () Bool)

(assert (=> b!560837 m!538787))

(assert (=> b!560836 m!538767))

(assert (=> b!560836 m!538767))

(declare-fun m!538789 () Bool)

(assert (=> b!560836 m!538789))

(declare-fun m!538791 () Bool)

(assert (=> b!560841 m!538791))

(declare-fun m!538793 () Bool)

(assert (=> b!560839 m!538793))

(assert (=> b!560840 m!538767))

(declare-fun m!538795 () Bool)

(assert (=> b!560840 m!538795))

(assert (=> b!560840 m!538767))

(declare-fun m!538797 () Bool)

(assert (=> b!560840 m!538797))

(declare-fun m!538799 () Bool)

(assert (=> b!560840 m!538799))

(assert (=> b!560840 m!538767))

(declare-fun m!538801 () Bool)

(assert (=> b!560840 m!538801))

(declare-fun m!538803 () Bool)

(assert (=> b!560840 m!538803))

(declare-fun m!538805 () Bool)

(assert (=> b!560840 m!538805))

(check-sat (not b!560845) (not b!560839) (not start!51402) (not b!560833) (not b!560842) (not b!560840) (not b!560836) (not b!560841) (not b!560838) (not b!560837) (not b!560843))
(check-sat)
