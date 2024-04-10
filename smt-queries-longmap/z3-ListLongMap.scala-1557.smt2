; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29520 () Bool)

(assert start!29520)

(declare-fun res!157353 () Bool)

(declare-fun e!188509 () Bool)

(assert (=> start!29520 (=> (not res!157353) (not e!188509))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29520 (= res!157353 (validMask!0 mask!3809))))

(assert (=> start!29520 e!188509))

(assert (=> start!29520 true))

(declare-datatypes ((array!15092 0))(
  ( (array!15093 (arr!7149 (Array (_ BitVec 32) (_ BitVec 64))) (size!7501 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15092)

(declare-fun array_inv!5112 (array!15092) Bool)

(assert (=> start!29520 (array_inv!5112 a!3312)))

(declare-fun b!298371 () Bool)

(declare-fun res!157351 () Bool)

(assert (=> b!298371 (=> (not res!157351) (not e!188509))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298371 (= res!157351 (and (= (size!7501 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7501 a!3312))))))

(declare-fun b!298372 () Bool)

(declare-fun res!157350 () Bool)

(assert (=> b!298372 (=> (not res!157350) (not e!188509))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298372 (= res!157350 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298373 () Bool)

(declare-fun e!188507 () Bool)

(assert (=> b!298373 (= e!188507 false)))

(declare-datatypes ((SeekEntryResult!2298 0))(
  ( (MissingZero!2298 (index!11365 (_ BitVec 32))) (Found!2298 (index!11366 (_ BitVec 32))) (Intermediate!2298 (undefined!3110 Bool) (index!11367 (_ BitVec 32)) (x!29591 (_ BitVec 32))) (Undefined!2298) (MissingVacant!2298 (index!11368 (_ BitVec 32))) )
))
(declare-fun lt!148330 () SeekEntryResult!2298)

(declare-fun lt!148332 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15092 (_ BitVec 32)) SeekEntryResult!2298)

(assert (=> b!298373 (= lt!148330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148332 k0!2524 (array!15093 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7501 a!3312)) mask!3809))))

(declare-fun lt!148329 () SeekEntryResult!2298)

(assert (=> b!298373 (= lt!148329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148332 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298373 (= lt!148332 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298374 () Bool)

(declare-fun res!157348 () Bool)

(assert (=> b!298374 (=> (not res!157348) (not e!188507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15092 (_ BitVec 32)) Bool)

(assert (=> b!298374 (= res!157348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298375 () Bool)

(assert (=> b!298375 (= e!188509 e!188507)))

(declare-fun res!157352 () Bool)

(assert (=> b!298375 (=> (not res!157352) (not e!188507))))

(declare-fun lt!148331 () SeekEntryResult!2298)

(assert (=> b!298375 (= res!157352 (or (= lt!148331 (MissingZero!2298 i!1256)) (= lt!148331 (MissingVacant!2298 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15092 (_ BitVec 32)) SeekEntryResult!2298)

(assert (=> b!298375 (= lt!148331 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298376 () Bool)

(declare-fun res!157349 () Bool)

(assert (=> b!298376 (=> (not res!157349) (not e!188509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298376 (= res!157349 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29520 res!157353) b!298371))

(assert (= (and b!298371 res!157351) b!298376))

(assert (= (and b!298376 res!157349) b!298372))

(assert (= (and b!298372 res!157350) b!298375))

(assert (= (and b!298375 res!157352) b!298374))

(assert (= (and b!298374 res!157348) b!298373))

(declare-fun m!310889 () Bool)

(assert (=> b!298372 m!310889))

(declare-fun m!310891 () Bool)

(assert (=> start!29520 m!310891))

(declare-fun m!310893 () Bool)

(assert (=> start!29520 m!310893))

(declare-fun m!310895 () Bool)

(assert (=> b!298376 m!310895))

(declare-fun m!310897 () Bool)

(assert (=> b!298375 m!310897))

(declare-fun m!310899 () Bool)

(assert (=> b!298374 m!310899))

(declare-fun m!310901 () Bool)

(assert (=> b!298373 m!310901))

(declare-fun m!310903 () Bool)

(assert (=> b!298373 m!310903))

(declare-fun m!310905 () Bool)

(assert (=> b!298373 m!310905))

(declare-fun m!310907 () Bool)

(assert (=> b!298373 m!310907))

(check-sat (not b!298375) (not b!298374) (not b!298373) (not b!298372) (not start!29520) (not b!298376))
(check-sat)
