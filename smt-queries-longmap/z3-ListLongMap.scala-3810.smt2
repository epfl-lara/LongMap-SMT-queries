; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52282 () Bool)

(assert start!52282)

(declare-fun b!570457 () Bool)

(declare-fun res!360241 () Bool)

(declare-fun e!328097 () Bool)

(assert (=> b!570457 (=> (not res!360241) (not e!328097))))

(declare-datatypes ((array!35742 0))(
  ( (array!35743 (arr!17161 (Array (_ BitVec 32) (_ BitVec 64))) (size!17525 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35742)

(declare-datatypes ((List!11241 0))(
  ( (Nil!11238) (Cons!11237 (h!12261 (_ BitVec 64)) (t!17469 List!11241)) )
))
(declare-fun arrayNoDuplicates!0 (array!35742 (_ BitVec 32) List!11241) Bool)

(assert (=> b!570457 (= res!360241 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11238))))

(declare-fun b!570458 () Bool)

(declare-fun res!360243 () Bool)

(declare-fun e!328095 () Bool)

(assert (=> b!570458 (=> (not res!360243) (not e!328095))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570458 (= res!360243 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570459 () Bool)

(declare-fun res!360244 () Bool)

(assert (=> b!570459 (=> (not res!360244) (not e!328095))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570459 (= res!360244 (validKeyInArray!0 (select (arr!17161 a!3118) j!142)))))

(declare-datatypes ((SeekEntryResult!5610 0))(
  ( (MissingZero!5610 (index!24667 (_ BitVec 32))) (Found!5610 (index!24668 (_ BitVec 32))) (Intermediate!5610 (undefined!6422 Bool) (index!24669 (_ BitVec 32)) (x!53542 (_ BitVec 32))) (Undefined!5610) (MissingVacant!5610 (index!24670 (_ BitVec 32))) )
))
(declare-fun lt!260044 () SeekEntryResult!5610)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260047 () SeekEntryResult!5610)

(declare-fun e!328096 () Bool)

(declare-fun b!570460 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35742 (_ BitVec 32)) SeekEntryResult!5610)

(assert (=> b!570460 (= e!328096 (= lt!260044 (seekKeyOrZeroReturnVacant!0 (x!53542 lt!260047) (index!24669 lt!260047) (index!24669 lt!260047) (select (arr!17161 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570461 () Bool)

(declare-fun res!360238 () Bool)

(assert (=> b!570461 (=> (not res!360238) (not e!328097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35742 (_ BitVec 32)) Bool)

(assert (=> b!570461 (= res!360238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570462 () Bool)

(declare-fun e!328098 () Bool)

(assert (=> b!570462 (= e!328097 e!328098)))

(declare-fun res!360246 () Bool)

(assert (=> b!570462 (=> (not res!360246) (not e!328098))))

(declare-fun lt!260046 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35742 (_ BitVec 32)) SeekEntryResult!5610)

(assert (=> b!570462 (= res!360246 (= lt!260047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260046 (select (store (arr!17161 a!3118) i!1132 k0!1914) j!142) (array!35743 (store (arr!17161 a!3118) i!1132 k0!1914) (size!17525 a!3118)) mask!3119)))))

(declare-fun lt!260043 () (_ BitVec 32))

(assert (=> b!570462 (= lt!260047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260043 (select (arr!17161 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570462 (= lt!260046 (toIndex!0 (select (store (arr!17161 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570462 (= lt!260043 (toIndex!0 (select (arr!17161 a!3118) j!142) mask!3119))))

(declare-fun b!570463 () Bool)

(assert (=> b!570463 (= e!328098 (not true))))

(declare-fun e!328094 () Bool)

(assert (=> b!570463 e!328094))

(declare-fun res!360239 () Bool)

(assert (=> b!570463 (=> (not res!360239) (not e!328094))))

(assert (=> b!570463 (= res!360239 (= lt!260044 (Found!5610 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35742 (_ BitVec 32)) SeekEntryResult!5610)

(assert (=> b!570463 (= lt!260044 (seekEntryOrOpen!0 (select (arr!17161 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570463 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17922 0))(
  ( (Unit!17923) )
))
(declare-fun lt!260045 () Unit!17922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17922)

(assert (=> b!570463 (= lt!260045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!360245 () Bool)

(assert (=> start!52282 (=> (not res!360245) (not e!328095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52282 (= res!360245 (validMask!0 mask!3119))))

(assert (=> start!52282 e!328095))

(assert (=> start!52282 true))

(declare-fun array_inv!12957 (array!35742) Bool)

(assert (=> start!52282 (array_inv!12957 a!3118)))

(declare-fun b!570464 () Bool)

(declare-fun res!360247 () Bool)

(assert (=> b!570464 (=> (not res!360247) (not e!328095))))

(assert (=> b!570464 (= res!360247 (and (= (size!17525 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17525 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17525 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570465 () Bool)

(declare-fun res!360248 () Bool)

(assert (=> b!570465 (=> (not res!360248) (not e!328095))))

(assert (=> b!570465 (= res!360248 (validKeyInArray!0 k0!1914))))

(declare-fun b!570466 () Bool)

(assert (=> b!570466 (= e!328095 e!328097)))

(declare-fun res!360240 () Bool)

(assert (=> b!570466 (=> (not res!360240) (not e!328097))))

(declare-fun lt!260042 () SeekEntryResult!5610)

(assert (=> b!570466 (= res!360240 (or (= lt!260042 (MissingZero!5610 i!1132)) (= lt!260042 (MissingVacant!5610 i!1132))))))

(assert (=> b!570466 (= lt!260042 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570467 () Bool)

(assert (=> b!570467 (= e!328094 e!328096)))

(declare-fun res!360242 () Bool)

(assert (=> b!570467 (=> res!360242 e!328096)))

(get-info :version)

(assert (=> b!570467 (= res!360242 (or (undefined!6422 lt!260047) (not ((_ is Intermediate!5610) lt!260047)) (= (select (arr!17161 a!3118) (index!24669 lt!260047)) (select (arr!17161 a!3118) j!142)) (= (select (arr!17161 a!3118) (index!24669 lt!260047)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!52282 res!360245) b!570464))

(assert (= (and b!570464 res!360247) b!570459))

(assert (= (and b!570459 res!360244) b!570465))

(assert (= (and b!570465 res!360248) b!570458))

(assert (= (and b!570458 res!360243) b!570466))

(assert (= (and b!570466 res!360240) b!570461))

(assert (= (and b!570461 res!360238) b!570457))

(assert (= (and b!570457 res!360241) b!570462))

(assert (= (and b!570462 res!360246) b!570463))

(assert (= (and b!570463 res!360239) b!570467))

(assert (= (and b!570467 (not res!360242)) b!570460))

(declare-fun m!549289 () Bool)

(assert (=> b!570465 m!549289))

(declare-fun m!549291 () Bool)

(assert (=> start!52282 m!549291))

(declare-fun m!549293 () Bool)

(assert (=> start!52282 m!549293))

(declare-fun m!549295 () Bool)

(assert (=> b!570466 m!549295))

(declare-fun m!549297 () Bool)

(assert (=> b!570461 m!549297))

(declare-fun m!549299 () Bool)

(assert (=> b!570458 m!549299))

(declare-fun m!549301 () Bool)

(assert (=> b!570459 m!549301))

(assert (=> b!570459 m!549301))

(declare-fun m!549303 () Bool)

(assert (=> b!570459 m!549303))

(declare-fun m!549305 () Bool)

(assert (=> b!570457 m!549305))

(assert (=> b!570463 m!549301))

(assert (=> b!570463 m!549301))

(declare-fun m!549307 () Bool)

(assert (=> b!570463 m!549307))

(declare-fun m!549309 () Bool)

(assert (=> b!570463 m!549309))

(declare-fun m!549311 () Bool)

(assert (=> b!570463 m!549311))

(assert (=> b!570460 m!549301))

(assert (=> b!570460 m!549301))

(declare-fun m!549313 () Bool)

(assert (=> b!570460 m!549313))

(assert (=> b!570462 m!549301))

(declare-fun m!549315 () Bool)

(assert (=> b!570462 m!549315))

(declare-fun m!549317 () Bool)

(assert (=> b!570462 m!549317))

(assert (=> b!570462 m!549315))

(declare-fun m!549319 () Bool)

(assert (=> b!570462 m!549319))

(assert (=> b!570462 m!549315))

(declare-fun m!549321 () Bool)

(assert (=> b!570462 m!549321))

(assert (=> b!570462 m!549301))

(declare-fun m!549323 () Bool)

(assert (=> b!570462 m!549323))

(assert (=> b!570462 m!549301))

(declare-fun m!549325 () Bool)

(assert (=> b!570462 m!549325))

(declare-fun m!549327 () Bool)

(assert (=> b!570467 m!549327))

(assert (=> b!570467 m!549301))

(check-sat (not b!570457) (not start!52282) (not b!570459) (not b!570458) (not b!570461) (not b!570460) (not b!570462) (not b!570463) (not b!570465) (not b!570466))
(check-sat)
