; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55256 () Bool)

(assert start!55256)

(declare-fun b!605467 () Bool)

(declare-fun res!389063 () Bool)

(declare-fun e!346540 () Bool)

(assert (=> b!605467 (=> (not res!389063) (not e!346540))))

(declare-datatypes ((array!37248 0))(
  ( (array!37249 (arr!17879 (Array (_ BitVec 32) (_ BitVec 64))) (size!18243 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37248)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605467 (= res!389063 (validKeyInArray!0 (select (arr!17879 a!2986) j!136)))))

(declare-fun e!346539 () Bool)

(declare-fun b!605468 () Bool)

(declare-fun lt!276298 () array!37248)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605468 (= e!346539 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) index!984))))

(declare-fun b!605469 () Bool)

(declare-datatypes ((Unit!19294 0))(
  ( (Unit!19295) )
))
(declare-fun e!346534 () Unit!19294)

(declare-fun Unit!19296 () Unit!19294)

(assert (=> b!605469 (= e!346534 Unit!19296)))

(declare-fun b!605471 () Bool)

(declare-fun e!346542 () Unit!19294)

(declare-fun Unit!19297 () Unit!19294)

(assert (=> b!605471 (= e!346542 Unit!19297)))

(assert (=> b!605471 false))

(declare-fun b!605472 () Bool)

(declare-fun res!389068 () Bool)

(declare-fun e!346548 () Bool)

(assert (=> b!605472 (=> (not res!389068) (not e!346548))))

(declare-datatypes ((List!11920 0))(
  ( (Nil!11917) (Cons!11916 (h!12961 (_ BitVec 64)) (t!18148 List!11920)) )
))
(declare-fun arrayNoDuplicates!0 (array!37248 (_ BitVec 32) List!11920) Bool)

(assert (=> b!605472 (= res!389068 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11917))))

(declare-fun b!605473 () Bool)

(declare-fun e!346537 () Bool)

(declare-fun e!346536 () Bool)

(assert (=> b!605473 (= e!346537 e!346536)))

(declare-fun res!389072 () Bool)

(assert (=> b!605473 (=> res!389072 e!346536)))

(declare-fun lt!276294 () (_ BitVec 64))

(declare-fun lt!276289 () (_ BitVec 64))

(assert (=> b!605473 (= res!389072 (or (not (= (select (arr!17879 a!2986) j!136) lt!276294)) (not (= (select (arr!17879 a!2986) j!136) lt!276289)) (bvsge j!136 index!984)))))

(declare-fun b!605474 () Bool)

(declare-fun res!389073 () Bool)

(assert (=> b!605474 (=> (not res!389073) (not e!346548))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37248 (_ BitVec 32)) Bool)

(assert (=> b!605474 (= res!389073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605475 () Bool)

(declare-fun e!346547 () Bool)

(declare-fun e!346541 () Bool)

(assert (=> b!605475 (= e!346547 (not e!346541))))

(declare-fun res!389057 () Bool)

(assert (=> b!605475 (=> res!389057 e!346541)))

(declare-datatypes ((SeekEntryResult!6319 0))(
  ( (MissingZero!6319 (index!27542 (_ BitVec 32))) (Found!6319 (index!27543 (_ BitVec 32))) (Intermediate!6319 (undefined!7131 Bool) (index!27544 (_ BitVec 32)) (x!56337 (_ BitVec 32))) (Undefined!6319) (MissingVacant!6319 (index!27545 (_ BitVec 32))) )
))
(declare-fun lt!276297 () SeekEntryResult!6319)

(assert (=> b!605475 (= res!389057 (not (= lt!276297 (Found!6319 index!984))))))

(declare-fun lt!276301 () Unit!19294)

(assert (=> b!605475 (= lt!276301 e!346542)))

(declare-fun c!68572 () Bool)

(assert (=> b!605475 (= c!68572 (= lt!276297 Undefined!6319))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37248 (_ BitVec 32)) SeekEntryResult!6319)

(assert (=> b!605475 (= lt!276297 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276294 lt!276298 mask!3053))))

(declare-fun e!346545 () Bool)

(assert (=> b!605475 e!346545))

(declare-fun res!389059 () Bool)

(assert (=> b!605475 (=> (not res!389059) (not e!346545))))

(declare-fun lt!276302 () (_ BitVec 32))

(declare-fun lt!276293 () SeekEntryResult!6319)

(assert (=> b!605475 (= res!389059 (= lt!276293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 lt!276294 lt!276298 mask!3053)))))

