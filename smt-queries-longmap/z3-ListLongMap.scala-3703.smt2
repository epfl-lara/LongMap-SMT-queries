; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50822 () Bool)

(assert start!50822)

(declare-fun b!556018 () Bool)

(declare-fun e!320331 () Bool)

(assert (=> b!556018 (= e!320331 (not true))))

(declare-fun e!320334 () Bool)

(assert (=> b!556018 e!320334))

(declare-fun res!348575 () Bool)

(assert (=> b!556018 (=> (not res!348575) (not e!320334))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35056 0))(
  ( (array!35057 (arr!16838 (Array (_ BitVec 32) (_ BitVec 64))) (size!17203 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35056)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35056 (_ BitVec 32)) Bool)

(assert (=> b!556018 (= res!348575 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17328 0))(
  ( (Unit!17329) )
))
(declare-fun lt!252597 () Unit!17328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17328)

(assert (=> b!556018 (= lt!252597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556019 () Bool)

(declare-fun res!348572 () Bool)

(declare-fun e!320332 () Bool)

(assert (=> b!556019 (=> (not res!348572) (not e!320332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556019 (= res!348572 (validKeyInArray!0 (select (arr!16838 a!3118) j!142)))))

(declare-fun b!556020 () Bool)

(declare-fun res!348577 () Bool)

(assert (=> b!556020 (=> (not res!348577) (not e!320332))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556020 (= res!348577 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556021 () Bool)

(declare-fun res!348574 () Bool)

(assert (=> b!556021 (=> (not res!348574) (not e!320332))))

(assert (=> b!556021 (= res!348574 (validKeyInArray!0 k0!1914))))

(declare-fun b!556023 () Bool)

(declare-fun res!348579 () Bool)

(assert (=> b!556023 (=> (not res!348579) (not e!320332))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556023 (= res!348579 (and (= (size!17203 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17203 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17203 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556024 () Bool)

(declare-fun res!348580 () Bool)

(assert (=> b!556024 (=> (not res!348580) (not e!320331))))

(assert (=> b!556024 (= res!348580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556025 () Bool)

(assert (=> b!556025 (= e!320332 e!320331)))

(declare-fun res!348581 () Bool)

(assert (=> b!556025 (=> (not res!348581) (not e!320331))))

(declare-datatypes ((SeekEntryResult!5284 0))(
  ( (MissingZero!5284 (index!23363 (_ BitVec 32))) (Found!5284 (index!23364 (_ BitVec 32))) (Intermediate!5284 (undefined!6096 Bool) (index!23365 (_ BitVec 32)) (x!52265 (_ BitVec 32))) (Undefined!5284) (MissingVacant!5284 (index!23366 (_ BitVec 32))) )
))
(declare-fun lt!252598 () SeekEntryResult!5284)

(assert (=> b!556025 (= res!348581 (or (= lt!252598 (MissingZero!5284 i!1132)) (= lt!252598 (MissingVacant!5284 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35056 (_ BitVec 32)) SeekEntryResult!5284)

(assert (=> b!556025 (= lt!252598 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556022 () Bool)

(declare-fun res!348578 () Bool)

(assert (=> b!556022 (=> (not res!348578) (not e!320331))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35056 (_ BitVec 32)) SeekEntryResult!5284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556022 (= res!348578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16838 a!3118) j!142) mask!3119) (select (arr!16838 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16838 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16838 a!3118) i!1132 k0!1914) j!142) (array!35057 (store (arr!16838 a!3118) i!1132 k0!1914) (size!17203 a!3118)) mask!3119)))))

(declare-fun res!348576 () Bool)

(assert (=> start!50822 (=> (not res!348576) (not e!320332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50822 (= res!348576 (validMask!0 mask!3119))))

(assert (=> start!50822 e!320332))

(assert (=> start!50822 true))

(declare-fun array_inv!12721 (array!35056) Bool)

(assert (=> start!50822 (array_inv!12721 a!3118)))

(declare-fun b!556026 () Bool)

(declare-fun res!348573 () Bool)

(assert (=> b!556026 (=> (not res!348573) (not e!320331))))

(declare-datatypes ((List!10957 0))(
  ( (Nil!10954) (Cons!10953 (h!11938 (_ BitVec 64)) (t!17176 List!10957)) )
))
(declare-fun arrayNoDuplicates!0 (array!35056 (_ BitVec 32) List!10957) Bool)

(assert (=> b!556026 (= res!348573 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10954))))

(declare-fun b!556027 () Bool)

(assert (=> b!556027 (= e!320334 (= (seekEntryOrOpen!0 (select (arr!16838 a!3118) j!142) a!3118 mask!3119) (Found!5284 j!142)))))

(assert (= (and start!50822 res!348576) b!556023))

(assert (= (and b!556023 res!348579) b!556019))

(assert (= (and b!556019 res!348572) b!556021))

(assert (= (and b!556021 res!348574) b!556020))

(assert (= (and b!556020 res!348577) b!556025))

(assert (= (and b!556025 res!348581) b!556024))

(assert (= (and b!556024 res!348580) b!556026))

(assert (= (and b!556026 res!348573) b!556022))

(assert (= (and b!556022 res!348578) b!556018))

(assert (= (and b!556018 res!348575) b!556027))

(declare-fun m!533477 () Bool)

(assert (=> b!556024 m!533477))

(declare-fun m!533479 () Bool)

(assert (=> b!556027 m!533479))

(assert (=> b!556027 m!533479))

(declare-fun m!533481 () Bool)

(assert (=> b!556027 m!533481))

(declare-fun m!533483 () Bool)

(assert (=> start!50822 m!533483))

(declare-fun m!533485 () Bool)

(assert (=> start!50822 m!533485))

(declare-fun m!533487 () Bool)

(assert (=> b!556018 m!533487))

(declare-fun m!533489 () Bool)

(assert (=> b!556018 m!533489))

(assert (=> b!556019 m!533479))

(assert (=> b!556019 m!533479))

(declare-fun m!533491 () Bool)

(assert (=> b!556019 m!533491))

(assert (=> b!556022 m!533479))

(declare-fun m!533493 () Bool)

(assert (=> b!556022 m!533493))

(assert (=> b!556022 m!533479))

(declare-fun m!533495 () Bool)

(assert (=> b!556022 m!533495))

(declare-fun m!533497 () Bool)

(assert (=> b!556022 m!533497))

(assert (=> b!556022 m!533495))

(declare-fun m!533499 () Bool)

(assert (=> b!556022 m!533499))

(assert (=> b!556022 m!533493))

(assert (=> b!556022 m!533479))

(declare-fun m!533501 () Bool)

(assert (=> b!556022 m!533501))

(declare-fun m!533503 () Bool)

(assert (=> b!556022 m!533503))

(assert (=> b!556022 m!533495))

(assert (=> b!556022 m!533497))

(declare-fun m!533505 () Bool)

(assert (=> b!556026 m!533505))

(declare-fun m!533507 () Bool)

(assert (=> b!556025 m!533507))

(declare-fun m!533509 () Bool)

(assert (=> b!556021 m!533509))

(declare-fun m!533511 () Bool)

(assert (=> b!556020 m!533511))

(check-sat (not b!556021) (not b!556024) (not start!50822) (not b!556026) (not b!556020) (not b!556019) (not b!556025) (not b!556022) (not b!556027) (not b!556018))
(check-sat)
