; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28082 () Bool)

(assert start!28082)

(declare-fun b!287763 () Bool)

(declare-fun e!182230 () Bool)

(declare-fun e!182229 () Bool)

(assert (=> b!287763 (= e!182230 e!182229)))

(declare-fun res!149530 () Bool)

(assert (=> b!287763 (=> (not res!149530) (not e!182229))))

(declare-datatypes ((SeekEntryResult!1998 0))(
  ( (MissingZero!1998 (index!10162 (_ BitVec 32))) (Found!1998 (index!10163 (_ BitVec 32))) (Intermediate!1998 (undefined!2810 Bool) (index!10164 (_ BitVec 32)) (x!28381 (_ BitVec 32))) (Undefined!1998) (MissingVacant!1998 (index!10165 (_ BitVec 32))) )
))
(declare-fun lt!141658 () SeekEntryResult!1998)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287763 (= res!149530 (or (= lt!141658 (MissingZero!1998 i!1256)) (= lt!141658 (MissingVacant!1998 i!1256))))))

(declare-datatypes ((array!14441 0))(
  ( (array!14442 (arr!6849 (Array (_ BitVec 32) (_ BitVec 64))) (size!7201 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14441)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14441 (_ BitVec 32)) SeekEntryResult!1998)

(assert (=> b!287763 (= lt!141658 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287764 () Bool)

(assert (=> b!287764 (= e!182229 false)))

(declare-fun lt!141656 () SeekEntryResult!1998)

(declare-fun lt!141657 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14441 (_ BitVec 32)) SeekEntryResult!1998)

(assert (=> b!287764 (= lt!141656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141657 k0!2524 (array!14442 (store (arr!6849 a!3312) i!1256 k0!2524) (size!7201 a!3312)) mask!3809))))

(declare-fun lt!141655 () SeekEntryResult!1998)

(assert (=> b!287764 (= lt!141655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141657 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287764 (= lt!141657 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!149528 () Bool)

(assert (=> start!28082 (=> (not res!149528) (not e!182230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28082 (= res!149528 (validMask!0 mask!3809))))

(assert (=> start!28082 e!182230))

(assert (=> start!28082 true))

(declare-fun array_inv!4812 (array!14441) Bool)

(assert (=> start!28082 (array_inv!4812 a!3312)))

(declare-fun b!287765 () Bool)

(declare-fun res!149532 () Bool)

(assert (=> b!287765 (=> (not res!149532) (not e!182229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14441 (_ BitVec 32)) Bool)

(assert (=> b!287765 (= res!149532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287766 () Bool)

(declare-fun res!149527 () Bool)

(assert (=> b!287766 (=> (not res!149527) (not e!182230))))

(declare-fun arrayContainsKey!0 (array!14441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287766 (= res!149527 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287767 () Bool)

(declare-fun res!149529 () Bool)

(assert (=> b!287767 (=> (not res!149529) (not e!182230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287767 (= res!149529 (validKeyInArray!0 k0!2524))))

(declare-fun b!287768 () Bool)

(declare-fun res!149531 () Bool)

(assert (=> b!287768 (=> (not res!149531) (not e!182230))))

(assert (=> b!287768 (= res!149531 (and (= (size!7201 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7201 a!3312))))))

(assert (= (and start!28082 res!149528) b!287768))

(assert (= (and b!287768 res!149531) b!287767))

(assert (= (and b!287767 res!149529) b!287766))

(assert (= (and b!287766 res!149527) b!287763))

(assert (= (and b!287763 res!149530) b!287765))

(assert (= (and b!287765 res!149532) b!287764))

(declare-fun m!302093 () Bool)

(assert (=> b!287764 m!302093))

(declare-fun m!302095 () Bool)

(assert (=> b!287764 m!302095))

(declare-fun m!302097 () Bool)

(assert (=> b!287764 m!302097))

(declare-fun m!302099 () Bool)

(assert (=> b!287764 m!302099))

(declare-fun m!302101 () Bool)

(assert (=> start!28082 m!302101))

(declare-fun m!302103 () Bool)

(assert (=> start!28082 m!302103))

(declare-fun m!302105 () Bool)

(assert (=> b!287765 m!302105))

(declare-fun m!302107 () Bool)

(assert (=> b!287763 m!302107))

(declare-fun m!302109 () Bool)

(assert (=> b!287767 m!302109))

(declare-fun m!302111 () Bool)

(assert (=> b!287766 m!302111))

(check-sat (not b!287767) (not b!287765) (not b!287763) (not b!287764) (not start!28082) (not b!287766))
(check-sat)
