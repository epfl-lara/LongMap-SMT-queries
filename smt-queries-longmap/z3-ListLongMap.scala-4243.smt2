; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58736 () Bool)

(assert start!58736)

(declare-fun b!647485 () Bool)

(declare-fun e!371290 () Bool)

(declare-fun e!371286 () Bool)

(assert (=> b!647485 (= e!371290 (not e!371286))))

(declare-fun res!419554 () Bool)

(assert (=> b!647485 (=> res!419554 e!371286)))

(declare-datatypes ((SeekEntryResult!6895 0))(
  ( (MissingZero!6895 (index!29924 (_ BitVec 32))) (Found!6895 (index!29925 (_ BitVec 32))) (Intermediate!6895 (undefined!7707 Bool) (index!29926 (_ BitVec 32)) (x!58718 (_ BitVec 32))) (Undefined!6895) (MissingVacant!6895 (index!29927 (_ BitVec 32))) )
))
(declare-fun lt!300354 () SeekEntryResult!6895)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!647485 (= res!419554 (not (= lt!300354 (Found!6895 index!984))))))

(declare-datatypes ((Unit!21998 0))(
  ( (Unit!21999) )
))
(declare-fun lt!300369 () Unit!21998)

(declare-fun e!371277 () Unit!21998)

(assert (=> b!647485 (= lt!300369 e!371277)))

(declare-fun c!74339 () Bool)

(assert (=> b!647485 (= c!74339 (= lt!300354 Undefined!6895))))

(declare-fun lt!300356 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38502 0))(
  ( (array!38503 (arr!18458 (Array (_ BitVec 32) (_ BitVec 64))) (size!18823 (_ BitVec 32))) )
))
(declare-fun lt!300368 () array!38502)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38502 (_ BitVec 32)) SeekEntryResult!6895)

(assert (=> b!647485 (= lt!300354 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300356 lt!300368 mask!3053))))

(declare-fun e!371280 () Bool)

(assert (=> b!647485 e!371280))

(declare-fun res!419553 () Bool)

(assert (=> b!647485 (=> (not res!419553) (not e!371280))))

(declare-fun lt!300366 () (_ BitVec 32))

(declare-fun lt!300367 () SeekEntryResult!6895)

