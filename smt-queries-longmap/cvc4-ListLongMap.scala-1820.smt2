; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32732 () Bool)

(assert start!32732)

(declare-fun b!327273 () Bool)

(declare-fun res!180310 () Bool)

(declare-fun e!201278 () Bool)

(assert (=> b!327273 (=> (not res!180310) (not e!201278))))

(declare-datatypes ((array!16769 0))(
  ( (array!16770 (arr!7939 (Array (_ BitVec 32) (_ BitVec 64))) (size!8291 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16769)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16769 (_ BitVec 32)) Bool)

(assert (=> b!327273 (= res!180310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327274 () Bool)

(declare-fun res!180312 () Bool)

(declare-fun e!201280 () Bool)

(assert (=> b!327274 (=> (not res!180312) (not e!201280))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!327274 (= res!180312 (and (= (select (arr!7939 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8291 a!3305))))))

(declare-fun b!327275 () Bool)

(declare-fun res!180307 () Bool)

(assert (=> b!327275 (=> (not res!180307) (not e!201278))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3070 0))(
  ( (MissingZero!3070 (index!14456 (_ BitVec 32))) (Found!3070 (index!14457 (_ BitVec 32))) (Intermediate!3070 (undefined!3882 Bool) (index!14458 (_ BitVec 32)) (x!32692 (_ BitVec 32))) (Undefined!3070) (MissingVacant!3070 (index!14459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16769 (_ BitVec 32)) SeekEntryResult!3070)

(assert (=> b!327275 (= res!180307 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3070 i!1250)))))

(declare-fun b!327276 () Bool)

(declare-fun res!180308 () Bool)

(assert (=> b!327276 (=> (not res!180308) (not e!201278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327276 (= res!180308 (validKeyInArray!0 k!2497))))

(declare-fun b!327277 () Bool)

(assert (=> b!327277 (= e!201280 (bvsge resX!58 #b01111111111111111111111111111110))))

(declare-fun b!327278 () Bool)

(declare-fun res!180311 () Bool)

(assert (=> b!327278 (=> (not res!180311) (not e!201278))))

(assert (=> b!327278 (= res!180311 (and (= (size!8291 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8291 a!3305))))))

(declare-fun b!327279 () Bool)

(assert (=> b!327279 (= e!201278 e!201280)))

(declare-fun res!180309 () Bool)

(assert (=> b!327279 (=> (not res!180309) (not e!201280))))

(declare-fun lt!157485 () SeekEntryResult!3070)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16769 (_ BitVec 32)) SeekEntryResult!3070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327279 (= res!180309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157485))))

(assert (=> b!327279 (= lt!157485 (Intermediate!3070 false resIndex!58 resX!58))))

(declare-fun b!327280 () Bool)

(declare-fun res!180304 () Bool)

(assert (=> b!327280 (=> (not res!180304) (not e!201278))))

(declare-fun arrayContainsKey!0 (array!16769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327280 (= res!180304 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!180305 () Bool)

(assert (=> start!32732 (=> (not res!180305) (not e!201278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32732 (= res!180305 (validMask!0 mask!3777))))

(assert (=> start!32732 e!201278))

(declare-fun array_inv!5902 (array!16769) Bool)

(assert (=> start!32732 (array_inv!5902 a!3305)))

(assert (=> start!32732 true))

(declare-fun b!327281 () Bool)

(declare-fun res!180306 () Bool)

(assert (=> b!327281 (=> (not res!180306) (not e!201280))))

(assert (=> b!327281 (= res!180306 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157485))))

(assert (= (and start!32732 res!180305) b!327278))

(assert (= (and b!327278 res!180311) b!327276))

(assert (= (and b!327276 res!180308) b!327280))

(assert (= (and b!327280 res!180304) b!327275))

(assert (= (and b!327275 res!180307) b!327273))

(assert (= (and b!327273 res!180310) b!327279))

(assert (= (and b!327279 res!180309) b!327274))

(assert (= (and b!327274 res!180312) b!327281))

(assert (= (and b!327281 res!180306) b!327277))

(declare-fun m!333705 () Bool)

(assert (=> b!327279 m!333705))

(assert (=> b!327279 m!333705))

(declare-fun m!333707 () Bool)

(assert (=> b!327279 m!333707))

(declare-fun m!333709 () Bool)

(assert (=> b!327275 m!333709))

(declare-fun m!333711 () Bool)

(assert (=> b!327274 m!333711))

(declare-fun m!333713 () Bool)

(assert (=> b!327273 m!333713))

(declare-fun m!333715 () Bool)

(assert (=> b!327276 m!333715))

(declare-fun m!333717 () Bool)

(assert (=> start!32732 m!333717))

(declare-fun m!333719 () Bool)

(assert (=> start!32732 m!333719))

(declare-fun m!333721 () Bool)

(assert (=> b!327280 m!333721))

(declare-fun m!333723 () Bool)

(assert (=> b!327281 m!333723))

(push 1)

(assert (not b!327273))

(assert (not b!327275))

(assert (not b!327281))

(assert (not start!32732))

(assert (not b!327280))

(assert (not b!327276))

(assert (not b!327279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!327296 () Bool)

(declare-fun e!201293 () Bool)

(declare-fun e!201295 () Bool)

(assert (=> b!327296 (= e!201293 e!201295)))

(declare-fun lt!157493 () (_ BitVec 64))

(assert (=> b!327296 (= lt!157493 (select (arr!7939 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10170 0))(
  ( (Unit!10171) )
))
(declare-fun lt!157494 () Unit!10170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16769 (_ BitVec 64) (_ BitVec 32)) Unit!10170)

(assert (=> b!327296 (= lt!157494 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157493 #b00000000000000000000000000000000))))

(assert (=> b!327296 (arrayContainsKey!0 a!3305 lt!157493 #b00000000000000000000000000000000)))

(declare-fun lt!157492 () Unit!10170)

(assert (=> b!327296 (= lt!157492 lt!157494)))

(declare-fun res!180324 () Bool)

(assert (=> b!327296 (= res!180324 (= (seekEntryOrOpen!0 (select (arr!7939 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3070 #b00000000000000000000000000000000)))))

(assert (=> b!327296 (=> (not res!180324) (not e!201295))))

(declare-fun b!327297 () Bool)

(declare-fun call!26092 () Bool)

(assert (=> b!327297 (= e!201295 call!26092)))

(declare-fun bm!26089 () Bool)

(assert (=> bm!26089 (= call!26092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327298 () Bool)

(declare-fun e!201294 () Bool)

(assert (=> b!327298 (= e!201294 e!201293)))

(declare-fun c!51117 () Bool)

(assert (=> b!327298 (= c!51117 (validKeyInArray!0 (select (arr!7939 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!327299 () Bool)

(assert (=> b!327299 (= e!201293 call!26092)))

(declare-fun d!69805 () Bool)

(declare-fun res!180323 () Bool)

(assert (=> d!69805 (=> res!180323 e!201294)))

(assert (=> d!69805 (= res!180323 (bvsge #b00000000000000000000000000000000 (size!8291 a!3305)))))

(assert (=> d!69805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201294)))

(assert (= (and d!69805 (not res!180323)) b!327298))

(assert (= (and b!327298 c!51117) b!327296))

(assert (= (and b!327298 (not c!51117)) b!327299))

(assert (= (and b!327296 res!180324) b!327297))

(assert (= (or b!327297 b!327299) bm!26089))

(declare-fun m!333729 () Bool)

(assert (=> b!327296 m!333729))

(declare-fun m!333731 () Bool)

(assert (=> b!327296 m!333731))

(declare-fun m!333733 () Bool)

(assert (=> b!327296 m!333733))

(assert (=> b!327296 m!333729))

(declare-fun m!333735 () Bool)

(assert (=> b!327296 m!333735))

(declare-fun m!333737 () Bool)

(assert (=> bm!26089 m!333737))

(assert (=> b!327298 m!333729))

(assert (=> b!327298 m!333729))

(declare-fun m!333739 () Bool)

(assert (=> b!327298 m!333739))

(assert (=> b!327273 d!69805))

(declare-fun b!327375 () Bool)

(declare-fun lt!157523 () SeekEntryResult!3070)

(assert (=> b!327375 (and (bvsge (index!14458 lt!157523) #b00000000000000000000000000000000) (bvslt (index!14458 lt!157523) (size!8291 a!3305)))))

(declare-fun res!180348 () Bool)

(assert (=> b!327375 (= res!180348 (= (select (arr!7939 a!3305) (index!14458 lt!157523)) k!2497))))

(declare-fun e!201340 () Bool)

(assert (=> b!327375 (=> res!180348 e!201340)))

(declare-fun e!201342 () Bool)

(assert (=> b!327375 (= e!201342 e!201340)))

(declare-fun d!69809 () Bool)

(declare-fun e!201341 () Bool)

(assert (=> d!69809 e!201341))

(declare-fun c!51145 () Bool)

(assert (=> d!69809 (= c!51145 (and (is-Intermediate!3070 lt!157523) (undefined!3882 lt!157523)))))

(declare-fun e!201343 () SeekEntryResult!3070)

(assert (=> d!69809 (= lt!157523 e!201343)))

(declare-fun c!51146 () Bool)

(assert (=> d!69809 (= c!51146 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157524 () (_ BitVec 64))

(assert (=> d!69809 (= lt!157524 (select (arr!7939 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69809 (validMask!0 mask!3777)))

(assert (=> d!69809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157523)))

(declare-fun b!327376 () Bool)

(declare-fun e!201339 () SeekEntryResult!3070)

(assert (=> b!327376 (= e!201343 e!201339)))

(declare-fun c!51147 () Bool)

(assert (=> b!327376 (= c!51147 (or (= lt!157524 k!2497) (= (bvadd lt!157524 lt!157524) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327377 () Bool)

(assert (=> b!327377 (= e!201343 (Intermediate!3070 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327378 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327378 (= e!201339 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327379 () Bool)

(assert (=> b!327379 (= e!201341 (bvsge (x!32692 lt!157523) #b01111111111111111111111111111110))))

(declare-fun b!327380 () Bool)

(assert (=> b!327380 (and (bvsge (index!14458 lt!157523) #b00000000000000000000000000000000) (bvslt (index!14458 lt!157523) (size!8291 a!3305)))))

(assert (=> b!327380 (= e!201340 (= (select (arr!7939 a!3305) (index!14458 lt!157523)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327381 () Bool)

(assert (=> b!327381 (= e!201339 (Intermediate!3070 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327382 () Bool)

(assert (=> b!327382 (and (bvsge (index!14458 lt!157523) #b00000000000000000000000000000000) (bvslt (index!14458 lt!157523) (size!8291 a!3305)))))

(declare-fun res!180347 () Bool)

(assert (=> b!327382 (= res!180347 (= (select (arr!7939 a!3305) (index!14458 lt!157523)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327382 (=> res!180347 e!201340)))

(declare-fun b!327383 () Bool)

(assert (=> b!327383 (= e!201341 e!201342)))

(declare-fun res!180346 () Bool)

(assert (=> b!327383 (= res!180346 (and (is-Intermediate!3070 lt!157523) (not (undefined!3882 lt!157523)) (bvslt (x!32692 lt!157523) #b01111111111111111111111111111110) (bvsge (x!32692 lt!157523) #b00000000000000000000000000000000) (bvsge (x!32692 lt!157523) #b00000000000000000000000000000000)))))

(assert (=> b!327383 (=> (not res!180346) (not e!201342))))

(assert (= (and d!69809 c!51146) b!327377))

(assert (= (and d!69809 (not c!51146)) b!327376))

(assert (= (and b!327376 c!51147) b!327381))

(assert (= (and b!327376 (not c!51147)) b!327378))

(assert (= (and d!69809 c!51145) b!327379))

(assert (= (and d!69809 (not c!51145)) b!327383))

(assert (= (and b!327383 res!180346) b!327375))

(assert (= (and b!327375 (not res!180348)) b!327382))

(assert (= (and b!327382 (not res!180347)) b!327380))

(declare-fun m!333771 () Bool)

(assert (=> b!327382 m!333771))

(assert (=> b!327375 m!333771))

(assert (=> b!327380 m!333771))

(assert (=> d!69809 m!333705))

(declare-fun m!333773 () Bool)

(assert (=> d!69809 m!333773))

(assert (=> d!69809 m!333717))

(assert (=> b!327378 m!333705))

(declare-fun m!333775 () Bool)

(assert (=> b!327378 m!333775))

(assert (=> b!327378 m!333775))

(declare-fun m!333777 () Bool)

(assert (=> b!327378 m!333777))

(assert (=> b!327279 d!69809))

(declare-fun d!69819 () Bool)

(declare-fun lt!157536 () (_ BitVec 32))

(declare-fun lt!157535 () (_ BitVec 32))

(assert (=> d!69819 (= lt!157536 (bvmul (bvxor lt!157535 (bvlshr lt!157535 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69819 (= lt!157535 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69819 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180349 (let ((h!5397 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32695 (bvmul (bvxor h!5397 (bvlshr h!5397 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32695 (bvlshr x!32695 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180349 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180349 #b00000000000000000000000000000000))))))

(assert (=> d!69819 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157536 (bvlshr lt!157536 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327279 d!69819))

(declare-fun d!69821 () Bool)

(assert (=> d!69821 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32732 d!69821))

(declare-fun d!69829 () Bool)

(assert (=> d!69829 (= (array_inv!5902 a!3305) (bvsge (size!8291 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32732 d!69829))

(declare-fun d!69831 () Bool)

(assert (=> d!69831 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327276 d!69831))

(declare-fun b!327406 () Bool)

(declare-fun lt!157540 () SeekEntryResult!3070)

(assert (=> b!327406 (and (bvsge (index!14458 lt!157540) #b00000000000000000000000000000000) (bvslt (index!14458 lt!157540) (size!8291 a!3305)))))

(declare-fun res!180354 () Bool)

(assert (=> b!327406 (= res!180354 (= (select (arr!7939 a!3305) (index!14458 lt!157540)) k!2497))))

(declare-fun e!201356 () Bool)

(assert (=> b!327406 (=> res!180354 e!201356)))

(declare-fun e!201358 () Bool)

(assert (=> b!327406 (= e!201358 e!201356)))

(declare-fun d!69833 () Bool)

(declare-fun e!201357 () Bool)

(assert (=> d!69833 e!201357))

(declare-fun c!51157 () Bool)

(assert (=> d!69833 (= c!51157 (and (is-Intermediate!3070 lt!157540) (undefined!3882 lt!157540)))))

(declare-fun e!201359 () SeekEntryResult!3070)

(assert (=> d!69833 (= lt!157540 e!201359)))

(declare-fun c!51158 () Bool)

(assert (=> d!69833 (= c!51158 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157541 () (_ BitVec 64))

(assert (=> d!69833 (= lt!157541 (select (arr!7939 a!3305) index!1840))))

(assert (=> d!69833 (validMask!0 mask!3777)))

(assert (=> d!69833 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157540)))

(declare-fun b!327407 () Bool)

(declare-fun e!201355 () SeekEntryResult!3070)

(assert (=> b!327407 (= e!201359 e!201355)))

(declare-fun c!51159 () Bool)

(assert (=> b!327407 (= c!51159 (or (= lt!157541 k!2497) (= (bvadd lt!157541 lt!157541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327408 () Bool)

(assert (=> b!327408 (= e!201359 (Intermediate!3070 true index!1840 x!1490))))

(declare-fun b!327409 () Bool)

(assert (=> b!327409 (= e!201355 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327410 () Bool)

(assert (=> b!327410 (= e!201357 (bvsge (x!32692 lt!157540) #b01111111111111111111111111111110))))

(declare-fun b!327411 () Bool)

(assert (=> b!327411 (and (bvsge (index!14458 lt!157540) #b00000000000000000000000000000000) (bvslt (index!14458 lt!157540) (size!8291 a!3305)))))

(assert (=> b!327411 (= e!201356 (= (select (arr!7939 a!3305) (index!14458 lt!157540)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327412 () Bool)

(assert (=> b!327412 (= e!201355 (Intermediate!3070 false index!1840 x!1490))))

(declare-fun b!327413 () Bool)

(assert (=> b!327413 (and (bvsge (index!14458 lt!157540) #b00000000000000000000000000000000) (bvslt (index!14458 lt!157540) (size!8291 a!3305)))))

(declare-fun res!180353 () Bool)

(assert (=> b!327413 (= res!180353 (= (select (arr!7939 a!3305) (index!14458 lt!157540)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327413 (=> res!180353 e!201356)))

(declare-fun b!327414 () Bool)

(assert (=> b!327414 (= e!201357 e!201358)))

(declare-fun res!180352 () Bool)

(assert (=> b!327414 (= res!180352 (and (is-Intermediate!3070 lt!157540) (not (undefined!3882 lt!157540)) (bvslt (x!32692 lt!157540) #b01111111111111111111111111111110) (bvsge (x!32692 lt!157540) #b00000000000000000000000000000000) (bvsge (x!32692 lt!157540) x!1490)))))

(assert (=> b!327414 (=> (not res!180352) (not e!201358))))

(assert (= (and d!69833 c!51158) b!327408))

(assert (= (and d!69833 (not c!51158)) b!327407))

(assert (= (and b!327407 c!51159) b!327412))

(assert (= (and b!327407 (not c!51159)) b!327409))

(assert (= (and d!69833 c!51157) b!327410))

(assert (= (and d!69833 (not c!51157)) b!327414))

(assert (= (and b!327414 res!180352) b!327406))

(assert (= (and b!327406 (not res!180354)) b!327413))

(assert (= (and b!327413 (not res!180353)) b!327411))

(declare-fun m!333789 () Bool)

(assert (=> b!327413 m!333789))

(assert (=> b!327406 m!333789))

(assert (=> b!327411 m!333789))

(declare-fun m!333791 () Bool)

(assert (=> d!69833 m!333791))

(assert (=> d!69833 m!333717))

(declare-fun m!333793 () Bool)

(assert (=> b!327409 m!333793))

(assert (=> b!327409 m!333793))

(declare-fun m!333795 () Bool)

(assert (=> b!327409 m!333795))

(assert (=> b!327281 d!69833))

(declare-fun d!69835 () Bool)

(declare-fun res!180363 () Bool)

(declare-fun e!201371 () Bool)

(assert (=> d!69835 (=> res!180363 e!201371)))

(assert (=> d!69835 (= res!180363 (= (select (arr!7939 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69835 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201371)))

(declare-fun b!327427 () Bool)

(declare-fun e!201372 () Bool)

(assert (=> b!327427 (= e!201371 e!201372)))

(declare-fun res!180364 () Bool)

(assert (=> b!327427 (=> (not res!180364) (not e!201372))))

(assert (=> b!327427 (= res!180364 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8291 a!3305)))))

(declare-fun b!327428 () Bool)

(assert (=> b!327428 (= e!201372 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69835 (not res!180363)) b!327427))

(assert (= (and b!327427 res!180364) b!327428))

(assert (=> d!69835 m!333729))

(declare-fun m!333797 () Bool)

(assert (=> b!327428 m!333797))

(assert (=> b!327280 d!69835))

(declare-fun b!327493 () Bool)

(declare-fun c!51185 () Bool)

(declare-fun lt!157581 () (_ BitVec 64))

(assert (=> b!327493 (= c!51185 (= lt!157581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201411 () SeekEntryResult!3070)

(declare-fun e!201412 () SeekEntryResult!3070)

(assert (=> b!327493 (= e!201411 e!201412)))

(declare-fun b!327494 () Bool)

(declare-fun e!201410 () SeekEntryResult!3070)

(assert (=> b!327494 (= e!201410 e!201411)))

(declare-fun lt!157579 () SeekEntryResult!3070)

(assert (=> b!327494 (= lt!157581 (select (arr!7939 a!3305) (index!14458 lt!157579)))))

(declare-fun c!51184 () Bool)

(assert (=> b!327494 (= c!51184 (= lt!157581 k!2497))))

(declare-fun b!327495 () Bool)

(assert (=> b!327495 (= e!201411 (Found!3070 (index!14458 lt!157579)))))

(declare-fun b!327496 () Bool)

(assert (=> b!327496 (= e!201412 (MissingZero!3070 (index!14458 lt!157579)))))

(declare-fun b!327497 () Bool)

(assert (=> b!327497 (= e!201410 Undefined!3070)))

(declare-fun b!327492 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16769 (_ BitVec 32)) SeekEntryResult!3070)

(assert (=> b!327492 (= e!201412 (seekKeyOrZeroReturnVacant!0 (x!32692 lt!157579) (index!14458 lt!157579) (index!14458 lt!157579) k!2497 a!3305 mask!3777))))

(declare-fun d!69837 () Bool)

(declare-fun lt!157580 () SeekEntryResult!3070)

(assert (=> d!69837 (and (or (is-Undefined!3070 lt!157580) (not (is-Found!3070 lt!157580)) (and (bvsge (index!14457 lt!157580) #b00000000000000000000000000000000) (bvslt (index!14457 lt!157580) (size!8291 a!3305)))) (or (is-Undefined!3070 lt!157580) (is-Found!3070 lt!157580) (not (is-MissingZero!3070 lt!157580)) (and (bvsge (index!14456 lt!157580) #b00000000000000000000000000000000) (bvslt (index!14456 lt!157580) (size!8291 a!3305)))) (or (is-Undefined!3070 lt!157580) (is-Found!3070 lt!157580) (is-MissingZero!3070 lt!157580) (not (is-MissingVacant!3070 lt!157580)) (and (bvsge (index!14459 lt!157580) #b00000000000000000000000000000000) (bvslt (index!14459 lt!157580) (size!8291 a!3305)))) (or (is-Undefined!3070 lt!157580) (ite (is-Found!3070 lt!157580) (= (select (arr!7939 a!3305) (index!14457 lt!157580)) k!2497) (ite (is-MissingZero!3070 lt!157580) (= (select (arr!7939 a!3305) (index!14456 lt!157580)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3070 lt!157580) (= (select (arr!7939 a!3305) (index!14459 lt!157580)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69837 (= lt!157580 e!201410)))

(declare-fun c!51186 () Bool)

(assert (=> d!69837 (= c!51186 (and (is-Intermediate!3070 lt!157579) (undefined!3882 lt!157579)))))

(assert (=> d!69837 (= lt!157579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69837 (validMask!0 mask!3777)))

(assert (=> d!69837 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157580)))

(assert (= (and d!69837 c!51186) b!327497))

(assert (= (and d!69837 (not c!51186)) b!327494))

(assert (= (and b!327494 c!51184) b!327495))

(assert (= (and b!327494 (not c!51184)) b!327493))

(assert (= (and b!327493 c!51185) b!327496))

(assert (= (and b!327493 (not c!51185)) b!327492))

(declare-fun m!333835 () Bool)

(assert (=> b!327494 m!333835))

(declare-fun m!333837 () Bool)

(assert (=> b!327492 m!333837))

(assert (=> d!69837 m!333705))

(declare-fun m!333839 () Bool)

(assert (=> d!69837 m!333839))

(assert (=> d!69837 m!333717))

(declare-fun m!333841 () Bool)

(assert (=> d!69837 m!333841))

(assert (=> d!69837 m!333705))

(assert (=> d!69837 m!333707))

(declare-fun m!333843 () Bool)

(assert (=> d!69837 m!333843))

(assert (=> b!327275 d!69837))

(push 1)

