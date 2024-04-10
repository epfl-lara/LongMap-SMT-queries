; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67918 () Bool)

(assert start!67918)

(declare-fun b!790475 () Bool)

(declare-fun res!535576 () Bool)

(declare-fun e!439329 () Bool)

(assert (=> b!790475 (=> (not res!535576) (not e!439329))))

(declare-datatypes ((array!42895 0))(
  ( (array!42896 (arr!20534 (Array (_ BitVec 32) (_ BitVec 64))) (size!20955 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42895)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790475 (= res!535576 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!535575 () Bool)

(assert (=> start!67918 (=> (not res!535575) (not e!439329))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67918 (= res!535575 (validMask!0 mask!3328))))

(assert (=> start!67918 e!439329))

(assert (=> start!67918 true))

(declare-fun array_inv!16330 (array!42895) Bool)

(assert (=> start!67918 (array_inv!16330 a!3186)))

(declare-fun b!790476 () Bool)

(declare-fun res!535588 () Bool)

(declare-fun e!439334 () Bool)

(assert (=> b!790476 (=> (not res!535588) (not e!439334))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790476 (= res!535588 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20534 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790477 () Bool)

(declare-fun res!535581 () Bool)

(assert (=> b!790477 (=> (not res!535581) (not e!439329))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790477 (= res!535581 (validKeyInArray!0 (select (arr!20534 a!3186) j!159)))))

(declare-fun b!790478 () Bool)

(declare-fun res!535583 () Bool)

(declare-fun e!439327 () Bool)

(assert (=> b!790478 (=> (not res!535583) (not e!439327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42895 (_ BitVec 32)) Bool)

(assert (=> b!790478 (= res!535583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790479 () Bool)

(declare-fun res!535580 () Bool)

(assert (=> b!790479 (=> (not res!535580) (not e!439327))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790479 (= res!535580 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20955 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20955 a!3186))))))

(declare-fun b!790480 () Bool)

(assert (=> b!790480 (= e!439329 e!439327)))

(declare-fun res!535584 () Bool)

(assert (=> b!790480 (=> (not res!535584) (not e!439327))))

(declare-datatypes ((SeekEntryResult!8134 0))(
  ( (MissingZero!8134 (index!34904 (_ BitVec 32))) (Found!8134 (index!34905 (_ BitVec 32))) (Intermediate!8134 (undefined!8946 Bool) (index!34906 (_ BitVec 32)) (x!65835 (_ BitVec 32))) (Undefined!8134) (MissingVacant!8134 (index!34907 (_ BitVec 32))) )
))
(declare-fun lt!352903 () SeekEntryResult!8134)

(assert (=> b!790480 (= res!535584 (or (= lt!352903 (MissingZero!8134 i!1173)) (= lt!352903 (MissingVacant!8134 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42895 (_ BitVec 32)) SeekEntryResult!8134)

(assert (=> b!790480 (= lt!352903 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!790481 () Bool)

(assert (=> b!790481 (= e!439327 e!439334)))

(declare-fun res!535589 () Bool)

(assert (=> b!790481 (=> (not res!535589) (not e!439334))))

(declare-fun lt!352901 () SeekEntryResult!8134)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42895 (_ BitVec 32)) SeekEntryResult!8134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790481 (= res!535589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352901))))

(assert (=> b!790481 (= lt!352901 (Intermediate!8134 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790482 () Bool)

(declare-fun res!535577 () Bool)

(assert (=> b!790482 (=> (not res!535577) (not e!439334))))

(declare-fun e!439332 () Bool)

(assert (=> b!790482 (= res!535577 e!439332)))

(declare-fun c!87859 () Bool)

(assert (=> b!790482 (= c!87859 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790483 () Bool)

(declare-fun res!535585 () Bool)

(assert (=> b!790483 (=> (not res!535585) (not e!439327))))

(declare-datatypes ((List!14536 0))(
  ( (Nil!14533) (Cons!14532 (h!15658 (_ BitVec 64)) (t!20851 List!14536)) )
))
(declare-fun arrayNoDuplicates!0 (array!42895 (_ BitVec 32) List!14536) Bool)

(assert (=> b!790483 (= res!535585 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14533))))

(declare-fun b!790484 () Bool)

(declare-fun res!535578 () Bool)

(assert (=> b!790484 (=> (not res!535578) (not e!439329))))

(assert (=> b!790484 (= res!535578 (and (= (size!20955 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20955 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20955 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790485 () Bool)

(declare-fun e!439328 () Bool)

(declare-fun lt!352897 () SeekEntryResult!8134)

(assert (=> b!790485 (= e!439328 (not (is-Intermediate!8134 lt!352897)))))

(declare-fun e!439333 () Bool)

(assert (=> b!790485 e!439333))

(declare-fun res!535579 () Bool)

(assert (=> b!790485 (=> (not res!535579) (not e!439333))))

(assert (=> b!790485 (= res!535579 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27420 0))(
  ( (Unit!27421) )
))
(declare-fun lt!352898 () Unit!27420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27420)

(assert (=> b!790485 (= lt!352898 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790486 () Bool)

(assert (=> b!790486 (= e!439332 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352901))))

(declare-fun b!790487 () Bool)

(declare-fun e!439330 () Bool)

(assert (=> b!790487 (= e!439333 e!439330)))

(declare-fun res!535586 () Bool)

(assert (=> b!790487 (=> (not res!535586) (not e!439330))))

(declare-fun lt!352904 () SeekEntryResult!8134)

(assert (=> b!790487 (= res!535586 (= (seekEntryOrOpen!0 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352904))))

(assert (=> b!790487 (= lt!352904 (Found!8134 j!159))))

(declare-fun b!790488 () Bool)

(declare-fun res!535582 () Bool)

(assert (=> b!790488 (=> (not res!535582) (not e!439329))))

(assert (=> b!790488 (= res!535582 (validKeyInArray!0 k!2102))))

(declare-fun b!790489 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42895 (_ BitVec 32)) SeekEntryResult!8134)

(assert (=> b!790489 (= e!439330 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352904))))

(declare-fun b!790490 () Bool)

(assert (=> b!790490 (= e!439334 e!439328)))

(declare-fun res!535587 () Bool)

(assert (=> b!790490 (=> (not res!535587) (not e!439328))))

(declare-fun lt!352899 () SeekEntryResult!8134)

(assert (=> b!790490 (= res!535587 (= lt!352899 lt!352897))))

(declare-fun lt!352900 () array!42895)

(declare-fun lt!352902 () (_ BitVec 64))

(assert (=> b!790490 (= lt!352897 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352902 lt!352900 mask!3328))))

(assert (=> b!790490 (= lt!352899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352902 mask!3328) lt!352902 lt!352900 mask!3328))))

(assert (=> b!790490 (= lt!352902 (select (store (arr!20534 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!790490 (= lt!352900 (array!42896 (store (arr!20534 a!3186) i!1173 k!2102) (size!20955 a!3186)))))

(declare-fun b!790491 () Bool)

(assert (=> b!790491 (= e!439332 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) (Found!8134 j!159)))))

(assert (= (and start!67918 res!535575) b!790484))

(assert (= (and b!790484 res!535578) b!790477))

(assert (= (and b!790477 res!535581) b!790488))

(assert (= (and b!790488 res!535582) b!790475))

(assert (= (and b!790475 res!535576) b!790480))

(assert (= (and b!790480 res!535584) b!790478))

(assert (= (and b!790478 res!535583) b!790483))

(assert (= (and b!790483 res!535585) b!790479))

(assert (= (and b!790479 res!535580) b!790481))

(assert (= (and b!790481 res!535589) b!790476))

(assert (= (and b!790476 res!535588) b!790482))

(assert (= (and b!790482 c!87859) b!790486))

(assert (= (and b!790482 (not c!87859)) b!790491))

(assert (= (and b!790482 res!535577) b!790490))

(assert (= (and b!790490 res!535587) b!790485))

(assert (= (and b!790485 res!535579) b!790487))

(assert (= (and b!790487 res!535586) b!790489))

(declare-fun m!731401 () Bool)

(assert (=> b!790488 m!731401))

(declare-fun m!731403 () Bool)

(assert (=> start!67918 m!731403))

(declare-fun m!731405 () Bool)

(assert (=> start!67918 m!731405))

(declare-fun m!731407 () Bool)

(assert (=> b!790491 m!731407))

(assert (=> b!790491 m!731407))

(declare-fun m!731409 () Bool)

(assert (=> b!790491 m!731409))

(declare-fun m!731411 () Bool)

(assert (=> b!790476 m!731411))

(declare-fun m!731413 () Bool)

(assert (=> b!790485 m!731413))

(declare-fun m!731415 () Bool)

(assert (=> b!790485 m!731415))

(declare-fun m!731417 () Bool)

(assert (=> b!790490 m!731417))

(declare-fun m!731419 () Bool)

(assert (=> b!790490 m!731419))

(declare-fun m!731421 () Bool)

(assert (=> b!790490 m!731421))

(declare-fun m!731423 () Bool)

(assert (=> b!790490 m!731423))

(assert (=> b!790490 m!731417))

(declare-fun m!731425 () Bool)

(assert (=> b!790490 m!731425))

(assert (=> b!790481 m!731407))

(assert (=> b!790481 m!731407))

(declare-fun m!731427 () Bool)

(assert (=> b!790481 m!731427))

(assert (=> b!790481 m!731427))

(assert (=> b!790481 m!731407))

(declare-fun m!731429 () Bool)

(assert (=> b!790481 m!731429))

(assert (=> b!790489 m!731407))

(assert (=> b!790489 m!731407))

(declare-fun m!731431 () Bool)

(assert (=> b!790489 m!731431))

(assert (=> b!790477 m!731407))

(assert (=> b!790477 m!731407))

(declare-fun m!731433 () Bool)

(assert (=> b!790477 m!731433))

(declare-fun m!731435 () Bool)

(assert (=> b!790483 m!731435))

(assert (=> b!790486 m!731407))

(assert (=> b!790486 m!731407))

(declare-fun m!731437 () Bool)

(assert (=> b!790486 m!731437))

(declare-fun m!731439 () Bool)

(assert (=> b!790478 m!731439))

(assert (=> b!790487 m!731407))

(assert (=> b!790487 m!731407))

(declare-fun m!731441 () Bool)

(assert (=> b!790487 m!731441))

(declare-fun m!731443 () Bool)

(assert (=> b!790480 m!731443))

(declare-fun m!731445 () Bool)

(assert (=> b!790475 m!731445))

(push 1)

(assert (not b!790475))

(assert (not b!790491))

(assert (not b!790489))

(assert (not start!67918))

(assert (not b!790478))

(assert (not b!790487))

(assert (not b!790477))

(assert (not b!790481))

(assert (not b!790486))

(assert (not b!790488))

(assert (not b!790483))

(assert (not b!790490))

(assert (not b!790485))

(assert (not b!790480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!790530 () Bool)

(declare-fun e!439358 () Bool)

(declare-fun call!35301 () Bool)

(assert (=> b!790530 (= e!439358 call!35301)))

(declare-fun bm!35298 () Bool)

(assert (=> bm!35298 (= call!35301 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!790531 () Bool)

(declare-fun e!439360 () Bool)

(assert (=> b!790531 (= e!439360 call!35301)))

(declare-fun b!790533 () Bool)

(assert (=> b!790533 (= e!439360 e!439358)))

(declare-fun lt!352928 () (_ BitVec 64))

(assert (=> b!790533 (= lt!352928 (select (arr!20534 a!3186) j!159))))

(declare-fun lt!352927 () Unit!27420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42895 (_ BitVec 64) (_ BitVec 32)) Unit!27420)

(assert (=> b!790533 (= lt!352927 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!352928 j!159))))

(assert (=> b!790533 (arrayContainsKey!0 a!3186 lt!352928 #b00000000000000000000000000000000)))

(declare-fun lt!352926 () Unit!27420)

(assert (=> b!790533 (= lt!352926 lt!352927)))

(declare-fun res!535600 () Bool)

(assert (=> b!790533 (= res!535600 (= (seekEntryOrOpen!0 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) (Found!8134 j!159)))))

(assert (=> b!790533 (=> (not res!535600) (not e!439358))))

(declare-fun b!790532 () Bool)

(declare-fun e!439359 () Bool)

(assert (=> b!790532 (= e!439359 e!439360)))

(declare-fun c!87873 () Bool)

(assert (=> b!790532 (= c!87873 (validKeyInArray!0 (select (arr!20534 a!3186) j!159)))))

(declare-fun d!102977 () Bool)

(declare-fun res!535601 () Bool)

(assert (=> d!102977 (=> res!535601 e!439359)))

(assert (=> d!102977 (= res!535601 (bvsge j!159 (size!20955 a!3186)))))

(assert (=> d!102977 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!439359)))

(assert (= (and d!102977 (not res!535601)) b!790532))

(assert (= (and b!790532 c!87873) b!790533))

(assert (= (and b!790532 (not c!87873)) b!790531))

(assert (= (and b!790533 res!535600) b!790530))

(assert (= (or b!790530 b!790531) bm!35298))

(declare-fun m!731457 () Bool)

(assert (=> bm!35298 m!731457))

(assert (=> b!790533 m!731407))

(declare-fun m!731459 () Bool)

(assert (=> b!790533 m!731459))

(declare-fun m!731461 () Bool)

(assert (=> b!790533 m!731461))

(assert (=> b!790533 m!731407))

(assert (=> b!790533 m!731441))

(assert (=> b!790532 m!731407))

(assert (=> b!790532 m!731407))

(assert (=> b!790532 m!731433))

(assert (=> b!790485 d!102977))

(declare-fun d!102979 () Bool)

(assert (=> d!102979 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352937 () Unit!27420)

(declare-fun choose!38 (array!42895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27420)

(assert (=> d!102979 (= lt!352937 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102979 (validMask!0 mask!3328)))

(assert (=> d!102979 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!352937)))

(declare-fun bs!21862 () Bool)

(assert (= bs!21862 d!102979))

(assert (=> bs!21862 m!731413))

(declare-fun m!731463 () Bool)

(assert (=> bs!21862 m!731463))

(assert (=> bs!21862 m!731403))

(assert (=> b!790485 d!102979))

(declare-fun b!790556 () Bool)

(declare-fun e!439382 () Bool)

(declare-fun contains!4113 (List!14536 (_ BitVec 64)) Bool)

(assert (=> b!790556 (= e!439382 (contains!4113 Nil!14533 (select (arr!20534 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!790557 () Bool)

(declare-fun e!439381 () Bool)

(declare-fun call!35310 () Bool)

(assert (=> b!790557 (= e!439381 call!35310)))

(declare-fun d!102981 () Bool)

(declare-fun res!535615 () Bool)

(declare-fun e!439380 () Bool)

(assert (=> d!102981 (=> res!535615 e!439380)))

(assert (=> d!102981 (= res!535615 (bvsge #b00000000000000000000000000000000 (size!20955 a!3186)))))

(assert (=> d!102981 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14533) e!439380)))

(declare-fun b!790558 () Bool)

(declare-fun e!439379 () Bool)

(assert (=> b!790558 (= e!439380 e!439379)))

(declare-fun res!535616 () Bool)

(assert (=> b!790558 (=> (not res!535616) (not e!439379))))

(assert (=> b!790558 (= res!535616 (not e!439382))))

(declare-fun res!535614 () Bool)

(assert (=> b!790558 (=> (not res!535614) (not e!439382))))

(assert (=> b!790558 (= res!535614 (validKeyInArray!0 (select (arr!20534 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!790559 () Bool)

(assert (=> b!790559 (= e!439379 e!439381)))

(declare-fun c!87880 () Bool)

(assert (=> b!790559 (= c!87880 (validKeyInArray!0 (select (arr!20534 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35307 () Bool)

(assert (=> bm!35307 (= call!35310 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87880 (Cons!14532 (select (arr!20534 a!3186) #b00000000000000000000000000000000) Nil!14533) Nil!14533)))))

(declare-fun b!790560 () Bool)

(assert (=> b!790560 (= e!439381 call!35310)))

(assert (= (and d!102981 (not res!535615)) b!790558))

(assert (= (and b!790558 res!535614) b!790556))

(assert (= (and b!790558 res!535616) b!790559))

(assert (= (and b!790559 c!87880) b!790557))

(assert (= (and b!790559 (not c!87880)) b!790560))

(assert (= (or b!790557 b!790560) bm!35307))

(declare-fun m!731477 () Bool)

(assert (=> b!790556 m!731477))

(assert (=> b!790556 m!731477))

(declare-fun m!731479 () Bool)

(assert (=> b!790556 m!731479))

(assert (=> b!790558 m!731477))

(assert (=> b!790558 m!731477))

(declare-fun m!731481 () Bool)

(assert (=> b!790558 m!731481))

(assert (=> b!790559 m!731477))

(assert (=> b!790559 m!731477))

(assert (=> b!790559 m!731481))

(assert (=> bm!35307 m!731477))

(declare-fun m!731483 () Bool)

(assert (=> bm!35307 m!731483))

(assert (=> b!790483 d!102981))

(declare-fun d!102987 () Bool)

(assert (=> d!102987 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67918 d!102987))

(declare-fun d!102993 () Bool)

(assert (=> d!102993 (= (array_inv!16330 a!3186) (bvsge (size!20955 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67918 d!102993))

(declare-fun b!790615 () Bool)

(declare-fun e!439414 () Bool)

(declare-fun e!439412 () Bool)

(assert (=> b!790615 (= e!439414 e!439412)))

(declare-fun res!535623 () Bool)

(declare-fun lt!352967 () SeekEntryResult!8134)

(assert (=> b!790615 (= res!535623 (and (is-Intermediate!8134 lt!352967) (not (undefined!8946 lt!352967)) (bvslt (x!65835 lt!352967) #b01111111111111111111111111111110) (bvsge (x!65835 lt!352967) #b00000000000000000000000000000000) (bvsge (x!65835 lt!352967) #b00000000000000000000000000000000)))))

(assert (=> b!790615 (=> (not res!535623) (not e!439412))))

(declare-fun b!790616 () Bool)

(assert (=> b!790616 (and (bvsge (index!34906 lt!352967) #b00000000000000000000000000000000) (bvslt (index!34906 lt!352967) (size!20955 a!3186)))))

(declare-fun e!439413 () Bool)

(assert (=> b!790616 (= e!439413 (= (select (arr!20534 a!3186) (index!34906 lt!352967)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790617 () Bool)

(assert (=> b!790617 (and (bvsge (index!34906 lt!352967) #b00000000000000000000000000000000) (bvslt (index!34906 lt!352967) (size!20955 a!3186)))))

(declare-fun res!535624 () Bool)

(assert (=> b!790617 (= res!535624 (= (select (arr!20534 a!3186) (index!34906 lt!352967)) (select (arr!20534 a!3186) j!159)))))

(assert (=> b!790617 (=> res!535624 e!439413)))

(assert (=> b!790617 (= e!439412 e!439413)))

(declare-fun d!102995 () Bool)

(assert (=> d!102995 e!439414))

(declare-fun c!87905 () Bool)

(assert (=> d!102995 (= c!87905 (and (is-Intermediate!8134 lt!352967) (undefined!8946 lt!352967)))))

(declare-fun e!439415 () SeekEntryResult!8134)

(assert (=> d!102995 (= lt!352967 e!439415)))

(declare-fun c!87906 () Bool)

(assert (=> d!102995 (= c!87906 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!352966 () (_ BitVec 64))

(assert (=> d!102995 (= lt!352966 (select (arr!20534 a!3186) (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328)))))

(assert (=> d!102995 (validMask!0 mask!3328)))

(assert (=> d!102995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352967)))

(declare-fun b!790618 () Bool)

(declare-fun e!439411 () SeekEntryResult!8134)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790618 (= e!439411 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20534 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790619 () Bool)

(assert (=> b!790619 (= e!439414 (bvsge (x!65835 lt!352967) #b01111111111111111111111111111110))))

(declare-fun b!790620 () Bool)

(assert (=> b!790620 (= e!439411 (Intermediate!8134 false (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790621 () Bool)

(assert (=> b!790621 (= e!439415 e!439411)))

(declare-fun c!87907 () Bool)

(assert (=> b!790621 (= c!87907 (or (= lt!352966 (select (arr!20534 a!3186) j!159)) (= (bvadd lt!352966 lt!352966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790622 () Bool)

(assert (=> b!790622 (and (bvsge (index!34906 lt!352967) #b00000000000000000000000000000000) (bvslt (index!34906 lt!352967) (size!20955 a!3186)))))

(declare-fun res!535625 () Bool)

(assert (=> b!790622 (= res!535625 (= (select (arr!20534 a!3186) (index!34906 lt!352967)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790622 (=> res!535625 e!439413)))

(declare-fun b!790623 () Bool)

(assert (=> b!790623 (= e!439415 (Intermediate!8134 true (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102995 c!87906) b!790623))

(assert (= (and d!102995 (not c!87906)) b!790621))

(assert (= (and b!790621 c!87907) b!790620))

(assert (= (and b!790621 (not c!87907)) b!790618))

(assert (= (and d!102995 c!87905) b!790619))

(assert (= (and d!102995 (not c!87905)) b!790615))

(assert (= (and b!790615 res!535623) b!790617))

(assert (= (and b!790617 (not res!535624)) b!790622))

(assert (= (and b!790622 (not res!535625)) b!790616))

(declare-fun m!731507 () Bool)

(assert (=> b!790622 m!731507))

(assert (=> d!102995 m!731427))

(declare-fun m!731509 () Bool)

(assert (=> d!102995 m!731509))

(assert (=> d!102995 m!731403))

(assert (=> b!790616 m!731507))

(assert (=> b!790618 m!731427))

(declare-fun m!731511 () Bool)

(assert (=> b!790618 m!731511))

(assert (=> b!790618 m!731511))

(assert (=> b!790618 m!731407))

(declare-fun m!731513 () Bool)

(assert (=> b!790618 m!731513))

(assert (=> b!790617 m!731507))

(assert (=> b!790481 d!102995))

(declare-fun d!103005 () Bool)

(declare-fun lt!352973 () (_ BitVec 32))

(declare-fun lt!352972 () (_ BitVec 32))

(assert (=> d!103005 (= lt!352973 (bvmul (bvxor lt!352972 (bvlshr lt!352972 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103005 (= lt!352972 ((_ extract 31 0) (bvand (bvxor (select (arr!20534 a!3186) j!159) (bvlshr (select (arr!20534 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103005 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535628 (let ((h!15659 ((_ extract 31 0) (bvand (bvxor (select (arr!20534 a!3186) j!159) (bvlshr (select (arr!20534 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65839 (bvmul (bvxor h!15659 (bvlshr h!15659 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65839 (bvlshr x!65839 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535628 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535628 #b00000000000000000000000000000000))))))

(assert (=> d!103005 (= (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) (bvand (bvxor lt!352973 (bvlshr lt!352973 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!790481 d!103005))

(declare-fun b!790642 () Bool)

(declare-fun e!439429 () SeekEntryResult!8134)

(declare-fun e!439430 () SeekEntryResult!8134)

(assert (=> b!790642 (= e!439429 e!439430)))

(declare-fun c!87915 () Bool)

(declare-fun lt!352979 () (_ BitVec 64))

(assert (=> b!790642 (= c!87915 (= lt!352979 (select (arr!20534 a!3186) j!159)))))

(declare-fun b!790643 () Bool)

(assert (=> b!790643 (= e!439429 Undefined!8134)))

(declare-fun lt!352978 () SeekEntryResult!8134)

(declare-fun d!103009 () Bool)

(assert (=> d!103009 (and (or (is-Undefined!8134 lt!352978) (not (is-Found!8134 lt!352978)) (and (bvsge (index!34905 lt!352978) #b00000000000000000000000000000000) (bvslt (index!34905 lt!352978) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!352978) (is-Found!8134 lt!352978) (not (is-MissingVacant!8134 lt!352978)) (not (= (index!34907 lt!352978) resIntermediateIndex!5)) (and (bvsge (index!34907 lt!352978) #b00000000000000000000000000000000) (bvslt (index!34907 lt!352978) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!352978) (ite (is-Found!8134 lt!352978) (= (select (arr!20534 a!3186) (index!34905 lt!352978)) (select (arr!20534 a!3186) j!159)) (and (is-MissingVacant!8134 lt!352978) (= (index!34907 lt!352978) resIntermediateIndex!5) (= (select (arr!20534 a!3186) (index!34907 lt!352978)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103009 (= lt!352978 e!439429)))

(declare-fun c!87914 () Bool)

(assert (=> d!103009 (= c!87914 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!103009 (= lt!352979 (select (arr!20534 a!3186) index!1321))))

(assert (=> d!103009 (validMask!0 mask!3328)))

(assert (=> d!103009 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352978)))

(declare-fun b!790644 () Bool)

(declare-fun e!439428 () SeekEntryResult!8134)

(assert (=> b!790644 (= e!439428 (MissingVacant!8134 resIntermediateIndex!5))))

(declare-fun b!790645 () Bool)

(assert (=> b!790645 (= e!439430 (Found!8134 index!1321))))

(declare-fun b!790646 () Bool)

(assert (=> b!790646 (= e!439428 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790647 () Bool)

(declare-fun c!87916 () Bool)

(assert (=> b!790647 (= c!87916 (= lt!352979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790647 (= e!439430 e!439428)))

(assert (= (and d!103009 c!87914) b!790643))

(assert (= (and d!103009 (not c!87914)) b!790642))

(assert (= (and b!790642 c!87915) b!790645))

(assert (= (and b!790642 (not c!87915)) b!790647))

(assert (= (and b!790647 c!87916) b!790644))

(assert (= (and b!790647 (not c!87916)) b!790646))

(declare-fun m!731519 () Bool)

(assert (=> d!103009 m!731519))

(declare-fun m!731521 () Bool)

(assert (=> d!103009 m!731521))

(declare-fun m!731523 () Bool)

(assert (=> d!103009 m!731523))

(assert (=> d!103009 m!731403))

(declare-fun m!731525 () Bool)

(assert (=> b!790646 m!731525))

(assert (=> b!790646 m!731525))

(assert (=> b!790646 m!731407))

(declare-fun m!731527 () Bool)

(assert (=> b!790646 m!731527))

(assert (=> b!790491 d!103009))

(declare-fun b!790711 () Bool)

(declare-fun e!439464 () SeekEntryResult!8134)

(declare-fun e!439466 () SeekEntryResult!8134)

(assert (=> b!790711 (= e!439464 e!439466)))

(declare-fun lt!353005 () (_ BitVec 64))

(declare-fun lt!353004 () SeekEntryResult!8134)

(assert (=> b!790711 (= lt!353005 (select (arr!20534 a!3186) (index!34906 lt!353004)))))

(declare-fun c!87944 () Bool)

(assert (=> b!790711 (= c!87944 (= lt!353005 k!2102))))

(declare-fun b!790712 () Bool)

(declare-fun e!439465 () SeekEntryResult!8134)

(assert (=> b!790712 (= e!439465 (MissingZero!8134 (index!34906 lt!353004)))))

(declare-fun b!790713 () Bool)

(assert (=> b!790713 (= e!439466 (Found!8134 (index!34906 lt!353004)))))

(declare-fun b!790714 () Bool)

(assert (=> b!790714 (= e!439464 Undefined!8134)))

(declare-fun b!790715 () Bool)

(assert (=> b!790715 (= e!439465 (seekKeyOrZeroReturnVacant!0 (x!65835 lt!353004) (index!34906 lt!353004) (index!34906 lt!353004) k!2102 a!3186 mask!3328))))

(declare-fun d!103011 () Bool)

(declare-fun lt!353006 () SeekEntryResult!8134)

(assert (=> d!103011 (and (or (is-Undefined!8134 lt!353006) (not (is-Found!8134 lt!353006)) (and (bvsge (index!34905 lt!353006) #b00000000000000000000000000000000) (bvslt (index!34905 lt!353006) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353006) (is-Found!8134 lt!353006) (not (is-MissingZero!8134 lt!353006)) (and (bvsge (index!34904 lt!353006) #b00000000000000000000000000000000) (bvslt (index!34904 lt!353006) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353006) (is-Found!8134 lt!353006) (is-MissingZero!8134 lt!353006) (not (is-MissingVacant!8134 lt!353006)) (and (bvsge (index!34907 lt!353006) #b00000000000000000000000000000000) (bvslt (index!34907 lt!353006) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353006) (ite (is-Found!8134 lt!353006) (= (select (arr!20534 a!3186) (index!34905 lt!353006)) k!2102) (ite (is-MissingZero!8134 lt!353006) (= (select (arr!20534 a!3186) (index!34904 lt!353006)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8134 lt!353006) (= (select (arr!20534 a!3186) (index!34907 lt!353006)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103011 (= lt!353006 e!439464)))

(declare-fun c!87946 () Bool)

(assert (=> d!103011 (= c!87946 (and (is-Intermediate!8134 lt!353004) (undefined!8946 lt!353004)))))

(assert (=> d!103011 (= lt!353004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!103011 (validMask!0 mask!3328)))

(assert (=> d!103011 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!353006)))

(declare-fun b!790716 () Bool)

(declare-fun c!87945 () Bool)

(assert (=> b!790716 (= c!87945 (= lt!353005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790716 (= e!439466 e!439465)))

(assert (= (and d!103011 c!87946) b!790714))

(assert (= (and d!103011 (not c!87946)) b!790711))

(assert (= (and b!790711 c!87944) b!790713))

(assert (= (and b!790711 (not c!87944)) b!790716))

(assert (= (and b!790716 c!87945) b!790712))

(assert (= (and b!790716 (not c!87945)) b!790715))

(declare-fun m!731557 () Bool)

(assert (=> b!790711 m!731557))

(declare-fun m!731559 () Bool)

(assert (=> b!790715 m!731559))

(declare-fun m!731561 () Bool)

(assert (=> d!103011 m!731561))

(declare-fun m!731563 () Bool)

(assert (=> d!103011 m!731563))

(assert (=> d!103011 m!731403))

(assert (=> d!103011 m!731561))

(declare-fun m!731565 () Bool)

(assert (=> d!103011 m!731565))

(declare-fun m!731567 () Bool)

(assert (=> d!103011 m!731567))

(declare-fun m!731569 () Bool)

(assert (=> d!103011 m!731569))

(assert (=> b!790480 d!103011))

(declare-fun b!790717 () Bool)

(declare-fun e!439470 () Bool)

(declare-fun e!439468 () Bool)

(assert (=> b!790717 (= e!439470 e!439468)))

(declare-fun res!535642 () Bool)

(declare-fun lt!353008 () SeekEntryResult!8134)

(assert (=> b!790717 (= res!535642 (and (is-Intermediate!8134 lt!353008) (not (undefined!8946 lt!353008)) (bvslt (x!65835 lt!353008) #b01111111111111111111111111111110) (bvsge (x!65835 lt!353008) #b00000000000000000000000000000000) (bvsge (x!65835 lt!353008) x!1131)))))

(assert (=> b!790717 (=> (not res!535642) (not e!439468))))

(declare-fun b!790718 () Bool)

(assert (=> b!790718 (and (bvsge (index!34906 lt!353008) #b00000000000000000000000000000000) (bvslt (index!34906 lt!353008) (size!20955 lt!352900)))))

(declare-fun e!439469 () Bool)

(assert (=> b!790718 (= e!439469 (= (select (arr!20534 lt!352900) (index!34906 lt!353008)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790719 () Bool)

(assert (=> b!790719 (and (bvsge (index!34906 lt!353008) #b00000000000000000000000000000000) (bvslt (index!34906 lt!353008) (size!20955 lt!352900)))))

(declare-fun res!535643 () Bool)

(assert (=> b!790719 (= res!535643 (= (select (arr!20534 lt!352900) (index!34906 lt!353008)) lt!352902))))

(assert (=> b!790719 (=> res!535643 e!439469)))

(assert (=> b!790719 (= e!439468 e!439469)))

(declare-fun d!103019 () Bool)

(assert (=> d!103019 e!439470))

(declare-fun c!87947 () Bool)

(assert (=> d!103019 (= c!87947 (and (is-Intermediate!8134 lt!353008) (undefined!8946 lt!353008)))))

(declare-fun e!439471 () SeekEntryResult!8134)

(assert (=> d!103019 (= lt!353008 e!439471)))

(declare-fun c!87948 () Bool)

(assert (=> d!103019 (= c!87948 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!353007 () (_ BitVec 64))

(assert (=> d!103019 (= lt!353007 (select (arr!20534 lt!352900) index!1321))))

(assert (=> d!103019 (validMask!0 mask!3328)))

(assert (=> d!103019 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352902 lt!352900 mask!3328) lt!353008)))

(declare-fun b!790720 () Bool)

(declare-fun e!439467 () SeekEntryResult!8134)

(assert (=> b!790720 (= e!439467 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!352902 lt!352900 mask!3328))))

(declare-fun b!790721 () Bool)

(assert (=> b!790721 (= e!439470 (bvsge (x!65835 lt!353008) #b01111111111111111111111111111110))))

(declare-fun b!790722 () Bool)

(assert (=> b!790722 (= e!439467 (Intermediate!8134 false index!1321 x!1131))))

(declare-fun b!790723 () Bool)

(assert (=> b!790723 (= e!439471 e!439467)))

(declare-fun c!87949 () Bool)

(assert (=> b!790723 (= c!87949 (or (= lt!353007 lt!352902) (= (bvadd lt!353007 lt!353007) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790724 () Bool)

(assert (=> b!790724 (and (bvsge (index!34906 lt!353008) #b00000000000000000000000000000000) (bvslt (index!34906 lt!353008) (size!20955 lt!352900)))))

(declare-fun res!535644 () Bool)

(assert (=> b!790724 (= res!535644 (= (select (arr!20534 lt!352900) (index!34906 lt!353008)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790724 (=> res!535644 e!439469)))

(declare-fun b!790725 () Bool)

(assert (=> b!790725 (= e!439471 (Intermediate!8134 true index!1321 x!1131))))

(assert (= (and d!103019 c!87948) b!790725))

(assert (= (and d!103019 (not c!87948)) b!790723))

(assert (= (and b!790723 c!87949) b!790722))

(assert (= (and b!790723 (not c!87949)) b!790720))

(assert (= (and d!103019 c!87947) b!790721))

(assert (= (and d!103019 (not c!87947)) b!790717))

(assert (= (and b!790717 res!535642) b!790719))

(assert (= (and b!790719 (not res!535643)) b!790724))

(assert (= (and b!790724 (not res!535644)) b!790718))

(declare-fun m!731571 () Bool)

(assert (=> b!790724 m!731571))

(declare-fun m!731573 () Bool)

(assert (=> d!103019 m!731573))

(assert (=> d!103019 m!731403))

(assert (=> b!790718 m!731571))

(assert (=> b!790720 m!731525))

(assert (=> b!790720 m!731525))

(declare-fun m!731575 () Bool)

(assert (=> b!790720 m!731575))

(assert (=> b!790719 m!731571))

(assert (=> b!790490 d!103019))

(declare-fun b!790726 () Bool)

(declare-fun e!439475 () Bool)

(declare-fun e!439473 () Bool)

(assert (=> b!790726 (= e!439475 e!439473)))

(declare-fun res!535645 () Bool)

(declare-fun lt!353010 () SeekEntryResult!8134)

(assert (=> b!790726 (= res!535645 (and (is-Intermediate!8134 lt!353010) (not (undefined!8946 lt!353010)) (bvslt (x!65835 lt!353010) #b01111111111111111111111111111110) (bvsge (x!65835 lt!353010) #b00000000000000000000000000000000) (bvsge (x!65835 lt!353010) #b00000000000000000000000000000000)))))

(assert (=> b!790726 (=> (not res!535645) (not e!439473))))

(declare-fun b!790727 () Bool)

(assert (=> b!790727 (and (bvsge (index!34906 lt!353010) #b00000000000000000000000000000000) (bvslt (index!34906 lt!353010) (size!20955 lt!352900)))))

(declare-fun e!439474 () Bool)

(assert (=> b!790727 (= e!439474 (= (select (arr!20534 lt!352900) (index!34906 lt!353010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790728 () Bool)

(assert (=> b!790728 (and (bvsge (index!34906 lt!353010) #b00000000000000000000000000000000) (bvslt (index!34906 lt!353010) (size!20955 lt!352900)))))

(declare-fun res!535646 () Bool)

(assert (=> b!790728 (= res!535646 (= (select (arr!20534 lt!352900) (index!34906 lt!353010)) lt!352902))))

(assert (=> b!790728 (=> res!535646 e!439474)))

(assert (=> b!790728 (= e!439473 e!439474)))

(declare-fun d!103021 () Bool)

(assert (=> d!103021 e!439475))

(declare-fun c!87950 () Bool)

(assert (=> d!103021 (= c!87950 (and (is-Intermediate!8134 lt!353010) (undefined!8946 lt!353010)))))

(declare-fun e!439476 () SeekEntryResult!8134)

(assert (=> d!103021 (= lt!353010 e!439476)))

(declare-fun c!87951 () Bool)

(assert (=> d!103021 (= c!87951 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!353009 () (_ BitVec 64))

(assert (=> d!103021 (= lt!353009 (select (arr!20534 lt!352900) (toIndex!0 lt!352902 mask!3328)))))

(assert (=> d!103021 (validMask!0 mask!3328)))

(assert (=> d!103021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352902 mask!3328) lt!352902 lt!352900 mask!3328) lt!353010)))

(declare-fun b!790729 () Bool)

(declare-fun e!439472 () SeekEntryResult!8134)

(assert (=> b!790729 (= e!439472 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!352902 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!352902 lt!352900 mask!3328))))

(declare-fun b!790730 () Bool)

(assert (=> b!790730 (= e!439475 (bvsge (x!65835 lt!353010) #b01111111111111111111111111111110))))

(declare-fun b!790731 () Bool)

(assert (=> b!790731 (= e!439472 (Intermediate!8134 false (toIndex!0 lt!352902 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790732 () Bool)

(assert (=> b!790732 (= e!439476 e!439472)))

(declare-fun c!87952 () Bool)

(assert (=> b!790732 (= c!87952 (or (= lt!353009 lt!352902) (= (bvadd lt!353009 lt!353009) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790733 () Bool)

(assert (=> b!790733 (and (bvsge (index!34906 lt!353010) #b00000000000000000000000000000000) (bvslt (index!34906 lt!353010) (size!20955 lt!352900)))))

(declare-fun res!535647 () Bool)

(assert (=> b!790733 (= res!535647 (= (select (arr!20534 lt!352900) (index!34906 lt!353010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790733 (=> res!535647 e!439474)))

(declare-fun b!790734 () Bool)

(assert (=> b!790734 (= e!439476 (Intermediate!8134 true (toIndex!0 lt!352902 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!103021 c!87951) b!790734))

(assert (= (and d!103021 (not c!87951)) b!790732))

(assert (= (and b!790732 c!87952) b!790731))

(assert (= (and b!790732 (not c!87952)) b!790729))

(assert (= (and d!103021 c!87950) b!790730))

(assert (= (and d!103021 (not c!87950)) b!790726))

(assert (= (and b!790726 res!535645) b!790728))

(assert (= (and b!790728 (not res!535646)) b!790733))

(assert (= (and b!790733 (not res!535647)) b!790727))

(declare-fun m!731577 () Bool)

(assert (=> b!790733 m!731577))

(assert (=> d!103021 m!731417))

(declare-fun m!731579 () Bool)

(assert (=> d!103021 m!731579))

(assert (=> d!103021 m!731403))

(assert (=> b!790727 m!731577))

(assert (=> b!790729 m!731417))

(declare-fun m!731581 () Bool)

(assert (=> b!790729 m!731581))

(assert (=> b!790729 m!731581))

(declare-fun m!731583 () Bool)

(assert (=> b!790729 m!731583))

(assert (=> b!790728 m!731577))

(assert (=> b!790490 d!103021))

(declare-fun d!103023 () Bool)

(declare-fun lt!353012 () (_ BitVec 32))

(declare-fun lt!353011 () (_ BitVec 32))

(assert (=> d!103023 (= lt!353012 (bvmul (bvxor lt!353011 (bvlshr lt!353011 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103023 (= lt!353011 ((_ extract 31 0) (bvand (bvxor lt!352902 (bvlshr lt!352902 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103023 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535628 (let ((h!15659 ((_ extract 31 0) (bvand (bvxor lt!352902 (bvlshr lt!352902 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65839 (bvmul (bvxor h!15659 (bvlshr h!15659 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65839 (bvlshr x!65839 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535628 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535628 #b00000000000000000000000000000000))))))

(assert (=> d!103023 (= (toIndex!0 lt!352902 mask!3328) (bvand (bvxor lt!353012 (bvlshr lt!353012 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!790490 d!103023))

(declare-fun b!790735 () Bool)

(declare-fun e!439480 () SeekEntryResult!8134)

(declare-fun e!439481 () SeekEntryResult!8134)

(assert (=> b!790735 (= e!439480 e!439481)))

(declare-fun lt!353014 () (_ BitVec 64))

(declare-fun c!87954 () Bool)

(assert (=> b!790735 (= c!87954 (= lt!353014 (select (arr!20534 a!3186) j!159)))))

(declare-fun b!790736 () Bool)

(assert (=> b!790736 (= e!439480 Undefined!8134)))

(declare-fun lt!353013 () SeekEntryResult!8134)

(declare-fun d!103025 () Bool)

(assert (=> d!103025 (and (or (is-Undefined!8134 lt!353013) (not (is-Found!8134 lt!353013)) (and (bvsge (index!34905 lt!353013) #b00000000000000000000000000000000) (bvslt (index!34905 lt!353013) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353013) (is-Found!8134 lt!353013) (not (is-MissingVacant!8134 lt!353013)) (not (= (index!34907 lt!353013) resIntermediateIndex!5)) (and (bvsge (index!34907 lt!353013) #b00000000000000000000000000000000) (bvslt (index!34907 lt!353013) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353013) (ite (is-Found!8134 lt!353013) (= (select (arr!20534 a!3186) (index!34905 lt!353013)) (select (arr!20534 a!3186) j!159)) (and (is-MissingVacant!8134 lt!353013) (= (index!34907 lt!353013) resIntermediateIndex!5) (= (select (arr!20534 a!3186) (index!34907 lt!353013)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103025 (= lt!353013 e!439480)))

(declare-fun c!87953 () Bool)

(assert (=> d!103025 (= c!87953 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!103025 (= lt!353014 (select (arr!20534 a!3186) resIntermediateIndex!5))))

(assert (=> d!103025 (validMask!0 mask!3328)))

(assert (=> d!103025 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!353013)))

(declare-fun b!790737 () Bool)

(declare-fun e!439479 () SeekEntryResult!8134)

(assert (=> b!790737 (= e!439479 (MissingVacant!8134 resIntermediateIndex!5))))

(declare-fun b!790738 () Bool)

(assert (=> b!790738 (= e!439481 (Found!8134 resIntermediateIndex!5))))

(declare-fun b!790739 () Bool)

(assert (=> b!790739 (= e!439479 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790740 () Bool)

(declare-fun c!87955 () Bool)

(assert (=> b!790740 (= c!87955 (= lt!353014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790740 (= e!439481 e!439479)))

(assert (= (and d!103025 c!87953) b!790736))

(assert (= (and d!103025 (not c!87953)) b!790735))

(assert (= (and b!790735 c!87954) b!790738))

(assert (= (and b!790735 (not c!87954)) b!790740))

(assert (= (and b!790740 c!87955) b!790737))

(assert (= (and b!790740 (not c!87955)) b!790739))

(declare-fun m!731585 () Bool)

(assert (=> d!103025 m!731585))

(declare-fun m!731587 () Bool)

(assert (=> d!103025 m!731587))

(assert (=> d!103025 m!731411))

(assert (=> d!103025 m!731403))

(declare-fun m!731589 () Bool)

(assert (=> b!790739 m!731589))

(assert (=> b!790739 m!731589))

(assert (=> b!790739 m!731407))

(declare-fun m!731591 () Bool)

(assert (=> b!790739 m!731591))

(assert (=> b!790489 d!103025))

(declare-fun b!790751 () Bool)

(declare-fun e!439488 () Bool)

(declare-fun call!35311 () Bool)

(assert (=> b!790751 (= e!439488 call!35311)))

(declare-fun bm!35308 () Bool)

(assert (=> bm!35308 (= call!35311 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!790752 () Bool)

(declare-fun e!439490 () Bool)

(assert (=> b!790752 (= e!439490 call!35311)))

(declare-fun b!790754 () Bool)

(assert (=> b!790754 (= e!439490 e!439488)))

(declare-fun lt!353017 () (_ BitVec 64))

(assert (=> b!790754 (= lt!353017 (select (arr!20534 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!353016 () Unit!27420)

(assert (=> b!790754 (= lt!353016 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!353017 #b00000000000000000000000000000000))))

(assert (=> b!790754 (arrayContainsKey!0 a!3186 lt!353017 #b00000000000000000000000000000000)))

(declare-fun lt!353015 () Unit!27420)

(assert (=> b!790754 (= lt!353015 lt!353016)))

(declare-fun res!535654 () Bool)

(assert (=> b!790754 (= res!535654 (= (seekEntryOrOpen!0 (select (arr!20534 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8134 #b00000000000000000000000000000000)))))

(assert (=> b!790754 (=> (not res!535654) (not e!439488))))

(declare-fun b!790753 () Bool)

(declare-fun e!439489 () Bool)

(assert (=> b!790753 (= e!439489 e!439490)))

(declare-fun c!87958 () Bool)

(assert (=> b!790753 (= c!87958 (validKeyInArray!0 (select (arr!20534 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!103027 () Bool)

(declare-fun res!535655 () Bool)

(assert (=> d!103027 (=> res!535655 e!439489)))

(assert (=> d!103027 (= res!535655 (bvsge #b00000000000000000000000000000000 (size!20955 a!3186)))))

(assert (=> d!103027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!439489)))

(assert (= (and d!103027 (not res!535655)) b!790753))

(assert (= (and b!790753 c!87958) b!790754))

(assert (= (and b!790753 (not c!87958)) b!790752))

(assert (= (and b!790754 res!535654) b!790751))

(assert (= (or b!790751 b!790752) bm!35308))

(declare-fun m!731593 () Bool)

(assert (=> bm!35308 m!731593))

(assert (=> b!790754 m!731477))

(declare-fun m!731595 () Bool)

(assert (=> b!790754 m!731595))

(declare-fun m!731597 () Bool)

(assert (=> b!790754 m!731597))

(assert (=> b!790754 m!731477))

(declare-fun m!731599 () Bool)

(assert (=> b!790754 m!731599))

(assert (=> b!790753 m!731477))

(assert (=> b!790753 m!731477))

(assert (=> b!790753 m!731481))

(assert (=> b!790478 d!103027))

(declare-fun d!103029 () Bool)

(assert (=> d!103029 (= (validKeyInArray!0 (select (arr!20534 a!3186) j!159)) (and (not (= (select (arr!20534 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20534 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!790477 d!103029))

(declare-fun d!103031 () Bool)

(assert (=> d!103031 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!790488 d!103031))

(declare-fun b!790755 () Bool)

(declare-fun e!439491 () SeekEntryResult!8134)

(declare-fun e!439493 () SeekEntryResult!8134)

(assert (=> b!790755 (= e!439491 e!439493)))

(declare-fun lt!353019 () (_ BitVec 64))

(declare-fun lt!353018 () SeekEntryResult!8134)

(assert (=> b!790755 (= lt!353019 (select (arr!20534 a!3186) (index!34906 lt!353018)))))

(declare-fun c!87959 () Bool)

(assert (=> b!790755 (= c!87959 (= lt!353019 (select (arr!20534 a!3186) j!159)))))

(declare-fun b!790756 () Bool)

(declare-fun e!439492 () SeekEntryResult!8134)

(assert (=> b!790756 (= e!439492 (MissingZero!8134 (index!34906 lt!353018)))))

(declare-fun b!790757 () Bool)

(assert (=> b!790757 (= e!439493 (Found!8134 (index!34906 lt!353018)))))

(declare-fun b!790758 () Bool)

(assert (=> b!790758 (= e!439491 Undefined!8134)))

(declare-fun b!790759 () Bool)

(assert (=> b!790759 (= e!439492 (seekKeyOrZeroReturnVacant!0 (x!65835 lt!353018) (index!34906 lt!353018) (index!34906 lt!353018) (select (arr!20534 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!103033 () Bool)

(declare-fun lt!353020 () SeekEntryResult!8134)

(assert (=> d!103033 (and (or (is-Undefined!8134 lt!353020) (not (is-Found!8134 lt!353020)) (and (bvsge (index!34905 lt!353020) #b00000000000000000000000000000000) (bvslt (index!34905 lt!353020) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353020) (is-Found!8134 lt!353020) (not (is-MissingZero!8134 lt!353020)) (and (bvsge (index!34904 lt!353020) #b00000000000000000000000000000000) (bvslt (index!34904 lt!353020) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353020) (is-Found!8134 lt!353020) (is-MissingZero!8134 lt!353020) (not (is-MissingVacant!8134 lt!353020)) (and (bvsge (index!34907 lt!353020) #b00000000000000000000000000000000) (bvslt (index!34907 lt!353020) (size!20955 a!3186)))) (or (is-Undefined!8134 lt!353020) (ite (is-Found!8134 lt!353020) (= (select (arr!20534 a!3186) (index!34905 lt!353020)) (select (arr!20534 a!3186) j!159)) (ite (is-MissingZero!8134 lt!353020) (= (select (arr!20534 a!3186) (index!34904 lt!353020)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8134 lt!353020) (= (select (arr!20534 a!3186) (index!34907 lt!353020)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103033 (= lt!353020 e!439491)))

(declare-fun c!87961 () Bool)

(assert (=> d!103033 (= c!87961 (and (is-Intermediate!8134 lt!353018) (undefined!8946 lt!353018)))))

(assert (=> d!103033 (= lt!353018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) (select (arr!20534 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!103033 (validMask!0 mask!3328)))

(assert (=> d!103033 (= (seekEntryOrOpen!0 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!353020)))

(declare-fun b!790760 () Bool)

(declare-fun c!87960 () Bool)

(assert (=> b!790760 (= c!87960 (= lt!353019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790760 (= e!439493 e!439492)))

(assert (= (and d!103033 c!87961) b!790758))

(assert (= (and d!103033 (not c!87961)) b!790755))

(assert (= (and b!790755 c!87959) b!790757))

(assert (= (and b!790755 (not c!87959)) b!790760))

