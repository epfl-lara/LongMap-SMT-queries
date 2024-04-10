; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56004 () Bool)

(assert start!56004)

(declare-fun b!615504 () Bool)

(declare-datatypes ((Unit!19958 0))(
  ( (Unit!19959) )
))
(declare-fun e!352908 () Unit!19958)

(declare-fun Unit!19960 () Unit!19958)

(assert (=> b!615504 (= e!352908 Unit!19960)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37474 0))(
  ( (array!37475 (arr!17983 (Array (_ BitVec 32) (_ BitVec 64))) (size!18347 (_ BitVec 32))) )
))
(declare-fun lt!282748 () array!37474)

(declare-fun a!2986 () array!37474)

(declare-fun res!396461 () Bool)

(declare-fun b!615505 () Bool)

(declare-fun arrayContainsKey!0 (array!37474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615505 (= res!396461 (arrayContainsKey!0 lt!282748 (select (arr!17983 a!2986) j!136) j!136))))

(declare-fun e!352904 () Bool)

(assert (=> b!615505 (=> (not res!396461) (not e!352904))))

(declare-fun e!352907 () Bool)

(assert (=> b!615505 (= e!352907 e!352904)))

(declare-fun b!615506 () Bool)

(declare-fun res!396464 () Bool)

(declare-fun e!352916 () Bool)

(assert (=> b!615506 (=> (not res!396464) (not e!352916))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!615506 (= res!396464 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615507 () Bool)

(declare-fun e!352905 () Bool)

(assert (=> b!615507 (= e!352905 (not true))))

(declare-fun lt!282745 () Unit!19958)

(declare-fun e!352909 () Unit!19958)

(assert (=> b!615507 (= lt!282745 e!352909)))

(declare-fun c!69890 () Bool)

(declare-datatypes ((SeekEntryResult!6423 0))(
  ( (MissingZero!6423 (index!27976 (_ BitVec 32))) (Found!6423 (index!27977 (_ BitVec 32))) (Intermediate!6423 (undefined!7235 Bool) (index!27978 (_ BitVec 32)) (x!56775 (_ BitVec 32))) (Undefined!6423) (MissingVacant!6423 (index!27979 (_ BitVec 32))) )
))
(declare-fun lt!282750 () SeekEntryResult!6423)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615507 (= c!69890 (= lt!282750 (Found!6423 index!984)))))

(declare-fun lt!282741 () Unit!19958)

(declare-fun e!352906 () Unit!19958)

(assert (=> b!615507 (= lt!282741 e!352906)))

(declare-fun c!69891 () Bool)

(assert (=> b!615507 (= c!69891 (= lt!282750 Undefined!6423))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!282756 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37474 (_ BitVec 32)) SeekEntryResult!6423)

(assert (=> b!615507 (= lt!282750 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282756 lt!282748 mask!3053))))

(declare-fun e!352912 () Bool)

(assert (=> b!615507 e!352912))

(declare-fun res!396470 () Bool)

(assert (=> b!615507 (=> (not res!396470) (not e!352912))))

(declare-fun lt!282744 () SeekEntryResult!6423)

(declare-fun lt!282754 () (_ BitVec 32))

(assert (=> b!615507 (= res!396470 (= lt!282744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282754 vacantSpotIndex!68 lt!282756 lt!282748 mask!3053)))))

