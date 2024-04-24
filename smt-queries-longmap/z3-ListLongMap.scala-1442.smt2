; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27808 () Bool)

(assert start!27808)

(declare-fun b!286388 () Bool)

(declare-fun res!148518 () Bool)

(declare-fun e!181462 () Bool)

(assert (=> b!286388 (=> (not res!148518) (not e!181462))))

(declare-datatypes ((array!14334 0))(
  ( (array!14335 (arr!6802 (Array (_ BitVec 32) (_ BitVec 64))) (size!7154 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14334)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14334 (_ BitVec 32)) Bool)

(assert (=> b!286388 (= res!148518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286389 () Bool)

(declare-fun e!181463 () Bool)

(assert (=> b!286389 (= e!181463 e!181462)))

(declare-fun res!148513 () Bool)

(assert (=> b!286389 (=> (not res!148513) (not e!181462))))

(declare-datatypes ((SeekEntryResult!1916 0))(
  ( (MissingZero!1916 (index!9834 (_ BitVec 32))) (Found!1916 (index!9835 (_ BitVec 32))) (Intermediate!1916 (undefined!2728 Bool) (index!9836 (_ BitVec 32)) (x!28164 (_ BitVec 32))) (Undefined!1916) (MissingVacant!1916 (index!9837 (_ BitVec 32))) )
))
(declare-fun lt!141120 () SeekEntryResult!1916)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286389 (= res!148513 (or (= lt!141120 (MissingZero!1916 i!1256)) (= lt!141120 (MissingVacant!1916 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14334 (_ BitVec 32)) SeekEntryResult!1916)

(assert (=> b!286389 (= lt!141120 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286390 () Bool)

(assert (=> b!286390 (= e!181462 (and (bvsge mask!3809 #b00000000000000000000000000000000) (bvsgt mask!3809 #b00111111111111111111111111111111)))))

(declare-fun b!286392 () Bool)

(declare-fun res!148516 () Bool)

(assert (=> b!286392 (=> (not res!148516) (not e!181463))))

(declare-fun arrayContainsKey!0 (array!14334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286392 (= res!148516 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286393 () Bool)

(declare-fun res!148517 () Bool)

(assert (=> b!286393 (=> (not res!148517) (not e!181463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286393 (= res!148517 (validKeyInArray!0 k0!2524))))

(declare-fun res!148514 () Bool)

(assert (=> start!27808 (=> (not res!148514) (not e!181463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27808 (= res!148514 (validMask!0 mask!3809))))

(assert (=> start!27808 e!181463))

(assert (=> start!27808 true))

(declare-fun array_inv!4752 (array!14334) Bool)

(assert (=> start!27808 (array_inv!4752 a!3312)))

(declare-fun b!286391 () Bool)

(declare-fun res!148515 () Bool)

(assert (=> b!286391 (=> (not res!148515) (not e!181463))))

(assert (=> b!286391 (= res!148515 (and (= (size!7154 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7154 a!3312))))))

(assert (= (and start!27808 res!148514) b!286391))

(assert (= (and b!286391 res!148515) b!286393))

(assert (= (and b!286393 res!148517) b!286392))

(assert (= (and b!286392 res!148516) b!286389))

(assert (= (and b!286389 res!148513) b!286388))

(assert (= (and b!286388 res!148518) b!286390))

(declare-fun m!301247 () Bool)

(assert (=> b!286389 m!301247))

(declare-fun m!301249 () Bool)

(assert (=> start!27808 m!301249))

(declare-fun m!301251 () Bool)

(assert (=> start!27808 m!301251))

(declare-fun m!301253 () Bool)

(assert (=> b!286388 m!301253))

(declare-fun m!301255 () Bool)

(assert (=> b!286392 m!301255))

(declare-fun m!301257 () Bool)

(assert (=> b!286393 m!301257))

(check-sat (not b!286389) (not start!27808) (not b!286392) (not b!286388) (not b!286393))
(check-sat)
(get-model)

(declare-fun b!286442 () Bool)

(declare-fun lt!141135 () SeekEntryResult!1916)

(declare-fun e!181489 () SeekEntryResult!1916)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14334 (_ BitVec 32)) SeekEntryResult!1916)

(assert (=> b!286442 (= e!181489 (seekKeyOrZeroReturnVacant!0 (x!28164 lt!141135) (index!9836 lt!141135) (index!9836 lt!141135) k0!2524 a!3312 mask!3809))))

(declare-fun d!66017 () Bool)

(declare-fun lt!141134 () SeekEntryResult!1916)

(get-info :version)

(assert (=> d!66017 (and (or ((_ is Undefined!1916) lt!141134) (not ((_ is Found!1916) lt!141134)) (and (bvsge (index!9835 lt!141134) #b00000000000000000000000000000000) (bvslt (index!9835 lt!141134) (size!7154 a!3312)))) (or ((_ is Undefined!1916) lt!141134) ((_ is Found!1916) lt!141134) (not ((_ is MissingZero!1916) lt!141134)) (and (bvsge (index!9834 lt!141134) #b00000000000000000000000000000000) (bvslt (index!9834 lt!141134) (size!7154 a!3312)))) (or ((_ is Undefined!1916) lt!141134) ((_ is Found!1916) lt!141134) ((_ is MissingZero!1916) lt!141134) (not ((_ is MissingVacant!1916) lt!141134)) (and (bvsge (index!9837 lt!141134) #b00000000000000000000000000000000) (bvslt (index!9837 lt!141134) (size!7154 a!3312)))) (or ((_ is Undefined!1916) lt!141134) (ite ((_ is Found!1916) lt!141134) (= (select (arr!6802 a!3312) (index!9835 lt!141134)) k0!2524) (ite ((_ is MissingZero!1916) lt!141134) (= (select (arr!6802 a!3312) (index!9834 lt!141134)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1916) lt!141134) (= (select (arr!6802 a!3312) (index!9837 lt!141134)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!181490 () SeekEntryResult!1916)

(assert (=> d!66017 (= lt!141134 e!181490)))

(declare-fun c!46500 () Bool)

(assert (=> d!66017 (= c!46500 (and ((_ is Intermediate!1916) lt!141135) (undefined!2728 lt!141135)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14334 (_ BitVec 32)) SeekEntryResult!1916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!66017 (= lt!141135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66017 (validMask!0 mask!3809)))

(assert (=> d!66017 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141134)))

(declare-fun b!286443 () Bool)

(declare-fun e!181488 () SeekEntryResult!1916)

(assert (=> b!286443 (= e!181490 e!181488)))

(declare-fun lt!141133 () (_ BitVec 64))

(assert (=> b!286443 (= lt!141133 (select (arr!6802 a!3312) (index!9836 lt!141135)))))

(declare-fun c!46499 () Bool)

(assert (=> b!286443 (= c!46499 (= lt!141133 k0!2524))))

(declare-fun b!286444 () Bool)

(assert (=> b!286444 (= e!181489 (MissingZero!1916 (index!9836 lt!141135)))))

(declare-fun b!286445 () Bool)

(assert (=> b!286445 (= e!181490 Undefined!1916)))

(declare-fun b!286446 () Bool)

(assert (=> b!286446 (= e!181488 (Found!1916 (index!9836 lt!141135)))))

(declare-fun b!286447 () Bool)

(declare-fun c!46501 () Bool)

(assert (=> b!286447 (= c!46501 (= lt!141133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!286447 (= e!181488 e!181489)))

(assert (= (and d!66017 c!46500) b!286445))

(assert (= (and d!66017 (not c!46500)) b!286443))

(assert (= (and b!286443 c!46499) b!286446))

(assert (= (and b!286443 (not c!46499)) b!286447))

(assert (= (and b!286447 c!46501) b!286444))

(assert (= (and b!286447 (not c!46501)) b!286442))

(declare-fun m!301283 () Bool)

(assert (=> b!286442 m!301283))

(declare-fun m!301285 () Bool)

(assert (=> d!66017 m!301285))

(declare-fun m!301287 () Bool)

(assert (=> d!66017 m!301287))

(assert (=> d!66017 m!301249))

(declare-fun m!301289 () Bool)

(assert (=> d!66017 m!301289))

(declare-fun m!301291 () Bool)

(assert (=> d!66017 m!301291))

(assert (=> d!66017 m!301289))

(declare-fun m!301293 () Bool)

(assert (=> d!66017 m!301293))

(declare-fun m!301295 () Bool)

(assert (=> b!286443 m!301295))

(assert (=> b!286389 d!66017))

(declare-fun b!286470 () Bool)

(declare-fun e!181510 () Bool)

(declare-fun e!181511 () Bool)

(assert (=> b!286470 (= e!181510 e!181511)))

(declare-fun lt!141150 () (_ BitVec 64))

(assert (=> b!286470 (= lt!141150 (select (arr!6802 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9024 0))(
  ( (Unit!9025) )
))
(declare-fun lt!141148 () Unit!9024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14334 (_ BitVec 64) (_ BitVec 32)) Unit!9024)

(assert (=> b!286470 (= lt!141148 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141150 #b00000000000000000000000000000000))))

(assert (=> b!286470 (arrayContainsKey!0 a!3312 lt!141150 #b00000000000000000000000000000000)))

(declare-fun lt!141149 () Unit!9024)

(assert (=> b!286470 (= lt!141149 lt!141148)))

(declare-fun res!148570 () Bool)

(assert (=> b!286470 (= res!148570 (= (seekEntryOrOpen!0 (select (arr!6802 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1916 #b00000000000000000000000000000000)))))

(assert (=> b!286470 (=> (not res!148570) (not e!181511))))

(declare-fun b!286471 () Bool)

(declare-fun call!25581 () Bool)

(assert (=> b!286471 (= e!181510 call!25581)))

(declare-fun bm!25578 () Bool)

(assert (=> bm!25578 (= call!25581 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66023 () Bool)

(declare-fun res!148569 () Bool)

(declare-fun e!181509 () Bool)

(assert (=> d!66023 (=> res!148569 e!181509)))

(assert (=> d!66023 (= res!148569 (bvsge #b00000000000000000000000000000000 (size!7154 a!3312)))))

(assert (=> d!66023 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181509)))

(declare-fun b!286472 () Bool)

(assert (=> b!286472 (= e!181511 call!25581)))

(declare-fun b!286473 () Bool)

(assert (=> b!286473 (= e!181509 e!181510)))

(declare-fun c!46506 () Bool)

(assert (=> b!286473 (= c!46506 (validKeyInArray!0 (select (arr!6802 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66023 (not res!148569)) b!286473))

(assert (= (and b!286473 c!46506) b!286470))

(assert (= (and b!286473 (not c!46506)) b!286471))

(assert (= (and b!286470 res!148570) b!286472))

(assert (= (or b!286472 b!286471) bm!25578))

(declare-fun m!301301 () Bool)

(assert (=> b!286470 m!301301))

(declare-fun m!301303 () Bool)

(assert (=> b!286470 m!301303))

(declare-fun m!301305 () Bool)

(assert (=> b!286470 m!301305))

(assert (=> b!286470 m!301301))

(declare-fun m!301307 () Bool)

(assert (=> b!286470 m!301307))

(declare-fun m!301309 () Bool)

(assert (=> bm!25578 m!301309))

(assert (=> b!286473 m!301301))

(assert (=> b!286473 m!301301))

(declare-fun m!301311 () Bool)

(assert (=> b!286473 m!301311))

(assert (=> b!286388 d!66023))

(declare-fun d!66027 () Bool)

(assert (=> d!66027 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286393 d!66027))

(declare-fun d!66029 () Bool)

(assert (=> d!66029 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27808 d!66029))

(declare-fun d!66035 () Bool)

(assert (=> d!66035 (= (array_inv!4752 a!3312) (bvsge (size!7154 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27808 d!66035))

(declare-fun d!66037 () Bool)

(declare-fun res!148577 () Bool)

(declare-fun e!181525 () Bool)

(assert (=> d!66037 (=> res!148577 e!181525)))

(assert (=> d!66037 (= res!148577 (= (select (arr!6802 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66037 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!181525)))

(declare-fun b!286494 () Bool)

(declare-fun e!181526 () Bool)

(assert (=> b!286494 (= e!181525 e!181526)))

(declare-fun res!148578 () Bool)

(assert (=> b!286494 (=> (not res!148578) (not e!181526))))

(assert (=> b!286494 (= res!148578 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7154 a!3312)))))

(declare-fun b!286495 () Bool)

(assert (=> b!286495 (= e!181526 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66037 (not res!148577)) b!286494))

(assert (= (and b!286494 res!148578) b!286495))

(assert (=> d!66037 m!301301))

(declare-fun m!301325 () Bool)

(assert (=> b!286495 m!301325))

(assert (=> b!286392 d!66037))

(check-sat (not b!286442) (not bm!25578) (not d!66017) (not b!286495) (not b!286473) (not b!286470))
(check-sat)
