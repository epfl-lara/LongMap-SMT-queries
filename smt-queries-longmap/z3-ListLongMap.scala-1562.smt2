; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29698 () Bool)

(assert start!29698)

(declare-fun b!299326 () Bool)

(declare-fun res!157787 () Bool)

(declare-fun e!189056 () Bool)

(assert (=> b!299326 (=> (not res!157787) (not e!189056))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15118 0))(
  ( (array!15119 (arr!7158 (Array (_ BitVec 32) (_ BitVec 64))) (size!7511 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15118)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!299326 (= res!157787 (and (= (size!7511 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7511 a!3312))))))

(declare-fun b!299327 () Bool)

(declare-fun res!157790 () Bool)

(declare-fun e!189055 () Bool)

(assert (=> b!299327 (=> (not res!157790) (not e!189055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15118 (_ BitVec 32)) Bool)

(assert (=> b!299327 (= res!157790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299328 () Bool)

(declare-fun res!157788 () Bool)

(assert (=> b!299328 (=> (not res!157788) (not e!189056))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299328 (= res!157788 (validKeyInArray!0 k0!2524))))

(declare-fun b!299329 () Bool)

(assert (=> b!299329 (= e!189056 e!189055)))

(declare-fun res!157789 () Bool)

(assert (=> b!299329 (=> (not res!157789) (not e!189055))))

(declare-fun lt!148760 () Bool)

(declare-datatypes ((SeekEntryResult!2306 0))(
  ( (MissingZero!2306 (index!11400 (_ BitVec 32))) (Found!2306 (index!11401 (_ BitVec 32))) (Intermediate!2306 (undefined!3118 Bool) (index!11402 (_ BitVec 32)) (x!29661 (_ BitVec 32))) (Undefined!2306) (MissingVacant!2306 (index!11403 (_ BitVec 32))) )
))
(declare-fun lt!148763 () SeekEntryResult!2306)

(assert (=> b!299329 (= res!157789 (or lt!148760 (= lt!148763 (MissingVacant!2306 i!1256))))))

(assert (=> b!299329 (= lt!148760 (= lt!148763 (MissingZero!2306 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15118 (_ BitVec 32)) SeekEntryResult!2306)

(assert (=> b!299329 (= lt!148763 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun lt!148762 () SeekEntryResult!2306)

(declare-fun b!299330 () Bool)

(get-info :version)

(assert (=> b!299330 (= e!189055 (and (not lt!148760) (= lt!148763 (MissingVacant!2306 i!1256)) (let ((bdg!6446 (not ((_ is Intermediate!2306) lt!148762)))) (and (or bdg!6446 (not (undefined!3118 lt!148762))) (or bdg!6446 (not (= (select (arr!7158 a!3312) (index!11402 lt!148762)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6446) (or (bvslt (index!11402 lt!148762) #b00000000000000000000000000000000) (bvsge (index!11402 lt!148762) (size!7511 a!3312)))))))))

(declare-fun lt!148761 () SeekEntryResult!2306)

(declare-fun lt!148759 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15118 (_ BitVec 32)) SeekEntryResult!2306)

(assert (=> b!299330 (= lt!148761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148759 k0!2524 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312)) mask!3809))))

(assert (=> b!299330 (= lt!148762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148759 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299330 (= lt!148759 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!157791 () Bool)

(assert (=> start!29698 (=> (not res!157791) (not e!189056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29698 (= res!157791 (validMask!0 mask!3809))))

(assert (=> start!29698 e!189056))

(assert (=> start!29698 true))

(declare-fun array_inv!5130 (array!15118) Bool)

(assert (=> start!29698 (array_inv!5130 a!3312)))

(declare-fun b!299331 () Bool)

(declare-fun res!157786 () Bool)

(assert (=> b!299331 (=> (not res!157786) (not e!189056))))

(declare-fun arrayContainsKey!0 (array!15118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299331 (= res!157786 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29698 res!157791) b!299326))

(assert (= (and b!299326 res!157787) b!299328))

(assert (= (and b!299328 res!157788) b!299331))

(assert (= (and b!299331 res!157786) b!299329))

(assert (= (and b!299329 res!157789) b!299327))

(assert (= (and b!299327 res!157790) b!299330))

(declare-fun m!311071 () Bool)

(assert (=> b!299328 m!311071))

(declare-fun m!311073 () Bool)

(assert (=> b!299330 m!311073))

(declare-fun m!311075 () Bool)

(assert (=> b!299330 m!311075))

(declare-fun m!311077 () Bool)

(assert (=> b!299330 m!311077))

(declare-fun m!311079 () Bool)

(assert (=> b!299330 m!311079))

(declare-fun m!311081 () Bool)

(assert (=> b!299330 m!311081))

(declare-fun m!311083 () Bool)

(assert (=> start!29698 m!311083))

(declare-fun m!311085 () Bool)

(assert (=> start!29698 m!311085))

(declare-fun m!311087 () Bool)

(assert (=> b!299329 m!311087))

(declare-fun m!311089 () Bool)

(assert (=> b!299331 m!311089))

(declare-fun m!311091 () Bool)

(assert (=> b!299327 m!311091))

(check-sat (not b!299328) (not b!299330) (not b!299329) (not start!29698) (not b!299331) (not b!299327))
(check-sat)
(get-model)

(declare-fun d!67389 () Bool)

(declare-fun res!157832 () Bool)

(declare-fun e!189079 () Bool)

(assert (=> d!67389 (=> res!157832 e!189079)))

(assert (=> d!67389 (= res!157832 (= (select (arr!7158 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67389 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189079)))

(declare-fun b!299372 () Bool)

(declare-fun e!189080 () Bool)

(assert (=> b!299372 (= e!189079 e!189080)))

(declare-fun res!157833 () Bool)

(assert (=> b!299372 (=> (not res!157833) (not e!189080))))

(assert (=> b!299372 (= res!157833 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7511 a!3312)))))

(declare-fun b!299373 () Bool)

(assert (=> b!299373 (= e!189080 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67389 (not res!157832)) b!299372))

(assert (= (and b!299372 res!157833) b!299373))

(declare-fun m!311137 () Bool)

(assert (=> d!67389 m!311137))

(declare-fun m!311139 () Bool)

(assert (=> b!299373 m!311139))

(assert (=> b!299331 d!67389))

(declare-fun d!67391 () Bool)

(assert (=> d!67391 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29698 d!67391))

(declare-fun d!67393 () Bool)

(assert (=> d!67393 (= (array_inv!5130 a!3312) (bvsge (size!7511 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29698 d!67393))

(declare-fun b!299404 () Bool)

(declare-fun e!189101 () Bool)

(declare-fun e!189103 () Bool)

(assert (=> b!299404 (= e!189101 e!189103)))

(declare-fun res!157846 () Bool)

(declare-fun lt!148808 () SeekEntryResult!2306)

(assert (=> b!299404 (= res!157846 (and ((_ is Intermediate!2306) lt!148808) (not (undefined!3118 lt!148808)) (bvslt (x!29661 lt!148808) #b01111111111111111111111111111110) (bvsge (x!29661 lt!148808) #b00000000000000000000000000000000) (bvsge (x!29661 lt!148808) #b00000000000000000000000000000000)))))

(assert (=> b!299404 (=> (not res!157846) (not e!189103))))

(declare-fun d!67395 () Bool)

(assert (=> d!67395 e!189101))

(declare-fun c!48371 () Bool)

(assert (=> d!67395 (= c!48371 (and ((_ is Intermediate!2306) lt!148808) (undefined!3118 lt!148808)))))

(declare-fun e!189102 () SeekEntryResult!2306)

(assert (=> d!67395 (= lt!148808 e!189102)))

(declare-fun c!48370 () Bool)

(assert (=> d!67395 (= c!48370 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148807 () (_ BitVec 64))

(assert (=> d!67395 (= lt!148807 (select (arr!7158 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312))) lt!148759))))

(assert (=> d!67395 (validMask!0 mask!3809)))

(assert (=> d!67395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148759 k0!2524 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312)) mask!3809) lt!148808)))

(declare-fun b!299405 () Bool)

(assert (=> b!299405 (and (bvsge (index!11402 lt!148808) #b00000000000000000000000000000000) (bvslt (index!11402 lt!148808) (size!7511 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312)))))))

(declare-fun res!157848 () Bool)

(assert (=> b!299405 (= res!157848 (= (select (arr!7158 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312))) (index!11402 lt!148808)) k0!2524))))

(declare-fun e!189100 () Bool)

(assert (=> b!299405 (=> res!157848 e!189100)))

(assert (=> b!299405 (= e!189103 e!189100)))

(declare-fun b!299406 () Bool)

(assert (=> b!299406 (and (bvsge (index!11402 lt!148808) #b00000000000000000000000000000000) (bvslt (index!11402 lt!148808) (size!7511 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312)))))))

(assert (=> b!299406 (= e!189100 (= (select (arr!7158 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312))) (index!11402 lt!148808)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299407 () Bool)

(declare-fun e!189104 () SeekEntryResult!2306)

(assert (=> b!299407 (= e!189104 (Intermediate!2306 false lt!148759 #b00000000000000000000000000000000))))

(declare-fun b!299408 () Bool)

(assert (=> b!299408 (= e!189101 (bvsge (x!29661 lt!148808) #b01111111111111111111111111111110))))

(declare-fun b!299409 () Bool)

(assert (=> b!299409 (and (bvsge (index!11402 lt!148808) #b00000000000000000000000000000000) (bvslt (index!11402 lt!148808) (size!7511 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312)))))))

(declare-fun res!157847 () Bool)

(assert (=> b!299409 (= res!157847 (= (select (arr!7158 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312))) (index!11402 lt!148808)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299409 (=> res!157847 e!189100)))

(declare-fun b!299410 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299410 (= e!189104 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148759 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15119 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7511 a!3312)) mask!3809))))

(declare-fun b!299411 () Bool)

(assert (=> b!299411 (= e!189102 (Intermediate!2306 true lt!148759 #b00000000000000000000000000000000))))

(declare-fun b!299412 () Bool)

(assert (=> b!299412 (= e!189102 e!189104)))

(declare-fun c!48369 () Bool)

(assert (=> b!299412 (= c!48369 (or (= lt!148807 k0!2524) (= (bvadd lt!148807 lt!148807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67395 c!48370) b!299411))

(assert (= (and d!67395 (not c!48370)) b!299412))

(assert (= (and b!299412 c!48369) b!299407))

(assert (= (and b!299412 (not c!48369)) b!299410))

(assert (= (and d!67395 c!48371) b!299408))

(assert (= (and d!67395 (not c!48371)) b!299404))

(assert (= (and b!299404 res!157846) b!299405))

(assert (= (and b!299405 (not res!157848)) b!299409))

(assert (= (and b!299409 (not res!157847)) b!299406))

(declare-fun m!311153 () Bool)

(assert (=> d!67395 m!311153))

(assert (=> d!67395 m!311083))

(declare-fun m!311155 () Bool)

(assert (=> b!299410 m!311155))

(assert (=> b!299410 m!311155))

(declare-fun m!311157 () Bool)

(assert (=> b!299410 m!311157))

(declare-fun m!311159 () Bool)

(assert (=> b!299405 m!311159))

(assert (=> b!299409 m!311159))

(assert (=> b!299406 m!311159))

(assert (=> b!299330 d!67395))

(declare-fun b!299413 () Bool)

(declare-fun e!189106 () Bool)

(declare-fun e!189108 () Bool)

(assert (=> b!299413 (= e!189106 e!189108)))

(declare-fun res!157849 () Bool)

(declare-fun lt!148810 () SeekEntryResult!2306)

(assert (=> b!299413 (= res!157849 (and ((_ is Intermediate!2306) lt!148810) (not (undefined!3118 lt!148810)) (bvslt (x!29661 lt!148810) #b01111111111111111111111111111110) (bvsge (x!29661 lt!148810) #b00000000000000000000000000000000) (bvsge (x!29661 lt!148810) #b00000000000000000000000000000000)))))

(assert (=> b!299413 (=> (not res!157849) (not e!189108))))

(declare-fun d!67405 () Bool)

(assert (=> d!67405 e!189106))

(declare-fun c!48374 () Bool)

(assert (=> d!67405 (= c!48374 (and ((_ is Intermediate!2306) lt!148810) (undefined!3118 lt!148810)))))

(declare-fun e!189107 () SeekEntryResult!2306)

(assert (=> d!67405 (= lt!148810 e!189107)))

(declare-fun c!48373 () Bool)

(assert (=> d!67405 (= c!48373 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148809 () (_ BitVec 64))

(assert (=> d!67405 (= lt!148809 (select (arr!7158 a!3312) lt!148759))))

(assert (=> d!67405 (validMask!0 mask!3809)))

(assert (=> d!67405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148759 k0!2524 a!3312 mask!3809) lt!148810)))

(declare-fun b!299414 () Bool)

(assert (=> b!299414 (and (bvsge (index!11402 lt!148810) #b00000000000000000000000000000000) (bvslt (index!11402 lt!148810) (size!7511 a!3312)))))

(declare-fun res!157851 () Bool)

(assert (=> b!299414 (= res!157851 (= (select (arr!7158 a!3312) (index!11402 lt!148810)) k0!2524))))

(declare-fun e!189105 () Bool)

(assert (=> b!299414 (=> res!157851 e!189105)))

(assert (=> b!299414 (= e!189108 e!189105)))

(declare-fun b!299415 () Bool)

(assert (=> b!299415 (and (bvsge (index!11402 lt!148810) #b00000000000000000000000000000000) (bvslt (index!11402 lt!148810) (size!7511 a!3312)))))

(assert (=> b!299415 (= e!189105 (= (select (arr!7158 a!3312) (index!11402 lt!148810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299416 () Bool)

(declare-fun e!189109 () SeekEntryResult!2306)

(assert (=> b!299416 (= e!189109 (Intermediate!2306 false lt!148759 #b00000000000000000000000000000000))))

(declare-fun b!299417 () Bool)

(assert (=> b!299417 (= e!189106 (bvsge (x!29661 lt!148810) #b01111111111111111111111111111110))))

(declare-fun b!299418 () Bool)

(assert (=> b!299418 (and (bvsge (index!11402 lt!148810) #b00000000000000000000000000000000) (bvslt (index!11402 lt!148810) (size!7511 a!3312)))))

(declare-fun res!157850 () Bool)

(assert (=> b!299418 (= res!157850 (= (select (arr!7158 a!3312) (index!11402 lt!148810)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299418 (=> res!157850 e!189105)))

(declare-fun b!299419 () Bool)

(assert (=> b!299419 (= e!189109 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148759 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299420 () Bool)

(assert (=> b!299420 (= e!189107 (Intermediate!2306 true lt!148759 #b00000000000000000000000000000000))))

(declare-fun b!299421 () Bool)

(assert (=> b!299421 (= e!189107 e!189109)))

(declare-fun c!48372 () Bool)

(assert (=> b!299421 (= c!48372 (or (= lt!148809 k0!2524) (= (bvadd lt!148809 lt!148809) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67405 c!48373) b!299420))

(assert (= (and d!67405 (not c!48373)) b!299421))

(assert (= (and b!299421 c!48372) b!299416))

(assert (= (and b!299421 (not c!48372)) b!299419))

(assert (= (and d!67405 c!48374) b!299417))

(assert (= (and d!67405 (not c!48374)) b!299413))

(assert (= (and b!299413 res!157849) b!299414))

(assert (= (and b!299414 (not res!157851)) b!299418))

(assert (= (and b!299418 (not res!157850)) b!299415))

(declare-fun m!311161 () Bool)

(assert (=> d!67405 m!311161))

(assert (=> d!67405 m!311083))

(assert (=> b!299419 m!311155))

(assert (=> b!299419 m!311155))

(declare-fun m!311163 () Bool)

(assert (=> b!299419 m!311163))

(declare-fun m!311165 () Bool)

(assert (=> b!299414 m!311165))

(assert (=> b!299418 m!311165))

(assert (=> b!299415 m!311165))

(assert (=> b!299330 d!67405))

(declare-fun d!67407 () Bool)

(declare-fun lt!148826 () (_ BitVec 32))

(declare-fun lt!148825 () (_ BitVec 32))

(assert (=> d!67407 (= lt!148826 (bvmul (bvxor lt!148825 (bvlshr lt!148825 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67407 (= lt!148825 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67407 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157852 (let ((h!5284 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29665 (bvmul (bvxor h!5284 (bvlshr h!5284 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29665 (bvlshr x!29665 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157852 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157852 #b00000000000000000000000000000000))))))

(assert (=> d!67407 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148826 (bvlshr lt!148826 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299330 d!67407))

(declare-fun e!189162 () SeekEntryResult!2306)

(declare-fun lt!148858 () SeekEntryResult!2306)

(declare-fun b!299519 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15118 (_ BitVec 32)) SeekEntryResult!2306)

(assert (=> b!299519 (= e!189162 (seekKeyOrZeroReturnVacant!0 (x!29661 lt!148858) (index!11402 lt!148858) (index!11402 lt!148858) k0!2524 a!3312 mask!3809))))

(declare-fun b!299520 () Bool)

(declare-fun c!48412 () Bool)

(declare-fun lt!148859 () (_ BitVec 64))

(assert (=> b!299520 (= c!48412 (= lt!148859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189164 () SeekEntryResult!2306)

(assert (=> b!299520 (= e!189164 e!189162)))

(declare-fun b!299521 () Bool)

(declare-fun e!189163 () SeekEntryResult!2306)

(assert (=> b!299521 (= e!189163 e!189164)))

(assert (=> b!299521 (= lt!148859 (select (arr!7158 a!3312) (index!11402 lt!148858)))))

(declare-fun c!48411 () Bool)

(assert (=> b!299521 (= c!48411 (= lt!148859 k0!2524))))

(declare-fun b!299522 () Bool)

(assert (=> b!299522 (= e!189162 (MissingZero!2306 (index!11402 lt!148858)))))

(declare-fun b!299523 () Bool)

(assert (=> b!299523 (= e!189164 (Found!2306 (index!11402 lt!148858)))))

(declare-fun b!299518 () Bool)

(assert (=> b!299518 (= e!189163 Undefined!2306)))

(declare-fun d!67411 () Bool)

(declare-fun lt!148857 () SeekEntryResult!2306)

(assert (=> d!67411 (and (or ((_ is Undefined!2306) lt!148857) (not ((_ is Found!2306) lt!148857)) (and (bvsge (index!11401 lt!148857) #b00000000000000000000000000000000) (bvslt (index!11401 lt!148857) (size!7511 a!3312)))) (or ((_ is Undefined!2306) lt!148857) ((_ is Found!2306) lt!148857) (not ((_ is MissingZero!2306) lt!148857)) (and (bvsge (index!11400 lt!148857) #b00000000000000000000000000000000) (bvslt (index!11400 lt!148857) (size!7511 a!3312)))) (or ((_ is Undefined!2306) lt!148857) ((_ is Found!2306) lt!148857) ((_ is MissingZero!2306) lt!148857) (not ((_ is MissingVacant!2306) lt!148857)) (and (bvsge (index!11403 lt!148857) #b00000000000000000000000000000000) (bvslt (index!11403 lt!148857) (size!7511 a!3312)))) (or ((_ is Undefined!2306) lt!148857) (ite ((_ is Found!2306) lt!148857) (= (select (arr!7158 a!3312) (index!11401 lt!148857)) k0!2524) (ite ((_ is MissingZero!2306) lt!148857) (= (select (arr!7158 a!3312) (index!11400 lt!148857)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2306) lt!148857) (= (select (arr!7158 a!3312) (index!11403 lt!148857)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67411 (= lt!148857 e!189163)))

(declare-fun c!48413 () Bool)

(assert (=> d!67411 (= c!48413 (and ((_ is Intermediate!2306) lt!148858) (undefined!3118 lt!148858)))))

(assert (=> d!67411 (= lt!148858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67411 (validMask!0 mask!3809)))

(assert (=> d!67411 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148857)))

(assert (= (and d!67411 c!48413) b!299518))

(assert (= (and d!67411 (not c!48413)) b!299521))

(assert (= (and b!299521 c!48411) b!299523))

(assert (= (and b!299521 (not c!48411)) b!299520))

(assert (= (and b!299520 c!48412) b!299522))

(assert (= (and b!299520 (not c!48412)) b!299519))

(declare-fun m!311195 () Bool)

(assert (=> b!299519 m!311195))

(declare-fun m!311197 () Bool)

(assert (=> b!299521 m!311197))

(assert (=> d!67411 m!311083))

(assert (=> d!67411 m!311081))

(declare-fun m!311199 () Bool)

(assert (=> d!67411 m!311199))

(declare-fun m!311201 () Bool)

(assert (=> d!67411 m!311201))

(assert (=> d!67411 m!311081))

(declare-fun m!311203 () Bool)

(assert (=> d!67411 m!311203))

(declare-fun m!311205 () Bool)

(assert (=> d!67411 m!311205))

(assert (=> b!299329 d!67411))

(declare-fun d!67433 () Bool)

(assert (=> d!67433 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299328 d!67433))

(declare-fun bm!25805 () Bool)

(declare-fun call!25808 () Bool)

(assert (=> bm!25805 (= call!25808 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299544 () Bool)

(declare-fun e!189180 () Bool)

(declare-fun e!189181 () Bool)

(assert (=> b!299544 (= e!189180 e!189181)))

(declare-fun lt!148869 () (_ BitVec 64))

(assert (=> b!299544 (= lt!148869 (select (arr!7158 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9313 0))(
  ( (Unit!9314) )
))
(declare-fun lt!148871 () Unit!9313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15118 (_ BitVec 64) (_ BitVec 32)) Unit!9313)

(assert (=> b!299544 (= lt!148871 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148869 #b00000000000000000000000000000000))))

(assert (=> b!299544 (arrayContainsKey!0 a!3312 lt!148869 #b00000000000000000000000000000000)))

(declare-fun lt!148870 () Unit!9313)

(assert (=> b!299544 (= lt!148870 lt!148871)))

(declare-fun res!157889 () Bool)

(assert (=> b!299544 (= res!157889 (= (seekEntryOrOpen!0 (select (arr!7158 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2306 #b00000000000000000000000000000000)))))

(assert (=> b!299544 (=> (not res!157889) (not e!189181))))

(declare-fun b!299545 () Bool)

(assert (=> b!299545 (= e!189180 call!25808)))

(declare-fun b!299546 () Bool)

(assert (=> b!299546 (= e!189181 call!25808)))

(declare-fun b!299547 () Bool)

(declare-fun e!189182 () Bool)

(assert (=> b!299547 (= e!189182 e!189180)))

(declare-fun c!48419 () Bool)

(assert (=> b!299547 (= c!48419 (validKeyInArray!0 (select (arr!7158 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67435 () Bool)

(declare-fun res!157890 () Bool)

(assert (=> d!67435 (=> res!157890 e!189182)))

(assert (=> d!67435 (= res!157890 (bvsge #b00000000000000000000000000000000 (size!7511 a!3312)))))

(assert (=> d!67435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189182)))

(assert (= (and d!67435 (not res!157890)) b!299547))

(assert (= (and b!299547 c!48419) b!299544))

(assert (= (and b!299547 (not c!48419)) b!299545))

(assert (= (and b!299544 res!157889) b!299546))

(assert (= (or b!299546 b!299545) bm!25805))

(declare-fun m!311221 () Bool)

(assert (=> bm!25805 m!311221))

(assert (=> b!299544 m!311137))

(declare-fun m!311223 () Bool)

(assert (=> b!299544 m!311223))

(declare-fun m!311225 () Bool)

(assert (=> b!299544 m!311225))

(assert (=> b!299544 m!311137))

(declare-fun m!311227 () Bool)

(assert (=> b!299544 m!311227))

(assert (=> b!299547 m!311137))

(assert (=> b!299547 m!311137))

(declare-fun m!311229 () Bool)

(assert (=> b!299547 m!311229))

(assert (=> b!299327 d!67435))

(check-sat (not b!299544) (not b!299419) (not d!67411) (not b!299410) (not b!299373) (not d!67405) (not bm!25805) (not d!67395) (not b!299547) (not b!299519))
(check-sat)
