; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28298 () Bool)

(assert start!28298)

(declare-fun b!289866 () Bool)

(declare-fun e!183450 () Bool)

(declare-fun e!183448 () Bool)

(assert (=> b!289866 (= e!183450 e!183448)))

(declare-fun res!151398 () Bool)

(assert (=> b!289866 (=> (not res!151398) (not e!183448))))

(declare-datatypes ((SeekEntryResult!2078 0))(
  ( (MissingZero!2078 (index!10482 (_ BitVec 32))) (Found!2078 (index!10483 (_ BitVec 32))) (Intermediate!2078 (undefined!2890 Bool) (index!10484 (_ BitVec 32)) (x!28698 (_ BitVec 32))) (Undefined!2078) (MissingVacant!2078 (index!10485 (_ BitVec 32))) )
))
(declare-fun lt!143026 () SeekEntryResult!2078)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289866 (= res!151398 (or (= lt!143026 (MissingZero!2078 i!1256)) (= lt!143026 (MissingVacant!2078 i!1256))))))

(declare-datatypes ((array!14605 0))(
  ( (array!14606 (arr!6930 (Array (_ BitVec 32) (_ BitVec 64))) (size!7283 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14605)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14605 (_ BitVec 32)) SeekEntryResult!2078)

(assert (=> b!289866 (= lt!143026 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289867 () Bool)

(declare-fun res!151399 () Bool)

(assert (=> b!289867 (=> (not res!151399) (not e!183450))))

(assert (=> b!289867 (= res!151399 (and (= (size!7283 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7283 a!3312))))))

(declare-fun b!289868 () Bool)

(declare-fun res!151401 () Bool)

(assert (=> b!289868 (=> (not res!151401) (not e!183450))))

(declare-fun arrayContainsKey!0 (array!14605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289868 (= res!151401 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289869 () Bool)

(assert (=> b!289869 (= e!183448 false)))

(declare-fun lt!143027 () SeekEntryResult!2078)

(declare-fun lt!143025 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14605 (_ BitVec 32)) SeekEntryResult!2078)

(assert (=> b!289869 (= lt!143027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143025 k0!2524 (array!14606 (store (arr!6930 a!3312) i!1256 k0!2524) (size!7283 a!3312)) mask!3809))))

(declare-fun lt!143028 () SeekEntryResult!2078)

(assert (=> b!289869 (= lt!143028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143025 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289869 (= lt!143025 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289870 () Bool)

(declare-fun res!151402 () Bool)

(assert (=> b!289870 (=> (not res!151402) (not e!183448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14605 (_ BitVec 32)) Bool)

(assert (=> b!289870 (= res!151402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289871 () Bool)

(declare-fun res!151400 () Bool)

(assert (=> b!289871 (=> (not res!151400) (not e!183450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289871 (= res!151400 (validKeyInArray!0 k0!2524))))

(declare-fun res!151397 () Bool)

(assert (=> start!28298 (=> (not res!151397) (not e!183450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28298 (= res!151397 (validMask!0 mask!3809))))

(assert (=> start!28298 e!183450))

(assert (=> start!28298 true))

(declare-fun array_inv!4902 (array!14605) Bool)

(assert (=> start!28298 (array_inv!4902 a!3312)))

(assert (= (and start!28298 res!151397) b!289867))

(assert (= (and b!289867 res!151399) b!289871))

(assert (= (and b!289871 res!151400) b!289868))

(assert (= (and b!289868 res!151401) b!289866))

(assert (= (and b!289866 res!151398) b!289870))

(assert (= (and b!289870 res!151402) b!289869))

(declare-fun m!303515 () Bool)

(assert (=> b!289871 m!303515))

(declare-fun m!303517 () Bool)

(assert (=> b!289870 m!303517))

(declare-fun m!303519 () Bool)

(assert (=> b!289869 m!303519))

(declare-fun m!303521 () Bool)

(assert (=> b!289869 m!303521))

(declare-fun m!303523 () Bool)

(assert (=> b!289869 m!303523))

(declare-fun m!303525 () Bool)

(assert (=> b!289869 m!303525))

(declare-fun m!303527 () Bool)

(assert (=> start!28298 m!303527))

(declare-fun m!303529 () Bool)

(assert (=> start!28298 m!303529))

(declare-fun m!303531 () Bool)

(assert (=> b!289866 m!303531))

(declare-fun m!303533 () Bool)

(assert (=> b!289868 m!303533))

(check-sat (not start!28298) (not b!289868) (not b!289869) (not b!289871) (not b!289870) (not b!289866))
(check-sat)
