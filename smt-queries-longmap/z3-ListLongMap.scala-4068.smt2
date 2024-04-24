; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55956 () Bool)

(assert start!55956)

(declare-fun b!612057 () Bool)

(declare-fun e!350793 () Bool)

(declare-fun e!350785 () Bool)

(assert (=> b!612057 (= e!350793 e!350785)))

(declare-fun res!393633 () Bool)

(assert (=> b!612057 (=> (not res!393633) (not e!350785))))

(declare-datatypes ((SeekEntryResult!6325 0))(
  ( (MissingZero!6325 (index!27584 (_ BitVec 32))) (Found!6325 (index!27585 (_ BitVec 32))) (Intermediate!6325 (undefined!7137 Bool) (index!27586 (_ BitVec 32)) (x!56552 (_ BitVec 32))) (Undefined!6325) (MissingVacant!6325 (index!27587 (_ BitVec 32))) )
))
(declare-fun lt!280084 () SeekEntryResult!6325)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!612057 (= res!393633 (or (= lt!280084 (MissingZero!6325 i!1108)) (= lt!280084 (MissingVacant!6325 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37371 0))(
  ( (array!37372 (arr!17929 (Array (_ BitVec 32) (_ BitVec 64))) (size!18293 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37371)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37371 (_ BitVec 32)) SeekEntryResult!6325)

(assert (=> b!612057 (= lt!280084 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612058 () Bool)

(declare-fun res!393640 () Bool)

(assert (=> b!612058 (=> (not res!393640) (not e!350793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612058 (= res!393640 (validKeyInArray!0 k0!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!280086 () array!37371)

(declare-fun e!350788 () Bool)

(declare-fun b!612059 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612059 (= e!350788 (arrayContainsKey!0 lt!280086 (select (arr!17929 a!2986) j!136) index!984))))

(declare-fun b!612060 () Bool)

(declare-fun e!350792 () Bool)

(assert (=> b!612060 (= e!350792 e!350788)))

(declare-fun res!393636 () Bool)

(assert (=> b!612060 (=> (not res!393636) (not e!350788))))

(assert (=> b!612060 (= res!393636 (arrayContainsKey!0 lt!280086 (select (arr!17929 a!2986) j!136) j!136))))

(declare-fun b!612061 () Bool)

(declare-datatypes ((Unit!19603 0))(
  ( (Unit!19604) )
))
(declare-fun e!350787 () Unit!19603)

(declare-fun Unit!19605 () Unit!19603)

(assert (=> b!612061 (= e!350787 Unit!19605)))

(declare-fun b!612062 () Bool)

(declare-fun res!393628 () Bool)

(assert (=> b!612062 (=> (not res!393628) (not e!350785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37371 (_ BitVec 32)) Bool)

(assert (=> b!612062 (= res!393628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612063 () Bool)

(declare-fun e!350782 () Bool)

(declare-fun e!350789 () Bool)

(assert (=> b!612063 (= e!350782 (not e!350789))))

(declare-fun res!393629 () Bool)

(assert (=> b!612063 (=> res!393629 e!350789)))

(declare-fun lt!280093 () SeekEntryResult!6325)

(assert (=> b!612063 (= res!393629 (not (= lt!280093 (Found!6325 index!984))))))

(declare-fun lt!280092 () Unit!19603)

(assert (=> b!612063 (= lt!280092 e!350787)))

(declare-fun c!69586 () Bool)

(assert (=> b!612063 (= c!69586 (= lt!280093 Undefined!6325))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280097 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37371 (_ BitVec 32)) SeekEntryResult!6325)

(assert (=> b!612063 (= lt!280093 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280097 lt!280086 mask!3053))))

(declare-fun e!350779 () Bool)

(assert (=> b!612063 e!350779))

(declare-fun res!393638 () Bool)

(assert (=> b!612063 (=> (not res!393638) (not e!350779))))

(declare-fun lt!280085 () (_ BitVec 32))

(declare-fun lt!280088 () SeekEntryResult!6325)

(assert (=> b!612063 (= res!393638 (= lt!280088 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280085 vacantSpotIndex!68 lt!280097 lt!280086 mask!3053)))))

(assert (=> b!612063 (= lt!280088 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280085 vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612063 (= lt!280097 (select (store (arr!17929 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280096 () Unit!19603)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19603)

(assert (=> b!612063 (= lt!280096 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280085 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612063 (= lt!280085 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!612064 () Bool)

(declare-fun res!393632 () Bool)

(assert (=> b!612064 (=> (not res!393632) (not e!350793))))

(assert (=> b!612064 (= res!393632 (validKeyInArray!0 (select (arr!17929 a!2986) j!136)))))

(declare-fun res!393627 () Bool)

(assert (=> start!55956 (=> (not res!393627) (not e!350793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55956 (= res!393627 (validMask!0 mask!3053))))

(assert (=> start!55956 e!350793))

(assert (=> start!55956 true))

(declare-fun array_inv!13788 (array!37371) Bool)

(assert (=> start!55956 (array_inv!13788 a!2986)))

(declare-fun b!612065 () Bool)

(declare-fun e!350786 () Bool)

(assert (=> b!612065 (= e!350785 e!350786)))

(declare-fun res!393639 () Bool)

(assert (=> b!612065 (=> (not res!393639) (not e!350786))))

(assert (=> b!612065 (= res!393639 (= (select (store (arr!17929 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612065 (= lt!280086 (array!37372 (store (arr!17929 a!2986) i!1108 k0!1786) (size!18293 a!2986)))))

(declare-fun b!612066 () Bool)

(declare-fun res!393625 () Bool)

(assert (=> b!612066 (=> (not res!393625) (not e!350785))))

(assert (=> b!612066 (= res!393625 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17929 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!350783 () Bool)

(declare-fun b!612067 () Bool)

(assert (=> b!612067 (= e!350783 (arrayContainsKey!0 lt!280086 (select (arr!17929 a!2986) j!136) index!984))))

(declare-fun b!612068 () Bool)

(declare-fun Unit!19606 () Unit!19603)

(assert (=> b!612068 (= e!350787 Unit!19606)))

(assert (=> b!612068 false))

(declare-fun b!612069 () Bool)

(assert (=> b!612069 (= e!350786 e!350782)))

(declare-fun res!393624 () Bool)

(assert (=> b!612069 (=> (not res!393624) (not e!350782))))

(declare-fun lt!280098 () SeekEntryResult!6325)

(assert (=> b!612069 (= res!393624 (and (= lt!280098 (Found!6325 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17929 a!2986) index!984) (select (arr!17929 a!2986) j!136))) (not (= (select (arr!17929 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612069 (= lt!280098 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612070 () Bool)

(declare-fun e!350781 () Unit!19603)

(declare-fun Unit!19607 () Unit!19603)

(assert (=> b!612070 (= e!350781 Unit!19607)))

(declare-fun lt!280089 () Unit!19603)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37371 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19603)

(assert (=> b!612070 (= lt!280089 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280086 (select (arr!17929 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612070 (arrayContainsKey!0 lt!280086 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280083 () Unit!19603)

(declare-datatypes ((List!11877 0))(
  ( (Nil!11874) (Cons!11873 (h!12921 (_ BitVec 64)) (t!18097 List!11877)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37371 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11877) Unit!19603)

(assert (=> b!612070 (= lt!280083 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11874))))

(declare-fun arrayNoDuplicates!0 (array!37371 (_ BitVec 32) List!11877) Bool)

(assert (=> b!612070 (arrayNoDuplicates!0 lt!280086 #b00000000000000000000000000000000 Nil!11874)))

(declare-fun lt!280099 () Unit!19603)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37371 (_ BitVec 32) (_ BitVec 32)) Unit!19603)

(assert (=> b!612070 (= lt!280099 (lemmaNoDuplicateFromThenFromBigger!0 lt!280086 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612070 (arrayNoDuplicates!0 lt!280086 j!136 Nil!11874)))

(declare-fun lt!280095 () Unit!19603)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37371 (_ BitVec 64) (_ BitVec 32) List!11877) Unit!19603)

(assert (=> b!612070 (= lt!280095 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280086 (select (arr!17929 a!2986) j!136) j!136 Nil!11874))))

(assert (=> b!612070 false))

(declare-fun b!612071 () Bool)

(declare-fun res!393637 () Bool)

(assert (=> b!612071 (=> (not res!393637) (not e!350785))))

(assert (=> b!612071 (= res!393637 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11874))))

(declare-fun b!612072 () Bool)

(declare-fun res!393631 () Bool)

(assert (=> b!612072 (=> (not res!393631) (not e!350793))))

(assert (=> b!612072 (= res!393631 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612073 () Bool)

(declare-fun e!350780 () Bool)

(assert (=> b!612073 (= e!350780 e!350792)))

(declare-fun res!393626 () Bool)

(assert (=> b!612073 (=> res!393626 e!350792)))

(declare-fun lt!280094 () (_ BitVec 64))

(assert (=> b!612073 (= res!393626 (or (not (= (select (arr!17929 a!2986) j!136) lt!280097)) (not (= (select (arr!17929 a!2986) j!136) lt!280094)) (bvsge j!136 index!984)))))

(declare-fun b!612074 () Bool)

(declare-fun e!350791 () Bool)

(assert (=> b!612074 (= e!350789 e!350791)))

(declare-fun res!393622 () Bool)

(assert (=> b!612074 (=> res!393622 e!350791)))

(assert (=> b!612074 (= res!393622 (or (not (= (select (arr!17929 a!2986) j!136) lt!280097)) (not (= (select (arr!17929 a!2986) j!136) lt!280094))))))

(assert (=> b!612074 e!350780))

(declare-fun res!393630 () Bool)

(assert (=> b!612074 (=> (not res!393630) (not e!350780))))

(assert (=> b!612074 (= res!393630 (= lt!280094 (select (arr!17929 a!2986) j!136)))))

(assert (=> b!612074 (= lt!280094 (select (store (arr!17929 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612075 () Bool)

(declare-fun res!393635 () Bool)

(assert (=> b!612075 (=> (not res!393635) (not e!350793))))

(assert (=> b!612075 (= res!393635 (and (= (size!18293 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18293 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18293 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612076 () Bool)

(declare-fun e!350790 () Bool)

(assert (=> b!612076 (= e!350790 true)))

(assert (=> b!612076 (arrayNoDuplicates!0 lt!280086 #b00000000000000000000000000000000 Nil!11874)))

(declare-fun lt!280091 () Unit!19603)

(assert (=> b!612076 (= lt!280091 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11874))))

(assert (=> b!612076 (arrayContainsKey!0 lt!280086 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280087 () Unit!19603)

(assert (=> b!612076 (= lt!280087 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280086 (select (arr!17929 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!612076 e!350783))

(declare-fun res!393623 () Bool)

(assert (=> b!612076 (=> (not res!393623) (not e!350783))))

(assert (=> b!612076 (= res!393623 (arrayContainsKey!0 lt!280086 (select (arr!17929 a!2986) j!136) j!136))))

(declare-fun b!612077 () Bool)

(assert (=> b!612077 (= e!350791 e!350790)))

(declare-fun res!393634 () Bool)

(assert (=> b!612077 (=> res!393634 e!350790)))

(assert (=> b!612077 (= res!393634 (bvsge index!984 j!136))))

(declare-fun lt!280090 () Unit!19603)

(assert (=> b!612077 (= lt!280090 e!350781)))

(declare-fun c!69587 () Bool)

(assert (=> b!612077 (= c!69587 (bvslt j!136 index!984))))

(declare-fun b!612078 () Bool)

(assert (=> b!612078 (= e!350779 (= lt!280098 lt!280088))))

(declare-fun b!612079 () Bool)

(declare-fun Unit!19608 () Unit!19603)

(assert (=> b!612079 (= e!350781 Unit!19608)))

(assert (= (and start!55956 res!393627) b!612075))

(assert (= (and b!612075 res!393635) b!612064))

(assert (= (and b!612064 res!393632) b!612058))

(assert (= (and b!612058 res!393640) b!612072))

(assert (= (and b!612072 res!393631) b!612057))

(assert (= (and b!612057 res!393633) b!612062))

(assert (= (and b!612062 res!393628) b!612071))

(assert (= (and b!612071 res!393637) b!612066))

(assert (= (and b!612066 res!393625) b!612065))

(assert (= (and b!612065 res!393639) b!612069))

(assert (= (and b!612069 res!393624) b!612063))

(assert (= (and b!612063 res!393638) b!612078))

(assert (= (and b!612063 c!69586) b!612068))

(assert (= (and b!612063 (not c!69586)) b!612061))

(assert (= (and b!612063 (not res!393629)) b!612074))

(assert (= (and b!612074 res!393630) b!612073))

(assert (= (and b!612073 (not res!393626)) b!612060))

(assert (= (and b!612060 res!393636) b!612059))

(assert (= (and b!612074 (not res!393622)) b!612077))

(assert (= (and b!612077 c!69587) b!612070))

(assert (= (and b!612077 (not c!69587)) b!612079))

(assert (= (and b!612077 (not res!393634)) b!612076))

(assert (= (and b!612076 res!393623) b!612067))

(declare-fun m!588725 () Bool)

(assert (=> b!612067 m!588725))

(assert (=> b!612067 m!588725))

(declare-fun m!588727 () Bool)

(assert (=> b!612067 m!588727))

(assert (=> b!612060 m!588725))

(assert (=> b!612060 m!588725))

(declare-fun m!588729 () Bool)

(assert (=> b!612060 m!588729))

(declare-fun m!588731 () Bool)

(assert (=> b!612065 m!588731))

(declare-fun m!588733 () Bool)

(assert (=> b!612065 m!588733))

(declare-fun m!588735 () Bool)

(assert (=> b!612062 m!588735))

(declare-fun m!588737 () Bool)

(assert (=> b!612057 m!588737))

(assert (=> b!612076 m!588725))

(declare-fun m!588739 () Bool)

(assert (=> b!612076 m!588739))

(assert (=> b!612076 m!588725))

(assert (=> b!612076 m!588725))

(declare-fun m!588741 () Bool)

(assert (=> b!612076 m!588741))

(declare-fun m!588743 () Bool)

(assert (=> b!612076 m!588743))

(assert (=> b!612076 m!588725))

(assert (=> b!612076 m!588729))

(declare-fun m!588745 () Bool)

(assert (=> b!612076 m!588745))

(declare-fun m!588747 () Bool)

(assert (=> start!55956 m!588747))

(declare-fun m!588749 () Bool)

(assert (=> start!55956 m!588749))

(declare-fun m!588751 () Bool)

(assert (=> b!612071 m!588751))

(declare-fun m!588753 () Bool)

(assert (=> b!612069 m!588753))

(assert (=> b!612069 m!588725))

(assert (=> b!612069 m!588725))

(declare-fun m!588755 () Bool)

(assert (=> b!612069 m!588755))

(declare-fun m!588757 () Bool)

(assert (=> b!612063 m!588757))

(assert (=> b!612063 m!588725))

(assert (=> b!612063 m!588731))

(declare-fun m!588759 () Bool)

(assert (=> b!612063 m!588759))

(declare-fun m!588761 () Bool)

(assert (=> b!612063 m!588761))

(assert (=> b!612063 m!588725))

(declare-fun m!588763 () Bool)

(assert (=> b!612063 m!588763))

(declare-fun m!588765 () Bool)

(assert (=> b!612063 m!588765))

(declare-fun m!588767 () Bool)

(assert (=> b!612063 m!588767))

(assert (=> b!612059 m!588725))

(assert (=> b!612059 m!588725))

(assert (=> b!612059 m!588727))

(assert (=> b!612070 m!588725))

(declare-fun m!588769 () Bool)

(assert (=> b!612070 m!588769))

(assert (=> b!612070 m!588725))

(declare-fun m!588771 () Bool)

(assert (=> b!612070 m!588771))

(assert (=> b!612070 m!588725))

(declare-fun m!588773 () Bool)

(assert (=> b!612070 m!588773))

(assert (=> b!612070 m!588743))

(assert (=> b!612070 m!588725))

(declare-fun m!588775 () Bool)

(assert (=> b!612070 m!588775))

(declare-fun m!588777 () Bool)

(assert (=> b!612070 m!588777))

(assert (=> b!612070 m!588745))

(assert (=> b!612074 m!588725))

(assert (=> b!612074 m!588731))

(declare-fun m!588779 () Bool)

(assert (=> b!612074 m!588779))

(declare-fun m!588781 () Bool)

(assert (=> b!612072 m!588781))

(assert (=> b!612073 m!588725))

(assert (=> b!612064 m!588725))

(assert (=> b!612064 m!588725))

(declare-fun m!588783 () Bool)

(assert (=> b!612064 m!588783))

(declare-fun m!588785 () Bool)

(assert (=> b!612066 m!588785))

(declare-fun m!588787 () Bool)

(assert (=> b!612058 m!588787))

(check-sat (not b!612064) (not b!612076) (not b!612059) (not b!612060) (not b!612069) (not b!612057) (not b!612063) (not b!612067) (not start!55956) (not b!612071) (not b!612062) (not b!612072) (not b!612070) (not b!612058))
(check-sat)
