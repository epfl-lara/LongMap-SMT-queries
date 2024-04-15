; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29504 () Bool)

(assert start!29504)

(declare-fun b!298106 () Bool)

(declare-fun e!188341 () Bool)

(declare-fun e!188339 () Bool)

(assert (=> b!298106 (= e!188341 e!188339)))

(declare-fun res!157216 () Bool)

(assert (=> b!298106 (=> (not res!157216) (not e!188339))))

(declare-datatypes ((SeekEntryResult!2291 0))(
  ( (MissingZero!2291 (index!11337 (_ BitVec 32))) (Found!2291 (index!11338 (_ BitVec 32))) (Intermediate!2291 (undefined!3103 Bool) (index!11339 (_ BitVec 32)) (x!29580 (_ BitVec 32))) (Undefined!2291) (MissingVacant!2291 (index!11340 (_ BitVec 32))) )
))
(declare-fun lt!148098 () SeekEntryResult!2291)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298106 (= res!157216 (or (= lt!148098 (MissingZero!2291 i!1256)) (= lt!148098 (MissingVacant!2291 i!1256))))))

(declare-datatypes ((array!15079 0))(
  ( (array!15080 (arr!7143 (Array (_ BitVec 32) (_ BitVec 64))) (size!7496 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15079)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15079 (_ BitVec 32)) SeekEntryResult!2291)

(assert (=> b!298106 (= lt!148098 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298107 () Bool)

(declare-fun res!157213 () Bool)

(assert (=> b!298107 (=> (not res!157213) (not e!188341))))

(declare-fun arrayContainsKey!0 (array!15079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298107 (= res!157213 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298108 () Bool)

(assert (=> b!298108 (= e!188339 false)))

(declare-fun lt!148095 () (_ BitVec 32))

(declare-fun lt!148096 () SeekEntryResult!2291)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15079 (_ BitVec 32)) SeekEntryResult!2291)

(assert (=> b!298108 (= lt!148096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148095 k0!2524 (array!15080 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7496 a!3312)) mask!3809))))

(declare-fun lt!148097 () SeekEntryResult!2291)

(assert (=> b!298108 (= lt!148097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148095 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298108 (= lt!148095 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298109 () Bool)

(declare-fun res!157215 () Bool)

(assert (=> b!298109 (=> (not res!157215) (not e!188339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15079 (_ BitVec 32)) Bool)

(assert (=> b!298109 (= res!157215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!157214 () Bool)

(assert (=> start!29504 (=> (not res!157214) (not e!188341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29504 (= res!157214 (validMask!0 mask!3809))))

(assert (=> start!29504 e!188341))

(assert (=> start!29504 true))

(declare-fun array_inv!5115 (array!15079) Bool)

(assert (=> start!29504 (array_inv!5115 a!3312)))

(declare-fun b!298110 () Bool)

(declare-fun res!157212 () Bool)

(assert (=> b!298110 (=> (not res!157212) (not e!188341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298110 (= res!157212 (validKeyInArray!0 k0!2524))))

(declare-fun b!298111 () Bool)

(declare-fun res!157211 () Bool)

(assert (=> b!298111 (=> (not res!157211) (not e!188341))))

(assert (=> b!298111 (= res!157211 (and (= (size!7496 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7496 a!3312))))))

(assert (= (and start!29504 res!157214) b!298111))

(assert (= (and b!298111 res!157211) b!298110))

(assert (= (and b!298110 res!157212) b!298107))

(assert (= (and b!298107 res!157213) b!298106))

(assert (= (and b!298106 res!157216) b!298109))

(assert (= (and b!298109 res!157215) b!298108))

(declare-fun m!310173 () Bool)

(assert (=> b!298107 m!310173))

(declare-fun m!310175 () Bool)

(assert (=> b!298110 m!310175))

(declare-fun m!310177 () Bool)

(assert (=> b!298106 m!310177))

(declare-fun m!310179 () Bool)

(assert (=> b!298108 m!310179))

(declare-fun m!310181 () Bool)

(assert (=> b!298108 m!310181))

(declare-fun m!310183 () Bool)

(assert (=> b!298108 m!310183))

(declare-fun m!310185 () Bool)

(assert (=> b!298108 m!310185))

(declare-fun m!310187 () Bool)

(assert (=> start!29504 m!310187))

(declare-fun m!310189 () Bool)

(assert (=> start!29504 m!310189))

(declare-fun m!310191 () Bool)

(assert (=> b!298109 m!310191))

(check-sat (not b!298108) (not b!298106) (not b!298109) (not b!298107) (not start!29504) (not b!298110))
(check-sat)
