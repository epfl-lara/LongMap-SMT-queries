; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29242 () Bool)

(assert start!29242)

(declare-fun b!296631 () Bool)

(declare-fun e!187472 () Bool)

(declare-fun e!187469 () Bool)

(assert (=> b!296631 (= e!187472 e!187469)))

(declare-fun res!156261 () Bool)

(assert (=> b!296631 (=> (not res!156261) (not e!187469))))

(declare-fun lt!147310 () Bool)

(assert (=> b!296631 (= res!156261 lt!147310)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2225 0))(
  ( (MissingZero!2225 (index!11070 (_ BitVec 32))) (Found!2225 (index!11071 (_ BitVec 32))) (Intermediate!2225 (undefined!3037 Bool) (index!11072 (_ BitVec 32)) (x!29396 (_ BitVec 32))) (Undefined!2225) (MissingVacant!2225 (index!11073 (_ BitVec 32))) )
))
(declare-fun lt!147312 () SeekEntryResult!2225)

(declare-datatypes ((array!15003 0))(
  ( (array!15004 (arr!7111 (Array (_ BitVec 32) (_ BitVec 64))) (size!7463 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15003)

(declare-fun lt!147314 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15003 (_ BitVec 32)) SeekEntryResult!2225)

(assert (=> b!296631 (= lt!147312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147314 k0!2524 (array!15004 (store (arr!7111 a!3312) i!1256 k0!2524) (size!7463 a!3312)) mask!3809))))

(declare-fun lt!147311 () SeekEntryResult!2225)

(assert (=> b!296631 (= lt!147311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147314 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296631 (= lt!147314 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!156266 () Bool)

(declare-fun e!187470 () Bool)

(assert (=> start!29242 (=> (not res!156266) (not e!187470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29242 (= res!156266 (validMask!0 mask!3809))))

(assert (=> start!29242 e!187470))

(assert (=> start!29242 true))

(declare-fun array_inv!5061 (array!15003) Bool)

(assert (=> start!29242 (array_inv!5061 a!3312)))

(declare-fun b!296632 () Bool)

(declare-fun res!156265 () Bool)

(assert (=> b!296632 (=> (not res!156265) (not e!187470))))

(assert (=> b!296632 (= res!156265 (and (= (size!7463 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7463 a!3312))))))

(declare-fun b!296633 () Bool)

(assert (=> b!296633 (= e!187470 e!187472)))

(declare-fun res!156260 () Bool)

(assert (=> b!296633 (=> (not res!156260) (not e!187472))))

(declare-fun lt!147315 () SeekEntryResult!2225)

(assert (=> b!296633 (= res!156260 (or lt!147310 (= lt!147315 (MissingVacant!2225 i!1256))))))

(assert (=> b!296633 (= lt!147310 (= lt!147315 (MissingZero!2225 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15003 (_ BitVec 32)) SeekEntryResult!2225)

(assert (=> b!296633 (= lt!147315 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296634 () Bool)

(declare-fun res!156267 () Bool)

(assert (=> b!296634 (=> (not res!156267) (not e!187470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296634 (= res!156267 (validKeyInArray!0 k0!2524))))

(declare-fun b!296635 () Bool)

(declare-fun res!156263 () Bool)

(assert (=> b!296635 (=> (not res!156263) (not e!187472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15003 (_ BitVec 32)) Bool)

(assert (=> b!296635 (= res!156263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296636 () Bool)

(declare-fun e!187471 () Bool)

(assert (=> b!296636 (= e!187469 e!187471)))

(declare-fun res!156264 () Bool)

(assert (=> b!296636 (=> (not res!156264) (not e!187471))))

(declare-fun lt!147313 () Bool)

(assert (=> b!296636 (= res!156264 (and (or lt!147313 (not (undefined!3037 lt!147311))) (or lt!147313 (not (= (select (arr!7111 a!3312) (index!11072 lt!147311)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147313 (not (= (select (arr!7111 a!3312) (index!11072 lt!147311)) k0!2524))) (not lt!147313)))))

(get-info :version)

(assert (=> b!296636 (= lt!147313 (not ((_ is Intermediate!2225) lt!147311)))))

(declare-fun b!296637 () Bool)

(assert (=> b!296637 (= e!187471 (not true))))

(assert (=> b!296637 (and (= (select (arr!7111 a!3312) (index!11072 lt!147311)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11072 lt!147311) i!1256))))

(declare-fun b!296638 () Bool)

(declare-fun res!156262 () Bool)

(assert (=> b!296638 (=> (not res!156262) (not e!187470))))

(declare-fun arrayContainsKey!0 (array!15003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296638 (= res!156262 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29242 res!156266) b!296632))

(assert (= (and b!296632 res!156265) b!296634))

(assert (= (and b!296634 res!156267) b!296638))

(assert (= (and b!296638 res!156262) b!296633))

(assert (= (and b!296633 res!156260) b!296635))

(assert (= (and b!296635 res!156263) b!296631))

(assert (= (and b!296631 res!156261) b!296636))

(assert (= (and b!296636 res!156264) b!296637))

(declare-fun m!309731 () Bool)

(assert (=> b!296633 m!309731))

(declare-fun m!309733 () Bool)

(assert (=> start!29242 m!309733))

(declare-fun m!309735 () Bool)

(assert (=> start!29242 m!309735))

(declare-fun m!309737 () Bool)

(assert (=> b!296636 m!309737))

(declare-fun m!309739 () Bool)

(assert (=> b!296634 m!309739))

(declare-fun m!309741 () Bool)

(assert (=> b!296638 m!309741))

(declare-fun m!309743 () Bool)

(assert (=> b!296635 m!309743))

(assert (=> b!296637 m!309737))

(declare-fun m!309745 () Bool)

(assert (=> b!296631 m!309745))

(declare-fun m!309747 () Bool)

(assert (=> b!296631 m!309747))

(declare-fun m!309749 () Bool)

(assert (=> b!296631 m!309749))

(declare-fun m!309751 () Bool)

(assert (=> b!296631 m!309751))

(check-sat (not start!29242) (not b!296633) (not b!296638) (not b!296634) (not b!296631) (not b!296635))
(check-sat)
