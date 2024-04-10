; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59354 () Bool)

(assert start!59354)

(declare-fun b!655317 () Bool)

(declare-fun res!425094 () Bool)

(declare-fun e!376339 () Bool)

(assert (=> b!655317 (=> (not res!425094) (not e!376339))))

(declare-datatypes ((array!38674 0))(
  ( (array!38675 (arr!18537 (Array (_ BitVec 32) (_ BitVec 64))) (size!18901 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38674)

(declare-datatypes ((List!12578 0))(
  ( (Nil!12575) (Cons!12574 (h!13619 (_ BitVec 64)) (t!18806 List!12578)) )
))
(declare-fun arrayNoDuplicates!0 (array!38674 (_ BitVec 32) List!12578) Bool)

(assert (=> b!655317 (= res!425094 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12575))))

(declare-fun b!655318 () Bool)

(declare-fun res!425103 () Bool)

(assert (=> b!655318 (=> (not res!425103) (not e!376339))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!655318 (= res!425103 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18537 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655319 () Bool)

(declare-datatypes ((Unit!22524 0))(
  ( (Unit!22525) )
))
(declare-fun e!376345 () Unit!22524)

(declare-fun Unit!22526 () Unit!22524)

(assert (=> b!655319 (= e!376345 Unit!22526)))

(assert (=> b!655319 false))

(declare-fun b!655320 () Bool)

(declare-fun res!425100 () Bool)

(declare-fun e!376341 () Bool)

(assert (=> b!655320 (=> (not res!425100) (not e!376341))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!655320 (= res!425100 (and (= (size!18901 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18901 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18901 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!425102 () Bool)

(assert (=> start!59354 (=> (not res!425102) (not e!376341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59354 (= res!425102 (validMask!0 mask!3053))))

(assert (=> start!59354 e!376341))

(assert (=> start!59354 true))

(declare-fun array_inv!14333 (array!38674) Bool)

(assert (=> start!59354 (array_inv!14333 a!2986)))

(declare-fun b!655321 () Bool)

(assert (=> b!655321 (= e!376341 e!376339)))

(declare-fun res!425108 () Bool)

(assert (=> b!655321 (=> (not res!425108) (not e!376339))))

(declare-datatypes ((SeekEntryResult!6977 0))(
  ( (MissingZero!6977 (index!30267 (_ BitVec 32))) (Found!6977 (index!30268 (_ BitVec 32))) (Intermediate!6977 (undefined!7789 Bool) (index!30269 (_ BitVec 32)) (x!59058 (_ BitVec 32))) (Undefined!6977) (MissingVacant!6977 (index!30270 (_ BitVec 32))) )
))
(declare-fun lt!305585 () SeekEntryResult!6977)

(assert (=> b!655321 (= res!425108 (or (= lt!305585 (MissingZero!6977 i!1108)) (= lt!305585 (MissingVacant!6977 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38674 (_ BitVec 32)) SeekEntryResult!6977)

(assert (=> b!655321 (= lt!305585 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655322 () Bool)

(declare-fun e!376346 () Bool)

(declare-fun lt!305593 () array!38674)

(declare-fun arrayContainsKey!0 (array!38674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655322 (= e!376346 (arrayContainsKey!0 lt!305593 (select (arr!18537 a!2986) j!136) index!984))))

(declare-fun b!655323 () Bool)

(declare-fun Unit!22527 () Unit!22524)

(assert (=> b!655323 (= e!376345 Unit!22527)))

(declare-fun e!376338 () Bool)

(declare-fun b!655324 () Bool)

(assert (=> b!655324 (= e!376338 (arrayContainsKey!0 lt!305593 (select (arr!18537 a!2986) j!136) index!984))))

(declare-fun res!425096 () Bool)

(declare-fun b!655325 () Bool)

(assert (=> b!655325 (= res!425096 (arrayContainsKey!0 lt!305593 (select (arr!18537 a!2986) j!136) j!136))))

(assert (=> b!655325 (=> (not res!425096) (not e!376346))))

(declare-fun e!376342 () Bool)

(assert (=> b!655325 (= e!376342 e!376346)))

(declare-fun b!655326 () Bool)

(declare-fun e!376348 () Unit!22524)

(declare-fun Unit!22528 () Unit!22524)

(assert (=> b!655326 (= e!376348 Unit!22528)))

(declare-fun b!655327 () Bool)

(declare-fun res!425101 () Bool)

(assert (=> b!655327 (=> (not res!425101) (not e!376341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655327 (= res!425101 (validKeyInArray!0 (select (arr!18537 a!2986) j!136)))))

(declare-fun b!655328 () Bool)

(declare-fun e!376343 () Bool)

(assert (=> b!655328 (= e!376339 e!376343)))

(declare-fun res!425097 () Bool)

(assert (=> b!655328 (=> (not res!425097) (not e!376343))))

(assert (=> b!655328 (= res!425097 (= (select (store (arr!18537 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655328 (= lt!305593 (array!38675 (store (arr!18537 a!2986) i!1108 k!1786) (size!18901 a!2986)))))

(declare-fun b!655329 () Bool)

(declare-fun e!376340 () Bool)

(assert (=> b!655329 (= e!376343 e!376340)))

(declare-fun res!425105 () Bool)

(assert (=> b!655329 (=> (not res!425105) (not e!376340))))

(declare-fun lt!305594 () SeekEntryResult!6977)

(assert (=> b!655329 (= res!425105 (and (= lt!305594 (Found!6977 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18537 a!2986) index!984) (select (arr!18537 a!2986) j!136))) (not (= (select (arr!18537 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38674 (_ BitVec 32)) SeekEntryResult!6977)

(assert (=> b!655329 (= lt!305594 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18537 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655330 () Bool)

(declare-fun res!425098 () Bool)

(assert (=> b!655330 (=> (not res!425098) (not e!376341))))

(assert (=> b!655330 (= res!425098 (validKeyInArray!0 k!1786))))

(declare-fun b!655331 () Bool)

(assert (=> b!655331 false))

(declare-fun lt!305584 () Unit!22524)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38674 (_ BitVec 64) (_ BitVec 32) List!12578) Unit!22524)

(assert (=> b!655331 (= lt!305584 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305593 (select (arr!18537 a!2986) j!136) j!136 Nil!12575))))

(assert (=> b!655331 (arrayNoDuplicates!0 lt!305593 j!136 Nil!12575)))

(declare-fun lt!305602 () Unit!22524)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38674 (_ BitVec 32) (_ BitVec 32)) Unit!22524)

(assert (=> b!655331 (= lt!305602 (lemmaNoDuplicateFromThenFromBigger!0 lt!305593 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655331 (arrayNoDuplicates!0 lt!305593 #b00000000000000000000000000000000 Nil!12575)))

(declare-fun lt!305595 () Unit!22524)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12578) Unit!22524)

(assert (=> b!655331 (= lt!305595 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12575))))

(assert (=> b!655331 (arrayContainsKey!0 lt!305593 (select (arr!18537 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305591 () Unit!22524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22524)

(assert (=> b!655331 (= lt!305591 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305593 (select (arr!18537 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22529 () Unit!22524)

(assert (=> b!655331 (= e!376348 Unit!22529)))

(declare-fun b!655332 () Bool)

(declare-fun res!425104 () Bool)

(assert (=> b!655332 (= res!425104 (bvsge j!136 index!984))))

(assert (=> b!655332 (=> res!425104 e!376342)))

(declare-fun e!376344 () Bool)

(assert (=> b!655332 (= e!376344 e!376342)))

(declare-fun b!655333 () Bool)

(declare-fun e!376337 () Unit!22524)

(declare-fun Unit!22530 () Unit!22524)

(assert (=> b!655333 (= e!376337 Unit!22530)))

(declare-fun b!655334 () Bool)

(assert (=> b!655334 false))

(declare-fun lt!305590 () Unit!22524)

(assert (=> b!655334 (= lt!305590 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305593 (select (arr!18537 a!2986) j!136) index!984 Nil!12575))))

(assert (=> b!655334 (arrayNoDuplicates!0 lt!305593 index!984 Nil!12575)))

(declare-fun lt!305599 () Unit!22524)

(assert (=> b!655334 (= lt!305599 (lemmaNoDuplicateFromThenFromBigger!0 lt!305593 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655334 (arrayNoDuplicates!0 lt!305593 #b00000000000000000000000000000000 Nil!12575)))

(declare-fun lt!305587 () Unit!22524)

(assert (=> b!655334 (= lt!305587 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12575))))

(assert (=> b!655334 (arrayContainsKey!0 lt!305593 (select (arr!18537 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305597 () Unit!22524)

(assert (=> b!655334 (= lt!305597 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305593 (select (arr!18537 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655334 e!376338))

(declare-fun res!425107 () Bool)

(assert (=> b!655334 (=> (not res!425107) (not e!376338))))

(assert (=> b!655334 (= res!425107 (arrayContainsKey!0 lt!305593 (select (arr!18537 a!2986) j!136) j!136))))

(declare-fun Unit!22531 () Unit!22524)

(assert (=> b!655334 (= e!376337 Unit!22531)))

(declare-fun b!655335 () Bool)

(declare-fun e!376349 () Bool)

(declare-fun lt!305589 () SeekEntryResult!6977)

(assert (=> b!655335 (= e!376349 (= lt!305594 lt!305589))))

(declare-fun b!655336 () Bool)

(declare-fun e!376347 () Unit!22524)

(declare-fun Unit!22532 () Unit!22524)

(assert (=> b!655336 (= e!376347 Unit!22532)))

(declare-fun b!655337 () Bool)

(declare-fun res!425095 () Bool)

(assert (=> b!655337 (=> (not res!425095) (not e!376339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38674 (_ BitVec 32)) Bool)

(assert (=> b!655337 (= res!425095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655338 () Bool)

(assert (=> b!655338 (= e!376340 (not true))))

(declare-fun lt!305596 () Unit!22524)

(assert (=> b!655338 (= lt!305596 e!376347)))

(declare-fun c!75482 () Bool)

(declare-fun lt!305583 () SeekEntryResult!6977)

(assert (=> b!655338 (= c!75482 (= lt!305583 (Found!6977 index!984)))))

(declare-fun lt!305586 () Unit!22524)

(assert (=> b!655338 (= lt!305586 e!376345)))

(declare-fun c!75479 () Bool)

(assert (=> b!655338 (= c!75479 (= lt!305583 Undefined!6977))))

(declare-fun lt!305601 () (_ BitVec 64))

(assert (=> b!655338 (= lt!305583 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305601 lt!305593 mask!3053))))

(assert (=> b!655338 e!376349))

(declare-fun res!425099 () Bool)

(assert (=> b!655338 (=> (not res!425099) (not e!376349))))

(declare-fun lt!305600 () (_ BitVec 32))

(assert (=> b!655338 (= res!425099 (= lt!305589 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305600 vacantSpotIndex!68 lt!305601 lt!305593 mask!3053)))))

(assert (=> b!655338 (= lt!305589 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305600 vacantSpotIndex!68 (select (arr!18537 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655338 (= lt!305601 (select (store (arr!18537 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305598 () Unit!22524)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38674 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22524)

(assert (=> b!655338 (= lt!305598 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305600 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655338 (= lt!305600 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655339 () Bool)

(declare-fun Unit!22533 () Unit!22524)

(assert (=> b!655339 (= e!376347 Unit!22533)))

(declare-fun res!425106 () Bool)

(assert (=> b!655339 (= res!425106 (= (select (store (arr!18537 a!2986) i!1108 k!1786) index!984) (select (arr!18537 a!2986) j!136)))))

(assert (=> b!655339 (=> (not res!425106) (not e!376344))))

(assert (=> b!655339 e!376344))

(declare-fun c!75480 () Bool)

(assert (=> b!655339 (= c!75480 (bvslt j!136 index!984))))

(declare-fun lt!305592 () Unit!22524)

(assert (=> b!655339 (= lt!305592 e!376348)))

(declare-fun c!75481 () Bool)

(assert (=> b!655339 (= c!75481 (bvslt index!984 j!136))))

(declare-fun lt!305588 () Unit!22524)

(assert (=> b!655339 (= lt!305588 e!376337)))

(assert (=> b!655339 false))

(declare-fun b!655340 () Bool)

(declare-fun res!425093 () Bool)

(assert (=> b!655340 (=> (not res!425093) (not e!376341))))

(assert (=> b!655340 (= res!425093 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!59354 res!425102) b!655320))

(assert (= (and b!655320 res!425100) b!655327))

(assert (= (and b!655327 res!425101) b!655330))

(assert (= (and b!655330 res!425098) b!655340))

(assert (= (and b!655340 res!425093) b!655321))

(assert (= (and b!655321 res!425108) b!655337))

(assert (= (and b!655337 res!425095) b!655317))

(assert (= (and b!655317 res!425094) b!655318))

(assert (= (and b!655318 res!425103) b!655328))

(assert (= (and b!655328 res!425097) b!655329))

(assert (= (and b!655329 res!425105) b!655338))

(assert (= (and b!655338 res!425099) b!655335))

(assert (= (and b!655338 c!75479) b!655319))

(assert (= (and b!655338 (not c!75479)) b!655323))

(assert (= (and b!655338 c!75482) b!655339))

(assert (= (and b!655338 (not c!75482)) b!655336))

(assert (= (and b!655339 res!425106) b!655332))

(assert (= (and b!655332 (not res!425104)) b!655325))

(assert (= (and b!655325 res!425096) b!655322))

(assert (= (and b!655339 c!75480) b!655331))

(assert (= (and b!655339 (not c!75480)) b!655326))

(assert (= (and b!655339 c!75481) b!655334))

(assert (= (and b!655339 (not c!75481)) b!655333))

(assert (= (and b!655334 res!425107) b!655324))

(declare-fun m!628397 () Bool)

(assert (=> b!655318 m!628397))

(declare-fun m!628399 () Bool)

(assert (=> b!655339 m!628399))

(declare-fun m!628401 () Bool)

(assert (=> b!655339 m!628401))

(declare-fun m!628403 () Bool)

(assert (=> b!655339 m!628403))

(declare-fun m!628405 () Bool)

(assert (=> b!655337 m!628405))

(declare-fun m!628407 () Bool)

(assert (=> b!655338 m!628407))

(declare-fun m!628409 () Bool)

(assert (=> b!655338 m!628409))

(assert (=> b!655338 m!628403))

(assert (=> b!655338 m!628399))

(declare-fun m!628411 () Bool)

(assert (=> b!655338 m!628411))

(assert (=> b!655338 m!628403))

(declare-fun m!628413 () Bool)

(assert (=> b!655338 m!628413))

(declare-fun m!628415 () Bool)

(assert (=> b!655338 m!628415))

(declare-fun m!628417 () Bool)

(assert (=> b!655338 m!628417))

(declare-fun m!628419 () Bool)

(assert (=> b!655334 m!628419))

(assert (=> b!655334 m!628403))

(declare-fun m!628421 () Bool)

(assert (=> b!655334 m!628421))

(assert (=> b!655334 m!628403))

(assert (=> b!655334 m!628403))

(declare-fun m!628423 () Bool)

(assert (=> b!655334 m!628423))

(assert (=> b!655334 m!628403))

(declare-fun m!628425 () Bool)

(assert (=> b!655334 m!628425))

(declare-fun m!628427 () Bool)

(assert (=> b!655334 m!628427))

(assert (=> b!655334 m!628403))

(declare-fun m!628429 () Bool)

(assert (=> b!655334 m!628429))

(declare-fun m!628431 () Bool)

(assert (=> b!655334 m!628431))

(declare-fun m!628433 () Bool)

(assert (=> b!655334 m!628433))

(assert (=> b!655325 m!628403))

(assert (=> b!655325 m!628403))

(assert (=> b!655325 m!628423))

(declare-fun m!628435 () Bool)

(assert (=> b!655330 m!628435))

(declare-fun m!628437 () Bool)

(assert (=> b!655340 m!628437))

(declare-fun m!628439 () Bool)

(assert (=> b!655317 m!628439))

(declare-fun m!628441 () Bool)

(assert (=> b!655329 m!628441))

(assert (=> b!655329 m!628403))

(assert (=> b!655329 m!628403))

(declare-fun m!628443 () Bool)

(assert (=> b!655329 m!628443))

(assert (=> b!655331 m!628403))

(declare-fun m!628445 () Bool)

(assert (=> b!655331 m!628445))

(assert (=> b!655331 m!628403))

(declare-fun m!628447 () Bool)

(assert (=> b!655331 m!628447))

(assert (=> b!655331 m!628403))

(assert (=> b!655331 m!628403))

(declare-fun m!628449 () Bool)

(assert (=> b!655331 m!628449))

(declare-fun m!628451 () Bool)

(assert (=> b!655331 m!628451))

(assert (=> b!655331 m!628431))

(declare-fun m!628453 () Bool)

(assert (=> b!655331 m!628453))

(assert (=> b!655331 m!628433))

(assert (=> b!655327 m!628403))

(assert (=> b!655327 m!628403))

(declare-fun m!628455 () Bool)

(assert (=> b!655327 m!628455))

(declare-fun m!628457 () Bool)

(assert (=> start!59354 m!628457))

(declare-fun m!628459 () Bool)

(assert (=> start!59354 m!628459))

(declare-fun m!628461 () Bool)

(assert (=> b!655321 m!628461))

(assert (=> b!655328 m!628399))

(declare-fun m!628463 () Bool)

(assert (=> b!655328 m!628463))

(assert (=> b!655324 m!628403))

(assert (=> b!655324 m!628403))

(declare-fun m!628465 () Bool)

(assert (=> b!655324 m!628465))

(assert (=> b!655322 m!628403))

(assert (=> b!655322 m!628403))

(assert (=> b!655322 m!628465))

(push 1)

