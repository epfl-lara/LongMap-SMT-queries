; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59326 () Bool)

(assert start!59326)

(declare-fun res!424383 () Bool)

(declare-fun e!375727 () Bool)

(assert (=> start!59326 (=> (not res!424383) (not e!375727))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59326 (= res!424383 (validMask!0 mask!3053))))

(assert (=> start!59326 e!375727))

(assert (=> start!59326 true))

(declare-datatypes ((array!38646 0))(
  ( (array!38647 (arr!18523 (Array (_ BitVec 32) (_ BitVec 64))) (size!18887 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38646)

(declare-fun array_inv!14319 (array!38646) Bool)

(assert (=> start!59326 (array_inv!14319 a!2986)))

(declare-fun b!654313 () Bool)

(declare-fun e!375729 () Bool)

(declare-fun e!375735 () Bool)

(assert (=> b!654313 (= e!375729 (not e!375735))))

(declare-fun res!424384 () Bool)

(assert (=> b!654313 (=> res!424384 e!375735)))

(declare-datatypes ((SeekEntryResult!6963 0))(
  ( (MissingZero!6963 (index!30211 (_ BitVec 32))) (Found!6963 (index!30212 (_ BitVec 32))) (Intermediate!6963 (undefined!7775 Bool) (index!30213 (_ BitVec 32)) (x!59004 (_ BitVec 32))) (Undefined!6963) (MissingVacant!6963 (index!30214 (_ BitVec 32))) )
))
(declare-fun lt!304762 () SeekEntryResult!6963)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654313 (= res!424384 (not (= lt!304762 (Found!6963 index!984))))))

(declare-datatypes ((Unit!22404 0))(
  ( (Unit!22405) )
))
(declare-fun lt!304748 () Unit!22404)

(declare-fun e!375730 () Unit!22404)

(assert (=> b!654313 (= lt!304748 e!375730)))

(declare-fun c!75337 () Bool)

(assert (=> b!654313 (= c!75337 (= lt!304762 Undefined!6963))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!304765 () array!38646)

(declare-fun lt!304758 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38646 (_ BitVec 32)) SeekEntryResult!6963)

(assert (=> b!654313 (= lt!304762 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304758 lt!304765 mask!3053))))

(declare-fun e!375739 () Bool)

(assert (=> b!654313 e!375739))

(declare-fun res!424391 () Bool)

(assert (=> b!654313 (=> (not res!424391) (not e!375739))))

(declare-fun lt!304752 () SeekEntryResult!6963)

(declare-fun lt!304751 () (_ BitVec 32))

(assert (=> b!654313 (= res!424391 (= lt!304752 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304751 vacantSpotIndex!68 lt!304758 lt!304765 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!654313 (= lt!304752 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304751 vacantSpotIndex!68 (select (arr!18523 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!654313 (= lt!304758 (select (store (arr!18523 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304763 () Unit!22404)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38646 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22404)

(assert (=> b!654313 (= lt!304763 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304751 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654313 (= lt!304751 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654314 () Bool)

(declare-fun e!375738 () Bool)

(assert (=> b!654314 (= e!375735 e!375738)))

(declare-fun res!424376 () Bool)

(assert (=> b!654314 (=> res!424376 e!375738)))

(declare-fun lt!304759 () (_ BitVec 64))

(assert (=> b!654314 (= res!424376 (or (not (= (select (arr!18523 a!2986) j!136) lt!304758)) (not (= (select (arr!18523 a!2986) j!136) lt!304759))))))

(declare-fun e!375737 () Bool)

(assert (=> b!654314 e!375737))

(declare-fun res!424385 () Bool)

(assert (=> b!654314 (=> (not res!424385) (not e!375737))))

(assert (=> b!654314 (= res!424385 (= lt!304759 (select (arr!18523 a!2986) j!136)))))

(assert (=> b!654314 (= lt!304759 (select (store (arr!18523 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!654315 () Bool)

(declare-fun res!424388 () Bool)

(declare-fun e!375733 () Bool)

(assert (=> b!654315 (=> (not res!424388) (not e!375733))))

(declare-datatypes ((List!12564 0))(
  ( (Nil!12561) (Cons!12560 (h!13605 (_ BitVec 64)) (t!18792 List!12564)) )
))
(declare-fun arrayNoDuplicates!0 (array!38646 (_ BitVec 32) List!12564) Bool)

(assert (=> b!654315 (= res!424388 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12561))))

(declare-fun b!654316 () Bool)

(declare-fun e!375732 () Bool)

(assert (=> b!654316 (= e!375738 e!375732)))

(declare-fun res!424390 () Bool)

(assert (=> b!654316 (=> res!424390 e!375732)))

(assert (=> b!654316 (= res!424390 (bvsge index!984 j!136))))

(declare-fun lt!304756 () Unit!22404)

(declare-fun e!375734 () Unit!22404)

(assert (=> b!654316 (= lt!304756 e!375734)))

(declare-fun c!75338 () Bool)

(assert (=> b!654316 (= c!75338 (bvslt j!136 index!984))))

(declare-fun b!654317 () Bool)

(declare-fun e!375736 () Bool)

(assert (=> b!654317 (= e!375733 e!375736)))

(declare-fun res!424375 () Bool)

(assert (=> b!654317 (=> (not res!424375) (not e!375736))))

(assert (=> b!654317 (= res!424375 (= (select (store (arr!18523 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654317 (= lt!304765 (array!38647 (store (arr!18523 a!2986) i!1108 k0!1786) (size!18887 a!2986)))))

(declare-fun b!654318 () Bool)

(declare-fun res!424379 () Bool)

(assert (=> b!654318 (=> (not res!424379) (not e!375733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38646 (_ BitVec 32)) Bool)

(assert (=> b!654318 (= res!424379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654319 () Bool)

(declare-fun Unit!22406 () Unit!22404)

(assert (=> b!654319 (= e!375730 Unit!22406)))

(assert (=> b!654319 false))

(declare-fun e!375740 () Bool)

(declare-fun b!654320 () Bool)

(declare-fun arrayContainsKey!0 (array!38646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654320 (= e!375740 (arrayContainsKey!0 lt!304765 (select (arr!18523 a!2986) j!136) index!984))))

(declare-fun b!654321 () Bool)

(assert (=> b!654321 (= e!375727 e!375733)))

(declare-fun res!424373 () Bool)

(assert (=> b!654321 (=> (not res!424373) (not e!375733))))

(declare-fun lt!304764 () SeekEntryResult!6963)

(assert (=> b!654321 (= res!424373 (or (= lt!304764 (MissingZero!6963 i!1108)) (= lt!304764 (MissingVacant!6963 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38646 (_ BitVec 32)) SeekEntryResult!6963)

(assert (=> b!654321 (= lt!304764 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654322 () Bool)

(declare-fun res!424377 () Bool)

(assert (=> b!654322 (=> (not res!424377) (not e!375727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654322 (= res!424377 (validKeyInArray!0 (select (arr!18523 a!2986) j!136)))))

(declare-fun b!654323 () Bool)

(declare-fun Unit!22407 () Unit!22404)

(assert (=> b!654323 (= e!375730 Unit!22407)))

(declare-fun b!654324 () Bool)

(declare-fun res!424389 () Bool)

(assert (=> b!654324 (=> (not res!424389) (not e!375727))))

(assert (=> b!654324 (= res!424389 (validKeyInArray!0 k0!1786))))

(declare-fun b!654325 () Bool)

(declare-fun Unit!22408 () Unit!22404)

(assert (=> b!654325 (= e!375734 Unit!22408)))

(declare-fun b!654326 () Bool)

(declare-fun res!424382 () Bool)

(assert (=> b!654326 (=> (not res!424382) (not e!375727))))

(assert (=> b!654326 (= res!424382 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654327 () Bool)

(declare-fun Unit!22409 () Unit!22404)

(assert (=> b!654327 (= e!375734 Unit!22409)))

(declare-fun lt!304757 () Unit!22404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22404)

(assert (=> b!654327 (= lt!304757 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304765 (select (arr!18523 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654327 (arrayContainsKey!0 lt!304765 (select (arr!18523 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304760 () Unit!22404)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12564) Unit!22404)

(assert (=> b!654327 (= lt!304760 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12561))))

(assert (=> b!654327 (arrayNoDuplicates!0 lt!304765 #b00000000000000000000000000000000 Nil!12561)))

(declare-fun lt!304750 () Unit!22404)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38646 (_ BitVec 32) (_ BitVec 32)) Unit!22404)

(assert (=> b!654327 (= lt!304750 (lemmaNoDuplicateFromThenFromBigger!0 lt!304765 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654327 (arrayNoDuplicates!0 lt!304765 j!136 Nil!12561)))

(declare-fun lt!304753 () Unit!22404)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38646 (_ BitVec 64) (_ BitVec 32) List!12564) Unit!22404)

(assert (=> b!654327 (= lt!304753 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304765 (select (arr!18523 a!2986) j!136) j!136 Nil!12561))))

(assert (=> b!654327 false))

(declare-fun b!654328 () Bool)

(assert (=> b!654328 (= e!375736 e!375729)))

(declare-fun res!424387 () Bool)

(assert (=> b!654328 (=> (not res!424387) (not e!375729))))

(declare-fun lt!304749 () SeekEntryResult!6963)

(assert (=> b!654328 (= res!424387 (and (= lt!304749 (Found!6963 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18523 a!2986) index!984) (select (arr!18523 a!2986) j!136))) (not (= (select (arr!18523 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!654328 (= lt!304749 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18523 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654329 () Bool)

(assert (=> b!654329 (= e!375732 true)))

(assert (=> b!654329 false))

(declare-fun lt!304761 () Unit!22404)

(assert (=> b!654329 (= lt!304761 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304765 (select (arr!18523 a!2986) j!136) index!984 Nil!12561))))

(assert (=> b!654329 (arrayNoDuplicates!0 lt!304765 index!984 Nil!12561)))

(declare-fun lt!304747 () Unit!22404)

(assert (=> b!654329 (= lt!304747 (lemmaNoDuplicateFromThenFromBigger!0 lt!304765 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654329 (arrayNoDuplicates!0 lt!304765 #b00000000000000000000000000000000 Nil!12561)))

(declare-fun lt!304755 () Unit!22404)

(assert (=> b!654329 (= lt!304755 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12561))))

(assert (=> b!654329 (arrayContainsKey!0 lt!304765 (select (arr!18523 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304754 () Unit!22404)

(assert (=> b!654329 (= lt!304754 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304765 (select (arr!18523 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654329 e!375740))

(declare-fun res!424381 () Bool)

(assert (=> b!654329 (=> (not res!424381) (not e!375740))))

(assert (=> b!654329 (= res!424381 (arrayContainsKey!0 lt!304765 (select (arr!18523 a!2986) j!136) j!136))))

(declare-fun e!375731 () Bool)

(declare-fun b!654330 () Bool)

(assert (=> b!654330 (= e!375731 (arrayContainsKey!0 lt!304765 (select (arr!18523 a!2986) j!136) index!984))))

(declare-fun b!654331 () Bool)

(declare-fun e!375741 () Bool)

(assert (=> b!654331 (= e!375741 e!375731)))

(declare-fun res!424374 () Bool)

(assert (=> b!654331 (=> (not res!424374) (not e!375731))))

(assert (=> b!654331 (= res!424374 (arrayContainsKey!0 lt!304765 (select (arr!18523 a!2986) j!136) j!136))))

(declare-fun b!654332 () Bool)

(declare-fun res!424378 () Bool)

(assert (=> b!654332 (=> (not res!424378) (not e!375727))))

(assert (=> b!654332 (= res!424378 (and (= (size!18887 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18887 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18887 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654333 () Bool)

(assert (=> b!654333 (= e!375737 e!375741)))

(declare-fun res!424380 () Bool)

(assert (=> b!654333 (=> res!424380 e!375741)))

(assert (=> b!654333 (= res!424380 (or (not (= (select (arr!18523 a!2986) j!136) lt!304758)) (not (= (select (arr!18523 a!2986) j!136) lt!304759)) (bvsge j!136 index!984)))))

(declare-fun b!654334 () Bool)

(declare-fun res!424386 () Bool)

(assert (=> b!654334 (=> (not res!424386) (not e!375733))))

(assert (=> b!654334 (= res!424386 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18523 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654335 () Bool)

(assert (=> b!654335 (= e!375739 (= lt!304749 lt!304752))))

(assert (= (and start!59326 res!424383) b!654332))

(assert (= (and b!654332 res!424378) b!654322))

(assert (= (and b!654322 res!424377) b!654324))

(assert (= (and b!654324 res!424389) b!654326))

(assert (= (and b!654326 res!424382) b!654321))

(assert (= (and b!654321 res!424373) b!654318))

(assert (= (and b!654318 res!424379) b!654315))

(assert (= (and b!654315 res!424388) b!654334))

(assert (= (and b!654334 res!424386) b!654317))

(assert (= (and b!654317 res!424375) b!654328))

(assert (= (and b!654328 res!424387) b!654313))

(assert (= (and b!654313 res!424391) b!654335))

(assert (= (and b!654313 c!75337) b!654319))

(assert (= (and b!654313 (not c!75337)) b!654323))

(assert (= (and b!654313 (not res!424384)) b!654314))

(assert (= (and b!654314 res!424385) b!654333))

(assert (= (and b!654333 (not res!424380)) b!654331))

(assert (= (and b!654331 res!424374) b!654330))

(assert (= (and b!654314 (not res!424376)) b!654316))

(assert (= (and b!654316 c!75338) b!654327))

(assert (= (and b!654316 (not c!75338)) b!654325))

(assert (= (and b!654316 (not res!424390)) b!654329))

(assert (= (and b!654329 res!424381) b!654320))

(declare-fun m!627417 () Bool)

(assert (=> b!654315 m!627417))

(declare-fun m!627419 () Bool)

(assert (=> b!654314 m!627419))

(declare-fun m!627421 () Bool)

(assert (=> b!654314 m!627421))

(declare-fun m!627423 () Bool)

(assert (=> b!654314 m!627423))

(assert (=> b!654327 m!627419))

(declare-fun m!627425 () Bool)

(assert (=> b!654327 m!627425))

(assert (=> b!654327 m!627419))

(declare-fun m!627427 () Bool)

(assert (=> b!654327 m!627427))

(declare-fun m!627429 () Bool)

(assert (=> b!654327 m!627429))

(declare-fun m!627431 () Bool)

(assert (=> b!654327 m!627431))

(assert (=> b!654327 m!627419))

(declare-fun m!627433 () Bool)

(assert (=> b!654327 m!627433))

(declare-fun m!627435 () Bool)

(assert (=> b!654327 m!627435))

(assert (=> b!654327 m!627419))

(declare-fun m!627437 () Bool)

(assert (=> b!654327 m!627437))

(assert (=> b!654331 m!627419))

(assert (=> b!654331 m!627419))

(declare-fun m!627439 () Bool)

(assert (=> b!654331 m!627439))

(declare-fun m!627441 () Bool)

(assert (=> b!654326 m!627441))

(assert (=> b!654320 m!627419))

(assert (=> b!654320 m!627419))

(declare-fun m!627443 () Bool)

(assert (=> b!654320 m!627443))

(assert (=> b!654322 m!627419))

(assert (=> b!654322 m!627419))

(declare-fun m!627445 () Bool)

(assert (=> b!654322 m!627445))

(assert (=> b!654329 m!627419))

(declare-fun m!627447 () Bool)

(assert (=> b!654329 m!627447))

(assert (=> b!654329 m!627419))

(assert (=> b!654329 m!627439))

(assert (=> b!654329 m!627419))

(declare-fun m!627449 () Bool)

(assert (=> b!654329 m!627449))

(assert (=> b!654329 m!627419))

(declare-fun m!627451 () Bool)

(assert (=> b!654329 m!627451))

(assert (=> b!654329 m!627435))

(declare-fun m!627453 () Bool)

(assert (=> b!654329 m!627453))

(declare-fun m!627455 () Bool)

(assert (=> b!654329 m!627455))

(assert (=> b!654329 m!627419))

(assert (=> b!654329 m!627437))

(declare-fun m!627457 () Bool)

(assert (=> b!654324 m!627457))

(assert (=> b!654330 m!627419))

(assert (=> b!654330 m!627419))

(assert (=> b!654330 m!627443))

(declare-fun m!627459 () Bool)

(assert (=> b!654328 m!627459))

(assert (=> b!654328 m!627419))

(assert (=> b!654328 m!627419))

(declare-fun m!627461 () Bool)

(assert (=> b!654328 m!627461))

(assert (=> b!654317 m!627421))

(declare-fun m!627463 () Bool)

(assert (=> b!654317 m!627463))

(declare-fun m!627465 () Bool)

(assert (=> start!59326 m!627465))

(declare-fun m!627467 () Bool)

(assert (=> start!59326 m!627467))

(assert (=> b!654333 m!627419))

(declare-fun m!627469 () Bool)

(assert (=> b!654321 m!627469))

(declare-fun m!627471 () Bool)

(assert (=> b!654318 m!627471))

(declare-fun m!627473 () Bool)

(assert (=> b!654313 m!627473))

(declare-fun m!627475 () Bool)

(assert (=> b!654313 m!627475))

(assert (=> b!654313 m!627419))

(assert (=> b!654313 m!627421))

(declare-fun m!627477 () Bool)

(assert (=> b!654313 m!627477))

(declare-fun m!627479 () Bool)

(assert (=> b!654313 m!627479))

(assert (=> b!654313 m!627419))

(declare-fun m!627481 () Bool)

(assert (=> b!654313 m!627481))

(declare-fun m!627483 () Bool)

(assert (=> b!654313 m!627483))

(declare-fun m!627485 () Bool)

(assert (=> b!654334 m!627485))

(check-sat (not b!654331) (not b!654318) (not b!654313) (not b!654320) (not start!59326) (not b!654328) (not b!654324) (not b!654329) (not b!654315) (not b!654327) (not b!654330) (not b!654321) (not b!654326) (not b!654322))
(check-sat)
