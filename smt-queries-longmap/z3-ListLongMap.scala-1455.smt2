; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28064 () Bool)

(assert start!28064)

(declare-fun res!149310 () Bool)

(declare-fun e!182065 () Bool)

(assert (=> start!28064 (=> (not res!149310) (not e!182065))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28064 (= res!149310 (validMask!0 mask!3809))))

(assert (=> start!28064 e!182065))

(assert (=> start!28064 true))

(declare-datatypes ((array!14416 0))(
  ( (array!14417 (arr!6837 (Array (_ BitVec 32) (_ BitVec 64))) (size!7190 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14416)

(declare-fun array_inv!4809 (array!14416) Bool)

(assert (=> start!28064 (array_inv!4809 a!3312)))

(declare-fun b!287490 () Bool)

(declare-fun res!149307 () Bool)

(assert (=> b!287490 (=> (not res!149307) (not e!182065))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287490 (= res!149307 (validKeyInArray!0 k0!2524))))

(declare-fun b!287491 () Bool)

(declare-fun e!182066 () Bool)

(assert (=> b!287491 (= e!182065 e!182066)))

(declare-fun res!149311 () Bool)

(assert (=> b!287491 (=> (not res!149311) (not e!182066))))

(declare-datatypes ((SeekEntryResult!1985 0))(
  ( (MissingZero!1985 (index!10110 (_ BitVec 32))) (Found!1985 (index!10111 (_ BitVec 32))) (Intermediate!1985 (undefined!2797 Bool) (index!10112 (_ BitVec 32)) (x!28351 (_ BitVec 32))) (Undefined!1985) (MissingVacant!1985 (index!10113 (_ BitVec 32))) )
))
(declare-fun lt!141422 () SeekEntryResult!1985)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287491 (= res!149311 (or (= lt!141422 (MissingZero!1985 i!1256)) (= lt!141422 (MissingVacant!1985 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14416 (_ BitVec 32)) SeekEntryResult!1985)

(assert (=> b!287491 (= lt!141422 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287492 () Bool)

(declare-fun res!149306 () Bool)

(assert (=> b!287492 (=> (not res!149306) (not e!182066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14416 (_ BitVec 32)) Bool)

(assert (=> b!287492 (= res!149306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287493 () Bool)

(declare-fun res!149308 () Bool)

(assert (=> b!287493 (=> (not res!149308) (not e!182065))))

(assert (=> b!287493 (= res!149308 (and (= (size!7190 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7190 a!3312))))))

(declare-fun b!287494 () Bool)

(declare-fun res!149309 () Bool)

(assert (=> b!287494 (=> (not res!149309) (not e!182065))))

(declare-fun arrayContainsKey!0 (array!14416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287494 (= res!149309 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287495 () Bool)

(assert (=> b!287495 (= e!182066 false)))

(declare-fun lt!141423 () SeekEntryResult!1985)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14416 (_ BitVec 32)) SeekEntryResult!1985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287495 (= lt!141423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and start!28064 res!149310) b!287493))

(assert (= (and b!287493 res!149308) b!287490))

(assert (= (and b!287490 res!149307) b!287494))

(assert (= (and b!287494 res!149309) b!287491))

(assert (= (and b!287491 res!149311) b!287492))

(assert (= (and b!287492 res!149306) b!287495))

(declare-fun m!301385 () Bool)

(assert (=> b!287494 m!301385))

(declare-fun m!301387 () Bool)

(assert (=> b!287491 m!301387))

(declare-fun m!301389 () Bool)

(assert (=> b!287490 m!301389))

(declare-fun m!301391 () Bool)

(assert (=> b!287495 m!301391))

(assert (=> b!287495 m!301391))

(declare-fun m!301393 () Bool)

(assert (=> b!287495 m!301393))

(declare-fun m!301395 () Bool)

(assert (=> b!287492 m!301395))

(declare-fun m!301397 () Bool)

(assert (=> start!28064 m!301397))

(declare-fun m!301399 () Bool)

(assert (=> start!28064 m!301399))

(check-sat (not b!287495) (not start!28064) (not b!287492) (not b!287490) (not b!287494) (not b!287491))
(check-sat)
