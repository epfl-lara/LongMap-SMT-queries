; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51908 () Bool)

(assert start!51908)

(declare-fun b!567322 () Bool)

(declare-fun res!358053 () Bool)

(declare-fun e!326412 () Bool)

(assert (=> b!567322 (=> (not res!358053) (not e!326412))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567322 (= res!358053 (validKeyInArray!0 k0!1914))))

(declare-fun b!567323 () Bool)

(declare-fun res!358050 () Bool)

(declare-fun e!326408 () Bool)

(assert (=> b!567323 (=> (not res!358050) (not e!326408))))

(declare-datatypes ((array!35611 0))(
  ( (array!35612 (arr!17102 (Array (_ BitVec 32) (_ BitVec 64))) (size!17467 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35611)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35611 (_ BitVec 32)) Bool)

(assert (=> b!567323 (= res!358050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567324 () Bool)

(assert (=> b!567324 (= e!326412 e!326408)))

(declare-fun res!358058 () Bool)

(assert (=> b!567324 (=> (not res!358058) (not e!326408))))

(declare-datatypes ((SeekEntryResult!5548 0))(
  ( (MissingZero!5548 (index!24419 (_ BitVec 32))) (Found!5548 (index!24420 (_ BitVec 32))) (Intermediate!5548 (undefined!6360 Bool) (index!24421 (_ BitVec 32)) (x!53296 (_ BitVec 32))) (Undefined!5548) (MissingVacant!5548 (index!24422 (_ BitVec 32))) )
))
(declare-fun lt!258327 () SeekEntryResult!5548)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567324 (= res!358058 (or (= lt!258327 (MissingZero!5548 i!1132)) (= lt!258327 (MissingVacant!5548 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35611 (_ BitVec 32)) SeekEntryResult!5548)

(assert (=> b!567324 (= lt!258327 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567325 () Bool)

(declare-fun e!326411 () Bool)

(assert (=> b!567325 (= e!326408 e!326411)))

(declare-fun res!358052 () Bool)

(assert (=> b!567325 (=> (not res!358052) (not e!326411))))

(declare-fun lt!258331 () array!35611)

(declare-fun lt!258330 () SeekEntryResult!5548)

(declare-fun lt!258328 () (_ BitVec 32))

(declare-fun lt!258325 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35611 (_ BitVec 32)) SeekEntryResult!5548)

(assert (=> b!567325 (= res!358052 (= lt!258330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258328 lt!258325 lt!258331 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!258329 () (_ BitVec 32))

(assert (=> b!567325 (= lt!258330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258329 (select (arr!17102 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567325 (= lt!258328 (toIndex!0 lt!258325 mask!3119))))

(assert (=> b!567325 (= lt!258325 (select (store (arr!17102 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!567325 (= lt!258329 (toIndex!0 (select (arr!17102 a!3118) j!142) mask!3119))))

(assert (=> b!567325 (= lt!258331 (array!35612 (store (arr!17102 a!3118) i!1132 k0!1914) (size!17467 a!3118)))))

(declare-fun b!567326 () Bool)

(declare-fun e!326410 () Bool)

(assert (=> b!567326 (= e!326411 (not e!326410))))

(declare-fun res!358057 () Bool)

(assert (=> b!567326 (=> res!358057 e!326410)))

(get-info :version)

(assert (=> b!567326 (= res!358057 (or (undefined!6360 lt!258330) (not ((_ is Intermediate!5548) lt!258330)) (not (= (select (arr!17102 a!3118) (index!24421 lt!258330)) (select (arr!17102 a!3118) j!142)))))))

(declare-fun lt!258326 () SeekEntryResult!5548)

(assert (=> b!567326 (= lt!258326 (Found!5548 j!142))))

(assert (=> b!567326 (= lt!258326 (seekEntryOrOpen!0 (select (arr!17102 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!567326 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17784 0))(
  ( (Unit!17785) )
))
(declare-fun lt!258324 () Unit!17784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17784)

(assert (=> b!567326 (= lt!258324 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567327 () Bool)

(declare-fun res!358054 () Bool)

(assert (=> b!567327 (=> (not res!358054) (not e!326408))))

(declare-datatypes ((List!11221 0))(
  ( (Nil!11218) (Cons!11217 (h!12229 (_ BitVec 64)) (t!17440 List!11221)) )
))
(declare-fun arrayNoDuplicates!0 (array!35611 (_ BitVec 32) List!11221) Bool)

(assert (=> b!567327 (= res!358054 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11218))))

(declare-fun res!358049 () Bool)

(assert (=> start!51908 (=> (not res!358049) (not e!326412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51908 (= res!358049 (validMask!0 mask!3119))))

(assert (=> start!51908 e!326412))

(assert (=> start!51908 true))

(declare-fun array_inv!12985 (array!35611) Bool)

(assert (=> start!51908 (array_inv!12985 a!3118)))

(declare-fun b!567328 () Bool)

(declare-fun res!358051 () Bool)

(assert (=> b!567328 (=> (not res!358051) (not e!326412))))

(declare-fun arrayContainsKey!0 (array!35611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567328 (= res!358051 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567329 () Bool)

(assert (=> b!567329 (= e!326410 (= lt!258326 (seekEntryOrOpen!0 lt!258325 lt!258331 mask!3119)))))

(declare-fun b!567330 () Bool)

(declare-fun res!358055 () Bool)

(assert (=> b!567330 (=> (not res!358055) (not e!326412))))

(assert (=> b!567330 (= res!358055 (validKeyInArray!0 (select (arr!17102 a!3118) j!142)))))

(declare-fun b!567331 () Bool)

(declare-fun res!358056 () Bool)

(assert (=> b!567331 (=> (not res!358056) (not e!326412))))

(assert (=> b!567331 (= res!358056 (and (= (size!17467 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17467 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17467 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51908 res!358049) b!567331))

(assert (= (and b!567331 res!358056) b!567330))

(assert (= (and b!567330 res!358055) b!567322))

(assert (= (and b!567322 res!358053) b!567328))

(assert (= (and b!567328 res!358051) b!567324))

(assert (= (and b!567324 res!358058) b!567323))

(assert (= (and b!567323 res!358050) b!567327))

(assert (= (and b!567327 res!358054) b!567325))

(assert (= (and b!567325 res!358052) b!567326))

(assert (= (and b!567326 (not res!358057)) b!567329))

(declare-fun m!545441 () Bool)

(assert (=> b!567328 m!545441))

(declare-fun m!545443 () Bool)

(assert (=> b!567330 m!545443))

(assert (=> b!567330 m!545443))

(declare-fun m!545445 () Bool)

(assert (=> b!567330 m!545445))

(declare-fun m!545447 () Bool)

(assert (=> b!567324 m!545447))

(declare-fun m!545449 () Bool)

(assert (=> b!567323 m!545449))

(declare-fun m!545451 () Bool)

(assert (=> b!567327 m!545451))

(declare-fun m!545453 () Bool)

(assert (=> start!51908 m!545453))

(declare-fun m!545455 () Bool)

(assert (=> start!51908 m!545455))

(declare-fun m!545457 () Bool)

(assert (=> b!567322 m!545457))

(declare-fun m!545459 () Bool)

(assert (=> b!567329 m!545459))

(assert (=> b!567326 m!545443))

(declare-fun m!545461 () Bool)

(assert (=> b!567326 m!545461))

(declare-fun m!545463 () Bool)

(assert (=> b!567326 m!545463))

(declare-fun m!545465 () Bool)

(assert (=> b!567326 m!545465))

(assert (=> b!567326 m!545443))

(declare-fun m!545467 () Bool)

(assert (=> b!567326 m!545467))

(assert (=> b!567325 m!545443))

(declare-fun m!545469 () Bool)

(assert (=> b!567325 m!545469))

(assert (=> b!567325 m!545443))

(assert (=> b!567325 m!545443))

(declare-fun m!545471 () Bool)

(assert (=> b!567325 m!545471))

(declare-fun m!545473 () Bool)

(assert (=> b!567325 m!545473))

(declare-fun m!545475 () Bool)

(assert (=> b!567325 m!545475))

(declare-fun m!545477 () Bool)

(assert (=> b!567325 m!545477))

(declare-fun m!545479 () Bool)

(assert (=> b!567325 m!545479))

(check-sat (not b!567327) (not b!567329) (not b!567324) (not b!567323) (not start!51908) (not b!567328) (not b!567326) (not b!567325) (not b!567330) (not b!567322))
(check-sat)
(get-model)

(declare-fun b!567410 () Bool)

(declare-fun lt!258384 () SeekEntryResult!5548)

(assert (=> b!567410 (and (bvsge (index!24421 lt!258384) #b00000000000000000000000000000000) (bvslt (index!24421 lt!258384) (size!17467 lt!258331)))))

(declare-fun res!358125 () Bool)

(assert (=> b!567410 (= res!358125 (= (select (arr!17102 lt!258331) (index!24421 lt!258384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326456 () Bool)

(assert (=> b!567410 (=> res!358125 e!326456)))

(declare-fun b!567411 () Bool)

(assert (=> b!567411 (and (bvsge (index!24421 lt!258384) #b00000000000000000000000000000000) (bvslt (index!24421 lt!258384) (size!17467 lt!258331)))))

(assert (=> b!567411 (= e!326456 (= (select (arr!17102 lt!258331) (index!24421 lt!258384)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567412 () Bool)

(declare-fun e!326453 () SeekEntryResult!5548)

(declare-fun e!326457 () SeekEntryResult!5548)

(assert (=> b!567412 (= e!326453 e!326457)))

(declare-fun c!64994 () Bool)

(declare-fun lt!258385 () (_ BitVec 64))

(assert (=> b!567412 (= c!64994 (or (= lt!258385 lt!258325) (= (bvadd lt!258385 lt!258385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84083 () Bool)

(declare-fun e!326455 () Bool)

(assert (=> d!84083 e!326455))

(declare-fun c!64993 () Bool)

(assert (=> d!84083 (= c!64993 (and ((_ is Intermediate!5548) lt!258384) (undefined!6360 lt!258384)))))

(assert (=> d!84083 (= lt!258384 e!326453)))

(declare-fun c!64995 () Bool)

(assert (=> d!84083 (= c!64995 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84083 (= lt!258385 (select (arr!17102 lt!258331) lt!258328))))

(assert (=> d!84083 (validMask!0 mask!3119)))

(assert (=> d!84083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258328 lt!258325 lt!258331 mask!3119) lt!258384)))

(declare-fun b!567413 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567413 (= e!326457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258328 #b00000000000000000000000000000000 mask!3119) lt!258325 lt!258331 mask!3119))))

(declare-fun b!567414 () Bool)

(declare-fun e!326454 () Bool)

(assert (=> b!567414 (= e!326455 e!326454)))

(declare-fun res!358126 () Bool)

(assert (=> b!567414 (= res!358126 (and ((_ is Intermediate!5548) lt!258384) (not (undefined!6360 lt!258384)) (bvslt (x!53296 lt!258384) #b01111111111111111111111111111110) (bvsge (x!53296 lt!258384) #b00000000000000000000000000000000) (bvsge (x!53296 lt!258384) #b00000000000000000000000000000000)))))

(assert (=> b!567414 (=> (not res!358126) (not e!326454))))

(declare-fun b!567415 () Bool)

(assert (=> b!567415 (and (bvsge (index!24421 lt!258384) #b00000000000000000000000000000000) (bvslt (index!24421 lt!258384) (size!17467 lt!258331)))))

(declare-fun res!358127 () Bool)

(assert (=> b!567415 (= res!358127 (= (select (arr!17102 lt!258331) (index!24421 lt!258384)) lt!258325))))

(assert (=> b!567415 (=> res!358127 e!326456)))

(assert (=> b!567415 (= e!326454 e!326456)))

(declare-fun b!567416 () Bool)

(assert (=> b!567416 (= e!326453 (Intermediate!5548 true lt!258328 #b00000000000000000000000000000000))))

(declare-fun b!567417 () Bool)

(assert (=> b!567417 (= e!326455 (bvsge (x!53296 lt!258384) #b01111111111111111111111111111110))))

(declare-fun b!567418 () Bool)

(assert (=> b!567418 (= e!326457 (Intermediate!5548 false lt!258328 #b00000000000000000000000000000000))))

(assert (= (and d!84083 c!64995) b!567416))

(assert (= (and d!84083 (not c!64995)) b!567412))

(assert (= (and b!567412 c!64994) b!567418))

(assert (= (and b!567412 (not c!64994)) b!567413))

(assert (= (and d!84083 c!64993) b!567417))

(assert (= (and d!84083 (not c!64993)) b!567414))

(assert (= (and b!567414 res!358126) b!567415))

(assert (= (and b!567415 (not res!358127)) b!567410))

(assert (= (and b!567410 (not res!358125)) b!567411))

(declare-fun m!545561 () Bool)

(assert (=> b!567413 m!545561))

(assert (=> b!567413 m!545561))

(declare-fun m!545563 () Bool)

(assert (=> b!567413 m!545563))

(declare-fun m!545565 () Bool)

(assert (=> b!567411 m!545565))

(assert (=> b!567415 m!545565))

(assert (=> b!567410 m!545565))

(declare-fun m!545567 () Bool)

(assert (=> d!84083 m!545567))

(assert (=> d!84083 m!545453))

(assert (=> b!567325 d!84083))

(declare-fun b!567419 () Bool)

(declare-fun lt!258386 () SeekEntryResult!5548)

(assert (=> b!567419 (and (bvsge (index!24421 lt!258386) #b00000000000000000000000000000000) (bvslt (index!24421 lt!258386) (size!17467 a!3118)))))

(declare-fun res!358128 () Bool)

(assert (=> b!567419 (= res!358128 (= (select (arr!17102 a!3118) (index!24421 lt!258386)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326461 () Bool)

(assert (=> b!567419 (=> res!358128 e!326461)))

(declare-fun b!567420 () Bool)

(assert (=> b!567420 (and (bvsge (index!24421 lt!258386) #b00000000000000000000000000000000) (bvslt (index!24421 lt!258386) (size!17467 a!3118)))))

(assert (=> b!567420 (= e!326461 (= (select (arr!17102 a!3118) (index!24421 lt!258386)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567421 () Bool)

(declare-fun e!326458 () SeekEntryResult!5548)

(declare-fun e!326462 () SeekEntryResult!5548)

(assert (=> b!567421 (= e!326458 e!326462)))

(declare-fun lt!258387 () (_ BitVec 64))

(declare-fun c!64997 () Bool)

(assert (=> b!567421 (= c!64997 (or (= lt!258387 (select (arr!17102 a!3118) j!142)) (= (bvadd lt!258387 lt!258387) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84085 () Bool)

(declare-fun e!326460 () Bool)

(assert (=> d!84085 e!326460))

(declare-fun c!64996 () Bool)

(assert (=> d!84085 (= c!64996 (and ((_ is Intermediate!5548) lt!258386) (undefined!6360 lt!258386)))))

(assert (=> d!84085 (= lt!258386 e!326458)))

(declare-fun c!64998 () Bool)

(assert (=> d!84085 (= c!64998 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84085 (= lt!258387 (select (arr!17102 a!3118) lt!258329))))

(assert (=> d!84085 (validMask!0 mask!3119)))

(assert (=> d!84085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258329 (select (arr!17102 a!3118) j!142) a!3118 mask!3119) lt!258386)))

(declare-fun b!567422 () Bool)

(assert (=> b!567422 (= e!326462 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258329 #b00000000000000000000000000000000 mask!3119) (select (arr!17102 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567423 () Bool)

(declare-fun e!326459 () Bool)

(assert (=> b!567423 (= e!326460 e!326459)))

(declare-fun res!358129 () Bool)

(assert (=> b!567423 (= res!358129 (and ((_ is Intermediate!5548) lt!258386) (not (undefined!6360 lt!258386)) (bvslt (x!53296 lt!258386) #b01111111111111111111111111111110) (bvsge (x!53296 lt!258386) #b00000000000000000000000000000000) (bvsge (x!53296 lt!258386) #b00000000000000000000000000000000)))))

(assert (=> b!567423 (=> (not res!358129) (not e!326459))))

(declare-fun b!567424 () Bool)

(assert (=> b!567424 (and (bvsge (index!24421 lt!258386) #b00000000000000000000000000000000) (bvslt (index!24421 lt!258386) (size!17467 a!3118)))))

(declare-fun res!358130 () Bool)

(assert (=> b!567424 (= res!358130 (= (select (arr!17102 a!3118) (index!24421 lt!258386)) (select (arr!17102 a!3118) j!142)))))

(assert (=> b!567424 (=> res!358130 e!326461)))

(assert (=> b!567424 (= e!326459 e!326461)))

(declare-fun b!567425 () Bool)

(assert (=> b!567425 (= e!326458 (Intermediate!5548 true lt!258329 #b00000000000000000000000000000000))))

(declare-fun b!567426 () Bool)

(assert (=> b!567426 (= e!326460 (bvsge (x!53296 lt!258386) #b01111111111111111111111111111110))))

(declare-fun b!567427 () Bool)

(assert (=> b!567427 (= e!326462 (Intermediate!5548 false lt!258329 #b00000000000000000000000000000000))))

(assert (= (and d!84085 c!64998) b!567425))

(assert (= (and d!84085 (not c!64998)) b!567421))

(assert (= (and b!567421 c!64997) b!567427))

(assert (= (and b!567421 (not c!64997)) b!567422))

(assert (= (and d!84085 c!64996) b!567426))

(assert (= (and d!84085 (not c!64996)) b!567423))

(assert (= (and b!567423 res!358129) b!567424))

(assert (= (and b!567424 (not res!358130)) b!567419))

(assert (= (and b!567419 (not res!358128)) b!567420))

(declare-fun m!545569 () Bool)

(assert (=> b!567422 m!545569))

(assert (=> b!567422 m!545569))

(assert (=> b!567422 m!545443))

(declare-fun m!545571 () Bool)

(assert (=> b!567422 m!545571))

(declare-fun m!545573 () Bool)

(assert (=> b!567420 m!545573))

(assert (=> b!567424 m!545573))

(assert (=> b!567419 m!545573))

(declare-fun m!545575 () Bool)

(assert (=> d!84085 m!545575))

(assert (=> d!84085 m!545453))

(assert (=> b!567325 d!84085))

(declare-fun d!84087 () Bool)

(declare-fun lt!258393 () (_ BitVec 32))

(declare-fun lt!258392 () (_ BitVec 32))

(assert (=> d!84087 (= lt!258393 (bvmul (bvxor lt!258392 (bvlshr lt!258392 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84087 (= lt!258392 ((_ extract 31 0) (bvand (bvxor lt!258325 (bvlshr lt!258325 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84087 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358131 (let ((h!12232 ((_ extract 31 0) (bvand (bvxor lt!258325 (bvlshr lt!258325 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53300 (bvmul (bvxor h!12232 (bvlshr h!12232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53300 (bvlshr x!53300 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358131 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358131 #b00000000000000000000000000000000))))))

(assert (=> d!84087 (= (toIndex!0 lt!258325 mask!3119) (bvand (bvxor lt!258393 (bvlshr lt!258393 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567325 d!84087))

(declare-fun d!84095 () Bool)

(declare-fun lt!258395 () (_ BitVec 32))

(declare-fun lt!258394 () (_ BitVec 32))

(assert (=> d!84095 (= lt!258395 (bvmul (bvxor lt!258394 (bvlshr lt!258394 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84095 (= lt!258394 ((_ extract 31 0) (bvand (bvxor (select (arr!17102 a!3118) j!142) (bvlshr (select (arr!17102 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84095 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358131 (let ((h!12232 ((_ extract 31 0) (bvand (bvxor (select (arr!17102 a!3118) j!142) (bvlshr (select (arr!17102 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53300 (bvmul (bvxor h!12232 (bvlshr h!12232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53300 (bvlshr x!53300 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358131 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358131 #b00000000000000000000000000000000))))))

(assert (=> d!84095 (= (toIndex!0 (select (arr!17102 a!3118) j!142) mask!3119) (bvand (bvxor lt!258395 (bvlshr lt!258395 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567325 d!84095))

(declare-fun d!84097 () Bool)

(assert (=> d!84097 (= (validKeyInArray!0 (select (arr!17102 a!3118) j!142)) (and (not (= (select (arr!17102 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17102 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567330 d!84097))

(declare-fun b!567452 () Bool)

(declare-fun e!326477 () SeekEntryResult!5548)

(declare-fun lt!258410 () SeekEntryResult!5548)

(assert (=> b!567452 (= e!326477 (Found!5548 (index!24421 lt!258410)))))

(declare-fun b!567453 () Bool)

(declare-fun e!326476 () SeekEntryResult!5548)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35611 (_ BitVec 32)) SeekEntryResult!5548)

(assert (=> b!567453 (= e!326476 (seekKeyOrZeroReturnVacant!0 (x!53296 lt!258410) (index!24421 lt!258410) (index!24421 lt!258410) lt!258325 lt!258331 mask!3119))))

(declare-fun b!567454 () Bool)

(declare-fun e!326475 () SeekEntryResult!5548)

(assert (=> b!567454 (= e!326475 Undefined!5548)))

(declare-fun d!84099 () Bool)

(declare-fun lt!258409 () SeekEntryResult!5548)

(assert (=> d!84099 (and (or ((_ is Undefined!5548) lt!258409) (not ((_ is Found!5548) lt!258409)) (and (bvsge (index!24420 lt!258409) #b00000000000000000000000000000000) (bvslt (index!24420 lt!258409) (size!17467 lt!258331)))) (or ((_ is Undefined!5548) lt!258409) ((_ is Found!5548) lt!258409) (not ((_ is MissingZero!5548) lt!258409)) (and (bvsge (index!24419 lt!258409) #b00000000000000000000000000000000) (bvslt (index!24419 lt!258409) (size!17467 lt!258331)))) (or ((_ is Undefined!5548) lt!258409) ((_ is Found!5548) lt!258409) ((_ is MissingZero!5548) lt!258409) (not ((_ is MissingVacant!5548) lt!258409)) (and (bvsge (index!24422 lt!258409) #b00000000000000000000000000000000) (bvslt (index!24422 lt!258409) (size!17467 lt!258331)))) (or ((_ is Undefined!5548) lt!258409) (ite ((_ is Found!5548) lt!258409) (= (select (arr!17102 lt!258331) (index!24420 lt!258409)) lt!258325) (ite ((_ is MissingZero!5548) lt!258409) (= (select (arr!17102 lt!258331) (index!24419 lt!258409)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5548) lt!258409) (= (select (arr!17102 lt!258331) (index!24422 lt!258409)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84099 (= lt!258409 e!326475)))

(declare-fun c!65011 () Bool)

(assert (=> d!84099 (= c!65011 (and ((_ is Intermediate!5548) lt!258410) (undefined!6360 lt!258410)))))

(assert (=> d!84099 (= lt!258410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258325 mask!3119) lt!258325 lt!258331 mask!3119))))

(assert (=> d!84099 (validMask!0 mask!3119)))

(assert (=> d!84099 (= (seekEntryOrOpen!0 lt!258325 lt!258331 mask!3119) lt!258409)))

(declare-fun b!567455 () Bool)

(assert (=> b!567455 (= e!326475 e!326477)))

(declare-fun lt!258408 () (_ BitVec 64))

(assert (=> b!567455 (= lt!258408 (select (arr!17102 lt!258331) (index!24421 lt!258410)))))

(declare-fun c!65013 () Bool)

(assert (=> b!567455 (= c!65013 (= lt!258408 lt!258325))))

(declare-fun b!567456 () Bool)

(assert (=> b!567456 (= e!326476 (MissingZero!5548 (index!24421 lt!258410)))))

(declare-fun b!567457 () Bool)

(declare-fun c!65012 () Bool)

(assert (=> b!567457 (= c!65012 (= lt!258408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567457 (= e!326477 e!326476)))

(assert (= (and d!84099 c!65011) b!567454))

(assert (= (and d!84099 (not c!65011)) b!567455))

(assert (= (and b!567455 c!65013) b!567452))

(assert (= (and b!567455 (not c!65013)) b!567457))

(assert (= (and b!567457 c!65012) b!567456))

(assert (= (and b!567457 (not c!65012)) b!567453))

(declare-fun m!545577 () Bool)

(assert (=> b!567453 m!545577))

(declare-fun m!545579 () Bool)

(assert (=> d!84099 m!545579))

(assert (=> d!84099 m!545477))

(declare-fun m!545581 () Bool)

(assert (=> d!84099 m!545581))

(assert (=> d!84099 m!545453))

(declare-fun m!545583 () Bool)

(assert (=> d!84099 m!545583))

(declare-fun m!545585 () Bool)

(assert (=> d!84099 m!545585))

(assert (=> d!84099 m!545477))

(declare-fun m!545587 () Bool)

(assert (=> b!567455 m!545587))

(assert (=> b!567329 d!84099))

(declare-fun b!567458 () Bool)

(declare-fun e!326480 () SeekEntryResult!5548)

(declare-fun lt!258417 () SeekEntryResult!5548)

(assert (=> b!567458 (= e!326480 (Found!5548 (index!24421 lt!258417)))))

(declare-fun b!567459 () Bool)

(declare-fun e!326479 () SeekEntryResult!5548)

(assert (=> b!567459 (= e!326479 (seekKeyOrZeroReturnVacant!0 (x!53296 lt!258417) (index!24421 lt!258417) (index!24421 lt!258417) k0!1914 a!3118 mask!3119))))

(declare-fun b!567460 () Bool)

(declare-fun e!326478 () SeekEntryResult!5548)

(assert (=> b!567460 (= e!326478 Undefined!5548)))

(declare-fun d!84101 () Bool)

(declare-fun lt!258416 () SeekEntryResult!5548)

(assert (=> d!84101 (and (or ((_ is Undefined!5548) lt!258416) (not ((_ is Found!5548) lt!258416)) (and (bvsge (index!24420 lt!258416) #b00000000000000000000000000000000) (bvslt (index!24420 lt!258416) (size!17467 a!3118)))) (or ((_ is Undefined!5548) lt!258416) ((_ is Found!5548) lt!258416) (not ((_ is MissingZero!5548) lt!258416)) (and (bvsge (index!24419 lt!258416) #b00000000000000000000000000000000) (bvslt (index!24419 lt!258416) (size!17467 a!3118)))) (or ((_ is Undefined!5548) lt!258416) ((_ is Found!5548) lt!258416) ((_ is MissingZero!5548) lt!258416) (not ((_ is MissingVacant!5548) lt!258416)) (and (bvsge (index!24422 lt!258416) #b00000000000000000000000000000000) (bvslt (index!24422 lt!258416) (size!17467 a!3118)))) (or ((_ is Undefined!5548) lt!258416) (ite ((_ is Found!5548) lt!258416) (= (select (arr!17102 a!3118) (index!24420 lt!258416)) k0!1914) (ite ((_ is MissingZero!5548) lt!258416) (= (select (arr!17102 a!3118) (index!24419 lt!258416)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5548) lt!258416) (= (select (arr!17102 a!3118) (index!24422 lt!258416)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84101 (= lt!258416 e!326478)))

(declare-fun c!65014 () Bool)

(assert (=> d!84101 (= c!65014 (and ((_ is Intermediate!5548) lt!258417) (undefined!6360 lt!258417)))))

(assert (=> d!84101 (= lt!258417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84101 (validMask!0 mask!3119)))

(assert (=> d!84101 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258416)))

(declare-fun b!567461 () Bool)

(assert (=> b!567461 (= e!326478 e!326480)))

(declare-fun lt!258415 () (_ BitVec 64))

(assert (=> b!567461 (= lt!258415 (select (arr!17102 a!3118) (index!24421 lt!258417)))))

(declare-fun c!65016 () Bool)

(assert (=> b!567461 (= c!65016 (= lt!258415 k0!1914))))

(declare-fun b!567462 () Bool)

(assert (=> b!567462 (= e!326479 (MissingZero!5548 (index!24421 lt!258417)))))

(declare-fun b!567463 () Bool)

(declare-fun c!65015 () Bool)

(assert (=> b!567463 (= c!65015 (= lt!258415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567463 (= e!326480 e!326479)))

(assert (= (and d!84101 c!65014) b!567460))

(assert (= (and d!84101 (not c!65014)) b!567461))

(assert (= (and b!567461 c!65016) b!567458))

(assert (= (and b!567461 (not c!65016)) b!567463))

(assert (= (and b!567463 c!65015) b!567462))

(assert (= (and b!567463 (not c!65015)) b!567459))

(declare-fun m!545589 () Bool)

(assert (=> b!567459 m!545589))

(declare-fun m!545591 () Bool)

(assert (=> d!84101 m!545591))

(declare-fun m!545593 () Bool)

(assert (=> d!84101 m!545593))

(declare-fun m!545595 () Bool)

(assert (=> d!84101 m!545595))

(assert (=> d!84101 m!545453))

(declare-fun m!545597 () Bool)

(assert (=> d!84101 m!545597))

(declare-fun m!545599 () Bool)

(assert (=> d!84101 m!545599))

(assert (=> d!84101 m!545593))

(declare-fun m!545601 () Bool)

(assert (=> b!567461 m!545601))

(assert (=> b!567324 d!84101))

(declare-fun d!84103 () Bool)

(assert (=> d!84103 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567322 d!84103))

(declare-fun b!567505 () Bool)

(declare-fun e!326506 () Bool)

(declare-fun e!326507 () Bool)

(assert (=> b!567505 (= e!326506 e!326507)))

(declare-fun lt!258429 () (_ BitVec 64))

(assert (=> b!567505 (= lt!258429 (select (arr!17102 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258430 () Unit!17784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35611 (_ BitVec 64) (_ BitVec 32)) Unit!17784)

(assert (=> b!567505 (= lt!258430 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258429 #b00000000000000000000000000000000))))

(assert (=> b!567505 (arrayContainsKey!0 a!3118 lt!258429 #b00000000000000000000000000000000)))

(declare-fun lt!258431 () Unit!17784)

(assert (=> b!567505 (= lt!258431 lt!258430)))

(declare-fun res!358145 () Bool)

(assert (=> b!567505 (= res!358145 (= (seekEntryOrOpen!0 (select (arr!17102 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5548 #b00000000000000000000000000000000)))))

(assert (=> b!567505 (=> (not res!358145) (not e!326507))))

(declare-fun bm!32494 () Bool)

(declare-fun call!32497 () Bool)

(assert (=> bm!32494 (= call!32497 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567506 () Bool)

(declare-fun e!326505 () Bool)

(assert (=> b!567506 (= e!326505 e!326506)))

(declare-fun c!65031 () Bool)

(assert (=> b!567506 (= c!65031 (validKeyInArray!0 (select (arr!17102 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84105 () Bool)

(declare-fun res!358146 () Bool)

(assert (=> d!84105 (=> res!358146 e!326505)))

(assert (=> d!84105 (= res!358146 (bvsge #b00000000000000000000000000000000 (size!17467 a!3118)))))

(assert (=> d!84105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326505)))

(declare-fun b!567507 () Bool)

(assert (=> b!567507 (= e!326507 call!32497)))

(declare-fun b!567508 () Bool)

(assert (=> b!567508 (= e!326506 call!32497)))

(assert (= (and d!84105 (not res!358146)) b!567506))

(assert (= (and b!567506 c!65031) b!567505))

(assert (= (and b!567506 (not c!65031)) b!567508))

(assert (= (and b!567505 res!358145) b!567507))

(assert (= (or b!567507 b!567508) bm!32494))

(declare-fun m!545619 () Bool)

(assert (=> b!567505 m!545619))

(declare-fun m!545621 () Bool)

(assert (=> b!567505 m!545621))

(declare-fun m!545625 () Bool)

(assert (=> b!567505 m!545625))

(assert (=> b!567505 m!545619))

(declare-fun m!545629 () Bool)

(assert (=> b!567505 m!545629))

(declare-fun m!545631 () Bool)

(assert (=> bm!32494 m!545631))

(assert (=> b!567506 m!545619))

(assert (=> b!567506 m!545619))

(declare-fun m!545633 () Bool)

(assert (=> b!567506 m!545633))

(assert (=> b!567323 d!84105))

(declare-fun d!84109 () Bool)

(declare-fun res!358154 () Bool)

(declare-fun e!326517 () Bool)

(assert (=> d!84109 (=> res!358154 e!326517)))

(assert (=> d!84109 (= res!358154 (= (select (arr!17102 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84109 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326517)))

(declare-fun b!567522 () Bool)

(declare-fun e!326518 () Bool)

(assert (=> b!567522 (= e!326517 e!326518)))

(declare-fun res!358155 () Bool)

(assert (=> b!567522 (=> (not res!358155) (not e!326518))))

(assert (=> b!567522 (= res!358155 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17467 a!3118)))))

(declare-fun b!567523 () Bool)

(assert (=> b!567523 (= e!326518 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84109 (not res!358154)) b!567522))

(assert (= (and b!567522 res!358155) b!567523))

(assert (=> d!84109 m!545619))

(declare-fun m!545643 () Bool)

(assert (=> b!567523 m!545643))

(assert (=> b!567328 d!84109))

(declare-fun d!84115 () Bool)

(assert (=> d!84115 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51908 d!84115))

(declare-fun d!84123 () Bool)

(assert (=> d!84123 (= (array_inv!12985 a!3118) (bvsge (size!17467 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51908 d!84123))

(declare-fun b!567536 () Bool)

(declare-fun e!326530 () SeekEntryResult!5548)

(declare-fun lt!258453 () SeekEntryResult!5548)

(assert (=> b!567536 (= e!326530 (Found!5548 (index!24421 lt!258453)))))

(declare-fun e!326529 () SeekEntryResult!5548)

(declare-fun b!567537 () Bool)

(assert (=> b!567537 (= e!326529 (seekKeyOrZeroReturnVacant!0 (x!53296 lt!258453) (index!24421 lt!258453) (index!24421 lt!258453) (select (arr!17102 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567538 () Bool)

(declare-fun e!326528 () SeekEntryResult!5548)

(assert (=> b!567538 (= e!326528 Undefined!5548)))

(declare-fun d!84125 () Bool)

(declare-fun lt!258452 () SeekEntryResult!5548)

(assert (=> d!84125 (and (or ((_ is Undefined!5548) lt!258452) (not ((_ is Found!5548) lt!258452)) (and (bvsge (index!24420 lt!258452) #b00000000000000000000000000000000) (bvslt (index!24420 lt!258452) (size!17467 a!3118)))) (or ((_ is Undefined!5548) lt!258452) ((_ is Found!5548) lt!258452) (not ((_ is MissingZero!5548) lt!258452)) (and (bvsge (index!24419 lt!258452) #b00000000000000000000000000000000) (bvslt (index!24419 lt!258452) (size!17467 a!3118)))) (or ((_ is Undefined!5548) lt!258452) ((_ is Found!5548) lt!258452) ((_ is MissingZero!5548) lt!258452) (not ((_ is MissingVacant!5548) lt!258452)) (and (bvsge (index!24422 lt!258452) #b00000000000000000000000000000000) (bvslt (index!24422 lt!258452) (size!17467 a!3118)))) (or ((_ is Undefined!5548) lt!258452) (ite ((_ is Found!5548) lt!258452) (= (select (arr!17102 a!3118) (index!24420 lt!258452)) (select (arr!17102 a!3118) j!142)) (ite ((_ is MissingZero!5548) lt!258452) (= (select (arr!17102 a!3118) (index!24419 lt!258452)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5548) lt!258452) (= (select (arr!17102 a!3118) (index!24422 lt!258452)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84125 (= lt!258452 e!326528)))

(declare-fun c!65038 () Bool)

(assert (=> d!84125 (= c!65038 (and ((_ is Intermediate!5548) lt!258453) (undefined!6360 lt!258453)))))

(assert (=> d!84125 (= lt!258453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17102 a!3118) j!142) mask!3119) (select (arr!17102 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84125 (validMask!0 mask!3119)))

(assert (=> d!84125 (= (seekEntryOrOpen!0 (select (arr!17102 a!3118) j!142) a!3118 mask!3119) lt!258452)))

(declare-fun b!567539 () Bool)

(assert (=> b!567539 (= e!326528 e!326530)))

(declare-fun lt!258451 () (_ BitVec 64))

(assert (=> b!567539 (= lt!258451 (select (arr!17102 a!3118) (index!24421 lt!258453)))))

(declare-fun c!65040 () Bool)

(assert (=> b!567539 (= c!65040 (= lt!258451 (select (arr!17102 a!3118) j!142)))))

(declare-fun b!567540 () Bool)

(assert (=> b!567540 (= e!326529 (MissingZero!5548 (index!24421 lt!258453)))))

(declare-fun b!567541 () Bool)

(declare-fun c!65039 () Bool)

(assert (=> b!567541 (= c!65039 (= lt!258451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567541 (= e!326530 e!326529)))

(assert (= (and d!84125 c!65038) b!567538))

(assert (= (and d!84125 (not c!65038)) b!567539))

(assert (= (and b!567539 c!65040) b!567536))

(assert (= (and b!567539 (not c!65040)) b!567541))

(assert (= (and b!567541 c!65039) b!567540))

(assert (= (and b!567541 (not c!65039)) b!567537))

(assert (=> b!567537 m!545443))

(declare-fun m!545657 () Bool)

(assert (=> b!567537 m!545657))

(declare-fun m!545659 () Bool)

(assert (=> d!84125 m!545659))

(assert (=> d!84125 m!545469))

(assert (=> d!84125 m!545443))

(declare-fun m!545661 () Bool)

(assert (=> d!84125 m!545661))

(assert (=> d!84125 m!545453))

(declare-fun m!545663 () Bool)

(assert (=> d!84125 m!545663))

(declare-fun m!545665 () Bool)

(assert (=> d!84125 m!545665))

(assert (=> d!84125 m!545443))

(assert (=> d!84125 m!545469))

(declare-fun m!545667 () Bool)

(assert (=> b!567539 m!545667))

(assert (=> b!567326 d!84125))

(declare-fun b!567542 () Bool)

(declare-fun e!326532 () Bool)

(declare-fun e!326533 () Bool)

(assert (=> b!567542 (= e!326532 e!326533)))

(declare-fun lt!258454 () (_ BitVec 64))

(assert (=> b!567542 (= lt!258454 (select (arr!17102 a!3118) j!142))))

(declare-fun lt!258455 () Unit!17784)

(assert (=> b!567542 (= lt!258455 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258454 j!142))))

(assert (=> b!567542 (arrayContainsKey!0 a!3118 lt!258454 #b00000000000000000000000000000000)))

(declare-fun lt!258456 () Unit!17784)

(assert (=> b!567542 (= lt!258456 lt!258455)))

(declare-fun res!358163 () Bool)

(assert (=> b!567542 (= res!358163 (= (seekEntryOrOpen!0 (select (arr!17102 a!3118) j!142) a!3118 mask!3119) (Found!5548 j!142)))))

(assert (=> b!567542 (=> (not res!358163) (not e!326533))))

(declare-fun call!32501 () Bool)

(declare-fun bm!32498 () Bool)

(assert (=> bm!32498 (= call!32501 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567543 () Bool)

(declare-fun e!326531 () Bool)

(assert (=> b!567543 (= e!326531 e!326532)))

(declare-fun c!65041 () Bool)

(assert (=> b!567543 (= c!65041 (validKeyInArray!0 (select (arr!17102 a!3118) j!142)))))

(declare-fun d!84129 () Bool)

(declare-fun res!358164 () Bool)

(assert (=> d!84129 (=> res!358164 e!326531)))

(assert (=> d!84129 (= res!358164 (bvsge j!142 (size!17467 a!3118)))))

(assert (=> d!84129 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326531)))

(declare-fun b!567544 () Bool)

(assert (=> b!567544 (= e!326533 call!32501)))

(declare-fun b!567545 () Bool)

(assert (=> b!567545 (= e!326532 call!32501)))

(assert (= (and d!84129 (not res!358164)) b!567543))

(assert (= (and b!567543 c!65041) b!567542))

(assert (= (and b!567543 (not c!65041)) b!567545))

(assert (= (and b!567542 res!358163) b!567544))

(assert (= (or b!567544 b!567545) bm!32498))

(assert (=> b!567542 m!545443))

(declare-fun m!545669 () Bool)

(assert (=> b!567542 m!545669))

(declare-fun m!545671 () Bool)

(assert (=> b!567542 m!545671))

(assert (=> b!567542 m!545443))

(assert (=> b!567542 m!545467))

(declare-fun m!545673 () Bool)

(assert (=> bm!32498 m!545673))

(assert (=> b!567543 m!545443))

(assert (=> b!567543 m!545443))

(assert (=> b!567543 m!545445))

(assert (=> b!567326 d!84129))

(declare-fun d!84131 () Bool)

(assert (=> d!84131 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258459 () Unit!17784)

(declare-fun choose!38 (array!35611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17784)

(assert (=> d!84131 (= lt!258459 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84131 (validMask!0 mask!3119)))

(assert (=> d!84131 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258459)))

(declare-fun bs!17593 () Bool)

(assert (= bs!17593 d!84131))

(assert (=> bs!17593 m!545463))

(declare-fun m!545675 () Bool)

(assert (=> bs!17593 m!545675))

(assert (=> bs!17593 m!545453))

(assert (=> b!567326 d!84131))

(declare-fun b!567556 () Bool)

(declare-fun e!326543 () Bool)

(declare-fun e!326545 () Bool)

(assert (=> b!567556 (= e!326543 e!326545)))

(declare-fun c!65044 () Bool)

(assert (=> b!567556 (= c!65044 (validKeyInArray!0 (select (arr!17102 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32501 () Bool)

(declare-fun call!32504 () Bool)

(assert (=> bm!32501 (= call!32504 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65044 (Cons!11217 (select (arr!17102 a!3118) #b00000000000000000000000000000000) Nil!11218) Nil!11218)))))

(declare-fun b!567558 () Bool)

(assert (=> b!567558 (= e!326545 call!32504)))

(declare-fun b!567559 () Bool)

(declare-fun e!326544 () Bool)

(declare-fun contains!2851 (List!11221 (_ BitVec 64)) Bool)

(assert (=> b!567559 (= e!326544 (contains!2851 Nil!11218 (select (arr!17102 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567560 () Bool)

(assert (=> b!567560 (= e!326545 call!32504)))

(declare-fun d!84133 () Bool)

(declare-fun res!358171 () Bool)

(declare-fun e!326542 () Bool)

(assert (=> d!84133 (=> res!358171 e!326542)))

(assert (=> d!84133 (= res!358171 (bvsge #b00000000000000000000000000000000 (size!17467 a!3118)))))

(assert (=> d!84133 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11218) e!326542)))

(declare-fun b!567557 () Bool)

(assert (=> b!567557 (= e!326542 e!326543)))

(declare-fun res!358172 () Bool)

(assert (=> b!567557 (=> (not res!358172) (not e!326543))))

(assert (=> b!567557 (= res!358172 (not e!326544))))

(declare-fun res!358173 () Bool)

(assert (=> b!567557 (=> (not res!358173) (not e!326544))))

(assert (=> b!567557 (= res!358173 (validKeyInArray!0 (select (arr!17102 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84133 (not res!358171)) b!567557))

(assert (= (and b!567557 res!358173) b!567559))

(assert (= (and b!567557 res!358172) b!567556))

(assert (= (and b!567556 c!65044) b!567558))

(assert (= (and b!567556 (not c!65044)) b!567560))

(assert (= (or b!567558 b!567560) bm!32501))

(assert (=> b!567556 m!545619))

(assert (=> b!567556 m!545619))

(assert (=> b!567556 m!545633))

(assert (=> bm!32501 m!545619))

(declare-fun m!545677 () Bool)

(assert (=> bm!32501 m!545677))

(assert (=> b!567559 m!545619))

(assert (=> b!567559 m!545619))

(declare-fun m!545679 () Bool)

(assert (=> b!567559 m!545679))

(assert (=> b!567557 m!545619))

(assert (=> b!567557 m!545619))

(assert (=> b!567557 m!545633))

(assert (=> b!567327 d!84133))

(check-sat (not bm!32494) (not b!567506) (not b!567556) (not b!567542) (not b!567505) (not d!84083) (not b!567422) (not b!567453) (not d!84131) (not b!567557) (not b!567543) (not b!567537) (not b!567413) (not b!567459) (not d!84099) (not d!84125) (not b!567559) (not b!567523) (not d!84101) (not bm!32498) (not d!84085) (not bm!32501))
(check-sat)
