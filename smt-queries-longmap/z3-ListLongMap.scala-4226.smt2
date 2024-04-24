; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58182 () Bool)

(assert start!58182)

(declare-fun b!642463 () Bool)

(declare-fun e!367942 () Bool)

(declare-datatypes ((SeekEntryResult!6799 0))(
  ( (MissingZero!6799 (index!29522 (_ BitVec 32))) (Found!6799 (index!29523 (_ BitVec 32))) (Intermediate!6799 (undefined!7611 Bool) (index!29524 (_ BitVec 32)) (x!58440 (_ BitVec 32))) (Undefined!6799) (MissingVacant!6799 (index!29525 (_ BitVec 32))) )
))
(declare-fun lt!297487 () SeekEntryResult!6799)

(declare-fun lt!297492 () SeekEntryResult!6799)

(assert (=> b!642463 (= e!367942 (= lt!297487 lt!297492))))

(declare-fun b!642464 () Bool)

(declare-datatypes ((Unit!21705 0))(
  ( (Unit!21706) )
))
(declare-fun e!367944 () Unit!21705)

(declare-fun Unit!21707 () Unit!21705)

(assert (=> b!642464 (= e!367944 Unit!21707)))

(declare-fun b!642465 () Bool)

(declare-fun res!416089 () Bool)

(declare-fun e!367936 () Bool)

(assert (=> b!642465 (=> (not res!416089) (not e!367936))))

