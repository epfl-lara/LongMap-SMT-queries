; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56166 () Bool)

(assert start!56166)

(declare-fun b!621489 () Bool)

(declare-fun e!356466 () Bool)

(declare-fun e!356470 () Bool)

(assert (=> b!621489 (= e!356466 e!356470)))

(declare-fun res!400510 () Bool)

(assert (=> b!621489 (=> (not res!400510) (not e!356470))))

(declare-datatypes ((SeekEntryResult!6504 0))(
  ( (MissingZero!6504 (index!28300 (_ BitVec 32))) (Found!6504 (index!28301 (_ BitVec 32))) (Intermediate!6504 (undefined!7316 Bool) (index!28302 (_ BitVec 32)) (x!57072 (_ BitVec 32))) (Undefined!6504) (MissingVacant!6504 (index!28303 (_ BitVec 32))) )
))
(declare-fun lt!287615 () SeekEntryResult!6504)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!621489 (= res!400510 (or (= lt!287615 (MissingZero!6504 i!1108)) (= lt!287615 (MissingVacant!6504 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37636 0))(
  ( (array!37637 (arr!18064 (Array (_ BitVec 32) (_ BitVec 64))) (size!18428 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37636)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37636 (_ BitVec 32)) SeekEntryResult!6504)

(assert (=> b!621489 (= lt!287615 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621490 () Bool)

(assert (=> b!621490 false))

(declare-datatypes ((Unit!20768 0))(
  ( (Unit!20769) )
))
(declare-fun lt!287609 () Unit!20768)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!287603 () array!37636)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12105 0))(
  ( (Nil!12102) (Cons!12101 (h!13146 (_ BitVec 64)) (t!18333 List!12105)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37636 (_ BitVec 64) (_ BitVec 32) List!12105) Unit!20768)

(assert (=> b!621490 (= lt!287609 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287603 (select (arr!18064 a!2986) j!136) index!984 Nil!12102))))

(declare-fun arrayNoDuplicates!0 (array!37636 (_ BitVec 32) List!12105) Bool)

(assert (=> b!621490 (arrayNoDuplicates!0 lt!287603 index!984 Nil!12102)))

(declare-fun lt!287606 () Unit!20768)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37636 (_ BitVec 32) (_ BitVec 32)) Unit!20768)

