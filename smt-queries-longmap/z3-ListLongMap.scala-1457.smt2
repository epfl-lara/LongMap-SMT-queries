; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28072 () Bool)

(assert start!28072)

(declare-fun b!287792 () Bool)

(declare-fun res!149533 () Bool)

(declare-fun e!182244 () Bool)

(assert (=> b!287792 (=> (not res!149533) (not e!182244))))

(declare-datatypes ((array!14436 0))(
  ( (array!14437 (arr!6847 (Array (_ BitVec 32) (_ BitVec 64))) (size!7199 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14436)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14436 (_ BitVec 32)) Bool)

(assert (=> b!287792 (= res!149533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287794 () Bool)

(declare-fun res!149531 () Bool)

(declare-fun e!182246 () Bool)

(assert (=> b!287794 (=> (not res!149531) (not e!182246))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287794 (= res!149531 (and (= (size!7199 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7199 a!3312))))))

(declare-fun b!287795 () Bool)

(assert (=> b!287795 (= e!182244 false)))

(declare-datatypes ((SeekEntryResult!1961 0))(
  ( (MissingZero!1961 (index!10014 (_ BitVec 32))) (Found!1961 (index!10015 (_ BitVec 32))) (Intermediate!1961 (undefined!2773 Bool) (index!10016 (_ BitVec 32)) (x!28344 (_ BitVec 32))) (Undefined!1961) (MissingVacant!1961 (index!10017 (_ BitVec 32))) )
))
(declare-fun lt!141703 () SeekEntryResult!1961)

(declare-fun lt!141702 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14436 (_ BitVec 32)) SeekEntryResult!1961)

(assert (=> b!287795 (= lt!141703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141702 k0!2524 (array!14437 (store (arr!6847 a!3312) i!1256 k0!2524) (size!7199 a!3312)) mask!3809))))

(declare-fun lt!141705 () SeekEntryResult!1961)

(assert (=> b!287795 (= lt!141705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141702 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287795 (= lt!141702 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287796 () Bool)

(declare-fun res!149530 () Bool)

(assert (=> b!287796 (=> (not res!149530) (not e!182246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287796 (= res!149530 (validKeyInArray!0 k0!2524))))

(declare-fun b!287797 () Bool)

(assert (=> b!287797 (= e!182246 e!182244)))

(declare-fun res!149535 () Bool)

(assert (=> b!287797 (=> (not res!149535) (not e!182244))))

(declare-fun lt!141704 () SeekEntryResult!1961)

(assert (=> b!287797 (= res!149535 (or (= lt!141704 (MissingZero!1961 i!1256)) (= lt!141704 (MissingVacant!1961 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14436 (_ BitVec 32)) SeekEntryResult!1961)

(assert (=> b!287797 (= lt!141704 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287793 () Bool)

(declare-fun res!149534 () Bool)

(assert (=> b!287793 (=> (not res!149534) (not e!182246))))

(declare-fun arrayContainsKey!0 (array!14436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287793 (= res!149534 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149532 () Bool)

(assert (=> start!28072 (=> (not res!149532) (not e!182246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28072 (= res!149532 (validMask!0 mask!3809))))

(assert (=> start!28072 e!182246))

(assert (=> start!28072 true))

(declare-fun array_inv!4797 (array!14436) Bool)

(assert (=> start!28072 (array_inv!4797 a!3312)))

(assert (= (and start!28072 res!149532) b!287794))

(assert (= (and b!287794 res!149531) b!287796))

(assert (= (and b!287796 res!149530) b!287793))

(assert (= (and b!287793 res!149534) b!287797))

(assert (= (and b!287797 res!149535) b!287792))

(assert (= (and b!287792 res!149533) b!287795))

(declare-fun m!302279 () Bool)

(assert (=> b!287793 m!302279))

(declare-fun m!302281 () Bool)

(assert (=> b!287797 m!302281))

(declare-fun m!302283 () Bool)

(assert (=> start!28072 m!302283))

(declare-fun m!302285 () Bool)

(assert (=> start!28072 m!302285))

(declare-fun m!302287 () Bool)

(assert (=> b!287796 m!302287))

(declare-fun m!302289 () Bool)

(assert (=> b!287792 m!302289))

(declare-fun m!302291 () Bool)

(assert (=> b!287795 m!302291))

(declare-fun m!302293 () Bool)

(assert (=> b!287795 m!302293))

(declare-fun m!302295 () Bool)

(assert (=> b!287795 m!302295))

(declare-fun m!302297 () Bool)

(assert (=> b!287795 m!302297))

(check-sat (not b!287795) (not b!287797) (not b!287792) (not b!287796) (not start!28072) (not b!287793))
(check-sat)
