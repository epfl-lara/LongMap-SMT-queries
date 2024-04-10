; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51380 () Bool)

(assert start!51380)

(declare-fun b!561101 () Bool)

(declare-fun e!323319 () Bool)

(declare-fun e!323313 () Bool)

(assert (=> b!561101 (= e!323319 e!323313)))

(declare-fun res!352260 () Bool)

(assert (=> b!561101 (=> (not res!352260) (not e!323313))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5372 0))(
  ( (MissingZero!5372 (index!23715 (_ BitVec 32))) (Found!5372 (index!23716 (_ BitVec 32))) (Intermediate!5372 (undefined!6184 Bool) (index!23717 (_ BitVec 32)) (x!52627 (_ BitVec 32))) (Undefined!5372) (MissingVacant!5372 (index!23718 (_ BitVec 32))) )
))
(declare-fun lt!255278 () SeekEntryResult!5372)

(declare-fun lt!255280 () SeekEntryResult!5372)

(declare-datatypes ((array!35245 0))(
  ( (array!35246 (arr!16923 (Array (_ BitVec 32) (_ BitVec 64))) (size!17287 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35245)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35245 (_ BitVec 32)) SeekEntryResult!5372)

(assert (=> b!561101 (= res!352260 (= lt!255280 (seekKeyOrZeroReturnVacant!0 (x!52627 lt!255278) (index!23717 lt!255278) (index!23717 lt!255278) (select (arr!16923 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561102 () Bool)

(declare-fun res!352264 () Bool)

(declare-fun e!323314 () Bool)

(assert (=> b!561102 (=> (not res!352264) (not e!323314))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561102 (= res!352264 (and (= (size!17287 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17287 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17287 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561103 () Bool)

(declare-fun e!323317 () Bool)

(assert (=> b!561103 (= e!323317 (not true))))

(declare-fun e!323312 () Bool)

(assert (=> b!561103 e!323312))

(declare-fun res!352265 () Bool)

(assert (=> b!561103 (=> (not res!352265) (not e!323312))))

(assert (=> b!561103 (= res!352265 (= lt!255280 (Found!5372 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35245 (_ BitVec 32)) SeekEntryResult!5372)

(assert (=> b!561103 (= lt!255280 (seekEntryOrOpen!0 (select (arr!16923 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35245 (_ BitVec 32)) Bool)

(assert (=> b!561103 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17518 0))(
  ( (Unit!17519) )
))
(declare-fun lt!255276 () Unit!17518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17518)

(assert (=> b!561103 (= lt!255276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561104 () Bool)

(declare-fun res!352263 () Bool)

(assert (=> b!561104 (=> (not res!352263) (not e!323314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561104 (= res!352263 (validKeyInArray!0 (select (arr!16923 a!3118) j!142)))))

(declare-fun lt!255281 () array!35245)

(declare-fun b!561105 () Bool)

(declare-fun lt!255277 () (_ BitVec 64))

(assert (=> b!561105 (= e!323313 (= (seekEntryOrOpen!0 lt!255277 lt!255281 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52627 lt!255278) (index!23717 lt!255278) (index!23717 lt!255278) lt!255277 lt!255281 mask!3119)))))

(declare-fun b!561106 () Bool)

(declare-fun e!323315 () Bool)

(assert (=> b!561106 (= e!323315 e!323317)))

(declare-fun res!352255 () Bool)

(assert (=> b!561106 (=> (not res!352255) (not e!323317))))

(declare-fun lt!255282 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35245 (_ BitVec 32)) SeekEntryResult!5372)

(assert (=> b!561106 (= res!352255 (= lt!255278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255282 lt!255277 lt!255281 mask!3119)))))

(declare-fun lt!255279 () (_ BitVec 32))

(assert (=> b!561106 (= lt!255278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255279 (select (arr!16923 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561106 (= lt!255282 (toIndex!0 lt!255277 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!561106 (= lt!255277 (select (store (arr!16923 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561106 (= lt!255279 (toIndex!0 (select (arr!16923 a!3118) j!142) mask!3119))))

(assert (=> b!561106 (= lt!255281 (array!35246 (store (arr!16923 a!3118) i!1132 k!1914) (size!17287 a!3118)))))

(declare-fun b!561107 () Bool)

(declare-fun e!323318 () Bool)

(assert (=> b!561107 (= e!323318 e!323319)))

(declare-fun res!352258 () Bool)

(assert (=> b!561107 (=> res!352258 e!323319)))

(declare-fun lt!255275 () (_ BitVec 64))

(assert (=> b!561107 (= res!352258 (or (= lt!255275 (select (arr!16923 a!3118) j!142)) (= lt!255275 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561107 (= lt!255275 (select (arr!16923 a!3118) (index!23717 lt!255278)))))

(declare-fun b!561108 () Bool)

(declare-fun res!352254 () Bool)

(assert (=> b!561108 (=> (not res!352254) (not e!323314))))

(assert (=> b!561108 (= res!352254 (validKeyInArray!0 k!1914))))

(declare-fun b!561109 () Bool)

(assert (=> b!561109 (= e!323314 e!323315)))

(declare-fun res!352257 () Bool)

(assert (=> b!561109 (=> (not res!352257) (not e!323315))))

(declare-fun lt!255283 () SeekEntryResult!5372)

(assert (=> b!561109 (= res!352257 (or (= lt!255283 (MissingZero!5372 i!1132)) (= lt!255283 (MissingVacant!5372 i!1132))))))

(assert (=> b!561109 (= lt!255283 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561110 () Bool)

(declare-fun res!352253 () Bool)

(assert (=> b!561110 (=> (not res!352253) (not e!323314))))

(declare-fun arrayContainsKey!0 (array!35245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561110 (= res!352253 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561111 () Bool)

(assert (=> b!561111 (= e!323312 e!323318)))

(declare-fun res!352259 () Bool)

(assert (=> b!561111 (=> res!352259 e!323318)))

(assert (=> b!561111 (= res!352259 (or (undefined!6184 lt!255278) (not (is-Intermediate!5372 lt!255278))))))

(declare-fun res!352262 () Bool)

(assert (=> start!51380 (=> (not res!352262) (not e!323314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51380 (= res!352262 (validMask!0 mask!3119))))

(assert (=> start!51380 e!323314))

(assert (=> start!51380 true))

(declare-fun array_inv!12719 (array!35245) Bool)

(assert (=> start!51380 (array_inv!12719 a!3118)))

(declare-fun b!561112 () Bool)

(declare-fun res!352256 () Bool)

(assert (=> b!561112 (=> (not res!352256) (not e!323315))))

(assert (=> b!561112 (= res!352256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561113 () Bool)

(declare-fun res!352261 () Bool)

(assert (=> b!561113 (=> (not res!352261) (not e!323315))))

(declare-datatypes ((List!11003 0))(
  ( (Nil!11000) (Cons!10999 (h!12002 (_ BitVec 64)) (t!17231 List!11003)) )
))
(declare-fun arrayNoDuplicates!0 (array!35245 (_ BitVec 32) List!11003) Bool)

(assert (=> b!561113 (= res!352261 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11000))))

(assert (= (and start!51380 res!352262) b!561102))

(assert (= (and b!561102 res!352264) b!561104))

(assert (= (and b!561104 res!352263) b!561108))

(assert (= (and b!561108 res!352254) b!561110))

(assert (= (and b!561110 res!352253) b!561109))

(assert (= (and b!561109 res!352257) b!561112))

(assert (= (and b!561112 res!352256) b!561113))

(assert (= (and b!561113 res!352261) b!561106))

(assert (= (and b!561106 res!352255) b!561103))

(assert (= (and b!561103 res!352265) b!561111))

(assert (= (and b!561111 (not res!352259)) b!561107))

(assert (= (and b!561107 (not res!352258)) b!561101))

(assert (= (and b!561101 res!352260) b!561105))

(declare-fun m!538953 () Bool)

(assert (=> b!561110 m!538953))

(declare-fun m!538955 () Bool)

(assert (=> b!561108 m!538955))

(declare-fun m!538957 () Bool)

(assert (=> b!561112 m!538957))

(declare-fun m!538959 () Bool)

(assert (=> b!561104 m!538959))

(assert (=> b!561104 m!538959))

(declare-fun m!538961 () Bool)

(assert (=> b!561104 m!538961))

(declare-fun m!538963 () Bool)

(assert (=> b!561106 m!538963))

(assert (=> b!561106 m!538959))

(declare-fun m!538965 () Bool)

(assert (=> b!561106 m!538965))

(assert (=> b!561106 m!538959))

(declare-fun m!538967 () Bool)

(assert (=> b!561106 m!538967))

(declare-fun m!538969 () Bool)

(assert (=> b!561106 m!538969))

(assert (=> b!561106 m!538959))

(declare-fun m!538971 () Bool)

(assert (=> b!561106 m!538971))

(declare-fun m!538973 () Bool)

(assert (=> b!561106 m!538973))

(declare-fun m!538975 () Bool)

(assert (=> start!51380 m!538975))

(declare-fun m!538977 () Bool)

(assert (=> start!51380 m!538977))

(declare-fun m!538979 () Bool)

(assert (=> b!561113 m!538979))

(assert (=> b!561107 m!538959))

(declare-fun m!538981 () Bool)

(assert (=> b!561107 m!538981))

(declare-fun m!538983 () Bool)

(assert (=> b!561109 m!538983))

(assert (=> b!561103 m!538959))

(assert (=> b!561103 m!538959))

(declare-fun m!538985 () Bool)

(assert (=> b!561103 m!538985))

(declare-fun m!538987 () Bool)

(assert (=> b!561103 m!538987))

(declare-fun m!538989 () Bool)

(assert (=> b!561103 m!538989))

(assert (=> b!561101 m!538959))

(assert (=> b!561101 m!538959))

(declare-fun m!538991 () Bool)

(assert (=> b!561101 m!538991))

(declare-fun m!538993 () Bool)

(assert (=> b!561105 m!538993))

(declare-fun m!538995 () Bool)

(assert (=> b!561105 m!538995))

(push 1)

