; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50738 () Bool)

(assert start!50738)

(declare-fun res!347375 () Bool)

(declare-fun e!319922 () Bool)

(assert (=> start!50738 (=> (not res!347375) (not e!319922))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50738 (= res!347375 (validMask!0 mask!3119))))

(assert (=> start!50738 e!319922))

(assert (=> start!50738 true))

(declare-datatypes ((array!34963 0))(
  ( (array!34964 (arr!16791 (Array (_ BitVec 32) (_ BitVec 64))) (size!17155 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34963)

(declare-fun array_inv!12587 (array!34963) Bool)

(assert (=> start!50738 (array_inv!12587 a!3118)))

(declare-fun b!554955 () Bool)

(declare-fun res!347372 () Bool)

(assert (=> b!554955 (=> (not res!347372) (not e!319922))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554955 (= res!347372 (validKeyInArray!0 k!1914))))

(declare-fun b!554956 () Bool)

(declare-fun res!347371 () Bool)

(declare-fun e!319923 () Bool)

(assert (=> b!554956 (=> (not res!347371) (not e!319923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34963 (_ BitVec 32)) Bool)

(assert (=> b!554956 (= res!347371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554957 () Bool)

(declare-fun res!347368 () Bool)

(assert (=> b!554957 (=> (not res!347368) (not e!319922))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554957 (= res!347368 (and (= (size!17155 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17155 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17155 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554958 () Bool)

(declare-fun e!319921 () Bool)

(assert (=> b!554958 (= e!319921 (not true))))

(declare-datatypes ((SeekEntryResult!5240 0))(
  ( (MissingZero!5240 (index!23187 (_ BitVec 32))) (Found!5240 (index!23188 (_ BitVec 32))) (Intermediate!5240 (undefined!6052 Bool) (index!23189 (_ BitVec 32)) (x!52098 (_ BitVec 32))) (Undefined!5240) (MissingVacant!5240 (index!23190 (_ BitVec 32))) )
))
(declare-fun lt!252094 () SeekEntryResult!5240)

(declare-fun lt!252095 () SeekEntryResult!5240)

(assert (=> b!554958 (and (= lt!252095 (Found!5240 j!142)) (or (undefined!6052 lt!252094) (not (is-Intermediate!5240 lt!252094)) (= (select (arr!16791 a!3118) (index!23189 lt!252094)) (select (arr!16791 a!3118) j!142)) (not (= (select (arr!16791 a!3118) (index!23189 lt!252094)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252095 (MissingZero!5240 (index!23189 lt!252094)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34963 (_ BitVec 32)) SeekEntryResult!5240)

(assert (=> b!554958 (= lt!252095 (seekEntryOrOpen!0 (select (arr!16791 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554958 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17254 0))(
  ( (Unit!17255) )
))
(declare-fun lt!252097 () Unit!17254)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17254)

(assert (=> b!554958 (= lt!252097 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554959 () Bool)

(assert (=> b!554959 (= e!319923 e!319921)))

(declare-fun res!347367 () Bool)

(assert (=> b!554959 (=> (not res!347367) (not e!319921))))

(declare-fun lt!252096 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34963 (_ BitVec 32)) SeekEntryResult!5240)

(assert (=> b!554959 (= res!347367 (= lt!252094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252096 (select (store (arr!16791 a!3118) i!1132 k!1914) j!142) (array!34964 (store (arr!16791 a!3118) i!1132 k!1914) (size!17155 a!3118)) mask!3119)))))

(declare-fun lt!252093 () (_ BitVec 32))

(assert (=> b!554959 (= lt!252094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252093 (select (arr!16791 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554959 (= lt!252096 (toIndex!0 (select (store (arr!16791 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554959 (= lt!252093 (toIndex!0 (select (arr!16791 a!3118) j!142) mask!3119))))

(declare-fun b!554960 () Bool)

(declare-fun res!347369 () Bool)

(assert (=> b!554960 (=> (not res!347369) (not e!319922))))

(declare-fun arrayContainsKey!0 (array!34963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554960 (= res!347369 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554961 () Bool)

(assert (=> b!554961 (= e!319922 e!319923)))

(declare-fun res!347374 () Bool)

(assert (=> b!554961 (=> (not res!347374) (not e!319923))))

(declare-fun lt!252092 () SeekEntryResult!5240)

(assert (=> b!554961 (= res!347374 (or (= lt!252092 (MissingZero!5240 i!1132)) (= lt!252092 (MissingVacant!5240 i!1132))))))

(assert (=> b!554961 (= lt!252092 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554962 () Bool)

(declare-fun res!347373 () Bool)

(assert (=> b!554962 (=> (not res!347373) (not e!319922))))

(assert (=> b!554962 (= res!347373 (validKeyInArray!0 (select (arr!16791 a!3118) j!142)))))

(declare-fun b!554963 () Bool)

(declare-fun res!347370 () Bool)

(assert (=> b!554963 (=> (not res!347370) (not e!319923))))

(declare-datatypes ((List!10871 0))(
  ( (Nil!10868) (Cons!10867 (h!11852 (_ BitVec 64)) (t!17099 List!10871)) )
))
(declare-fun arrayNoDuplicates!0 (array!34963 (_ BitVec 32) List!10871) Bool)

(assert (=> b!554963 (= res!347370 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10868))))

(assert (= (and start!50738 res!347375) b!554957))

(assert (= (and b!554957 res!347368) b!554962))

(assert (= (and b!554962 res!347373) b!554955))

(assert (= (and b!554955 res!347372) b!554960))

(assert (= (and b!554960 res!347369) b!554961))

(assert (= (and b!554961 res!347374) b!554956))

(assert (= (and b!554956 res!347371) b!554963))

(assert (= (and b!554963 res!347370) b!554959))

(assert (= (and b!554959 res!347367) b!554958))

(declare-fun m!532443 () Bool)

(assert (=> b!554963 m!532443))

(declare-fun m!532445 () Bool)

(assert (=> b!554959 m!532445))

(declare-fun m!532447 () Bool)

(assert (=> b!554959 m!532447))

(assert (=> b!554959 m!532445))

(declare-fun m!532449 () Bool)

(assert (=> b!554959 m!532449))

(assert (=> b!554959 m!532449))

(declare-fun m!532451 () Bool)

(assert (=> b!554959 m!532451))

(assert (=> b!554959 m!532445))

(declare-fun m!532453 () Bool)

(assert (=> b!554959 m!532453))

(declare-fun m!532455 () Bool)

(assert (=> b!554959 m!532455))

(assert (=> b!554959 m!532449))

(declare-fun m!532457 () Bool)

(assert (=> b!554959 m!532457))

(declare-fun m!532459 () Bool)

(assert (=> b!554960 m!532459))

(declare-fun m!532461 () Bool)

(assert (=> b!554956 m!532461))

(declare-fun m!532463 () Bool)

(assert (=> b!554955 m!532463))

(declare-fun m!532465 () Bool)

(assert (=> b!554961 m!532465))

(assert (=> b!554958 m!532445))

(declare-fun m!532467 () Bool)

(assert (=> b!554958 m!532467))

(declare-fun m!532469 () Bool)

(assert (=> b!554958 m!532469))

(declare-fun m!532471 () Bool)

(assert (=> b!554958 m!532471))

(assert (=> b!554958 m!532445))

(declare-fun m!532473 () Bool)

(assert (=> b!554958 m!532473))

(assert (=> b!554962 m!532445))

(assert (=> b!554962 m!532445))

(declare-fun m!532475 () Bool)

(assert (=> b!554962 m!532475))

(declare-fun m!532477 () Bool)

(assert (=> start!50738 m!532477))

(declare-fun m!532479 () Bool)

(assert (=> start!50738 m!532479))

(push 1)

