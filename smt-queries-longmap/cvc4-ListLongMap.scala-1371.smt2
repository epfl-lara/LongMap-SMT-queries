; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26972 () Bool)

(assert start!26972)

(declare-fun b!279329 () Bool)

(declare-fun res!142559 () Bool)

(declare-fun e!178076 () Bool)

(assert (=> b!279329 (=> (not res!142559) (not e!178076))))

(declare-datatypes ((List!4311 0))(
  ( (Nil!4308) (Cons!4307 (h!4977 (_ BitVec 64)) (t!9385 List!4311)) )
))
(declare-fun noDuplicate!156 (List!4311) Bool)

(assert (=> b!279329 (= res!142559 (noDuplicate!156 Nil!4308))))

(declare-fun b!279330 () Bool)

(declare-fun res!142558 () Bool)

(declare-fun e!178078 () Bool)

(assert (=> b!279330 (=> (not res!142558) (not e!178078))))

(declare-datatypes ((array!13891 0))(
  ( (array!13892 (arr!6590 (Array (_ BitVec 32) (_ BitVec 64))) (size!6942 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13891)

(declare-fun arrayNoDuplicates!0 (array!13891 (_ BitVec 32) List!4311) Bool)

(assert (=> b!279330 (= res!142558 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4308))))

(declare-fun b!279331 () Bool)

(declare-fun res!142553 () Bool)

(assert (=> b!279331 (=> (not res!142553) (not e!178076))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279331 (= res!142553 (validKeyInArray!0 (select (arr!6590 a!3325) startIndex!26)))))

(declare-fun b!279332 () Bool)

(declare-fun res!142557 () Bool)

(assert (=> b!279332 (=> (not res!142557) (not e!178076))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13891 (_ BitVec 32)) Bool)

(assert (=> b!279332 (= res!142557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!142561 () Bool)

(assert (=> start!26972 (=> (not res!142561) (not e!178078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26972 (= res!142561 (validMask!0 mask!3868))))

(assert (=> start!26972 e!178078))

(declare-fun array_inv!4540 (array!13891) Bool)

(assert (=> start!26972 (array_inv!4540 a!3325)))

(assert (=> start!26972 true))

(declare-fun b!279333 () Bool)

(declare-fun res!142556 () Bool)

(assert (=> b!279333 (=> (not res!142556) (not e!178078))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279333 (= res!142556 (and (= (size!6942 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6942 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6942 a!3325))))))

(declare-fun b!279334 () Bool)

(assert (=> b!279334 (= e!178078 e!178076)))

(declare-fun res!142562 () Bool)

(assert (=> b!279334 (=> (not res!142562) (not e!178076))))

(declare-datatypes ((SeekEntryResult!1713 0))(
  ( (MissingZero!1713 (index!9022 (_ BitVec 32))) (Found!1713 (index!9023 (_ BitVec 32))) (Intermediate!1713 (undefined!2525 Bool) (index!9024 (_ BitVec 32)) (x!27375 (_ BitVec 32))) (Undefined!1713) (MissingVacant!1713 (index!9025 (_ BitVec 32))) )
))
(declare-fun lt!138645 () SeekEntryResult!1713)

(assert (=> b!279334 (= res!142562 (or (= lt!138645 (MissingZero!1713 i!1267)) (= lt!138645 (MissingVacant!1713 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13891 (_ BitVec 32)) SeekEntryResult!1713)

(assert (=> b!279334 (= lt!138645 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279335 () Bool)

(declare-fun res!142552 () Bool)

(assert (=> b!279335 (=> (not res!142552) (not e!178078))))

(assert (=> b!279335 (= res!142552 (validKeyInArray!0 k!2581))))

(declare-fun b!279336 () Bool)

(declare-fun e!178079 () Bool)

(declare-fun contains!1945 (List!4311 (_ BitVec 64)) Bool)

(assert (=> b!279336 (= e!178079 (contains!1945 Nil!4308 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279337 () Bool)

(declare-fun res!142563 () Bool)

(assert (=> b!279337 (=> (not res!142563) (not e!178076))))

(assert (=> b!279337 (= res!142563 (not (= startIndex!26 i!1267)))))

(declare-fun b!279338 () Bool)

(declare-fun res!142554 () Bool)

(assert (=> b!279338 (=> (not res!142554) (not e!178076))))

(assert (=> b!279338 (= res!142554 (and (bvslt (size!6942 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6942 a!3325))))))

(declare-fun b!279339 () Bool)

(assert (=> b!279339 (= e!178076 e!178079)))

(declare-fun res!142560 () Bool)

(assert (=> b!279339 (=> res!142560 e!178079)))

(assert (=> b!279339 (= res!142560 (contains!1945 Nil!4308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279340 () Bool)

(declare-fun res!142555 () Bool)

(assert (=> b!279340 (=> (not res!142555) (not e!178078))))

(declare-fun arrayContainsKey!0 (array!13891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279340 (= res!142555 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26972 res!142561) b!279333))

(assert (= (and b!279333 res!142556) b!279335))

(assert (= (and b!279335 res!142552) b!279330))

(assert (= (and b!279330 res!142558) b!279340))

(assert (= (and b!279340 res!142555) b!279334))

(assert (= (and b!279334 res!142562) b!279332))

(assert (= (and b!279332 res!142557) b!279337))

(assert (= (and b!279337 res!142563) b!279331))

(assert (= (and b!279331 res!142553) b!279338))

(assert (= (and b!279338 res!142554) b!279329))

(assert (= (and b!279329 res!142559) b!279339))

(assert (= (and b!279339 (not res!142560)) b!279336))

(declare-fun m!294281 () Bool)

(assert (=> b!279334 m!294281))

(declare-fun m!294283 () Bool)

(assert (=> b!279336 m!294283))

(declare-fun m!294285 () Bool)

(assert (=> b!279330 m!294285))

(declare-fun m!294287 () Bool)

(assert (=> b!279329 m!294287))

(declare-fun m!294289 () Bool)

(assert (=> b!279339 m!294289))

(declare-fun m!294291 () Bool)

(assert (=> b!279335 m!294291))

(declare-fun m!294293 () Bool)

(assert (=> b!279331 m!294293))

(assert (=> b!279331 m!294293))

(declare-fun m!294295 () Bool)

(assert (=> b!279331 m!294295))

(declare-fun m!294297 () Bool)

(assert (=> b!279332 m!294297))

(declare-fun m!294299 () Bool)

(assert (=> b!279340 m!294299))

(declare-fun m!294301 () Bool)

(assert (=> start!26972 m!294301))

(declare-fun m!294303 () Bool)

(assert (=> start!26972 m!294303))

(push 1)

(assert (not b!279330))

(assert (not b!279340))

(assert (not b!279336))

(assert (not start!26972))

(assert (not b!279334))

(assert (not b!279335))

(assert (not b!279331))

(assert (not b!279339))

(assert (not b!279332))

(assert (not b!279329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65115 () Bool)

(assert (=> d!65115 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279335 d!65115))

(declare-fun d!65117 () Bool)

(declare-fun res!142618 () Bool)

(declare-fun e!178119 () Bool)

(assert (=> d!65117 (=> res!142618 e!178119)))

(assert (=> d!65117 (= res!142618 (bvsge #b00000000000000000000000000000000 (size!6942 a!3325)))))

(assert (=> d!65117 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4308) e!178119)))

(declare-fun b!279403 () Bool)

(declare-fun e!178117 () Bool)

(declare-fun e!178115 () Bool)

(assert (=> b!279403 (= e!178117 e!178115)))

(declare-fun c!45946 () Bool)

(assert (=> b!279403 (= c!45946 (validKeyInArray!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279404 () Bool)

(declare-fun call!25417 () Bool)

(assert (=> b!279404 (= e!178115 call!25417)))

(declare-fun b!279405 () Bool)

(assert (=> b!279405 (= e!178115 call!25417)))

(declare-fun bm!25413 () Bool)

(assert (=> bm!25413 (= call!25417 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45946 (Cons!4307 (select (arr!6590 a!3325) #b00000000000000000000000000000000) Nil!4308) Nil!4308)))))

(declare-fun b!279406 () Bool)

(declare-fun e!178114 () Bool)

(assert (=> b!279406 (= e!178114 (contains!1945 Nil!4308 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279408 () Bool)

(assert (=> b!279408 (= e!178119 e!178117)))

(declare-fun res!142621 () Bool)

(assert (=> b!279408 (=> (not res!142621) (not e!178117))))

(assert (=> b!279408 (= res!142621 (not e!178114))))

(declare-fun res!142622 () Bool)

(assert (=> b!279408 (=> (not res!142622) (not e!178114))))

(assert (=> b!279408 (= res!142622 (validKeyInArray!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65117 (not res!142618)) b!279408))

(assert (= (and b!279408 res!142622) b!279406))

(assert (= (and b!279408 res!142621) b!279403))

(assert (= (and b!279403 c!45946) b!279404))

(assert (= (and b!279403 (not c!45946)) b!279405))

(assert (= (or b!279404 b!279405) bm!25413))

(declare-fun m!294333 () Bool)

(assert (=> b!279403 m!294333))

(assert (=> b!279403 m!294333))

(declare-fun m!294335 () Bool)

(assert (=> b!279403 m!294335))

(assert (=> bm!25413 m!294333))

(declare-fun m!294337 () Bool)

(assert (=> bm!25413 m!294337))

(assert (=> b!279406 m!294333))

(assert (=> b!279406 m!294333))

(declare-fun m!294339 () Bool)

(assert (=> b!279406 m!294339))

(assert (=> b!279408 m!294333))

(assert (=> b!279408 m!294333))

(assert (=> b!279408 m!294335))

(assert (=> b!279330 d!65117))

(declare-fun d!65121 () Bool)

(declare-fun lt!138651 () Bool)

(declare-fun content!187 (List!4311) (Set (_ BitVec 64)))

(assert (=> d!65121 (= lt!138651 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!187 Nil!4308)))))

(declare-fun e!178133 () Bool)

(assert (=> d!65121 (= lt!138651 e!178133)))

(declare-fun res!142635 () Bool)

(assert (=> d!65121 (=> (not res!142635) (not e!178133))))

(assert (=> d!65121 (= res!142635 (is-Cons!4307 Nil!4308))))

(assert (=> d!65121 (= (contains!1945 Nil!4308 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138651)))

(declare-fun b!279423 () Bool)

(declare-fun e!178132 () Bool)

(assert (=> b!279423 (= e!178133 e!178132)))

(declare-fun res!142634 () Bool)

(assert (=> b!279423 (=> res!142634 e!178132)))

(assert (=> b!279423 (= res!142634 (= (h!4977 Nil!4308) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279424 () Bool)

(assert (=> b!279424 (= e!178132 (contains!1945 (t!9385 Nil!4308) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65121 res!142635) b!279423))

(assert (= (and b!279423 (not res!142634)) b!279424))

(declare-fun m!294353 () Bool)

(assert (=> d!65121 m!294353))

(declare-fun m!294355 () Bool)

(assert (=> d!65121 m!294355))

(declare-fun m!294357 () Bool)

(assert (=> b!279424 m!294357))

(assert (=> b!279336 d!65121))

(declare-fun d!65129 () Bool)

(assert (=> d!65129 (= (validKeyInArray!0 (select (arr!6590 a!3325) startIndex!26)) (and (not (= (select (arr!6590 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6590 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279331 d!65129))

(declare-fun b!279441 () Bool)

(declare-fun e!178148 () Bool)

(declare-fun e!178147 () Bool)

(assert (=> b!279441 (= e!178148 e!178147)))

(declare-fun c!45951 () Bool)

(assert (=> b!279441 (= c!45951 (validKeyInArray!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65131 () Bool)

(declare-fun res!142645 () Bool)

(assert (=> d!65131 (=> res!142645 e!178148)))

(assert (=> d!65131 (= res!142645 (bvsge #b00000000000000000000000000000000 (size!6942 a!3325)))))

(assert (=> d!65131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178148)))

(declare-fun bm!25419 () Bool)

(declare-fun call!25422 () Bool)

(assert (=> bm!25419 (= call!25422 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279442 () Bool)

(declare-fun e!178146 () Bool)

(assert (=> b!279442 (= e!178146 call!25422)))

(declare-fun b!279443 () Bool)

(assert (=> b!279443 (= e!178147 e!178146)))

(declare-fun lt!138666 () (_ BitVec 64))

(assert (=> b!279443 (= lt!138666 (select (arr!6590 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8786 0))(
  ( (Unit!8787) )
))
(declare-fun lt!138664 () Unit!8786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13891 (_ BitVec 64) (_ BitVec 32)) Unit!8786)

(assert (=> b!279443 (= lt!138664 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138666 #b00000000000000000000000000000000))))

(assert (=> b!279443 (arrayContainsKey!0 a!3325 lt!138666 #b00000000000000000000000000000000)))

(declare-fun lt!138665 () Unit!8786)

(assert (=> b!279443 (= lt!138665 lt!138664)))

(declare-fun res!142644 () Bool)

(assert (=> b!279443 (= res!142644 (= (seekEntryOrOpen!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1713 #b00000000000000000000000000000000)))))

(assert (=> b!279443 (=> (not res!142644) (not e!178146))))

(declare-fun b!279444 () Bool)

(assert (=> b!279444 (= e!178147 call!25422)))

(assert (= (and d!65131 (not res!142645)) b!279441))

(assert (= (and b!279441 c!45951) b!279443))

(assert (= (and b!279441 (not c!45951)) b!279444))

(assert (= (and b!279443 res!142644) b!279442))

(assert (= (or b!279442 b!279444) bm!25419))

(assert (=> b!279441 m!294333))

(assert (=> b!279441 m!294333))

(assert (=> b!279441 m!294335))

(declare-fun m!294359 () Bool)

(assert (=> bm!25419 m!294359))

(assert (=> b!279443 m!294333))

(declare-fun m!294361 () Bool)

(assert (=> b!279443 m!294361))

(declare-fun m!294363 () Bool)

(assert (=> b!279443 m!294363))

(assert (=> b!279443 m!294333))

(declare-fun m!294365 () Bool)

(assert (=> b!279443 m!294365))

(assert (=> b!279332 d!65131))

(declare-fun d!65133 () Bool)

(assert (=> d!65133 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26972 d!65133))

(declare-fun d!65143 () Bool)

(assert (=> d!65143 (= (array_inv!4540 a!3325) (bvsge (size!6942 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26972 d!65143))

(declare-fun d!65145 () Bool)

(declare-fun lt!138670 () Bool)

(assert (=> d!65145 (= lt!138670 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!187 Nil!4308)))))

(declare-fun e!178159 () Bool)

(assert (=> d!65145 (= lt!138670 e!178159)))

(declare-fun res!142655 () Bool)

(assert (=> d!65145 (=> (not res!142655) (not e!178159))))

(assert (=> d!65145 (= res!142655 (is-Cons!4307 Nil!4308))))

(assert (=> d!65145 (= (contains!1945 Nil!4308 #b0000000000000000000000000000000000000000000000000000000000000000) lt!138670)))

(declare-fun b!279455 () Bool)

(declare-fun e!178158 () Bool)

(assert (=> b!279455 (= e!178159 e!178158)))

(declare-fun res!142654 () Bool)

(assert (=> b!279455 (=> res!142654 e!178158)))

(assert (=> b!279455 (= res!142654 (= (h!4977 Nil!4308) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279456 () Bool)

(assert (=> b!279456 (= e!178158 (contains!1945 (t!9385 Nil!4308) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65145 res!142655) b!279455))

(assert (= (and b!279455 (not res!142654)) b!279456))

(assert (=> d!65145 m!294353))

(declare-fun m!294377 () Bool)

(assert (=> d!65145 m!294377))

(declare-fun m!294379 () Bool)

(assert (=> b!279456 m!294379))

(assert (=> b!279339 d!65145))

(declare-fun lt!138689 () SeekEntryResult!1713)

(declare-fun b!279502 () Bool)

(declare-fun e!178195 () SeekEntryResult!1713)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13891 (_ BitVec 32)) SeekEntryResult!1713)

(assert (=> b!279502 (= e!178195 (seekKeyOrZeroReturnVacant!0 (x!27375 lt!138689) (index!9024 lt!138689) (index!9024 lt!138689) k!2581 a!3325 mask!3868))))

(declare-fun b!279503 () Bool)

(declare-fun c!45966 () Bool)

(declare-fun lt!138690 () (_ BitVec 64))

(assert (=> b!279503 (= c!45966 (= lt!138690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178193 () SeekEntryResult!1713)

(assert (=> b!279503 (= e!178193 e!178195)))

(declare-fun b!279504 () Bool)

(declare-fun e!178194 () SeekEntryResult!1713)

(assert (=> b!279504 (= e!178194 e!178193)))

(assert (=> b!279504 (= lt!138690 (select (arr!6590 a!3325) (index!9024 lt!138689)))))

(declare-fun c!45967 () Bool)

(assert (=> b!279504 (= c!45967 (= lt!138690 k!2581))))

(declare-fun b!279505 () Bool)

(assert (=> b!279505 (= e!178194 Undefined!1713)))

(declare-fun d!65147 () Bool)

(declare-fun lt!138691 () SeekEntryResult!1713)

(assert (=> d!65147 (and (or (is-Undefined!1713 lt!138691) (not (is-Found!1713 lt!138691)) (and (bvsge (index!9023 lt!138691) #b00000000000000000000000000000000) (bvslt (index!9023 lt!138691) (size!6942 a!3325)))) (or (is-Undefined!1713 lt!138691) (is-Found!1713 lt!138691) (not (is-MissingZero!1713 lt!138691)) (and (bvsge (index!9022 lt!138691) #b00000000000000000000000000000000) (bvslt (index!9022 lt!138691) (size!6942 a!3325)))) (or (is-Undefined!1713 lt!138691) (is-Found!1713 lt!138691) (is-MissingZero!1713 lt!138691) (not (is-MissingVacant!1713 lt!138691)) (and (bvsge (index!9025 lt!138691) #b00000000000000000000000000000000) (bvslt (index!9025 lt!138691) (size!6942 a!3325)))) (or (is-Undefined!1713 lt!138691) (ite (is-Found!1713 lt!138691) (= (select (arr!6590 a!3325) (index!9023 lt!138691)) k!2581) (ite (is-MissingZero!1713 lt!138691) (= (select (arr!6590 a!3325) (index!9022 lt!138691)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1713 lt!138691) (= (select (arr!6590 a!3325) (index!9025 lt!138691)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65147 (= lt!138691 e!178194)))

(declare-fun c!45965 () Bool)

(assert (=> d!65147 (= c!45965 (and (is-Intermediate!1713 lt!138689) (undefined!2525 lt!138689)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13891 (_ BitVec 32)) SeekEntryResult!1713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65147 (= lt!138689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65147 (validMask!0 mask!3868)))

(assert (=> d!65147 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!138691)))

(declare-fun b!279506 () Bool)

(assert (=> b!279506 (= e!178195 (MissingZero!1713 (index!9024 lt!138689)))))

(declare-fun b!279507 () Bool)

(assert (=> b!279507 (= e!178193 (Found!1713 (index!9024 lt!138689)))))

(assert (= (and d!65147 c!45965) b!279505))

(assert (= (and d!65147 (not c!45965)) b!279504))

(assert (= (and b!279504 c!45967) b!279507))

(assert (= (and b!279504 (not c!45967)) b!279503))

(assert (= (and b!279503 c!45966) b!279506))

(assert (= (and b!279503 (not c!45966)) b!279502))

(declare-fun m!294401 () Bool)

(assert (=> b!279502 m!294401))

(declare-fun m!294403 () Bool)

(assert (=> b!279504 m!294403))

(declare-fun m!294405 () Bool)

(assert (=> d!65147 m!294405))

(declare-fun m!294407 () Bool)

(assert (=> d!65147 m!294407))

(declare-fun m!294409 () Bool)

(assert (=> d!65147 m!294409))

(assert (=> d!65147 m!294409))

(declare-fun m!294411 () Bool)

(assert (=> d!65147 m!294411))

(declare-fun m!294413 () Bool)

(assert (=> d!65147 m!294413))

(assert (=> d!65147 m!294301))

(assert (=> b!279334 d!65147))

(declare-fun d!65157 () Bool)

(declare-fun res!142681 () Bool)

(declare-fun e!178200 () Bool)

(assert (=> d!65157 (=> res!142681 e!178200)))

(assert (=> d!65157 (= res!142681 (is-Nil!4308 Nil!4308))))

(assert (=> d!65157 (= (noDuplicate!156 Nil!4308) e!178200)))

(declare-fun b!279512 () Bool)

(declare-fun e!178201 () Bool)

(assert (=> b!279512 (= e!178200 e!178201)))

(declare-fun res!142682 () Bool)

(assert (=> b!279512 (=> (not res!142682) (not e!178201))))

(assert (=> b!279512 (= res!142682 (not (contains!1945 (t!9385 Nil!4308) (h!4977 Nil!4308))))))

(declare-fun b!279513 () Bool)

(assert (=> b!279513 (= e!178201 (noDuplicate!156 (t!9385 Nil!4308)))))

(assert (= (and d!65157 (not res!142681)) b!279512))

(assert (= (and b!279512 res!142682) b!279513))

(declare-fun m!294415 () Bool)

(assert (=> b!279512 m!294415))

(declare-fun m!294417 () Bool)

(assert (=> b!279513 m!294417))

(assert (=> b!279329 d!65157))

(declare-fun d!65159 () Bool)

(declare-fun res!142687 () Bool)

(declare-fun e!178206 () Bool)

(assert (=> d!65159 (=> res!142687 e!178206)))

(assert (=> d!65159 (= res!142687 (= (select (arr!6590 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65159 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!178206)))

(declare-fun b!279518 () Bool)

(declare-fun e!178207 () Bool)

(assert (=> b!279518 (= e!178206 e!178207)))

(declare-fun res!142688 () Bool)

(assert (=> b!279518 (=> (not res!142688) (not e!178207))))

(assert (=> b!279518 (= res!142688 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6942 a!3325)))))

(declare-fun b!279519 () Bool)

(assert (=> b!279519 (= e!178207 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65159 (not res!142687)) b!279518))

(assert (= (and b!279518 res!142688) b!279519))

(assert (=> d!65159 m!294333))

(declare-fun m!294419 () Bool)

(assert (=> b!279519 m!294419))

(assert (=> b!279340 d!65159))

(push 1)

(assert (not d!65145))

(assert (not b!279456))

(assert (not bm!25419))

(assert (not b!279502))

(assert (not b!279424))

(assert (not b!279406))

(assert (not d!65121))

(assert (not b!279512))

(assert (not d!65147))

(assert (not b!279513))

(assert (not b!279403))

(assert (not b!279519))

(assert (not b!279441))

(assert (not bm!25413))

(assert (not b!279443))

(assert (not b!279408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

