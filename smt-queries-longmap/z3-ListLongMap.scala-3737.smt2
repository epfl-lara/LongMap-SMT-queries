; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51418 () Bool)

(assert start!51418)

(declare-fun b!561842 () Bool)

(declare-fun res!353000 () Bool)

(declare-fun e!323770 () Bool)

(assert (=> b!561842 (=> (not res!353000) (not e!323770))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35283 0))(
  ( (array!35284 (arr!16942 (Array (_ BitVec 32) (_ BitVec 64))) (size!17306 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35283)

(assert (=> b!561842 (= res!353000 (and (= (size!17306 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17306 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17306 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561843 () Bool)

(declare-fun res!353005 () Bool)

(declare-fun e!323774 () Bool)

(assert (=> b!561843 (=> (not res!353005) (not e!323774))))

(declare-datatypes ((List!11022 0))(
  ( (Nil!11019) (Cons!11018 (h!12021 (_ BitVec 64)) (t!17250 List!11022)) )
))
(declare-fun arrayNoDuplicates!0 (array!35283 (_ BitVec 32) List!11022) Bool)

(assert (=> b!561843 (= res!353005 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11019))))

(declare-fun b!561844 () Bool)

(declare-fun e!323769 () Bool)

(assert (=> b!561844 (= e!323769 (not true))))

(declare-fun e!323768 () Bool)

(assert (=> b!561844 e!323768))

(declare-fun res!352999 () Bool)

(assert (=> b!561844 (=> (not res!352999) (not e!323768))))

(declare-datatypes ((SeekEntryResult!5391 0))(
  ( (MissingZero!5391 (index!23791 (_ BitVec 32))) (Found!5391 (index!23792 (_ BitVec 32))) (Intermediate!5391 (undefined!6203 Bool) (index!23793 (_ BitVec 32)) (x!52694 (_ BitVec 32))) (Undefined!5391) (MissingVacant!5391 (index!23794 (_ BitVec 32))) )
))
(declare-fun lt!255789 () SeekEntryResult!5391)

(assert (=> b!561844 (= res!352999 (= lt!255789 (Found!5391 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35283 (_ BitVec 32)) SeekEntryResult!5391)

(assert (=> b!561844 (= lt!255789 (seekEntryOrOpen!0 (select (arr!16942 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35283 (_ BitVec 32)) Bool)

(assert (=> b!561844 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17556 0))(
  ( (Unit!17557) )
))
(declare-fun lt!255788 () Unit!17556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17556)

(assert (=> b!561844 (= lt!255788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561845 () Bool)

(assert (=> b!561845 (= e!323774 e!323769)))

(declare-fun res!353006 () Bool)

(assert (=> b!561845 (=> (not res!353006) (not e!323769))))

(declare-fun lt!255790 () (_ BitVec 32))

(declare-fun lt!255793 () (_ BitVec 64))

(declare-fun lt!255794 () array!35283)

(declare-fun lt!255796 () SeekEntryResult!5391)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35283 (_ BitVec 32)) SeekEntryResult!5391)

(assert (=> b!561845 (= res!353006 (= lt!255796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255790 lt!255793 lt!255794 mask!3119)))))

(declare-fun lt!255791 () (_ BitVec 32))

(assert (=> b!561845 (= lt!255796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255791 (select (arr!16942 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561845 (= lt!255790 (toIndex!0 lt!255793 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!561845 (= lt!255793 (select (store (arr!16942 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561845 (= lt!255791 (toIndex!0 (select (arr!16942 a!3118) j!142) mask!3119))))

(assert (=> b!561845 (= lt!255794 (array!35284 (store (arr!16942 a!3118) i!1132 k0!1914) (size!17306 a!3118)))))

(declare-fun b!561846 () Bool)

(declare-fun res!353002 () Bool)

(assert (=> b!561846 (=> (not res!353002) (not e!323770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561846 (= res!353002 (validKeyInArray!0 k0!1914))))

(declare-fun b!561847 () Bool)

(declare-fun e!323775 () Bool)

(assert (=> b!561847 (= e!323768 e!323775)))

(declare-fun res!352994 () Bool)

(assert (=> b!561847 (=> res!352994 e!323775)))

(get-info :version)

(assert (=> b!561847 (= res!352994 (or (undefined!6203 lt!255796) (not ((_ is Intermediate!5391) lt!255796))))))

(declare-fun b!561848 () Bool)

(assert (=> b!561848 (= e!323770 e!323774)))

(declare-fun res!352995 () Bool)

(assert (=> b!561848 (=> (not res!352995) (not e!323774))))

(declare-fun lt!255792 () SeekEntryResult!5391)

(assert (=> b!561848 (= res!352995 (or (= lt!255792 (MissingZero!5391 i!1132)) (= lt!255792 (MissingVacant!5391 i!1132))))))

(assert (=> b!561848 (= lt!255792 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!352997 () Bool)

(assert (=> start!51418 (=> (not res!352997) (not e!323770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51418 (= res!352997 (validMask!0 mask!3119))))

(assert (=> start!51418 e!323770))

(assert (=> start!51418 true))

(declare-fun array_inv!12738 (array!35283) Bool)

(assert (=> start!51418 (array_inv!12738 a!3118)))

(declare-fun b!561849 () Bool)

(declare-fun res!353003 () Bool)

(assert (=> b!561849 (=> (not res!353003) (not e!323770))))

(assert (=> b!561849 (= res!353003 (validKeyInArray!0 (select (arr!16942 a!3118) j!142)))))

(declare-fun b!561850 () Bool)

(declare-fun res!352998 () Bool)

(assert (=> b!561850 (=> (not res!352998) (not e!323774))))

(assert (=> b!561850 (= res!352998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561851 () Bool)

(declare-fun e!323773 () Bool)

(declare-fun e!323772 () Bool)

(assert (=> b!561851 (= e!323773 e!323772)))

(declare-fun res!353004 () Bool)

(assert (=> b!561851 (=> (not res!353004) (not e!323772))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35283 (_ BitVec 32)) SeekEntryResult!5391)

(assert (=> b!561851 (= res!353004 (= lt!255789 (seekKeyOrZeroReturnVacant!0 (x!52694 lt!255796) (index!23793 lt!255796) (index!23793 lt!255796) (select (arr!16942 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561852 () Bool)

(assert (=> b!561852 (= e!323772 (= (seekEntryOrOpen!0 lt!255793 lt!255794 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52694 lt!255796) (index!23793 lt!255796) (index!23793 lt!255796) lt!255793 lt!255794 mask!3119)))))

(declare-fun b!561853 () Bool)

(declare-fun res!352996 () Bool)

(assert (=> b!561853 (=> (not res!352996) (not e!323770))))

(declare-fun arrayContainsKey!0 (array!35283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561853 (= res!352996 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561854 () Bool)

(assert (=> b!561854 (= e!323775 e!323773)))

(declare-fun res!353001 () Bool)

(assert (=> b!561854 (=> res!353001 e!323773)))

(declare-fun lt!255795 () (_ BitVec 64))

(assert (=> b!561854 (= res!353001 (or (= lt!255795 (select (arr!16942 a!3118) j!142)) (= lt!255795 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561854 (= lt!255795 (select (arr!16942 a!3118) (index!23793 lt!255796)))))

(assert (= (and start!51418 res!352997) b!561842))

(assert (= (and b!561842 res!353000) b!561849))

(assert (= (and b!561849 res!353003) b!561846))

(assert (= (and b!561846 res!353002) b!561853))

(assert (= (and b!561853 res!352996) b!561848))

(assert (= (and b!561848 res!352995) b!561850))

(assert (= (and b!561850 res!352998) b!561843))

(assert (= (and b!561843 res!353005) b!561845))

(assert (= (and b!561845 res!353006) b!561844))

(assert (= (and b!561844 res!352999) b!561847))

(assert (= (and b!561847 (not res!352994)) b!561854))

(assert (= (and b!561854 (not res!353001)) b!561851))

(assert (= (and b!561851 res!353004) b!561852))

(declare-fun m!539789 () Bool)

(assert (=> b!561848 m!539789))

(declare-fun m!539791 () Bool)

(assert (=> b!561843 m!539791))

(declare-fun m!539793 () Bool)

(assert (=> b!561854 m!539793))

(declare-fun m!539795 () Bool)

(assert (=> b!561854 m!539795))

(assert (=> b!561844 m!539793))

(assert (=> b!561844 m!539793))

(declare-fun m!539797 () Bool)

(assert (=> b!561844 m!539797))

(declare-fun m!539799 () Bool)

(assert (=> b!561844 m!539799))

(declare-fun m!539801 () Bool)

(assert (=> b!561844 m!539801))

(declare-fun m!539803 () Bool)

(assert (=> b!561853 m!539803))

(declare-fun m!539805 () Bool)

(assert (=> b!561852 m!539805))

(declare-fun m!539807 () Bool)

(assert (=> b!561852 m!539807))

(assert (=> b!561845 m!539793))

(declare-fun m!539809 () Bool)

(assert (=> b!561845 m!539809))

(declare-fun m!539811 () Bool)

(assert (=> b!561845 m!539811))

(assert (=> b!561845 m!539793))

(declare-fun m!539813 () Bool)

(assert (=> b!561845 m!539813))

(assert (=> b!561845 m!539793))

(declare-fun m!539815 () Bool)

(assert (=> b!561845 m!539815))

(declare-fun m!539817 () Bool)

(assert (=> b!561845 m!539817))

(declare-fun m!539819 () Bool)

(assert (=> b!561845 m!539819))

(declare-fun m!539821 () Bool)

(assert (=> start!51418 m!539821))

(declare-fun m!539823 () Bool)

(assert (=> start!51418 m!539823))

(declare-fun m!539825 () Bool)

(assert (=> b!561846 m!539825))

(assert (=> b!561851 m!539793))

(assert (=> b!561851 m!539793))

(declare-fun m!539827 () Bool)

(assert (=> b!561851 m!539827))

(declare-fun m!539829 () Bool)

(assert (=> b!561850 m!539829))

(assert (=> b!561849 m!539793))

(assert (=> b!561849 m!539793))

(declare-fun m!539831 () Bool)

(assert (=> b!561849 m!539831))

(check-sat (not b!561851) (not b!561850) (not b!561846) (not b!561853) (not b!561848) (not start!51418) (not b!561844) (not b!561845) (not b!561852) (not b!561843) (not b!561849))
(check-sat)
