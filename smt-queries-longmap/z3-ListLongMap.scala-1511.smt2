; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28588 () Bool)

(assert start!28588)

(declare-fun res!153468 () Bool)

(declare-fun e!185023 () Bool)

(assert (=> start!28588 (=> (not res!153468) (not e!185023))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28588 (= res!153468 (validMask!0 mask!3809))))

(assert (=> start!28588 e!185023))

(assert (=> start!28588 true))

(declare-datatypes ((array!14772 0))(
  ( (array!14773 (arr!7009 (Array (_ BitVec 32) (_ BitVec 64))) (size!7361 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14772)

(declare-fun array_inv!4959 (array!14772) Bool)

(assert (=> start!28588 (array_inv!4959 a!3312)))

(declare-fun b!292436 () Bool)

(declare-fun res!153470 () Bool)

(assert (=> b!292436 (=> (not res!153470) (not e!185023))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292436 (= res!153470 (validKeyInArray!0 k0!2524))))

(declare-fun b!292437 () Bool)

(declare-fun e!185024 () Bool)

(assert (=> b!292437 (= e!185023 e!185024)))

(declare-fun res!153469 () Bool)

(assert (=> b!292437 (=> (not res!153469) (not e!185024))))

(declare-datatypes ((SeekEntryResult!2123 0))(
  ( (MissingZero!2123 (index!10662 (_ BitVec 32))) (Found!2123 (index!10663 (_ BitVec 32))) (Intermediate!2123 (undefined!2935 Bool) (index!10664 (_ BitVec 32)) (x!28962 (_ BitVec 32))) (Undefined!2123) (MissingVacant!2123 (index!10665 (_ BitVec 32))) )
))
(declare-fun lt!144869 () SeekEntryResult!2123)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292437 (= res!153469 (or (= lt!144869 (MissingZero!2123 i!1256)) (= lt!144869 (MissingVacant!2123 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14772 (_ BitVec 32)) SeekEntryResult!2123)

(assert (=> b!292437 (= lt!144869 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292438 () Bool)

(declare-fun res!153471 () Bool)

(assert (=> b!292438 (=> (not res!153471) (not e!185023))))

(assert (=> b!292438 (= res!153471 (and (= (size!7361 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7361 a!3312))))))

(declare-fun b!292439 () Bool)

(declare-fun res!153467 () Bool)

(assert (=> b!292439 (=> (not res!153467) (not e!185024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14772 (_ BitVec 32)) Bool)

(assert (=> b!292439 (= res!153467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292440 () Bool)

(assert (=> b!292440 (= e!185024 false)))

(declare-fun lt!144870 () (_ BitVec 32))

(declare-fun lt!144867 () SeekEntryResult!2123)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14772 (_ BitVec 32)) SeekEntryResult!2123)

(assert (=> b!292440 (= lt!144867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144870 k0!2524 (array!14773 (store (arr!7009 a!3312) i!1256 k0!2524) (size!7361 a!3312)) mask!3809))))

(declare-fun lt!144868 () SeekEntryResult!2123)

(assert (=> b!292440 (= lt!144868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144870 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292440 (= lt!144870 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292441 () Bool)

(declare-fun res!153466 () Bool)

(assert (=> b!292441 (=> (not res!153466) (not e!185023))))

(declare-fun arrayContainsKey!0 (array!14772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292441 (= res!153466 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28588 res!153468) b!292438))

(assert (= (and b!292438 res!153471) b!292436))

(assert (= (and b!292436 res!153470) b!292441))

(assert (= (and b!292441 res!153466) b!292437))

(assert (= (and b!292437 res!153469) b!292439))

(assert (= (and b!292439 res!153467) b!292440))

(declare-fun m!306323 () Bool)

(assert (=> start!28588 m!306323))

(declare-fun m!306325 () Bool)

(assert (=> start!28588 m!306325))

(declare-fun m!306327 () Bool)

(assert (=> b!292437 m!306327))

(declare-fun m!306329 () Bool)

(assert (=> b!292441 m!306329))

(declare-fun m!306331 () Bool)

(assert (=> b!292440 m!306331))

(declare-fun m!306333 () Bool)

(assert (=> b!292440 m!306333))

(declare-fun m!306335 () Bool)

(assert (=> b!292440 m!306335))

(declare-fun m!306337 () Bool)

(assert (=> b!292440 m!306337))

(declare-fun m!306339 () Bool)

(assert (=> b!292436 m!306339))

(declare-fun m!306341 () Bool)

(assert (=> b!292439 m!306341))

(check-sat (not b!292440) (not b!292436) (not b!292437) (not b!292441) (not start!28588) (not b!292439))
(check-sat)
