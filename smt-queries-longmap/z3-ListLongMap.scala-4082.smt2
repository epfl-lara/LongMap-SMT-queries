; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56040 () Bool)

(assert start!56040)

(declare-fun b!615209 () Bool)

(declare-fun res!396236 () Bool)

(declare-fun e!352743 () Bool)

(assert (=> b!615209 (=> (not res!396236) (not e!352743))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615209 (= res!396236 (validKeyInArray!0 k0!1786))))

(declare-fun b!615210 () Bool)

(declare-fun res!396231 () Bool)

(assert (=> b!615210 (=> (not res!396231) (not e!352743))))

(declare-datatypes ((array!37455 0))(
  ( (array!37456 (arr!17971 (Array (_ BitVec 32) (_ BitVec 64))) (size!18335 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37455)

(declare-fun arrayContainsKey!0 (array!37455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615210 (= res!396231 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615211 () Bool)

(declare-datatypes ((Unit!19867 0))(
  ( (Unit!19868) )
))
(declare-fun e!352745 () Unit!19867)

(declare-fun Unit!19869 () Unit!19867)

(assert (=> b!615211 (= e!352745 Unit!19869)))

(assert (=> b!615211 false))

(declare-fun b!615212 () Bool)

(declare-fun e!352744 () Bool)

(declare-fun e!352740 () Bool)

(assert (=> b!615212 (= e!352744 e!352740)))

(declare-fun res!396234 () Bool)

(assert (=> b!615212 (=> (not res!396234) (not e!352740))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6367 0))(
  ( (MissingZero!6367 (index!27752 (_ BitVec 32))) (Found!6367 (index!27753 (_ BitVec 32))) (Intermediate!6367 (undefined!7179 Bool) (index!27754 (_ BitVec 32)) (x!56706 (_ BitVec 32))) (Undefined!6367) (MissingVacant!6367 (index!27755 (_ BitVec 32))) )
))
(declare-fun lt!282420 () SeekEntryResult!6367)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615212 (= res!396234 (and (= lt!282420 (Found!6367 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17971 a!2986) index!984) (select (arr!17971 a!2986) j!136))) (not (= (select (arr!17971 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37455 (_ BitVec 32)) SeekEntryResult!6367)

(assert (=> b!615212 (= lt!282420 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17971 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615213 () Bool)

(declare-fun res!396230 () Bool)

(assert (=> b!615213 (=> (not res!396230) (not e!352743))))

(assert (=> b!615213 (= res!396230 (validKeyInArray!0 (select (arr!17971 a!2986) j!136)))))

(declare-fun b!615214 () Bool)

(declare-fun res!396232 () Bool)

(assert (=> b!615214 (= res!396232 (bvsge j!136 index!984))))

(declare-fun e!352750 () Bool)

(assert (=> b!615214 (=> res!396232 e!352750)))

(declare-fun e!352739 () Bool)

(assert (=> b!615214 (= e!352739 e!352750)))

(declare-fun b!615215 () Bool)

(assert (=> b!615215 false))

(declare-fun lt!282433 () Unit!19867)

(declare-fun lt!282428 () array!37455)

(declare-datatypes ((List!11919 0))(
  ( (Nil!11916) (Cons!11915 (h!12963 (_ BitVec 64)) (t!18139 List!11919)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37455 (_ BitVec 64) (_ BitVec 32) List!11919) Unit!19867)

(assert (=> b!615215 (= lt!282433 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282428 (select (arr!17971 a!2986) j!136) j!136 Nil!11916))))

(declare-fun arrayNoDuplicates!0 (array!37455 (_ BitVec 32) List!11919) Bool)

(assert (=> b!615215 (arrayNoDuplicates!0 lt!282428 j!136 Nil!11916)))

(declare-fun lt!282431 () Unit!19867)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37455 (_ BitVec 32) (_ BitVec 32)) Unit!19867)

(assert (=> b!615215 (= lt!282431 (lemmaNoDuplicateFromThenFromBigger!0 lt!282428 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615215 (arrayNoDuplicates!0 lt!282428 #b00000000000000000000000000000000 Nil!11916)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!282425 () Unit!19867)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11919) Unit!19867)

(assert (=> b!615215 (= lt!282425 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11916))))

(assert (=> b!615215 (arrayContainsKey!0 lt!282428 (select (arr!17971 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282429 () Unit!19867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19867)

(assert (=> b!615215 (= lt!282429 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282428 (select (arr!17971 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352751 () Unit!19867)

(declare-fun Unit!19870 () Unit!19867)

(assert (=> b!615215 (= e!352751 Unit!19870)))

(declare-fun b!615216 () Bool)

(declare-fun e!352752 () Unit!19867)

(declare-fun Unit!19871 () Unit!19867)

(assert (=> b!615216 (= e!352752 Unit!19871)))

(declare-fun res!396229 () Bool)

(assert (=> b!615216 (= res!396229 (= (select (store (arr!17971 a!2986) i!1108 k0!1786) index!984) (select (arr!17971 a!2986) j!136)))))

(assert (=> b!615216 (=> (not res!396229) (not e!352739))))

(assert (=> b!615216 e!352739))

(declare-fun c!69860 () Bool)

(assert (=> b!615216 (= c!69860 (bvslt j!136 index!984))))

(declare-fun lt!282424 () Unit!19867)

(assert (=> b!615216 (= lt!282424 e!352751)))

(declare-fun c!69862 () Bool)

(assert (=> b!615216 (= c!69862 (bvslt index!984 j!136))))

(declare-fun lt!282437 () Unit!19867)

(declare-fun e!352742 () Unit!19867)

(assert (=> b!615216 (= lt!282437 e!352742)))

(assert (=> b!615216 false))

(declare-fun b!615217 () Bool)

(declare-fun Unit!19872 () Unit!19867)

(assert (=> b!615217 (= e!352742 Unit!19872)))

(declare-fun b!615218 () Bool)

(declare-fun res!396238 () Bool)

(assert (=> b!615218 (= res!396238 (arrayContainsKey!0 lt!282428 (select (arr!17971 a!2986) j!136) j!136))))

(declare-fun e!352741 () Bool)

(assert (=> b!615218 (=> (not res!396238) (not e!352741))))

(assert (=> b!615218 (= e!352750 e!352741)))

(declare-fun b!615220 () Bool)

(declare-fun e!352747 () Bool)

(declare-fun lt!282436 () SeekEntryResult!6367)

(assert (=> b!615220 (= e!352747 (= lt!282420 lt!282436))))

(declare-fun b!615221 () Bool)

(declare-fun e!352749 () Bool)

(assert (=> b!615221 (= e!352749 e!352744)))

(declare-fun res!396227 () Bool)

(assert (=> b!615221 (=> (not res!396227) (not e!352744))))

(assert (=> b!615221 (= res!396227 (= (select (store (arr!17971 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615221 (= lt!282428 (array!37456 (store (arr!17971 a!2986) i!1108 k0!1786) (size!18335 a!2986)))))

(declare-fun b!615222 () Bool)

(assert (=> b!615222 (= e!352743 e!352749)))

(declare-fun res!396235 () Bool)

(assert (=> b!615222 (=> (not res!396235) (not e!352749))))

(declare-fun lt!282423 () SeekEntryResult!6367)

(assert (=> b!615222 (= res!396235 (or (= lt!282423 (MissingZero!6367 i!1108)) (= lt!282423 (MissingVacant!6367 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37455 (_ BitVec 32)) SeekEntryResult!6367)

(assert (=> b!615222 (= lt!282423 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615223 () Bool)

(declare-fun res!396233 () Bool)

(assert (=> b!615223 (=> (not res!396233) (not e!352749))))

(assert (=> b!615223 (= res!396233 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11916))))

(declare-fun b!615224 () Bool)

(assert (=> b!615224 (= e!352740 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!282438 () Unit!19867)

(assert (=> b!615224 (= lt!282438 e!352752)))

(declare-fun c!69861 () Bool)

(declare-fun lt!282432 () SeekEntryResult!6367)

(assert (=> b!615224 (= c!69861 (= lt!282432 (Found!6367 index!984)))))

(declare-fun lt!282430 () Unit!19867)

(assert (=> b!615224 (= lt!282430 e!352745)))

(declare-fun c!69863 () Bool)

(assert (=> b!615224 (= c!69863 (= lt!282432 Undefined!6367))))

(declare-fun lt!282422 () (_ BitVec 64))

(assert (=> b!615224 (= lt!282432 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282422 lt!282428 mask!3053))))

(assert (=> b!615224 e!352747))

(declare-fun res!396240 () Bool)

(assert (=> b!615224 (=> (not res!396240) (not e!352747))))

(declare-fun lt!282427 () (_ BitVec 32))

(assert (=> b!615224 (= res!396240 (= lt!282436 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282427 vacantSpotIndex!68 lt!282422 lt!282428 mask!3053)))))

(assert (=> b!615224 (= lt!282436 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282427 vacantSpotIndex!68 (select (arr!17971 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615224 (= lt!282422 (select (store (arr!17971 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282426 () Unit!19867)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19867)

(assert (=> b!615224 (= lt!282426 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282427 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615224 (= lt!282427 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!615225 () Bool)

(assert (=> b!615225 false))

(declare-fun lt!282421 () Unit!19867)

(assert (=> b!615225 (= lt!282421 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282428 (select (arr!17971 a!2986) j!136) index!984 Nil!11916))))

(assert (=> b!615225 (arrayNoDuplicates!0 lt!282428 index!984 Nil!11916)))

(declare-fun lt!282439 () Unit!19867)

(assert (=> b!615225 (= lt!282439 (lemmaNoDuplicateFromThenFromBigger!0 lt!282428 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615225 (arrayNoDuplicates!0 lt!282428 #b00000000000000000000000000000000 Nil!11916)))

(declare-fun lt!282434 () Unit!19867)

(assert (=> b!615225 (= lt!282434 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11916))))

(assert (=> b!615225 (arrayContainsKey!0 lt!282428 (select (arr!17971 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282435 () Unit!19867)

(assert (=> b!615225 (= lt!282435 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282428 (select (arr!17971 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352748 () Bool)

(assert (=> b!615225 e!352748))

(declare-fun res!396241 () Bool)

(assert (=> b!615225 (=> (not res!396241) (not e!352748))))

(assert (=> b!615225 (= res!396241 (arrayContainsKey!0 lt!282428 (select (arr!17971 a!2986) j!136) j!136))))

(declare-fun Unit!19873 () Unit!19867)

(assert (=> b!615225 (= e!352742 Unit!19873)))

(declare-fun b!615226 () Bool)

(assert (=> b!615226 (= e!352748 (arrayContainsKey!0 lt!282428 (select (arr!17971 a!2986) j!136) index!984))))

(declare-fun b!615227 () Bool)

(assert (=> b!615227 (= e!352741 (arrayContainsKey!0 lt!282428 (select (arr!17971 a!2986) j!136) index!984))))

(declare-fun b!615228 () Bool)

(declare-fun res!396239 () Bool)

(assert (=> b!615228 (=> (not res!396239) (not e!352749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37455 (_ BitVec 32)) Bool)

(assert (=> b!615228 (= res!396239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615229 () Bool)

(declare-fun Unit!19874 () Unit!19867)

(assert (=> b!615229 (= e!352745 Unit!19874)))

(declare-fun res!396228 () Bool)

(assert (=> start!56040 (=> (not res!396228) (not e!352743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56040 (= res!396228 (validMask!0 mask!3053))))

(assert (=> start!56040 e!352743))

(assert (=> start!56040 true))

(declare-fun array_inv!13830 (array!37455) Bool)

(assert (=> start!56040 (array_inv!13830 a!2986)))

(declare-fun b!615219 () Bool)

(declare-fun res!396237 () Bool)

(assert (=> b!615219 (=> (not res!396237) (not e!352749))))

(assert (=> b!615219 (= res!396237 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17971 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615230 () Bool)

(declare-fun res!396226 () Bool)

(assert (=> b!615230 (=> (not res!396226) (not e!352743))))

(assert (=> b!615230 (= res!396226 (and (= (size!18335 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18335 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18335 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615231 () Bool)

(declare-fun Unit!19875 () Unit!19867)

(assert (=> b!615231 (= e!352752 Unit!19875)))

(declare-fun b!615232 () Bool)

(declare-fun Unit!19876 () Unit!19867)

(assert (=> b!615232 (= e!352751 Unit!19876)))

(assert (= (and start!56040 res!396228) b!615230))

(assert (= (and b!615230 res!396226) b!615213))

(assert (= (and b!615213 res!396230) b!615209))

(assert (= (and b!615209 res!396236) b!615210))

(assert (= (and b!615210 res!396231) b!615222))

(assert (= (and b!615222 res!396235) b!615228))

(assert (= (and b!615228 res!396239) b!615223))

(assert (= (and b!615223 res!396233) b!615219))

(assert (= (and b!615219 res!396237) b!615221))

(assert (= (and b!615221 res!396227) b!615212))

(assert (= (and b!615212 res!396234) b!615224))

(assert (= (and b!615224 res!396240) b!615220))

(assert (= (and b!615224 c!69863) b!615211))

(assert (= (and b!615224 (not c!69863)) b!615229))

(assert (= (and b!615224 c!69861) b!615216))

(assert (= (and b!615224 (not c!69861)) b!615231))

(assert (= (and b!615216 res!396229) b!615214))

(assert (= (and b!615214 (not res!396232)) b!615218))

(assert (= (and b!615218 res!396238) b!615227))

(assert (= (and b!615216 c!69860) b!615215))

(assert (= (and b!615216 (not c!69860)) b!615232))

(assert (= (and b!615216 c!69862) b!615225))

(assert (= (and b!615216 (not c!69862)) b!615217))

(assert (= (and b!615225 res!396241) b!615226))

(declare-fun m!591701 () Bool)

(assert (=> b!615223 m!591701))

(declare-fun m!591703 () Bool)

(assert (=> b!615225 m!591703))

(assert (=> b!615225 m!591703))

(declare-fun m!591705 () Bool)

(assert (=> b!615225 m!591705))

(declare-fun m!591707 () Bool)

(assert (=> b!615225 m!591707))

(assert (=> b!615225 m!591703))

(declare-fun m!591709 () Bool)

(assert (=> b!615225 m!591709))

(declare-fun m!591711 () Bool)

(assert (=> b!615225 m!591711))

(assert (=> b!615225 m!591703))

(declare-fun m!591713 () Bool)

(assert (=> b!615225 m!591713))

(declare-fun m!591715 () Bool)

(assert (=> b!615225 m!591715))

(declare-fun m!591717 () Bool)

(assert (=> b!615225 m!591717))

(assert (=> b!615225 m!591703))

(declare-fun m!591719 () Bool)

(assert (=> b!615225 m!591719))

(assert (=> b!615215 m!591703))

(declare-fun m!591721 () Bool)

(assert (=> b!615215 m!591721))

(declare-fun m!591723 () Bool)

(assert (=> b!615215 m!591723))

(assert (=> b!615215 m!591717))

(assert (=> b!615215 m!591703))

(declare-fun m!591725 () Bool)

(assert (=> b!615215 m!591725))

(assert (=> b!615215 m!591715))

(assert (=> b!615215 m!591703))

(declare-fun m!591727 () Bool)

(assert (=> b!615215 m!591727))

(assert (=> b!615215 m!591703))

(declare-fun m!591729 () Bool)

(assert (=> b!615215 m!591729))

(assert (=> b!615218 m!591703))

(assert (=> b!615218 m!591703))

(assert (=> b!615218 m!591709))

(declare-fun m!591731 () Bool)

(assert (=> b!615210 m!591731))

(declare-fun m!591733 () Bool)

(assert (=> b!615219 m!591733))

(assert (=> b!615226 m!591703))

(assert (=> b!615226 m!591703))

(declare-fun m!591735 () Bool)

(assert (=> b!615226 m!591735))

(declare-fun m!591737 () Bool)

(assert (=> b!615228 m!591737))

(assert (=> b!615213 m!591703))

(assert (=> b!615213 m!591703))

(declare-fun m!591739 () Bool)

(assert (=> b!615213 m!591739))

(declare-fun m!591741 () Bool)

(assert (=> b!615222 m!591741))

(declare-fun m!591743 () Bool)

(assert (=> b!615224 m!591743))

(declare-fun m!591745 () Bool)

(assert (=> b!615224 m!591745))

(declare-fun m!591747 () Bool)

(assert (=> b!615224 m!591747))

(declare-fun m!591749 () Bool)

(assert (=> b!615224 m!591749))

(assert (=> b!615224 m!591703))

(declare-fun m!591751 () Bool)

(assert (=> b!615224 m!591751))

(declare-fun m!591753 () Bool)

(assert (=> b!615224 m!591753))

(assert (=> b!615224 m!591703))

(declare-fun m!591755 () Bool)

(assert (=> b!615224 m!591755))

(declare-fun m!591757 () Bool)

(assert (=> start!56040 m!591757))

(declare-fun m!591759 () Bool)

(assert (=> start!56040 m!591759))

(assert (=> b!615216 m!591747))

(declare-fun m!591761 () Bool)

(assert (=> b!615216 m!591761))

(assert (=> b!615216 m!591703))

(declare-fun m!591763 () Bool)

(assert (=> b!615212 m!591763))

(assert (=> b!615212 m!591703))

(assert (=> b!615212 m!591703))

(declare-fun m!591765 () Bool)

(assert (=> b!615212 m!591765))

(declare-fun m!591767 () Bool)

(assert (=> b!615209 m!591767))

(assert (=> b!615221 m!591747))

(declare-fun m!591769 () Bool)

(assert (=> b!615221 m!591769))

(assert (=> b!615227 m!591703))

(assert (=> b!615227 m!591703))

(assert (=> b!615227 m!591735))

(check-sat (not b!615210) (not b!615223) (not b!615225) (not b!615215) (not b!615212) (not b!615213) (not b!615218) (not b!615222) (not b!615228) (not b!615209) (not b!615227) (not b!615226) (not start!56040) (not b!615224))
(check-sat)
