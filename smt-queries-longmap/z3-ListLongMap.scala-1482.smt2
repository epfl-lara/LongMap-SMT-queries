; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28274 () Bool)

(assert start!28274)

(declare-fun b!289650 () Bool)

(declare-fun res!151186 () Bool)

(declare-fun e!183341 () Bool)

(assert (=> b!289650 (=> (not res!151186) (not e!183341))))

(declare-datatypes ((array!14581 0))(
  ( (array!14582 (arr!6918 (Array (_ BitVec 32) (_ BitVec 64))) (size!7271 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14581)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14581 (_ BitVec 32)) Bool)

(assert (=> b!289650 (= res!151186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289651 () Bool)

(assert (=> b!289651 (= e!183341 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2066 0))(
  ( (MissingZero!2066 (index!10434 (_ BitVec 32))) (Found!2066 (index!10435 (_ BitVec 32))) (Intermediate!2066 (undefined!2878 Bool) (index!10436 (_ BitVec 32)) (x!28654 (_ BitVec 32))) (Undefined!2066) (MissingVacant!2066 (index!10437 (_ BitVec 32))) )
))
(declare-fun lt!142874 () SeekEntryResult!2066)

(declare-fun lt!142875 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14581 (_ BitVec 32)) SeekEntryResult!2066)

(assert (=> b!289651 (= lt!142874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142875 k0!2524 (array!14582 (store (arr!6918 a!3312) i!1256 k0!2524) (size!7271 a!3312)) mask!3809))))

(declare-fun lt!142873 () SeekEntryResult!2066)

(assert (=> b!289651 (= lt!142873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142875 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289651 (= lt!142875 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289652 () Bool)

(declare-fun res!151183 () Bool)

(declare-fun e!183342 () Bool)

(assert (=> b!289652 (=> (not res!151183) (not e!183342))))

(declare-fun arrayContainsKey!0 (array!14581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289652 (= res!151183 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289653 () Bool)

(declare-fun res!151182 () Bool)

(assert (=> b!289653 (=> (not res!151182) (not e!183342))))

(assert (=> b!289653 (= res!151182 (and (= (size!7271 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7271 a!3312))))))

(declare-fun res!151181 () Bool)

(assert (=> start!28274 (=> (not res!151181) (not e!183342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28274 (= res!151181 (validMask!0 mask!3809))))

(assert (=> start!28274 e!183342))

(assert (=> start!28274 true))

(declare-fun array_inv!4890 (array!14581) Bool)

(assert (=> start!28274 (array_inv!4890 a!3312)))

(declare-fun b!289654 () Bool)

(declare-fun res!151184 () Bool)

(assert (=> b!289654 (=> (not res!151184) (not e!183342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289654 (= res!151184 (validKeyInArray!0 k0!2524))))

(declare-fun b!289655 () Bool)

(assert (=> b!289655 (= e!183342 e!183341)))

(declare-fun res!151185 () Bool)

(assert (=> b!289655 (=> (not res!151185) (not e!183341))))

(declare-fun lt!142872 () SeekEntryResult!2066)

(assert (=> b!289655 (= res!151185 (or (= lt!142872 (MissingZero!2066 i!1256)) (= lt!142872 (MissingVacant!2066 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14581 (_ BitVec 32)) SeekEntryResult!2066)

(assert (=> b!289655 (= lt!142872 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28274 res!151181) b!289653))

(assert (= (and b!289653 res!151182) b!289654))

(assert (= (and b!289654 res!151184) b!289652))

(assert (= (and b!289652 res!151183) b!289655))

(assert (= (and b!289655 res!151185) b!289650))

(assert (= (and b!289650 res!151186) b!289651))

(declare-fun m!303275 () Bool)

(assert (=> start!28274 m!303275))

(declare-fun m!303277 () Bool)

(assert (=> start!28274 m!303277))

(declare-fun m!303279 () Bool)

(assert (=> b!289654 m!303279))

(declare-fun m!303281 () Bool)

(assert (=> b!289652 m!303281))

(declare-fun m!303283 () Bool)

(assert (=> b!289650 m!303283))

(declare-fun m!303285 () Bool)

(assert (=> b!289655 m!303285))

(declare-fun m!303287 () Bool)

(assert (=> b!289651 m!303287))

(declare-fun m!303289 () Bool)

(assert (=> b!289651 m!303289))

(declare-fun m!303291 () Bool)

(assert (=> b!289651 m!303291))

(declare-fun m!303293 () Bool)

(assert (=> b!289651 m!303293))

(check-sat (not b!289651) (not b!289650) (not b!289655) (not b!289652) (not start!28274) (not b!289654))
(check-sat)
