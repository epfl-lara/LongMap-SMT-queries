; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28076 () Bool)

(assert start!28076)

(declare-fun b!287598 () Bool)

(declare-fun res!149418 () Bool)

(declare-fun e!182121 () Bool)

(assert (=> b!287598 (=> (not res!149418) (not e!182121))))

(declare-datatypes ((array!14428 0))(
  ( (array!14429 (arr!6843 (Array (_ BitVec 32) (_ BitVec 64))) (size!7196 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14428)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14428 (_ BitVec 32)) Bool)

(assert (=> b!287598 (= res!149418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287599 () Bool)

(declare-fun res!149417 () Bool)

(declare-fun e!182119 () Bool)

(assert (=> b!287599 (=> (not res!149417) (not e!182119))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287599 (= res!149417 (validKeyInArray!0 k0!2524))))

(declare-fun b!287600 () Bool)

(assert (=> b!287600 (= e!182119 e!182121)))

(declare-fun res!149414 () Bool)

(assert (=> b!287600 (=> (not res!149414) (not e!182121))))

(declare-datatypes ((SeekEntryResult!1991 0))(
  ( (MissingZero!1991 (index!10134 (_ BitVec 32))) (Found!1991 (index!10135 (_ BitVec 32))) (Intermediate!1991 (undefined!2803 Bool) (index!10136 (_ BitVec 32)) (x!28373 (_ BitVec 32))) (Undefined!1991) (MissingVacant!1991 (index!10137 (_ BitVec 32))) )
))
(declare-fun lt!141462 () SeekEntryResult!1991)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287600 (= res!149414 (or (= lt!141462 (MissingZero!1991 i!1256)) (= lt!141462 (MissingVacant!1991 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14428 (_ BitVec 32)) SeekEntryResult!1991)

(assert (=> b!287600 (= lt!141462 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287602 () Bool)

(declare-fun res!149415 () Bool)

(assert (=> b!287602 (=> (not res!149415) (not e!182119))))

(assert (=> b!287602 (= res!149415 (and (= (size!7196 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7196 a!3312))))))

(declare-fun b!287603 () Bool)

(assert (=> b!287603 (= e!182121 false)))

(declare-fun lt!141464 () (_ BitVec 32))

(declare-fun lt!141463 () SeekEntryResult!1991)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14428 (_ BitVec 32)) SeekEntryResult!1991)

(assert (=> b!287603 (= lt!141463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141464 k0!2524 (array!14429 (store (arr!6843 a!3312) i!1256 k0!2524) (size!7196 a!3312)) mask!3809))))

(declare-fun lt!141465 () SeekEntryResult!1991)

(assert (=> b!287603 (= lt!141465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141464 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287603 (= lt!141464 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287601 () Bool)

(declare-fun res!149416 () Bool)

(assert (=> b!287601 (=> (not res!149416) (not e!182119))))

(declare-fun arrayContainsKey!0 (array!14428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287601 (= res!149416 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149419 () Bool)

(assert (=> start!28076 (=> (not res!149419) (not e!182119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28076 (= res!149419 (validMask!0 mask!3809))))

(assert (=> start!28076 e!182119))

(assert (=> start!28076 true))

(declare-fun array_inv!4815 (array!14428) Bool)

(assert (=> start!28076 (array_inv!4815 a!3312)))

(assert (= (and start!28076 res!149419) b!287602))

(assert (= (and b!287602 res!149415) b!287599))

(assert (= (and b!287599 res!149417) b!287601))

(assert (= (and b!287601 res!149416) b!287600))

(assert (= (and b!287600 res!149414) b!287598))

(assert (= (and b!287598 res!149418) b!287603))

(declare-fun m!301481 () Bool)

(assert (=> b!287598 m!301481))

(declare-fun m!301483 () Bool)

(assert (=> b!287599 m!301483))

(declare-fun m!301485 () Bool)

(assert (=> b!287603 m!301485))

(declare-fun m!301487 () Bool)

(assert (=> b!287603 m!301487))

(declare-fun m!301489 () Bool)

(assert (=> b!287603 m!301489))

(declare-fun m!301491 () Bool)

(assert (=> b!287603 m!301491))

(declare-fun m!301493 () Bool)

(assert (=> b!287600 m!301493))

(declare-fun m!301495 () Bool)

(assert (=> b!287601 m!301495))

(declare-fun m!301497 () Bool)

(assert (=> start!28076 m!301497))

(declare-fun m!301499 () Bool)

(assert (=> start!28076 m!301499))

(check-sat (not b!287600) (not b!287598) (not start!28076) (not b!287603) (not b!287599) (not b!287601))
(check-sat)
