; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29832 () Bool)

(assert start!29832)

(declare-fun b!300213 () Bool)

(declare-fun e!189585 () Bool)

(assert (=> b!300213 (= e!189585 false)))

(declare-datatypes ((SeekEntryResult!2322 0))(
  ( (MissingZero!2322 (index!11464 (_ BitVec 32))) (Found!2322 (index!11465 (_ BitVec 32))) (Intermediate!2322 (undefined!3134 Bool) (index!11466 (_ BitVec 32)) (x!29718 (_ BitVec 32))) (Undefined!2322) (MissingVacant!2322 (index!11467 (_ BitVec 32))) )
))
(declare-fun lt!149322 () SeekEntryResult!2322)

(declare-datatypes ((array!15155 0))(
  ( (array!15156 (arr!7173 (Array (_ BitVec 32) (_ BitVec 64))) (size!7525 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15155)

(declare-fun lt!149324 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15155 (_ BitVec 32)) SeekEntryResult!2322)

(assert (=> b!300213 (= lt!149322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149324 k0!2524 (array!15156 (store (arr!7173 a!3312) i!1256 k0!2524) (size!7525 a!3312)) mask!3809))))

(declare-fun lt!149323 () SeekEntryResult!2322)

(assert (=> b!300213 (= lt!149323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149324 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300213 (= lt!149324 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300214 () Bool)

(declare-fun res!158245 () Bool)

(declare-fun e!189586 () Bool)

(assert (=> b!300214 (=> (not res!158245) (not e!189586))))

(declare-fun arrayContainsKey!0 (array!15155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300214 (= res!158245 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300216 () Bool)

(assert (=> b!300216 (= e!189586 e!189585)))

(declare-fun res!158246 () Bool)

(assert (=> b!300216 (=> (not res!158246) (not e!189585))))

(declare-fun lt!149325 () SeekEntryResult!2322)

(assert (=> b!300216 (= res!158246 (or (= lt!149325 (MissingZero!2322 i!1256)) (= lt!149325 (MissingVacant!2322 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15155 (_ BitVec 32)) SeekEntryResult!2322)

(assert (=> b!300216 (= lt!149325 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300217 () Bool)

(declare-fun res!158250 () Bool)

(assert (=> b!300217 (=> (not res!158250) (not e!189586))))

(assert (=> b!300217 (= res!158250 (and (= (size!7525 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7525 a!3312))))))

(declare-fun b!300218 () Bool)

(declare-fun res!158249 () Bool)

(assert (=> b!300218 (=> (not res!158249) (not e!189586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300218 (= res!158249 (validKeyInArray!0 k0!2524))))

(declare-fun res!158248 () Bool)

(assert (=> start!29832 (=> (not res!158248) (not e!189586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29832 (= res!158248 (validMask!0 mask!3809))))

(assert (=> start!29832 e!189586))

(assert (=> start!29832 true))

(declare-fun array_inv!5136 (array!15155) Bool)

(assert (=> start!29832 (array_inv!5136 a!3312)))

(declare-fun b!300215 () Bool)

(declare-fun res!158247 () Bool)

(assert (=> b!300215 (=> (not res!158247) (not e!189585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15155 (_ BitVec 32)) Bool)

(assert (=> b!300215 (= res!158247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29832 res!158248) b!300217))

(assert (= (and b!300217 res!158250) b!300218))

(assert (= (and b!300218 res!158249) b!300214))

(assert (= (and b!300214 res!158245) b!300216))

(assert (= (and b!300216 res!158246) b!300215))

(assert (= (and b!300215 res!158247) b!300213))

(declare-fun m!312263 () Bool)

(assert (=> b!300216 m!312263))

(declare-fun m!312265 () Bool)

(assert (=> b!300215 m!312265))

(declare-fun m!312267 () Bool)

(assert (=> b!300213 m!312267))

(declare-fun m!312269 () Bool)

(assert (=> b!300213 m!312269))

(declare-fun m!312271 () Bool)

(assert (=> b!300213 m!312271))

(declare-fun m!312273 () Bool)

(assert (=> b!300213 m!312273))

(declare-fun m!312275 () Bool)

(assert (=> b!300218 m!312275))

(declare-fun m!312277 () Bool)

(assert (=> b!300214 m!312277))

(declare-fun m!312279 () Bool)

(assert (=> start!29832 m!312279))

(declare-fun m!312281 () Bool)

(assert (=> start!29832 m!312281))

(check-sat (not b!300216) (not b!300213) (not b!300218) (not b!300214) (not start!29832) (not b!300215))
(check-sat)
