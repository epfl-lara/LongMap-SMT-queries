; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28094 () Bool)

(assert start!28094)

(declare-fun b!287760 () Bool)

(declare-fun res!149576 () Bool)

(declare-fun e!182200 () Bool)

(assert (=> b!287760 (=> (not res!149576) (not e!182200))))

(declare-datatypes ((array!14446 0))(
  ( (array!14447 (arr!6852 (Array (_ BitVec 32) (_ BitVec 64))) (size!7205 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14446)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14446 (_ BitVec 32)) Bool)

(assert (=> b!287760 (= res!149576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287762 () Bool)

(declare-fun e!182201 () Bool)

(assert (=> b!287762 (= e!182201 e!182200)))

(declare-fun res!149580 () Bool)

(assert (=> b!287762 (=> (not res!149580) (not e!182200))))

(declare-datatypes ((SeekEntryResult!2000 0))(
  ( (MissingZero!2000 (index!10170 (_ BitVec 32))) (Found!2000 (index!10171 (_ BitVec 32))) (Intermediate!2000 (undefined!2812 Bool) (index!10172 (_ BitVec 32)) (x!28406 (_ BitVec 32))) (Undefined!2000) (MissingVacant!2000 (index!10173 (_ BitVec 32))) )
))
(declare-fun lt!141571 () SeekEntryResult!2000)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287762 (= res!149580 (or (= lt!141571 (MissingZero!2000 i!1256)) (= lt!141571 (MissingVacant!2000 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14446 (_ BitVec 32)) SeekEntryResult!2000)

(assert (=> b!287762 (= lt!141571 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287763 () Bool)

(assert (=> b!287763 (= e!182200 false)))

(declare-fun lt!141572 () (_ BitVec 32))

(declare-fun lt!141570 () SeekEntryResult!2000)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14446 (_ BitVec 32)) SeekEntryResult!2000)

(assert (=> b!287763 (= lt!141570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141572 k0!2524 (array!14447 (store (arr!6852 a!3312) i!1256 k0!2524) (size!7205 a!3312)) mask!3809))))

(declare-fun lt!141573 () SeekEntryResult!2000)

(assert (=> b!287763 (= lt!141573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141572 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287763 (= lt!141572 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287764 () Bool)

(declare-fun res!149581 () Bool)

(assert (=> b!287764 (=> (not res!149581) (not e!182201))))

(declare-fun arrayContainsKey!0 (array!14446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287764 (= res!149581 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287765 () Bool)

(declare-fun res!149579 () Bool)

(assert (=> b!287765 (=> (not res!149579) (not e!182201))))

(assert (=> b!287765 (= res!149579 (and (= (size!7205 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7205 a!3312))))))

(declare-fun res!149578 () Bool)

(assert (=> start!28094 (=> (not res!149578) (not e!182201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28094 (= res!149578 (validMask!0 mask!3809))))

(assert (=> start!28094 e!182201))

(assert (=> start!28094 true))

(declare-fun array_inv!4824 (array!14446) Bool)

(assert (=> start!28094 (array_inv!4824 a!3312)))

(declare-fun b!287761 () Bool)

(declare-fun res!149577 () Bool)

(assert (=> b!287761 (=> (not res!149577) (not e!182201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287761 (= res!149577 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28094 res!149578) b!287765))

(assert (= (and b!287765 res!149579) b!287761))

(assert (= (and b!287761 res!149577) b!287764))

(assert (= (and b!287764 res!149581) b!287762))

(assert (= (and b!287762 res!149580) b!287760))

(assert (= (and b!287760 res!149576) b!287763))

(declare-fun m!301661 () Bool)

(assert (=> b!287761 m!301661))

(declare-fun m!301663 () Bool)

(assert (=> b!287760 m!301663))

(declare-fun m!301665 () Bool)

(assert (=> b!287763 m!301665))

(declare-fun m!301667 () Bool)

(assert (=> b!287763 m!301667))

(declare-fun m!301669 () Bool)

(assert (=> b!287763 m!301669))

(declare-fun m!301671 () Bool)

(assert (=> b!287763 m!301671))

(declare-fun m!301673 () Bool)

(assert (=> start!28094 m!301673))

(declare-fun m!301675 () Bool)

(assert (=> start!28094 m!301675))

(declare-fun m!301677 () Bool)

(assert (=> b!287762 m!301677))

(declare-fun m!301679 () Bool)

(assert (=> b!287764 m!301679))

(check-sat (not b!287762) (not b!287760) (not b!287763) (not b!287764) (not b!287761) (not start!28094))
(check-sat)
