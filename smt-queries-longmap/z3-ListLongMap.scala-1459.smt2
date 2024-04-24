; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28084 () Bool)

(assert start!28084)

(declare-fun b!287901 () Bool)

(declare-fun res!149639 () Bool)

(declare-fun e!182298 () Bool)

(assert (=> b!287901 (=> (not res!149639) (not e!182298))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14448 0))(
  ( (array!14449 (arr!6853 (Array (_ BitVec 32) (_ BitVec 64))) (size!7205 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14448)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287901 (= res!149639 (and (= (size!7205 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7205 a!3312))))))

(declare-fun b!287902 () Bool)

(declare-fun res!149638 () Bool)

(assert (=> b!287902 (=> (not res!149638) (not e!182298))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287902 (= res!149638 (validKeyInArray!0 k0!2524))))

(declare-fun b!287903 () Bool)

(declare-fun e!182300 () Bool)

(assert (=> b!287903 (= e!182300 false)))

(declare-datatypes ((SeekEntryResult!1967 0))(
  ( (MissingZero!1967 (index!10038 (_ BitVec 32))) (Found!1967 (index!10039 (_ BitVec 32))) (Intermediate!1967 (undefined!2779 Bool) (index!10040 (_ BitVec 32)) (x!28366 (_ BitVec 32))) (Undefined!1967) (MissingVacant!1967 (index!10041 (_ BitVec 32))) )
))
(declare-fun lt!141777 () SeekEntryResult!1967)

(declare-fun lt!141776 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14448 (_ BitVec 32)) SeekEntryResult!1967)

(assert (=> b!287903 (= lt!141777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141776 k0!2524 (array!14449 (store (arr!6853 a!3312) i!1256 k0!2524) (size!7205 a!3312)) mask!3809))))

(declare-fun lt!141774 () SeekEntryResult!1967)

(assert (=> b!287903 (= lt!141774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141776 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287903 (= lt!141776 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287904 () Bool)

(declare-fun res!149643 () Bool)

(assert (=> b!287904 (=> (not res!149643) (not e!182300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14448 (_ BitVec 32)) Bool)

(assert (=> b!287904 (= res!149643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287905 () Bool)

(declare-fun res!149640 () Bool)

(assert (=> b!287905 (=> (not res!149640) (not e!182298))))

(declare-fun arrayContainsKey!0 (array!14448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287905 (= res!149640 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149641 () Bool)

(assert (=> start!28084 (=> (not res!149641) (not e!182298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28084 (= res!149641 (validMask!0 mask!3809))))

(assert (=> start!28084 e!182298))

(assert (=> start!28084 true))

(declare-fun array_inv!4803 (array!14448) Bool)

(assert (=> start!28084 (array_inv!4803 a!3312)))

(declare-fun b!287900 () Bool)

(assert (=> b!287900 (= e!182298 e!182300)))

(declare-fun res!149642 () Bool)

(assert (=> b!287900 (=> (not res!149642) (not e!182300))))

(declare-fun lt!141775 () SeekEntryResult!1967)

(assert (=> b!287900 (= res!149642 (or (= lt!141775 (MissingZero!1967 i!1256)) (= lt!141775 (MissingVacant!1967 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14448 (_ BitVec 32)) SeekEntryResult!1967)

(assert (=> b!287900 (= lt!141775 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28084 res!149641) b!287901))

(assert (= (and b!287901 res!149639) b!287902))

(assert (= (and b!287902 res!149638) b!287905))

(assert (= (and b!287905 res!149640) b!287900))

(assert (= (and b!287900 res!149642) b!287904))

(assert (= (and b!287904 res!149643) b!287903))

(declare-fun m!302399 () Bool)

(assert (=> start!28084 m!302399))

(declare-fun m!302401 () Bool)

(assert (=> start!28084 m!302401))

(declare-fun m!302403 () Bool)

(assert (=> b!287903 m!302403))

(declare-fun m!302405 () Bool)

(assert (=> b!287903 m!302405))

(declare-fun m!302407 () Bool)

(assert (=> b!287903 m!302407))

(declare-fun m!302409 () Bool)

(assert (=> b!287903 m!302409))

(declare-fun m!302411 () Bool)

(assert (=> b!287900 m!302411))

(declare-fun m!302413 () Bool)

(assert (=> b!287902 m!302413))

(declare-fun m!302415 () Bool)

(assert (=> b!287905 m!302415))

(declare-fun m!302417 () Bool)

(assert (=> b!287904 m!302417))

(check-sat (not b!287904) (not b!287900) (not b!287903) (not start!28084) (not b!287902) (not b!287905))
(check-sat)
