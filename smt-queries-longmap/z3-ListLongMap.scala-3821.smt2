; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52414 () Bool)

(assert start!52414)

(declare-fun b!572036 () Bool)

(declare-fun e!329029 () Bool)

(declare-fun e!329033 () Bool)

(assert (=> b!572036 (= e!329029 e!329033)))

(declare-fun res!361551 () Bool)

(assert (=> b!572036 (=> res!361551 e!329033)))

(declare-datatypes ((SeekEntryResult!5643 0))(
  ( (MissingZero!5643 (index!24799 (_ BitVec 32))) (Found!5643 (index!24800 (_ BitVec 32))) (Intermediate!5643 (undefined!6455 Bool) (index!24801 (_ BitVec 32)) (x!53672 (_ BitVec 32))) (Undefined!5643) (MissingVacant!5643 (index!24802 (_ BitVec 32))) )
))
(declare-fun lt!260963 () SeekEntryResult!5643)

(get-info :version)

(assert (=> b!572036 (= res!361551 (or (undefined!6455 lt!260963) (not ((_ is Intermediate!5643) lt!260963))))))

(declare-fun b!572037 () Bool)

(declare-fun res!361552 () Bool)

(declare-fun e!329028 () Bool)

(assert (=> b!572037 (=> (not res!361552) (not e!329028))))

