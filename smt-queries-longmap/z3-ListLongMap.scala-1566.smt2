; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29818 () Bool)

(assert start!29818)

(declare-fun b!300196 () Bool)

(declare-fun e!189568 () Bool)

(declare-fun e!189570 () Bool)

(assert (=> b!300196 (= e!189568 e!189570)))

(declare-fun res!158278 () Bool)

(assert (=> b!300196 (=> (not res!158278) (not e!189570))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2288 0))(
  ( (MissingZero!2288 (index!11328 (_ BitVec 32))) (Found!2288 (index!11329 (_ BitVec 32))) (Intermediate!2288 (undefined!3100 Bool) (index!11330 (_ BitVec 32)) (x!29689 (_ BitVec 32))) (Undefined!2288) (MissingVacant!2288 (index!11331 (_ BitVec 32))) )
))
(declare-fun lt!149368 () SeekEntryResult!2288)

(declare-fun lt!149369 () Bool)

(assert (=> b!300196 (= res!158278 (or lt!149369 (= lt!149368 (MissingVacant!2288 i!1256))))))

(assert (=> b!300196 (= lt!149369 (= lt!149368 (MissingZero!2288 i!1256)))))

(declare-datatypes ((array!15156 0))(
  ( (array!15157 (arr!7174 (Array (_ BitVec 32) (_ BitVec 64))) (size!7526 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15156)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15156 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!300196 (= lt!149368 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300197 () Bool)

(declare-fun res!158282 () Bool)

(assert (=> b!300197 (=> (not res!158282) (not e!189568))))

(assert (=> b!300197 (= res!158282 (and (= (size!7526 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7526 a!3312))))))

(declare-fun res!158283 () Bool)

(assert (=> start!29818 (=> (not res!158283) (not e!189568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29818 (= res!158283 (validMask!0 mask!3809))))

(assert (=> start!29818 e!189568))

(assert (=> start!29818 true))

(declare-fun array_inv!5124 (array!15156) Bool)

(assert (=> start!29818 (array_inv!5124 a!3312)))

(declare-fun b!300198 () Bool)

(declare-fun res!158280 () Bool)

(assert (=> b!300198 (=> (not res!158280) (not e!189568))))

(declare-fun arrayContainsKey!0 (array!15156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300198 (= res!158280 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300199 () Bool)

(declare-fun res!158279 () Bool)

(assert (=> b!300199 (=> (not res!158279) (not e!189568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300199 (= res!158279 (validKeyInArray!0 k0!2524))))

(declare-fun b!300200 () Bool)

(declare-fun res!158281 () Bool)

(assert (=> b!300200 (=> (not res!158281) (not e!189570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15156 (_ BitVec 32)) Bool)

(assert (=> b!300200 (= res!158281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300201 () Bool)

(declare-fun lt!149370 () SeekEntryResult!2288)

(get-info :version)

(assert (=> b!300201 (= e!189570 (and (not lt!149369) (= lt!149368 (MissingVacant!2288 i!1256)) (let ((bdg!6466 (not ((_ is Intermediate!2288) lt!149370)))) (and (or bdg!6466 (not (undefined!3100 lt!149370))) (or bdg!6466 (not (= (select (arr!7174 a!3312) (index!11330 lt!149370)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6466 (not (= (select (arr!7174 a!3312) (index!11330 lt!149370)) k0!2524))) (not bdg!6466)))))))

(declare-fun lt!149367 () SeekEntryResult!2288)

(declare-fun lt!149366 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15156 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!300201 (= lt!149367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149366 k0!2524 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312)) mask!3809))))

(assert (=> b!300201 (= lt!149370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149366 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300201 (= lt!149366 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29818 res!158283) b!300197))

(assert (= (and b!300197 res!158282) b!300199))

(assert (= (and b!300199 res!158279) b!300198))

(assert (= (and b!300198 res!158280) b!300196))

(assert (= (and b!300196 res!158278) b!300200))

(assert (= (and b!300200 res!158281) b!300201))

(declare-fun m!312405 () Bool)

(assert (=> b!300196 m!312405))

(declare-fun m!312407 () Bool)

(assert (=> b!300199 m!312407))

(declare-fun m!312409 () Bool)

(assert (=> b!300200 m!312409))

(declare-fun m!312411 () Bool)

(assert (=> b!300201 m!312411))

(declare-fun m!312413 () Bool)

(assert (=> b!300201 m!312413))

(declare-fun m!312415 () Bool)

(assert (=> b!300201 m!312415))

(declare-fun m!312417 () Bool)

(assert (=> b!300201 m!312417))

(declare-fun m!312419 () Bool)

(assert (=> b!300201 m!312419))

(declare-fun m!312421 () Bool)

(assert (=> b!300198 m!312421))

(declare-fun m!312423 () Bool)

(assert (=> start!29818 m!312423))

(declare-fun m!312425 () Bool)

(assert (=> start!29818 m!312425))

(check-sat (not b!300201) (not b!300200) (not b!300198) (not start!29818) (not b!300196) (not b!300199))
(check-sat)
(get-model)

(declare-fun d!67739 () Bool)

(declare-fun res!158324 () Bool)

(declare-fun e!189593 () Bool)

(assert (=> d!67739 (=> res!158324 e!189593)))

(assert (=> d!67739 (= res!158324 (= (select (arr!7174 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67739 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189593)))

(declare-fun b!300242 () Bool)

(declare-fun e!189594 () Bool)

(assert (=> b!300242 (= e!189593 e!189594)))

(declare-fun res!158325 () Bool)

(assert (=> b!300242 (=> (not res!158325) (not e!189594))))

(assert (=> b!300242 (= res!158325 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7526 a!3312)))))

(declare-fun b!300243 () Bool)

(assert (=> b!300243 (= e!189594 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67739 (not res!158324)) b!300242))

(assert (= (and b!300242 res!158325) b!300243))

(declare-fun m!312471 () Bool)

(assert (=> d!67739 m!312471))

(declare-fun m!312473 () Bool)

(assert (=> b!300243 m!312473))

(assert (=> b!300198 d!67739))

(declare-fun d!67741 () Bool)

(assert (=> d!67741 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300199 d!67741))

(declare-fun d!67743 () Bool)

(assert (=> d!67743 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29818 d!67743))

(declare-fun d!67745 () Bool)

(assert (=> d!67745 (= (array_inv!5124 a!3312) (bvsge (size!7526 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29818 d!67745))

(declare-fun b!300252 () Bool)

(declare-fun e!189601 () Bool)

(declare-fun e!189602 () Bool)

(assert (=> b!300252 (= e!189601 e!189602)))

(declare-fun c!48554 () Bool)

(assert (=> b!300252 (= c!48554 (validKeyInArray!0 (select (arr!7174 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!300253 () Bool)

(declare-fun call!25835 () Bool)

(assert (=> b!300253 (= e!189602 call!25835)))

(declare-fun b!300254 () Bool)

(declare-fun e!189603 () Bool)

(assert (=> b!300254 (= e!189603 call!25835)))

(declare-fun bm!25832 () Bool)

(assert (=> bm!25832 (= call!25835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!300255 () Bool)

(assert (=> b!300255 (= e!189602 e!189603)))

(declare-fun lt!149408 () (_ BitVec 64))

(assert (=> b!300255 (= lt!149408 (select (arr!7174 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9325 0))(
  ( (Unit!9326) )
))
(declare-fun lt!149407 () Unit!9325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15156 (_ BitVec 64) (_ BitVec 32)) Unit!9325)

(assert (=> b!300255 (= lt!149407 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149408 #b00000000000000000000000000000000))))

(assert (=> b!300255 (arrayContainsKey!0 a!3312 lt!149408 #b00000000000000000000000000000000)))

(declare-fun lt!149409 () Unit!9325)

(assert (=> b!300255 (= lt!149409 lt!149407)))

(declare-fun res!158330 () Bool)

(assert (=> b!300255 (= res!158330 (= (seekEntryOrOpen!0 (select (arr!7174 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2288 #b00000000000000000000000000000000)))))

(assert (=> b!300255 (=> (not res!158330) (not e!189603))))

(declare-fun d!67747 () Bool)

(declare-fun res!158331 () Bool)

(assert (=> d!67747 (=> res!158331 e!189601)))

(assert (=> d!67747 (= res!158331 (bvsge #b00000000000000000000000000000000 (size!7526 a!3312)))))

(assert (=> d!67747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189601)))

(assert (= (and d!67747 (not res!158331)) b!300252))

(assert (= (and b!300252 c!48554) b!300255))

(assert (= (and b!300252 (not c!48554)) b!300253))

(assert (= (and b!300255 res!158330) b!300254))

(assert (= (or b!300254 b!300253) bm!25832))

(assert (=> b!300252 m!312471))

(assert (=> b!300252 m!312471))

(declare-fun m!312475 () Bool)

(assert (=> b!300252 m!312475))

(declare-fun m!312477 () Bool)

(assert (=> bm!25832 m!312477))

(assert (=> b!300255 m!312471))

(declare-fun m!312479 () Bool)

(assert (=> b!300255 m!312479))

(declare-fun m!312481 () Bool)

(assert (=> b!300255 m!312481))

(assert (=> b!300255 m!312471))

(declare-fun m!312483 () Bool)

(assert (=> b!300255 m!312483))

(assert (=> b!300200 d!67747))

(declare-fun b!300292 () Bool)

(declare-fun e!189624 () SeekEntryResult!2288)

(assert (=> b!300292 (= e!189624 (Intermediate!2288 false lt!149366 #b00000000000000000000000000000000))))

(declare-fun b!300293 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300293 (= e!189624 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312)) mask!3809))))

(declare-fun b!300294 () Bool)

(declare-fun lt!149424 () SeekEntryResult!2288)

(assert (=> b!300294 (and (bvsge (index!11330 lt!149424) #b00000000000000000000000000000000) (bvslt (index!11330 lt!149424) (size!7526 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312)))))))

(declare-fun res!158339 () Bool)

(assert (=> b!300294 (= res!158339 (= (select (arr!7174 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312))) (index!11330 lt!149424)) k0!2524))))

(declare-fun e!189626 () Bool)

(assert (=> b!300294 (=> res!158339 e!189626)))

(declare-fun e!189627 () Bool)

(assert (=> b!300294 (= e!189627 e!189626)))

(declare-fun b!300295 () Bool)

(declare-fun e!189623 () Bool)

(assert (=> b!300295 (= e!189623 (bvsge (x!29689 lt!149424) #b01111111111111111111111111111110))))

(declare-fun b!300296 () Bool)

(assert (=> b!300296 (and (bvsge (index!11330 lt!149424) #b00000000000000000000000000000000) (bvslt (index!11330 lt!149424) (size!7526 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312)))))))

(declare-fun res!158338 () Bool)

(assert (=> b!300296 (= res!158338 (= (select (arr!7174 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312))) (index!11330 lt!149424)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300296 (=> res!158338 e!189626)))

(declare-fun d!67751 () Bool)

(assert (=> d!67751 e!189623))

(declare-fun c!48571 () Bool)

(assert (=> d!67751 (= c!48571 (and ((_ is Intermediate!2288) lt!149424) (undefined!3100 lt!149424)))))

(declare-fun e!189625 () SeekEntryResult!2288)

(assert (=> d!67751 (= lt!149424 e!189625)))

(declare-fun c!48572 () Bool)

(assert (=> d!67751 (= c!48572 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149423 () (_ BitVec 64))

(assert (=> d!67751 (= lt!149423 (select (arr!7174 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312))) lt!149366))))

(assert (=> d!67751 (validMask!0 mask!3809)))

(assert (=> d!67751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149366 k0!2524 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312)) mask!3809) lt!149424)))

(declare-fun b!300297 () Bool)

(assert (=> b!300297 (= e!189625 (Intermediate!2288 true lt!149366 #b00000000000000000000000000000000))))

(declare-fun b!300298 () Bool)

(assert (=> b!300298 (= e!189625 e!189624)))

(declare-fun c!48570 () Bool)

(assert (=> b!300298 (= c!48570 (or (= lt!149423 k0!2524) (= (bvadd lt!149423 lt!149423) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300299 () Bool)

(assert (=> b!300299 (= e!189623 e!189627)))

(declare-fun res!158340 () Bool)

(assert (=> b!300299 (= res!158340 (and ((_ is Intermediate!2288) lt!149424) (not (undefined!3100 lt!149424)) (bvslt (x!29689 lt!149424) #b01111111111111111111111111111110) (bvsge (x!29689 lt!149424) #b00000000000000000000000000000000) (bvsge (x!29689 lt!149424) #b00000000000000000000000000000000)))))

(assert (=> b!300299 (=> (not res!158340) (not e!189627))))

(declare-fun b!300300 () Bool)

(assert (=> b!300300 (and (bvsge (index!11330 lt!149424) #b00000000000000000000000000000000) (bvslt (index!11330 lt!149424) (size!7526 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312)))))))

(assert (=> b!300300 (= e!189626 (= (select (arr!7174 (array!15157 (store (arr!7174 a!3312) i!1256 k0!2524) (size!7526 a!3312))) (index!11330 lt!149424)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67751 c!48572) b!300297))

(assert (= (and d!67751 (not c!48572)) b!300298))

(assert (= (and b!300298 c!48570) b!300292))

(assert (= (and b!300298 (not c!48570)) b!300293))

(assert (= (and d!67751 c!48571) b!300295))

(assert (= (and d!67751 (not c!48571)) b!300299))

(assert (= (and b!300299 res!158340) b!300294))

(assert (= (and b!300294 (not res!158339)) b!300296))

(assert (= (and b!300296 (not res!158338)) b!300300))

(declare-fun m!312497 () Bool)

(assert (=> b!300294 m!312497))

(declare-fun m!312499 () Bool)

(assert (=> b!300293 m!312499))

(assert (=> b!300293 m!312499))

(declare-fun m!312501 () Bool)

(assert (=> b!300293 m!312501))

(declare-fun m!312503 () Bool)

(assert (=> d!67751 m!312503))

(assert (=> d!67751 m!312423))

(assert (=> b!300300 m!312497))

(assert (=> b!300296 m!312497))

(assert (=> b!300201 d!67751))

(declare-fun b!300301 () Bool)

(declare-fun e!189629 () SeekEntryResult!2288)

(assert (=> b!300301 (= e!189629 (Intermediate!2288 false lt!149366 #b00000000000000000000000000000000))))

(declare-fun b!300302 () Bool)

(assert (=> b!300302 (= e!189629 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!300303 () Bool)

(declare-fun lt!149426 () SeekEntryResult!2288)

(assert (=> b!300303 (and (bvsge (index!11330 lt!149426) #b00000000000000000000000000000000) (bvslt (index!11330 lt!149426) (size!7526 a!3312)))))

(declare-fun res!158342 () Bool)

(assert (=> b!300303 (= res!158342 (= (select (arr!7174 a!3312) (index!11330 lt!149426)) k0!2524))))

(declare-fun e!189631 () Bool)

(assert (=> b!300303 (=> res!158342 e!189631)))

(declare-fun e!189632 () Bool)

(assert (=> b!300303 (= e!189632 e!189631)))

(declare-fun b!300304 () Bool)

(declare-fun e!189628 () Bool)

(assert (=> b!300304 (= e!189628 (bvsge (x!29689 lt!149426) #b01111111111111111111111111111110))))

(declare-fun b!300305 () Bool)

(assert (=> b!300305 (and (bvsge (index!11330 lt!149426) #b00000000000000000000000000000000) (bvslt (index!11330 lt!149426) (size!7526 a!3312)))))

(declare-fun res!158341 () Bool)

(assert (=> b!300305 (= res!158341 (= (select (arr!7174 a!3312) (index!11330 lt!149426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300305 (=> res!158341 e!189631)))

(declare-fun d!67757 () Bool)

(assert (=> d!67757 e!189628))

(declare-fun c!48574 () Bool)

(assert (=> d!67757 (= c!48574 (and ((_ is Intermediate!2288) lt!149426) (undefined!3100 lt!149426)))))

(declare-fun e!189630 () SeekEntryResult!2288)

(assert (=> d!67757 (= lt!149426 e!189630)))

(declare-fun c!48575 () Bool)

(assert (=> d!67757 (= c!48575 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149425 () (_ BitVec 64))

(assert (=> d!67757 (= lt!149425 (select (arr!7174 a!3312) lt!149366))))

(assert (=> d!67757 (validMask!0 mask!3809)))

(assert (=> d!67757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149366 k0!2524 a!3312 mask!3809) lt!149426)))

(declare-fun b!300306 () Bool)

(assert (=> b!300306 (= e!189630 (Intermediate!2288 true lt!149366 #b00000000000000000000000000000000))))

(declare-fun b!300307 () Bool)

(assert (=> b!300307 (= e!189630 e!189629)))

(declare-fun c!48573 () Bool)

(assert (=> b!300307 (= c!48573 (or (= lt!149425 k0!2524) (= (bvadd lt!149425 lt!149425) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300308 () Bool)

(assert (=> b!300308 (= e!189628 e!189632)))

(declare-fun res!158343 () Bool)

(assert (=> b!300308 (= res!158343 (and ((_ is Intermediate!2288) lt!149426) (not (undefined!3100 lt!149426)) (bvslt (x!29689 lt!149426) #b01111111111111111111111111111110) (bvsge (x!29689 lt!149426) #b00000000000000000000000000000000) (bvsge (x!29689 lt!149426) #b00000000000000000000000000000000)))))

(assert (=> b!300308 (=> (not res!158343) (not e!189632))))

(declare-fun b!300309 () Bool)

(assert (=> b!300309 (and (bvsge (index!11330 lt!149426) #b00000000000000000000000000000000) (bvslt (index!11330 lt!149426) (size!7526 a!3312)))))

(assert (=> b!300309 (= e!189631 (= (select (arr!7174 a!3312) (index!11330 lt!149426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67757 c!48575) b!300306))

(assert (= (and d!67757 (not c!48575)) b!300307))

(assert (= (and b!300307 c!48573) b!300301))

(assert (= (and b!300307 (not c!48573)) b!300302))

(assert (= (and d!67757 c!48574) b!300304))

(assert (= (and d!67757 (not c!48574)) b!300308))

(assert (= (and b!300308 res!158343) b!300303))

(assert (= (and b!300303 (not res!158342)) b!300305))

(assert (= (and b!300305 (not res!158341)) b!300309))

(declare-fun m!312505 () Bool)

(assert (=> b!300303 m!312505))

(assert (=> b!300302 m!312499))

(assert (=> b!300302 m!312499))

(declare-fun m!312507 () Bool)

(assert (=> b!300302 m!312507))

(declare-fun m!312509 () Bool)

(assert (=> d!67757 m!312509))

(assert (=> d!67757 m!312423))

(assert (=> b!300309 m!312505))

(assert (=> b!300305 m!312505))

(assert (=> b!300201 d!67757))

(declare-fun d!67759 () Bool)

(declare-fun lt!149432 () (_ BitVec 32))

(declare-fun lt!149431 () (_ BitVec 32))

(assert (=> d!67759 (= lt!149432 (bvmul (bvxor lt!149431 (bvlshr lt!149431 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67759 (= lt!149431 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67759 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158344 (let ((h!5234 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29693 (bvmul (bvxor h!5234 (bvlshr h!5234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29693 (bvlshr x!29693 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158344 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158344 #b00000000000000000000000000000000))))))

(assert (=> d!67759 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149432 (bvlshr lt!149432 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!300201 d!67759))

(declare-fun b!300358 () Bool)

(declare-fun e!189658 () SeekEntryResult!2288)

(declare-fun e!189660 () SeekEntryResult!2288)

(assert (=> b!300358 (= e!189658 e!189660)))

(declare-fun lt!149452 () (_ BitVec 64))

(declare-fun lt!149453 () SeekEntryResult!2288)

(assert (=> b!300358 (= lt!149452 (select (arr!7174 a!3312) (index!11330 lt!149453)))))

(declare-fun c!48598 () Bool)

(assert (=> b!300358 (= c!48598 (= lt!149452 k0!2524))))

(declare-fun b!300360 () Bool)

(assert (=> b!300360 (= e!189658 Undefined!2288)))

(declare-fun b!300361 () Bool)

(assert (=> b!300361 (= e!189660 (Found!2288 (index!11330 lt!149453)))))

(declare-fun d!67763 () Bool)

(declare-fun lt!149454 () SeekEntryResult!2288)

(assert (=> d!67763 (and (or ((_ is Undefined!2288) lt!149454) (not ((_ is Found!2288) lt!149454)) (and (bvsge (index!11329 lt!149454) #b00000000000000000000000000000000) (bvslt (index!11329 lt!149454) (size!7526 a!3312)))) (or ((_ is Undefined!2288) lt!149454) ((_ is Found!2288) lt!149454) (not ((_ is MissingZero!2288) lt!149454)) (and (bvsge (index!11328 lt!149454) #b00000000000000000000000000000000) (bvslt (index!11328 lt!149454) (size!7526 a!3312)))) (or ((_ is Undefined!2288) lt!149454) ((_ is Found!2288) lt!149454) ((_ is MissingZero!2288) lt!149454) (not ((_ is MissingVacant!2288) lt!149454)) (and (bvsge (index!11331 lt!149454) #b00000000000000000000000000000000) (bvslt (index!11331 lt!149454) (size!7526 a!3312)))) (or ((_ is Undefined!2288) lt!149454) (ite ((_ is Found!2288) lt!149454) (= (select (arr!7174 a!3312) (index!11329 lt!149454)) k0!2524) (ite ((_ is MissingZero!2288) lt!149454) (= (select (arr!7174 a!3312) (index!11328 lt!149454)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2288) lt!149454) (= (select (arr!7174 a!3312) (index!11331 lt!149454)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67763 (= lt!149454 e!189658)))

(declare-fun c!48599 () Bool)

(assert (=> d!67763 (= c!48599 (and ((_ is Intermediate!2288) lt!149453) (undefined!3100 lt!149453)))))

(assert (=> d!67763 (= lt!149453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67763 (validMask!0 mask!3809)))

(assert (=> d!67763 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149454)))

(declare-fun b!300359 () Bool)

(declare-fun e!189659 () SeekEntryResult!2288)

(assert (=> b!300359 (= e!189659 (MissingZero!2288 (index!11330 lt!149453)))))

(declare-fun b!300362 () Bool)

(declare-fun c!48597 () Bool)

(assert (=> b!300362 (= c!48597 (= lt!149452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300362 (= e!189660 e!189659)))

(declare-fun b!300363 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15156 (_ BitVec 32)) SeekEntryResult!2288)

(assert (=> b!300363 (= e!189659 (seekKeyOrZeroReturnVacant!0 (x!29689 lt!149453) (index!11330 lt!149453) (index!11330 lt!149453) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67763 c!48599) b!300360))

(assert (= (and d!67763 (not c!48599)) b!300358))

(assert (= (and b!300358 c!48598) b!300361))

(assert (= (and b!300358 (not c!48598)) b!300362))

(assert (= (and b!300362 c!48597) b!300359))

(assert (= (and b!300362 (not c!48597)) b!300363))

(declare-fun m!312523 () Bool)

(assert (=> b!300358 m!312523))

(assert (=> d!67763 m!312417))

(declare-fun m!312525 () Bool)

(assert (=> d!67763 m!312525))

(declare-fun m!312527 () Bool)

(assert (=> d!67763 m!312527))

(assert (=> d!67763 m!312417))

(declare-fun m!312529 () Bool)

(assert (=> d!67763 m!312529))

(assert (=> d!67763 m!312423))

(declare-fun m!312531 () Bool)

(assert (=> d!67763 m!312531))

(declare-fun m!312533 () Bool)

(assert (=> b!300363 m!312533))

(assert (=> b!300196 d!67763))

(check-sat (not b!300243) (not b!300302) (not d!67763) (not b!300363) (not d!67757) (not b!300252) (not bm!25832) (not b!300293) (not d!67751) (not b!300255))
(check-sat)
