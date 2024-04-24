; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59172 () Bool)

(assert start!59172)

(declare-fun b!652796 () Bool)

(declare-fun res!423342 () Bool)

(declare-fun e!374710 () Bool)

(assert (=> b!652796 (=> (not res!423342) (not e!374710))))

(declare-datatypes ((array!38610 0))(
  ( (array!38611 (arr!18505 (Array (_ BitVec 32) (_ BitVec 64))) (size!18869 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38610)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38610 (_ BitVec 32)) Bool)

(assert (=> b!652796 (= res!423342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652797 () Bool)

(declare-fun e!374704 () Bool)

(declare-fun e!374703 () Bool)

(assert (=> b!652797 (= e!374704 e!374703)))

(declare-fun res!423338 () Bool)

(assert (=> b!652797 (=> res!423338 e!374703)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303824 () (_ BitVec 64))

(declare-fun lt!303826 () (_ BitVec 64))

(assert (=> b!652797 (= res!423338 (or (not (= (select (arr!18505 a!2986) j!136) lt!303826)) (not (= (select (arr!18505 a!2986) j!136) lt!303824))))))

(declare-fun e!374702 () Bool)

(assert (=> b!652797 e!374702))

(declare-fun res!423350 () Bool)

(assert (=> b!652797 (=> (not res!423350) (not e!374702))))

(assert (=> b!652797 (= res!423350 (= lt!303824 (select (arr!18505 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652797 (= lt!303824 (select (store (arr!18505 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652798 () Bool)

(declare-fun e!374707 () Bool)

(assert (=> b!652798 (= e!374710 e!374707)))

(declare-fun res!423343 () Bool)

(assert (=> b!652798 (=> (not res!423343) (not e!374707))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!652798 (= res!423343 (= (select (store (arr!18505 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!303815 () array!38610)

(assert (=> b!652798 (= lt!303815 (array!38611 (store (arr!18505 a!2986) i!1108 k0!1786) (size!18869 a!2986)))))

(declare-fun b!652799 () Bool)

(declare-fun e!374706 () Bool)

(assert (=> b!652799 (= e!374706 (not e!374704))))

(declare-fun res!423344 () Bool)

(assert (=> b!652799 (=> res!423344 e!374704)))

(declare-datatypes ((SeekEntryResult!6901 0))(
  ( (MissingZero!6901 (index!29957 (_ BitVec 32))) (Found!6901 (index!29958 (_ BitVec 32))) (Intermediate!6901 (undefined!7713 Bool) (index!29959 (_ BitVec 32)) (x!58895 (_ BitVec 32))) (Undefined!6901) (MissingVacant!6901 (index!29960 (_ BitVec 32))) )
))
(declare-fun lt!303816 () SeekEntryResult!6901)

(assert (=> b!652799 (= res!423344 (not (= lt!303816 (Found!6901 index!984))))))

(declare-datatypes ((Unit!22305 0))(
  ( (Unit!22306) )
))
(declare-fun lt!303819 () Unit!22305)

(declare-fun e!374709 () Unit!22305)

(assert (=> b!652799 (= lt!303819 e!374709)))

(declare-fun c!75101 () Bool)

(assert (=> b!652799 (= c!75101 (= lt!303816 Undefined!6901))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38610 (_ BitVec 32)) SeekEntryResult!6901)

(assert (=> b!652799 (= lt!303816 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303826 lt!303815 mask!3053))))

(declare-fun e!374701 () Bool)

(assert (=> b!652799 e!374701))

(declare-fun res!423341 () Bool)

(assert (=> b!652799 (=> (not res!423341) (not e!374701))))

(declare-fun lt!303822 () SeekEntryResult!6901)

(declare-fun lt!303825 () (_ BitVec 32))

(assert (=> b!652799 (= res!423341 (= lt!303822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 lt!303826 lt!303815 mask!3053)))))

(assert (=> b!652799 (= lt!303822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652799 (= lt!303826 (select (store (arr!18505 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303823 () Unit!22305)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38610 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22305)

(assert (=> b!652799 (= lt!303823 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652799 (= lt!303825 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!652800 () Bool)

(declare-fun Unit!22307 () Unit!22305)

(assert (=> b!652800 (= e!374709 Unit!22307)))

(declare-fun b!652801 () Bool)

(declare-fun e!374711 () Bool)

(declare-datatypes ((List!12453 0))(
  ( (Nil!12450) (Cons!12449 (h!13497 (_ BitVec 64)) (t!18673 List!12453)) )
))
(declare-fun noDuplicate!439 (List!12453) Bool)

(assert (=> b!652801 (= e!374711 (noDuplicate!439 Nil!12450))))

(declare-fun b!652803 () Bool)

(declare-fun res!423347 () Bool)

(declare-fun e!374713 () Bool)

(assert (=> b!652803 (=> (not res!423347) (not e!374713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652803 (= res!423347 (validKeyInArray!0 (select (arr!18505 a!2986) j!136)))))

(declare-fun b!652804 () Bool)

(declare-fun res!423346 () Bool)

(assert (=> b!652804 (=> (not res!423346) (not e!374713))))

(declare-fun arrayContainsKey!0 (array!38610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652804 (= res!423346 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652805 () Bool)

(declare-fun e!374715 () Bool)

(assert (=> b!652805 (= e!374702 e!374715)))

(declare-fun res!423337 () Bool)

(assert (=> b!652805 (=> res!423337 e!374715)))

(assert (=> b!652805 (= res!423337 (or (not (= (select (arr!18505 a!2986) j!136) lt!303826)) (not (= (select (arr!18505 a!2986) j!136) lt!303824)) (bvsge j!136 index!984)))))

(declare-fun b!652806 () Bool)

(declare-fun Unit!22308 () Unit!22305)

(assert (=> b!652806 (= e!374709 Unit!22308)))

(assert (=> b!652806 false))

(declare-fun b!652807 () Bool)

(declare-fun e!374712 () Bool)

(assert (=> b!652807 (= e!374715 e!374712)))

(declare-fun res!423351 () Bool)

(assert (=> b!652807 (=> (not res!423351) (not e!374712))))

(assert (=> b!652807 (= res!423351 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) j!136))))

(declare-fun e!374705 () Bool)

(declare-fun b!652808 () Bool)

(assert (=> b!652808 (= e!374705 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) index!984))))

(declare-fun b!652809 () Bool)

(declare-fun res!423339 () Bool)

(assert (=> b!652809 (=> (not res!423339) (not e!374713))))

(assert (=> b!652809 (= res!423339 (and (= (size!18869 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18869 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18869 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652810 () Bool)

(declare-fun lt!303817 () SeekEntryResult!6901)

(assert (=> b!652810 (= e!374701 (= lt!303817 lt!303822))))

(declare-fun b!652811 () Bool)

(declare-fun res!423335 () Bool)

(assert (=> b!652811 (=> (not res!423335) (not e!374710))))

(assert (=> b!652811 (= res!423335 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18505 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652812 () Bool)

(declare-fun e!374714 () Unit!22305)

(declare-fun Unit!22309 () Unit!22305)

(assert (=> b!652812 (= e!374714 Unit!22309)))

(declare-fun lt!303814 () Unit!22305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22305)

(assert (=> b!652812 (= lt!303814 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303815 (select (arr!18505 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652812 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303827 () Unit!22305)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12453) Unit!22305)

(assert (=> b!652812 (= lt!303827 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12450))))

(declare-fun arrayNoDuplicates!0 (array!38610 (_ BitVec 32) List!12453) Bool)

(assert (=> b!652812 (arrayNoDuplicates!0 lt!303815 #b00000000000000000000000000000000 Nil!12450)))

(declare-fun lt!303812 () Unit!22305)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38610 (_ BitVec 32) (_ BitVec 32)) Unit!22305)

(assert (=> b!652812 (= lt!303812 (lemmaNoDuplicateFromThenFromBigger!0 lt!303815 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652812 (arrayNoDuplicates!0 lt!303815 j!136 Nil!12450)))

(declare-fun lt!303813 () Unit!22305)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38610 (_ BitVec 64) (_ BitVec 32) List!12453) Unit!22305)

(assert (=> b!652812 (= lt!303813 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303815 (select (arr!18505 a!2986) j!136) j!136 Nil!12450))))

(assert (=> b!652812 false))

(declare-fun b!652802 () Bool)

(declare-fun res!423336 () Bool)

(assert (=> b!652802 (=> (not res!423336) (not e!374713))))

(assert (=> b!652802 (= res!423336 (validKeyInArray!0 k0!1786))))

(declare-fun res!423333 () Bool)

(assert (=> start!59172 (=> (not res!423333) (not e!374713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59172 (= res!423333 (validMask!0 mask!3053))))

(assert (=> start!59172 e!374713))

(assert (=> start!59172 true))

(declare-fun array_inv!14364 (array!38610) Bool)

(assert (=> start!59172 (array_inv!14364 a!2986)))

(declare-fun b!652813 () Bool)

(assert (=> b!652813 (= e!374707 e!374706)))

(declare-fun res!423345 () Bool)

(assert (=> b!652813 (=> (not res!423345) (not e!374706))))

(assert (=> b!652813 (= res!423345 (and (= lt!303817 (Found!6901 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18505 a!2986) index!984) (select (arr!18505 a!2986) j!136))) (not (= (select (arr!18505 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652813 (= lt!303817 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652814 () Bool)

(declare-fun Unit!22310 () Unit!22305)

(assert (=> b!652814 (= e!374714 Unit!22310)))

(declare-fun b!652815 () Bool)

(declare-fun e!374700 () Bool)

(assert (=> b!652815 (= e!374703 e!374700)))

(declare-fun res!423352 () Bool)

(assert (=> b!652815 (=> res!423352 e!374700)))

(assert (=> b!652815 (= res!423352 (bvsge index!984 j!136))))

(declare-fun lt!303820 () Unit!22305)

(assert (=> b!652815 (= lt!303820 e!374714)))

(declare-fun c!75100 () Bool)

(assert (=> b!652815 (= c!75100 (bvslt j!136 index!984))))

(declare-fun b!652816 () Bool)

(declare-fun res!423349 () Bool)

(assert (=> b!652816 (=> (not res!423349) (not e!374710))))

(assert (=> b!652816 (= res!423349 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12450))))

(declare-fun b!652817 () Bool)

(assert (=> b!652817 (= e!374700 e!374711)))

(declare-fun res!423348 () Bool)

(assert (=> b!652817 (=> res!423348 e!374711)))

(assert (=> b!652817 (= res!423348 (or (bvsge (size!18869 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18869 a!2986)) (bvsge index!984 (size!18869 a!2986))))))

(assert (=> b!652817 (arrayNoDuplicates!0 lt!303815 index!984 Nil!12450)))

(declare-fun lt!303828 () Unit!22305)

(assert (=> b!652817 (= lt!303828 (lemmaNoDuplicateFromThenFromBigger!0 lt!303815 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652817 (arrayNoDuplicates!0 lt!303815 #b00000000000000000000000000000000 Nil!12450)))

(declare-fun lt!303818 () Unit!22305)

(assert (=> b!652817 (= lt!303818 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12450))))

(assert (=> b!652817 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303829 () Unit!22305)

(assert (=> b!652817 (= lt!303829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303815 (select (arr!18505 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652817 e!374705))

(declare-fun res!423340 () Bool)

(assert (=> b!652817 (=> (not res!423340) (not e!374705))))

(assert (=> b!652817 (= res!423340 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) j!136))))

(declare-fun b!652818 () Bool)

(assert (=> b!652818 (= e!374712 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) index!984))))

(declare-fun b!652819 () Bool)

(assert (=> b!652819 (= e!374713 e!374710)))

(declare-fun res!423334 () Bool)

(assert (=> b!652819 (=> (not res!423334) (not e!374710))))

(declare-fun lt!303821 () SeekEntryResult!6901)

(assert (=> b!652819 (= res!423334 (or (= lt!303821 (MissingZero!6901 i!1108)) (= lt!303821 (MissingVacant!6901 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38610 (_ BitVec 32)) SeekEntryResult!6901)

(assert (=> b!652819 (= lt!303821 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!59172 res!423333) b!652809))

(assert (= (and b!652809 res!423339) b!652803))

(assert (= (and b!652803 res!423347) b!652802))

(assert (= (and b!652802 res!423336) b!652804))

(assert (= (and b!652804 res!423346) b!652819))

(assert (= (and b!652819 res!423334) b!652796))

(assert (= (and b!652796 res!423342) b!652816))

(assert (= (and b!652816 res!423349) b!652811))

(assert (= (and b!652811 res!423335) b!652798))

(assert (= (and b!652798 res!423343) b!652813))

(assert (= (and b!652813 res!423345) b!652799))

(assert (= (and b!652799 res!423341) b!652810))

(assert (= (and b!652799 c!75101) b!652806))

(assert (= (and b!652799 (not c!75101)) b!652800))

(assert (= (and b!652799 (not res!423344)) b!652797))

(assert (= (and b!652797 res!423350) b!652805))

(assert (= (and b!652805 (not res!423337)) b!652807))

(assert (= (and b!652807 res!423351) b!652818))

(assert (= (and b!652797 (not res!423338)) b!652815))

(assert (= (and b!652815 c!75100) b!652812))

(assert (= (and b!652815 (not c!75100)) b!652814))

(assert (= (and b!652815 (not res!423352)) b!652817))

(assert (= (and b!652817 res!423340) b!652808))

(assert (= (and b!652817 (not res!423348)) b!652801))

(declare-fun m!626377 () Bool)

(assert (=> b!652796 m!626377))

(declare-fun m!626379 () Bool)

(assert (=> b!652805 m!626379))

(declare-fun m!626381 () Bool)

(assert (=> b!652798 m!626381))

(declare-fun m!626383 () Bool)

(assert (=> b!652798 m!626383))

(declare-fun m!626385 () Bool)

(assert (=> b!652813 m!626385))

(assert (=> b!652813 m!626379))

(assert (=> b!652813 m!626379))

(declare-fun m!626387 () Bool)

(assert (=> b!652813 m!626387))

(assert (=> b!652808 m!626379))

(assert (=> b!652808 m!626379))

(declare-fun m!626389 () Bool)

(assert (=> b!652808 m!626389))

(declare-fun m!626391 () Bool)

(assert (=> b!652799 m!626391))

(declare-fun m!626393 () Bool)

(assert (=> b!652799 m!626393))

(declare-fun m!626395 () Bool)

(assert (=> b!652799 m!626395))

(assert (=> b!652799 m!626379))

(assert (=> b!652799 m!626381))

(declare-fun m!626397 () Bool)

(assert (=> b!652799 m!626397))

(assert (=> b!652799 m!626379))

(declare-fun m!626399 () Bool)

(assert (=> b!652799 m!626399))

(declare-fun m!626401 () Bool)

(assert (=> b!652799 m!626401))

(declare-fun m!626403 () Bool)

(assert (=> b!652819 m!626403))

(declare-fun m!626405 () Bool)

(assert (=> b!652802 m!626405))

(declare-fun m!626407 () Bool)

(assert (=> b!652801 m!626407))

(declare-fun m!626409 () Bool)

(assert (=> start!59172 m!626409))

(declare-fun m!626411 () Bool)

(assert (=> start!59172 m!626411))

(assert (=> b!652818 m!626379))

(assert (=> b!652818 m!626379))

(assert (=> b!652818 m!626389))

(declare-fun m!626413 () Bool)

(assert (=> b!652804 m!626413))

(assert (=> b!652817 m!626379))

(declare-fun m!626415 () Bool)

(assert (=> b!652817 m!626415))

(assert (=> b!652817 m!626379))

(declare-fun m!626417 () Bool)

(assert (=> b!652817 m!626417))

(declare-fun m!626419 () Bool)

(assert (=> b!652817 m!626419))

(declare-fun m!626421 () Bool)

(assert (=> b!652817 m!626421))

(declare-fun m!626423 () Bool)

(assert (=> b!652817 m!626423))

(declare-fun m!626425 () Bool)

(assert (=> b!652817 m!626425))

(assert (=> b!652817 m!626379))

(assert (=> b!652817 m!626379))

(declare-fun m!626427 () Bool)

(assert (=> b!652817 m!626427))

(assert (=> b!652812 m!626379))

(declare-fun m!626429 () Bool)

(assert (=> b!652812 m!626429))

(declare-fun m!626431 () Bool)

(assert (=> b!652812 m!626431))

(assert (=> b!652812 m!626379))

(assert (=> b!652812 m!626379))

(declare-fun m!626433 () Bool)

(assert (=> b!652812 m!626433))

(declare-fun m!626435 () Bool)

(assert (=> b!652812 m!626435))

(assert (=> b!652812 m!626423))

(assert (=> b!652812 m!626425))

(assert (=> b!652812 m!626379))

(declare-fun m!626437 () Bool)

(assert (=> b!652812 m!626437))

(declare-fun m!626439 () Bool)

(assert (=> b!652816 m!626439))

(assert (=> b!652803 m!626379))

(assert (=> b!652803 m!626379))

(declare-fun m!626441 () Bool)

(assert (=> b!652803 m!626441))

(declare-fun m!626443 () Bool)

(assert (=> b!652811 m!626443))

(assert (=> b!652807 m!626379))

(assert (=> b!652807 m!626379))

(assert (=> b!652807 m!626417))

(assert (=> b!652797 m!626379))

(assert (=> b!652797 m!626381))

(declare-fun m!626445 () Bool)

(assert (=> b!652797 m!626445))

(check-sat (not b!652804) (not b!652808) (not b!652813) (not start!59172) (not b!652803) (not b!652802) (not b!652817) (not b!652816) (not b!652819) (not b!652807) (not b!652812) (not b!652796) (not b!652818) (not b!652801) (not b!652799))
(check-sat)
(get-model)

(declare-fun b!652974 () Bool)

(declare-fun e!374821 () Bool)

(declare-fun contains!3157 (List!12453 (_ BitVec 64)) Bool)

(assert (=> b!652974 (= e!374821 (contains!3157 Nil!12450 (select (arr!18505 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!652975 () Bool)

(declare-fun e!374820 () Bool)

(declare-fun e!374822 () Bool)

(assert (=> b!652975 (= e!374820 e!374822)))

(declare-fun res!423480 () Bool)

(assert (=> b!652975 (=> (not res!423480) (not e!374822))))

(assert (=> b!652975 (= res!423480 (not e!374821))))

(declare-fun res!423479 () Bool)

(assert (=> b!652975 (=> (not res!423479) (not e!374821))))

(assert (=> b!652975 (= res!423479 (validKeyInArray!0 (select (arr!18505 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92343 () Bool)

(declare-fun res!423481 () Bool)

(assert (=> d!92343 (=> res!423481 e!374820)))

(assert (=> d!92343 (= res!423481 (bvsge #b00000000000000000000000000000000 (size!18869 a!2986)))))

(assert (=> d!92343 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12450) e!374820)))

(declare-fun b!652976 () Bool)

(declare-fun e!374823 () Bool)

(declare-fun call!33789 () Bool)

(assert (=> b!652976 (= e!374823 call!33789)))

(declare-fun b!652977 () Bool)

(assert (=> b!652977 (= e!374822 e!374823)))

(declare-fun c!75116 () Bool)

(assert (=> b!652977 (= c!75116 (validKeyInArray!0 (select (arr!18505 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!652978 () Bool)

(assert (=> b!652978 (= e!374823 call!33789)))

(declare-fun bm!33786 () Bool)

(assert (=> bm!33786 (= call!33789 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75116 (Cons!12449 (select (arr!18505 a!2986) #b00000000000000000000000000000000) Nil!12450) Nil!12450)))))

(assert (= (and d!92343 (not res!423481)) b!652975))

(assert (= (and b!652975 res!423479) b!652974))

(assert (= (and b!652975 res!423480) b!652977))

(assert (= (and b!652977 c!75116) b!652976))

(assert (= (and b!652977 (not c!75116)) b!652978))

(assert (= (or b!652976 b!652978) bm!33786))

(declare-fun m!626587 () Bool)

(assert (=> b!652974 m!626587))

(assert (=> b!652974 m!626587))

(declare-fun m!626589 () Bool)

(assert (=> b!652974 m!626589))

(assert (=> b!652975 m!626587))

(assert (=> b!652975 m!626587))

(declare-fun m!626591 () Bool)

(assert (=> b!652975 m!626591))

(assert (=> b!652977 m!626587))

(assert (=> b!652977 m!626587))

(assert (=> b!652977 m!626591))

(assert (=> bm!33786 m!626587))

(declare-fun m!626593 () Bool)

(assert (=> bm!33786 m!626593))

(assert (=> b!652816 d!92343))

(declare-fun d!92345 () Bool)

(declare-fun res!423486 () Bool)

(declare-fun e!374828 () Bool)

(assert (=> d!92345 (=> res!423486 e!374828)))

(assert (=> d!92345 (= res!423486 (= (select (arr!18505 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92345 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!374828)))

(declare-fun b!652983 () Bool)

(declare-fun e!374829 () Bool)

(assert (=> b!652983 (= e!374828 e!374829)))

(declare-fun res!423487 () Bool)

(assert (=> b!652983 (=> (not res!423487) (not e!374829))))

(assert (=> b!652983 (= res!423487 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18869 a!2986)))))

(declare-fun b!652984 () Bool)

(assert (=> b!652984 (= e!374829 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92345 (not res!423486)) b!652983))

(assert (= (and b!652983 res!423487) b!652984))

(assert (=> d!92345 m!626587))

(declare-fun m!626595 () Bool)

(assert (=> b!652984 m!626595))

(assert (=> b!652804 d!92345))

(declare-fun b!652997 () Bool)

(declare-fun e!374837 () SeekEntryResult!6901)

(assert (=> b!652997 (= e!374837 Undefined!6901)))

(declare-fun e!374838 () SeekEntryResult!6901)

(declare-fun b!652998 () Bool)

(assert (=> b!652998 (= e!374838 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652999 () Bool)

(declare-fun c!75123 () Bool)

(declare-fun lt!303943 () (_ BitVec 64))

(assert (=> b!652999 (= c!75123 (= lt!303943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374836 () SeekEntryResult!6901)

(assert (=> b!652999 (= e!374836 e!374838)))

(declare-fun b!653000 () Bool)

(assert (=> b!653000 (= e!374838 (MissingVacant!6901 vacantSpotIndex!68))))

(declare-fun b!653001 () Bool)

(assert (=> b!653001 (= e!374837 e!374836)))

(declare-fun c!75125 () Bool)

(assert (=> b!653001 (= c!75125 (= lt!303943 (select (arr!18505 a!2986) j!136)))))

(declare-fun b!653002 () Bool)

(assert (=> b!653002 (= e!374836 (Found!6901 index!984))))

(declare-fun d!92347 () Bool)

(declare-fun lt!303942 () SeekEntryResult!6901)

(get-info :version)

(assert (=> d!92347 (and (or ((_ is Undefined!6901) lt!303942) (not ((_ is Found!6901) lt!303942)) (and (bvsge (index!29958 lt!303942) #b00000000000000000000000000000000) (bvslt (index!29958 lt!303942) (size!18869 a!2986)))) (or ((_ is Undefined!6901) lt!303942) ((_ is Found!6901) lt!303942) (not ((_ is MissingVacant!6901) lt!303942)) (not (= (index!29960 lt!303942) vacantSpotIndex!68)) (and (bvsge (index!29960 lt!303942) #b00000000000000000000000000000000) (bvslt (index!29960 lt!303942) (size!18869 a!2986)))) (or ((_ is Undefined!6901) lt!303942) (ite ((_ is Found!6901) lt!303942) (= (select (arr!18505 a!2986) (index!29958 lt!303942)) (select (arr!18505 a!2986) j!136)) (and ((_ is MissingVacant!6901) lt!303942) (= (index!29960 lt!303942) vacantSpotIndex!68) (= (select (arr!18505 a!2986) (index!29960 lt!303942)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92347 (= lt!303942 e!374837)))

(declare-fun c!75124 () Bool)

(assert (=> d!92347 (= c!75124 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92347 (= lt!303943 (select (arr!18505 a!2986) index!984))))

(assert (=> d!92347 (validMask!0 mask!3053)))

(assert (=> d!92347 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053) lt!303942)))

(assert (= (and d!92347 c!75124) b!652997))

(assert (= (and d!92347 (not c!75124)) b!653001))

(assert (= (and b!653001 c!75125) b!653002))

(assert (= (and b!653001 (not c!75125)) b!652999))

(assert (= (and b!652999 c!75123) b!653000))

(assert (= (and b!652999 (not c!75123)) b!652998))

(declare-fun m!626597 () Bool)

(assert (=> b!652998 m!626597))

(assert (=> b!652998 m!626597))

(assert (=> b!652998 m!626379))

(declare-fun m!626599 () Bool)

(assert (=> b!652998 m!626599))

(declare-fun m!626601 () Bool)

(assert (=> d!92347 m!626601))

(declare-fun m!626603 () Bool)

(assert (=> d!92347 m!626603))

(assert (=> d!92347 m!626385))

(assert (=> d!92347 m!626409))

(assert (=> b!652813 d!92347))

(declare-fun d!92349 () Bool)

(assert (=> d!92349 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652802 d!92349))

(declare-fun d!92351 () Bool)

(assert (=> d!92351 (= (validKeyInArray!0 (select (arr!18505 a!2986) j!136)) (and (not (= (select (arr!18505 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18505 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652803 d!92351))

(declare-fun d!92353 () Bool)

(assert (=> d!92353 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59172 d!92353))

(declare-fun d!92355 () Bool)

(assert (=> d!92355 (= (array_inv!14364 a!2986) (bvsge (size!18869 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59172 d!92355))

(declare-fun d!92357 () Bool)

(declare-fun res!423492 () Bool)

(declare-fun e!374843 () Bool)

(assert (=> d!92357 (=> res!423492 e!374843)))

(assert (=> d!92357 (= res!423492 ((_ is Nil!12450) Nil!12450))))

(assert (=> d!92357 (= (noDuplicate!439 Nil!12450) e!374843)))

(declare-fun b!653007 () Bool)

(declare-fun e!374844 () Bool)

(assert (=> b!653007 (= e!374843 e!374844)))

(declare-fun res!423493 () Bool)

(assert (=> b!653007 (=> (not res!423493) (not e!374844))))

(assert (=> b!653007 (= res!423493 (not (contains!3157 (t!18673 Nil!12450) (h!13497 Nil!12450))))))

(declare-fun b!653008 () Bool)

(assert (=> b!653008 (= e!374844 (noDuplicate!439 (t!18673 Nil!12450)))))

(assert (= (and d!92357 (not res!423492)) b!653007))

(assert (= (and b!653007 res!423493) b!653008))

(declare-fun m!626605 () Bool)

(assert (=> b!653007 m!626605))

(declare-fun m!626607 () Bool)

(assert (=> b!653008 m!626607))

(assert (=> b!652801 d!92357))

(declare-fun d!92359 () Bool)

(assert (=> d!92359 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303946 () Unit!22305)

(declare-fun choose!114 (array!38610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22305)

(assert (=> d!92359 (= lt!303946 (choose!114 lt!303815 (select (arr!18505 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92359 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92359 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303815 (select (arr!18505 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303946)))

(declare-fun bs!19472 () Bool)

(assert (= bs!19472 d!92359))

(assert (=> bs!19472 m!626379))

(assert (=> bs!19472 m!626437))

(assert (=> bs!19472 m!626379))

(declare-fun m!626609 () Bool)

(assert (=> bs!19472 m!626609))

(assert (=> b!652812 d!92359))

(declare-fun b!653009 () Bool)

(declare-fun e!374846 () Bool)

(assert (=> b!653009 (= e!374846 (contains!3157 Nil!12450 (select (arr!18505 lt!303815) #b00000000000000000000000000000000)))))

(declare-fun b!653010 () Bool)

(declare-fun e!374845 () Bool)

(declare-fun e!374847 () Bool)

(assert (=> b!653010 (= e!374845 e!374847)))

(declare-fun res!423495 () Bool)

(assert (=> b!653010 (=> (not res!423495) (not e!374847))))

(assert (=> b!653010 (= res!423495 (not e!374846))))

(declare-fun res!423494 () Bool)

(assert (=> b!653010 (=> (not res!423494) (not e!374846))))

(assert (=> b!653010 (= res!423494 (validKeyInArray!0 (select (arr!18505 lt!303815) #b00000000000000000000000000000000)))))

(declare-fun d!92361 () Bool)

(declare-fun res!423496 () Bool)

(assert (=> d!92361 (=> res!423496 e!374845)))

(assert (=> d!92361 (= res!423496 (bvsge #b00000000000000000000000000000000 (size!18869 lt!303815)))))

(assert (=> d!92361 (= (arrayNoDuplicates!0 lt!303815 #b00000000000000000000000000000000 Nil!12450) e!374845)))

(declare-fun b!653011 () Bool)

(declare-fun e!374848 () Bool)

(declare-fun call!33790 () Bool)

(assert (=> b!653011 (= e!374848 call!33790)))

(declare-fun b!653012 () Bool)

(assert (=> b!653012 (= e!374847 e!374848)))

(declare-fun c!75126 () Bool)

(assert (=> b!653012 (= c!75126 (validKeyInArray!0 (select (arr!18505 lt!303815) #b00000000000000000000000000000000)))))

(declare-fun b!653013 () Bool)

(assert (=> b!653013 (= e!374848 call!33790)))

(declare-fun bm!33787 () Bool)

(assert (=> bm!33787 (= call!33790 (arrayNoDuplicates!0 lt!303815 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75126 (Cons!12449 (select (arr!18505 lt!303815) #b00000000000000000000000000000000) Nil!12450) Nil!12450)))))

(assert (= (and d!92361 (not res!423496)) b!653010))

(assert (= (and b!653010 res!423494) b!653009))

(assert (= (and b!653010 res!423495) b!653012))

(assert (= (and b!653012 c!75126) b!653011))

(assert (= (and b!653012 (not c!75126)) b!653013))

(assert (= (or b!653011 b!653013) bm!33787))

(declare-fun m!626611 () Bool)

(assert (=> b!653009 m!626611))

(assert (=> b!653009 m!626611))

(declare-fun m!626613 () Bool)

(assert (=> b!653009 m!626613))

(assert (=> b!653010 m!626611))

(assert (=> b!653010 m!626611))

(declare-fun m!626615 () Bool)

(assert (=> b!653010 m!626615))

(assert (=> b!653012 m!626611))

(assert (=> b!653012 m!626611))

(assert (=> b!653012 m!626615))

(assert (=> bm!33787 m!626611))

(declare-fun m!626617 () Bool)

(assert (=> bm!33787 m!626617))

(assert (=> b!652812 d!92361))

(declare-fun d!92363 () Bool)

(assert (=> d!92363 (arrayNoDuplicates!0 lt!303815 j!136 Nil!12450)))

(declare-fun lt!303949 () Unit!22305)

(declare-fun choose!39 (array!38610 (_ BitVec 32) (_ BitVec 32)) Unit!22305)

(assert (=> d!92363 (= lt!303949 (choose!39 lt!303815 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92363 (bvslt (size!18869 lt!303815) #b01111111111111111111111111111111)))

(assert (=> d!92363 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303815 #b00000000000000000000000000000000 j!136) lt!303949)))

(declare-fun bs!19473 () Bool)

(assert (= bs!19473 d!92363))

(assert (=> bs!19473 m!626431))

(declare-fun m!626619 () Bool)

(assert (=> bs!19473 m!626619))

(assert (=> b!652812 d!92363))

(declare-fun b!653014 () Bool)

(declare-fun e!374850 () Bool)

(assert (=> b!653014 (= e!374850 (contains!3157 Nil!12450 (select (arr!18505 lt!303815) j!136)))))

(declare-fun b!653015 () Bool)

(declare-fun e!374849 () Bool)

(declare-fun e!374851 () Bool)

(assert (=> b!653015 (= e!374849 e!374851)))

(declare-fun res!423498 () Bool)

(assert (=> b!653015 (=> (not res!423498) (not e!374851))))

(assert (=> b!653015 (= res!423498 (not e!374850))))

(declare-fun res!423497 () Bool)

(assert (=> b!653015 (=> (not res!423497) (not e!374850))))

(assert (=> b!653015 (= res!423497 (validKeyInArray!0 (select (arr!18505 lt!303815) j!136)))))

(declare-fun d!92365 () Bool)

(declare-fun res!423499 () Bool)

(assert (=> d!92365 (=> res!423499 e!374849)))

(assert (=> d!92365 (= res!423499 (bvsge j!136 (size!18869 lt!303815)))))

(assert (=> d!92365 (= (arrayNoDuplicates!0 lt!303815 j!136 Nil!12450) e!374849)))

(declare-fun b!653016 () Bool)

(declare-fun e!374852 () Bool)

(declare-fun call!33791 () Bool)

(assert (=> b!653016 (= e!374852 call!33791)))

(declare-fun b!653017 () Bool)

(assert (=> b!653017 (= e!374851 e!374852)))

(declare-fun c!75127 () Bool)

(assert (=> b!653017 (= c!75127 (validKeyInArray!0 (select (arr!18505 lt!303815) j!136)))))

(declare-fun b!653018 () Bool)

(assert (=> b!653018 (= e!374852 call!33791)))

(declare-fun bm!33788 () Bool)

(assert (=> bm!33788 (= call!33791 (arrayNoDuplicates!0 lt!303815 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75127 (Cons!12449 (select (arr!18505 lt!303815) j!136) Nil!12450) Nil!12450)))))

(assert (= (and d!92365 (not res!423499)) b!653015))

(assert (= (and b!653015 res!423497) b!653014))

(assert (= (and b!653015 res!423498) b!653017))

(assert (= (and b!653017 c!75127) b!653016))

(assert (= (and b!653017 (not c!75127)) b!653018))

(assert (= (or b!653016 b!653018) bm!33788))

(declare-fun m!626621 () Bool)

(assert (=> b!653014 m!626621))

(assert (=> b!653014 m!626621))

(declare-fun m!626623 () Bool)

(assert (=> b!653014 m!626623))

(assert (=> b!653015 m!626621))

(assert (=> b!653015 m!626621))

(declare-fun m!626625 () Bool)

(assert (=> b!653015 m!626625))

(assert (=> b!653017 m!626621))

(assert (=> b!653017 m!626621))

(assert (=> b!653017 m!626625))

(assert (=> bm!33788 m!626621))

(declare-fun m!626627 () Bool)

(assert (=> bm!33788 m!626627))

(assert (=> b!652812 d!92365))

(declare-fun d!92367 () Bool)

(assert (=> d!92367 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18869 lt!303815)) (not (= (select (arr!18505 lt!303815) j!136) (select (arr!18505 a!2986) j!136))))))

(declare-fun lt!303952 () Unit!22305)

(declare-fun choose!21 (array!38610 (_ BitVec 64) (_ BitVec 32) List!12453) Unit!22305)

(assert (=> d!92367 (= lt!303952 (choose!21 lt!303815 (select (arr!18505 a!2986) j!136) j!136 Nil!12450))))

(assert (=> d!92367 (bvslt (size!18869 lt!303815) #b01111111111111111111111111111111)))

(assert (=> d!92367 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303815 (select (arr!18505 a!2986) j!136) j!136 Nil!12450) lt!303952)))

(declare-fun bs!19474 () Bool)

(assert (= bs!19474 d!92367))

(assert (=> bs!19474 m!626621))

(assert (=> bs!19474 m!626379))

(declare-fun m!626629 () Bool)

(assert (=> bs!19474 m!626629))

(assert (=> b!652812 d!92367))

(declare-fun d!92369 () Bool)

(declare-fun e!374855 () Bool)

(assert (=> d!92369 e!374855))

(declare-fun res!423502 () Bool)

(assert (=> d!92369 (=> (not res!423502) (not e!374855))))

(assert (=> d!92369 (= res!423502 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18869 a!2986))))))

(declare-fun lt!303955 () Unit!22305)

(declare-fun choose!41 (array!38610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12453) Unit!22305)

(assert (=> d!92369 (= lt!303955 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12450))))

(assert (=> d!92369 (bvslt (size!18869 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92369 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12450) lt!303955)))

(declare-fun b!653021 () Bool)

(assert (=> b!653021 (= e!374855 (arrayNoDuplicates!0 (array!38611 (store (arr!18505 a!2986) i!1108 k0!1786) (size!18869 a!2986)) #b00000000000000000000000000000000 Nil!12450))))

(assert (= (and d!92369 res!423502) b!653021))

(declare-fun m!626631 () Bool)

(assert (=> d!92369 m!626631))

(assert (=> b!653021 m!626381))

(declare-fun m!626633 () Bool)

(assert (=> b!653021 m!626633))

(assert (=> b!652812 d!92369))

(declare-fun d!92373 () Bool)

(declare-fun res!423503 () Bool)

(declare-fun e!374856 () Bool)

(assert (=> d!92373 (=> res!423503 e!374856)))

(assert (=> d!92373 (= res!423503 (= (select (arr!18505 lt!303815) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18505 a!2986) j!136)))))

(assert (=> d!92373 (= (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!374856)))

(declare-fun b!653022 () Bool)

(declare-fun e!374857 () Bool)

(assert (=> b!653022 (= e!374856 e!374857)))

(declare-fun res!423504 () Bool)

(assert (=> b!653022 (=> (not res!423504) (not e!374857))))

(assert (=> b!653022 (= res!423504 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18869 lt!303815)))))

(declare-fun b!653023 () Bool)

(assert (=> b!653023 (= e!374857 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92373 (not res!423503)) b!653022))

(assert (= (and b!653022 res!423504) b!653023))

(declare-fun m!626635 () Bool)

(assert (=> d!92373 m!626635))

(assert (=> b!653023 m!626379))

(declare-fun m!626637 () Bool)

(assert (=> b!653023 m!626637))

(assert (=> b!652812 d!92373))

(declare-fun d!92375 () Bool)

(declare-fun lt!303958 () (_ BitVec 32))

(assert (=> d!92375 (and (bvsge lt!303958 #b00000000000000000000000000000000) (bvslt lt!303958 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92375 (= lt!303958 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!92375 (validMask!0 mask!3053)))

(assert (=> d!92375 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!303958)))

(declare-fun bs!19475 () Bool)

(assert (= bs!19475 d!92375))

(declare-fun m!626639 () Bool)

(assert (=> bs!19475 m!626639))

(assert (=> bs!19475 m!626409))

(assert (=> b!652799 d!92375))

(declare-fun b!653034 () Bool)

(declare-fun e!374867 () SeekEntryResult!6901)

(assert (=> b!653034 (= e!374867 Undefined!6901)))

(declare-fun b!653035 () Bool)

(declare-fun e!374868 () SeekEntryResult!6901)

(assert (=> b!653035 (= e!374868 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303825 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!303826 lt!303815 mask!3053))))

(declare-fun b!653036 () Bool)

(declare-fun c!75130 () Bool)

(declare-fun lt!303960 () (_ BitVec 64))

(assert (=> b!653036 (= c!75130 (= lt!303960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374866 () SeekEntryResult!6901)

(assert (=> b!653036 (= e!374866 e!374868)))

(declare-fun b!653037 () Bool)

(assert (=> b!653037 (= e!374868 (MissingVacant!6901 vacantSpotIndex!68))))

(declare-fun b!653038 () Bool)

(assert (=> b!653038 (= e!374867 e!374866)))

(declare-fun c!75132 () Bool)

(assert (=> b!653038 (= c!75132 (= lt!303960 lt!303826))))

(declare-fun b!653039 () Bool)

(assert (=> b!653039 (= e!374866 (Found!6901 lt!303825))))

(declare-fun d!92379 () Bool)

(declare-fun lt!303959 () SeekEntryResult!6901)

(assert (=> d!92379 (and (or ((_ is Undefined!6901) lt!303959) (not ((_ is Found!6901) lt!303959)) (and (bvsge (index!29958 lt!303959) #b00000000000000000000000000000000) (bvslt (index!29958 lt!303959) (size!18869 lt!303815)))) (or ((_ is Undefined!6901) lt!303959) ((_ is Found!6901) lt!303959) (not ((_ is MissingVacant!6901) lt!303959)) (not (= (index!29960 lt!303959) vacantSpotIndex!68)) (and (bvsge (index!29960 lt!303959) #b00000000000000000000000000000000) (bvslt (index!29960 lt!303959) (size!18869 lt!303815)))) (or ((_ is Undefined!6901) lt!303959) (ite ((_ is Found!6901) lt!303959) (= (select (arr!18505 lt!303815) (index!29958 lt!303959)) lt!303826) (and ((_ is MissingVacant!6901) lt!303959) (= (index!29960 lt!303959) vacantSpotIndex!68) (= (select (arr!18505 lt!303815) (index!29960 lt!303959)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92379 (= lt!303959 e!374867)))

(declare-fun c!75131 () Bool)

(assert (=> d!92379 (= c!75131 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92379 (= lt!303960 (select (arr!18505 lt!303815) lt!303825))))

(assert (=> d!92379 (validMask!0 mask!3053)))

(assert (=> d!92379 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 lt!303826 lt!303815 mask!3053) lt!303959)))

(assert (= (and d!92379 c!75131) b!653034))

(assert (= (and d!92379 (not c!75131)) b!653038))

(assert (= (and b!653038 c!75132) b!653039))

(assert (= (and b!653038 (not c!75132)) b!653036))

(assert (= (and b!653036 c!75130) b!653037))

(assert (= (and b!653036 (not c!75130)) b!653035))

(declare-fun m!626641 () Bool)

(assert (=> b!653035 m!626641))

(assert (=> b!653035 m!626641))

(declare-fun m!626643 () Bool)

(assert (=> b!653035 m!626643))

(declare-fun m!626645 () Bool)

(assert (=> d!92379 m!626645))

(declare-fun m!626647 () Bool)

(assert (=> d!92379 m!626647))

(declare-fun m!626649 () Bool)

(assert (=> d!92379 m!626649))

(assert (=> d!92379 m!626409))

(assert (=> b!652799 d!92379))

(declare-fun b!653040 () Bool)

(declare-fun e!374870 () SeekEntryResult!6901)

(assert (=> b!653040 (= e!374870 Undefined!6901)))

(declare-fun e!374871 () SeekEntryResult!6901)

(declare-fun b!653041 () Bool)

(assert (=> b!653041 (= e!374871 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303825 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653042 () Bool)

(declare-fun c!75133 () Bool)

(declare-fun lt!303962 () (_ BitVec 64))

(assert (=> b!653042 (= c!75133 (= lt!303962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374869 () SeekEntryResult!6901)

(assert (=> b!653042 (= e!374869 e!374871)))

(declare-fun b!653043 () Bool)

(assert (=> b!653043 (= e!374871 (MissingVacant!6901 vacantSpotIndex!68))))

(declare-fun b!653044 () Bool)

(assert (=> b!653044 (= e!374870 e!374869)))

(declare-fun c!75135 () Bool)

(assert (=> b!653044 (= c!75135 (= lt!303962 (select (arr!18505 a!2986) j!136)))))

(declare-fun b!653045 () Bool)

(assert (=> b!653045 (= e!374869 (Found!6901 lt!303825))))

(declare-fun d!92381 () Bool)

(declare-fun lt!303961 () SeekEntryResult!6901)

(assert (=> d!92381 (and (or ((_ is Undefined!6901) lt!303961) (not ((_ is Found!6901) lt!303961)) (and (bvsge (index!29958 lt!303961) #b00000000000000000000000000000000) (bvslt (index!29958 lt!303961) (size!18869 a!2986)))) (or ((_ is Undefined!6901) lt!303961) ((_ is Found!6901) lt!303961) (not ((_ is MissingVacant!6901) lt!303961)) (not (= (index!29960 lt!303961) vacantSpotIndex!68)) (and (bvsge (index!29960 lt!303961) #b00000000000000000000000000000000) (bvslt (index!29960 lt!303961) (size!18869 a!2986)))) (or ((_ is Undefined!6901) lt!303961) (ite ((_ is Found!6901) lt!303961) (= (select (arr!18505 a!2986) (index!29958 lt!303961)) (select (arr!18505 a!2986) j!136)) (and ((_ is MissingVacant!6901) lt!303961) (= (index!29960 lt!303961) vacantSpotIndex!68) (= (select (arr!18505 a!2986) (index!29960 lt!303961)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92381 (= lt!303961 e!374870)))

(declare-fun c!75134 () Bool)

(assert (=> d!92381 (= c!75134 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92381 (= lt!303962 (select (arr!18505 a!2986) lt!303825))))

(assert (=> d!92381 (validMask!0 mask!3053)))

(assert (=> d!92381 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053) lt!303961)))

(assert (= (and d!92381 c!75134) b!653040))

(assert (= (and d!92381 (not c!75134)) b!653044))

(assert (= (and b!653044 c!75135) b!653045))

(assert (= (and b!653044 (not c!75135)) b!653042))

(assert (= (and b!653042 c!75133) b!653043))

(assert (= (and b!653042 (not c!75133)) b!653041))

(assert (=> b!653041 m!626641))

(assert (=> b!653041 m!626641))

(assert (=> b!653041 m!626379))

(declare-fun m!626651 () Bool)

(assert (=> b!653041 m!626651))

(declare-fun m!626653 () Bool)

(assert (=> d!92381 m!626653))

(declare-fun m!626655 () Bool)

(assert (=> d!92381 m!626655))

(declare-fun m!626657 () Bool)

(assert (=> d!92381 m!626657))

(assert (=> d!92381 m!626409))

(assert (=> b!652799 d!92381))

(declare-fun b!653056 () Bool)

(declare-fun e!374881 () SeekEntryResult!6901)

(assert (=> b!653056 (= e!374881 Undefined!6901)))

(declare-fun b!653057 () Bool)

(declare-fun e!374882 () SeekEntryResult!6901)

(assert (=> b!653057 (= e!374882 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!303826 lt!303815 mask!3053))))

(declare-fun b!653058 () Bool)

(declare-fun c!75138 () Bool)

(declare-fun lt!303964 () (_ BitVec 64))

(assert (=> b!653058 (= c!75138 (= lt!303964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374880 () SeekEntryResult!6901)

(assert (=> b!653058 (= e!374880 e!374882)))

(declare-fun b!653059 () Bool)

(assert (=> b!653059 (= e!374882 (MissingVacant!6901 vacantSpotIndex!68))))

(declare-fun b!653060 () Bool)

(assert (=> b!653060 (= e!374881 e!374880)))

(declare-fun c!75140 () Bool)

(assert (=> b!653060 (= c!75140 (= lt!303964 lt!303826))))

(declare-fun b!653061 () Bool)

(assert (=> b!653061 (= e!374880 (Found!6901 index!984))))

(declare-fun d!92383 () Bool)

(declare-fun lt!303963 () SeekEntryResult!6901)

(assert (=> d!92383 (and (or ((_ is Undefined!6901) lt!303963) (not ((_ is Found!6901) lt!303963)) (and (bvsge (index!29958 lt!303963) #b00000000000000000000000000000000) (bvslt (index!29958 lt!303963) (size!18869 lt!303815)))) (or ((_ is Undefined!6901) lt!303963) ((_ is Found!6901) lt!303963) (not ((_ is MissingVacant!6901) lt!303963)) (not (= (index!29960 lt!303963) vacantSpotIndex!68)) (and (bvsge (index!29960 lt!303963) #b00000000000000000000000000000000) (bvslt (index!29960 lt!303963) (size!18869 lt!303815)))) (or ((_ is Undefined!6901) lt!303963) (ite ((_ is Found!6901) lt!303963) (= (select (arr!18505 lt!303815) (index!29958 lt!303963)) lt!303826) (and ((_ is MissingVacant!6901) lt!303963) (= (index!29960 lt!303963) vacantSpotIndex!68) (= (select (arr!18505 lt!303815) (index!29960 lt!303963)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92383 (= lt!303963 e!374881)))

(declare-fun c!75139 () Bool)

(assert (=> d!92383 (= c!75139 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92383 (= lt!303964 (select (arr!18505 lt!303815) index!984))))

(assert (=> d!92383 (validMask!0 mask!3053)))

(assert (=> d!92383 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303826 lt!303815 mask!3053) lt!303963)))

(assert (= (and d!92383 c!75139) b!653056))

(assert (= (and d!92383 (not c!75139)) b!653060))

(assert (= (and b!653060 c!75140) b!653061))

(assert (= (and b!653060 (not c!75140)) b!653058))

(assert (= (and b!653058 c!75138) b!653059))

(assert (= (and b!653058 (not c!75138)) b!653057))

(assert (=> b!653057 m!626597))

(assert (=> b!653057 m!626597))

(declare-fun m!626659 () Bool)

(assert (=> b!653057 m!626659))

(declare-fun m!626661 () Bool)

(assert (=> d!92383 m!626661))

(declare-fun m!626663 () Bool)

(assert (=> d!92383 m!626663))

(declare-fun m!626665 () Bool)

(assert (=> d!92383 m!626665))

(assert (=> d!92383 m!626409))

(assert (=> b!652799 d!92383))

(declare-fun d!92385 () Bool)

(declare-fun e!374899 () Bool)

(assert (=> d!92385 e!374899))

(declare-fun res!423525 () Bool)

(assert (=> d!92385 (=> (not res!423525) (not e!374899))))

(assert (=> d!92385 (= res!423525 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18869 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18869 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18869 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18869 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18869 a!2986))))))

(declare-fun lt!303971 () Unit!22305)

(declare-fun choose!9 (array!38610 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22305)

(assert (=> d!92385 (= lt!303971 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92385 (validMask!0 mask!3053)))

(assert (=> d!92385 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 mask!3053) lt!303971)))

(declare-fun b!653086 () Bool)

(assert (=> b!653086 (= e!374899 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303825 vacantSpotIndex!68 (select (store (arr!18505 a!2986) i!1108 k0!1786) j!136) (array!38611 (store (arr!18505 a!2986) i!1108 k0!1786) (size!18869 a!2986)) mask!3053)))))

(assert (= (and d!92385 res!423525) b!653086))

(declare-fun m!626683 () Bool)

(assert (=> d!92385 m!626683))

(assert (=> d!92385 m!626409))

(assert (=> b!653086 m!626381))

(assert (=> b!653086 m!626379))

(assert (=> b!653086 m!626395))

(assert (=> b!653086 m!626379))

(assert (=> b!653086 m!626399))

(assert (=> b!653086 m!626395))

(declare-fun m!626685 () Bool)

(assert (=> b!653086 m!626685))

(assert (=> b!652799 d!92385))

(declare-fun d!92391 () Bool)

(declare-fun res!423526 () Bool)

(declare-fun e!374900 () Bool)

(assert (=> d!92391 (=> res!423526 e!374900)))

(assert (=> d!92391 (= res!423526 (= (select (arr!18505 lt!303815) index!984) (select (arr!18505 a!2986) j!136)))))

(assert (=> d!92391 (= (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) index!984) e!374900)))

(declare-fun b!653087 () Bool)

(declare-fun e!374901 () Bool)

(assert (=> b!653087 (= e!374900 e!374901)))

(declare-fun res!423527 () Bool)

(assert (=> b!653087 (=> (not res!423527) (not e!374901))))

(assert (=> b!653087 (= res!423527 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18869 lt!303815)))))

(declare-fun b!653088 () Bool)

(assert (=> b!653088 (= e!374901 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92391 (not res!423526)) b!653087))

(assert (= (and b!653087 res!423527) b!653088))

(assert (=> d!92391 m!626665))

(assert (=> b!653088 m!626379))

(declare-fun m!626687 () Bool)

(assert (=> b!653088 m!626687))

(assert (=> b!652818 d!92391))

(declare-fun b!653155 () Bool)

(declare-fun c!75176 () Bool)

(declare-fun lt!304005 () (_ BitVec 64))

(assert (=> b!653155 (= c!75176 (= lt!304005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374943 () SeekEntryResult!6901)

(declare-fun e!374941 () SeekEntryResult!6901)

(assert (=> b!653155 (= e!374943 e!374941)))

(declare-fun b!653156 () Bool)

(declare-fun lt!304006 () SeekEntryResult!6901)

(assert (=> b!653156 (= e!374941 (MissingZero!6901 (index!29959 lt!304006)))))

(declare-fun d!92393 () Bool)

(declare-fun lt!304004 () SeekEntryResult!6901)

(assert (=> d!92393 (and (or ((_ is Undefined!6901) lt!304004) (not ((_ is Found!6901) lt!304004)) (and (bvsge (index!29958 lt!304004) #b00000000000000000000000000000000) (bvslt (index!29958 lt!304004) (size!18869 a!2986)))) (or ((_ is Undefined!6901) lt!304004) ((_ is Found!6901) lt!304004) (not ((_ is MissingZero!6901) lt!304004)) (and (bvsge (index!29957 lt!304004) #b00000000000000000000000000000000) (bvslt (index!29957 lt!304004) (size!18869 a!2986)))) (or ((_ is Undefined!6901) lt!304004) ((_ is Found!6901) lt!304004) ((_ is MissingZero!6901) lt!304004) (not ((_ is MissingVacant!6901) lt!304004)) (and (bvsge (index!29960 lt!304004) #b00000000000000000000000000000000) (bvslt (index!29960 lt!304004) (size!18869 a!2986)))) (or ((_ is Undefined!6901) lt!304004) (ite ((_ is Found!6901) lt!304004) (= (select (arr!18505 a!2986) (index!29958 lt!304004)) k0!1786) (ite ((_ is MissingZero!6901) lt!304004) (= (select (arr!18505 a!2986) (index!29957 lt!304004)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6901) lt!304004) (= (select (arr!18505 a!2986) (index!29960 lt!304004)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!374942 () SeekEntryResult!6901)

(assert (=> d!92393 (= lt!304004 e!374942)))

(declare-fun c!75177 () Bool)

(assert (=> d!92393 (= c!75177 (and ((_ is Intermediate!6901) lt!304006) (undefined!7713 lt!304006)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38610 (_ BitVec 32)) SeekEntryResult!6901)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92393 (= lt!304006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92393 (validMask!0 mask!3053)))

(assert (=> d!92393 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!304004)))

(declare-fun b!653157 () Bool)

(assert (=> b!653157 (= e!374943 (Found!6901 (index!29959 lt!304006)))))

(declare-fun b!653158 () Bool)

(assert (=> b!653158 (= e!374942 e!374943)))

(assert (=> b!653158 (= lt!304005 (select (arr!18505 a!2986) (index!29959 lt!304006)))))

(declare-fun c!75178 () Bool)

(assert (=> b!653158 (= c!75178 (= lt!304005 k0!1786))))

(declare-fun b!653159 () Bool)

(assert (=> b!653159 (= e!374942 Undefined!6901)))

(declare-fun b!653160 () Bool)

(assert (=> b!653160 (= e!374941 (seekKeyOrZeroReturnVacant!0 (x!58895 lt!304006) (index!29959 lt!304006) (index!29959 lt!304006) k0!1786 a!2986 mask!3053))))

(assert (= (and d!92393 c!75177) b!653159))

(assert (= (and d!92393 (not c!75177)) b!653158))

(assert (= (and b!653158 c!75178) b!653157))

(assert (= (and b!653158 (not c!75178)) b!653155))

(assert (= (and b!653155 c!75176) b!653156))

(assert (= (and b!653155 (not c!75176)) b!653160))

(assert (=> d!92393 m!626409))

(declare-fun m!626719 () Bool)

(assert (=> d!92393 m!626719))

(declare-fun m!626721 () Bool)

(assert (=> d!92393 m!626721))

(declare-fun m!626723 () Bool)

(assert (=> d!92393 m!626723))

(declare-fun m!626725 () Bool)

(assert (=> d!92393 m!626725))

(declare-fun m!626727 () Bool)

(assert (=> d!92393 m!626727))

(assert (=> d!92393 m!626725))

(declare-fun m!626729 () Bool)

(assert (=> b!653158 m!626729))

(declare-fun m!626731 () Bool)

(assert (=> b!653160 m!626731))

(assert (=> b!652819 d!92393))

(assert (=> b!652808 d!92391))

(assert (=> b!652817 d!92361))

(declare-fun d!92405 () Bool)

(assert (=> d!92405 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304009 () Unit!22305)

(assert (=> d!92405 (= lt!304009 (choose!114 lt!303815 (select (arr!18505 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92405 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92405 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303815 (select (arr!18505 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!304009)))

(declare-fun bs!19477 () Bool)

(assert (= bs!19477 d!92405))

(assert (=> bs!19477 m!626379))

(assert (=> bs!19477 m!626415))

(assert (=> bs!19477 m!626379))

(declare-fun m!626733 () Bool)

(assert (=> bs!19477 m!626733))

(assert (=> b!652817 d!92405))

(declare-fun d!92407 () Bool)

(declare-fun res!423540 () Bool)

(declare-fun e!374944 () Bool)

(assert (=> d!92407 (=> res!423540 e!374944)))

(assert (=> d!92407 (= res!423540 (= (select (arr!18505 lt!303815) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18505 a!2986) j!136)))))

(assert (=> d!92407 (= (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!374944)))

(declare-fun b!653161 () Bool)

(declare-fun e!374945 () Bool)

(assert (=> b!653161 (= e!374944 e!374945)))

(declare-fun res!423541 () Bool)

(assert (=> b!653161 (=> (not res!423541) (not e!374945))))

(assert (=> b!653161 (= res!423541 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18869 lt!303815)))))

(declare-fun b!653162 () Bool)

(assert (=> b!653162 (= e!374945 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92407 (not res!423540)) b!653161))

(assert (= (and b!653161 res!423541) b!653162))

(declare-fun m!626735 () Bool)

(assert (=> d!92407 m!626735))

(assert (=> b!653162 m!626379))

(declare-fun m!626739 () Bool)

(assert (=> b!653162 m!626739))

(assert (=> b!652817 d!92407))

(declare-fun d!92411 () Bool)

(declare-fun res!423545 () Bool)

(declare-fun e!374950 () Bool)

(assert (=> d!92411 (=> res!423545 e!374950)))

(assert (=> d!92411 (= res!423545 (= (select (arr!18505 lt!303815) j!136) (select (arr!18505 a!2986) j!136)))))

(assert (=> d!92411 (= (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) j!136) e!374950)))

(declare-fun b!653168 () Bool)

(declare-fun e!374951 () Bool)

(assert (=> b!653168 (= e!374950 e!374951)))

(declare-fun res!423546 () Bool)

(assert (=> b!653168 (=> (not res!423546) (not e!374951))))

(assert (=> b!653168 (= res!423546 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18869 lt!303815)))))

(declare-fun b!653169 () Bool)

(assert (=> b!653169 (= e!374951 (arrayContainsKey!0 lt!303815 (select (arr!18505 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92411 (not res!423545)) b!653168))

(assert (= (and b!653168 res!423546) b!653169))

(assert (=> d!92411 m!626621))

(assert (=> b!653169 m!626379))

(declare-fun m!626741 () Bool)

(assert (=> b!653169 m!626741))

(assert (=> b!652817 d!92411))

(declare-fun d!92413 () Bool)

(assert (=> d!92413 (arrayNoDuplicates!0 lt!303815 index!984 Nil!12450)))

(declare-fun lt!304011 () Unit!22305)

(assert (=> d!92413 (= lt!304011 (choose!39 lt!303815 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92413 (bvslt (size!18869 lt!303815) #b01111111111111111111111111111111)))

(assert (=> d!92413 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303815 #b00000000000000000000000000000000 index!984) lt!304011)))

(declare-fun bs!19479 () Bool)

(assert (= bs!19479 d!92413))

(assert (=> bs!19479 m!626421))

(declare-fun m!626747 () Bool)

(assert (=> bs!19479 m!626747))

(assert (=> b!652817 d!92413))

(assert (=> b!652817 d!92369))

(declare-fun b!653176 () Bool)

(declare-fun e!374956 () Bool)

(assert (=> b!653176 (= e!374956 (contains!3157 Nil!12450 (select (arr!18505 lt!303815) index!984)))))

(declare-fun b!653177 () Bool)

(declare-fun e!374955 () Bool)

(declare-fun e!374957 () Bool)

(assert (=> b!653177 (= e!374955 e!374957)))

(declare-fun res!423548 () Bool)

(assert (=> b!653177 (=> (not res!423548) (not e!374957))))

(assert (=> b!653177 (= res!423548 (not e!374956))))

(declare-fun res!423547 () Bool)

(assert (=> b!653177 (=> (not res!423547) (not e!374956))))

(assert (=> b!653177 (= res!423547 (validKeyInArray!0 (select (arr!18505 lt!303815) index!984)))))

(declare-fun d!92415 () Bool)

(declare-fun res!423549 () Bool)

(assert (=> d!92415 (=> res!423549 e!374955)))

(assert (=> d!92415 (= res!423549 (bvsge index!984 (size!18869 lt!303815)))))

(assert (=> d!92415 (= (arrayNoDuplicates!0 lt!303815 index!984 Nil!12450) e!374955)))

(declare-fun b!653178 () Bool)

(declare-fun e!374958 () Bool)

(declare-fun call!33802 () Bool)

(assert (=> b!653178 (= e!374958 call!33802)))

(declare-fun b!653179 () Bool)

(assert (=> b!653179 (= e!374957 e!374958)))

(declare-fun c!75183 () Bool)

(assert (=> b!653179 (= c!75183 (validKeyInArray!0 (select (arr!18505 lt!303815) index!984)))))

(declare-fun b!653180 () Bool)

(assert (=> b!653180 (= e!374958 call!33802)))

(declare-fun bm!33799 () Bool)

(assert (=> bm!33799 (= call!33802 (arrayNoDuplicates!0 lt!303815 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75183 (Cons!12449 (select (arr!18505 lt!303815) index!984) Nil!12450) Nil!12450)))))

(assert (= (and d!92415 (not res!423549)) b!653177))

(assert (= (and b!653177 res!423547) b!653176))

(assert (= (and b!653177 res!423548) b!653179))

(assert (= (and b!653179 c!75183) b!653178))

(assert (= (and b!653179 (not c!75183)) b!653180))

(assert (= (or b!653178 b!653180) bm!33799))

(assert (=> b!653176 m!626665))

(assert (=> b!653176 m!626665))

(declare-fun m!626753 () Bool)

(assert (=> b!653176 m!626753))

(assert (=> b!653177 m!626665))

(assert (=> b!653177 m!626665))

(declare-fun m!626759 () Bool)

(assert (=> b!653177 m!626759))

(assert (=> b!653179 m!626665))

(assert (=> b!653179 m!626665))

(assert (=> b!653179 m!626759))

(assert (=> bm!33799 m!626665))

(declare-fun m!626769 () Bool)

(assert (=> bm!33799 m!626769))

(assert (=> b!652817 d!92415))

(assert (=> b!652807 d!92411))

(declare-fun b!653211 () Bool)

(declare-fun e!374982 () Bool)

(declare-fun call!33806 () Bool)

(assert (=> b!653211 (= e!374982 call!33806)))

(declare-fun b!653212 () Bool)

(declare-fun e!374981 () Bool)

(declare-fun e!374980 () Bool)

(assert (=> b!653212 (= e!374981 e!374980)))

(declare-fun c!75193 () Bool)

(assert (=> b!653212 (= c!75193 (validKeyInArray!0 (select (arr!18505 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33803 () Bool)

(assert (=> bm!33803 (= call!33806 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!653213 () Bool)

(assert (=> b!653213 (= e!374980 e!374982)))

(declare-fun lt!304028 () (_ BitVec 64))

(assert (=> b!653213 (= lt!304028 (select (arr!18505 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!304030 () Unit!22305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38610 (_ BitVec 64) (_ BitVec 32)) Unit!22305)

(assert (=> b!653213 (= lt!304030 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!304028 #b00000000000000000000000000000000))))

(assert (=> b!653213 (arrayContainsKey!0 a!2986 lt!304028 #b00000000000000000000000000000000)))

(declare-fun lt!304029 () Unit!22305)

(assert (=> b!653213 (= lt!304029 lt!304030)))

(declare-fun res!423563 () Bool)

(assert (=> b!653213 (= res!423563 (= (seekEntryOrOpen!0 (select (arr!18505 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6901 #b00000000000000000000000000000000)))))

(assert (=> b!653213 (=> (not res!423563) (not e!374982))))

(declare-fun b!653214 () Bool)

(assert (=> b!653214 (= e!374980 call!33806)))

(declare-fun d!92419 () Bool)

(declare-fun res!423562 () Bool)

(assert (=> d!92419 (=> res!423562 e!374981)))

(assert (=> d!92419 (= res!423562 (bvsge #b00000000000000000000000000000000 (size!18869 a!2986)))))

(assert (=> d!92419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!374981)))

(assert (= (and d!92419 (not res!423562)) b!653212))

(assert (= (and b!653212 c!75193) b!653213))

(assert (= (and b!653212 (not c!75193)) b!653214))

(assert (= (and b!653213 res!423563) b!653211))

(assert (= (or b!653211 b!653214) bm!33803))

(assert (=> b!653212 m!626587))

(assert (=> b!653212 m!626587))

(assert (=> b!653212 m!626591))

(declare-fun m!626807 () Bool)

(assert (=> bm!33803 m!626807))

(assert (=> b!653213 m!626587))

(declare-fun m!626809 () Bool)

(assert (=> b!653213 m!626809))

(declare-fun m!626811 () Bool)

(assert (=> b!653213 m!626811))

(assert (=> b!653213 m!626587))

(declare-fun m!626813 () Bool)

(assert (=> b!653213 m!626813))

(assert (=> b!652796 d!92419))

(check-sat (not d!92375) (not bm!33803) (not b!653041) (not b!653088) (not b!653176) (not b!652998) (not b!653008) (not b!653009) (not d!92381) (not b!653057) (not b!652975) (not b!653086) (not bm!33787) (not d!92383) (not d!92367) (not b!653177) (not d!92405) (not b!653017) (not bm!33799) (not d!92393) (not b!653035) (not b!653010) (not d!92413) (not d!92369) (not b!653213) (not d!92347) (not bm!33786) (not d!92385) (not b!653160) (not b!653023) (not b!652984) (not b!653007) (not b!653015) (not b!653012) (not d!92359) (not bm!33788) (not b!653162) (not b!652974) (not b!653179) (not d!92363) (not b!653169) (not b!652977) (not b!653014) (not d!92379) (not b!653021) (not b!653212))
(check-sat)
