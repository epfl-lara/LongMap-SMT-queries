; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29806 () Bool)

(assert start!29806)

(declare-fun b!299866 () Bool)

(declare-fun e!189373 () Bool)

(declare-fun e!189374 () Bool)

(assert (=> b!299866 (= e!189373 e!189374)))

(declare-fun res!158045 () Bool)

(assert (=> b!299866 (=> (not res!158045) (not e!189374))))

(declare-datatypes ((SeekEntryResult!2312 0))(
  ( (MissingZero!2312 (index!11424 (_ BitVec 32))) (Found!2312 (index!11425 (_ BitVec 32))) (Intermediate!2312 (undefined!3124 Bool) (index!11426 (_ BitVec 32)) (x!29695 (_ BitVec 32))) (Undefined!2312) (MissingVacant!2312 (index!11427 (_ BitVec 32))) )
))
(declare-fun lt!149040 () SeekEntryResult!2312)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!299866 (= res!158045 (or (= lt!149040 (MissingZero!2312 i!1256)) (= lt!149040 (MissingVacant!2312 i!1256))))))

(declare-datatypes ((array!15136 0))(
  ( (array!15137 (arr!7164 (Array (_ BitVec 32) (_ BitVec 64))) (size!7517 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15136)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15136 (_ BitVec 32)) SeekEntryResult!2312)

(assert (=> b!299866 (= lt!149040 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299867 () Bool)

(declare-fun res!158046 () Bool)

(assert (=> b!299867 (=> (not res!158046) (not e!189373))))

(assert (=> b!299867 (= res!158046 (and (= (size!7517 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7517 a!3312))))))

(declare-fun b!299868 () Bool)

(declare-fun res!158049 () Bool)

(assert (=> b!299868 (=> (not res!158049) (not e!189373))))

(declare-fun arrayContainsKey!0 (array!15136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299868 (= res!158049 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158048 () Bool)

(assert (=> start!29806 (=> (not res!158048) (not e!189373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29806 (= res!158048 (validMask!0 mask!3809))))

(assert (=> start!29806 e!189373))

(assert (=> start!29806 true))

(declare-fun array_inv!5136 (array!15136) Bool)

(assert (=> start!29806 (array_inv!5136 a!3312)))

(declare-fun b!299869 () Bool)

(declare-fun res!158047 () Bool)

(assert (=> b!299869 (=> (not res!158047) (not e!189374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15136 (_ BitVec 32)) Bool)

(assert (=> b!299869 (= res!158047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299870 () Bool)

(declare-fun res!158044 () Bool)

(assert (=> b!299870 (=> (not res!158044) (not e!189373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299870 (= res!158044 (validKeyInArray!0 k0!2524))))

(declare-fun b!299871 () Bool)

(assert (=> b!299871 (= e!189374 false)))

(declare-fun lt!149042 () SeekEntryResult!2312)

(declare-fun lt!149039 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15136 (_ BitVec 32)) SeekEntryResult!2312)

(assert (=> b!299871 (= lt!149042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149039 k0!2524 (array!15137 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7517 a!3312)) mask!3809))))

(declare-fun lt!149041 () SeekEntryResult!2312)

(assert (=> b!299871 (= lt!149041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149039 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299871 (= lt!149039 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29806 res!158048) b!299867))

(assert (= (and b!299867 res!158046) b!299870))

(assert (= (and b!299870 res!158044) b!299868))

(assert (= (and b!299868 res!158049) b!299866))

(assert (= (and b!299866 res!158045) b!299869))

(assert (= (and b!299869 res!158047) b!299871))

(declare-fun m!311443 () Bool)

(assert (=> b!299869 m!311443))

(declare-fun m!311445 () Bool)

(assert (=> b!299870 m!311445))

(declare-fun m!311447 () Bool)

(assert (=> b!299868 m!311447))

(declare-fun m!311449 () Bool)

(assert (=> b!299866 m!311449))

(declare-fun m!311451 () Bool)

(assert (=> b!299871 m!311451))

(declare-fun m!311453 () Bool)

(assert (=> b!299871 m!311453))

(declare-fun m!311455 () Bool)

(assert (=> b!299871 m!311455))

(declare-fun m!311457 () Bool)

(assert (=> b!299871 m!311457))

(declare-fun m!311459 () Bool)

(assert (=> start!29806 m!311459))

(declare-fun m!311461 () Bool)

(assert (=> start!29806 m!311461))

(check-sat (not b!299868) (not b!299866) (not b!299871) (not start!29806) (not b!299870) (not b!299869))
(check-sat)
