; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50990 () Bool)

(assert start!50990)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!557411 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!321125 () Bool)

(declare-datatypes ((SeekEntryResult!5306 0))(
  ( (MissingZero!5306 (index!23451 (_ BitVec 32))) (Found!5306 (index!23452 (_ BitVec 32))) (Intermediate!5306 (undefined!6118 Bool) (index!23453 (_ BitVec 32)) (x!52352 (_ BitVec 32))) (Undefined!5306) (MissingVacant!5306 (index!23454 (_ BitVec 32))) )
))
(declare-fun lt!253286 () SeekEntryResult!5306)

(declare-datatypes ((array!35101 0))(
  ( (array!35102 (arr!16857 (Array (_ BitVec 32) (_ BitVec 64))) (size!17221 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35101)

(assert (=> b!557411 (= e!321125 (not (or (not (is-Intermediate!5306 lt!253286)) (undefined!6118 lt!253286) (= (select (arr!16857 a!3118) (index!23453 lt!253286)) (select (arr!16857 a!3118) j!142)) (= (select (arr!16857 a!3118) (index!23453 lt!253286)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23453 lt!253286) #b00000000000000000000000000000000) (bvsge (index!23453 lt!253286) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52352 lt!253286) #b01111111111111111111111111111110) (bvslt (x!52352 lt!253286) #b00000000000000000000000000000000) (= (select (arr!16857 a!3118) (index!23453 lt!253286)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!321122 () Bool)

(assert (=> b!557411 e!321122))

(declare-fun res!349460 () Bool)

(assert (=> b!557411 (=> (not res!349460) (not e!321122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35101 (_ BitVec 32)) Bool)

(assert (=> b!557411 (= res!349460 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17386 0))(
  ( (Unit!17387) )
))
(declare-fun lt!253288 () Unit!17386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17386)

(assert (=> b!557411 (= lt!253288 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557412 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35101 (_ BitVec 32)) SeekEntryResult!5306)

(assert (=> b!557412 (= e!321122 (= (seekEntryOrOpen!0 (select (arr!16857 a!3118) j!142) a!3118 mask!3119) (Found!5306 j!142)))))

(declare-fun b!557413 () Bool)

(declare-fun res!349461 () Bool)

(declare-fun e!321124 () Bool)

(assert (=> b!557413 (=> (not res!349461) (not e!321124))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557413 (= res!349461 (validKeyInArray!0 k!1914))))

(declare-fun res!349458 () Bool)

(assert (=> start!50990 (=> (not res!349458) (not e!321124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50990 (= res!349458 (validMask!0 mask!3119))))

(assert (=> start!50990 e!321124))

(assert (=> start!50990 true))

(declare-fun array_inv!12653 (array!35101) Bool)

(assert (=> start!50990 (array_inv!12653 a!3118)))

(declare-fun b!557414 () Bool)

(declare-fun res!349463 () Bool)

(assert (=> b!557414 (=> (not res!349463) (not e!321124))))

(assert (=> b!557414 (= res!349463 (validKeyInArray!0 (select (arr!16857 a!3118) j!142)))))

(declare-fun b!557415 () Bool)

(declare-fun res!349462 () Bool)

(assert (=> b!557415 (=> (not res!349462) (not e!321124))))

(declare-fun arrayContainsKey!0 (array!35101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557415 (= res!349462 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557416 () Bool)

(declare-fun res!349459 () Bool)

(assert (=> b!557416 (=> (not res!349459) (not e!321124))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557416 (= res!349459 (and (= (size!17221 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17221 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17221 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557417 () Bool)

(declare-fun res!349457 () Bool)

(declare-fun e!321123 () Bool)

(assert (=> b!557417 (=> (not res!349457) (not e!321123))))

(assert (=> b!557417 (= res!349457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557418 () Bool)

(assert (=> b!557418 (= e!321124 e!321123)))

(declare-fun res!349466 () Bool)

(assert (=> b!557418 (=> (not res!349466) (not e!321123))))

(declare-fun lt!253284 () SeekEntryResult!5306)

(assert (=> b!557418 (= res!349466 (or (= lt!253284 (MissingZero!5306 i!1132)) (= lt!253284 (MissingVacant!5306 i!1132))))))

(assert (=> b!557418 (= lt!253284 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557419 () Bool)

(assert (=> b!557419 (= e!321123 e!321125)))

(declare-fun res!349465 () Bool)

(assert (=> b!557419 (=> (not res!349465) (not e!321125))))

(declare-fun lt!253285 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35101 (_ BitVec 32)) SeekEntryResult!5306)

(assert (=> b!557419 (= res!349465 (= lt!253286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253285 (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118)) mask!3119)))))

(declare-fun lt!253287 () (_ BitVec 32))

(assert (=> b!557419 (= lt!253286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253287 (select (arr!16857 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557419 (= lt!253285 (toIndex!0 (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!557419 (= lt!253287 (toIndex!0 (select (arr!16857 a!3118) j!142) mask!3119))))

(declare-fun b!557420 () Bool)

(declare-fun res!349464 () Bool)

(assert (=> b!557420 (=> (not res!349464) (not e!321123))))

(declare-datatypes ((List!10937 0))(
  ( (Nil!10934) (Cons!10933 (h!11924 (_ BitVec 64)) (t!17165 List!10937)) )
))
(declare-fun arrayNoDuplicates!0 (array!35101 (_ BitVec 32) List!10937) Bool)

(assert (=> b!557420 (= res!349464 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10934))))

(assert (= (and start!50990 res!349458) b!557416))

(assert (= (and b!557416 res!349459) b!557414))

(assert (= (and b!557414 res!349463) b!557413))

(assert (= (and b!557413 res!349461) b!557415))

(assert (= (and b!557415 res!349462) b!557418))

(assert (= (and b!557418 res!349466) b!557417))

(assert (= (and b!557417 res!349457) b!557420))

(assert (= (and b!557420 res!349464) b!557419))

(assert (= (and b!557419 res!349465) b!557411))

(assert (= (and b!557411 res!349460) b!557412))

(declare-fun m!535323 () Bool)

(assert (=> b!557411 m!535323))

(declare-fun m!535325 () Bool)

(assert (=> b!557411 m!535325))

(declare-fun m!535327 () Bool)

(assert (=> b!557411 m!535327))

(declare-fun m!535329 () Bool)

(assert (=> b!557411 m!535329))

(declare-fun m!535331 () Bool)

(assert (=> b!557417 m!535331))

(declare-fun m!535333 () Bool)

(assert (=> start!50990 m!535333))

(declare-fun m!535335 () Bool)

(assert (=> start!50990 m!535335))

(assert (=> b!557419 m!535325))

(declare-fun m!535337 () Bool)

(assert (=> b!557419 m!535337))

(assert (=> b!557419 m!535325))

(assert (=> b!557419 m!535325))

(declare-fun m!535339 () Bool)

(assert (=> b!557419 m!535339))

(declare-fun m!535341 () Bool)

(assert (=> b!557419 m!535341))

(declare-fun m!535343 () Bool)

(assert (=> b!557419 m!535343))

(assert (=> b!557419 m!535341))

(declare-fun m!535345 () Bool)

(assert (=> b!557419 m!535345))

(assert (=> b!557419 m!535341))

(declare-fun m!535347 () Bool)

(assert (=> b!557419 m!535347))

(declare-fun m!535349 () Bool)

(assert (=> b!557413 m!535349))

(assert (=> b!557414 m!535325))

(assert (=> b!557414 m!535325))

(declare-fun m!535351 () Bool)

(assert (=> b!557414 m!535351))

(declare-fun m!535353 () Bool)

(assert (=> b!557418 m!535353))

(assert (=> b!557412 m!535325))

(assert (=> b!557412 m!535325))

(declare-fun m!535355 () Bool)

(assert (=> b!557412 m!535355))

(declare-fun m!535357 () Bool)

(assert (=> b!557415 m!535357))

(declare-fun m!535359 () Bool)

(assert (=> b!557420 m!535359))

(push 1)

(assert (not b!557420))

(assert (not b!557418))

(assert (not b!557412))

(assert (not b!557413))

(assert (not b!557411))

(assert (not b!557415))

(assert (not b!557417))

(assert (not start!50990))

(assert (not b!557414))

(assert (not b!557419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!557522 () Bool)

(declare-fun e!321186 () Bool)

(declare-fun e!321185 () Bool)

(assert (=> b!557522 (= e!321186 e!321185)))

(declare-fun lt!253329 () (_ BitVec 64))

(assert (=> b!557522 (= lt!253329 (select (arr!16857 a!3118) j!142))))

(declare-fun lt!253331 () Unit!17386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35101 (_ BitVec 64) (_ BitVec 32)) Unit!17386)

(assert (=> b!557522 (= lt!253331 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253329 j!142))))

(assert (=> b!557522 (arrayContainsKey!0 a!3118 lt!253329 #b00000000000000000000000000000000)))

(declare-fun lt!253330 () Unit!17386)

(assert (=> b!557522 (= lt!253330 lt!253331)))

(declare-fun res!349546 () Bool)

(assert (=> b!557522 (= res!349546 (= (seekEntryOrOpen!0 (select (arr!16857 a!3118) j!142) a!3118 mask!3119) (Found!5306 j!142)))))

(assert (=> b!557522 (=> (not res!349546) (not e!321185))))

(declare-fun b!557523 () Bool)

(declare-fun call!32378 () Bool)

(assert (=> b!557523 (= e!321186 call!32378)))

(declare-fun bm!32375 () Bool)

(assert (=> bm!32375 (= call!32378 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83479 () Bool)

(declare-fun res!349547 () Bool)

(declare-fun e!321187 () Bool)

(assert (=> d!83479 (=> res!349547 e!321187)))

(assert (=> d!83479 (= res!349547 (bvsge j!142 (size!17221 a!3118)))))

(assert (=> d!83479 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321187)))

(declare-fun b!557524 () Bool)

(assert (=> b!557524 (= e!321187 e!321186)))

(declare-fun c!64328 () Bool)

(assert (=> b!557524 (= c!64328 (validKeyInArray!0 (select (arr!16857 a!3118) j!142)))))

(declare-fun b!557525 () Bool)

(assert (=> b!557525 (= e!321185 call!32378)))

(assert (= (and d!83479 (not res!349547)) b!557524))

(assert (= (and b!557524 c!64328) b!557522))

(assert (= (and b!557524 (not c!64328)) b!557523))

(assert (= (and b!557522 res!349546) b!557525))

(assert (= (or b!557525 b!557523) bm!32375))

(assert (=> b!557522 m!535325))

(declare-fun m!535445 () Bool)

(assert (=> b!557522 m!535445))

(declare-fun m!535447 () Bool)

(assert (=> b!557522 m!535447))

(assert (=> b!557522 m!535325))

(assert (=> b!557522 m!535355))

(declare-fun m!535449 () Bool)

(assert (=> bm!32375 m!535449))

(assert (=> b!557524 m!535325))

(assert (=> b!557524 m!535325))

(assert (=> b!557524 m!535351))

(assert (=> b!557411 d!83479))

(declare-fun d!83481 () Bool)

(assert (=> d!83481 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253338 () Unit!17386)

(declare-fun choose!38 (array!35101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17386)

(assert (=> d!83481 (= lt!253338 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83481 (validMask!0 mask!3119)))

(assert (=> d!83481 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253338)))

(declare-fun bs!17356 () Bool)

(assert (= bs!17356 d!83481))

(assert (=> bs!17356 m!535327))

(declare-fun m!535467 () Bool)

(assert (=> bs!17356 m!535467))

(assert (=> bs!17356 m!535333))

(assert (=> b!557411 d!83481))

(declare-fun b!557580 () Bool)

(declare-fun e!321223 () SeekEntryResult!5306)

(declare-fun e!321222 () SeekEntryResult!5306)

(assert (=> b!557580 (= e!321223 e!321222)))

(declare-fun lt!253371 () (_ BitVec 64))

(declare-fun lt!253373 () SeekEntryResult!5306)

(assert (=> b!557580 (= lt!253371 (select (arr!16857 a!3118) (index!23453 lt!253373)))))

(declare-fun c!64349 () Bool)

(assert (=> b!557580 (= c!64349 (= lt!253371 (select (arr!16857 a!3118) j!142)))))

(declare-fun b!557581 () Bool)

(assert (=> b!557581 (= e!321223 Undefined!5306)))

(declare-fun d!83487 () Bool)

(declare-fun lt!253372 () SeekEntryResult!5306)

(assert (=> d!83487 (and (or (is-Undefined!5306 lt!253372) (not (is-Found!5306 lt!253372)) (and (bvsge (index!23452 lt!253372) #b00000000000000000000000000000000) (bvslt (index!23452 lt!253372) (size!17221 a!3118)))) (or (is-Undefined!5306 lt!253372) (is-Found!5306 lt!253372) (not (is-MissingZero!5306 lt!253372)) (and (bvsge (index!23451 lt!253372) #b00000000000000000000000000000000) (bvslt (index!23451 lt!253372) (size!17221 a!3118)))) (or (is-Undefined!5306 lt!253372) (is-Found!5306 lt!253372) (is-MissingZero!5306 lt!253372) (not (is-MissingVacant!5306 lt!253372)) (and (bvsge (index!23454 lt!253372) #b00000000000000000000000000000000) (bvslt (index!23454 lt!253372) (size!17221 a!3118)))) (or (is-Undefined!5306 lt!253372) (ite (is-Found!5306 lt!253372) (= (select (arr!16857 a!3118) (index!23452 lt!253372)) (select (arr!16857 a!3118) j!142)) (ite (is-MissingZero!5306 lt!253372) (= (select (arr!16857 a!3118) (index!23451 lt!253372)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5306 lt!253372) (= (select (arr!16857 a!3118) (index!23454 lt!253372)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83487 (= lt!253372 e!321223)))

(declare-fun c!64347 () Bool)

(assert (=> d!83487 (= c!64347 (and (is-Intermediate!5306 lt!253373) (undefined!6118 lt!253373)))))

(assert (=> d!83487 (= lt!253373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16857 a!3118) j!142) mask!3119) (select (arr!16857 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83487 (validMask!0 mask!3119)))

(assert (=> d!83487 (= (seekEntryOrOpen!0 (select (arr!16857 a!3118) j!142) a!3118 mask!3119) lt!253372)))

(declare-fun e!321224 () SeekEntryResult!5306)

(declare-fun b!557582 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35101 (_ BitVec 32)) SeekEntryResult!5306)

(assert (=> b!557582 (= e!321224 (seekKeyOrZeroReturnVacant!0 (x!52352 lt!253373) (index!23453 lt!253373) (index!23453 lt!253373) (select (arr!16857 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557583 () Bool)

(assert (=> b!557583 (= e!321224 (MissingZero!5306 (index!23453 lt!253373)))))

(declare-fun b!557584 () Bool)

(assert (=> b!557584 (= e!321222 (Found!5306 (index!23453 lt!253373)))))

(declare-fun b!557585 () Bool)

(declare-fun c!64348 () Bool)

(assert (=> b!557585 (= c!64348 (= lt!253371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557585 (= e!321222 e!321224)))

(assert (= (and d!83487 c!64347) b!557581))

(assert (= (and d!83487 (not c!64347)) b!557580))

(assert (= (and b!557580 c!64349) b!557584))

(assert (= (and b!557580 (not c!64349)) b!557585))

(assert (= (and b!557585 c!64348) b!557583))

(assert (= (and b!557585 (not c!64348)) b!557582))

(declare-fun m!535489 () Bool)

(assert (=> b!557580 m!535489))

(declare-fun m!535491 () Bool)

(assert (=> d!83487 m!535491))

(assert (=> d!83487 m!535333))

(declare-fun m!535493 () Bool)

(assert (=> d!83487 m!535493))

(assert (=> d!83487 m!535325))

(assert (=> d!83487 m!535337))

(declare-fun m!535495 () Bool)

(assert (=> d!83487 m!535495))

(assert (=> d!83487 m!535337))

(assert (=> d!83487 m!535325))

(declare-fun m!535497 () Bool)

(assert (=> d!83487 m!535497))

(assert (=> b!557582 m!535325))

(declare-fun m!535499 () Bool)

(assert (=> b!557582 m!535499))

(assert (=> b!557412 d!83487))

(declare-fun b!557586 () Bool)

(declare-fun e!321226 () Bool)

(declare-fun e!321225 () Bool)

(assert (=> b!557586 (= e!321226 e!321225)))

(declare-fun lt!253374 () (_ BitVec 64))

(assert (=> b!557586 (= lt!253374 (select (arr!16857 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253376 () Unit!17386)

(assert (=> b!557586 (= lt!253376 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253374 #b00000000000000000000000000000000))))

(assert (=> b!557586 (arrayContainsKey!0 a!3118 lt!253374 #b00000000000000000000000000000000)))

(declare-fun lt!253375 () Unit!17386)

(assert (=> b!557586 (= lt!253375 lt!253376)))

(declare-fun res!349567 () Bool)

(assert (=> b!557586 (= res!349567 (= (seekEntryOrOpen!0 (select (arr!16857 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5306 #b00000000000000000000000000000000)))))

(assert (=> b!557586 (=> (not res!349567) (not e!321225))))

(declare-fun b!557587 () Bool)

(declare-fun call!32385 () Bool)

(assert (=> b!557587 (= e!321226 call!32385)))

(declare-fun bm!32382 () Bool)

(assert (=> bm!32382 (= call!32385 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83501 () Bool)

(declare-fun res!349568 () Bool)

(declare-fun e!321227 () Bool)

(assert (=> d!83501 (=> res!349568 e!321227)))

(assert (=> d!83501 (= res!349568 (bvsge #b00000000000000000000000000000000 (size!17221 a!3118)))))

(assert (=> d!83501 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321227)))

(declare-fun b!557588 () Bool)

(assert (=> b!557588 (= e!321227 e!321226)))

(declare-fun c!64350 () Bool)

(assert (=> b!557588 (= c!64350 (validKeyInArray!0 (select (arr!16857 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557589 () Bool)

(assert (=> b!557589 (= e!321225 call!32385)))

(assert (= (and d!83501 (not res!349568)) b!557588))

(assert (= (and b!557588 c!64350) b!557586))

(assert (= (and b!557588 (not c!64350)) b!557587))

(assert (= (and b!557586 res!349567) b!557589))

(assert (= (or b!557589 b!557587) bm!32382))

(declare-fun m!535501 () Bool)

(assert (=> b!557586 m!535501))

(declare-fun m!535503 () Bool)

(assert (=> b!557586 m!535503))

(declare-fun m!535505 () Bool)

(assert (=> b!557586 m!535505))

(assert (=> b!557586 m!535501))

(declare-fun m!535507 () Bool)

(assert (=> b!557586 m!535507))

(declare-fun m!535509 () Bool)

(assert (=> bm!32382 m!535509))

(assert (=> b!557588 m!535501))

(assert (=> b!557588 m!535501))

(declare-fun m!535511 () Bool)

(assert (=> b!557588 m!535511))

(assert (=> b!557417 d!83501))

(declare-fun d!83503 () Bool)

(assert (=> d!83503 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50990 d!83503))

(declare-fun d!83509 () Bool)

(assert (=> d!83509 (= (array_inv!12653 a!3118) (bvsge (size!17221 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50990 d!83509))

(declare-fun d!83511 () Bool)

(declare-fun res!349573 () Bool)

(declare-fun e!321244 () Bool)

(assert (=> d!83511 (=> res!349573 e!321244)))

(assert (=> d!83511 (= res!349573 (= (select (arr!16857 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83511 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!321244)))

(declare-fun b!557618 () Bool)

(declare-fun e!321245 () Bool)

(assert (=> b!557618 (= e!321244 e!321245)))

(declare-fun res!349574 () Bool)

(assert (=> b!557618 (=> (not res!349574) (not e!321245))))

(assert (=> b!557618 (= res!349574 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17221 a!3118)))))

(declare-fun b!557619 () Bool)

(assert (=> b!557619 (= e!321245 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83511 (not res!349573)) b!557618))

(assert (= (and b!557618 res!349574) b!557619))

(assert (=> d!83511 m!535501))

(declare-fun m!535539 () Bool)

(assert (=> b!557619 m!535539))

(assert (=> b!557415 d!83511))

(declare-fun d!83517 () Bool)

(assert (=> d!83517 (= (validKeyInArray!0 (select (arr!16857 a!3118) j!142)) (and (not (= (select (arr!16857 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16857 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557414 d!83517))

(declare-fun b!557687 () Bool)

(declare-fun lt!253411 () SeekEntryResult!5306)

(assert (=> b!557687 (and (bvsge (index!23453 lt!253411) #b00000000000000000000000000000000) (bvslt (index!23453 lt!253411) (size!17221 (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118)))))))

(declare-fun e!321289 () Bool)

(assert (=> b!557687 (= e!321289 (= (select (arr!16857 (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118))) (index!23453 lt!253411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83519 () Bool)

(declare-fun e!321293 () Bool)

(assert (=> d!83519 e!321293))

(declare-fun c!64387 () Bool)

(assert (=> d!83519 (= c!64387 (and (is-Intermediate!5306 lt!253411) (undefined!6118 lt!253411)))))

(declare-fun e!321291 () SeekEntryResult!5306)

(assert (=> d!83519 (= lt!253411 e!321291)))

(declare-fun c!64386 () Bool)

(assert (=> d!83519 (= c!64386 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253412 () (_ BitVec 64))

(assert (=> d!83519 (= lt!253412 (select (arr!16857 (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118))) lt!253285))))

(assert (=> d!83519 (validMask!0 mask!3119)))

(assert (=> d!83519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253285 (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118)) mask!3119) lt!253411)))

(declare-fun b!557688 () Bool)

(assert (=> b!557688 (= e!321291 (Intermediate!5306 true lt!253285 #b00000000000000000000000000000000))))

(declare-fun b!557689 () Bool)

(declare-fun e!321290 () SeekEntryResult!5306)

(assert (=> b!557689 (= e!321291 e!321290)))

(declare-fun c!64385 () Bool)

(assert (=> b!557689 (= c!64385 (or (= lt!253412 (select (store (arr!16857 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!253412 lt!253412) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557690 () Bool)

(assert (=> b!557690 (= e!321293 (bvsge (x!52352 lt!253411) #b01111111111111111111111111111110))))

(declare-fun b!557691 () Bool)

(declare-fun e!321292 () Bool)

(assert (=> b!557691 (= e!321293 e!321292)))

(declare-fun res!349599 () Bool)

(assert (=> b!557691 (= res!349599 (and (is-Intermediate!5306 lt!253411) (not (undefined!6118 lt!253411)) (bvslt (x!52352 lt!253411) #b01111111111111111111111111111110) (bvsge (x!52352 lt!253411) #b00000000000000000000000000000000) (bvsge (x!52352 lt!253411) #b00000000000000000000000000000000)))))

(assert (=> b!557691 (=> (not res!349599) (not e!321292))))

(declare-fun b!557692 () Bool)

(assert (=> b!557692 (= e!321290 (Intermediate!5306 false lt!253285 #b00000000000000000000000000000000))))

(declare-fun b!557693 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557693 (= e!321290 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253285 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118)) mask!3119))))

(declare-fun b!557694 () Bool)

(assert (=> b!557694 (and (bvsge (index!23453 lt!253411) #b00000000000000000000000000000000) (bvslt (index!23453 lt!253411) (size!17221 (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118)))))))

(declare-fun res!349600 () Bool)

(assert (=> b!557694 (= res!349600 (= (select (arr!16857 (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118))) (index!23453 lt!253411)) (select (store (arr!16857 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!557694 (=> res!349600 e!321289)))

(assert (=> b!557694 (= e!321292 e!321289)))

(declare-fun b!557695 () Bool)

(assert (=> b!557695 (and (bvsge (index!23453 lt!253411) #b00000000000000000000000000000000) (bvslt (index!23453 lt!253411) (size!17221 (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118)))))))

(declare-fun res!349598 () Bool)

(assert (=> b!557695 (= res!349598 (= (select (arr!16857 (array!35102 (store (arr!16857 a!3118) i!1132 k!1914) (size!17221 a!3118))) (index!23453 lt!253411)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557695 (=> res!349598 e!321289)))

(assert (= (and d!83519 c!64386) b!557688))

(assert (= (and d!83519 (not c!64386)) b!557689))

(assert (= (and b!557689 c!64385) b!557692))

(assert (= (and b!557689 (not c!64385)) b!557693))

(assert (= (and d!83519 c!64387) b!557690))

(assert (= (and d!83519 (not c!64387)) b!557691))

(assert (= (and b!557691 res!349599) b!557694))

(assert (= (and b!557694 (not res!349600)) b!557695))

(assert (= (and b!557695 (not res!349598)) b!557687))

(declare-fun m!535581 () Bool)

(assert (=> b!557693 m!535581))

(assert (=> b!557693 m!535581))

(assert (=> b!557693 m!535341))

(declare-fun m!535583 () Bool)

(assert (=> b!557693 m!535583))

(declare-fun m!535585 () Bool)

(assert (=> b!557694 m!535585))

(declare-fun m!535587 () Bool)

(assert (=> d!83519 m!535587))

(assert (=> d!83519 m!535333))

(assert (=> b!557687 m!535585))

(assert (=> b!557695 m!535585))

(assert (=> b!557419 d!83519))

(declare-fun b!557696 () Bool)

(declare-fun lt!253413 () SeekEntryResult!5306)

(assert (=> b!557696 (and (bvsge (index!23453 lt!253413) #b00000000000000000000000000000000) (bvslt (index!23453 lt!253413) (size!17221 a!3118)))))

(declare-fun e!321294 () Bool)

(assert (=> b!557696 (= e!321294 (= (select (arr!16857 a!3118) (index!23453 lt!253413)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83539 () Bool)

(declare-fun e!321298 () Bool)

(assert (=> d!83539 e!321298))

(declare-fun c!64390 () Bool)

(assert (=> d!83539 (= c!64390 (and (is-Intermediate!5306 lt!253413) (undefined!6118 lt!253413)))))

(declare-fun e!321296 () SeekEntryResult!5306)

(assert (=> d!83539 (= lt!253413 e!321296)))

(declare-fun c!64389 () Bool)

(assert (=> d!83539 (= c!64389 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253414 () (_ BitVec 64))

(assert (=> d!83539 (= lt!253414 (select (arr!16857 a!3118) lt!253287))))

(assert (=> d!83539 (validMask!0 mask!3119)))

(assert (=> d!83539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253287 (select (arr!16857 a!3118) j!142) a!3118 mask!3119) lt!253413)))

(declare-fun b!557697 () Bool)

(assert (=> b!557697 (= e!321296 (Intermediate!5306 true lt!253287 #b00000000000000000000000000000000))))

(declare-fun b!557698 () Bool)

(declare-fun e!321295 () SeekEntryResult!5306)

(assert (=> b!557698 (= e!321296 e!321295)))

(declare-fun c!64388 () Bool)

(assert (=> b!557698 (= c!64388 (or (= lt!253414 (select (arr!16857 a!3118) j!142)) (= (bvadd lt!253414 lt!253414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557699 () Bool)

(assert (=> b!557699 (= e!321298 (bvsge (x!52352 lt!253413) #b01111111111111111111111111111110))))

(declare-fun b!557700 () Bool)

(declare-fun e!321297 () Bool)

(assert (=> b!557700 (= e!321298 e!321297)))

(declare-fun res!349602 () Bool)

(assert (=> b!557700 (= res!349602 (and (is-Intermediate!5306 lt!253413) (not (undefined!6118 lt!253413)) (bvslt (x!52352 lt!253413) #b01111111111111111111111111111110) (bvsge (x!52352 lt!253413) #b00000000000000000000000000000000) (bvsge (x!52352 lt!253413) #b00000000000000000000000000000000)))))

(assert (=> b!557700 (=> (not res!349602) (not e!321297))))

(declare-fun b!557701 () Bool)

(assert (=> b!557701 (= e!321295 (Intermediate!5306 false lt!253287 #b00000000000000000000000000000000))))

(declare-fun b!557702 () Bool)

(assert (=> b!557702 (= e!321295 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253287 #b00000000000000000000000000000000 mask!3119) (select (arr!16857 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557703 () Bool)

(assert (=> b!557703 (and (bvsge (index!23453 lt!253413) #b00000000000000000000000000000000) (bvslt (index!23453 lt!253413) (size!17221 a!3118)))))

(declare-fun res!349603 () Bool)

(assert (=> b!557703 (= res!349603 (= (select (arr!16857 a!3118) (index!23453 lt!253413)) (select (arr!16857 a!3118) j!142)))))

(assert (=> b!557703 (=> res!349603 e!321294)))

(assert (=> b!557703 (= e!321297 e!321294)))

(declare-fun b!557704 () Bool)

(assert (=> b!557704 (and (bvsge (index!23453 lt!253413) #b00000000000000000000000000000000) (bvslt (index!23453 lt!253413) (size!17221 a!3118)))))

(declare-fun res!349601 () Bool)

(assert (=> b!557704 (= res!349601 (= (select (arr!16857 a!3118) (index!23453 lt!253413)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557704 (=> res!349601 e!321294)))

(assert (= (and d!83539 c!64389) b!557697))

(assert (= (and d!83539 (not c!64389)) b!557698))

(assert (= (and b!557698 c!64388) b!557701))

(assert (= (and b!557698 (not c!64388)) b!557702))

(assert (= (and d!83539 c!64390) b!557699))

(assert (= (and d!83539 (not c!64390)) b!557700))

(assert (= (and b!557700 res!349602) b!557703))

(assert (= (and b!557703 (not res!349603)) b!557704))

(assert (= (and b!557704 (not res!349601)) b!557696))

(declare-fun m!535589 () Bool)

(assert (=> b!557702 m!535589))

(assert (=> b!557702 m!535589))

(assert (=> b!557702 m!535325))

(declare-fun m!535591 () Bool)

(assert (=> b!557702 m!535591))

(declare-fun m!535593 () Bool)

(assert (=> b!557703 m!535593))

(declare-fun m!535595 () Bool)

(assert (=> d!83539 m!535595))

(assert (=> d!83539 m!535333))

(assert (=> b!557696 m!535593))

(assert (=> b!557704 m!535593))

(assert (=> b!557419 d!83539))

(declare-fun d!83541 () Bool)

(declare-fun lt!253420 () (_ BitVec 32))

(declare-fun lt!253419 () (_ BitVec 32))

(assert (=> d!83541 (= lt!253420 (bvmul (bvxor lt!253419 (bvlshr lt!253419 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83541 (= lt!253419 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83541 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349604 (let ((h!11928 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52358 (bvmul (bvxor h!11928 (bvlshr h!11928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52358 (bvlshr x!52358 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349604 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349604 #b00000000000000000000000000000000))))))

(assert (=> d!83541 (= (toIndex!0 (select (store (arr!16857 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!253420 (bvlshr lt!253420 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557419 d!83541))

(declare-fun d!83543 () Bool)

(declare-fun lt!253422 () (_ BitVec 32))

(declare-fun lt!253421 () (_ BitVec 32))

(assert (=> d!83543 (= lt!253422 (bvmul (bvxor lt!253421 (bvlshr lt!253421 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83543 (= lt!253421 ((_ extract 31 0) (bvand (bvxor (select (arr!16857 a!3118) j!142) (bvlshr (select (arr!16857 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83543 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349604 (let ((h!11928 ((_ extract 31 0) (bvand (bvxor (select (arr!16857 a!3118) j!142) (bvlshr (select (arr!16857 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52358 (bvmul (bvxor h!11928 (bvlshr h!11928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52358 (bvlshr x!52358 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349604 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349604 #b00000000000000000000000000000000))))))

(assert (=> d!83543 (= (toIndex!0 (select (arr!16857 a!3118) j!142) mask!3119) (bvand (bvxor lt!253422 (bvlshr lt!253422 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557419 d!83543))

(declare-fun b!557751 () Bool)

(declare-fun e!321328 () Bool)

(declare-fun e!321329 () Bool)

(assert (=> b!557751 (= e!321328 e!321329)))

(declare-fun c!64405 () Bool)

(assert (=> b!557751 (= c!64405 (validKeyInArray!0 (select (arr!16857 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557752 () Bool)

(declare-fun call!32392 () Bool)

(assert (=> b!557752 (= e!321329 call!32392)))

(declare-fun b!557753 () Bool)

(declare-fun e!321330 () Bool)

(assert (=> b!557753 (= e!321330 e!321328)))

(declare-fun res!349624 () Bool)

(assert (=> b!557753 (=> (not res!349624) (not e!321328))))

(declare-fun e!321327 () Bool)

(assert (=> b!557753 (= res!349624 (not e!321327))))

(declare-fun res!349623 () Bool)

(assert (=> b!557753 (=> (not res!349623) (not e!321327))))

(assert (=> b!557753 (= res!349623 (validKeyInArray!0 (select (arr!16857 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557754 () Bool)

(declare-fun contains!2853 (List!10937 (_ BitVec 64)) Bool)

(assert (=> b!557754 (= e!321327 (contains!2853 Nil!10934 (select (arr!16857 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83545 () Bool)

(declare-fun res!349625 () Bool)

(assert (=> d!83545 (=> res!349625 e!321330)))

(assert (=> d!83545 (= res!349625 (bvsge #b00000000000000000000000000000000 (size!17221 a!3118)))))

(assert (=> d!83545 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10934) e!321330)))

(declare-fun bm!32389 () Bool)

(assert (=> bm!32389 (= call!32392 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64405 (Cons!10933 (select (arr!16857 a!3118) #b00000000000000000000000000000000) Nil!10934) Nil!10934)))))

(declare-fun b!557755 () Bool)

(assert (=> b!557755 (= e!321329 call!32392)))

(assert (= (and d!83545 (not res!349625)) b!557753))

(assert (= (and b!557753 res!349623) b!557754))

(assert (= (and b!557753 res!349624) b!557751))

(assert (= (and b!557751 c!64405) b!557752))

(assert (= (and b!557751 (not c!64405)) b!557755))

(assert (= (or b!557752 b!557755) bm!32389))

(assert (=> b!557751 m!535501))

(assert (=> b!557751 m!535501))

(assert (=> b!557751 m!535511))

(assert (=> b!557753 m!535501))

(assert (=> b!557753 m!535501))

(assert (=> b!557753 m!535511))

(assert (=> b!557754 m!535501))

(assert (=> b!557754 m!535501))

(declare-fun m!535613 () Bool)

(assert (=> b!557754 m!535613))

(assert (=> bm!32389 m!535501))

(declare-fun m!535615 () Bool)

(assert (=> bm!32389 m!535615))

(assert (=> b!557420 d!83545))

(declare-fun b!557756 () Bool)

(declare-fun e!321332 () SeekEntryResult!5306)

(declare-fun e!321331 () SeekEntryResult!5306)

(assert (=> b!557756 (= e!321332 e!321331)))

(declare-fun lt!253431 () (_ BitVec 64))

(declare-fun lt!253433 () SeekEntryResult!5306)

(assert (=> b!557756 (= lt!253431 (select (arr!16857 a!3118) (index!23453 lt!253433)))))

(declare-fun c!64408 () Bool)

(assert (=> b!557756 (= c!64408 (= lt!253431 k!1914))))

(declare-fun b!557757 () Bool)

(assert (=> b!557757 (= e!321332 Undefined!5306)))

(declare-fun d!83551 () Bool)

(declare-fun lt!253432 () SeekEntryResult!5306)

(assert (=> d!83551 (and (or (is-Undefined!5306 lt!253432) (not (is-Found!5306 lt!253432)) (and (bvsge (index!23452 lt!253432) #b00000000000000000000000000000000) (bvslt (index!23452 lt!253432) (size!17221 a!3118)))) (or (is-Undefined!5306 lt!253432) (is-Found!5306 lt!253432) (not (is-MissingZero!5306 lt!253432)) (and (bvsge (index!23451 lt!253432) #b00000000000000000000000000000000) (bvslt (index!23451 lt!253432) (size!17221 a!3118)))) (or (is-Undefined!5306 lt!253432) (is-Found!5306 lt!253432) (is-MissingZero!5306 lt!253432) (not (is-MissingVacant!5306 lt!253432)) (and (bvsge (index!23454 lt!253432) #b00000000000000000000000000000000) (bvslt (index!23454 lt!253432) (size!17221 a!3118)))) (or (is-Undefined!5306 lt!253432) (ite (is-Found!5306 lt!253432) (= (select (arr!16857 a!3118) (index!23452 lt!253432)) k!1914) (ite (is-MissingZero!5306 lt!253432) (= (select (arr!16857 a!3118) (index!23451 lt!253432)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5306 lt!253432) (= (select (arr!16857 a!3118) (index!23454 lt!253432)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83551 (= lt!253432 e!321332)))

(declare-fun c!64406 () Bool)

(assert (=> d!83551 (= c!64406 (and (is-Intermediate!5306 lt!253433) (undefined!6118 lt!253433)))))

(assert (=> d!83551 (= lt!253433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83551 (validMask!0 mask!3119)))

(assert (=> d!83551 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!253432)))

(declare-fun b!557758 () Bool)

(declare-fun e!321333 () SeekEntryResult!5306)

(assert (=> b!557758 (= e!321333 (seekKeyOrZeroReturnVacant!0 (x!52352 lt!253433) (index!23453 lt!253433) (index!23453 lt!253433) k!1914 a!3118 mask!3119))))

(declare-fun b!557759 () Bool)

(assert (=> b!557759 (= e!321333 (MissingZero!5306 (index!23453 lt!253433)))))

(declare-fun b!557760 () Bool)

(assert (=> b!557760 (= e!321331 (Found!5306 (index!23453 lt!253433)))))

(declare-fun b!557761 () Bool)

(declare-fun c!64407 () Bool)

(assert (=> b!557761 (= c!64407 (= lt!253431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557761 (= e!321331 e!321333)))

(assert (= (and d!83551 c!64406) b!557757))

(assert (= (and d!83551 (not c!64406)) b!557756))

(assert (= (and b!557756 c!64408) b!557760))

(assert (= (and b!557756 (not c!64408)) b!557761))

(assert (= (and b!557761 c!64407) b!557759))

(assert (= (and b!557761 (not c!64407)) b!557758))

(declare-fun m!535617 () Bool)

(assert (=> b!557756 m!535617))

(declare-fun m!535619 () Bool)

(assert (=> d!83551 m!535619))

(assert (=> d!83551 m!535333))

(declare-fun m!535621 () Bool)

(assert (=> d!83551 m!535621))

(declare-fun m!535623 () Bool)

(assert (=> d!83551 m!535623))

(declare-fun m!535625 () Bool)

(assert (=> d!83551 m!535625))

(assert (=> d!83551 m!535623))

(declare-fun m!535627 () Bool)

(assert (=> d!83551 m!535627))

(declare-fun m!535629 () Bool)

(assert (=> b!557758 m!535629))

(assert (=> b!557418 d!83551))

(declare-fun d!83553 () Bool)

(assert (=> d!83553 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557413 d!83553))

(push 1)

