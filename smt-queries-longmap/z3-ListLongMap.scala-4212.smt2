; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57718 () Bool)

(assert start!57718)

(declare-fun b!638480 () Bool)

(declare-fun res!413308 () Bool)

(declare-fun e!365344 () Bool)

(assert (=> b!638480 (=> (not res!413308) (not e!365344))))

(declare-datatypes ((array!38289 0))(
  ( (array!38290 (arr!18367 (Array (_ BitVec 32) (_ BitVec 64))) (size!18731 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38289)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638480 (= res!413308 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638481 () Bool)

(declare-fun res!413307 () Bool)

(declare-fun e!365351 () Bool)

(assert (=> b!638481 (=> (not res!413307) (not e!365351))))

(declare-datatypes ((List!12408 0))(
  ( (Nil!12405) (Cons!12404 (h!13449 (_ BitVec 64)) (t!18636 List!12408)) )
))
(declare-fun arrayNoDuplicates!0 (array!38289 (_ BitVec 32) List!12408) Bool)

(assert (=> b!638481 (= res!413307 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12405))))

(declare-fun b!638482 () Bool)

(declare-fun res!413296 () Bool)

(assert (=> b!638482 (=> (not res!413296) (not e!365344))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638482 (= res!413296 (and (= (size!18731 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18731 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18731 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638483 () Bool)

(declare-fun e!365352 () Bool)

(declare-fun e!365345 () Bool)

(assert (=> b!638483 (= e!365352 e!365345)))

(declare-fun res!413298 () Bool)

(assert (=> b!638483 (=> (not res!413298) (not e!365345))))

(declare-fun lt!295284 () array!38289)

(assert (=> b!638483 (= res!413298 (arrayContainsKey!0 lt!295284 (select (arr!18367 a!2986) j!136) j!136))))

(declare-fun b!638484 () Bool)

(declare-fun res!413304 () Bool)

(assert (=> b!638484 (=> (not res!413304) (not e!365351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38289 (_ BitVec 32)) Bool)

(assert (=> b!638484 (= res!413304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638485 () Bool)

(declare-fun e!365350 () Bool)

(declare-fun e!365343 () Bool)

(assert (=> b!638485 (= e!365350 e!365343)))

(declare-fun res!413299 () Bool)

(assert (=> b!638485 (=> (not res!413299) (not e!365343))))

(declare-datatypes ((SeekEntryResult!6807 0))(
  ( (MissingZero!6807 (index!29542 (_ BitVec 32))) (Found!6807 (index!29543 (_ BitVec 32))) (Intermediate!6807 (undefined!7619 Bool) (index!29544 (_ BitVec 32)) (x!58297 (_ BitVec 32))) (Undefined!6807) (MissingVacant!6807 (index!29545 (_ BitVec 32))) )
))
(declare-fun lt!295286 () SeekEntryResult!6807)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638485 (= res!413299 (and (= lt!295286 (Found!6807 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18367 a!2986) index!984) (select (arr!18367 a!2986) j!136))) (not (= (select (arr!18367 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38289 (_ BitVec 32)) SeekEntryResult!6807)

(assert (=> b!638485 (= lt!295286 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18367 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638486 () Bool)

(assert (=> b!638486 (= e!365351 e!365350)))

(declare-fun res!413306 () Bool)

(assert (=> b!638486 (=> (not res!413306) (not e!365350))))

(assert (=> b!638486 (= res!413306 (= (select (store (arr!18367 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638486 (= lt!295284 (array!38290 (store (arr!18367 a!2986) i!1108 k0!1786) (size!18731 a!2986)))))

(declare-fun b!638487 () Bool)

(declare-fun e!365347 () Bool)

(declare-fun e!365342 () Bool)

(assert (=> b!638487 (= e!365347 e!365342)))

(declare-fun res!413302 () Bool)

(assert (=> b!638487 (=> res!413302 e!365342)))

(declare-fun lt!295285 () (_ BitVec 64))

(declare-fun lt!295277 () (_ BitVec 64))

(assert (=> b!638487 (= res!413302 (or (not (= (select (arr!18367 a!2986) j!136) lt!295285)) (not (= (select (arr!18367 a!2986) j!136) lt!295277)) (bvsge j!136 index!984)))))

(declare-fun e!365349 () Bool)

(assert (=> b!638487 e!365349))

(declare-fun res!413301 () Bool)

(assert (=> b!638487 (=> (not res!413301) (not e!365349))))

(assert (=> b!638487 (= res!413301 (= lt!295277 (select (arr!18367 a!2986) j!136)))))

(assert (=> b!638487 (= lt!295277 (select (store (arr!18367 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638488 () Bool)

(assert (=> b!638488 (= e!365345 (arrayContainsKey!0 lt!295284 (select (arr!18367 a!2986) j!136) index!984))))

(declare-fun b!638489 () Bool)

(assert (=> b!638489 (= e!365342 true)))

(assert (=> b!638489 (arrayNoDuplicates!0 lt!295284 #b00000000000000000000000000000000 Nil!12405)))

(declare-datatypes ((Unit!21562 0))(
  ( (Unit!21563) )
))
(declare-fun lt!295283 () Unit!21562)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12408) Unit!21562)

(assert (=> b!638489 (= lt!295283 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12405))))

(assert (=> b!638489 (arrayContainsKey!0 lt!295284 (select (arr!18367 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295280 () Unit!21562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21562)

(assert (=> b!638489 (= lt!295280 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295284 (select (arr!18367 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638490 () Bool)

(declare-fun e!365348 () Unit!21562)

(declare-fun Unit!21564 () Unit!21562)

(assert (=> b!638490 (= e!365348 Unit!21564)))

(declare-fun b!638491 () Bool)

(declare-fun res!413310 () Bool)

(assert (=> b!638491 (=> (not res!413310) (not e!365344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638491 (= res!413310 (validKeyInArray!0 k0!1786))))

(declare-fun b!638492 () Bool)

(declare-fun res!413309 () Bool)

(assert (=> b!638492 (=> (not res!413309) (not e!365344))))

(assert (=> b!638492 (= res!413309 (validKeyInArray!0 (select (arr!18367 a!2986) j!136)))))

(declare-fun b!638493 () Bool)

(declare-fun e!365346 () Bool)

(declare-fun lt!295281 () SeekEntryResult!6807)

(assert (=> b!638493 (= e!365346 (= lt!295286 lt!295281))))

(declare-fun b!638495 () Bool)

(declare-fun Unit!21565 () Unit!21562)

(assert (=> b!638495 (= e!365348 Unit!21565)))

(assert (=> b!638495 false))

(declare-fun b!638496 () Bool)

(declare-fun res!413305 () Bool)

(assert (=> b!638496 (=> (not res!413305) (not e!365351))))

(assert (=> b!638496 (= res!413305 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18367 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638497 () Bool)

(assert (=> b!638497 (= e!365344 e!365351)))

(declare-fun res!413300 () Bool)

(assert (=> b!638497 (=> (not res!413300) (not e!365351))))

(declare-fun lt!295288 () SeekEntryResult!6807)

(assert (=> b!638497 (= res!413300 (or (= lt!295288 (MissingZero!6807 i!1108)) (= lt!295288 (MissingVacant!6807 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38289 (_ BitVec 32)) SeekEntryResult!6807)

(assert (=> b!638497 (= lt!295288 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638498 () Bool)

(assert (=> b!638498 (= e!365343 (not e!365347))))

(declare-fun res!413297 () Bool)

(assert (=> b!638498 (=> res!413297 e!365347)))

(declare-fun lt!295278 () SeekEntryResult!6807)

(assert (=> b!638498 (= res!413297 (not (= lt!295278 (Found!6807 index!984))))))

(declare-fun lt!295287 () Unit!21562)

(assert (=> b!638498 (= lt!295287 e!365348)))

(declare-fun c!72959 () Bool)

(assert (=> b!638498 (= c!72959 (= lt!295278 Undefined!6807))))

(assert (=> b!638498 (= lt!295278 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295285 lt!295284 mask!3053))))

(assert (=> b!638498 e!365346))

(declare-fun res!413303 () Bool)

(assert (=> b!638498 (=> (not res!413303) (not e!365346))))

(declare-fun lt!295282 () (_ BitVec 32))

(assert (=> b!638498 (= res!413303 (= lt!295281 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295282 vacantSpotIndex!68 lt!295285 lt!295284 mask!3053)))))

(assert (=> b!638498 (= lt!295281 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295282 vacantSpotIndex!68 (select (arr!18367 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638498 (= lt!295285 (select (store (arr!18367 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295279 () Unit!21562)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21562)

(assert (=> b!638498 (= lt!295279 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295282 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638498 (= lt!295282 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!413311 () Bool)

(assert (=> start!57718 (=> (not res!413311) (not e!365344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57718 (= res!413311 (validMask!0 mask!3053))))

(assert (=> start!57718 e!365344))

(assert (=> start!57718 true))

(declare-fun array_inv!14163 (array!38289) Bool)

(assert (=> start!57718 (array_inv!14163 a!2986)))

(declare-fun b!638494 () Bool)

(assert (=> b!638494 (= e!365349 e!365352)))

(declare-fun res!413312 () Bool)

(assert (=> b!638494 (=> res!413312 e!365352)))

(assert (=> b!638494 (= res!413312 (or (not (= (select (arr!18367 a!2986) j!136) lt!295285)) (not (= (select (arr!18367 a!2986) j!136) lt!295277)) (bvsge j!136 index!984)))))

(assert (= (and start!57718 res!413311) b!638482))

(assert (= (and b!638482 res!413296) b!638492))

(assert (= (and b!638492 res!413309) b!638491))

(assert (= (and b!638491 res!413310) b!638480))

(assert (= (and b!638480 res!413308) b!638497))

(assert (= (and b!638497 res!413300) b!638484))

(assert (= (and b!638484 res!413304) b!638481))

(assert (= (and b!638481 res!413307) b!638496))

(assert (= (and b!638496 res!413305) b!638486))

(assert (= (and b!638486 res!413306) b!638485))

(assert (= (and b!638485 res!413299) b!638498))

(assert (= (and b!638498 res!413303) b!638493))

(assert (= (and b!638498 c!72959) b!638495))

(assert (= (and b!638498 (not c!72959)) b!638490))

(assert (= (and b!638498 (not res!413297)) b!638487))

(assert (= (and b!638487 res!413301) b!638494))

(assert (= (and b!638494 (not res!413312)) b!638483))

(assert (= (and b!638483 res!413298) b!638488))

(assert (= (and b!638487 (not res!413302)) b!638489))

(declare-fun m!612407 () Bool)

(assert (=> start!57718 m!612407))

(declare-fun m!612409 () Bool)

(assert (=> start!57718 m!612409))

(declare-fun m!612411 () Bool)

(assert (=> b!638494 m!612411))

(assert (=> b!638489 m!612411))

(declare-fun m!612413 () Bool)

(assert (=> b!638489 m!612413))

(assert (=> b!638489 m!612411))

(declare-fun m!612415 () Bool)

(assert (=> b!638489 m!612415))

(assert (=> b!638489 m!612411))

(declare-fun m!612417 () Bool)

(assert (=> b!638489 m!612417))

(declare-fun m!612419 () Bool)

(assert (=> b!638489 m!612419))

(declare-fun m!612421 () Bool)

(assert (=> b!638491 m!612421))

(assert (=> b!638492 m!612411))

(assert (=> b!638492 m!612411))

(declare-fun m!612423 () Bool)

(assert (=> b!638492 m!612423))

(declare-fun m!612425 () Bool)

(assert (=> b!638485 m!612425))

(assert (=> b!638485 m!612411))

(assert (=> b!638485 m!612411))

(declare-fun m!612427 () Bool)

(assert (=> b!638485 m!612427))

(declare-fun m!612429 () Bool)

(assert (=> b!638481 m!612429))

(declare-fun m!612431 () Bool)

(assert (=> b!638496 m!612431))

(assert (=> b!638487 m!612411))

(declare-fun m!612433 () Bool)

(assert (=> b!638487 m!612433))

(declare-fun m!612435 () Bool)

(assert (=> b!638487 m!612435))

(assert (=> b!638486 m!612433))

(declare-fun m!612437 () Bool)

(assert (=> b!638486 m!612437))

(declare-fun m!612439 () Bool)

(assert (=> b!638498 m!612439))

(declare-fun m!612441 () Bool)

(assert (=> b!638498 m!612441))

(declare-fun m!612443 () Bool)

(assert (=> b!638498 m!612443))

(assert (=> b!638498 m!612411))

(declare-fun m!612445 () Bool)

(assert (=> b!638498 m!612445))

(assert (=> b!638498 m!612411))

(declare-fun m!612447 () Bool)

(assert (=> b!638498 m!612447))

(declare-fun m!612449 () Bool)

(assert (=> b!638498 m!612449))

(assert (=> b!638498 m!612433))

(assert (=> b!638488 m!612411))

(assert (=> b!638488 m!612411))

(declare-fun m!612451 () Bool)

(assert (=> b!638488 m!612451))

(assert (=> b!638483 m!612411))

(assert (=> b!638483 m!612411))

(declare-fun m!612453 () Bool)

(assert (=> b!638483 m!612453))

(declare-fun m!612455 () Bool)

(assert (=> b!638480 m!612455))

(declare-fun m!612457 () Bool)

(assert (=> b!638497 m!612457))

(declare-fun m!612459 () Bool)

(assert (=> b!638484 m!612459))

(check-sat (not b!638498) (not b!638497) (not b!638488) (not b!638481) (not start!57718) (not b!638485) (not b!638492) (not b!638491) (not b!638480) (not b!638484) (not b!638483) (not b!638489))
(check-sat)
