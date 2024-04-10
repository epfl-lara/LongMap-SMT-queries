; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52132 () Bool)

(assert start!52132)

(declare-fun b!568941 () Bool)

(declare-fun res!358961 () Bool)

(declare-fun e!327359 () Bool)

(assert (=> b!568941 (=> (not res!358961) (not e!327359))))

(declare-datatypes ((array!35655 0))(
  ( (array!35656 (arr!17119 (Array (_ BitVec 32) (_ BitVec 64))) (size!17483 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35655)

(declare-datatypes ((List!11199 0))(
  ( (Nil!11196) (Cons!11195 (h!12216 (_ BitVec 64)) (t!17427 List!11199)) )
))
(declare-fun arrayNoDuplicates!0 (array!35655 (_ BitVec 32) List!11199) Bool)

(assert (=> b!568941 (= res!358961 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11196))))

(declare-fun b!568942 () Bool)

(declare-fun res!358964 () Bool)

(declare-fun e!327358 () Bool)

(assert (=> b!568942 (=> (not res!358964) (not e!327358))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568942 (= res!358964 (validKeyInArray!0 k0!1914))))

(declare-fun b!568943 () Bool)

(declare-fun res!358965 () Bool)

(assert (=> b!568943 (=> (not res!358965) (not e!327359))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35655 (_ BitVec 32)) Bool)

(assert (=> b!568943 (= res!358965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568944 () Bool)

(declare-fun e!327360 () Bool)

(assert (=> b!568944 (= e!327360 (not true))))

(declare-datatypes ((SeekEntryResult!5568 0))(
  ( (MissingZero!5568 (index!24499 (_ BitVec 32))) (Found!5568 (index!24500 (_ BitVec 32))) (Intermediate!5568 (undefined!6380 Bool) (index!24501 (_ BitVec 32)) (x!53379 (_ BitVec 32))) (Undefined!5568) (MissingVacant!5568 (index!24502 (_ BitVec 32))) )
))
(declare-fun lt!259212 () SeekEntryResult!5568)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259211 () SeekEntryResult!5568)

(get-info :version)

(assert (=> b!568944 (and (= lt!259211 (Found!5568 j!142)) (or (undefined!6380 lt!259212) (not ((_ is Intermediate!5568) lt!259212)) (= (select (arr!17119 a!3118) (index!24501 lt!259212)) (select (arr!17119 a!3118) j!142)) (not (= (select (arr!17119 a!3118) (index!24501 lt!259212)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259211 (MissingZero!5568 (index!24501 lt!259212)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35655 (_ BitVec 32)) SeekEntryResult!5568)

(assert (=> b!568944 (= lt!259211 (seekEntryOrOpen!0 (select (arr!17119 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568944 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17838 0))(
  ( (Unit!17839) )
))
(declare-fun lt!259213 () Unit!17838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17838)

(assert (=> b!568944 (= lt!259213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568945 () Bool)

(assert (=> b!568945 (= e!327359 e!327360)))

(declare-fun res!358967 () Bool)

(assert (=> b!568945 (=> (not res!358967) (not e!327360))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!259215 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35655 (_ BitVec 32)) SeekEntryResult!5568)

(assert (=> b!568945 (= res!358967 (= lt!259212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259215 (select (store (arr!17119 a!3118) i!1132 k0!1914) j!142) (array!35656 (store (arr!17119 a!3118) i!1132 k0!1914) (size!17483 a!3118)) mask!3119)))))

(declare-fun lt!259214 () (_ BitVec 32))

(assert (=> b!568945 (= lt!259212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259214 (select (arr!17119 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568945 (= lt!259215 (toIndex!0 (select (store (arr!17119 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568945 (= lt!259214 (toIndex!0 (select (arr!17119 a!3118) j!142) mask!3119))))

(declare-fun b!568946 () Bool)

(declare-fun res!358966 () Bool)

(assert (=> b!568946 (=> (not res!358966) (not e!327358))))

(declare-fun arrayContainsKey!0 (array!35655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568946 (= res!358966 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568947 () Bool)

(declare-fun res!358959 () Bool)

(assert (=> b!568947 (=> (not res!358959) (not e!327358))))

(assert (=> b!568947 (= res!358959 (and (= (size!17483 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17483 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17483 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!358960 () Bool)

(assert (=> start!52132 (=> (not res!358960) (not e!327358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52132 (= res!358960 (validMask!0 mask!3119))))

(assert (=> start!52132 e!327358))

(assert (=> start!52132 true))

(declare-fun array_inv!12915 (array!35655) Bool)

(assert (=> start!52132 (array_inv!12915 a!3118)))

(declare-fun b!568948 () Bool)

(declare-fun res!358963 () Bool)

(assert (=> b!568948 (=> (not res!358963) (not e!327358))))

(assert (=> b!568948 (= res!358963 (validKeyInArray!0 (select (arr!17119 a!3118) j!142)))))

(declare-fun b!568949 () Bool)

(assert (=> b!568949 (= e!327358 e!327359)))

(declare-fun res!358962 () Bool)

(assert (=> b!568949 (=> (not res!358962) (not e!327359))))

(declare-fun lt!259216 () SeekEntryResult!5568)

(assert (=> b!568949 (= res!358962 (or (= lt!259216 (MissingZero!5568 i!1132)) (= lt!259216 (MissingVacant!5568 i!1132))))))

(assert (=> b!568949 (= lt!259216 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52132 res!358960) b!568947))

(assert (= (and b!568947 res!358959) b!568948))

(assert (= (and b!568948 res!358963) b!568942))

(assert (= (and b!568942 res!358964) b!568946))

(assert (= (and b!568946 res!358966) b!568949))

(assert (= (and b!568949 res!358962) b!568943))

(assert (= (and b!568943 res!358965) b!568941))

(assert (= (and b!568941 res!358961) b!568945))

(assert (= (and b!568945 res!358967) b!568944))

(declare-fun m!547469 () Bool)

(assert (=> b!568948 m!547469))

(assert (=> b!568948 m!547469))

(declare-fun m!547471 () Bool)

(assert (=> b!568948 m!547471))

(declare-fun m!547473 () Bool)

(assert (=> b!568943 m!547473))

(assert (=> b!568945 m!547469))

(declare-fun m!547475 () Bool)

(assert (=> b!568945 m!547475))

(assert (=> b!568945 m!547469))

(declare-fun m!547477 () Bool)

(assert (=> b!568945 m!547477))

(assert (=> b!568945 m!547477))

(declare-fun m!547479 () Bool)

(assert (=> b!568945 m!547479))

(declare-fun m!547481 () Bool)

(assert (=> b!568945 m!547481))

(assert (=> b!568945 m!547469))

(declare-fun m!547483 () Bool)

(assert (=> b!568945 m!547483))

(assert (=> b!568945 m!547477))

(declare-fun m!547485 () Bool)

(assert (=> b!568945 m!547485))

(declare-fun m!547487 () Bool)

(assert (=> b!568944 m!547487))

(assert (=> b!568944 m!547469))

(declare-fun m!547489 () Bool)

(assert (=> b!568944 m!547489))

(declare-fun m!547491 () Bool)

(assert (=> b!568944 m!547491))

(assert (=> b!568944 m!547469))

(declare-fun m!547493 () Bool)

(assert (=> b!568944 m!547493))

(declare-fun m!547495 () Bool)

(assert (=> b!568941 m!547495))

(declare-fun m!547497 () Bool)

(assert (=> b!568949 m!547497))

(declare-fun m!547499 () Bool)

(assert (=> b!568946 m!547499))

(declare-fun m!547501 () Bool)

(assert (=> start!52132 m!547501))

(declare-fun m!547503 () Bool)

(assert (=> start!52132 m!547503))

(declare-fun m!547505 () Bool)

(assert (=> b!568942 m!547505))

(check-sat (not b!568944) (not b!568948) (not b!568945) (not b!568949) (not start!52132) (not b!568941) (not b!568942) (not b!568946) (not b!568943))
(check-sat)
