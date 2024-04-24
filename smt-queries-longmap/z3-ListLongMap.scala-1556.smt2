; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29506 () Bool)

(assert start!29506)

(declare-fun b!298364 () Bool)

(declare-fun res!157303 () Bool)

(declare-fun e!188506 () Bool)

(assert (=> b!298364 (=> (not res!157303) (not e!188506))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298364 (= res!157303 (validKeyInArray!0 k0!2524))))

(declare-fun b!298365 () Bool)

(declare-fun e!188507 () Bool)

(assert (=> b!298365 (= e!188506 e!188507)))

(declare-fun res!157307 () Bool)

(assert (=> b!298365 (=> (not res!157307) (not e!188507))))

(declare-datatypes ((SeekEntryResult!2258 0))(
  ( (MissingZero!2258 (index!11205 (_ BitVec 32))) (Found!2258 (index!11206 (_ BitVec 32))) (Intermediate!2258 (undefined!3070 Bool) (index!11207 (_ BitVec 32)) (x!29544 (_ BitVec 32))) (Undefined!2258) (MissingVacant!2258 (index!11208 (_ BitVec 32))) )
))
(declare-fun lt!148350 () SeekEntryResult!2258)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298365 (= res!157307 (or (= lt!148350 (MissingZero!2258 i!1256)) (= lt!148350 (MissingVacant!2258 i!1256))))))

(declare-datatypes ((array!15081 0))(
  ( (array!15082 (arr!7144 (Array (_ BitVec 32) (_ BitVec 64))) (size!7496 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15081)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15081 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!298365 (= lt!148350 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!157305 () Bool)

(assert (=> start!29506 (=> (not res!157305) (not e!188506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29506 (= res!157305 (validMask!0 mask!3809))))

(assert (=> start!29506 e!188506))

(assert (=> start!29506 true))

(declare-fun array_inv!5094 (array!15081) Bool)

(assert (=> start!29506 (array_inv!5094 a!3312)))

(declare-fun b!298366 () Bool)

(declare-fun res!157308 () Bool)

(assert (=> b!298366 (=> (not res!157308) (not e!188506))))

(declare-fun arrayContainsKey!0 (array!15081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298366 (= res!157308 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298367 () Bool)

(declare-fun res!157306 () Bool)

(assert (=> b!298367 (=> (not res!157306) (not e!188506))))

(assert (=> b!298367 (= res!157306 (and (= (size!7496 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7496 a!3312))))))

(declare-fun b!298368 () Bool)

(declare-fun res!157304 () Bool)

(assert (=> b!298368 (=> (not res!157304) (not e!188507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15081 (_ BitVec 32)) Bool)

(assert (=> b!298368 (= res!157304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298369 () Bool)

(assert (=> b!298369 (= e!188507 false)))

(declare-fun lt!148347 () SeekEntryResult!2258)

(declare-fun lt!148348 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15081 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!298369 (= lt!148347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148348 k0!2524 (array!15082 (store (arr!7144 a!3312) i!1256 k0!2524) (size!7496 a!3312)) mask!3809))))

(declare-fun lt!148349 () SeekEntryResult!2258)

(assert (=> b!298369 (= lt!148349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148348 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298369 (= lt!148348 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29506 res!157305) b!298367))

(assert (= (and b!298367 res!157306) b!298364))

(assert (= (and b!298364 res!157303) b!298366))

(assert (= (and b!298366 res!157308) b!298365))

(assert (= (and b!298365 res!157307) b!298368))

(assert (= (and b!298368 res!157304) b!298369))

(declare-fun m!311039 () Bool)

(assert (=> b!298369 m!311039))

(declare-fun m!311041 () Bool)

(assert (=> b!298369 m!311041))

(declare-fun m!311043 () Bool)

(assert (=> b!298369 m!311043))

(declare-fun m!311045 () Bool)

(assert (=> b!298369 m!311045))

(declare-fun m!311047 () Bool)

(assert (=> start!29506 m!311047))

(declare-fun m!311049 () Bool)

(assert (=> start!29506 m!311049))

(declare-fun m!311051 () Bool)

(assert (=> b!298364 m!311051))

(declare-fun m!311053 () Bool)

(assert (=> b!298365 m!311053))

(declare-fun m!311055 () Bool)

(assert (=> b!298366 m!311055))

(declare-fun m!311057 () Bool)

(assert (=> b!298368 m!311057))

(check-sat (not b!298368) (not b!298364) (not b!298365) (not b!298366) (not start!29506) (not b!298369))
(check-sat)
