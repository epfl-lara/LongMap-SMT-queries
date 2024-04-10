; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29528 () Bool)

(assert start!29528)

(declare-fun b!298443 () Bool)

(declare-fun res!157422 () Bool)

(declare-fun e!188545 () Bool)

(assert (=> b!298443 (=> (not res!157422) (not e!188545))))

(declare-datatypes ((array!15100 0))(
  ( (array!15101 (arr!7153 (Array (_ BitVec 32) (_ BitVec 64))) (size!7505 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15100)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298443 (= res!157422 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298444 () Bool)

(declare-fun e!188543 () Bool)

(assert (=> b!298444 (= e!188545 e!188543)))

(declare-fun res!157424 () Bool)

(assert (=> b!298444 (=> (not res!157424) (not e!188543))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148385 () Bool)

(declare-datatypes ((SeekEntryResult!2302 0))(
  ( (MissingZero!2302 (index!11381 (_ BitVec 32))) (Found!2302 (index!11382 (_ BitVec 32))) (Intermediate!2302 (undefined!3114 Bool) (index!11383 (_ BitVec 32)) (x!29603 (_ BitVec 32))) (Undefined!2302) (MissingVacant!2302 (index!11384 (_ BitVec 32))) )
))
(declare-fun lt!148389 () SeekEntryResult!2302)

(assert (=> b!298444 (= res!157424 (or lt!148385 (= lt!148389 (MissingVacant!2302 i!1256))))))

(assert (=> b!298444 (= lt!148385 (= lt!148389 (MissingZero!2302 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15100 (_ BitVec 32)) SeekEntryResult!2302)

(assert (=> b!298444 (= lt!148389 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298445 () Bool)

(declare-fun res!157425 () Bool)

(assert (=> b!298445 (=> (not res!157425) (not e!188543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15100 (_ BitVec 32)) Bool)

(assert (=> b!298445 (= res!157425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298446 () Bool)

(declare-fun res!157421 () Bool)

(assert (=> b!298446 (=> (not res!157421) (not e!188545))))

(assert (=> b!298446 (= res!157421 (and (= (size!7505 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7505 a!3312))))))

(declare-fun res!157423 () Bool)

(assert (=> start!29528 (=> (not res!157423) (not e!188545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29528 (= res!157423 (validMask!0 mask!3809))))

(assert (=> start!29528 e!188545))

(assert (=> start!29528 true))

(declare-fun array_inv!5116 (array!15100) Bool)

(assert (=> start!29528 (array_inv!5116 a!3312)))

(declare-fun b!298447 () Bool)

(declare-fun lt!148386 () SeekEntryResult!2302)

(assert (=> b!298447 (= e!188543 (and (not lt!148385) (= lt!148389 (MissingVacant!2302 i!1256)) (let ((bdg!6419 (not (is-Intermediate!2302 lt!148386)))) (and (or bdg!6419 (not (undefined!3114 lt!148386))) (not bdg!6419) (or (bvslt (index!11383 lt!148386) #b00000000000000000000000000000000) (bvsge (index!11383 lt!148386) (size!7505 a!3312)))))))))

(declare-fun lt!148388 () SeekEntryResult!2302)

(declare-fun lt!148387 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15100 (_ BitVec 32)) SeekEntryResult!2302)

(assert (=> b!298447 (= lt!148388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148387 k!2524 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312)) mask!3809))))

(assert (=> b!298447 (= lt!148386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148387 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298447 (= lt!148387 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298448 () Bool)

(declare-fun res!157420 () Bool)

(assert (=> b!298448 (=> (not res!157420) (not e!188545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298448 (= res!157420 (validKeyInArray!0 k!2524))))

(assert (= (and start!29528 res!157423) b!298446))

(assert (= (and b!298446 res!157421) b!298448))

(assert (= (and b!298448 res!157420) b!298443))

(assert (= (and b!298443 res!157422) b!298444))

(assert (= (and b!298444 res!157424) b!298445))

(assert (= (and b!298445 res!157425) b!298447))

(declare-fun m!310969 () Bool)

(assert (=> b!298447 m!310969))

(declare-fun m!310971 () Bool)

(assert (=> b!298447 m!310971))

(declare-fun m!310973 () Bool)

(assert (=> b!298447 m!310973))

(declare-fun m!310975 () Bool)

(assert (=> b!298447 m!310975))

(declare-fun m!310977 () Bool)

(assert (=> start!29528 m!310977))

(declare-fun m!310979 () Bool)

(assert (=> start!29528 m!310979))

(declare-fun m!310981 () Bool)

(assert (=> b!298443 m!310981))

(declare-fun m!310983 () Bool)

(assert (=> b!298448 m!310983))

(declare-fun m!310985 () Bool)

(assert (=> b!298445 m!310985))

(declare-fun m!310987 () Bool)

(assert (=> b!298444 m!310987))

(push 1)

(assert (not b!298448))

(assert (not b!298445))

(assert (not b!298444))

(assert (not start!29528))

(assert (not b!298447))

(assert (not b!298443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!298489 () Bool)

(declare-fun e!188577 () Bool)

(declare-fun e!188579 () Bool)

(assert (=> b!298489 (= e!188577 e!188579)))

(declare-fun lt!148409 () (_ BitVec 64))

(assert (=> b!298489 (= lt!148409 (select (arr!7153 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9313 0))(
  ( (Unit!9314) )
))
(declare-fun lt!148410 () Unit!9313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15100 (_ BitVec 64) (_ BitVec 32)) Unit!9313)

(assert (=> b!298489 (= lt!148410 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148409 #b00000000000000000000000000000000))))

(assert (=> b!298489 (arrayContainsKey!0 a!3312 lt!148409 #b00000000000000000000000000000000)))

(declare-fun lt!148411 () Unit!9313)

(assert (=> b!298489 (= lt!148411 lt!148410)))

(declare-fun res!157446 () Bool)

(assert (=> b!298489 (= res!157446 (= (seekEntryOrOpen!0 (select (arr!7153 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2302 #b00000000000000000000000000000000)))))

(assert (=> b!298489 (=> (not res!157446) (not e!188579))))

(declare-fun b!298490 () Bool)

(declare-fun call!25786 () Bool)

(assert (=> b!298490 (= e!188579 call!25786)))

(declare-fun bm!25783 () Bool)

(assert (=> bm!25783 (= call!25786 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298491 () Bool)

(assert (=> b!298491 (= e!188577 call!25786)))

(declare-fun b!298492 () Bool)

(declare-fun e!188578 () Bool)

(assert (=> b!298492 (= e!188578 e!188577)))

(declare-fun c!48108 () Bool)

(assert (=> b!298492 (= c!48108 (validKeyInArray!0 (select (arr!7153 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67361 () Bool)

(declare-fun res!157447 () Bool)

(assert (=> d!67361 (=> res!157447 e!188578)))

(assert (=> d!67361 (= res!157447 (bvsge #b00000000000000000000000000000000 (size!7505 a!3312)))))

(assert (=> d!67361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188578)))

(assert (= (and d!67361 (not res!157447)) b!298492))

(assert (= (and b!298492 c!48108) b!298489))

(assert (= (and b!298492 (not c!48108)) b!298491))

(assert (= (and b!298489 res!157446) b!298490))

(assert (= (or b!298490 b!298491) bm!25783))

(declare-fun m!311003 () Bool)

(assert (=> b!298489 m!311003))

(declare-fun m!311005 () Bool)

(assert (=> b!298489 m!311005))

(declare-fun m!311007 () Bool)

(assert (=> b!298489 m!311007))

(assert (=> b!298489 m!311003))

(declare-fun m!311009 () Bool)

(assert (=> b!298489 m!311009))

(declare-fun m!311011 () Bool)

(assert (=> bm!25783 m!311011))

(assert (=> b!298492 m!311003))

(assert (=> b!298492 m!311003))

(declare-fun m!311013 () Bool)

(assert (=> b!298492 m!311013))

(assert (=> b!298445 d!67361))

(declare-fun d!67363 () Bool)

(assert (=> d!67363 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29528 d!67363))

(declare-fun d!67371 () Bool)

(assert (=> d!67371 (= (array_inv!5116 a!3312) (bvsge (size!7505 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29528 d!67371))

(declare-fun b!298593 () Bool)

(declare-fun e!188635 () SeekEntryResult!2302)

(assert (=> b!298593 (= e!188635 (Intermediate!2302 true lt!148387 #b00000000000000000000000000000000))))

(declare-fun lt!148450 () SeekEntryResult!2302)

(declare-fun b!298594 () Bool)

(assert (=> b!298594 (and (bvsge (index!11383 lt!148450) #b00000000000000000000000000000000) (bvslt (index!11383 lt!148450) (size!7505 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312)))))))

(declare-fun e!188636 () Bool)

(assert (=> b!298594 (= e!188636 (= (select (arr!7153 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312))) (index!11383 lt!148450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298595 () Bool)

(assert (=> b!298595 (and (bvsge (index!11383 lt!148450) #b00000000000000000000000000000000) (bvslt (index!11383 lt!148450) (size!7505 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312)))))))

(declare-fun res!157483 () Bool)

(assert (=> b!298595 (= res!157483 (= (select (arr!7153 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312))) (index!11383 lt!148450)) k!2524))))

(assert (=> b!298595 (=> res!157483 e!188636)))

(declare-fun e!188638 () Bool)

(assert (=> b!298595 (= e!188638 e!188636)))

(declare-fun b!298596 () Bool)

(declare-fun e!188639 () SeekEntryResult!2302)

(assert (=> b!298596 (= e!188639 (Intermediate!2302 false lt!148387 #b00000000000000000000000000000000))))

(declare-fun b!298597 () Bool)

(declare-fun e!188637 () Bool)

(assert (=> b!298597 (= e!188637 (bvsge (x!29603 lt!148450) #b01111111111111111111111111111110))))

(declare-fun b!298598 () Bool)

(assert (=> b!298598 (= e!188635 e!188639)))

(declare-fun c!48143 () Bool)

(declare-fun lt!148449 () (_ BitVec 64))

(assert (=> b!298598 (= c!48143 (or (= lt!148449 k!2524) (= (bvadd lt!148449 lt!148449) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298599 () Bool)

(assert (=> b!298599 (= e!188637 e!188638)))

(declare-fun res!157484 () Bool)

(assert (=> b!298599 (= res!157484 (and (is-Intermediate!2302 lt!148450) (not (undefined!3114 lt!148450)) (bvslt (x!29603 lt!148450) #b01111111111111111111111111111110) (bvsge (x!29603 lt!148450) #b00000000000000000000000000000000) (bvsge (x!29603 lt!148450) #b00000000000000000000000000000000)))))

(assert (=> b!298599 (=> (not res!157484) (not e!188638))))

(declare-fun d!67377 () Bool)

(assert (=> d!67377 e!188637))

(declare-fun c!48144 () Bool)

(assert (=> d!67377 (= c!48144 (and (is-Intermediate!2302 lt!148450) (undefined!3114 lt!148450)))))

(assert (=> d!67377 (= lt!148450 e!188635)))

(declare-fun c!48142 () Bool)

(assert (=> d!67377 (= c!48142 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67377 (= lt!148449 (select (arr!7153 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312))) lt!148387))))

(assert (=> d!67377 (validMask!0 mask!3809)))

(assert (=> d!67377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148387 k!2524 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312)) mask!3809) lt!148450)))

(declare-fun b!298600 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298600 (= e!188639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148387 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312)) mask!3809))))

(declare-fun b!298601 () Bool)

(assert (=> b!298601 (and (bvsge (index!11383 lt!148450) #b00000000000000000000000000000000) (bvslt (index!11383 lt!148450) (size!7505 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312)))))))

(declare-fun res!157482 () Bool)

(assert (=> b!298601 (= res!157482 (= (select (arr!7153 (array!15101 (store (arr!7153 a!3312) i!1256 k!2524) (size!7505 a!3312))) (index!11383 lt!148450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298601 (=> res!157482 e!188636)))

(assert (= (and d!67377 c!48142) b!298593))

(assert (= (and d!67377 (not c!48142)) b!298598))

(assert (= (and b!298598 c!48143) b!298596))

(assert (= (and b!298598 (not c!48143)) b!298600))

(assert (= (and d!67377 c!48144) b!298597))

(assert (= (and d!67377 (not c!48144)) b!298599))

(assert (= (and b!298599 res!157484) b!298595))

(assert (= (and b!298595 (not res!157483)) b!298601))

(assert (= (and b!298601 (not res!157482)) b!298594))

(declare-fun m!311059 () Bool)

(assert (=> d!67377 m!311059))

(assert (=> d!67377 m!310977))

(declare-fun m!311061 () Bool)

(assert (=> b!298594 m!311061))

(declare-fun m!311063 () Bool)

(assert (=> b!298600 m!311063))

(assert (=> b!298600 m!311063))

(declare-fun m!311065 () Bool)

(assert (=> b!298600 m!311065))

(assert (=> b!298595 m!311061))

(assert (=> b!298601 m!311061))

(assert (=> b!298447 d!67377))

(declare-fun b!298602 () Bool)

(declare-fun e!188640 () SeekEntryResult!2302)

(assert (=> b!298602 (= e!188640 (Intermediate!2302 true lt!148387 #b00000000000000000000000000000000))))

(declare-fun b!298603 () Bool)

(declare-fun lt!148452 () SeekEntryResult!2302)

(assert (=> b!298603 (and (bvsge (index!11383 lt!148452) #b00000000000000000000000000000000) (bvslt (index!11383 lt!148452) (size!7505 a!3312)))))

(declare-fun e!188641 () Bool)

(assert (=> b!298603 (= e!188641 (= (select (arr!7153 a!3312) (index!11383 lt!148452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298604 () Bool)

(assert (=> b!298604 (and (bvsge (index!11383 lt!148452) #b00000000000000000000000000000000) (bvslt (index!11383 lt!148452) (size!7505 a!3312)))))

(declare-fun res!157486 () Bool)

(assert (=> b!298604 (= res!157486 (= (select (arr!7153 a!3312) (index!11383 lt!148452)) k!2524))))

(assert (=> b!298604 (=> res!157486 e!188641)))

(declare-fun e!188643 () Bool)

(assert (=> b!298604 (= e!188643 e!188641)))

(declare-fun b!298605 () Bool)

(declare-fun e!188644 () SeekEntryResult!2302)

(assert (=> b!298605 (= e!188644 (Intermediate!2302 false lt!148387 #b00000000000000000000000000000000))))

(declare-fun b!298606 () Bool)

(declare-fun e!188642 () Bool)

(assert (=> b!298606 (= e!188642 (bvsge (x!29603 lt!148452) #b01111111111111111111111111111110))))

(declare-fun b!298607 () Bool)

(assert (=> b!298607 (= e!188640 e!188644)))

(declare-fun c!48146 () Bool)

(declare-fun lt!148451 () (_ BitVec 64))

(assert (=> b!298607 (= c!48146 (or (= lt!148451 k!2524) (= (bvadd lt!148451 lt!148451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298608 () Bool)

(assert (=> b!298608 (= e!188642 e!188643)))

(declare-fun res!157487 () Bool)

(assert (=> b!298608 (= res!157487 (and (is-Intermediate!2302 lt!148452) (not (undefined!3114 lt!148452)) (bvslt (x!29603 lt!148452) #b01111111111111111111111111111110) (bvsge (x!29603 lt!148452) #b00000000000000000000000000000000) (bvsge (x!29603 lt!148452) #b00000000000000000000000000000000)))))

(assert (=> b!298608 (=> (not res!157487) (not e!188643))))

(declare-fun d!67389 () Bool)

(assert (=> d!67389 e!188642))

(declare-fun c!48147 () Bool)

(assert (=> d!67389 (= c!48147 (and (is-Intermediate!2302 lt!148452) (undefined!3114 lt!148452)))))

(assert (=> d!67389 (= lt!148452 e!188640)))

(declare-fun c!48145 () Bool)

(assert (=> d!67389 (= c!48145 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67389 (= lt!148451 (select (arr!7153 a!3312) lt!148387))))

(assert (=> d!67389 (validMask!0 mask!3809)))

(assert (=> d!67389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148387 k!2524 a!3312 mask!3809) lt!148452)))

(declare-fun b!298609 () Bool)

(assert (=> b!298609 (= e!188644 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148387 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298610 () Bool)

(assert (=> b!298610 (and (bvsge (index!11383 lt!148452) #b00000000000000000000000000000000) (bvslt (index!11383 lt!148452) (size!7505 a!3312)))))

(declare-fun res!157485 () Bool)

(assert (=> b!298610 (= res!157485 (= (select (arr!7153 a!3312) (index!11383 lt!148452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298610 (=> res!157485 e!188641)))

(assert (= (and d!67389 c!48145) b!298602))

(assert (= (and d!67389 (not c!48145)) b!298607))

(assert (= (and b!298607 c!48146) b!298605))

(assert (= (and b!298607 (not c!48146)) b!298609))

(assert (= (and d!67389 c!48147) b!298606))

(assert (= (and d!67389 (not c!48147)) b!298608))

(assert (= (and b!298608 res!157487) b!298604))

(assert (= (and b!298604 (not res!157486)) b!298610))

(assert (= (and b!298610 (not res!157485)) b!298603))

(declare-fun m!311067 () Bool)

(assert (=> d!67389 m!311067))

(assert (=> d!67389 m!310977))

(declare-fun m!311069 () Bool)

(assert (=> b!298603 m!311069))

(assert (=> b!298609 m!311063))

(assert (=> b!298609 m!311063))

(declare-fun m!311071 () Bool)

(assert (=> b!298609 m!311071))

(assert (=> b!298604 m!311069))

(assert (=> b!298610 m!311069))

(assert (=> b!298447 d!67389))

(declare-fun d!67391 () Bool)

(declare-fun lt!148458 () (_ BitVec 32))

(declare-fun lt!148457 () (_ BitVec 32))

(assert (=> d!67391 (= lt!148458 (bvmul (bvxor lt!148457 (bvlshr lt!148457 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67391 (= lt!148457 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67391 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157488 (let ((h!5309 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29609 (bvmul (bvxor h!5309 (bvlshr h!5309 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29609 (bvlshr x!29609 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157488 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157488 #b00000000000000000000000000000000))))))

(assert (=> d!67391 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148458 (bvlshr lt!148458 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298447 d!67391))

(declare-fun d!67393 () Bool)

(assert (=> d!67393 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298448 d!67393))

(declare-fun d!67395 () Bool)

(declare-fun res!157493 () Bool)

(declare-fun e!188649 () Bool)

(assert (=> d!67395 (=> res!157493 e!188649)))

(assert (=> d!67395 (= res!157493 (= (select (arr!7153 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67395 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!188649)))

(declare-fun b!298615 () Bool)

(declare-fun e!188650 () Bool)

(assert (=> b!298615 (= e!188649 e!188650)))

(declare-fun res!157494 () Bool)

(assert (=> b!298615 (=> (not res!157494) (not e!188650))))

(assert (=> b!298615 (= res!157494 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7505 a!3312)))))

(declare-fun b!298616 () Bool)

(assert (=> b!298616 (= e!188650 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

