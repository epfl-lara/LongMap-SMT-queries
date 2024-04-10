; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29076 () Bool)

(assert start!29076)

(declare-fun b!295222 () Bool)

(declare-fun e!186602 () Bool)

(declare-datatypes ((SeekEntryResult!2223 0))(
  ( (MissingZero!2223 (index!11062 (_ BitVec 32))) (Found!2223 (index!11063 (_ BitVec 32))) (Intermediate!2223 (undefined!3035 Bool) (index!11064 (_ BitVec 32)) (x!29277 (_ BitVec 32))) (Undefined!2223) (MissingVacant!2223 (index!11065 (_ BitVec 32))) )
))
(declare-fun lt!146370 () SeekEntryResult!2223)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295222 (= e!186602 (not (= (index!11064 lt!146370) i!1256)))))

(declare-datatypes ((array!14924 0))(
  ( (array!14925 (arr!7074 (Array (_ BitVec 32) (_ BitVec 64))) (size!7426 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14924)

(assert (=> b!295222 (= (select (arr!7074 a!3312) (index!11064 lt!146370)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!155177 () Bool)

(declare-fun e!186604 () Bool)

(assert (=> start!29076 (=> (not res!155177) (not e!186604))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29076 (= res!155177 (validMask!0 mask!3809))))

(assert (=> start!29076 e!186604))

(assert (=> start!29076 true))

(declare-fun array_inv!5037 (array!14924) Bool)

(assert (=> start!29076 (array_inv!5037 a!3312)))

(declare-fun b!295223 () Bool)

(declare-fun e!186601 () Bool)

(assert (=> b!295223 (= e!186601 e!186602)))

(declare-fun res!155178 () Bool)

(assert (=> b!295223 (=> (not res!155178) (not e!186602))))

(declare-fun lt!146371 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!295223 (= res!155178 (and (or lt!146371 (not (undefined!3035 lt!146370))) (or lt!146371 (not (= (select (arr!7074 a!3312) (index!11064 lt!146370)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146371 (not (= (select (arr!7074 a!3312) (index!11064 lt!146370)) k0!2524))) (not lt!146371)))))

(get-info :version)

(assert (=> b!295223 (= lt!146371 (not ((_ is Intermediate!2223) lt!146370)))))

(declare-fun b!295224 () Bool)

(declare-fun e!186603 () Bool)

(assert (=> b!295224 (= e!186603 e!186601)))

(declare-fun res!155174 () Bool)

(assert (=> b!295224 (=> (not res!155174) (not e!186601))))

(declare-fun lt!146369 () Bool)

(assert (=> b!295224 (= res!155174 lt!146369)))

(declare-fun lt!146373 () SeekEntryResult!2223)

(declare-fun lt!146372 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14924 (_ BitVec 32)) SeekEntryResult!2223)

(assert (=> b!295224 (= lt!146373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146372 k0!2524 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312)) mask!3809))))

(assert (=> b!295224 (= lt!146370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146372 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295224 (= lt!146372 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295225 () Bool)

(declare-fun res!155171 () Bool)

(assert (=> b!295225 (=> (not res!155171) (not e!186604))))

(assert (=> b!295225 (= res!155171 (and (= (size!7426 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7426 a!3312))))))

(declare-fun b!295226 () Bool)

(declare-fun res!155175 () Bool)

(assert (=> b!295226 (=> (not res!155175) (not e!186603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14924 (_ BitVec 32)) Bool)

(assert (=> b!295226 (= res!155175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295227 () Bool)

(declare-fun res!155173 () Bool)

(assert (=> b!295227 (=> (not res!155173) (not e!186604))))

(declare-fun arrayContainsKey!0 (array!14924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295227 (= res!155173 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295228 () Bool)

(assert (=> b!295228 (= e!186604 e!186603)))

(declare-fun res!155176 () Bool)

(assert (=> b!295228 (=> (not res!155176) (not e!186603))))

(declare-fun lt!146368 () SeekEntryResult!2223)

(assert (=> b!295228 (= res!155176 (or lt!146369 (= lt!146368 (MissingVacant!2223 i!1256))))))

(assert (=> b!295228 (= lt!146369 (= lt!146368 (MissingZero!2223 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14924 (_ BitVec 32)) SeekEntryResult!2223)

(assert (=> b!295228 (= lt!146368 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295229 () Bool)

(declare-fun res!155172 () Bool)

(assert (=> b!295229 (=> (not res!155172) (not e!186604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295229 (= res!155172 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29076 res!155177) b!295225))

(assert (= (and b!295225 res!155171) b!295229))

(assert (= (and b!295229 res!155172) b!295227))

(assert (= (and b!295227 res!155173) b!295228))

(assert (= (and b!295228 res!155176) b!295226))

(assert (= (and b!295226 res!155175) b!295224))

(assert (= (and b!295224 res!155174) b!295223))

(assert (= (and b!295223 res!155178) b!295222))

(declare-fun m!308425 () Bool)

(assert (=> b!295223 m!308425))

(declare-fun m!308427 () Bool)

(assert (=> b!295228 m!308427))

(declare-fun m!308429 () Bool)

(assert (=> start!29076 m!308429))

(declare-fun m!308431 () Bool)

(assert (=> start!29076 m!308431))

(assert (=> b!295222 m!308425))

(declare-fun m!308433 () Bool)

(assert (=> b!295229 m!308433))

(declare-fun m!308435 () Bool)

(assert (=> b!295227 m!308435))

(declare-fun m!308437 () Bool)

(assert (=> b!295226 m!308437))

(declare-fun m!308439 () Bool)

(assert (=> b!295224 m!308439))

(declare-fun m!308441 () Bool)

(assert (=> b!295224 m!308441))

(declare-fun m!308443 () Bool)

(assert (=> b!295224 m!308443))

(declare-fun m!308445 () Bool)

(assert (=> b!295224 m!308445))

(check-sat (not b!295229) (not b!295226) (not b!295228) (not b!295227) (not start!29076) (not b!295224))
(check-sat)
(get-model)

(declare-fun d!66963 () Bool)

(assert (=> d!66963 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29076 d!66963))

(declare-fun d!66967 () Bool)

(assert (=> d!66967 (= (array_inv!5037 a!3312) (bvsge (size!7426 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29076 d!66967))

(declare-fun b!295286 () Bool)

(declare-fun c!47615 () Bool)

(declare-fun lt!146403 () (_ BitVec 64))

(assert (=> b!295286 (= c!47615 (= lt!146403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186641 () SeekEntryResult!2223)

(declare-fun e!186640 () SeekEntryResult!2223)

(assert (=> b!295286 (= e!186641 e!186640)))

(declare-fun b!295287 () Bool)

(declare-fun e!186642 () SeekEntryResult!2223)

(assert (=> b!295287 (= e!186642 e!186641)))

(declare-fun lt!146404 () SeekEntryResult!2223)

(assert (=> b!295287 (= lt!146403 (select (arr!7074 a!3312) (index!11064 lt!146404)))))

(declare-fun c!47614 () Bool)

(assert (=> b!295287 (= c!47614 (= lt!146403 k0!2524))))

(declare-fun b!295288 () Bool)

(assert (=> b!295288 (= e!186640 (MissingZero!2223 (index!11064 lt!146404)))))

(declare-fun b!295289 () Bool)

(assert (=> b!295289 (= e!186641 (Found!2223 (index!11064 lt!146404)))))

(declare-fun d!66969 () Bool)

(declare-fun lt!146402 () SeekEntryResult!2223)

(assert (=> d!66969 (and (or ((_ is Undefined!2223) lt!146402) (not ((_ is Found!2223) lt!146402)) (and (bvsge (index!11063 lt!146402) #b00000000000000000000000000000000) (bvslt (index!11063 lt!146402) (size!7426 a!3312)))) (or ((_ is Undefined!2223) lt!146402) ((_ is Found!2223) lt!146402) (not ((_ is MissingZero!2223) lt!146402)) (and (bvsge (index!11062 lt!146402) #b00000000000000000000000000000000) (bvslt (index!11062 lt!146402) (size!7426 a!3312)))) (or ((_ is Undefined!2223) lt!146402) ((_ is Found!2223) lt!146402) ((_ is MissingZero!2223) lt!146402) (not ((_ is MissingVacant!2223) lt!146402)) (and (bvsge (index!11065 lt!146402) #b00000000000000000000000000000000) (bvslt (index!11065 lt!146402) (size!7426 a!3312)))) (or ((_ is Undefined!2223) lt!146402) (ite ((_ is Found!2223) lt!146402) (= (select (arr!7074 a!3312) (index!11063 lt!146402)) k0!2524) (ite ((_ is MissingZero!2223) lt!146402) (= (select (arr!7074 a!3312) (index!11062 lt!146402)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2223) lt!146402) (= (select (arr!7074 a!3312) (index!11065 lt!146402)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66969 (= lt!146402 e!186642)))

(declare-fun c!47616 () Bool)

(assert (=> d!66969 (= c!47616 (and ((_ is Intermediate!2223) lt!146404) (undefined!3035 lt!146404)))))

(assert (=> d!66969 (= lt!146404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66969 (validMask!0 mask!3809)))

(assert (=> d!66969 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146402)))

(declare-fun b!295290 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14924 (_ BitVec 32)) SeekEntryResult!2223)

(assert (=> b!295290 (= e!186640 (seekKeyOrZeroReturnVacant!0 (x!29277 lt!146404) (index!11064 lt!146404) (index!11064 lt!146404) k0!2524 a!3312 mask!3809))))

(declare-fun b!295291 () Bool)

(assert (=> b!295291 (= e!186642 Undefined!2223)))

(assert (= (and d!66969 c!47616) b!295291))

(assert (= (and d!66969 (not c!47616)) b!295287))

(assert (= (and b!295287 c!47614) b!295289))

(assert (= (and b!295287 (not c!47614)) b!295286))

(assert (= (and b!295286 c!47615) b!295288))

(assert (= (and b!295286 (not c!47615)) b!295290))

(declare-fun m!308473 () Bool)

(assert (=> b!295287 m!308473))

(assert (=> d!66969 m!308445))

(assert (=> d!66969 m!308445))

(declare-fun m!308475 () Bool)

(assert (=> d!66969 m!308475))

(assert (=> d!66969 m!308429))

(declare-fun m!308477 () Bool)

(assert (=> d!66969 m!308477))

(declare-fun m!308479 () Bool)

(assert (=> d!66969 m!308479))

(declare-fun m!308481 () Bool)

(assert (=> d!66969 m!308481))

(declare-fun m!308483 () Bool)

(assert (=> b!295290 m!308483))

(assert (=> b!295228 d!66969))

(declare-fun b!295368 () Bool)

(declare-fun e!186689 () SeekEntryResult!2223)

(declare-fun e!186686 () SeekEntryResult!2223)

(assert (=> b!295368 (= e!186689 e!186686)))

(declare-fun c!47642 () Bool)

(declare-fun lt!146433 () (_ BitVec 64))

(assert (=> b!295368 (= c!47642 (or (= lt!146433 k0!2524) (= (bvadd lt!146433 lt!146433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295369 () Bool)

(declare-fun lt!146434 () SeekEntryResult!2223)

(assert (=> b!295369 (and (bvsge (index!11064 lt!146434) #b00000000000000000000000000000000) (bvslt (index!11064 lt!146434) (size!7426 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312)))))))

(declare-fun e!186688 () Bool)

(assert (=> b!295369 (= e!186688 (= (select (arr!7074 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312))) (index!11064 lt!146434)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295370 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295370 (= e!186686 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146372 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312)) mask!3809))))

(declare-fun b!295371 () Bool)

(declare-fun e!186685 () Bool)

(assert (=> b!295371 (= e!186685 (bvsge (x!29277 lt!146434) #b01111111111111111111111111111110))))

(declare-fun b!295372 () Bool)

(assert (=> b!295372 (and (bvsge (index!11064 lt!146434) #b00000000000000000000000000000000) (bvslt (index!11064 lt!146434) (size!7426 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312)))))))

(declare-fun res!155242 () Bool)

(assert (=> b!295372 (= res!155242 (= (select (arr!7074 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312))) (index!11064 lt!146434)) k0!2524))))

(assert (=> b!295372 (=> res!155242 e!186688)))

(declare-fun e!186687 () Bool)

(assert (=> b!295372 (= e!186687 e!186688)))

(declare-fun b!295373 () Bool)

(assert (=> b!295373 (= e!186686 (Intermediate!2223 false lt!146372 #b00000000000000000000000000000000))))

(declare-fun d!66981 () Bool)

(assert (=> d!66981 e!186685))

(declare-fun c!47641 () Bool)

(assert (=> d!66981 (= c!47641 (and ((_ is Intermediate!2223) lt!146434) (undefined!3035 lt!146434)))))

(assert (=> d!66981 (= lt!146434 e!186689)))

(declare-fun c!47643 () Bool)

(assert (=> d!66981 (= c!47643 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66981 (= lt!146433 (select (arr!7074 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312))) lt!146372))))

(assert (=> d!66981 (validMask!0 mask!3809)))

(assert (=> d!66981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146372 k0!2524 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312)) mask!3809) lt!146434)))

(declare-fun b!295374 () Bool)

(assert (=> b!295374 (and (bvsge (index!11064 lt!146434) #b00000000000000000000000000000000) (bvslt (index!11064 lt!146434) (size!7426 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312)))))))

(declare-fun res!155243 () Bool)

(assert (=> b!295374 (= res!155243 (= (select (arr!7074 (array!14925 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7426 a!3312))) (index!11064 lt!146434)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295374 (=> res!155243 e!186688)))

(declare-fun b!295375 () Bool)

(assert (=> b!295375 (= e!186685 e!186687)))

(declare-fun res!155241 () Bool)

(assert (=> b!295375 (= res!155241 (and ((_ is Intermediate!2223) lt!146434) (not (undefined!3035 lt!146434)) (bvslt (x!29277 lt!146434) #b01111111111111111111111111111110) (bvsge (x!29277 lt!146434) #b00000000000000000000000000000000) (bvsge (x!29277 lt!146434) #b00000000000000000000000000000000)))))

(assert (=> b!295375 (=> (not res!155241) (not e!186687))))

(declare-fun b!295376 () Bool)

(assert (=> b!295376 (= e!186689 (Intermediate!2223 true lt!146372 #b00000000000000000000000000000000))))

(assert (= (and d!66981 c!47643) b!295376))

(assert (= (and d!66981 (not c!47643)) b!295368))

(assert (= (and b!295368 c!47642) b!295373))

(assert (= (and b!295368 (not c!47642)) b!295370))

(assert (= (and d!66981 c!47641) b!295371))

(assert (= (and d!66981 (not c!47641)) b!295375))

(assert (= (and b!295375 res!155241) b!295372))

(assert (= (and b!295372 (not res!155242)) b!295374))

(assert (= (and b!295374 (not res!155243)) b!295369))

(declare-fun m!308513 () Bool)

(assert (=> b!295369 m!308513))

(declare-fun m!308515 () Bool)

(assert (=> b!295370 m!308515))

(assert (=> b!295370 m!308515))

(declare-fun m!308517 () Bool)

(assert (=> b!295370 m!308517))

(assert (=> b!295374 m!308513))

(assert (=> b!295372 m!308513))

(declare-fun m!308519 () Bool)

(assert (=> d!66981 m!308519))

(assert (=> d!66981 m!308429))

(assert (=> b!295224 d!66981))

(declare-fun b!295377 () Bool)

(declare-fun e!186694 () SeekEntryResult!2223)

(declare-fun e!186691 () SeekEntryResult!2223)

(assert (=> b!295377 (= e!186694 e!186691)))

(declare-fun c!47645 () Bool)

(declare-fun lt!146435 () (_ BitVec 64))

(assert (=> b!295377 (= c!47645 (or (= lt!146435 k0!2524) (= (bvadd lt!146435 lt!146435) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295378 () Bool)

(declare-fun lt!146436 () SeekEntryResult!2223)

(assert (=> b!295378 (and (bvsge (index!11064 lt!146436) #b00000000000000000000000000000000) (bvslt (index!11064 lt!146436) (size!7426 a!3312)))))

(declare-fun e!186693 () Bool)

(assert (=> b!295378 (= e!186693 (= (select (arr!7074 a!3312) (index!11064 lt!146436)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295379 () Bool)

(assert (=> b!295379 (= e!186691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146372 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!295380 () Bool)

(declare-fun e!186690 () Bool)

(assert (=> b!295380 (= e!186690 (bvsge (x!29277 lt!146436) #b01111111111111111111111111111110))))

(declare-fun b!295381 () Bool)

(assert (=> b!295381 (and (bvsge (index!11064 lt!146436) #b00000000000000000000000000000000) (bvslt (index!11064 lt!146436) (size!7426 a!3312)))))

(declare-fun res!155245 () Bool)

(assert (=> b!295381 (= res!155245 (= (select (arr!7074 a!3312) (index!11064 lt!146436)) k0!2524))))

(assert (=> b!295381 (=> res!155245 e!186693)))

(declare-fun e!186692 () Bool)

(assert (=> b!295381 (= e!186692 e!186693)))

(declare-fun b!295382 () Bool)

(assert (=> b!295382 (= e!186691 (Intermediate!2223 false lt!146372 #b00000000000000000000000000000000))))

(declare-fun d!66995 () Bool)

(assert (=> d!66995 e!186690))

(declare-fun c!47644 () Bool)

(assert (=> d!66995 (= c!47644 (and ((_ is Intermediate!2223) lt!146436) (undefined!3035 lt!146436)))))

(assert (=> d!66995 (= lt!146436 e!186694)))

(declare-fun c!47646 () Bool)

(assert (=> d!66995 (= c!47646 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66995 (= lt!146435 (select (arr!7074 a!3312) lt!146372))))

(assert (=> d!66995 (validMask!0 mask!3809)))

(assert (=> d!66995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146372 k0!2524 a!3312 mask!3809) lt!146436)))

(declare-fun b!295383 () Bool)

(assert (=> b!295383 (and (bvsge (index!11064 lt!146436) #b00000000000000000000000000000000) (bvslt (index!11064 lt!146436) (size!7426 a!3312)))))

(declare-fun res!155246 () Bool)

(assert (=> b!295383 (= res!155246 (= (select (arr!7074 a!3312) (index!11064 lt!146436)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295383 (=> res!155246 e!186693)))

(declare-fun b!295384 () Bool)

(assert (=> b!295384 (= e!186690 e!186692)))

(declare-fun res!155244 () Bool)

(assert (=> b!295384 (= res!155244 (and ((_ is Intermediate!2223) lt!146436) (not (undefined!3035 lt!146436)) (bvslt (x!29277 lt!146436) #b01111111111111111111111111111110) (bvsge (x!29277 lt!146436) #b00000000000000000000000000000000) (bvsge (x!29277 lt!146436) #b00000000000000000000000000000000)))))

(assert (=> b!295384 (=> (not res!155244) (not e!186692))))

(declare-fun b!295385 () Bool)

(assert (=> b!295385 (= e!186694 (Intermediate!2223 true lt!146372 #b00000000000000000000000000000000))))

(assert (= (and d!66995 c!47646) b!295385))

(assert (= (and d!66995 (not c!47646)) b!295377))

(assert (= (and b!295377 c!47645) b!295382))

(assert (= (and b!295377 (not c!47645)) b!295379))

(assert (= (and d!66995 c!47644) b!295380))

(assert (= (and d!66995 (not c!47644)) b!295384))

(assert (= (and b!295384 res!155244) b!295381))

(assert (= (and b!295381 (not res!155245)) b!295383))

(assert (= (and b!295383 (not res!155246)) b!295378))

(declare-fun m!308521 () Bool)

(assert (=> b!295378 m!308521))

(assert (=> b!295379 m!308515))

(assert (=> b!295379 m!308515))

(declare-fun m!308523 () Bool)

(assert (=> b!295379 m!308523))

(assert (=> b!295383 m!308521))

(assert (=> b!295381 m!308521))

(declare-fun m!308525 () Bool)

(assert (=> d!66995 m!308525))

(assert (=> d!66995 m!308429))

(assert (=> b!295224 d!66995))

(declare-fun d!66997 () Bool)

(declare-fun lt!146448 () (_ BitVec 32))

(declare-fun lt!146447 () (_ BitVec 32))

(assert (=> d!66997 (= lt!146448 (bvmul (bvxor lt!146447 (bvlshr lt!146447 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66997 (= lt!146447 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66997 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155247 (let ((h!5291 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29284 (bvmul (bvxor h!5291 (bvlshr h!5291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29284 (bvlshr x!29284 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155247 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155247 #b00000000000000000000000000000000))))))

(assert (=> d!66997 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146448 (bvlshr lt!146448 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!295224 d!66997))

(declare-fun d!66999 () Bool)

(assert (=> d!66999 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!295229 d!66999))

(declare-fun b!295432 () Bool)

(declare-fun e!186723 () Bool)

(declare-fun call!25729 () Bool)

(assert (=> b!295432 (= e!186723 call!25729)))

(declare-fun d!67001 () Bool)

(declare-fun res!155256 () Bool)

(declare-fun e!186724 () Bool)

(assert (=> d!67001 (=> res!155256 e!186724)))

(assert (=> d!67001 (= res!155256 (bvsge #b00000000000000000000000000000000 (size!7426 a!3312)))))

(assert (=> d!67001 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186724)))

(declare-fun b!295433 () Bool)

(declare-fun e!186722 () Bool)

(assert (=> b!295433 (= e!186723 e!186722)))

(declare-fun lt!146471 () (_ BitVec 64))

(assert (=> b!295433 (= lt!146471 (select (arr!7074 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9220 0))(
  ( (Unit!9221) )
))
(declare-fun lt!146472 () Unit!9220)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14924 (_ BitVec 64) (_ BitVec 32)) Unit!9220)

(assert (=> b!295433 (= lt!146472 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146471 #b00000000000000000000000000000000))))

(assert (=> b!295433 (arrayContainsKey!0 a!3312 lt!146471 #b00000000000000000000000000000000)))

(declare-fun lt!146470 () Unit!9220)

(assert (=> b!295433 (= lt!146470 lt!146472)))

(declare-fun res!155257 () Bool)

(assert (=> b!295433 (= res!155257 (= (seekEntryOrOpen!0 (select (arr!7074 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2223 #b00000000000000000000000000000000)))))

(assert (=> b!295433 (=> (not res!155257) (not e!186722))))

(declare-fun b!295434 () Bool)

(assert (=> b!295434 (= e!186722 call!25729)))

(declare-fun b!295435 () Bool)

(assert (=> b!295435 (= e!186724 e!186723)))

(declare-fun c!47666 () Bool)

(assert (=> b!295435 (= c!47666 (validKeyInArray!0 (select (arr!7074 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25726 () Bool)

(assert (=> bm!25726 (= call!25729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67001 (not res!155256)) b!295435))

(assert (= (and b!295435 c!47666) b!295433))

(assert (= (and b!295435 (not c!47666)) b!295432))

(assert (= (and b!295433 res!155257) b!295434))

(assert (= (or b!295434 b!295432) bm!25726))

(declare-fun m!308539 () Bool)

(assert (=> b!295433 m!308539))

(declare-fun m!308541 () Bool)

(assert (=> b!295433 m!308541))

(declare-fun m!308543 () Bool)

(assert (=> b!295433 m!308543))

(assert (=> b!295433 m!308539))

(declare-fun m!308545 () Bool)

(assert (=> b!295433 m!308545))

(assert (=> b!295435 m!308539))

(assert (=> b!295435 m!308539))

(declare-fun m!308547 () Bool)

(assert (=> b!295435 m!308547))

(declare-fun m!308549 () Bool)

(assert (=> bm!25726 m!308549))

(assert (=> b!295226 d!67001))

(declare-fun d!67005 () Bool)

(declare-fun res!155264 () Bool)

(declare-fun e!186735 () Bool)

(assert (=> d!67005 (=> res!155264 e!186735)))

(assert (=> d!67005 (= res!155264 (= (select (arr!7074 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67005 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186735)))

(declare-fun b!295450 () Bool)

(declare-fun e!186736 () Bool)

(assert (=> b!295450 (= e!186735 e!186736)))

(declare-fun res!155265 () Bool)

(assert (=> b!295450 (=> (not res!155265) (not e!186736))))

(assert (=> b!295450 (= res!155265 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7426 a!3312)))))

(declare-fun b!295451 () Bool)

(assert (=> b!295451 (= e!186736 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67005 (not res!155264)) b!295450))

(assert (= (and b!295450 res!155265) b!295451))

(assert (=> d!67005 m!308539))

(declare-fun m!308575 () Bool)

(assert (=> b!295451 m!308575))

(assert (=> b!295227 d!67005))

(check-sat (not b!295433) (not d!66969) (not b!295435) (not b!295370) (not b!295451) (not d!66995) (not b!295290) (not d!66981) (not bm!25726) (not b!295379))
(check-sat)
