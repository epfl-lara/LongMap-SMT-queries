; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29312 () Bool)

(assert start!29312)

(declare-fun b!296974 () Bool)

(declare-fun res!156506 () Bool)

(declare-fun e!187687 () Bool)

(assert (=> b!296974 (=> (not res!156506) (not e!187687))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296974 (= res!156506 (validKeyInArray!0 k!2524))))

(declare-fun b!296975 () Bool)

(declare-fun e!187688 () Bool)

(declare-fun e!187686 () Bool)

(assert (=> b!296975 (= e!187688 e!187686)))

(declare-fun res!156502 () Bool)

(assert (=> b!296975 (=> (not res!156502) (not e!187686))))

(declare-datatypes ((SeekEntryResult!2269 0))(
  ( (MissingZero!2269 (index!11246 (_ BitVec 32))) (Found!2269 (index!11247 (_ BitVec 32))) (Intermediate!2269 (undefined!3081 Bool) (index!11248 (_ BitVec 32)) (x!29461 (_ BitVec 32))) (Undefined!2269) (MissingVacant!2269 (index!11249 (_ BitVec 32))) )
))
(declare-fun lt!147484 () SeekEntryResult!2269)

(declare-fun lt!147487 () Bool)

(declare-datatypes ((array!15025 0))(
  ( (array!15026 (arr!7120 (Array (_ BitVec 32) (_ BitVec 64))) (size!7472 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15025)

(assert (=> b!296975 (= res!156502 (and (or lt!147487 (not (undefined!3081 lt!147484))) (or lt!147487 (not (= (select (arr!7120 a!3312) (index!11248 lt!147484)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147487 (not (= (select (arr!7120 a!3312) (index!11248 lt!147484)) k!2524))) (not lt!147487)))))

(assert (=> b!296975 (= lt!147487 (not (is-Intermediate!2269 lt!147484)))))

(declare-fun b!296976 () Bool)

(declare-fun res!156503 () Bool)

(declare-fun e!187689 () Bool)

(assert (=> b!296976 (=> (not res!156503) (not e!187689))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15025 (_ BitVec 32)) Bool)

(assert (=> b!296976 (= res!156503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296977 () Bool)

(assert (=> b!296977 (= e!187686 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296977 (and (= (select (arr!7120 a!3312) (index!11248 lt!147484)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11248 lt!147484) i!1256))))

(declare-fun b!296978 () Bool)

(assert (=> b!296978 (= e!187687 e!187689)))

(declare-fun res!156505 () Bool)

(assert (=> b!296978 (=> (not res!156505) (not e!187689))))

(declare-fun lt!147488 () Bool)

(declare-fun lt!147485 () SeekEntryResult!2269)

(assert (=> b!296978 (= res!156505 (or lt!147488 (= lt!147485 (MissingVacant!2269 i!1256))))))

(assert (=> b!296978 (= lt!147488 (= lt!147485 (MissingZero!2269 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15025 (_ BitVec 32)) SeekEntryResult!2269)

(assert (=> b!296978 (= lt!147485 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!156507 () Bool)

(assert (=> start!29312 (=> (not res!156507) (not e!187687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29312 (= res!156507 (validMask!0 mask!3809))))

(assert (=> start!29312 e!187687))

(assert (=> start!29312 true))

(declare-fun array_inv!5083 (array!15025) Bool)

(assert (=> start!29312 (array_inv!5083 a!3312)))

(declare-fun b!296979 () Bool)

(declare-fun res!156504 () Bool)

(assert (=> b!296979 (=> (not res!156504) (not e!187687))))

(assert (=> b!296979 (= res!156504 (and (= (size!7472 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7472 a!3312))))))

(declare-fun b!296980 () Bool)

(assert (=> b!296980 (= e!187689 e!187688)))

(declare-fun res!156501 () Bool)

(assert (=> b!296980 (=> (not res!156501) (not e!187688))))

(assert (=> b!296980 (= res!156501 lt!147488)))

(declare-fun lt!147486 () (_ BitVec 32))

(declare-fun lt!147489 () SeekEntryResult!2269)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15025 (_ BitVec 32)) SeekEntryResult!2269)

(assert (=> b!296980 (= lt!147489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147486 k!2524 (array!15026 (store (arr!7120 a!3312) i!1256 k!2524) (size!7472 a!3312)) mask!3809))))

(assert (=> b!296980 (= lt!147484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147486 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296980 (= lt!147486 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296981 () Bool)

(declare-fun res!156500 () Bool)

(assert (=> b!296981 (=> (not res!156500) (not e!187687))))

(declare-fun arrayContainsKey!0 (array!15025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296981 (= res!156500 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29312 res!156507) b!296979))

(assert (= (and b!296979 res!156504) b!296974))

(assert (= (and b!296974 res!156506) b!296981))

(assert (= (and b!296981 res!156500) b!296978))

(assert (= (and b!296978 res!156505) b!296976))

(assert (= (and b!296976 res!156503) b!296980))

(assert (= (and b!296980 res!156501) b!296975))

(assert (= (and b!296975 res!156502) b!296977))

(declare-fun m!309797 () Bool)

(assert (=> b!296978 m!309797))

(declare-fun m!309799 () Bool)

(assert (=> b!296977 m!309799))

(declare-fun m!309801 () Bool)

(assert (=> b!296981 m!309801))

(declare-fun m!309803 () Bool)

(assert (=> b!296980 m!309803))

(declare-fun m!309805 () Bool)

(assert (=> b!296980 m!309805))

(declare-fun m!309807 () Bool)

(assert (=> b!296980 m!309807))

(declare-fun m!309809 () Bool)

(assert (=> b!296980 m!309809))

(declare-fun m!309811 () Bool)

(assert (=> start!29312 m!309811))

(declare-fun m!309813 () Bool)

(assert (=> start!29312 m!309813))

(declare-fun m!309815 () Bool)

(assert (=> b!296974 m!309815))

(declare-fun m!309817 () Bool)

(assert (=> b!296976 m!309817))

(assert (=> b!296975 m!309799))

(push 1)

