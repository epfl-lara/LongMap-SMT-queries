; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52662 () Bool)

(assert start!52662)

(declare-fun b!574363 () Bool)

(declare-fun res!363223 () Bool)

(declare-fun e!330461 () Bool)

(assert (=> b!574363 (=> (not res!363223) (not e!330461))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574363 (= res!363223 (validKeyInArray!0 k0!1914))))

(declare-fun b!574364 () Bool)

(declare-fun res!363232 () Bool)

(assert (=> b!574364 (=> (not res!363232) (not e!330461))))

(declare-datatypes ((array!35880 0))(
  ( (array!35881 (arr!17224 (Array (_ BitVec 32) (_ BitVec 64))) (size!17588 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35880)

(declare-fun arrayContainsKey!0 (array!35880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574364 (= res!363232 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574365 () Bool)

(declare-fun res!363227 () Bool)

(declare-fun e!330459 () Bool)

(assert (=> b!574365 (=> (not res!363227) (not e!330459))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35880 (_ BitVec 32)) Bool)

(assert (=> b!574365 (= res!363227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun lt!262344 () (_ BitVec 64))

(declare-fun e!330463 () Bool)

(declare-fun lt!262340 () array!35880)

(declare-datatypes ((SeekEntryResult!5629 0))(
  ( (MissingZero!5629 (index!24743 (_ BitVec 32))) (Found!5629 (index!24744 (_ BitVec 32))) (Intermediate!5629 (undefined!6441 Bool) (index!24745 (_ BitVec 32)) (x!53775 (_ BitVec 32))) (Undefined!5629) (MissingVacant!5629 (index!24746 (_ BitVec 32))) )
))
(declare-fun lt!262339 () SeekEntryResult!5629)

(declare-fun b!574366 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35880 (_ BitVec 32)) SeekEntryResult!5629)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35880 (_ BitVec 32)) SeekEntryResult!5629)

(assert (=> b!574366 (= e!330463 (= (seekEntryOrOpen!0 lt!262344 lt!262340 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53775 lt!262339) (index!24745 lt!262339) (index!24745 lt!262339) lt!262344 lt!262340 mask!3119)))))

(declare-fun res!363231 () Bool)

(assert (=> start!52662 (=> (not res!363231) (not e!330461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52662 (= res!363231 (validMask!0 mask!3119))))

(assert (=> start!52662 e!330461))

(assert (=> start!52662 true))

(declare-fun array_inv!13083 (array!35880) Bool)

(assert (=> start!52662 (array_inv!13083 a!3118)))

(declare-fun b!574367 () Bool)

(declare-fun e!330458 () Bool)

(declare-fun e!330462 () Bool)

(assert (=> b!574367 (= e!330458 e!330462)))

(declare-fun res!363221 () Bool)

(assert (=> b!574367 (=> res!363221 e!330462)))

(get-info :version)

(assert (=> b!574367 (= res!363221 (or (undefined!6441 lt!262339) (not ((_ is Intermediate!5629) lt!262339))))))

(declare-fun b!574368 () Bool)

(declare-fun e!330460 () Bool)

(assert (=> b!574368 (= e!330462 e!330460)))

(declare-fun res!363226 () Bool)

(assert (=> b!574368 (=> res!363226 e!330460)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!262343 () (_ BitVec 64))

(assert (=> b!574368 (= res!363226 (or (= lt!262343 (select (arr!17224 a!3118) j!142)) (= lt!262343 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574368 (= lt!262343 (select (arr!17224 a!3118) (index!24745 lt!262339)))))

(declare-fun b!574369 () Bool)

(declare-fun e!330465 () Bool)

(assert (=> b!574369 (= e!330465 (not (or (undefined!6441 lt!262339) (not ((_ is Intermediate!5629) lt!262339)) (let ((bdg!18009 (select (arr!17224 a!3118) (index!24745 lt!262339)))) (or (= bdg!18009 (select (arr!17224 a!3118) j!142)) (= bdg!18009 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24745 lt!262339) #b00000000000000000000000000000000) (bvsge (index!24745 lt!262339) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53775 lt!262339) #b01111111111111111111111111111110) (bvslt (x!53775 lt!262339) #b00000000000000000000000000000000) (= bdg!18009 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!574369 e!330458))

(declare-fun res!363229 () Bool)

(assert (=> b!574369 (=> (not res!363229) (not e!330458))))

(declare-fun lt!262341 () SeekEntryResult!5629)

(assert (=> b!574369 (= res!363229 (= lt!262341 (Found!5629 j!142)))))

(assert (=> b!574369 (= lt!262341 (seekEntryOrOpen!0 (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574369 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18031 0))(
  ( (Unit!18032) )
))
(declare-fun lt!262338 () Unit!18031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18031)

(assert (=> b!574369 (= lt!262338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574370 () Bool)

(declare-fun res!363228 () Bool)

(assert (=> b!574370 (=> (not res!363228) (not e!330461))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574370 (= res!363228 (and (= (size!17588 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17588 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17588 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574371 () Bool)

(assert (=> b!574371 (= e!330460 e!330463)))

(declare-fun res!363224 () Bool)

(assert (=> b!574371 (=> (not res!363224) (not e!330463))))

(assert (=> b!574371 (= res!363224 (= lt!262341 (seekKeyOrZeroReturnVacant!0 (x!53775 lt!262339) (index!24745 lt!262339) (index!24745 lt!262339) (select (arr!17224 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574372 () Bool)

(assert (=> b!574372 (= e!330459 e!330465)))

(declare-fun res!363230 () Bool)

(assert (=> b!574372 (=> (not res!363230) (not e!330465))))

(declare-fun lt!262337 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35880 (_ BitVec 32)) SeekEntryResult!5629)

(assert (=> b!574372 (= res!363230 (= lt!262339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262337 lt!262344 lt!262340 mask!3119)))))

(declare-fun lt!262342 () (_ BitVec 32))

(assert (=> b!574372 (= lt!262339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262342 (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574372 (= lt!262337 (toIndex!0 lt!262344 mask!3119))))

(assert (=> b!574372 (= lt!262344 (select (store (arr!17224 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574372 (= lt!262342 (toIndex!0 (select (arr!17224 a!3118) j!142) mask!3119))))

(assert (=> b!574372 (= lt!262340 (array!35881 (store (arr!17224 a!3118) i!1132 k0!1914) (size!17588 a!3118)))))

(declare-fun b!574373 () Bool)

(assert (=> b!574373 (= e!330461 e!330459)))

(declare-fun res!363220 () Bool)

(assert (=> b!574373 (=> (not res!363220) (not e!330459))))

(declare-fun lt!262345 () SeekEntryResult!5629)

(assert (=> b!574373 (= res!363220 (or (= lt!262345 (MissingZero!5629 i!1132)) (= lt!262345 (MissingVacant!5629 i!1132))))))

(assert (=> b!574373 (= lt!262345 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!574374 () Bool)

(declare-fun res!363225 () Bool)

(assert (=> b!574374 (=> (not res!363225) (not e!330461))))

(assert (=> b!574374 (= res!363225 (validKeyInArray!0 (select (arr!17224 a!3118) j!142)))))

(declare-fun b!574375 () Bool)

(declare-fun res!363222 () Bool)

(assert (=> b!574375 (=> (not res!363222) (not e!330459))))

(declare-datatypes ((List!11211 0))(
  ( (Nil!11208) (Cons!11207 (h!12243 (_ BitVec 64)) (t!17431 List!11211)) )
))
(declare-fun arrayNoDuplicates!0 (array!35880 (_ BitVec 32) List!11211) Bool)

(assert (=> b!574375 (= res!363222 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11208))))

(assert (= (and start!52662 res!363231) b!574370))

(assert (= (and b!574370 res!363228) b!574374))

(assert (= (and b!574374 res!363225) b!574363))

(assert (= (and b!574363 res!363223) b!574364))

(assert (= (and b!574364 res!363232) b!574373))

(assert (= (and b!574373 res!363220) b!574365))

(assert (= (and b!574365 res!363227) b!574375))

(assert (= (and b!574375 res!363222) b!574372))

(assert (= (and b!574372 res!363230) b!574369))

(assert (= (and b!574369 res!363229) b!574367))

(assert (= (and b!574367 (not res!363221)) b!574368))

(assert (= (and b!574368 (not res!363226)) b!574371))

(assert (= (and b!574371 res!363224) b!574366))

(declare-fun m!553415 () Bool)

(assert (=> b!574373 m!553415))

(declare-fun m!553417 () Bool)

(assert (=> b!574365 m!553417))

(declare-fun m!553419 () Bool)

(assert (=> b!574369 m!553419))

(declare-fun m!553421 () Bool)

(assert (=> b!574369 m!553421))

(assert (=> b!574369 m!553419))

(declare-fun m!553423 () Bool)

(assert (=> b!574369 m!553423))

(declare-fun m!553425 () Bool)

(assert (=> b!574369 m!553425))

(declare-fun m!553427 () Bool)

(assert (=> b!574369 m!553427))

(assert (=> b!574368 m!553419))

(assert (=> b!574368 m!553425))

(assert (=> b!574371 m!553419))

(assert (=> b!574371 m!553419))

(declare-fun m!553429 () Bool)

(assert (=> b!574371 m!553429))

(declare-fun m!553431 () Bool)

(assert (=> b!574364 m!553431))

(declare-fun m!553433 () Bool)

(assert (=> b!574366 m!553433))

(declare-fun m!553435 () Bool)

(assert (=> b!574366 m!553435))

(declare-fun m!553437 () Bool)

(assert (=> b!574363 m!553437))

(declare-fun m!553439 () Bool)

(assert (=> start!52662 m!553439))

(declare-fun m!553441 () Bool)

(assert (=> start!52662 m!553441))

(declare-fun m!553443 () Bool)

(assert (=> b!574375 m!553443))

(assert (=> b!574374 m!553419))

(assert (=> b!574374 m!553419))

(declare-fun m!553445 () Bool)

(assert (=> b!574374 m!553445))

(assert (=> b!574372 m!553419))

(declare-fun m!553447 () Bool)

(assert (=> b!574372 m!553447))

(assert (=> b!574372 m!553419))

(declare-fun m!553449 () Bool)

(assert (=> b!574372 m!553449))

(declare-fun m!553451 () Bool)

(assert (=> b!574372 m!553451))

(assert (=> b!574372 m!553419))

(declare-fun m!553453 () Bool)

(assert (=> b!574372 m!553453))

(declare-fun m!553455 () Bool)

(assert (=> b!574372 m!553455))

(declare-fun m!553457 () Bool)

(assert (=> b!574372 m!553457))

(check-sat (not b!574366) (not b!574365) (not b!574373) (not b!574363) (not b!574371) (not b!574372) (not b!574375) (not b!574374) (not start!52662) (not b!574364) (not b!574369))
(check-sat)
(get-model)

(declare-fun b!574464 () Bool)

(declare-fun e!330523 () Bool)

(declare-fun call!32673 () Bool)

(assert (=> b!574464 (= e!330523 call!32673)))

(declare-fun b!574465 () Bool)

(declare-fun e!330525 () Bool)

(assert (=> b!574465 (= e!330525 e!330523)))

(declare-fun c!65936 () Bool)

(assert (=> b!574465 (= c!65936 (validKeyInArray!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32670 () Bool)

(assert (=> bm!32670 (= call!32673 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65936 (Cons!11207 (select (arr!17224 a!3118) #b00000000000000000000000000000000) Nil!11208) Nil!11208)))))

(declare-fun b!574466 () Bool)

(assert (=> b!574466 (= e!330523 call!32673)))

(declare-fun d!85181 () Bool)

(declare-fun res!363318 () Bool)

(declare-fun e!330524 () Bool)

(assert (=> d!85181 (=> res!363318 e!330524)))

(assert (=> d!85181 (= res!363318 (bvsge #b00000000000000000000000000000000 (size!17588 a!3118)))))

(assert (=> d!85181 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11208) e!330524)))

(declare-fun b!574467 () Bool)

(declare-fun e!330522 () Bool)

(declare-fun contains!2861 (List!11211 (_ BitVec 64)) Bool)

(assert (=> b!574467 (= e!330522 (contains!2861 Nil!11208 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574468 () Bool)

(assert (=> b!574468 (= e!330524 e!330525)))

(declare-fun res!363317 () Bool)

(assert (=> b!574468 (=> (not res!363317) (not e!330525))))

(assert (=> b!574468 (= res!363317 (not e!330522))))

(declare-fun res!363319 () Bool)

(assert (=> b!574468 (=> (not res!363319) (not e!330522))))

(assert (=> b!574468 (= res!363319 (validKeyInArray!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85181 (not res!363318)) b!574468))

(assert (= (and b!574468 res!363319) b!574467))

(assert (= (and b!574468 res!363317) b!574465))

(assert (= (and b!574465 c!65936) b!574466))

(assert (= (and b!574465 (not c!65936)) b!574464))

(assert (= (or b!574466 b!574464) bm!32670))

(declare-fun m!553547 () Bool)

(assert (=> b!574465 m!553547))

(assert (=> b!574465 m!553547))

(declare-fun m!553549 () Bool)

(assert (=> b!574465 m!553549))

(assert (=> bm!32670 m!553547))

(declare-fun m!553551 () Bool)

(assert (=> bm!32670 m!553551))

(assert (=> b!574467 m!553547))

(assert (=> b!574467 m!553547))

(declare-fun m!553553 () Bool)

(assert (=> b!574467 m!553553))

(assert (=> b!574468 m!553547))

(assert (=> b!574468 m!553547))

(assert (=> b!574468 m!553549))

(assert (=> b!574375 d!85181))

(declare-fun d!85183 () Bool)

(declare-fun res!363325 () Bool)

(declare-fun e!330533 () Bool)

(assert (=> d!85183 (=> res!363325 e!330533)))

(assert (=> d!85183 (= res!363325 (bvsge #b00000000000000000000000000000000 (size!17588 a!3118)))))

(assert (=> d!85183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330533)))

(declare-fun b!574477 () Bool)

(declare-fun e!330532 () Bool)

(declare-fun call!32676 () Bool)

(assert (=> b!574477 (= e!330532 call!32676)))

(declare-fun b!574478 () Bool)

(declare-fun e!330534 () Bool)

(assert (=> b!574478 (= e!330534 call!32676)))

(declare-fun b!574479 () Bool)

(assert (=> b!574479 (= e!330532 e!330534)))

(declare-fun lt!262407 () (_ BitVec 64))

(assert (=> b!574479 (= lt!262407 (select (arr!17224 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262406 () Unit!18031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35880 (_ BitVec 64) (_ BitVec 32)) Unit!18031)

(assert (=> b!574479 (= lt!262406 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262407 #b00000000000000000000000000000000))))

(assert (=> b!574479 (arrayContainsKey!0 a!3118 lt!262407 #b00000000000000000000000000000000)))

(declare-fun lt!262408 () Unit!18031)

(assert (=> b!574479 (= lt!262408 lt!262406)))

(declare-fun res!363324 () Bool)

(assert (=> b!574479 (= res!363324 (= (seekEntryOrOpen!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5629 #b00000000000000000000000000000000)))))

(assert (=> b!574479 (=> (not res!363324) (not e!330534))))

(declare-fun b!574480 () Bool)

(assert (=> b!574480 (= e!330533 e!330532)))

(declare-fun c!65939 () Bool)

(assert (=> b!574480 (= c!65939 (validKeyInArray!0 (select (arr!17224 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32673 () Bool)

(assert (=> bm!32673 (= call!32676 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85183 (not res!363325)) b!574480))

(assert (= (and b!574480 c!65939) b!574479))

(assert (= (and b!574480 (not c!65939)) b!574477))

(assert (= (and b!574479 res!363324) b!574478))

(assert (= (or b!574478 b!574477) bm!32673))

(assert (=> b!574479 m!553547))

(declare-fun m!553555 () Bool)

(assert (=> b!574479 m!553555))

(declare-fun m!553557 () Bool)

(assert (=> b!574479 m!553557))

(assert (=> b!574479 m!553547))

(declare-fun m!553559 () Bool)

(assert (=> b!574479 m!553559))

(assert (=> b!574480 m!553547))

(assert (=> b!574480 m!553547))

(assert (=> b!574480 m!553549))

(declare-fun m!553561 () Bool)

(assert (=> bm!32673 m!553561))

(assert (=> b!574365 d!85183))

(declare-fun b!574494 () Bool)

(declare-fun e!330541 () SeekEntryResult!5629)

(declare-fun lt!262416 () SeekEntryResult!5629)

(assert (=> b!574494 (= e!330541 (MissingZero!5629 (index!24745 lt!262416)))))

(declare-fun b!574495 () Bool)

(assert (=> b!574495 (= e!330541 (seekKeyOrZeroReturnVacant!0 (x!53775 lt!262416) (index!24745 lt!262416) (index!24745 lt!262416) lt!262344 lt!262340 mask!3119))))

(declare-fun b!574496 () Bool)

(declare-fun e!330542 () SeekEntryResult!5629)

(assert (=> b!574496 (= e!330542 (Found!5629 (index!24745 lt!262416)))))

(declare-fun b!574497 () Bool)

(declare-fun e!330543 () SeekEntryResult!5629)

(assert (=> b!574497 (= e!330543 e!330542)))

(declare-fun lt!262417 () (_ BitVec 64))

(assert (=> b!574497 (= lt!262417 (select (arr!17224 lt!262340) (index!24745 lt!262416)))))

(declare-fun c!65946 () Bool)

(assert (=> b!574497 (= c!65946 (= lt!262417 lt!262344))))

(declare-fun b!574498 () Bool)

(declare-fun c!65947 () Bool)

(assert (=> b!574498 (= c!65947 (= lt!262417 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574498 (= e!330542 e!330541)))

(declare-fun d!85185 () Bool)

(declare-fun lt!262415 () SeekEntryResult!5629)

(assert (=> d!85185 (and (or ((_ is Undefined!5629) lt!262415) (not ((_ is Found!5629) lt!262415)) (and (bvsge (index!24744 lt!262415) #b00000000000000000000000000000000) (bvslt (index!24744 lt!262415) (size!17588 lt!262340)))) (or ((_ is Undefined!5629) lt!262415) ((_ is Found!5629) lt!262415) (not ((_ is MissingZero!5629) lt!262415)) (and (bvsge (index!24743 lt!262415) #b00000000000000000000000000000000) (bvslt (index!24743 lt!262415) (size!17588 lt!262340)))) (or ((_ is Undefined!5629) lt!262415) ((_ is Found!5629) lt!262415) ((_ is MissingZero!5629) lt!262415) (not ((_ is MissingVacant!5629) lt!262415)) (and (bvsge (index!24746 lt!262415) #b00000000000000000000000000000000) (bvslt (index!24746 lt!262415) (size!17588 lt!262340)))) (or ((_ is Undefined!5629) lt!262415) (ite ((_ is Found!5629) lt!262415) (= (select (arr!17224 lt!262340) (index!24744 lt!262415)) lt!262344) (ite ((_ is MissingZero!5629) lt!262415) (= (select (arr!17224 lt!262340) (index!24743 lt!262415)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5629) lt!262415) (= (select (arr!17224 lt!262340) (index!24746 lt!262415)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85185 (= lt!262415 e!330543)))

(declare-fun c!65948 () Bool)

(assert (=> d!85185 (= c!65948 (and ((_ is Intermediate!5629) lt!262416) (undefined!6441 lt!262416)))))

(assert (=> d!85185 (= lt!262416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262344 mask!3119) lt!262344 lt!262340 mask!3119))))

(assert (=> d!85185 (validMask!0 mask!3119)))

(assert (=> d!85185 (= (seekEntryOrOpen!0 lt!262344 lt!262340 mask!3119) lt!262415)))

(declare-fun b!574493 () Bool)

(assert (=> b!574493 (= e!330543 Undefined!5629)))

(assert (= (and d!85185 c!65948) b!574493))

(assert (= (and d!85185 (not c!65948)) b!574497))

(assert (= (and b!574497 c!65946) b!574496))

(assert (= (and b!574497 (not c!65946)) b!574498))

(assert (= (and b!574498 c!65947) b!574494))

(assert (= (and b!574498 (not c!65947)) b!574495))

(declare-fun m!553563 () Bool)

(assert (=> b!574495 m!553563))

(declare-fun m!553565 () Bool)

(assert (=> b!574497 m!553565))

(declare-fun m!553567 () Bool)

(assert (=> d!85185 m!553567))

(declare-fun m!553569 () Bool)

(assert (=> d!85185 m!553569))

(assert (=> d!85185 m!553457))

(declare-fun m!553571 () Bool)

(assert (=> d!85185 m!553571))

(assert (=> d!85185 m!553439))

(assert (=> d!85185 m!553457))

(declare-fun m!553573 () Bool)

(assert (=> d!85185 m!553573))

(assert (=> b!574366 d!85185))

(declare-fun e!330570 () SeekEntryResult!5629)

(declare-fun b!574547 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574547 (= e!330570 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53775 lt!262339) #b00000000000000000000000000000001) (nextIndex!0 (index!24745 lt!262339) (bvadd (x!53775 lt!262339) #b00000000000000000000000000000001) mask!3119) (index!24745 lt!262339) lt!262344 lt!262340 mask!3119))))

(declare-fun b!574549 () Bool)

(declare-fun e!330568 () SeekEntryResult!5629)

(assert (=> b!574549 (= e!330568 Undefined!5629)))

(declare-fun b!574550 () Bool)

(declare-fun e!330569 () SeekEntryResult!5629)

(assert (=> b!574550 (= e!330568 e!330569)))

(declare-fun c!65975 () Bool)

(declare-fun lt!262437 () (_ BitVec 64))

(assert (=> b!574550 (= c!65975 (= lt!262437 lt!262344))))

(declare-fun b!574551 () Bool)

(assert (=> b!574551 (= e!330570 (MissingVacant!5629 (index!24745 lt!262339)))))

(declare-fun b!574552 () Bool)

(assert (=> b!574552 (= e!330569 (Found!5629 (index!24745 lt!262339)))))

(declare-fun b!574548 () Bool)

(declare-fun c!65973 () Bool)

(assert (=> b!574548 (= c!65973 (= lt!262437 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574548 (= e!330569 e!330570)))

(declare-fun d!85191 () Bool)

(declare-fun lt!262438 () SeekEntryResult!5629)

(assert (=> d!85191 (and (or ((_ is Undefined!5629) lt!262438) (not ((_ is Found!5629) lt!262438)) (and (bvsge (index!24744 lt!262438) #b00000000000000000000000000000000) (bvslt (index!24744 lt!262438) (size!17588 lt!262340)))) (or ((_ is Undefined!5629) lt!262438) ((_ is Found!5629) lt!262438) (not ((_ is MissingVacant!5629) lt!262438)) (not (= (index!24746 lt!262438) (index!24745 lt!262339))) (and (bvsge (index!24746 lt!262438) #b00000000000000000000000000000000) (bvslt (index!24746 lt!262438) (size!17588 lt!262340)))) (or ((_ is Undefined!5629) lt!262438) (ite ((_ is Found!5629) lt!262438) (= (select (arr!17224 lt!262340) (index!24744 lt!262438)) lt!262344) (and ((_ is MissingVacant!5629) lt!262438) (= (index!24746 lt!262438) (index!24745 lt!262339)) (= (select (arr!17224 lt!262340) (index!24746 lt!262438)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85191 (= lt!262438 e!330568)))

(declare-fun c!65974 () Bool)

(assert (=> d!85191 (= c!65974 (bvsge (x!53775 lt!262339) #b01111111111111111111111111111110))))

(assert (=> d!85191 (= lt!262437 (select (arr!17224 lt!262340) (index!24745 lt!262339)))))

(assert (=> d!85191 (validMask!0 mask!3119)))

(assert (=> d!85191 (= (seekKeyOrZeroReturnVacant!0 (x!53775 lt!262339) (index!24745 lt!262339) (index!24745 lt!262339) lt!262344 lt!262340 mask!3119) lt!262438)))

(assert (= (and d!85191 c!65974) b!574549))

(assert (= (and d!85191 (not c!65974)) b!574550))

(assert (= (and b!574550 c!65975) b!574552))

(assert (= (and b!574550 (not c!65975)) b!574548))

(assert (= (and b!574548 c!65973) b!574551))

(assert (= (and b!574548 (not c!65973)) b!574547))

(declare-fun m!553595 () Bool)

(assert (=> b!574547 m!553595))

(assert (=> b!574547 m!553595))

(declare-fun m!553597 () Bool)

(assert (=> b!574547 m!553597))

(declare-fun m!553599 () Bool)

(assert (=> d!85191 m!553599))

(declare-fun m!553601 () Bool)

(assert (=> d!85191 m!553601))

(declare-fun m!553603 () Bool)

(assert (=> d!85191 m!553603))

(assert (=> d!85191 m!553439))

(assert (=> b!574366 d!85191))

(declare-fun b!574562 () Bool)

(declare-fun e!330577 () SeekEntryResult!5629)

(declare-fun lt!262446 () SeekEntryResult!5629)

(assert (=> b!574562 (= e!330577 (MissingZero!5629 (index!24745 lt!262446)))))

(declare-fun b!574563 () Bool)

(assert (=> b!574563 (= e!330577 (seekKeyOrZeroReturnVacant!0 (x!53775 lt!262446) (index!24745 lt!262446) (index!24745 lt!262446) k0!1914 a!3118 mask!3119))))

(declare-fun b!574564 () Bool)

(declare-fun e!330578 () SeekEntryResult!5629)

(assert (=> b!574564 (= e!330578 (Found!5629 (index!24745 lt!262446)))))

(declare-fun b!574565 () Bool)

(declare-fun e!330579 () SeekEntryResult!5629)

(assert (=> b!574565 (= e!330579 e!330578)))

(declare-fun lt!262447 () (_ BitVec 64))

(assert (=> b!574565 (= lt!262447 (select (arr!17224 a!3118) (index!24745 lt!262446)))))

(declare-fun c!65978 () Bool)

(assert (=> b!574565 (= c!65978 (= lt!262447 k0!1914))))

(declare-fun b!574566 () Bool)

(declare-fun c!65979 () Bool)

(assert (=> b!574566 (= c!65979 (= lt!262447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574566 (= e!330578 e!330577)))

(declare-fun d!85197 () Bool)

(declare-fun lt!262445 () SeekEntryResult!5629)

(assert (=> d!85197 (and (or ((_ is Undefined!5629) lt!262445) (not ((_ is Found!5629) lt!262445)) (and (bvsge (index!24744 lt!262445) #b00000000000000000000000000000000) (bvslt (index!24744 lt!262445) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262445) ((_ is Found!5629) lt!262445) (not ((_ is MissingZero!5629) lt!262445)) (and (bvsge (index!24743 lt!262445) #b00000000000000000000000000000000) (bvslt (index!24743 lt!262445) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262445) ((_ is Found!5629) lt!262445) ((_ is MissingZero!5629) lt!262445) (not ((_ is MissingVacant!5629) lt!262445)) (and (bvsge (index!24746 lt!262445) #b00000000000000000000000000000000) (bvslt (index!24746 lt!262445) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262445) (ite ((_ is Found!5629) lt!262445) (= (select (arr!17224 a!3118) (index!24744 lt!262445)) k0!1914) (ite ((_ is MissingZero!5629) lt!262445) (= (select (arr!17224 a!3118) (index!24743 lt!262445)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5629) lt!262445) (= (select (arr!17224 a!3118) (index!24746 lt!262445)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85197 (= lt!262445 e!330579)))

(declare-fun c!65980 () Bool)

(assert (=> d!85197 (= c!65980 (and ((_ is Intermediate!5629) lt!262446) (undefined!6441 lt!262446)))))

(assert (=> d!85197 (= lt!262446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85197 (validMask!0 mask!3119)))

(assert (=> d!85197 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!262445)))

(declare-fun b!574561 () Bool)

(assert (=> b!574561 (= e!330579 Undefined!5629)))

(assert (= (and d!85197 c!65980) b!574561))

(assert (= (and d!85197 (not c!65980)) b!574565))

(assert (= (and b!574565 c!65978) b!574564))

(assert (= (and b!574565 (not c!65978)) b!574566))

(assert (= (and b!574566 c!65979) b!574562))

(assert (= (and b!574566 (not c!65979)) b!574563))

(declare-fun m!553605 () Bool)

(assert (=> b!574563 m!553605))

(declare-fun m!553607 () Bool)

(assert (=> b!574565 m!553607))

(declare-fun m!553609 () Bool)

(assert (=> d!85197 m!553609))

(declare-fun m!553611 () Bool)

(assert (=> d!85197 m!553611))

(declare-fun m!553613 () Bool)

(assert (=> d!85197 m!553613))

(declare-fun m!553615 () Bool)

(assert (=> d!85197 m!553615))

(assert (=> d!85197 m!553439))

(assert (=> d!85197 m!553613))

(declare-fun m!553617 () Bool)

(assert (=> d!85197 m!553617))

(assert (=> b!574373 d!85197))

(declare-fun d!85199 () Bool)

(assert (=> d!85199 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574363 d!85199))

(declare-fun d!85203 () Bool)

(assert (=> d!85203 (= (validKeyInArray!0 (select (arr!17224 a!3118) j!142)) (and (not (= (select (arr!17224 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17224 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574374 d!85203))

(declare-fun d!85205 () Bool)

(declare-fun res!363340 () Bool)

(declare-fun e!330593 () Bool)

(assert (=> d!85205 (=> res!363340 e!330593)))

(assert (=> d!85205 (= res!363340 (= (select (arr!17224 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85205 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330593)))

(declare-fun b!574583 () Bool)

(declare-fun e!330594 () Bool)

(assert (=> b!574583 (= e!330593 e!330594)))

(declare-fun res!363341 () Bool)

(assert (=> b!574583 (=> (not res!363341) (not e!330594))))

(assert (=> b!574583 (= res!363341 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17588 a!3118)))))

(declare-fun b!574584 () Bool)

(assert (=> b!574584 (= e!330594 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85205 (not res!363340)) b!574583))

(assert (= (and b!574583 res!363341) b!574584))

(assert (=> d!85205 m!553547))

(declare-fun m!553627 () Bool)

(assert (=> b!574584 m!553627))

(assert (=> b!574364 d!85205))

(declare-fun e!330597 () SeekEntryResult!5629)

(declare-fun b!574585 () Bool)

(assert (=> b!574585 (= e!330597 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53775 lt!262339) #b00000000000000000000000000000001) (nextIndex!0 (index!24745 lt!262339) (bvadd (x!53775 lt!262339) #b00000000000000000000000000000001) mask!3119) (index!24745 lt!262339) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574587 () Bool)

(declare-fun e!330595 () SeekEntryResult!5629)

(assert (=> b!574587 (= e!330595 Undefined!5629)))

(declare-fun b!574588 () Bool)

(declare-fun e!330596 () SeekEntryResult!5629)

(assert (=> b!574588 (= e!330595 e!330596)))

(declare-fun lt!262460 () (_ BitVec 64))

(declare-fun c!65986 () Bool)

(assert (=> b!574588 (= c!65986 (= lt!262460 (select (arr!17224 a!3118) j!142)))))

(declare-fun b!574589 () Bool)

(assert (=> b!574589 (= e!330597 (MissingVacant!5629 (index!24745 lt!262339)))))

(declare-fun b!574590 () Bool)

(assert (=> b!574590 (= e!330596 (Found!5629 (index!24745 lt!262339)))))

(declare-fun b!574586 () Bool)

(declare-fun c!65984 () Bool)

(assert (=> b!574586 (= c!65984 (= lt!262460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574586 (= e!330596 e!330597)))

(declare-fun lt!262461 () SeekEntryResult!5629)

(declare-fun d!85209 () Bool)

(assert (=> d!85209 (and (or ((_ is Undefined!5629) lt!262461) (not ((_ is Found!5629) lt!262461)) (and (bvsge (index!24744 lt!262461) #b00000000000000000000000000000000) (bvslt (index!24744 lt!262461) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262461) ((_ is Found!5629) lt!262461) (not ((_ is MissingVacant!5629) lt!262461)) (not (= (index!24746 lt!262461) (index!24745 lt!262339))) (and (bvsge (index!24746 lt!262461) #b00000000000000000000000000000000) (bvslt (index!24746 lt!262461) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262461) (ite ((_ is Found!5629) lt!262461) (= (select (arr!17224 a!3118) (index!24744 lt!262461)) (select (arr!17224 a!3118) j!142)) (and ((_ is MissingVacant!5629) lt!262461) (= (index!24746 lt!262461) (index!24745 lt!262339)) (= (select (arr!17224 a!3118) (index!24746 lt!262461)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85209 (= lt!262461 e!330595)))

(declare-fun c!65985 () Bool)

(assert (=> d!85209 (= c!65985 (bvsge (x!53775 lt!262339) #b01111111111111111111111111111110))))

(assert (=> d!85209 (= lt!262460 (select (arr!17224 a!3118) (index!24745 lt!262339)))))

(assert (=> d!85209 (validMask!0 mask!3119)))

(assert (=> d!85209 (= (seekKeyOrZeroReturnVacant!0 (x!53775 lt!262339) (index!24745 lt!262339) (index!24745 lt!262339) (select (arr!17224 a!3118) j!142) a!3118 mask!3119) lt!262461)))

(assert (= (and d!85209 c!65985) b!574587))

(assert (= (and d!85209 (not c!65985)) b!574588))

(assert (= (and b!574588 c!65986) b!574590))

(assert (= (and b!574588 (not c!65986)) b!574586))

(assert (= (and b!574586 c!65984) b!574589))

(assert (= (and b!574586 (not c!65984)) b!574585))

(assert (=> b!574585 m!553595))

(assert (=> b!574585 m!553595))

(assert (=> b!574585 m!553419))

(declare-fun m!553629 () Bool)

(assert (=> b!574585 m!553629))

(declare-fun m!553631 () Bool)

(assert (=> d!85209 m!553631))

(declare-fun m!553633 () Bool)

(assert (=> d!85209 m!553633))

(assert (=> d!85209 m!553425))

(assert (=> d!85209 m!553439))

(assert (=> b!574371 d!85209))

(declare-fun d!85211 () Bool)

(declare-fun e!330641 () Bool)

(assert (=> d!85211 e!330641))

(declare-fun c!66017 () Bool)

(declare-fun lt!262487 () SeekEntryResult!5629)

(assert (=> d!85211 (= c!66017 (and ((_ is Intermediate!5629) lt!262487) (undefined!6441 lt!262487)))))

(declare-fun e!330644 () SeekEntryResult!5629)

(assert (=> d!85211 (= lt!262487 e!330644)))

(declare-fun c!66016 () Bool)

(assert (=> d!85211 (= c!66016 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262486 () (_ BitVec 64))

(assert (=> d!85211 (= lt!262486 (select (arr!17224 lt!262340) lt!262337))))

(assert (=> d!85211 (validMask!0 mask!3119)))

(assert (=> d!85211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262337 lt!262344 lt!262340 mask!3119) lt!262487)))

(declare-fun b!574667 () Bool)

(assert (=> b!574667 (and (bvsge (index!24745 lt!262487) #b00000000000000000000000000000000) (bvslt (index!24745 lt!262487) (size!17588 lt!262340)))))

(declare-fun e!330642 () Bool)

(assert (=> b!574667 (= e!330642 (= (select (arr!17224 lt!262340) (index!24745 lt!262487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574668 () Bool)

(assert (=> b!574668 (= e!330641 (bvsge (x!53775 lt!262487) #b01111111111111111111111111111110))))

(declare-fun b!574669 () Bool)

(declare-fun e!330643 () SeekEntryResult!5629)

(assert (=> b!574669 (= e!330643 (Intermediate!5629 false lt!262337 #b00000000000000000000000000000000))))

(declare-fun b!574670 () Bool)

(assert (=> b!574670 (and (bvsge (index!24745 lt!262487) #b00000000000000000000000000000000) (bvslt (index!24745 lt!262487) (size!17588 lt!262340)))))

(declare-fun res!363362 () Bool)

(assert (=> b!574670 (= res!363362 (= (select (arr!17224 lt!262340) (index!24745 lt!262487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574670 (=> res!363362 e!330642)))

(declare-fun b!574671 () Bool)

(declare-fun e!330640 () Bool)

(assert (=> b!574671 (= e!330641 e!330640)))

(declare-fun res!363364 () Bool)

(assert (=> b!574671 (= res!363364 (and ((_ is Intermediate!5629) lt!262487) (not (undefined!6441 lt!262487)) (bvslt (x!53775 lt!262487) #b01111111111111111111111111111110) (bvsge (x!53775 lt!262487) #b00000000000000000000000000000000) (bvsge (x!53775 lt!262487) #b00000000000000000000000000000000)))))

(assert (=> b!574671 (=> (not res!363364) (not e!330640))))

(declare-fun b!574672 () Bool)

(assert (=> b!574672 (= e!330644 e!330643)))

(declare-fun c!66015 () Bool)

(assert (=> b!574672 (= c!66015 (or (= lt!262486 lt!262344) (= (bvadd lt!262486 lt!262486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574673 () Bool)

(assert (=> b!574673 (= e!330644 (Intermediate!5629 true lt!262337 #b00000000000000000000000000000000))))

(declare-fun b!574674 () Bool)

(assert (=> b!574674 (and (bvsge (index!24745 lt!262487) #b00000000000000000000000000000000) (bvslt (index!24745 lt!262487) (size!17588 lt!262340)))))

(declare-fun res!363363 () Bool)

(assert (=> b!574674 (= res!363363 (= (select (arr!17224 lt!262340) (index!24745 lt!262487)) lt!262344))))

(assert (=> b!574674 (=> res!363363 e!330642)))

(assert (=> b!574674 (= e!330640 e!330642)))

(declare-fun b!574675 () Bool)

(assert (=> b!574675 (= e!330643 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262337 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!262344 lt!262340 mask!3119))))

(assert (= (and d!85211 c!66016) b!574673))

(assert (= (and d!85211 (not c!66016)) b!574672))

(assert (= (and b!574672 c!66015) b!574669))

(assert (= (and b!574672 (not c!66015)) b!574675))

(assert (= (and d!85211 c!66017) b!574668))

(assert (= (and d!85211 (not c!66017)) b!574671))

(assert (= (and b!574671 res!363364) b!574674))

(assert (= (and b!574674 (not res!363363)) b!574670))

(assert (= (and b!574670 (not res!363362)) b!574667))

(declare-fun m!553677 () Bool)

(assert (=> b!574674 m!553677))

(assert (=> b!574667 m!553677))

(declare-fun m!553679 () Bool)

(assert (=> d!85211 m!553679))

(assert (=> d!85211 m!553439))

(declare-fun m!553681 () Bool)

(assert (=> b!574675 m!553681))

(assert (=> b!574675 m!553681))

(declare-fun m!553683 () Bool)

(assert (=> b!574675 m!553683))

(assert (=> b!574670 m!553677))

(assert (=> b!574372 d!85211))

(declare-fun d!85227 () Bool)

(declare-fun e!330649 () Bool)

(assert (=> d!85227 e!330649))

(declare-fun c!66023 () Bool)

(declare-fun lt!262492 () SeekEntryResult!5629)

(assert (=> d!85227 (= c!66023 (and ((_ is Intermediate!5629) lt!262492) (undefined!6441 lt!262492)))))

(declare-fun e!330652 () SeekEntryResult!5629)

(assert (=> d!85227 (= lt!262492 e!330652)))

(declare-fun c!66022 () Bool)

(assert (=> d!85227 (= c!66022 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262491 () (_ BitVec 64))

(assert (=> d!85227 (= lt!262491 (select (arr!17224 a!3118) lt!262342))))

(assert (=> d!85227 (validMask!0 mask!3119)))

(assert (=> d!85227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262342 (select (arr!17224 a!3118) j!142) a!3118 mask!3119) lt!262492)))

(declare-fun b!574682 () Bool)

(assert (=> b!574682 (and (bvsge (index!24745 lt!262492) #b00000000000000000000000000000000) (bvslt (index!24745 lt!262492) (size!17588 a!3118)))))

(declare-fun e!330650 () Bool)

(assert (=> b!574682 (= e!330650 (= (select (arr!17224 a!3118) (index!24745 lt!262492)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574683 () Bool)

(assert (=> b!574683 (= e!330649 (bvsge (x!53775 lt!262492) #b01111111111111111111111111111110))))

(declare-fun b!574684 () Bool)

(declare-fun e!330651 () SeekEntryResult!5629)

(assert (=> b!574684 (= e!330651 (Intermediate!5629 false lt!262342 #b00000000000000000000000000000000))))

(declare-fun b!574685 () Bool)

(assert (=> b!574685 (and (bvsge (index!24745 lt!262492) #b00000000000000000000000000000000) (bvslt (index!24745 lt!262492) (size!17588 a!3118)))))

(declare-fun res!363366 () Bool)

(assert (=> b!574685 (= res!363366 (= (select (arr!17224 a!3118) (index!24745 lt!262492)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574685 (=> res!363366 e!330650)))

(declare-fun b!574686 () Bool)

(declare-fun e!330648 () Bool)

(assert (=> b!574686 (= e!330649 e!330648)))

(declare-fun res!363368 () Bool)

(assert (=> b!574686 (= res!363368 (and ((_ is Intermediate!5629) lt!262492) (not (undefined!6441 lt!262492)) (bvslt (x!53775 lt!262492) #b01111111111111111111111111111110) (bvsge (x!53775 lt!262492) #b00000000000000000000000000000000) (bvsge (x!53775 lt!262492) #b00000000000000000000000000000000)))))

(assert (=> b!574686 (=> (not res!363368) (not e!330648))))

(declare-fun b!574687 () Bool)

(assert (=> b!574687 (= e!330652 e!330651)))

(declare-fun c!66021 () Bool)

(assert (=> b!574687 (= c!66021 (or (= lt!262491 (select (arr!17224 a!3118) j!142)) (= (bvadd lt!262491 lt!262491) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574688 () Bool)

(assert (=> b!574688 (= e!330652 (Intermediate!5629 true lt!262342 #b00000000000000000000000000000000))))

(declare-fun b!574689 () Bool)

(assert (=> b!574689 (and (bvsge (index!24745 lt!262492) #b00000000000000000000000000000000) (bvslt (index!24745 lt!262492) (size!17588 a!3118)))))

(declare-fun res!363367 () Bool)

(assert (=> b!574689 (= res!363367 (= (select (arr!17224 a!3118) (index!24745 lt!262492)) (select (arr!17224 a!3118) j!142)))))

(assert (=> b!574689 (=> res!363367 e!330650)))

(assert (=> b!574689 (= e!330648 e!330650)))

(declare-fun b!574690 () Bool)

(assert (=> b!574690 (= e!330651 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262342 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85227 c!66022) b!574688))

(assert (= (and d!85227 (not c!66022)) b!574687))

(assert (= (and b!574687 c!66021) b!574684))

(assert (= (and b!574687 (not c!66021)) b!574690))

(assert (= (and d!85227 c!66023) b!574683))

(assert (= (and d!85227 (not c!66023)) b!574686))

(assert (= (and b!574686 res!363368) b!574689))

(assert (= (and b!574689 (not res!363367)) b!574685))

(assert (= (and b!574685 (not res!363366)) b!574682))

(declare-fun m!553693 () Bool)

(assert (=> b!574689 m!553693))

(assert (=> b!574682 m!553693))

(declare-fun m!553697 () Bool)

(assert (=> d!85227 m!553697))

(assert (=> d!85227 m!553439))

(declare-fun m!553701 () Bool)

(assert (=> b!574690 m!553701))

(assert (=> b!574690 m!553701))

(assert (=> b!574690 m!553419))

(declare-fun m!553705 () Bool)

(assert (=> b!574690 m!553705))

(assert (=> b!574685 m!553693))

(assert (=> b!574372 d!85227))

(declare-fun d!85231 () Bool)

(declare-fun lt!262515 () (_ BitVec 32))

(declare-fun lt!262514 () (_ BitVec 32))

(assert (=> d!85231 (= lt!262515 (bvmul (bvxor lt!262514 (bvlshr lt!262514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85231 (= lt!262514 ((_ extract 31 0) (bvand (bvxor lt!262344 (bvlshr lt!262344 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85231 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363369 (let ((h!12247 ((_ extract 31 0) (bvand (bvxor lt!262344 (bvlshr lt!262344 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53783 (bvmul (bvxor h!12247 (bvlshr h!12247 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53783 (bvlshr x!53783 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363369 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363369 #b00000000000000000000000000000000))))))

(assert (=> d!85231 (= (toIndex!0 lt!262344 mask!3119) (bvand (bvxor lt!262515 (bvlshr lt!262515 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574372 d!85231))

(declare-fun d!85249 () Bool)

(declare-fun lt!262517 () (_ BitVec 32))

(declare-fun lt!262516 () (_ BitVec 32))

(assert (=> d!85249 (= lt!262517 (bvmul (bvxor lt!262516 (bvlshr lt!262516 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85249 (= lt!262516 ((_ extract 31 0) (bvand (bvxor (select (arr!17224 a!3118) j!142) (bvlshr (select (arr!17224 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85249 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363369 (let ((h!12247 ((_ extract 31 0) (bvand (bvxor (select (arr!17224 a!3118) j!142) (bvlshr (select (arr!17224 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53783 (bvmul (bvxor h!12247 (bvlshr h!12247 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53783 (bvlshr x!53783 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363369 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363369 #b00000000000000000000000000000000))))))

(assert (=> d!85249 (= (toIndex!0 (select (arr!17224 a!3118) j!142) mask!3119) (bvand (bvxor lt!262517 (bvlshr lt!262517 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574372 d!85249))

(declare-fun d!85251 () Bool)

(assert (=> d!85251 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52662 d!85251))

(declare-fun d!85263 () Bool)

(assert (=> d!85263 (= (array_inv!13083 a!3118) (bvsge (size!17588 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52662 d!85263))

(declare-fun b!574742 () Bool)

(declare-fun e!330683 () SeekEntryResult!5629)

(declare-fun lt!262533 () SeekEntryResult!5629)

(assert (=> b!574742 (= e!330683 (MissingZero!5629 (index!24745 lt!262533)))))

(declare-fun b!574743 () Bool)

(assert (=> b!574743 (= e!330683 (seekKeyOrZeroReturnVacant!0 (x!53775 lt!262533) (index!24745 lt!262533) (index!24745 lt!262533) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574744 () Bool)

(declare-fun e!330684 () SeekEntryResult!5629)

(assert (=> b!574744 (= e!330684 (Found!5629 (index!24745 lt!262533)))))

(declare-fun b!574745 () Bool)

(declare-fun e!330685 () SeekEntryResult!5629)

(assert (=> b!574745 (= e!330685 e!330684)))

(declare-fun lt!262534 () (_ BitVec 64))

(assert (=> b!574745 (= lt!262534 (select (arr!17224 a!3118) (index!24745 lt!262533)))))

(declare-fun c!66044 () Bool)

(assert (=> b!574745 (= c!66044 (= lt!262534 (select (arr!17224 a!3118) j!142)))))

(declare-fun b!574746 () Bool)

(declare-fun c!66045 () Bool)

(assert (=> b!574746 (= c!66045 (= lt!262534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574746 (= e!330684 e!330683)))

(declare-fun d!85265 () Bool)

(declare-fun lt!262532 () SeekEntryResult!5629)

(assert (=> d!85265 (and (or ((_ is Undefined!5629) lt!262532) (not ((_ is Found!5629) lt!262532)) (and (bvsge (index!24744 lt!262532) #b00000000000000000000000000000000) (bvslt (index!24744 lt!262532) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262532) ((_ is Found!5629) lt!262532) (not ((_ is MissingZero!5629) lt!262532)) (and (bvsge (index!24743 lt!262532) #b00000000000000000000000000000000) (bvslt (index!24743 lt!262532) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262532) ((_ is Found!5629) lt!262532) ((_ is MissingZero!5629) lt!262532) (not ((_ is MissingVacant!5629) lt!262532)) (and (bvsge (index!24746 lt!262532) #b00000000000000000000000000000000) (bvslt (index!24746 lt!262532) (size!17588 a!3118)))) (or ((_ is Undefined!5629) lt!262532) (ite ((_ is Found!5629) lt!262532) (= (select (arr!17224 a!3118) (index!24744 lt!262532)) (select (arr!17224 a!3118) j!142)) (ite ((_ is MissingZero!5629) lt!262532) (= (select (arr!17224 a!3118) (index!24743 lt!262532)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5629) lt!262532) (= (select (arr!17224 a!3118) (index!24746 lt!262532)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85265 (= lt!262532 e!330685)))

(declare-fun c!66046 () Bool)

(assert (=> d!85265 (= c!66046 (and ((_ is Intermediate!5629) lt!262533) (undefined!6441 lt!262533)))))

(assert (=> d!85265 (= lt!262533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17224 a!3118) j!142) mask!3119) (select (arr!17224 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85265 (validMask!0 mask!3119)))

(assert (=> d!85265 (= (seekEntryOrOpen!0 (select (arr!17224 a!3118) j!142) a!3118 mask!3119) lt!262532)))

(declare-fun b!574741 () Bool)

(assert (=> b!574741 (= e!330685 Undefined!5629)))

(assert (= (and d!85265 c!66046) b!574741))

(assert (= (and d!85265 (not c!66046)) b!574745))

(assert (= (and b!574745 c!66044) b!574744))

(assert (= (and b!574745 (not c!66044)) b!574746))

(assert (= (and b!574746 c!66045) b!574742))

(assert (= (and b!574746 (not c!66045)) b!574743))

(assert (=> b!574743 m!553419))

(declare-fun m!553769 () Bool)

(assert (=> b!574743 m!553769))

(declare-fun m!553771 () Bool)

(assert (=> b!574745 m!553771))

(declare-fun m!553773 () Bool)

(assert (=> d!85265 m!553773))

(declare-fun m!553775 () Bool)

(assert (=> d!85265 m!553775))

(assert (=> d!85265 m!553447))

(assert (=> d!85265 m!553419))

(declare-fun m!553777 () Bool)

(assert (=> d!85265 m!553777))

(assert (=> d!85265 m!553439))

(assert (=> d!85265 m!553419))

(assert (=> d!85265 m!553447))

(declare-fun m!553779 () Bool)

(assert (=> d!85265 m!553779))

(assert (=> b!574369 d!85265))

(declare-fun d!85267 () Bool)

(declare-fun res!363385 () Bool)

(declare-fun e!330693 () Bool)

(assert (=> d!85267 (=> res!363385 e!330693)))

(assert (=> d!85267 (= res!363385 (bvsge j!142 (size!17588 a!3118)))))

(assert (=> d!85267 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330693)))

(declare-fun b!574749 () Bool)

(declare-fun e!330690 () Bool)

(declare-fun call!32685 () Bool)

(assert (=> b!574749 (= e!330690 call!32685)))

(declare-fun b!574750 () Bool)

(declare-fun e!330694 () Bool)

(assert (=> b!574750 (= e!330694 call!32685)))

(declare-fun b!574751 () Bool)

(assert (=> b!574751 (= e!330690 e!330694)))

(declare-fun lt!262536 () (_ BitVec 64))

(assert (=> b!574751 (= lt!262536 (select (arr!17224 a!3118) j!142))))

(declare-fun lt!262535 () Unit!18031)

(assert (=> b!574751 (= lt!262535 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262536 j!142))))

(assert (=> b!574751 (arrayContainsKey!0 a!3118 lt!262536 #b00000000000000000000000000000000)))

(declare-fun lt!262537 () Unit!18031)

(assert (=> b!574751 (= lt!262537 lt!262535)))

(declare-fun res!363384 () Bool)

(assert (=> b!574751 (= res!363384 (= (seekEntryOrOpen!0 (select (arr!17224 a!3118) j!142) a!3118 mask!3119) (Found!5629 j!142)))))

(assert (=> b!574751 (=> (not res!363384) (not e!330694))))

(declare-fun b!574752 () Bool)

(assert (=> b!574752 (= e!330693 e!330690)))

(declare-fun c!66047 () Bool)

(assert (=> b!574752 (= c!66047 (validKeyInArray!0 (select (arr!17224 a!3118) j!142)))))

(declare-fun bm!32682 () Bool)

(assert (=> bm!32682 (= call!32685 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85267 (not res!363385)) b!574752))

(assert (= (and b!574752 c!66047) b!574751))

(assert (= (and b!574752 (not c!66047)) b!574749))

(assert (= (and b!574751 res!363384) b!574750))

(assert (= (or b!574750 b!574749) bm!32682))

(assert (=> b!574751 m!553419))

(declare-fun m!553781 () Bool)

(assert (=> b!574751 m!553781))

(declare-fun m!553783 () Bool)

(assert (=> b!574751 m!553783))

(assert (=> b!574751 m!553419))

(assert (=> b!574751 m!553423))

(assert (=> b!574752 m!553419))

(assert (=> b!574752 m!553419))

(assert (=> b!574752 m!553445))

(declare-fun m!553785 () Bool)

(assert (=> bm!32682 m!553785))

(assert (=> b!574369 d!85267))

(declare-fun d!85269 () Bool)

(assert (=> d!85269 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262544 () Unit!18031)

(declare-fun choose!38 (array!35880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18031)

(assert (=> d!85269 (= lt!262544 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85269 (validMask!0 mask!3119)))

(assert (=> d!85269 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262544)))

(declare-fun bs!17791 () Bool)

(assert (= bs!17791 d!85269))

(assert (=> bs!17791 m!553427))

(declare-fun m!553791 () Bool)

(assert (=> bs!17791 m!553791))

(assert (=> bs!17791 m!553439))

(assert (=> b!574369 d!85269))

(check-sat (not b!574743) (not bm!32682) (not b!574751) (not b!574468) (not b!574467) (not b!574547) (not d!85191) (not bm!32670) (not b!574563) (not b!574752) (not d!85209) (not d!85265) (not d!85185) (not b!574480) (not d!85211) (not d!85269) (not b!574585) (not b!574479) (not b!574675) (not b!574465) (not d!85227) (not b!574495) (not b!574584) (not d!85197) (not b!574690) (not bm!32673))
(check-sat)