(declare-datatypes ((array!38379 0))(
  ( (array!38380 (arr!18403 (Array (_ BitVec 32) (_ BitVec 64))) (size!18767 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38379)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642465 (= res!416089 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642466 () Bool)

(declare-fun e!367939 () Bool)

(assert (=> b!642466 (= e!367936 e!367939)))

(declare-fun res!416091 () Bool)

(assert (=> b!642466 (=> (not res!416091) (not e!367939))))

(declare-fun lt!297483 () SeekEntryResult!6799)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642466 (= res!416091 (or (= lt!297483 (MissingZero!6799 i!1108)) (= lt!297483 (MissingVacant!6799 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38379 (_ BitVec 32)) SeekEntryResult!6799)

(assert (=> b!642466 (= lt!297483 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!416101 () Bool)

(assert (=> start!58182 (=> (not res!416101) (not e!367936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58182 (= res!416101 (validMask!0 mask!3053))))

(assert (=> start!58182 e!367936))

(assert (=> start!58182 true))

(declare-fun array_inv!14262 (array!38379) Bool)

(assert (=> start!58182 (array_inv!14262 a!2986)))

(declare-fun b!642467 () Bool)

(declare-fun Unit!21708 () Unit!21705)

(assert (=> b!642467 (= e!367944 Unit!21708)))

(assert (=> b!642467 false))

(declare-fun b!642468 () Bool)

(declare-fun res!416102 () Bool)

(assert (=> b!642468 (=> (not res!416102) (not e!367939))))

(declare-datatypes ((List!12351 0))(
  ( (Nil!12348) (Cons!12347 (h!13395 (_ BitVec 64)) (t!18571 List!12351)) )
))
(declare-fun arrayNoDuplicates!0 (array!38379 (_ BitVec 32) List!12351) Bool)

(assert (=> b!642468 (= res!416102 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12348))))

(declare-fun b!642469 () Bool)

(declare-fun res!416097 () Bool)

(declare-fun e!367941 () Bool)

(assert (=> b!642469 (=> res!416097 e!367941)))

(declare-fun contains!3116 (List!12351 (_ BitVec 64)) Bool)

(assert (=> b!642469 (= res!416097 (contains!3116 Nil!12348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!297488 () array!38379)

(declare-fun b!642470 () Bool)

(declare-fun e!367943 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642470 (= e!367943 (arrayContainsKey!0 lt!297488 (select (arr!18403 a!2986) j!136) index!984))))

(declare-fun b!642471 () Bool)

(declare-fun e!367937 () Bool)

(declare-fun e!367934 () Bool)

(assert (=> b!642471 (= e!367937 e!367934)))

(declare-fun res!416088 () Bool)

(assert (=> b!642471 (=> res!416088 e!367934)))

(declare-fun lt!297484 () (_ BitVec 64))

(declare-fun lt!297489 () (_ BitVec 64))

(assert (=> b!642471 (= res!416088 (or (not (= (select (arr!18403 a!2986) j!136) lt!297489)) (not (= (select (arr!18403 a!2986) j!136) lt!297484)) (bvsge j!136 index!984)))))

(declare-fun e!367935 () Bool)

(assert (=> b!642471 e!367935))

(declare-fun res!416103 () Bool)

(assert (=> b!642471 (=> (not res!416103) (not e!367935))))

(assert (=> b!642471 (= res!416103 (= lt!297484 (select (arr!18403 a!2986) j!136)))))

(assert (=> b!642471 (= lt!297484 (select (store (arr!18403 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642472 () Bool)

(declare-fun res!416090 () Bool)

(assert (=> b!642472 (=> (not res!416090) (not e!367936))))

(assert (=> b!642472 (= res!416090 (and (= (size!18767 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18767 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18767 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642473 () Bool)

(assert (=> b!642473 (= e!367934 e!367941)))

(declare-fun res!416096 () Bool)

(assert (=> b!642473 (=> res!416096 e!367941)))

(assert (=> b!642473 (= res!416096 (or (bvsge (size!18767 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18767 a!2986))))))

(assert (=> b!642473 (arrayNoDuplicates!0 lt!297488 j!136 Nil!12348)))

(declare-fun lt!297493 () Unit!21705)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38379 (_ BitVec 32) (_ BitVec 32)) Unit!21705)

(assert (=> b!642473 (= lt!297493 (lemmaNoDuplicateFromThenFromBigger!0 lt!297488 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642473 (arrayNoDuplicates!0 lt!297488 #b00000000000000000000000000000000 Nil!12348)))

(declare-fun lt!297494 () Unit!21705)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38379 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12351) Unit!21705)

(assert (=> b!642473 (= lt!297494 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12348))))

(assert (=> b!642473 (arrayContainsKey!0 lt!297488 (select (arr!18403 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297485 () Unit!21705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38379 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21705)

(assert (=> b!642473 (= lt!297485 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297488 (select (arr!18403 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642474 () Bool)

(declare-fun e!367933 () Bool)

(declare-fun e!367938 () Bool)

(assert (=> b!642474 (= e!367933 e!367938)))

(declare-fun res!416094 () Bool)

(assert (=> b!642474 (=> (not res!416094) (not e!367938))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!642474 (= res!416094 (and (= lt!297487 (Found!6799 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18403 a!2986) index!984) (select (arr!18403 a!2986) j!136))) (not (= (select (arr!18403 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38379 (_ BitVec 32)) SeekEntryResult!6799)

(assert (=> b!642474 (= lt!297487 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642475 () Bool)

(declare-fun e!367940 () Bool)

(assert (=> b!642475 (= e!367940 e!367943)))

(declare-fun res!416099 () Bool)

(assert (=> b!642475 (=> (not res!416099) (not e!367943))))

(assert (=> b!642475 (= res!416099 (arrayContainsKey!0 lt!297488 (select (arr!18403 a!2986) j!136) j!136))))

(declare-fun b!642476 () Bool)

(declare-fun res!416095 () Bool)

(assert (=> b!642476 (=> (not res!416095) (not e!367939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38379 (_ BitVec 32)) Bool)

(assert (=> b!642476 (= res!416095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642477 () Bool)

(assert (=> b!642477 (= e!367935 e!367940)))

(declare-fun res!416104 () Bool)

(assert (=> b!642477 (=> res!416104 e!367940)))

(assert (=> b!642477 (= res!416104 (or (not (= (select (arr!18403 a!2986) j!136) lt!297489)) (not (= (select (arr!18403 a!2986) j!136) lt!297484)) (bvsge j!136 index!984)))))

(declare-fun b!642478 () Bool)

(assert (=> b!642478 (= e!367941 true)))

(declare-fun lt!297496 () Bool)

(assert (=> b!642478 (= lt!297496 (contains!3116 Nil!12348 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642479 () Bool)

(declare-fun res!416107 () Bool)

(assert (=> b!642479 (=> res!416107 e!367941)))

(declare-fun noDuplicate!412 (List!12351) Bool)

(assert (=> b!642479 (= res!416107 (not (noDuplicate!412 Nil!12348)))))

(declare-fun b!642480 () Bool)

(assert (=> b!642480 (= e!367939 e!367933)))

(declare-fun res!416098 () Bool)

(assert (=> b!642480 (=> (not res!416098) (not e!367933))))

(assert (=> b!642480 (= res!416098 (= (select (store (arr!18403 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642480 (= lt!297488 (array!38380 (store (arr!18403 a!2986) i!1108 k0!1786) (size!18767 a!2986)))))

(declare-fun b!642481 () Bool)

(declare-fun res!416100 () Bool)

(assert (=> b!642481 (=> (not res!416100) (not e!367939))))

(assert (=> b!642481 (= res!416100 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18403 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642482 () Bool)

(declare-fun res!416093 () Bool)

(assert (=> b!642482 (=> (not res!416093) (not e!367936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642482 (= res!416093 (validKeyInArray!0 (select (arr!18403 a!2986) j!136)))))

(declare-fun b!642483 () Bool)

(assert (=> b!642483 (= e!367938 (not e!367937))))

(declare-fun res!416106 () Bool)

(assert (=> b!642483 (=> res!416106 e!367937)))

(declare-fun lt!297491 () SeekEntryResult!6799)

(assert (=> b!642483 (= res!416106 (not (= lt!297491 (Found!6799 index!984))))))

(declare-fun lt!297495 () Unit!21705)

(assert (=> b!642483 (= lt!297495 e!367944)))

(declare-fun c!73556 () Bool)

(assert (=> b!642483 (= c!73556 (= lt!297491 Undefined!6799))))

(assert (=> b!642483 (= lt!297491 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297489 lt!297488 mask!3053))))

(assert (=> b!642483 e!367942))

(declare-fun res!416105 () Bool)

(assert (=> b!642483 (=> (not res!416105) (not e!367942))))

(declare-fun lt!297486 () (_ BitVec 32))

(assert (=> b!642483 (= res!416105 (= lt!297492 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297486 vacantSpotIndex!68 lt!297489 lt!297488 mask!3053)))))

(assert (=> b!642483 (= lt!297492 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297486 vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642483 (= lt!297489 (select (store (arr!18403 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297490 () Unit!21705)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21705)

(assert (=> b!642483 (= lt!297490 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297486 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642483 (= lt!297486 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!642484 () Bool)

(declare-fun res!416092 () Bool)

(assert (=> b!642484 (=> (not res!416092) (not e!367936))))

(assert (=> b!642484 (= res!416092 (validKeyInArray!0 k0!1786))))

(assert (= (and start!58182 res!416101) b!642472))

(assert (= (and b!642472 res!416090) b!642482))

(assert (= (and b!642482 res!416093) b!642484))

(assert (= (and b!642484 res!416092) b!642465))

(assert (= (and b!642465 res!416089) b!642466))

(assert (= (and b!642466 res!416091) b!642476))

(assert (= (and b!642476 res!416095) b!642468))

(assert (= (and b!642468 res!416102) b!642481))

(assert (= (and b!642481 res!416100) b!642480))

(assert (= (and b!642480 res!416098) b!642474))

(assert (= (and b!642474 res!416094) b!642483))

(assert (= (and b!642483 res!416105) b!642463))

(assert (= (and b!642483 c!73556) b!642467))

(assert (= (and b!642483 (not c!73556)) b!642464))

(assert (= (and b!642483 (not res!416106)) b!642471))

(assert (= (and b!642471 res!416103) b!642477))

(assert (= (and b!642477 (not res!416104)) b!642475))

(assert (= (and b!642475 res!416099) b!642470))

(assert (= (and b!642471 (not res!416088)) b!642473))

(assert (= (and b!642473 (not res!416096)) b!642479))

(assert (= (and b!642479 (not res!416107)) b!642469))

(assert (= (and b!642469 (not res!416097)) b!642478))

(declare-fun m!616627 () Bool)

(assert (=> b!642481 m!616627))

(declare-fun m!616629 () Bool)

(assert (=> b!642474 m!616629))

(declare-fun m!616631 () Bool)

(assert (=> b!642474 m!616631))

(assert (=> b!642474 m!616631))

(declare-fun m!616633 () Bool)

(assert (=> b!642474 m!616633))

(declare-fun m!616635 () Bool)

(assert (=> b!642480 m!616635))

(declare-fun m!616637 () Bool)

(assert (=> b!642480 m!616637))

(assert (=> b!642470 m!616631))

(assert (=> b!642470 m!616631))

(declare-fun m!616639 () Bool)

(assert (=> b!642470 m!616639))

(declare-fun m!616641 () Bool)

(assert (=> b!642478 m!616641))

(assert (=> b!642475 m!616631))

(assert (=> b!642475 m!616631))

(declare-fun m!616643 () Bool)

(assert (=> b!642475 m!616643))

(assert (=> b!642471 m!616631))

(assert (=> b!642471 m!616635))

(declare-fun m!616645 () Bool)

(assert (=> b!642471 m!616645))

(declare-fun m!616647 () Bool)

(assert (=> b!642465 m!616647))

(declare-fun m!616649 () Bool)

(assert (=> b!642468 m!616649))

(declare-fun m!616651 () Bool)

(assert (=> b!642466 m!616651))

(declare-fun m!616653 () Bool)

(assert (=> b!642484 m!616653))

(declare-fun m!616655 () Bool)

(assert (=> b!642476 m!616655))

(assert (=> b!642477 m!616631))

(declare-fun m!616657 () Bool)

(assert (=> b!642469 m!616657))

(assert (=> b!642482 m!616631))

(assert (=> b!642482 m!616631))

(declare-fun m!616659 () Bool)

(assert (=> b!642482 m!616659))

(assert (=> b!642473 m!616631))

(declare-fun m!616661 () Bool)

(assert (=> b!642473 m!616661))

(declare-fun m!616663 () Bool)

(assert (=> b!642473 m!616663))

(assert (=> b!642473 m!616631))

(declare-fun m!616665 () Bool)

(assert (=> b!642473 m!616665))

(assert (=> b!642473 m!616631))

(declare-fun m!616667 () Bool)

(assert (=> b!642473 m!616667))

(declare-fun m!616669 () Bool)

(assert (=> b!642473 m!616669))

(declare-fun m!616671 () Bool)

(assert (=> b!642473 m!616671))

(declare-fun m!616673 () Bool)

(assert (=> b!642479 m!616673))

(declare-fun m!616675 () Bool)

(assert (=> start!58182 m!616675))

(declare-fun m!616677 () Bool)

(assert (=> start!58182 m!616677))

(declare-fun m!616679 () Bool)

(assert (=> b!642483 m!616679))

(declare-fun m!616681 () Bool)

(assert (=> b!642483 m!616681))

(assert (=> b!642483 m!616631))

(assert (=> b!642483 m!616635))

(declare-fun m!616683 () Bool)

(assert (=> b!642483 m!616683))

(declare-fun m!616685 () Bool)

(assert (=> b!642483 m!616685))

(assert (=> b!642483 m!616631))

(declare-fun m!616687 () Bool)

(assert (=> b!642483 m!616687))

(declare-fun m!616689 () Bool)

(assert (=> b!642483 m!616689))

(check-sat (not b!642470) (not b!642469) (not b!642478) (not b!642473) (not b!642479) (not b!642468) (not b!642474) (not b!642466) (not start!58182) (not b!642482) (not b!642475) (not b!642476) (not b!642484) (not b!642465) (not b!642483))
(check-sat)
