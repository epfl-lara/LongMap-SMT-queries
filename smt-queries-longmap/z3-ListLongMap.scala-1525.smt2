; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28682 () Bool)

(assert start!28682)

(declare-fun b!293163 () Bool)

(declare-fun res!154223 () Bool)

(declare-fun e!185385 () Bool)

(assert (=> b!293163 (=> (not res!154223) (not e!185385))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293163 (= res!154223 (validKeyInArray!0 k0!2524))))

(declare-fun b!293164 () Bool)

(declare-fun e!185386 () Bool)

(declare-fun lt!145315 () Bool)

(declare-datatypes ((SeekEntryResult!2202 0))(
  ( (MissingZero!2202 (index!10978 (_ BitVec 32))) (Found!2202 (index!10979 (_ BitVec 32))) (Intermediate!2202 (undefined!3014 Bool) (index!10980 (_ BitVec 32)) (x!29153 (_ BitVec 32))) (Undefined!2202) (MissingVacant!2202 (index!10981 (_ BitVec 32))) )
))
(declare-fun lt!145311 () SeekEntryResult!2202)

(get-info :version)

(assert (=> b!293164 (= e!185386 (and lt!145315 ((_ is Intermediate!2202) lt!145311) (undefined!3014 lt!145311)))))

(declare-fun lt!145312 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145313 () SeekEntryResult!2202)

(declare-datatypes ((array!14861 0))(
  ( (array!14862 (arr!7053 (Array (_ BitVec 32) (_ BitVec 64))) (size!7405 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14861)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14861 (_ BitVec 32)) SeekEntryResult!2202)

(assert (=> b!293164 (= lt!145313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145312 k0!2524 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312)) mask!3809))))

