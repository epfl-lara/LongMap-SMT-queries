; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58022 () Bool)

(assert start!58022)

(declare-fun b!641474 () Bool)

(declare-fun e!367286 () Bool)

(declare-fun e!367287 () Bool)

(assert (=> b!641474 (= e!367286 (not e!367287))))

(declare-fun res!415459 () Bool)

(assert (=> b!641474 (=> res!415459 e!367287)))

(declare-datatypes ((SeekEntryResult!6842 0))(
  ( (MissingZero!6842 (index!29691 (_ BitVec 32))) (Found!6842 (index!29692 (_ BitVec 32))) (Intermediate!6842 (undefined!7654 Bool) (index!29693 (_ BitVec 32)) (x!58455 (_ BitVec 32))) (Undefined!6842) (MissingVacant!6842 (index!29694 (_ BitVec 32))) )
))
(declare-fun lt!297001 () SeekEntryResult!6842)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!641474 (= res!415459 (not (= lt!297001 (Found!6842 index!984))))))

(declare-datatypes ((Unit!21702 0))(
  ( (Unit!21703) )
))
(declare-fun lt!296992 () Unit!21702)

(declare-fun e!367298 () Unit!21702)

(assert (=> b!641474 (= lt!296992 e!367298)))

(declare-fun c!73376 () Bool)

(assert (=> b!641474 (= c!73376 (= lt!297001 Undefined!6842))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!296991 () (_ BitVec 64))

(declare-datatypes ((array!38368 0))(
  ( (array!38369 (arr!18402 (Array (_ BitVec 32) (_ BitVec 64))) (size!18766 (_ BitVec 32))) )
))
(declare-fun lt!296990 () array!38368)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38368 (_ BitVec 32)) SeekEntryResult!6842)

(assert (=> b!641474 (= lt!297001 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296991 lt!296990 mask!3053))))

(declare-fun e!367289 () Bool)

(assert (=> b!641474 e!367289))

(declare-fun res!415467 () Bool)

(assert (=> b!641474 (=> (not res!415467) (not e!367289))))

(declare-fun lt!296989 () (_ BitVec 32))

(declare-fun lt!296993 () SeekEntryResult!6842)

