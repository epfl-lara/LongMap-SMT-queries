; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27394 () Bool)

(assert start!27394)

(declare-fun b!283547 () Bool)

(declare-fun res!146474 () Bool)

(declare-fun e!179896 () Bool)

(assert (=> b!283547 (=> (not res!146474) (not e!179896))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283547 (= res!146474 (validKeyInArray!0 k!2581))))

(declare-fun b!283548 () Bool)

(declare-fun res!146472 () Bool)

(assert (=> b!283548 (=> (not res!146472) (not e!179896))))

(declare-datatypes ((array!14149 0))(
  ( (array!14150 (arr!6715 (Array (_ BitVec 32) (_ BitVec 64))) (size!7067 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14149)

(declare-fun arrayContainsKey!0 (array!14149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283548 (= res!146472 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun lt!140153 () array!14149)

(declare-fun e!179893 () Bool)

(declare-fun b!283549 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14149 (_ BitVec 32)) Bool)

(assert (=> b!283549 (= e!179893 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140153 mask!3868))))

(declare-fun b!283550 () Bool)

(declare-fun e!179894 () Bool)

(assert (=> b!283550 (= e!179894 (not e!179893))))

(declare-fun res!146466 () Bool)

(assert (=> b!283550 (=> res!146466 e!179893)))

(assert (=> b!283550 (= res!146466 (bvslt startIndex!26 (bvsub (size!7067 a!3325) #b00000000000000000000000000000001)))))

(assert (=> b!283550 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9030 0))(
  ( (Unit!9031) )
))
(declare-fun lt!140155 () Unit!9030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9030)

(assert (=> b!283550 (= lt!140155 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1873 0))(
  ( (MissingZero!1873 (index!9662 (_ BitVec 32))) (Found!1873 (index!9663 (_ BitVec 32))) (Intermediate!1873 (undefined!2685 Bool) (index!9664 (_ BitVec 32)) (x!27863 (_ BitVec 32))) (Undefined!1873) (MissingVacant!1873 (index!9665 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14149 (_ BitVec 32)) SeekEntryResult!1873)

(assert (=> b!283550 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) lt!140153 mask!3868))))

(declare-fun lt!140151 () Unit!9030)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9030)

(assert (=> b!283550 (= lt!140151 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4523 0))(
  ( (Nil!4520) (Cons!4519 (h!5189 (_ BitVec 64)) (t!9605 List!4523)) )
))
(declare-fun arrayNoDuplicates!0 (array!14149 (_ BitVec 32) List!4523) Bool)

(assert (=> b!283550 (arrayNoDuplicates!0 lt!140153 #b00000000000000000000000000000000 Nil!4520)))

(declare-fun lt!140154 () Unit!9030)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4523) Unit!9030)

(assert (=> b!283550 (= lt!140154 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4520))))

(declare-fun b!283551 () Bool)

(declare-fun e!179897 () Bool)

(assert (=> b!283551 (= e!179897 e!179894)))

(declare-fun res!146468 () Bool)

(assert (=> b!283551 (=> (not res!146468) (not e!179894))))

(assert (=> b!283551 (= res!146468 (not (= startIndex!26 i!1267)))))

(assert (=> b!283551 (= lt!140153 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)))))

(declare-fun b!283552 () Bool)

(declare-fun res!146469 () Bool)

(assert (=> b!283552 (=> (not res!146469) (not e!179896))))

(assert (=> b!283552 (= res!146469 (and (= (size!7067 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7067 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7067 a!3325))))))

(declare-fun b!283553 () Bool)

(assert (=> b!283553 (= e!179896 e!179897)))

(declare-fun res!146470 () Bool)

(assert (=> b!283553 (=> (not res!146470) (not e!179897))))

(declare-fun lt!140152 () SeekEntryResult!1873)

(assert (=> b!283553 (= res!146470 (or (= lt!140152 (MissingZero!1873 i!1267)) (= lt!140152 (MissingVacant!1873 i!1267))))))

(assert (=> b!283553 (= lt!140152 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!283554 () Bool)

(declare-fun res!146473 () Bool)

(assert (=> b!283554 (=> (not res!146473) (not e!179894))))

(assert (=> b!283554 (= res!146473 (validKeyInArray!0 (select (arr!6715 a!3325) startIndex!26)))))

(declare-fun b!283555 () Bool)

(declare-fun res!146467 () Bool)

(assert (=> b!283555 (=> (not res!146467) (not e!179896))))

(assert (=> b!283555 (= res!146467 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4520))))

(declare-fun res!146475 () Bool)

(assert (=> start!27394 (=> (not res!146475) (not e!179896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27394 (= res!146475 (validMask!0 mask!3868))))

(assert (=> start!27394 e!179896))

(declare-fun array_inv!4678 (array!14149) Bool)

(assert (=> start!27394 (array_inv!4678 a!3325)))

(assert (=> start!27394 true))

(declare-fun b!283556 () Bool)

(declare-fun res!146471 () Bool)

(assert (=> b!283556 (=> (not res!146471) (not e!179897))))

(assert (=> b!283556 (= res!146471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27394 res!146475) b!283552))

(assert (= (and b!283552 res!146469) b!283547))

(assert (= (and b!283547 res!146474) b!283555))

(assert (= (and b!283555 res!146467) b!283548))

(assert (= (and b!283548 res!146472) b!283553))

(assert (= (and b!283553 res!146470) b!283556))

(assert (= (and b!283556 res!146471) b!283551))

(assert (= (and b!283551 res!146468) b!283554))

(assert (= (and b!283554 res!146473) b!283550))

(assert (= (and b!283550 (not res!146466)) b!283549))

(declare-fun m!298465 () Bool)

(assert (=> start!27394 m!298465))

(declare-fun m!298467 () Bool)

(assert (=> start!27394 m!298467))

(declare-fun m!298469 () Bool)

(assert (=> b!283556 m!298469))

(declare-fun m!298471 () Bool)

(assert (=> b!283554 m!298471))

(assert (=> b!283554 m!298471))

(declare-fun m!298473 () Bool)

(assert (=> b!283554 m!298473))

(declare-fun m!298475 () Bool)

(assert (=> b!283547 m!298475))

(declare-fun m!298477 () Bool)

(assert (=> b!283549 m!298477))

(declare-fun m!298479 () Bool)

(assert (=> b!283551 m!298479))

(declare-fun m!298481 () Bool)

(assert (=> b!283555 m!298481))

(declare-fun m!298483 () Bool)

(assert (=> b!283548 m!298483))

(declare-fun m!298485 () Bool)

(assert (=> b!283553 m!298485))

(declare-fun m!298487 () Bool)

(assert (=> b!283550 m!298487))

(assert (=> b!283550 m!298479))

(declare-fun m!298489 () Bool)

(assert (=> b!283550 m!298489))

(assert (=> b!283550 m!298471))

(declare-fun m!298491 () Bool)

(assert (=> b!283550 m!298491))

(declare-fun m!298493 () Bool)

(assert (=> b!283550 m!298493))

(assert (=> b!283550 m!298487))

(declare-fun m!298495 () Bool)

(assert (=> b!283550 m!298495))

(assert (=> b!283550 m!298471))

(declare-fun m!298497 () Bool)

(assert (=> b!283550 m!298497))

(declare-fun m!298499 () Bool)

(assert (=> b!283550 m!298499))

(declare-fun m!298501 () Bool)

(assert (=> b!283550 m!298501))

(push 1)

(assert (not b!283550))

(assert (not start!27394))

(assert (not b!283548))

(assert (not b!283556))

(assert (not b!283547))

(assert (not b!283555))

(assert (not b!283553))

(assert (not b!283549))

(assert (not b!283554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65377 () Bool)

(assert (=> d!65377 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283547 d!65377))

(declare-fun d!65379 () Bool)

(assert (=> d!65379 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27394 d!65379))

(declare-fun d!65391 () Bool)

(assert (=> d!65391 (= (array_inv!4678 a!3325) (bvsge (size!7067 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27394 d!65391))

(declare-fun b!283618 () Bool)

(declare-fun e!179949 () Bool)

(declare-fun call!25501 () Bool)

(assert (=> b!283618 (= e!179949 call!25501)))

(declare-fun d!65393 () Bool)

(declare-fun res!146516 () Bool)

(declare-fun e!179950 () Bool)

(assert (=> d!65393 (=> res!146516 e!179950)))

(assert (=> d!65393 (= res!146516 (bvsge #b00000000000000000000000000000000 (size!7067 a!3325)))))

(assert (=> d!65393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179950)))

(declare-fun b!283619 () Bool)

(declare-fun e!179948 () Bool)

(assert (=> b!283619 (= e!179949 e!179948)))

(declare-fun lt!140176 () (_ BitVec 64))

(assert (=> b!283619 (= lt!140176 (select (arr!6715 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140175 () Unit!9030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14149 (_ BitVec 64) (_ BitVec 32)) Unit!9030)

(assert (=> b!283619 (= lt!140175 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140176 #b00000000000000000000000000000000))))

(assert (=> b!283619 (arrayContainsKey!0 a!3325 lt!140176 #b00000000000000000000000000000000)))

(declare-fun lt!140174 () Unit!9030)

(assert (=> b!283619 (= lt!140174 lt!140175)))

(declare-fun res!146515 () Bool)

(assert (=> b!283619 (= res!146515 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1873 #b00000000000000000000000000000000)))))

(assert (=> b!283619 (=> (not res!146515) (not e!179948))))

(declare-fun b!283620 () Bool)

(assert (=> b!283620 (= e!179948 call!25501)))

(declare-fun b!283621 () Bool)

(assert (=> b!283621 (= e!179950 e!179949)))

(declare-fun c!46104 () Bool)

(assert (=> b!283621 (= c!46104 (validKeyInArray!0 (select (arr!6715 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25498 () Bool)

(assert (=> bm!25498 (= call!25501 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65393 (not res!146516)) b!283621))

(assert (= (and b!283621 c!46104) b!283619))

(assert (= (and b!283621 (not c!46104)) b!283618))

(assert (= (and b!283619 res!146515) b!283620))

(assert (= (or b!283620 b!283618) bm!25498))

(declare-fun m!298537 () Bool)

(assert (=> b!283619 m!298537))

(declare-fun m!298539 () Bool)

(assert (=> b!283619 m!298539))

(declare-fun m!298541 () Bool)

(assert (=> b!283619 m!298541))

(assert (=> b!283619 m!298537))

(declare-fun m!298543 () Bool)

(assert (=> b!283619 m!298543))

(assert (=> b!283621 m!298537))

(assert (=> b!283621 m!298537))

(declare-fun m!298545 () Bool)

(assert (=> b!283621 m!298545))

(declare-fun m!298547 () Bool)

(assert (=> bm!25498 m!298547))

(assert (=> b!283556 d!65393))

(declare-fun d!65405 () Bool)

(declare-fun e!179975 () Bool)

(assert (=> d!65405 e!179975))

(declare-fun res!146528 () Bool)

(assert (=> d!65405 (=> (not res!146528) (not e!179975))))

(assert (=> d!65405 (= res!146528 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7067 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7067 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7067 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7067 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7067 a!3325))))))

(declare-fun lt!140197 () Unit!9030)

(declare-fun choose!83 (array!14149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9030)

(assert (=> d!65405 (= lt!140197 (choose!83 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> d!65405 (validMask!0 mask!3868)))

(assert (=> d!65405 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868) lt!140197)))

(declare-fun b!283659 () Bool)

(assert (=> b!283659 (= e!179975 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)) mask!3868)))))

(assert (= (and d!65405 res!146528) b!283659))

(declare-fun m!298577 () Bool)

(assert (=> d!65405 m!298577))

(assert (=> d!65405 m!298465))

(assert (=> b!283659 m!298471))

(assert (=> b!283659 m!298487))

(assert (=> b!283659 m!298479))

(assert (=> b!283659 m!298471))

(assert (=> b!283659 m!298497))

(assert (=> b!283659 m!298487))

(declare-fun m!298579 () Bool)

(assert (=> b!283659 m!298579))

(assert (=> b!283550 d!65405))

(declare-fun b!283713 () Bool)

(declare-fun e!180008 () SeekEntryResult!1873)

(declare-fun lt!140225 () SeekEntryResult!1873)

(assert (=> b!283713 (= e!180008 (MissingZero!1873 (index!9664 lt!140225)))))

(declare-fun b!283714 () Bool)

(declare-fun e!180007 () SeekEntryResult!1873)

(declare-fun e!180009 () SeekEntryResult!1873)

(assert (=> b!283714 (= e!180007 e!180009)))

(declare-fun lt!140226 () (_ BitVec 64))

(assert (=> b!283714 (= lt!140226 (select (arr!6715 a!3325) (index!9664 lt!140225)))))

(declare-fun c!46141 () Bool)

(assert (=> b!283714 (= c!46141 (= lt!140226 (select (arr!6715 a!3325) startIndex!26)))))

(declare-fun d!65413 () Bool)

(declare-fun lt!140227 () SeekEntryResult!1873)

(assert (=> d!65413 (and (or (is-Undefined!1873 lt!140227) (not (is-Found!1873 lt!140227)) (and (bvsge (index!9663 lt!140227) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140227) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140227) (is-Found!1873 lt!140227) (not (is-MissingZero!1873 lt!140227)) (and (bvsge (index!9662 lt!140227) #b00000000000000000000000000000000) (bvslt (index!9662 lt!140227) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140227) (is-Found!1873 lt!140227) (is-MissingZero!1873 lt!140227) (not (is-MissingVacant!1873 lt!140227)) (and (bvsge (index!9665 lt!140227) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140227) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140227) (ite (is-Found!1873 lt!140227) (= (select (arr!6715 a!3325) (index!9663 lt!140227)) (select (arr!6715 a!3325) startIndex!26)) (ite (is-MissingZero!1873 lt!140227) (= (select (arr!6715 a!3325) (index!9662 lt!140227)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1873 lt!140227) (= (select (arr!6715 a!3325) (index!9665 lt!140227)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65413 (= lt!140227 e!180007)))

(declare-fun c!46142 () Bool)

(assert (=> d!65413 (= c!46142 (and (is-Intermediate!1873 lt!140225) (undefined!2685 lt!140225)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14149 (_ BitVec 32)) SeekEntryResult!1873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65413 (= lt!140225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6715 a!3325) startIndex!26) mask!3868) (select (arr!6715 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65413 (validMask!0 mask!3868)))

(assert (=> d!65413 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) startIndex!26) a!3325 mask!3868) lt!140227)))

(declare-fun b!283715 () Bool)

(assert (=> b!283715 (= e!180009 (Found!1873 (index!9664 lt!140225)))))

(declare-fun b!283716 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14149 (_ BitVec 32)) SeekEntryResult!1873)

(assert (=> b!283716 (= e!180008 (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140225) (index!9664 lt!140225) (index!9664 lt!140225) (select (arr!6715 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283717 () Bool)

(assert (=> b!283717 (= e!180007 Undefined!1873)))

(declare-fun b!283718 () Bool)

(declare-fun c!46140 () Bool)

(assert (=> b!283718 (= c!46140 (= lt!140226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283718 (= e!180009 e!180008)))

(assert (= (and d!65413 c!46142) b!283717))

(assert (= (and d!65413 (not c!46142)) b!283714))

(assert (= (and b!283714 c!46141) b!283715))

(assert (= (and b!283714 (not c!46141)) b!283718))

(assert (= (and b!283718 c!46140) b!283713))

(assert (= (and b!283718 (not c!46140)) b!283716))

(declare-fun m!298639 () Bool)

(assert (=> b!283714 m!298639))

(assert (=> d!65413 m!298471))

(declare-fun m!298641 () Bool)

(assert (=> d!65413 m!298641))

(assert (=> d!65413 m!298465))

(declare-fun m!298643 () Bool)

(assert (=> d!65413 m!298643))

(declare-fun m!298645 () Bool)

(assert (=> d!65413 m!298645))

(assert (=> d!65413 m!298641))

(assert (=> d!65413 m!298471))

(declare-fun m!298647 () Bool)

(assert (=> d!65413 m!298647))

(declare-fun m!298649 () Bool)

(assert (=> d!65413 m!298649))

(assert (=> b!283716 m!298471))

(declare-fun m!298651 () Bool)

(assert (=> b!283716 m!298651))

(assert (=> b!283550 d!65413))

(declare-fun b!283733 () Bool)

(declare-fun e!180022 () Bool)

(declare-fun contains!1995 (List!4523 (_ BitVec 64)) Bool)

(assert (=> b!283733 (= e!180022 (contains!1995 Nil!4520 (select (arr!6715 lt!140153) #b00000000000000000000000000000000)))))

(declare-fun bm!25507 () Bool)

(declare-fun call!25510 () Bool)

(declare-fun c!46146 () Bool)

(assert (=> bm!25507 (= call!25510 (arrayNoDuplicates!0 lt!140153 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46146 (Cons!4519 (select (arr!6715 lt!140153) #b00000000000000000000000000000000) Nil!4520) Nil!4520)))))

(declare-fun d!65427 () Bool)

(declare-fun res!146546 () Bool)

(declare-fun e!180023 () Bool)

(assert (=> d!65427 (=> res!146546 e!180023)))

(assert (=> d!65427 (= res!146546 (bvsge #b00000000000000000000000000000000 (size!7067 lt!140153)))))

(assert (=> d!65427 (= (arrayNoDuplicates!0 lt!140153 #b00000000000000000000000000000000 Nil!4520) e!180023)))

(declare-fun b!283734 () Bool)

(declare-fun e!180021 () Bool)

(declare-fun e!180024 () Bool)

(assert (=> b!283734 (= e!180021 e!180024)))

(assert (=> b!283734 (= c!46146 (validKeyInArray!0 (select (arr!6715 lt!140153) #b00000000000000000000000000000000)))))

(declare-fun b!283735 () Bool)

(assert (=> b!283735 (= e!180024 call!25510)))

(declare-fun b!283736 () Bool)

(assert (=> b!283736 (= e!180023 e!180021)))

(declare-fun res!146548 () Bool)

(assert (=> b!283736 (=> (not res!146548) (not e!180021))))

(assert (=> b!283736 (= res!146548 (not e!180022))))

(declare-fun res!146547 () Bool)

(assert (=> b!283736 (=> (not res!146547) (not e!180022))))

(assert (=> b!283736 (= res!146547 (validKeyInArray!0 (select (arr!6715 lt!140153) #b00000000000000000000000000000000)))))

(declare-fun b!283737 () Bool)

(assert (=> b!283737 (= e!180024 call!25510)))

(assert (= (and d!65427 (not res!146546)) b!283736))

(assert (= (and b!283736 res!146547) b!283733))

(assert (= (and b!283736 res!146548) b!283734))

(assert (= (and b!283734 c!46146) b!283735))

(assert (= (and b!283734 (not c!46146)) b!283737))

(assert (= (or b!283735 b!283737) bm!25507))

(declare-fun m!298661 () Bool)

(assert (=> b!283733 m!298661))

(assert (=> b!283733 m!298661))

(declare-fun m!298663 () Bool)

(assert (=> b!283733 m!298663))

(assert (=> bm!25507 m!298661))

(declare-fun m!298665 () Bool)

(assert (=> bm!25507 m!298665))

(assert (=> b!283734 m!298661))

(assert (=> b!283734 m!298661))

(declare-fun m!298667 () Bool)

(assert (=> b!283734 m!298667))

(assert (=> b!283736 m!298661))

(assert (=> b!283736 m!298661))

(assert (=> b!283736 m!298667))

(assert (=> b!283550 d!65427))

(declare-fun d!65431 () Bool)

(declare-fun e!180033 () Bool)

(assert (=> d!65431 e!180033))

(declare-fun res!146554 () Bool)

(assert (=> d!65431 (=> (not res!146554) (not e!180033))))

(assert (=> d!65431 (= res!146554 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7067 a!3325))))))

(declare-fun lt!140242 () Unit!9030)

(declare-fun choose!41 (array!14149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4523) Unit!9030)

(assert (=> d!65431 (= lt!140242 (choose!41 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4520))))

(assert (=> d!65431 (bvslt (size!7067 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65431 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4520) lt!140242)))

(declare-fun b!283749 () Bool)

(assert (=> b!283749 (= e!180033 (arrayNoDuplicates!0 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)) #b00000000000000000000000000000000 Nil!4520))))

(assert (= (and d!65431 res!146554) b!283749))

(declare-fun m!298687 () Bool)

(assert (=> d!65431 m!298687))

(assert (=> b!283749 m!298479))

(declare-fun m!298689 () Bool)

(assert (=> b!283749 m!298689))

(assert (=> b!283550 d!65431))

(declare-fun d!65437 () Bool)

(assert (=> d!65437 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!140256 () Unit!9030)

(declare-fun choose!38 (array!14149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9030)

(assert (=> d!65437 (= lt!140256 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65437 (validMask!0 mask!3868)))

(assert (=> d!65437 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!140256)))

(declare-fun bs!10073 () Bool)

(assert (= bs!10073 d!65437))

(assert (=> bs!10073 m!298489))

(declare-fun m!298721 () Bool)

(assert (=> bs!10073 m!298721))

(assert (=> bs!10073 m!298465))

(assert (=> b!283550 d!65437))

(declare-fun b!283767 () Bool)

(declare-fun e!180047 () Bool)

(declare-fun call!25513 () Bool)

(assert (=> b!283767 (= e!180047 call!25513)))

(declare-fun d!65447 () Bool)

(declare-fun res!146563 () Bool)

(declare-fun e!180048 () Bool)

(assert (=> d!65447 (=> res!146563 e!180048)))

(assert (=> d!65447 (= res!146563 (bvsge startIndex!26 (size!7067 a!3325)))))

(assert (=> d!65447 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!180048)))

(declare-fun b!283768 () Bool)

(declare-fun e!180046 () Bool)

(assert (=> b!283768 (= e!180047 e!180046)))

(declare-fun lt!140259 () (_ BitVec 64))

(assert (=> b!283768 (= lt!140259 (select (arr!6715 a!3325) startIndex!26))))

(declare-fun lt!140258 () Unit!9030)

(assert (=> b!283768 (= lt!140258 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140259 startIndex!26))))

(assert (=> b!283768 (arrayContainsKey!0 a!3325 lt!140259 #b00000000000000000000000000000000)))

(declare-fun lt!140257 () Unit!9030)

(assert (=> b!283768 (= lt!140257 lt!140258)))

(declare-fun res!146562 () Bool)

(assert (=> b!283768 (= res!146562 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) startIndex!26) a!3325 mask!3868) (Found!1873 startIndex!26)))))

(assert (=> b!283768 (=> (not res!146562) (not e!180046))))

(declare-fun b!283769 () Bool)

(assert (=> b!283769 (= e!180046 call!25513)))

(declare-fun b!283770 () Bool)

(assert (=> b!283770 (= e!180048 e!180047)))

(declare-fun c!46155 () Bool)

(assert (=> b!283770 (= c!46155 (validKeyInArray!0 (select (arr!6715 a!3325) startIndex!26)))))

(declare-fun bm!25510 () Bool)

(assert (=> bm!25510 (= call!25513 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65447 (not res!146563)) b!283770))

(assert (= (and b!283770 c!46155) b!283768))

(assert (= (and b!283770 (not c!46155)) b!283767))

(assert (= (and b!283768 res!146562) b!283769))

(assert (= (or b!283769 b!283767) bm!25510))

(assert (=> b!283768 m!298471))

(declare-fun m!298723 () Bool)

(assert (=> b!283768 m!298723))

(declare-fun m!298725 () Bool)

(assert (=> b!283768 m!298725))

(assert (=> b!283768 m!298471))

(assert (=> b!283768 m!298497))

(assert (=> b!283770 m!298471))

(assert (=> b!283770 m!298471))

(assert (=> b!283770 m!298473))

(declare-fun m!298729 () Bool)

(assert (=> bm!25510 m!298729))

(assert (=> b!283550 d!65447))

(declare-fun b!283776 () Bool)

(declare-fun e!180054 () SeekEntryResult!1873)

(declare-fun lt!140264 () SeekEntryResult!1873)

(assert (=> b!283776 (= e!180054 (MissingZero!1873 (index!9664 lt!140264)))))

(declare-fun b!283777 () Bool)

(declare-fun e!180053 () SeekEntryResult!1873)

(declare-fun e!180055 () SeekEntryResult!1873)

(assert (=> b!283777 (= e!180053 e!180055)))

(declare-fun lt!140265 () (_ BitVec 64))

(assert (=> b!283777 (= lt!140265 (select (arr!6715 lt!140153) (index!9664 lt!140264)))))

(declare-fun c!46158 () Bool)

(assert (=> b!283777 (= c!46158 (= lt!140265 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26)))))

(declare-fun d!65449 () Bool)

(declare-fun lt!140266 () SeekEntryResult!1873)

(assert (=> d!65449 (and (or (is-Undefined!1873 lt!140266) (not (is-Found!1873 lt!140266)) (and (bvsge (index!9663 lt!140266) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140266) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140266) (is-Found!1873 lt!140266) (not (is-MissingZero!1873 lt!140266)) (and (bvsge (index!9662 lt!140266) #b00000000000000000000000000000000) (bvslt (index!9662 lt!140266) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140266) (is-Found!1873 lt!140266) (is-MissingZero!1873 lt!140266) (not (is-MissingVacant!1873 lt!140266)) (and (bvsge (index!9665 lt!140266) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140266) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140266) (ite (is-Found!1873 lt!140266) (= (select (arr!6715 lt!140153) (index!9663 lt!140266)) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26)) (ite (is-MissingZero!1873 lt!140266) (= (select (arr!6715 lt!140153) (index!9662 lt!140266)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1873 lt!140266) (= (select (arr!6715 lt!140153) (index!9665 lt!140266)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65449 (= lt!140266 e!180053)))

(declare-fun c!46159 () Bool)

(assert (=> d!65449 (= c!46159 (and (is-Intermediate!1873 lt!140264) (undefined!2685 lt!140264)))))

(assert (=> d!65449 (= lt!140264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) mask!3868) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) lt!140153 mask!3868))))

(assert (=> d!65449 (validMask!0 mask!3868)))

(assert (=> d!65449 (= (seekEntryOrOpen!0 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) lt!140153 mask!3868) lt!140266)))

(declare-fun b!283778 () Bool)

(assert (=> b!283778 (= e!180055 (Found!1873 (index!9664 lt!140264)))))

(declare-fun b!283779 () Bool)

(assert (=> b!283779 (= e!180054 (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140264) (index!9664 lt!140264) (index!9664 lt!140264) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) lt!140153 mask!3868))))

(declare-fun b!283780 () Bool)

(assert (=> b!283780 (= e!180053 Undefined!1873)))

(declare-fun b!283781 () Bool)

(declare-fun c!46157 () Bool)

(assert (=> b!283781 (= c!46157 (= lt!140265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283781 (= e!180055 e!180054)))

(assert (= (and d!65449 c!46159) b!283780))

(assert (= (and d!65449 (not c!46159)) b!283777))

(assert (= (and b!283777 c!46158) b!283778))

(assert (= (and b!283777 (not c!46158)) b!283781))

(assert (= (and b!283781 c!46157) b!283776))

(assert (= (and b!283781 (not c!46157)) b!283779))

(declare-fun m!298745 () Bool)

(assert (=> b!283777 m!298745))

(assert (=> d!65449 m!298487))

(declare-fun m!298747 () Bool)

(assert (=> d!65449 m!298747))

(assert (=> d!65449 m!298465))

(declare-fun m!298749 () Bool)

(assert (=> d!65449 m!298749))

(declare-fun m!298751 () Bool)

(assert (=> d!65449 m!298751))

(assert (=> d!65449 m!298747))

(assert (=> d!65449 m!298487))

(declare-fun m!298753 () Bool)

(assert (=> d!65449 m!298753))

(declare-fun m!298755 () Bool)

(assert (=> d!65449 m!298755))

(assert (=> b!283779 m!298487))

(declare-fun m!298757 () Bool)

(assert (=> b!283779 m!298757))

(assert (=> b!283550 d!65449))

(declare-fun b!283782 () Bool)

(declare-fun e!180057 () Bool)

(assert (=> b!283782 (= e!180057 (contains!1995 Nil!4520 (select (arr!6715 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25512 () Bool)

(declare-fun call!25515 () Bool)

(declare-fun c!46160 () Bool)

(assert (=> bm!25512 (= call!25515 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46160 (Cons!4519 (select (arr!6715 a!3325) #b00000000000000000000000000000000) Nil!4520) Nil!4520)))))

(declare-fun d!65453 () Bool)

(declare-fun res!146567 () Bool)

(declare-fun e!180058 () Bool)

(assert (=> d!65453 (=> res!146567 e!180058)))

(assert (=> d!65453 (= res!146567 (bvsge #b00000000000000000000000000000000 (size!7067 a!3325)))))

(assert (=> d!65453 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4520) e!180058)))

(declare-fun b!283783 () Bool)

(declare-fun e!180056 () Bool)

(declare-fun e!180059 () Bool)

(assert (=> b!283783 (= e!180056 e!180059)))

(assert (=> b!283783 (= c!46160 (validKeyInArray!0 (select (arr!6715 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283784 () Bool)

(assert (=> b!283784 (= e!180059 call!25515)))

(declare-fun b!283785 () Bool)

(assert (=> b!283785 (= e!180058 e!180056)))

(declare-fun res!146569 () Bool)

(assert (=> b!283785 (=> (not res!146569) (not e!180056))))

(assert (=> b!283785 (= res!146569 (not e!180057))))

(declare-fun res!146568 () Bool)

(assert (=> b!283785 (=> (not res!146568) (not e!180057))))

(assert (=> b!283785 (= res!146568 (validKeyInArray!0 (select (arr!6715 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283786 () Bool)

(assert (=> b!283786 (= e!180059 call!25515)))

(assert (= (and d!65453 (not res!146567)) b!283785))

(assert (= (and b!283785 res!146568) b!283782))

(assert (= (and b!283785 res!146569) b!283783))

(assert (= (and b!283783 c!46160) b!283784))

(assert (= (and b!283783 (not c!46160)) b!283786))

(assert (= (or b!283784 b!283786) bm!25512))

(assert (=> b!283782 m!298537))

(assert (=> b!283782 m!298537))

(declare-fun m!298759 () Bool)

(assert (=> b!283782 m!298759))

(assert (=> bm!25512 m!298537))

(declare-fun m!298761 () Bool)

(assert (=> bm!25512 m!298761))

(assert (=> b!283783 m!298537))

(assert (=> b!283783 m!298537))

(assert (=> b!283783 m!298545))

(assert (=> b!283785 m!298537))

(assert (=> b!283785 m!298537))

(assert (=> b!283785 m!298545))

(assert (=> b!283555 d!65453))

(declare-fun b!283787 () Bool)

(declare-fun e!180061 () Bool)

(declare-fun call!25516 () Bool)

(assert (=> b!283787 (= e!180061 call!25516)))

(declare-fun d!65455 () Bool)

(declare-fun res!146571 () Bool)

(declare-fun e!180062 () Bool)

(assert (=> d!65455 (=> res!146571 e!180062)))

(assert (=> d!65455 (= res!146571 (bvsge startIndex!26 (size!7067 lt!140153)))))

(assert (=> d!65455 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140153 mask!3868) e!180062)))

(declare-fun b!283788 () Bool)

(declare-fun e!180060 () Bool)

(assert (=> b!283788 (= e!180061 e!180060)))

(declare-fun lt!140269 () (_ BitVec 64))

(assert (=> b!283788 (= lt!140269 (select (arr!6715 lt!140153) startIndex!26))))

(declare-fun lt!140268 () Unit!9030)

(assert (=> b!283788 (= lt!140268 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140153 lt!140269 startIndex!26))))

(assert (=> b!283788 (arrayContainsKey!0 lt!140153 lt!140269 #b00000000000000000000000000000000)))

(declare-fun lt!140267 () Unit!9030)

(assert (=> b!283788 (= lt!140267 lt!140268)))

(declare-fun res!146570 () Bool)

(assert (=> b!283788 (= res!146570 (= (seekEntryOrOpen!0 (select (arr!6715 lt!140153) startIndex!26) lt!140153 mask!3868) (Found!1873 startIndex!26)))))

(assert (=> b!283788 (=> (not res!146570) (not e!180060))))

(declare-fun b!283789 () Bool)

(assert (=> b!283789 (= e!180060 call!25516)))

(declare-fun b!283790 () Bool)

(assert (=> b!283790 (= e!180062 e!180061)))

(declare-fun c!46161 () Bool)

(assert (=> b!283790 (= c!46161 (validKeyInArray!0 (select (arr!6715 lt!140153) startIndex!26)))))

(declare-fun bm!25513 () Bool)

(assert (=> bm!25513 (= call!25516 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140153 mask!3868))))

(assert (= (and d!65455 (not res!146571)) b!283790))

(assert (= (and b!283790 c!46161) b!283788))

(assert (= (and b!283790 (not c!46161)) b!283787))

(assert (= (and b!283788 res!146570) b!283789))

(assert (= (or b!283789 b!283787) bm!25513))

(declare-fun m!298763 () Bool)

(assert (=> b!283788 m!298763))

(declare-fun m!298765 () Bool)

(assert (=> b!283788 m!298765))

(declare-fun m!298767 () Bool)

(assert (=> b!283788 m!298767))

(assert (=> b!283788 m!298763))

(declare-fun m!298769 () Bool)

(assert (=> b!283788 m!298769))

(assert (=> b!283790 m!298763))

(assert (=> b!283790 m!298763))

(declare-fun m!298771 () Bool)

(assert (=> b!283790 m!298771))

(declare-fun m!298773 () Bool)

(assert (=> bm!25513 m!298773))

(assert (=> b!283549 d!65455))

(declare-fun d!65457 () Bool)

(assert (=> d!65457 (= (validKeyInArray!0 (select (arr!6715 a!3325) startIndex!26)) (and (not (= (select (arr!6715 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6715 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283554 d!65457))

(declare-fun d!65459 () Bool)

(declare-fun res!146576 () Bool)

(declare-fun e!180067 () Bool)

(assert (=> d!65459 (=> res!146576 e!180067)))

(assert (=> d!65459 (= res!146576 (= (select (arr!6715 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65459 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!180067)))

(declare-fun b!283795 () Bool)

(declare-fun e!180068 () Bool)

(assert (=> b!283795 (= e!180067 e!180068)))

(declare-fun res!146577 () Bool)

(assert (=> b!283795 (=> (not res!146577) (not e!180068))))

(assert (=> b!283795 (= res!146577 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7067 a!3325)))))

(declare-fun b!283796 () Bool)

(assert (=> b!283796 (= e!180068 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65459 (not res!146576)) b!283795))

(assert (= (and b!283795 res!146577) b!283796))

(assert (=> d!65459 m!298537))

(declare-fun m!298775 () Bool)

(assert (=> b!283796 m!298775))

(assert (=> b!283548 d!65459))

(declare-fun b!283797 () Bool)

(declare-fun e!180070 () SeekEntryResult!1873)

(declare-fun lt!140270 () SeekEntryResult!1873)

(assert (=> b!283797 (= e!180070 (MissingZero!1873 (index!9664 lt!140270)))))

(declare-fun b!283798 () Bool)

(declare-fun e!180069 () SeekEntryResult!1873)

(declare-fun e!180071 () SeekEntryResult!1873)

(assert (=> b!283798 (= e!180069 e!180071)))

(declare-fun lt!140271 () (_ BitVec 64))

(assert (=> b!283798 (= lt!140271 (select (arr!6715 a!3325) (index!9664 lt!140270)))))

(declare-fun c!46163 () Bool)

(assert (=> b!283798 (= c!46163 (= lt!140271 k!2581))))

(declare-fun d!65461 () Bool)

(declare-fun lt!140272 () SeekEntryResult!1873)

(assert (=> d!65461 (and (or (is-Undefined!1873 lt!140272) (not (is-Found!1873 lt!140272)) (and (bvsge (index!9663 lt!140272) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140272) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140272) (is-Found!1873 lt!140272) (not (is-MissingZero!1873 lt!140272)) (and (bvsge (index!9662 lt!140272) #b00000000000000000000000000000000) (bvslt (index!9662 lt!140272) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140272) (is-Found!1873 lt!140272) (is-MissingZero!1873 lt!140272) (not (is-MissingVacant!1873 lt!140272)) (and (bvsge (index!9665 lt!140272) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140272) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140272) (ite (is-Found!1873 lt!140272) (= (select (arr!6715 a!3325) (index!9663 lt!140272)) k!2581) (ite (is-MissingZero!1873 lt!140272) (= (select (arr!6715 a!3325) (index!9662 lt!140272)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1873 lt!140272) (= (select (arr!6715 a!3325) (index!9665 lt!140272)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65461 (= lt!140272 e!180069)))

(declare-fun c!46164 () Bool)

(assert (=> d!65461 (= c!46164 (and (is-Intermediate!1873 lt!140270) (undefined!2685 lt!140270)))))

(assert (=> d!65461 (= lt!140270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65461 (validMask!0 mask!3868)))

(assert (=> d!65461 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!140272)))

(declare-fun b!283799 () Bool)

(assert (=> b!283799 (= e!180071 (Found!1873 (index!9664 lt!140270)))))

(declare-fun b!283800 () Bool)

(assert (=> b!283800 (= e!180070 (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140270) (index!9664 lt!140270) (index!9664 lt!140270) k!2581 a!3325 mask!3868))))

(declare-fun b!283801 () Bool)

(assert (=> b!283801 (= e!180069 Undefined!1873)))

(declare-fun b!283802 () Bool)

(declare-fun c!46162 () Bool)

(assert (=> b!283802 (= c!46162 (= lt!140271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283802 (= e!180071 e!180070)))

(assert (= (and d!65461 c!46164) b!283801))

(assert (= (and d!65461 (not c!46164)) b!283798))

(assert (= (and b!283798 c!46163) b!283799))

(assert (= (and b!283798 (not c!46163)) b!283802))

(assert (= (and b!283802 c!46162) b!283797))

(assert (= (and b!283802 (not c!46162)) b!283800))

(declare-fun m!298777 () Bool)

(assert (=> b!283798 m!298777))

(declare-fun m!298779 () Bool)

(assert (=> d!65461 m!298779))

(assert (=> d!65461 m!298465))

(declare-fun m!298781 () Bool)

(assert (=> d!65461 m!298781))

(declare-fun m!298783 () Bool)

(assert (=> d!65461 m!298783))

(assert (=> d!65461 m!298779))

(declare-fun m!298785 () Bool)

(assert (=> d!65461 m!298785))

(declare-fun m!298787 () Bool)

(assert (=> d!65461 m!298787))

(declare-fun m!298789 () Bool)

(assert (=> b!283800 m!298789))

(assert (=> b!283553 d!65461))

(push 1)

(assert (not b!283659))

(assert (not bm!25512))

(assert (not b!283779))

(assert (not b!283736))

(assert (not d!65405))

(assert (not b!283770))

(assert (not b!283734))

(assert (not b!283768))

(assert (not b!283783))

(assert (not d!65461))

(assert (not b!283785))

(assert (not d!65413))

(assert (not b!283749))

(assert (not bm!25510))

(assert (not bm!25498))

(assert (not b!283733))

(assert (not bm!25507))

(assert (not d!65431))

(assert (not b!283716))

(assert (not b!283788))

(assert (not b!283800))

(assert (not bm!25513))

(assert (not d!65449))

(assert (not d!65437))

(assert (not b!283796))

(assert (not b!283619))

(assert (not b!283621))

(assert (not b!283790))

(assert (not b!283782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65595 () Bool)

(assert (=> d!65595 (arrayContainsKey!0 a!3325 lt!140176 #b00000000000000000000000000000000)))

(declare-fun lt!140389 () Unit!9030)

(declare-fun choose!13 (array!14149 (_ BitVec 64) (_ BitVec 32)) Unit!9030)

(assert (=> d!65595 (= lt!140389 (choose!13 a!3325 lt!140176 #b00000000000000000000000000000000))))

(assert (=> d!65595 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!65595 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140176 #b00000000000000000000000000000000) lt!140389)))

(declare-fun bs!10086 () Bool)

(assert (= bs!10086 d!65595))

(assert (=> bs!10086 m!298541))

(declare-fun m!299127 () Bool)

(assert (=> bs!10086 m!299127))

(assert (=> b!283619 d!65595))

(declare-fun d!65597 () Bool)

(declare-fun res!146672 () Bool)

(declare-fun e!180244 () Bool)

(assert (=> d!65597 (=> res!146672 e!180244)))

(assert (=> d!65597 (= res!146672 (= (select (arr!6715 a!3325) #b00000000000000000000000000000000) lt!140176))))

(assert (=> d!65597 (= (arrayContainsKey!0 a!3325 lt!140176 #b00000000000000000000000000000000) e!180244)))

(declare-fun b!284075 () Bool)

(declare-fun e!180245 () Bool)

(assert (=> b!284075 (= e!180244 e!180245)))

(declare-fun res!146673 () Bool)

(assert (=> b!284075 (=> (not res!146673) (not e!180245))))

(assert (=> b!284075 (= res!146673 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7067 a!3325)))))

(declare-fun b!284076 () Bool)

(assert (=> b!284076 (= e!180245 (arrayContainsKey!0 a!3325 lt!140176 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65597 (not res!146672)) b!284075))

(assert (= (and b!284075 res!146673) b!284076))

(assert (=> d!65597 m!298537))

(declare-fun m!299129 () Bool)

(assert (=> b!284076 m!299129))

(assert (=> b!283619 d!65597))

(declare-fun b!284077 () Bool)

(declare-fun e!180247 () SeekEntryResult!1873)

(declare-fun lt!140390 () SeekEntryResult!1873)

(assert (=> b!284077 (= e!180247 (MissingZero!1873 (index!9664 lt!140390)))))

(declare-fun b!284078 () Bool)

(declare-fun e!180246 () SeekEntryResult!1873)

(declare-fun e!180248 () SeekEntryResult!1873)

(assert (=> b!284078 (= e!180246 e!180248)))

(declare-fun lt!140391 () (_ BitVec 64))

(assert (=> b!284078 (= lt!140391 (select (arr!6715 a!3325) (index!9664 lt!140390)))))

(declare-fun c!46256 () Bool)

(assert (=> b!284078 (= c!46256 (= lt!140391 (select (arr!6715 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65599 () Bool)

(declare-fun lt!140392 () SeekEntryResult!1873)

(assert (=> d!65599 (and (or (is-Undefined!1873 lt!140392) (not (is-Found!1873 lt!140392)) (and (bvsge (index!9663 lt!140392) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140392) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140392) (is-Found!1873 lt!140392) (not (is-MissingZero!1873 lt!140392)) (and (bvsge (index!9662 lt!140392) #b00000000000000000000000000000000) (bvslt (index!9662 lt!140392) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140392) (is-Found!1873 lt!140392) (is-MissingZero!1873 lt!140392) (not (is-MissingVacant!1873 lt!140392)) (and (bvsge (index!9665 lt!140392) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140392) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140392) (ite (is-Found!1873 lt!140392) (= (select (arr!6715 a!3325) (index!9663 lt!140392)) (select (arr!6715 a!3325) #b00000000000000000000000000000000)) (ite (is-MissingZero!1873 lt!140392) (= (select (arr!6715 a!3325) (index!9662 lt!140392)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1873 lt!140392) (= (select (arr!6715 a!3325) (index!9665 lt!140392)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65599 (= lt!140392 e!180246)))

(declare-fun c!46257 () Bool)

(assert (=> d!65599 (= c!46257 (and (is-Intermediate!1873 lt!140390) (undefined!2685 lt!140390)))))

(assert (=> d!65599 (= lt!140390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6715 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6715 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!65599 (validMask!0 mask!3868)))

(assert (=> d!65599 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!140392)))

(declare-fun b!284079 () Bool)

(assert (=> b!284079 (= e!180248 (Found!1873 (index!9664 lt!140390)))))

(declare-fun b!284080 () Bool)

(assert (=> b!284080 (= e!180247 (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140390) (index!9664 lt!140390) (index!9664 lt!140390) (select (arr!6715 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun b!284081 () Bool)

(assert (=> b!284081 (= e!180246 Undefined!1873)))

(declare-fun b!284082 () Bool)

(declare-fun c!46255 () Bool)

(assert (=> b!284082 (= c!46255 (= lt!140391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284082 (= e!180248 e!180247)))

(assert (= (and d!65599 c!46257) b!284081))

(assert (= (and d!65599 (not c!46257)) b!284078))

(assert (= (and b!284078 c!46256) b!284079))

(assert (= (and b!284078 (not c!46256)) b!284082))

(assert (= (and b!284082 c!46255) b!284077))

(assert (= (and b!284082 (not c!46255)) b!284080))

(declare-fun m!299131 () Bool)

(assert (=> b!284078 m!299131))

(assert (=> d!65599 m!298537))

(declare-fun m!299133 () Bool)

(assert (=> d!65599 m!299133))

(assert (=> d!65599 m!298465))

(declare-fun m!299135 () Bool)

(assert (=> d!65599 m!299135))

(declare-fun m!299137 () Bool)

(assert (=> d!65599 m!299137))

(assert (=> d!65599 m!299133))

(assert (=> d!65599 m!298537))

(declare-fun m!299139 () Bool)

(assert (=> d!65599 m!299139))

(declare-fun m!299141 () Bool)

(assert (=> d!65599 m!299141))

(assert (=> b!284080 m!298537))

(declare-fun m!299143 () Bool)

(assert (=> b!284080 m!299143))

(assert (=> b!283619 d!65599))

(declare-fun d!65601 () Bool)

(declare-fun lt!140395 () Bool)

(declare-fun content!193 (List!4523) (Set (_ BitVec 64)))

(assert (=> d!65601 (= lt!140395 (member (select (arr!6715 a!3325) #b00000000000000000000000000000000) (content!193 Nil!4520)))))

(declare-fun e!180253 () Bool)

(assert (=> d!65601 (= lt!140395 e!180253)))

(declare-fun res!146679 () Bool)

(assert (=> d!65601 (=> (not res!146679) (not e!180253))))

(assert (=> d!65601 (= res!146679 (is-Cons!4519 Nil!4520))))

(assert (=> d!65601 (= (contains!1995 Nil!4520 (select (arr!6715 a!3325) #b00000000000000000000000000000000)) lt!140395)))

(declare-fun b!284087 () Bool)

(declare-fun e!180254 () Bool)

(assert (=> b!284087 (= e!180253 e!180254)))

(declare-fun res!146678 () Bool)

(assert (=> b!284087 (=> res!146678 e!180254)))

(assert (=> b!284087 (= res!146678 (= (h!5189 Nil!4520) (select (arr!6715 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!284088 () Bool)

(assert (=> b!284088 (= e!180254 (contains!1995 (t!9605 Nil!4520) (select (arr!6715 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65601 res!146679) b!284087))

(assert (= (and b!284087 (not res!146678)) b!284088))

(declare-fun m!299145 () Bool)

(assert (=> d!65601 m!299145))

(assert (=> d!65601 m!298537))

(declare-fun m!299147 () Bool)

(assert (=> d!65601 m!299147))

(assert (=> b!284088 m!298537))

(declare-fun m!299149 () Bool)

(assert (=> b!284088 m!299149))

(assert (=> b!283782 d!65601))

(declare-fun d!65603 () Bool)

(declare-fun lt!140396 () Bool)

(assert (=> d!65603 (= lt!140396 (member (select (arr!6715 lt!140153) #b00000000000000000000000000000000) (content!193 Nil!4520)))))

(declare-fun e!180255 () Bool)

(assert (=> d!65603 (= lt!140396 e!180255)))

(declare-fun res!146681 () Bool)

(assert (=> d!65603 (=> (not res!146681) (not e!180255))))

(assert (=> d!65603 (= res!146681 (is-Cons!4519 Nil!4520))))

(assert (=> d!65603 (= (contains!1995 Nil!4520 (select (arr!6715 lt!140153) #b00000000000000000000000000000000)) lt!140396)))

(declare-fun b!284089 () Bool)

(declare-fun e!180256 () Bool)

(assert (=> b!284089 (= e!180255 e!180256)))

(declare-fun res!146680 () Bool)

(assert (=> b!284089 (=> res!146680 e!180256)))

(assert (=> b!284089 (= res!146680 (= (h!5189 Nil!4520) (select (arr!6715 lt!140153) #b00000000000000000000000000000000)))))

(declare-fun b!284090 () Bool)

(assert (=> b!284090 (= e!180256 (contains!1995 (t!9605 Nil!4520) (select (arr!6715 lt!140153) #b00000000000000000000000000000000)))))

(assert (= (and d!65603 res!146681) b!284089))

(assert (= (and b!284089 (not res!146680)) b!284090))

(assert (=> d!65603 m!299145))

(assert (=> d!65603 m!298661))

(declare-fun m!299151 () Bool)

(assert (=> d!65603 m!299151))

(assert (=> b!284090 m!298661))

(declare-fun m!299153 () Bool)

(assert (=> b!284090 m!299153))

(assert (=> b!283733 d!65603))

(declare-fun b!284091 () Bool)

(declare-fun e!180258 () Bool)

(declare-fun call!25529 () Bool)

(assert (=> b!284091 (= e!180258 call!25529)))

(declare-fun d!65605 () Bool)

(declare-fun res!146683 () Bool)

(declare-fun e!180259 () Bool)

(assert (=> d!65605 (=> res!146683 e!180259)))

(assert (=> d!65605 (= res!146683 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7067 a!3325)))))

(assert (=> d!65605 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868) e!180259)))

(declare-fun b!284092 () Bool)

(declare-fun e!180257 () Bool)

(assert (=> b!284092 (= e!180258 e!180257)))

(declare-fun lt!140399 () (_ BitVec 64))

(assert (=> b!284092 (= lt!140399 (select (arr!6715 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140398 () Unit!9030)

(assert (=> b!284092 (= lt!140398 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140399 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!284092 (arrayContainsKey!0 a!3325 lt!140399 #b00000000000000000000000000000000)))

(declare-fun lt!140397 () Unit!9030)

(assert (=> b!284092 (= lt!140397 lt!140398)))

(declare-fun res!146682 () Bool)

(assert (=> b!284092 (= res!146682 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1873 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!284092 (=> (not res!146682) (not e!180257))))

(declare-fun b!284093 () Bool)

(assert (=> b!284093 (= e!180257 call!25529)))

(declare-fun b!284094 () Bool)

(assert (=> b!284094 (= e!180259 e!180258)))

(declare-fun c!46258 () Bool)

(assert (=> b!284094 (= c!46258 (validKeyInArray!0 (select (arr!6715 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun bm!25526 () Bool)

(assert (=> bm!25526 (= call!25529 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65605 (not res!146683)) b!284094))

(assert (= (and b!284094 c!46258) b!284092))

(assert (= (and b!284094 (not c!46258)) b!284091))

(assert (= (and b!284092 res!146682) b!284093))

(assert (= (or b!284093 b!284091) bm!25526))

(declare-fun m!299155 () Bool)

(assert (=> b!284092 m!299155))

(declare-fun m!299157 () Bool)

(assert (=> b!284092 m!299157))

(declare-fun m!299159 () Bool)

(assert (=> b!284092 m!299159))

(assert (=> b!284092 m!299155))

(declare-fun m!299161 () Bool)

(assert (=> b!284092 m!299161))

(assert (=> b!284094 m!299155))

(assert (=> b!284094 m!299155))

(declare-fun m!299163 () Bool)

(assert (=> b!284094 m!299163))

(declare-fun m!299165 () Bool)

(assert (=> bm!25526 m!299165))

(assert (=> bm!25510 d!65605))

(assert (=> b!283659 d!65413))

(declare-fun b!284095 () Bool)

(declare-fun e!180261 () SeekEntryResult!1873)

(declare-fun lt!140400 () SeekEntryResult!1873)

(assert (=> b!284095 (= e!180261 (MissingZero!1873 (index!9664 lt!140400)))))

(declare-fun b!284096 () Bool)

(declare-fun e!180260 () SeekEntryResult!1873)

(declare-fun e!180262 () SeekEntryResult!1873)

(assert (=> b!284096 (= e!180260 e!180262)))

(declare-fun lt!140401 () (_ BitVec 64))

(assert (=> b!284096 (= lt!140401 (select (arr!6715 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325))) (index!9664 lt!140400)))))

(declare-fun c!46260 () Bool)

(assert (=> b!284096 (= c!46260 (= lt!140401 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26)))))

(declare-fun lt!140402 () SeekEntryResult!1873)

(declare-fun d!65607 () Bool)

(assert (=> d!65607 (and (or (is-Undefined!1873 lt!140402) (not (is-Found!1873 lt!140402)) (and (bvsge (index!9663 lt!140402) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140402) (size!7067 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)))))) (or (is-Undefined!1873 lt!140402) (is-Found!1873 lt!140402) (not (is-MissingZero!1873 lt!140402)) (and (bvsge (index!9662 lt!140402) #b00000000000000000000000000000000) (bvslt (index!9662 lt!140402) (size!7067 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)))))) (or (is-Undefined!1873 lt!140402) (is-Found!1873 lt!140402) (is-MissingZero!1873 lt!140402) (not (is-MissingVacant!1873 lt!140402)) (and (bvsge (index!9665 lt!140402) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140402) (size!7067 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)))))) (or (is-Undefined!1873 lt!140402) (ite (is-Found!1873 lt!140402) (= (select (arr!6715 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325))) (index!9663 lt!140402)) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26)) (ite (is-MissingZero!1873 lt!140402) (= (select (arr!6715 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325))) (index!9662 lt!140402)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1873 lt!140402) (= (select (arr!6715 (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325))) (index!9665 lt!140402)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65607 (= lt!140402 e!180260)))

(declare-fun c!46261 () Bool)

(assert (=> d!65607 (= c!46261 (and (is-Intermediate!1873 lt!140400) (undefined!2685 lt!140400)))))

(assert (=> d!65607 (= lt!140400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) mask!3868) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)) mask!3868))))

(assert (=> d!65607 (validMask!0 mask!3868)))

(assert (=> d!65607 (= (seekEntryOrOpen!0 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)) mask!3868) lt!140402)))

(declare-fun b!284097 () Bool)

(assert (=> b!284097 (= e!180262 (Found!1873 (index!9664 lt!140400)))))

(declare-fun b!284098 () Bool)

(assert (=> b!284098 (= e!180261 (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140400) (index!9664 lt!140400) (index!9664 lt!140400) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) (array!14150 (store (arr!6715 a!3325) i!1267 k!2581) (size!7067 a!3325)) mask!3868))))

(declare-fun b!284099 () Bool)

(assert (=> b!284099 (= e!180260 Undefined!1873)))

(declare-fun b!284100 () Bool)

(declare-fun c!46259 () Bool)

(assert (=> b!284100 (= c!46259 (= lt!140401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284100 (= e!180262 e!180261)))

(assert (= (and d!65607 c!46261) b!284099))

(assert (= (and d!65607 (not c!46261)) b!284096))

(assert (= (and b!284096 c!46260) b!284097))

(assert (= (and b!284096 (not c!46260)) b!284100))

(assert (= (and b!284100 c!46259) b!284095))

(assert (= (and b!284100 (not c!46259)) b!284098))

(declare-fun m!299167 () Bool)

(assert (=> b!284096 m!299167))

(assert (=> d!65607 m!298487))

(assert (=> d!65607 m!298747))

(assert (=> d!65607 m!298465))

(declare-fun m!299169 () Bool)

(assert (=> d!65607 m!299169))

(declare-fun m!299171 () Bool)

(assert (=> d!65607 m!299171))

(assert (=> d!65607 m!298747))

(assert (=> d!65607 m!298487))

(declare-fun m!299173 () Bool)

(assert (=> d!65607 m!299173))

(declare-fun m!299175 () Bool)

(assert (=> d!65607 m!299175))

(assert (=> b!284098 m!298487))

(declare-fun m!299177 () Bool)

(assert (=> b!284098 m!299177))

(assert (=> b!283659 d!65607))

(assert (=> b!283770 d!65457))

(assert (=> d!65437 d!65447))

(declare-fun d!65609 () Bool)

(assert (=> d!65609 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(assert (=> d!65609 true))

(declare-fun _$72!104 () Unit!9030)

(assert (=> d!65609 (= (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) _$72!104)))

(declare-fun bs!10087 () Bool)

(assert (= bs!10087 d!65609))

(assert (=> bs!10087 m!298489))

(assert (=> d!65437 d!65609))

(assert (=> d!65437 d!65379))

(declare-fun b!284113 () Bool)

(declare-fun e!180269 () SeekEntryResult!1873)

(assert (=> b!284113 (= e!180269 (MissingVacant!1873 (index!9664 lt!140270)))))

(declare-fun b!284114 () Bool)

(declare-fun e!180271 () SeekEntryResult!1873)

(declare-fun e!180270 () SeekEntryResult!1873)

(assert (=> b!284114 (= e!180271 e!180270)))

(declare-fun c!46269 () Bool)

(declare-fun lt!140407 () (_ BitVec 64))

(assert (=> b!284114 (= c!46269 (= lt!140407 k!2581))))

(declare-fun b!284115 () Bool)

(assert (=> b!284115 (= e!180271 Undefined!1873)))

(declare-fun b!284116 () Bool)

(declare-fun c!46268 () Bool)

(assert (=> b!284116 (= c!46268 (= lt!140407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284116 (= e!180270 e!180269)))

(declare-fun b!284117 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!284117 (= e!180269 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27863 lt!140270) #b00000000000000000000000000000001) (nextIndex!0 (index!9664 lt!140270) (x!27863 lt!140270) mask!3868) (index!9664 lt!140270) k!2581 a!3325 mask!3868))))

(declare-fun d!65611 () Bool)

(declare-fun lt!140408 () SeekEntryResult!1873)

(assert (=> d!65611 (and (or (is-Undefined!1873 lt!140408) (not (is-Found!1873 lt!140408)) (and (bvsge (index!9663 lt!140408) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140408) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140408) (is-Found!1873 lt!140408) (not (is-MissingVacant!1873 lt!140408)) (not (= (index!9665 lt!140408) (index!9664 lt!140270))) (and (bvsge (index!9665 lt!140408) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140408) (size!7067 a!3325)))) (or (is-Undefined!1873 lt!140408) (ite (is-Found!1873 lt!140408) (= (select (arr!6715 a!3325) (index!9663 lt!140408)) k!2581) (and (is-MissingVacant!1873 lt!140408) (= (index!9665 lt!140408) (index!9664 lt!140270)) (= (select (arr!6715 a!3325) (index!9665 lt!140408)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65611 (= lt!140408 e!180271)))

(declare-fun c!46270 () Bool)

(assert (=> d!65611 (= c!46270 (bvsge (x!27863 lt!140270) #b01111111111111111111111111111110))))

(assert (=> d!65611 (= lt!140407 (select (arr!6715 a!3325) (index!9664 lt!140270)))))

(assert (=> d!65611 (validMask!0 mask!3868)))

(assert (=> d!65611 (= (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140270) (index!9664 lt!140270) (index!9664 lt!140270) k!2581 a!3325 mask!3868) lt!140408)))

(declare-fun b!284118 () Bool)

(assert (=> b!284118 (= e!180270 (Found!1873 (index!9664 lt!140270)))))

(assert (= (and d!65611 c!46270) b!284115))

(assert (= (and d!65611 (not c!46270)) b!284114))

(assert (= (and b!284114 c!46269) b!284118))

(assert (= (and b!284114 (not c!46269)) b!284116))

(assert (= (and b!284116 c!46268) b!284113))

(assert (= (and b!284116 (not c!46268)) b!284117))

(declare-fun m!299179 () Bool)

(assert (=> b!284117 m!299179))

(assert (=> b!284117 m!299179))

(declare-fun m!299181 () Bool)

(assert (=> b!284117 m!299181))

(declare-fun m!299183 () Bool)

(assert (=> d!65611 m!299183))

(declare-fun m!299185 () Bool)

(assert (=> d!65611 m!299185))

(assert (=> d!65611 m!298777))

(assert (=> d!65611 m!298465))

(assert (=> b!283800 d!65611))

(declare-fun b!284119 () Bool)

(declare-fun e!180273 () Bool)

(declare-fun call!25530 () Bool)

(assert (=> b!284119 (= e!180273 call!25530)))

(declare-fun d!65613 () Bool)

(declare-fun res!146685 () Bool)

(declare-fun e!180274 () Bool)

(assert (=> d!65613 (=> res!146685 e!180274)))

(assert (=> d!65613 (= res!146685 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7067 a!3325)))))

(assert (=> d!65613 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!180274)))

(declare-fun b!284120 () Bool)

(declare-fun e!180272 () Bool)

(assert (=> b!284120 (= e!180273 e!180272)))

(declare-fun lt!140411 () (_ BitVec 64))

(assert (=> b!284120 (= lt!140411 (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140410 () Unit!9030)

(assert (=> b!284120 (= lt!140410 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140411 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!284120 (arrayContainsKey!0 a!3325 lt!140411 #b00000000000000000000000000000000)))

(declare-fun lt!140409 () Unit!9030)

(assert (=> b!284120 (= lt!140409 lt!140410)))

(declare-fun res!146684 () Bool)

(assert (=> b!284120 (= res!146684 (= (seekEntryOrOpen!0 (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1873 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!284120 (=> (not res!146684) (not e!180272))))

(declare-fun b!284121 () Bool)

(assert (=> b!284121 (= e!180272 call!25530)))

(declare-fun b!284122 () Bool)

(assert (=> b!284122 (= e!180274 e!180273)))

(declare-fun c!46271 () Bool)

(assert (=> b!284122 (= c!46271 (validKeyInArray!0 (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25527 () Bool)

(assert (=> bm!25527 (= call!25530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65613 (not res!146685)) b!284122))

(assert (= (and b!284122 c!46271) b!284120))

(assert (= (and b!284122 (not c!46271)) b!284119))

(assert (= (and b!284120 res!146684) b!284121))

(assert (= (or b!284121 b!284119) bm!25527))

(declare-fun m!299187 () Bool)

(assert (=> b!284120 m!299187))

(declare-fun m!299189 () Bool)

(assert (=> b!284120 m!299189))

(declare-fun m!299191 () Bool)

(assert (=> b!284120 m!299191))

(assert (=> b!284120 m!299187))

(declare-fun m!299193 () Bool)

(assert (=> b!284120 m!299193))

(assert (=> b!284122 m!299187))

(assert (=> b!284122 m!299187))

(declare-fun m!299195 () Bool)

(assert (=> b!284122 m!299195))

(declare-fun m!299197 () Bool)

(assert (=> bm!25527 m!299197))

(assert (=> bm!25498 d!65613))

(declare-fun b!284123 () Bool)

(declare-fun e!180275 () SeekEntryResult!1873)

(assert (=> b!284123 (= e!180275 (MissingVacant!1873 (index!9664 lt!140264)))))

(declare-fun b!284124 () Bool)

(declare-fun e!180277 () SeekEntryResult!1873)

(declare-fun e!180276 () SeekEntryResult!1873)

(assert (=> b!284124 (= e!180277 e!180276)))

(declare-fun lt!140412 () (_ BitVec 64))

(declare-fun c!46273 () Bool)

(assert (=> b!284124 (= c!46273 (= lt!140412 (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26)))))

(declare-fun b!284125 () Bool)

(assert (=> b!284125 (= e!180277 Undefined!1873)))

(declare-fun b!284126 () Bool)

(declare-fun c!46272 () Bool)

(assert (=> b!284126 (= c!46272 (= lt!140412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284126 (= e!180276 e!180275)))

(declare-fun b!284127 () Bool)

(assert (=> b!284127 (= e!180275 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27863 lt!140264) #b00000000000000000000000000000001) (nextIndex!0 (index!9664 lt!140264) (x!27863 lt!140264) mask!3868) (index!9664 lt!140264) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) lt!140153 mask!3868))))

(declare-fun d!65615 () Bool)

(declare-fun lt!140413 () SeekEntryResult!1873)

(assert (=> d!65615 (and (or (is-Undefined!1873 lt!140413) (not (is-Found!1873 lt!140413)) (and (bvsge (index!9663 lt!140413) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140413) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140413) (is-Found!1873 lt!140413) (not (is-MissingVacant!1873 lt!140413)) (not (= (index!9665 lt!140413) (index!9664 lt!140264))) (and (bvsge (index!9665 lt!140413) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140413) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140413) (ite (is-Found!1873 lt!140413) (= (select (arr!6715 lt!140153) (index!9663 lt!140413)) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26)) (and (is-MissingVacant!1873 lt!140413) (= (index!9665 lt!140413) (index!9664 lt!140264)) (= (select (arr!6715 lt!140153) (index!9665 lt!140413)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65615 (= lt!140413 e!180277)))

(declare-fun c!46274 () Bool)

(assert (=> d!65615 (= c!46274 (bvsge (x!27863 lt!140264) #b01111111111111111111111111111110))))

(assert (=> d!65615 (= lt!140412 (select (arr!6715 lt!140153) (index!9664 lt!140264)))))

(assert (=> d!65615 (validMask!0 mask!3868)))

(assert (=> d!65615 (= (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140264) (index!9664 lt!140264) (index!9664 lt!140264) (select (store (arr!6715 a!3325) i!1267 k!2581) startIndex!26) lt!140153 mask!3868) lt!140413)))

(declare-fun b!284128 () Bool)

(assert (=> b!284128 (= e!180276 (Found!1873 (index!9664 lt!140264)))))

(assert (= (and d!65615 c!46274) b!284125))

(assert (= (and d!65615 (not c!46274)) b!284124))

(assert (= (and b!284124 c!46273) b!284128))

(assert (= (and b!284124 (not c!46273)) b!284126))

(assert (= (and b!284126 c!46272) b!284123))

(assert (= (and b!284126 (not c!46272)) b!284127))

(declare-fun m!299199 () Bool)

(assert (=> b!284127 m!299199))

(assert (=> b!284127 m!299199))

(assert (=> b!284127 m!298487))

(declare-fun m!299201 () Bool)

(assert (=> b!284127 m!299201))

(declare-fun m!299203 () Bool)

(assert (=> d!65615 m!299203))

(declare-fun m!299205 () Bool)

(assert (=> d!65615 m!299205))

(assert (=> d!65615 m!298745))

(assert (=> d!65615 m!298465))

(assert (=> b!283779 d!65615))

(declare-fun d!65617 () Bool)

(assert (=> d!65617 (arrayContainsKey!0 lt!140153 lt!140269 #b00000000000000000000000000000000)))

(declare-fun lt!140414 () Unit!9030)

(assert (=> d!65617 (= lt!140414 (choose!13 lt!140153 lt!140269 startIndex!26))))

(assert (=> d!65617 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65617 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140153 lt!140269 startIndex!26) lt!140414)))

(declare-fun bs!10088 () Bool)

(assert (= bs!10088 d!65617))

(assert (=> bs!10088 m!298767))

(declare-fun m!299207 () Bool)

(assert (=> bs!10088 m!299207))

(assert (=> b!283788 d!65617))

(declare-fun d!65619 () Bool)

(declare-fun res!146686 () Bool)

(declare-fun e!180278 () Bool)

(assert (=> d!65619 (=> res!146686 e!180278)))

(assert (=> d!65619 (= res!146686 (= (select (arr!6715 lt!140153) #b00000000000000000000000000000000) lt!140269))))

(assert (=> d!65619 (= (arrayContainsKey!0 lt!140153 lt!140269 #b00000000000000000000000000000000) e!180278)))

(declare-fun b!284129 () Bool)

(declare-fun e!180279 () Bool)

(assert (=> b!284129 (= e!180278 e!180279)))

(declare-fun res!146687 () Bool)

(assert (=> b!284129 (=> (not res!146687) (not e!180279))))

(assert (=> b!284129 (= res!146687 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7067 lt!140153)))))

(declare-fun b!284130 () Bool)

(assert (=> b!284130 (= e!180279 (arrayContainsKey!0 lt!140153 lt!140269 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65619 (not res!146686)) b!284129))

(assert (= (and b!284129 res!146687) b!284130))

(assert (=> d!65619 m!298661))

(declare-fun m!299209 () Bool)

(assert (=> b!284130 m!299209))

(assert (=> b!283788 d!65619))

(declare-fun b!284131 () Bool)

(declare-fun e!180281 () SeekEntryResult!1873)

(declare-fun lt!140415 () SeekEntryResult!1873)

(assert (=> b!284131 (= e!180281 (MissingZero!1873 (index!9664 lt!140415)))))

(declare-fun b!284132 () Bool)

(declare-fun e!180280 () SeekEntryResult!1873)

(declare-fun e!180282 () SeekEntryResult!1873)

(assert (=> b!284132 (= e!180280 e!180282)))

(declare-fun lt!140416 () (_ BitVec 64))

(assert (=> b!284132 (= lt!140416 (select (arr!6715 lt!140153) (index!9664 lt!140415)))))

(declare-fun c!46276 () Bool)

(assert (=> b!284132 (= c!46276 (= lt!140416 (select (arr!6715 lt!140153) startIndex!26)))))

(declare-fun d!65621 () Bool)

(declare-fun lt!140417 () SeekEntryResult!1873)

(assert (=> d!65621 (and (or (is-Undefined!1873 lt!140417) (not (is-Found!1873 lt!140417)) (and (bvsge (index!9663 lt!140417) #b00000000000000000000000000000000) (bvslt (index!9663 lt!140417) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140417) (is-Found!1873 lt!140417) (not (is-MissingZero!1873 lt!140417)) (and (bvsge (index!9662 lt!140417) #b00000000000000000000000000000000) (bvslt (index!9662 lt!140417) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140417) (is-Found!1873 lt!140417) (is-MissingZero!1873 lt!140417) (not (is-MissingVacant!1873 lt!140417)) (and (bvsge (index!9665 lt!140417) #b00000000000000000000000000000000) (bvslt (index!9665 lt!140417) (size!7067 lt!140153)))) (or (is-Undefined!1873 lt!140417) (ite (is-Found!1873 lt!140417) (= (select (arr!6715 lt!140153) (index!9663 lt!140417)) (select (arr!6715 lt!140153) startIndex!26)) (ite (is-MissingZero!1873 lt!140417) (= (select (arr!6715 lt!140153) (index!9662 lt!140417)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1873 lt!140417) (= (select (arr!6715 lt!140153) (index!9665 lt!140417)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65621 (= lt!140417 e!180280)))

(declare-fun c!46277 () Bool)

(assert (=> d!65621 (= c!46277 (and (is-Intermediate!1873 lt!140415) (undefined!2685 lt!140415)))))

(assert (=> d!65621 (= lt!140415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6715 lt!140153) startIndex!26) mask!3868) (select (arr!6715 lt!140153) startIndex!26) lt!140153 mask!3868))))

(assert (=> d!65621 (validMask!0 mask!3868)))

(assert (=> d!65621 (= (seekEntryOrOpen!0 (select (arr!6715 lt!140153) startIndex!26) lt!140153 mask!3868) lt!140417)))

(declare-fun b!284133 () Bool)

(assert (=> b!284133 (= e!180282 (Found!1873 (index!9664 lt!140415)))))

(declare-fun b!284134 () Bool)

(assert (=> b!284134 (= e!180281 (seekKeyOrZeroReturnVacant!0 (x!27863 lt!140415) (index!9664 lt!140415) (index!9664 lt!140415) (select (arr!6715 lt!140153) startIndex!26) lt!140153 mask!3868))))

(declare-fun b!284135 () Bool)

(assert (=> b!284135 (= e!180280 Undefined!1873)))

(declare-fun b!284136 () Bool)

(declare-fun c!46275 () Bool)

(assert (=> b!284136 (= c!46275 (= lt!140416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284136 (= e!180282 e!180281)))

(assert (= (and d!65621 c!46277) b!284135))

(assert (= (and d!65621 (not c!46277)) b!284132))

(assert (= (and b!284132 c!46276) b!284133))

(assert (= (and b!284132 (not c!46276)) b!284136))

(assert (= (and b!284136 c!46275) b!284131))

(assert (= (and b!284136 (not c!46275)) b!284134))

(declare-fun m!299211 () Bool)

(assert (=> b!284132 m!299211))

(assert (=> d!65621 m!298763))

(declare-fun m!299213 () Bool)

(assert (=> d!65621 m!299213))

(assert (=> d!65621 m!298465))

(declare-fun m!299215 () Bool)

(assert (=> d!65621 m!299215))

(declare-fun m!299217 () Bool)

(assert (=> d!65621 m!299217))

(assert (=> d!65621 m!299213))

(assert (=> d!65621 m!298763))

(declare-fun m!299219 () Bool)

(assert (=> d!65621 m!299219))

(declare-fun m!299221 () Bool)

(assert (=> d!65621 m!299221))

(assert (=> b!284134 m!298763))

(declare-fun m!299223 () Bool)

(assert (=> b!284134 m!299223))

(assert (=> b!283788 d!65621))

(declare-fun d!65623 () Bool)

(assert (=> d!65623 (= (validKeyInArray!0 (select (arr!6715 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6715 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6715 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283621 d!65623))

(assert (=> b!283783 d!65623))

(declare-fun d!65625 () Bool)

(assert (=> d!65625 (= (validKeyInArray!0 (select (arr!6715 lt!140153) #b00000000000000000000000000000000)) (and (not (= (select (arr!6715 lt!140153) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6715 lt!140153) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283734 d!65625))

(declare-fun d!65627 () Bool)

(declare-fun res!146688 () Bool)

(declare-fun e!180283 () Bool)

(assert (=> d!65627 (=> res!146688 e!180283)))

(assert (=> d!65627 (= res!146688 (= (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2581))))

(assert (=> d!65627 (= (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!180283)))

(declare-fun b!284137 () Bool)

(declare-fun e!180284 () Bool)

(assert (=> b!284137 (= e!180283 e!180284)))

(declare-fun res!146689 () Bool)

(assert (=> b!284137 (=> (not res!146689) (not e!180284))))

(assert (=> b!284137 (= res!146689 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7067 a!3325)))))

(declare-fun b!284138 () Bool)

(assert (=> b!284138 (= e!180284 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65627 (not res!146688)) b!284137))

(assert (= (and b!284137 res!146689) b!284138))

(assert (=> d!65627 m!299187))

(declare-fun m!299225 () Bool)

(assert (=> b!284138 m!299225))

(assert (=> b!283796 d!65627))

(declare-fun b!284139 () Bool)

(declare-fun e!180286 () Bool)

(assert (=> b!284139 (= e!180286 (contains!1995 (ite c!46160 (Cons!4519 (select (arr!6715 a!3325) #b00000000000000000000000000000000) Nil!4520) Nil!4520) (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!46278 () Bool)

(declare-fun call!25531 () Bool)

(declare-fun bm!25528 () Bool)

(assert (=> bm!25528 (= call!25531 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46278 (Cons!4519 (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46160 (Cons!4519 (select (arr!6715 a!3325) #b00000000000000000000000000000000) Nil!4520) Nil!4520)) (ite c!46160 (Cons!4519 (select (arr!6715 a!3325) #b00000000000000000000000000000000) Nil!4520) Nil!4520))))))

(declare-fun d!65629 () Bool)

(declare-fun res!146690 () Bool)

(declare-fun e!180287 () Bool)

(assert (=> d!65629 (=> res!146690 e!180287)))

(assert (=> d!65629 (= res!146690 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7067 a!3325)))))

(assert (=> d!65629 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46160 (Cons!4519 (select (arr!6715 a!3325) #b00000000000000000000000000000000) Nil!4520) Nil!4520)) e!180287)))

(declare-fun b!284140 () Bool)

(declare-fun e!180285 () Bool)

(declare-fun e!180288 () Bool)

(assert (=> b!284140 (= e!180285 e!180288)))

(assert (=> b!284140 (= c!46278 (validKeyInArray!0 (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!284141 () Bool)

(assert (=> b!284141 (= e!180288 call!25531)))

(declare-fun b!284142 () Bool)

(assert (=> b!284142 (= e!180287 e!180285)))

(declare-fun res!146692 () Bool)

(assert (=> b!284142 (=> (not res!146692) (not e!180285))))

(assert (=> b!284142 (= res!146692 (not e!180286))))

(declare-fun res!146691 () Bool)

(assert (=> b!284142 (=> (not res!146691) (not e!180286))))

(assert (=> b!284142 (= res!146691 (validKeyInArray!0 (select (arr!6715 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!284143 () Bool)

(assert (=> b!284143 (= e!180288 call!25531)))

(assert (= (and d!65629 (not res!146690)) b!284142))

(assert (= (and b!284142 res!146691) b!284139))

(assert (= (and b!284142 res!146692) b!284140))

(assert (= (and b!284140 c!46278) b!284141))

(assert (= (and b!284140 (not c!46278)) b!284143))

(assert (= (or b!284141 b!284143) bm!25528))

(assert (=> b!284139 m!299187))

(assert (=> b!284139 m!299187))

(declare-fun m!299227 () Bool)

(assert (=> b!284139 m!299227))

(assert (=> bm!25528 m!299187))

(declare-fun m!299229 () Bool)

(assert (=> bm!25528 m!299229))

(assert (=> b!284140 m!299187))

(assert (=> b!284140 m!299187))

(assert (=> b!284140 m!299195))

(assert (=> b!284142 m!299187))

(assert (=> b!284142 m!299187))

(assert (=> b!284142 m!299195))

(assert (=> bm!25512 d!65629))

(declare-fun b!284144 () Bool)

(declare-fun e!180290 () Bool)

(assert (=> b!284144 (= e!180290 (contains!1995 (ite c!46146 (Cons!4519 (select (arr!6715 lt!140153) #b00000000000000000000000000000000) Nil!4520) Nil!4520) (select (arr!6715 lt!140153) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25529 () Bool)

(declare-fun call!25532 () Bool)

(declare-fun c!46279 () Bool)

(assert (=> bm!25529 (= call!25532 (arrayNoDuplicates!0 lt!140153 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46279 (Cons!4519 (select (arr!6715 lt!140153) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46146 (Cons!4519 (select (arr!6715 lt!140153) #b00000000000000000000000000000000) Nil!4520) Nil!4520)) (ite c!46146 (Cons!4519 (select (arr!6715 lt!140153) #b00000000000000000000000000000000) Nil!4520) Nil!4520))))))

(declare-fun d!65631 () Bool)

(declare-fun res!146693 () Bool)

(declare-fun e!180291 () Bool)

(assert (=> d!65631 (=> res!146693 e!180291)))

(assert (=> d!65631 (= res!146693 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7067 lt!140153)))))

(assert (=> d!65631 (= (arrayNoDuplicates!0 lt!140153 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46146 (Cons!4519 (select (arr!6715 lt!140153) #b00000000000000000000000000000000) Nil!4520) Nil!4520)) e!180291)))

(declare-fun b!284145 () Bool)

(declare-fun e!180289 () Bool)

(declare-fun e!180292 () Bool)

(assert (=> b!284145 (= e!180289 e!180292)))

(assert (=> b!284145 (= c!46279 (validKeyInArray!0 (select (arr!6715 lt!140153) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!284146 () Bool)

(assert (=> b!284146 (= e!180292 call!25532)))

(declare-fun b!284147 () Bool)

(assert (=> b!284147 (= e!180291 e!180289)))

(declare-fun res!146695 () Bool)

(assert (=> b!284147 (=> (not res!146695) (not e!180289))))

(assert (=> b!284147 (= res!146695 (not e!180290))))

(declare-fun res!146694 () Bool)

(assert (=> b!284147 (=> (not res!146694) (not e!180290))))

(assert (=> b!284147 (= res!146694 (validKeyInArray!0 (select (arr!6715 lt!140153) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

