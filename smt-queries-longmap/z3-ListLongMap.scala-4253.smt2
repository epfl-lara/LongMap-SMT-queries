; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59046 () Bool)

(assert start!59046)

(declare-fun b!650997 () Bool)

(declare-fun e!373518 () Bool)

(declare-fun e!373526 () Bool)

(assert (=> b!650997 (= e!373518 e!373526)))

(declare-fun res!422009 () Bool)

(assert (=> b!650997 (=> (not res!422009) (not e!373526))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38565 0))(
  ( (array!38566 (arr!18484 (Array (_ BitVec 32) (_ BitVec 64))) (size!18848 (_ BitVec 32))) )
))
(declare-fun lt!302544 () array!38565)

(declare-fun a!2986 () array!38565)

(declare-fun arrayContainsKey!0 (array!38565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650997 (= res!422009 (arrayContainsKey!0 lt!302544 (select (arr!18484 a!2986) j!136) j!136))))

(declare-fun b!650998 () Bool)

(declare-fun res!422017 () Bool)

(declare-fun e!373522 () Bool)

(assert (=> b!650998 (=> (not res!422017) (not e!373522))))

(declare-datatypes ((List!12432 0))(
  ( (Nil!12429) (Cons!12428 (h!13476 (_ BitVec 64)) (t!18652 List!12432)) )
))
(declare-fun arrayNoDuplicates!0 (array!38565 (_ BitVec 32) List!12432) Bool)

(assert (=> b!650998 (= res!422017 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12429))))

(declare-fun b!650999 () Bool)

(declare-fun res!422006 () Bool)

