; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50984 () Bool)

(assert start!50984)

(declare-fun res!349371 () Bool)

(declare-fun e!321085 () Bool)

(assert (=> start!50984 (=> (not res!349371) (not e!321085))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50984 (= res!349371 (validMask!0 mask!3119))))

(assert (=> start!50984 e!321085))

(assert (=> start!50984 true))

(declare-datatypes ((array!35095 0))(
  ( (array!35096 (arr!16854 (Array (_ BitVec 32) (_ BitVec 64))) (size!17218 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35095)

(declare-fun array_inv!12650 (array!35095) Bool)

(assert (=> start!50984 (array_inv!12650 a!3118)))

(declare-fun b!557321 () Bool)

(declare-fun e!321087 () Bool)

(assert (=> b!557321 (= e!321085 e!321087)))

(declare-fun res!349376 () Bool)

(assert (=> b!557321 (=> (not res!349376) (not e!321087))))

(declare-datatypes ((SeekEntryResult!5303 0))(
  ( (MissingZero!5303 (index!23439 (_ BitVec 32))) (Found!5303 (index!23440 (_ BitVec 32))) (Intermediate!5303 (undefined!6115 Bool) (index!23441 (_ BitVec 32)) (x!52341 (_ BitVec 32))) (Undefined!5303) (MissingVacant!5303 (index!23442 (_ BitVec 32))) )
))
(declare-fun lt!253261 () SeekEntryResult!5303)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557321 (= res!349376 (or (= lt!253261 (MissingZero!5303 i!1132)) (= lt!253261 (MissingVacant!5303 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35095 (_ BitVec 32)) SeekEntryResult!5303)

(assert (=> b!557321 (= lt!253261 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!321084 () Bool)

(declare-fun b!557322 () Bool)

(assert (=> b!557322 (= e!321084 (= (seekEntryOrOpen!0 (select (arr!16854 a!3118) j!142) a!3118 mask!3119) (Found!5303 j!142)))))

(declare-fun b!557323 () Bool)

(declare-fun res!349372 () Bool)

(assert (=> b!557323 (=> (not res!349372) (not e!321087))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35095 (_ BitVec 32)) SeekEntryResult!5303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557323 (= res!349372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16854 a!3118) j!142) mask!3119) (select (arr!16854 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16854 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16854 a!3118) i!1132 k!1914) j!142) (array!35096 (store (arr!16854 a!3118) i!1132 k!1914) (size!17218 a!3118)) mask!3119)))))

(declare-fun b!557324 () Bool)

(assert (=> b!557324 (= e!321087 (not true))))

(assert (=> b!557324 e!321084))

(declare-fun res!349367 () Bool)

(assert (=> b!557324 (=> (not res!349367) (not e!321084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35095 (_ BitVec 32)) Bool)

(assert (=> b!557324 (= res!349367 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17380 0))(
  ( (Unit!17381) )
))
(declare-fun lt!253260 () Unit!17380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17380)

(assert (=> b!557324 (= lt!253260 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557325 () Bool)

(declare-fun res!349369 () Bool)

(assert (=> b!557325 (=> (not res!349369) (not e!321085))))

(assert (=> b!557325 (= res!349369 (and (= (size!17218 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17218 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17218 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557326 () Bool)

(declare-fun res!349368 () Bool)

(assert (=> b!557326 (=> (not res!349368) (not e!321087))))

(assert (=> b!557326 (= res!349368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557327 () Bool)

(declare-fun res!349374 () Bool)

(assert (=> b!557327 (=> (not res!349374) (not e!321085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557327 (= res!349374 (validKeyInArray!0 k!1914))))

(declare-fun b!557328 () Bool)

(declare-fun res!349370 () Bool)

(assert (=> b!557328 (=> (not res!349370) (not e!321087))))

(declare-datatypes ((List!10934 0))(
  ( (Nil!10931) (Cons!10930 (h!11921 (_ BitVec 64)) (t!17162 List!10934)) )
))
(declare-fun arrayNoDuplicates!0 (array!35095 (_ BitVec 32) List!10934) Bool)

(assert (=> b!557328 (= res!349370 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10931))))

(declare-fun b!557329 () Bool)

(declare-fun res!349375 () Bool)

(assert (=> b!557329 (=> (not res!349375) (not e!321085))))

(assert (=> b!557329 (= res!349375 (validKeyInArray!0 (select (arr!16854 a!3118) j!142)))))

(declare-fun b!557330 () Bool)

(declare-fun res!349373 () Bool)

(assert (=> b!557330 (=> (not res!349373) (not e!321085))))

(declare-fun arrayContainsKey!0 (array!35095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557330 (= res!349373 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50984 res!349371) b!557325))

(assert (= (and b!557325 res!349369) b!557329))

(assert (= (and b!557329 res!349375) b!557327))

(assert (= (and b!557327 res!349374) b!557330))

(assert (= (and b!557330 res!349373) b!557321))

(assert (= (and b!557321 res!349376) b!557326))

(assert (= (and b!557326 res!349368) b!557328))

(assert (= (and b!557328 res!349370) b!557323))

(assert (= (and b!557323 res!349372) b!557324))

(assert (= (and b!557324 res!349367) b!557322))

(declare-fun m!535215 () Bool)

(assert (=> b!557323 m!535215))

(declare-fun m!535217 () Bool)

(assert (=> b!557323 m!535217))

(assert (=> b!557323 m!535215))

(declare-fun m!535219 () Bool)

(assert (=> b!557323 m!535219))

(declare-fun m!535221 () Bool)

(assert (=> b!557323 m!535221))

(assert (=> b!557323 m!535219))

(declare-fun m!535223 () Bool)

(assert (=> b!557323 m!535223))

(assert (=> b!557323 m!535217))

(assert (=> b!557323 m!535215))

(declare-fun m!535225 () Bool)

(assert (=> b!557323 m!535225))

(declare-fun m!535227 () Bool)

(assert (=> b!557323 m!535227))

(assert (=> b!557323 m!535219))

(assert (=> b!557323 m!535221))

(declare-fun m!535229 () Bool)

(assert (=> b!557324 m!535229))

(declare-fun m!535231 () Bool)

(assert (=> b!557324 m!535231))

(declare-fun m!535233 () Bool)

(assert (=> b!557321 m!535233))

(declare-fun m!535235 () Bool)

(assert (=> b!557326 m!535235))

(declare-fun m!535237 () Bool)

(assert (=> start!50984 m!535237))

(declare-fun m!535239 () Bool)

(assert (=> start!50984 m!535239))

(declare-fun m!535241 () Bool)

(assert (=> b!557330 m!535241))

(declare-fun m!535243 () Bool)

(assert (=> b!557327 m!535243))

(declare-fun m!535245 () Bool)

(assert (=> b!557328 m!535245))

(assert (=> b!557329 m!535215))

(assert (=> b!557329 m!535215))

(declare-fun m!535247 () Bool)

(assert (=> b!557329 m!535247))

(assert (=> b!557322 m!535215))

(assert (=> b!557322 m!535215))

(declare-fun m!535249 () Bool)

(assert (=> b!557322 m!535249))

(push 1)

