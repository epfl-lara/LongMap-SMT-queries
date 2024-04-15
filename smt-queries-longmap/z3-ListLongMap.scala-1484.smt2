; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28286 () Bool)

(assert start!28286)

(declare-fun b!289758 () Bool)

(declare-fun e!183395 () Bool)

(assert (=> b!289758 (= e!183395 false)))

(declare-datatypes ((SeekEntryResult!2072 0))(
  ( (MissingZero!2072 (index!10458 (_ BitVec 32))) (Found!2072 (index!10459 (_ BitVec 32))) (Intermediate!2072 (undefined!2884 Bool) (index!10460 (_ BitVec 32)) (x!28676 (_ BitVec 32))) (Undefined!2072) (MissingVacant!2072 (index!10461 (_ BitVec 32))) )
))
(declare-fun lt!142956 () SeekEntryResult!2072)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142955 () (_ BitVec 32))

(declare-datatypes ((array!14593 0))(
  ( (array!14594 (arr!6924 (Array (_ BitVec 32) (_ BitVec 64))) (size!7277 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14593)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14593 (_ BitVec 32)) SeekEntryResult!2072)

(assert (=> b!289758 (= lt!142956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142955 k0!2524 (array!14594 (store (arr!6924 a!3312) i!1256 k0!2524) (size!7277 a!3312)) mask!3809))))

(declare-fun lt!142953 () SeekEntryResult!2072)

(assert (=> b!289758 (= lt!142953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142955 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289758 (= lt!142955 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289759 () Bool)

(declare-fun res!151291 () Bool)

(declare-fun e!183396 () Bool)

(assert (=> b!289759 (=> (not res!151291) (not e!183396))))

(assert (=> b!289759 (= res!151291 (and (= (size!7277 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7277 a!3312))))))

(declare-fun res!151293 () Bool)

(assert (=> start!28286 (=> (not res!151293) (not e!183396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28286 (= res!151293 (validMask!0 mask!3809))))

(assert (=> start!28286 e!183396))

(assert (=> start!28286 true))

(declare-fun array_inv!4896 (array!14593) Bool)

(assert (=> start!28286 (array_inv!4896 a!3312)))

(declare-fun b!289760 () Bool)

(declare-fun res!151290 () Bool)

(assert (=> b!289760 (=> (not res!151290) (not e!183395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14593 (_ BitVec 32)) Bool)

(assert (=> b!289760 (= res!151290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289761 () Bool)

(assert (=> b!289761 (= e!183396 e!183395)))

(declare-fun res!151292 () Bool)

(assert (=> b!289761 (=> (not res!151292) (not e!183395))))

(declare-fun lt!142954 () SeekEntryResult!2072)

(assert (=> b!289761 (= res!151292 (or (= lt!142954 (MissingZero!2072 i!1256)) (= lt!142954 (MissingVacant!2072 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14593 (_ BitVec 32)) SeekEntryResult!2072)

(assert (=> b!289761 (= lt!142954 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289762 () Bool)

(declare-fun res!151289 () Bool)

(assert (=> b!289762 (=> (not res!151289) (not e!183396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289762 (= res!151289 (validKeyInArray!0 k0!2524))))

(declare-fun b!289763 () Bool)

(declare-fun res!151294 () Bool)

(assert (=> b!289763 (=> (not res!151294) (not e!183396))))

(declare-fun arrayContainsKey!0 (array!14593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289763 (= res!151294 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28286 res!151293) b!289759))

(assert (= (and b!289759 res!151291) b!289762))

(assert (= (and b!289762 res!151289) b!289763))

(assert (= (and b!289763 res!151294) b!289761))

(assert (= (and b!289761 res!151292) b!289760))

(assert (= (and b!289760 res!151290) b!289758))

(declare-fun m!303395 () Bool)

(assert (=> b!289760 m!303395))

(declare-fun m!303397 () Bool)

(assert (=> b!289758 m!303397))

(declare-fun m!303399 () Bool)

(assert (=> b!289758 m!303399))

(declare-fun m!303401 () Bool)

(assert (=> b!289758 m!303401))

(declare-fun m!303403 () Bool)

(assert (=> b!289758 m!303403))

(declare-fun m!303405 () Bool)

(assert (=> b!289762 m!303405))

(declare-fun m!303407 () Bool)

(assert (=> b!289763 m!303407))

(declare-fun m!303409 () Bool)

(assert (=> start!28286 m!303409))

(declare-fun m!303411 () Bool)

(assert (=> start!28286 m!303411))

(declare-fun m!303413 () Bool)

(assert (=> b!289761 m!303413))

(check-sat (not start!28286) (not b!289760) (not b!289763) (not b!289758) (not b!289761) (not b!289762))
(check-sat)
