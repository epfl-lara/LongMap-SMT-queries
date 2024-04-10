; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56084 () Bool)

(assert start!56084)

(declare-fun b!618473 () Bool)

(declare-fun res!398473 () Bool)

(declare-fun e!354680 () Bool)

(assert (=> b!618473 (=> (not res!398473) (not e!354680))))

(declare-datatypes ((array!37554 0))(
  ( (array!37555 (arr!18023 (Array (_ BitVec 32) (_ BitVec 64))) (size!18387 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37554)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37554 (_ BitVec 32)) Bool)

(assert (=> b!618473 (= res!398473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun lt!285139 () array!37554)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!618474 () Bool)

(declare-fun e!354673 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618474 (= e!354673 (arrayContainsKey!0 lt!285139 (select (arr!18023 a!2986) j!136) index!984))))

(declare-fun b!618475 () Bool)

(declare-fun res!398479 () Bool)

(assert (=> b!618475 (=> (not res!398479) (not e!354680))))

(declare-datatypes ((List!12064 0))(
  ( (Nil!12061) (Cons!12060 (h!13105 (_ BitVec 64)) (t!18292 List!12064)) )
))
(declare-fun arrayNoDuplicates!0 (array!37554 (_ BitVec 32) List!12064) Bool)

(assert (=> b!618475 (= res!398479 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12061))))

(declare-fun b!618476 () Bool)

(declare-fun res!398467 () Bool)

(assert (=> b!618476 (= res!398467 (arrayContainsKey!0 lt!285139 (select (arr!18023 a!2986) j!136) j!136))))

(assert (=> b!618476 (=> (not res!398467) (not e!354673))))

(declare-fun e!354683 () Bool)

(assert (=> b!618476 (= e!354683 e!354673)))

(declare-fun b!618477 () Bool)

(declare-fun e!354682 () Bool)

(declare-fun e!354676 () Bool)

(assert (=> b!618477 (= e!354682 e!354676)))

(declare-fun res!398471 () Bool)

(assert (=> b!618477 (=> (not res!398471) (not e!354676))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6463 0))(
  ( (MissingZero!6463 (index!28136 (_ BitVec 32))) (Found!6463 (index!28137 (_ BitVec 32))) (Intermediate!6463 (undefined!7275 Bool) (index!28138 (_ BitVec 32)) (x!56919 (_ BitVec 32))) (Undefined!6463) (MissingVacant!6463 (index!28139 (_ BitVec 32))) )
))
(declare-fun lt!285151 () SeekEntryResult!6463)

