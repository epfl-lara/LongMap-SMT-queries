; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29312 () Bool)

(assert start!29312)

(declare-fun b!296895 () Bool)

(declare-fun e!187634 () Bool)

(declare-fun e!187636 () Bool)

(assert (=> b!296895 (= e!187634 e!187636)))

(declare-fun res!156556 () Bool)

(assert (=> b!296895 (=> (not res!156556) (not e!187636))))

(declare-fun lt!147411 () Bool)

(assert (=> b!296895 (= res!156556 lt!147411)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147413 () (_ BitVec 32))

(declare-datatypes ((array!15028 0))(
  ( (array!15029 (arr!7122 (Array (_ BitVec 32) (_ BitVec 64))) (size!7475 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15028)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2270 0))(
  ( (MissingZero!2270 (index!11250 (_ BitVec 32))) (Found!2270 (index!11251 (_ BitVec 32))) (Intermediate!2270 (undefined!3082 Bool) (index!11252 (_ BitVec 32)) (x!29482 (_ BitVec 32))) (Undefined!2270) (MissingVacant!2270 (index!11253 (_ BitVec 32))) )
))
(declare-fun lt!147409 () SeekEntryResult!2270)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15028 (_ BitVec 32)) SeekEntryResult!2270)

(assert (=> b!296895 (= lt!147409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147413 k0!2524 (array!15029 (store (arr!7122 a!3312) i!1256 k0!2524) (size!7475 a!3312)) mask!3809))))

(declare-fun lt!147410 () SeekEntryResult!2270)

(assert (=> b!296895 (= lt!147410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147413 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296895 (= lt!147413 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296896 () Bool)

(declare-fun res!156549 () Bool)

(declare-fun e!187635 () Bool)

(assert (=> b!296896 (=> (not res!156549) (not e!187635))))

(assert (=> b!296896 (= res!156549 (and (= (size!7475 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7475 a!3312))))))

(declare-fun b!296897 () Bool)

(declare-fun res!156555 () Bool)

(assert (=> b!296897 (=> (not res!156555) (not e!187635))))

(declare-fun arrayContainsKey!0 (array!15028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296897 (= res!156555 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296898 () Bool)

(declare-fun res!156551 () Bool)

(assert (=> b!296898 (=> (not res!156551) (not e!187634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15028 (_ BitVec 32)) Bool)

(assert (=> b!296898 (= res!156551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!156550 () Bool)

(assert (=> start!29312 (=> (not res!156550) (not e!187635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29312 (= res!156550 (validMask!0 mask!3809))))

(assert (=> start!29312 e!187635))

(assert (=> start!29312 true))

(declare-fun array_inv!5094 (array!15028) Bool)

(assert (=> start!29312 (array_inv!5094 a!3312)))

(declare-fun b!296899 () Bool)

(declare-fun res!156553 () Bool)

(assert (=> b!296899 (=> (not res!156553) (not e!187635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296899 (= res!156553 (validKeyInArray!0 k0!2524))))

(declare-fun e!187633 () Bool)

(declare-fun b!296900 () Bool)

(assert (=> b!296900 (= e!187633 (not (= (select (store (arr!7122 a!3312) i!1256 k0!2524) (index!11252 lt!147410)) k0!2524)))))

(assert (=> b!296900 (= lt!147409 lt!147410)))

(declare-datatypes ((Unit!9202 0))(
  ( (Unit!9203) )
))
(declare-fun lt!147412 () Unit!9202)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15028 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9202)

(assert (=> b!296900 (= lt!147412 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147413 (index!11252 lt!147410) (x!29482 lt!147410) mask!3809))))

(assert (=> b!296900 (and (= (select (arr!7122 a!3312) (index!11252 lt!147410)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11252 lt!147410) i!1256))))

(declare-fun b!296901 () Bool)

(assert (=> b!296901 (= e!187636 e!187633)))

(declare-fun res!156554 () Bool)

(assert (=> b!296901 (=> (not res!156554) (not e!187633))))

(declare-fun lt!147408 () Bool)

(assert (=> b!296901 (= res!156554 (and (or lt!147408 (not (undefined!3082 lt!147410))) (or lt!147408 (not (= (select (arr!7122 a!3312) (index!11252 lt!147410)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147408 (not (= (select (arr!7122 a!3312) (index!11252 lt!147410)) k0!2524))) (not lt!147408)))))

(get-info :version)

(assert (=> b!296901 (= lt!147408 (not ((_ is Intermediate!2270) lt!147410)))))

(declare-fun b!296902 () Bool)

(assert (=> b!296902 (= e!187635 e!187634)))

(declare-fun res!156552 () Bool)

(assert (=> b!296902 (=> (not res!156552) (not e!187634))))

(declare-fun lt!147414 () SeekEntryResult!2270)

(assert (=> b!296902 (= res!156552 (or lt!147411 (= lt!147414 (MissingVacant!2270 i!1256))))))

(assert (=> b!296902 (= lt!147411 (= lt!147414 (MissingZero!2270 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15028 (_ BitVec 32)) SeekEntryResult!2270)

(assert (=> b!296902 (= lt!147414 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29312 res!156550) b!296896))

(assert (= (and b!296896 res!156549) b!296899))

(assert (= (and b!296899 res!156553) b!296897))

(assert (= (and b!296897 res!156555) b!296902))

(assert (= (and b!296902 res!156552) b!296898))

(assert (= (and b!296898 res!156551) b!296895))

(assert (= (and b!296895 res!156556) b!296901))

(assert (= (and b!296901 res!156554) b!296900))

(declare-fun m!309267 () Bool)

(assert (=> start!29312 m!309267))

(declare-fun m!309269 () Bool)

(assert (=> start!29312 m!309269))

(declare-fun m!309271 () Bool)

(assert (=> b!296895 m!309271))

(declare-fun m!309273 () Bool)

(assert (=> b!296895 m!309273))

(declare-fun m!309275 () Bool)

(assert (=> b!296895 m!309275))

(declare-fun m!309277 () Bool)

(assert (=> b!296895 m!309277))

(declare-fun m!309279 () Bool)

(assert (=> b!296898 m!309279))

(declare-fun m!309281 () Bool)

(assert (=> b!296897 m!309281))

(declare-fun m!309283 () Bool)

(assert (=> b!296902 m!309283))

(declare-fun m!309285 () Bool)

(assert (=> b!296901 m!309285))

(declare-fun m!309287 () Bool)

(assert (=> b!296899 m!309287))

(assert (=> b!296900 m!309271))

(declare-fun m!309289 () Bool)

(assert (=> b!296900 m!309289))

(declare-fun m!309291 () Bool)

(assert (=> b!296900 m!309291))

(assert (=> b!296900 m!309285))

(check-sat (not b!296902) (not b!296897) (not b!296895) (not start!29312) (not b!296898) (not b!296899) (not b!296900))
(check-sat)