(assert (=> b!605475 (= lt!276293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!605475 (= lt!276294 (select (store (arr!17879 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276296 () Unit!19294)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19294)

(assert (=> b!605475 (= lt!276296 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605475 (= lt!276302 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605476 () Bool)

(declare-fun e!346544 () Bool)

(assert (=> b!605476 (= e!346541 e!346544)))

(declare-fun res!389067 () Bool)

(assert (=> b!605476 (=> res!389067 e!346544)))

(assert (=> b!605476 (= res!389067 (or (not (= (select (arr!17879 a!2986) j!136) lt!276294)) (not (= (select (arr!17879 a!2986) j!136) lt!276289))))))

(assert (=> b!605476 e!346537))

(declare-fun res!389074 () Bool)

(assert (=> b!605476 (=> (not res!389074) (not e!346537))))

(assert (=> b!605476 (= res!389074 (= lt!276289 (select (arr!17879 a!2986) j!136)))))

(assert (=> b!605476 (= lt!276289 (select (store (arr!17879 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!605477 () Bool)

(declare-fun e!346538 () Bool)

(assert (=> b!605477 (= e!346548 e!346538)))

(declare-fun res!389060 () Bool)

(assert (=> b!605477 (=> (not res!389060) (not e!346538))))

(assert (=> b!605477 (= res!389060 (= (select (store (arr!17879 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605477 (= lt!276298 (array!37249 (store (arr!17879 a!2986) i!1108 k!1786) (size!18243 a!2986)))))

(declare-fun b!605478 () Bool)

(declare-fun res!389065 () Bool)

(assert (=> b!605478 (=> (not res!389065) (not e!346540))))

(assert (=> b!605478 (= res!389065 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605479 () Bool)

(assert (=> b!605479 (= e!346538 e!346547)))

(declare-fun res!389071 () Bool)

(assert (=> b!605479 (=> (not res!389071) (not e!346547))))

(declare-fun lt!276304 () SeekEntryResult!6319)

(assert (=> b!605479 (= res!389071 (and (= lt!276304 (Found!6319 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17879 a!2986) index!984) (select (arr!17879 a!2986) j!136))) (not (= (select (arr!17879 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605479 (= lt!276304 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605480 () Bool)

(declare-fun Unit!19298 () Unit!19294)

(assert (=> b!605480 (= e!346534 Unit!19298)))

(declare-fun lt!276295 () Unit!19294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19294)

(assert (=> b!605480 (= lt!276295 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276298 (select (arr!17879 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605480 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276290 () Unit!19294)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11920) Unit!19294)

(assert (=> b!605480 (= lt!276290 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11917))))

(assert (=> b!605480 (arrayNoDuplicates!0 lt!276298 #b00000000000000000000000000000000 Nil!11917)))

(declare-fun lt!276291 () Unit!19294)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37248 (_ BitVec 32) (_ BitVec 32)) Unit!19294)

(assert (=> b!605480 (= lt!276291 (lemmaNoDuplicateFromThenFromBigger!0 lt!276298 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605480 (arrayNoDuplicates!0 lt!276298 j!136 Nil!11917)))

(declare-fun lt!276300 () Unit!19294)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37248 (_ BitVec 64) (_ BitVec 32) List!11920) Unit!19294)

(assert (=> b!605480 (= lt!276300 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276298 (select (arr!17879 a!2986) j!136) j!136 Nil!11917))))

(assert (=> b!605480 false))

(declare-fun b!605470 () Bool)

(assert (=> b!605470 (= e!346536 e!346539)))

(declare-fun res!389075 () Bool)

(assert (=> b!605470 (=> (not res!389075) (not e!346539))))

(assert (=> b!605470 (= res!389075 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) j!136))))

(declare-fun res!389069 () Bool)

(assert (=> start!55256 (=> (not res!389069) (not e!346540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55256 (= res!389069 (validMask!0 mask!3053))))

(assert (=> start!55256 e!346540))

(assert (=> start!55256 true))

(declare-fun array_inv!13675 (array!37248) Bool)

(assert (=> start!55256 (array_inv!13675 a!2986)))

(declare-fun b!605481 () Bool)

(assert (=> b!605481 (= e!346545 (= lt!276304 lt!276293))))

(declare-fun b!605482 () Bool)

(declare-fun e!346535 () Bool)

(assert (=> b!605482 (= e!346535 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) index!984))))

(declare-fun b!605483 () Bool)

(assert (=> b!605483 (= e!346540 e!346548)))

(declare-fun res!389070 () Bool)

(assert (=> b!605483 (=> (not res!389070) (not e!346548))))

(declare-fun lt!276299 () SeekEntryResult!6319)

(assert (=> b!605483 (= res!389070 (or (= lt!276299 (MissingZero!6319 i!1108)) (= lt!276299 (MissingVacant!6319 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37248 (_ BitVec 32)) SeekEntryResult!6319)

(assert (=> b!605483 (= lt!276299 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!605484 () Bool)

(declare-fun e!346543 () Bool)

(assert (=> b!605484 (= e!346543 (or (bvsgt #b00000000000000000000000000000000 (size!18243 a!2986)) (bvslt (size!18243 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605484 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276303 () Unit!19294)

(assert (=> b!605484 (= lt!276303 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276298 (select (arr!17879 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605484 e!346535))

(declare-fun res!389064 () Bool)

(assert (=> b!605484 (=> (not res!389064) (not e!346535))))

(assert (=> b!605484 (= res!389064 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) j!136))))

(declare-fun b!605485 () Bool)

(declare-fun res!389066 () Bool)

(assert (=> b!605485 (=> (not res!389066) (not e!346540))))

(assert (=> b!605485 (= res!389066 (validKeyInArray!0 k!1786))))

(declare-fun b!605486 () Bool)

(declare-fun res!389062 () Bool)

(assert (=> b!605486 (=> (not res!389062) (not e!346540))))

(assert (=> b!605486 (= res!389062 (and (= (size!18243 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18243 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18243 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605487 () Bool)

(assert (=> b!605487 (= e!346544 e!346543)))

(declare-fun res!389058 () Bool)

(assert (=> b!605487 (=> res!389058 e!346543)))

(assert (=> b!605487 (= res!389058 (bvsge index!984 j!136))))

(declare-fun lt!276292 () Unit!19294)

(assert (=> b!605487 (= lt!276292 e!346534)))

(declare-fun c!68573 () Bool)

(assert (=> b!605487 (= c!68573 (bvslt j!136 index!984))))

(declare-fun b!605488 () Bool)

(declare-fun Unit!19299 () Unit!19294)

(assert (=> b!605488 (= e!346542 Unit!19299)))

(declare-fun b!605489 () Bool)

(declare-fun res!389061 () Bool)

(assert (=> b!605489 (=> (not res!389061) (not e!346548))))

(assert (=> b!605489 (= res!389061 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17879 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55256 res!389069) b!605486))

(assert (= (and b!605486 res!389062) b!605467))

(assert (= (and b!605467 res!389063) b!605485))

(assert (= (and b!605485 res!389066) b!605478))

(assert (= (and b!605478 res!389065) b!605483))

(assert (= (and b!605483 res!389070) b!605474))

(assert (= (and b!605474 res!389073) b!605472))

(assert (= (and b!605472 res!389068) b!605489))

(assert (= (and b!605489 res!389061) b!605477))

(assert (= (and b!605477 res!389060) b!605479))

(assert (= (and b!605479 res!389071) b!605475))

(assert (= (and b!605475 res!389059) b!605481))

(assert (= (and b!605475 c!68572) b!605471))

(assert (= (and b!605475 (not c!68572)) b!605488))

(assert (= (and b!605475 (not res!389057)) b!605476))

(assert (= (and b!605476 res!389074) b!605473))

(assert (= (and b!605473 (not res!389072)) b!605470))

(assert (= (and b!605470 res!389075) b!605468))

(assert (= (and b!605476 (not res!389067)) b!605487))

(assert (= (and b!605487 c!68573) b!605480))

(assert (= (and b!605487 (not c!68573)) b!605469))

(assert (= (and b!605487 (not res!389058)) b!605484))

(assert (= (and b!605484 res!389064) b!605482))

(declare-fun m!582319 () Bool)

(assert (=> b!605485 m!582319))

(declare-fun m!582321 () Bool)

(assert (=> b!605483 m!582321))

(declare-fun m!582323 () Bool)

(assert (=> b!605467 m!582323))

(assert (=> b!605467 m!582323))

(declare-fun m!582325 () Bool)

(assert (=> b!605467 m!582325))

(declare-fun m!582327 () Bool)

(assert (=> start!55256 m!582327))

(declare-fun m!582329 () Bool)

(assert (=> start!55256 m!582329))

(assert (=> b!605473 m!582323))

(assert (=> b!605480 m!582323))

(declare-fun m!582331 () Bool)

(assert (=> b!605480 m!582331))

(assert (=> b!605480 m!582323))

(declare-fun m!582333 () Bool)

(assert (=> b!605480 m!582333))

(declare-fun m!582335 () Bool)

(assert (=> b!605480 m!582335))

(declare-fun m!582337 () Bool)

(assert (=> b!605480 m!582337))

(assert (=> b!605480 m!582323))

(declare-fun m!582339 () Bool)

(assert (=> b!605480 m!582339))

(assert (=> b!605480 m!582323))

(declare-fun m!582341 () Bool)

(assert (=> b!605480 m!582341))

(declare-fun m!582343 () Bool)

(assert (=> b!605480 m!582343))

(declare-fun m!582345 () Bool)

(assert (=> b!605475 m!582345))

(declare-fun m!582347 () Bool)

(assert (=> b!605475 m!582347))

(declare-fun m!582349 () Bool)

(assert (=> b!605475 m!582349))

(declare-fun m!582351 () Bool)

(assert (=> b!605475 m!582351))

(declare-fun m!582353 () Bool)

(assert (=> b!605475 m!582353))

(assert (=> b!605475 m!582323))

(declare-fun m!582355 () Bool)

(assert (=> b!605475 m!582355))

(assert (=> b!605475 m!582323))

(declare-fun m!582357 () Bool)

(assert (=> b!605475 m!582357))

(assert (=> b!605482 m!582323))

(assert (=> b!605482 m!582323))

(declare-fun m!582359 () Bool)

(assert (=> b!605482 m!582359))

(assert (=> b!605477 m!582349))

(declare-fun m!582361 () Bool)

(assert (=> b!605477 m!582361))

(assert (=> b!605484 m!582323))

(assert (=> b!605484 m!582323))

(declare-fun m!582363 () Bool)

(assert (=> b!605484 m!582363))

(assert (=> b!605484 m!582323))

(declare-fun m!582365 () Bool)

(assert (=> b!605484 m!582365))

(assert (=> b!605484 m!582323))

(declare-fun m!582367 () Bool)

(assert (=> b!605484 m!582367))

(assert (=> b!605468 m!582323))

(assert (=> b!605468 m!582323))

(assert (=> b!605468 m!582359))

(declare-fun m!582369 () Bool)

(assert (=> b!605489 m!582369))

(declare-fun m!582371 () Bool)

(assert (=> b!605472 m!582371))

(assert (=> b!605476 m!582323))

(assert (=> b!605476 m!582349))

(declare-fun m!582373 () Bool)

(assert (=> b!605476 m!582373))

(declare-fun m!582375 () Bool)

(assert (=> b!605479 m!582375))

(assert (=> b!605479 m!582323))

(assert (=> b!605479 m!582323))

(declare-fun m!582377 () Bool)

(assert (=> b!605479 m!582377))

(declare-fun m!582379 () Bool)

(assert (=> b!605474 m!582379))

(assert (=> b!605470 m!582323))

(assert (=> b!605470 m!582323))

(assert (=> b!605470 m!582367))

(declare-fun m!582381 () Bool)

(assert (=> b!605478 m!582381))

(push 1)

(assert (not b!605478))

(assert (not b!605483))

(assert (not b!605475))

(assert (not start!55256))

(assert (not b!605474))

(assert (not b!605480))

(assert (not b!605472))

(assert (not b!605485))

(assert (not b!605467))

(assert (not b!605484))

(assert (not b!605470))

(assert (not b!605468))

(assert (not b!605482))

(assert (not b!605479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87597 () Bool)

(declare-fun res!389097 () Bool)

(declare-fun e!346590 () Bool)

(assert (=> d!87597 (=> res!389097 e!346590)))

(assert (=> d!87597 (= res!389097 (bvsge #b00000000000000000000000000000000 (size!18243 a!2986)))))

(assert (=> d!87597 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11917) e!346590)))

(declare-fun bm!33038 () Bool)

(declare-fun call!33041 () Bool)

(declare-fun c!68591 () Bool)

(assert (=> bm!33038 (= call!33041 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68591 (Cons!11916 (select (arr!17879 a!2986) #b00000000000000000000000000000000) Nil!11917) Nil!11917)))))

(declare-fun b!605545 () Bool)

(declare-fun e!346587 () Bool)

(declare-fun e!346588 () Bool)

(assert (=> b!605545 (= e!346587 e!346588)))

(assert (=> b!605545 (= c!68591 (validKeyInArray!0 (select (arr!17879 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605546 () Bool)

(assert (=> b!605546 (= e!346588 call!33041)))

(declare-fun b!605547 () Bool)

(declare-fun e!346589 () Bool)

(declare-fun contains!2995 (List!11920 (_ BitVec 64)) Bool)

(assert (=> b!605547 (= e!346589 (contains!2995 Nil!11917 (select (arr!17879 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605548 () Bool)

(assert (=> b!605548 (= e!346590 e!346587)))

(declare-fun res!389098 () Bool)

(assert (=> b!605548 (=> (not res!389098) (not e!346587))))

(assert (=> b!605548 (= res!389098 (not e!346589))))

(declare-fun res!389099 () Bool)

(assert (=> b!605548 (=> (not res!389099) (not e!346589))))

(assert (=> b!605548 (= res!389099 (validKeyInArray!0 (select (arr!17879 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605549 () Bool)

(assert (=> b!605549 (= e!346588 call!33041)))

(assert (= (and d!87597 (not res!389097)) b!605548))

(assert (= (and b!605548 res!389099) b!605547))

(assert (= (and b!605548 res!389098) b!605545))

(assert (= (and b!605545 c!68591) b!605546))

(assert (= (and b!605545 (not c!68591)) b!605549))

(assert (= (or b!605546 b!605549) bm!33038))

(declare-fun m!582423 () Bool)

(assert (=> bm!33038 m!582423))

(declare-fun m!582425 () Bool)

(assert (=> bm!33038 m!582425))

(assert (=> b!605545 m!582423))

(assert (=> b!605545 m!582423))

(declare-fun m!582427 () Bool)

(assert (=> b!605545 m!582427))

(assert (=> b!605547 m!582423))

(assert (=> b!605547 m!582423))

(declare-fun m!582429 () Bool)

(assert (=> b!605547 m!582429))

(assert (=> b!605548 m!582423))

(assert (=> b!605548 m!582423))

(assert (=> b!605548 m!582427))

(assert (=> b!605472 d!87597))

(declare-fun b!605624 () Bool)

(declare-fun e!346645 () SeekEntryResult!6319)

(declare-fun lt!276347 () SeekEntryResult!6319)

(assert (=> b!605624 (= e!346645 (Found!6319 (index!27544 lt!276347)))))

(declare-fun b!605625 () Bool)

(declare-fun e!346644 () SeekEntryResult!6319)

(assert (=> b!605625 (= e!346644 Undefined!6319)))

(declare-fun e!346643 () SeekEntryResult!6319)

(declare-fun b!605626 () Bool)

(assert (=> b!605626 (= e!346643 (seekKeyOrZeroReturnVacant!0 (x!56337 lt!276347) (index!27544 lt!276347) (index!27544 lt!276347) k!1786 a!2986 mask!3053))))

(declare-fun d!87613 () Bool)

(declare-fun lt!276345 () SeekEntryResult!6319)

(assert (=> d!87613 (and (or (is-Undefined!6319 lt!276345) (not (is-Found!6319 lt!276345)) (and (bvsge (index!27543 lt!276345) #b00000000000000000000000000000000) (bvslt (index!27543 lt!276345) (size!18243 a!2986)))) (or (is-Undefined!6319 lt!276345) (is-Found!6319 lt!276345) (not (is-MissingZero!6319 lt!276345)) (and (bvsge (index!27542 lt!276345) #b00000000000000000000000000000000) (bvslt (index!27542 lt!276345) (size!18243 a!2986)))) (or (is-Undefined!6319 lt!276345) (is-Found!6319 lt!276345) (is-MissingZero!6319 lt!276345) (not (is-MissingVacant!6319 lt!276345)) (and (bvsge (index!27545 lt!276345) #b00000000000000000000000000000000) (bvslt (index!27545 lt!276345) (size!18243 a!2986)))) (or (is-Undefined!6319 lt!276345) (ite (is-Found!6319 lt!276345) (= (select (arr!17879 a!2986) (index!27543 lt!276345)) k!1786) (ite (is-MissingZero!6319 lt!276345) (= (select (arr!17879 a!2986) (index!27542 lt!276345)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6319 lt!276345) (= (select (arr!17879 a!2986) (index!27545 lt!276345)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87613 (= lt!276345 e!346644)))

(declare-fun c!68615 () Bool)

(assert (=> d!87613 (= c!68615 (and (is-Intermediate!6319 lt!276347) (undefined!7131 lt!276347)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37248 (_ BitVec 32)) SeekEntryResult!6319)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87613 (= lt!276347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87613 (validMask!0 mask!3053)))

(assert (=> d!87613 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!276345)))

(declare-fun b!605627 () Bool)

(assert (=> b!605627 (= e!346643 (MissingZero!6319 (index!27544 lt!276347)))))

(declare-fun b!605628 () Bool)

(declare-fun c!68614 () Bool)

(declare-fun lt!276346 () (_ BitVec 64))

(assert (=> b!605628 (= c!68614 (= lt!276346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605628 (= e!346645 e!346643)))

(declare-fun b!605629 () Bool)

(assert (=> b!605629 (= e!346644 e!346645)))

(assert (=> b!605629 (= lt!276346 (select (arr!17879 a!2986) (index!27544 lt!276347)))))

(declare-fun c!68616 () Bool)

(assert (=> b!605629 (= c!68616 (= lt!276346 k!1786))))

(assert (= (and d!87613 c!68615) b!605625))

(assert (= (and d!87613 (not c!68615)) b!605629))

(assert (= (and b!605629 c!68616) b!605624))

(assert (= (and b!605629 (not c!68616)) b!605628))

(assert (= (and b!605628 c!68614) b!605627))

(assert (= (and b!605628 (not c!68614)) b!605626))

(declare-fun m!582479 () Bool)

(assert (=> b!605626 m!582479))

(declare-fun m!582481 () Bool)

(assert (=> d!87613 m!582481))

(declare-fun m!582483 () Bool)

(assert (=> d!87613 m!582483))

(assert (=> d!87613 m!582327))

(assert (=> d!87613 m!582483))

(declare-fun m!582485 () Bool)

(assert (=> d!87613 m!582485))

(declare-fun m!582487 () Bool)

(assert (=> d!87613 m!582487))

(declare-fun m!582489 () Bool)

(assert (=> d!87613 m!582489))

(declare-fun m!582491 () Bool)

(assert (=> b!605629 m!582491))

(assert (=> b!605483 d!87613))

(declare-fun d!87637 () Bool)

(declare-fun res!389138 () Bool)

(declare-fun e!346662 () Bool)

(assert (=> d!87637 (=> res!389138 e!346662)))

(assert (=> d!87637 (= res!389138 (= (select (arr!17879 lt!276298) index!984) (select (arr!17879 a!2986) j!136)))))

(assert (=> d!87637 (= (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) index!984) e!346662)))

(declare-fun b!605654 () Bool)

(declare-fun e!346663 () Bool)

(assert (=> b!605654 (= e!346662 e!346663)))

(declare-fun res!389139 () Bool)

(assert (=> b!605654 (=> (not res!389139) (not e!346663))))

(assert (=> b!605654 (= res!389139 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18243 lt!276298)))))

(declare-fun b!605655 () Bool)

(assert (=> b!605655 (= e!346663 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87637 (not res!389138)) b!605654))

(assert (= (and b!605654 res!389139) b!605655))

(declare-fun m!582509 () Bool)

(assert (=> d!87637 m!582509))

(assert (=> b!605655 m!582323))

(declare-fun m!582511 () Bool)

(assert (=> b!605655 m!582511))

(assert (=> b!605482 d!87637))

(declare-fun d!87643 () Bool)

(declare-fun res!389140 () Bool)

(declare-fun e!346664 () Bool)

(assert (=> d!87643 (=> res!389140 e!346664)))

(assert (=> d!87643 (= res!389140 (= (select (arr!17879 lt!276298) j!136) (select (arr!17879 a!2986) j!136)))))

(assert (=> d!87643 (= (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) j!136) e!346664)))

(declare-fun b!605656 () Bool)

(declare-fun e!346665 () Bool)

(assert (=> b!605656 (= e!346664 e!346665)))

(declare-fun res!389141 () Bool)

(assert (=> b!605656 (=> (not res!389141) (not e!346665))))

(assert (=> b!605656 (= res!389141 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18243 lt!276298)))))

(declare-fun b!605657 () Bool)

(assert (=> b!605657 (= e!346665 (arrayContainsKey!0 lt!276298 (select (arr!17879 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87643 (not res!389140)) b!605656))

(assert (= (and b!605656 res!389141) b!605657))

(declare-fun m!582513 () Bool)

(assert (=> d!87643 m!582513))

(assert (=> b!605657 m!582323))

(declare-fun m!582515 () Bool)

(assert (=> b!605657 m!582515))

(assert (=> b!605470 d!87643))

(declare-fun b!605694 () Bool)

(declare-fun e!346690 () SeekEntryResult!6319)

(assert (=> b!605694 (= e!346690 Undefined!6319)))

(declare-fun b!605695 () Bool)

(declare-fun c!68641 () Bool)

(declare-fun lt!276375 () (_ BitVec 64))

(assert (=> b!605695 (= c!68641 (= lt!276375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346688 () SeekEntryResult!6319)

(declare-fun e!346689 () SeekEntryResult!6319)

(assert (=> b!605695 (= e!346688 e!346689)))

(declare-fun d!87645 () Bool)

(declare-fun lt!276376 () SeekEntryResult!6319)

(assert (=> d!87645 (and (or (is-Undefined!6319 lt!276376) (not (is-Found!6319 lt!276376)) (and (bvsge (index!27543 lt!276376) #b00000000000000000000000000000000) (bvslt (index!27543 lt!276376) (size!18243 lt!276298)))) (or (is-Undefined!6319 lt!276376) (is-Found!6319 lt!276376) (not (is-MissingVacant!6319 lt!276376)) (not (= (index!27545 lt!276376) vacantSpotIndex!68)) (and (bvsge (index!27545 lt!276376) #b00000000000000000000000000000000) (bvslt (index!27545 lt!276376) (size!18243 lt!276298)))) (or (is-Undefined!6319 lt!276376) (ite (is-Found!6319 lt!276376) (= (select (arr!17879 lt!276298) (index!27543 lt!276376)) lt!276294) (and (is-MissingVacant!6319 lt!276376) (= (index!27545 lt!276376) vacantSpotIndex!68) (= (select (arr!17879 lt!276298) (index!27545 lt!276376)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87645 (= lt!276376 e!346690)))

(declare-fun c!68639 () Bool)

(assert (=> d!87645 (= c!68639 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87645 (= lt!276375 (select (arr!17879 lt!276298) lt!276302))))

(assert (=> d!87645 (validMask!0 mask!3053)))

(assert (=> d!87645 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 lt!276294 lt!276298 mask!3053) lt!276376)))

(declare-fun b!605696 () Bool)

(assert (=> b!605696 (= e!346690 e!346688)))

(declare-fun c!68640 () Bool)

(assert (=> b!605696 (= c!68640 (= lt!276375 lt!276294))))

(declare-fun b!605697 () Bool)

(assert (=> b!605697 (= e!346689 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276302 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276294 lt!276298 mask!3053))))

(declare-fun b!605698 () Bool)

(assert (=> b!605698 (= e!346688 (Found!6319 lt!276302))))

(declare-fun b!605699 () Bool)

(assert (=> b!605699 (= e!346689 (MissingVacant!6319 vacantSpotIndex!68))))

(assert (= (and d!87645 c!68639) b!605694))

(assert (= (and d!87645 (not c!68639)) b!605696))

(assert (= (and b!605696 c!68640) b!605698))

(assert (= (and b!605696 (not c!68640)) b!605695))

(assert (= (and b!605695 c!68641) b!605699))

(assert (= (and b!605695 (not c!68641)) b!605697))

(declare-fun m!582553 () Bool)

(assert (=> d!87645 m!582553))

(declare-fun m!582555 () Bool)

(assert (=> d!87645 m!582555))

(declare-fun m!582557 () Bool)

(assert (=> d!87645 m!582557))

(assert (=> d!87645 m!582327))

(declare-fun m!582559 () Bool)

(assert (=> b!605697 m!582559))

(assert (=> b!605697 m!582559))

(declare-fun m!582561 () Bool)

(assert (=> b!605697 m!582561))

(assert (=> b!605475 d!87645))

(declare-fun d!87663 () Bool)

(declare-fun lt!276379 () (_ BitVec 32))

(assert (=> d!87663 (and (bvsge lt!276379 #b00000000000000000000000000000000) (bvslt lt!276379 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87663 (= lt!276379 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87663 (validMask!0 mask!3053)))

(assert (=> d!87663 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276379)))

(declare-fun bs!18525 () Bool)

(assert (= bs!18525 d!87663))

(declare-fun m!582563 () Bool)

(assert (=> bs!18525 m!582563))

(assert (=> bs!18525 m!582327))

(assert (=> b!605475 d!87663))

(declare-fun d!87665 () Bool)

(declare-fun e!346712 () Bool)

(assert (=> d!87665 e!346712))

(declare-fun res!389156 () Bool)

(assert (=> d!87665 (=> (not res!389156) (not e!346712))))

(assert (=> d!87665 (= res!389156 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18243 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18243 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18243 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18243 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18243 a!2986))))))

(declare-fun lt!276398 () Unit!19294)

(declare-fun choose!9 (array!37248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19294)

(assert (=> d!87665 (= lt!276398 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87665 (validMask!0 mask!3053)))

(assert (=> d!87665 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 mask!3053) lt!276398)))

(declare-fun b!605736 () Bool)

(assert (=> b!605736 (= e!346712 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 (select (store (arr!17879 a!2986) i!1108 k!1786) j!136) (array!37249 (store (arr!17879 a!2986) i!1108 k!1786) (size!18243 a!2986)) mask!3053)))))

(assert (= (and d!87665 res!389156) b!605736))

(declare-fun m!582587 () Bool)

(assert (=> d!87665 m!582587))

(assert (=> d!87665 m!582327))

(assert (=> b!605736 m!582349))

(assert (=> b!605736 m!582323))

(assert (=> b!605736 m!582347))

(assert (=> b!605736 m!582347))

(declare-fun m!582589 () Bool)

(assert (=> b!605736 m!582589))

(assert (=> b!605736 m!582323))

(assert (=> b!605736 m!582355))

(assert (=> b!605475 d!87665))

(declare-fun b!605737 () Bool)

(declare-fun e!346715 () SeekEntryResult!6319)

(assert (=> b!605737 (= e!346715 Undefined!6319)))

(declare-fun b!605738 () Bool)

(declare-fun c!68659 () Bool)

(declare-fun lt!276399 () (_ BitVec 64))

(assert (=> b!605738 (= c!68659 (= lt!276399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346713 () SeekEntryResult!6319)

(declare-fun e!346714 () SeekEntryResult!6319)

(assert (=> b!605738 (= e!346713 e!346714)))

(declare-fun lt!276400 () SeekEntryResult!6319)

(declare-fun d!87675 () Bool)

(assert (=> d!87675 (and (or (is-Undefined!6319 lt!276400) (not (is-Found!6319 lt!276400)) (and (bvsge (index!27543 lt!276400) #b00000000000000000000000000000000) (bvslt (index!27543 lt!276400) (size!18243 a!2986)))) (or (is-Undefined!6319 lt!276400) (is-Found!6319 lt!276400) (not (is-MissingVacant!6319 lt!276400)) (not (= (index!27545 lt!276400) vacantSpotIndex!68)) (and (bvsge (index!27545 lt!276400) #b00000000000000000000000000000000) (bvslt (index!27545 lt!276400) (size!18243 a!2986)))) (or (is-Undefined!6319 lt!276400) (ite (is-Found!6319 lt!276400) (= (select (arr!17879 a!2986) (index!27543 lt!276400)) (select (arr!17879 a!2986) j!136)) (and (is-MissingVacant!6319 lt!276400) (= (index!27545 lt!276400) vacantSpotIndex!68) (= (select (arr!17879 a!2986) (index!27545 lt!276400)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87675 (= lt!276400 e!346715)))

(declare-fun c!68657 () Bool)

(assert (=> d!87675 (= c!68657 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87675 (= lt!276399 (select (arr!17879 a!2986) lt!276302))))

(assert (=> d!87675 (validMask!0 mask!3053)))

(assert (=> d!87675 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276302 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053) lt!276400)))

(declare-fun b!605739 () Bool)

(assert (=> b!605739 (= e!346715 e!346713)))

(declare-fun c!68658 () Bool)

(assert (=> b!605739 (= c!68658 (= lt!276399 (select (arr!17879 a!2986) j!136)))))

(declare-fun b!605740 () Bool)

(assert (=> b!605740 (= e!346714 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276302 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605741 () Bool)

(assert (=> b!605741 (= e!346713 (Found!6319 lt!276302))))

(declare-fun b!605742 () Bool)

(assert (=> b!605742 (= e!346714 (MissingVacant!6319 vacantSpotIndex!68))))

(assert (= (and d!87675 c!68657) b!605737))

(assert (= (and d!87675 (not c!68657)) b!605739))

(assert (= (and b!605739 c!68658) b!605741))

(assert (= (and b!605739 (not c!68658)) b!605738))

(assert (= (and b!605738 c!68659) b!605742))

(assert (= (and b!605738 (not c!68659)) b!605740))

(declare-fun m!582591 () Bool)

(assert (=> d!87675 m!582591))

(declare-fun m!582593 () Bool)

(assert (=> d!87675 m!582593))

(declare-fun m!582595 () Bool)

(assert (=> d!87675 m!582595))

(assert (=> d!87675 m!582327))

(assert (=> b!605740 m!582559))

(assert (=> b!605740 m!582559))

(assert (=> b!605740 m!582323))

(declare-fun m!582597 () Bool)

(assert (=> b!605740 m!582597))

(assert (=> b!605475 d!87675))

(declare-fun b!605743 () Bool)

(declare-fun e!346718 () SeekEntryResult!6319)

(assert (=> b!605743 (= e!346718 Undefined!6319)))

(declare-fun b!605744 () Bool)

(declare-fun c!68662 () Bool)

(declare-fun lt!276401 () (_ BitVec 64))

(assert (=> b!605744 (= c!68662 (= lt!276401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346716 () SeekEntryResult!6319)

(declare-fun e!346717 () SeekEntryResult!6319)

(assert (=> b!605744 (= e!346716 e!346717)))

(declare-fun d!87677 () Bool)

(declare-fun lt!276402 () SeekEntryResult!6319)

(assert (=> d!87677 (and (or (is-Undefined!6319 lt!276402) (not (is-Found!6319 lt!276402)) (and (bvsge (index!27543 lt!276402) #b00000000000000000000000000000000) (bvslt (index!27543 lt!276402) (size!18243 lt!276298)))) (or (is-Undefined!6319 lt!276402) (is-Found!6319 lt!276402) (not (is-MissingVacant!6319 lt!276402)) (not (= (index!27545 lt!276402) vacantSpotIndex!68)) (and (bvsge (index!27545 lt!276402) #b00000000000000000000000000000000) (bvslt (index!27545 lt!276402) (size!18243 lt!276298)))) (or (is-Undefined!6319 lt!276402) (ite (is-Found!6319 lt!276402) (= (select (arr!17879 lt!276298) (index!27543 lt!276402)) lt!276294) (and (is-MissingVacant!6319 lt!276402) (= (index!27545 lt!276402) vacantSpotIndex!68) (= (select (arr!17879 lt!276298) (index!27545 lt!276402)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87677 (= lt!276402 e!346718)))

(declare-fun c!68660 () Bool)

(assert (=> d!87677 (= c!68660 (bvsge x!910 #b01111111111111111111111111111110))))

