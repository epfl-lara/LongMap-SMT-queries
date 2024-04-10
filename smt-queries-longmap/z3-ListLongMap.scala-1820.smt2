; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32730 () Bool)

(assert start!32730)

(declare-fun b!327246 () Bool)

(declare-fun res!180279 () Bool)

(declare-fun e!201270 () Bool)

(assert (=> b!327246 (=> (not res!180279) (not e!201270))))

(declare-datatypes ((array!16767 0))(
  ( (array!16768 (arr!7938 (Array (_ BitVec 32) (_ BitVec 64))) (size!8290 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16767)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327246 (= res!180279 (and (= (size!8290 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8290 a!3305))))))

(declare-fun b!327247 () Bool)

(declare-fun res!180281 () Bool)

(declare-fun e!201271 () Bool)

(assert (=> b!327247 (=> (not res!180281) (not e!201271))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327247 (= res!180281 (and (= (select (arr!7938 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8290 a!3305))))))

(declare-fun b!327248 () Bool)

(declare-fun res!180282 () Bool)

(assert (=> b!327248 (=> (not res!180282) (not e!201270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16767 (_ BitVec 32)) Bool)

(assert (=> b!327248 (= res!180282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327249 () Bool)

(declare-fun res!180280 () Bool)

(assert (=> b!327249 (=> (not res!180280) (not e!201270))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3069 0))(
  ( (MissingZero!3069 (index!14452 (_ BitVec 32))) (Found!3069 (index!14453 (_ BitVec 32))) (Intermediate!3069 (undefined!3881 Bool) (index!14454 (_ BitVec 32)) (x!32691 (_ BitVec 32))) (Undefined!3069) (MissingVacant!3069 (index!14455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16767 (_ BitVec 32)) SeekEntryResult!3069)

(assert (=> b!327249 (= res!180280 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3069 i!1250)))))

(declare-fun b!327250 () Bool)

(declare-fun res!180285 () Bool)

(assert (=> b!327250 (=> (not res!180285) (not e!201270))))

(declare-fun arrayContainsKey!0 (array!16767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327250 (= res!180285 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327251 () Bool)

(assert (=> b!327251 (= e!201270 e!201271)))

(declare-fun res!180277 () Bool)

(assert (=> b!327251 (=> (not res!180277) (not e!201271))))

(declare-fun lt!157482 () SeekEntryResult!3069)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16767 (_ BitVec 32)) SeekEntryResult!3069)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327251 (= res!180277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157482))))

(assert (=> b!327251 (= lt!157482 (Intermediate!3069 false resIndex!58 resX!58))))

(declare-fun b!327252 () Bool)

(declare-fun res!180283 () Bool)

(assert (=> b!327252 (=> (not res!180283) (not e!201270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327252 (= res!180283 (validKeyInArray!0 k0!2497))))

(declare-fun res!180278 () Bool)

(assert (=> start!32730 (=> (not res!180278) (not e!201270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32730 (= res!180278 (validMask!0 mask!3777))))

(assert (=> start!32730 e!201270))

(declare-fun array_inv!5901 (array!16767) Bool)

(assert (=> start!32730 (array_inv!5901 a!3305)))

(assert (=> start!32730 true))

(declare-fun b!327253 () Bool)

(assert (=> b!327253 (= e!201271 (bvsge resX!58 #b01111111111111111111111111111110))))

(declare-fun b!327254 () Bool)

(declare-fun res!180284 () Bool)

(assert (=> b!327254 (=> (not res!180284) (not e!201271))))

(assert (=> b!327254 (= res!180284 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157482))))

(assert (= (and start!32730 res!180278) b!327246))

(assert (= (and b!327246 res!180279) b!327252))

(assert (= (and b!327252 res!180283) b!327250))

(assert (= (and b!327250 res!180285) b!327249))

(assert (= (and b!327249 res!180280) b!327248))

(assert (= (and b!327248 res!180282) b!327251))

(assert (= (and b!327251 res!180277) b!327247))

(assert (= (and b!327247 res!180281) b!327254))

(assert (= (and b!327254 res!180284) b!327253))

(declare-fun m!333685 () Bool)

(assert (=> b!327248 m!333685))

(declare-fun m!333687 () Bool)

(assert (=> b!327254 m!333687))

(declare-fun m!333689 () Bool)

(assert (=> b!327247 m!333689))

(declare-fun m!333691 () Bool)

(assert (=> b!327249 m!333691))

(declare-fun m!333693 () Bool)

(assert (=> start!32730 m!333693))

(declare-fun m!333695 () Bool)

(assert (=> start!32730 m!333695))

(declare-fun m!333697 () Bool)

(assert (=> b!327251 m!333697))

(assert (=> b!327251 m!333697))

(declare-fun m!333699 () Bool)

(assert (=> b!327251 m!333699))

(declare-fun m!333701 () Bool)

(assert (=> b!327250 m!333701))

(declare-fun m!333703 () Bool)

(assert (=> b!327252 m!333703))

(check-sat (not b!327248) (not start!32730) (not b!327250) (not b!327252) (not b!327251) (not b!327249) (not b!327254))
(check-sat)
(get-model)

(declare-fun d!69801 () Bool)

(declare-fun res!180317 () Bool)

(declare-fun e!201285 () Bool)

(assert (=> d!69801 (=> res!180317 e!201285)))

(assert (=> d!69801 (= res!180317 (= (select (arr!7938 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69801 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201285)))

(declare-fun b!327286 () Bool)

(declare-fun e!201286 () Bool)

(assert (=> b!327286 (= e!201285 e!201286)))

(declare-fun res!180318 () Bool)

(assert (=> b!327286 (=> (not res!180318) (not e!201286))))

(assert (=> b!327286 (= res!180318 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8290 a!3305)))))

(declare-fun b!327287 () Bool)

(assert (=> b!327287 (= e!201286 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69801 (not res!180317)) b!327286))

(assert (= (and b!327286 res!180318) b!327287))

(declare-fun m!333725 () Bool)

(assert (=> d!69801 m!333725))

(declare-fun m!333727 () Bool)

(assert (=> b!327287 m!333727))

(assert (=> b!327250 d!69801))

(declare-fun b!327330 () Bool)

(declare-fun lt!157505 () SeekEntryResult!3069)

(assert (=> b!327330 (and (bvsge (index!14454 lt!157505) #b00000000000000000000000000000000) (bvslt (index!14454 lt!157505) (size!8290 a!3305)))))

(declare-fun e!201316 () Bool)

(assert (=> b!327330 (= e!201316 (= (select (arr!7938 a!3305) (index!14454 lt!157505)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69803 () Bool)

(declare-fun e!201312 () Bool)

(assert (=> d!69803 e!201312))

(declare-fun c!51130 () Bool)

(get-info :version)

(assert (=> d!69803 (= c!51130 (and ((_ is Intermediate!3069) lt!157505) (undefined!3881 lt!157505)))))

(declare-fun e!201314 () SeekEntryResult!3069)

(assert (=> d!69803 (= lt!157505 e!201314)))

(declare-fun c!51131 () Bool)

(assert (=> d!69803 (= c!51131 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157506 () (_ BitVec 64))

(assert (=> d!69803 (= lt!157506 (select (arr!7938 a!3305) index!1840))))

(assert (=> d!69803 (validMask!0 mask!3777)))

(assert (=> d!69803 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157505)))

(declare-fun b!327331 () Bool)

(assert (=> b!327331 (= e!201314 (Intermediate!3069 true index!1840 x!1490))))

(declare-fun b!327332 () Bool)

(declare-fun e!201315 () SeekEntryResult!3069)

(assert (=> b!327332 (= e!201315 (Intermediate!3069 false index!1840 x!1490))))

(declare-fun b!327333 () Bool)

(assert (=> b!327333 (and (bvsge (index!14454 lt!157505) #b00000000000000000000000000000000) (bvslt (index!14454 lt!157505) (size!8290 a!3305)))))

(declare-fun res!180332 () Bool)

(assert (=> b!327333 (= res!180332 (= (select (arr!7938 a!3305) (index!14454 lt!157505)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327333 (=> res!180332 e!201316)))

(declare-fun b!327334 () Bool)

(assert (=> b!327334 (= e!201314 e!201315)))

(declare-fun c!51132 () Bool)

(assert (=> b!327334 (= c!51132 (or (= lt!157506 k0!2497) (= (bvadd lt!157506 lt!157506) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327335 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327335 (= e!201315 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327336 () Bool)

(declare-fun e!201313 () Bool)

(assert (=> b!327336 (= e!201312 e!201313)))

(declare-fun res!180331 () Bool)

(assert (=> b!327336 (= res!180331 (and ((_ is Intermediate!3069) lt!157505) (not (undefined!3881 lt!157505)) (bvslt (x!32691 lt!157505) #b01111111111111111111111111111110) (bvsge (x!32691 lt!157505) #b00000000000000000000000000000000) (bvsge (x!32691 lt!157505) x!1490)))))

(assert (=> b!327336 (=> (not res!180331) (not e!201313))))

(declare-fun b!327337 () Bool)

(assert (=> b!327337 (and (bvsge (index!14454 lt!157505) #b00000000000000000000000000000000) (bvslt (index!14454 lt!157505) (size!8290 a!3305)))))

(declare-fun res!180333 () Bool)

(assert (=> b!327337 (= res!180333 (= (select (arr!7938 a!3305) (index!14454 lt!157505)) k0!2497))))

(assert (=> b!327337 (=> res!180333 e!201316)))

(assert (=> b!327337 (= e!201313 e!201316)))

(declare-fun b!327338 () Bool)

(assert (=> b!327338 (= e!201312 (bvsge (x!32691 lt!157505) #b01111111111111111111111111111110))))

(assert (= (and d!69803 c!51131) b!327331))

(assert (= (and d!69803 (not c!51131)) b!327334))

(assert (= (and b!327334 c!51132) b!327332))

(assert (= (and b!327334 (not c!51132)) b!327335))

(assert (= (and d!69803 c!51130) b!327338))

(assert (= (and d!69803 (not c!51130)) b!327336))

(assert (= (and b!327336 res!180331) b!327337))

(assert (= (and b!327337 (not res!180333)) b!327333))

(assert (= (and b!327333 (not res!180332)) b!327330))

(declare-fun m!333741 () Bool)

(assert (=> d!69803 m!333741))

(assert (=> d!69803 m!333693))

(declare-fun m!333743 () Bool)

(assert (=> b!327333 m!333743))

(assert (=> b!327330 m!333743))

(assert (=> b!327337 m!333743))

(declare-fun m!333745 () Bool)

(assert (=> b!327335 m!333745))

(assert (=> b!327335 m!333745))

(declare-fun m!333747 () Bool)

(assert (=> b!327335 m!333747))

(assert (=> b!327254 d!69803))

(declare-fun b!327396 () Bool)

(declare-fun e!201352 () SeekEntryResult!3069)

(declare-fun e!201350 () SeekEntryResult!3069)

(assert (=> b!327396 (= e!201352 e!201350)))

(declare-fun lt!157537 () (_ BitVec 64))

(declare-fun lt!157538 () SeekEntryResult!3069)

(assert (=> b!327396 (= lt!157537 (select (arr!7938 a!3305) (index!14454 lt!157538)))))

(declare-fun c!51154 () Bool)

(assert (=> b!327396 (= c!51154 (= lt!157537 k0!2497))))

(declare-fun b!327397 () Bool)

(assert (=> b!327397 (= e!201352 Undefined!3069)))

(declare-fun e!201351 () SeekEntryResult!3069)

(declare-fun b!327398 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16767 (_ BitVec 32)) SeekEntryResult!3069)

(assert (=> b!327398 (= e!201351 (seekKeyOrZeroReturnVacant!0 (x!32691 lt!157538) (index!14454 lt!157538) (index!14454 lt!157538) k0!2497 a!3305 mask!3777))))

(declare-fun b!327399 () Bool)

(assert (=> b!327399 (= e!201350 (Found!3069 (index!14454 lt!157538)))))

(declare-fun b!327400 () Bool)

(declare-fun c!51155 () Bool)

(assert (=> b!327400 (= c!51155 (= lt!157537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327400 (= e!201350 e!201351)))

(declare-fun d!69811 () Bool)

(declare-fun lt!157539 () SeekEntryResult!3069)

(assert (=> d!69811 (and (or ((_ is Undefined!3069) lt!157539) (not ((_ is Found!3069) lt!157539)) (and (bvsge (index!14453 lt!157539) #b00000000000000000000000000000000) (bvslt (index!14453 lt!157539) (size!8290 a!3305)))) (or ((_ is Undefined!3069) lt!157539) ((_ is Found!3069) lt!157539) (not ((_ is MissingZero!3069) lt!157539)) (and (bvsge (index!14452 lt!157539) #b00000000000000000000000000000000) (bvslt (index!14452 lt!157539) (size!8290 a!3305)))) (or ((_ is Undefined!3069) lt!157539) ((_ is Found!3069) lt!157539) ((_ is MissingZero!3069) lt!157539) (not ((_ is MissingVacant!3069) lt!157539)) (and (bvsge (index!14455 lt!157539) #b00000000000000000000000000000000) (bvslt (index!14455 lt!157539) (size!8290 a!3305)))) (or ((_ is Undefined!3069) lt!157539) (ite ((_ is Found!3069) lt!157539) (= (select (arr!7938 a!3305) (index!14453 lt!157539)) k0!2497) (ite ((_ is MissingZero!3069) lt!157539) (= (select (arr!7938 a!3305) (index!14452 lt!157539)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3069) lt!157539) (= (select (arr!7938 a!3305) (index!14455 lt!157539)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69811 (= lt!157539 e!201352)))

(declare-fun c!51156 () Bool)

(assert (=> d!69811 (= c!51156 (and ((_ is Intermediate!3069) lt!157538) (undefined!3881 lt!157538)))))

(assert (=> d!69811 (= lt!157538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69811 (validMask!0 mask!3777)))

(assert (=> d!69811 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157539)))

(declare-fun b!327401 () Bool)

(assert (=> b!327401 (= e!201351 (MissingZero!3069 (index!14454 lt!157538)))))

(assert (= (and d!69811 c!51156) b!327397))

(assert (= (and d!69811 (not c!51156)) b!327396))

(assert (= (and b!327396 c!51154) b!327399))

(assert (= (and b!327396 (not c!51154)) b!327400))

(assert (= (and b!327400 c!51155) b!327401))

(assert (= (and b!327400 (not c!51155)) b!327398))

(declare-fun m!333779 () Bool)

(assert (=> b!327396 m!333779))

(declare-fun m!333781 () Bool)

(assert (=> b!327398 m!333781))

(declare-fun m!333783 () Bool)

(assert (=> d!69811 m!333783))

(assert (=> d!69811 m!333693))

(declare-fun m!333785 () Bool)

(assert (=> d!69811 m!333785))

(assert (=> d!69811 m!333697))

(assert (=> d!69811 m!333699))

(assert (=> d!69811 m!333697))

(declare-fun m!333787 () Bool)

(assert (=> d!69811 m!333787))

(assert (=> b!327249 d!69811))

(declare-fun b!327423 () Bool)

(declare-fun e!201369 () Bool)

(declare-fun e!201370 () Bool)

(assert (=> b!327423 (= e!201369 e!201370)))

(declare-fun c!51162 () Bool)

(assert (=> b!327423 (= c!51162 (validKeyInArray!0 (select (arr!7938 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!327424 () Bool)

(declare-fun e!201368 () Bool)

(assert (=> b!327424 (= e!201370 e!201368)))

(declare-fun lt!157548 () (_ BitVec 64))

(assert (=> b!327424 (= lt!157548 (select (arr!7938 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10174 0))(
  ( (Unit!10175) )
))
(declare-fun lt!157549 () Unit!10174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16767 (_ BitVec 64) (_ BitVec 32)) Unit!10174)

(assert (=> b!327424 (= lt!157549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157548 #b00000000000000000000000000000000))))

(assert (=> b!327424 (arrayContainsKey!0 a!3305 lt!157548 #b00000000000000000000000000000000)))

(declare-fun lt!157550 () Unit!10174)

(assert (=> b!327424 (= lt!157550 lt!157549)))

(declare-fun res!180361 () Bool)

(assert (=> b!327424 (= res!180361 (= (seekEntryOrOpen!0 (select (arr!7938 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3069 #b00000000000000000000000000000000)))))

(assert (=> b!327424 (=> (not res!180361) (not e!201368))))

(declare-fun b!327425 () Bool)

(declare-fun call!26098 () Bool)

(assert (=> b!327425 (= e!201370 call!26098)))

(declare-fun d!69825 () Bool)

(declare-fun res!180362 () Bool)

(assert (=> d!69825 (=> res!180362 e!201369)))

(assert (=> d!69825 (= res!180362 (bvsge #b00000000000000000000000000000000 (size!8290 a!3305)))))

(assert (=> d!69825 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201369)))

(declare-fun b!327426 () Bool)

(assert (=> b!327426 (= e!201368 call!26098)))

(declare-fun bm!26095 () Bool)

(assert (=> bm!26095 (= call!26098 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69825 (not res!180362)) b!327423))

(assert (= (and b!327423 c!51162) b!327424))

(assert (= (and b!327423 (not c!51162)) b!327425))

(assert (= (and b!327424 res!180361) b!327426))

(assert (= (or b!327426 b!327425) bm!26095))

(assert (=> b!327423 m!333725))

(assert (=> b!327423 m!333725))

(declare-fun m!333799 () Bool)

(assert (=> b!327423 m!333799))

(assert (=> b!327424 m!333725))

(declare-fun m!333801 () Bool)

(assert (=> b!327424 m!333801))

(declare-fun m!333803 () Bool)

(assert (=> b!327424 m!333803))

(assert (=> b!327424 m!333725))

(declare-fun m!333805 () Bool)

(assert (=> b!327424 m!333805))

(declare-fun m!333807 () Bool)

(assert (=> bm!26095 m!333807))

(assert (=> b!327248 d!69825))

(declare-fun b!327429 () Bool)

(declare-fun lt!157551 () SeekEntryResult!3069)

(assert (=> b!327429 (and (bvsge (index!14454 lt!157551) #b00000000000000000000000000000000) (bvslt (index!14454 lt!157551) (size!8290 a!3305)))))

(declare-fun e!201377 () Bool)

(assert (=> b!327429 (= e!201377 (= (select (arr!7938 a!3305) (index!14454 lt!157551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69839 () Bool)

(declare-fun e!201373 () Bool)

(assert (=> d!69839 e!201373))

(declare-fun c!51163 () Bool)

(assert (=> d!69839 (= c!51163 (and ((_ is Intermediate!3069) lt!157551) (undefined!3881 lt!157551)))))

(declare-fun e!201375 () SeekEntryResult!3069)

(assert (=> d!69839 (= lt!157551 e!201375)))

(declare-fun c!51164 () Bool)

(assert (=> d!69839 (= c!51164 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157552 () (_ BitVec 64))

(assert (=> d!69839 (= lt!157552 (select (arr!7938 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69839 (validMask!0 mask!3777)))

(assert (=> d!69839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157551)))

(declare-fun b!327430 () Bool)

(assert (=> b!327430 (= e!201375 (Intermediate!3069 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327431 () Bool)

(declare-fun e!201376 () SeekEntryResult!3069)

(assert (=> b!327431 (= e!201376 (Intermediate!3069 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327432 () Bool)

(assert (=> b!327432 (and (bvsge (index!14454 lt!157551) #b00000000000000000000000000000000) (bvslt (index!14454 lt!157551) (size!8290 a!3305)))))

(declare-fun res!180366 () Bool)

(assert (=> b!327432 (= res!180366 (= (select (arr!7938 a!3305) (index!14454 lt!157551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327432 (=> res!180366 e!201377)))

(declare-fun b!327433 () Bool)

(assert (=> b!327433 (= e!201375 e!201376)))

(declare-fun c!51165 () Bool)

(assert (=> b!327433 (= c!51165 (or (= lt!157552 k0!2497) (= (bvadd lt!157552 lt!157552) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327434 () Bool)

(assert (=> b!327434 (= e!201376 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327435 () Bool)

(declare-fun e!201374 () Bool)

(assert (=> b!327435 (= e!201373 e!201374)))

(declare-fun res!180365 () Bool)

(assert (=> b!327435 (= res!180365 (and ((_ is Intermediate!3069) lt!157551) (not (undefined!3881 lt!157551)) (bvslt (x!32691 lt!157551) #b01111111111111111111111111111110) (bvsge (x!32691 lt!157551) #b00000000000000000000000000000000) (bvsge (x!32691 lt!157551) #b00000000000000000000000000000000)))))

(assert (=> b!327435 (=> (not res!180365) (not e!201374))))

(declare-fun b!327436 () Bool)

(assert (=> b!327436 (and (bvsge (index!14454 lt!157551) #b00000000000000000000000000000000) (bvslt (index!14454 lt!157551) (size!8290 a!3305)))))

(declare-fun res!180367 () Bool)

(assert (=> b!327436 (= res!180367 (= (select (arr!7938 a!3305) (index!14454 lt!157551)) k0!2497))))

(assert (=> b!327436 (=> res!180367 e!201377)))

(assert (=> b!327436 (= e!201374 e!201377)))

(declare-fun b!327437 () Bool)

(assert (=> b!327437 (= e!201373 (bvsge (x!32691 lt!157551) #b01111111111111111111111111111110))))

(assert (= (and d!69839 c!51164) b!327430))

(assert (= (and d!69839 (not c!51164)) b!327433))

(assert (= (and b!327433 c!51165) b!327431))

(assert (= (and b!327433 (not c!51165)) b!327434))

(assert (= (and d!69839 c!51163) b!327437))

(assert (= (and d!69839 (not c!51163)) b!327435))

(assert (= (and b!327435 res!180365) b!327436))

(assert (= (and b!327436 (not res!180367)) b!327432))

(assert (= (and b!327432 (not res!180366)) b!327429))

(assert (=> d!69839 m!333697))

(declare-fun m!333809 () Bool)

(assert (=> d!69839 m!333809))

(assert (=> d!69839 m!333693))

(declare-fun m!333811 () Bool)

(assert (=> b!327432 m!333811))

(assert (=> b!327429 m!333811))

(assert (=> b!327436 m!333811))

(assert (=> b!327434 m!333697))

(declare-fun m!333813 () Bool)

(assert (=> b!327434 m!333813))

(assert (=> b!327434 m!333813))

(declare-fun m!333815 () Bool)

(assert (=> b!327434 m!333815))

(assert (=> b!327251 d!69839))

(declare-fun d!69841 () Bool)

(declare-fun lt!157562 () (_ BitVec 32))

(declare-fun lt!157561 () (_ BitVec 32))

(assert (=> d!69841 (= lt!157562 (bvmul (bvxor lt!157561 (bvlshr lt!157561 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69841 (= lt!157561 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69841 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180368 (let ((h!5398 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32696 (bvmul (bvxor h!5398 (bvlshr h!5398 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32696 (bvlshr x!32696 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180368 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180368 #b00000000000000000000000000000000))))))

(assert (=> d!69841 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157562 (bvlshr lt!157562 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327251 d!69841))

(declare-fun d!69843 () Bool)

(assert (=> d!69843 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327252 d!69843))

(declare-fun d!69845 () Bool)

(assert (=> d!69845 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32730 d!69845))

(declare-fun d!69851 () Bool)

(assert (=> d!69851 (= (array_inv!5901 a!3305) (bvsge (size!8290 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32730 d!69851))

(check-sat (not b!327287) (not b!327424) (not b!327335) (not d!69839) (not bm!26095) (not d!69803) (not b!327434) (not d!69811) (not b!327423) (not b!327398))
(check-sat)
