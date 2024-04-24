; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50292 () Bool)

(assert start!50292)

(declare-fun b!550238 () Bool)

(declare-fun res!343278 () Bool)

(declare-fun e!317683 () Bool)

(assert (=> b!550238 (=> (not res!343278) (not e!317683))))

(declare-datatypes ((array!34692 0))(
  ( (array!34693 (arr!16660 (Array (_ BitVec 32) (_ BitVec 64))) (size!17024 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34692)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550238 (= res!343278 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550239 () Bool)

(declare-fun e!317685 () Bool)

(assert (=> b!550239 (= e!317685 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34692 (_ BitVec 32)) Bool)

(assert (=> b!550239 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16975 0))(
  ( (Unit!16976) )
))
(declare-fun lt!250510 () Unit!16975)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16975)

(assert (=> b!550239 (= lt!250510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550240 () Bool)

(declare-fun res!343277 () Bool)

(assert (=> b!550240 (=> (not res!343277) (not e!317685))))

(assert (=> b!550240 (= res!343277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550242 () Bool)

(declare-fun res!343284 () Bool)

(assert (=> b!550242 (=> (not res!343284) (not e!317685))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5065 0))(
  ( (MissingZero!5065 (index!22487 (_ BitVec 32))) (Found!5065 (index!22488 (_ BitVec 32))) (Intermediate!5065 (undefined!5877 Bool) (index!22489 (_ BitVec 32)) (x!51566 (_ BitVec 32))) (Undefined!5065) (MissingVacant!5065 (index!22490 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34692 (_ BitVec 32)) SeekEntryResult!5065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550242 (= res!343284 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16660 a!3118) j!142) mask!3119) (select (arr!16660 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16660 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16660 a!3118) i!1132 k0!1914) j!142) (array!34693 (store (arr!16660 a!3118) i!1132 k0!1914) (size!17024 a!3118)) mask!3119)))))

(declare-fun b!550243 () Bool)

(declare-fun res!343280 () Bool)

(assert (=> b!550243 (=> (not res!343280) (not e!317683))))

(assert (=> b!550243 (= res!343280 (and (= (size!17024 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17024 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17024 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550244 () Bool)

(declare-fun res!343281 () Bool)

(assert (=> b!550244 (=> (not res!343281) (not e!317683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550244 (= res!343281 (validKeyInArray!0 (select (arr!16660 a!3118) j!142)))))

(declare-fun b!550245 () Bool)

(declare-fun res!343282 () Bool)

(assert (=> b!550245 (=> (not res!343282) (not e!317683))))

(assert (=> b!550245 (= res!343282 (validKeyInArray!0 k0!1914))))

(declare-fun b!550246 () Bool)

(assert (=> b!550246 (= e!317683 e!317685)))

(declare-fun res!343279 () Bool)

(assert (=> b!550246 (=> (not res!343279) (not e!317685))))

(declare-fun lt!250509 () SeekEntryResult!5065)

(assert (=> b!550246 (= res!343279 (or (= lt!250509 (MissingZero!5065 i!1132)) (= lt!250509 (MissingVacant!5065 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34692 (_ BitVec 32)) SeekEntryResult!5065)

(assert (=> b!550246 (= lt!250509 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550241 () Bool)

(declare-fun res!343285 () Bool)

(assert (=> b!550241 (=> (not res!343285) (not e!317685))))

(declare-datatypes ((List!10647 0))(
  ( (Nil!10644) (Cons!10643 (h!11619 (_ BitVec 64)) (t!16867 List!10647)) )
))
(declare-fun arrayNoDuplicates!0 (array!34692 (_ BitVec 32) List!10647) Bool)

(assert (=> b!550241 (= res!343285 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10644))))

(declare-fun res!343283 () Bool)

(assert (=> start!50292 (=> (not res!343283) (not e!317683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50292 (= res!343283 (validMask!0 mask!3119))))

(assert (=> start!50292 e!317683))

(assert (=> start!50292 true))

(declare-fun array_inv!12519 (array!34692) Bool)

(assert (=> start!50292 (array_inv!12519 a!3118)))

(assert (= (and start!50292 res!343283) b!550243))

(assert (= (and b!550243 res!343280) b!550244))

(assert (= (and b!550244 res!343281) b!550245))

(assert (= (and b!550245 res!343282) b!550238))

(assert (= (and b!550238 res!343278) b!550246))

(assert (= (and b!550246 res!343279) b!550240))

(assert (= (and b!550240 res!343277) b!550241))

(assert (= (and b!550241 res!343285) b!550242))

(assert (= (and b!550242 res!343284) b!550239))

(declare-fun m!527375 () Bool)

(assert (=> b!550244 m!527375))

(assert (=> b!550244 m!527375))

(declare-fun m!527377 () Bool)

(assert (=> b!550244 m!527377))

(declare-fun m!527379 () Bool)

(assert (=> b!550241 m!527379))

(declare-fun m!527381 () Bool)

(assert (=> b!550246 m!527381))

(declare-fun m!527383 () Bool)

(assert (=> b!550245 m!527383))

(assert (=> b!550242 m!527375))

(declare-fun m!527385 () Bool)

(assert (=> b!550242 m!527385))

(assert (=> b!550242 m!527375))

(declare-fun m!527387 () Bool)

(assert (=> b!550242 m!527387))

(declare-fun m!527389 () Bool)

(assert (=> b!550242 m!527389))

(assert (=> b!550242 m!527387))

(declare-fun m!527391 () Bool)

(assert (=> b!550242 m!527391))

(assert (=> b!550242 m!527385))

(assert (=> b!550242 m!527375))

(declare-fun m!527393 () Bool)

(assert (=> b!550242 m!527393))

(declare-fun m!527395 () Bool)

(assert (=> b!550242 m!527395))

(assert (=> b!550242 m!527387))

(assert (=> b!550242 m!527389))

(declare-fun m!527397 () Bool)

(assert (=> b!550239 m!527397))

(declare-fun m!527399 () Bool)

(assert (=> b!550239 m!527399))

(declare-fun m!527401 () Bool)

(assert (=> b!550240 m!527401))

(declare-fun m!527403 () Bool)

(assert (=> b!550238 m!527403))

(declare-fun m!527405 () Bool)

(assert (=> start!50292 m!527405))

(declare-fun m!527407 () Bool)

(assert (=> start!50292 m!527407))

(check-sat (not b!550245) (not b!550239) (not b!550242) (not b!550241) (not b!550246) (not b!550240) (not b!550244) (not b!550238) (not start!50292))
(check-sat)
