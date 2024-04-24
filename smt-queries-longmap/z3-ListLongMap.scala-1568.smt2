; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29878 () Bool)

(assert start!29878)

(declare-fun b!300520 () Bool)

(declare-fun e!189754 () Bool)

(declare-fun e!189756 () Bool)

(assert (=> b!300520 (= e!189754 e!189756)))

(declare-fun res!158461 () Bool)

(assert (=> b!300520 (=> (not res!158461) (not e!189756))))

(declare-datatypes ((SeekEntryResult!2294 0))(
  ( (MissingZero!2294 (index!11352 (_ BitVec 32))) (Found!2294 (index!11353 (_ BitVec 32))) (Intermediate!2294 (undefined!3106 Bool) (index!11354 (_ BitVec 32)) (x!29717 (_ BitVec 32))) (Undefined!2294) (MissingVacant!2294 (index!11355 (_ BitVec 32))) )
))
(declare-fun lt!149544 () SeekEntryResult!2294)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300520 (= res!158461 (or (= lt!149544 (MissingZero!2294 i!1256)) (= lt!149544 (MissingVacant!2294 i!1256))))))

(declare-datatypes ((array!15171 0))(
  ( (array!15172 (arr!7180 (Array (_ BitVec 32) (_ BitVec 64))) (size!7532 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15171)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15171 (_ BitVec 32)) SeekEntryResult!2294)

(assert (=> b!300520 (= lt!149544 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300521 () Bool)

(declare-fun res!158466 () Bool)

(assert (=> b!300521 (=> (not res!158466) (not e!189754))))

(declare-fun arrayContainsKey!0 (array!15171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300521 (= res!158466 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300522 () Bool)

(declare-fun res!158462 () Bool)

(assert (=> b!300522 (=> (not res!158462) (not e!189754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300522 (= res!158462 (validKeyInArray!0 k0!2524))))

(declare-fun b!300523 () Bool)

(assert (=> b!300523 (= e!189756 false)))

(declare-fun lt!149543 () SeekEntryResult!2294)

(declare-fun lt!149542 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15171 (_ BitVec 32)) SeekEntryResult!2294)

(assert (=> b!300523 (= lt!149543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149542 k0!2524 (array!15172 (store (arr!7180 a!3312) i!1256 k0!2524) (size!7532 a!3312)) mask!3809))))

(declare-fun lt!149541 () SeekEntryResult!2294)

(assert (=> b!300523 (= lt!149541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149542 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300523 (= lt!149542 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300524 () Bool)

(declare-fun res!158464 () Bool)

(assert (=> b!300524 (=> (not res!158464) (not e!189756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15171 (_ BitVec 32)) Bool)

(assert (=> b!300524 (= res!158464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300525 () Bool)

(declare-fun res!158465 () Bool)

(assert (=> b!300525 (=> (not res!158465) (not e!189754))))

(assert (=> b!300525 (= res!158465 (and (= (size!7532 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7532 a!3312))))))

(declare-fun res!158463 () Bool)

(assert (=> start!29878 (=> (not res!158463) (not e!189754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29878 (= res!158463 (validMask!0 mask!3809))))

(assert (=> start!29878 e!189754))

(assert (=> start!29878 true))

(declare-fun array_inv!5130 (array!15171) Bool)

(assert (=> start!29878 (array_inv!5130 a!3312)))

(assert (= (and start!29878 res!158463) b!300525))

(assert (= (and b!300525 res!158465) b!300522))

(assert (= (and b!300522 res!158462) b!300521))

(assert (= (and b!300521 res!158466) b!300520))

(assert (= (and b!300520 res!158461) b!300524))

(assert (= (and b!300524 res!158464) b!300523))

(declare-fun m!312651 () Bool)

(assert (=> b!300524 m!312651))

(declare-fun m!312653 () Bool)

(assert (=> b!300521 m!312653))

(declare-fun m!312655 () Bool)

(assert (=> start!29878 m!312655))

(declare-fun m!312657 () Bool)

(assert (=> start!29878 m!312657))

(declare-fun m!312659 () Bool)

(assert (=> b!300520 m!312659))

(declare-fun m!312661 () Bool)

(assert (=> b!300523 m!312661))

(declare-fun m!312663 () Bool)

(assert (=> b!300523 m!312663))

(declare-fun m!312665 () Bool)

(assert (=> b!300523 m!312665))

(declare-fun m!312667 () Bool)

(assert (=> b!300523 m!312667))

(declare-fun m!312669 () Bool)

(assert (=> b!300522 m!312669))

(check-sat (not b!300520) (not b!300524) (not start!29878) (not b!300522) (not b!300523) (not b!300521))
(check-sat)
