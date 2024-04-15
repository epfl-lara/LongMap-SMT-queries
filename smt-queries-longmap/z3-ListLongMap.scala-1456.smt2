; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28070 () Bool)

(assert start!28070)

(declare-fun b!287544 () Bool)

(declare-fun res!149365 () Bool)

(declare-fun e!182094 () Bool)

(assert (=> b!287544 (=> (not res!149365) (not e!182094))))

(declare-datatypes ((array!14422 0))(
  ( (array!14423 (arr!6840 (Array (_ BitVec 32) (_ BitVec 64))) (size!7193 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14422)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14422 (_ BitVec 32)) Bool)

(assert (=> b!287544 (= res!149365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287545 () Bool)

(declare-fun res!149361 () Bool)

(declare-fun e!182093 () Bool)

(assert (=> b!287545 (=> (not res!149361) (not e!182093))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287545 (= res!149361 (validKeyInArray!0 k0!2524))))

(declare-fun b!287546 () Bool)

(declare-fun res!149363 () Bool)

(assert (=> b!287546 (=> (not res!149363) (not e!182093))))

(declare-fun arrayContainsKey!0 (array!14422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287546 (= res!149363 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287547 () Bool)

(declare-fun res!149360 () Bool)

(assert (=> b!287547 (=> (not res!149360) (not e!182093))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287547 (= res!149360 (and (= (size!7193 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7193 a!3312))))))

(declare-fun res!149364 () Bool)

(assert (=> start!28070 (=> (not res!149364) (not e!182093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28070 (= res!149364 (validMask!0 mask!3809))))

(assert (=> start!28070 e!182093))

(assert (=> start!28070 true))

(declare-fun array_inv!4812 (array!14422) Bool)

(assert (=> start!28070 (array_inv!4812 a!3312)))

(declare-fun b!287548 () Bool)

(assert (=> b!287548 (= e!182094 false)))

(declare-datatypes ((SeekEntryResult!1988 0))(
  ( (MissingZero!1988 (index!10122 (_ BitVec 32))) (Found!1988 (index!10123 (_ BitVec 32))) (Intermediate!1988 (undefined!2800 Bool) (index!10124 (_ BitVec 32)) (x!28362 (_ BitVec 32))) (Undefined!1988) (MissingVacant!1988 (index!10125 (_ BitVec 32))) )
))
(declare-fun lt!141440 () SeekEntryResult!1988)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14422 (_ BitVec 32)) SeekEntryResult!1988)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287548 (= lt!141440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287549 () Bool)

(assert (=> b!287549 (= e!182093 e!182094)))

(declare-fun res!149362 () Bool)

(assert (=> b!287549 (=> (not res!149362) (not e!182094))))

(declare-fun lt!141441 () SeekEntryResult!1988)

(assert (=> b!287549 (= res!149362 (or (= lt!141441 (MissingZero!1988 i!1256)) (= lt!141441 (MissingVacant!1988 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14422 (_ BitVec 32)) SeekEntryResult!1988)

(assert (=> b!287549 (= lt!141441 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28070 res!149364) b!287547))

(assert (= (and b!287547 res!149360) b!287545))

(assert (= (and b!287545 res!149361) b!287546))

(assert (= (and b!287546 res!149363) b!287549))

(assert (= (and b!287549 res!149362) b!287544))

(assert (= (and b!287544 res!149365) b!287548))

(declare-fun m!301433 () Bool)

(assert (=> b!287545 m!301433))

(declare-fun m!301435 () Bool)

(assert (=> start!28070 m!301435))

(declare-fun m!301437 () Bool)

(assert (=> start!28070 m!301437))

(declare-fun m!301439 () Bool)

(assert (=> b!287544 m!301439))

(declare-fun m!301441 () Bool)

(assert (=> b!287546 m!301441))

(declare-fun m!301443 () Bool)

(assert (=> b!287548 m!301443))

(assert (=> b!287548 m!301443))

(declare-fun m!301445 () Bool)

(assert (=> b!287548 m!301445))

(declare-fun m!301447 () Bool)

(assert (=> b!287549 m!301447))

(check-sat (not start!28070) (not b!287545) (not b!287549) (not b!287544) (not b!287546) (not b!287548))
(check-sat)
