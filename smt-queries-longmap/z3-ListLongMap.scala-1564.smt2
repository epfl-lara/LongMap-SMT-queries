; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29806 () Bool)

(assert start!29806)

(declare-fun b!300088 () Bool)

(declare-fun e!189514 () Bool)

(assert (=> b!300088 (= e!189514 false)))

(declare-datatypes ((SeekEntryResult!2282 0))(
  ( (MissingZero!2282 (index!11304 (_ BitVec 32))) (Found!2282 (index!11305 (_ BitVec 32))) (Intermediate!2282 (undefined!3094 Bool) (index!11306 (_ BitVec 32)) (x!29667 (_ BitVec 32))) (Undefined!2282) (MissingVacant!2282 (index!11307 (_ BitVec 32))) )
))
(declare-fun lt!149295 () SeekEntryResult!2282)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!149294 () (_ BitVec 32))

(declare-datatypes ((array!15144 0))(
  ( (array!15145 (arr!7168 (Array (_ BitVec 32) (_ BitVec 64))) (size!7520 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15144)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15144 (_ BitVec 32)) SeekEntryResult!2282)

(assert (=> b!300088 (= lt!149295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149294 k0!2524 (array!15145 (store (arr!7168 a!3312) i!1256 k0!2524) (size!7520 a!3312)) mask!3809))))

(declare-fun lt!149292 () SeekEntryResult!2282)

(assert (=> b!300088 (= lt!149292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149294 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300088 (= lt!149294 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300089 () Bool)

(declare-fun res!158174 () Bool)

(declare-fun e!189516 () Bool)

(assert (=> b!300089 (=> (not res!158174) (not e!189516))))

(assert (=> b!300089 (= res!158174 (and (= (size!7520 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7520 a!3312))))))

(declare-fun b!300090 () Bool)

(assert (=> b!300090 (= e!189516 e!189514)))

(declare-fun res!158173 () Bool)

(assert (=> b!300090 (=> (not res!158173) (not e!189514))))

(declare-fun lt!149293 () SeekEntryResult!2282)

(assert (=> b!300090 (= res!158173 (or (= lt!149293 (MissingZero!2282 i!1256)) (= lt!149293 (MissingVacant!2282 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15144 (_ BitVec 32)) SeekEntryResult!2282)

(assert (=> b!300090 (= lt!149293 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300091 () Bool)

(declare-fun res!158172 () Bool)

(assert (=> b!300091 (=> (not res!158172) (not e!189516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300091 (= res!158172 (validKeyInArray!0 k0!2524))))

(declare-fun res!158170 () Bool)

(assert (=> start!29806 (=> (not res!158170) (not e!189516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29806 (= res!158170 (validMask!0 mask!3809))))

(assert (=> start!29806 e!189516))

(assert (=> start!29806 true))

(declare-fun array_inv!5118 (array!15144) Bool)

(assert (=> start!29806 (array_inv!5118 a!3312)))

(declare-fun b!300092 () Bool)

(declare-fun res!158175 () Bool)

(assert (=> b!300092 (=> (not res!158175) (not e!189514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15144 (_ BitVec 32)) Bool)

(assert (=> b!300092 (= res!158175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300093 () Bool)

(declare-fun res!158171 () Bool)

(assert (=> b!300093 (=> (not res!158171) (not e!189516))))

(declare-fun arrayContainsKey!0 (array!15144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300093 (= res!158171 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29806 res!158170) b!300089))

(assert (= (and b!300089 res!158174) b!300091))

(assert (= (and b!300091 res!158172) b!300093))

(assert (= (and b!300093 res!158171) b!300090))

(assert (= (and b!300090 res!158173) b!300092))

(assert (= (and b!300092 res!158175) b!300088))

(declare-fun m!312285 () Bool)

(assert (=> b!300092 m!312285))

(declare-fun m!312287 () Bool)

(assert (=> b!300090 m!312287))

(declare-fun m!312289 () Bool)

(assert (=> b!300088 m!312289))

(declare-fun m!312291 () Bool)

(assert (=> b!300088 m!312291))

(declare-fun m!312293 () Bool)

(assert (=> b!300088 m!312293))

(declare-fun m!312295 () Bool)

(assert (=> b!300088 m!312295))

(declare-fun m!312297 () Bool)

(assert (=> b!300093 m!312297))

(declare-fun m!312299 () Bool)

(assert (=> start!29806 m!312299))

(declare-fun m!312301 () Bool)

(assert (=> start!29806 m!312301))

(declare-fun m!312303 () Bool)

(assert (=> b!300091 m!312303))

(check-sat (not b!300093) (not b!300088) (not b!300090) (not b!300092) (not b!300091) (not start!29806))
(check-sat)