(declare-datatypes ((array!35811 0))(
  ( (array!35812 (arr!17194 (Array (_ BitVec 32) (_ BitVec 64))) (size!17558 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35811)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572037 (= res!361552 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572038 () Bool)

(declare-fun res!361554 () Bool)

(assert (=> b!572038 (=> (not res!361554) (not e!329028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572038 (= res!361554 (validKeyInArray!0 k0!1914))))

(declare-fun b!572039 () Bool)

(declare-fun res!361545 () Bool)

(declare-fun e!329031 () Bool)

(assert (=> b!572039 (=> (not res!361545) (not e!329031))))

(declare-datatypes ((List!11274 0))(
  ( (Nil!11271) (Cons!11270 (h!12297 (_ BitVec 64)) (t!17502 List!11274)) )
))
(declare-fun arrayNoDuplicates!0 (array!35811 (_ BitVec 32) List!11274) Bool)

(assert (=> b!572039 (= res!361545 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11271))))

(declare-fun b!572040 () Bool)

(declare-fun e!329030 () Bool)

(declare-fun e!329034 () Bool)

(assert (=> b!572040 (= e!329030 e!329034)))

(declare-fun res!361556 () Bool)

(assert (=> b!572040 (=> (not res!361556) (not e!329034))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260962 () SeekEntryResult!5643)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35811 (_ BitVec 32)) SeekEntryResult!5643)

(assert (=> b!572040 (= res!361556 (= lt!260962 (seekKeyOrZeroReturnVacant!0 (x!53672 lt!260963) (index!24801 lt!260963) (index!24801 lt!260963) (select (arr!17194 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572041 () Bool)

(declare-fun res!361549 () Bool)

(assert (=> b!572041 (=> (not res!361549) (not e!329028))))

(assert (=> b!572041 (= res!361549 (validKeyInArray!0 (select (arr!17194 a!3118) j!142)))))

(declare-fun b!572042 () Bool)

(assert (=> b!572042 (= e!329028 e!329031)))

(declare-fun res!361548 () Bool)

(assert (=> b!572042 (=> (not res!361548) (not e!329031))))

(declare-fun lt!260959 () SeekEntryResult!5643)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572042 (= res!361548 (or (= lt!260959 (MissingZero!5643 i!1132)) (= lt!260959 (MissingVacant!5643 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35811 (_ BitVec 32)) SeekEntryResult!5643)

(assert (=> b!572042 (= lt!260959 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572043 () Bool)

(declare-fun e!329027 () Bool)

(assert (=> b!572043 (= e!329027 (not true))))

(assert (=> b!572043 e!329029))

(declare-fun res!361555 () Bool)

(assert (=> b!572043 (=> (not res!361555) (not e!329029))))

(assert (=> b!572043 (= res!361555 (= lt!260962 (Found!5643 j!142)))))

(assert (=> b!572043 (= lt!260962 (seekEntryOrOpen!0 (select (arr!17194 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35811 (_ BitVec 32)) Bool)

(assert (=> b!572043 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17988 0))(
  ( (Unit!17989) )
))
(declare-fun lt!260958 () Unit!17988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17988)

(assert (=> b!572043 (= lt!260958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572044 () Bool)

(declare-fun res!361544 () Bool)

(assert (=> b!572044 (=> (not res!361544) (not e!329031))))

(assert (=> b!572044 (= res!361544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572045 () Bool)

(assert (=> b!572045 (= e!329031 e!329027)))

(declare-fun res!361550 () Bool)

(assert (=> b!572045 (=> (not res!361550) (not e!329027))))

(declare-fun lt!260965 () (_ BitVec 32))

(declare-fun lt!260964 () array!35811)

(declare-fun lt!260957 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35811 (_ BitVec 32)) SeekEntryResult!5643)

(assert (=> b!572045 (= res!361550 (= lt!260963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260965 lt!260957 lt!260964 mask!3119)))))

(declare-fun lt!260960 () (_ BitVec 32))

(assert (=> b!572045 (= lt!260963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260960 (select (arr!17194 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572045 (= lt!260965 (toIndex!0 lt!260957 mask!3119))))

(assert (=> b!572045 (= lt!260957 (select (store (arr!17194 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572045 (= lt!260960 (toIndex!0 (select (arr!17194 a!3118) j!142) mask!3119))))

(assert (=> b!572045 (= lt!260964 (array!35812 (store (arr!17194 a!3118) i!1132 k0!1914) (size!17558 a!3118)))))

(declare-fun b!572046 () Bool)

(assert (=> b!572046 (= e!329033 e!329030)))

(declare-fun res!361553 () Bool)

(assert (=> b!572046 (=> res!361553 e!329030)))

(declare-fun lt!260961 () (_ BitVec 64))

(assert (=> b!572046 (= res!361553 (or (= lt!260961 (select (arr!17194 a!3118) j!142)) (= lt!260961 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572046 (= lt!260961 (select (arr!17194 a!3118) (index!24801 lt!260963)))))

(declare-fun res!361547 () Bool)

(assert (=> start!52414 (=> (not res!361547) (not e!329028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52414 (= res!361547 (validMask!0 mask!3119))))

(assert (=> start!52414 e!329028))

(assert (=> start!52414 true))

(declare-fun array_inv!12990 (array!35811) Bool)

(assert (=> start!52414 (array_inv!12990 a!3118)))

(declare-fun b!572047 () Bool)

(assert (=> b!572047 (= e!329034 (= (seekEntryOrOpen!0 lt!260957 lt!260964 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53672 lt!260963) (index!24801 lt!260963) (index!24801 lt!260963) lt!260957 lt!260964 mask!3119)))))

(declare-fun b!572048 () Bool)

(declare-fun res!361546 () Bool)

(assert (=> b!572048 (=> (not res!361546) (not e!329028))))

(assert (=> b!572048 (= res!361546 (and (= (size!17558 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17558 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17558 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52414 res!361547) b!572048))

(assert (= (and b!572048 res!361546) b!572041))

(assert (= (and b!572041 res!361549) b!572038))

(assert (= (and b!572038 res!361554) b!572037))

(assert (= (and b!572037 res!361552) b!572042))

(assert (= (and b!572042 res!361548) b!572044))

(assert (= (and b!572044 res!361544) b!572039))

(assert (= (and b!572039 res!361545) b!572045))

(assert (= (and b!572045 res!361550) b!572043))

(assert (= (and b!572043 res!361555) b!572036))

(assert (= (and b!572036 (not res!361551)) b!572046))

(assert (= (and b!572046 (not res!361553)) b!572040))

(assert (= (and b!572040 res!361556) b!572047))

(declare-fun m!550961 () Bool)

(assert (=> b!572047 m!550961))

(declare-fun m!550963 () Bool)

(assert (=> b!572047 m!550963))

(declare-fun m!550965 () Bool)

(assert (=> b!572042 m!550965))

(declare-fun m!550967 () Bool)

(assert (=> b!572039 m!550967))

(declare-fun m!550969 () Bool)

(assert (=> b!572044 m!550969))

(declare-fun m!550971 () Bool)

(assert (=> b!572040 m!550971))

(assert (=> b!572040 m!550971))

(declare-fun m!550973 () Bool)

(assert (=> b!572040 m!550973))

(assert (=> b!572046 m!550971))

(declare-fun m!550975 () Bool)

(assert (=> b!572046 m!550975))

(declare-fun m!550977 () Bool)

(assert (=> b!572038 m!550977))

(assert (=> b!572043 m!550971))

(assert (=> b!572043 m!550971))

(declare-fun m!550979 () Bool)

(assert (=> b!572043 m!550979))

(declare-fun m!550981 () Bool)

(assert (=> b!572043 m!550981))

(declare-fun m!550983 () Bool)

(assert (=> b!572043 m!550983))

(declare-fun m!550985 () Bool)

(assert (=> b!572037 m!550985))

(declare-fun m!550987 () Bool)

(assert (=> start!52414 m!550987))

(declare-fun m!550989 () Bool)

(assert (=> start!52414 m!550989))

(assert (=> b!572045 m!550971))

(declare-fun m!550991 () Bool)

(assert (=> b!572045 m!550991))

(assert (=> b!572045 m!550971))

(declare-fun m!550993 () Bool)

(assert (=> b!572045 m!550993))

(declare-fun m!550995 () Bool)

(assert (=> b!572045 m!550995))

(assert (=> b!572045 m!550971))

(declare-fun m!550997 () Bool)

(assert (=> b!572045 m!550997))

(declare-fun m!550999 () Bool)

(assert (=> b!572045 m!550999))

(declare-fun m!551001 () Bool)

(assert (=> b!572045 m!551001))

(assert (=> b!572041 m!550971))

(assert (=> b!572041 m!550971))

(declare-fun m!551003 () Bool)

(assert (=> b!572041 m!551003))

(check-sat (not b!572044) (not b!572043) (not b!572045) (not b!572039) (not start!52414) (not b!572047) (not b!572041) (not b!572038) (not b!572040) (not b!572037) (not b!572042))
(check-sat)