(assert (=> b!293164 (= lt!145311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145312 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293164 (= lt!145312 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!293165 () Bool)

(assert (=> b!293165 (= e!185385 e!185386)))

(declare-fun res!154221 () Bool)

(assert (=> b!293165 (=> (not res!154221) (not e!185386))))

(declare-fun lt!145314 () SeekEntryResult!2202)

(assert (=> b!293165 (= res!154221 (or lt!145315 (= lt!145314 (MissingVacant!2202 i!1256))))))

(assert (=> b!293165 (= lt!145315 (= lt!145314 (MissingZero!2202 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14861 (_ BitVec 32)) SeekEntryResult!2202)

(assert (=> b!293165 (= lt!145314 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293166 () Bool)

(declare-fun res!154220 () Bool)

(assert (=> b!293166 (=> (not res!154220) (not e!185385))))

(assert (=> b!293166 (= res!154220 (and (= (size!7405 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7405 a!3312))))))

(declare-fun res!154224 () Bool)

(assert (=> start!28682 (=> (not res!154224) (not e!185385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28682 (= res!154224 (validMask!0 mask!3809))))

(assert (=> start!28682 e!185385))

(assert (=> start!28682 true))

(declare-fun array_inv!5016 (array!14861) Bool)

(assert (=> start!28682 (array_inv!5016 a!3312)))

(declare-fun b!293167 () Bool)

(declare-fun res!154222 () Bool)

(assert (=> b!293167 (=> (not res!154222) (not e!185386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14861 (_ BitVec 32)) Bool)

(assert (=> b!293167 (= res!154222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293168 () Bool)

(declare-fun res!154219 () Bool)

(assert (=> b!293168 (=> (not res!154219) (not e!185385))))

(declare-fun arrayContainsKey!0 (array!14861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293168 (= res!154219 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28682 res!154224) b!293166))

(assert (= (and b!293166 res!154220) b!293163))

(assert (= (and b!293163 res!154223) b!293168))

(assert (= (and b!293168 res!154219) b!293165))

(assert (= (and b!293165 res!154221) b!293167))

(assert (= (and b!293167 res!154222) b!293164))

(declare-fun m!306965 () Bool)

(assert (=> b!293164 m!306965))

(declare-fun m!306967 () Bool)

(assert (=> b!293164 m!306967))

(declare-fun m!306969 () Bool)

(assert (=> b!293164 m!306969))

(declare-fun m!306971 () Bool)

(assert (=> b!293164 m!306971))

(declare-fun m!306973 () Bool)

(assert (=> b!293168 m!306973))

(declare-fun m!306975 () Bool)

(assert (=> b!293167 m!306975))

(declare-fun m!306977 () Bool)

(assert (=> start!28682 m!306977))

(declare-fun m!306979 () Bool)

(assert (=> start!28682 m!306979))

(declare-fun m!306981 () Bool)

(assert (=> b!293163 m!306981))

(declare-fun m!306983 () Bool)

(assert (=> b!293165 m!306983))

(check-sat (not b!293164) (not start!28682) (not b!293165) (not b!293167) (not b!293163) (not b!293168))
(check-sat)
(get-model)

(declare-fun b!293195 () Bool)

(declare-fun e!185404 () Bool)

(declare-fun call!25663 () Bool)

(assert (=> b!293195 (= e!185404 call!25663)))

(declare-fun b!293196 () Bool)

(declare-fun e!185405 () Bool)

(declare-fun e!185403 () Bool)

(assert (=> b!293196 (= e!185405 e!185403)))

(declare-fun c!47040 () Bool)

(assert (=> b!293196 (= c!47040 (validKeyInArray!0 (select (arr!7053 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66511 () Bool)

(declare-fun res!154248 () Bool)

(assert (=> d!66511 (=> res!154248 e!185405)))

(assert (=> d!66511 (= res!154248 (bvsge #b00000000000000000000000000000000 (size!7405 a!3312)))))

(assert (=> d!66511 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185405)))

(declare-fun b!293197 () Bool)

(assert (=> b!293197 (= e!185403 call!25663)))

(declare-fun bm!25660 () Bool)

(assert (=> bm!25660 (= call!25663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293198 () Bool)

(assert (=> b!293198 (= e!185403 e!185404)))

(declare-fun lt!145339 () (_ BitVec 64))

(assert (=> b!293198 (= lt!145339 (select (arr!7053 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9180 0))(
  ( (Unit!9181) )
))
(declare-fun lt!145337 () Unit!9180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14861 (_ BitVec 64) (_ BitVec 32)) Unit!9180)

(assert (=> b!293198 (= lt!145337 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145339 #b00000000000000000000000000000000))))

(assert (=> b!293198 (arrayContainsKey!0 a!3312 lt!145339 #b00000000000000000000000000000000)))

(declare-fun lt!145338 () Unit!9180)

(assert (=> b!293198 (= lt!145338 lt!145337)))

(declare-fun res!154247 () Bool)

(assert (=> b!293198 (= res!154247 (= (seekEntryOrOpen!0 (select (arr!7053 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2202 #b00000000000000000000000000000000)))))

(assert (=> b!293198 (=> (not res!154247) (not e!185404))))

(assert (= (and d!66511 (not res!154248)) b!293196))

(assert (= (and b!293196 c!47040) b!293198))

(assert (= (and b!293196 (not c!47040)) b!293197))

(assert (= (and b!293198 res!154247) b!293195))

(assert (= (or b!293195 b!293197) bm!25660))

(declare-fun m!307005 () Bool)

(assert (=> b!293196 m!307005))

(assert (=> b!293196 m!307005))

(declare-fun m!307007 () Bool)

(assert (=> b!293196 m!307007))

(declare-fun m!307009 () Bool)

(assert (=> bm!25660 m!307009))

(assert (=> b!293198 m!307005))

(declare-fun m!307011 () Bool)

(assert (=> b!293198 m!307011))

(declare-fun m!307013 () Bool)

(assert (=> b!293198 m!307013))

(assert (=> b!293198 m!307005))

(declare-fun m!307015 () Bool)

(assert (=> b!293198 m!307015))

(assert (=> b!293167 d!66511))

(declare-fun d!66515 () Bool)

(declare-fun res!154253 () Bool)

(declare-fun e!185410 () Bool)

(assert (=> d!66515 (=> res!154253 e!185410)))

(assert (=> d!66515 (= res!154253 (= (select (arr!7053 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66515 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185410)))

(declare-fun b!293203 () Bool)

(declare-fun e!185411 () Bool)

(assert (=> b!293203 (= e!185410 e!185411)))

(declare-fun res!154254 () Bool)

(assert (=> b!293203 (=> (not res!154254) (not e!185411))))

(assert (=> b!293203 (= res!154254 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7405 a!3312)))))

(declare-fun b!293204 () Bool)

(assert (=> b!293204 (= e!185411 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66515 (not res!154253)) b!293203))

(assert (= (and b!293203 res!154254) b!293204))

(assert (=> d!66515 m!307005))

(declare-fun m!307017 () Bool)

(assert (=> b!293204 m!307017))

(assert (=> b!293168 d!66515))

(declare-fun d!66519 () Bool)

(assert (=> d!66519 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28682 d!66519))

(declare-fun d!66525 () Bool)

(assert (=> d!66525 (= (array_inv!5016 a!3312) (bvsge (size!7405 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28682 d!66525))

(declare-fun b!293295 () Bool)

(declare-fun e!185465 () SeekEntryResult!2202)

(declare-fun e!185464 () SeekEntryResult!2202)

(assert (=> b!293295 (= e!185465 e!185464)))

(declare-fun lt!145374 () (_ BitVec 64))

(declare-fun lt!145372 () SeekEntryResult!2202)

(assert (=> b!293295 (= lt!145374 (select (arr!7053 a!3312) (index!10980 lt!145372)))))

(declare-fun c!47073 () Bool)

(assert (=> b!293295 (= c!47073 (= lt!145374 k0!2524))))

(declare-fun d!66527 () Bool)

(declare-fun lt!145373 () SeekEntryResult!2202)

(assert (=> d!66527 (and (or ((_ is Undefined!2202) lt!145373) (not ((_ is Found!2202) lt!145373)) (and (bvsge (index!10979 lt!145373) #b00000000000000000000000000000000) (bvslt (index!10979 lt!145373) (size!7405 a!3312)))) (or ((_ is Undefined!2202) lt!145373) ((_ is Found!2202) lt!145373) (not ((_ is MissingZero!2202) lt!145373)) (and (bvsge (index!10978 lt!145373) #b00000000000000000000000000000000) (bvslt (index!10978 lt!145373) (size!7405 a!3312)))) (or ((_ is Undefined!2202) lt!145373) ((_ is Found!2202) lt!145373) ((_ is MissingZero!2202) lt!145373) (not ((_ is MissingVacant!2202) lt!145373)) (and (bvsge (index!10981 lt!145373) #b00000000000000000000000000000000) (bvslt (index!10981 lt!145373) (size!7405 a!3312)))) (or ((_ is Undefined!2202) lt!145373) (ite ((_ is Found!2202) lt!145373) (= (select (arr!7053 a!3312) (index!10979 lt!145373)) k0!2524) (ite ((_ is MissingZero!2202) lt!145373) (= (select (arr!7053 a!3312) (index!10978 lt!145373)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2202) lt!145373) (= (select (arr!7053 a!3312) (index!10981 lt!145373)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66527 (= lt!145373 e!185465)))

(declare-fun c!47071 () Bool)

(assert (=> d!66527 (= c!47071 (and ((_ is Intermediate!2202) lt!145372) (undefined!3014 lt!145372)))))

(assert (=> d!66527 (= lt!145372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66527 (validMask!0 mask!3809)))

(assert (=> d!66527 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145373)))

(declare-fun b!293296 () Bool)

(declare-fun e!185466 () SeekEntryResult!2202)

(assert (=> b!293296 (= e!185466 (MissingZero!2202 (index!10980 lt!145372)))))

(declare-fun b!293297 () Bool)

(assert (=> b!293297 (= e!185465 Undefined!2202)))

(declare-fun b!293298 () Bool)

(assert (=> b!293298 (= e!185464 (Found!2202 (index!10980 lt!145372)))))

(declare-fun b!293299 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14861 (_ BitVec 32)) SeekEntryResult!2202)

(assert (=> b!293299 (= e!185466 (seekKeyOrZeroReturnVacant!0 (x!29153 lt!145372) (index!10980 lt!145372) (index!10980 lt!145372) k0!2524 a!3312 mask!3809))))

(declare-fun b!293300 () Bool)

(declare-fun c!47072 () Bool)

(assert (=> b!293300 (= c!47072 (= lt!145374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293300 (= e!185464 e!185466)))

(assert (= (and d!66527 c!47071) b!293297))

(assert (= (and d!66527 (not c!47071)) b!293295))

(assert (= (and b!293295 c!47073) b!293298))

(assert (= (and b!293295 (not c!47073)) b!293300))

(assert (= (and b!293300 c!47072) b!293296))

(assert (= (and b!293300 (not c!47072)) b!293299))

(declare-fun m!307051 () Bool)

(assert (=> b!293295 m!307051))

(assert (=> d!66527 m!306977))

(assert (=> d!66527 m!306971))

(declare-fun m!307053 () Bool)

(assert (=> d!66527 m!307053))

(declare-fun m!307055 () Bool)

(assert (=> d!66527 m!307055))

(assert (=> d!66527 m!306971))

(declare-fun m!307057 () Bool)

(assert (=> d!66527 m!307057))

(declare-fun m!307059 () Bool)

(assert (=> d!66527 m!307059))

(declare-fun m!307061 () Bool)

(assert (=> b!293299 m!307061))

(assert (=> b!293165 d!66527))

(declare-fun d!66541 () Bool)

(assert (=> d!66541 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293163 d!66541))

(declare-fun b!293355 () Bool)

(declare-fun lt!145400 () SeekEntryResult!2202)

(assert (=> b!293355 (and (bvsge (index!10980 lt!145400) #b00000000000000000000000000000000) (bvslt (index!10980 lt!145400) (size!7405 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312)))))))

(declare-fun res!154306 () Bool)

(assert (=> b!293355 (= res!154306 (= (select (arr!7053 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312))) (index!10980 lt!145400)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185502 () Bool)

(assert (=> b!293355 (=> res!154306 e!185502)))

(declare-fun b!293356 () Bool)

(assert (=> b!293356 (and (bvsge (index!10980 lt!145400) #b00000000000000000000000000000000) (bvslt (index!10980 lt!145400) (size!7405 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312)))))))

(declare-fun res!154307 () Bool)

(assert (=> b!293356 (= res!154307 (= (select (arr!7053 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312))) (index!10980 lt!145400)) k0!2524))))

(assert (=> b!293356 (=> res!154307 e!185502)))

(declare-fun e!185503 () Bool)

(assert (=> b!293356 (= e!185503 e!185502)))

(declare-fun b!293357 () Bool)

(declare-fun e!185501 () Bool)

(assert (=> b!293357 (= e!185501 (bvsge (x!29153 lt!145400) #b01111111111111111111111111111110))))

(declare-fun b!293358 () Bool)

(declare-fun e!185505 () SeekEntryResult!2202)

(assert (=> b!293358 (= e!185505 (Intermediate!2202 true lt!145312 #b00000000000000000000000000000000))))

(declare-fun b!293359 () Bool)

(assert (=> b!293359 (and (bvsge (index!10980 lt!145400) #b00000000000000000000000000000000) (bvslt (index!10980 lt!145400) (size!7405 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312)))))))

(assert (=> b!293359 (= e!185502 (= (select (arr!7053 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312))) (index!10980 lt!145400)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66543 () Bool)

(assert (=> d!66543 e!185501))

(declare-fun c!47093 () Bool)

(assert (=> d!66543 (= c!47093 (and ((_ is Intermediate!2202) lt!145400) (undefined!3014 lt!145400)))))

(assert (=> d!66543 (= lt!145400 e!185505)))

(declare-fun c!47092 () Bool)

(assert (=> d!66543 (= c!47092 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145399 () (_ BitVec 64))

(assert (=> d!66543 (= lt!145399 (select (arr!7053 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312))) lt!145312))))

(assert (=> d!66543 (validMask!0 mask!3809)))

(assert (=> d!66543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145312 k0!2524 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312)) mask!3809) lt!145400)))

(declare-fun b!293360 () Bool)

(declare-fun e!185504 () SeekEntryResult!2202)

(assert (=> b!293360 (= e!185505 e!185504)))

(declare-fun c!47094 () Bool)

(assert (=> b!293360 (= c!47094 (or (= lt!145399 k0!2524) (= (bvadd lt!145399 lt!145399) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293361 () Bool)

(assert (=> b!293361 (= e!185501 e!185503)))

(declare-fun res!154305 () Bool)

(assert (=> b!293361 (= res!154305 (and ((_ is Intermediate!2202) lt!145400) (not (undefined!3014 lt!145400)) (bvslt (x!29153 lt!145400) #b01111111111111111111111111111110) (bvsge (x!29153 lt!145400) #b00000000000000000000000000000000) (bvsge (x!29153 lt!145400) #b00000000000000000000000000000000)))))

(assert (=> b!293361 (=> (not res!154305) (not e!185503))))

(declare-fun b!293362 () Bool)

(assert (=> b!293362 (= e!185504 (Intermediate!2202 false lt!145312 #b00000000000000000000000000000000))))

(declare-fun b!293363 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293363 (= e!185504 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145312 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14862 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7405 a!3312)) mask!3809))))

(assert (= (and d!66543 c!47092) b!293358))

(assert (= (and d!66543 (not c!47092)) b!293360))

(assert (= (and b!293360 c!47094) b!293362))

(assert (= (and b!293360 (not c!47094)) b!293363))

(assert (= (and d!66543 c!47093) b!293357))

(assert (= (and d!66543 (not c!47093)) b!293361))

(assert (= (and b!293361 res!154305) b!293356))

(assert (= (and b!293356 (not res!154307)) b!293355))

(assert (= (and b!293355 (not res!154306)) b!293359))

(declare-fun m!307089 () Bool)

(assert (=> d!66543 m!307089))

(assert (=> d!66543 m!306977))

(declare-fun m!307091 () Bool)

(assert (=> b!293356 m!307091))

(declare-fun m!307093 () Bool)

(assert (=> b!293363 m!307093))

(assert (=> b!293363 m!307093))

(declare-fun m!307095 () Bool)

(assert (=> b!293363 m!307095))

(assert (=> b!293359 m!307091))

(assert (=> b!293355 m!307091))

(assert (=> b!293164 d!66543))

(declare-fun b!293364 () Bool)

(declare-fun lt!145402 () SeekEntryResult!2202)

(assert (=> b!293364 (and (bvsge (index!10980 lt!145402) #b00000000000000000000000000000000) (bvslt (index!10980 lt!145402) (size!7405 a!3312)))))

(declare-fun res!154309 () Bool)

(assert (=> b!293364 (= res!154309 (= (select (arr!7053 a!3312) (index!10980 lt!145402)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185507 () Bool)

(assert (=> b!293364 (=> res!154309 e!185507)))

(declare-fun b!293365 () Bool)

(assert (=> b!293365 (and (bvsge (index!10980 lt!145402) #b00000000000000000000000000000000) (bvslt (index!10980 lt!145402) (size!7405 a!3312)))))

(declare-fun res!154310 () Bool)

(assert (=> b!293365 (= res!154310 (= (select (arr!7053 a!3312) (index!10980 lt!145402)) k0!2524))))

(assert (=> b!293365 (=> res!154310 e!185507)))

(declare-fun e!185508 () Bool)

(assert (=> b!293365 (= e!185508 e!185507)))

(declare-fun b!293366 () Bool)

(declare-fun e!185506 () Bool)

(assert (=> b!293366 (= e!185506 (bvsge (x!29153 lt!145402) #b01111111111111111111111111111110))))

(declare-fun b!293367 () Bool)

(declare-fun e!185510 () SeekEntryResult!2202)

(assert (=> b!293367 (= e!185510 (Intermediate!2202 true lt!145312 #b00000000000000000000000000000000))))

(declare-fun b!293368 () Bool)

(assert (=> b!293368 (and (bvsge (index!10980 lt!145402) #b00000000000000000000000000000000) (bvslt (index!10980 lt!145402) (size!7405 a!3312)))))

(assert (=> b!293368 (= e!185507 (= (select (arr!7053 a!3312) (index!10980 lt!145402)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66555 () Bool)

(assert (=> d!66555 e!185506))

(declare-fun c!47096 () Bool)

(assert (=> d!66555 (= c!47096 (and ((_ is Intermediate!2202) lt!145402) (undefined!3014 lt!145402)))))

(assert (=> d!66555 (= lt!145402 e!185510)))

(declare-fun c!47095 () Bool)

(assert (=> d!66555 (= c!47095 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145401 () (_ BitVec 64))

(assert (=> d!66555 (= lt!145401 (select (arr!7053 a!3312) lt!145312))))

(assert (=> d!66555 (validMask!0 mask!3809)))

(assert (=> d!66555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145312 k0!2524 a!3312 mask!3809) lt!145402)))

(declare-fun b!293369 () Bool)

(declare-fun e!185509 () SeekEntryResult!2202)

(assert (=> b!293369 (= e!185510 e!185509)))

(declare-fun c!47097 () Bool)

(assert (=> b!293369 (= c!47097 (or (= lt!145401 k0!2524) (= (bvadd lt!145401 lt!145401) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293370 () Bool)

(assert (=> b!293370 (= e!185506 e!185508)))

(declare-fun res!154308 () Bool)

(assert (=> b!293370 (= res!154308 (and ((_ is Intermediate!2202) lt!145402) (not (undefined!3014 lt!145402)) (bvslt (x!29153 lt!145402) #b01111111111111111111111111111110) (bvsge (x!29153 lt!145402) #b00000000000000000000000000000000) (bvsge (x!29153 lt!145402) #b00000000000000000000000000000000)))))

(assert (=> b!293370 (=> (not res!154308) (not e!185508))))

(declare-fun b!293371 () Bool)

(assert (=> b!293371 (= e!185509 (Intermediate!2202 false lt!145312 #b00000000000000000000000000000000))))

(declare-fun b!293372 () Bool)

(assert (=> b!293372 (= e!185509 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145312 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66555 c!47095) b!293367))

(assert (= (and d!66555 (not c!47095)) b!293369))

(assert (= (and b!293369 c!47097) b!293371))

(assert (= (and b!293369 (not c!47097)) b!293372))

(assert (= (and d!66555 c!47096) b!293366))

(assert (= (and d!66555 (not c!47096)) b!293370))

(assert (= (and b!293370 res!154308) b!293365))

(assert (= (and b!293365 (not res!154310)) b!293364))

(assert (= (and b!293364 (not res!154309)) b!293368))

(declare-fun m!307097 () Bool)

(assert (=> d!66555 m!307097))

(assert (=> d!66555 m!306977))

(declare-fun m!307099 () Bool)

(assert (=> b!293365 m!307099))

(assert (=> b!293372 m!307093))

(assert (=> b!293372 m!307093))

(declare-fun m!307101 () Bool)

(assert (=> b!293372 m!307101))

(assert (=> b!293368 m!307099))

(assert (=> b!293364 m!307099))

(assert (=> b!293164 d!66555))

(declare-fun d!66557 () Bool)

(declare-fun lt!145408 () (_ BitVec 32))

(declare-fun lt!145407 () (_ BitVec 32))

(assert (=> d!66557 (= lt!145408 (bvmul (bvxor lt!145407 (bvlshr lt!145407 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66557 (= lt!145407 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66557 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154311 (let ((h!5270 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29160 (bvmul (bvxor h!5270 (bvlshr h!5270 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29160 (bvlshr x!29160 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154311 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154311 #b00000000000000000000000000000000))))))

(assert (=> d!66557 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145408 (bvlshr lt!145408 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293164 d!66557))

(check-sat (not b!293299) (not b!293204) (not d!66555) (not d!66527) (not d!66543) (not b!293196) (not bm!25660) (not b!293372) (not b!293363) (not b!293198))
(check-sat)
