; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28594 () Bool)

(assert start!28594)

(declare-fun b!292490 () Bool)

(declare-fun e!185050 () Bool)

(assert (=> b!292490 (= e!185050 false)))

(declare-datatypes ((SeekEntryResult!2126 0))(
  ( (MissingZero!2126 (index!10674 (_ BitVec 32))) (Found!2126 (index!10675 (_ BitVec 32))) (Intermediate!2126 (undefined!2938 Bool) (index!10676 (_ BitVec 32)) (x!28973 (_ BitVec 32))) (Undefined!2126) (MissingVacant!2126 (index!10677 (_ BitVec 32))) )
))
(declare-fun lt!144904 () SeekEntryResult!2126)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144903 () (_ BitVec 32))

(declare-datatypes ((array!14778 0))(
  ( (array!14779 (arr!7012 (Array (_ BitVec 32) (_ BitVec 64))) (size!7364 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14778)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14778 (_ BitVec 32)) SeekEntryResult!2126)

(assert (=> b!292490 (= lt!144904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144903 k0!2524 (array!14779 (store (arr!7012 a!3312) i!1256 k0!2524) (size!7364 a!3312)) mask!3809))))

(declare-fun lt!144905 () SeekEntryResult!2126)

(assert (=> b!292490 (= lt!144905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144903 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292490 (= lt!144903 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153525 () Bool)

(declare-fun e!185049 () Bool)

(assert (=> start!28594 (=> (not res!153525) (not e!185049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28594 (= res!153525 (validMask!0 mask!3809))))

(assert (=> start!28594 e!185049))

(assert (=> start!28594 true))

(declare-fun array_inv!4962 (array!14778) Bool)

(assert (=> start!28594 (array_inv!4962 a!3312)))

(declare-fun b!292491 () Bool)

(declare-fun res!153522 () Bool)

(assert (=> b!292491 (=> (not res!153522) (not e!185049))))

(declare-fun arrayContainsKey!0 (array!14778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292491 (= res!153522 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292492 () Bool)

(declare-fun res!153523 () Bool)

(assert (=> b!292492 (=> (not res!153523) (not e!185049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292492 (= res!153523 (validKeyInArray!0 k0!2524))))

(declare-fun b!292493 () Bool)

(assert (=> b!292493 (= e!185049 e!185050)))

(declare-fun res!153521 () Bool)

(assert (=> b!292493 (=> (not res!153521) (not e!185050))))

(declare-fun lt!144906 () SeekEntryResult!2126)

(assert (=> b!292493 (= res!153521 (or (= lt!144906 (MissingZero!2126 i!1256)) (= lt!144906 (MissingVacant!2126 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14778 (_ BitVec 32)) SeekEntryResult!2126)

(assert (=> b!292493 (= lt!144906 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292494 () Bool)

(declare-fun res!153520 () Bool)

(assert (=> b!292494 (=> (not res!153520) (not e!185049))))

(assert (=> b!292494 (= res!153520 (and (= (size!7364 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7364 a!3312))))))

(declare-fun b!292495 () Bool)

(declare-fun res!153524 () Bool)

(assert (=> b!292495 (=> (not res!153524) (not e!185050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14778 (_ BitVec 32)) Bool)

(assert (=> b!292495 (= res!153524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28594 res!153525) b!292494))

(assert (= (and b!292494 res!153520) b!292492))

(assert (= (and b!292492 res!153523) b!292491))

(assert (= (and b!292491 res!153522) b!292493))

(assert (= (and b!292493 res!153521) b!292495))

(assert (= (and b!292495 res!153524) b!292490))

(declare-fun m!306383 () Bool)

(assert (=> b!292491 m!306383))

(declare-fun m!306385 () Bool)

(assert (=> b!292493 m!306385))

(declare-fun m!306387 () Bool)

(assert (=> b!292492 m!306387))

(declare-fun m!306389 () Bool)

(assert (=> b!292495 m!306389))

(declare-fun m!306391 () Bool)

(assert (=> start!28594 m!306391))

(declare-fun m!306393 () Bool)

(assert (=> start!28594 m!306393))

(declare-fun m!306395 () Bool)

(assert (=> b!292490 m!306395))

(declare-fun m!306397 () Bool)

(assert (=> b!292490 m!306397))

(declare-fun m!306399 () Bool)

(assert (=> b!292490 m!306399))

(declare-fun m!306401 () Bool)

(assert (=> b!292490 m!306401))

(check-sat (not b!292493) (not b!292491) (not b!292492) (not b!292495) (not b!292490) (not start!28594))
(check-sat)
