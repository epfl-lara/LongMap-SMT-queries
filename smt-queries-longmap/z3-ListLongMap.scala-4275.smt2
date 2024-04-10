; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59560 () Bool)

(assert start!59560)

(declare-fun b!657404 () Bool)

(declare-fun e!377642 () Bool)

(declare-fun e!377646 () Bool)

(assert (=> b!657404 (= e!377642 e!377646)))

(declare-fun res!426303 () Bool)

(assert (=> b!657404 (=> (not res!426303) (not e!377646))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38718 0))(
  ( (array!38719 (arr!18556 (Array (_ BitVec 32) (_ BitVec 64))) (size!18920 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38718)

(assert (=> b!657404 (= res!426303 (= (select (store (arr!18556 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!307032 () array!38718)

(assert (=> b!657404 (= lt!307032 (array!38719 (store (arr!18556 a!2986) i!1108 k0!1786) (size!18920 a!2986)))))

(declare-fun b!657405 () Bool)

(declare-fun res!426300 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657405 (= res!426300 (bvsge j!136 index!984))))

(declare-fun e!377648 () Bool)

(assert (=> b!657405 (=> res!426300 e!377648)))

(declare-fun e!377639 () Bool)

(assert (=> b!657405 (= e!377639 e!377648)))

(declare-fun b!657406 () Bool)

(declare-fun res!426297 () Bool)

(declare-fun e!377647 () Bool)

(assert (=> b!657406 (=> (not res!426297) (not e!377647))))

(declare-fun arrayContainsKey!0 (array!38718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657406 (= res!426297 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657407 () Bool)

(declare-fun res!426306 () Bool)

(assert (=> b!657407 (=> (not res!426306) (not e!377647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657407 (= res!426306 (validKeyInArray!0 k0!1786))))

(declare-fun b!657408 () Bool)

(declare-fun e!377641 () Bool)

(declare-datatypes ((SeekEntryResult!6996 0))(
  ( (MissingZero!6996 (index!30349 (_ BitVec 32))) (Found!6996 (index!30350 (_ BitVec 32))) (Intermediate!6996 (undefined!7808 Bool) (index!30351 (_ BitVec 32)) (x!59143 (_ BitVec 32))) (Undefined!6996) (MissingVacant!6996 (index!30352 (_ BitVec 32))) )
))
(declare-fun lt!307035 () SeekEntryResult!6996)

(declare-fun lt!307039 () SeekEntryResult!6996)

(assert (=> b!657408 (= e!377641 (= lt!307035 lt!307039))))

(declare-fun e!377649 () Bool)

(declare-fun b!657409 () Bool)

(assert (=> b!657409 (= e!377649 (arrayContainsKey!0 lt!307032 (select (arr!18556 a!2986) j!136) index!984))))

(declare-fun b!657410 () Bool)

(declare-datatypes ((Unit!22714 0))(
  ( (Unit!22715) )
))
(declare-fun e!377644 () Unit!22714)

(declare-fun Unit!22716 () Unit!22714)

(assert (=> b!657410 (= e!377644 Unit!22716)))

(declare-fun b!657411 () Bool)

(declare-fun e!377640 () Unit!22714)

(declare-fun Unit!22717 () Unit!22714)

(assert (=> b!657411 (= e!377640 Unit!22717)))

(declare-fun b!657412 () Bool)

(declare-fun e!377650 () Bool)

(assert (=> b!657412 (= e!377646 e!377650)))

(declare-fun res!426296 () Bool)

(assert (=> b!657412 (=> (not res!426296) (not e!377650))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657412 (= res!426296 (and (= lt!307035 (Found!6996 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18556 a!2986) index!984) (select (arr!18556 a!2986) j!136))) (not (= (select (arr!18556 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38718 (_ BitVec 32)) SeekEntryResult!6996)

(assert (=> b!657412 (= lt!307035 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18556 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657414 () Bool)

(declare-fun e!377638 () Unit!22714)

(declare-fun Unit!22718 () Unit!22714)

(assert (=> b!657414 (= e!377638 Unit!22718)))

(declare-fun b!657415 () Bool)

(declare-fun res!426298 () Bool)

(assert (=> b!657415 (= res!426298 (arrayContainsKey!0 lt!307032 (select (arr!18556 a!2986) j!136) j!136))))

(assert (=> b!657415 (=> (not res!426298) (not e!377649))))

(assert (=> b!657415 (= e!377648 e!377649)))

(declare-fun b!657416 () Bool)

(assert (=> b!657416 false))

(declare-fun lt!307048 () Unit!22714)

(declare-datatypes ((List!12597 0))(
  ( (Nil!12594) (Cons!12593 (h!13638 (_ BitVec 64)) (t!18825 List!12597)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38718 (_ BitVec 64) (_ BitVec 32) List!12597) Unit!22714)

(assert (=> b!657416 (= lt!307048 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307032 (select (arr!18556 a!2986) j!136) j!136 Nil!12594))))

(declare-fun arrayNoDuplicates!0 (array!38718 (_ BitVec 32) List!12597) Bool)

(assert (=> b!657416 (arrayNoDuplicates!0 lt!307032 j!136 Nil!12594)))

(declare-fun lt!307034 () Unit!22714)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38718 (_ BitVec 32) (_ BitVec 32)) Unit!22714)

(assert (=> b!657416 (= lt!307034 (lemmaNoDuplicateFromThenFromBigger!0 lt!307032 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657416 (arrayNoDuplicates!0 lt!307032 #b00000000000000000000000000000000 Nil!12594)))

(declare-fun lt!307044 () Unit!22714)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38718 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12597) Unit!22714)

(assert (=> b!657416 (= lt!307044 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12594))))

(assert (=> b!657416 (arrayContainsKey!0 lt!307032 (select (arr!18556 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307040 () Unit!22714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38718 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22714)

(assert (=> b!657416 (= lt!307040 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307032 (select (arr!18556 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22719 () Unit!22714)

(assert (=> b!657416 (= e!377640 Unit!22719)))

(declare-fun b!657417 () Bool)

(declare-fun res!426294 () Bool)

(assert (=> b!657417 (=> (not res!426294) (not e!377642))))

(assert (=> b!657417 (= res!426294 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12594))))

(declare-fun b!657418 () Bool)

(declare-fun e!377643 () Unit!22714)

(declare-fun Unit!22720 () Unit!22714)

(assert (=> b!657418 (= e!377643 Unit!22720)))

(declare-fun b!657419 () Bool)

(declare-fun res!426302 () Bool)

(assert (=> b!657419 (=> (not res!426302) (not e!377647))))

(assert (=> b!657419 (= res!426302 (validKeyInArray!0 (select (arr!18556 a!2986) j!136)))))

(declare-fun b!657420 () Bool)

(declare-fun Unit!22721 () Unit!22714)

(assert (=> b!657420 (= e!377638 Unit!22721)))

(assert (=> b!657420 false))

(declare-fun b!657421 () Bool)

(declare-fun Unit!22722 () Unit!22714)

(assert (=> b!657421 (= e!377644 Unit!22722)))

(declare-fun res!426295 () Bool)

(assert (=> b!657421 (= res!426295 (= (select (store (arr!18556 a!2986) i!1108 k0!1786) index!984) (select (arr!18556 a!2986) j!136)))))

(assert (=> b!657421 (=> (not res!426295) (not e!377639))))

(assert (=> b!657421 e!377639))

(declare-fun c!75924 () Bool)

(assert (=> b!657421 (= c!75924 (bvslt j!136 index!984))))

(declare-fun lt!307046 () Unit!22714)

(assert (=> b!657421 (= lt!307046 e!377640)))

(declare-fun c!75925 () Bool)

(assert (=> b!657421 (= c!75925 (bvslt index!984 j!136))))

(declare-fun lt!307029 () Unit!22714)

(assert (=> b!657421 (= lt!307029 e!377643)))

(assert (=> b!657421 false))

(declare-fun b!657422 () Bool)

(declare-fun e!377645 () Bool)

(assert (=> b!657422 (= e!377650 (not e!377645))))

(declare-fun res!426293 () Bool)

(assert (=> b!657422 (=> res!426293 e!377645)))

(declare-fun lt!307045 () SeekEntryResult!6996)

(assert (=> b!657422 (= res!426293 (not (= lt!307045 (MissingVacant!6996 vacantSpotIndex!68))))))

(declare-fun lt!307031 () Unit!22714)

(assert (=> b!657422 (= lt!307031 e!377644)))

(declare-fun c!75923 () Bool)

(assert (=> b!657422 (= c!75923 (= lt!307045 (Found!6996 index!984)))))

(declare-fun lt!307047 () Unit!22714)

(assert (=> b!657422 (= lt!307047 e!377638)))

(declare-fun c!75926 () Bool)

(assert (=> b!657422 (= c!75926 (= lt!307045 Undefined!6996))))

(declare-fun lt!307037 () (_ BitVec 64))

(assert (=> b!657422 (= lt!307045 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307037 lt!307032 mask!3053))))

(assert (=> b!657422 e!377641))

(declare-fun res!426301 () Bool)

(assert (=> b!657422 (=> (not res!426301) (not e!377641))))

(declare-fun lt!307038 () (_ BitVec 32))

(assert (=> b!657422 (= res!426301 (= lt!307039 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307038 vacantSpotIndex!68 lt!307037 lt!307032 mask!3053)))))

(assert (=> b!657422 (= lt!307039 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307038 vacantSpotIndex!68 (select (arr!18556 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657422 (= lt!307037 (select (store (arr!18556 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307042 () Unit!22714)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38718 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22714)

(assert (=> b!657422 (= lt!307042 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307038 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657422 (= lt!307038 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657423 () Bool)

(assert (=> b!657423 (= e!377645 true)))

(assert (=> b!657423 (= (select (store (arr!18556 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!426307 () Bool)

(assert (=> start!59560 (=> (not res!426307) (not e!377647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59560 (= res!426307 (validMask!0 mask!3053))))

(assert (=> start!59560 e!377647))

(assert (=> start!59560 true))

(declare-fun array_inv!14352 (array!38718) Bool)

(assert (=> start!59560 (array_inv!14352 a!2986)))

(declare-fun b!657413 () Bool)

(assert (=> b!657413 (= e!377647 e!377642)))

(declare-fun res!426299 () Bool)

(assert (=> b!657413 (=> (not res!426299) (not e!377642))))

(declare-fun lt!307043 () SeekEntryResult!6996)

(assert (=> b!657413 (= res!426299 (or (= lt!307043 (MissingZero!6996 i!1108)) (= lt!307043 (MissingVacant!6996 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38718 (_ BitVec 32)) SeekEntryResult!6996)

(assert (=> b!657413 (= lt!307043 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657424 () Bool)

(assert (=> b!657424 false))

(declare-fun lt!307033 () Unit!22714)

(assert (=> b!657424 (= lt!307033 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307032 (select (arr!18556 a!2986) j!136) index!984 Nil!12594))))

(assert (=> b!657424 (arrayNoDuplicates!0 lt!307032 index!984 Nil!12594)))

(declare-fun lt!307041 () Unit!22714)

(assert (=> b!657424 (= lt!307041 (lemmaNoDuplicateFromThenFromBigger!0 lt!307032 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657424 (arrayNoDuplicates!0 lt!307032 #b00000000000000000000000000000000 Nil!12594)))

(declare-fun lt!307030 () Unit!22714)

(assert (=> b!657424 (= lt!307030 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12594))))

(assert (=> b!657424 (arrayContainsKey!0 lt!307032 (select (arr!18556 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307036 () Unit!22714)

(assert (=> b!657424 (= lt!307036 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307032 (select (arr!18556 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377652 () Bool)

(assert (=> b!657424 e!377652))

(declare-fun res!426292 () Bool)

(assert (=> b!657424 (=> (not res!426292) (not e!377652))))

(assert (=> b!657424 (= res!426292 (arrayContainsKey!0 lt!307032 (select (arr!18556 a!2986) j!136) j!136))))

(declare-fun Unit!22723 () Unit!22714)

(assert (=> b!657424 (= e!377643 Unit!22723)))

(declare-fun b!657425 () Bool)

(declare-fun res!426304 () Bool)

(assert (=> b!657425 (=> (not res!426304) (not e!377642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38718 (_ BitVec 32)) Bool)

(assert (=> b!657425 (= res!426304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657426 () Bool)

(declare-fun res!426308 () Bool)

(assert (=> b!657426 (=> (not res!426308) (not e!377647))))

(assert (=> b!657426 (= res!426308 (and (= (size!18920 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18920 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18920 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657427 () Bool)

(assert (=> b!657427 (= e!377652 (arrayContainsKey!0 lt!307032 (select (arr!18556 a!2986) j!136) index!984))))

(declare-fun b!657428 () Bool)

(declare-fun res!426305 () Bool)

(assert (=> b!657428 (=> (not res!426305) (not e!377642))))

(assert (=> b!657428 (= res!426305 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18556 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59560 res!426307) b!657426))

(assert (= (and b!657426 res!426308) b!657419))

(assert (= (and b!657419 res!426302) b!657407))

(assert (= (and b!657407 res!426306) b!657406))

(assert (= (and b!657406 res!426297) b!657413))

(assert (= (and b!657413 res!426299) b!657425))

(assert (= (and b!657425 res!426304) b!657417))

(assert (= (and b!657417 res!426294) b!657428))

(assert (= (and b!657428 res!426305) b!657404))

(assert (= (and b!657404 res!426303) b!657412))

(assert (= (and b!657412 res!426296) b!657422))

(assert (= (and b!657422 res!426301) b!657408))

(assert (= (and b!657422 c!75926) b!657420))

(assert (= (and b!657422 (not c!75926)) b!657414))

(assert (= (and b!657422 c!75923) b!657421))

(assert (= (and b!657422 (not c!75923)) b!657410))

(assert (= (and b!657421 res!426295) b!657405))

(assert (= (and b!657405 (not res!426300)) b!657415))

(assert (= (and b!657415 res!426298) b!657409))

(assert (= (and b!657421 c!75924) b!657416))

(assert (= (and b!657421 (not c!75924)) b!657411))

(assert (= (and b!657421 c!75925) b!657424))

(assert (= (and b!657421 (not c!75925)) b!657418))

(assert (= (and b!657424 res!426292) b!657427))

(assert (= (and b!657422 (not res!426293)) b!657423))

(declare-fun m!630447 () Bool)

(assert (=> b!657417 m!630447))

(declare-fun m!630449 () Bool)

(assert (=> b!657407 m!630449))

(declare-fun m!630451 () Bool)

(assert (=> b!657424 m!630451))

(declare-fun m!630453 () Bool)

(assert (=> b!657424 m!630453))

(declare-fun m!630455 () Bool)

(assert (=> b!657424 m!630455))

(assert (=> b!657424 m!630451))

(declare-fun m!630457 () Bool)

(assert (=> b!657424 m!630457))

(assert (=> b!657424 m!630451))

(declare-fun m!630459 () Bool)

(assert (=> b!657424 m!630459))

(declare-fun m!630461 () Bool)

(assert (=> b!657424 m!630461))

(declare-fun m!630463 () Bool)

(assert (=> b!657424 m!630463))

(declare-fun m!630465 () Bool)

(assert (=> b!657424 m!630465))

(assert (=> b!657424 m!630451))

(assert (=> b!657424 m!630451))

(declare-fun m!630467 () Bool)

(assert (=> b!657424 m!630467))

(declare-fun m!630469 () Bool)

(assert (=> b!657422 m!630469))

(declare-fun m!630471 () Bool)

(assert (=> b!657422 m!630471))

(assert (=> b!657422 m!630451))

(declare-fun m!630473 () Bool)

(assert (=> b!657422 m!630473))

(declare-fun m!630475 () Bool)

(assert (=> b!657422 m!630475))

(declare-fun m!630477 () Bool)

(assert (=> b!657422 m!630477))

(declare-fun m!630479 () Bool)

(assert (=> b!657422 m!630479))

(assert (=> b!657422 m!630451))

(declare-fun m!630481 () Bool)

(assert (=> b!657422 m!630481))

(declare-fun m!630483 () Bool)

(assert (=> b!657412 m!630483))

(assert (=> b!657412 m!630451))

(assert (=> b!657412 m!630451))

(declare-fun m!630485 () Bool)

(assert (=> b!657412 m!630485))

(declare-fun m!630487 () Bool)

(assert (=> b!657416 m!630487))

(assert (=> b!657416 m!630463))

(assert (=> b!657416 m!630451))

(declare-fun m!630489 () Bool)

(assert (=> b!657416 m!630489))

(assert (=> b!657416 m!630451))

(declare-fun m!630491 () Bool)

(assert (=> b!657416 m!630491))

(assert (=> b!657416 m!630451))

(declare-fun m!630493 () Bool)

(assert (=> b!657416 m!630493))

(assert (=> b!657416 m!630451))

(declare-fun m!630495 () Bool)

(assert (=> b!657416 m!630495))

(assert (=> b!657416 m!630461))

(assert (=> b!657419 m!630451))

(assert (=> b!657419 m!630451))

(declare-fun m!630497 () Bool)

(assert (=> b!657419 m!630497))

(declare-fun m!630499 () Bool)

(assert (=> b!657428 m!630499))

(assert (=> b!657421 m!630473))

(declare-fun m!630501 () Bool)

(assert (=> b!657421 m!630501))

(assert (=> b!657421 m!630451))

(declare-fun m!630503 () Bool)

(assert (=> b!657406 m!630503))

(assert (=> b!657423 m!630473))

(assert (=> b!657423 m!630501))

(assert (=> b!657427 m!630451))

(assert (=> b!657427 m!630451))

(declare-fun m!630505 () Bool)

(assert (=> b!657427 m!630505))

(assert (=> b!657409 m!630451))

(assert (=> b!657409 m!630451))

(assert (=> b!657409 m!630505))

(assert (=> b!657404 m!630473))

(declare-fun m!630507 () Bool)

(assert (=> b!657404 m!630507))

(declare-fun m!630509 () Bool)

(assert (=> b!657425 m!630509))

(assert (=> b!657415 m!630451))

(assert (=> b!657415 m!630451))

(assert (=> b!657415 m!630453))

(declare-fun m!630511 () Bool)

(assert (=> start!59560 m!630511))

(declare-fun m!630513 () Bool)

(assert (=> start!59560 m!630513))

(declare-fun m!630515 () Bool)

(assert (=> b!657413 m!630515))

(check-sat (not b!657416) (not b!657417) (not b!657427) (not b!657422) (not b!657407) (not b!657419) (not b!657415) (not b!657413) (not b!657425) (not start!59560) (not b!657409) (not b!657424) (not b!657406) (not b!657412))
(check-sat)
