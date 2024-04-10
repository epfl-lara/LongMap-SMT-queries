; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58876 () Bool)

(assert start!58876)

(declare-fun b!649458 () Bool)

(declare-fun e!372524 () Bool)

(declare-fun e!372523 () Bool)

(assert (=> b!649458 (= e!372524 e!372523)))

(declare-fun res!420963 () Bool)

(assert (=> b!649458 (=> res!420963 e!372523)))

(declare-datatypes ((array!38538 0))(
  ( (array!38539 (arr!18475 (Array (_ BitVec 32) (_ BitVec 64))) (size!18839 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38538)

(assert (=> b!649458 (= res!420963 (or (bvsge (size!18839 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18839 a!2986))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!301587 () array!38538)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649458 (arrayContainsKey!0 lt!301587 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!22116 0))(
  ( (Unit!22117) )
))
(declare-fun lt!301585 () Unit!22116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22116)

(assert (=> b!649458 (= lt!301585 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301587 (select (arr!18475 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372510 () Bool)

(assert (=> b!649458 e!372510))

(declare-fun res!420968 () Bool)

(assert (=> b!649458 (=> (not res!420968) (not e!372510))))

(assert (=> b!649458 (= res!420968 (arrayContainsKey!0 lt!301587 (select (arr!18475 a!2986) j!136) j!136))))

(declare-fun b!649459 () Bool)

(declare-fun e!372511 () Unit!22116)

(declare-fun Unit!22118 () Unit!22116)

(assert (=> b!649459 (= e!372511 Unit!22118)))

(declare-fun b!649460 () Bool)

(declare-fun res!420960 () Bool)

(declare-fun e!372515 () Bool)

(assert (=> b!649460 (=> (not res!420960) (not e!372515))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649460 (= res!420960 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18475 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649461 () Bool)

(declare-fun e!372514 () Bool)

(assert (=> b!649461 (= e!372515 e!372514)))

(declare-fun res!420974 () Bool)

(assert (=> b!649461 (=> (not res!420974) (not e!372514))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!649461 (= res!420974 (= (select (store (arr!18475 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649461 (= lt!301587 (array!38539 (store (arr!18475 a!2986) i!1108 k0!1786) (size!18839 a!2986)))))

(declare-fun b!649462 () Bool)

(declare-fun e!372519 () Bool)

(assert (=> b!649462 (= e!372519 e!372515)))

(declare-fun res!420952 () Bool)

(assert (=> b!649462 (=> (not res!420952) (not e!372515))))

(declare-datatypes ((SeekEntryResult!6915 0))(
  ( (MissingZero!6915 (index!30007 (_ BitVec 32))) (Found!6915 (index!30008 (_ BitVec 32))) (Intermediate!6915 (undefined!7727 Bool) (index!30009 (_ BitVec 32)) (x!58792 (_ BitVec 32))) (Undefined!6915) (MissingVacant!6915 (index!30010 (_ BitVec 32))) )
))
(declare-fun lt!301581 () SeekEntryResult!6915)

(assert (=> b!649462 (= res!420952 (or (= lt!301581 (MissingZero!6915 i!1108)) (= lt!301581 (MissingVacant!6915 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38538 (_ BitVec 32)) SeekEntryResult!6915)

(assert (=> b!649462 (= lt!301581 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649463 () Bool)

(assert (=> b!649463 (= e!372523 true)))

(declare-fun lt!301586 () Bool)

(declare-datatypes ((List!12516 0))(
  ( (Nil!12513) (Cons!12512 (h!13557 (_ BitVec 64)) (t!18744 List!12516)) )
))
(declare-fun contains!3171 (List!12516 (_ BitVec 64)) Bool)

(assert (=> b!649463 (= lt!301586 (contains!3171 Nil!12513 k0!1786))))

(declare-fun b!649464 () Bool)

(declare-fun res!420966 () Bool)

(assert (=> b!649464 (=> (not res!420966) (not e!372515))))

(declare-fun arrayNoDuplicates!0 (array!38538 (_ BitVec 32) List!12516) Bool)

(assert (=> b!649464 (= res!420966 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12513))))

(declare-fun b!649465 () Bool)

(declare-fun e!372522 () Unit!22116)

(declare-fun Unit!22119 () Unit!22116)

(assert (=> b!649465 (= e!372522 Unit!22119)))

(declare-fun b!649466 () Bool)

(declare-fun res!420965 () Bool)

(assert (=> b!649466 (=> res!420965 e!372523)))

(declare-fun noDuplicate!433 (List!12516) Bool)

(assert (=> b!649466 (= res!420965 (not (noDuplicate!433 Nil!12513)))))

(declare-fun b!649467 () Bool)

(declare-fun e!372521 () Bool)

(assert (=> b!649467 (= e!372521 e!372524)))

(declare-fun res!420972 () Bool)

(assert (=> b!649467 (=> res!420972 e!372524)))

(assert (=> b!649467 (= res!420972 (bvsge index!984 j!136))))

(declare-fun lt!301597 () Unit!22116)

(assert (=> b!649467 (= lt!301597 e!372522)))

(declare-fun c!74621 () Bool)

(assert (=> b!649467 (= c!74621 (bvslt j!136 index!984))))

(declare-fun b!649468 () Bool)

(declare-fun res!420954 () Bool)

(assert (=> b!649468 (=> (not res!420954) (not e!372519))))

(assert (=> b!649468 (= res!420954 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649469 () Bool)

(declare-fun res!420953 () Bool)

(assert (=> b!649469 (=> res!420953 e!372523)))

(assert (=> b!649469 (= res!420953 (contains!3171 Nil!12513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649470 () Bool)

(declare-fun Unit!22120 () Unit!22116)

(assert (=> b!649470 (= e!372522 Unit!22120)))

(declare-fun lt!301592 () Unit!22116)

(assert (=> b!649470 (= lt!301592 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301587 (select (arr!18475 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649470 (arrayContainsKey!0 lt!301587 (select (arr!18475 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301595 () Unit!22116)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12516) Unit!22116)

(assert (=> b!649470 (= lt!301595 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12513))))

(assert (=> b!649470 (arrayNoDuplicates!0 lt!301587 #b00000000000000000000000000000000 Nil!12513)))

(declare-fun lt!301584 () Unit!22116)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38538 (_ BitVec 32) (_ BitVec 32)) Unit!22116)

(assert (=> b!649470 (= lt!301584 (lemmaNoDuplicateFromThenFromBigger!0 lt!301587 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649470 (arrayNoDuplicates!0 lt!301587 j!136 Nil!12513)))

(declare-fun lt!301588 () Unit!22116)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38538 (_ BitVec 64) (_ BitVec 32) List!12516) Unit!22116)

(assert (=> b!649470 (= lt!301588 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301587 (select (arr!18475 a!2986) j!136) j!136 Nil!12513))))

(assert (=> b!649470 false))

(declare-fun b!649471 () Bool)

(declare-fun res!420957 () Bool)

(assert (=> b!649471 (=> (not res!420957) (not e!372515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38538 (_ BitVec 32)) Bool)

(assert (=> b!649471 (= res!420957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649472 () Bool)

(declare-fun e!372513 () Bool)

(assert (=> b!649472 (= e!372513 e!372521)))

(declare-fun res!420958 () Bool)

(assert (=> b!649472 (=> res!420958 e!372521)))

(declare-fun lt!301583 () (_ BitVec 64))

(declare-fun lt!301591 () (_ BitVec 64))

(assert (=> b!649472 (= res!420958 (or (not (= (select (arr!18475 a!2986) j!136) lt!301583)) (not (= (select (arr!18475 a!2986) j!136) lt!301591))))))

(declare-fun e!372520 () Bool)

(assert (=> b!649472 e!372520))

(declare-fun res!420962 () Bool)

(assert (=> b!649472 (=> (not res!420962) (not e!372520))))

(assert (=> b!649472 (= res!420962 (= lt!301591 (select (arr!18475 a!2986) j!136)))))

(assert (=> b!649472 (= lt!301591 (select (store (arr!18475 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!420970 () Bool)

(assert (=> start!58876 (=> (not res!420970) (not e!372519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58876 (= res!420970 (validMask!0 mask!3053))))

(assert (=> start!58876 e!372519))

(assert (=> start!58876 true))

(declare-fun array_inv!14271 (array!38538) Bool)

(assert (=> start!58876 (array_inv!14271 a!2986)))

(declare-fun b!649473 () Bool)

(declare-fun e!372525 () Bool)

(assert (=> b!649473 (= e!372514 e!372525)))

(declare-fun res!420973 () Bool)

(assert (=> b!649473 (=> (not res!420973) (not e!372525))))

(declare-fun lt!301589 () SeekEntryResult!6915)

(assert (=> b!649473 (= res!420973 (and (= lt!301589 (Found!6915 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18475 a!2986) index!984) (select (arr!18475 a!2986) j!136))) (not (= (select (arr!18475 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38538 (_ BitVec 32)) SeekEntryResult!6915)

(assert (=> b!649473 (= lt!301589 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649474 () Bool)

(declare-fun res!420969 () Bool)

(assert (=> b!649474 (=> (not res!420969) (not e!372519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649474 (= res!420969 (validKeyInArray!0 (select (arr!18475 a!2986) j!136)))))

(declare-fun b!649475 () Bool)

(declare-fun Unit!22121 () Unit!22116)

(assert (=> b!649475 (= e!372511 Unit!22121)))

(assert (=> b!649475 false))

(declare-fun b!649476 () Bool)

(declare-fun e!372518 () Bool)

(assert (=> b!649476 (= e!372520 e!372518)))

(declare-fun res!420971 () Bool)

(assert (=> b!649476 (=> res!420971 e!372518)))

(assert (=> b!649476 (= res!420971 (or (not (= (select (arr!18475 a!2986) j!136) lt!301583)) (not (= (select (arr!18475 a!2986) j!136) lt!301591)) (bvsge j!136 index!984)))))

(declare-fun b!649477 () Bool)

(declare-fun res!420964 () Bool)

(assert (=> b!649477 (=> (not res!420964) (not e!372519))))

(assert (=> b!649477 (= res!420964 (validKeyInArray!0 k0!1786))))

(declare-fun b!649478 () Bool)

(declare-fun e!372517 () Bool)

(declare-fun lt!301590 () SeekEntryResult!6915)

(assert (=> b!649478 (= e!372517 (= lt!301589 lt!301590))))

(declare-fun b!649479 () Bool)

(declare-fun res!420956 () Bool)

(assert (=> b!649479 (=> (not res!420956) (not e!372519))))

(assert (=> b!649479 (= res!420956 (and (= (size!18839 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18839 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18839 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649480 () Bool)

(assert (=> b!649480 (= e!372525 (not e!372513))))

(declare-fun res!420955 () Bool)

(assert (=> b!649480 (=> res!420955 e!372513)))

(declare-fun lt!301582 () SeekEntryResult!6915)

(assert (=> b!649480 (= res!420955 (not (= lt!301582 (Found!6915 index!984))))))

(declare-fun lt!301593 () Unit!22116)

(assert (=> b!649480 (= lt!301593 e!372511)))

(declare-fun c!74620 () Bool)

(assert (=> b!649480 (= c!74620 (= lt!301582 Undefined!6915))))

(assert (=> b!649480 (= lt!301582 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301583 lt!301587 mask!3053))))

(assert (=> b!649480 e!372517))

(declare-fun res!420959 () Bool)

(assert (=> b!649480 (=> (not res!420959) (not e!372517))))

(declare-fun lt!301596 () (_ BitVec 32))

(assert (=> b!649480 (= res!420959 (= lt!301590 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301596 vacantSpotIndex!68 lt!301583 lt!301587 mask!3053)))))

(assert (=> b!649480 (= lt!301590 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301596 vacantSpotIndex!68 (select (arr!18475 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649480 (= lt!301583 (select (store (arr!18475 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301594 () Unit!22116)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22116)

(assert (=> b!649480 (= lt!301594 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301596 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649480 (= lt!301596 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649481 () Bool)

(declare-fun res!420961 () Bool)

(assert (=> b!649481 (=> res!420961 e!372523)))

(assert (=> b!649481 (= res!420961 (contains!3171 Nil!12513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649482 () Bool)

(declare-fun e!372512 () Bool)

(assert (=> b!649482 (= e!372512 (arrayContainsKey!0 lt!301587 (select (arr!18475 a!2986) j!136) index!984))))

(declare-fun b!649483 () Bool)

(assert (=> b!649483 (= e!372518 e!372512)))

(declare-fun res!420967 () Bool)

(assert (=> b!649483 (=> (not res!420967) (not e!372512))))

(assert (=> b!649483 (= res!420967 (arrayContainsKey!0 lt!301587 (select (arr!18475 a!2986) j!136) j!136))))

(declare-fun b!649484 () Bool)

(assert (=> b!649484 (= e!372510 (arrayContainsKey!0 lt!301587 (select (arr!18475 a!2986) j!136) index!984))))

(assert (= (and start!58876 res!420970) b!649479))

(assert (= (and b!649479 res!420956) b!649474))

(assert (= (and b!649474 res!420969) b!649477))

(assert (= (and b!649477 res!420964) b!649468))

(assert (= (and b!649468 res!420954) b!649462))

(assert (= (and b!649462 res!420952) b!649471))

(assert (= (and b!649471 res!420957) b!649464))

(assert (= (and b!649464 res!420966) b!649460))

(assert (= (and b!649460 res!420960) b!649461))

(assert (= (and b!649461 res!420974) b!649473))

(assert (= (and b!649473 res!420973) b!649480))

(assert (= (and b!649480 res!420959) b!649478))

(assert (= (and b!649480 c!74620) b!649475))

(assert (= (and b!649480 (not c!74620)) b!649459))

(assert (= (and b!649480 (not res!420955)) b!649472))

(assert (= (and b!649472 res!420962) b!649476))

(assert (= (and b!649476 (not res!420971)) b!649483))

(assert (= (and b!649483 res!420967) b!649482))

(assert (= (and b!649472 (not res!420958)) b!649467))

(assert (= (and b!649467 c!74621) b!649470))

(assert (= (and b!649467 (not c!74621)) b!649465))

(assert (= (and b!649467 (not res!420972)) b!649458))

(assert (= (and b!649458 res!420968) b!649484))

(assert (= (and b!649458 (not res!420963)) b!649466))

(assert (= (and b!649466 (not res!420965)) b!649469))

(assert (= (and b!649469 (not res!420953)) b!649481))

(assert (= (and b!649481 (not res!420961)) b!649463))

(declare-fun m!622709 () Bool)

(assert (=> b!649466 m!622709))

(declare-fun m!622711 () Bool)

(assert (=> b!649484 m!622711))

(assert (=> b!649484 m!622711))

(declare-fun m!622713 () Bool)

(assert (=> b!649484 m!622713))

(assert (=> b!649472 m!622711))

(declare-fun m!622715 () Bool)

(assert (=> b!649472 m!622715))

(declare-fun m!622717 () Bool)

(assert (=> b!649472 m!622717))

(assert (=> b!649458 m!622711))

(assert (=> b!649458 m!622711))

(declare-fun m!622719 () Bool)

(assert (=> b!649458 m!622719))

(assert (=> b!649458 m!622711))

(declare-fun m!622721 () Bool)

(assert (=> b!649458 m!622721))

(assert (=> b!649458 m!622711))

(declare-fun m!622723 () Bool)

(assert (=> b!649458 m!622723))

(assert (=> b!649461 m!622715))

(declare-fun m!622725 () Bool)

(assert (=> b!649461 m!622725))

(declare-fun m!622727 () Bool)

(assert (=> start!58876 m!622727))

(declare-fun m!622729 () Bool)

(assert (=> start!58876 m!622729))

(declare-fun m!622731 () Bool)

(assert (=> b!649460 m!622731))

(assert (=> b!649474 m!622711))

(assert (=> b!649474 m!622711))

(declare-fun m!622733 () Bool)

(assert (=> b!649474 m!622733))

(declare-fun m!622735 () Bool)

(assert (=> b!649473 m!622735))

(assert (=> b!649473 m!622711))

(assert (=> b!649473 m!622711))

(declare-fun m!622737 () Bool)

(assert (=> b!649473 m!622737))

(assert (=> b!649470 m!622711))

(declare-fun m!622739 () Bool)

(assert (=> b!649470 m!622739))

(assert (=> b!649470 m!622711))

(declare-fun m!622741 () Bool)

(assert (=> b!649470 m!622741))

(assert (=> b!649470 m!622711))

(declare-fun m!622743 () Bool)

(assert (=> b!649470 m!622743))

(assert (=> b!649470 m!622711))

(declare-fun m!622745 () Bool)

(assert (=> b!649470 m!622745))

(declare-fun m!622747 () Bool)

(assert (=> b!649470 m!622747))

(declare-fun m!622749 () Bool)

(assert (=> b!649470 m!622749))

(declare-fun m!622751 () Bool)

(assert (=> b!649470 m!622751))

(declare-fun m!622753 () Bool)

(assert (=> b!649463 m!622753))

(declare-fun m!622755 () Bool)

(assert (=> b!649477 m!622755))

(declare-fun m!622757 () Bool)

(assert (=> b!649468 m!622757))

(declare-fun m!622759 () Bool)

(assert (=> b!649469 m!622759))

(assert (=> b!649483 m!622711))

(assert (=> b!649483 m!622711))

(assert (=> b!649483 m!622723))

(assert (=> b!649476 m!622711))

(declare-fun m!622761 () Bool)

(assert (=> b!649471 m!622761))

(assert (=> b!649482 m!622711))

(assert (=> b!649482 m!622711))

(assert (=> b!649482 m!622713))

(declare-fun m!622763 () Bool)

(assert (=> b!649480 m!622763))

(declare-fun m!622765 () Bool)

(assert (=> b!649480 m!622765))

(declare-fun m!622767 () Bool)

(assert (=> b!649480 m!622767))

(assert (=> b!649480 m!622711))

(assert (=> b!649480 m!622715))

(declare-fun m!622769 () Bool)

(assert (=> b!649480 m!622769))

(assert (=> b!649480 m!622711))

(declare-fun m!622771 () Bool)

(assert (=> b!649480 m!622771))

(declare-fun m!622773 () Bool)

(assert (=> b!649480 m!622773))

(declare-fun m!622775 () Bool)

(assert (=> b!649481 m!622775))

(declare-fun m!622777 () Bool)

(assert (=> b!649464 m!622777))

(declare-fun m!622779 () Bool)

(assert (=> b!649462 m!622779))

(check-sat (not b!649462) (not b!649466) (not b!649471) (not start!58876) (not b!649473) (not b!649480) (not b!649474) (not b!649464) (not b!649483) (not b!649482) (not b!649481) (not b!649468) (not b!649470) (not b!649469) (not b!649458) (not b!649484) (not b!649463) (not b!649477))
(check-sat)