(assert (=> b!621490 (= lt!287606 (lemmaNoDuplicateFromThenFromBigger!0 lt!287603 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621490 (arrayNoDuplicates!0 lt!287603 #b00000000000000000000000000000000 Nil!12102)))

(declare-fun lt!287600 () Unit!20768)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37636 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12105) Unit!20768)

(assert (=> b!621490 (= lt!287600 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12102))))

(declare-fun arrayContainsKey!0 (array!37636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621490 (arrayContainsKey!0 lt!287603 (select (arr!18064 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287613 () Unit!20768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37636 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20768)

(assert (=> b!621490 (= lt!287613 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287603 (select (arr!18064 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356469 () Bool)

(assert (=> b!621490 e!356469))

(declare-fun res!400514 () Bool)

(assert (=> b!621490 (=> (not res!400514) (not e!356469))))

(assert (=> b!621490 (= res!400514 (arrayContainsKey!0 lt!287603 (select (arr!18064 a!2986) j!136) j!136))))

(declare-fun e!356460 () Unit!20768)

(declare-fun Unit!20770 () Unit!20768)

(assert (=> b!621490 (= e!356460 Unit!20770)))

(declare-fun res!400509 () Bool)

(assert (=> start!56166 (=> (not res!400509) (not e!356466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56166 (= res!400509 (validMask!0 mask!3053))))

(assert (=> start!56166 e!356466))

(assert (=> start!56166 true))

(declare-fun array_inv!13860 (array!37636) Bool)

(assert (=> start!56166 (array_inv!13860 a!2986)))

(declare-fun b!621491 () Bool)

(declare-fun e!356459 () Unit!20768)

(declare-fun Unit!20771 () Unit!20768)

(assert (=> b!621491 (= e!356459 Unit!20771)))

(assert (=> b!621491 false))

(declare-fun b!621492 () Bool)

(assert (=> b!621492 (= e!356469 (arrayContainsKey!0 lt!287603 (select (arr!18064 a!2986) j!136) index!984))))

(declare-fun b!621493 () Bool)

(declare-fun e!356462 () Unit!20768)

(declare-fun Unit!20772 () Unit!20768)

(assert (=> b!621493 (= e!356462 Unit!20772)))

(declare-fun b!621494 () Bool)

(assert (=> b!621494 false))

(declare-fun lt!287616 () Unit!20768)

(assert (=> b!621494 (= lt!287616 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287603 (select (arr!18064 a!2986) j!136) j!136 Nil!12102))))

(assert (=> b!621494 (arrayNoDuplicates!0 lt!287603 j!136 Nil!12102)))

(declare-fun lt!287617 () Unit!20768)

(assert (=> b!621494 (= lt!287617 (lemmaNoDuplicateFromThenFromBigger!0 lt!287603 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621494 (arrayNoDuplicates!0 lt!287603 #b00000000000000000000000000000000 Nil!12102)))

(declare-fun lt!287604 () Unit!20768)

(assert (=> b!621494 (= lt!287604 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12102))))

(assert (=> b!621494 (arrayContainsKey!0 lt!287603 (select (arr!18064 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287608 () Unit!20768)

(assert (=> b!621494 (= lt!287608 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287603 (select (arr!18064 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20773 () Unit!20768)

(assert (=> b!621494 (= e!356462 Unit!20773)))

(declare-fun b!621495 () Bool)

(declare-fun res!400499 () Bool)

(assert (=> b!621495 (=> (not res!400499) (not e!356466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621495 (= res!400499 (validKeyInArray!0 k0!1786))))

(declare-fun b!621496 () Bool)

(declare-fun e!356468 () Bool)

(declare-fun e!356472 () Bool)

(assert (=> b!621496 (= e!356468 e!356472)))

(declare-fun res!400503 () Bool)

(assert (=> b!621496 (=> (not res!400503) (not e!356472))))

(declare-fun lt!287599 () SeekEntryResult!6504)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621496 (= res!400503 (and (= lt!287599 (Found!6504 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18064 a!2986) index!984) (select (arr!18064 a!2986) j!136))) (not (= (select (arr!18064 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37636 (_ BitVec 32)) SeekEntryResult!6504)

(assert (=> b!621496 (= lt!287599 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18064 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!356461 () Bool)

(declare-fun b!621497 () Bool)

(assert (=> b!621497 (= e!356461 (arrayContainsKey!0 lt!287603 (select (arr!18064 a!2986) j!136) index!984))))

(declare-fun b!621498 () Bool)

(declare-fun res!400513 () Bool)

(assert (=> b!621498 (=> (not res!400513) (not e!356466))))

(assert (=> b!621498 (= res!400513 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621499 () Bool)

(declare-fun Unit!20774 () Unit!20768)

(assert (=> b!621499 (= e!356459 Unit!20774)))

(declare-fun b!621500 () Bool)

(declare-fun res!400500 () Bool)

(assert (=> b!621500 (=> (not res!400500) (not e!356466))))

(assert (=> b!621500 (= res!400500 (and (= (size!18428 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18428 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18428 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621501 () Bool)

(declare-fun e!356471 () Unit!20768)

(declare-fun Unit!20775 () Unit!20768)

(assert (=> b!621501 (= e!356471 Unit!20775)))

(declare-fun b!621502 () Bool)

(declare-fun e!356467 () Bool)

(declare-fun lt!287612 () SeekEntryResult!6504)

(assert (=> b!621502 (= e!356467 (= lt!287599 lt!287612))))

(declare-fun b!621503 () Bool)

(declare-fun res!400507 () Bool)

(assert (=> b!621503 (=> (not res!400507) (not e!356470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37636 (_ BitVec 32)) Bool)

(assert (=> b!621503 (= res!400507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621504 () Bool)

(assert (=> b!621504 (= e!356470 e!356468)))

(declare-fun res!400504 () Bool)

(assert (=> b!621504 (=> (not res!400504) (not e!356468))))

(assert (=> b!621504 (= res!400504 (= (select (store (arr!18064 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621504 (= lt!287603 (array!37637 (store (arr!18064 a!2986) i!1108 k0!1786) (size!18428 a!2986)))))

(declare-fun b!621505 () Bool)

(declare-fun res!400502 () Bool)

(assert (=> b!621505 (=> (not res!400502) (not e!356466))))

(assert (=> b!621505 (= res!400502 (validKeyInArray!0 (select (arr!18064 a!2986) j!136)))))

(declare-fun b!621506 () Bool)

(declare-fun res!400506 () Bool)

(assert (=> b!621506 (=> (not res!400506) (not e!356470))))

(assert (=> b!621506 (= res!400506 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12102))))

(declare-fun b!621507 () Bool)

(declare-fun res!400512 () Bool)

(assert (=> b!621507 (=> (not res!400512) (not e!356470))))

(assert (=> b!621507 (= res!400512 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18064 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621508 () Bool)

(declare-fun Unit!20776 () Unit!20768)

(assert (=> b!621508 (= e!356471 Unit!20776)))

(declare-fun res!400505 () Bool)

(assert (=> b!621508 (= res!400505 (= (select (store (arr!18064 a!2986) i!1108 k0!1786) index!984) (select (arr!18064 a!2986) j!136)))))

(declare-fun e!356465 () Bool)

(assert (=> b!621508 (=> (not res!400505) (not e!356465))))

(assert (=> b!621508 e!356465))

(declare-fun c!70863 () Bool)

(assert (=> b!621508 (= c!70863 (bvslt j!136 index!984))))

(declare-fun lt!287598 () Unit!20768)

(assert (=> b!621508 (= lt!287598 e!356462)))

(declare-fun c!70864 () Bool)

(assert (=> b!621508 (= c!70864 (bvslt index!984 j!136))))

(declare-fun lt!287611 () Unit!20768)

(assert (=> b!621508 (= lt!287611 e!356460)))

(assert (=> b!621508 false))

(declare-fun b!621509 () Bool)

(declare-fun res!400511 () Bool)

(assert (=> b!621509 (= res!400511 (bvsge j!136 index!984))))

(declare-fun e!356464 () Bool)

(assert (=> b!621509 (=> res!400511 e!356464)))

(assert (=> b!621509 (= e!356465 e!356464)))

(declare-fun b!621510 () Bool)

(declare-fun res!400501 () Bool)

(assert (=> b!621510 (= res!400501 (arrayContainsKey!0 lt!287603 (select (arr!18064 a!2986) j!136) j!136))))

(assert (=> b!621510 (=> (not res!400501) (not e!356461))))

(assert (=> b!621510 (= e!356464 e!356461)))

(declare-fun b!621511 () Bool)

(declare-fun Unit!20777 () Unit!20768)

(assert (=> b!621511 (= e!356460 Unit!20777)))

(declare-fun b!621512 () Bool)

(assert (=> b!621512 (= e!356472 (not true))))

(declare-fun lt!287610 () Unit!20768)

(assert (=> b!621512 (= lt!287610 e!356471)))

(declare-fun c!70865 () Bool)

(declare-fun lt!287614 () SeekEntryResult!6504)

(assert (=> b!621512 (= c!70865 (= lt!287614 (Found!6504 index!984)))))

(declare-fun lt!287601 () Unit!20768)

(assert (=> b!621512 (= lt!287601 e!356459)))

(declare-fun c!70862 () Bool)

(assert (=> b!621512 (= c!70862 (= lt!287614 Undefined!6504))))

(declare-fun lt!287602 () (_ BitVec 64))

(assert (=> b!621512 (= lt!287614 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287602 lt!287603 mask!3053))))

(assert (=> b!621512 e!356467))

(declare-fun res!400508 () Bool)

(assert (=> b!621512 (=> (not res!400508) (not e!356467))))

(declare-fun lt!287607 () (_ BitVec 32))

(assert (=> b!621512 (= res!400508 (= lt!287612 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287607 vacantSpotIndex!68 lt!287602 lt!287603 mask!3053)))))

(assert (=> b!621512 (= lt!287612 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287607 vacantSpotIndex!68 (select (arr!18064 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621512 (= lt!287602 (select (store (arr!18064 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287605 () Unit!20768)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37636 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20768)

(assert (=> b!621512 (= lt!287605 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287607 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621512 (= lt!287607 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56166 res!400509) b!621500))

(assert (= (and b!621500 res!400500) b!621505))

(assert (= (and b!621505 res!400502) b!621495))

(assert (= (and b!621495 res!400499) b!621498))

(assert (= (and b!621498 res!400513) b!621489))

(assert (= (and b!621489 res!400510) b!621503))

(assert (= (and b!621503 res!400507) b!621506))

(assert (= (and b!621506 res!400506) b!621507))

(assert (= (and b!621507 res!400512) b!621504))

(assert (= (and b!621504 res!400504) b!621496))

(assert (= (and b!621496 res!400503) b!621512))

(assert (= (and b!621512 res!400508) b!621502))

(assert (= (and b!621512 c!70862) b!621491))

(assert (= (and b!621512 (not c!70862)) b!621499))

(assert (= (and b!621512 c!70865) b!621508))

(assert (= (and b!621512 (not c!70865)) b!621501))

(assert (= (and b!621508 res!400505) b!621509))

(assert (= (and b!621509 (not res!400511)) b!621510))

(assert (= (and b!621510 res!400501) b!621497))

(assert (= (and b!621508 c!70863) b!621494))

(assert (= (and b!621508 (not c!70863)) b!621493))

(assert (= (and b!621508 c!70864) b!621490))

(assert (= (and b!621508 (not c!70864)) b!621511))

(assert (= (and b!621490 res!400514) b!621492))

(declare-fun m!597381 () Bool)

(assert (=> b!621496 m!597381))

(declare-fun m!597383 () Bool)

(assert (=> b!621496 m!597383))

(assert (=> b!621496 m!597383))

(declare-fun m!597385 () Bool)

(assert (=> b!621496 m!597385))

(assert (=> b!621492 m!597383))

(assert (=> b!621492 m!597383))

(declare-fun m!597387 () Bool)

(assert (=> b!621492 m!597387))

(assert (=> b!621497 m!597383))

(assert (=> b!621497 m!597383))

(assert (=> b!621497 m!597387))

(declare-fun m!597389 () Bool)

(assert (=> b!621504 m!597389))

(declare-fun m!597391 () Bool)

(assert (=> b!621504 m!597391))

(declare-fun m!597393 () Bool)

(assert (=> b!621495 m!597393))

(declare-fun m!597395 () Bool)

(assert (=> b!621490 m!597395))

(declare-fun m!597397 () Bool)

(assert (=> b!621490 m!597397))

(assert (=> b!621490 m!597383))

(declare-fun m!597399 () Bool)

(assert (=> b!621490 m!597399))

(declare-fun m!597401 () Bool)

(assert (=> b!621490 m!597401))

(assert (=> b!621490 m!597383))

(declare-fun m!597403 () Bool)

(assert (=> b!621490 m!597403))

(declare-fun m!597405 () Bool)

(assert (=> b!621490 m!597405))

(assert (=> b!621490 m!597383))

(assert (=> b!621490 m!597383))

(declare-fun m!597407 () Bool)

(assert (=> b!621490 m!597407))

(assert (=> b!621490 m!597383))

(declare-fun m!597409 () Bool)

(assert (=> b!621490 m!597409))

(declare-fun m!597411 () Bool)

(assert (=> b!621489 m!597411))

(assert (=> b!621505 m!597383))

(assert (=> b!621505 m!597383))

(declare-fun m!597413 () Bool)

(assert (=> b!621505 m!597413))

(declare-fun m!597415 () Bool)

(assert (=> b!621506 m!597415))

(assert (=> b!621510 m!597383))

(assert (=> b!621510 m!597383))

(assert (=> b!621510 m!597399))

(declare-fun m!597417 () Bool)

(assert (=> b!621498 m!597417))

(assert (=> b!621508 m!597389))

(declare-fun m!597419 () Bool)

(assert (=> b!621508 m!597419))

(assert (=> b!621508 m!597383))

(declare-fun m!597421 () Bool)

(assert (=> b!621512 m!597421))

(declare-fun m!597423 () Bool)

(assert (=> b!621512 m!597423))

(declare-fun m!597425 () Bool)

(assert (=> b!621512 m!597425))

(assert (=> b!621512 m!597383))

(assert (=> b!621512 m!597383))

(declare-fun m!597427 () Bool)

(assert (=> b!621512 m!597427))

(declare-fun m!597429 () Bool)

(assert (=> b!621512 m!597429))

(declare-fun m!597431 () Bool)

(assert (=> b!621512 m!597431))

(assert (=> b!621512 m!597389))

(declare-fun m!597433 () Bool)

(assert (=> b!621507 m!597433))

(declare-fun m!597435 () Bool)

(assert (=> b!621503 m!597435))

(assert (=> b!621494 m!597383))

(declare-fun m!597437 () Bool)

(assert (=> b!621494 m!597437))

(assert (=> b!621494 m!597383))

(assert (=> b!621494 m!597383))

(declare-fun m!597439 () Bool)

(assert (=> b!621494 m!597439))

(assert (=> b!621494 m!597383))

(declare-fun m!597441 () Bool)

(assert (=> b!621494 m!597441))

(declare-fun m!597443 () Bool)

(assert (=> b!621494 m!597443))

(assert (=> b!621494 m!597397))

(declare-fun m!597445 () Bool)

(assert (=> b!621494 m!597445))

(assert (=> b!621494 m!597405))

(declare-fun m!597447 () Bool)

(assert (=> start!56166 m!597447))

(declare-fun m!597449 () Bool)

(assert (=> start!56166 m!597449))

(check-sat (not b!621489) (not b!621490) (not start!56166) (not b!621492) (not b!621494) (not b!621495) (not b!621497) (not b!621512) (not b!621503) (not b!621505) (not b!621506) (not b!621510) (not b!621496) (not b!621498))
(check-sat)
