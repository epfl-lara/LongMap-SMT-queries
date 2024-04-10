; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28286 () Bool)

(assert start!28286)

(declare-fun b!289869 () Bool)

(declare-fun res!151353 () Bool)

(declare-fun e!183479 () Bool)

(assert (=> b!289869 (=> (not res!151353) (not e!183479))))

(declare-datatypes ((array!14600 0))(
  ( (array!14601 (arr!6927 (Array (_ BitVec 32) (_ BitVec 64))) (size!7279 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14600)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289869 (= res!151353 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289870 () Bool)

(declare-fun e!183478 () Bool)

(assert (=> b!289870 (= e!183479 e!183478)))

(declare-fun res!151348 () Bool)

(assert (=> b!289870 (=> (not res!151348) (not e!183478))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2076 0))(
  ( (MissingZero!2076 (index!10474 (_ BitVec 32))) (Found!2076 (index!10475 (_ BitVec 32))) (Intermediate!2076 (undefined!2888 Bool) (index!10476 (_ BitVec 32)) (x!28673 (_ BitVec 32))) (Undefined!2076) (MissingVacant!2076 (index!10477 (_ BitVec 32))) )
))
(declare-fun lt!143109 () SeekEntryResult!2076)

(declare-fun lt!143110 () Bool)

(assert (=> b!289870 (= res!151348 (or lt!143110 (= lt!143109 (MissingVacant!2076 i!1256))))))

(assert (=> b!289870 (= lt!143110 (= lt!143109 (MissingZero!2076 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14600 (_ BitVec 32)) SeekEntryResult!2076)

(assert (=> b!289870 (= lt!143109 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289871 () Bool)

(declare-fun res!151351 () Bool)

(assert (=> b!289871 (=> (not res!151351) (not e!183478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14600 (_ BitVec 32)) Bool)

(assert (=> b!289871 (= res!151351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289873 () Bool)

(declare-fun res!151349 () Bool)

(assert (=> b!289873 (=> (not res!151349) (not e!183479))))

(assert (=> b!289873 (= res!151349 (and (= (size!7279 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7279 a!3312))))))

(declare-fun b!289874 () Bool)

(declare-fun res!151352 () Bool)

(assert (=> b!289874 (=> (not res!151352) (not e!183479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289874 (= res!151352 (validKeyInArray!0 k0!2524))))

(declare-fun b!289872 () Bool)

(assert (=> b!289872 (= e!183478 (and (not lt!143110) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!143108 () (_ BitVec 32))

(declare-fun lt!143106 () SeekEntryResult!2076)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14600 (_ BitVec 32)) SeekEntryResult!2076)

(assert (=> b!289872 (= lt!143106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143108 k0!2524 (array!14601 (store (arr!6927 a!3312) i!1256 k0!2524) (size!7279 a!3312)) mask!3809))))

(declare-fun lt!143107 () SeekEntryResult!2076)

(assert (=> b!289872 (= lt!143107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143108 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289872 (= lt!143108 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151350 () Bool)

(assert (=> start!28286 (=> (not res!151350) (not e!183479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28286 (= res!151350 (validMask!0 mask!3809))))

(assert (=> start!28286 e!183479))

(assert (=> start!28286 true))

(declare-fun array_inv!4890 (array!14600) Bool)

(assert (=> start!28286 (array_inv!4890 a!3312)))

(assert (= (and start!28286 res!151350) b!289873))

(assert (= (and b!289873 res!151349) b!289874))

(assert (= (and b!289874 res!151352) b!289869))

(assert (= (and b!289869 res!151353) b!289870))

(assert (= (and b!289870 res!151348) b!289871))

(assert (= (and b!289871 res!151351) b!289872))

(declare-fun m!303947 () Bool)

(assert (=> b!289872 m!303947))

(declare-fun m!303949 () Bool)

(assert (=> b!289872 m!303949))

(declare-fun m!303951 () Bool)

(assert (=> b!289872 m!303951))

(declare-fun m!303953 () Bool)

(assert (=> b!289872 m!303953))

(declare-fun m!303955 () Bool)

(assert (=> b!289871 m!303955))

(declare-fun m!303957 () Bool)

(assert (=> start!28286 m!303957))

(declare-fun m!303959 () Bool)

(assert (=> start!28286 m!303959))

(declare-fun m!303961 () Bool)

(assert (=> b!289870 m!303961))

(declare-fun m!303963 () Bool)

(assert (=> b!289869 m!303963))

(declare-fun m!303965 () Bool)

(assert (=> b!289874 m!303965))

(check-sat (not b!289872) (not b!289871) (not start!28286) (not b!289874) (not b!289869) (not b!289870))
(check-sat)
