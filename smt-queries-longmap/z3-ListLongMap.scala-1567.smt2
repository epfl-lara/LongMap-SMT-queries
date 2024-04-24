; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29872 () Bool)

(assert start!29872)

(declare-fun b!300466 () Bool)

(declare-fun res!158411 () Bool)

(declare-fun e!189727 () Bool)

(assert (=> b!300466 (=> (not res!158411) (not e!189727))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300466 (= res!158411 (validKeyInArray!0 k0!2524))))

(declare-fun b!300467 () Bool)

(declare-fun e!189729 () Bool)

(assert (=> b!300467 (= e!189729 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2291 0))(
  ( (MissingZero!2291 (index!11340 (_ BitVec 32))) (Found!2291 (index!11341 (_ BitVec 32))) (Intermediate!2291 (undefined!3103 Bool) (index!11342 (_ BitVec 32)) (x!29706 (_ BitVec 32))) (Undefined!2291) (MissingVacant!2291 (index!11343 (_ BitVec 32))) )
))
(declare-fun lt!149505 () SeekEntryResult!2291)

(declare-datatypes ((array!15165 0))(
  ( (array!15166 (arr!7177 (Array (_ BitVec 32) (_ BitVec 64))) (size!7529 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15165)

(declare-fun lt!149506 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15165 (_ BitVec 32)) SeekEntryResult!2291)

(assert (=> b!300467 (= lt!149505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149506 k0!2524 (array!15166 (store (arr!7177 a!3312) i!1256 k0!2524) (size!7529 a!3312)) mask!3809))))

(declare-fun lt!149507 () SeekEntryResult!2291)

(assert (=> b!300467 (= lt!149507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149506 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300467 (= lt!149506 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!158408 () Bool)

(assert (=> start!29872 (=> (not res!158408) (not e!189727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29872 (= res!158408 (validMask!0 mask!3809))))

(assert (=> start!29872 e!189727))

(assert (=> start!29872 true))

(declare-fun array_inv!5127 (array!15165) Bool)

(assert (=> start!29872 (array_inv!5127 a!3312)))

(declare-fun b!300468 () Bool)

(declare-fun res!158407 () Bool)

(assert (=> b!300468 (=> (not res!158407) (not e!189727))))

(declare-fun arrayContainsKey!0 (array!15165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300468 (= res!158407 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300469 () Bool)

(assert (=> b!300469 (= e!189727 e!189729)))

(declare-fun res!158410 () Bool)

(assert (=> b!300469 (=> (not res!158410) (not e!189729))))

(declare-fun lt!149508 () SeekEntryResult!2291)

(assert (=> b!300469 (= res!158410 (or (= lt!149508 (MissingZero!2291 i!1256)) (= lt!149508 (MissingVacant!2291 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15165 (_ BitVec 32)) SeekEntryResult!2291)

(assert (=> b!300469 (= lt!149508 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300470 () Bool)

(declare-fun res!158409 () Bool)

(assert (=> b!300470 (=> (not res!158409) (not e!189727))))

(assert (=> b!300470 (= res!158409 (and (= (size!7529 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7529 a!3312))))))

(declare-fun b!300471 () Bool)

(declare-fun res!158412 () Bool)

(assert (=> b!300471 (=> (not res!158412) (not e!189729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15165 (_ BitVec 32)) Bool)

(assert (=> b!300471 (= res!158412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29872 res!158408) b!300470))

(assert (= (and b!300470 res!158409) b!300466))

(assert (= (and b!300466 res!158411) b!300468))

(assert (= (and b!300468 res!158407) b!300469))

(assert (= (and b!300469 res!158410) b!300471))

(assert (= (and b!300471 res!158412) b!300467))

(declare-fun m!312591 () Bool)

(assert (=> b!300466 m!312591))

(declare-fun m!312593 () Bool)

(assert (=> start!29872 m!312593))

(declare-fun m!312595 () Bool)

(assert (=> start!29872 m!312595))

(declare-fun m!312597 () Bool)

(assert (=> b!300468 m!312597))

(declare-fun m!312599 () Bool)

(assert (=> b!300471 m!312599))

(declare-fun m!312601 () Bool)

(assert (=> b!300469 m!312601))

(declare-fun m!312603 () Bool)

(assert (=> b!300467 m!312603))

(declare-fun m!312605 () Bool)

(assert (=> b!300467 m!312605))

(declare-fun m!312607 () Bool)

(assert (=> b!300467 m!312607))

(declare-fun m!312609 () Bool)

(assert (=> b!300467 m!312609))

(check-sat (not b!300467) (not b!300469) (not b!300468) (not b!300466) (not b!300471) (not start!29872))
(check-sat)
