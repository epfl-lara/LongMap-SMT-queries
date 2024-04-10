; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33084 () Bool)

(assert start!33084)

(declare-fun b!329312 () Bool)

(declare-fun res!181506 () Bool)

(declare-fun e!202306 () Bool)

(assert (=> b!329312 (=> (not res!181506) (not e!202306))))

(declare-datatypes ((array!16845 0))(
  ( (array!16846 (arr!7968 (Array (_ BitVec 32) (_ BitVec 64))) (size!8320 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16845)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16845 (_ BitVec 32)) Bool)

(assert (=> b!329312 (= res!181506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!181499 () Bool)

(assert (=> start!33084 (=> (not res!181499) (not e!202306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33084 (= res!181499 (validMask!0 mask!3777))))

(assert (=> start!33084 e!202306))

(declare-fun array_inv!5931 (array!16845) Bool)

(assert (=> start!33084 (array_inv!5931 a!3305)))

(assert (=> start!33084 true))

(declare-fun b!329313 () Bool)

(declare-fun res!181503 () Bool)

(declare-fun e!202304 () Bool)

(assert (=> b!329313 (=> (not res!181503) (not e!202304))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329313 (= res!181503 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7968 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7968 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7968 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329314 () Bool)

(declare-fun res!181502 () Bool)

(assert (=> b!329314 (=> (not res!181502) (not e!202306))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329314 (= res!181502 (and (= (size!8320 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8320 a!3305))))))

(declare-fun b!329315 () Bool)

(get-info :version)

(declare-datatypes ((SeekEntryResult!3099 0))(
  ( (MissingZero!3099 (index!14572 (_ BitVec 32))) (Found!3099 (index!14573 (_ BitVec 32))) (Intermediate!3099 (undefined!3911 Bool) (index!14574 (_ BitVec 32)) (x!32840 (_ BitVec 32))) (Undefined!3099) (MissingVacant!3099 (index!14575 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16845 (_ BitVec 32)) SeekEntryResult!3099)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329315 (= e!202304 (not ((_ is Intermediate!3099) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))))

(declare-fun b!329316 () Bool)

(declare-fun res!181497 () Bool)

(assert (=> b!329316 (=> (not res!181497) (not e!202306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329316 (= res!181497 (validKeyInArray!0 k0!2497))))

(declare-fun b!329317 () Bool)

(declare-fun res!181505 () Bool)

(assert (=> b!329317 (=> (not res!181505) (not e!202304))))

(assert (=> b!329317 (= res!181505 (and (= (select (arr!7968 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8320 a!3305))))))

(declare-fun b!329318 () Bool)

(declare-fun res!181504 () Bool)

(assert (=> b!329318 (=> (not res!181504) (not e!202304))))

(declare-fun lt!158175 () SeekEntryResult!3099)

(assert (=> b!329318 (= res!181504 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158175))))

(declare-fun b!329319 () Bool)

(declare-fun res!181498 () Bool)

(assert (=> b!329319 (=> (not res!181498) (not e!202306))))

(declare-fun arrayContainsKey!0 (array!16845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329319 (= res!181498 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329320 () Bool)

(declare-fun res!181501 () Bool)

(assert (=> b!329320 (=> (not res!181501) (not e!202306))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16845 (_ BitVec 32)) SeekEntryResult!3099)

(assert (=> b!329320 (= res!181501 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3099 i!1250)))))

(declare-fun b!329321 () Bool)

(assert (=> b!329321 (= e!202306 e!202304)))

(declare-fun res!181500 () Bool)

(assert (=> b!329321 (=> (not res!181500) (not e!202304))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329321 (= res!181500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158175))))

(assert (=> b!329321 (= lt!158175 (Intermediate!3099 false resIndex!58 resX!58))))

(assert (= (and start!33084 res!181499) b!329314))

(assert (= (and b!329314 res!181502) b!329316))

(assert (= (and b!329316 res!181497) b!329319))

(assert (= (and b!329319 res!181498) b!329320))

(assert (= (and b!329320 res!181501) b!329312))

(assert (= (and b!329312 res!181506) b!329321))

(assert (= (and b!329321 res!181500) b!329317))

(assert (= (and b!329317 res!181505) b!329318))

(assert (= (and b!329318 res!181504) b!329313))

(assert (= (and b!329313 res!181503) b!329315))

(declare-fun m!335017 () Bool)

(assert (=> start!33084 m!335017))

(declare-fun m!335019 () Bool)

(assert (=> start!33084 m!335019))

(declare-fun m!335021 () Bool)

(assert (=> b!329319 m!335021))

(declare-fun m!335023 () Bool)

(assert (=> b!329320 m!335023))

(declare-fun m!335025 () Bool)

(assert (=> b!329313 m!335025))

(declare-fun m!335027 () Bool)

(assert (=> b!329317 m!335027))

(declare-fun m!335029 () Bool)

(assert (=> b!329315 m!335029))

(assert (=> b!329315 m!335029))

(declare-fun m!335031 () Bool)

(assert (=> b!329315 m!335031))

(declare-fun m!335033 () Bool)

(assert (=> b!329321 m!335033))

(assert (=> b!329321 m!335033))

(declare-fun m!335035 () Bool)

(assert (=> b!329321 m!335035))

(declare-fun m!335037 () Bool)

(assert (=> b!329318 m!335037))

(declare-fun m!335039 () Bool)

(assert (=> b!329316 m!335039))

(declare-fun m!335041 () Bool)

(assert (=> b!329312 m!335041))

(check-sat (not b!329318) (not b!329320) (not b!329312) (not b!329319) (not b!329316) (not b!329315) (not b!329321) (not start!33084))
(check-sat)
(get-model)

(declare-fun e!202328 () SeekEntryResult!3099)

(declare-fun lt!158185 () SeekEntryResult!3099)

(declare-fun b!329370 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16845 (_ BitVec 32)) SeekEntryResult!3099)

(assert (=> b!329370 (= e!202328 (seekKeyOrZeroReturnVacant!0 (x!32840 lt!158185) (index!14574 lt!158185) (index!14574 lt!158185) k0!2497 a!3305 mask!3777))))

(declare-fun b!329371 () Bool)

(declare-fun e!202330 () SeekEntryResult!3099)

(assert (=> b!329371 (= e!202330 (Found!3099 (index!14574 lt!158185)))))

(declare-fun b!329372 () Bool)

(declare-fun e!202329 () SeekEntryResult!3099)

(assert (=> b!329372 (= e!202329 e!202330)))

(declare-fun lt!158187 () (_ BitVec 64))

(assert (=> b!329372 (= lt!158187 (select (arr!7968 a!3305) (index!14574 lt!158185)))))

(declare-fun c!51553 () Bool)

(assert (=> b!329372 (= c!51553 (= lt!158187 k0!2497))))

(declare-fun d!70151 () Bool)

(declare-fun lt!158186 () SeekEntryResult!3099)

(assert (=> d!70151 (and (or ((_ is Undefined!3099) lt!158186) (not ((_ is Found!3099) lt!158186)) (and (bvsge (index!14573 lt!158186) #b00000000000000000000000000000000) (bvslt (index!14573 lt!158186) (size!8320 a!3305)))) (or ((_ is Undefined!3099) lt!158186) ((_ is Found!3099) lt!158186) (not ((_ is MissingZero!3099) lt!158186)) (and (bvsge (index!14572 lt!158186) #b00000000000000000000000000000000) (bvslt (index!14572 lt!158186) (size!8320 a!3305)))) (or ((_ is Undefined!3099) lt!158186) ((_ is Found!3099) lt!158186) ((_ is MissingZero!3099) lt!158186) (not ((_ is MissingVacant!3099) lt!158186)) (and (bvsge (index!14575 lt!158186) #b00000000000000000000000000000000) (bvslt (index!14575 lt!158186) (size!8320 a!3305)))) (or ((_ is Undefined!3099) lt!158186) (ite ((_ is Found!3099) lt!158186) (= (select (arr!7968 a!3305) (index!14573 lt!158186)) k0!2497) (ite ((_ is MissingZero!3099) lt!158186) (= (select (arr!7968 a!3305) (index!14572 lt!158186)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3099) lt!158186) (= (select (arr!7968 a!3305) (index!14575 lt!158186)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70151 (= lt!158186 e!202329)))

(declare-fun c!51554 () Bool)

(assert (=> d!70151 (= c!51554 (and ((_ is Intermediate!3099) lt!158185) (undefined!3911 lt!158185)))))

(assert (=> d!70151 (= lt!158185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70151 (validMask!0 mask!3777)))

(assert (=> d!70151 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158186)))

(declare-fun b!329373 () Bool)

(assert (=> b!329373 (= e!202329 Undefined!3099)))

(declare-fun b!329374 () Bool)

(declare-fun c!51555 () Bool)

(assert (=> b!329374 (= c!51555 (= lt!158187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329374 (= e!202330 e!202328)))

(declare-fun b!329375 () Bool)

(assert (=> b!329375 (= e!202328 (MissingZero!3099 (index!14574 lt!158185)))))

(assert (= (and d!70151 c!51554) b!329373))

(assert (= (and d!70151 (not c!51554)) b!329372))

(assert (= (and b!329372 c!51553) b!329371))

(assert (= (and b!329372 (not c!51553)) b!329374))

(assert (= (and b!329374 c!51555) b!329375))

(assert (= (and b!329374 (not c!51555)) b!329370))

(declare-fun m!335073 () Bool)

(assert (=> b!329370 m!335073))

(declare-fun m!335075 () Bool)

(assert (=> b!329372 m!335075))

(declare-fun m!335077 () Bool)

(assert (=> d!70151 m!335077))

(assert (=> d!70151 m!335017))

(declare-fun m!335079 () Bool)

(assert (=> d!70151 m!335079))

(assert (=> d!70151 m!335033))

(assert (=> d!70151 m!335035))

(declare-fun m!335081 () Bool)

(assert (=> d!70151 m!335081))

(assert (=> d!70151 m!335033))

(assert (=> b!329320 d!70151))

(declare-fun b!329421 () Bool)

(declare-fun lt!158199 () SeekEntryResult!3099)

(assert (=> b!329421 (and (bvsge (index!14574 lt!158199) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158199) (size!8320 a!3305)))))

(declare-fun res!181559 () Bool)

(assert (=> b!329421 (= res!181559 (= (select (arr!7968 a!3305) (index!14574 lt!158199)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202360 () Bool)

(assert (=> b!329421 (=> res!181559 e!202360)))

(declare-fun d!70159 () Bool)

(declare-fun e!202358 () Bool)

(assert (=> d!70159 e!202358))

(declare-fun c!51571 () Bool)

(assert (=> d!70159 (= c!51571 (and ((_ is Intermediate!3099) lt!158199) (undefined!3911 lt!158199)))))

(declare-fun e!202357 () SeekEntryResult!3099)

(assert (=> d!70159 (= lt!158199 e!202357)))

(declare-fun c!51573 () Bool)

(assert (=> d!70159 (= c!51573 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!158198 () (_ BitVec 64))

(assert (=> d!70159 (= lt!158198 (select (arr!7968 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70159 (validMask!0 mask!3777)))

(assert (=> d!70159 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777) lt!158199)))

(declare-fun b!329422 () Bool)

(assert (=> b!329422 (and (bvsge (index!14574 lt!158199) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158199) (size!8320 a!3305)))))

(declare-fun res!181560 () Bool)

(assert (=> b!329422 (= res!181560 (= (select (arr!7968 a!3305) (index!14574 lt!158199)) k0!2497))))

(assert (=> b!329422 (=> res!181560 e!202360)))

(declare-fun e!202356 () Bool)

(assert (=> b!329422 (= e!202356 e!202360)))

(declare-fun e!202359 () SeekEntryResult!3099)

(declare-fun b!329423 () Bool)

(assert (=> b!329423 (= e!202359 (Intermediate!3099 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329424 () Bool)

(assert (=> b!329424 (= e!202359 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329425 () Bool)

(assert (=> b!329425 (and (bvsge (index!14574 lt!158199) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158199) (size!8320 a!3305)))))

(assert (=> b!329425 (= e!202360 (= (select (arr!7968 a!3305) (index!14574 lt!158199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329426 () Bool)

(assert (=> b!329426 (= e!202357 (Intermediate!3099 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329427 () Bool)

(assert (=> b!329427 (= e!202357 e!202359)))

(declare-fun c!51572 () Bool)

(assert (=> b!329427 (= c!51572 (or (= lt!158198 k0!2497) (= (bvadd lt!158198 lt!158198) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329428 () Bool)

(assert (=> b!329428 (= e!202358 e!202356)))

(declare-fun res!181558 () Bool)

(assert (=> b!329428 (= res!181558 (and ((_ is Intermediate!3099) lt!158199) (not (undefined!3911 lt!158199)) (bvslt (x!32840 lt!158199) #b01111111111111111111111111111110) (bvsge (x!32840 lt!158199) #b00000000000000000000000000000000) (bvsge (x!32840 lt!158199) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329428 (=> (not res!181558) (not e!202356))))

(declare-fun b!329429 () Bool)

(assert (=> b!329429 (= e!202358 (bvsge (x!32840 lt!158199) #b01111111111111111111111111111110))))

(assert (= (and d!70159 c!51573) b!329426))

(assert (= (and d!70159 (not c!51573)) b!329427))

(assert (= (and b!329427 c!51572) b!329423))

(assert (= (and b!329427 (not c!51572)) b!329424))

(assert (= (and d!70159 c!51571) b!329429))

(assert (= (and d!70159 (not c!51571)) b!329428))

(assert (= (and b!329428 res!181558) b!329422))

(assert (= (and b!329422 (not res!181560)) b!329421))

(assert (= (and b!329421 (not res!181559)) b!329425))

(assert (=> d!70159 m!335029))

(declare-fun m!335091 () Bool)

(assert (=> d!70159 m!335091))

(assert (=> d!70159 m!335017))

(declare-fun m!335093 () Bool)

(assert (=> b!329422 m!335093))

(assert (=> b!329425 m!335093))

(assert (=> b!329424 m!335029))

(declare-fun m!335095 () Bool)

(assert (=> b!329424 m!335095))

(assert (=> b!329424 m!335095))

(declare-fun m!335097 () Bool)

(assert (=> b!329424 m!335097))

(assert (=> b!329421 m!335093))

(assert (=> b!329315 d!70159))

(declare-fun d!70167 () Bool)

(declare-fun lt!158209 () (_ BitVec 32))

(assert (=> d!70167 (and (bvsge lt!158209 #b00000000000000000000000000000000) (bvslt lt!158209 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70167 (= lt!158209 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70167 (validMask!0 mask!3777)))

(assert (=> d!70167 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158209)))

(declare-fun bs!11409 () Bool)

(assert (= bs!11409 d!70167))

(declare-fun m!335101 () Bool)

(assert (=> bs!11409 m!335101))

(assert (=> bs!11409 m!335017))

(assert (=> b!329315 d!70167))

(declare-fun b!329444 () Bool)

(declare-fun lt!158211 () SeekEntryResult!3099)

(assert (=> b!329444 (and (bvsge (index!14574 lt!158211) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158211) (size!8320 a!3305)))))

(declare-fun res!181566 () Bool)

(assert (=> b!329444 (= res!181566 (= (select (arr!7968 a!3305) (index!14574 lt!158211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202375 () Bool)

(assert (=> b!329444 (=> res!181566 e!202375)))

(declare-fun d!70171 () Bool)

(declare-fun e!202373 () Bool)

(assert (=> d!70171 e!202373))

(declare-fun c!51580 () Bool)

(assert (=> d!70171 (= c!51580 (and ((_ is Intermediate!3099) lt!158211) (undefined!3911 lt!158211)))))

(declare-fun e!202372 () SeekEntryResult!3099)

(assert (=> d!70171 (= lt!158211 e!202372)))

(declare-fun c!51582 () Bool)

(assert (=> d!70171 (= c!51582 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158210 () (_ BitVec 64))

(assert (=> d!70171 (= lt!158210 (select (arr!7968 a!3305) index!1840))))

(assert (=> d!70171 (validMask!0 mask!3777)))

(assert (=> d!70171 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158211)))

(declare-fun b!329445 () Bool)

(assert (=> b!329445 (and (bvsge (index!14574 lt!158211) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158211) (size!8320 a!3305)))))

(declare-fun res!181567 () Bool)

(assert (=> b!329445 (= res!181567 (= (select (arr!7968 a!3305) (index!14574 lt!158211)) k0!2497))))

(assert (=> b!329445 (=> res!181567 e!202375)))

(declare-fun e!202371 () Bool)

(assert (=> b!329445 (= e!202371 e!202375)))

(declare-fun b!329446 () Bool)

(declare-fun e!202374 () SeekEntryResult!3099)

(assert (=> b!329446 (= e!202374 (Intermediate!3099 false index!1840 x!1490))))

(declare-fun b!329447 () Bool)

(assert (=> b!329447 (= e!202374 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329448 () Bool)

(assert (=> b!329448 (and (bvsge (index!14574 lt!158211) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158211) (size!8320 a!3305)))))

(assert (=> b!329448 (= e!202375 (= (select (arr!7968 a!3305) (index!14574 lt!158211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329449 () Bool)

(assert (=> b!329449 (= e!202372 (Intermediate!3099 true index!1840 x!1490))))

(declare-fun b!329450 () Bool)

(assert (=> b!329450 (= e!202372 e!202374)))

(declare-fun c!51581 () Bool)

(assert (=> b!329450 (= c!51581 (or (= lt!158210 k0!2497) (= (bvadd lt!158210 lt!158210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329451 () Bool)

(assert (=> b!329451 (= e!202373 e!202371)))

(declare-fun res!181565 () Bool)

(assert (=> b!329451 (= res!181565 (and ((_ is Intermediate!3099) lt!158211) (not (undefined!3911 lt!158211)) (bvslt (x!32840 lt!158211) #b01111111111111111111111111111110) (bvsge (x!32840 lt!158211) #b00000000000000000000000000000000) (bvsge (x!32840 lt!158211) x!1490)))))

(assert (=> b!329451 (=> (not res!181565) (not e!202371))))

(declare-fun b!329452 () Bool)

(assert (=> b!329452 (= e!202373 (bvsge (x!32840 lt!158211) #b01111111111111111111111111111110))))

(assert (= (and d!70171 c!51582) b!329449))

(assert (= (and d!70171 (not c!51582)) b!329450))

(assert (= (and b!329450 c!51581) b!329446))

(assert (= (and b!329450 (not c!51581)) b!329447))

(assert (= (and d!70171 c!51580) b!329452))

(assert (= (and d!70171 (not c!51580)) b!329451))

(assert (= (and b!329451 res!181565) b!329445))

(assert (= (and b!329445 (not res!181567)) b!329444))

(assert (= (and b!329444 (not res!181566)) b!329448))

(assert (=> d!70171 m!335025))

(assert (=> d!70171 m!335017))

(declare-fun m!335103 () Bool)

(assert (=> b!329445 m!335103))

(assert (=> b!329448 m!335103))

(assert (=> b!329447 m!335029))

(assert (=> b!329447 m!335029))

(declare-fun m!335105 () Bool)

(assert (=> b!329447 m!335105))

(assert (=> b!329444 m!335103))

(assert (=> b!329318 d!70171))

(declare-fun d!70173 () Bool)

(assert (=> d!70173 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33084 d!70173))

(declare-fun d!70183 () Bool)

(assert (=> d!70183 (= (array_inv!5931 a!3305) (bvsge (size!8320 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33084 d!70183))

(declare-fun d!70185 () Bool)

(declare-fun res!181587 () Bool)

(declare-fun e!202396 () Bool)

(assert (=> d!70185 (=> res!181587 e!202396)))

(assert (=> d!70185 (= res!181587 (= (select (arr!7968 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70185 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202396)))

(declare-fun b!329485 () Bool)

(declare-fun e!202397 () Bool)

(assert (=> b!329485 (= e!202396 e!202397)))

(declare-fun res!181588 () Bool)

(assert (=> b!329485 (=> (not res!181588) (not e!202397))))

(assert (=> b!329485 (= res!181588 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8320 a!3305)))))

(declare-fun b!329486 () Bool)

(assert (=> b!329486 (= e!202397 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70185 (not res!181587)) b!329485))

(assert (= (and b!329485 res!181588) b!329486))

(declare-fun m!335129 () Bool)

(assert (=> d!70185 m!335129))

(declare-fun m!335131 () Bool)

(assert (=> b!329486 m!335131))

(assert (=> b!329319 d!70185))

(declare-fun d!70189 () Bool)

(declare-fun res!181594 () Bool)

(declare-fun e!202404 () Bool)

(assert (=> d!70189 (=> res!181594 e!202404)))

(assert (=> d!70189 (= res!181594 (bvsge #b00000000000000000000000000000000 (size!8320 a!3305)))))

(assert (=> d!70189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202404)))

(declare-fun b!329495 () Bool)

(declare-fun e!202405 () Bool)

(declare-fun call!26146 () Bool)

(assert (=> b!329495 (= e!202405 call!26146)))

(declare-fun b!329496 () Bool)

(declare-fun e!202406 () Bool)

(assert (=> b!329496 (= e!202405 e!202406)))

(declare-fun lt!158232 () (_ BitVec 64))

(assert (=> b!329496 (= lt!158232 (select (arr!7968 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10204 0))(
  ( (Unit!10205) )
))
(declare-fun lt!158233 () Unit!10204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16845 (_ BitVec 64) (_ BitVec 32)) Unit!10204)

(assert (=> b!329496 (= lt!158233 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158232 #b00000000000000000000000000000000))))

(assert (=> b!329496 (arrayContainsKey!0 a!3305 lt!158232 #b00000000000000000000000000000000)))

(declare-fun lt!158231 () Unit!10204)

(assert (=> b!329496 (= lt!158231 lt!158233)))

(declare-fun res!181593 () Bool)

(assert (=> b!329496 (= res!181593 (= (seekEntryOrOpen!0 (select (arr!7968 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3099 #b00000000000000000000000000000000)))))

(assert (=> b!329496 (=> (not res!181593) (not e!202406))))

(declare-fun bm!26143 () Bool)

(assert (=> bm!26143 (= call!26146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!329497 () Bool)

(assert (=> b!329497 (= e!202406 call!26146)))

(declare-fun b!329498 () Bool)

(assert (=> b!329498 (= e!202404 e!202405)))

(declare-fun c!51591 () Bool)

(assert (=> b!329498 (= c!51591 (validKeyInArray!0 (select (arr!7968 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!70189 (not res!181594)) b!329498))

(assert (= (and b!329498 c!51591) b!329496))

(assert (= (and b!329498 (not c!51591)) b!329495))

(assert (= (and b!329496 res!181593) b!329497))

(assert (= (or b!329497 b!329495) bm!26143))

(assert (=> b!329496 m!335129))

(declare-fun m!335133 () Bool)

(assert (=> b!329496 m!335133))

(declare-fun m!335135 () Bool)

(assert (=> b!329496 m!335135))

(assert (=> b!329496 m!335129))

(declare-fun m!335137 () Bool)

(assert (=> b!329496 m!335137))

(declare-fun m!335139 () Bool)

(assert (=> bm!26143 m!335139))

(assert (=> b!329498 m!335129))

(assert (=> b!329498 m!335129))

(declare-fun m!335141 () Bool)

(assert (=> b!329498 m!335141))

(assert (=> b!329312 d!70189))

(declare-fun b!329499 () Bool)

(declare-fun lt!158235 () SeekEntryResult!3099)

(assert (=> b!329499 (and (bvsge (index!14574 lt!158235) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158235) (size!8320 a!3305)))))

(declare-fun res!181596 () Bool)

(assert (=> b!329499 (= res!181596 (= (select (arr!7968 a!3305) (index!14574 lt!158235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202411 () Bool)

(assert (=> b!329499 (=> res!181596 e!202411)))

(declare-fun d!70195 () Bool)

(declare-fun e!202409 () Bool)

(assert (=> d!70195 e!202409))

(declare-fun c!51592 () Bool)

(assert (=> d!70195 (= c!51592 (and ((_ is Intermediate!3099) lt!158235) (undefined!3911 lt!158235)))))

(declare-fun e!202408 () SeekEntryResult!3099)

(assert (=> d!70195 (= lt!158235 e!202408)))

(declare-fun c!51594 () Bool)

(assert (=> d!70195 (= c!51594 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158234 () (_ BitVec 64))

(assert (=> d!70195 (= lt!158234 (select (arr!7968 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70195 (validMask!0 mask!3777)))

(assert (=> d!70195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158235)))

(declare-fun b!329500 () Bool)

(assert (=> b!329500 (and (bvsge (index!14574 lt!158235) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158235) (size!8320 a!3305)))))

(declare-fun res!181597 () Bool)

(assert (=> b!329500 (= res!181597 (= (select (arr!7968 a!3305) (index!14574 lt!158235)) k0!2497))))

(assert (=> b!329500 (=> res!181597 e!202411)))

(declare-fun e!202407 () Bool)

(assert (=> b!329500 (= e!202407 e!202411)))

(declare-fun b!329501 () Bool)

(declare-fun e!202410 () SeekEntryResult!3099)

(assert (=> b!329501 (= e!202410 (Intermediate!3099 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329502 () Bool)

(assert (=> b!329502 (= e!202410 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329503 () Bool)

(assert (=> b!329503 (and (bvsge (index!14574 lt!158235) #b00000000000000000000000000000000) (bvslt (index!14574 lt!158235) (size!8320 a!3305)))))

(assert (=> b!329503 (= e!202411 (= (select (arr!7968 a!3305) (index!14574 lt!158235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329504 () Bool)

(assert (=> b!329504 (= e!202408 (Intermediate!3099 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329505 () Bool)

(assert (=> b!329505 (= e!202408 e!202410)))

(declare-fun c!51593 () Bool)

(assert (=> b!329505 (= c!51593 (or (= lt!158234 k0!2497) (= (bvadd lt!158234 lt!158234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329506 () Bool)

(assert (=> b!329506 (= e!202409 e!202407)))

(declare-fun res!181595 () Bool)

(assert (=> b!329506 (= res!181595 (and ((_ is Intermediate!3099) lt!158235) (not (undefined!3911 lt!158235)) (bvslt (x!32840 lt!158235) #b01111111111111111111111111111110) (bvsge (x!32840 lt!158235) #b00000000000000000000000000000000) (bvsge (x!32840 lt!158235) #b00000000000000000000000000000000)))))

(assert (=> b!329506 (=> (not res!181595) (not e!202407))))

(declare-fun b!329507 () Bool)

(assert (=> b!329507 (= e!202409 (bvsge (x!32840 lt!158235) #b01111111111111111111111111111110))))

(assert (= (and d!70195 c!51594) b!329504))

(assert (= (and d!70195 (not c!51594)) b!329505))

(assert (= (and b!329505 c!51593) b!329501))

(assert (= (and b!329505 (not c!51593)) b!329502))

(assert (= (and d!70195 c!51592) b!329507))

(assert (= (and d!70195 (not c!51592)) b!329506))

(assert (= (and b!329506 res!181595) b!329500))

(assert (= (and b!329500 (not res!181597)) b!329499))

(assert (= (and b!329499 (not res!181596)) b!329503))

(assert (=> d!70195 m!335033))

(declare-fun m!335143 () Bool)

(assert (=> d!70195 m!335143))

(assert (=> d!70195 m!335017))

(declare-fun m!335145 () Bool)

(assert (=> b!329500 m!335145))

(assert (=> b!329503 m!335145))

(assert (=> b!329502 m!335033))

(declare-fun m!335147 () Bool)

(assert (=> b!329502 m!335147))

(assert (=> b!329502 m!335147))

(declare-fun m!335149 () Bool)

(assert (=> b!329502 m!335149))

(assert (=> b!329499 m!335145))

(assert (=> b!329321 d!70195))

(declare-fun d!70197 () Bool)

(declare-fun lt!158247 () (_ BitVec 32))

(declare-fun lt!158246 () (_ BitVec 32))

(assert (=> d!70197 (= lt!158247 (bvmul (bvxor lt!158246 (bvlshr lt!158246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70197 (= lt!158246 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70197 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181598 (let ((h!5416 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32849 (bvmul (bvxor h!5416 (bvlshr h!5416 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32849 (bvlshr x!32849 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181598 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181598 #b00000000000000000000000000000000))))))

(assert (=> d!70197 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158247 (bvlshr lt!158247 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329321 d!70197))

(declare-fun d!70199 () Bool)

(assert (=> d!70199 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329316 d!70199))

(check-sat (not d!70167) (not d!70195) (not b!329370) (not b!329496) (not b!329424) (not d!70151) (not b!329486) (not d!70171) (not bm!26143) (not b!329502) (not b!329447) (not b!329498) (not d!70159))
(check-sat)
