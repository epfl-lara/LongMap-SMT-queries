; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56062 () Bool)

(assert start!56062)

(declare-fun b!617648 () Bool)

(declare-datatypes ((Unit!20248 0))(
  ( (Unit!20249) )
))
(declare-fun e!354190 () Unit!20248)

(declare-fun Unit!20250 () Unit!20248)

(assert (=> b!617648 (= e!354190 Unit!20250)))

(declare-fun b!617649 () Bool)

(declare-fun e!354188 () Unit!20248)

(declare-fun Unit!20251 () Unit!20248)

(assert (=> b!617649 (= e!354188 Unit!20251)))

(declare-fun b!617650 () Bool)

(declare-fun res!397910 () Bool)

(declare-fun e!354189 () Bool)

(assert (=> b!617650 (=> (not res!397910) (not e!354189))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37532 0))(
  ( (array!37533 (arr!18012 (Array (_ BitVec 32) (_ BitVec 64))) (size!18376 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37532)

(assert (=> b!617650 (= res!397910 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18012 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617651 () Bool)

(declare-fun e!354181 () Bool)

(assert (=> b!617651 (= e!354189 e!354181)))

(declare-fun res!397915 () Bool)

(assert (=> b!617651 (=> (not res!397915) (not e!354181))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!617651 (= res!397915 (= (select (store (arr!18012 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!284493 () array!37532)

(assert (=> b!617651 (= lt!284493 (array!37533 (store (arr!18012 a!2986) i!1108 k!1786) (size!18376 a!2986)))))

(declare-fun b!617653 () Bool)

(declare-fun e!354182 () Bool)

(assert (=> b!617653 (= e!354181 e!354182)))

(declare-fun res!397921 () Bool)

(assert (=> b!617653 (=> (not res!397921) (not e!354182))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6452 0))(
  ( (MissingZero!6452 (index!28092 (_ BitVec 32))) (Found!6452 (index!28093 (_ BitVec 32))) (Intermediate!6452 (undefined!7264 Bool) (index!28094 (_ BitVec 32)) (x!56884 (_ BitVec 32))) (Undefined!6452) (MissingVacant!6452 (index!28095 (_ BitVec 32))) )
))
(declare-fun lt!284494 () SeekEntryResult!6452)

(assert (=> b!617653 (= res!397921 (and (= lt!284494 (Found!6452 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18012 a!2986) index!984) (select (arr!18012 a!2986) j!136))) (not (= (select (arr!18012 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37532 (_ BitVec 32)) SeekEntryResult!6452)

(assert (=> b!617653 (= lt!284494 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18012 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617654 () Bool)

(assert (=> b!617654 false))

(declare-fun lt!284495 () Unit!20248)

(declare-datatypes ((List!12053 0))(
  ( (Nil!12050) (Cons!12049 (h!13094 (_ BitVec 64)) (t!18281 List!12053)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37532 (_ BitVec 64) (_ BitVec 32) List!12053) Unit!20248)

(assert (=> b!617654 (= lt!284495 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284493 (select (arr!18012 a!2986) j!136) index!984 Nil!12050))))

(declare-fun arrayNoDuplicates!0 (array!37532 (_ BitVec 32) List!12053) Bool)

(assert (=> b!617654 (arrayNoDuplicates!0 lt!284493 index!984 Nil!12050)))

(declare-fun lt!284487 () Unit!20248)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37532 (_ BitVec 32) (_ BitVec 32)) Unit!20248)

(assert (=> b!617654 (= lt!284487 (lemmaNoDuplicateFromThenFromBigger!0 lt!284493 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617654 (arrayNoDuplicates!0 lt!284493 #b00000000000000000000000000000000 Nil!12050)))

(declare-fun lt!284485 () Unit!20248)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12053) Unit!20248)

(assert (=> b!617654 (= lt!284485 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12050))))

(declare-fun arrayContainsKey!0 (array!37532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617654 (arrayContainsKey!0 lt!284493 (select (arr!18012 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284491 () Unit!20248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20248)

(assert (=> b!617654 (= lt!284491 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284493 (select (arr!18012 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354184 () Bool)

(assert (=> b!617654 e!354184))

(declare-fun res!397914 () Bool)

(assert (=> b!617654 (=> (not res!397914) (not e!354184))))

(assert (=> b!617654 (= res!397914 (arrayContainsKey!0 lt!284493 (select (arr!18012 a!2986) j!136) j!136))))

(declare-fun Unit!20252 () Unit!20248)

(assert (=> b!617654 (= e!354190 Unit!20252)))

(declare-fun b!617655 () Bool)

(declare-fun e!354180 () Unit!20248)

(declare-fun Unit!20253 () Unit!20248)

(assert (=> b!617655 (= e!354180 Unit!20253)))

(declare-fun res!397913 () Bool)

(assert (=> b!617655 (= res!397913 (= (select (store (arr!18012 a!2986) i!1108 k!1786) index!984) (select (arr!18012 a!2986) j!136)))))

(declare-fun e!354191 () Bool)

(assert (=> b!617655 (=> (not res!397913) (not e!354191))))

(assert (=> b!617655 e!354191))

(declare-fun c!70241 () Bool)

(assert (=> b!617655 (= c!70241 (bvslt j!136 index!984))))

(declare-fun lt!284483 () Unit!20248)

(declare-fun e!354179 () Unit!20248)

(assert (=> b!617655 (= lt!284483 e!354179)))

(declare-fun c!70239 () Bool)

(assert (=> b!617655 (= c!70239 (bvslt index!984 j!136))))

(declare-fun lt!284482 () Unit!20248)

(assert (=> b!617655 (= lt!284482 e!354190)))

(assert (=> b!617655 false))

(declare-fun b!617656 () Bool)

(declare-fun e!354187 () Bool)

(declare-fun lt!284490 () SeekEntryResult!6452)

(assert (=> b!617656 (= e!354187 (= lt!284494 lt!284490))))

(declare-fun b!617657 () Bool)

(declare-fun Unit!20254 () Unit!20248)

(assert (=> b!617657 (= e!354179 Unit!20254)))

(declare-fun b!617658 () Bool)

(declare-fun res!397917 () Bool)

(declare-fun e!354185 () Bool)

(assert (=> b!617658 (=> (not res!397917) (not e!354185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617658 (= res!397917 (validKeyInArray!0 (select (arr!18012 a!2986) j!136)))))

(declare-fun b!617659 () Bool)

(assert (=> b!617659 false))

(declare-fun lt!284481 () Unit!20248)

(assert (=> b!617659 (= lt!284481 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284493 (select (arr!18012 a!2986) j!136) j!136 Nil!12050))))

(assert (=> b!617659 (arrayNoDuplicates!0 lt!284493 j!136 Nil!12050)))

(declare-fun lt!284478 () Unit!20248)

(assert (=> b!617659 (= lt!284478 (lemmaNoDuplicateFromThenFromBigger!0 lt!284493 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617659 (arrayNoDuplicates!0 lt!284493 #b00000000000000000000000000000000 Nil!12050)))

(declare-fun lt!284489 () Unit!20248)

(assert (=> b!617659 (= lt!284489 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12050))))

(assert (=> b!617659 (arrayContainsKey!0 lt!284493 (select (arr!18012 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284486 () Unit!20248)

(assert (=> b!617659 (= lt!284486 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284493 (select (arr!18012 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20255 () Unit!20248)

(assert (=> b!617659 (= e!354179 Unit!20255)))

(declare-fun b!617660 () Bool)

(declare-fun e!354186 () Bool)

(assert (=> b!617660 (= e!354182 (not e!354186))))

(declare-fun res!397919 () Bool)

(assert (=> b!617660 (=> res!397919 e!354186)))

(declare-fun lt!284488 () SeekEntryResult!6452)

(assert (=> b!617660 (= res!397919 (not (= lt!284488 (MissingVacant!6452 vacantSpotIndex!68))))))

(declare-fun lt!284480 () Unit!20248)

(assert (=> b!617660 (= lt!284480 e!354180)))

(declare-fun c!70238 () Bool)

(assert (=> b!617660 (= c!70238 (= lt!284488 (Found!6452 index!984)))))

(declare-fun lt!284496 () Unit!20248)

(assert (=> b!617660 (= lt!284496 e!354188)))

(declare-fun c!70240 () Bool)

(assert (=> b!617660 (= c!70240 (= lt!284488 Undefined!6452))))

(declare-fun lt!284479 () (_ BitVec 64))

(assert (=> b!617660 (= lt!284488 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284479 lt!284493 mask!3053))))

(assert (=> b!617660 e!354187))

(declare-fun res!397922 () Bool)

(assert (=> b!617660 (=> (not res!397922) (not e!354187))))

(declare-fun lt!284484 () (_ BitVec 32))

(assert (=> b!617660 (= res!397922 (= lt!284490 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284484 vacantSpotIndex!68 lt!284479 lt!284493 mask!3053)))))

(assert (=> b!617660 (= lt!284490 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284484 vacantSpotIndex!68 (select (arr!18012 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617660 (= lt!284479 (select (store (arr!18012 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284492 () Unit!20248)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37532 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20248)

(assert (=> b!617660 (= lt!284492 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284484 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617660 (= lt!284484 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617661 () Bool)

(declare-fun Unit!20256 () Unit!20248)

(assert (=> b!617661 (= e!354188 Unit!20256)))

(assert (=> b!617661 false))

(declare-fun b!617662 () Bool)

(declare-fun res!397912 () Bool)

(assert (=> b!617662 (=> (not res!397912) (not e!354189))))

(assert (=> b!617662 (= res!397912 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12050))))

(declare-fun b!617663 () Bool)

(declare-fun Unit!20257 () Unit!20248)

(assert (=> b!617663 (= e!354180 Unit!20257)))

(declare-fun b!617652 () Bool)

(declare-fun res!397909 () Bool)

(assert (=> b!617652 (= res!397909 (arrayContainsKey!0 lt!284493 (select (arr!18012 a!2986) j!136) j!136))))

(declare-fun e!354178 () Bool)

(assert (=> b!617652 (=> (not res!397909) (not e!354178))))

(declare-fun e!354192 () Bool)

(assert (=> b!617652 (= e!354192 e!354178)))

(declare-fun res!397911 () Bool)

(assert (=> start!56062 (=> (not res!397911) (not e!354185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56062 (= res!397911 (validMask!0 mask!3053))))

(assert (=> start!56062 e!354185))

(assert (=> start!56062 true))

(declare-fun array_inv!13808 (array!37532) Bool)

(assert (=> start!56062 (array_inv!13808 a!2986)))

(declare-fun b!617664 () Bool)

(assert (=> b!617664 (= e!354184 (arrayContainsKey!0 lt!284493 (select (arr!18012 a!2986) j!136) index!984))))

(declare-fun b!617665 () Bool)

(assert (=> b!617665 (= e!354178 (arrayContainsKey!0 lt!284493 (select (arr!18012 a!2986) j!136) index!984))))

(declare-fun b!617666 () Bool)

(assert (=> b!617666 (= e!354185 e!354189)))

(declare-fun res!397907 () Bool)

(assert (=> b!617666 (=> (not res!397907) (not e!354189))))

(declare-fun lt!284497 () SeekEntryResult!6452)

(assert (=> b!617666 (= res!397907 (or (= lt!284497 (MissingZero!6452 i!1108)) (= lt!284497 (MissingVacant!6452 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37532 (_ BitVec 32)) SeekEntryResult!6452)

(assert (=> b!617666 (= lt!284497 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!617667 () Bool)

(declare-fun res!397918 () Bool)

(assert (=> b!617667 (= res!397918 (bvsge j!136 index!984))))

(assert (=> b!617667 (=> res!397918 e!354192)))

(assert (=> b!617667 (= e!354191 e!354192)))

(declare-fun b!617668 () Bool)

(declare-fun res!397908 () Bool)

(assert (=> b!617668 (=> (not res!397908) (not e!354189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37532 (_ BitVec 32)) Bool)

(assert (=> b!617668 (= res!397908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617669 () Bool)

(declare-fun res!397906 () Bool)

(assert (=> b!617669 (=> (not res!397906) (not e!354185))))

(assert (=> b!617669 (= res!397906 (validKeyInArray!0 k!1786))))

(declare-fun b!617670 () Bool)

(declare-fun res!397920 () Bool)

(assert (=> b!617670 (=> (not res!397920) (not e!354185))))

(assert (=> b!617670 (= res!397920 (and (= (size!18376 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18376 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18376 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617671 () Bool)

(assert (=> b!617671 (= e!354186 true)))

(assert (=> b!617671 (= (select (store (arr!18012 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617672 () Bool)

(declare-fun res!397916 () Bool)

(assert (=> b!617672 (=> (not res!397916) (not e!354185))))

(assert (=> b!617672 (= res!397916 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56062 res!397911) b!617670))

(assert (= (and b!617670 res!397920) b!617658))

(assert (= (and b!617658 res!397917) b!617669))

(assert (= (and b!617669 res!397906) b!617672))

(assert (= (and b!617672 res!397916) b!617666))

(assert (= (and b!617666 res!397907) b!617668))

(assert (= (and b!617668 res!397908) b!617662))

(assert (= (and b!617662 res!397912) b!617650))

(assert (= (and b!617650 res!397910) b!617651))

(assert (= (and b!617651 res!397915) b!617653))

(assert (= (and b!617653 res!397921) b!617660))

(assert (= (and b!617660 res!397922) b!617656))

(assert (= (and b!617660 c!70240) b!617661))

(assert (= (and b!617660 (not c!70240)) b!617649))

(assert (= (and b!617660 c!70238) b!617655))

(assert (= (and b!617660 (not c!70238)) b!617663))

(assert (= (and b!617655 res!397913) b!617667))

(assert (= (and b!617667 (not res!397918)) b!617652))

(assert (= (and b!617652 res!397909) b!617665))

(assert (= (and b!617655 c!70241) b!617659))

(assert (= (and b!617655 (not c!70241)) b!617657))

(assert (= (and b!617655 c!70239) b!617654))

(assert (= (and b!617655 (not c!70239)) b!617648))

(assert (= (and b!617654 res!397914) b!617664))

(assert (= (and b!617660 (not res!397919)) b!617671))

(declare-fun m!593741 () Bool)

(assert (=> b!617672 m!593741))

(declare-fun m!593743 () Bool)

(assert (=> b!617658 m!593743))

(assert (=> b!617658 m!593743))

(declare-fun m!593745 () Bool)

(assert (=> b!617658 m!593745))

(declare-fun m!593747 () Bool)

(assert (=> b!617659 m!593747))

(assert (=> b!617659 m!593743))

(declare-fun m!593749 () Bool)

(assert (=> b!617659 m!593749))

(assert (=> b!617659 m!593743))

(declare-fun m!593751 () Bool)

(assert (=> b!617659 m!593751))

(assert (=> b!617659 m!593743))

(declare-fun m!593753 () Bool)

(assert (=> b!617659 m!593753))

(assert (=> b!617659 m!593743))

(declare-fun m!593755 () Bool)

(assert (=> b!617659 m!593755))

(declare-fun m!593757 () Bool)

(assert (=> b!617659 m!593757))

(declare-fun m!593759 () Bool)

(assert (=> b!617659 m!593759))

(declare-fun m!593761 () Bool)

(assert (=> b!617651 m!593761))

(declare-fun m!593763 () Bool)

(assert (=> b!617651 m!593763))

(declare-fun m!593765 () Bool)

(assert (=> b!617669 m!593765))

(declare-fun m!593767 () Bool)

(assert (=> b!617654 m!593767))

(assert (=> b!617654 m!593743))

(declare-fun m!593769 () Bool)

(assert (=> b!617654 m!593769))

(assert (=> b!617654 m!593757))

(assert (=> b!617654 m!593759))

(assert (=> b!617654 m!593743))

(declare-fun m!593771 () Bool)

(assert (=> b!617654 m!593771))

(assert (=> b!617654 m!593743))

(declare-fun m!593773 () Bool)

(assert (=> b!617654 m!593773))

(assert (=> b!617654 m!593743))

(declare-fun m!593775 () Bool)

(assert (=> b!617654 m!593775))

(assert (=> b!617654 m!593743))

(declare-fun m!593777 () Bool)

(assert (=> b!617654 m!593777))

(assert (=> b!617652 m!593743))

(assert (=> b!617652 m!593743))

(assert (=> b!617652 m!593771))

(assert (=> b!617665 m!593743))

(assert (=> b!617665 m!593743))

(declare-fun m!593779 () Bool)

(assert (=> b!617665 m!593779))

(declare-fun m!593781 () Bool)

(assert (=> b!617660 m!593781))

(declare-fun m!593783 () Bool)

(assert (=> b!617660 m!593783))

(assert (=> b!617660 m!593743))

(assert (=> b!617660 m!593761))

(declare-fun m!593785 () Bool)

(assert (=> b!617660 m!593785))

(assert (=> b!617660 m!593743))

(declare-fun m!593787 () Bool)

(assert (=> b!617660 m!593787))

(declare-fun m!593789 () Bool)

(assert (=> b!617660 m!593789))

(declare-fun m!593791 () Bool)

(assert (=> b!617660 m!593791))

(declare-fun m!593793 () Bool)

(assert (=> b!617653 m!593793))

(assert (=> b!617653 m!593743))

(assert (=> b!617653 m!593743))

(declare-fun m!593795 () Bool)

(assert (=> b!617653 m!593795))

(assert (=> b!617655 m!593761))

(declare-fun m!593797 () Bool)

(assert (=> b!617655 m!593797))

(assert (=> b!617655 m!593743))

(declare-fun m!593799 () Bool)

(assert (=> b!617650 m!593799))

(declare-fun m!593801 () Bool)

(assert (=> b!617668 m!593801))

(assert (=> b!617664 m!593743))

(assert (=> b!617664 m!593743))

(assert (=> b!617664 m!593779))

(assert (=> b!617671 m!593761))

(assert (=> b!617671 m!593797))

(declare-fun m!593803 () Bool)

(assert (=> start!56062 m!593803))

(declare-fun m!593805 () Bool)

(assert (=> start!56062 m!593805))

(declare-fun m!593807 () Bool)

(assert (=> b!617662 m!593807))

(declare-fun m!593809 () Bool)

(assert (=> b!617666 m!593809))

(push 1)

