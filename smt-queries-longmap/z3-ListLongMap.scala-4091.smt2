; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56028 () Bool)

(assert start!56028)

(declare-fun b!616702 () Bool)

(declare-fun res!397321 () Bool)

(declare-fun e!353600 () Bool)

(assert (=> b!616702 (=> (not res!397321) (not e!353600))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37512 0))(
  ( (array!37513 (arr!18002 (Array (_ BitVec 32) (_ BitVec 64))) (size!18367 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37512)

(assert (=> b!616702 (= res!397321 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18002 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616703 () Bool)

(declare-fun e!353609 () Bool)

(declare-datatypes ((SeekEntryResult!6439 0))(
  ( (MissingZero!6439 (index!28040 (_ BitVec 32))) (Found!6439 (index!28041 (_ BitVec 32))) (Intermediate!6439 (undefined!7251 Bool) (index!28042 (_ BitVec 32)) (x!56842 (_ BitVec 32))) (Undefined!6439) (MissingVacant!6439 (index!28043 (_ BitVec 32))) )
))
(declare-fun lt!283722 () SeekEntryResult!6439)

(declare-fun lt!283710 () SeekEntryResult!6439)

(assert (=> b!616703 (= e!353609 (= lt!283722 lt!283710))))

(declare-fun e!353602 () Bool)

(declare-fun lt!283714 () array!37512)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!616704 () Bool)

(declare-fun arrayContainsKey!0 (array!37512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616704 (= e!353602 (arrayContainsKey!0 lt!283714 (select (arr!18002 a!2986) j!136) index!984))))

(declare-fun b!616705 () Bool)

(assert (=> b!616705 false))

(declare-datatypes ((Unit!20136 0))(
  ( (Unit!20137) )
))
(declare-fun lt!283709 () Unit!20136)

(declare-datatypes ((List!12082 0))(
  ( (Nil!12079) (Cons!12078 (h!13123 (_ BitVec 64)) (t!18301 List!12082)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37512 (_ BitVec 64) (_ BitVec 32) List!12082) Unit!20136)

(assert (=> b!616705 (= lt!283709 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283714 (select (arr!18002 a!2986) j!136) index!984 Nil!12079))))

(declare-fun arrayNoDuplicates!0 (array!37512 (_ BitVec 32) List!12082) Bool)

(assert (=> b!616705 (arrayNoDuplicates!0 lt!283714 index!984 Nil!12079)))

(declare-fun lt!283717 () Unit!20136)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37512 (_ BitVec 32) (_ BitVec 32)) Unit!20136)

(assert (=> b!616705 (= lt!283717 (lemmaNoDuplicateFromThenFromBigger!0 lt!283714 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616705 (arrayNoDuplicates!0 lt!283714 #b00000000000000000000000000000000 Nil!12079)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!283712 () Unit!20136)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12082) Unit!20136)

(assert (=> b!616705 (= lt!283712 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12079))))

(assert (=> b!616705 (arrayContainsKey!0 lt!283714 (select (arr!18002 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283715 () Unit!20136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20136)

(assert (=> b!616705 (= lt!283715 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283714 (select (arr!18002 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353608 () Bool)

(assert (=> b!616705 e!353608))

(declare-fun res!397322 () Bool)

(assert (=> b!616705 (=> (not res!397322) (not e!353608))))

(assert (=> b!616705 (= res!397322 (arrayContainsKey!0 lt!283714 (select (arr!18002 a!2986) j!136) j!136))))

(declare-fun e!353603 () Unit!20136)

(declare-fun Unit!20138 () Unit!20136)

(assert (=> b!616705 (= e!353603 Unit!20138)))

(declare-fun b!616706 () Bool)

(declare-fun e!353612 () Unit!20136)

(declare-fun Unit!20139 () Unit!20136)

(assert (=> b!616706 (= e!353612 Unit!20139)))

(declare-fun b!616707 () Bool)

(declare-fun e!353601 () Bool)

(assert (=> b!616707 (= e!353601 true)))

(assert (=> b!616707 (= (select (store (arr!18002 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616708 () Bool)

(declare-fun res!397329 () Bool)

(assert (=> b!616708 (=> (not res!397329) (not e!353600))))

(assert (=> b!616708 (= res!397329 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12079))))

(declare-fun b!616709 () Bool)

(declare-fun e!353605 () Bool)

(assert (=> b!616709 (= e!353600 e!353605)))

(declare-fun res!397331 () Bool)

(assert (=> b!616709 (=> (not res!397331) (not e!353605))))

(assert (=> b!616709 (= res!397331 (= (select (store (arr!18002 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616709 (= lt!283714 (array!37513 (store (arr!18002 a!2986) i!1108 k0!1786) (size!18367 a!2986)))))

(declare-fun b!616710 () Bool)

(declare-fun Unit!20140 () Unit!20136)

(assert (=> b!616710 (= e!353603 Unit!20140)))

(declare-fun b!616711 () Bool)

(declare-fun res!397326 () Bool)

(declare-fun e!353610 () Bool)

(assert (=> b!616711 (=> (not res!397326) (not e!353610))))

(assert (=> b!616711 (= res!397326 (and (= (size!18367 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18367 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18367 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616713 () Bool)

(declare-fun e!353606 () Unit!20136)

(declare-fun Unit!20141 () Unit!20136)

(assert (=> b!616713 (= e!353606 Unit!20141)))

(declare-fun b!616714 () Bool)

(declare-fun e!353607 () Bool)

(assert (=> b!616714 (= e!353605 e!353607)))

(declare-fun res!397334 () Bool)

(assert (=> b!616714 (=> (not res!397334) (not e!353607))))

(assert (=> b!616714 (= res!397334 (and (= lt!283722 (Found!6439 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18002 a!2986) index!984) (select (arr!18002 a!2986) j!136))) (not (= (select (arr!18002 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37512 (_ BitVec 32)) SeekEntryResult!6439)

(assert (=> b!616714 (= lt!283722 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18002 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616715 () Bool)

(declare-fun e!353611 () Unit!20136)

(declare-fun Unit!20142 () Unit!20136)

(assert (=> b!616715 (= e!353611 Unit!20142)))

(declare-fun res!397332 () Bool)

(assert (=> b!616715 (= res!397332 (= (select (store (arr!18002 a!2986) i!1108 k0!1786) index!984) (select (arr!18002 a!2986) j!136)))))

(declare-fun e!353599 () Bool)

(assert (=> b!616715 (=> (not res!397332) (not e!353599))))

(assert (=> b!616715 e!353599))

(declare-fun c!70061 () Bool)

(assert (=> b!616715 (= c!70061 (bvslt j!136 index!984))))

(declare-fun lt!283713 () Unit!20136)

(assert (=> b!616715 (= lt!283713 e!353606)))

(declare-fun c!70060 () Bool)

(assert (=> b!616715 (= c!70060 (bvslt index!984 j!136))))

(declare-fun lt!283721 () Unit!20136)

(assert (=> b!616715 (= lt!283721 e!353603)))

(assert (=> b!616715 false))

(declare-fun b!616716 () Bool)

(declare-fun res!397325 () Bool)

(assert (=> b!616716 (=> (not res!397325) (not e!353610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616716 (= res!397325 (validKeyInArray!0 k0!1786))))

(declare-fun b!616717 () Bool)

(assert (=> b!616717 (= e!353607 (not e!353601))))

(declare-fun res!397330 () Bool)

(assert (=> b!616717 (=> res!397330 e!353601)))

(declare-fun lt!283719 () SeekEntryResult!6439)

(assert (=> b!616717 (= res!397330 (not (= lt!283719 (MissingVacant!6439 vacantSpotIndex!68))))))

(declare-fun lt!283720 () Unit!20136)

(assert (=> b!616717 (= lt!283720 e!353611)))

(declare-fun c!70059 () Bool)

(assert (=> b!616717 (= c!70059 (= lt!283719 (Found!6439 index!984)))))

(declare-fun lt!283716 () Unit!20136)

(assert (=> b!616717 (= lt!283716 e!353612)))

(declare-fun c!70062 () Bool)

(assert (=> b!616717 (= c!70062 (= lt!283719 Undefined!6439))))

(declare-fun lt!283708 () (_ BitVec 64))

(assert (=> b!616717 (= lt!283719 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283708 lt!283714 mask!3053))))

(assert (=> b!616717 e!353609))

(declare-fun res!397324 () Bool)

(assert (=> b!616717 (=> (not res!397324) (not e!353609))))

(declare-fun lt!283706 () (_ BitVec 32))

(assert (=> b!616717 (= res!397324 (= lt!283710 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283706 vacantSpotIndex!68 lt!283708 lt!283714 mask!3053)))))

(assert (=> b!616717 (= lt!283710 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283706 vacantSpotIndex!68 (select (arr!18002 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616717 (= lt!283708 (select (store (arr!18002 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283707 () Unit!20136)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20136)

(assert (=> b!616717 (= lt!283707 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283706 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616717 (= lt!283706 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616718 () Bool)

(declare-fun res!397328 () Bool)

(assert (=> b!616718 (=> (not res!397328) (not e!353610))))

(assert (=> b!616718 (= res!397328 (validKeyInArray!0 (select (arr!18002 a!2986) j!136)))))

(declare-fun b!616719 () Bool)

(declare-fun res!397327 () Bool)

(assert (=> b!616719 (= res!397327 (arrayContainsKey!0 lt!283714 (select (arr!18002 a!2986) j!136) j!136))))

(assert (=> b!616719 (=> (not res!397327) (not e!353602))))

(declare-fun e!353604 () Bool)

(assert (=> b!616719 (= e!353604 e!353602)))

(declare-fun res!397319 () Bool)

(assert (=> start!56028 (=> (not res!397319) (not e!353610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56028 (= res!397319 (validMask!0 mask!3053))))

(assert (=> start!56028 e!353610))

(assert (=> start!56028 true))

(declare-fun array_inv!13885 (array!37512) Bool)

(assert (=> start!56028 (array_inv!13885 a!2986)))

(declare-fun b!616712 () Bool)

(declare-fun Unit!20143 () Unit!20136)

(assert (=> b!616712 (= e!353612 Unit!20143)))

(assert (=> b!616712 false))

(declare-fun b!616720 () Bool)

(declare-fun Unit!20144 () Unit!20136)

(assert (=> b!616720 (= e!353611 Unit!20144)))

(declare-fun b!616721 () Bool)

(declare-fun res!397318 () Bool)

(assert (=> b!616721 (= res!397318 (bvsge j!136 index!984))))

(assert (=> b!616721 (=> res!397318 e!353604)))

(assert (=> b!616721 (= e!353599 e!353604)))

(declare-fun b!616722 () Bool)

(assert (=> b!616722 (= e!353608 (arrayContainsKey!0 lt!283714 (select (arr!18002 a!2986) j!136) index!984))))

(declare-fun b!616723 () Bool)

(assert (=> b!616723 (= e!353610 e!353600)))

(declare-fun res!397323 () Bool)

(assert (=> b!616723 (=> (not res!397323) (not e!353600))))

(declare-fun lt!283723 () SeekEntryResult!6439)

(assert (=> b!616723 (= res!397323 (or (= lt!283723 (MissingZero!6439 i!1108)) (= lt!283723 (MissingVacant!6439 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37512 (_ BitVec 32)) SeekEntryResult!6439)

(assert (=> b!616723 (= lt!283723 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616724 () Bool)

(declare-fun res!397333 () Bool)

(assert (=> b!616724 (=> (not res!397333) (not e!353600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37512 (_ BitVec 32)) Bool)

(assert (=> b!616724 (= res!397333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616725 () Bool)

(declare-fun res!397320 () Bool)

(assert (=> b!616725 (=> (not res!397320) (not e!353610))))

(assert (=> b!616725 (= res!397320 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616726 () Bool)

(assert (=> b!616726 false))

(declare-fun lt!283705 () Unit!20136)

(assert (=> b!616726 (= lt!283705 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283714 (select (arr!18002 a!2986) j!136) j!136 Nil!12079))))

(assert (=> b!616726 (arrayNoDuplicates!0 lt!283714 j!136 Nil!12079)))

(declare-fun lt!283711 () Unit!20136)

(assert (=> b!616726 (= lt!283711 (lemmaNoDuplicateFromThenFromBigger!0 lt!283714 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616726 (arrayNoDuplicates!0 lt!283714 #b00000000000000000000000000000000 Nil!12079)))

(declare-fun lt!283718 () Unit!20136)

(assert (=> b!616726 (= lt!283718 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12079))))

(assert (=> b!616726 (arrayContainsKey!0 lt!283714 (select (arr!18002 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283704 () Unit!20136)

(assert (=> b!616726 (= lt!283704 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283714 (select (arr!18002 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20145 () Unit!20136)

(assert (=> b!616726 (= e!353606 Unit!20145)))

(assert (= (and start!56028 res!397319) b!616711))

(assert (= (and b!616711 res!397326) b!616718))

(assert (= (and b!616718 res!397328) b!616716))

(assert (= (and b!616716 res!397325) b!616725))

(assert (= (and b!616725 res!397320) b!616723))

(assert (= (and b!616723 res!397323) b!616724))

(assert (= (and b!616724 res!397333) b!616708))

(assert (= (and b!616708 res!397329) b!616702))

(assert (= (and b!616702 res!397321) b!616709))

(assert (= (and b!616709 res!397331) b!616714))

(assert (= (and b!616714 res!397334) b!616717))

(assert (= (and b!616717 res!397324) b!616703))

(assert (= (and b!616717 c!70062) b!616712))

(assert (= (and b!616717 (not c!70062)) b!616706))

(assert (= (and b!616717 c!70059) b!616715))

(assert (= (and b!616717 (not c!70059)) b!616720))

(assert (= (and b!616715 res!397332) b!616721))

(assert (= (and b!616721 (not res!397318)) b!616719))

(assert (= (and b!616719 res!397327) b!616704))

(assert (= (and b!616715 c!70061) b!616726))

(assert (= (and b!616715 (not c!70061)) b!616713))

(assert (= (and b!616715 c!70060) b!616705))

(assert (= (and b!616715 (not c!70060)) b!616710))

(assert (= (and b!616705 res!397322) b!616722))

(assert (= (and b!616717 (not res!397330)) b!616707))

(declare-fun m!592339 () Bool)

(assert (=> b!616704 m!592339))

(assert (=> b!616704 m!592339))

(declare-fun m!592341 () Bool)

(assert (=> b!616704 m!592341))

(declare-fun m!592343 () Bool)

(assert (=> b!616702 m!592343))

(assert (=> b!616705 m!592339))

(declare-fun m!592345 () Bool)

(assert (=> b!616705 m!592345))

(declare-fun m!592347 () Bool)

(assert (=> b!616705 m!592347))

(assert (=> b!616705 m!592339))

(declare-fun m!592349 () Bool)

(assert (=> b!616705 m!592349))

(assert (=> b!616705 m!592339))

(declare-fun m!592351 () Bool)

(assert (=> b!616705 m!592351))

(assert (=> b!616705 m!592339))

(declare-fun m!592353 () Bool)

(assert (=> b!616705 m!592353))

(declare-fun m!592355 () Bool)

(assert (=> b!616705 m!592355))

(assert (=> b!616705 m!592339))

(declare-fun m!592357 () Bool)

(assert (=> b!616705 m!592357))

(declare-fun m!592359 () Bool)

(assert (=> b!616705 m!592359))

(assert (=> b!616718 m!592339))

(assert (=> b!616718 m!592339))

(declare-fun m!592361 () Bool)

(assert (=> b!616718 m!592361))

(declare-fun m!592363 () Bool)

(assert (=> b!616707 m!592363))

(declare-fun m!592365 () Bool)

(assert (=> b!616707 m!592365))

(declare-fun m!592367 () Bool)

(assert (=> b!616714 m!592367))

(assert (=> b!616714 m!592339))

(assert (=> b!616714 m!592339))

(declare-fun m!592369 () Bool)

(assert (=> b!616714 m!592369))

(declare-fun m!592371 () Bool)

(assert (=> b!616723 m!592371))

(assert (=> b!616715 m!592363))

(assert (=> b!616715 m!592365))

(assert (=> b!616715 m!592339))

(assert (=> b!616719 m!592339))

(assert (=> b!616719 m!592339))

(assert (=> b!616719 m!592357))

(declare-fun m!592373 () Bool)

(assert (=> b!616717 m!592373))

(declare-fun m!592375 () Bool)

(assert (=> b!616717 m!592375))

(assert (=> b!616717 m!592339))

(declare-fun m!592377 () Bool)

(assert (=> b!616717 m!592377))

(assert (=> b!616717 m!592339))

(declare-fun m!592379 () Bool)

(assert (=> b!616717 m!592379))

(assert (=> b!616717 m!592363))

(declare-fun m!592381 () Bool)

(assert (=> b!616717 m!592381))

(declare-fun m!592383 () Bool)

(assert (=> b!616717 m!592383))

(declare-fun m!592385 () Bool)

(assert (=> b!616724 m!592385))

(assert (=> b!616722 m!592339))

(assert (=> b!616722 m!592339))

(assert (=> b!616722 m!592341))

(assert (=> b!616709 m!592363))

(declare-fun m!592387 () Bool)

(assert (=> b!616709 m!592387))

(declare-fun m!592389 () Bool)

(assert (=> b!616716 m!592389))

(declare-fun m!592391 () Bool)

(assert (=> b!616725 m!592391))

(declare-fun m!592393 () Bool)

(assert (=> b!616708 m!592393))

(declare-fun m!592395 () Bool)

(assert (=> start!56028 m!592395))

(declare-fun m!592397 () Bool)

(assert (=> start!56028 m!592397))

(assert (=> b!616726 m!592339))

(assert (=> b!616726 m!592339))

(declare-fun m!592399 () Bool)

(assert (=> b!616726 m!592399))

(assert (=> b!616726 m!592339))

(declare-fun m!592401 () Bool)

(assert (=> b!616726 m!592401))

(declare-fun m!592403 () Bool)

(assert (=> b!616726 m!592403))

(assert (=> b!616726 m!592359))

(declare-fun m!592405 () Bool)

(assert (=> b!616726 m!592405))

(assert (=> b!616726 m!592339))

(declare-fun m!592407 () Bool)

(assert (=> b!616726 m!592407))

(assert (=> b!616726 m!592347))

(check-sat (not b!616725) (not b!616708) (not b!616724) (not b!616726) (not b!616718) (not b!616722) (not b!616705) (not b!616716) (not b!616704) (not start!56028) (not b!616723) (not b!616714) (not b!616719) (not b!616717))
(check-sat)
