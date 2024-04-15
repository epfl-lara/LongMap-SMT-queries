; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29872 () Bool)

(assert start!29872)

(declare-fun b!300244 () Bool)

(declare-fun e!189587 () Bool)

(declare-fun e!189586 () Bool)

(assert (=> b!300244 (= e!189587 e!189586)))

(declare-fun res!158282 () Bool)

(assert (=> b!300244 (=> (not res!158282) (not e!189586))))

(declare-datatypes ((SeekEntryResult!2321 0))(
  ( (MissingZero!2321 (index!11460 (_ BitVec 32))) (Found!2321 (index!11461 (_ BitVec 32))) (Intermediate!2321 (undefined!3133 Bool) (index!11462 (_ BitVec 32)) (x!29734 (_ BitVec 32))) (Undefined!2321) (MissingVacant!2321 (index!11463 (_ BitVec 32))) )
))
(declare-fun lt!149254 () SeekEntryResult!2321)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300244 (= res!158282 (or (= lt!149254 (MissingZero!2321 i!1256)) (= lt!149254 (MissingVacant!2321 i!1256))))))

(declare-datatypes ((array!15157 0))(
  ( (array!15158 (arr!7173 (Array (_ BitVec 32) (_ BitVec 64))) (size!7526 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15157)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15157 (_ BitVec 32)) SeekEntryResult!2321)

(assert (=> b!300244 (= lt!149254 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300245 () Bool)

(declare-fun res!158283 () Bool)

(assert (=> b!300245 (=> (not res!158283) (not e!189587))))

(assert (=> b!300245 (= res!158283 (and (= (size!7526 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7526 a!3312))))))

(declare-fun b!300246 () Bool)

(assert (=> b!300246 (= e!189586 false)))

(declare-fun lt!149252 () SeekEntryResult!2321)

(declare-fun lt!149253 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15157 (_ BitVec 32)) SeekEntryResult!2321)

(assert (=> b!300246 (= lt!149252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149253 k0!2524 (array!15158 (store (arr!7173 a!3312) i!1256 k0!2524) (size!7526 a!3312)) mask!3809))))

(declare-fun lt!149255 () SeekEntryResult!2321)

(assert (=> b!300246 (= lt!149255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149253 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300246 (= lt!149253 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300247 () Bool)

(declare-fun res!158285 () Bool)

(assert (=> b!300247 (=> (not res!158285) (not e!189587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300247 (= res!158285 (validKeyInArray!0 k0!2524))))

(declare-fun b!300248 () Bool)

(declare-fun res!158281 () Bool)

(assert (=> b!300248 (=> (not res!158281) (not e!189586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15157 (_ BitVec 32)) Bool)

(assert (=> b!300248 (= res!158281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!158284 () Bool)

(assert (=> start!29872 (=> (not res!158284) (not e!189587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29872 (= res!158284 (validMask!0 mask!3809))))

(assert (=> start!29872 e!189587))

(assert (=> start!29872 true))

(declare-fun array_inv!5145 (array!15157) Bool)

(assert (=> start!29872 (array_inv!5145 a!3312)))

(declare-fun b!300249 () Bool)

(declare-fun res!158286 () Bool)

(assert (=> b!300249 (=> (not res!158286) (not e!189587))))

(declare-fun arrayContainsKey!0 (array!15157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300249 (= res!158286 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29872 res!158284) b!300245))

(assert (= (and b!300245 res!158283) b!300247))

(assert (= (and b!300247 res!158285) b!300249))

(assert (= (and b!300249 res!158286) b!300244))

(assert (= (and b!300244 res!158282) b!300248))

(assert (= (and b!300248 res!158281) b!300246))

(declare-fun m!311749 () Bool)

(assert (=> b!300244 m!311749))

(declare-fun m!311751 () Bool)

(assert (=> start!29872 m!311751))

(declare-fun m!311753 () Bool)

(assert (=> start!29872 m!311753))

(declare-fun m!311755 () Bool)

(assert (=> b!300249 m!311755))

(declare-fun m!311757 () Bool)

(assert (=> b!300246 m!311757))

(declare-fun m!311759 () Bool)

(assert (=> b!300246 m!311759))

(declare-fun m!311761 () Bool)

(assert (=> b!300246 m!311761))

(declare-fun m!311763 () Bool)

(assert (=> b!300246 m!311763))

(declare-fun m!311765 () Bool)

(assert (=> b!300248 m!311765))

(declare-fun m!311767 () Bool)

(assert (=> b!300247 m!311767))

(check-sat (not b!300248) (not b!300244) (not b!300247) (not b!300246) (not b!300249) (not start!29872))
(check-sat)