(assert (=> b!641474 (= res!415467 (= lt!296993 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296989 vacantSpotIndex!68 lt!296991 lt!296990 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38368)

(assert (=> b!641474 (= lt!296993 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296989 vacantSpotIndex!68 (select (arr!18402 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!641474 (= lt!296991 (select (store (arr!18402 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296995 () Unit!21702)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38368 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21702)

(assert (=> b!641474 (= lt!296995 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296989 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641474 (= lt!296989 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641475 () Bool)

(declare-fun e!367299 () Bool)

(declare-datatypes ((List!12443 0))(
  ( (Nil!12440) (Cons!12439 (h!13484 (_ BitVec 64)) (t!18671 List!12443)) )
))
(declare-fun contains!3130 (List!12443 (_ BitVec 64)) Bool)

(assert (=> b!641475 (= e!367299 (not (contains!3130 Nil!12440 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641476 () Bool)

(declare-fun res!415471 () Bool)

(declare-fun e!367293 () Bool)

(assert (=> b!641476 (=> (not res!415471) (not e!367293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38368 (_ BitVec 32)) Bool)

(assert (=> b!641476 (= res!415471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641477 () Bool)

(declare-fun res!415456 () Bool)

(declare-fun e!367288 () Bool)

(assert (=> b!641477 (=> (not res!415456) (not e!367288))))

(declare-fun arrayContainsKey!0 (array!38368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641477 (= res!415456 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641478 () Bool)

(declare-fun res!415457 () Bool)

(declare-fun e!367294 () Bool)

(assert (=> b!641478 (=> res!415457 e!367294)))

(declare-fun noDuplicate!402 (List!12443) Bool)

(assert (=> b!641478 (= res!415457 (not (noDuplicate!402 Nil!12440)))))

(declare-fun b!641479 () Bool)

(declare-fun e!367297 () Bool)

(declare-fun e!367295 () Bool)

(assert (=> b!641479 (= e!367297 e!367295)))

(declare-fun res!415470 () Bool)

(assert (=> b!641479 (=> res!415470 e!367295)))

(declare-fun lt!296997 () (_ BitVec 64))

(assert (=> b!641479 (= res!415470 (or (not (= (select (arr!18402 a!2986) j!136) lt!296991)) (not (= (select (arr!18402 a!2986) j!136) lt!296997)) (bvsge j!136 index!984)))))

(declare-fun b!641480 () Bool)

(declare-fun e!367290 () Bool)

(assert (=> b!641480 (= e!367290 (arrayContainsKey!0 lt!296990 (select (arr!18402 a!2986) j!136) index!984))))

(declare-fun b!641481 () Bool)

(declare-fun e!367296 () Bool)

(assert (=> b!641481 (= e!367296 e!367286)))

(declare-fun res!415474 () Bool)

(assert (=> b!641481 (=> (not res!415474) (not e!367286))))

(declare-fun lt!296998 () SeekEntryResult!6842)

(assert (=> b!641481 (= res!415474 (and (= lt!296998 (Found!6842 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18402 a!2986) index!984) (select (arr!18402 a!2986) j!136))) (not (= (select (arr!18402 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641481 (= lt!296998 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18402 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!415465 () Bool)

(assert (=> start!58022 (=> (not res!415465) (not e!367288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58022 (= res!415465 (validMask!0 mask!3053))))

(assert (=> start!58022 e!367288))

(assert (=> start!58022 true))

(declare-fun array_inv!14198 (array!38368) Bool)

(assert (=> start!58022 (array_inv!14198 a!2986)))

(declare-fun b!641482 () Bool)

(declare-fun Unit!21704 () Unit!21702)

(assert (=> b!641482 (= e!367298 Unit!21704)))

(assert (=> b!641482 false))

(declare-fun b!641483 () Bool)

(assert (=> b!641483 (= e!367293 e!367296)))

(declare-fun res!415464 () Bool)

(assert (=> b!641483 (=> (not res!415464) (not e!367296))))

(assert (=> b!641483 (= res!415464 (= (select (store (arr!18402 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641483 (= lt!296990 (array!38369 (store (arr!18402 a!2986) i!1108 k!1786) (size!18766 a!2986)))))

(declare-fun b!641484 () Bool)

(declare-fun res!415475 () Bool)

(assert (=> b!641484 (=> (not res!415475) (not e!367288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641484 (= res!415475 (validKeyInArray!0 k!1786))))

(declare-fun b!641485 () Bool)

(declare-fun e!367292 () Bool)

(assert (=> b!641485 (= e!367287 e!367292)))

(declare-fun res!415461 () Bool)

(assert (=> b!641485 (=> res!415461 e!367292)))

(assert (=> b!641485 (= res!415461 (or (not (= (select (arr!18402 a!2986) j!136) lt!296991)) (not (= (select (arr!18402 a!2986) j!136) lt!296997)) (bvsge j!136 index!984)))))

(assert (=> b!641485 e!367297))

(declare-fun res!415468 () Bool)

(assert (=> b!641485 (=> (not res!415468) (not e!367297))))

(assert (=> b!641485 (= res!415468 (= lt!296997 (select (arr!18402 a!2986) j!136)))))

(assert (=> b!641485 (= lt!296997 (select (store (arr!18402 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!641486 () Bool)

(assert (=> b!641486 (= e!367292 e!367294)))

(declare-fun res!415460 () Bool)

(assert (=> b!641486 (=> res!415460 e!367294)))

(assert (=> b!641486 (= res!415460 (or (bvsge (size!18766 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18766 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!38368 (_ BitVec 32) List!12443) Bool)

(assert (=> b!641486 (arrayNoDuplicates!0 lt!296990 j!136 Nil!12440)))

(declare-fun lt!296994 () Unit!21702)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38368 (_ BitVec 32) (_ BitVec 32)) Unit!21702)

(assert (=> b!641486 (= lt!296994 (lemmaNoDuplicateFromThenFromBigger!0 lt!296990 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641486 (arrayNoDuplicates!0 lt!296990 #b00000000000000000000000000000000 Nil!12440)))

(declare-fun lt!296999 () Unit!21702)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12443) Unit!21702)

(assert (=> b!641486 (= lt!296999 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12440))))

(assert (=> b!641486 (arrayContainsKey!0 lt!296990 (select (arr!18402 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296996 () Unit!21702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21702)

(assert (=> b!641486 (= lt!296996 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296990 (select (arr!18402 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641487 () Bool)

(declare-fun Unit!21705 () Unit!21702)

(assert (=> b!641487 (= e!367298 Unit!21705)))

(declare-fun b!641488 () Bool)

(declare-fun res!415472 () Bool)

(assert (=> b!641488 (=> (not res!415472) (not e!367293))))

(assert (=> b!641488 (= res!415472 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18402 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641489 () Bool)

(assert (=> b!641489 (= e!367288 e!367293)))

(declare-fun res!415466 () Bool)

(assert (=> b!641489 (=> (not res!415466) (not e!367293))))

(declare-fun lt!297000 () SeekEntryResult!6842)

(assert (=> b!641489 (= res!415466 (or (= lt!297000 (MissingZero!6842 i!1108)) (= lt!297000 (MissingVacant!6842 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38368 (_ BitVec 32)) SeekEntryResult!6842)

(assert (=> b!641489 (= lt!297000 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!641490 () Bool)

(declare-fun res!415458 () Bool)

(assert (=> b!641490 (=> (not res!415458) (not e!367288))))

(assert (=> b!641490 (= res!415458 (and (= (size!18766 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18766 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18766 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641491 () Bool)

(assert (=> b!641491 (= e!367295 e!367290)))

(declare-fun res!415469 () Bool)

(assert (=> b!641491 (=> (not res!415469) (not e!367290))))

(assert (=> b!641491 (= res!415469 (arrayContainsKey!0 lt!296990 (select (arr!18402 a!2986) j!136) j!136))))

(declare-fun b!641492 () Bool)

(assert (=> b!641492 (= e!367289 (= lt!296998 lt!296993))))

(declare-fun b!641493 () Bool)

(assert (=> b!641493 (= e!367294 e!367299)))

(declare-fun res!415473 () Bool)

(assert (=> b!641493 (=> (not res!415473) (not e!367299))))

(assert (=> b!641493 (= res!415473 (not (contains!3130 Nil!12440 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641494 () Bool)

(declare-fun res!415463 () Bool)

(assert (=> b!641494 (=> (not res!415463) (not e!367288))))

(assert (=> b!641494 (= res!415463 (validKeyInArray!0 (select (arr!18402 a!2986) j!136)))))

(declare-fun b!641495 () Bool)

(declare-fun res!415462 () Bool)

(assert (=> b!641495 (=> (not res!415462) (not e!367293))))

(assert (=> b!641495 (= res!415462 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12440))))

(assert (= (and start!58022 res!415465) b!641490))

(assert (= (and b!641490 res!415458) b!641494))

(assert (= (and b!641494 res!415463) b!641484))

(assert (= (and b!641484 res!415475) b!641477))

(assert (= (and b!641477 res!415456) b!641489))

(assert (= (and b!641489 res!415466) b!641476))

(assert (= (and b!641476 res!415471) b!641495))

(assert (= (and b!641495 res!415462) b!641488))

(assert (= (and b!641488 res!415472) b!641483))

(assert (= (and b!641483 res!415464) b!641481))

(assert (= (and b!641481 res!415474) b!641474))

(assert (= (and b!641474 res!415467) b!641492))

(assert (= (and b!641474 c!73376) b!641482))

(assert (= (and b!641474 (not c!73376)) b!641487))

(assert (= (and b!641474 (not res!415459)) b!641485))

(assert (= (and b!641485 res!415468) b!641479))

(assert (= (and b!641479 (not res!415470)) b!641491))

(assert (= (and b!641491 res!415469) b!641480))

(assert (= (and b!641485 (not res!415461)) b!641486))

(assert (= (and b!641486 (not res!415460)) b!641478))

(assert (= (and b!641478 (not res!415457)) b!641493))

(assert (= (and b!641493 res!415473) b!641475))

(declare-fun m!615281 () Bool)

(assert (=> b!641494 m!615281))

(assert (=> b!641494 m!615281))

(declare-fun m!615283 () Bool)

(assert (=> b!641494 m!615283))

(declare-fun m!615285 () Bool)

(assert (=> b!641474 m!615285))

(declare-fun m!615287 () Bool)

(assert (=> b!641474 m!615287))

(declare-fun m!615289 () Bool)

(assert (=> b!641474 m!615289))

(declare-fun m!615291 () Bool)

(assert (=> b!641474 m!615291))

(assert (=> b!641474 m!615281))

(declare-fun m!615293 () Bool)

(assert (=> b!641474 m!615293))

(assert (=> b!641474 m!615281))

(declare-fun m!615295 () Bool)

(assert (=> b!641474 m!615295))

(declare-fun m!615297 () Bool)

(assert (=> b!641474 m!615297))

(declare-fun m!615299 () Bool)

(assert (=> b!641478 m!615299))

(assert (=> b!641485 m!615281))

(assert (=> b!641485 m!615293))

(declare-fun m!615301 () Bool)

(assert (=> b!641485 m!615301))

(declare-fun m!615303 () Bool)

(assert (=> start!58022 m!615303))

(declare-fun m!615305 () Bool)

(assert (=> start!58022 m!615305))

(declare-fun m!615307 () Bool)

(assert (=> b!641476 m!615307))

(assert (=> b!641480 m!615281))

(assert (=> b!641480 m!615281))

(declare-fun m!615309 () Bool)

(assert (=> b!641480 m!615309))

(declare-fun m!615311 () Bool)

(assert (=> b!641495 m!615311))

(assert (=> b!641483 m!615293))

(declare-fun m!615313 () Bool)

(assert (=> b!641483 m!615313))

(assert (=> b!641491 m!615281))

(assert (=> b!641491 m!615281))

(declare-fun m!615315 () Bool)

(assert (=> b!641491 m!615315))

(declare-fun m!615317 () Bool)

(assert (=> b!641489 m!615317))

(assert (=> b!641479 m!615281))

(declare-fun m!615319 () Bool)

(assert (=> b!641475 m!615319))

(declare-fun m!615321 () Bool)

(assert (=> b!641477 m!615321))

(declare-fun m!615323 () Bool)

(assert (=> b!641493 m!615323))

(declare-fun m!615325 () Bool)

(assert (=> b!641481 m!615325))

(assert (=> b!641481 m!615281))

(assert (=> b!641481 m!615281))

(declare-fun m!615327 () Bool)

(assert (=> b!641481 m!615327))

(declare-fun m!615329 () Bool)

(assert (=> b!641488 m!615329))

(declare-fun m!615331 () Bool)

(assert (=> b!641486 m!615331))

(assert (=> b!641486 m!615281))

(declare-fun m!615333 () Bool)

(assert (=> b!641486 m!615333))

(assert (=> b!641486 m!615281))

(declare-fun m!615335 () Bool)

(assert (=> b!641486 m!615335))

(declare-fun m!615337 () Bool)

(assert (=> b!641486 m!615337))

(declare-fun m!615339 () Bool)

(assert (=> b!641486 m!615339))

(assert (=> b!641486 m!615281))

(declare-fun m!615341 () Bool)

(assert (=> b!641486 m!615341))

(declare-fun m!615343 () Bool)

(assert (=> b!641484 m!615343))

(push 1)

(assert (not b!641475))

(assert (not b!641495))

(assert (not b!641484))

(assert (not b!641491))

(assert (not b!641478))

(assert (not b!641477))

(assert (not b!641481))

(assert (not b!641480))

(assert (not b!641474))

(assert (not b!641476))

(assert (not b!641494))

(assert (not b!641493))

(assert (not b!641486))

(assert (not b!641489))

(assert (not start!58022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!641732 () Bool)

(declare-fun e!367458 () SeekEntryResult!6842)

(declare-fun e!367457 () SeekEntryResult!6842)

(assert (=> b!641732 (= e!367458 e!367457)))

(declare-fun lt!297111 () (_ BitVec 64))

(declare-fun lt!297110 () SeekEntryResult!6842)

(assert (=> b!641732 (= lt!297111 (select (arr!18402 a!2986) (index!29693 lt!297110)))))

(declare-fun c!73415 () Bool)

(assert (=> b!641732 (= c!73415 (= lt!297111 k!1786))))

(declare-fun b!641733 () Bool)

(assert (=> b!641733 (= e!367457 (Found!6842 (index!29693 lt!297110)))))

(declare-fun e!367456 () SeekEntryResult!6842)

(declare-fun b!641734 () Bool)

(assert (=> b!641734 (= e!367456 (seekKeyOrZeroReturnVacant!0 (x!58455 lt!297110) (index!29693 lt!297110) (index!29693 lt!297110) k!1786 a!2986 mask!3053))))

(declare-fun b!641735 () Bool)

(declare-fun c!73417 () Bool)

(assert (=> b!641735 (= c!73417 (= lt!297111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641735 (= e!367457 e!367456)))

(declare-fun d!90643 () Bool)

(declare-fun lt!297112 () SeekEntryResult!6842)

(assert (=> d!90643 (and (or (is-Undefined!6842 lt!297112) (not (is-Found!6842 lt!297112)) (and (bvsge (index!29692 lt!297112) #b00000000000000000000000000000000) (bvslt (index!29692 lt!297112) (size!18766 a!2986)))) (or (is-Undefined!6842 lt!297112) (is-Found!6842 lt!297112) (not (is-MissingZero!6842 lt!297112)) (and (bvsge (index!29691 lt!297112) #b00000000000000000000000000000000) (bvslt (index!29691 lt!297112) (size!18766 a!2986)))) (or (is-Undefined!6842 lt!297112) (is-Found!6842 lt!297112) (is-MissingZero!6842 lt!297112) (not (is-MissingVacant!6842 lt!297112)) (and (bvsge (index!29694 lt!297112) #b00000000000000000000000000000000) (bvslt (index!29694 lt!297112) (size!18766 a!2986)))) (or (is-Undefined!6842 lt!297112) (ite (is-Found!6842 lt!297112) (= (select (arr!18402 a!2986) (index!29692 lt!297112)) k!1786) (ite (is-MissingZero!6842 lt!297112) (= (select (arr!18402 a!2986) (index!29691 lt!297112)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6842 lt!297112) (= (select (arr!18402 a!2986) (index!29694 lt!297112)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90643 (= lt!297112 e!367458)))

(declare-fun c!73416 () Bool)

(assert (=> d!90643 (= c!73416 (and (is-Intermediate!6842 lt!297110) (undefined!7654 lt!297110)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38368 (_ BitVec 32)) SeekEntryResult!6842)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90643 (= lt!297110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90643 (validMask!0 mask!3053)))

(assert (=> d!90643 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!297112)))

(declare-fun b!641736 () Bool)

(assert (=> b!641736 (= e!367456 (MissingZero!6842 (index!29693 lt!297110)))))

(declare-fun b!641737 () Bool)

(assert (=> b!641737 (= e!367458 Undefined!6842)))

(assert (= (and d!90643 c!73416) b!641737))

(assert (= (and d!90643 (not c!73416)) b!641732))

(assert (= (and b!641732 c!73415) b!641733))

(assert (= (and b!641732 (not c!73415)) b!641735))

(assert (= (and b!641735 c!73417) b!641736))

(assert (= (and b!641735 (not c!73417)) b!641734))

(declare-fun m!615523 () Bool)

(assert (=> b!641732 m!615523))

(declare-fun m!615525 () Bool)

(assert (=> b!641734 m!615525))

(declare-fun m!615527 () Bool)

(assert (=> d!90643 m!615527))

(declare-fun m!615529 () Bool)

(assert (=> d!90643 m!615529))

(assert (=> d!90643 m!615303))

(declare-fun m!615531 () Bool)

(assert (=> d!90643 m!615531))

(assert (=> d!90643 m!615531))

(declare-fun m!615533 () Bool)

(assert (=> d!90643 m!615533))

(declare-fun m!615535 () Bool)

(assert (=> d!90643 m!615535))

(assert (=> b!641489 d!90643))

(declare-fun d!90651 () Bool)

(declare-fun res!415646 () Bool)

(declare-fun e!367476 () Bool)

(assert (=> d!90651 (=> res!415646 e!367476)))

(assert (=> d!90651 (= res!415646 (is-Nil!12440 Nil!12440))))

(assert (=> d!90651 (= (noDuplicate!402 Nil!12440) e!367476)))

(declare-fun b!641762 () Bool)

(declare-fun e!367477 () Bool)

(assert (=> b!641762 (= e!367476 e!367477)))

(declare-fun res!415647 () Bool)

(assert (=> b!641762 (=> (not res!415647) (not e!367477))))

(assert (=> b!641762 (= res!415647 (not (contains!3130 (t!18671 Nil!12440) (h!13484 Nil!12440))))))

(declare-fun b!641763 () Bool)

(assert (=> b!641763 (= e!367477 (noDuplicate!402 (t!18671 Nil!12440)))))

(assert (= (and d!90651 (not res!415646)) b!641762))

(assert (= (and b!641762 res!415647) b!641763))

(declare-fun m!615555 () Bool)

(assert (=> b!641762 m!615555))

(declare-fun m!615557 () Bool)

(assert (=> b!641763 m!615557))

(assert (=> b!641478 d!90651))

(declare-fun d!90657 () Bool)

(declare-fun res!415654 () Bool)

(declare-fun e!367484 () Bool)

(assert (=> d!90657 (=> res!415654 e!367484)))

(assert (=> d!90657 (= res!415654 (= (select (arr!18402 lt!296990) index!984) (select (arr!18402 a!2986) j!136)))))

(assert (=> d!90657 (= (arrayContainsKey!0 lt!296990 (select (arr!18402 a!2986) j!136) index!984) e!367484)))

(declare-fun b!641770 () Bool)

(declare-fun e!367485 () Bool)

(assert (=> b!641770 (= e!367484 e!367485)))

(declare-fun res!415655 () Bool)

(assert (=> b!641770 (=> (not res!415655) (not e!367485))))

(assert (=> b!641770 (= res!415655 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18766 lt!296990)))))

(declare-fun b!641771 () Bool)

(assert (=> b!641771 (= e!367485 (arrayContainsKey!0 lt!296990 (select (arr!18402 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90657 (not res!415654)) b!641770))

(assert (= (and b!641770 res!415655) b!641771))

(declare-fun m!615571 () Bool)

(assert (=> d!90657 m!615571))

(assert (=> b!641771 m!615281))

(declare-fun m!615573 () Bool)

(assert (=> b!641771 m!615573))

(assert (=> b!641480 d!90657))

(declare-fun b!641796 () Bool)

(declare-fun c!73436 () Bool)

(declare-fun lt!297137 () (_ BitVec 64))

(assert (=> b!641796 (= c!73436 (= lt!297137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367500 () SeekEntryResult!6842)

(declare-fun e!367499 () SeekEntryResult!6842)

(assert (=> b!641796 (= e!367500 e!367499)))

(declare-fun b!641797 () Bool)

(declare-fun e!367498 () SeekEntryResult!6842)

(assert (=> b!641797 (= e!367498 Undefined!6842)))

(declare-fun b!641798 () Bool)

(assert (=> b!641798 (= e!367500 (Found!6842 index!984))))

(declare-fun b!641799 () Bool)

(assert (=> b!641799 (= e!367499 (MissingVacant!6842 vacantSpotIndex!68))))

(declare-fun b!641800 () Bool)

(assert (=> b!641800 (= e!367498 e!367500)))

(declare-fun c!73435 () Bool)

(assert (=> b!641800 (= c!73435 (= lt!297137 (select (arr!18402 a!2986) j!136)))))

(declare-fun lt!297136 () SeekEntryResult!6842)

(declare-fun d!90663 () Bool)

(assert (=> d!90663 (and (or (is-Undefined!6842 lt!297136) (not (is-Found!6842 lt!297136)) (and (bvsge (index!29692 lt!297136) #b00000000000000000000000000000000) (bvslt (index!29692 lt!297136) (size!18766 a!2986)))) (or (is-Undefined!6842 lt!297136) (is-Found!6842 lt!297136) (not (is-MissingVacant!6842 lt!297136)) (not (= (index!29694 lt!297136) vacantSpotIndex!68)) (and (bvsge (index!29694 lt!297136) #b00000000000000000000000000000000) (bvslt (index!29694 lt!297136) (size!18766 a!2986)))) (or (is-Undefined!6842 lt!297136) (ite (is-Found!6842 lt!297136) (= (select (arr!18402 a!2986) (index!29692 lt!297136)) (select (arr!18402 a!2986) j!136)) (and (is-MissingVacant!6842 lt!297136) (= (index!29694 lt!297136) vacantSpotIndex!68) (= (select (arr!18402 a!2986) (index!29694 lt!297136)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90663 (= lt!297136 e!367498)))

(declare-fun c!73434 () Bool)

(assert (=> d!90663 (= c!73434 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90663 (= lt!297137 (select (arr!18402 a!2986) index!984))))

(assert (=> d!90663 (validMask!0 mask!3053)))

(assert (=> d!90663 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18402 a!2986) j!136) a!2986 mask!3053) lt!297136)))

(declare-fun b!641795 () Bool)

(assert (=> b!641795 (= e!367499 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18402 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90663 c!73434) b!641797))

