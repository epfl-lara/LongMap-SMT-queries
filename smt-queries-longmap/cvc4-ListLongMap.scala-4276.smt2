; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59568 () Bool)

(assert start!59568)

(declare-fun b!657704 () Bool)

(declare-fun e!377832 () Bool)

(declare-datatypes ((SeekEntryResult!7000 0))(
  ( (MissingZero!7000 (index!30365 (_ BitVec 32))) (Found!7000 (index!30366 (_ BitVec 32))) (Intermediate!7000 (undefined!7812 Bool) (index!30367 (_ BitVec 32)) (x!59155 (_ BitVec 32))) (Undefined!7000) (MissingVacant!7000 (index!30368 (_ BitVec 32))) )
))
(declare-fun lt!307282 () SeekEntryResult!7000)

(declare-fun lt!307277 () SeekEntryResult!7000)

(assert (=> b!657704 (= e!377832 (= lt!307282 lt!307277))))

(declare-fun b!657705 () Bool)

(declare-datatypes ((Unit!22754 0))(
  ( (Unit!22755) )
))
(declare-fun e!377822 () Unit!22754)

(declare-fun Unit!22756 () Unit!22754)

(assert (=> b!657705 (= e!377822 Unit!22756)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!657706 () Bool)

(declare-datatypes ((array!38726 0))(
  ( (array!38727 (arr!18560 (Array (_ BitVec 32) (_ BitVec 64))) (size!18924 (_ BitVec 32))) )
))
(declare-fun lt!307285 () array!38726)

(declare-fun e!377819 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38726)

(declare-fun arrayContainsKey!0 (array!38726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657706 (= e!377819 (arrayContainsKey!0 lt!307285 (select (arr!18560 a!2986) j!136) index!984))))

(declare-fun b!657707 () Bool)

(declare-fun e!377820 () Unit!22754)

(declare-fun Unit!22757 () Unit!22754)

(assert (=> b!657707 (= e!377820 Unit!22757)))

(declare-fun b!657708 () Bool)

(declare-fun e!377827 () Bool)

(declare-fun e!377821 () Bool)

(assert (=> b!657708 (= e!377827 e!377821)))

(declare-fun res!426511 () Bool)

(assert (=> b!657708 (=> (not res!426511) (not e!377821))))

(declare-fun lt!307288 () SeekEntryResult!7000)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!657708 (= res!426511 (or (= lt!307288 (MissingZero!7000 i!1108)) (= lt!307288 (MissingVacant!7000 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38726 (_ BitVec 32)) SeekEntryResult!7000)

(assert (=> b!657708 (= lt!307288 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657709 () Bool)

(declare-fun e!377823 () Unit!22754)

(declare-fun Unit!22758 () Unit!22754)

(assert (=> b!657709 (= e!377823 Unit!22758)))

(declare-fun b!657710 () Bool)

(declare-fun res!426508 () Bool)

(assert (=> b!657710 (=> (not res!426508) (not e!377821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38726 (_ BitVec 32)) Bool)

(assert (=> b!657710 (= res!426508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657711 () Bool)

(declare-fun res!426506 () Bool)

(assert (=> b!657711 (=> (not res!426506) (not e!377821))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657711 (= res!426506 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18560 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!377818 () Bool)

(declare-fun b!657712 () Bool)

(assert (=> b!657712 (= e!377818 (arrayContainsKey!0 lt!307285 (select (arr!18560 a!2986) j!136) index!984))))

(declare-fun b!657713 () Bool)

(declare-fun res!426507 () Bool)

(assert (=> b!657713 (=> (not res!426507) (not e!377821))))

(declare-datatypes ((List!12601 0))(
  ( (Nil!12598) (Cons!12597 (h!13642 (_ BitVec 64)) (t!18829 List!12601)) )
))
(declare-fun arrayNoDuplicates!0 (array!38726 (_ BitVec 32) List!12601) Bool)

(assert (=> b!657713 (= res!426507 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12598))))

(declare-fun b!657714 () Bool)

(declare-fun res!426500 () Bool)

(assert (=> b!657714 (=> (not res!426500) (not e!377827))))

(assert (=> b!657714 (= res!426500 (and (= (size!18924 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18924 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18924 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657716 () Bool)

(declare-fun Unit!22759 () Unit!22754)

(assert (=> b!657716 (= e!377822 Unit!22759)))

(assert (=> b!657716 false))

(declare-fun b!657717 () Bool)

(declare-fun res!426496 () Bool)

(assert (=> b!657717 (=> (not res!426496) (not e!377827))))

(assert (=> b!657717 (= res!426496 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657718 () Bool)

(declare-fun e!377825 () Unit!22754)

(declare-fun Unit!22760 () Unit!22754)

(assert (=> b!657718 (= e!377825 Unit!22760)))

(declare-fun b!657719 () Bool)

(assert (=> b!657719 false))

(declare-fun lt!307287 () Unit!22754)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38726 (_ BitVec 64) (_ BitVec 32) List!12601) Unit!22754)

(assert (=> b!657719 (= lt!307287 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307285 (select (arr!18560 a!2986) j!136) j!136 Nil!12598))))

(assert (=> b!657719 (arrayNoDuplicates!0 lt!307285 j!136 Nil!12598)))

(declare-fun lt!307269 () Unit!22754)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38726 (_ BitVec 32) (_ BitVec 32)) Unit!22754)

(assert (=> b!657719 (= lt!307269 (lemmaNoDuplicateFromThenFromBigger!0 lt!307285 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657719 (arrayNoDuplicates!0 lt!307285 #b00000000000000000000000000000000 Nil!12598)))

(declare-fun lt!307270 () Unit!22754)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38726 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12601) Unit!22754)

(assert (=> b!657719 (= lt!307270 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12598))))

(assert (=> b!657719 (arrayContainsKey!0 lt!307285 (select (arr!18560 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307286 () Unit!22754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38726 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22754)

(assert (=> b!657719 (= lt!307286 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307285 (select (arr!18560 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22761 () Unit!22754)

(assert (=> b!657719 (= e!377823 Unit!22761)))

(declare-fun b!657720 () Bool)

(declare-fun Unit!22762 () Unit!22754)

(assert (=> b!657720 (= e!377820 Unit!22762)))

(declare-fun res!426503 () Bool)

(assert (=> b!657720 (= res!426503 (= (select (store (arr!18560 a!2986) i!1108 k!1786) index!984) (select (arr!18560 a!2986) j!136)))))

(declare-fun e!377830 () Bool)

(assert (=> b!657720 (=> (not res!426503) (not e!377830))))

(assert (=> b!657720 e!377830))

(declare-fun c!75972 () Bool)

(assert (=> b!657720 (= c!75972 (bvslt j!136 index!984))))

(declare-fun lt!307284 () Unit!22754)

(assert (=> b!657720 (= lt!307284 e!377823)))

(declare-fun c!75973 () Bool)

(assert (=> b!657720 (= c!75973 (bvslt index!984 j!136))))

(declare-fun lt!307279 () Unit!22754)

(assert (=> b!657720 (= lt!307279 e!377825)))

(assert (=> b!657720 false))

(declare-fun b!657721 () Bool)

(declare-fun e!377829 () Bool)

(declare-fun e!377826 () Bool)

(assert (=> b!657721 (= e!377829 e!377826)))

(declare-fun res!426509 () Bool)

(assert (=> b!657721 (=> (not res!426509) (not e!377826))))

(assert (=> b!657721 (= res!426509 (and (= lt!307282 (Found!7000 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18560 a!2986) index!984) (select (arr!18560 a!2986) j!136))) (not (= (select (arr!18560 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38726 (_ BitVec 32)) SeekEntryResult!7000)

(assert (=> b!657721 (= lt!307282 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18560 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!426501 () Bool)

(declare-fun b!657722 () Bool)

(assert (=> b!657722 (= res!426501 (arrayContainsKey!0 lt!307285 (select (arr!18560 a!2986) j!136) j!136))))

(assert (=> b!657722 (=> (not res!426501) (not e!377819))))

(declare-fun e!377828 () Bool)

(assert (=> b!657722 (= e!377828 e!377819)))

(declare-fun b!657723 () Bool)

(declare-fun e!377831 () Bool)

(assert (=> b!657723 (= e!377831 true)))

(assert (=> b!657723 (= (select (store (arr!18560 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!426498 () Bool)

(assert (=> start!59568 (=> (not res!426498) (not e!377827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59568 (= res!426498 (validMask!0 mask!3053))))

(assert (=> start!59568 e!377827))

(assert (=> start!59568 true))

(declare-fun array_inv!14356 (array!38726) Bool)

(assert (=> start!59568 (array_inv!14356 a!2986)))

(declare-fun b!657715 () Bool)

(assert (=> b!657715 (= e!377826 (not e!377831))))

(declare-fun res!426512 () Bool)

(assert (=> b!657715 (=> res!426512 e!377831)))

(declare-fun lt!307274 () SeekEntryResult!7000)

(assert (=> b!657715 (= res!426512 (not (= lt!307274 (MissingVacant!7000 vacantSpotIndex!68))))))

(declare-fun lt!307281 () Unit!22754)

(assert (=> b!657715 (= lt!307281 e!377820)))

(declare-fun c!75974 () Bool)

(assert (=> b!657715 (= c!75974 (= lt!307274 (Found!7000 index!984)))))

(declare-fun lt!307278 () Unit!22754)

(assert (=> b!657715 (= lt!307278 e!377822)))

(declare-fun c!75971 () Bool)

(assert (=> b!657715 (= c!75971 (= lt!307274 Undefined!7000))))

(declare-fun lt!307271 () (_ BitVec 64))

(assert (=> b!657715 (= lt!307274 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307271 lt!307285 mask!3053))))

(assert (=> b!657715 e!377832))

(declare-fun res!426497 () Bool)

(assert (=> b!657715 (=> (not res!426497) (not e!377832))))

(declare-fun lt!307280 () (_ BitVec 32))

(assert (=> b!657715 (= res!426497 (= lt!307277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307280 vacantSpotIndex!68 lt!307271 lt!307285 mask!3053)))))

(assert (=> b!657715 (= lt!307277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307280 vacantSpotIndex!68 (select (arr!18560 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657715 (= lt!307271 (select (store (arr!18560 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307276 () Unit!22754)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38726 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22754)

(assert (=> b!657715 (= lt!307276 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307280 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657715 (= lt!307280 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657724 () Bool)

(assert (=> b!657724 false))

(declare-fun lt!307275 () Unit!22754)

(assert (=> b!657724 (= lt!307275 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307285 (select (arr!18560 a!2986) j!136) index!984 Nil!12598))))

(assert (=> b!657724 (arrayNoDuplicates!0 lt!307285 index!984 Nil!12598)))

(declare-fun lt!307283 () Unit!22754)

(assert (=> b!657724 (= lt!307283 (lemmaNoDuplicateFromThenFromBigger!0 lt!307285 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657724 (arrayNoDuplicates!0 lt!307285 #b00000000000000000000000000000000 Nil!12598)))

(declare-fun lt!307273 () Unit!22754)

(assert (=> b!657724 (= lt!307273 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12598))))

(assert (=> b!657724 (arrayContainsKey!0 lt!307285 (select (arr!18560 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307272 () Unit!22754)

(assert (=> b!657724 (= lt!307272 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307285 (select (arr!18560 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657724 e!377818))

(declare-fun res!426510 () Bool)

(assert (=> b!657724 (=> (not res!426510) (not e!377818))))

(assert (=> b!657724 (= res!426510 (arrayContainsKey!0 lt!307285 (select (arr!18560 a!2986) j!136) j!136))))

(declare-fun Unit!22763 () Unit!22754)

(assert (=> b!657724 (= e!377825 Unit!22763)))

(declare-fun b!657725 () Bool)

(declare-fun res!426502 () Bool)

(assert (=> b!657725 (= res!426502 (bvsge j!136 index!984))))

(assert (=> b!657725 (=> res!426502 e!377828)))

(assert (=> b!657725 (= e!377830 e!377828)))

(declare-fun b!657726 () Bool)

(declare-fun res!426505 () Bool)

(assert (=> b!657726 (=> (not res!426505) (not e!377827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657726 (= res!426505 (validKeyInArray!0 k!1786))))

(declare-fun b!657727 () Bool)

(declare-fun res!426504 () Bool)

(assert (=> b!657727 (=> (not res!426504) (not e!377827))))

(assert (=> b!657727 (= res!426504 (validKeyInArray!0 (select (arr!18560 a!2986) j!136)))))

(declare-fun b!657728 () Bool)

(assert (=> b!657728 (= e!377821 e!377829)))

(declare-fun res!426499 () Bool)

(assert (=> b!657728 (=> (not res!426499) (not e!377829))))

(assert (=> b!657728 (= res!426499 (= (select (store (arr!18560 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657728 (= lt!307285 (array!38727 (store (arr!18560 a!2986) i!1108 k!1786) (size!18924 a!2986)))))

(assert (= (and start!59568 res!426498) b!657714))

(assert (= (and b!657714 res!426500) b!657727))

(assert (= (and b!657727 res!426504) b!657726))

(assert (= (and b!657726 res!426505) b!657717))

(assert (= (and b!657717 res!426496) b!657708))

(assert (= (and b!657708 res!426511) b!657710))

(assert (= (and b!657710 res!426508) b!657713))

(assert (= (and b!657713 res!426507) b!657711))

(assert (= (and b!657711 res!426506) b!657728))

(assert (= (and b!657728 res!426499) b!657721))

(assert (= (and b!657721 res!426509) b!657715))

(assert (= (and b!657715 res!426497) b!657704))

(assert (= (and b!657715 c!75971) b!657716))

(assert (= (and b!657715 (not c!75971)) b!657705))

(assert (= (and b!657715 c!75974) b!657720))

(assert (= (and b!657715 (not c!75974)) b!657707))

(assert (= (and b!657720 res!426503) b!657725))

(assert (= (and b!657725 (not res!426502)) b!657722))

(assert (= (and b!657722 res!426501) b!657706))

(assert (= (and b!657720 c!75972) b!657719))

(assert (= (and b!657720 (not c!75972)) b!657709))

(assert (= (and b!657720 c!75973) b!657724))

(assert (= (and b!657720 (not c!75973)) b!657718))

(assert (= (and b!657724 res!426510) b!657712))

(assert (= (and b!657715 (not res!426512)) b!657723))

(declare-fun m!630727 () Bool)

(assert (=> b!657722 m!630727))

(assert (=> b!657722 m!630727))

(declare-fun m!630729 () Bool)

(assert (=> b!657722 m!630729))

(assert (=> b!657706 m!630727))

(assert (=> b!657706 m!630727))

(declare-fun m!630731 () Bool)

(assert (=> b!657706 m!630731))

(assert (=> b!657712 m!630727))

(assert (=> b!657712 m!630727))

(assert (=> b!657712 m!630731))

(declare-fun m!630733 () Bool)

(assert (=> b!657715 m!630733))

(declare-fun m!630735 () Bool)

(assert (=> b!657715 m!630735))

(assert (=> b!657715 m!630727))

(declare-fun m!630737 () Bool)

(assert (=> b!657715 m!630737))

(assert (=> b!657715 m!630727))

(declare-fun m!630739 () Bool)

(assert (=> b!657715 m!630739))

(declare-fun m!630741 () Bool)

(assert (=> b!657715 m!630741))

(declare-fun m!630743 () Bool)

(assert (=> b!657715 m!630743))

(declare-fun m!630745 () Bool)

(assert (=> b!657715 m!630745))

(assert (=> b!657719 m!630727))

(declare-fun m!630747 () Bool)

(assert (=> b!657719 m!630747))

(assert (=> b!657719 m!630727))

(declare-fun m!630749 () Bool)

(assert (=> b!657719 m!630749))

(declare-fun m!630751 () Bool)

(assert (=> b!657719 m!630751))

(declare-fun m!630753 () Bool)

(assert (=> b!657719 m!630753))

(assert (=> b!657719 m!630727))

(declare-fun m!630755 () Bool)

(assert (=> b!657719 m!630755))

(declare-fun m!630757 () Bool)

(assert (=> b!657719 m!630757))

(declare-fun m!630759 () Bool)

(assert (=> b!657719 m!630759))

(assert (=> b!657719 m!630727))

(declare-fun m!630761 () Bool)

(assert (=> b!657717 m!630761))

(assert (=> b!657727 m!630727))

(assert (=> b!657727 m!630727))

(declare-fun m!630763 () Bool)

(assert (=> b!657727 m!630763))

(declare-fun m!630765 () Bool)

(assert (=> start!59568 m!630765))

(declare-fun m!630767 () Bool)

(assert (=> start!59568 m!630767))

(declare-fun m!630769 () Bool)

(assert (=> b!657708 m!630769))

(assert (=> b!657724 m!630727))

(assert (=> b!657724 m!630729))

(assert (=> b!657724 m!630727))

(declare-fun m!630771 () Bool)

(assert (=> b!657724 m!630771))

(declare-fun m!630773 () Bool)

(assert (=> b!657724 m!630773))

(assert (=> b!657724 m!630727))

(declare-fun m!630775 () Bool)

(assert (=> b!657724 m!630775))

(assert (=> b!657724 m!630757))

(assert (=> b!657724 m!630759))

(assert (=> b!657724 m!630727))

(declare-fun m!630777 () Bool)

(assert (=> b!657724 m!630777))

(assert (=> b!657724 m!630727))

(declare-fun m!630779 () Bool)

(assert (=> b!657724 m!630779))

(assert (=> b!657720 m!630745))

(declare-fun m!630781 () Bool)

(assert (=> b!657720 m!630781))

(assert (=> b!657720 m!630727))

(declare-fun m!630783 () Bool)

(assert (=> b!657711 m!630783))

(declare-fun m!630785 () Bool)

(assert (=> b!657721 m!630785))

(assert (=> b!657721 m!630727))

(assert (=> b!657721 m!630727))

(declare-fun m!630787 () Bool)

(assert (=> b!657721 m!630787))

(assert (=> b!657728 m!630745))

(declare-fun m!630789 () Bool)

(assert (=> b!657728 m!630789))

(declare-fun m!630791 () Bool)

(assert (=> b!657710 m!630791))

(assert (=> b!657723 m!630745))

(assert (=> b!657723 m!630781))

(declare-fun m!630793 () Bool)

(assert (=> b!657713 m!630793))

(declare-fun m!630795 () Bool)

(assert (=> b!657726 m!630795))

(push 1)