(assert (=> b!615507 (= lt!282744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282754 vacantSpotIndex!68 (select (arr!17983 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615507 (= lt!282756 (select (store (arr!17983 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282742 () Unit!19958)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19958)

(assert (=> b!615507 (= lt!282742 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282754 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615507 (= lt!282754 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615508 () Bool)

(declare-fun res!396466 () Bool)

(assert (=> b!615508 (=> (not res!396466) (not e!352916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615508 (= res!396466 (validKeyInArray!0 k0!1786))))

(declare-fun b!615509 () Bool)

(declare-fun res!396473 () Bool)

(declare-fun e!352913 () Bool)

(assert (=> b!615509 (=> (not res!396473) (not e!352913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37474 (_ BitVec 32)) Bool)

(assert (=> b!615509 (= res!396473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615510 () Bool)

(assert (=> b!615510 (= e!352916 e!352913)))

(declare-fun res!396462 () Bool)

(assert (=> b!615510 (=> (not res!396462) (not e!352913))))

(declare-fun lt!282757 () SeekEntryResult!6423)

(assert (=> b!615510 (= res!396462 (or (= lt!282757 (MissingZero!6423 i!1108)) (= lt!282757 (MissingVacant!6423 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37474 (_ BitVec 32)) SeekEntryResult!6423)

(assert (=> b!615510 (= lt!282757 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615511 () Bool)

(declare-fun Unit!19961 () Unit!19958)

(assert (=> b!615511 (= e!352909 Unit!19961)))

(declare-fun res!396472 () Bool)

(assert (=> b!615511 (= res!396472 (= (select (store (arr!17983 a!2986) i!1108 k0!1786) index!984) (select (arr!17983 a!2986) j!136)))))

(declare-fun e!352914 () Bool)

(assert (=> b!615511 (=> (not res!396472) (not e!352914))))

(assert (=> b!615511 e!352914))

(declare-fun c!69893 () Bool)

(assert (=> b!615511 (= c!69893 (bvslt j!136 index!984))))

(declare-fun lt!282747 () Unit!19958)

(assert (=> b!615511 (= lt!282747 e!352908)))

(declare-fun c!69892 () Bool)

(assert (=> b!615511 (= c!69892 (bvslt index!984 j!136))))

(declare-fun lt!282749 () Unit!19958)

(declare-fun e!352915 () Unit!19958)

(assert (=> b!615511 (= lt!282749 e!352915)))

(assert (=> b!615511 false))

(declare-fun b!615512 () Bool)

(assert (=> b!615512 (= e!352904 (arrayContainsKey!0 lt!282748 (select (arr!17983 a!2986) j!136) index!984))))

(declare-fun b!615513 () Bool)

(declare-fun res!396468 () Bool)

(assert (=> b!615513 (=> (not res!396468) (not e!352916))))

(assert (=> b!615513 (= res!396468 (validKeyInArray!0 (select (arr!17983 a!2986) j!136)))))

(declare-fun b!615514 () Bool)

(assert (=> b!615514 false))

(declare-fun lt!282746 () Unit!19958)

(declare-datatypes ((List!12024 0))(
  ( (Nil!12021) (Cons!12020 (h!13065 (_ BitVec 64)) (t!18252 List!12024)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37474 (_ BitVec 64) (_ BitVec 32) List!12024) Unit!19958)

(assert (=> b!615514 (= lt!282746 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282748 (select (arr!17983 a!2986) j!136) index!984 Nil!12021))))

(declare-fun arrayNoDuplicates!0 (array!37474 (_ BitVec 32) List!12024) Bool)

(assert (=> b!615514 (arrayNoDuplicates!0 lt!282748 index!984 Nil!12021)))

(declare-fun lt!282751 () Unit!19958)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37474 (_ BitVec 32) (_ BitVec 32)) Unit!19958)

(assert (=> b!615514 (= lt!282751 (lemmaNoDuplicateFromThenFromBigger!0 lt!282748 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615514 (arrayNoDuplicates!0 lt!282748 #b00000000000000000000000000000000 Nil!12021)))

(declare-fun lt!282739 () Unit!19958)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37474 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12024) Unit!19958)

(assert (=> b!615514 (= lt!282739 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12021))))

(assert (=> b!615514 (arrayContainsKey!0 lt!282748 (select (arr!17983 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282755 () Unit!19958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37474 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19958)

(assert (=> b!615514 (= lt!282755 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282748 (select (arr!17983 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352910 () Bool)

(assert (=> b!615514 e!352910))

(declare-fun res!396463 () Bool)

(assert (=> b!615514 (=> (not res!396463) (not e!352910))))

(assert (=> b!615514 (= res!396463 (arrayContainsKey!0 lt!282748 (select (arr!17983 a!2986) j!136) j!136))))

(declare-fun Unit!19962 () Unit!19958)

(assert (=> b!615514 (= e!352915 Unit!19962)))

(declare-fun b!615515 () Bool)

(declare-fun lt!282753 () SeekEntryResult!6423)

(assert (=> b!615515 (= e!352912 (= lt!282753 lt!282744))))

(declare-fun b!615516 () Bool)

(assert (=> b!615516 false))

(declare-fun lt!282740 () Unit!19958)

(assert (=> b!615516 (= lt!282740 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282748 (select (arr!17983 a!2986) j!136) j!136 Nil!12021))))

(assert (=> b!615516 (arrayNoDuplicates!0 lt!282748 j!136 Nil!12021)))

(declare-fun lt!282743 () Unit!19958)

(assert (=> b!615516 (= lt!282743 (lemmaNoDuplicateFromThenFromBigger!0 lt!282748 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615516 (arrayNoDuplicates!0 lt!282748 #b00000000000000000000000000000000 Nil!12021)))

(declare-fun lt!282738 () Unit!19958)

(assert (=> b!615516 (= lt!282738 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12021))))

(assert (=> b!615516 (arrayContainsKey!0 lt!282748 (select (arr!17983 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282752 () Unit!19958)

(assert (=> b!615516 (= lt!282752 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282748 (select (arr!17983 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19963 () Unit!19958)

(assert (=> b!615516 (= e!352908 Unit!19963)))

(declare-fun res!396460 () Bool)

(assert (=> start!56004 (=> (not res!396460) (not e!352916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56004 (= res!396460 (validMask!0 mask!3053))))

(assert (=> start!56004 e!352916))

(assert (=> start!56004 true))

(declare-fun array_inv!13779 (array!37474) Bool)

(assert (=> start!56004 (array_inv!13779 a!2986)))

(declare-fun b!615517 () Bool)

(declare-fun e!352911 () Bool)

(assert (=> b!615517 (= e!352913 e!352911)))

(declare-fun res!396465 () Bool)

(assert (=> b!615517 (=> (not res!396465) (not e!352911))))

(assert (=> b!615517 (= res!396465 (= (select (store (arr!17983 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615517 (= lt!282748 (array!37475 (store (arr!17983 a!2986) i!1108 k0!1786) (size!18347 a!2986)))))

(declare-fun b!615518 () Bool)

(assert (=> b!615518 (= e!352911 e!352905)))

(declare-fun res!396458 () Bool)

(assert (=> b!615518 (=> (not res!396458) (not e!352905))))

(assert (=> b!615518 (= res!396458 (and (= lt!282753 (Found!6423 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17983 a!2986) index!984) (select (arr!17983 a!2986) j!136))) (not (= (select (arr!17983 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615518 (= lt!282753 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17983 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615519 () Bool)

(assert (=> b!615519 (= e!352910 (arrayContainsKey!0 lt!282748 (select (arr!17983 a!2986) j!136) index!984))))

(declare-fun b!615520 () Bool)

(declare-fun Unit!19964 () Unit!19958)

(assert (=> b!615520 (= e!352906 Unit!19964)))

(assert (=> b!615520 false))

(declare-fun b!615521 () Bool)

(declare-fun res!396467 () Bool)

(assert (=> b!615521 (=> (not res!396467) (not e!352913))))

(assert (=> b!615521 (= res!396467 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17983 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615522 () Bool)

(declare-fun Unit!19965 () Unit!19958)

(assert (=> b!615522 (= e!352909 Unit!19965)))

(declare-fun b!615523 () Bool)

(declare-fun Unit!19966 () Unit!19958)

(assert (=> b!615523 (= e!352915 Unit!19966)))

(declare-fun b!615524 () Bool)

(declare-fun res!396469 () Bool)

(assert (=> b!615524 (=> (not res!396469) (not e!352916))))

(assert (=> b!615524 (= res!396469 (and (= (size!18347 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18347 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18347 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615525 () Bool)

(declare-fun Unit!19967 () Unit!19958)

(assert (=> b!615525 (= e!352906 Unit!19967)))

(declare-fun b!615526 () Bool)

(declare-fun res!396459 () Bool)

(assert (=> b!615526 (=> (not res!396459) (not e!352913))))

(assert (=> b!615526 (= res!396459 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12021))))

(declare-fun b!615527 () Bool)

(declare-fun res!396471 () Bool)

(assert (=> b!615527 (= res!396471 (bvsge j!136 index!984))))

(assert (=> b!615527 (=> res!396471 e!352907)))

(assert (=> b!615527 (= e!352914 e!352907)))

(assert (= (and start!56004 res!396460) b!615524))

(assert (= (and b!615524 res!396469) b!615513))

(assert (= (and b!615513 res!396468) b!615508))

(assert (= (and b!615508 res!396466) b!615506))

(assert (= (and b!615506 res!396464) b!615510))

(assert (= (and b!615510 res!396462) b!615509))

(assert (= (and b!615509 res!396473) b!615526))

(assert (= (and b!615526 res!396459) b!615521))

(assert (= (and b!615521 res!396467) b!615517))

(assert (= (and b!615517 res!396465) b!615518))

(assert (= (and b!615518 res!396458) b!615507))

(assert (= (and b!615507 res!396470) b!615515))

(assert (= (and b!615507 c!69891) b!615520))

(assert (= (and b!615507 (not c!69891)) b!615525))

(assert (= (and b!615507 c!69890) b!615511))

(assert (= (and b!615507 (not c!69890)) b!615522))

(assert (= (and b!615511 res!396472) b!615527))

(assert (= (and b!615527 (not res!396471)) b!615505))

(assert (= (and b!615505 res!396461) b!615512))

(assert (= (and b!615511 c!69893) b!615516))

(assert (= (and b!615511 (not c!69893)) b!615504))

(assert (= (and b!615511 c!69892) b!615514))

(assert (= (and b!615511 (not c!69892)) b!615523))

(assert (= (and b!615514 res!396463) b!615519))

(declare-fun m!591705 () Bool)

(assert (=> b!615508 m!591705))

(declare-fun m!591707 () Bool)

(assert (=> b!615507 m!591707))

(declare-fun m!591709 () Bool)

(assert (=> b!615507 m!591709))

(declare-fun m!591711 () Bool)

(assert (=> b!615507 m!591711))

(declare-fun m!591713 () Bool)

(assert (=> b!615507 m!591713))

(assert (=> b!615507 m!591711))

(declare-fun m!591715 () Bool)

(assert (=> b!615507 m!591715))

(declare-fun m!591717 () Bool)

(assert (=> b!615507 m!591717))

(declare-fun m!591719 () Bool)

(assert (=> b!615507 m!591719))

(declare-fun m!591721 () Bool)

(assert (=> b!615507 m!591721))

(assert (=> b!615513 m!591711))

(assert (=> b!615513 m!591711))

(declare-fun m!591723 () Bool)

(assert (=> b!615513 m!591723))

(declare-fun m!591725 () Bool)

(assert (=> b!615506 m!591725))

(assert (=> b!615514 m!591711))

(declare-fun m!591727 () Bool)

(assert (=> b!615514 m!591727))

(assert (=> b!615514 m!591711))

(assert (=> b!615514 m!591711))

(declare-fun m!591729 () Bool)

(assert (=> b!615514 m!591729))

(assert (=> b!615514 m!591711))

(declare-fun m!591731 () Bool)

(assert (=> b!615514 m!591731))

(declare-fun m!591733 () Bool)

(assert (=> b!615514 m!591733))

(assert (=> b!615514 m!591711))

(declare-fun m!591735 () Bool)

(assert (=> b!615514 m!591735))

(declare-fun m!591737 () Bool)

(assert (=> b!615514 m!591737))

(declare-fun m!591739 () Bool)

(assert (=> b!615514 m!591739))

(declare-fun m!591741 () Bool)

(assert (=> b!615514 m!591741))

(assert (=> b!615512 m!591711))

(assert (=> b!615512 m!591711))

(declare-fun m!591743 () Bool)

(assert (=> b!615512 m!591743))

(assert (=> b!615519 m!591711))

(assert (=> b!615519 m!591711))

(assert (=> b!615519 m!591743))

(assert (=> b!615517 m!591721))

(declare-fun m!591745 () Bool)

(assert (=> b!615517 m!591745))

(assert (=> b!615505 m!591711))

(assert (=> b!615505 m!591711))

(assert (=> b!615505 m!591731))

(declare-fun m!591747 () Bool)

(assert (=> b!615521 m!591747))

(assert (=> b!615516 m!591711))

(assert (=> b!615516 m!591711))

(declare-fun m!591749 () Bool)

(assert (=> b!615516 m!591749))

(assert (=> b!615516 m!591733))

(assert (=> b!615516 m!591711))

(declare-fun m!591751 () Bool)

(assert (=> b!615516 m!591751))

(assert (=> b!615516 m!591711))

(declare-fun m!591753 () Bool)

(assert (=> b!615516 m!591753))

(declare-fun m!591755 () Bool)

(assert (=> b!615516 m!591755))

(declare-fun m!591757 () Bool)

(assert (=> b!615516 m!591757))

(assert (=> b!615516 m!591741))

(declare-fun m!591759 () Bool)

(assert (=> b!615526 m!591759))

(declare-fun m!591761 () Bool)

(assert (=> b!615518 m!591761))

(assert (=> b!615518 m!591711))

(assert (=> b!615518 m!591711))

(declare-fun m!591763 () Bool)

(assert (=> b!615518 m!591763))

(assert (=> b!615511 m!591721))

(declare-fun m!591765 () Bool)

(assert (=> b!615511 m!591765))

(assert (=> b!615511 m!591711))

(declare-fun m!591767 () Bool)

(assert (=> start!56004 m!591767))

(declare-fun m!591769 () Bool)

(assert (=> start!56004 m!591769))

(declare-fun m!591771 () Bool)

(assert (=> b!615510 m!591771))

(declare-fun m!591773 () Bool)

(assert (=> b!615509 m!591773))

(check-sat (not b!615526) (not b!615516) (not b!615509) (not b!615505) (not b!615510) (not b!615519) (not b!615514) (not start!56004) (not b!615518) (not b!615512) (not b!615508) (not b!615506) (not b!615513) (not b!615507))
(check-sat)
