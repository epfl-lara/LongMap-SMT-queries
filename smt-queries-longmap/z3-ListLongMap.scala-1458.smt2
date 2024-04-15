; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28082 () Bool)

(assert start!28082)

(declare-fun b!287652 () Bool)

(declare-fun res!149472 () Bool)

(declare-fun e!182146 () Bool)

(assert (=> b!287652 (=> (not res!149472) (not e!182146))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287652 (= res!149472 (validKeyInArray!0 k0!2524))))

(declare-fun b!287653 () Bool)

(declare-fun res!149468 () Bool)

(assert (=> b!287653 (=> (not res!149468) (not e!182146))))

(declare-datatypes ((array!14434 0))(
  ( (array!14435 (arr!6846 (Array (_ BitVec 32) (_ BitVec 64))) (size!7199 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14434)

(declare-fun arrayContainsKey!0 (array!14434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287653 (= res!149468 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287654 () Bool)

(declare-fun res!149471 () Bool)

(declare-fun e!182148 () Bool)

(assert (=> b!287654 (=> (not res!149471) (not e!182148))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14434 (_ BitVec 32)) Bool)

(assert (=> b!287654 (= res!149471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!149469 () Bool)

(assert (=> start!28082 (=> (not res!149469) (not e!182146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28082 (= res!149469 (validMask!0 mask!3809))))

(assert (=> start!28082 e!182146))

(assert (=> start!28082 true))

(declare-fun array_inv!4818 (array!14434) Bool)

(assert (=> start!28082 (array_inv!4818 a!3312)))

(declare-fun b!287655 () Bool)

(assert (=> b!287655 (= e!182146 e!182148)))

(declare-fun res!149473 () Bool)

(assert (=> b!287655 (=> (not res!149473) (not e!182148))))

(declare-datatypes ((SeekEntryResult!1994 0))(
  ( (MissingZero!1994 (index!10146 (_ BitVec 32))) (Found!1994 (index!10147 (_ BitVec 32))) (Intermediate!1994 (undefined!2806 Bool) (index!10148 (_ BitVec 32)) (x!28384 (_ BitVec 32))) (Undefined!1994) (MissingVacant!1994 (index!10149 (_ BitVec 32))) )
))
(declare-fun lt!141501 () SeekEntryResult!1994)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287655 (= res!149473 (or (= lt!141501 (MissingZero!1994 i!1256)) (= lt!141501 (MissingVacant!1994 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14434 (_ BitVec 32)) SeekEntryResult!1994)

(assert (=> b!287655 (= lt!141501 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287656 () Bool)

(declare-fun res!149470 () Bool)

(assert (=> b!287656 (=> (not res!149470) (not e!182146))))

(assert (=> b!287656 (= res!149470 (and (= (size!7199 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7199 a!3312))))))

(declare-fun b!287657 () Bool)

(assert (=> b!287657 (= e!182148 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141499 () (_ BitVec 32))

(declare-fun lt!141500 () SeekEntryResult!1994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14434 (_ BitVec 32)) SeekEntryResult!1994)

(assert (=> b!287657 (= lt!141500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141499 k0!2524 (array!14435 (store (arr!6846 a!3312) i!1256 k0!2524) (size!7199 a!3312)) mask!3809))))

(declare-fun lt!141498 () SeekEntryResult!1994)

(assert (=> b!287657 (= lt!141498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141499 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287657 (= lt!141499 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28082 res!149469) b!287656))

(assert (= (and b!287656 res!149470) b!287652))

(assert (= (and b!287652 res!149472) b!287653))

(assert (= (and b!287653 res!149468) b!287655))

(assert (= (and b!287655 res!149473) b!287654))

(assert (= (and b!287654 res!149471) b!287657))

(declare-fun m!301541 () Bool)

(assert (=> start!28082 m!301541))

(declare-fun m!301543 () Bool)

(assert (=> start!28082 m!301543))

(declare-fun m!301545 () Bool)

(assert (=> b!287654 m!301545))

(declare-fun m!301547 () Bool)

(assert (=> b!287657 m!301547))

(declare-fun m!301549 () Bool)

(assert (=> b!287657 m!301549))

(declare-fun m!301551 () Bool)

(assert (=> b!287657 m!301551))

(declare-fun m!301553 () Bool)

(assert (=> b!287657 m!301553))

(declare-fun m!301555 () Bool)

(assert (=> b!287652 m!301555))

(declare-fun m!301557 () Bool)

(assert (=> b!287655 m!301557))

(declare-fun m!301559 () Bool)

(assert (=> b!287653 m!301559))

(check-sat (not b!287652) (not b!287657) (not b!287655) (not b!287653) (not start!28082) (not b!287654))
(check-sat)