(assert (=> b!650999 (=> (not res!422006) (not e!373522))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!650999 (= res!422006 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18484 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651000 () Bool)

(declare-fun res!422003 () Bool)

(declare-fun e!373521 () Bool)

(assert (=> b!651000 (=> (not res!422003) (not e!373521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651000 (= res!422003 (validKeyInArray!0 (select (arr!18484 a!2986) j!136)))))

(declare-fun b!651001 () Bool)

(declare-fun res!422019 () Bool)

(assert (=> b!651001 (=> (not res!422019) (not e!373521))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!651001 (= res!422019 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651002 () Bool)

(declare-fun e!373519 () Bool)

(assert (=> b!651002 (= e!373519 (or (bvsge (size!18848 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18848 a!2986)) (bvsle index!984 (size!18848 a!2986))))))

(assert (=> b!651002 (arrayNoDuplicates!0 lt!302544 #b00000000000000000000000000000000 Nil!12429)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!22179 0))(
  ( (Unit!22180) )
))
(declare-fun lt!302560 () Unit!22179)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12432) Unit!22179)

(assert (=> b!651002 (= lt!302560 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12429))))

(assert (=> b!651002 (arrayContainsKey!0 lt!302544 (select (arr!18484 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302552 () Unit!22179)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22179)

(assert (=> b!651002 (= lt!302552 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302544 (select (arr!18484 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373524 () Bool)

(assert (=> b!651002 e!373524))

(declare-fun res!422007 () Bool)

(assert (=> b!651002 (=> (not res!422007) (not e!373524))))

(assert (=> b!651002 (= res!422007 (arrayContainsKey!0 lt!302544 (select (arr!18484 a!2986) j!136) j!136))))

(declare-fun b!651003 () Bool)

(declare-fun e!373514 () Bool)

(assert (=> b!651003 (= e!373514 e!373518)))

(declare-fun res!422004 () Bool)

(assert (=> b!651003 (=> res!422004 e!373518)))

(declare-fun lt!302550 () (_ BitVec 64))

(declare-fun lt!302559 () (_ BitVec 64))

(assert (=> b!651003 (= res!422004 (or (not (= (select (arr!18484 a!2986) j!136) lt!302559)) (not (= (select (arr!18484 a!2986) j!136) lt!302550)) (bvsge j!136 index!984)))))

(declare-fun b!651004 () Bool)

(declare-fun res!422015 () Bool)

(assert (=> b!651004 (=> (not res!422015) (not e!373522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38565 (_ BitVec 32)) Bool)

(assert (=> b!651004 (= res!422015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651005 () Bool)

(declare-fun e!373513 () Unit!22179)

(declare-fun Unit!22181 () Unit!22179)

(assert (=> b!651005 (= e!373513 Unit!22181)))

(assert (=> b!651005 false))

(declare-fun b!651006 () Bool)

(assert (=> b!651006 (= e!373526 (arrayContainsKey!0 lt!302544 (select (arr!18484 a!2986) j!136) index!984))))

(declare-fun res!422012 () Bool)

(assert (=> start!59046 (=> (not res!422012) (not e!373521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59046 (= res!422012 (validMask!0 mask!3053))))

(assert (=> start!59046 e!373521))

(assert (=> start!59046 true))

(declare-fun array_inv!14343 (array!38565) Bool)

(assert (=> start!59046 (array_inv!14343 a!2986)))

(declare-fun b!651007 () Bool)

(declare-fun e!373527 () Bool)

(declare-fun e!373515 () Bool)

(assert (=> b!651007 (= e!373527 e!373515)))

(declare-fun res!422010 () Bool)

(assert (=> b!651007 (=> (not res!422010) (not e!373515))))

(declare-datatypes ((SeekEntryResult!6880 0))(
  ( (MissingZero!6880 (index!29870 (_ BitVec 32))) (Found!6880 (index!29871 (_ BitVec 32))) (Intermediate!6880 (undefined!7692 Bool) (index!29872 (_ BitVec 32)) (x!58809 (_ BitVec 32))) (Undefined!6880) (MissingVacant!6880 (index!29873 (_ BitVec 32))) )
))
(declare-fun lt!302556 () SeekEntryResult!6880)

(assert (=> b!651007 (= res!422010 (and (= lt!302556 (Found!6880 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18484 a!2986) index!984) (select (arr!18484 a!2986) j!136))) (not (= (select (arr!18484 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38565 (_ BitVec 32)) SeekEntryResult!6880)

(assert (=> b!651007 (= lt!302556 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18484 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651008 () Bool)

(assert (=> b!651008 (= e!373522 e!373527)))

(declare-fun res!422020 () Bool)

(assert (=> b!651008 (=> (not res!422020) (not e!373527))))

(assert (=> b!651008 (= res!422020 (= (select (store (arr!18484 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651008 (= lt!302544 (array!38566 (store (arr!18484 a!2986) i!1108 k0!1786) (size!18848 a!2986)))))

(declare-fun b!651009 () Bool)

(declare-fun e!373523 () Bool)

(assert (=> b!651009 (= e!373523 e!373519)))

(declare-fun res!422018 () Bool)

(assert (=> b!651009 (=> res!422018 e!373519)))

(assert (=> b!651009 (= res!422018 (bvsge index!984 j!136))))

(declare-fun lt!302553 () Unit!22179)

(declare-fun e!373520 () Unit!22179)

(assert (=> b!651009 (= lt!302553 e!373520)))

(declare-fun c!74867 () Bool)

(assert (=> b!651009 (= c!74867 (bvslt j!136 index!984))))

(declare-fun b!651010 () Bool)

(assert (=> b!651010 (= e!373521 e!373522)))

(declare-fun res!422011 () Bool)

(assert (=> b!651010 (=> (not res!422011) (not e!373522))))

(declare-fun lt!302558 () SeekEntryResult!6880)

(assert (=> b!651010 (= res!422011 (or (= lt!302558 (MissingZero!6880 i!1108)) (= lt!302558 (MissingVacant!6880 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38565 (_ BitVec 32)) SeekEntryResult!6880)

(assert (=> b!651010 (= lt!302558 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651011 () Bool)

(declare-fun e!373516 () Bool)

(declare-fun lt!302554 () SeekEntryResult!6880)

(assert (=> b!651011 (= e!373516 (= lt!302556 lt!302554))))

(declare-fun b!651012 () Bool)

(declare-fun res!422002 () Bool)

(assert (=> b!651012 (=> (not res!422002) (not e!373521))))

(assert (=> b!651012 (= res!422002 (and (= (size!18848 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18848 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18848 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651013 () Bool)

(declare-fun Unit!22182 () Unit!22179)

(assert (=> b!651013 (= e!373513 Unit!22182)))

(declare-fun b!651014 () Bool)

(declare-fun Unit!22183 () Unit!22179)

(assert (=> b!651014 (= e!373520 Unit!22183)))

(declare-fun b!651015 () Bool)

(declare-fun Unit!22184 () Unit!22179)

(assert (=> b!651015 (= e!373520 Unit!22184)))

(declare-fun lt!302548 () Unit!22179)

(assert (=> b!651015 (= lt!302548 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302544 (select (arr!18484 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651015 (arrayContainsKey!0 lt!302544 (select (arr!18484 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302546 () Unit!22179)

(assert (=> b!651015 (= lt!302546 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12429))))

(assert (=> b!651015 (arrayNoDuplicates!0 lt!302544 #b00000000000000000000000000000000 Nil!12429)))

(declare-fun lt!302545 () Unit!22179)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38565 (_ BitVec 32) (_ BitVec 32)) Unit!22179)

(assert (=> b!651015 (= lt!302545 (lemmaNoDuplicateFromThenFromBigger!0 lt!302544 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651015 (arrayNoDuplicates!0 lt!302544 j!136 Nil!12429)))

(declare-fun lt!302555 () Unit!22179)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38565 (_ BitVec 64) (_ BitVec 32) List!12432) Unit!22179)

(assert (=> b!651015 (= lt!302555 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302544 (select (arr!18484 a!2986) j!136) j!136 Nil!12429))))

(assert (=> b!651015 false))

(declare-fun b!651016 () Bool)

(declare-fun e!373517 () Bool)

(assert (=> b!651016 (= e!373515 (not e!373517))))

(declare-fun res!422008 () Bool)

(assert (=> b!651016 (=> res!422008 e!373517)))

(declare-fun lt!302551 () SeekEntryResult!6880)

(assert (=> b!651016 (= res!422008 (not (= lt!302551 (Found!6880 index!984))))))

(declare-fun lt!302557 () Unit!22179)

(assert (=> b!651016 (= lt!302557 e!373513)))

(declare-fun c!74866 () Bool)

(assert (=> b!651016 (= c!74866 (= lt!302551 Undefined!6880))))

(assert (=> b!651016 (= lt!302551 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302559 lt!302544 mask!3053))))

(assert (=> b!651016 e!373516))

(declare-fun res!422013 () Bool)

(assert (=> b!651016 (=> (not res!422013) (not e!373516))))

(declare-fun lt!302549 () (_ BitVec 32))

(assert (=> b!651016 (= res!422013 (= lt!302554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302549 vacantSpotIndex!68 lt!302559 lt!302544 mask!3053)))))

(assert (=> b!651016 (= lt!302554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302549 vacantSpotIndex!68 (select (arr!18484 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651016 (= lt!302559 (select (store (arr!18484 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302547 () Unit!22179)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22179)

(assert (=> b!651016 (= lt!302547 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302549 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651016 (= lt!302549 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!651017 () Bool)

(declare-fun res!422016 () Bool)

(assert (=> b!651017 (=> (not res!422016) (not e!373521))))

(assert (=> b!651017 (= res!422016 (validKeyInArray!0 k0!1786))))

(declare-fun b!651018 () Bool)

(assert (=> b!651018 (= e!373517 e!373523)))

(declare-fun res!422005 () Bool)

(assert (=> b!651018 (=> res!422005 e!373523)))

(assert (=> b!651018 (= res!422005 (or (not (= (select (arr!18484 a!2986) j!136) lt!302559)) (not (= (select (arr!18484 a!2986) j!136) lt!302550))))))

(assert (=> b!651018 e!373514))

(declare-fun res!422014 () Bool)

(assert (=> b!651018 (=> (not res!422014) (not e!373514))))

(assert (=> b!651018 (= res!422014 (= lt!302550 (select (arr!18484 a!2986) j!136)))))

(assert (=> b!651018 (= lt!302550 (select (store (arr!18484 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651019 () Bool)

(assert (=> b!651019 (= e!373524 (arrayContainsKey!0 lt!302544 (select (arr!18484 a!2986) j!136) index!984))))

(assert (= (and start!59046 res!422012) b!651012))

(assert (= (and b!651012 res!422002) b!651000))

(assert (= (and b!651000 res!422003) b!651017))

(assert (= (and b!651017 res!422016) b!651001))

(assert (= (and b!651001 res!422019) b!651010))

(assert (= (and b!651010 res!422011) b!651004))

(assert (= (and b!651004 res!422015) b!650998))

(assert (= (and b!650998 res!422017) b!650999))

(assert (= (and b!650999 res!422006) b!651008))

(assert (= (and b!651008 res!422020) b!651007))

(assert (= (and b!651007 res!422010) b!651016))

(assert (= (and b!651016 res!422013) b!651011))

(assert (= (and b!651016 c!74866) b!651005))

(assert (= (and b!651016 (not c!74866)) b!651013))

(assert (= (and b!651016 (not res!422008)) b!651018))

(assert (= (and b!651018 res!422014) b!651003))

(assert (= (and b!651003 (not res!422004)) b!650997))

(assert (= (and b!650997 res!422009) b!651006))

(assert (= (and b!651018 (not res!422005)) b!651009))

(assert (= (and b!651009 c!74867) b!651015))

(assert (= (and b!651009 (not c!74867)) b!651014))

(assert (= (and b!651009 (not res!422018)) b!651002))

(assert (= (and b!651002 res!422007) b!651019))

(declare-fun m!624613 () Bool)

(assert (=> b!650999 m!624613))

(declare-fun m!624615 () Bool)

(assert (=> b!651006 m!624615))

(assert (=> b!651006 m!624615))

(declare-fun m!624617 () Bool)

(assert (=> b!651006 m!624617))

(assert (=> b!651003 m!624615))

(assert (=> b!651019 m!624615))

(assert (=> b!651019 m!624615))

(assert (=> b!651019 m!624617))

(assert (=> b!651000 m!624615))

(assert (=> b!651000 m!624615))

(declare-fun m!624619 () Bool)

(assert (=> b!651000 m!624619))

(assert (=> b!650997 m!624615))

(assert (=> b!650997 m!624615))

(declare-fun m!624621 () Bool)

(assert (=> b!650997 m!624621))

(declare-fun m!624623 () Bool)

(assert (=> start!59046 m!624623))

(declare-fun m!624625 () Bool)

(assert (=> start!59046 m!624625))

(declare-fun m!624627 () Bool)

(assert (=> b!651004 m!624627))

(assert (=> b!651002 m!624615))

(declare-fun m!624629 () Bool)

(assert (=> b!651002 m!624629))

(assert (=> b!651002 m!624615))

(declare-fun m!624631 () Bool)

(assert (=> b!651002 m!624631))

(assert (=> b!651002 m!624615))

(declare-fun m!624633 () Bool)

(assert (=> b!651002 m!624633))

(assert (=> b!651002 m!624615))

(assert (=> b!651002 m!624621))

(declare-fun m!624635 () Bool)

(assert (=> b!651002 m!624635))

(declare-fun m!624637 () Bool)

(assert (=> b!651017 m!624637))

(declare-fun m!624639 () Bool)

(assert (=> b!651007 m!624639))

(assert (=> b!651007 m!624615))

(assert (=> b!651007 m!624615))

(declare-fun m!624641 () Bool)

(assert (=> b!651007 m!624641))

(declare-fun m!624643 () Bool)

(assert (=> b!650998 m!624643))

(declare-fun m!624645 () Bool)

(assert (=> b!651008 m!624645))

(declare-fun m!624647 () Bool)

(assert (=> b!651008 m!624647))

(declare-fun m!624649 () Bool)

(assert (=> b!651001 m!624649))

(assert (=> b!651018 m!624615))

(assert (=> b!651018 m!624645))

(declare-fun m!624651 () Bool)

(assert (=> b!651018 m!624651))

(declare-fun m!624653 () Bool)

(assert (=> b!651016 m!624653))

(declare-fun m!624655 () Bool)

(assert (=> b!651016 m!624655))

(assert (=> b!651016 m!624615))

(assert (=> b!651016 m!624645))

(declare-fun m!624657 () Bool)

(assert (=> b!651016 m!624657))

(assert (=> b!651016 m!624615))

(declare-fun m!624659 () Bool)

(assert (=> b!651016 m!624659))

(declare-fun m!624661 () Bool)

(assert (=> b!651016 m!624661))

(declare-fun m!624663 () Bool)

(assert (=> b!651016 m!624663))

(declare-fun m!624665 () Bool)

(assert (=> b!651010 m!624665))

(assert (=> b!651015 m!624615))

(declare-fun m!624667 () Bool)

(assert (=> b!651015 m!624667))

(assert (=> b!651015 m!624615))

(assert (=> b!651015 m!624633))

(declare-fun m!624669 () Bool)

(assert (=> b!651015 m!624669))

(assert (=> b!651015 m!624615))

(declare-fun m!624671 () Bool)

(assert (=> b!651015 m!624671))

(assert (=> b!651015 m!624635))

(declare-fun m!624673 () Bool)

(assert (=> b!651015 m!624673))

(assert (=> b!651015 m!624615))

(declare-fun m!624675 () Bool)

(assert (=> b!651015 m!624675))

(check-sat (not b!651006) (not b!651016) (not b!651017) (not b!651001) (not b!651002) (not b!651019) (not b!650997) (not start!59046) (not b!651004) (not b!651015) (not b!651000) (not b!651007) (not b!650998) (not b!651010))
(check-sat)
