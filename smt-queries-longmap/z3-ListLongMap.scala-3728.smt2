; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51408 () Bool)

(assert start!51408)

(declare-fun b!560950 () Bool)

(declare-fun e!323227 () Bool)

(declare-fun e!323225 () Bool)

(assert (=> b!560950 (= e!323227 e!323225)))

(declare-fun res!352008 () Bool)

(assert (=> b!560950 (=> (not res!352008) (not e!323225))))

(declare-datatypes ((SeekEntryResult!5314 0))(
  ( (MissingZero!5314 (index!23483 (_ BitVec 32))) (Found!5314 (index!23484 (_ BitVec 32))) (Intermediate!5314 (undefined!6126 Bool) (index!23485 (_ BitVec 32)) (x!52548 (_ BitVec 32))) (Undefined!5314) (MissingVacant!5314 (index!23486 (_ BitVec 32))) )
))
(declare-fun lt!255148 () SeekEntryResult!5314)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255149 () SeekEntryResult!5314)

(declare-datatypes ((array!35220 0))(
  ( (array!35221 (arr!16909 (Array (_ BitVec 32) (_ BitVec 64))) (size!17273 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35220)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35220 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!560950 (= res!352008 (= lt!255149 (seekKeyOrZeroReturnVacant!0 (x!52548 lt!255148) (index!23485 lt!255148) (index!23485 lt!255148) (select (arr!16909 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!352007 () Bool)

(declare-fun e!323230 () Bool)

(assert (=> start!51408 (=> (not res!352007) (not e!323230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51408 (= res!352007 (validMask!0 mask!3119))))

(assert (=> start!51408 e!323230))

(assert (=> start!51408 true))

(declare-fun array_inv!12768 (array!35220) Bool)

(assert (=> start!51408 (array_inv!12768 a!3118)))

(declare-fun b!560951 () Bool)

(declare-fun res!352001 () Bool)

(declare-fun e!323231 () Bool)

(assert (=> b!560951 (=> (not res!352001) (not e!323231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35220 (_ BitVec 32)) Bool)

(assert (=> b!560951 (= res!352001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560952 () Bool)

(declare-fun res!352000 () Bool)

(assert (=> b!560952 (=> (not res!352000) (not e!323231))))

(declare-datatypes ((List!10896 0))(
  ( (Nil!10893) (Cons!10892 (h!11898 (_ BitVec 64)) (t!17116 List!10896)) )
))
(declare-fun arrayNoDuplicates!0 (array!35220 (_ BitVec 32) List!10896) Bool)

(assert (=> b!560952 (= res!352000 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10893))))

(declare-fun b!560953 () Bool)

(declare-fun res!352009 () Bool)

(assert (=> b!560953 (=> (not res!352009) (not e!323230))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560953 (= res!352009 (validKeyInArray!0 k0!1914))))

(declare-fun b!560954 () Bool)

(declare-fun lt!255150 () array!35220)

(declare-fun lt!255147 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35220 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!560954 (= e!323225 (= (seekEntryOrOpen!0 lt!255147 lt!255150 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52548 lt!255148) (index!23485 lt!255148) (index!23485 lt!255148) lt!255147 lt!255150 mask!3119)))))

(declare-fun b!560955 () Bool)

(declare-fun e!323228 () Bool)

(declare-fun e!323226 () Bool)

(assert (=> b!560955 (= e!323228 e!323226)))

(declare-fun res!351999 () Bool)

(assert (=> b!560955 (=> res!351999 e!323226)))

(get-info :version)

(assert (=> b!560955 (= res!351999 (or (undefined!6126 lt!255148) (not ((_ is Intermediate!5314) lt!255148))))))

(declare-fun b!560956 () Bool)

(assert (=> b!560956 (= e!323230 e!323231)))

(declare-fun res!352003 () Bool)

(assert (=> b!560956 (=> (not res!352003) (not e!323231))))

(declare-fun lt!255143 () SeekEntryResult!5314)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560956 (= res!352003 (or (= lt!255143 (MissingZero!5314 i!1132)) (= lt!255143 (MissingVacant!5314 i!1132))))))

(assert (=> b!560956 (= lt!255143 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560957 () Bool)

(declare-fun res!352006 () Bool)

(assert (=> b!560957 (=> (not res!352006) (not e!323230))))

(assert (=> b!560957 (= res!352006 (validKeyInArray!0 (select (arr!16909 a!3118) j!142)))))

(declare-fun b!560958 () Bool)

(declare-fun e!323229 () Bool)

(assert (=> b!560958 (= e!323231 e!323229)))

(declare-fun res!351997 () Bool)

(assert (=> b!560958 (=> (not res!351997) (not e!323229))))

(declare-fun lt!255145 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35220 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!560958 (= res!351997 (= lt!255148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255145 lt!255147 lt!255150 mask!3119)))))

(declare-fun lt!255146 () (_ BitVec 32))

(assert (=> b!560958 (= lt!255148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255146 (select (arr!16909 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560958 (= lt!255145 (toIndex!0 lt!255147 mask!3119))))

(assert (=> b!560958 (= lt!255147 (select (store (arr!16909 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560958 (= lt!255146 (toIndex!0 (select (arr!16909 a!3118) j!142) mask!3119))))

(assert (=> b!560958 (= lt!255150 (array!35221 (store (arr!16909 a!3118) i!1132 k0!1914) (size!17273 a!3118)))))

(declare-fun b!560959 () Bool)

(declare-fun res!352004 () Bool)

(assert (=> b!560959 (=> (not res!352004) (not e!323230))))

(declare-fun arrayContainsKey!0 (array!35220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560959 (= res!352004 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560960 () Bool)

(assert (=> b!560960 (= e!323229 (not true))))

(assert (=> b!560960 e!323228))

(declare-fun res!351998 () Bool)

(assert (=> b!560960 (=> (not res!351998) (not e!323228))))

(assert (=> b!560960 (= res!351998 (= lt!255149 (Found!5314 j!142)))))

(assert (=> b!560960 (= lt!255149 (seekEntryOrOpen!0 (select (arr!16909 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560960 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17473 0))(
  ( (Unit!17474) )
))
(declare-fun lt!255144 () Unit!17473)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17473)

(assert (=> b!560960 (= lt!255144 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560961 () Bool)

(declare-fun res!352005 () Bool)

(assert (=> b!560961 (=> (not res!352005) (not e!323230))))

(assert (=> b!560961 (= res!352005 (and (= (size!17273 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17273 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17273 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560962 () Bool)

(assert (=> b!560962 (= e!323226 e!323227)))

(declare-fun res!352002 () Bool)

(assert (=> b!560962 (=> res!352002 e!323227)))

(declare-fun lt!255151 () (_ BitVec 64))

(assert (=> b!560962 (= res!352002 (or (= lt!255151 (select (arr!16909 a!3118) j!142)) (= lt!255151 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560962 (= lt!255151 (select (arr!16909 a!3118) (index!23485 lt!255148)))))

(assert (= (and start!51408 res!352007) b!560961))

(assert (= (and b!560961 res!352005) b!560957))

(assert (= (and b!560957 res!352006) b!560953))

(assert (= (and b!560953 res!352009) b!560959))

(assert (= (and b!560959 res!352004) b!560956))

(assert (= (and b!560956 res!352003) b!560951))

(assert (= (and b!560951 res!352001) b!560952))

(assert (= (and b!560952 res!352000) b!560958))

(assert (= (and b!560958 res!351997) b!560960))

(assert (= (and b!560960 res!351998) b!560955))

(assert (= (and b!560955 (not res!351999)) b!560962))

(assert (= (and b!560962 (not res!352002)) b!560950))

(assert (= (and b!560950 res!352008) b!560954))

(declare-fun m!538895 () Bool)

(assert (=> b!560952 m!538895))

(declare-fun m!538897 () Bool)

(assert (=> b!560962 m!538897))

(declare-fun m!538899 () Bool)

(assert (=> b!560962 m!538899))

(assert (=> b!560957 m!538897))

(assert (=> b!560957 m!538897))

(declare-fun m!538901 () Bool)

(assert (=> b!560957 m!538901))

(declare-fun m!538903 () Bool)

(assert (=> b!560959 m!538903))

(assert (=> b!560960 m!538897))

(assert (=> b!560960 m!538897))

(declare-fun m!538905 () Bool)

(assert (=> b!560960 m!538905))

(declare-fun m!538907 () Bool)

(assert (=> b!560960 m!538907))

(declare-fun m!538909 () Bool)

(assert (=> b!560960 m!538909))

(declare-fun m!538911 () Bool)

(assert (=> b!560956 m!538911))

(declare-fun m!538913 () Bool)

(assert (=> b!560958 m!538913))

(assert (=> b!560958 m!538897))

(declare-fun m!538915 () Bool)

(assert (=> b!560958 m!538915))

(declare-fun m!538917 () Bool)

(assert (=> b!560958 m!538917))

(assert (=> b!560958 m!538897))

(declare-fun m!538919 () Bool)

(assert (=> b!560958 m!538919))

(assert (=> b!560958 m!538897))

(declare-fun m!538921 () Bool)

(assert (=> b!560958 m!538921))

(declare-fun m!538923 () Bool)

(assert (=> b!560958 m!538923))

(declare-fun m!538925 () Bool)

(assert (=> b!560953 m!538925))

(declare-fun m!538927 () Bool)

(assert (=> b!560951 m!538927))

(declare-fun m!538929 () Bool)

(assert (=> b!560954 m!538929))

(declare-fun m!538931 () Bool)

(assert (=> b!560954 m!538931))

(assert (=> b!560950 m!538897))

(assert (=> b!560950 m!538897))

(declare-fun m!538933 () Bool)

(assert (=> b!560950 m!538933))

(declare-fun m!538935 () Bool)

(assert (=> start!51408 m!538935))

(declare-fun m!538937 () Bool)

(assert (=> start!51408 m!538937))

(check-sat (not b!560957) (not start!51408) (not b!560952) (not b!560956) (not b!560953) (not b!560950) (not b!560954) (not b!560958) (not b!560951) (not b!560960) (not b!560959))
(check-sat)
