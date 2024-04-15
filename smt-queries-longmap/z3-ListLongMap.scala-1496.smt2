; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28406 () Bool)

(assert start!28406)

(declare-fun res!152127 () Bool)

(declare-fun e!183963 () Bool)

(assert (=> start!28406 (=> (not res!152127) (not e!183963))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28406 (= res!152127 (validMask!0 mask!3809))))

(assert (=> start!28406 e!183963))

(assert (=> start!28406 true))

(declare-datatypes ((array!14668 0))(
  ( (array!14669 (arr!6960 (Array (_ BitVec 32) (_ BitVec 64))) (size!7313 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14668)

(declare-fun array_inv!4932 (array!14668) Bool)

(assert (=> start!28406 (array_inv!4932 a!3312)))

(declare-fun b!290734 () Bool)

(declare-fun e!183966 () Bool)

(declare-fun e!183964 () Bool)

(assert (=> b!290734 (= e!183966 e!183964)))

(declare-fun res!152130 () Bool)

(assert (=> b!290734 (=> (not res!152130) (not e!183964))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143598 () Bool)

(declare-datatypes ((SeekEntryResult!2108 0))(
  ( (MissingZero!2108 (index!10602 (_ BitVec 32))) (Found!2108 (index!10603 (_ BitVec 32))) (Intermediate!2108 (undefined!2920 Bool) (index!10604 (_ BitVec 32)) (x!28814 (_ BitVec 32))) (Undefined!2108) (MissingVacant!2108 (index!10605 (_ BitVec 32))) )
))
(declare-fun lt!143594 () SeekEntryResult!2108)

(assert (=> b!290734 (= res!152130 (and (not lt!143598) (= lt!143594 (MissingVacant!2108 i!1256))))))

(declare-fun lt!143595 () (_ BitVec 32))

(declare-fun lt!143596 () SeekEntryResult!2108)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14668 (_ BitVec 32)) SeekEntryResult!2108)

(assert (=> b!290734 (= lt!143596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143595 k0!2524 (array!14669 (store (arr!6960 a!3312) i!1256 k0!2524) (size!7313 a!3312)) mask!3809))))

(declare-fun lt!143597 () SeekEntryResult!2108)

(assert (=> b!290734 (= lt!143597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143595 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290734 (= lt!143595 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290735 () Bool)

(assert (=> b!290735 (= e!183963 e!183966)))

(declare-fun res!152126 () Bool)

(assert (=> b!290735 (=> (not res!152126) (not e!183966))))

(assert (=> b!290735 (= res!152126 (or lt!143598 (= lt!143594 (MissingVacant!2108 i!1256))))))

(assert (=> b!290735 (= lt!143598 (= lt!143594 (MissingZero!2108 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14668 (_ BitVec 32)) SeekEntryResult!2108)

(assert (=> b!290735 (= lt!143594 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290736 () Bool)

(declare-fun res!152129 () Bool)

(assert (=> b!290736 (=> (not res!152129) (not e!183963))))

(declare-fun arrayContainsKey!0 (array!14668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290736 (= res!152129 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290737 () Bool)

(declare-fun res!152128 () Bool)

(assert (=> b!290737 (=> (not res!152128) (not e!183963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290737 (= res!152128 (validKeyInArray!0 k0!2524))))

(declare-fun b!290738 () Bool)

(declare-fun res!152131 () Bool)

(assert (=> b!290738 (=> (not res!152131) (not e!183966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14668 (_ BitVec 32)) Bool)

(assert (=> b!290738 (= res!152131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290739 () Bool)

(declare-fun e!183965 () Bool)

(assert (=> b!290739 (= e!183965 (not true))))

(assert (=> b!290739 (= (index!10604 lt!143597) i!1256)))

(declare-fun b!290740 () Bool)

(assert (=> b!290740 (= e!183964 e!183965)))

(declare-fun res!152124 () Bool)

(assert (=> b!290740 (=> (not res!152124) (not e!183965))))

(declare-fun lt!143593 () Bool)

(assert (=> b!290740 (= res!152124 (and (or lt!143593 (not (undefined!2920 lt!143597))) (not lt!143593) (= (select (arr!6960 a!3312) (index!10604 lt!143597)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290740 (= lt!143593 (not ((_ is Intermediate!2108) lt!143597)))))

(declare-fun b!290741 () Bool)

(declare-fun res!152125 () Bool)

(assert (=> b!290741 (=> (not res!152125) (not e!183963))))

(assert (=> b!290741 (= res!152125 (and (= (size!7313 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7313 a!3312))))))

(assert (= (and start!28406 res!152127) b!290741))

(assert (= (and b!290741 res!152125) b!290737))

(assert (= (and b!290737 res!152128) b!290736))

(assert (= (and b!290736 res!152129) b!290735))

(assert (= (and b!290735 res!152126) b!290738))

(assert (= (and b!290738 res!152131) b!290734))

(assert (= (and b!290734 res!152130) b!290740))

(assert (= (and b!290740 res!152124) b!290739))

(declare-fun m!304271 () Bool)

(assert (=> b!290740 m!304271))

(declare-fun m!304273 () Bool)

(assert (=> b!290736 m!304273))

(declare-fun m!304275 () Bool)

(assert (=> b!290737 m!304275))

(declare-fun m!304277 () Bool)

(assert (=> b!290738 m!304277))

(declare-fun m!304279 () Bool)

(assert (=> start!28406 m!304279))

(declare-fun m!304281 () Bool)

(assert (=> start!28406 m!304281))

(declare-fun m!304283 () Bool)

(assert (=> b!290734 m!304283))

(declare-fun m!304285 () Bool)

(assert (=> b!290734 m!304285))

(declare-fun m!304287 () Bool)

(assert (=> b!290734 m!304287))

(declare-fun m!304289 () Bool)

(assert (=> b!290734 m!304289))

(declare-fun m!304291 () Bool)

(assert (=> b!290735 m!304291))

(check-sat (not b!290735) (not b!290736) (not b!290738) (not b!290737) (not start!28406) (not b!290734))
(check-sat)
