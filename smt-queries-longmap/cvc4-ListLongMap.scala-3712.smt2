; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51072 () Bool)

(assert start!51072)

(declare-fun b!558049 () Bool)

(declare-fun res!349912 () Bool)

(declare-fun e!321485 () Bool)

(assert (=> b!558049 (=> (not res!349912) (not e!321485))))

(declare-datatypes ((array!35126 0))(
  ( (array!35127 (arr!16868 (Array (_ BitVec 32) (_ BitVec 64))) (size!17232 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35126)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35126 (_ BitVec 32)) Bool)

(assert (=> b!558049 (= res!349912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!349914 () Bool)

(declare-fun e!321483 () Bool)

(assert (=> start!51072 (=> (not res!349914) (not e!321483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51072 (= res!349914 (validMask!0 mask!3119))))

(assert (=> start!51072 e!321483))

(assert (=> start!51072 true))

(declare-fun array_inv!12664 (array!35126) Bool)

(assert (=> start!51072 (array_inv!12664 a!3118)))

(declare-fun b!558050 () Bool)

(declare-fun res!349916 () Bool)

(assert (=> b!558050 (=> (not res!349916) (not e!321483))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558050 (= res!349916 (and (= (size!17232 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17232 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17232 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558051 () Bool)

(declare-fun res!349913 () Bool)

(assert (=> b!558051 (=> (not res!349913) (not e!321483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558051 (= res!349913 (validKeyInArray!0 (select (arr!16868 a!3118) j!142)))))

(declare-fun b!558052 () Bool)

(assert (=> b!558052 (= e!321483 e!321485)))

(declare-fun res!349920 () Bool)

(assert (=> b!558052 (=> (not res!349920) (not e!321485))))

(declare-datatypes ((SeekEntryResult!5317 0))(
  ( (MissingZero!5317 (index!23495 (_ BitVec 32))) (Found!5317 (index!23496 (_ BitVec 32))) (Intermediate!5317 (undefined!6129 Bool) (index!23497 (_ BitVec 32)) (x!52393 (_ BitVec 32))) (Undefined!5317) (MissingVacant!5317 (index!23498 (_ BitVec 32))) )
))
(declare-fun lt!253572 () SeekEntryResult!5317)

(assert (=> b!558052 (= res!349920 (or (= lt!253572 (MissingZero!5317 i!1132)) (= lt!253572 (MissingVacant!5317 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35126 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!558052 (= lt!253572 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558053 () Bool)

(declare-fun res!349922 () Bool)

(assert (=> b!558053 (=> (not res!349922) (not e!321485))))

(declare-datatypes ((List!10948 0))(
  ( (Nil!10945) (Cons!10944 (h!11938 (_ BitVec 64)) (t!17176 List!10948)) )
))
(declare-fun arrayNoDuplicates!0 (array!35126 (_ BitVec 32) List!10948) Bool)

(assert (=> b!558053 (= res!349922 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10945))))

(declare-fun lt!253569 () SeekEntryResult!5317)

(declare-fun e!321484 () Bool)

(declare-fun lt!253571 () SeekEntryResult!5317)

(declare-fun b!558054 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35126 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!558054 (= e!321484 (= lt!253571 (seekKeyOrZeroReturnVacant!0 (x!52393 lt!253569) (index!23497 lt!253569) (index!23497 lt!253569) (select (arr!16868 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558055 () Bool)

(declare-fun e!321482 () Bool)

(assert (=> b!558055 (= e!321482 e!321484)))

(declare-fun res!349917 () Bool)

(assert (=> b!558055 (=> res!349917 e!321484)))

(assert (=> b!558055 (= res!349917 (or (undefined!6129 lt!253569) (not (is-Intermediate!5317 lt!253569)) (= (select (arr!16868 a!3118) (index!23497 lt!253569)) (select (arr!16868 a!3118) j!142)) (= (select (arr!16868 a!3118) (index!23497 lt!253569)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558056 () Bool)

(declare-fun e!321481 () Bool)

(assert (=> b!558056 (= e!321485 e!321481)))

(declare-fun res!349921 () Bool)

(assert (=> b!558056 (=> (not res!349921) (not e!321481))))

(declare-fun lt!253568 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35126 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!558056 (= res!349921 (= lt!253569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253568 (select (store (arr!16868 a!3118) i!1132 k!1914) j!142) (array!35127 (store (arr!16868 a!3118) i!1132 k!1914) (size!17232 a!3118)) mask!3119)))))

(declare-fun lt!253573 () (_ BitVec 32))

(assert (=> b!558056 (= lt!253569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253573 (select (arr!16868 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558056 (= lt!253568 (toIndex!0 (select (store (arr!16868 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558056 (= lt!253573 (toIndex!0 (select (arr!16868 a!3118) j!142) mask!3119))))

(declare-fun b!558057 () Bool)

(assert (=> b!558057 (= e!321481 (not (or (undefined!6129 lt!253569) (not (is-Intermediate!5317 lt!253569)) (= (select (arr!16868 a!3118) (index!23497 lt!253569)) (select (arr!16868 a!3118) j!142)) (= (select (arr!16868 a!3118) (index!23497 lt!253569)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!558057 e!321482))

(declare-fun res!349919 () Bool)

(assert (=> b!558057 (=> (not res!349919) (not e!321482))))

(assert (=> b!558057 (= res!349919 (= lt!253571 (Found!5317 j!142)))))

(assert (=> b!558057 (= lt!253571 (seekEntryOrOpen!0 (select (arr!16868 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558057 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17408 0))(
  ( (Unit!17409) )
))
(declare-fun lt!253570 () Unit!17408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17408)

(assert (=> b!558057 (= lt!253570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558058 () Bool)

(declare-fun res!349915 () Bool)

(assert (=> b!558058 (=> (not res!349915) (not e!321483))))

(declare-fun arrayContainsKey!0 (array!35126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558058 (= res!349915 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558059 () Bool)

(declare-fun res!349918 () Bool)

(assert (=> b!558059 (=> (not res!349918) (not e!321483))))

(assert (=> b!558059 (= res!349918 (validKeyInArray!0 k!1914))))

(assert (= (and start!51072 res!349914) b!558050))

(assert (= (and b!558050 res!349916) b!558051))

(assert (= (and b!558051 res!349913) b!558059))

(assert (= (and b!558059 res!349918) b!558058))

(assert (= (and b!558058 res!349915) b!558052))

(assert (= (and b!558052 res!349920) b!558049))

(assert (= (and b!558049 res!349912) b!558053))

(assert (= (and b!558053 res!349922) b!558056))

(assert (= (and b!558056 res!349921) b!558057))

(assert (= (and b!558057 res!349919) b!558055))

(assert (= (and b!558055 (not res!349917)) b!558054))

(declare-fun m!535949 () Bool)

(assert (=> start!51072 m!535949))

(declare-fun m!535951 () Bool)

(assert (=> start!51072 m!535951))

(declare-fun m!535953 () Bool)

(assert (=> b!558059 m!535953))

(declare-fun m!535955 () Bool)

(assert (=> b!558051 m!535955))

(assert (=> b!558051 m!535955))

(declare-fun m!535957 () Bool)

(assert (=> b!558051 m!535957))

(declare-fun m!535959 () Bool)

(assert (=> b!558053 m!535959))

(declare-fun m!535961 () Bool)

(assert (=> b!558055 m!535961))

(assert (=> b!558055 m!535955))

(declare-fun m!535963 () Bool)

(assert (=> b!558049 m!535963))

(assert (=> b!558057 m!535961))

(assert (=> b!558057 m!535955))

(declare-fun m!535965 () Bool)

(assert (=> b!558057 m!535965))

(declare-fun m!535967 () Bool)

(assert (=> b!558057 m!535967))

(assert (=> b!558057 m!535955))

(declare-fun m!535969 () Bool)

(assert (=> b!558057 m!535969))

(declare-fun m!535971 () Bool)

(assert (=> b!558052 m!535971))

(assert (=> b!558056 m!535955))

(declare-fun m!535973 () Bool)

(assert (=> b!558056 m!535973))

(declare-fun m!535975 () Bool)

(assert (=> b!558056 m!535975))

(declare-fun m!535977 () Bool)

(assert (=> b!558056 m!535977))

(assert (=> b!558056 m!535955))

(declare-fun m!535979 () Bool)

(assert (=> b!558056 m!535979))

(assert (=> b!558056 m!535975))

(declare-fun m!535981 () Bool)

(assert (=> b!558056 m!535981))

(assert (=> b!558056 m!535975))

(assert (=> b!558056 m!535955))

(declare-fun m!535983 () Bool)

(assert (=> b!558056 m!535983))

(declare-fun m!535985 () Bool)

(assert (=> b!558058 m!535985))

(assert (=> b!558054 m!535955))

(assert (=> b!558054 m!535955))

(declare-fun m!535987 () Bool)

(assert (=> b!558054 m!535987))

(push 1)

