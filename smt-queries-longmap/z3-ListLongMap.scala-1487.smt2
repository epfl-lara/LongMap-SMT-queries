; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28300 () Bool)

(assert start!28300)

(declare-fun b!290114 () Bool)

(declare-fun res!151571 () Bool)

(declare-fun e!183601 () Bool)

(assert (=> b!290114 (=> (not res!151571) (not e!183601))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290114 (= res!151571 (validKeyInArray!0 k0!2524))))

(declare-fun res!151568 () Bool)

(assert (=> start!28300 (=> (not res!151568) (not e!183601))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28300 (= res!151568 (validMask!0 mask!3809))))

(assert (=> start!28300 e!183601))

(assert (=> start!28300 true))

(declare-datatypes ((array!14619 0))(
  ( (array!14620 (arr!6937 (Array (_ BitVec 32) (_ BitVec 64))) (size!7289 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14619)

(declare-fun array_inv!4887 (array!14619) Bool)

(assert (=> start!28300 (array_inv!4887 a!3312)))

(declare-fun b!290115 () Bool)

(declare-fun e!183600 () Bool)

(assert (=> b!290115 (= e!183600 false)))

(declare-datatypes ((SeekEntryResult!2051 0))(
  ( (MissingZero!2051 (index!10374 (_ BitVec 32))) (Found!2051 (index!10375 (_ BitVec 32))) (Intermediate!2051 (undefined!2863 Bool) (index!10376 (_ BitVec 32)) (x!28680 (_ BitVec 32))) (Undefined!2051) (MissingVacant!2051 (index!10377 (_ BitVec 32))) )
))
(declare-fun lt!143302 () SeekEntryResult!2051)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143304 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14619 (_ BitVec 32)) SeekEntryResult!2051)

(assert (=> b!290115 (= lt!143302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143304 k0!2524 (array!14620 (store (arr!6937 a!3312) i!1256 k0!2524) (size!7289 a!3312)) mask!3809))))

(declare-fun lt!143301 () SeekEntryResult!2051)

(assert (=> b!290115 (= lt!143301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143304 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290115 (= lt!143304 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290116 () Bool)

(assert (=> b!290116 (= e!183601 e!183600)))

(declare-fun res!151572 () Bool)

(assert (=> b!290116 (=> (not res!151572) (not e!183600))))

(declare-fun lt!143303 () SeekEntryResult!2051)

(assert (=> b!290116 (= res!151572 (or (= lt!143303 (MissingZero!2051 i!1256)) (= lt!143303 (MissingVacant!2051 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14619 (_ BitVec 32)) SeekEntryResult!2051)

(assert (=> b!290116 (= lt!143303 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290117 () Bool)

(declare-fun res!151570 () Bool)

(assert (=> b!290117 (=> (not res!151570) (not e!183600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14619 (_ BitVec 32)) Bool)

(assert (=> b!290117 (= res!151570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290118 () Bool)

(declare-fun res!151567 () Bool)

(assert (=> b!290118 (=> (not res!151567) (not e!183601))))

(declare-fun arrayContainsKey!0 (array!14619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290118 (= res!151567 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290119 () Bool)

(declare-fun res!151569 () Bool)

(assert (=> b!290119 (=> (not res!151569) (not e!183601))))

(assert (=> b!290119 (= res!151569 (and (= (size!7289 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7289 a!3312))))))

(assert (= (and start!28300 res!151568) b!290119))

(assert (= (and b!290119 res!151569) b!290114))

(assert (= (and b!290114 res!151571) b!290118))

(assert (= (and b!290118 res!151567) b!290116))

(assert (= (and b!290116 res!151572) b!290117))

(assert (= (and b!290117 res!151570) b!290115))

(declare-fun m!304373 () Bool)

(assert (=> b!290114 m!304373))

(declare-fun m!304375 () Bool)

(assert (=> b!290117 m!304375))

(declare-fun m!304377 () Bool)

(assert (=> b!290115 m!304377))

(declare-fun m!304379 () Bool)

(assert (=> b!290115 m!304379))

(declare-fun m!304381 () Bool)

(assert (=> b!290115 m!304381))

(declare-fun m!304383 () Bool)

(assert (=> b!290115 m!304383))

(declare-fun m!304385 () Bool)

(assert (=> b!290118 m!304385))

(declare-fun m!304387 () Bool)

(assert (=> b!290116 m!304387))

(declare-fun m!304389 () Bool)

(assert (=> start!28300 m!304389))

(declare-fun m!304391 () Bool)

(assert (=> start!28300 m!304391))

(check-sat (not b!290114) (not b!290117) (not b!290118) (not b!290115) (not b!290116) (not start!28300))
(check-sat)
