; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29514 () Bool)

(assert start!29514)

(declare-fun res!157297 () Bool)

(declare-fun e!188482 () Bool)

(assert (=> start!29514 (=> (not res!157297) (not e!188482))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29514 (= res!157297 (validMask!0 mask!3809))))

(assert (=> start!29514 e!188482))

(assert (=> start!29514 true))

(declare-datatypes ((array!15086 0))(
  ( (array!15087 (arr!7146 (Array (_ BitVec 32) (_ BitVec 64))) (size!7498 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15086)

(declare-fun array_inv!5109 (array!15086) Bool)

(assert (=> start!29514 (array_inv!5109 a!3312)))

(declare-fun b!298317 () Bool)

(declare-fun res!157296 () Bool)

(assert (=> b!298317 (=> (not res!157296) (not e!188482))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298317 (= res!157296 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298318 () Bool)

(declare-fun res!157294 () Bool)

(assert (=> b!298318 (=> (not res!157294) (not e!188482))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298318 (= res!157294 (and (= (size!7498 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7498 a!3312))))))

(declare-fun b!298319 () Bool)

(declare-fun res!157299 () Bool)

(declare-fun e!188480 () Bool)

(assert (=> b!298319 (=> (not res!157299) (not e!188480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15086 (_ BitVec 32)) Bool)

(assert (=> b!298319 (= res!157299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298320 () Bool)

(assert (=> b!298320 (= e!188480 false)))

(declare-fun lt!148294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2295 0))(
  ( (MissingZero!2295 (index!11353 (_ BitVec 32))) (Found!2295 (index!11354 (_ BitVec 32))) (Intermediate!2295 (undefined!3107 Bool) (index!11355 (_ BitVec 32)) (x!29580 (_ BitVec 32))) (Undefined!2295) (MissingVacant!2295 (index!11356 (_ BitVec 32))) )
))
(declare-fun lt!148296 () SeekEntryResult!2295)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15086 (_ BitVec 32)) SeekEntryResult!2295)

(assert (=> b!298320 (= lt!148296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148294 k0!2524 (array!15087 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7498 a!3312)) mask!3809))))

(declare-fun lt!148293 () SeekEntryResult!2295)

(assert (=> b!298320 (= lt!148293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148294 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298320 (= lt!148294 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298321 () Bool)

(declare-fun res!157298 () Bool)

(assert (=> b!298321 (=> (not res!157298) (not e!188482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298321 (= res!157298 (validKeyInArray!0 k0!2524))))

(declare-fun b!298322 () Bool)

(assert (=> b!298322 (= e!188482 e!188480)))

(declare-fun res!157295 () Bool)

(assert (=> b!298322 (=> (not res!157295) (not e!188480))))

(declare-fun lt!148295 () SeekEntryResult!2295)

(assert (=> b!298322 (= res!157295 (or (= lt!148295 (MissingZero!2295 i!1256)) (= lt!148295 (MissingVacant!2295 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15086 (_ BitVec 32)) SeekEntryResult!2295)

(assert (=> b!298322 (= lt!148295 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29514 res!157297) b!298318))

(assert (= (and b!298318 res!157294) b!298321))

(assert (= (and b!298321 res!157298) b!298317))

(assert (= (and b!298317 res!157296) b!298322))

(assert (= (and b!298322 res!157295) b!298319))

(assert (= (and b!298319 res!157299) b!298320))

(declare-fun m!310829 () Bool)

(assert (=> b!298317 m!310829))

(declare-fun m!310831 () Bool)

(assert (=> b!298321 m!310831))

(declare-fun m!310833 () Bool)

(assert (=> b!298320 m!310833))

(declare-fun m!310835 () Bool)

(assert (=> b!298320 m!310835))

(declare-fun m!310837 () Bool)

(assert (=> b!298320 m!310837))

(declare-fun m!310839 () Bool)

(assert (=> b!298320 m!310839))

(declare-fun m!310841 () Bool)

(assert (=> start!29514 m!310841))

(declare-fun m!310843 () Bool)

(assert (=> start!29514 m!310843))

(declare-fun m!310845 () Bool)

(assert (=> b!298322 m!310845))

(declare-fun m!310847 () Bool)

(assert (=> b!298319 m!310847))

(check-sat (not b!298320) (not b!298319) (not start!29514) (not b!298321) (not b!298317) (not b!298322))
(check-sat)
