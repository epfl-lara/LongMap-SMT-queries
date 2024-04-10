; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51424 () Bool)

(assert start!51424)

(declare-fun b!561959 () Bool)

(declare-fun res!353111 () Bool)

(declare-fun e!323843 () Bool)

(assert (=> b!561959 (=> (not res!353111) (not e!323843))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35289 0))(
  ( (array!35290 (arr!16945 (Array (_ BitVec 32) (_ BitVec 64))) (size!17309 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35289)

(assert (=> b!561959 (= res!353111 (and (= (size!17309 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17309 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17309 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561960 () Bool)

(declare-fun e!323847 () Bool)

(declare-fun e!323845 () Bool)

(assert (=> b!561960 (= e!323847 e!323845)))

(declare-fun res!353117 () Bool)

(assert (=> b!561960 (=> res!353117 e!323845)))

(declare-fun lt!255876 () (_ BitVec 64))

(assert (=> b!561960 (= res!353117 (or (= lt!255876 (select (arr!16945 a!3118) j!142)) (= lt!255876 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5394 0))(
  ( (MissingZero!5394 (index!23803 (_ BitVec 32))) (Found!5394 (index!23804 (_ BitVec 32))) (Intermediate!5394 (undefined!6206 Bool) (index!23805 (_ BitVec 32)) (x!52705 (_ BitVec 32))) (Undefined!5394) (MissingVacant!5394 (index!23806 (_ BitVec 32))) )
))
(declare-fun lt!255870 () SeekEntryResult!5394)

(assert (=> b!561960 (= lt!255876 (select (arr!16945 a!3118) (index!23805 lt!255870)))))

(declare-fun b!561961 () Bool)

(declare-fun res!353119 () Bool)

(declare-fun e!323840 () Bool)

(assert (=> b!561961 (=> (not res!353119) (not e!323840))))

(declare-datatypes ((List!11025 0))(
  ( (Nil!11022) (Cons!11021 (h!12024 (_ BitVec 64)) (t!17253 List!11025)) )
))
(declare-fun arrayNoDuplicates!0 (array!35289 (_ BitVec 32) List!11025) Bool)

(assert (=> b!561961 (= res!353119 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11022))))

(declare-fun b!561962 () Bool)

(declare-fun e!323841 () Bool)

(assert (=> b!561962 (= e!323841 (not true))))

(declare-fun e!323844 () Bool)

(assert (=> b!561962 e!323844))

(declare-fun res!353114 () Bool)

(assert (=> b!561962 (=> (not res!353114) (not e!323844))))

(declare-fun lt!255877 () SeekEntryResult!5394)

(assert (=> b!561962 (= res!353114 (= lt!255877 (Found!5394 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35289 (_ BitVec 32)) SeekEntryResult!5394)

(assert (=> b!561962 (= lt!255877 (seekEntryOrOpen!0 (select (arr!16945 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35289 (_ BitVec 32)) Bool)

(assert (=> b!561962 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17562 0))(
  ( (Unit!17563) )
))
(declare-fun lt!255873 () Unit!17562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17562)

(assert (=> b!561962 (= lt!255873 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561963 () Bool)

(assert (=> b!561963 (= e!323843 e!323840)))

(declare-fun res!353116 () Bool)

(assert (=> b!561963 (=> (not res!353116) (not e!323840))))

(declare-fun lt!255871 () SeekEntryResult!5394)

(assert (=> b!561963 (= res!353116 (or (= lt!255871 (MissingZero!5394 i!1132)) (= lt!255871 (MissingVacant!5394 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!561963 (= lt!255871 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561964 () Bool)

(declare-fun res!353122 () Bool)

(assert (=> b!561964 (=> (not res!353122) (not e!323840))))

(assert (=> b!561964 (= res!353122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561965 () Bool)

(declare-fun res!353123 () Bool)

(assert (=> b!561965 (=> (not res!353123) (not e!323843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561965 (= res!353123 (validKeyInArray!0 k0!1914))))

(declare-fun res!353120 () Bool)

(assert (=> start!51424 (=> (not res!353120) (not e!323843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51424 (= res!353120 (validMask!0 mask!3119))))

(assert (=> start!51424 e!323843))

(assert (=> start!51424 true))

(declare-fun array_inv!12741 (array!35289) Bool)

(assert (=> start!51424 (array_inv!12741 a!3118)))

(declare-fun lt!255875 () (_ BitVec 64))

(declare-fun e!323846 () Bool)

(declare-fun lt!255874 () array!35289)

(declare-fun b!561966 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35289 (_ BitVec 32)) SeekEntryResult!5394)

(assert (=> b!561966 (= e!323846 (= (seekEntryOrOpen!0 lt!255875 lt!255874 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52705 lt!255870) (index!23805 lt!255870) (index!23805 lt!255870) lt!255875 lt!255874 mask!3119)))))

(declare-fun b!561967 () Bool)

(assert (=> b!561967 (= e!323845 e!323846)))

(declare-fun res!353115 () Bool)

(assert (=> b!561967 (=> (not res!353115) (not e!323846))))

(assert (=> b!561967 (= res!353115 (= lt!255877 (seekKeyOrZeroReturnVacant!0 (x!52705 lt!255870) (index!23805 lt!255870) (index!23805 lt!255870) (select (arr!16945 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561968 () Bool)

(declare-fun res!353112 () Bool)

(assert (=> b!561968 (=> (not res!353112) (not e!323843))))

(assert (=> b!561968 (= res!353112 (validKeyInArray!0 (select (arr!16945 a!3118) j!142)))))

(declare-fun b!561969 () Bool)

(assert (=> b!561969 (= e!323844 e!323847)))

(declare-fun res!353118 () Bool)

(assert (=> b!561969 (=> res!353118 e!323847)))

(get-info :version)

(assert (=> b!561969 (= res!353118 (or (undefined!6206 lt!255870) (not ((_ is Intermediate!5394) lt!255870))))))

(declare-fun b!561970 () Bool)

(declare-fun res!353113 () Bool)

(assert (=> b!561970 (=> (not res!353113) (not e!323843))))

(declare-fun arrayContainsKey!0 (array!35289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561970 (= res!353113 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561971 () Bool)

(assert (=> b!561971 (= e!323840 e!323841)))

(declare-fun res!353121 () Bool)

(assert (=> b!561971 (=> (not res!353121) (not e!323841))))

(declare-fun lt!255872 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35289 (_ BitVec 32)) SeekEntryResult!5394)

(assert (=> b!561971 (= res!353121 (= lt!255870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255872 lt!255875 lt!255874 mask!3119)))))

(declare-fun lt!255869 () (_ BitVec 32))

(assert (=> b!561971 (= lt!255870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255869 (select (arr!16945 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561971 (= lt!255872 (toIndex!0 lt!255875 mask!3119))))

(assert (=> b!561971 (= lt!255875 (select (store (arr!16945 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561971 (= lt!255869 (toIndex!0 (select (arr!16945 a!3118) j!142) mask!3119))))

(assert (=> b!561971 (= lt!255874 (array!35290 (store (arr!16945 a!3118) i!1132 k0!1914) (size!17309 a!3118)))))

(assert (= (and start!51424 res!353120) b!561959))

(assert (= (and b!561959 res!353111) b!561968))

(assert (= (and b!561968 res!353112) b!561965))

(assert (= (and b!561965 res!353123) b!561970))

(assert (= (and b!561970 res!353113) b!561963))

(assert (= (and b!561963 res!353116) b!561964))

(assert (= (and b!561964 res!353122) b!561961))

(assert (= (and b!561961 res!353119) b!561971))

(assert (= (and b!561971 res!353121) b!561962))

(assert (= (and b!561962 res!353114) b!561969))

(assert (= (and b!561969 (not res!353118)) b!561960))

(assert (= (and b!561960 (not res!353117)) b!561967))

(assert (= (and b!561967 res!353115) b!561966))

(declare-fun m!539921 () Bool)

(assert (=> b!561962 m!539921))

(assert (=> b!561962 m!539921))

(declare-fun m!539923 () Bool)

(assert (=> b!561962 m!539923))

(declare-fun m!539925 () Bool)

(assert (=> b!561962 m!539925))

(declare-fun m!539927 () Bool)

(assert (=> b!561962 m!539927))

(declare-fun m!539929 () Bool)

(assert (=> b!561964 m!539929))

(assert (=> b!561967 m!539921))

(assert (=> b!561967 m!539921))

(declare-fun m!539931 () Bool)

(assert (=> b!561967 m!539931))

(assert (=> b!561971 m!539921))

(declare-fun m!539933 () Bool)

(assert (=> b!561971 m!539933))

(declare-fun m!539935 () Bool)

(assert (=> b!561971 m!539935))

(assert (=> b!561971 m!539921))

(declare-fun m!539937 () Bool)

(assert (=> b!561971 m!539937))

(declare-fun m!539939 () Bool)

(assert (=> b!561971 m!539939))

(declare-fun m!539941 () Bool)

(assert (=> b!561971 m!539941))

(assert (=> b!561971 m!539921))

(declare-fun m!539943 () Bool)

(assert (=> b!561971 m!539943))

(assert (=> b!561960 m!539921))

(declare-fun m!539945 () Bool)

(assert (=> b!561960 m!539945))

(declare-fun m!539947 () Bool)

(assert (=> start!51424 m!539947))

(declare-fun m!539949 () Bool)

(assert (=> start!51424 m!539949))

(declare-fun m!539951 () Bool)

(assert (=> b!561961 m!539951))

(assert (=> b!561968 m!539921))

(assert (=> b!561968 m!539921))

(declare-fun m!539953 () Bool)

(assert (=> b!561968 m!539953))

(declare-fun m!539955 () Bool)

(assert (=> b!561966 m!539955))

(declare-fun m!539957 () Bool)

(assert (=> b!561966 m!539957))

(declare-fun m!539959 () Bool)

(assert (=> b!561965 m!539959))

(declare-fun m!539961 () Bool)

(assert (=> b!561970 m!539961))

(declare-fun m!539963 () Bool)

(assert (=> b!561963 m!539963))

(check-sat (not b!561970) (not b!561961) (not b!561964) (not b!561968) (not start!51424) (not b!561965) (not b!561963) (not b!561962) (not b!561966) (not b!561967) (not b!561971))
(check-sat)
