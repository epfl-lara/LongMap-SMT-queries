; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44456 () Bool)

(assert start!44456)

(declare-fun b!488324 () Bool)

(declare-fun res!291542 () Bool)

(declare-fun e!287260 () Bool)

(assert (=> b!488324 (=> (not res!291542) (not e!287260))))

(declare-datatypes ((array!31612 0))(
  ( (array!31613 (arr!15196 (Array (_ BitVec 32) (_ BitVec 64))) (size!15560 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31612)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488324 (= res!291542 (validKeyInArray!0 (select (arr!15196 a!3235) j!176)))))

(declare-fun b!488325 () Bool)

(declare-fun e!287259 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!488325 (= e!287259 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(declare-fun e!287262 () Bool)

(assert (=> b!488325 e!287262))

(declare-fun res!291547 () Bool)

(assert (=> b!488325 (=> (not res!291547) (not e!287262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31612 (_ BitVec 32)) Bool)

(assert (=> b!488325 (= res!291547 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14245 0))(
  ( (Unit!14246) )
))
(declare-fun lt!220395 () Unit!14245)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14245)

(assert (=> b!488325 (= lt!220395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488326 () Bool)

(declare-datatypes ((SeekEntryResult!3619 0))(
  ( (MissingZero!3619 (index!16655 (_ BitVec 32))) (Found!3619 (index!16656 (_ BitVec 32))) (Intermediate!3619 (undefined!4431 Bool) (index!16657 (_ BitVec 32)) (x!45919 (_ BitVec 32))) (Undefined!3619) (MissingVacant!3619 (index!16658 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31612 (_ BitVec 32)) SeekEntryResult!3619)

(assert (=> b!488326 (= e!287262 (= (seekEntryOrOpen!0 (select (arr!15196 a!3235) j!176) a!3235 mask!3524) (Found!3619 j!176)))))

(declare-fun b!488327 () Bool)

(declare-fun res!291539 () Bool)

(assert (=> b!488327 (=> (not res!291539) (not e!287260))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488327 (= res!291539 (and (= (size!15560 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15560 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15560 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488328 () Bool)

(assert (=> b!488328 (= e!287260 e!287259)))

(declare-fun res!291540 () Bool)

(assert (=> b!488328 (=> (not res!291540) (not e!287259))))

(declare-fun lt!220396 () SeekEntryResult!3619)

(assert (=> b!488328 (= res!291540 (or (= lt!220396 (MissingZero!3619 i!1204)) (= lt!220396 (MissingVacant!3619 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!488328 (= lt!220396 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488329 () Bool)

(declare-fun res!291545 () Bool)

(assert (=> b!488329 (=> (not res!291545) (not e!287260))))

(assert (=> b!488329 (= res!291545 (validKeyInArray!0 k0!2280))))

(declare-fun b!488330 () Bool)

(declare-fun res!291544 () Bool)

(assert (=> b!488330 (=> (not res!291544) (not e!287259))))

(declare-datatypes ((List!9261 0))(
  ( (Nil!9258) (Cons!9257 (h!10116 (_ BitVec 64)) (t!15481 List!9261)) )
))
(declare-fun arrayNoDuplicates!0 (array!31612 (_ BitVec 32) List!9261) Bool)

(assert (=> b!488330 (= res!291544 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9258))))

(declare-fun res!291541 () Bool)

(assert (=> start!44456 (=> (not res!291541) (not e!287260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44456 (= res!291541 (validMask!0 mask!3524))))

(assert (=> start!44456 e!287260))

(assert (=> start!44456 true))

(declare-fun array_inv!11055 (array!31612) Bool)

(assert (=> start!44456 (array_inv!11055 a!3235)))

(declare-fun b!488331 () Bool)

(declare-fun res!291543 () Bool)

(assert (=> b!488331 (=> (not res!291543) (not e!287260))))

(declare-fun arrayContainsKey!0 (array!31612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488331 (= res!291543 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488332 () Bool)

(declare-fun res!291546 () Bool)

(assert (=> b!488332 (=> (not res!291546) (not e!287259))))

(assert (=> b!488332 (= res!291546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44456 res!291541) b!488327))

(assert (= (and b!488327 res!291539) b!488324))

(assert (= (and b!488324 res!291542) b!488329))

(assert (= (and b!488329 res!291545) b!488331))

(assert (= (and b!488331 res!291543) b!488328))

(assert (= (and b!488328 res!291540) b!488332))

(assert (= (and b!488332 res!291546) b!488330))

(assert (= (and b!488330 res!291544) b!488325))

(assert (= (and b!488325 res!291547) b!488326))

(declare-fun m!468307 () Bool)

(assert (=> b!488324 m!468307))

(assert (=> b!488324 m!468307))

(declare-fun m!468309 () Bool)

(assert (=> b!488324 m!468309))

(assert (=> b!488326 m!468307))

(assert (=> b!488326 m!468307))

(declare-fun m!468311 () Bool)

(assert (=> b!488326 m!468311))

(declare-fun m!468313 () Bool)

(assert (=> start!44456 m!468313))

(declare-fun m!468315 () Bool)

(assert (=> start!44456 m!468315))

(declare-fun m!468317 () Bool)

(assert (=> b!488328 m!468317))

(declare-fun m!468319 () Bool)

(assert (=> b!488331 m!468319))

(declare-fun m!468321 () Bool)

(assert (=> b!488332 m!468321))

(declare-fun m!468323 () Bool)

(assert (=> b!488329 m!468323))

(declare-fun m!468325 () Bool)

(assert (=> b!488325 m!468325))

(declare-fun m!468327 () Bool)

(assert (=> b!488325 m!468327))

(declare-fun m!468329 () Bool)

(assert (=> b!488330 m!468329))

(check-sat (not b!488330) (not b!488328) (not b!488332) (not b!488331) (not b!488325) (not start!44456) (not b!488324) (not b!488329) (not b!488326))
(check-sat)
(get-model)

(declare-fun d!77821 () Bool)

(assert (=> d!77821 (= (validKeyInArray!0 (select (arr!15196 a!3235) j!176)) (and (not (= (select (arr!15196 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15196 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488324 d!77821))

(declare-fun d!77823 () Bool)

(assert (=> d!77823 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44456 d!77823))

(declare-fun d!77827 () Bool)

(assert (=> d!77827 (= (array_inv!11055 a!3235) (bvsge (size!15560 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44456 d!77827))

(declare-fun d!77831 () Bool)

(assert (=> d!77831 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488329 d!77831))

(declare-fun b!488447 () Bool)

(declare-fun e!287328 () SeekEntryResult!3619)

(declare-fun lt!220425 () SeekEntryResult!3619)

(assert (=> b!488447 (= e!287328 (Found!3619 (index!16657 lt!220425)))))

(declare-fun b!488448 () Bool)

(declare-fun c!58683 () Bool)

(declare-fun lt!220426 () (_ BitVec 64))

(assert (=> b!488448 (= c!58683 (= lt!220426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287326 () SeekEntryResult!3619)

(assert (=> b!488448 (= e!287328 e!287326)))

(declare-fun b!488449 () Bool)

(declare-fun e!287327 () SeekEntryResult!3619)

(assert (=> b!488449 (= e!287327 e!287328)))

(assert (=> b!488449 (= lt!220426 (select (arr!15196 a!3235) (index!16657 lt!220425)))))

(declare-fun c!58684 () Bool)

(assert (=> b!488449 (= c!58684 (= lt!220426 k0!2280))))

(declare-fun b!488450 () Bool)

(assert (=> b!488450 (= e!287327 Undefined!3619)))

(declare-fun d!77833 () Bool)

(declare-fun lt!220424 () SeekEntryResult!3619)

(get-info :version)

(assert (=> d!77833 (and (or ((_ is Undefined!3619) lt!220424) (not ((_ is Found!3619) lt!220424)) (and (bvsge (index!16656 lt!220424) #b00000000000000000000000000000000) (bvslt (index!16656 lt!220424) (size!15560 a!3235)))) (or ((_ is Undefined!3619) lt!220424) ((_ is Found!3619) lt!220424) (not ((_ is MissingZero!3619) lt!220424)) (and (bvsge (index!16655 lt!220424) #b00000000000000000000000000000000) (bvslt (index!16655 lt!220424) (size!15560 a!3235)))) (or ((_ is Undefined!3619) lt!220424) ((_ is Found!3619) lt!220424) ((_ is MissingZero!3619) lt!220424) (not ((_ is MissingVacant!3619) lt!220424)) (and (bvsge (index!16658 lt!220424) #b00000000000000000000000000000000) (bvslt (index!16658 lt!220424) (size!15560 a!3235)))) (or ((_ is Undefined!3619) lt!220424) (ite ((_ is Found!3619) lt!220424) (= (select (arr!15196 a!3235) (index!16656 lt!220424)) k0!2280) (ite ((_ is MissingZero!3619) lt!220424) (= (select (arr!15196 a!3235) (index!16655 lt!220424)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3619) lt!220424) (= (select (arr!15196 a!3235) (index!16658 lt!220424)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77833 (= lt!220424 e!287327)))

(declare-fun c!58685 () Bool)

(assert (=> d!77833 (= c!58685 (and ((_ is Intermediate!3619) lt!220425) (undefined!4431 lt!220425)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31612 (_ BitVec 32)) SeekEntryResult!3619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77833 (= lt!220425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77833 (validMask!0 mask!3524)))

(assert (=> d!77833 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220424)))

(declare-fun b!488451 () Bool)

(assert (=> b!488451 (= e!287326 (MissingZero!3619 (index!16657 lt!220425)))))

(declare-fun b!488452 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31612 (_ BitVec 32)) SeekEntryResult!3619)

(assert (=> b!488452 (= e!287326 (seekKeyOrZeroReturnVacant!0 (x!45919 lt!220425) (index!16657 lt!220425) (index!16657 lt!220425) k0!2280 a!3235 mask!3524))))

(assert (= (and d!77833 c!58685) b!488450))

(assert (= (and d!77833 (not c!58685)) b!488449))

(assert (= (and b!488449 c!58684) b!488447))

(assert (= (and b!488449 (not c!58684)) b!488448))

(assert (= (and b!488448 c!58683) b!488451))

(assert (= (and b!488448 (not c!58683)) b!488452))

(declare-fun m!468409 () Bool)

(assert (=> b!488449 m!468409))

(declare-fun m!468411 () Bool)

(assert (=> d!77833 m!468411))

(declare-fun m!468413 () Bool)

(assert (=> d!77833 m!468413))

(assert (=> d!77833 m!468313))

(declare-fun m!468415 () Bool)

(assert (=> d!77833 m!468415))

(declare-fun m!468417 () Bool)

(assert (=> d!77833 m!468417))

(declare-fun m!468419 () Bool)

(assert (=> d!77833 m!468419))

(assert (=> d!77833 m!468415))

(declare-fun m!468421 () Bool)

(assert (=> b!488452 m!468421))

(assert (=> b!488328 d!77833))

(declare-fun bm!31322 () Bool)

(declare-fun call!31326 () Bool)

(assert (=> bm!31322 (= call!31326 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!77851 () Bool)

(declare-fun res!291635 () Bool)

(declare-fun e!287354 () Bool)

(assert (=> d!77851 (=> res!291635 e!287354)))

(assert (=> d!77851 (= res!291635 (bvsge #b00000000000000000000000000000000 (size!15560 a!3235)))))

(assert (=> d!77851 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287354)))

(declare-fun b!488487 () Bool)

(declare-fun e!287353 () Bool)

(assert (=> b!488487 (= e!287353 call!31326)))

(declare-fun b!488488 () Bool)

(declare-fun e!287356 () Bool)

(assert (=> b!488488 (= e!287354 e!287356)))

(declare-fun c!58696 () Bool)

(assert (=> b!488488 (= c!58696 (validKeyInArray!0 (select (arr!15196 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488489 () Bool)

(assert (=> b!488489 (= e!287356 e!287353)))

(declare-fun lt!220452 () (_ BitVec 64))

(assert (=> b!488489 (= lt!220452 (select (arr!15196 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220451 () Unit!14245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31612 (_ BitVec 64) (_ BitVec 32)) Unit!14245)

(assert (=> b!488489 (= lt!220451 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220452 #b00000000000000000000000000000000))))

(assert (=> b!488489 (arrayContainsKey!0 a!3235 lt!220452 #b00000000000000000000000000000000)))

(declare-fun lt!220453 () Unit!14245)

(assert (=> b!488489 (= lt!220453 lt!220451)))

(declare-fun res!291634 () Bool)

(assert (=> b!488489 (= res!291634 (= (seekEntryOrOpen!0 (select (arr!15196 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3619 #b00000000000000000000000000000000)))))

(assert (=> b!488489 (=> (not res!291634) (not e!287353))))

(declare-fun b!488490 () Bool)

(assert (=> b!488490 (= e!287356 call!31326)))

(assert (= (and d!77851 (not res!291635)) b!488488))

(assert (= (and b!488488 c!58696) b!488489))

(assert (= (and b!488488 (not c!58696)) b!488490))

(assert (= (and b!488489 res!291634) b!488487))

(assert (= (or b!488487 b!488490) bm!31322))

(declare-fun m!468451 () Bool)

(assert (=> bm!31322 m!468451))

(declare-fun m!468453 () Bool)

(assert (=> b!488488 m!468453))

(assert (=> b!488488 m!468453))

(declare-fun m!468455 () Bool)

(assert (=> b!488488 m!468455))

(assert (=> b!488489 m!468453))

(declare-fun m!468457 () Bool)

(assert (=> b!488489 m!468457))

(declare-fun m!468459 () Bool)

(assert (=> b!488489 m!468459))

(assert (=> b!488489 m!468453))

(declare-fun m!468461 () Bool)

(assert (=> b!488489 m!468461))

(assert (=> b!488332 d!77851))

(declare-fun b!488495 () Bool)

(declare-fun e!287361 () SeekEntryResult!3619)

(declare-fun lt!220458 () SeekEntryResult!3619)

(assert (=> b!488495 (= e!287361 (Found!3619 (index!16657 lt!220458)))))

(declare-fun b!488496 () Bool)

(declare-fun c!58698 () Bool)

(declare-fun lt!220459 () (_ BitVec 64))

(assert (=> b!488496 (= c!58698 (= lt!220459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287359 () SeekEntryResult!3619)

(assert (=> b!488496 (= e!287361 e!287359)))

(declare-fun b!488497 () Bool)

(declare-fun e!287360 () SeekEntryResult!3619)

(assert (=> b!488497 (= e!287360 e!287361)))

(assert (=> b!488497 (= lt!220459 (select (arr!15196 a!3235) (index!16657 lt!220458)))))

(declare-fun c!58699 () Bool)

(assert (=> b!488497 (= c!58699 (= lt!220459 (select (arr!15196 a!3235) j!176)))))

(declare-fun b!488498 () Bool)

(assert (=> b!488498 (= e!287360 Undefined!3619)))

(declare-fun d!77863 () Bool)

(declare-fun lt!220457 () SeekEntryResult!3619)

(assert (=> d!77863 (and (or ((_ is Undefined!3619) lt!220457) (not ((_ is Found!3619) lt!220457)) (and (bvsge (index!16656 lt!220457) #b00000000000000000000000000000000) (bvslt (index!16656 lt!220457) (size!15560 a!3235)))) (or ((_ is Undefined!3619) lt!220457) ((_ is Found!3619) lt!220457) (not ((_ is MissingZero!3619) lt!220457)) (and (bvsge (index!16655 lt!220457) #b00000000000000000000000000000000) (bvslt (index!16655 lt!220457) (size!15560 a!3235)))) (or ((_ is Undefined!3619) lt!220457) ((_ is Found!3619) lt!220457) ((_ is MissingZero!3619) lt!220457) (not ((_ is MissingVacant!3619) lt!220457)) (and (bvsge (index!16658 lt!220457) #b00000000000000000000000000000000) (bvslt (index!16658 lt!220457) (size!15560 a!3235)))) (or ((_ is Undefined!3619) lt!220457) (ite ((_ is Found!3619) lt!220457) (= (select (arr!15196 a!3235) (index!16656 lt!220457)) (select (arr!15196 a!3235) j!176)) (ite ((_ is MissingZero!3619) lt!220457) (= (select (arr!15196 a!3235) (index!16655 lt!220457)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3619) lt!220457) (= (select (arr!15196 a!3235) (index!16658 lt!220457)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77863 (= lt!220457 e!287360)))

(declare-fun c!58700 () Bool)

(assert (=> d!77863 (= c!58700 (and ((_ is Intermediate!3619) lt!220458) (undefined!4431 lt!220458)))))

(assert (=> d!77863 (= lt!220458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15196 a!3235) j!176) mask!3524) (select (arr!15196 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77863 (validMask!0 mask!3524)))

(assert (=> d!77863 (= (seekEntryOrOpen!0 (select (arr!15196 a!3235) j!176) a!3235 mask!3524) lt!220457)))

(declare-fun b!488499 () Bool)

(assert (=> b!488499 (= e!287359 (MissingZero!3619 (index!16657 lt!220458)))))

(declare-fun b!488500 () Bool)

(assert (=> b!488500 (= e!287359 (seekKeyOrZeroReturnVacant!0 (x!45919 lt!220458) (index!16657 lt!220458) (index!16657 lt!220458) (select (arr!15196 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!77863 c!58700) b!488498))

(assert (= (and d!77863 (not c!58700)) b!488497))

(assert (= (and b!488497 c!58699) b!488495))

(assert (= (and b!488497 (not c!58699)) b!488496))

(assert (= (and b!488496 c!58698) b!488499))

(assert (= (and b!488496 (not c!58698)) b!488500))

(declare-fun m!468463 () Bool)

(assert (=> b!488497 m!468463))

(declare-fun m!468465 () Bool)

(assert (=> d!77863 m!468465))

(declare-fun m!468467 () Bool)

(assert (=> d!77863 m!468467))

(assert (=> d!77863 m!468313))

(declare-fun m!468469 () Bool)

(assert (=> d!77863 m!468469))

(assert (=> d!77863 m!468307))

(declare-fun m!468471 () Bool)

(assert (=> d!77863 m!468471))

(declare-fun m!468473 () Bool)

(assert (=> d!77863 m!468473))

(assert (=> d!77863 m!468307))

(assert (=> d!77863 m!468469))

(assert (=> b!488500 m!468307))

(declare-fun m!468475 () Bool)

(assert (=> b!488500 m!468475))

(assert (=> b!488326 d!77863))

(declare-fun d!77865 () Bool)

(declare-fun res!291652 () Bool)

(declare-fun e!287378 () Bool)

(assert (=> d!77865 (=> res!291652 e!287378)))

(assert (=> d!77865 (= res!291652 (= (select (arr!15196 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77865 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287378)))

(declare-fun b!488519 () Bool)

(declare-fun e!287379 () Bool)

(assert (=> b!488519 (= e!287378 e!287379)))

(declare-fun res!291653 () Bool)

(assert (=> b!488519 (=> (not res!291653) (not e!287379))))

(assert (=> b!488519 (= res!291653 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15560 a!3235)))))

(declare-fun b!488520 () Bool)

(assert (=> b!488520 (= e!287379 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77865 (not res!291652)) b!488519))

(assert (= (and b!488519 res!291653) b!488520))

(assert (=> d!77865 m!468453))

(declare-fun m!468495 () Bool)

(assert (=> b!488520 m!468495))

(assert (=> b!488331 d!77865))

(declare-fun call!31329 () Bool)

(declare-fun bm!31326 () Bool)

(assert (=> bm!31326 (= call!31329 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!77877 () Bool)

(declare-fun res!291655 () Bool)

(declare-fun e!287381 () Bool)

(assert (=> d!77877 (=> res!291655 e!287381)))

(assert (=> d!77877 (= res!291655 (bvsge j!176 (size!15560 a!3235)))))

(assert (=> d!77877 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287381)))

(declare-fun b!488521 () Bool)

(declare-fun e!287380 () Bool)

(assert (=> b!488521 (= e!287380 call!31329)))

(declare-fun b!488522 () Bool)

(declare-fun e!287382 () Bool)

(assert (=> b!488522 (= e!287381 e!287382)))

(declare-fun c!58703 () Bool)

(assert (=> b!488522 (= c!58703 (validKeyInArray!0 (select (arr!15196 a!3235) j!176)))))

(declare-fun b!488523 () Bool)

(assert (=> b!488523 (= e!287382 e!287380)))

(declare-fun lt!220470 () (_ BitVec 64))

(assert (=> b!488523 (= lt!220470 (select (arr!15196 a!3235) j!176))))

(declare-fun lt!220469 () Unit!14245)

(assert (=> b!488523 (= lt!220469 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220470 j!176))))

(assert (=> b!488523 (arrayContainsKey!0 a!3235 lt!220470 #b00000000000000000000000000000000)))

(declare-fun lt!220471 () Unit!14245)

(assert (=> b!488523 (= lt!220471 lt!220469)))

(declare-fun res!291654 () Bool)

(assert (=> b!488523 (= res!291654 (= (seekEntryOrOpen!0 (select (arr!15196 a!3235) j!176) a!3235 mask!3524) (Found!3619 j!176)))))

(assert (=> b!488523 (=> (not res!291654) (not e!287380))))

(declare-fun b!488524 () Bool)

(assert (=> b!488524 (= e!287382 call!31329)))

(assert (= (and d!77877 (not res!291655)) b!488522))

(assert (= (and b!488522 c!58703) b!488523))

(assert (= (and b!488522 (not c!58703)) b!488524))

(assert (= (and b!488523 res!291654) b!488521))

(assert (= (or b!488521 b!488524) bm!31326))

(declare-fun m!468497 () Bool)

(assert (=> bm!31326 m!468497))

(assert (=> b!488522 m!468307))

(assert (=> b!488522 m!468307))

(assert (=> b!488522 m!468309))

(assert (=> b!488523 m!468307))

(declare-fun m!468499 () Bool)

(assert (=> b!488523 m!468499))

(declare-fun m!468501 () Bool)

(assert (=> b!488523 m!468501))

(assert (=> b!488523 m!468307))

(assert (=> b!488523 m!468311))

(assert (=> b!488325 d!77877))

(declare-fun d!77879 () Bool)

(assert (=> d!77879 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220477 () Unit!14245)

(declare-fun choose!38 (array!31612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14245)

(assert (=> d!77879 (= lt!220477 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77879 (validMask!0 mask!3524)))

(assert (=> d!77879 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220477)))

(declare-fun bs!15586 () Bool)

(assert (= bs!15586 d!77879))

(assert (=> bs!15586 m!468325))

(declare-fun m!468505 () Bool)

(assert (=> bs!15586 m!468505))

(assert (=> bs!15586 m!468313))

(assert (=> b!488325 d!77879))

(declare-fun bm!31329 () Bool)

(declare-fun call!31332 () Bool)

(declare-fun c!58706 () Bool)

(assert (=> bm!31329 (= call!31332 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58706 (Cons!9257 (select (arr!15196 a!3235) #b00000000000000000000000000000000) Nil!9258) Nil!9258)))))

(declare-fun b!488535 () Bool)

(declare-fun e!287393 () Bool)

(declare-fun e!287392 () Bool)

(assert (=> b!488535 (= e!287393 e!287392)))

(assert (=> b!488535 (= c!58706 (validKeyInArray!0 (select (arr!15196 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488536 () Bool)

(declare-fun e!287391 () Bool)

(declare-fun contains!2682 (List!9261 (_ BitVec 64)) Bool)

(assert (=> b!488536 (= e!287391 (contains!2682 Nil!9258 (select (arr!15196 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488537 () Bool)

(assert (=> b!488537 (= e!287392 call!31332)))

(declare-fun b!488538 () Bool)

(assert (=> b!488538 (= e!287392 call!31332)))

(declare-fun d!77881 () Bool)

(declare-fun res!291664 () Bool)

(declare-fun e!287394 () Bool)

(assert (=> d!77881 (=> res!291664 e!287394)))

(assert (=> d!77881 (= res!291664 (bvsge #b00000000000000000000000000000000 (size!15560 a!3235)))))

(assert (=> d!77881 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9258) e!287394)))

(declare-fun b!488539 () Bool)

(assert (=> b!488539 (= e!287394 e!287393)))

(declare-fun res!291663 () Bool)

(assert (=> b!488539 (=> (not res!291663) (not e!287393))))

(assert (=> b!488539 (= res!291663 (not e!287391))))

(declare-fun res!291662 () Bool)

(assert (=> b!488539 (=> (not res!291662) (not e!287391))))

(assert (=> b!488539 (= res!291662 (validKeyInArray!0 (select (arr!15196 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77881 (not res!291664)) b!488539))

(assert (= (and b!488539 res!291662) b!488536))

(assert (= (and b!488539 res!291663) b!488535))

(assert (= (and b!488535 c!58706) b!488537))

(assert (= (and b!488535 (not c!58706)) b!488538))

(assert (= (or b!488537 b!488538) bm!31329))

(assert (=> bm!31329 m!468453))

(declare-fun m!468507 () Bool)

(assert (=> bm!31329 m!468507))

(assert (=> b!488535 m!468453))

(assert (=> b!488535 m!468453))

(assert (=> b!488535 m!468455))

(assert (=> b!488536 m!468453))

(assert (=> b!488536 m!468453))

(declare-fun m!468509 () Bool)

(assert (=> b!488536 m!468509))

(assert (=> b!488539 m!468453))

(assert (=> b!488539 m!468453))

(assert (=> b!488539 m!468455))

(assert (=> b!488330 d!77881))

(check-sat (not b!488539) (not b!488536) (not b!488520) (not d!77879) (not d!77863) (not b!488523) (not bm!31329) (not d!77833) (not b!488522) (not b!488488) (not b!488500) (not b!488535) (not b!488489) (not b!488452) (not bm!31322) (not bm!31326))
(check-sat)
