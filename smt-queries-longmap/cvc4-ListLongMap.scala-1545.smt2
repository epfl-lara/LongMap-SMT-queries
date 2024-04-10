; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29252 () Bool)

(assert start!29252)

(declare-fun b!296614 () Bool)

(declare-fun e!187465 () Bool)

(declare-fun e!187468 () Bool)

(assert (=> b!296614 (= e!187465 e!187468)))

(declare-fun res!156283 () Bool)

(assert (=> b!296614 (=> (not res!156283) (not e!187468))))

(declare-fun lt!147283 () Bool)

(assert (=> b!296614 (= res!156283 lt!147283)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147281 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2263 0))(
  ( (MissingZero!2263 (index!11222 (_ BitVec 32))) (Found!2263 (index!11223 (_ BitVec 32))) (Intermediate!2263 (undefined!3075 Bool) (index!11224 (_ BitVec 32)) (x!29433 (_ BitVec 32))) (Undefined!2263) (MissingVacant!2263 (index!11225 (_ BitVec 32))) )
))
(declare-fun lt!147282 () SeekEntryResult!2263)

(declare-datatypes ((array!15010 0))(
  ( (array!15011 (arr!7114 (Array (_ BitVec 32) (_ BitVec 64))) (size!7466 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15010)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15010 (_ BitVec 32)) SeekEntryResult!2263)

(assert (=> b!296614 (= lt!147282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147281 k!2524 (array!15011 (store (arr!7114 a!3312) i!1256 k!2524) (size!7466 a!3312)) mask!3809))))

(declare-fun lt!147285 () SeekEntryResult!2263)

(assert (=> b!296614 (= lt!147285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147281 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296614 (= lt!147281 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296615 () Bool)

(declare-fun res!156287 () Bool)

(declare-fun e!187466 () Bool)

(assert (=> b!296615 (=> (not res!156287) (not e!187466))))

(assert (=> b!296615 (= res!156287 (and (= (size!7466 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7466 a!3312))))))

(declare-fun b!296616 () Bool)

(declare-fun res!156284 () Bool)

(assert (=> b!296616 (=> (not res!156284) (not e!187466))))

(declare-fun arrayContainsKey!0 (array!15010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296616 (= res!156284 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296617 () Bool)

(declare-fun res!156281 () Bool)

(assert (=> b!296617 (=> (not res!156281) (not e!187465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15010 (_ BitVec 32)) Bool)

(assert (=> b!296617 (= res!156281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296618 () Bool)

(declare-fun res!156286 () Bool)

(assert (=> b!296618 (=> (not res!156286) (not e!187466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296618 (= res!156286 (validKeyInArray!0 k!2524))))

(declare-fun res!156288 () Bool)

(assert (=> start!29252 (=> (not res!156288) (not e!187466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29252 (= res!156288 (validMask!0 mask!3809))))

(assert (=> start!29252 e!187466))

(assert (=> start!29252 true))

(declare-fun array_inv!5077 (array!15010) Bool)

(assert (=> start!29252 (array_inv!5077 a!3312)))

(declare-fun b!296619 () Bool)

(declare-fun e!187464 () Bool)

(assert (=> b!296619 (= e!187468 e!187464)))

(declare-fun res!156282 () Bool)

(assert (=> b!296619 (=> (not res!156282) (not e!187464))))

(declare-fun lt!147280 () Bool)

(assert (=> b!296619 (= res!156282 (and (or lt!147280 (not (undefined!3075 lt!147285))) (or lt!147280 (not (= (select (arr!7114 a!3312) (index!11224 lt!147285)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147280 (not (= (select (arr!7114 a!3312) (index!11224 lt!147285)) k!2524))) (not lt!147280)))))

(assert (=> b!296619 (= lt!147280 (not (is-Intermediate!2263 lt!147285)))))

(declare-fun b!296620 () Bool)

(assert (=> b!296620 (= e!187464 (not true))))

(assert (=> b!296620 (and (= (select (arr!7114 a!3312) (index!11224 lt!147285)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11224 lt!147285) i!1256))))

(declare-fun b!296621 () Bool)

(assert (=> b!296621 (= e!187466 e!187465)))

(declare-fun res!156285 () Bool)

(assert (=> b!296621 (=> (not res!156285) (not e!187465))))

(declare-fun lt!147284 () SeekEntryResult!2263)

(assert (=> b!296621 (= res!156285 (or lt!147283 (= lt!147284 (MissingVacant!2263 i!1256))))))

(assert (=> b!296621 (= lt!147283 (= lt!147284 (MissingZero!2263 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15010 (_ BitVec 32)) SeekEntryResult!2263)

(assert (=> b!296621 (= lt!147284 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29252 res!156288) b!296615))

(assert (= (and b!296615 res!156287) b!296618))

(assert (= (and b!296618 res!156286) b!296616))

(assert (= (and b!296616 res!156284) b!296621))

(assert (= (and b!296621 res!156285) b!296617))

(assert (= (and b!296617 res!156281) b!296614))

(assert (= (and b!296614 res!156283) b!296619))

(assert (= (and b!296619 res!156282) b!296620))

(declare-fun m!309545 () Bool)

(assert (=> start!29252 m!309545))

(declare-fun m!309547 () Bool)

(assert (=> start!29252 m!309547))

(declare-fun m!309549 () Bool)

(assert (=> b!296620 m!309549))

(declare-fun m!309551 () Bool)

(assert (=> b!296618 m!309551))

(assert (=> b!296619 m!309549))

(declare-fun m!309553 () Bool)

(assert (=> b!296617 m!309553))

(declare-fun m!309555 () Bool)

(assert (=> b!296614 m!309555))

(declare-fun m!309557 () Bool)

(assert (=> b!296614 m!309557))

(declare-fun m!309559 () Bool)

(assert (=> b!296614 m!309559))

(declare-fun m!309561 () Bool)

(assert (=> b!296614 m!309561))

(declare-fun m!309563 () Bool)

(assert (=> b!296616 m!309563))

(declare-fun m!309565 () Bool)

(assert (=> b!296621 m!309565))

(push 1)

(assert (not b!296614))

(assert (not b!296621))

(assert (not start!29252))

(assert (not b!296618))

(assert (not b!296617))

(assert (not b!296616))

(check-sat)

(pop 1)

