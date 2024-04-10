; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29896 () Bool)

(assert start!29896)

(declare-fun b!300573 () Bool)

(declare-fun res!158465 () Bool)

(declare-fun e!189790 () Bool)

(assert (=> b!300573 (=> (not res!158465) (not e!189790))))

(declare-datatypes ((array!15174 0))(
  ( (array!15175 (arr!7181 (Array (_ BitVec 32) (_ BitVec 64))) (size!7533 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15174)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15174 (_ BitVec 32)) Bool)

(assert (=> b!300573 (= res!158465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300575 () Bool)

(declare-fun res!158466 () Bool)

(declare-fun e!189788 () Bool)

(assert (=> b!300575 (=> (not res!158466) (not e!189788))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300575 (= res!158466 (and (= (size!7533 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7533 a!3312))))))

(declare-fun b!300576 () Bool)

(declare-fun res!158464 () Bool)

(assert (=> b!300576 (=> (not res!158464) (not e!189788))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300576 (= res!158464 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158468 () Bool)

(assert (=> start!29896 (=> (not res!158468) (not e!189788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29896 (= res!158468 (validMask!0 mask!3809))))

(assert (=> start!29896 e!189788))

(assert (=> start!29896 true))

(declare-fun array_inv!5144 (array!15174) Bool)

(assert (=> start!29896 (array_inv!5144 a!3312)))

(declare-fun b!300574 () Bool)

(assert (=> b!300574 (= e!189790 false)))

(declare-datatypes ((SeekEntryResult!2330 0))(
  ( (MissingZero!2330 (index!11496 (_ BitVec 32))) (Found!2330 (index!11497 (_ BitVec 32))) (Intermediate!2330 (undefined!3142 Bool) (index!11498 (_ BitVec 32)) (x!29756 (_ BitVec 32))) (Undefined!2330) (MissingVacant!2330 (index!11499 (_ BitVec 32))) )
))
(declare-fun lt!149524 () SeekEntryResult!2330)

(declare-fun lt!149523 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15174 (_ BitVec 32)) SeekEntryResult!2330)

(assert (=> b!300574 (= lt!149524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149523 k!2524 (array!15175 (store (arr!7181 a!3312) i!1256 k!2524) (size!7533 a!3312)) mask!3809))))

(declare-fun lt!149525 () SeekEntryResult!2330)

(assert (=> b!300574 (= lt!149525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149523 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300574 (= lt!149523 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300577 () Bool)

(declare-fun res!158467 () Bool)

(assert (=> b!300577 (=> (not res!158467) (not e!189788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300577 (= res!158467 (validKeyInArray!0 k!2524))))

(declare-fun b!300578 () Bool)

(assert (=> b!300578 (= e!189788 e!189790)))

(declare-fun res!158469 () Bool)

(assert (=> b!300578 (=> (not res!158469) (not e!189790))))

(declare-fun lt!149526 () SeekEntryResult!2330)

(assert (=> b!300578 (= res!158469 (or (= lt!149526 (MissingZero!2330 i!1256)) (= lt!149526 (MissingVacant!2330 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15174 (_ BitVec 32)) SeekEntryResult!2330)

(assert (=> b!300578 (= lt!149526 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29896 res!158468) b!300575))

(assert (= (and b!300575 res!158466) b!300577))

(assert (= (and b!300577 res!158467) b!300576))

(assert (= (and b!300576 res!158464) b!300578))

(assert (= (and b!300578 res!158469) b!300573))

(assert (= (and b!300573 res!158465) b!300574))

(declare-fun m!312549 () Bool)

(assert (=> b!300578 m!312549))

(declare-fun m!312551 () Bool)

(assert (=> start!29896 m!312551))

(declare-fun m!312553 () Bool)

(assert (=> start!29896 m!312553))

(declare-fun m!312555 () Bool)

(assert (=> b!300577 m!312555))

(declare-fun m!312557 () Bool)

(assert (=> b!300576 m!312557))

(declare-fun m!312559 () Bool)

(assert (=> b!300573 m!312559))

(declare-fun m!312561 () Bool)

(assert (=> b!300574 m!312561))

(declare-fun m!312563 () Bool)

(assert (=> b!300574 m!312563))

(declare-fun m!312565 () Bool)

(assert (=> b!300574 m!312565))

(declare-fun m!312567 () Bool)

(assert (=> b!300574 m!312567))

(push 1)

