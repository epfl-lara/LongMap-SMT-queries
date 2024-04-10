; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29892 () Bool)

(assert start!29892)

(declare-fun b!300537 () Bool)

(declare-fun e!189772 () Bool)

(assert (=> b!300537 (= e!189772 false)))

(declare-fun lt!149500 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15170 0))(
  ( (array!15171 (arr!7179 (Array (_ BitVec 32) (_ BitVec 64))) (size!7531 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15170)

(declare-datatypes ((SeekEntryResult!2328 0))(
  ( (MissingZero!2328 (index!11488 (_ BitVec 32))) (Found!2328 (index!11489 (_ BitVec 32))) (Intermediate!2328 (undefined!3140 Bool) (index!11490 (_ BitVec 32)) (x!29746 (_ BitVec 32))) (Undefined!2328) (MissingVacant!2328 (index!11491 (_ BitVec 32))) )
))
(declare-fun lt!149501 () SeekEntryResult!2328)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15170 (_ BitVec 32)) SeekEntryResult!2328)

(assert (=> b!300537 (= lt!149501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149500 k0!2524 (array!15171 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7531 a!3312)) mask!3809))))

(declare-fun lt!149499 () SeekEntryResult!2328)

(assert (=> b!300537 (= lt!149499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149500 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300537 (= lt!149500 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300538 () Bool)

(declare-fun e!189771 () Bool)

(assert (=> b!300538 (= e!189771 e!189772)))

(declare-fun res!158432 () Bool)

(assert (=> b!300538 (=> (not res!158432) (not e!189772))))

(declare-fun lt!149502 () SeekEntryResult!2328)

(assert (=> b!300538 (= res!158432 (or (= lt!149502 (MissingZero!2328 i!1256)) (= lt!149502 (MissingVacant!2328 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15170 (_ BitVec 32)) SeekEntryResult!2328)

(assert (=> b!300538 (= lt!149502 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300539 () Bool)

(declare-fun res!158433 () Bool)

(assert (=> b!300539 (=> (not res!158433) (not e!189771))))

(declare-fun arrayContainsKey!0 (array!15170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300539 (= res!158433 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300540 () Bool)

(declare-fun res!158430 () Bool)

(assert (=> b!300540 (=> (not res!158430) (not e!189772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15170 (_ BitVec 32)) Bool)

(assert (=> b!300540 (= res!158430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!158431 () Bool)

(assert (=> start!29892 (=> (not res!158431) (not e!189771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29892 (= res!158431 (validMask!0 mask!3809))))

(assert (=> start!29892 e!189771))

(assert (=> start!29892 true))

(declare-fun array_inv!5142 (array!15170) Bool)

(assert (=> start!29892 (array_inv!5142 a!3312)))

(declare-fun b!300541 () Bool)

(declare-fun res!158428 () Bool)

(assert (=> b!300541 (=> (not res!158428) (not e!189771))))

(assert (=> b!300541 (= res!158428 (and (= (size!7531 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7531 a!3312))))))

(declare-fun b!300542 () Bool)

(declare-fun res!158429 () Bool)

(assert (=> b!300542 (=> (not res!158429) (not e!189771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300542 (= res!158429 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29892 res!158431) b!300541))

(assert (= (and b!300541 res!158428) b!300542))

(assert (= (and b!300542 res!158429) b!300539))

(assert (= (and b!300539 res!158433) b!300538))

(assert (= (and b!300538 res!158432) b!300540))

(assert (= (and b!300540 res!158430) b!300537))

(declare-fun m!312509 () Bool)

(assert (=> start!29892 m!312509))

(declare-fun m!312511 () Bool)

(assert (=> start!29892 m!312511))

(declare-fun m!312513 () Bool)

(assert (=> b!300540 m!312513))

(declare-fun m!312515 () Bool)

(assert (=> b!300538 m!312515))

(declare-fun m!312517 () Bool)

(assert (=> b!300539 m!312517))

(declare-fun m!312519 () Bool)

(assert (=> b!300542 m!312519))

(declare-fun m!312521 () Bool)

(assert (=> b!300537 m!312521))

(declare-fun m!312523 () Bool)

(assert (=> b!300537 m!312523))

(declare-fun m!312525 () Bool)

(assert (=> b!300537 m!312525))

(declare-fun m!312527 () Bool)

(assert (=> b!300537 m!312527))

(check-sat (not b!300539) (not start!29892) (not b!300538) (not b!300542) (not b!300540) (not b!300537))
(check-sat)
