; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28094 () Bool)

(assert start!28094)

(declare-fun b!287871 () Bool)

(declare-fun res!149637 () Bool)

(declare-fun e!182283 () Bool)

(assert (=> b!287871 (=> (not res!149637) (not e!182283))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287871 (= res!149637 (validKeyInArray!0 k0!2524))))

(declare-fun b!287872 () Bool)

(declare-fun e!182285 () Bool)

(assert (=> b!287872 (= e!182285 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14453 0))(
  ( (array!14454 (arr!6855 (Array (_ BitVec 32) (_ BitVec 64))) (size!7207 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14453)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2004 0))(
  ( (MissingZero!2004 (index!10186 (_ BitVec 32))) (Found!2004 (index!10187 (_ BitVec 32))) (Intermediate!2004 (undefined!2816 Bool) (index!10188 (_ BitVec 32)) (x!28403 (_ BitVec 32))) (Undefined!2004) (MissingVacant!2004 (index!10189 (_ BitVec 32))) )
))
(declare-fun lt!141727 () SeekEntryResult!2004)

(declare-fun lt!141730 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14453 (_ BitVec 32)) SeekEntryResult!2004)

(assert (=> b!287872 (= lt!141727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141730 k0!2524 (array!14454 (store (arr!6855 a!3312) i!1256 k0!2524) (size!7207 a!3312)) mask!3809))))

(declare-fun lt!141728 () SeekEntryResult!2004)

(assert (=> b!287872 (= lt!141728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141730 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287872 (= lt!141730 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287873 () Bool)

(declare-fun res!149635 () Bool)

(assert (=> b!287873 (=> (not res!149635) (not e!182285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14453 (_ BitVec 32)) Bool)

(assert (=> b!287873 (= res!149635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287874 () Bool)

(assert (=> b!287874 (= e!182283 e!182285)))

(declare-fun res!149638 () Bool)

(assert (=> b!287874 (=> (not res!149638) (not e!182285))))

(declare-fun lt!141729 () SeekEntryResult!2004)

(assert (=> b!287874 (= res!149638 (or (= lt!141729 (MissingZero!2004 i!1256)) (= lt!141729 (MissingVacant!2004 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14453 (_ BitVec 32)) SeekEntryResult!2004)

(assert (=> b!287874 (= lt!141729 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287875 () Bool)

(declare-fun res!149636 () Bool)

(assert (=> b!287875 (=> (not res!149636) (not e!182283))))

(declare-fun arrayContainsKey!0 (array!14453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287875 (= res!149636 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149639 () Bool)

(assert (=> start!28094 (=> (not res!149639) (not e!182283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28094 (= res!149639 (validMask!0 mask!3809))))

(assert (=> start!28094 e!182283))

(assert (=> start!28094 true))

(declare-fun array_inv!4818 (array!14453) Bool)

(assert (=> start!28094 (array_inv!4818 a!3312)))

(declare-fun b!287876 () Bool)

(declare-fun res!149640 () Bool)

(assert (=> b!287876 (=> (not res!149640) (not e!182283))))

(assert (=> b!287876 (= res!149640 (and (= (size!7207 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7207 a!3312))))))

(assert (= (and start!28094 res!149639) b!287876))

(assert (= (and b!287876 res!149640) b!287871))

(assert (= (and b!287871 res!149637) b!287875))

(assert (= (and b!287875 res!149636) b!287874))

(assert (= (and b!287874 res!149638) b!287873))

(assert (= (and b!287873 res!149635) b!287872))

(declare-fun m!302213 () Bool)

(assert (=> b!287871 m!302213))

(declare-fun m!302215 () Bool)

(assert (=> start!28094 m!302215))

(declare-fun m!302217 () Bool)

(assert (=> start!28094 m!302217))

(declare-fun m!302219 () Bool)

(assert (=> b!287873 m!302219))

(declare-fun m!302221 () Bool)

(assert (=> b!287872 m!302221))

(declare-fun m!302223 () Bool)

(assert (=> b!287872 m!302223))

(declare-fun m!302225 () Bool)

(assert (=> b!287872 m!302225))

(declare-fun m!302227 () Bool)

(assert (=> b!287872 m!302227))

(declare-fun m!302229 () Bool)

(assert (=> b!287874 m!302229))

(declare-fun m!302231 () Bool)

(assert (=> b!287875 m!302231))

(check-sat (not b!287873) (not start!28094) (not b!287874) (not b!287872) (not b!287875) (not b!287871))
(check-sat)
