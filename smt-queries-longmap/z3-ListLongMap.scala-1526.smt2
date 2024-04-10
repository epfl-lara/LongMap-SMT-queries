; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28736 () Bool)

(assert start!28736)

(declare-fun res!154353 () Bool)

(declare-fun e!185544 () Bool)

(assert (=> start!28736 (=> (not res!154353) (not e!185544))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28736 (= res!154353 (validMask!0 mask!3809))))

(assert (=> start!28736 e!185544))

(assert (=> start!28736 true))

(declare-datatypes ((array!14870 0))(
  ( (array!14871 (arr!7056 (Array (_ BitVec 32) (_ BitVec 64))) (size!7408 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14870)

(declare-fun array_inv!5019 (array!14870) Bool)

(assert (=> start!28736 (array_inv!5019 a!3312)))

(declare-fun b!293433 () Bool)

(declare-fun res!154351 () Bool)

(assert (=> b!293433 (=> (not res!154351) (not e!185544))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293433 (= res!154351 (validKeyInArray!0 k0!2524))))

(declare-fun b!293434 () Bool)

(declare-fun res!154349 () Bool)

(assert (=> b!293434 (=> (not res!154349) (not e!185544))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293434 (= res!154349 (and (= (size!7408 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7408 a!3312))))))

(declare-fun b!293435 () Bool)

(declare-fun res!154350 () Bool)

(assert (=> b!293435 (=> (not res!154350) (not e!185544))))

(declare-fun arrayContainsKey!0 (array!14870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293435 (= res!154350 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293436 () Bool)

(declare-fun e!185545 () Bool)

(assert (=> b!293436 (= e!185544 e!185545)))

(declare-fun res!154352 () Bool)

(assert (=> b!293436 (=> (not res!154352) (not e!185545))))

(declare-datatypes ((SeekEntryResult!2205 0))(
  ( (MissingZero!2205 (index!10990 (_ BitVec 32))) (Found!2205 (index!10991 (_ BitVec 32))) (Intermediate!2205 (undefined!3017 Bool) (index!10992 (_ BitVec 32)) (x!29170 (_ BitVec 32))) (Undefined!2205) (MissingVacant!2205 (index!10993 (_ BitVec 32))) )
))
(declare-fun lt!145456 () SeekEntryResult!2205)

(declare-fun lt!145455 () Bool)

(assert (=> b!293436 (= res!154352 (or lt!145455 (= lt!145456 (MissingVacant!2205 i!1256))))))

(assert (=> b!293436 (= lt!145455 (= lt!145456 (MissingZero!2205 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14870 (_ BitVec 32)) SeekEntryResult!2205)

(assert (=> b!293436 (= lt!145456 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293437 () Bool)

(declare-fun res!154348 () Bool)

(assert (=> b!293437 (=> (not res!154348) (not e!185545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14870 (_ BitVec 32)) Bool)

(assert (=> b!293437 (= res!154348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun lt!145452 () SeekEntryResult!2205)

(declare-fun b!293438 () Bool)

(get-info :version)

(assert (=> b!293438 (= e!185545 (and lt!145455 (let ((bdg!6217 (not ((_ is Intermediate!2205) lt!145452)))) (and (or bdg!6217 (not (undefined!3017 lt!145452))) (not bdg!6217) (or (bvslt (index!10992 lt!145452) #b00000000000000000000000000000000) (bvsge (index!10992 lt!145452) (size!7408 a!3312)))))))))

(declare-fun lt!145453 () SeekEntryResult!2205)

(declare-fun lt!145454 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14870 (_ BitVec 32)) SeekEntryResult!2205)

(assert (=> b!293438 (= lt!145453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145454 k0!2524 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312)) mask!3809))))

(assert (=> b!293438 (= lt!145452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145454 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293438 (= lt!145454 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28736 res!154353) b!293434))

(assert (= (and b!293434 res!154349) b!293433))

(assert (= (and b!293433 res!154351) b!293435))

(assert (= (and b!293435 res!154350) b!293436))

(assert (= (and b!293436 res!154352) b!293437))

(assert (= (and b!293437 res!154348) b!293438))

(declare-fun m!307145 () Bool)

(assert (=> start!28736 m!307145))

(declare-fun m!307147 () Bool)

(assert (=> start!28736 m!307147))

(declare-fun m!307149 () Bool)

(assert (=> b!293435 m!307149))

(declare-fun m!307151 () Bool)

(assert (=> b!293437 m!307151))

(declare-fun m!307153 () Bool)

(assert (=> b!293433 m!307153))

(declare-fun m!307155 () Bool)

(assert (=> b!293436 m!307155))

(declare-fun m!307157 () Bool)

(assert (=> b!293438 m!307157))

(declare-fun m!307159 () Bool)

(assert (=> b!293438 m!307159))

(declare-fun m!307161 () Bool)

(assert (=> b!293438 m!307161))

(declare-fun m!307163 () Bool)

(assert (=> b!293438 m!307163))

(check-sat (not b!293438) (not b!293436) (not b!293437) (not b!293435) (not b!293433) (not start!28736))
(check-sat)
(get-model)

(declare-fun b!293481 () Bool)

(declare-fun e!185572 () SeekEntryResult!2205)

(assert (=> b!293481 (= e!185572 (Intermediate!2205 true lt!145454 #b00000000000000000000000000000000))))

(declare-fun b!293482 () Bool)

(declare-fun lt!145477 () SeekEntryResult!2205)

(assert (=> b!293482 (and (bvsge (index!10992 lt!145477) #b00000000000000000000000000000000) (bvslt (index!10992 lt!145477) (size!7408 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312)))))))

(declare-fun res!154384 () Bool)

(assert (=> b!293482 (= res!154384 (= (select (arr!7056 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312))) (index!10992 lt!145477)) k0!2524))))

(declare-fun e!185575 () Bool)

(assert (=> b!293482 (=> res!154384 e!185575)))

(declare-fun e!185573 () Bool)

(assert (=> b!293482 (= e!185573 e!185575)))

(declare-fun b!293483 () Bool)

(assert (=> b!293483 (and (bvsge (index!10992 lt!145477) #b00000000000000000000000000000000) (bvslt (index!10992 lt!145477) (size!7408 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312)))))))

(assert (=> b!293483 (= e!185575 (= (select (arr!7056 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312))) (index!10992 lt!145477)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293484 () Bool)

(declare-fun e!185574 () Bool)

(assert (=> b!293484 (= e!185574 (bvsge (x!29170 lt!145477) #b01111111111111111111111111111110))))

(declare-fun b!293485 () Bool)

(assert (=> b!293485 (= e!185574 e!185573)))

(declare-fun res!154385 () Bool)

(assert (=> b!293485 (= res!154385 (and ((_ is Intermediate!2205) lt!145477) (not (undefined!3017 lt!145477)) (bvslt (x!29170 lt!145477) #b01111111111111111111111111111110) (bvsge (x!29170 lt!145477) #b00000000000000000000000000000000) (bvsge (x!29170 lt!145477) #b00000000000000000000000000000000)))))

(assert (=> b!293485 (=> (not res!154385) (not e!185573))))

(declare-fun d!66567 () Bool)

(assert (=> d!66567 e!185574))

(declare-fun c!47116 () Bool)

(assert (=> d!66567 (= c!47116 (and ((_ is Intermediate!2205) lt!145477) (undefined!3017 lt!145477)))))

(assert (=> d!66567 (= lt!145477 e!185572)))

(declare-fun c!47117 () Bool)

(assert (=> d!66567 (= c!47117 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145476 () (_ BitVec 64))

(assert (=> d!66567 (= lt!145476 (select (arr!7056 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312))) lt!145454))))

(assert (=> d!66567 (validMask!0 mask!3809)))

(assert (=> d!66567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145454 k0!2524 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312)) mask!3809) lt!145477)))

(declare-fun b!293486 () Bool)

(assert (=> b!293486 (and (bvsge (index!10992 lt!145477) #b00000000000000000000000000000000) (bvslt (index!10992 lt!145477) (size!7408 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312)))))))

(declare-fun res!154386 () Bool)

(assert (=> b!293486 (= res!154386 (= (select (arr!7056 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312))) (index!10992 lt!145477)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293486 (=> res!154386 e!185575)))

(declare-fun b!293487 () Bool)

(declare-fun e!185576 () SeekEntryResult!2205)

(assert (=> b!293487 (= e!185572 e!185576)))

(declare-fun c!47118 () Bool)

(assert (=> b!293487 (= c!47118 (or (= lt!145476 k0!2524) (= (bvadd lt!145476 lt!145476) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293488 () Bool)

(assert (=> b!293488 (= e!185576 (Intermediate!2205 false lt!145454 #b00000000000000000000000000000000))))

(declare-fun b!293489 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293489 (= e!185576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145454 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14871 (store (arr!7056 a!3312) i!1256 k0!2524) (size!7408 a!3312)) mask!3809))))

(assert (= (and d!66567 c!47117) b!293481))

(assert (= (and d!66567 (not c!47117)) b!293487))

(assert (= (and b!293487 c!47118) b!293488))

(assert (= (and b!293487 (not c!47118)) b!293489))

(assert (= (and d!66567 c!47116) b!293484))

(assert (= (and d!66567 (not c!47116)) b!293485))

(assert (= (and b!293485 res!154385) b!293482))

(assert (= (and b!293482 (not res!154384)) b!293486))

(assert (= (and b!293486 (not res!154386)) b!293483))

(declare-fun m!307189 () Bool)

(assert (=> d!66567 m!307189))

(assert (=> d!66567 m!307145))

(declare-fun m!307191 () Bool)

(assert (=> b!293482 m!307191))

(assert (=> b!293483 m!307191))

(assert (=> b!293486 m!307191))

(declare-fun m!307193 () Bool)

(assert (=> b!293489 m!307193))

(assert (=> b!293489 m!307193))

(declare-fun m!307195 () Bool)

(assert (=> b!293489 m!307195))

(assert (=> b!293438 d!66567))

(declare-fun b!293490 () Bool)

(declare-fun e!185577 () SeekEntryResult!2205)

(assert (=> b!293490 (= e!185577 (Intermediate!2205 true lt!145454 #b00000000000000000000000000000000))))

(declare-fun b!293491 () Bool)

(declare-fun lt!145479 () SeekEntryResult!2205)

(assert (=> b!293491 (and (bvsge (index!10992 lt!145479) #b00000000000000000000000000000000) (bvslt (index!10992 lt!145479) (size!7408 a!3312)))))

(declare-fun res!154387 () Bool)

(assert (=> b!293491 (= res!154387 (= (select (arr!7056 a!3312) (index!10992 lt!145479)) k0!2524))))

(declare-fun e!185580 () Bool)

(assert (=> b!293491 (=> res!154387 e!185580)))

(declare-fun e!185578 () Bool)

(assert (=> b!293491 (= e!185578 e!185580)))

(declare-fun b!293492 () Bool)

(assert (=> b!293492 (and (bvsge (index!10992 lt!145479) #b00000000000000000000000000000000) (bvslt (index!10992 lt!145479) (size!7408 a!3312)))))

(assert (=> b!293492 (= e!185580 (= (select (arr!7056 a!3312) (index!10992 lt!145479)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293493 () Bool)

(declare-fun e!185579 () Bool)

(assert (=> b!293493 (= e!185579 (bvsge (x!29170 lt!145479) #b01111111111111111111111111111110))))

(declare-fun b!293494 () Bool)

(assert (=> b!293494 (= e!185579 e!185578)))

(declare-fun res!154388 () Bool)

(assert (=> b!293494 (= res!154388 (and ((_ is Intermediate!2205) lt!145479) (not (undefined!3017 lt!145479)) (bvslt (x!29170 lt!145479) #b01111111111111111111111111111110) (bvsge (x!29170 lt!145479) #b00000000000000000000000000000000) (bvsge (x!29170 lt!145479) #b00000000000000000000000000000000)))))

(assert (=> b!293494 (=> (not res!154388) (not e!185578))))

(declare-fun d!66575 () Bool)

(assert (=> d!66575 e!185579))

(declare-fun c!47119 () Bool)

(assert (=> d!66575 (= c!47119 (and ((_ is Intermediate!2205) lt!145479) (undefined!3017 lt!145479)))))

(assert (=> d!66575 (= lt!145479 e!185577)))

(declare-fun c!47120 () Bool)

(assert (=> d!66575 (= c!47120 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145478 () (_ BitVec 64))

(assert (=> d!66575 (= lt!145478 (select (arr!7056 a!3312) lt!145454))))

(assert (=> d!66575 (validMask!0 mask!3809)))

(assert (=> d!66575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145454 k0!2524 a!3312 mask!3809) lt!145479)))

(declare-fun b!293495 () Bool)

(assert (=> b!293495 (and (bvsge (index!10992 lt!145479) #b00000000000000000000000000000000) (bvslt (index!10992 lt!145479) (size!7408 a!3312)))))

(declare-fun res!154389 () Bool)

(assert (=> b!293495 (= res!154389 (= (select (arr!7056 a!3312) (index!10992 lt!145479)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293495 (=> res!154389 e!185580)))

(declare-fun b!293496 () Bool)

(declare-fun e!185581 () SeekEntryResult!2205)

(assert (=> b!293496 (= e!185577 e!185581)))

(declare-fun c!47121 () Bool)

(assert (=> b!293496 (= c!47121 (or (= lt!145478 k0!2524) (= (bvadd lt!145478 lt!145478) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293497 () Bool)

(assert (=> b!293497 (= e!185581 (Intermediate!2205 false lt!145454 #b00000000000000000000000000000000))))

(declare-fun b!293498 () Bool)

(assert (=> b!293498 (= e!185581 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145454 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66575 c!47120) b!293490))

(assert (= (and d!66575 (not c!47120)) b!293496))

(assert (= (and b!293496 c!47121) b!293497))

(assert (= (and b!293496 (not c!47121)) b!293498))

(assert (= (and d!66575 c!47119) b!293493))

(assert (= (and d!66575 (not c!47119)) b!293494))

(assert (= (and b!293494 res!154388) b!293491))

(assert (= (and b!293491 (not res!154387)) b!293495))

(assert (= (and b!293495 (not res!154389)) b!293492))

(declare-fun m!307197 () Bool)

(assert (=> d!66575 m!307197))

(assert (=> d!66575 m!307145))

(declare-fun m!307199 () Bool)

(assert (=> b!293491 m!307199))

(assert (=> b!293492 m!307199))

(assert (=> b!293495 m!307199))

(assert (=> b!293498 m!307193))

(assert (=> b!293498 m!307193))

(declare-fun m!307201 () Bool)

(assert (=> b!293498 m!307201))

(assert (=> b!293438 d!66575))

(declare-fun d!66577 () Bool)

(declare-fun lt!145491 () (_ BitVec 32))

(declare-fun lt!145490 () (_ BitVec 32))

(assert (=> d!66577 (= lt!145491 (bvmul (bvxor lt!145490 (bvlshr lt!145490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66577 (= lt!145490 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66577 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154390 (let ((h!5271 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29173 (bvmul (bvxor h!5271 (bvlshr h!5271 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29173 (bvlshr x!29173 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154390 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154390 #b00000000000000000000000000000000))))))

(assert (=> d!66577 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145491 (bvlshr lt!145491 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293438 d!66577))

(declare-fun b!293519 () Bool)

(declare-fun e!185597 () Bool)

(declare-fun e!185599 () Bool)

(assert (=> b!293519 (= e!185597 e!185599)))

(declare-fun c!47127 () Bool)

(assert (=> b!293519 (= c!47127 (validKeyInArray!0 (select (arr!7056 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!293520 () Bool)

(declare-fun e!185598 () Bool)

(assert (=> b!293520 (= e!185599 e!185598)))

(declare-fun lt!145503 () (_ BitVec 64))

(assert (=> b!293520 (= lt!145503 (select (arr!7056 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9184 0))(
  ( (Unit!9185) )
))
(declare-fun lt!145502 () Unit!9184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14870 (_ BitVec 64) (_ BitVec 32)) Unit!9184)

(assert (=> b!293520 (= lt!145502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145503 #b00000000000000000000000000000000))))

(assert (=> b!293520 (arrayContainsKey!0 a!3312 lt!145503 #b00000000000000000000000000000000)))

(declare-fun lt!145501 () Unit!9184)

(assert (=> b!293520 (= lt!145501 lt!145502)))

(declare-fun res!154401 () Bool)

(assert (=> b!293520 (= res!154401 (= (seekEntryOrOpen!0 (select (arr!7056 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2205 #b00000000000000000000000000000000)))))

(assert (=> b!293520 (=> (not res!154401) (not e!185598))))

(declare-fun b!293521 () Bool)

(declare-fun call!25675 () Bool)

(assert (=> b!293521 (= e!185598 call!25675)))

(declare-fun b!293522 () Bool)

(assert (=> b!293522 (= e!185599 call!25675)))

(declare-fun d!66579 () Bool)

(declare-fun res!154402 () Bool)

(assert (=> d!66579 (=> res!154402 e!185597)))

(assert (=> d!66579 (= res!154402 (bvsge #b00000000000000000000000000000000 (size!7408 a!3312)))))

(assert (=> d!66579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185597)))

(declare-fun bm!25672 () Bool)

(assert (=> bm!25672 (= call!25675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66579 (not res!154402)) b!293519))

(assert (= (and b!293519 c!47127) b!293520))

(assert (= (and b!293519 (not c!47127)) b!293522))

(assert (= (and b!293520 res!154401) b!293521))

(assert (= (or b!293521 b!293522) bm!25672))

(declare-fun m!307215 () Bool)

(assert (=> b!293519 m!307215))

(assert (=> b!293519 m!307215))

(declare-fun m!307217 () Bool)

(assert (=> b!293519 m!307217))

(assert (=> b!293520 m!307215))

(declare-fun m!307219 () Bool)

(assert (=> b!293520 m!307219))

(declare-fun m!307221 () Bool)

(assert (=> b!293520 m!307221))

(assert (=> b!293520 m!307215))

(declare-fun m!307223 () Bool)

(assert (=> b!293520 m!307223))

(declare-fun m!307225 () Bool)

(assert (=> bm!25672 m!307225))

(assert (=> b!293437 d!66579))

(declare-fun d!66589 () Bool)

(assert (=> d!66589 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293433 d!66589))

(declare-fun d!66591 () Bool)

(declare-fun res!154407 () Bool)

(declare-fun e!185604 () Bool)

(assert (=> d!66591 (=> res!154407 e!185604)))

(assert (=> d!66591 (= res!154407 (= (select (arr!7056 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66591 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185604)))

(declare-fun b!293527 () Bool)

(declare-fun e!185605 () Bool)

(assert (=> b!293527 (= e!185604 e!185605)))

(declare-fun res!154408 () Bool)

(assert (=> b!293527 (=> (not res!154408) (not e!185605))))

(assert (=> b!293527 (= res!154408 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7408 a!3312)))))

(declare-fun b!293528 () Bool)

(assert (=> b!293528 (= e!185605 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66591 (not res!154407)) b!293527))

(assert (= (and b!293527 res!154408) b!293528))

(assert (=> d!66591 m!307215))

(declare-fun m!307227 () Bool)

(assert (=> b!293528 m!307227))

(assert (=> b!293435 d!66591))

(declare-fun d!66593 () Bool)

(assert (=> d!66593 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28736 d!66593))

(declare-fun d!66597 () Bool)

(assert (=> d!66597 (= (array_inv!5019 a!3312) (bvsge (size!7408 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28736 d!66597))

(declare-fun b!293631 () Bool)

(declare-fun lt!145548 () SeekEntryResult!2205)

(declare-fun e!185667 () SeekEntryResult!2205)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14870 (_ BitVec 32)) SeekEntryResult!2205)

(assert (=> b!293631 (= e!185667 (seekKeyOrZeroReturnVacant!0 (x!29170 lt!145548) (index!10992 lt!145548) (index!10992 lt!145548) k0!2524 a!3312 mask!3809))))

(declare-fun b!293632 () Bool)

(declare-fun e!185669 () SeekEntryResult!2205)

(declare-fun e!185668 () SeekEntryResult!2205)

(assert (=> b!293632 (= e!185669 e!185668)))

(declare-fun lt!145547 () (_ BitVec 64))

(assert (=> b!293632 (= lt!145547 (select (arr!7056 a!3312) (index!10992 lt!145548)))))

(declare-fun c!47162 () Bool)

(assert (=> b!293632 (= c!47162 (= lt!145547 k0!2524))))

(declare-fun b!293633 () Bool)

(assert (=> b!293633 (= e!185667 (MissingZero!2205 (index!10992 lt!145548)))))

(declare-fun b!293634 () Bool)

(assert (=> b!293634 (= e!185668 (Found!2205 (index!10992 lt!145548)))))

(declare-fun d!66599 () Bool)

(declare-fun lt!145549 () SeekEntryResult!2205)

(assert (=> d!66599 (and (or ((_ is Undefined!2205) lt!145549) (not ((_ is Found!2205) lt!145549)) (and (bvsge (index!10991 lt!145549) #b00000000000000000000000000000000) (bvslt (index!10991 lt!145549) (size!7408 a!3312)))) (or ((_ is Undefined!2205) lt!145549) ((_ is Found!2205) lt!145549) (not ((_ is MissingZero!2205) lt!145549)) (and (bvsge (index!10990 lt!145549) #b00000000000000000000000000000000) (bvslt (index!10990 lt!145549) (size!7408 a!3312)))) (or ((_ is Undefined!2205) lt!145549) ((_ is Found!2205) lt!145549) ((_ is MissingZero!2205) lt!145549) (not ((_ is MissingVacant!2205) lt!145549)) (and (bvsge (index!10993 lt!145549) #b00000000000000000000000000000000) (bvslt (index!10993 lt!145549) (size!7408 a!3312)))) (or ((_ is Undefined!2205) lt!145549) (ite ((_ is Found!2205) lt!145549) (= (select (arr!7056 a!3312) (index!10991 lt!145549)) k0!2524) (ite ((_ is MissingZero!2205) lt!145549) (= (select (arr!7056 a!3312) (index!10990 lt!145549)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2205) lt!145549) (= (select (arr!7056 a!3312) (index!10993 lt!145549)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66599 (= lt!145549 e!185669)))

(declare-fun c!47161 () Bool)

(assert (=> d!66599 (= c!47161 (and ((_ is Intermediate!2205) lt!145548) (undefined!3017 lt!145548)))))

(assert (=> d!66599 (= lt!145548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66599 (validMask!0 mask!3809)))

(assert (=> d!66599 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145549)))

(declare-fun b!293635 () Bool)

(declare-fun c!47163 () Bool)

(assert (=> b!293635 (= c!47163 (= lt!145547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293635 (= e!185668 e!185667)))

(declare-fun b!293636 () Bool)

(assert (=> b!293636 (= e!185669 Undefined!2205)))

(assert (= (and d!66599 c!47161) b!293636))

(assert (= (and d!66599 (not c!47161)) b!293632))

(assert (= (and b!293632 c!47162) b!293634))

(assert (= (and b!293632 (not c!47162)) b!293635))

(assert (= (and b!293635 c!47163) b!293633))

(assert (= (and b!293635 (not c!47163)) b!293631))

(declare-fun m!307269 () Bool)

(assert (=> b!293631 m!307269))

(declare-fun m!307271 () Bool)

(assert (=> b!293632 m!307271))

(assert (=> d!66599 m!307163))

(assert (=> d!66599 m!307163))

(declare-fun m!307273 () Bool)

(assert (=> d!66599 m!307273))

(declare-fun m!307275 () Bool)

(assert (=> d!66599 m!307275))

(assert (=> d!66599 m!307145))

(declare-fun m!307277 () Bool)

(assert (=> d!66599 m!307277))

(declare-fun m!307279 () Bool)

(assert (=> d!66599 m!307279))

(assert (=> b!293436 d!66599))

(check-sat (not b!293489) (not b!293631) (not bm!25672) (not b!293528) (not d!66575) (not d!66599) (not b!293519) (not b!293498) (not d!66567) (not b!293520))
(check-sat)