(assert (=> b!647485 (= res!419553 (= lt!300367 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 lt!300356 lt!300368 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38502)

(assert (=> b!647485 (= lt!300367 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!647485 (= lt!300356 (select (store (arr!18458 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300365 () Unit!21998)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21998)

(assert (=> b!647485 (= lt!300365 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647485 (= lt!300366 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!647486 () Bool)

(declare-fun res!419559 () Bool)

(declare-fun e!371283 () Bool)

(assert (=> b!647486 (=> (not res!419559) (not e!371283))))

(declare-fun arrayContainsKey!0 (array!38502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647486 (= res!419559 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!647487 () Bool)

(declare-fun e!371284 () Bool)

(declare-fun e!371282 () Bool)

(assert (=> b!647487 (= e!371284 e!371282)))

(declare-fun res!419549 () Bool)

(assert (=> b!647487 (=> res!419549 e!371282)))

(assert (=> b!647487 (= res!419549 (bvsge index!984 j!136))))

(declare-fun lt!300360 () Unit!21998)

(declare-fun e!371279 () Unit!21998)

(assert (=> b!647487 (= lt!300360 e!371279)))

(declare-fun c!74340 () Bool)

(assert (=> b!647487 (= c!74340 (bvslt j!136 index!984))))

(declare-fun b!647488 () Bool)

(declare-fun e!371288 () Bool)

(assert (=> b!647488 (= e!371283 e!371288)))

(declare-fun res!419562 () Bool)

(assert (=> b!647488 (=> (not res!419562) (not e!371288))))

(declare-fun lt!300363 () SeekEntryResult!6895)

(assert (=> b!647488 (= res!419562 (or (= lt!300363 (MissingZero!6895 i!1108)) (= lt!300363 (MissingVacant!6895 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38502 (_ BitVec 32)) SeekEntryResult!6895)

(assert (=> b!647488 (= lt!300363 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!647489 () Bool)

(declare-fun res!419548 () Bool)

(assert (=> b!647489 (=> (not res!419548) (not e!371288))))

(assert (=> b!647489 (= res!419548 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18458 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647490 () Bool)

(declare-fun res!419563 () Bool)

(assert (=> b!647490 (=> (not res!419563) (not e!371283))))

(assert (=> b!647490 (= res!419563 (and (= (size!18823 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18823 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!647491 () Bool)

(declare-fun res!419547 () Bool)

(assert (=> b!647491 (=> (not res!419547) (not e!371283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647491 (= res!419547 (validKeyInArray!0 (select (arr!18458 a!2986) j!136)))))

(declare-fun b!647492 () Bool)

(declare-fun res!419561 () Bool)

(assert (=> b!647492 (=> (not res!419561) (not e!371288))))

(declare-datatypes ((List!12538 0))(
  ( (Nil!12535) (Cons!12534 (h!13579 (_ BitVec 64)) (t!18757 List!12538)) )
))
(declare-fun arrayNoDuplicates!0 (array!38502 (_ BitVec 32) List!12538) Bool)

(assert (=> b!647492 (= res!419561 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12535))))

(declare-fun b!647493 () Bool)

(declare-fun e!371287 () Bool)

(declare-fun contains!3139 (List!12538 (_ BitVec 64)) Bool)

(assert (=> b!647493 (= e!371287 (not (contains!3139 Nil!12535 k0!1786)))))

(declare-fun b!647494 () Bool)

(declare-fun e!371285 () Bool)

(assert (=> b!647494 (= e!371285 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) index!984))))

(declare-fun b!647495 () Bool)

(declare-fun e!371281 () Bool)

(assert (=> b!647495 (= e!371281 e!371290)))

(declare-fun res!419552 () Bool)

(assert (=> b!647495 (=> (not res!419552) (not e!371290))))

(declare-fun lt!300357 () SeekEntryResult!6895)

(assert (=> b!647495 (= res!419552 (and (= lt!300357 (Found!6895 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18458 a!2986) index!984) (select (arr!18458 a!2986) j!136))) (not (= (select (arr!18458 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!647495 (= lt!300357 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647496 () Bool)

(declare-fun res!419541 () Bool)

(assert (=> b!647496 (=> res!419541 e!371287)))

(assert (=> b!647496 (= res!419541 (contains!3139 Nil!12535 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647497 () Bool)

(declare-fun res!419545 () Bool)

(assert (=> b!647497 (=> res!419545 e!371287)))

(declare-fun noDuplicate!422 (List!12538) Bool)

(assert (=> b!647497 (= res!419545 (not (noDuplicate!422 Nil!12535)))))

(declare-fun b!647498 () Bool)

(declare-fun res!419560 () Bool)

(assert (=> b!647498 (=> (not res!419560) (not e!371288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38502 (_ BitVec 32)) Bool)

(assert (=> b!647498 (= res!419560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!647499 () Bool)

(assert (=> b!647499 (= e!371282 e!371287)))

(declare-fun res!419546 () Bool)

(assert (=> b!647499 (=> res!419546 e!371287)))

(assert (=> b!647499 (= res!419546 (or (bvsge (size!18823 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18823 a!2986))))))

(assert (=> b!647499 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300362 () Unit!21998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21998)

(assert (=> b!647499 (= lt!300362 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300368 (select (arr!18458 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371278 () Bool)

(assert (=> b!647499 e!371278))

(declare-fun res!419555 () Bool)

(assert (=> b!647499 (=> (not res!419555) (not e!371278))))

(assert (=> b!647499 (= res!419555 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) j!136))))

(declare-fun b!647500 () Bool)

(declare-fun res!419544 () Bool)

(assert (=> b!647500 (=> res!419544 e!371287)))

(assert (=> b!647500 (= res!419544 (contains!3139 Nil!12535 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647501 () Bool)

(declare-fun Unit!22000 () Unit!21998)

(assert (=> b!647501 (= e!371277 Unit!22000)))

(declare-fun b!647502 () Bool)

(assert (=> b!647502 (= e!371278 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) index!984))))

(declare-fun b!647503 () Bool)

(declare-fun Unit!22001 () Unit!21998)

(assert (=> b!647503 (= e!371279 Unit!22001)))

(declare-fun b!647504 () Bool)

(declare-fun e!371276 () Bool)

(assert (=> b!647504 (= e!371276 e!371285)))

(declare-fun res!419558 () Bool)

(assert (=> b!647504 (=> (not res!419558) (not e!371285))))

(assert (=> b!647504 (= res!419558 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) j!136))))

(declare-fun b!647505 () Bool)

(assert (=> b!647505 (= e!371288 e!371281)))

(declare-fun res!419551 () Bool)

(assert (=> b!647505 (=> (not res!419551) (not e!371281))))

(assert (=> b!647505 (= res!419551 (= (select (store (arr!18458 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647505 (= lt!300368 (array!38503 (store (arr!18458 a!2986) i!1108 k0!1786) (size!18823 a!2986)))))

(declare-fun b!647506 () Bool)

(declare-fun e!371291 () Bool)

(assert (=> b!647506 (= e!371291 e!371276)))

(declare-fun res!419550 () Bool)

(assert (=> b!647506 (=> res!419550 e!371276)))

(declare-fun lt!300359 () (_ BitVec 64))

(assert (=> b!647506 (= res!419550 (or (not (= (select (arr!18458 a!2986) j!136) lt!300356)) (not (= (select (arr!18458 a!2986) j!136) lt!300359)) (bvsge j!136 index!984)))))

(declare-fun b!647507 () Bool)

(assert (=> b!647507 (= e!371280 (= lt!300357 lt!300367))))

(declare-fun b!647508 () Bool)

(declare-fun Unit!22002 () Unit!21998)

(assert (=> b!647508 (= e!371277 Unit!22002)))

(assert (=> b!647508 false))

(declare-fun b!647509 () Bool)

(declare-fun res!419556 () Bool)

(assert (=> b!647509 (=> (not res!419556) (not e!371283))))

(assert (=> b!647509 (= res!419556 (validKeyInArray!0 k0!1786))))

(declare-fun b!647510 () Bool)

(assert (=> b!647510 (= e!371286 e!371284)))

(declare-fun res!419542 () Bool)

(assert (=> b!647510 (=> res!419542 e!371284)))

(assert (=> b!647510 (= res!419542 (or (not (= (select (arr!18458 a!2986) j!136) lt!300356)) (not (= (select (arr!18458 a!2986) j!136) lt!300359))))))

(assert (=> b!647510 e!371291))

(declare-fun res!419543 () Bool)

(assert (=> b!647510 (=> (not res!419543) (not e!371291))))

(assert (=> b!647510 (= res!419543 (= lt!300359 (select (arr!18458 a!2986) j!136)))))

(assert (=> b!647510 (= lt!300359 (select (store (arr!18458 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!647511 () Bool)

(declare-fun Unit!22003 () Unit!21998)

(assert (=> b!647511 (= e!371279 Unit!22003)))

(declare-fun lt!300364 () Unit!21998)

(assert (=> b!647511 (= lt!300364 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300368 (select (arr!18458 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!647511 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300355 () Unit!21998)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12538) Unit!21998)

(assert (=> b!647511 (= lt!300355 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12535))))

(assert (=> b!647511 (arrayNoDuplicates!0 lt!300368 #b00000000000000000000000000000000 Nil!12535)))

(declare-fun lt!300358 () Unit!21998)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38502 (_ BitVec 32) (_ BitVec 32)) Unit!21998)

(assert (=> b!647511 (= lt!300358 (lemmaNoDuplicateFromThenFromBigger!0 lt!300368 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647511 (arrayNoDuplicates!0 lt!300368 j!136 Nil!12535)))

(declare-fun lt!300361 () Unit!21998)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38502 (_ BitVec 64) (_ BitVec 32) List!12538) Unit!21998)

(assert (=> b!647511 (= lt!300361 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300368 (select (arr!18458 a!2986) j!136) j!136 Nil!12535))))

(assert (=> b!647511 false))

(declare-fun res!419557 () Bool)

(assert (=> start!58736 (=> (not res!419557) (not e!371283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58736 (= res!419557 (validMask!0 mask!3053))))

(assert (=> start!58736 e!371283))

(assert (=> start!58736 true))

(declare-fun array_inv!14341 (array!38502) Bool)

(assert (=> start!58736 (array_inv!14341 a!2986)))

(assert (= (and start!58736 res!419557) b!647490))

(assert (= (and b!647490 res!419563) b!647491))

(assert (= (and b!647491 res!419547) b!647509))

(assert (= (and b!647509 res!419556) b!647486))

(assert (= (and b!647486 res!419559) b!647488))

(assert (= (and b!647488 res!419562) b!647498))

(assert (= (and b!647498 res!419560) b!647492))

(assert (= (and b!647492 res!419561) b!647489))

(assert (= (and b!647489 res!419548) b!647505))

(assert (= (and b!647505 res!419551) b!647495))

(assert (= (and b!647495 res!419552) b!647485))

(assert (= (and b!647485 res!419553) b!647507))

(assert (= (and b!647485 c!74339) b!647508))

(assert (= (and b!647485 (not c!74339)) b!647501))

(assert (= (and b!647485 (not res!419554)) b!647510))

(assert (= (and b!647510 res!419543) b!647506))

(assert (= (and b!647506 (not res!419550)) b!647504))

(assert (= (and b!647504 res!419558) b!647494))

(assert (= (and b!647510 (not res!419542)) b!647487))

(assert (= (and b!647487 c!74340) b!647511))

(assert (= (and b!647487 (not c!74340)) b!647503))

(assert (= (and b!647487 (not res!419549)) b!647499))

(assert (= (and b!647499 res!419555) b!647502))

(assert (= (and b!647499 (not res!419546)) b!647497))

(assert (= (and b!647497 (not res!419545)) b!647500))

(assert (= (and b!647500 (not res!419544)) b!647496))

(assert (= (and b!647496 (not res!419541)) b!647493))

(declare-fun m!620391 () Bool)

(assert (=> b!647502 m!620391))

(assert (=> b!647502 m!620391))

(declare-fun m!620393 () Bool)

(assert (=> b!647502 m!620393))

(declare-fun m!620395 () Bool)

(assert (=> b!647500 m!620395))

(assert (=> b!647491 m!620391))

(assert (=> b!647491 m!620391))

(declare-fun m!620397 () Bool)

(assert (=> b!647491 m!620397))

(declare-fun m!620399 () Bool)

(assert (=> b!647498 m!620399))

(declare-fun m!620401 () Bool)

(assert (=> b!647488 m!620401))

(declare-fun m!620403 () Bool)

(assert (=> b!647497 m!620403))

(assert (=> b!647506 m!620391))

(declare-fun m!620405 () Bool)

(assert (=> b!647486 m!620405))

(declare-fun m!620407 () Bool)

(assert (=> start!58736 m!620407))

(declare-fun m!620409 () Bool)

(assert (=> start!58736 m!620409))

(assert (=> b!647504 m!620391))

(assert (=> b!647504 m!620391))

(declare-fun m!620411 () Bool)

(assert (=> b!647504 m!620411))

(declare-fun m!620413 () Bool)

(assert (=> b!647492 m!620413))

(declare-fun m!620415 () Bool)

(assert (=> b!647495 m!620415))

(assert (=> b!647495 m!620391))

(assert (=> b!647495 m!620391))

(declare-fun m!620417 () Bool)

(assert (=> b!647495 m!620417))

(assert (=> b!647511 m!620391))

(assert (=> b!647511 m!620391))

(declare-fun m!620419 () Bool)

(assert (=> b!647511 m!620419))

(declare-fun m!620421 () Bool)

(assert (=> b!647511 m!620421))

(declare-fun m!620423 () Bool)

(assert (=> b!647511 m!620423))

(declare-fun m!620425 () Bool)

(assert (=> b!647511 m!620425))

(assert (=> b!647511 m!620391))

(declare-fun m!620427 () Bool)

(assert (=> b!647511 m!620427))

(assert (=> b!647511 m!620391))

(declare-fun m!620429 () Bool)

(assert (=> b!647511 m!620429))

(declare-fun m!620431 () Bool)

(assert (=> b!647511 m!620431))

(assert (=> b!647499 m!620391))

(assert (=> b!647499 m!620391))

(declare-fun m!620433 () Bool)

(assert (=> b!647499 m!620433))

(assert (=> b!647499 m!620391))

(declare-fun m!620435 () Bool)

(assert (=> b!647499 m!620435))

(assert (=> b!647499 m!620391))

(assert (=> b!647499 m!620411))

(assert (=> b!647494 m!620391))

(assert (=> b!647494 m!620391))

(assert (=> b!647494 m!620393))

(declare-fun m!620437 () Bool)

(assert (=> b!647505 m!620437))

(declare-fun m!620439 () Bool)

(assert (=> b!647505 m!620439))

(assert (=> b!647510 m!620391))

(assert (=> b!647510 m!620437))

(declare-fun m!620441 () Bool)

(assert (=> b!647510 m!620441))

(declare-fun m!620443 () Bool)

(assert (=> b!647493 m!620443))

(declare-fun m!620445 () Bool)

(assert (=> b!647496 m!620445))

(declare-fun m!620447 () Bool)

(assert (=> b!647485 m!620447))

(declare-fun m!620449 () Bool)

(assert (=> b!647485 m!620449))

(declare-fun m!620451 () Bool)

(assert (=> b!647485 m!620451))

(assert (=> b!647485 m!620391))

(assert (=> b!647485 m!620437))

(declare-fun m!620453 () Bool)

(assert (=> b!647485 m!620453))

(assert (=> b!647485 m!620391))

(declare-fun m!620455 () Bool)

(assert (=> b!647485 m!620455))

(declare-fun m!620457 () Bool)

(assert (=> b!647485 m!620457))

(declare-fun m!620459 () Bool)

(assert (=> b!647489 m!620459))

(declare-fun m!620461 () Bool)

(assert (=> b!647509 m!620461))

(check-sat (not b!647485) (not b!647509) (not b!647499) (not b!647495) (not b!647492) (not b!647511) (not b!647493) (not b!647496) (not b!647494) (not b!647498) (not b!647488) (not b!647502) (not b!647486) (not b!647491) (not b!647497) (not b!647504) (not start!58736) (not b!647500))
(check-sat)
(get-model)

(declare-fun d!91485 () Bool)

(assert (=> d!91485 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18823 lt!300368)) (not (= (select (arr!18458 lt!300368) j!136) (select (arr!18458 a!2986) j!136))))))

(declare-fun lt!300468 () Unit!21998)

(declare-fun choose!21 (array!38502 (_ BitVec 64) (_ BitVec 32) List!12538) Unit!21998)

(assert (=> d!91485 (= lt!300468 (choose!21 lt!300368 (select (arr!18458 a!2986) j!136) j!136 Nil!12535))))

(assert (=> d!91485 (bvslt (size!18823 lt!300368) #b01111111111111111111111111111111)))

(assert (=> d!91485 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300368 (select (arr!18458 a!2986) j!136) j!136 Nil!12535) lt!300468)))

(declare-fun bs!19323 () Bool)

(assert (= bs!19323 d!91485))

(declare-fun m!620607 () Bool)

(assert (=> bs!19323 m!620607))

(assert (=> bs!19323 m!620391))

(declare-fun m!620609 () Bool)

(assert (=> bs!19323 m!620609))

(assert (=> b!647511 d!91485))

(declare-fun d!91487 () Bool)

(declare-fun res!419706 () Bool)

(declare-fun e!371392 () Bool)

(assert (=> d!91487 (=> res!419706 e!371392)))

(assert (=> d!91487 (= res!419706 (= (select (arr!18458 lt!300368) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18458 a!2986) j!136)))))

(assert (=> d!91487 (= (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371392)))

(declare-fun b!647678 () Bool)

(declare-fun e!371393 () Bool)

(assert (=> b!647678 (= e!371392 e!371393)))

(declare-fun res!419707 () Bool)

(assert (=> b!647678 (=> (not res!419707) (not e!371393))))

(assert (=> b!647678 (= res!419707 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18823 lt!300368)))))

(declare-fun b!647679 () Bool)

(assert (=> b!647679 (= e!371393 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91487 (not res!419706)) b!647678))

(assert (= (and b!647678 res!419707) b!647679))

(declare-fun m!620611 () Bool)

(assert (=> d!91487 m!620611))

(assert (=> b!647679 m!620391))

(declare-fun m!620613 () Bool)

(assert (=> b!647679 m!620613))

(assert (=> b!647511 d!91487))

(declare-fun d!91489 () Bool)

(assert (=> d!91489 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300471 () Unit!21998)

(declare-fun choose!114 (array!38502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21998)

(assert (=> d!91489 (= lt!300471 (choose!114 lt!300368 (select (arr!18458 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91489 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91489 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300368 (select (arr!18458 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300471)))

(declare-fun bs!19324 () Bool)

(assert (= bs!19324 d!91489))

(assert (=> bs!19324 m!620391))

(assert (=> bs!19324 m!620429))

(assert (=> bs!19324 m!620391))

(declare-fun m!620615 () Bool)

(assert (=> bs!19324 m!620615))

(assert (=> b!647511 d!91489))

(declare-fun b!647690 () Bool)

(declare-fun e!371404 () Bool)

(declare-fun call!33679 () Bool)

(assert (=> b!647690 (= e!371404 call!33679)))

(declare-fun d!91491 () Bool)

(declare-fun res!419714 () Bool)

(declare-fun e!371405 () Bool)

(assert (=> d!91491 (=> res!419714 e!371405)))

(assert (=> d!91491 (= res!419714 (bvsge #b00000000000000000000000000000000 (size!18823 lt!300368)))))

(assert (=> d!91491 (= (arrayNoDuplicates!0 lt!300368 #b00000000000000000000000000000000 Nil!12535) e!371405)))

(declare-fun b!647691 () Bool)

(declare-fun e!371402 () Bool)

(assert (=> b!647691 (= e!371402 (contains!3139 Nil!12535 (select (arr!18458 lt!300368) #b00000000000000000000000000000000)))))

(declare-fun bm!33676 () Bool)

(declare-fun c!74355 () Bool)

(assert (=> bm!33676 (= call!33679 (arrayNoDuplicates!0 lt!300368 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74355 (Cons!12534 (select (arr!18458 lt!300368) #b00000000000000000000000000000000) Nil!12535) Nil!12535)))))

(declare-fun b!647692 () Bool)

(assert (=> b!647692 (= e!371404 call!33679)))

(declare-fun b!647693 () Bool)

(declare-fun e!371403 () Bool)

(assert (=> b!647693 (= e!371405 e!371403)))

(declare-fun res!419716 () Bool)

(assert (=> b!647693 (=> (not res!419716) (not e!371403))))

(assert (=> b!647693 (= res!419716 (not e!371402))))

(declare-fun res!419715 () Bool)

(assert (=> b!647693 (=> (not res!419715) (not e!371402))))

(assert (=> b!647693 (= res!419715 (validKeyInArray!0 (select (arr!18458 lt!300368) #b00000000000000000000000000000000)))))

(declare-fun b!647694 () Bool)

(assert (=> b!647694 (= e!371403 e!371404)))

(assert (=> b!647694 (= c!74355 (validKeyInArray!0 (select (arr!18458 lt!300368) #b00000000000000000000000000000000)))))

(assert (= (and d!91491 (not res!419714)) b!647693))

(assert (= (and b!647693 res!419715) b!647691))

(assert (= (and b!647693 res!419716) b!647694))

(assert (= (and b!647694 c!74355) b!647690))

(assert (= (and b!647694 (not c!74355)) b!647692))

(assert (= (or b!647690 b!647692) bm!33676))

(declare-fun m!620617 () Bool)

(assert (=> b!647691 m!620617))

(assert (=> b!647691 m!620617))

(declare-fun m!620619 () Bool)

(assert (=> b!647691 m!620619))

(assert (=> bm!33676 m!620617))

(declare-fun m!620621 () Bool)

(assert (=> bm!33676 m!620621))

(assert (=> b!647693 m!620617))

(assert (=> b!647693 m!620617))

(declare-fun m!620623 () Bool)

(assert (=> b!647693 m!620623))

(assert (=> b!647694 m!620617))

(assert (=> b!647694 m!620617))

(assert (=> b!647694 m!620623))

(assert (=> b!647511 d!91491))

(declare-fun d!91493 () Bool)

(assert (=> d!91493 (arrayNoDuplicates!0 lt!300368 j!136 Nil!12535)))

(declare-fun lt!300474 () Unit!21998)

(declare-fun choose!39 (array!38502 (_ BitVec 32) (_ BitVec 32)) Unit!21998)

(assert (=> d!91493 (= lt!300474 (choose!39 lt!300368 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91493 (bvslt (size!18823 lt!300368) #b01111111111111111111111111111111)))

(assert (=> d!91493 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300368 #b00000000000000000000000000000000 j!136) lt!300474)))

(declare-fun bs!19325 () Bool)

(assert (= bs!19325 d!91493))

(assert (=> bs!19325 m!620423))

(declare-fun m!620625 () Bool)

(assert (=> bs!19325 m!620625))

(assert (=> b!647511 d!91493))

(declare-fun b!647695 () Bool)

(declare-fun e!371408 () Bool)

(declare-fun call!33680 () Bool)

(assert (=> b!647695 (= e!371408 call!33680)))

(declare-fun d!91495 () Bool)

(declare-fun res!419717 () Bool)

(declare-fun e!371409 () Bool)

(assert (=> d!91495 (=> res!419717 e!371409)))

(assert (=> d!91495 (= res!419717 (bvsge j!136 (size!18823 lt!300368)))))

(assert (=> d!91495 (= (arrayNoDuplicates!0 lt!300368 j!136 Nil!12535) e!371409)))

(declare-fun b!647696 () Bool)

(declare-fun e!371406 () Bool)

(assert (=> b!647696 (= e!371406 (contains!3139 Nil!12535 (select (arr!18458 lt!300368) j!136)))))

(declare-fun bm!33677 () Bool)

(declare-fun c!74356 () Bool)

(assert (=> bm!33677 (= call!33680 (arrayNoDuplicates!0 lt!300368 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74356 (Cons!12534 (select (arr!18458 lt!300368) j!136) Nil!12535) Nil!12535)))))

(declare-fun b!647697 () Bool)

(assert (=> b!647697 (= e!371408 call!33680)))

(declare-fun b!647698 () Bool)

(declare-fun e!371407 () Bool)

(assert (=> b!647698 (= e!371409 e!371407)))

(declare-fun res!419719 () Bool)

(assert (=> b!647698 (=> (not res!419719) (not e!371407))))

(assert (=> b!647698 (= res!419719 (not e!371406))))

(declare-fun res!419718 () Bool)

(assert (=> b!647698 (=> (not res!419718) (not e!371406))))

(assert (=> b!647698 (= res!419718 (validKeyInArray!0 (select (arr!18458 lt!300368) j!136)))))

(declare-fun b!647699 () Bool)

(assert (=> b!647699 (= e!371407 e!371408)))

(assert (=> b!647699 (= c!74356 (validKeyInArray!0 (select (arr!18458 lt!300368) j!136)))))

(assert (= (and d!91495 (not res!419717)) b!647698))

(assert (= (and b!647698 res!419718) b!647696))

(assert (= (and b!647698 res!419719) b!647699))

(assert (= (and b!647699 c!74356) b!647695))

(assert (= (and b!647699 (not c!74356)) b!647697))

(assert (= (or b!647695 b!647697) bm!33677))

(assert (=> b!647696 m!620607))

(assert (=> b!647696 m!620607))

(declare-fun m!620627 () Bool)

(assert (=> b!647696 m!620627))

(assert (=> bm!33677 m!620607))

(declare-fun m!620629 () Bool)

(assert (=> bm!33677 m!620629))

(assert (=> b!647698 m!620607))

(assert (=> b!647698 m!620607))

(declare-fun m!620631 () Bool)

(assert (=> b!647698 m!620631))

(assert (=> b!647699 m!620607))

(assert (=> b!647699 m!620607))

(assert (=> b!647699 m!620631))

(assert (=> b!647511 d!91495))

(declare-fun d!91497 () Bool)

(declare-fun e!371412 () Bool)

(assert (=> d!91497 e!371412))

(declare-fun res!419722 () Bool)

(assert (=> d!91497 (=> (not res!419722) (not e!371412))))

(assert (=> d!91497 (= res!419722 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986))))))

(declare-fun lt!300477 () Unit!21998)

(declare-fun choose!41 (array!38502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12538) Unit!21998)

(assert (=> d!91497 (= lt!300477 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12535))))

(assert (=> d!91497 (bvslt (size!18823 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91497 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12535) lt!300477)))

(declare-fun b!647702 () Bool)

(assert (=> b!647702 (= e!371412 (arrayNoDuplicates!0 (array!38503 (store (arr!18458 a!2986) i!1108 k0!1786) (size!18823 a!2986)) #b00000000000000000000000000000000 Nil!12535))))

(assert (= (and d!91497 res!419722) b!647702))

(declare-fun m!620633 () Bool)

(assert (=> d!91497 m!620633))

(assert (=> b!647702 m!620437))

(declare-fun m!620635 () Bool)

(assert (=> b!647702 m!620635))

(assert (=> b!647511 d!91497))

(declare-fun d!91499 () Bool)

(declare-fun lt!300480 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!250 (List!12538) (InoxSet (_ BitVec 64)))

(assert (=> d!91499 (= lt!300480 (select (content!250 Nil!12535) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371418 () Bool)

(assert (=> d!91499 (= lt!300480 e!371418)))

(declare-fun res!419727 () Bool)

(assert (=> d!91499 (=> (not res!419727) (not e!371418))))

(get-info :version)

(assert (=> d!91499 (= res!419727 ((_ is Cons!12534) Nil!12535))))

(assert (=> d!91499 (= (contains!3139 Nil!12535 #b0000000000000000000000000000000000000000000000000000000000000000) lt!300480)))

(declare-fun b!647707 () Bool)

(declare-fun e!371417 () Bool)

(assert (=> b!647707 (= e!371418 e!371417)))

(declare-fun res!419728 () Bool)

(assert (=> b!647707 (=> res!419728 e!371417)))

(assert (=> b!647707 (= res!419728 (= (h!13579 Nil!12535) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647708 () Bool)

(assert (=> b!647708 (= e!371417 (contains!3139 (t!18757 Nil!12535) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91499 res!419727) b!647707))

(assert (= (and b!647707 (not res!419728)) b!647708))

(declare-fun m!620637 () Bool)

(assert (=> d!91499 m!620637))

(declare-fun m!620639 () Bool)

(assert (=> d!91499 m!620639))

(declare-fun m!620641 () Bool)

(assert (=> b!647708 m!620641))

(assert (=> b!647500 d!91499))

(declare-fun d!91501 () Bool)

(declare-fun res!419729 () Bool)

(declare-fun e!371419 () Bool)

(assert (=> d!91501 (=> res!419729 e!371419)))

(assert (=> d!91501 (= res!419729 (= (select (arr!18458 lt!300368) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18458 a!2986) j!136)))))

(assert (=> d!91501 (= (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371419)))

(declare-fun b!647709 () Bool)

(declare-fun e!371420 () Bool)

(assert (=> b!647709 (= e!371419 e!371420)))

(declare-fun res!419730 () Bool)

(assert (=> b!647709 (=> (not res!419730) (not e!371420))))

(assert (=> b!647709 (= res!419730 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18823 lt!300368)))))

(declare-fun b!647710 () Bool)

(assert (=> b!647710 (= e!371420 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91501 (not res!419729)) b!647709))

(assert (= (and b!647709 res!419730) b!647710))

(declare-fun m!620643 () Bool)

(assert (=> d!91501 m!620643))

(assert (=> b!647710 m!620391))

(declare-fun m!620645 () Bool)

(assert (=> b!647710 m!620645))

(assert (=> b!647499 d!91501))

(declare-fun d!91503 () Bool)

(assert (=> d!91503 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300481 () Unit!21998)

(assert (=> d!91503 (= lt!300481 (choose!114 lt!300368 (select (arr!18458 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91503 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91503 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300368 (select (arr!18458 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300481)))

(declare-fun bs!19326 () Bool)

(assert (= bs!19326 d!91503))

(assert (=> bs!19326 m!620391))

(assert (=> bs!19326 m!620433))

(assert (=> bs!19326 m!620391))

(declare-fun m!620647 () Bool)

(assert (=> bs!19326 m!620647))

(assert (=> b!647499 d!91503))

(declare-fun d!91505 () Bool)

(declare-fun res!419731 () Bool)

(declare-fun e!371421 () Bool)

(assert (=> d!91505 (=> res!419731 e!371421)))

(assert (=> d!91505 (= res!419731 (= (select (arr!18458 lt!300368) j!136) (select (arr!18458 a!2986) j!136)))))

(assert (=> d!91505 (= (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) j!136) e!371421)))

(declare-fun b!647711 () Bool)

(declare-fun e!371422 () Bool)

(assert (=> b!647711 (= e!371421 e!371422)))

(declare-fun res!419732 () Bool)

(assert (=> b!647711 (=> (not res!419732) (not e!371422))))

(assert (=> b!647711 (= res!419732 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18823 lt!300368)))))

(declare-fun b!647712 () Bool)

(assert (=> b!647712 (= e!371422 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91505 (not res!419731)) b!647711))

(assert (= (and b!647711 res!419732) b!647712))

(assert (=> d!91505 m!620607))

(assert (=> b!647712 m!620391))

(declare-fun m!620649 () Bool)

(assert (=> b!647712 m!620649))

(assert (=> b!647499 d!91505))

(declare-fun d!91507 () Bool)

(assert (=> d!91507 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647509 d!91507))

(declare-fun b!647749 () Bool)

(declare-fun c!74368 () Bool)

(declare-fun lt!300493 () (_ BitVec 64))

(assert (=> b!647749 (= c!74368 (= lt!300493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371452 () SeekEntryResult!6895)

(declare-fun e!371451 () SeekEntryResult!6895)

(assert (=> b!647749 (= e!371452 e!371451)))

(declare-fun b!647750 () Bool)

(declare-fun lt!300491 () SeekEntryResult!6895)

(assert (=> b!647750 (= e!371451 (MissingZero!6895 (index!29926 lt!300491)))))

(declare-fun b!647751 () Bool)

(assert (=> b!647751 (= e!371451 (seekKeyOrZeroReturnVacant!0 (x!58718 lt!300491) (index!29926 lt!300491) (index!29926 lt!300491) k0!1786 a!2986 mask!3053))))

(declare-fun d!91509 () Bool)

(declare-fun lt!300492 () SeekEntryResult!6895)

(assert (=> d!91509 (and (or ((_ is Undefined!6895) lt!300492) (not ((_ is Found!6895) lt!300492)) (and (bvsge (index!29925 lt!300492) #b00000000000000000000000000000000) (bvslt (index!29925 lt!300492) (size!18823 a!2986)))) (or ((_ is Undefined!6895) lt!300492) ((_ is Found!6895) lt!300492) (not ((_ is MissingZero!6895) lt!300492)) (and (bvsge (index!29924 lt!300492) #b00000000000000000000000000000000) (bvslt (index!29924 lt!300492) (size!18823 a!2986)))) (or ((_ is Undefined!6895) lt!300492) ((_ is Found!6895) lt!300492) ((_ is MissingZero!6895) lt!300492) (not ((_ is MissingVacant!6895) lt!300492)) (and (bvsge (index!29927 lt!300492) #b00000000000000000000000000000000) (bvslt (index!29927 lt!300492) (size!18823 a!2986)))) (or ((_ is Undefined!6895) lt!300492) (ite ((_ is Found!6895) lt!300492) (= (select (arr!18458 a!2986) (index!29925 lt!300492)) k0!1786) (ite ((_ is MissingZero!6895) lt!300492) (= (select (arr!18458 a!2986) (index!29924 lt!300492)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6895) lt!300492) (= (select (arr!18458 a!2986) (index!29927 lt!300492)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!371450 () SeekEntryResult!6895)

(assert (=> d!91509 (= lt!300492 e!371450)))

(declare-fun c!74367 () Bool)

(assert (=> d!91509 (= c!74367 (and ((_ is Intermediate!6895) lt!300491) (undefined!7707 lt!300491)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38502 (_ BitVec 32)) SeekEntryResult!6895)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91509 (= lt!300491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91509 (validMask!0 mask!3053)))

(assert (=> d!91509 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300492)))

(declare-fun b!647752 () Bool)

(assert (=> b!647752 (= e!371450 Undefined!6895)))

(declare-fun b!647753 () Bool)

(assert (=> b!647753 (= e!371452 (Found!6895 (index!29926 lt!300491)))))

(declare-fun b!647754 () Bool)

(assert (=> b!647754 (= e!371450 e!371452)))

(assert (=> b!647754 (= lt!300493 (select (arr!18458 a!2986) (index!29926 lt!300491)))))

(declare-fun c!74366 () Bool)

(assert (=> b!647754 (= c!74366 (= lt!300493 k0!1786))))

(assert (= (and d!91509 c!74367) b!647752))

(assert (= (and d!91509 (not c!74367)) b!647754))

(assert (= (and b!647754 c!74366) b!647753))

(assert (= (and b!647754 (not c!74366)) b!647749))

(assert (= (and b!647749 c!74368) b!647750))

(assert (= (and b!647749 (not c!74368)) b!647751))

(declare-fun m!620667 () Bool)

(assert (=> b!647751 m!620667))

(declare-fun m!620669 () Bool)

(assert (=> d!91509 m!620669))

(declare-fun m!620671 () Bool)

(assert (=> d!91509 m!620671))

(declare-fun m!620673 () Bool)

(assert (=> d!91509 m!620673))

(assert (=> d!91509 m!620671))

(assert (=> d!91509 m!620407))

(declare-fun m!620675 () Bool)

(assert (=> d!91509 m!620675))

(declare-fun m!620677 () Bool)

(assert (=> d!91509 m!620677))

(declare-fun m!620679 () Bool)

(assert (=> b!647754 m!620679))

(assert (=> b!647488 d!91509))

(declare-fun b!647767 () Bool)

(declare-fun e!371461 () Bool)

(declare-fun call!33684 () Bool)

(assert (=> b!647767 (= e!371461 call!33684)))

(declare-fun d!91521 () Bool)

(declare-fun res!419751 () Bool)

(declare-fun e!371462 () Bool)

(assert (=> d!91521 (=> res!419751 e!371462)))

(assert (=> d!91521 (= res!419751 (bvsge #b00000000000000000000000000000000 (size!18823 a!2986)))))

(assert (=> d!91521 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12535) e!371462)))

(declare-fun b!647768 () Bool)

(declare-fun e!371459 () Bool)

(assert (=> b!647768 (= e!371459 (contains!3139 Nil!12535 (select (arr!18458 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33681 () Bool)

(declare-fun c!74375 () Bool)

(assert (=> bm!33681 (= call!33684 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74375 (Cons!12534 (select (arr!18458 a!2986) #b00000000000000000000000000000000) Nil!12535) Nil!12535)))))

(declare-fun b!647769 () Bool)

(assert (=> b!647769 (= e!371461 call!33684)))

(declare-fun b!647770 () Bool)

(declare-fun e!371460 () Bool)

(assert (=> b!647770 (= e!371462 e!371460)))

(declare-fun res!419753 () Bool)

(assert (=> b!647770 (=> (not res!419753) (not e!371460))))

(assert (=> b!647770 (= res!419753 (not e!371459))))

(declare-fun res!419752 () Bool)

(assert (=> b!647770 (=> (not res!419752) (not e!371459))))

(assert (=> b!647770 (= res!419752 (validKeyInArray!0 (select (arr!18458 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647771 () Bool)

(assert (=> b!647771 (= e!371460 e!371461)))

(assert (=> b!647771 (= c!74375 (validKeyInArray!0 (select (arr!18458 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91521 (not res!419751)) b!647770))

(assert (= (and b!647770 res!419752) b!647768))

(assert (= (and b!647770 res!419753) b!647771))

(assert (= (and b!647771 c!74375) b!647767))

(assert (= (and b!647771 (not c!74375)) b!647769))

(assert (= (or b!647767 b!647769) bm!33681))

(declare-fun m!620683 () Bool)

(assert (=> b!647768 m!620683))

(assert (=> b!647768 m!620683))

(declare-fun m!620685 () Bool)

(assert (=> b!647768 m!620685))

(assert (=> bm!33681 m!620683))

(declare-fun m!620687 () Bool)

(assert (=> bm!33681 m!620687))

(assert (=> b!647770 m!620683))

(assert (=> b!647770 m!620683))

(declare-fun m!620689 () Bool)

(assert (=> b!647770 m!620689))

(assert (=> b!647771 m!620683))

(assert (=> b!647771 m!620683))

(assert (=> b!647771 m!620689))

(assert (=> b!647492 d!91521))

(declare-fun d!91525 () Bool)

(assert (=> d!91525 (= (validKeyInArray!0 (select (arr!18458 a!2986) j!136)) (and (not (= (select (arr!18458 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18458 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647491 d!91525))

(declare-fun d!91527 () Bool)

(declare-fun res!419754 () Bool)

(declare-fun e!371463 () Bool)

(assert (=> d!91527 (=> res!419754 e!371463)))

(assert (=> d!91527 (= res!419754 (= (select (arr!18458 lt!300368) index!984) (select (arr!18458 a!2986) j!136)))))

(assert (=> d!91527 (= (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) index!984) e!371463)))

(declare-fun b!647772 () Bool)

(declare-fun e!371464 () Bool)

(assert (=> b!647772 (= e!371463 e!371464)))

(declare-fun res!419755 () Bool)

(assert (=> b!647772 (=> (not res!419755) (not e!371464))))

(assert (=> b!647772 (= res!419755 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18823 lt!300368)))))

(declare-fun b!647773 () Bool)

(assert (=> b!647773 (= e!371464 (arrayContainsKey!0 lt!300368 (select (arr!18458 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91527 (not res!419754)) b!647772))

(assert (= (and b!647772 res!419755) b!647773))

(declare-fun m!620691 () Bool)

(assert (=> d!91527 m!620691))

(assert (=> b!647773 m!620391))

(declare-fun m!620693 () Bool)

(assert (=> b!647773 m!620693))

(assert (=> b!647502 d!91527))

(declare-fun b!647832 () Bool)

(declare-fun e!371511 () SeekEntryResult!6895)

(assert (=> b!647832 (= e!371511 Undefined!6895)))

(declare-fun b!647833 () Bool)

(declare-fun e!371510 () SeekEntryResult!6895)

(assert (=> b!647833 (= e!371510 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647834 () Bool)

(declare-fun c!74389 () Bool)

(declare-fun lt!300526 () (_ BitVec 64))

(assert (=> b!647834 (= c!74389 (= lt!300526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371512 () SeekEntryResult!6895)

(assert (=> b!647834 (= e!371512 e!371510)))

(declare-fun b!647836 () Bool)

(assert (=> b!647836 (= e!371510 (MissingVacant!6895 vacantSpotIndex!68))))

(declare-fun b!647837 () Bool)

(assert (=> b!647837 (= e!371512 (Found!6895 index!984))))

(declare-fun lt!300527 () SeekEntryResult!6895)

(declare-fun d!91529 () Bool)

(assert (=> d!91529 (and (or ((_ is Undefined!6895) lt!300527) (not ((_ is Found!6895) lt!300527)) (and (bvsge (index!29925 lt!300527) #b00000000000000000000000000000000) (bvslt (index!29925 lt!300527) (size!18823 a!2986)))) (or ((_ is Undefined!6895) lt!300527) ((_ is Found!6895) lt!300527) (not ((_ is MissingVacant!6895) lt!300527)) (not (= (index!29927 lt!300527) vacantSpotIndex!68)) (and (bvsge (index!29927 lt!300527) #b00000000000000000000000000000000) (bvslt (index!29927 lt!300527) (size!18823 a!2986)))) (or ((_ is Undefined!6895) lt!300527) (ite ((_ is Found!6895) lt!300527) (= (select (arr!18458 a!2986) (index!29925 lt!300527)) (select (arr!18458 a!2986) j!136)) (and ((_ is MissingVacant!6895) lt!300527) (= (index!29927 lt!300527) vacantSpotIndex!68) (= (select (arr!18458 a!2986) (index!29927 lt!300527)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91529 (= lt!300527 e!371511)))

(declare-fun c!74390 () Bool)

(assert (=> d!91529 (= c!74390 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91529 (= lt!300526 (select (arr!18458 a!2986) index!984))))

(assert (=> d!91529 (validMask!0 mask!3053)))

(assert (=> d!91529 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053) lt!300527)))

(declare-fun b!647835 () Bool)

(assert (=> b!647835 (= e!371511 e!371512)))

(declare-fun c!74391 () Bool)

(assert (=> b!647835 (= c!74391 (= lt!300526 (select (arr!18458 a!2986) j!136)))))

(assert (= (and d!91529 c!74390) b!647832))

(assert (= (and d!91529 (not c!74390)) b!647835))

(assert (= (and b!647835 c!74391) b!647837))

(assert (= (and b!647835 (not c!74391)) b!647834))

(assert (= (and b!647834 c!74389) b!647836))

(assert (= (and b!647834 (not c!74389)) b!647833))

(assert (=> b!647833 m!620447))

(assert (=> b!647833 m!620447))

(assert (=> b!647833 m!620391))

(declare-fun m!620743 () Bool)

(assert (=> b!647833 m!620743))

(declare-fun m!620745 () Bool)

(assert (=> d!91529 m!620745))

(declare-fun m!620747 () Bool)

(assert (=> d!91529 m!620747))

(assert (=> d!91529 m!620415))

(assert (=> d!91529 m!620407))

(assert (=> b!647495 d!91529))

(declare-fun d!91557 () Bool)

(assert (=> d!91557 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58736 d!91557))

(declare-fun d!91577 () Bool)

(assert (=> d!91577 (= (array_inv!14341 a!2986) (bvsge (size!18823 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58736 d!91577))

(assert (=> b!647494 d!91527))

(declare-fun d!91579 () Bool)

(declare-fun lt!300547 () Bool)

(assert (=> d!91579 (= lt!300547 (select (content!250 Nil!12535) k0!1786))))

(declare-fun e!371542 () Bool)

(assert (=> d!91579 (= lt!300547 e!371542)))

(declare-fun res!419812 () Bool)

(assert (=> d!91579 (=> (not res!419812) (not e!371542))))

(assert (=> d!91579 (= res!419812 ((_ is Cons!12534) Nil!12535))))

(assert (=> d!91579 (= (contains!3139 Nil!12535 k0!1786) lt!300547)))

(declare-fun b!647872 () Bool)

(declare-fun e!371541 () Bool)

(assert (=> b!647872 (= e!371542 e!371541)))

(declare-fun res!419813 () Bool)

(assert (=> b!647872 (=> res!419813 e!371541)))

(assert (=> b!647872 (= res!419813 (= (h!13579 Nil!12535) k0!1786))))

(declare-fun b!647873 () Bool)

(assert (=> b!647873 (= e!371541 (contains!3139 (t!18757 Nil!12535) k0!1786))))

(assert (= (and d!91579 res!419812) b!647872))

(assert (= (and b!647872 (not res!419813)) b!647873))

(assert (=> d!91579 m!620637))

(declare-fun m!620787 () Bool)

(assert (=> d!91579 m!620787))

(declare-fun m!620789 () Bool)

(assert (=> b!647873 m!620789))

(assert (=> b!647493 d!91579))

(assert (=> b!647504 d!91505))

(declare-fun d!91581 () Bool)

(declare-fun res!419821 () Bool)

(declare-fun e!371562 () Bool)

(assert (=> d!91581 (=> res!419821 e!371562)))

(assert (=> d!91581 (= res!419821 (bvsge #b00000000000000000000000000000000 (size!18823 a!2986)))))

(assert (=> d!91581 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371562)))

(declare-fun b!647900 () Bool)

(declare-fun e!371561 () Bool)

(declare-fun call!33695 () Bool)

(assert (=> b!647900 (= e!371561 call!33695)))

(declare-fun b!647901 () Bool)

(declare-fun e!371560 () Bool)

(assert (=> b!647901 (= e!371562 e!371560)))

(declare-fun c!74407 () Bool)

(assert (=> b!647901 (= c!74407 (validKeyInArray!0 (select (arr!18458 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647902 () Bool)

(assert (=> b!647902 (= e!371560 call!33695)))

(declare-fun bm!33692 () Bool)

(assert (=> bm!33692 (= call!33695 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!647903 () Bool)

(assert (=> b!647903 (= e!371560 e!371561)))

(declare-fun lt!300560 () (_ BitVec 64))

(assert (=> b!647903 (= lt!300560 (select (arr!18458 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300561 () Unit!21998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38502 (_ BitVec 64) (_ BitVec 32)) Unit!21998)

(assert (=> b!647903 (= lt!300561 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300560 #b00000000000000000000000000000000))))

(assert (=> b!647903 (arrayContainsKey!0 a!2986 lt!300560 #b00000000000000000000000000000000)))

(declare-fun lt!300559 () Unit!21998)

(assert (=> b!647903 (= lt!300559 lt!300561)))

(declare-fun res!419820 () Bool)

(assert (=> b!647903 (= res!419820 (= (seekEntryOrOpen!0 (select (arr!18458 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6895 #b00000000000000000000000000000000)))))

(assert (=> b!647903 (=> (not res!419820) (not e!371561))))

(assert (= (and d!91581 (not res!419821)) b!647901))

(assert (= (and b!647901 c!74407) b!647903))

(assert (= (and b!647901 (not c!74407)) b!647902))

(assert (= (and b!647903 res!419820) b!647900))

(assert (= (or b!647900 b!647902) bm!33692))

(assert (=> b!647901 m!620683))

(assert (=> b!647901 m!620683))

(assert (=> b!647901 m!620689))

(declare-fun m!620807 () Bool)

(assert (=> bm!33692 m!620807))

(assert (=> b!647903 m!620683))

(declare-fun m!620809 () Bool)

(assert (=> b!647903 m!620809))

(declare-fun m!620811 () Bool)

(assert (=> b!647903 m!620811))

(assert (=> b!647903 m!620683))

(declare-fun m!620813 () Bool)

(assert (=> b!647903 m!620813))

(assert (=> b!647498 d!91581))

(declare-fun d!91589 () Bool)

(declare-fun res!419826 () Bool)

(declare-fun e!371567 () Bool)

(assert (=> d!91589 (=> res!419826 e!371567)))

(assert (=> d!91589 (= res!419826 ((_ is Nil!12535) Nil!12535))))

(assert (=> d!91589 (= (noDuplicate!422 Nil!12535) e!371567)))

(declare-fun b!647908 () Bool)

(declare-fun e!371568 () Bool)

(assert (=> b!647908 (= e!371567 e!371568)))

(declare-fun res!419827 () Bool)

(assert (=> b!647908 (=> (not res!419827) (not e!371568))))

(assert (=> b!647908 (= res!419827 (not (contains!3139 (t!18757 Nil!12535) (h!13579 Nil!12535))))))

(declare-fun b!647909 () Bool)

(assert (=> b!647909 (= e!371568 (noDuplicate!422 (t!18757 Nil!12535)))))

(assert (= (and d!91589 (not res!419826)) b!647908))

(assert (= (and b!647908 res!419827) b!647909))

(declare-fun m!620815 () Bool)

(assert (=> b!647908 m!620815))

(declare-fun m!620817 () Bool)

(assert (=> b!647909 m!620817))

(assert (=> b!647497 d!91589))

(declare-fun d!91591 () Bool)

(declare-fun res!419828 () Bool)

(declare-fun e!371569 () Bool)

(assert (=> d!91591 (=> res!419828 e!371569)))

(assert (=> d!91591 (= res!419828 (= (select (arr!18458 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91591 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!371569)))

(declare-fun b!647910 () Bool)

(declare-fun e!371570 () Bool)

(assert (=> b!647910 (= e!371569 e!371570)))

(declare-fun res!419829 () Bool)

(assert (=> b!647910 (=> (not res!419829) (not e!371570))))

(assert (=> b!647910 (= res!419829 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18823 a!2986)))))

(declare-fun b!647911 () Bool)

(assert (=> b!647911 (= e!371570 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91591 (not res!419828)) b!647910))

(assert (= (and b!647910 res!419829) b!647911))

(assert (=> d!91591 m!620683))

(declare-fun m!620819 () Bool)

(assert (=> b!647911 m!620819))

(assert (=> b!647486 d!91591))

(declare-fun b!647912 () Bool)

(declare-fun e!371572 () SeekEntryResult!6895)

(assert (=> b!647912 (= e!371572 Undefined!6895)))

(declare-fun e!371571 () SeekEntryResult!6895)

(declare-fun b!647913 () Bool)

(assert (=> b!647913 (= e!371571 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300366 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!300356 lt!300368 mask!3053))))

(declare-fun b!647914 () Bool)

(declare-fun c!74408 () Bool)

(declare-fun lt!300562 () (_ BitVec 64))

(assert (=> b!647914 (= c!74408 (= lt!300562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371573 () SeekEntryResult!6895)

(assert (=> b!647914 (= e!371573 e!371571)))

(declare-fun b!647916 () Bool)

(assert (=> b!647916 (= e!371571 (MissingVacant!6895 vacantSpotIndex!68))))

(declare-fun b!647917 () Bool)

(assert (=> b!647917 (= e!371573 (Found!6895 lt!300366))))

(declare-fun d!91593 () Bool)

(declare-fun lt!300563 () SeekEntryResult!6895)

(assert (=> d!91593 (and (or ((_ is Undefined!6895) lt!300563) (not ((_ is Found!6895) lt!300563)) (and (bvsge (index!29925 lt!300563) #b00000000000000000000000000000000) (bvslt (index!29925 lt!300563) (size!18823 lt!300368)))) (or ((_ is Undefined!6895) lt!300563) ((_ is Found!6895) lt!300563) (not ((_ is MissingVacant!6895) lt!300563)) (not (= (index!29927 lt!300563) vacantSpotIndex!68)) (and (bvsge (index!29927 lt!300563) #b00000000000000000000000000000000) (bvslt (index!29927 lt!300563) (size!18823 lt!300368)))) (or ((_ is Undefined!6895) lt!300563) (ite ((_ is Found!6895) lt!300563) (= (select (arr!18458 lt!300368) (index!29925 lt!300563)) lt!300356) (and ((_ is MissingVacant!6895) lt!300563) (= (index!29927 lt!300563) vacantSpotIndex!68) (= (select (arr!18458 lt!300368) (index!29927 lt!300563)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91593 (= lt!300563 e!371572)))

(declare-fun c!74409 () Bool)

(assert (=> d!91593 (= c!74409 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91593 (= lt!300562 (select (arr!18458 lt!300368) lt!300366))))

(assert (=> d!91593 (validMask!0 mask!3053)))

(assert (=> d!91593 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 lt!300356 lt!300368 mask!3053) lt!300563)))

(declare-fun b!647915 () Bool)

(assert (=> b!647915 (= e!371572 e!371573)))

(declare-fun c!74410 () Bool)

(assert (=> b!647915 (= c!74410 (= lt!300562 lt!300356))))

(assert (= (and d!91593 c!74409) b!647912))

(assert (= (and d!91593 (not c!74409)) b!647915))

(assert (= (and b!647915 c!74410) b!647917))

(assert (= (and b!647915 (not c!74410)) b!647914))

(assert (= (and b!647914 c!74408) b!647916))

(assert (= (and b!647914 (not c!74408)) b!647913))

(declare-fun m!620821 () Bool)

(assert (=> b!647913 m!620821))

(assert (=> b!647913 m!620821))

(declare-fun m!620823 () Bool)

(assert (=> b!647913 m!620823))

(declare-fun m!620825 () Bool)

(assert (=> d!91593 m!620825))

(declare-fun m!620827 () Bool)

(assert (=> d!91593 m!620827))

(declare-fun m!620829 () Bool)

(assert (=> d!91593 m!620829))

(assert (=> d!91593 m!620407))

(assert (=> b!647485 d!91593))

(declare-fun b!647918 () Bool)

(declare-fun e!371575 () SeekEntryResult!6895)

(assert (=> b!647918 (= e!371575 Undefined!6895)))

(declare-fun b!647919 () Bool)

(declare-fun e!371574 () SeekEntryResult!6895)

(assert (=> b!647919 (= e!371574 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!300356 lt!300368 mask!3053))))

(declare-fun b!647920 () Bool)

(declare-fun c!74411 () Bool)

(declare-fun lt!300564 () (_ BitVec 64))

(assert (=> b!647920 (= c!74411 (= lt!300564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371576 () SeekEntryResult!6895)

(assert (=> b!647920 (= e!371576 e!371574)))

(declare-fun b!647922 () Bool)

(assert (=> b!647922 (= e!371574 (MissingVacant!6895 vacantSpotIndex!68))))

(declare-fun b!647923 () Bool)

(assert (=> b!647923 (= e!371576 (Found!6895 index!984))))

(declare-fun d!91595 () Bool)

(declare-fun lt!300565 () SeekEntryResult!6895)

(assert (=> d!91595 (and (or ((_ is Undefined!6895) lt!300565) (not ((_ is Found!6895) lt!300565)) (and (bvsge (index!29925 lt!300565) #b00000000000000000000000000000000) (bvslt (index!29925 lt!300565) (size!18823 lt!300368)))) (or ((_ is Undefined!6895) lt!300565) ((_ is Found!6895) lt!300565) (not ((_ is MissingVacant!6895) lt!300565)) (not (= (index!29927 lt!300565) vacantSpotIndex!68)) (and (bvsge (index!29927 lt!300565) #b00000000000000000000000000000000) (bvslt (index!29927 lt!300565) (size!18823 lt!300368)))) (or ((_ is Undefined!6895) lt!300565) (ite ((_ is Found!6895) lt!300565) (= (select (arr!18458 lt!300368) (index!29925 lt!300565)) lt!300356) (and ((_ is MissingVacant!6895) lt!300565) (= (index!29927 lt!300565) vacantSpotIndex!68) (= (select (arr!18458 lt!300368) (index!29927 lt!300565)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91595 (= lt!300565 e!371575)))

(declare-fun c!74412 () Bool)

(assert (=> d!91595 (= c!74412 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91595 (= lt!300564 (select (arr!18458 lt!300368) index!984))))

(assert (=> d!91595 (validMask!0 mask!3053)))

(assert (=> d!91595 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300356 lt!300368 mask!3053) lt!300565)))

(declare-fun b!647921 () Bool)

(assert (=> b!647921 (= e!371575 e!371576)))

(declare-fun c!74413 () Bool)

(assert (=> b!647921 (= c!74413 (= lt!300564 lt!300356))))

(assert (= (and d!91595 c!74412) b!647918))

(assert (= (and d!91595 (not c!74412)) b!647921))

(assert (= (and b!647921 c!74413) b!647923))

(assert (= (and b!647921 (not c!74413)) b!647920))

(assert (= (and b!647920 c!74411) b!647922))

(assert (= (and b!647920 (not c!74411)) b!647919))

(assert (=> b!647919 m!620447))

(assert (=> b!647919 m!620447))

(declare-fun m!620831 () Bool)

(assert (=> b!647919 m!620831))

(declare-fun m!620833 () Bool)

(assert (=> d!91595 m!620833))

(declare-fun m!620835 () Bool)

(assert (=> d!91595 m!620835))

(assert (=> d!91595 m!620691))

(assert (=> d!91595 m!620407))

(assert (=> b!647485 d!91595))

(declare-fun d!91597 () Bool)

(declare-fun lt!300580 () (_ BitVec 32))

(assert (=> d!91597 (and (bvsge lt!300580 #b00000000000000000000000000000000) (bvslt lt!300580 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91597 (= lt!300580 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91597 (validMask!0 mask!3053)))

(assert (=> d!91597 (= (nextIndex!0 index!984 x!910 mask!3053) lt!300580)))

(declare-fun bs!19331 () Bool)

(assert (= bs!19331 d!91597))

(declare-fun m!620837 () Bool)

(assert (=> bs!19331 m!620837))

(assert (=> bs!19331 m!620407))

(assert (=> b!647485 d!91597))

(declare-fun d!91599 () Bool)

(declare-fun e!371616 () Bool)

(assert (=> d!91599 e!371616))

(declare-fun res!419842 () Bool)

(assert (=> d!91599 (=> (not res!419842) (not e!371616))))

(assert (=> d!91599 (= res!419842 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18823 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18823 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18823 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986))))))

(declare-fun lt!300600 () Unit!21998)

(declare-fun choose!9 (array!38502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21998)

(assert (=> d!91599 (= lt!300600 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91599 (validMask!0 mask!3053)))

(assert (=> d!91599 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 mask!3053) lt!300600)))

(declare-fun b!647990 () Bool)

(assert (=> b!647990 (= e!371616 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 (select (store (arr!18458 a!2986) i!1108 k0!1786) j!136) (array!38503 (store (arr!18458 a!2986) i!1108 k0!1786) (size!18823 a!2986)) mask!3053)))))

(assert (= (and d!91599 res!419842) b!647990))

(declare-fun m!620905 () Bool)

(assert (=> d!91599 m!620905))

(assert (=> d!91599 m!620407))

(assert (=> b!647990 m!620391))

(assert (=> b!647990 m!620455))

(assert (=> b!647990 m!620449))

(declare-fun m!620909 () Bool)

(assert (=> b!647990 m!620909))

(assert (=> b!647990 m!620391))

(assert (=> b!647990 m!620437))

(assert (=> b!647990 m!620449))

(assert (=> b!647485 d!91599))

(declare-fun b!647998 () Bool)

(declare-fun e!371622 () SeekEntryResult!6895)

(assert (=> b!647998 (= e!371622 Undefined!6895)))

(declare-fun b!647999 () Bool)

(declare-fun e!371621 () SeekEntryResult!6895)

(assert (=> b!647999 (= e!371621 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300366 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648000 () Bool)

(declare-fun c!74444 () Bool)

(declare-fun lt!300604 () (_ BitVec 64))

(assert (=> b!648000 (= c!74444 (= lt!300604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371623 () SeekEntryResult!6895)

(assert (=> b!648000 (= e!371623 e!371621)))

(declare-fun b!648002 () Bool)

(assert (=> b!648002 (= e!371621 (MissingVacant!6895 vacantSpotIndex!68))))

(declare-fun b!648003 () Bool)

(assert (=> b!648003 (= e!371623 (Found!6895 lt!300366))))

(declare-fun lt!300605 () SeekEntryResult!6895)

(declare-fun d!91617 () Bool)

(assert (=> d!91617 (and (or ((_ is Undefined!6895) lt!300605) (not ((_ is Found!6895) lt!300605)) (and (bvsge (index!29925 lt!300605) #b00000000000000000000000000000000) (bvslt (index!29925 lt!300605) (size!18823 a!2986)))) (or ((_ is Undefined!6895) lt!300605) ((_ is Found!6895) lt!300605) (not ((_ is MissingVacant!6895) lt!300605)) (not (= (index!29927 lt!300605) vacantSpotIndex!68)) (and (bvsge (index!29927 lt!300605) #b00000000000000000000000000000000) (bvslt (index!29927 lt!300605) (size!18823 a!2986)))) (or ((_ is Undefined!6895) lt!300605) (ite ((_ is Found!6895) lt!300605) (= (select (arr!18458 a!2986) (index!29925 lt!300605)) (select (arr!18458 a!2986) j!136)) (and ((_ is MissingVacant!6895) lt!300605) (= (index!29927 lt!300605) vacantSpotIndex!68) (= (select (arr!18458 a!2986) (index!29927 lt!300605)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91617 (= lt!300605 e!371622)))

(declare-fun c!74445 () Bool)

(assert (=> d!91617 (= c!74445 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91617 (= lt!300604 (select (arr!18458 a!2986) lt!300366))))

(assert (=> d!91617 (validMask!0 mask!3053)))

(assert (=> d!91617 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300366 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053) lt!300605)))

(declare-fun b!648001 () Bool)

(assert (=> b!648001 (= e!371622 e!371623)))

(declare-fun c!74446 () Bool)

(assert (=> b!648001 (= c!74446 (= lt!300604 (select (arr!18458 a!2986) j!136)))))

(assert (= (and d!91617 c!74445) b!647998))

(assert (= (and d!91617 (not c!74445)) b!648001))

(assert (= (and b!648001 c!74446) b!648003))

(assert (= (and b!648001 (not c!74446)) b!648000))

(assert (= (and b!648000 c!74444) b!648002))

(assert (= (and b!648000 (not c!74444)) b!647999))

(assert (=> b!647999 m!620821))

(assert (=> b!647999 m!620821))

(assert (=> b!647999 m!620391))

(declare-fun m!620919 () Bool)

(assert (=> b!647999 m!620919))

(declare-fun m!620921 () Bool)

(assert (=> d!91617 m!620921))

(declare-fun m!620923 () Bool)

(assert (=> d!91617 m!620923))

(declare-fun m!620925 () Bool)

(assert (=> d!91617 m!620925))

(assert (=> d!91617 m!620407))

(assert (=> b!647485 d!91617))

(declare-fun d!91623 () Bool)

(declare-fun lt!300608 () Bool)

(assert (=> d!91623 (= lt!300608 (select (content!250 Nil!12535) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371628 () Bool)

(assert (=> d!91623 (= lt!300608 e!371628)))

(declare-fun res!419844 () Bool)

(assert (=> d!91623 (=> (not res!419844) (not e!371628))))

(assert (=> d!91623 (= res!419844 ((_ is Cons!12534) Nil!12535))))

(assert (=> d!91623 (= (contains!3139 Nil!12535 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300608)))

(declare-fun b!648010 () Bool)

(declare-fun e!371627 () Bool)

(assert (=> b!648010 (= e!371628 e!371627)))

(declare-fun res!419845 () Bool)

(assert (=> b!648010 (=> res!419845 e!371627)))

(assert (=> b!648010 (= res!419845 (= (h!13579 Nil!12535) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648011 () Bool)

(assert (=> b!648011 (= e!371627 (contains!3139 (t!18757 Nil!12535) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91623 res!419844) b!648010))

(assert (= (and b!648010 (not res!419845)) b!648011))

(assert (=> d!91623 m!620637))

(declare-fun m!620929 () Bool)

(assert (=> d!91623 m!620929))

(declare-fun m!620933 () Bool)

(assert (=> b!648011 m!620933))

(assert (=> b!647496 d!91623))

(check-sat (not b!647833) (not d!91529) (not b!647698) (not b!647773) (not b!647696) (not b!647710) (not b!647919) (not b!647909) (not d!91593) (not b!647908) (not b!647708) (not d!91499) (not d!91617) (not d!91503) (not b!647768) (not b!647751) (not d!91595) (not d!91579) (not b!647694) (not b!647911) (not b!647913) (not d!91485) (not b!647990) (not bm!33676) (not b!647679) (not d!91599) (not d!91497) (not bm!33692) (not bm!33681) (not b!647693) (not b!647770) (not b!647699) (not bm!33677) (not b!647999) (not b!648011) (not d!91597) (not b!647702) (not b!647771) (not d!91509) (not b!647903) (not b!647691) (not b!647901) (not d!91493) (not b!647873) (not b!647712) (not d!91623) (not d!91489))
(check-sat)
