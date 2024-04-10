; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28456 () Bool)

(assert start!28456)

(declare-fun b!291433 () Bool)

(declare-fun res!152777 () Bool)

(declare-fun e!184409 () Bool)

(assert (=> b!291433 (=> (not res!152777) (not e!184409))))

(declare-datatypes ((array!14725 0))(
  ( (array!14726 (arr!6988 (Array (_ BitVec 32) (_ BitVec 64))) (size!7340 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14725)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14725 (_ BitVec 32)) Bool)

(assert (=> b!291433 (= res!152777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291434 () Bool)

(declare-fun e!184408 () Bool)

(assert (=> b!291434 (= e!184408 e!184409)))

(declare-fun res!152778 () Bool)

(assert (=> b!291434 (=> (not res!152778) (not e!184409))))

(declare-fun lt!144193 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2137 0))(
  ( (MissingZero!2137 (index!10718 (_ BitVec 32))) (Found!2137 (index!10719 (_ BitVec 32))) (Intermediate!2137 (undefined!2949 Bool) (index!10720 (_ BitVec 32)) (x!28900 (_ BitVec 32))) (Undefined!2137) (MissingVacant!2137 (index!10721 (_ BitVec 32))) )
))
(declare-fun lt!144192 () SeekEntryResult!2137)

(assert (=> b!291434 (= res!152778 (or lt!144193 (= lt!144192 (MissingVacant!2137 i!1256))))))

(assert (=> b!291434 (= lt!144193 (= lt!144192 (MissingZero!2137 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14725 (_ BitVec 32)) SeekEntryResult!2137)

(assert (=> b!291434 (= lt!144192 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291435 () Bool)

(declare-fun res!152776 () Bool)

(assert (=> b!291435 (=> (not res!152776) (not e!184408))))

(declare-fun arrayContainsKey!0 (array!14725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291435 (= res!152776 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291436 () Bool)

(declare-fun e!184412 () Bool)

(declare-fun e!184410 () Bool)

(assert (=> b!291436 (= e!184412 e!184410)))

(declare-fun res!152775 () Bool)

(assert (=> b!291436 (=> (not res!152775) (not e!184410))))

(declare-fun lt!144188 () Bool)

(declare-fun lt!144190 () SeekEntryResult!2137)

(assert (=> b!291436 (= res!152775 (and (or lt!144188 (not (undefined!2949 lt!144190))) (not lt!144188) (= (select (arr!6988 a!3312) (index!10720 lt!144190)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291436 (= lt!144188 (not (is-Intermediate!2137 lt!144190)))))

(declare-fun b!291437 () Bool)

(assert (=> b!291437 (= e!184410 (not (or (not (= lt!144190 (Intermediate!2137 false (index!10720 lt!144190) (x!28900 lt!144190)))) (bvsle #b00000000000000000000000000000000 (x!28900 lt!144190)))))))

(assert (=> b!291437 (= (index!10720 lt!144190) i!1256)))

(declare-fun res!152773 () Bool)

(assert (=> start!28456 (=> (not res!152773) (not e!184408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28456 (= res!152773 (validMask!0 mask!3809))))

(assert (=> start!28456 e!184408))

(assert (=> start!28456 true))

(declare-fun array_inv!4951 (array!14725) Bool)

(assert (=> start!28456 (array_inv!4951 a!3312)))

(declare-fun b!291438 () Bool)

(assert (=> b!291438 (= e!184409 e!184412)))

(declare-fun res!152774 () Bool)

(assert (=> b!291438 (=> (not res!152774) (not e!184412))))

(assert (=> b!291438 (= res!152774 (and (not lt!144193) (= lt!144192 (MissingVacant!2137 i!1256))))))

(declare-fun lt!144189 () SeekEntryResult!2137)

(declare-fun lt!144191 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14725 (_ BitVec 32)) SeekEntryResult!2137)

(assert (=> b!291438 (= lt!144189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144191 k!2524 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312)) mask!3809))))

(assert (=> b!291438 (= lt!144190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144191 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291438 (= lt!144191 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291439 () Bool)

(declare-fun res!152771 () Bool)

(assert (=> b!291439 (=> (not res!152771) (not e!184408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291439 (= res!152771 (validKeyInArray!0 k!2524))))

(declare-fun b!291440 () Bool)

(declare-fun res!152772 () Bool)

(assert (=> b!291440 (=> (not res!152772) (not e!184408))))

(assert (=> b!291440 (= res!152772 (and (= (size!7340 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7340 a!3312))))))

(assert (= (and start!28456 res!152773) b!291440))

(assert (= (and b!291440 res!152772) b!291439))

(assert (= (and b!291439 res!152771) b!291435))

(assert (= (and b!291435 res!152776) b!291434))

(assert (= (and b!291434 res!152778) b!291433))

(assert (= (and b!291433 res!152777) b!291438))

(assert (= (and b!291438 res!152774) b!291436))

(assert (= (and b!291436 res!152775) b!291437))

(declare-fun m!305369 () Bool)

(assert (=> start!28456 m!305369))

(declare-fun m!305371 () Bool)

(assert (=> start!28456 m!305371))

(declare-fun m!305373 () Bool)

(assert (=> b!291435 m!305373))

(declare-fun m!305375 () Bool)

(assert (=> b!291433 m!305375))

(declare-fun m!305377 () Bool)

(assert (=> b!291436 m!305377))

(declare-fun m!305379 () Bool)

(assert (=> b!291434 m!305379))

(declare-fun m!305381 () Bool)

(assert (=> b!291438 m!305381))

(declare-fun m!305383 () Bool)

(assert (=> b!291438 m!305383))

(declare-fun m!305385 () Bool)

(assert (=> b!291438 m!305385))

(declare-fun m!305387 () Bool)

(assert (=> b!291438 m!305387))

(declare-fun m!305389 () Bool)

(assert (=> b!291439 m!305389))

(push 1)

(assert (not b!291438))

(assert (not b!291435))

(assert (not b!291439))

(assert (not b!291434))

(assert (not start!28456))

(assert (not b!291433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66371 () Bool)

(declare-fun res!152795 () Bool)

(declare-fun e!184432 () Bool)

(assert (=> d!66371 (=> res!152795 e!184432)))

(assert (=> d!66371 (= res!152795 (= (select (arr!6988 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66371 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!184432)))

(declare-fun b!291463 () Bool)

(declare-fun e!184433 () Bool)

(assert (=> b!291463 (= e!184432 e!184433)))

(declare-fun res!152796 () Bool)

(assert (=> b!291463 (=> (not res!152796) (not e!184433))))

(assert (=> b!291463 (= res!152796 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7340 a!3312)))))

(declare-fun b!291464 () Bool)

(assert (=> b!291464 (= e!184433 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66371 (not res!152795)) b!291463))

(assert (= (and b!291463 res!152796) b!291464))

(declare-fun m!305407 () Bool)

(assert (=> d!66371 m!305407))

(declare-fun m!305409 () Bool)

(assert (=> b!291464 m!305409))

(assert (=> b!291435 d!66371))

(declare-fun d!66375 () Bool)

(declare-fun lt!144226 () SeekEntryResult!2137)

(assert (=> d!66375 (and (or (is-Undefined!2137 lt!144226) (not (is-Found!2137 lt!144226)) (and (bvsge (index!10719 lt!144226) #b00000000000000000000000000000000) (bvslt (index!10719 lt!144226) (size!7340 a!3312)))) (or (is-Undefined!2137 lt!144226) (is-Found!2137 lt!144226) (not (is-MissingZero!2137 lt!144226)) (and (bvsge (index!10718 lt!144226) #b00000000000000000000000000000000) (bvslt (index!10718 lt!144226) (size!7340 a!3312)))) (or (is-Undefined!2137 lt!144226) (is-Found!2137 lt!144226) (is-MissingZero!2137 lt!144226) (not (is-MissingVacant!2137 lt!144226)) (and (bvsge (index!10721 lt!144226) #b00000000000000000000000000000000) (bvslt (index!10721 lt!144226) (size!7340 a!3312)))) (or (is-Undefined!2137 lt!144226) (ite (is-Found!2137 lt!144226) (= (select (arr!6988 a!3312) (index!10719 lt!144226)) k!2524) (ite (is-MissingZero!2137 lt!144226) (= (select (arr!6988 a!3312) (index!10718 lt!144226)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2137 lt!144226) (= (select (arr!6988 a!3312) (index!10721 lt!144226)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!184461 () SeekEntryResult!2137)

(assert (=> d!66375 (= lt!144226 e!184461)))

(declare-fun c!46920 () Bool)

(declare-fun lt!144224 () SeekEntryResult!2137)

(assert (=> d!66375 (= c!46920 (and (is-Intermediate!2137 lt!144224) (undefined!2949 lt!144224)))))

(assert (=> d!66375 (= lt!144224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66375 (validMask!0 mask!3809)))

(assert (=> d!66375 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!144226)))

(declare-fun b!291511 () Bool)

(declare-fun e!184460 () SeekEntryResult!2137)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14725 (_ BitVec 32)) SeekEntryResult!2137)

(assert (=> b!291511 (= e!184460 (seekKeyOrZeroReturnVacant!0 (x!28900 lt!144224) (index!10720 lt!144224) (index!10720 lt!144224) k!2524 a!3312 mask!3809))))

(declare-fun b!291512 () Bool)

(declare-fun e!184459 () SeekEntryResult!2137)

(assert (=> b!291512 (= e!184459 (Found!2137 (index!10720 lt!144224)))))

(declare-fun b!291513 () Bool)

(assert (=> b!291513 (= e!184461 e!184459)))

(declare-fun lt!144225 () (_ BitVec 64))

(assert (=> b!291513 (= lt!144225 (select (arr!6988 a!3312) (index!10720 lt!144224)))))

(declare-fun c!46919 () Bool)

(assert (=> b!291513 (= c!46919 (= lt!144225 k!2524))))

(declare-fun b!291514 () Bool)

(assert (=> b!291514 (= e!184460 (MissingZero!2137 (index!10720 lt!144224)))))

(declare-fun b!291515 () Bool)

(assert (=> b!291515 (= e!184461 Undefined!2137)))

(declare-fun b!291516 () Bool)

(declare-fun c!46918 () Bool)

(assert (=> b!291516 (= c!46918 (= lt!144225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291516 (= e!184459 e!184460)))

(assert (= (and d!66375 c!46920) b!291515))

(assert (= (and d!66375 (not c!46920)) b!291513))

(assert (= (and b!291513 c!46919) b!291512))

(assert (= (and b!291513 (not c!46919)) b!291516))

(assert (= (and b!291516 c!46918) b!291514))

(assert (= (and b!291516 (not c!46918)) b!291511))

(assert (=> d!66375 m!305387))

(assert (=> d!66375 m!305369))

(declare-fun m!305425 () Bool)

(assert (=> d!66375 m!305425))

(declare-fun m!305427 () Bool)

(assert (=> d!66375 m!305427))

(declare-fun m!305429 () Bool)

(assert (=> d!66375 m!305429))

(assert (=> d!66375 m!305387))

(declare-fun m!305431 () Bool)

(assert (=> d!66375 m!305431))

(declare-fun m!305433 () Bool)

(assert (=> b!291511 m!305433))

(declare-fun m!305435 () Bool)

(assert (=> b!291513 m!305435))

(assert (=> b!291434 d!66375))

(declare-fun d!66387 () Bool)

(assert (=> d!66387 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28456 d!66387))

(declare-fun d!66391 () Bool)

(assert (=> d!66391 (= (array_inv!4951 a!3312) (bvsge (size!7340 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28456 d!66391))

(declare-fun d!66395 () Bool)

(assert (=> d!66395 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291439 d!66395))

(declare-fun b!291572 () Bool)

(declare-fun e!184499 () Bool)

(declare-fun e!184498 () Bool)

(assert (=> b!291572 (= e!184499 e!184498)))

(declare-fun lt!144252 () (_ BitVec 64))

(assert (=> b!291572 (= lt!144252 (select (arr!6988 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9148 0))(
  ( (Unit!9149) )
))
(declare-fun lt!144253 () Unit!9148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14725 (_ BitVec 64) (_ BitVec 32)) Unit!9148)

(assert (=> b!291572 (= lt!144253 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144252 #b00000000000000000000000000000000))))

(assert (=> b!291572 (arrayContainsKey!0 a!3312 lt!144252 #b00000000000000000000000000000000)))

(declare-fun lt!144251 () Unit!9148)

(assert (=> b!291572 (= lt!144251 lt!144253)))

(declare-fun res!152823 () Bool)

(assert (=> b!291572 (= res!152823 (= (seekEntryOrOpen!0 (select (arr!6988 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2137 #b00000000000000000000000000000000)))))

(assert (=> b!291572 (=> (not res!152823) (not e!184498))))

(declare-fun bm!25648 () Bool)

(declare-fun call!25651 () Bool)

(assert (=> bm!25648 (= call!25651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66397 () Bool)

(declare-fun res!152822 () Bool)

(declare-fun e!184497 () Bool)

(assert (=> d!66397 (=> res!152822 e!184497)))

(assert (=> d!66397 (= res!152822 (bvsge #b00000000000000000000000000000000 (size!7340 a!3312)))))

(assert (=> d!66397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184497)))

(declare-fun b!291573 () Bool)

(assert (=> b!291573 (= e!184498 call!25651)))

(declare-fun b!291574 () Bool)

(assert (=> b!291574 (= e!184497 e!184499)))

(declare-fun c!46938 () Bool)

(assert (=> b!291574 (= c!46938 (validKeyInArray!0 (select (arr!6988 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!291575 () Bool)

(assert (=> b!291575 (= e!184499 call!25651)))

(assert (= (and d!66397 (not res!152822)) b!291574))

(assert (= (and b!291574 c!46938) b!291572))

(assert (= (and b!291574 (not c!46938)) b!291575))

(assert (= (and b!291572 res!152823) b!291573))

(assert (= (or b!291573 b!291575) bm!25648))

(assert (=> b!291572 m!305407))

(declare-fun m!305461 () Bool)

(assert (=> b!291572 m!305461))

(declare-fun m!305463 () Bool)

(assert (=> b!291572 m!305463))

(assert (=> b!291572 m!305407))

(declare-fun m!305469 () Bool)

(assert (=> b!291572 m!305469))

(declare-fun m!305471 () Bool)

(assert (=> bm!25648 m!305471))

(assert (=> b!291574 m!305407))

(assert (=> b!291574 m!305407))

(declare-fun m!305475 () Bool)

(assert (=> b!291574 m!305475))

(assert (=> b!291433 d!66397))

(declare-fun lt!144280 () SeekEntryResult!2137)

(declare-fun b!291639 () Bool)

(assert (=> b!291639 (and (bvsge (index!10720 lt!144280) #b00000000000000000000000000000000) (bvslt (index!10720 lt!144280) (size!7340 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312)))))))

(declare-fun res!152848 () Bool)

(assert (=> b!291639 (= res!152848 (= (select (arr!6988 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312))) (index!10720 lt!144280)) k!2524))))

(declare-fun e!184535 () Bool)

(assert (=> b!291639 (=> res!152848 e!184535)))

(declare-fun e!184536 () Bool)

(assert (=> b!291639 (= e!184536 e!184535)))

(declare-fun d!66401 () Bool)

(declare-fun e!184537 () Bool)

(assert (=> d!66401 e!184537))

(declare-fun c!46962 () Bool)

(assert (=> d!66401 (= c!46962 (and (is-Intermediate!2137 lt!144280) (undefined!2949 lt!144280)))))

(declare-fun e!184539 () SeekEntryResult!2137)

(assert (=> d!66401 (= lt!144280 e!184539)))

(declare-fun c!46961 () Bool)

(assert (=> d!66401 (= c!46961 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144281 () (_ BitVec 64))

(assert (=> d!66401 (= lt!144281 (select (arr!6988 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312))) lt!144191))))

(assert (=> d!66401 (validMask!0 mask!3809)))

(assert (=> d!66401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144191 k!2524 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312)) mask!3809) lt!144280)))

(declare-fun b!291640 () Bool)

(declare-fun e!184538 () SeekEntryResult!2137)

(assert (=> b!291640 (= e!184538 (Intermediate!2137 false lt!144191 #b00000000000000000000000000000000))))

(declare-fun b!291641 () Bool)

(assert (=> b!291641 (and (bvsge (index!10720 lt!144280) #b00000000000000000000000000000000) (bvslt (index!10720 lt!144280) (size!7340 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312)))))))

(declare-fun res!152849 () Bool)

(assert (=> b!291641 (= res!152849 (= (select (arr!6988 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312))) (index!10720 lt!144280)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291641 (=> res!152849 e!184535)))

(declare-fun b!291642 () Bool)

(assert (=> b!291642 (= e!184539 (Intermediate!2137 true lt!144191 #b00000000000000000000000000000000))))

(declare-fun b!291643 () Bool)

(assert (=> b!291643 (and (bvsge (index!10720 lt!144280) #b00000000000000000000000000000000) (bvslt (index!10720 lt!144280) (size!7340 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312)))))))

(assert (=> b!291643 (= e!184535 (= (select (arr!6988 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312))) (index!10720 lt!144280)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291644 () Bool)

(assert (=> b!291644 (= e!184537 e!184536)))

(declare-fun res!152847 () Bool)

(assert (=> b!291644 (= res!152847 (and (is-Intermediate!2137 lt!144280) (not (undefined!2949 lt!144280)) (bvslt (x!28900 lt!144280) #b01111111111111111111111111111110) (bvsge (x!28900 lt!144280) #b00000000000000000000000000000000) (bvsge (x!28900 lt!144280) #b00000000000000000000000000000000)))))

(assert (=> b!291644 (=> (not res!152847) (not e!184536))))

(declare-fun b!291645 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291645 (= e!184538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144191 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14726 (store (arr!6988 a!3312) i!1256 k!2524) (size!7340 a!3312)) mask!3809))))

(declare-fun b!291646 () Bool)

(assert (=> b!291646 (= e!184537 (bvsge (x!28900 lt!144280) #b01111111111111111111111111111110))))

(declare-fun b!291647 () Bool)

(assert (=> b!291647 (= e!184539 e!184538)))

(declare-fun c!46960 () Bool)

(assert (=> b!291647 (= c!46960 (or (= lt!144281 k!2524) (= (bvadd lt!144281 lt!144281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!66401 c!46961) b!291642))

(assert (= (and d!66401 (not c!46961)) b!291647))

(assert (= (and b!291647 c!46960) b!291640))

(assert (= (and b!291647 (not c!46960)) b!291645))

