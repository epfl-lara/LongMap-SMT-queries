; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59110 () Bool)

(assert start!59110)

(declare-fun b!652432 () Bool)

(declare-fun res!423121 () Bool)

(declare-fun e!374481 () Bool)

(assert (=> b!652432 (=> (not res!423121) (not e!374481))))

(declare-datatypes ((array!38610 0))(
  ( (array!38611 (arr!18508 (Array (_ BitVec 32) (_ BitVec 64))) (size!18872 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38610)

(declare-datatypes ((List!12549 0))(
  ( (Nil!12546) (Cons!12545 (h!13590 (_ BitVec 64)) (t!18777 List!12549)) )
))
(declare-fun arrayNoDuplicates!0 (array!38610 (_ BitVec 32) List!12549) Bool)

(assert (=> b!652432 (= res!423121 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12546))))

(declare-fun b!652433 () Bool)

(declare-fun e!374471 () Bool)

(assert (=> b!652433 (= e!374481 e!374471)))

(declare-fun res!423105 () Bool)

(assert (=> b!652433 (=> (not res!423105) (not e!374471))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!652433 (= res!423105 (= (select (store (arr!18508 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!303606 () array!38610)

(assert (=> b!652433 (= lt!303606 (array!38611 (store (arr!18508 a!2986) i!1108 k0!1786) (size!18872 a!2986)))))

(declare-fun b!652434 () Bool)

(declare-fun e!374470 () Bool)

(declare-fun e!374473 () Bool)

(assert (=> b!652434 (= e!374470 e!374473)))

(declare-fun res!423114 () Bool)

(assert (=> b!652434 (=> res!423114 e!374473)))

(declare-fun lt!303615 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303612 () (_ BitVec 64))

(assert (=> b!652434 (= res!423114 (or (not (= (select (arr!18508 a!2986) j!136) lt!303615)) (not (= (select (arr!18508 a!2986) j!136) lt!303612))))))

(declare-fun e!374476 () Bool)

(assert (=> b!652434 e!374476))

(declare-fun res!423122 () Bool)

(assert (=> b!652434 (=> (not res!423122) (not e!374476))))

(assert (=> b!652434 (= res!423122 (= lt!303612 (select (arr!18508 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652434 (= lt!303612 (select (store (arr!18508 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!374474 () Bool)

(declare-fun b!652435 () Bool)

(declare-fun arrayContainsKey!0 (array!38610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652435 (= e!374474 (arrayContainsKey!0 lt!303606 (select (arr!18508 a!2986) j!136) index!984))))

(declare-fun b!652436 () Bool)

(declare-datatypes ((Unit!22314 0))(
  ( (Unit!22315) )
))
(declare-fun e!374469 () Unit!22314)

(declare-fun Unit!22316 () Unit!22314)

(assert (=> b!652436 (= e!374469 Unit!22316)))

(assert (=> b!652436 false))

(declare-fun b!652437 () Bool)

(declare-fun res!423107 () Bool)

(declare-fun e!374467 () Bool)

(assert (=> b!652437 (=> (not res!423107) (not e!374467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652437 (= res!423107 (validKeyInArray!0 (select (arr!18508 a!2986) j!136)))))

(declare-fun b!652438 () Bool)

(declare-fun e!374472 () Unit!22314)

(declare-fun Unit!22317 () Unit!22314)

(assert (=> b!652438 (= e!374472 Unit!22317)))

(declare-fun lt!303616 () Unit!22314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22314)

(assert (=> b!652438 (= lt!303616 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303606 (select (arr!18508 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652438 (arrayContainsKey!0 lt!303606 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303617 () Unit!22314)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12549) Unit!22314)

(assert (=> b!652438 (= lt!303617 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12546))))

(assert (=> b!652438 (arrayNoDuplicates!0 lt!303606 #b00000000000000000000000000000000 Nil!12546)))

(declare-fun lt!303618 () Unit!22314)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38610 (_ BitVec 32) (_ BitVec 32)) Unit!22314)

(assert (=> b!652438 (= lt!303618 (lemmaNoDuplicateFromThenFromBigger!0 lt!303606 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652438 (arrayNoDuplicates!0 lt!303606 j!136 Nil!12546)))

(declare-fun lt!303605 () Unit!22314)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38610 (_ BitVec 64) (_ BitVec 32) List!12549) Unit!22314)

(assert (=> b!652438 (= lt!303605 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303606 (select (arr!18508 a!2986) j!136) j!136 Nil!12546))))

(assert (=> b!652438 false))

(declare-fun b!652439 () Bool)

(declare-fun e!374477 () Bool)

(assert (=> b!652439 (= e!374477 (or (bvsge (size!18872 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18872 a!2986)) (bvslt index!984 (size!18872 a!2986))))))

(assert (=> b!652439 (arrayNoDuplicates!0 lt!303606 index!984 Nil!12546)))

(declare-fun lt!303602 () Unit!22314)

(assert (=> b!652439 (= lt!303602 (lemmaNoDuplicateFromThenFromBigger!0 lt!303606 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652439 (arrayNoDuplicates!0 lt!303606 #b00000000000000000000000000000000 Nil!12546)))

(declare-fun lt!303611 () Unit!22314)

(assert (=> b!652439 (= lt!303611 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12546))))

(assert (=> b!652439 (arrayContainsKey!0 lt!303606 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303609 () Unit!22314)

(assert (=> b!652439 (= lt!303609 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303606 (select (arr!18508 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374475 () Bool)

(assert (=> b!652439 e!374475))

(declare-fun res!423108 () Bool)

(assert (=> b!652439 (=> (not res!423108) (not e!374475))))

(assert (=> b!652439 (= res!423108 (arrayContainsKey!0 lt!303606 (select (arr!18508 a!2986) j!136) j!136))))

(declare-fun b!652440 () Bool)

(declare-fun res!423119 () Bool)

(assert (=> b!652440 (=> (not res!423119) (not e!374467))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!652440 (= res!423119 (and (= (size!18872 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18872 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18872 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652441 () Bool)

(declare-fun e!374478 () Bool)

(assert (=> b!652441 (= e!374471 e!374478)))

(declare-fun res!423120 () Bool)

(assert (=> b!652441 (=> (not res!423120) (not e!374478))))

(declare-datatypes ((SeekEntryResult!6948 0))(
  ( (MissingZero!6948 (index!30145 (_ BitVec 32))) (Found!6948 (index!30146 (_ BitVec 32))) (Intermediate!6948 (undefined!7760 Bool) (index!30147 (_ BitVec 32)) (x!58931 (_ BitVec 32))) (Undefined!6948) (MissingVacant!6948 (index!30148 (_ BitVec 32))) )
))
(declare-fun lt!303619 () SeekEntryResult!6948)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!652441 (= res!423120 (and (= lt!303619 (Found!6948 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18508 a!2986) index!984) (select (arr!18508 a!2986) j!136))) (not (= (select (arr!18508 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38610 (_ BitVec 32)) SeekEntryResult!6948)

(assert (=> b!652441 (= lt!303619 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652442 () Bool)

(assert (=> b!652442 (= e!374473 e!374477)))

(declare-fun res!423111 () Bool)

(assert (=> b!652442 (=> res!423111 e!374477)))

(assert (=> b!652442 (= res!423111 (bvsge index!984 j!136))))

(declare-fun lt!303603 () Unit!22314)

(assert (=> b!652442 (= lt!303603 e!374472)))

(declare-fun c!75031 () Bool)

(assert (=> b!652442 (= c!75031 (bvslt j!136 index!984))))

(declare-fun b!652443 () Bool)

(assert (=> b!652443 (= e!374475 (arrayContainsKey!0 lt!303606 (select (arr!18508 a!2986) j!136) index!984))))

(declare-fun res!423106 () Bool)

(assert (=> start!59110 (=> (not res!423106) (not e!374467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59110 (= res!423106 (validMask!0 mask!3053))))

(assert (=> start!59110 e!374467))

(assert (=> start!59110 true))

(declare-fun array_inv!14304 (array!38610) Bool)

(assert (=> start!59110 (array_inv!14304 a!2986)))

(declare-fun b!652444 () Bool)

(declare-fun e!374468 () Bool)

(assert (=> b!652444 (= e!374468 e!374474)))

(declare-fun res!423113 () Bool)

(assert (=> b!652444 (=> (not res!423113) (not e!374474))))

(assert (=> b!652444 (= res!423113 (arrayContainsKey!0 lt!303606 (select (arr!18508 a!2986) j!136) j!136))))

(declare-fun b!652445 () Bool)

(declare-fun e!374480 () Bool)

(declare-fun lt!303604 () SeekEntryResult!6948)

(assert (=> b!652445 (= e!374480 (= lt!303619 lt!303604))))

(declare-fun b!652446 () Bool)

(declare-fun res!423115 () Bool)

(assert (=> b!652446 (=> (not res!423115) (not e!374481))))

(assert (=> b!652446 (= res!423115 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18508 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652447 () Bool)

(declare-fun res!423118 () Bool)

(assert (=> b!652447 (=> (not res!423118) (not e!374467))))

(assert (=> b!652447 (= res!423118 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652448 () Bool)

(assert (=> b!652448 (= e!374467 e!374481)))

(declare-fun res!423110 () Bool)

(assert (=> b!652448 (=> (not res!423110) (not e!374481))))

(declare-fun lt!303607 () SeekEntryResult!6948)

(assert (=> b!652448 (= res!423110 (or (= lt!303607 (MissingZero!6948 i!1108)) (= lt!303607 (MissingVacant!6948 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38610 (_ BitVec 32)) SeekEntryResult!6948)

(assert (=> b!652448 (= lt!303607 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652449 () Bool)

(declare-fun Unit!22318 () Unit!22314)

(assert (=> b!652449 (= e!374469 Unit!22318)))

(declare-fun b!652450 () Bool)

(assert (=> b!652450 (= e!374476 e!374468)))

(declare-fun res!423109 () Bool)

(assert (=> b!652450 (=> res!423109 e!374468)))

(assert (=> b!652450 (= res!423109 (or (not (= (select (arr!18508 a!2986) j!136) lt!303615)) (not (= (select (arr!18508 a!2986) j!136) lt!303612)) (bvsge j!136 index!984)))))

(declare-fun b!652451 () Bool)

(declare-fun res!423116 () Bool)

(assert (=> b!652451 (=> (not res!423116) (not e!374467))))

(assert (=> b!652451 (= res!423116 (validKeyInArray!0 k0!1786))))

(declare-fun b!652452 () Bool)

(assert (=> b!652452 (= e!374478 (not e!374470))))

(declare-fun res!423104 () Bool)

(assert (=> b!652452 (=> res!423104 e!374470)))

(declare-fun lt!303613 () SeekEntryResult!6948)

(assert (=> b!652452 (= res!423104 (not (= lt!303613 (Found!6948 index!984))))))

(declare-fun lt!303608 () Unit!22314)

(assert (=> b!652452 (= lt!303608 e!374469)))

(declare-fun c!75032 () Bool)

(assert (=> b!652452 (= c!75032 (= lt!303613 Undefined!6948))))

(assert (=> b!652452 (= lt!303613 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303615 lt!303606 mask!3053))))

(assert (=> b!652452 e!374480))

(declare-fun res!423117 () Bool)

(assert (=> b!652452 (=> (not res!423117) (not e!374480))))

(declare-fun lt!303610 () (_ BitVec 32))

(assert (=> b!652452 (= res!423117 (= lt!303604 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303610 vacantSpotIndex!68 lt!303615 lt!303606 mask!3053)))))

(assert (=> b!652452 (= lt!303604 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303610 vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652452 (= lt!303615 (select (store (arr!18508 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303614 () Unit!22314)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38610 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22314)

(assert (=> b!652452 (= lt!303614 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303610 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652452 (= lt!303610 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652453 () Bool)

(declare-fun Unit!22319 () Unit!22314)

(assert (=> b!652453 (= e!374472 Unit!22319)))

(declare-fun b!652454 () Bool)

(declare-fun res!423112 () Bool)

(assert (=> b!652454 (=> (not res!423112) (not e!374481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38610 (_ BitVec 32)) Bool)

(assert (=> b!652454 (= res!423112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59110 res!423106) b!652440))

(assert (= (and b!652440 res!423119) b!652437))

(assert (= (and b!652437 res!423107) b!652451))

(assert (= (and b!652451 res!423116) b!652447))

(assert (= (and b!652447 res!423118) b!652448))

(assert (= (and b!652448 res!423110) b!652454))

(assert (= (and b!652454 res!423112) b!652432))

(assert (= (and b!652432 res!423121) b!652446))

(assert (= (and b!652446 res!423115) b!652433))

(assert (= (and b!652433 res!423105) b!652441))

(assert (= (and b!652441 res!423120) b!652452))

(assert (= (and b!652452 res!423117) b!652445))

(assert (= (and b!652452 c!75032) b!652436))

(assert (= (and b!652452 (not c!75032)) b!652449))

(assert (= (and b!652452 (not res!423104)) b!652434))

(assert (= (and b!652434 res!423122) b!652450))

(assert (= (and b!652450 (not res!423109)) b!652444))

(assert (= (and b!652444 res!423113) b!652435))

(assert (= (and b!652434 (not res!423114)) b!652442))

(assert (= (and b!652442 c!75031) b!652438))

(assert (= (and b!652442 (not c!75031)) b!652453))

(assert (= (and b!652442 (not res!423111)) b!652439))

(assert (= (and b!652439 res!423108) b!652443))

(declare-fun m!625573 () Bool)

(assert (=> b!652446 m!625573))

(declare-fun m!625575 () Bool)

(assert (=> b!652437 m!625575))

(assert (=> b!652437 m!625575))

(declare-fun m!625577 () Bool)

(assert (=> b!652437 m!625577))

(assert (=> b!652439 m!625575))

(declare-fun m!625579 () Bool)

(assert (=> b!652439 m!625579))

(assert (=> b!652439 m!625575))

(assert (=> b!652439 m!625575))

(declare-fun m!625581 () Bool)

(assert (=> b!652439 m!625581))

(declare-fun m!625583 () Bool)

(assert (=> b!652439 m!625583))

(declare-fun m!625585 () Bool)

(assert (=> b!652439 m!625585))

(assert (=> b!652439 m!625575))

(declare-fun m!625587 () Bool)

(assert (=> b!652439 m!625587))

(declare-fun m!625589 () Bool)

(assert (=> b!652439 m!625589))

(declare-fun m!625591 () Bool)

(assert (=> b!652439 m!625591))

(declare-fun m!625593 () Bool)

(assert (=> b!652447 m!625593))

(declare-fun m!625595 () Bool)

(assert (=> b!652432 m!625595))

(assert (=> b!652435 m!625575))

(assert (=> b!652435 m!625575))

(declare-fun m!625597 () Bool)

(assert (=> b!652435 m!625597))

(declare-fun m!625599 () Bool)

(assert (=> start!59110 m!625599))

(declare-fun m!625601 () Bool)

(assert (=> start!59110 m!625601))

(declare-fun m!625603 () Bool)

(assert (=> b!652451 m!625603))

(declare-fun m!625605 () Bool)

(assert (=> b!652441 m!625605))

(assert (=> b!652441 m!625575))

(assert (=> b!652441 m!625575))

(declare-fun m!625607 () Bool)

(assert (=> b!652441 m!625607))

(declare-fun m!625609 () Bool)

(assert (=> b!652433 m!625609))

(declare-fun m!625611 () Bool)

(assert (=> b!652433 m!625611))

(declare-fun m!625613 () Bool)

(assert (=> b!652454 m!625613))

(declare-fun m!625615 () Bool)

(assert (=> b!652448 m!625615))

(assert (=> b!652444 m!625575))

(assert (=> b!652444 m!625575))

(assert (=> b!652444 m!625579))

(assert (=> b!652434 m!625575))

(assert (=> b!652434 m!625609))

(declare-fun m!625617 () Bool)

(assert (=> b!652434 m!625617))

(assert (=> b!652450 m!625575))

(assert (=> b!652443 m!625575))

(assert (=> b!652443 m!625575))

(assert (=> b!652443 m!625597))

(assert (=> b!652438 m!625575))

(declare-fun m!625619 () Bool)

(assert (=> b!652438 m!625619))

(assert (=> b!652438 m!625575))

(declare-fun m!625621 () Bool)

(assert (=> b!652438 m!625621))

(assert (=> b!652438 m!625591))

(declare-fun m!625623 () Bool)

(assert (=> b!652438 m!625623))

(assert (=> b!652438 m!625575))

(declare-fun m!625625 () Bool)

(assert (=> b!652438 m!625625))

(assert (=> b!652438 m!625575))

(declare-fun m!625627 () Bool)

(assert (=> b!652438 m!625627))

(assert (=> b!652438 m!625589))

(declare-fun m!625629 () Bool)

(assert (=> b!652452 m!625629))

(declare-fun m!625631 () Bool)

(assert (=> b!652452 m!625631))

(assert (=> b!652452 m!625575))

(assert (=> b!652452 m!625609))

(declare-fun m!625633 () Bool)

(assert (=> b!652452 m!625633))

(declare-fun m!625635 () Bool)

(assert (=> b!652452 m!625635))

(declare-fun m!625637 () Bool)

(assert (=> b!652452 m!625637))

(assert (=> b!652452 m!625575))

(declare-fun m!625639 () Bool)

(assert (=> b!652452 m!625639))

(check-sat (not b!652435) (not b!652438) (not b!652439) (not b!652451) (not b!652452) (not b!652454) (not b!652447) (not b!652443) (not b!652432) (not b!652437) (not b!652444) (not b!652448) (not b!652441) (not start!59110))
(check-sat)