(assert (=> b!618477 (= res!398471 (and (= lt!285151 (Found!6463 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18023 a!2986) index!984) (select (arr!18023 a!2986) j!136))) (not (= (select (arr!18023 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37554 (_ BitVec 32)) SeekEntryResult!6463)

(assert (=> b!618477 (= lt!285151 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18023 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618478 () Bool)

(declare-fun res!398476 () Bool)

(assert (=> b!618478 (=> (not res!398476) (not e!354680))))

(assert (=> b!618478 (= res!398476 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18023 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618479 () Bool)

(declare-datatypes ((Unit!20358 0))(
  ( (Unit!20359) )
))
(declare-fun e!354677 () Unit!20358)

(declare-fun Unit!20360 () Unit!20358)

(assert (=> b!618479 (= e!354677 Unit!20360)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!398470 () Bool)

(assert (=> b!618479 (= res!398470 (= (select (store (arr!18023 a!2986) i!1108 k!1786) index!984) (select (arr!18023 a!2986) j!136)))))

(declare-fun e!354675 () Bool)

(assert (=> b!618479 (=> (not res!398470) (not e!354675))))

(assert (=> b!618479 e!354675))

(declare-fun c!70373 () Bool)

(assert (=> b!618479 (= c!70373 (bvslt j!136 index!984))))

(declare-fun lt!285152 () Unit!20358)

(declare-fun e!354681 () Unit!20358)

(assert (=> b!618479 (= lt!285152 e!354681)))

(declare-fun c!70371 () Bool)

(assert (=> b!618479 (= c!70371 (bvslt index!984 j!136))))

(declare-fun lt!285147 () Unit!20358)

(declare-fun e!354674 () Unit!20358)

(assert (=> b!618479 (= lt!285147 e!354674)))

(assert (=> b!618479 false))

(declare-fun b!618480 () Bool)

(declare-fun e!354678 () Bool)

(assert (=> b!618480 (= e!354678 e!354680)))

(declare-fun res!398469 () Bool)

(assert (=> b!618480 (=> (not res!398469) (not e!354680))))

(declare-fun lt!285145 () SeekEntryResult!6463)

(assert (=> b!618480 (= res!398469 (or (= lt!285145 (MissingZero!6463 i!1108)) (= lt!285145 (MissingVacant!6463 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37554 (_ BitVec 32)) SeekEntryResult!6463)

(assert (=> b!618480 (= lt!285145 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618481 () Bool)

(assert (=> b!618481 false))

(declare-fun lt!285155 () Unit!20358)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37554 (_ BitVec 64) (_ BitVec 32) List!12064) Unit!20358)

(assert (=> b!618481 (= lt!285155 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285139 (select (arr!18023 a!2986) j!136) j!136 Nil!12061))))

(assert (=> b!618481 (arrayNoDuplicates!0 lt!285139 j!136 Nil!12061)))

(declare-fun lt!285150 () Unit!20358)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37554 (_ BitVec 32) (_ BitVec 32)) Unit!20358)

(assert (=> b!618481 (= lt!285150 (lemmaNoDuplicateFromThenFromBigger!0 lt!285139 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618481 (arrayNoDuplicates!0 lt!285139 #b00000000000000000000000000000000 Nil!12061)))

(declare-fun lt!285153 () Unit!20358)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37554 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12064) Unit!20358)

(assert (=> b!618481 (= lt!285153 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12061))))

(assert (=> b!618481 (arrayContainsKey!0 lt!285139 (select (arr!18023 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285140 () Unit!20358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37554 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20358)

(assert (=> b!618481 (= lt!285140 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285139 (select (arr!18023 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20361 () Unit!20358)

(assert (=> b!618481 (= e!354681 Unit!20361)))

(declare-fun b!618482 () Bool)

(declare-fun e!354684 () Unit!20358)

(declare-fun Unit!20362 () Unit!20358)

(assert (=> b!618482 (= e!354684 Unit!20362)))

(declare-fun res!398481 () Bool)

(assert (=> start!56084 (=> (not res!398481) (not e!354678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56084 (= res!398481 (validMask!0 mask!3053))))

(assert (=> start!56084 e!354678))

(assert (=> start!56084 true))

(declare-fun array_inv!13819 (array!37554) Bool)

(assert (=> start!56084 (array_inv!13819 a!2986)))

(declare-fun b!618483 () Bool)

(declare-fun e!354679 () Bool)

(declare-fun lt!285143 () SeekEntryResult!6463)

(assert (=> b!618483 (= e!354679 (= lt!285151 lt!285143))))

(declare-fun b!618484 () Bool)

(declare-fun res!398475 () Bool)

(assert (=> b!618484 (=> (not res!398475) (not e!354678))))

(assert (=> b!618484 (= res!398475 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618485 () Bool)

(declare-fun Unit!20363 () Unit!20358)

(assert (=> b!618485 (= e!354677 Unit!20363)))

(declare-fun b!618486 () Bool)

(declare-fun res!398478 () Bool)

(assert (=> b!618486 (=> (not res!398478) (not e!354678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618486 (= res!398478 (validKeyInArray!0 (select (arr!18023 a!2986) j!136)))))

(declare-fun b!618487 () Bool)

(declare-fun Unit!20364 () Unit!20358)

(assert (=> b!618487 (= e!354681 Unit!20364)))

(declare-fun b!618488 () Bool)

(declare-fun Unit!20365 () Unit!20358)

(assert (=> b!618488 (= e!354674 Unit!20365)))

(declare-fun b!618489 () Bool)

(declare-fun res!398480 () Bool)

(assert (=> b!618489 (= res!398480 (bvsge j!136 index!984))))

(assert (=> b!618489 (=> res!398480 e!354683)))

(assert (=> b!618489 (= e!354675 e!354683)))

(declare-fun b!618490 () Bool)

(declare-fun res!398474 () Bool)

(assert (=> b!618490 (=> (not res!398474) (not e!354678))))

(assert (=> b!618490 (= res!398474 (and (= (size!18387 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18387 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18387 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618491 () Bool)

(declare-fun res!398483 () Bool)

(assert (=> b!618491 (=> (not res!398483) (not e!354678))))

(assert (=> b!618491 (= res!398483 (validKeyInArray!0 k!1786))))

(declare-fun b!618492 () Bool)

(assert (=> b!618492 (= e!354680 e!354682)))

(declare-fun res!398472 () Bool)

(assert (=> b!618492 (=> (not res!398472) (not e!354682))))

(assert (=> b!618492 (= res!398472 (= (select (store (arr!18023 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618492 (= lt!285139 (array!37555 (store (arr!18023 a!2986) i!1108 k!1786) (size!18387 a!2986)))))

(declare-fun b!618493 () Bool)

(declare-fun e!354685 () Bool)

(assert (=> b!618493 (= e!354676 (not e!354685))))

(declare-fun res!398482 () Bool)

(assert (=> b!618493 (=> res!398482 e!354685)))

(declare-fun lt!285154 () SeekEntryResult!6463)

(assert (=> b!618493 (= res!398482 (not (= lt!285154 (MissingVacant!6463 vacantSpotIndex!68))))))

(declare-fun lt!285144 () Unit!20358)

(assert (=> b!618493 (= lt!285144 e!354677)))

(declare-fun c!70372 () Bool)

(assert (=> b!618493 (= c!70372 (= lt!285154 (Found!6463 index!984)))))

(declare-fun lt!285148 () Unit!20358)

(assert (=> b!618493 (= lt!285148 e!354684)))

(declare-fun c!70370 () Bool)

(assert (=> b!618493 (= c!70370 (= lt!285154 Undefined!6463))))

(declare-fun lt!285146 () (_ BitVec 64))

(assert (=> b!618493 (= lt!285154 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285146 lt!285139 mask!3053))))

(assert (=> b!618493 e!354679))

(declare-fun res!398477 () Bool)

(assert (=> b!618493 (=> (not res!398477) (not e!354679))))

(declare-fun lt!285149 () (_ BitVec 32))

(assert (=> b!618493 (= res!398477 (= lt!285143 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285149 vacantSpotIndex!68 lt!285146 lt!285139 mask!3053)))))

(assert (=> b!618493 (= lt!285143 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285149 vacantSpotIndex!68 (select (arr!18023 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618493 (= lt!285146 (select (store (arr!18023 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285138 () Unit!20358)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37554 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20358)

(assert (=> b!618493 (= lt!285138 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285149 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618493 (= lt!285149 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618494 () Bool)

(assert (=> b!618494 (= e!354685 true)))

(assert (=> b!618494 (= (select (store (arr!18023 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618495 () Bool)

(assert (=> b!618495 false))

(declare-fun lt!285157 () Unit!20358)

(assert (=> b!618495 (= lt!285157 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285139 (select (arr!18023 a!2986) j!136) index!984 Nil!12061))))

(assert (=> b!618495 (arrayNoDuplicates!0 lt!285139 index!984 Nil!12061)))

(declare-fun lt!285156 () Unit!20358)

(assert (=> b!618495 (= lt!285156 (lemmaNoDuplicateFromThenFromBigger!0 lt!285139 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618495 (arrayNoDuplicates!0 lt!285139 #b00000000000000000000000000000000 Nil!12061)))

(declare-fun lt!285142 () Unit!20358)

(assert (=> b!618495 (= lt!285142 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12061))))

(assert (=> b!618495 (arrayContainsKey!0 lt!285139 (select (arr!18023 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285141 () Unit!20358)

(assert (=> b!618495 (= lt!285141 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285139 (select (arr!18023 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354687 () Bool)

(assert (=> b!618495 e!354687))

(declare-fun res!398468 () Bool)

(assert (=> b!618495 (=> (not res!398468) (not e!354687))))

(assert (=> b!618495 (= res!398468 (arrayContainsKey!0 lt!285139 (select (arr!18023 a!2986) j!136) j!136))))

(declare-fun Unit!20366 () Unit!20358)

(assert (=> b!618495 (= e!354674 Unit!20366)))

(declare-fun b!618496 () Bool)

(assert (=> b!618496 (= e!354687 (arrayContainsKey!0 lt!285139 (select (arr!18023 a!2986) j!136) index!984))))

(declare-fun b!618497 () Bool)

(declare-fun Unit!20367 () Unit!20358)

(assert (=> b!618497 (= e!354684 Unit!20367)))

(assert (=> b!618497 false))

(assert (= (and start!56084 res!398481) b!618490))

(assert (= (and b!618490 res!398474) b!618486))

(assert (= (and b!618486 res!398478) b!618491))

(assert (= (and b!618491 res!398483) b!618484))

(assert (= (and b!618484 res!398475) b!618480))

(assert (= (and b!618480 res!398469) b!618473))

(assert (= (and b!618473 res!398473) b!618475))

(assert (= (and b!618475 res!398479) b!618478))

(assert (= (and b!618478 res!398476) b!618492))

(assert (= (and b!618492 res!398472) b!618477))

(assert (= (and b!618477 res!398471) b!618493))

(assert (= (and b!618493 res!398477) b!618483))

(assert (= (and b!618493 c!70370) b!618497))

(assert (= (and b!618493 (not c!70370)) b!618482))

(assert (= (and b!618493 c!70372) b!618479))

(assert (= (and b!618493 (not c!70372)) b!618485))

(assert (= (and b!618479 res!398470) b!618489))

(assert (= (and b!618489 (not res!398480)) b!618476))

(assert (= (and b!618476 res!398467) b!618474))

(assert (= (and b!618479 c!70373) b!618481))

(assert (= (and b!618479 (not c!70373)) b!618487))

(assert (= (and b!618479 c!70371) b!618495))

(assert (= (and b!618479 (not c!70371)) b!618488))

(assert (= (and b!618495 res!398468) b!618496))

(assert (= (and b!618493 (not res!398482)) b!618494))

(declare-fun m!594511 () Bool)

(assert (=> b!618486 m!594511))

(assert (=> b!618486 m!594511))

(declare-fun m!594513 () Bool)

(assert (=> b!618486 m!594513))

(assert (=> b!618495 m!594511))

(declare-fun m!594515 () Bool)

(assert (=> b!618495 m!594515))

(assert (=> b!618495 m!594511))

(declare-fun m!594517 () Bool)

(assert (=> b!618495 m!594517))

(assert (=> b!618495 m!594511))

(declare-fun m!594519 () Bool)

(assert (=> b!618495 m!594519))

(assert (=> b!618495 m!594511))

(declare-fun m!594521 () Bool)

(assert (=> b!618495 m!594521))

(declare-fun m!594523 () Bool)

(assert (=> b!618495 m!594523))

(assert (=> b!618495 m!594511))

(declare-fun m!594525 () Bool)

(assert (=> b!618495 m!594525))

(declare-fun m!594527 () Bool)

(assert (=> b!618495 m!594527))

(declare-fun m!594529 () Bool)

(assert (=> b!618495 m!594529))

(declare-fun m!594531 () Bool)

(assert (=> b!618492 m!594531))

(declare-fun m!594533 () Bool)

(assert (=> b!618492 m!594533))

(declare-fun m!594535 () Bool)

(assert (=> b!618480 m!594535))

(declare-fun m!594537 () Bool)

(assert (=> start!56084 m!594537))

(declare-fun m!594539 () Bool)

(assert (=> start!56084 m!594539))

(assert (=> b!618479 m!594531))

(declare-fun m!594541 () Bool)

(assert (=> b!618479 m!594541))

(assert (=> b!618479 m!594511))

(assert (=> b!618481 m!594511))

(declare-fun m!594543 () Bool)

(assert (=> b!618481 m!594543))

(assert (=> b!618481 m!594511))

(declare-fun m!594545 () Bool)

(assert (=> b!618481 m!594545))

(assert (=> b!618481 m!594519))

(assert (=> b!618481 m!594511))

(declare-fun m!594547 () Bool)

(assert (=> b!618481 m!594547))

(declare-fun m!594549 () Bool)

(assert (=> b!618481 m!594549))

(assert (=> b!618481 m!594511))

(declare-fun m!594551 () Bool)

(assert (=> b!618481 m!594551))

(assert (=> b!618481 m!594527))

(declare-fun m!594553 () Bool)

(assert (=> b!618491 m!594553))

(assert (=> b!618494 m!594531))

(assert (=> b!618494 m!594541))

(declare-fun m!594555 () Bool)

(assert (=> b!618475 m!594555))

(declare-fun m!594557 () Bool)

(assert (=> b!618477 m!594557))

(assert (=> b!618477 m!594511))

(assert (=> b!618477 m!594511))

(declare-fun m!594559 () Bool)

(assert (=> b!618477 m!594559))

(declare-fun m!594561 () Bool)

(assert (=> b!618473 m!594561))

(declare-fun m!594563 () Bool)

(assert (=> b!618478 m!594563))

(assert (=> b!618474 m!594511))

(assert (=> b!618474 m!594511))

(declare-fun m!594565 () Bool)

(assert (=> b!618474 m!594565))

(assert (=> b!618496 m!594511))

(assert (=> b!618496 m!594511))

(assert (=> b!618496 m!594565))

(assert (=> b!618476 m!594511))

(assert (=> b!618476 m!594511))

(assert (=> b!618476 m!594517))

(declare-fun m!594567 () Bool)

(assert (=> b!618484 m!594567))

(declare-fun m!594569 () Bool)

(assert (=> b!618493 m!594569))

(declare-fun m!594571 () Bool)

(assert (=> b!618493 m!594571))

(assert (=> b!618493 m!594511))

(assert (=> b!618493 m!594531))

(assert (=> b!618493 m!594511))

(declare-fun m!594573 () Bool)

(assert (=> b!618493 m!594573))

(declare-fun m!594575 () Bool)

(assert (=> b!618493 m!594575))

(declare-fun m!594577 () Bool)

(assert (=> b!618493 m!594577))

(declare-fun m!594579 () Bool)

(assert (=> b!618493 m!594579))

(push 1)

