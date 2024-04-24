; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28066 () Bool)

(assert start!28066)

(declare-fun b!287738 () Bool)

(declare-fun res!149480 () Bool)

(declare-fun e!182218 () Bool)

(assert (=> b!287738 (=> (not res!149480) (not e!182218))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14430 0))(
  ( (array!14431 (arr!6844 (Array (_ BitVec 32) (_ BitVec 64))) (size!7196 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14430)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287738 (= res!149480 (and (= (size!7196 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7196 a!3312))))))

(declare-fun b!287739 () Bool)

(declare-fun e!182217 () Bool)

(assert (=> b!287739 (= e!182217 false)))

(declare-datatypes ((SeekEntryResult!1958 0))(
  ( (MissingZero!1958 (index!10002 (_ BitVec 32))) (Found!1958 (index!10003 (_ BitVec 32))) (Intermediate!1958 (undefined!2770 Bool) (index!10004 (_ BitVec 32)) (x!28333 (_ BitVec 32))) (Undefined!1958) (MissingVacant!1958 (index!10005 (_ BitVec 32))) )
))
(declare-fun lt!141680 () SeekEntryResult!1958)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14430 (_ BitVec 32)) SeekEntryResult!1958)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287739 (= lt!141680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287740 () Bool)

(declare-fun res!149477 () Bool)

(assert (=> b!287740 (=> (not res!149477) (not e!182217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14430 (_ BitVec 32)) Bool)

(assert (=> b!287740 (= res!149477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287741 () Bool)

(assert (=> b!287741 (= e!182218 e!182217)))

(declare-fun res!149478 () Bool)

(assert (=> b!287741 (=> (not res!149478) (not e!182217))))

(declare-fun lt!141681 () SeekEntryResult!1958)

(assert (=> b!287741 (= res!149478 (or (= lt!141681 (MissingZero!1958 i!1256)) (= lt!141681 (MissingVacant!1958 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14430 (_ BitVec 32)) SeekEntryResult!1958)

(assert (=> b!287741 (= lt!141681 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!149479 () Bool)

(assert (=> start!28066 (=> (not res!149479) (not e!182218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28066 (= res!149479 (validMask!0 mask!3809))))

(assert (=> start!28066 e!182218))

(assert (=> start!28066 true))

(declare-fun array_inv!4794 (array!14430) Bool)

(assert (=> start!28066 (array_inv!4794 a!3312)))

(declare-fun b!287742 () Bool)

(declare-fun res!149476 () Bool)

(assert (=> b!287742 (=> (not res!149476) (not e!182218))))

(declare-fun arrayContainsKey!0 (array!14430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287742 (= res!149476 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287743 () Bool)

(declare-fun res!149481 () Bool)

(assert (=> b!287743 (=> (not res!149481) (not e!182218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287743 (= res!149481 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28066 res!149479) b!287738))

(assert (= (and b!287738 res!149480) b!287743))

(assert (= (and b!287743 res!149481) b!287742))

(assert (= (and b!287742 res!149476) b!287741))

(assert (= (and b!287741 res!149478) b!287740))

(assert (= (and b!287740 res!149477) b!287739))

(declare-fun m!302231 () Bool)

(assert (=> b!287740 m!302231))

(declare-fun m!302233 () Bool)

(assert (=> b!287742 m!302233))

(declare-fun m!302235 () Bool)

(assert (=> start!28066 m!302235))

(declare-fun m!302237 () Bool)

(assert (=> start!28066 m!302237))

(declare-fun m!302239 () Bool)

(assert (=> b!287741 m!302239))

(declare-fun m!302241 () Bool)

(assert (=> b!287739 m!302241))

(assert (=> b!287739 m!302241))

(declare-fun m!302243 () Bool)

(assert (=> b!287739 m!302243))

(declare-fun m!302245 () Bool)

(assert (=> b!287743 m!302245))

(check-sat (not b!287740) (not b!287742) (not b!287743) (not b!287741) (not start!28066) (not b!287739))
(check-sat)
