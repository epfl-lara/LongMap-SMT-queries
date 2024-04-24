; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52344 () Bool)

(assert start!52344)

(declare-fun b!570921 () Bool)

(declare-fun res!360603 () Bool)

(declare-fun e!328370 () Bool)

(assert (=> b!570921 (=> (not res!360603) (not e!328370))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570921 (= res!360603 (validKeyInArray!0 k0!1914))))

(declare-fun b!570922 () Bool)

(declare-fun e!328368 () Bool)

(declare-fun e!328367 () Bool)

(assert (=> b!570922 (= e!328368 e!328367)))

(declare-fun res!360601 () Bool)

(assert (=> b!570922 (=> res!360601 e!328367)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5569 0))(
  ( (MissingZero!5569 (index!24503 (_ BitVec 32))) (Found!5569 (index!24504 (_ BitVec 32))) (Intermediate!5569 (undefined!6381 Bool) (index!24505 (_ BitVec 32)) (x!53528 (_ BitVec 32))) (Undefined!5569) (MissingVacant!5569 (index!24506 (_ BitVec 32))) )
))
(declare-fun lt!260300 () SeekEntryResult!5569)

(declare-datatypes ((array!35751 0))(
  ( (array!35752 (arr!17164 (Array (_ BitVec 32) (_ BitVec 64))) (size!17528 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35751)

(get-info :version)

(assert (=> b!570922 (= res!360601 (or (undefined!6381 lt!260300) (not ((_ is Intermediate!5569) lt!260300)) (= (select (arr!17164 a!3118) (index!24505 lt!260300)) (select (arr!17164 a!3118) j!142)) (= (select (arr!17164 a!3118) (index!24505 lt!260300)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570923 () Bool)

(declare-fun e!328371 () Bool)

(declare-fun e!328369 () Bool)

(assert (=> b!570923 (= e!328371 e!328369)))

(declare-fun res!360602 () Bool)

(assert (=> b!570923 (=> (not res!360602) (not e!328369))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!260302 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35751 (_ BitVec 32)) SeekEntryResult!5569)

(assert (=> b!570923 (= res!360602 (= lt!260300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260302 (select (store (arr!17164 a!3118) i!1132 k0!1914) j!142) (array!35752 (store (arr!17164 a!3118) i!1132 k0!1914) (size!17528 a!3118)) mask!3119)))))

(declare-fun lt!260301 () (_ BitVec 32))

(assert (=> b!570923 (= lt!260300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260301 (select (arr!17164 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570923 (= lt!260302 (toIndex!0 (select (store (arr!17164 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570923 (= lt!260301 (toIndex!0 (select (arr!17164 a!3118) j!142) mask!3119))))

(declare-fun b!570924 () Bool)

(declare-fun res!360599 () Bool)

(assert (=> b!570924 (=> (not res!360599) (not e!328371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35751 (_ BitVec 32)) Bool)

(assert (=> b!570924 (= res!360599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570925 () Bool)

(assert (=> b!570925 (= e!328370 e!328371)))

(declare-fun res!360600 () Bool)

(assert (=> b!570925 (=> (not res!360600) (not e!328371))))

(declare-fun lt!260299 () SeekEntryResult!5569)

(assert (=> b!570925 (= res!360600 (or (= lt!260299 (MissingZero!5569 i!1132)) (= lt!260299 (MissingVacant!5569 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35751 (_ BitVec 32)) SeekEntryResult!5569)

(assert (=> b!570925 (= lt!260299 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!360598 () Bool)

(assert (=> start!52344 (=> (not res!360598) (not e!328370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52344 (= res!360598 (validMask!0 mask!3119))))

(assert (=> start!52344 e!328370))

(assert (=> start!52344 true))

(declare-fun array_inv!13023 (array!35751) Bool)

(assert (=> start!52344 (array_inv!13023 a!3118)))

(declare-fun b!570926 () Bool)

(declare-fun res!360597 () Bool)

(assert (=> b!570926 (=> (not res!360597) (not e!328370))))

(declare-fun arrayContainsKey!0 (array!35751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570926 (= res!360597 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570927 () Bool)

(assert (=> b!570927 (= e!328369 (not true))))

(assert (=> b!570927 e!328368))

(declare-fun res!360605 () Bool)

(assert (=> b!570927 (=> (not res!360605) (not e!328368))))

(declare-fun lt!260298 () SeekEntryResult!5569)

(assert (=> b!570927 (= res!360605 (= lt!260298 (Found!5569 j!142)))))

(assert (=> b!570927 (= lt!260298 (seekEntryOrOpen!0 (select (arr!17164 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570927 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17911 0))(
  ( (Unit!17912) )
))
(declare-fun lt!260297 () Unit!17911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17911)

(assert (=> b!570927 (= lt!260297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570928 () Bool)

(declare-fun res!360607 () Bool)

(assert (=> b!570928 (=> (not res!360607) (not e!328370))))

(assert (=> b!570928 (= res!360607 (validKeyInArray!0 (select (arr!17164 a!3118) j!142)))))

(declare-fun b!570929 () Bool)

(declare-fun res!360606 () Bool)

(assert (=> b!570929 (=> (not res!360606) (not e!328370))))

(assert (=> b!570929 (= res!360606 (and (= (size!17528 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17528 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17528 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570930 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35751 (_ BitVec 32)) SeekEntryResult!5569)

(assert (=> b!570930 (= e!328367 (= lt!260298 (seekKeyOrZeroReturnVacant!0 (x!53528 lt!260300) (index!24505 lt!260300) (index!24505 lt!260300) (select (arr!17164 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570931 () Bool)

(declare-fun res!360604 () Bool)

(assert (=> b!570931 (=> (not res!360604) (not e!328371))))

(declare-datatypes ((List!11151 0))(
  ( (Nil!11148) (Cons!11147 (h!12174 (_ BitVec 64)) (t!17371 List!11151)) )
))
(declare-fun arrayNoDuplicates!0 (array!35751 (_ BitVec 32) List!11151) Bool)

(assert (=> b!570931 (= res!360604 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11148))))

(assert (= (and start!52344 res!360598) b!570929))

(assert (= (and b!570929 res!360606) b!570928))

(assert (= (and b!570928 res!360607) b!570921))

(assert (= (and b!570921 res!360603) b!570926))

(assert (= (and b!570926 res!360597) b!570925))

(assert (= (and b!570925 res!360600) b!570924))

(assert (= (and b!570924 res!360599) b!570931))

(assert (= (and b!570931 res!360604) b!570923))

(assert (= (and b!570923 res!360602) b!570927))

(assert (= (and b!570927 res!360605) b!570922))

(assert (= (and b!570922 (not res!360601)) b!570930))

(declare-fun m!549947 () Bool)

(assert (=> b!570923 m!549947))

(declare-fun m!549949 () Bool)

(assert (=> b!570923 m!549949))

(declare-fun m!549951 () Bool)

(assert (=> b!570923 m!549951))

(assert (=> b!570923 m!549949))

(declare-fun m!549953 () Bool)

(assert (=> b!570923 m!549953))

(assert (=> b!570923 m!549949))

(declare-fun m!549955 () Bool)

(assert (=> b!570923 m!549955))

(assert (=> b!570923 m!549947))

(declare-fun m!549957 () Bool)

(assert (=> b!570923 m!549957))

(assert (=> b!570923 m!549947))

(declare-fun m!549959 () Bool)

(assert (=> b!570923 m!549959))

(declare-fun m!549961 () Bool)

(assert (=> b!570931 m!549961))

(declare-fun m!549963 () Bool)

(assert (=> b!570922 m!549963))

(assert (=> b!570922 m!549947))

(declare-fun m!549965 () Bool)

(assert (=> start!52344 m!549965))

(declare-fun m!549967 () Bool)

(assert (=> start!52344 m!549967))

(declare-fun m!549969 () Bool)

(assert (=> b!570924 m!549969))

(assert (=> b!570930 m!549947))

(assert (=> b!570930 m!549947))

(declare-fun m!549971 () Bool)

(assert (=> b!570930 m!549971))

(declare-fun m!549973 () Bool)

(assert (=> b!570925 m!549973))

(assert (=> b!570927 m!549947))

(assert (=> b!570927 m!549947))

(declare-fun m!549975 () Bool)

(assert (=> b!570927 m!549975))

(declare-fun m!549977 () Bool)

(assert (=> b!570927 m!549977))

(declare-fun m!549979 () Bool)

(assert (=> b!570927 m!549979))

(declare-fun m!549981 () Bool)

(assert (=> b!570926 m!549981))

(assert (=> b!570928 m!549947))

(assert (=> b!570928 m!549947))

(declare-fun m!549983 () Bool)

(assert (=> b!570928 m!549983))

(declare-fun m!549985 () Bool)

(assert (=> b!570921 m!549985))

(check-sat (not b!570927) (not b!570925) (not b!570923) (not b!570931) (not start!52344) (not b!570924) (not b!570930) (not b!570928) (not b!570921) (not b!570926))
(check-sat)
