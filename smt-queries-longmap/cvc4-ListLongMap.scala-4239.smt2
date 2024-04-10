; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58542 () Bool)

(assert start!58542)

(declare-fun b!646322 () Bool)

(declare-fun res!418763 () Bool)

(declare-fun e!370472 () Bool)

(assert (=> b!646322 (=> (not res!418763) (not e!370472))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38477 0))(
  ( (array!38478 (arr!18449 (Array (_ BitVec 32) (_ BitVec 64))) (size!18813 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38477)

(assert (=> b!646322 (= res!418763 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18449 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646323 () Bool)

(declare-datatypes ((Unit!21960 0))(
  ( (Unit!21961) )
))
(declare-fun e!370474 () Unit!21960)

(declare-fun Unit!21962 () Unit!21960)

(assert (=> b!646323 (= e!370474 Unit!21962)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299834 () array!38477)

(declare-fun lt!299827 () Unit!21960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38477 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21960)

(assert (=> b!646323 (= lt!299827 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299834 (select (arr!18449 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646323 (arrayContainsKey!0 lt!299834 (select (arr!18449 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!299825 () Unit!21960)

(declare-datatypes ((List!12490 0))(
  ( (Nil!12487) (Cons!12486 (h!13531 (_ BitVec 64)) (t!18718 List!12490)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38477 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12490) Unit!21960)

(assert (=> b!646323 (= lt!299825 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12487))))

(declare-fun arrayNoDuplicates!0 (array!38477 (_ BitVec 32) List!12490) Bool)

(assert (=> b!646323 (arrayNoDuplicates!0 lt!299834 #b00000000000000000000000000000000 Nil!12487)))

(declare-fun lt!299828 () Unit!21960)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38477 (_ BitVec 32) (_ BitVec 32)) Unit!21960)

(assert (=> b!646323 (= lt!299828 (lemmaNoDuplicateFromThenFromBigger!0 lt!299834 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646323 (arrayNoDuplicates!0 lt!299834 j!136 Nil!12487)))

(declare-fun lt!299835 () Unit!21960)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38477 (_ BitVec 64) (_ BitVec 32) List!12490) Unit!21960)

(assert (=> b!646323 (= lt!299835 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299834 (select (arr!18449 a!2986) j!136) j!136 Nil!12487))))

(assert (=> b!646323 false))

(declare-fun b!646324 () Bool)

(declare-fun res!418771 () Bool)

(declare-fun e!370480 () Bool)

(assert (=> b!646324 (=> (not res!418771) (not e!370480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646324 (= res!418771 (validKeyInArray!0 (select (arr!18449 a!2986) j!136)))))

(declare-fun b!646325 () Bool)

(declare-fun e!370484 () Unit!21960)

(declare-fun Unit!21963 () Unit!21960)

(assert (=> b!646325 (= e!370484 Unit!21963)))

(assert (=> b!646325 false))

(declare-fun b!646326 () Bool)

(declare-fun Unit!21964 () Unit!21960)

(assert (=> b!646326 (= e!370474 Unit!21964)))

(declare-fun b!646327 () Bool)

(declare-fun res!418773 () Bool)

(assert (=> b!646327 (=> (not res!418773) (not e!370480))))

(assert (=> b!646327 (= res!418773 (validKeyInArray!0 k!1786))))

(declare-fun b!646328 () Bool)

(declare-fun e!370476 () Bool)

(declare-fun e!370475 () Bool)

(assert (=> b!646328 (= e!370476 (not e!370475))))

(declare-fun res!418772 () Bool)

(assert (=> b!646328 (=> res!418772 e!370475)))

(declare-datatypes ((SeekEntryResult!6889 0))(
  ( (MissingZero!6889 (index!29894 (_ BitVec 32))) (Found!6889 (index!29895 (_ BitVec 32))) (Intermediate!6889 (undefined!7701 Bool) (index!29896 (_ BitVec 32)) (x!58667 (_ BitVec 32))) (Undefined!6889) (MissingVacant!6889 (index!29897 (_ BitVec 32))) )
))
(declare-fun lt!299824 () SeekEntryResult!6889)

(assert (=> b!646328 (= res!418772 (not (= lt!299824 (Found!6889 index!984))))))

(declare-fun lt!299833 () Unit!21960)

(assert (=> b!646328 (= lt!299833 e!370484)))

(declare-fun c!74150 () Bool)

(assert (=> b!646328 (= c!74150 (= lt!299824 Undefined!6889))))

(declare-fun lt!299831 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38477 (_ BitVec 32)) SeekEntryResult!6889)

(assert (=> b!646328 (= lt!299824 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299831 lt!299834 mask!3053))))

(declare-fun e!370481 () Bool)

(assert (=> b!646328 e!370481))

(declare-fun res!418767 () Bool)

(assert (=> b!646328 (=> (not res!418767) (not e!370481))))

(declare-fun lt!299839 () SeekEntryResult!6889)

(declare-fun lt!299829 () (_ BitVec 32))

(assert (=> b!646328 (= res!418767 (= lt!299839 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299829 vacantSpotIndex!68 lt!299831 lt!299834 mask!3053)))))

(assert (=> b!646328 (= lt!299839 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299829 vacantSpotIndex!68 (select (arr!18449 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646328 (= lt!299831 (select (store (arr!18449 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299826 () Unit!21960)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38477 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21960)

(assert (=> b!646328 (= lt!299826 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299829 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646328 (= lt!299829 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646329 () Bool)

(declare-fun e!370477 () Bool)

(assert (=> b!646329 (= e!370477 true)))

(assert (=> b!646329 (arrayContainsKey!0 lt!299834 (select (arr!18449 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299830 () Unit!21960)

(assert (=> b!646329 (= lt!299830 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299834 (select (arr!18449 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370473 () Bool)

(assert (=> b!646329 e!370473))

(declare-fun res!418758 () Bool)

(assert (=> b!646329 (=> (not res!418758) (not e!370473))))

(assert (=> b!646329 (= res!418758 (arrayContainsKey!0 lt!299834 (select (arr!18449 a!2986) j!136) j!136))))

(declare-fun b!646330 () Bool)

(declare-fun res!418764 () Bool)

(assert (=> b!646330 (=> (not res!418764) (not e!370472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38477 (_ BitVec 32)) Bool)

(assert (=> b!646330 (= res!418764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646331 () Bool)

(declare-fun e!370471 () Bool)

(assert (=> b!646331 (= e!370471 e!370476)))

(declare-fun res!418769 () Bool)

(assert (=> b!646331 (=> (not res!418769) (not e!370476))))

(declare-fun lt!299836 () SeekEntryResult!6889)

(assert (=> b!646331 (= res!418769 (and (= lt!299836 (Found!6889 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18449 a!2986) index!984) (select (arr!18449 a!2986) j!136))) (not (= (select (arr!18449 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646331 (= lt!299836 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18449 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646332 () Bool)

(declare-fun e!370478 () Bool)

(assert (=> b!646332 (= e!370478 e!370477)))

(declare-fun res!418757 () Bool)

(assert (=> b!646332 (=> res!418757 e!370477)))

(assert (=> b!646332 (= res!418757 (bvsge index!984 j!136))))

(declare-fun lt!299838 () Unit!21960)

(assert (=> b!646332 (= lt!299838 e!370474)))

(declare-fun c!74149 () Bool)

(assert (=> b!646332 (= c!74149 (bvslt j!136 index!984))))

(declare-fun b!646333 () Bool)

(declare-fun res!418766 () Bool)

(assert (=> b!646333 (=> (not res!418766) (not e!370472))))

(assert (=> b!646333 (= res!418766 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12487))))

(declare-fun b!646334 () Bool)

(declare-fun res!418765 () Bool)

(assert (=> b!646334 (=> (not res!418765) (not e!370480))))

(assert (=> b!646334 (= res!418765 (and (= (size!18813 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18813 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18813 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646335 () Bool)

(declare-fun e!370485 () Bool)

(declare-fun e!370482 () Bool)

(assert (=> b!646335 (= e!370485 e!370482)))

(declare-fun res!418760 () Bool)

(assert (=> b!646335 (=> res!418760 e!370482)))

(declare-fun lt!299837 () (_ BitVec 64))

(assert (=> b!646335 (= res!418760 (or (not (= (select (arr!18449 a!2986) j!136) lt!299831)) (not (= (select (arr!18449 a!2986) j!136) lt!299837)) (bvsge j!136 index!984)))))

(declare-fun b!646336 () Bool)

(assert (=> b!646336 (= e!370472 e!370471)))

(declare-fun res!418770 () Bool)

(assert (=> b!646336 (=> (not res!418770) (not e!370471))))

(assert (=> b!646336 (= res!418770 (= (select (store (arr!18449 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646336 (= lt!299834 (array!38478 (store (arr!18449 a!2986) i!1108 k!1786) (size!18813 a!2986)))))

(declare-fun res!418761 () Bool)

(assert (=> start!58542 (=> (not res!418761) (not e!370480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58542 (= res!418761 (validMask!0 mask!3053))))

(assert (=> start!58542 e!370480))

(assert (=> start!58542 true))

(declare-fun array_inv!14245 (array!38477) Bool)

(assert (=> start!58542 (array_inv!14245 a!2986)))

(declare-fun b!646321 () Bool)

(declare-fun Unit!21965 () Unit!21960)

(assert (=> b!646321 (= e!370484 Unit!21965)))

(declare-fun b!646337 () Bool)

(assert (=> b!646337 (= e!370473 (arrayContainsKey!0 lt!299834 (select (arr!18449 a!2986) j!136) index!984))))

(declare-fun b!646338 () Bool)

(assert (=> b!646338 (= e!370481 (= lt!299836 lt!299839))))

(declare-fun b!646339 () Bool)

(declare-fun res!418774 () Bool)

(assert (=> b!646339 (=> (not res!418774) (not e!370480))))

(assert (=> b!646339 (= res!418774 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646340 () Bool)

(declare-fun e!370479 () Bool)

(assert (=> b!646340 (= e!370479 (arrayContainsKey!0 lt!299834 (select (arr!18449 a!2986) j!136) index!984))))

(declare-fun b!646341 () Bool)

(assert (=> b!646341 (= e!370480 e!370472)))

(declare-fun res!418759 () Bool)

(assert (=> b!646341 (=> (not res!418759) (not e!370472))))

(declare-fun lt!299832 () SeekEntryResult!6889)

(assert (=> b!646341 (= res!418759 (or (= lt!299832 (MissingZero!6889 i!1108)) (= lt!299832 (MissingVacant!6889 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38477 (_ BitVec 32)) SeekEntryResult!6889)

(assert (=> b!646341 (= lt!299832 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!646342 () Bool)

(assert (=> b!646342 (= e!370475 e!370478)))

(declare-fun res!418762 () Bool)

(assert (=> b!646342 (=> res!418762 e!370478)))

(assert (=> b!646342 (= res!418762 (or (not (= (select (arr!18449 a!2986) j!136) lt!299831)) (not (= (select (arr!18449 a!2986) j!136) lt!299837))))))

(assert (=> b!646342 e!370485))

(declare-fun res!418775 () Bool)

(assert (=> b!646342 (=> (not res!418775) (not e!370485))))

(assert (=> b!646342 (= res!418775 (= lt!299837 (select (arr!18449 a!2986) j!136)))))

(assert (=> b!646342 (= lt!299837 (select (store (arr!18449 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!646343 () Bool)

(assert (=> b!646343 (= e!370482 e!370479)))

(declare-fun res!418768 () Bool)

(assert (=> b!646343 (=> (not res!418768) (not e!370479))))

(assert (=> b!646343 (= res!418768 (arrayContainsKey!0 lt!299834 (select (arr!18449 a!2986) j!136) j!136))))

(assert (= (and start!58542 res!418761) b!646334))

(assert (= (and b!646334 res!418765) b!646324))

(assert (= (and b!646324 res!418771) b!646327))

(assert (= (and b!646327 res!418773) b!646339))

(assert (= (and b!646339 res!418774) b!646341))

(assert (= (and b!646341 res!418759) b!646330))

(assert (= (and b!646330 res!418764) b!646333))

(assert (= (and b!646333 res!418766) b!646322))

(assert (= (and b!646322 res!418763) b!646336))

(assert (= (and b!646336 res!418770) b!646331))

(assert (= (and b!646331 res!418769) b!646328))

(assert (= (and b!646328 res!418767) b!646338))

(assert (= (and b!646328 c!74150) b!646325))

(assert (= (and b!646328 (not c!74150)) b!646321))

(assert (= (and b!646328 (not res!418772)) b!646342))

(assert (= (and b!646342 res!418775) b!646335))

(assert (= (and b!646335 (not res!418760)) b!646343))

(assert (= (and b!646343 res!418768) b!646340))

(assert (= (and b!646342 (not res!418762)) b!646332))

(assert (= (and b!646332 c!74149) b!646323))

(assert (= (and b!646332 (not c!74149)) b!646326))

(assert (= (and b!646332 (not res!418757)) b!646329))

(assert (= (and b!646329 res!418758) b!646337))

(declare-fun m!619795 () Bool)

(assert (=> b!646323 m!619795))

(declare-fun m!619797 () Bool)

(assert (=> b!646323 m!619797))

(assert (=> b!646323 m!619795))

(declare-fun m!619799 () Bool)

(assert (=> b!646323 m!619799))

(assert (=> b!646323 m!619795))

(declare-fun m!619801 () Bool)

(assert (=> b!646323 m!619801))

(declare-fun m!619803 () Bool)

(assert (=> b!646323 m!619803))

(assert (=> b!646323 m!619795))

(declare-fun m!619805 () Bool)

(assert (=> b!646323 m!619805))

(declare-fun m!619807 () Bool)

(assert (=> b!646323 m!619807))

(declare-fun m!619809 () Bool)

(assert (=> b!646323 m!619809))

(declare-fun m!619811 () Bool)

(assert (=> b!646328 m!619811))

(declare-fun m!619813 () Bool)

(assert (=> b!646328 m!619813))

(declare-fun m!619815 () Bool)

(assert (=> b!646328 m!619815))

(assert (=> b!646328 m!619795))

(declare-fun m!619817 () Bool)

(assert (=> b!646328 m!619817))

(assert (=> b!646328 m!619795))

(declare-fun m!619819 () Bool)

(assert (=> b!646328 m!619819))

(declare-fun m!619821 () Bool)

(assert (=> b!646328 m!619821))

(declare-fun m!619823 () Bool)

(assert (=> b!646328 m!619823))

(assert (=> b!646340 m!619795))

(assert (=> b!646340 m!619795))

(declare-fun m!619825 () Bool)

(assert (=> b!646340 m!619825))

(assert (=> b!646335 m!619795))

(declare-fun m!619827 () Bool)

(assert (=> start!58542 m!619827))

(declare-fun m!619829 () Bool)

(assert (=> start!58542 m!619829))

(declare-fun m!619831 () Bool)

(assert (=> b!646322 m!619831))

(declare-fun m!619833 () Bool)

(assert (=> b!646331 m!619833))

(assert (=> b!646331 m!619795))

(assert (=> b!646331 m!619795))

(declare-fun m!619835 () Bool)

(assert (=> b!646331 m!619835))

(assert (=> b!646337 m!619795))

(assert (=> b!646337 m!619795))

(assert (=> b!646337 m!619825))

(assert (=> b!646336 m!619817))

(declare-fun m!619837 () Bool)

(assert (=> b!646336 m!619837))

(declare-fun m!619839 () Bool)

(assert (=> b!646341 m!619839))

(declare-fun m!619841 () Bool)

(assert (=> b!646327 m!619841))

(assert (=> b!646324 m!619795))

(assert (=> b!646324 m!619795))

(declare-fun m!619843 () Bool)

(assert (=> b!646324 m!619843))

(declare-fun m!619845 () Bool)

(assert (=> b!646333 m!619845))

(assert (=> b!646343 m!619795))

(assert (=> b!646343 m!619795))

(declare-fun m!619847 () Bool)

(assert (=> b!646343 m!619847))

(declare-fun m!619849 () Bool)

(assert (=> b!646330 m!619849))

(assert (=> b!646342 m!619795))

(assert (=> b!646342 m!619817))

(declare-fun m!619851 () Bool)

(assert (=> b!646342 m!619851))

(assert (=> b!646329 m!619795))

(assert (=> b!646329 m!619795))

(declare-fun m!619853 () Bool)

(assert (=> b!646329 m!619853))

(assert (=> b!646329 m!619795))

(declare-fun m!619855 () Bool)

(assert (=> b!646329 m!619855))

(assert (=> b!646329 m!619795))

(assert (=> b!646329 m!619847))

(declare-fun m!619857 () Bool)

(assert (=> b!646339 m!619857))

(push 1)

