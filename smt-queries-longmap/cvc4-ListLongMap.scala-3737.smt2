; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51420 () Bool)

(assert start!51420)

(declare-fun b!561881 () Bool)

(declare-fun res!353037 () Bool)

(declare-fun e!323797 () Bool)

(assert (=> b!561881 (=> (not res!353037) (not e!323797))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35285 0))(
  ( (array!35286 (arr!16943 (Array (_ BitVec 32) (_ BitVec 64))) (size!17307 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35285)

(assert (=> b!561881 (= res!353037 (and (= (size!17307 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17307 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17307 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561882 () Bool)

(declare-fun res!353043 () Bool)

(assert (=> b!561882 (=> (not res!353043) (not e!323797))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561882 (= res!353043 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561884 () Bool)

(declare-fun e!323793 () Bool)

(assert (=> b!561884 (= e!323793 (not true))))

(declare-fun e!323792 () Bool)

(assert (=> b!561884 e!323792))

(declare-fun res!353038 () Bool)

(assert (=> b!561884 (=> (not res!353038) (not e!323792))))

(declare-datatypes ((SeekEntryResult!5392 0))(
  ( (MissingZero!5392 (index!23795 (_ BitVec 32))) (Found!5392 (index!23796 (_ BitVec 32))) (Intermediate!5392 (undefined!6204 Bool) (index!23797 (_ BitVec 32)) (x!52695 (_ BitVec 32))) (Undefined!5392) (MissingVacant!5392 (index!23798 (_ BitVec 32))) )
))
(declare-fun lt!255815 () SeekEntryResult!5392)

(assert (=> b!561884 (= res!353038 (= lt!255815 (Found!5392 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35285 (_ BitVec 32)) SeekEntryResult!5392)

(assert (=> b!561884 (= lt!255815 (seekEntryOrOpen!0 (select (arr!16943 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35285 (_ BitVec 32)) Bool)

(assert (=> b!561884 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17558 0))(
  ( (Unit!17559) )
))
(declare-fun lt!255818 () Unit!17558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17558)

(assert (=> b!561884 (= lt!255818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561885 () Bool)

(declare-fun e!323794 () Bool)

(declare-fun e!323796 () Bool)

(assert (=> b!561885 (= e!323794 e!323796)))

(declare-fun res!353040 () Bool)

(assert (=> b!561885 (=> res!353040 e!323796)))

(declare-fun lt!255816 () (_ BitVec 64))

(assert (=> b!561885 (= res!353040 (or (= lt!255816 (select (arr!16943 a!3118) j!142)) (= lt!255816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!255820 () SeekEntryResult!5392)

(assert (=> b!561885 (= lt!255816 (select (arr!16943 a!3118) (index!23797 lt!255820)))))

(declare-fun b!561886 () Bool)

(declare-fun res!353033 () Bool)

(assert (=> b!561886 (=> (not res!353033) (not e!323797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561886 (= res!353033 (validKeyInArray!0 k!1914))))

(declare-fun b!561887 () Bool)

(declare-fun e!323795 () Bool)

(assert (=> b!561887 (= e!323797 e!323795)))

(declare-fun res!353041 () Bool)

(assert (=> b!561887 (=> (not res!353041) (not e!323795))))

(declare-fun lt!255822 () SeekEntryResult!5392)

(assert (=> b!561887 (= res!353041 (or (= lt!255822 (MissingZero!5392 i!1132)) (= lt!255822 (MissingVacant!5392 i!1132))))))

(assert (=> b!561887 (= lt!255822 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561888 () Bool)

(assert (=> b!561888 (= e!323792 e!323794)))

(declare-fun res!353042 () Bool)

(assert (=> b!561888 (=> res!353042 e!323794)))

(assert (=> b!561888 (= res!353042 (or (undefined!6204 lt!255820) (not (is-Intermediate!5392 lt!255820))))))

(declare-fun b!561889 () Bool)

(declare-fun res!353034 () Bool)

(assert (=> b!561889 (=> (not res!353034) (not e!323795))))

(declare-datatypes ((List!11023 0))(
  ( (Nil!11020) (Cons!11019 (h!12022 (_ BitVec 64)) (t!17251 List!11023)) )
))
(declare-fun arrayNoDuplicates!0 (array!35285 (_ BitVec 32) List!11023) Bool)

(assert (=> b!561889 (= res!353034 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11020))))

(declare-fun b!561890 () Bool)

(assert (=> b!561890 (= e!323795 e!323793)))

(declare-fun res!353044 () Bool)

(assert (=> b!561890 (=> (not res!353044) (not e!323793))))

(declare-fun lt!255823 () (_ BitVec 64))

(declare-fun lt!255819 () (_ BitVec 32))

(declare-fun lt!255817 () array!35285)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35285 (_ BitVec 32)) SeekEntryResult!5392)

(assert (=> b!561890 (= res!353044 (= lt!255820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255819 lt!255823 lt!255817 mask!3119)))))

(declare-fun lt!255821 () (_ BitVec 32))

(assert (=> b!561890 (= lt!255820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255821 (select (arr!16943 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561890 (= lt!255819 (toIndex!0 lt!255823 mask!3119))))

(assert (=> b!561890 (= lt!255823 (select (store (arr!16943 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561890 (= lt!255821 (toIndex!0 (select (arr!16943 a!3118) j!142) mask!3119))))

(assert (=> b!561890 (= lt!255817 (array!35286 (store (arr!16943 a!3118) i!1132 k!1914) (size!17307 a!3118)))))

(declare-fun b!561891 () Bool)

(declare-fun e!323799 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35285 (_ BitVec 32)) SeekEntryResult!5392)

(assert (=> b!561891 (= e!323799 (= (seekEntryOrOpen!0 lt!255823 lt!255817 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52695 lt!255820) (index!23797 lt!255820) (index!23797 lt!255820) lt!255823 lt!255817 mask!3119)))))

(declare-fun b!561883 () Bool)

(declare-fun res!353035 () Bool)

(assert (=> b!561883 (=> (not res!353035) (not e!323795))))

(assert (=> b!561883 (= res!353035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!353036 () Bool)

(assert (=> start!51420 (=> (not res!353036) (not e!323797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51420 (= res!353036 (validMask!0 mask!3119))))

(assert (=> start!51420 e!323797))

(assert (=> start!51420 true))

(declare-fun array_inv!12739 (array!35285) Bool)

(assert (=> start!51420 (array_inv!12739 a!3118)))

(declare-fun b!561892 () Bool)

(assert (=> b!561892 (= e!323796 e!323799)))

(declare-fun res!353045 () Bool)

(assert (=> b!561892 (=> (not res!353045) (not e!323799))))

(assert (=> b!561892 (= res!353045 (= lt!255815 (seekKeyOrZeroReturnVacant!0 (x!52695 lt!255820) (index!23797 lt!255820) (index!23797 lt!255820) (select (arr!16943 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561893 () Bool)

(declare-fun res!353039 () Bool)

(assert (=> b!561893 (=> (not res!353039) (not e!323797))))

(assert (=> b!561893 (= res!353039 (validKeyInArray!0 (select (arr!16943 a!3118) j!142)))))

(assert (= (and start!51420 res!353036) b!561881))

(assert (= (and b!561881 res!353037) b!561893))

(assert (= (and b!561893 res!353039) b!561886))

(assert (= (and b!561886 res!353033) b!561882))

(assert (= (and b!561882 res!353043) b!561887))

(assert (= (and b!561887 res!353041) b!561883))

(assert (= (and b!561883 res!353035) b!561889))

(assert (= (and b!561889 res!353034) b!561890))

(assert (= (and b!561890 res!353044) b!561884))

(assert (= (and b!561884 res!353038) b!561888))

(assert (= (and b!561888 (not res!353042)) b!561885))

(assert (= (and b!561885 (not res!353040)) b!561892))

(assert (= (and b!561892 res!353045) b!561891))

(declare-fun m!539833 () Bool)

(assert (=> b!561892 m!539833))

(assert (=> b!561892 m!539833))

(declare-fun m!539835 () Bool)

(assert (=> b!561892 m!539835))

(declare-fun m!539837 () Bool)

(assert (=> b!561887 m!539837))

(assert (=> b!561885 m!539833))

(declare-fun m!539839 () Bool)

(assert (=> b!561885 m!539839))

(assert (=> b!561884 m!539833))

(assert (=> b!561884 m!539833))

(declare-fun m!539841 () Bool)

(assert (=> b!561884 m!539841))

(declare-fun m!539843 () Bool)

(assert (=> b!561884 m!539843))

(declare-fun m!539845 () Bool)

(assert (=> b!561884 m!539845))

(declare-fun m!539847 () Bool)

(assert (=> start!51420 m!539847))

(declare-fun m!539849 () Bool)

(assert (=> start!51420 m!539849))

(assert (=> b!561893 m!539833))

(assert (=> b!561893 m!539833))

(declare-fun m!539851 () Bool)

(assert (=> b!561893 m!539851))

(declare-fun m!539853 () Bool)

(assert (=> b!561883 m!539853))

(declare-fun m!539855 () Bool)

(assert (=> b!561891 m!539855))

(declare-fun m!539857 () Bool)

(assert (=> b!561891 m!539857))

(declare-fun m!539859 () Bool)

(assert (=> b!561889 m!539859))

(assert (=> b!561890 m!539833))

(declare-fun m!539861 () Bool)

(assert (=> b!561890 m!539861))

(declare-fun m!539863 () Bool)

(assert (=> b!561890 m!539863))

(assert (=> b!561890 m!539833))

(declare-fun m!539865 () Bool)

(assert (=> b!561890 m!539865))

(declare-fun m!539867 () Bool)

(assert (=> b!561890 m!539867))

(declare-fun m!539869 () Bool)

(assert (=> b!561890 m!539869))

(declare-fun m!539871 () Bool)

(assert (=> b!561890 m!539871))

(assert (=> b!561890 m!539833))

(declare-fun m!539873 () Bool)

(assert (=> b!561882 m!539873))

(declare-fun m!539875 () Bool)

(assert (=> b!561886 m!539875))

(push 1)

