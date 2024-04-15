; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29498 () Bool)

(assert start!29498)

(declare-fun res!157160 () Bool)

(declare-fun e!188314 () Bool)

(assert (=> start!29498 (=> (not res!157160) (not e!188314))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29498 (= res!157160 (validMask!0 mask!3809))))

(assert (=> start!29498 e!188314))

(assert (=> start!29498 true))

(declare-datatypes ((array!15073 0))(
  ( (array!15074 (arr!7140 (Array (_ BitVec 32) (_ BitVec 64))) (size!7493 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15073)

(declare-fun array_inv!5112 (array!15073) Bool)

(assert (=> start!29498 (array_inv!5112 a!3312)))

(declare-fun b!298052 () Bool)

(declare-fun res!157159 () Bool)

(assert (=> b!298052 (=> (not res!157159) (not e!188314))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298052 (= res!157159 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298053 () Bool)

(declare-fun e!188313 () Bool)

(assert (=> b!298053 (= e!188313 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148059 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2288 0))(
  ( (MissingZero!2288 (index!11325 (_ BitVec 32))) (Found!2288 (index!11326 (_ BitVec 32))) (Intermediate!2288 (undefined!3100 Bool) (index!11327 (_ BitVec 32)) (x!29569 (_ BitVec 32))) (Undefined!2288) (MissingVacant!2288 (index!11328 (_ BitVec 32))) )
))
(declare-fun lt!148061 () SeekEntryResult!2288)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15073 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!298053 (= lt!148061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148059 k0!2524 (array!15074 (store (arr!7140 a!3312) i!1256 k0!2524) (size!7493 a!3312)) mask!3809))))

(declare-fun lt!148062 () SeekEntryResult!2288)

(assert (=> b!298053 (= lt!148062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148059 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298053 (= lt!148059 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298054 () Bool)

(declare-fun res!157161 () Bool)

(assert (=> b!298054 (=> (not res!157161) (not e!188314))))

(assert (=> b!298054 (= res!157161 (and (= (size!7493 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7493 a!3312))))))

(declare-fun b!298055 () Bool)

(assert (=> b!298055 (= e!188314 e!188313)))

(declare-fun res!157158 () Bool)

(assert (=> b!298055 (=> (not res!157158) (not e!188313))))

(declare-fun lt!148060 () SeekEntryResult!2288)

(assert (=> b!298055 (= res!157158 (or (= lt!148060 (MissingZero!2288 i!1256)) (= lt!148060 (MissingVacant!2288 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15073 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!298055 (= lt!148060 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298056 () Bool)

(declare-fun res!157157 () Bool)

(assert (=> b!298056 (=> (not res!157157) (not e!188314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298056 (= res!157157 (validKeyInArray!0 k0!2524))))

(declare-fun b!298057 () Bool)

(declare-fun res!157162 () Bool)

(assert (=> b!298057 (=> (not res!157162) (not e!188313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15073 (_ BitVec 32)) Bool)

(assert (=> b!298057 (= res!157162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29498 res!157160) b!298054))

(assert (= (and b!298054 res!157161) b!298056))

(assert (= (and b!298056 res!157157) b!298052))

(assert (= (and b!298052 res!157159) b!298055))

(assert (= (and b!298055 res!157158) b!298057))

(assert (= (and b!298057 res!157162) b!298053))

(declare-fun m!310113 () Bool)

(assert (=> b!298055 m!310113))

(declare-fun m!310115 () Bool)

(assert (=> b!298053 m!310115))

(declare-fun m!310117 () Bool)

(assert (=> b!298053 m!310117))

(declare-fun m!310119 () Bool)

(assert (=> b!298053 m!310119))

(declare-fun m!310121 () Bool)

(assert (=> b!298053 m!310121))

(declare-fun m!310123 () Bool)

(assert (=> b!298052 m!310123))

(declare-fun m!310125 () Bool)

(assert (=> b!298057 m!310125))

(declare-fun m!310127 () Bool)

(assert (=> start!29498 m!310127))

(declare-fun m!310129 () Bool)

(assert (=> start!29498 m!310129))

(declare-fun m!310131 () Bool)

(assert (=> b!298056 m!310131))

(check-sat (not b!298057) (not b!298053) (not b!298052) (not b!298056) (not start!29498) (not b!298055))
(check-sat)
