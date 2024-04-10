; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28738 () Bool)

(assert start!28738)

(declare-fun b!293451 () Bool)

(declare-fun res!154368 () Bool)

(declare-fun e!185555 () Bool)

(assert (=> b!293451 (=> (not res!154368) (not e!185555))))

(declare-datatypes ((array!14872 0))(
  ( (array!14873 (arr!7057 (Array (_ BitVec 32) (_ BitVec 64))) (size!7409 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14872)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293451 (= res!154368 (and (= (size!7409 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7409 a!3312))))))

(declare-fun b!293453 () Bool)

(declare-fun res!154370 () Bool)

(declare-fun e!185554 () Bool)

(assert (=> b!293453 (=> (not res!154370) (not e!185554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14872 (_ BitVec 32)) Bool)

(assert (=> b!293453 (= res!154370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-datatypes ((SeekEntryResult!2206 0))(
  ( (MissingZero!2206 (index!10994 (_ BitVec 32))) (Found!2206 (index!10995 (_ BitVec 32))) (Intermediate!2206 (undefined!3018 Bool) (index!10996 (_ BitVec 32)) (x!29171 (_ BitVec 32))) (Undefined!2206) (MissingVacant!2206 (index!10997 (_ BitVec 32))) )
))
(declare-fun lt!145467 () SeekEntryResult!2206)

(declare-fun lt!145470 () Bool)

(declare-fun b!293454 () Bool)

(assert (=> b!293454 (= e!185554 (and lt!145470 (let ((bdg!6217 (not (is-Intermediate!2206 lt!145467)))) (and (or bdg!6217 (not (undefined!3018 lt!145467))) (not bdg!6217) (or (bvslt (index!10996 lt!145467) #b00000000000000000000000000000000) (bvsge (index!10996 lt!145467) (size!7409 a!3312)))))))))

(declare-fun lt!145471 () (_ BitVec 32))

(declare-fun lt!145469 () SeekEntryResult!2206)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14872 (_ BitVec 32)) SeekEntryResult!2206)

(assert (=> b!293454 (= lt!145469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145471 k!2524 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312)) mask!3809))))

(assert (=> b!293454 (= lt!145467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145471 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293454 (= lt!145471 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!293455 () Bool)

(declare-fun res!154371 () Bool)

(assert (=> b!293455 (=> (not res!154371) (not e!185555))))

(declare-fun arrayContainsKey!0 (array!14872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293455 (= res!154371 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293456 () Bool)

(assert (=> b!293456 (= e!185555 e!185554)))

(declare-fun res!154367 () Bool)

(assert (=> b!293456 (=> (not res!154367) (not e!185554))))

(declare-fun lt!145468 () SeekEntryResult!2206)

(assert (=> b!293456 (= res!154367 (or lt!145470 (= lt!145468 (MissingVacant!2206 i!1256))))))

(assert (=> b!293456 (= lt!145470 (= lt!145468 (MissingZero!2206 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14872 (_ BitVec 32)) SeekEntryResult!2206)

(assert (=> b!293456 (= lt!145468 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!154369 () Bool)

(assert (=> start!28738 (=> (not res!154369) (not e!185555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28738 (= res!154369 (validMask!0 mask!3809))))

(assert (=> start!28738 e!185555))

(assert (=> start!28738 true))

(declare-fun array_inv!5020 (array!14872) Bool)

(assert (=> start!28738 (array_inv!5020 a!3312)))

(declare-fun b!293452 () Bool)

(declare-fun res!154366 () Bool)

(assert (=> b!293452 (=> (not res!154366) (not e!185555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293452 (= res!154366 (validKeyInArray!0 k!2524))))

(assert (= (and start!28738 res!154369) b!293451))

(assert (= (and b!293451 res!154368) b!293452))

(assert (= (and b!293452 res!154366) b!293455))

(assert (= (and b!293455 res!154371) b!293456))

(assert (= (and b!293456 res!154367) b!293453))

(assert (= (and b!293453 res!154370) b!293454))

(declare-fun m!307165 () Bool)

(assert (=> b!293452 m!307165))

(declare-fun m!307167 () Bool)

(assert (=> b!293453 m!307167))

(declare-fun m!307169 () Bool)

(assert (=> b!293455 m!307169))

(declare-fun m!307171 () Bool)

(assert (=> start!28738 m!307171))

(declare-fun m!307173 () Bool)

(assert (=> start!28738 m!307173))

(declare-fun m!307175 () Bool)

(assert (=> b!293454 m!307175))

(declare-fun m!307177 () Bool)

(assert (=> b!293454 m!307177))

(declare-fun m!307179 () Bool)

(assert (=> b!293454 m!307179))

(declare-fun m!307181 () Bool)

(assert (=> b!293454 m!307181))

(declare-fun m!307183 () Bool)

(assert (=> b!293456 m!307183))

(push 1)

(assert (not start!28738))

(assert (not b!293453))

(assert (not b!293456))

(assert (not b!293452))

(assert (not b!293454))

(assert (not b!293455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!293507 () Bool)

(declare-fun e!185588 () Bool)

(declare-fun call!25672 () Bool)

(assert (=> b!293507 (= e!185588 call!25672)))

(declare-fun bm!25669 () Bool)

(assert (=> bm!25669 (= call!25672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293508 () Bool)

(declare-fun e!185590 () Bool)

(assert (=> b!293508 (= e!185590 call!25672)))

(declare-fun b!293509 () Bool)

(declare-fun e!185589 () Bool)

(assert (=> b!293509 (= e!185589 e!185590)))

(declare-fun c!47124 () Bool)

(assert (=> b!293509 (= c!47124 (validKeyInArray!0 (select (arr!7057 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66571 () Bool)

(declare-fun res!154395 () Bool)

(assert (=> d!66571 (=> res!154395 e!185589)))

(assert (=> d!66571 (= res!154395 (bvsge #b00000000000000000000000000000000 (size!7409 a!3312)))))

(assert (=> d!66571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185589)))

(declare-fun b!293510 () Bool)

(assert (=> b!293510 (= e!185590 e!185588)))

(declare-fun lt!145493 () (_ BitVec 64))

(assert (=> b!293510 (= lt!145493 (select (arr!7057 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9186 0))(
  ( (Unit!9187) )
))
(declare-fun lt!145492 () Unit!9186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14872 (_ BitVec 64) (_ BitVec 32)) Unit!9186)

(assert (=> b!293510 (= lt!145492 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145493 #b00000000000000000000000000000000))))

(assert (=> b!293510 (arrayContainsKey!0 a!3312 lt!145493 #b00000000000000000000000000000000)))

(declare-fun lt!145494 () Unit!9186)

(assert (=> b!293510 (= lt!145494 lt!145492)))

(declare-fun res!154396 () Bool)

(assert (=> b!293510 (= res!154396 (= (seekEntryOrOpen!0 (select (arr!7057 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2206 #b00000000000000000000000000000000)))))

(assert (=> b!293510 (=> (not res!154396) (not e!185588))))

(assert (= (and d!66571 (not res!154395)) b!293509))

(assert (= (and b!293509 c!47124) b!293510))

(assert (= (and b!293509 (not c!47124)) b!293508))

(assert (= (and b!293510 res!154396) b!293507))

(assert (= (or b!293507 b!293508) bm!25669))

(declare-fun m!307203 () Bool)

(assert (=> bm!25669 m!307203))

(declare-fun m!307205 () Bool)

(assert (=> b!293509 m!307205))

(assert (=> b!293509 m!307205))

(declare-fun m!307207 () Bool)

(assert (=> b!293509 m!307207))

(assert (=> b!293510 m!307205))

(declare-fun m!307209 () Bool)

(assert (=> b!293510 m!307209))

(declare-fun m!307211 () Bool)

(assert (=> b!293510 m!307211))

(assert (=> b!293510 m!307205))

(declare-fun m!307213 () Bool)

(assert (=> b!293510 m!307213))

(assert (=> b!293453 d!66571))

(declare-fun d!66581 () Bool)

(assert (=> d!66581 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293452 d!66581))

(declare-fun b!293565 () Bool)

(declare-fun lt!145512 () SeekEntryResult!2206)

(assert (=> b!293565 (and (bvsge (index!10996 lt!145512) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145512) (size!7409 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312)))))))

(declare-fun e!185627 () Bool)

(assert (=> b!293565 (= e!185627 (= (select (arr!7057 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312))) (index!10996 lt!145512)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293566 () Bool)

(declare-fun e!185630 () Bool)

(assert (=> b!293566 (= e!185630 (bvsge (x!29171 lt!145512) #b01111111111111111111111111111110))))

(declare-fun e!185629 () SeekEntryResult!2206)

(declare-fun b!293567 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293567 (= e!185629 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145471 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312)) mask!3809))))

(declare-fun b!293568 () Bool)

(assert (=> b!293568 (and (bvsge (index!10996 lt!145512) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145512) (size!7409 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312)))))))

(declare-fun res!154421 () Bool)

(assert (=> b!293568 (= res!154421 (= (select (arr!7057 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312))) (index!10996 lt!145512)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293568 (=> res!154421 e!185627)))

(declare-fun b!293569 () Bool)

(declare-fun e!185628 () Bool)

(assert (=> b!293569 (= e!185630 e!185628)))

(declare-fun res!154423 () Bool)

(assert (=> b!293569 (= res!154423 (and (is-Intermediate!2206 lt!145512) (not (undefined!3018 lt!145512)) (bvslt (x!29171 lt!145512) #b01111111111111111111111111111110) (bvsge (x!29171 lt!145512) #b00000000000000000000000000000000) (bvsge (x!29171 lt!145512) #b00000000000000000000000000000000)))))

(assert (=> b!293569 (=> (not res!154423) (not e!185628))))

(declare-fun b!293570 () Bool)

(assert (=> b!293570 (and (bvsge (index!10996 lt!145512) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145512) (size!7409 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312)))))))

(declare-fun res!154422 () Bool)

(assert (=> b!293570 (= res!154422 (= (select (arr!7057 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312))) (index!10996 lt!145512)) k!2524))))

(assert (=> b!293570 (=> res!154422 e!185627)))

(assert (=> b!293570 (= e!185628 e!185627)))

(declare-fun b!293571 () Bool)

(assert (=> b!293571 (= e!185629 (Intermediate!2206 false lt!145471 #b00000000000000000000000000000000))))

(declare-fun b!293572 () Bool)

(declare-fun e!185626 () SeekEntryResult!2206)

(assert (=> b!293572 (= e!185626 (Intermediate!2206 true lt!145471 #b00000000000000000000000000000000))))

(declare-fun b!293573 () Bool)

(assert (=> b!293573 (= e!185626 e!185629)))

(declare-fun c!47141 () Bool)

(declare-fun lt!145513 () (_ BitVec 64))

(assert (=> b!293573 (= c!47141 (or (= lt!145513 k!2524) (= (bvadd lt!145513 lt!145513) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66583 () Bool)

(assert (=> d!66583 e!185630))

(declare-fun c!47140 () Bool)

(assert (=> d!66583 (= c!47140 (and (is-Intermediate!2206 lt!145512) (undefined!3018 lt!145512)))))

(assert (=> d!66583 (= lt!145512 e!185626)))

(declare-fun c!47142 () Bool)

(assert (=> d!66583 (= c!47142 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66583 (= lt!145513 (select (arr!7057 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312))) lt!145471))))

(assert (=> d!66583 (validMask!0 mask!3809)))

(assert (=> d!66583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145471 k!2524 (array!14873 (store (arr!7057 a!3312) i!1256 k!2524) (size!7409 a!3312)) mask!3809) lt!145512)))

(assert (= (and d!66583 c!47142) b!293572))

(assert (= (and d!66583 (not c!47142)) b!293573))

(assert (= (and b!293573 c!47141) b!293571))

(assert (= (and b!293573 (not c!47141)) b!293567))

(assert (= (and d!66583 c!47140) b!293566))

(assert (= (and d!66583 (not c!47140)) b!293569))

(assert (= (and b!293569 res!154423) b!293570))

(assert (= (and b!293570 (not res!154422)) b!293568))

(assert (= (and b!293568 (not res!154421)) b!293565))

(declare-fun m!307229 () Bool)

(assert (=> b!293567 m!307229))

(assert (=> b!293567 m!307229))

(declare-fun m!307231 () Bool)

(assert (=> b!293567 m!307231))

(declare-fun m!307233 () Bool)

(assert (=> d!66583 m!307233))

(assert (=> d!66583 m!307171))

(declare-fun m!307235 () Bool)

(assert (=> b!293568 m!307235))

(assert (=> b!293570 m!307235))

(assert (=> b!293565 m!307235))

(assert (=> b!293454 d!66583))

(declare-fun b!293583 () Bool)

(declare-fun lt!145516 () SeekEntryResult!2206)

(assert (=> b!293583 (and (bvsge (index!10996 lt!145516) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145516) (size!7409 a!3312)))))

(declare-fun e!185637 () Bool)

(assert (=> b!293583 (= e!185637 (= (select (arr!7057 a!3312) (index!10996 lt!145516)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293584 () Bool)

(declare-fun e!185640 () Bool)

(assert (=> b!293584 (= e!185640 (bvsge (x!29171 lt!145516) #b01111111111111111111111111111110))))

(declare-fun b!293585 () Bool)

(declare-fun e!185639 () SeekEntryResult!2206)

(assert (=> b!293585 (= e!185639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145471 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293586 () Bool)

(assert (=> b!293586 (and (bvsge (index!10996 lt!145516) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145516) (size!7409 a!3312)))))

(declare-fun res!154427 () Bool)

(assert (=> b!293586 (= res!154427 (= (select (arr!7057 a!3312) (index!10996 lt!145516)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293586 (=> res!154427 e!185637)))

(declare-fun b!293587 () Bool)

(declare-fun e!185638 () Bool)

(assert (=> b!293587 (= e!185640 e!185638)))

(declare-fun res!154429 () Bool)

(assert (=> b!293587 (= res!154429 (and (is-Intermediate!2206 lt!145516) (not (undefined!3018 lt!145516)) (bvslt (x!29171 lt!145516) #b01111111111111111111111111111110) (bvsge (x!29171 lt!145516) #b00000000000000000000000000000000) (bvsge (x!29171 lt!145516) #b00000000000000000000000000000000)))))

(assert (=> b!293587 (=> (not res!154429) (not e!185638))))

(declare-fun b!293588 () Bool)

(assert (=> b!293588 (and (bvsge (index!10996 lt!145516) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145516) (size!7409 a!3312)))))

(declare-fun res!154428 () Bool)

(assert (=> b!293588 (= res!154428 (= (select (arr!7057 a!3312) (index!10996 lt!145516)) k!2524))))

(assert (=> b!293588 (=> res!154428 e!185637)))

(assert (=> b!293588 (= e!185638 e!185637)))

(declare-fun b!293589 () Bool)

(assert (=> b!293589 (= e!185639 (Intermediate!2206 false lt!145471 #b00000000000000000000000000000000))))

(declare-fun b!293590 () Bool)

(declare-fun e!185636 () SeekEntryResult!2206)

(assert (=> b!293590 (= e!185636 (Intermediate!2206 true lt!145471 #b00000000000000000000000000000000))))

(declare-fun b!293591 () Bool)

(assert (=> b!293591 (= e!185636 e!185639)))

(declare-fun c!47147 () Bool)

(declare-fun lt!145517 () (_ BitVec 64))

(assert (=> b!293591 (= c!47147 (or (= lt!145517 k!2524) (= (bvadd lt!145517 lt!145517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66595 () Bool)

(assert (=> d!66595 e!185640))

(declare-fun c!47146 () Bool)

(assert (=> d!66595 (= c!47146 (and (is-Intermediate!2206 lt!145516) (undefined!3018 lt!145516)))))

(assert (=> d!66595 (= lt!145516 e!185636)))

(declare-fun c!47148 () Bool)

(assert (=> d!66595 (= c!47148 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66595 (= lt!145517 (select (arr!7057 a!3312) lt!145471))))

(assert (=> d!66595 (validMask!0 mask!3809)))

(assert (=> d!66595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145471 k!2524 a!3312 mask!3809) lt!145516)))

(assert (= (and d!66595 c!47148) b!293590))

(assert (= (and d!66595 (not c!47148)) b!293591))

(assert (= (and b!293591 c!47147) b!293589))

(assert (= (and b!293591 (not c!47147)) b!293585))

(assert (= (and d!66595 c!47146) b!293584))

(assert (= (and d!66595 (not c!47146)) b!293587))

(assert (= (and b!293587 res!154429) b!293588))

(assert (= (and b!293588 (not res!154428)) b!293586))

(assert (= (and b!293586 (not res!154427)) b!293583))

(assert (=> b!293585 m!307229))

(assert (=> b!293585 m!307229))

(declare-fun m!307239 () Bool)

(assert (=> b!293585 m!307239))

(declare-fun m!307243 () Bool)

(assert (=> d!66595 m!307243))

(assert (=> d!66595 m!307171))

(declare-fun m!307247 () Bool)

(assert (=> b!293586 m!307247))

(assert (=> b!293588 m!307247))

(assert (=> b!293583 m!307247))

(assert (=> b!293454 d!66595))

(declare-fun d!66603 () Bool)

(declare-fun lt!145525 () (_ BitVec 32))

(declare-fun lt!145524 () (_ BitVec 32))

(assert (=> d!66603 (= lt!145525 (bvmul (bvxor lt!145524 (bvlshr lt!145524 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66603 (= lt!145524 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66603 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154433 (let ((h!5272 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29176 (bvmul (bvxor h!5272 (bvlshr h!5272 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29176 (bvlshr x!29176 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154433 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154433 #b00000000000000000000000000000000))))))

(assert (=> d!66603 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145525 (bvlshr lt!145525 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293454 d!66603))

(declare-fun d!66607 () Bool)

(declare-fun res!154439 () Bool)

(declare-fun e!185650 () Bool)

(assert (=> d!66607 (=> res!154439 e!185650)))

(assert (=> d!66607 (= res!154439 (= (select (arr!7057 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66607 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185650)))

(declare-fun b!293605 () Bool)

(declare-fun e!185651 () Bool)

(assert (=> b!293605 (= e!185650 e!185651)))

(declare-fun res!154440 () Bool)

(assert (=> b!293605 (=> (not res!154440) (not e!185651))))

(assert (=> b!293605 (= res!154440 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7409 a!3312)))))

(declare-fun b!293606 () Bool)

(assert (=> b!293606 (= e!185651 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66607 (not res!154439)) b!293605))

(assert (= (and b!293605 res!154440) b!293606))

(assert (=> d!66607 m!307205))

(declare-fun m!307257 () Bool)

(assert (=> b!293606 m!307257))

(assert (=> b!293455 d!66607))

(declare-fun d!66613 () Bool)

(assert (=> d!66613 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28738 d!66613))

(declare-fun d!66617 () Bool)

(assert (=> d!66617 (= (array_inv!5020 a!3312) (bvsge (size!7409 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28738 d!66617))

(declare-fun b!293667 () Bool)

(declare-fun e!185686 () SeekEntryResult!2206)

(declare-fun lt!145567 () SeekEntryResult!2206)

(assert (=> b!293667 (= e!185686 (MissingZero!2206 (index!10996 lt!145567)))))

(declare-fun b!293669 () Bool)

(declare-fun e!185685 () SeekEntryResult!2206)

(assert (=> b!293669 (= e!185685 (Found!2206 (index!10996 lt!145567)))))

(declare-fun b!293670 () Bool)

(declare-fun c!47181 () Bool)

(declare-fun lt!145566 () (_ BitVec 64))

(assert (=> b!293670 (= c!47181 (= lt!145566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293670 (= e!185685 e!185686)))

(declare-fun b!293671 () Bool)

(declare-fun e!185687 () SeekEntryResult!2206)

(assert (=> b!293671 (= e!185687 e!185685)))

(assert (=> b!293671 (= lt!145566 (select (arr!7057 a!3312) (index!10996 lt!145567)))))

(declare-fun c!47180 () Bool)

(assert (=> b!293671 (= c!47180 (= lt!145566 k!2524))))

(declare-fun b!293672 () Bool)

(assert (=> b!293672 (= e!185687 Undefined!2206)))

(declare-fun d!66619 () Bool)

(declare-fun lt!145565 () SeekEntryResult!2206)

(assert (=> d!66619 (and (or (is-Undefined!2206 lt!145565) (not (is-Found!2206 lt!145565)) (and (bvsge (index!10995 lt!145565) #b00000000000000000000000000000000) (bvslt (index!10995 lt!145565) (size!7409 a!3312)))) (or (is-Undefined!2206 lt!145565) (is-Found!2206 lt!145565) (not (is-MissingZero!2206 lt!145565)) (and (bvsge (index!10994 lt!145565) #b00000000000000000000000000000000) (bvslt (index!10994 lt!145565) (size!7409 a!3312)))) (or (is-Undefined!2206 lt!145565) (is-Found!2206 lt!145565) (is-MissingZero!2206 lt!145565) (not (is-MissingVacant!2206 lt!145565)) (and (bvsge (index!10997 lt!145565) #b00000000000000000000000000000000) (bvslt (index!10997 lt!145565) (size!7409 a!3312)))) (or (is-Undefined!2206 lt!145565) (ite (is-Found!2206 lt!145565) (= (select (arr!7057 a!3312) (index!10995 lt!145565)) k!2524) (ite (is-MissingZero!2206 lt!145565) (= (select (arr!7057 a!3312) (index!10994 lt!145565)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2206 lt!145565) (= (select (arr!7057 a!3312) (index!10997 lt!145565)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66619 (= lt!145565 e!185687)))

(declare-fun c!47179 () Bool)

(assert (=> d!66619 (= c!47179 (and (is-Intermediate!2206 lt!145567) (undefined!3018 lt!145567)))))

(assert (=> d!66619 (= lt!145567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66619 (validMask!0 mask!3809)))

(assert (=> d!66619 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145565)))

(declare-fun b!293668 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14872 (_ BitVec 32)) SeekEntryResult!2206)

(assert (=> b!293668 (= e!185686 (seekKeyOrZeroReturnVacant!0 (x!29171 lt!145567) (index!10996 lt!145567) (index!10996 lt!145567) k!2524 a!3312 mask!3809))))

(assert (= (and d!66619 c!47179) b!293672))

(assert (= (and d!66619 (not c!47179)) b!293671))

(assert (= (and b!293671 c!47180) b!293669))

(assert (= (and b!293671 (not c!47180)) b!293670))

(assert (= (and b!293670 c!47181) b!293667))

(assert (= (and b!293670 (not c!47181)) b!293668))

(declare-fun m!307293 () Bool)

(assert (=> b!293671 m!307293))

(declare-fun m!307295 () Bool)

(assert (=> d!66619 m!307295))

(assert (=> d!66619 m!307181))

(declare-fun m!307297 () Bool)

(assert (=> d!66619 m!307297))

(declare-fun m!307299 () Bool)

(assert (=> d!66619 m!307299))

(assert (=> d!66619 m!307181))

(declare-fun m!307301 () Bool)

(assert (=> d!66619 m!307301))

(assert (=> d!66619 m!307171))

(declare-fun m!307303 () Bool)

(assert (=> b!293668 m!307303))

(assert (=> b!293456 d!66619))

(push 1)

(assert (not b!293567))

(assert (not b!293509))

(assert (not b!293585))

(assert (not d!66595))

(assert (not d!66619))

(assert (not b!293668))

(assert (not bm!25669))

(assert (not d!66583))

(assert (not b!293606))

(assert (not b!293510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

