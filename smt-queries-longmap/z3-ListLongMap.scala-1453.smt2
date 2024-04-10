; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28010 () Bool)

(assert start!28010)

(declare-fun b!287358 () Bool)

(declare-fun e!182006 () Bool)

(declare-fun e!182005 () Bool)

(assert (=> b!287358 (= e!182006 e!182005)))

(declare-fun res!149248 () Bool)

(assert (=> b!287358 (=> (not res!149248) (not e!182005))))

(declare-datatypes ((SeekEntryResult!1986 0))(
  ( (MissingZero!1986 (index!10114 (_ BitVec 32))) (Found!1986 (index!10115 (_ BitVec 32))) (Intermediate!1986 (undefined!2798 Bool) (index!10116 (_ BitVec 32)) (x!28331 (_ BitVec 32))) (Undefined!1986) (MissingVacant!1986 (index!10117 (_ BitVec 32))) )
))
(declare-fun lt!141474 () SeekEntryResult!1986)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287358 (= res!149248 (or (= lt!141474 (MissingZero!1986 i!1256)) (= lt!141474 (MissingVacant!1986 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14414 0))(
  ( (array!14415 (arr!6837 (Array (_ BitVec 32) (_ BitVec 64))) (size!7189 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14414)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14414 (_ BitVec 32)) SeekEntryResult!1986)

(assert (=> b!287358 (= lt!141474 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287359 () Bool)

(declare-fun res!149249 () Bool)

(assert (=> b!287359 (=> (not res!149249) (not e!182006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287359 (= res!149249 (validKeyInArray!0 k0!2524))))

(declare-fun b!287360 () Bool)

(declare-fun res!149246 () Bool)

(assert (=> b!287360 (=> (not res!149246) (not e!182005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14414 (_ BitVec 32)) Bool)

(assert (=> b!287360 (= res!149246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287361 () Bool)

(declare-fun res!149245 () Bool)

(assert (=> b!287361 (=> (not res!149245) (not e!182006))))

(assert (=> b!287361 (= res!149245 (and (= (size!7189 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7189 a!3312))))))

(declare-fun b!287362 () Bool)

(assert (=> b!287362 (= e!182005 false)))

(declare-fun lt!141475 () SeekEntryResult!1986)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14414 (_ BitVec 32)) SeekEntryResult!1986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287362 (= lt!141475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun res!149250 () Bool)

(assert (=> start!28010 (=> (not res!149250) (not e!182006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28010 (= res!149250 (validMask!0 mask!3809))))

(assert (=> start!28010 e!182006))

(assert (=> start!28010 true))

(declare-fun array_inv!4800 (array!14414) Bool)

(assert (=> start!28010 (array_inv!4800 a!3312)))

(declare-fun b!287363 () Bool)

(declare-fun res!149247 () Bool)

(assert (=> b!287363 (=> (not res!149247) (not e!182006))))

(declare-fun arrayContainsKey!0 (array!14414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287363 (= res!149247 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28010 res!149250) b!287361))

(assert (= (and b!287361 res!149245) b!287359))

(assert (= (and b!287359 res!149249) b!287363))

(assert (= (and b!287363 res!149247) b!287358))

(assert (= (and b!287358 res!149248) b!287360))

(assert (= (and b!287360 res!149246) b!287362))

(declare-fun m!301795 () Bool)

(assert (=> b!287362 m!301795))

(assert (=> b!287362 m!301795))

(declare-fun m!301797 () Bool)

(assert (=> b!287362 m!301797))

(declare-fun m!301799 () Bool)

(assert (=> b!287358 m!301799))

(declare-fun m!301801 () Bool)

(assert (=> b!287360 m!301801))

(declare-fun m!301803 () Bool)

(assert (=> start!28010 m!301803))

(declare-fun m!301805 () Bool)

(assert (=> start!28010 m!301805))

(declare-fun m!301807 () Bool)

(assert (=> b!287359 m!301807))

(declare-fun m!301809 () Bool)

(assert (=> b!287363 m!301809))

(check-sat (not b!287362) (not b!287359) (not b!287363) (not b!287360) (not b!287358) (not start!28010))
