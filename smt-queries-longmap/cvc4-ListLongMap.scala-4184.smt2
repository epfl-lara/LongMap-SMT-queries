; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57024 () Bool)

(assert start!57024)

(declare-fun b!631453 () Bool)

(declare-fun e!361022 () Bool)

(declare-fun e!361023 () Bool)

(assert (=> b!631453 (= e!361022 e!361023)))

(declare-fun res!408349 () Bool)

(assert (=> b!631453 (=> (not res!408349) (not e!361023))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38100 0))(
  ( (array!38101 (arr!18284 (Array (_ BitVec 32) (_ BitVec 64))) (size!18648 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38100)

(assert (=> b!631453 (= res!408349 (= (select (store (arr!18284 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291753 () array!38100)

(assert (=> b!631453 (= lt!291753 (array!38101 (store (arr!18284 a!2986) i!1108 k!1786) (size!18648 a!2986)))))

(declare-fun res!408348 () Bool)

(declare-fun e!361017 () Bool)

(assert (=> start!57024 (=> (not res!408348) (not e!361017))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57024 (= res!408348 (validMask!0 mask!3053))))

(assert (=> start!57024 e!361017))

(assert (=> start!57024 true))

(declare-fun array_inv!14080 (array!38100) Bool)

(assert (=> start!57024 (array_inv!14080 a!2986)))

(declare-fun b!631454 () Bool)

(assert (=> b!631454 (= e!361017 e!361022)))

(declare-fun res!408345 () Bool)

(assert (=> b!631454 (=> (not res!408345) (not e!361022))))

(declare-datatypes ((SeekEntryResult!6724 0))(
  ( (MissingZero!6724 (index!29186 (_ BitVec 32))) (Found!6724 (index!29187 (_ BitVec 32))) (Intermediate!6724 (undefined!7536 Bool) (index!29188 (_ BitVec 32)) (x!57918 (_ BitVec 32))) (Undefined!6724) (MissingVacant!6724 (index!29189 (_ BitVec 32))) )
))
(declare-fun lt!291756 () SeekEntryResult!6724)

(assert (=> b!631454 (= res!408345 (or (= lt!291756 (MissingZero!6724 i!1108)) (= lt!291756 (MissingVacant!6724 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38100 (_ BitVec 32)) SeekEntryResult!6724)

(assert (=> b!631454 (= lt!291756 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631455 () Bool)

(declare-fun e!361018 () Bool)

(assert (=> b!631455 (= e!361023 e!361018)))

(declare-fun res!408353 () Bool)

(assert (=> b!631455 (=> (not res!408353) (not e!361018))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!291757 () SeekEntryResult!6724)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631455 (= res!408353 (and (= lt!291757 (Found!6724 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18284 a!2986) index!984) (select (arr!18284 a!2986) j!136))) (not (= (select (arr!18284 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38100 (_ BitVec 32)) SeekEntryResult!6724)

(assert (=> b!631455 (= lt!291757 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18284 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631456 () Bool)

(declare-fun res!408355 () Bool)

(assert (=> b!631456 (=> (not res!408355) (not e!361017))))

(assert (=> b!631456 (= res!408355 (and (= (size!18648 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18648 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18648 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631457 () Bool)

(declare-datatypes ((Unit!21230 0))(
  ( (Unit!21231) )
))
(declare-fun e!361021 () Unit!21230)

(declare-fun Unit!21232 () Unit!21230)

(assert (=> b!631457 (= e!361021 Unit!21232)))

(declare-fun b!631458 () Bool)

(declare-fun e!361019 () Bool)

(declare-fun lt!291758 () SeekEntryResult!6724)

(assert (=> b!631458 (= e!361019 (= lt!291757 lt!291758))))

(declare-fun b!631459 () Bool)

(declare-fun res!408347 () Bool)

(assert (=> b!631459 (=> (not res!408347) (not e!361017))))

(declare-fun arrayContainsKey!0 (array!38100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631459 (= res!408347 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631460 () Bool)

(declare-fun Unit!21233 () Unit!21230)

(assert (=> b!631460 (= e!361021 Unit!21233)))

(assert (=> b!631460 false))

(declare-fun b!631461 () Bool)

(declare-fun res!408346 () Bool)

(assert (=> b!631461 (=> (not res!408346) (not e!361017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631461 (= res!408346 (validKeyInArray!0 k!1786))))

(declare-fun b!631462 () Bool)

(declare-fun lt!291760 () SeekEntryResult!6724)

(assert (=> b!631462 (= e!361018 (not (or (not (= lt!291760 (Found!6724 index!984))) (= (select (store (arr!18284 a!2986) i!1108 k!1786) index!984) (select (arr!18284 a!2986) j!136)))))))

(declare-fun lt!291759 () Unit!21230)

(assert (=> b!631462 (= lt!291759 e!361021)))

(declare-fun c!71921 () Bool)

(assert (=> b!631462 (= c!71921 (= lt!291760 Undefined!6724))))

(declare-fun lt!291755 () (_ BitVec 64))

(assert (=> b!631462 (= lt!291760 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291755 lt!291753 mask!3053))))

(assert (=> b!631462 e!361019))

(declare-fun res!408354 () Bool)

(assert (=> b!631462 (=> (not res!408354) (not e!361019))))

(declare-fun lt!291752 () (_ BitVec 32))

(assert (=> b!631462 (= res!408354 (= lt!291758 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291752 vacantSpotIndex!68 lt!291755 lt!291753 mask!3053)))))

(assert (=> b!631462 (= lt!291758 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291752 vacantSpotIndex!68 (select (arr!18284 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631462 (= lt!291755 (select (store (arr!18284 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291754 () Unit!21230)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38100 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21230)

(assert (=> b!631462 (= lt!291754 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291752 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631462 (= lt!291752 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631463 () Bool)

(declare-fun res!408352 () Bool)

(assert (=> b!631463 (=> (not res!408352) (not e!361017))))

(assert (=> b!631463 (= res!408352 (validKeyInArray!0 (select (arr!18284 a!2986) j!136)))))

(declare-fun b!631464 () Bool)

(declare-fun res!408350 () Bool)

(assert (=> b!631464 (=> (not res!408350) (not e!361022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38100 (_ BitVec 32)) Bool)

(assert (=> b!631464 (= res!408350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631465 () Bool)

(declare-fun res!408356 () Bool)

(assert (=> b!631465 (=> (not res!408356) (not e!361022))))

(assert (=> b!631465 (= res!408356 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18284 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631466 () Bool)

(declare-fun res!408351 () Bool)

(assert (=> b!631466 (=> (not res!408351) (not e!361022))))

(declare-datatypes ((List!12325 0))(
  ( (Nil!12322) (Cons!12321 (h!13366 (_ BitVec 64)) (t!18553 List!12325)) )
))
(declare-fun arrayNoDuplicates!0 (array!38100 (_ BitVec 32) List!12325) Bool)

(assert (=> b!631466 (= res!408351 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12322))))

(assert (= (and start!57024 res!408348) b!631456))

(assert (= (and b!631456 res!408355) b!631463))

(assert (= (and b!631463 res!408352) b!631461))

(assert (= (and b!631461 res!408346) b!631459))

(assert (= (and b!631459 res!408347) b!631454))

(assert (= (and b!631454 res!408345) b!631464))

(assert (= (and b!631464 res!408350) b!631466))

(assert (= (and b!631466 res!408351) b!631465))

(assert (= (and b!631465 res!408356) b!631453))

(assert (= (and b!631453 res!408349) b!631455))

(assert (= (and b!631455 res!408353) b!631462))

(assert (= (and b!631462 res!408354) b!631458))

(assert (= (and b!631462 c!71921) b!631460))

(assert (= (and b!631462 (not c!71921)) b!631457))

(declare-fun m!606387 () Bool)

(assert (=> b!631466 m!606387))

(declare-fun m!606389 () Bool)

(assert (=> start!57024 m!606389))

(declare-fun m!606391 () Bool)

(assert (=> start!57024 m!606391))

(declare-fun m!606393 () Bool)

(assert (=> b!631464 m!606393))

(declare-fun m!606395 () Bool)

(assert (=> b!631465 m!606395))

(declare-fun m!606397 () Bool)

(assert (=> b!631463 m!606397))

(assert (=> b!631463 m!606397))

(declare-fun m!606399 () Bool)

(assert (=> b!631463 m!606399))

(declare-fun m!606401 () Bool)

(assert (=> b!631455 m!606401))

(assert (=> b!631455 m!606397))

(assert (=> b!631455 m!606397))

(declare-fun m!606403 () Bool)

(assert (=> b!631455 m!606403))

(declare-fun m!606405 () Bool)

(assert (=> b!631453 m!606405))

(declare-fun m!606407 () Bool)

(assert (=> b!631453 m!606407))

(declare-fun m!606409 () Bool)

(assert (=> b!631459 m!606409))

(declare-fun m!606411 () Bool)

(assert (=> b!631462 m!606411))

(declare-fun m!606413 () Bool)

(assert (=> b!631462 m!606413))

(declare-fun m!606415 () Bool)

(assert (=> b!631462 m!606415))

(assert (=> b!631462 m!606397))

(assert (=> b!631462 m!606405))

(declare-fun m!606417 () Bool)

(assert (=> b!631462 m!606417))

(declare-fun m!606419 () Bool)

(assert (=> b!631462 m!606419))

(declare-fun m!606421 () Bool)

(assert (=> b!631462 m!606421))

(assert (=> b!631462 m!606397))

(declare-fun m!606423 () Bool)

(assert (=> b!631462 m!606423))

(declare-fun m!606425 () Bool)

(assert (=> b!631454 m!606425))

(declare-fun m!606427 () Bool)

(assert (=> b!631461 m!606427))

(push 1)

(assert (not b!631462))

(assert (not b!631464))

(assert (not b!631459))

(assert (not b!631455))

(assert (not b!631461))

(assert (not b!631454))

(assert (not b!631463))

(assert (not b!631466))

(assert (not start!57024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!631555 () Bool)

(declare-fun e!361080 () SeekEntryResult!6724)

(assert (=> b!631555 (= e!361080 Undefined!6724)))

(declare-fun b!631556 () Bool)

(declare-fun c!71956 () Bool)

(declare-fun lt!291794 () (_ BitVec 64))

(assert (=> b!631556 (= c!71956 (= lt!291794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361079 () SeekEntryResult!6724)

(declare-fun e!361078 () SeekEntryResult!6724)

(assert (=> b!631556 (= e!361079 e!361078)))

(declare-fun b!631557 () Bool)

(assert (=> b!631557 (= e!361080 e!361079)))

(declare-fun c!71957 () Bool)

(assert (=> b!631557 (= c!71957 (= lt!291794 (select (arr!18284 a!2986) j!136)))))

(declare-fun b!631558 () Bool)

(assert (=> b!631558 (= e!361078 (MissingVacant!6724 vacantSpotIndex!68))))

(declare-fun b!631559 () Bool)

(assert (=> b!631559 (= e!361079 (Found!6724 index!984))))

(declare-fun b!631554 () Bool)

(assert (=> b!631554 (= e!361078 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18284 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!89341 () Bool)

(declare-fun lt!291793 () SeekEntryResult!6724)

(assert (=> d!89341 (and (or (is-Undefined!6724 lt!291793) (not (is-Found!6724 lt!291793)) (and (bvsge (index!29187 lt!291793) #b00000000000000000000000000000000) (bvslt (index!29187 lt!291793) (size!18648 a!2986)))) (or (is-Undefined!6724 lt!291793) (is-Found!6724 lt!291793) (not (is-MissingVacant!6724 lt!291793)) (not (= (index!29189 lt!291793) vacantSpotIndex!68)) (and (bvsge (index!29189 lt!291793) #b00000000000000000000000000000000) (bvslt (index!29189 lt!291793) (size!18648 a!2986)))) (or (is-Undefined!6724 lt!291793) (ite (is-Found!6724 lt!291793) (= (select (arr!18284 a!2986) (index!29187 lt!291793)) (select (arr!18284 a!2986) j!136)) (and (is-MissingVacant!6724 lt!291793) (= (index!29189 lt!291793) vacantSpotIndex!68) (= (select (arr!18284 a!2986) (index!29189 lt!291793)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89341 (= lt!291793 e!361080)))

(declare-fun c!71955 () Bool)

(assert (=> d!89341 (= c!71955 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89341 (= lt!291794 (select (arr!18284 a!2986) index!984))))

(assert (=> d!89341 (validMask!0 mask!3053)))

(assert (=> d!89341 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18284 a!2986) j!136) a!2986 mask!3053) lt!291793)))

(assert (= (and d!89341 c!71955) b!631555))

(assert (= (and d!89341 (not c!71955)) b!631557))

(assert (= (and b!631557 c!71957) b!631559))

(assert (= (and b!631557 (not c!71957)) b!631556))

(assert (= (and b!631556 c!71956) b!631558))

(assert (= (and b!631556 (not c!71956)) b!631554))

(assert (=> b!631554 m!606413))

(assert (=> b!631554 m!606413))

(assert (=> b!631554 m!606397))

(declare-fun m!606477 () Bool)

(assert (=> b!631554 m!606477))

(declare-fun m!606479 () Bool)

(assert (=> d!89341 m!606479))

(declare-fun m!606481 () Bool)

(assert (=> d!89341 m!606481))

(assert (=> d!89341 m!606401))

(assert (=> d!89341 m!606389))

(assert (=> b!631455 d!89341))

(declare-fun b!631578 () Bool)

(declare-fun e!361096 () Bool)

(declare-fun call!33335 () Bool)

(assert (=> b!631578 (= e!361096 call!33335)))

(declare-fun b!631579 () Bool)

(declare-fun e!361094 () Bool)

(declare-fun contains!3089 (List!12325 (_ BitVec 64)) Bool)

(assert (=> b!631579 (= e!361094 (contains!3089 Nil!12322 (select (arr!18284 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631580 () Bool)

(assert (=> b!631580 (= e!361096 call!33335)))

(declare-fun b!631581 () Bool)

(declare-fun e!361097 () Bool)

(declare-fun e!361095 () Bool)

(assert (=> b!631581 (= e!361097 e!361095)))

(declare-fun res!408387 () Bool)

(assert (=> b!631581 (=> (not res!408387) (not e!361095))))

(assert (=> b!631581 (= res!408387 (not e!361094))))

(declare-fun res!408388 () Bool)

(assert (=> b!631581 (=> (not res!408388) (not e!361094))))

(assert (=> b!631581 (= res!408388 (validKeyInArray!0 (select (arr!18284 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89345 () Bool)

(declare-fun res!408386 () Bool)

(assert (=> d!89345 (=> res!408386 e!361097)))

(assert (=> d!89345 (= res!408386 (bvsge #b00000000000000000000000000000000 (size!18648 a!2986)))))

(assert (=> d!89345 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12322) e!361097)))

(declare-fun bm!33332 () Bool)

(declare-fun c!71963 () Bool)

(assert (=> bm!33332 (= call!33335 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71963 (Cons!12321 (select (arr!18284 a!2986) #b00000000000000000000000000000000) Nil!12322) Nil!12322)))))

(declare-fun b!631582 () Bool)

(assert (=> b!631582 (= e!361095 e!361096)))

(assert (=> b!631582 (= c!71963 (validKeyInArray!0 (select (arr!18284 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89345 (not res!408386)) b!631581))

(assert (= (and b!631581 res!408388) b!631579))

(assert (= (and b!631581 res!408387) b!631582))

(assert (= (and b!631582 c!71963) b!631578))

(assert (= (and b!631582 (not c!71963)) b!631580))

(assert (= (or b!631578 b!631580) bm!33332))

(declare-fun m!606497 () Bool)

(assert (=> b!631579 m!606497))

(assert (=> b!631579 m!606497))

(declare-fun m!606499 () Bool)

(assert (=> b!631579 m!606499))

(assert (=> b!631581 m!606497))

(assert (=> b!631581 m!606497))

(declare-fun m!606501 () Bool)

(assert (=> b!631581 m!606501))

(assert (=> bm!33332 m!606497))

(declare-fun m!606503 () Bool)

(assert (=> bm!33332 m!606503))

(assert (=> b!631582 m!606497))

(assert (=> b!631582 m!606497))

(assert (=> b!631582 m!606501))

(assert (=> b!631466 d!89345))

(declare-fun d!89349 () Bool)

(assert (=> d!89349 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631461 d!89349))

(declare-fun b!631606 () Bool)

(declare-fun e!361114 () Bool)

(declare-fun e!361115 () Bool)

(assert (=> b!631606 (= e!361114 e!361115)))

(declare-fun lt!291817 () (_ BitVec 64))

(assert (=> b!631606 (= lt!291817 (select (arr!18284 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291815 () Unit!21230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38100 (_ BitVec 64) (_ BitVec 32)) Unit!21230)

(assert (=> b!631606 (= lt!291815 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291817 #b00000000000000000000000000000000))))

(assert (=> b!631606 (arrayContainsKey!0 a!2986 lt!291817 #b00000000000000000000000000000000)))

(declare-fun lt!291816 () Unit!21230)

(assert (=> b!631606 (= lt!291816 lt!291815)))

(declare-fun res!408399 () Bool)

(assert (=> b!631606 (= res!408399 (= (seekEntryOrOpen!0 (select (arr!18284 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6724 #b00000000000000000000000000000000)))))

(assert (=> b!631606 (=> (not res!408399) (not e!361115))))

(declare-fun b!631607 () Bool)

(declare-fun call!33340 () Bool)

(assert (=> b!631607 (= e!361115 call!33340)))

(declare-fun d!89353 () Bool)

(declare-fun res!408398 () Bool)

(declare-fun e!361116 () Bool)

(assert (=> d!89353 (=> res!408398 e!361116)))

(assert (=> d!89353 (= res!408398 (bvsge #b00000000000000000000000000000000 (size!18648 a!2986)))))

(assert (=> d!89353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361116)))

(declare-fun bm!33337 () Bool)

(assert (=> bm!33337 (= call!33340 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!631608 () Bool)

(assert (=> b!631608 (= e!361116 e!361114)))

(declare-fun c!71971 () Bool)

(assert (=> b!631608 (= c!71971 (validKeyInArray!0 (select (arr!18284 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631609 () Bool)

(assert (=> b!631609 (= e!361114 call!33340)))

(assert (= (and d!89353 (not res!408398)) b!631608))

(assert (= (and b!631608 c!71971) b!631606))

(assert (= (and b!631608 (not c!71971)) b!631609))

(assert (= (and b!631606 res!408399) b!631607))

(assert (= (or b!631607 b!631609) bm!33337))

(assert (=> b!631606 m!606497))

(declare-fun m!606517 () Bool)

(assert (=> b!631606 m!606517))

(declare-fun m!606519 () Bool)

(assert (=> b!631606 m!606519))

(assert (=> b!631606 m!606497))

(declare-fun m!606521 () Bool)

(assert (=> b!631606 m!606521))

(declare-fun m!606523 () Bool)

(assert (=> bm!33337 m!606523))

(assert (=> b!631608 m!606497))

(assert (=> b!631608 m!606497))

(assert (=> b!631608 m!606501))

(assert (=> b!631464 d!89353))

(declare-fun d!89357 () Bool)

(declare-fun res!408404 () Bool)

(declare-fun e!361121 () Bool)

(assert (=> d!89357 (=> res!408404 e!361121)))

(assert (=> d!89357 (= res!408404 (= (select (arr!18284 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89357 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!361121)))

(declare-fun b!631614 () Bool)

(declare-fun e!361122 () Bool)

(assert (=> b!631614 (= e!361121 e!361122)))

(declare-fun res!408405 () Bool)

(assert (=> b!631614 (=> (not res!408405) (not e!361122))))

(assert (=> b!631614 (= res!408405 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18648 a!2986)))))

(declare-fun b!631615 () Bool)

(assert (=> b!631615 (= e!361122 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89357 (not res!408404)) b!631614))

(assert (= (and b!631614 res!408405) b!631615))

(assert (=> d!89357 m!606497))

(declare-fun m!606525 () Bool)

(assert (=> b!631615 m!606525))

(assert (=> b!631459 d!89357))

(declare-fun b!631656 () Bool)

(declare-fun e!361146 () SeekEntryResult!6724)

(declare-fun lt!291839 () SeekEntryResult!6724)

(assert (=> b!631656 (= e!361146 (MissingZero!6724 (index!29188 lt!291839)))))

(declare-fun b!631658 () Bool)

(declare-fun e!361144 () SeekEntryResult!6724)

(assert (=> b!631658 (= e!361144 (Found!6724 (index!29188 lt!291839)))))

(declare-fun b!631659 () Bool)

(assert (=> b!631659 (= e!361146 (seekKeyOrZeroReturnVacant!0 (x!57918 lt!291839) (index!29188 lt!291839) (index!29188 lt!291839) k!1786 a!2986 mask!3053))))

(declare-fun b!631660 () Bool)

(declare-fun e!361145 () SeekEntryResult!6724)

(assert (=> b!631660 (= e!361145 e!361144)))

(declare-fun lt!291837 () (_ BitVec 64))

(assert (=> b!631660 (= lt!291837 (select (arr!18284 a!2986) (index!29188 lt!291839)))))

(declare-fun c!71991 () Bool)

(assert (=> b!631660 (= c!71991 (= lt!291837 k!1786))))

(declare-fun b!631661 () Bool)

(assert (=> b!631661 (= e!361145 Undefined!6724)))

(declare-fun b!631657 () Bool)

(declare-fun c!71992 () Bool)

(assert (=> b!631657 (= c!71992 (= lt!291837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631657 (= e!361144 e!361146)))

(declare-fun d!89359 () Bool)

(declare-fun lt!291838 () SeekEntryResult!6724)

(assert (=> d!89359 (and (or (is-Undefined!6724 lt!291838) (not (is-Found!6724 lt!291838)) (and (bvsge (index!29187 lt!291838) #b00000000000000000000000000000000) (bvslt (index!29187 lt!291838) (size!18648 a!2986)))) (or (is-Undefined!6724 lt!291838) (is-Found!6724 lt!291838) (not (is-MissingZero!6724 lt!291838)) (and (bvsge (index!29186 lt!291838) #b00000000000000000000000000000000) (bvslt (index!29186 lt!291838) (size!18648 a!2986)))) (or (is-Undefined!6724 lt!291838) (is-Found!6724 lt!291838) (is-MissingZero!6724 lt!291838) (not (is-MissingVacant!6724 lt!291838)) (and (bvsge (index!29189 lt!291838) #b00000000000000000000000000000000) (bvslt (index!29189 lt!291838) (size!18648 a!2986)))) (or (is-Undefined!6724 lt!291838) (ite (is-Found!6724 lt!291838) (= (select (arr!18284 a!2986) (index!29187 lt!291838)) k!1786) (ite (is-MissingZero!6724 lt!291838) (= (select (arr!18284 a!2986) (index!29186 lt!291838)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6724 lt!291838) (= (select (arr!18284 a!2986) (index!29189 lt!291838)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89359 (= lt!291838 e!361145)))

(declare-fun c!71993 () Bool)

(assert (=> d!89359 (= c!71993 (and (is-Intermediate!6724 lt!291839) (undefined!7536 lt!291839)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38100 (_ BitVec 32)) SeekEntryResult!6724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89359 (= lt!291839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89359 (validMask!0 mask!3053)))

(assert (=> d!89359 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!291838)))

(assert (= (and d!89359 c!71993) b!631661))

(assert (= (and d!89359 (not c!71993)) b!631660))

(assert (= (and b!631660 c!71991) b!631658))

(assert (= (and b!631660 (not c!71991)) b!631657))

(assert (= (and b!631657 c!71992) b!631656))

(assert (= (and b!631657 (not c!71992)) b!631659))

(declare-fun m!606535 () Bool)

(assert (=> b!631659 m!606535))

(declare-fun m!606537 () Bool)

(assert (=> b!631660 m!606537))

(declare-fun m!606539 () Bool)

(assert (=> d!89359 m!606539))

(declare-fun m!606541 () Bool)

(assert (=> d!89359 m!606541))

(declare-fun m!606543 () Bool)

(assert (=> d!89359 m!606543))

(assert (=> d!89359 m!606541))

(assert (=> d!89359 m!606389))

(declare-fun m!606545 () Bool)

(assert (=> d!89359 m!606545))

(declare-fun m!606547 () Bool)

(assert (=> d!89359 m!606547))

(assert (=> b!631454 d!89359))

(declare-fun d!89363 () Bool)

(assert (=> d!89363 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57024 d!89363))

(declare-fun d!89373 () Bool)

(assert (=> d!89373 (= (array_inv!14080 a!2986) (bvsge (size!18648 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57024 d!89373))

(declare-fun d!89375 () Bool)

(assert (=> d!89375 (= (validKeyInArray!0 (select (arr!18284 a!2986) j!136)) (and (not (= (select (arr!18284 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18284 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631463 d!89375))

(declare-fun b!631696 () Bool)

(declare-fun e!361170 () SeekEntryResult!6724)

(assert (=> b!631696 (= e!361170 Undefined!6724)))

(declare-fun b!631697 () Bool)

(declare-fun c!72007 () Bool)

(declare-fun lt!291851 () (_ BitVec 64))

(assert (=> b!631697 (= c!72007 (= lt!291851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361169 () SeekEntryResult!6724)

(declare-fun e!361168 () SeekEntryResult!6724)

(assert (=> b!631697 (= e!361169 e!361168)))

(declare-fun b!631698 () Bool)

(assert (=> b!631698 (= e!361170 e!361169)))

(declare-fun c!72008 () Bool)

(assert (=> b!631698 (= c!72008 (= lt!291851 lt!291755))))

(declare-fun b!631699 () Bool)

(assert (=> b!631699 (= e!361168 (MissingVacant!6724 vacantSpotIndex!68))))

(declare-fun b!631700 () Bool)

(assert (=> b!631700 (= e!361169 (Found!6724 index!984))))

(declare-fun b!631695 () Bool)

(assert (=> b!631695 (= e!361168 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!291755 lt!291753 mask!3053))))

(declare-fun lt!291850 () SeekEntryResult!6724)

(declare-fun d!89377 () Bool)

(assert (=> d!89377 (and (or (is-Undefined!6724 lt!291850) (not (is-Found!6724 lt!291850)) (and (bvsge (index!29187 lt!291850) #b00000000000000000000000000000000) (bvslt (index!29187 lt!291850) (size!18648 lt!291753)))) (or (is-Undefined!6724 lt!291850) (is-Found!6724 lt!291850) (not (is-MissingVacant!6724 lt!291850)) (not (= (index!29189 lt!291850) vacantSpotIndex!68)) (and (bvsge (index!29189 lt!291850) #b00000000000000000000000000000000) (bvslt (index!29189 lt!291850) (size!18648 lt!291753)))) (or (is-Undefined!6724 lt!291850) (ite (is-Found!6724 lt!291850) (= (select (arr!18284 lt!291753) (index!29187 lt!291850)) lt!291755) (and (is-MissingVacant!6724 lt!291850) (= (index!29189 lt!291850) vacantSpotIndex!68) (= (select (arr!18284 lt!291753) (index!29189 lt!291850)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89377 (= lt!291850 e!361170)))

(declare-fun c!72006 () Bool)

(assert (=> d!89377 (= c!72006 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89377 (= lt!291851 (select (arr!18284 lt!291753) index!984))))

(assert (=> d!89377 (validMask!0 mask!3053)))

(assert (=> d!89377 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291755 lt!291753 mask!3053) lt!291850)))

