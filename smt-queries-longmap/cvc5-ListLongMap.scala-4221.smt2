; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57920 () Bool)

(assert start!57920)

(declare-fun b!640601 () Bool)

(declare-fun e!366713 () Bool)

(declare-fun e!366711 () Bool)

(assert (=> b!640601 (= e!366713 e!366711)))

(declare-fun res!414862 () Bool)

(assert (=> b!640601 (=> res!414862 e!366711)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296505 () (_ BitVec 64))

(declare-fun lt!296510 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38347 0))(
  ( (array!38348 (arr!18393 (Array (_ BitVec 32) (_ BitVec 64))) (size!18757 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38347)

(assert (=> b!640601 (= res!414862 (or (not (= (select (arr!18393 a!2986) j!136) lt!296510)) (not (= (select (arr!18393 a!2986) j!136) lt!296505)) (bvsge j!136 index!984)))))

(declare-fun e!366719 () Bool)

(assert (=> b!640601 e!366719))

(declare-fun res!414850 () Bool)

(assert (=> b!640601 (=> (not res!414850) (not e!366719))))

(assert (=> b!640601 (= res!414850 (= lt!296505 (select (arr!18393 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!640601 (= lt!296505 (select (store (arr!18393 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640602 () Bool)

(declare-fun res!414855 () Bool)

(declare-fun e!366710 () Bool)

(assert (=> b!640602 (=> (not res!414855) (not e!366710))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!640602 (= res!414855 (and (= (size!18757 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18757 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18757 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640603 () Bool)

(declare-fun res!414860 () Bool)

(declare-fun e!366714 () Bool)

(assert (=> b!640603 (=> (not res!414860) (not e!366714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38347 (_ BitVec 32)) Bool)

(assert (=> b!640603 (= res!414860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640604 () Bool)

(declare-fun res!414856 () Bool)

(assert (=> b!640604 (=> (not res!414856) (not e!366714))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!640604 (= res!414856 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18393 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640605 () Bool)

(declare-datatypes ((Unit!21666 0))(
  ( (Unit!21667) )
))
(declare-fun e!366717 () Unit!21666)

(declare-fun Unit!21668 () Unit!21666)

(assert (=> b!640605 (= e!366717 Unit!21668)))

(declare-fun b!640606 () Bool)

(declare-fun res!414857 () Bool)

(assert (=> b!640606 (=> (not res!414857) (not e!366714))))

(declare-datatypes ((List!12434 0))(
  ( (Nil!12431) (Cons!12430 (h!13475 (_ BitVec 64)) (t!18662 List!12434)) )
))
(declare-fun arrayNoDuplicates!0 (array!38347 (_ BitVec 32) List!12434) Bool)

(assert (=> b!640606 (= res!414857 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12431))))

(declare-fun e!366720 () Bool)

(declare-fun b!640607 () Bool)

(declare-fun lt!296503 () array!38347)

(declare-fun arrayContainsKey!0 (array!38347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640607 (= e!366720 (arrayContainsKey!0 lt!296503 (select (arr!18393 a!2986) j!136) index!984))))

(declare-fun b!640608 () Bool)

(declare-fun e!366712 () Bool)

(declare-fun e!366715 () Bool)

(assert (=> b!640608 (= e!366712 e!366715)))

(declare-fun res!414851 () Bool)

(assert (=> b!640608 (=> (not res!414851) (not e!366715))))

(declare-datatypes ((SeekEntryResult!6833 0))(
  ( (MissingZero!6833 (index!29652 (_ BitVec 32))) (Found!6833 (index!29653 (_ BitVec 32))) (Intermediate!6833 (undefined!7645 Bool) (index!29654 (_ BitVec 32)) (x!58413 (_ BitVec 32))) (Undefined!6833) (MissingVacant!6833 (index!29655 (_ BitVec 32))) )
))
(declare-fun lt!296507 () SeekEntryResult!6833)

(assert (=> b!640608 (= res!414851 (and (= lt!296507 (Found!6833 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18393 a!2986) index!984) (select (arr!18393 a!2986) j!136))) (not (= (select (arr!18393 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38347 (_ BitVec 32)) SeekEntryResult!6833)

(assert (=> b!640608 (= lt!296507 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18393 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640609 () Bool)

(declare-fun res!414853 () Bool)

(assert (=> b!640609 (=> (not res!414853) (not e!366710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640609 (= res!414853 (validKeyInArray!0 k!1786))))

(declare-fun b!640610 () Bool)

(assert (=> b!640610 (= e!366710 e!366714)))

(declare-fun res!414863 () Bool)

(assert (=> b!640610 (=> (not res!414863) (not e!366714))))

(declare-fun lt!296514 () SeekEntryResult!6833)

(assert (=> b!640610 (= res!414863 (or (= lt!296514 (MissingZero!6833 i!1108)) (= lt!296514 (MissingVacant!6833 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38347 (_ BitVec 32)) SeekEntryResult!6833)

(assert (=> b!640610 (= lt!296514 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640612 () Bool)

(declare-fun e!366718 () Bool)

(declare-fun lt!296509 () SeekEntryResult!6833)

(assert (=> b!640612 (= e!366718 (= lt!296507 lt!296509))))

(declare-fun b!640613 () Bool)

(declare-fun e!366716 () Bool)

(assert (=> b!640613 (= e!366716 e!366720)))

(declare-fun res!414854 () Bool)

(assert (=> b!640613 (=> (not res!414854) (not e!366720))))

(assert (=> b!640613 (= res!414854 (arrayContainsKey!0 lt!296503 (select (arr!18393 a!2986) j!136) j!136))))

(declare-fun b!640614 () Bool)

(assert (=> b!640614 (= e!366715 (not e!366713))))

(declare-fun res!414849 () Bool)

(assert (=> b!640614 (=> res!414849 e!366713)))

(declare-fun lt!296504 () SeekEntryResult!6833)

(assert (=> b!640614 (= res!414849 (not (= lt!296504 (Found!6833 index!984))))))

(declare-fun lt!296513 () Unit!21666)

(assert (=> b!640614 (= lt!296513 e!366717)))

(declare-fun c!73244 () Bool)

(assert (=> b!640614 (= c!73244 (= lt!296504 Undefined!6833))))

(assert (=> b!640614 (= lt!296504 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296510 lt!296503 mask!3053))))

(assert (=> b!640614 e!366718))

(declare-fun res!414859 () Bool)

(assert (=> b!640614 (=> (not res!414859) (not e!366718))))

(declare-fun lt!296515 () (_ BitVec 32))

(assert (=> b!640614 (= res!414859 (= lt!296509 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296515 vacantSpotIndex!68 lt!296510 lt!296503 mask!3053)))))

(assert (=> b!640614 (= lt!296509 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296515 vacantSpotIndex!68 (select (arr!18393 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640614 (= lt!296510 (select (store (arr!18393 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296511 () Unit!21666)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21666)

(assert (=> b!640614 (= lt!296511 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296515 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640614 (= lt!296515 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640615 () Bool)

(assert (=> b!640615 (= e!366719 e!366716)))

(declare-fun res!414848 () Bool)

(assert (=> b!640615 (=> res!414848 e!366716)))

(assert (=> b!640615 (= res!414848 (or (not (= (select (arr!18393 a!2986) j!136) lt!296510)) (not (= (select (arr!18393 a!2986) j!136) lt!296505)) (bvsge j!136 index!984)))))

(declare-fun b!640616 () Bool)

(declare-fun res!414852 () Bool)

(assert (=> b!640616 (=> (not res!414852) (not e!366710))))

(assert (=> b!640616 (= res!414852 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640617 () Bool)

(declare-fun Unit!21669 () Unit!21666)

(assert (=> b!640617 (= e!366717 Unit!21669)))

(assert (=> b!640617 false))

(declare-fun b!640618 () Bool)

(assert (=> b!640618 (= e!366714 e!366712)))

(declare-fun res!414847 () Bool)

(assert (=> b!640618 (=> (not res!414847) (not e!366712))))

(assert (=> b!640618 (= res!414847 (= (select (store (arr!18393 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640618 (= lt!296503 (array!38348 (store (arr!18393 a!2986) i!1108 k!1786) (size!18757 a!2986)))))

(declare-fun b!640619 () Bool)

(declare-fun res!414858 () Bool)

(assert (=> b!640619 (=> (not res!414858) (not e!366710))))

(assert (=> b!640619 (= res!414858 (validKeyInArray!0 (select (arr!18393 a!2986) j!136)))))

(declare-fun res!414861 () Bool)

(assert (=> start!57920 (=> (not res!414861) (not e!366710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57920 (= res!414861 (validMask!0 mask!3053))))

(assert (=> start!57920 e!366710))

(assert (=> start!57920 true))

(declare-fun array_inv!14189 (array!38347) Bool)

(assert (=> start!57920 (array_inv!14189 a!2986)))

(declare-fun b!640611 () Bool)

(assert (=> b!640611 (= e!366711 (or (bvsge (size!18757 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18757 a!2986))))))

(assert (=> b!640611 (arrayNoDuplicates!0 lt!296503 j!136 Nil!12431)))

(declare-fun lt!296512 () Unit!21666)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38347 (_ BitVec 32) (_ BitVec 32)) Unit!21666)

(assert (=> b!640611 (= lt!296512 (lemmaNoDuplicateFromThenFromBigger!0 lt!296503 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640611 (arrayNoDuplicates!0 lt!296503 #b00000000000000000000000000000000 Nil!12431)))

(declare-fun lt!296506 () Unit!21666)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12434) Unit!21666)

(assert (=> b!640611 (= lt!296506 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12431))))

(assert (=> b!640611 (arrayContainsKey!0 lt!296503 (select (arr!18393 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296508 () Unit!21666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21666)

(assert (=> b!640611 (= lt!296508 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296503 (select (arr!18393 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!57920 res!414861) b!640602))

(assert (= (and b!640602 res!414855) b!640619))

(assert (= (and b!640619 res!414858) b!640609))

(assert (= (and b!640609 res!414853) b!640616))

(assert (= (and b!640616 res!414852) b!640610))

(assert (= (and b!640610 res!414863) b!640603))

(assert (= (and b!640603 res!414860) b!640606))

(assert (= (and b!640606 res!414857) b!640604))

(assert (= (and b!640604 res!414856) b!640618))

(assert (= (and b!640618 res!414847) b!640608))

(assert (= (and b!640608 res!414851) b!640614))

(assert (= (and b!640614 res!414859) b!640612))

(assert (= (and b!640614 c!73244) b!640617))

(assert (= (and b!640614 (not c!73244)) b!640605))

(assert (= (and b!640614 (not res!414849)) b!640601))

(assert (= (and b!640601 res!414850) b!640615))

(assert (= (and b!640615 (not res!414848)) b!640613))

(assert (= (and b!640613 res!414854) b!640607))

(assert (= (and b!640601 (not res!414862)) b!640611))

(declare-fun m!614435 () Bool)

(assert (=> b!640619 m!614435))

(assert (=> b!640619 m!614435))

(declare-fun m!614437 () Bool)

(assert (=> b!640619 m!614437))

(declare-fun m!614439 () Bool)

(assert (=> start!57920 m!614439))

(declare-fun m!614441 () Bool)

(assert (=> start!57920 m!614441))

(declare-fun m!614443 () Bool)

(assert (=> b!640603 m!614443))

(assert (=> b!640613 m!614435))

(assert (=> b!640613 m!614435))

(declare-fun m!614445 () Bool)

(assert (=> b!640613 m!614445))

(declare-fun m!614447 () Bool)

(assert (=> b!640609 m!614447))

(assert (=> b!640601 m!614435))

(declare-fun m!614449 () Bool)

(assert (=> b!640601 m!614449))

(declare-fun m!614451 () Bool)

(assert (=> b!640601 m!614451))

(assert (=> b!640618 m!614449))

(declare-fun m!614453 () Bool)

(assert (=> b!640618 m!614453))

(assert (=> b!640607 m!614435))

(assert (=> b!640607 m!614435))

(declare-fun m!614455 () Bool)

(assert (=> b!640607 m!614455))

(assert (=> b!640615 m!614435))

(declare-fun m!614457 () Bool)

(assert (=> b!640610 m!614457))

(declare-fun m!614459 () Bool)

(assert (=> b!640606 m!614459))

(declare-fun m!614461 () Bool)

(assert (=> b!640614 m!614461))

(declare-fun m!614463 () Bool)

(assert (=> b!640614 m!614463))

(declare-fun m!614465 () Bool)

(assert (=> b!640614 m!614465))

(assert (=> b!640614 m!614435))

(declare-fun m!614467 () Bool)

(assert (=> b!640614 m!614467))

(assert (=> b!640614 m!614449))

(declare-fun m!614469 () Bool)

(assert (=> b!640614 m!614469))

(assert (=> b!640614 m!614435))

(declare-fun m!614471 () Bool)

(assert (=> b!640614 m!614471))

(declare-fun m!614473 () Bool)

(assert (=> b!640608 m!614473))

(assert (=> b!640608 m!614435))

(assert (=> b!640608 m!614435))

(declare-fun m!614475 () Bool)

(assert (=> b!640608 m!614475))

(assert (=> b!640611 m!614435))

(declare-fun m!614477 () Bool)

(assert (=> b!640611 m!614477))

(assert (=> b!640611 m!614435))

(declare-fun m!614479 () Bool)

(assert (=> b!640611 m!614479))

(declare-fun m!614481 () Bool)

(assert (=> b!640611 m!614481))

(declare-fun m!614483 () Bool)

(assert (=> b!640611 m!614483))

(assert (=> b!640611 m!614435))

(declare-fun m!614485 () Bool)

(assert (=> b!640611 m!614485))

(declare-fun m!614487 () Bool)

(assert (=> b!640611 m!614487))

(declare-fun m!614489 () Bool)

(assert (=> b!640604 m!614489))

(declare-fun m!614491 () Bool)

(assert (=> b!640616 m!614491))

(push 1)

(assert (not b!640619))

(assert (not b!640606))

(assert (not b!640614))

(assert (not b!640613))

(assert (not b!640607))

(assert (not b!640616))

(assert (not b!640608))

(assert (not start!57920))

(assert (not b!640611))

(assert (not b!640609))

(assert (not b!640610))

(assert (not b!640603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

