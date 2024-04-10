; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56036 () Bool)

(assert start!56036)

(declare-fun b!616673 () Bool)

(assert (=> b!616673 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20118 0))(
  ( (Unit!20119) )
))
(declare-fun lt!283698 () Unit!20118)

(declare-datatypes ((array!37506 0))(
  ( (array!37507 (arr!17999 (Array (_ BitVec 32) (_ BitVec 64))) (size!18363 (_ BitVec 32))) )
))
(declare-fun lt!283712 () array!37506)

(declare-fun a!2986 () array!37506)

(declare-datatypes ((List!12040 0))(
  ( (Nil!12037) (Cons!12036 (h!13081 (_ BitVec 64)) (t!18268 List!12040)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37506 (_ BitVec 64) (_ BitVec 32) List!12040) Unit!20118)

(assert (=> b!616673 (= lt!283698 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283712 (select (arr!17999 a!2986) j!136) j!136 Nil!12037))))

(declare-fun arrayNoDuplicates!0 (array!37506 (_ BitVec 32) List!12040) Bool)

(assert (=> b!616673 (arrayNoDuplicates!0 lt!283712 j!136 Nil!12037)))

(declare-fun lt!283702 () Unit!20118)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37506 (_ BitVec 32) (_ BitVec 32)) Unit!20118)

(assert (=> b!616673 (= lt!283702 (lemmaNoDuplicateFromThenFromBigger!0 lt!283712 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616673 (arrayNoDuplicates!0 lt!283712 #b00000000000000000000000000000000 Nil!12037)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!283699 () Unit!20118)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12040) Unit!20118)

(assert (=> b!616673 (= lt!283699 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12037))))

(declare-fun arrayContainsKey!0 (array!37506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616673 (arrayContainsKey!0 lt!283712 (select (arr!17999 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283701 () Unit!20118)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20118)

(assert (=> b!616673 (= lt!283701 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283712 (select (arr!17999 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353596 () Unit!20118)

(declare-fun Unit!20120 () Unit!20118)

(assert (=> b!616673 (= e!353596 Unit!20120)))

(declare-fun b!616674 () Bool)

(declare-fun Unit!20121 () Unit!20118)

(assert (=> b!616674 (= e!353596 Unit!20121)))

(declare-fun b!616675 () Bool)

(declare-fun e!353597 () Unit!20118)

(declare-fun Unit!20122 () Unit!20118)

(assert (=> b!616675 (= e!353597 Unit!20122)))

(declare-fun res!397257 () Bool)

(assert (=> b!616675 (= res!397257 (= (select (store (arr!17999 a!2986) i!1108 k!1786) index!984) (select (arr!17999 a!2986) j!136)))))

(declare-fun e!353594 () Bool)

(assert (=> b!616675 (=> (not res!397257) (not e!353594))))

(assert (=> b!616675 e!353594))

(declare-fun c!70084 () Bool)

(assert (=> b!616675 (= c!70084 (bvslt j!136 index!984))))

(declare-fun lt!283704 () Unit!20118)

(assert (=> b!616675 (= lt!283704 e!353596)))

(declare-fun c!70082 () Bool)

(assert (=> b!616675 (= c!70082 (bvslt index!984 j!136))))

(declare-fun lt!283703 () Unit!20118)

(declare-fun e!353606 () Unit!20118)

(assert (=> b!616675 (= lt!283703 e!353606)))

(assert (=> b!616675 false))

(declare-fun b!616676 () Bool)

(declare-fun e!353599 () Bool)

(assert (=> b!616676 (= e!353599 true)))

(assert (=> b!616676 (= (select (store (arr!17999 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616677 () Bool)

(declare-fun res!397244 () Bool)

(declare-fun e!353605 () Bool)

(assert (=> b!616677 (=> (not res!397244) (not e!353605))))

(assert (=> b!616677 (= res!397244 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616678 () Bool)

(declare-fun e!353607 () Unit!20118)

(declare-fun Unit!20123 () Unit!20118)

(assert (=> b!616678 (= e!353607 Unit!20123)))

(declare-fun e!353601 () Bool)

(declare-fun b!616679 () Bool)

(assert (=> b!616679 (= e!353601 (arrayContainsKey!0 lt!283712 (select (arr!17999 a!2986) j!136) index!984))))

(declare-fun b!616680 () Bool)

(declare-fun e!353603 () Bool)

(assert (=> b!616680 (= e!353603 (not e!353599))))

(declare-fun res!397251 () Bool)

(assert (=> b!616680 (=> res!397251 e!353599)))

(declare-datatypes ((SeekEntryResult!6439 0))(
  ( (MissingZero!6439 (index!28040 (_ BitVec 32))) (Found!6439 (index!28041 (_ BitVec 32))) (Intermediate!6439 (undefined!7251 Bool) (index!28042 (_ BitVec 32)) (x!56831 (_ BitVec 32))) (Undefined!6439) (MissingVacant!6439 (index!28043 (_ BitVec 32))) )
))
(declare-fun lt!283709 () SeekEntryResult!6439)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616680 (= res!397251 (not (= lt!283709 (MissingVacant!6439 vacantSpotIndex!68))))))

(declare-fun lt!283706 () Unit!20118)

(assert (=> b!616680 (= lt!283706 e!353597)))

(declare-fun c!70085 () Bool)

(assert (=> b!616680 (= c!70085 (= lt!283709 (Found!6439 index!984)))))

(declare-fun lt!283713 () Unit!20118)

(assert (=> b!616680 (= lt!283713 e!353607)))

(declare-fun c!70083 () Bool)

(assert (=> b!616680 (= c!70083 (= lt!283709 Undefined!6439))))

(declare-fun lt!283707 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37506 (_ BitVec 32)) SeekEntryResult!6439)

(assert (=> b!616680 (= lt!283709 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283707 lt!283712 mask!3053))))

(declare-fun e!353598 () Bool)

(assert (=> b!616680 e!353598))

(declare-fun res!397258 () Bool)

(assert (=> b!616680 (=> (not res!397258) (not e!353598))))

(declare-fun lt!283716 () (_ BitVec 32))

(declare-fun lt!283708 () SeekEntryResult!6439)

(assert (=> b!616680 (= res!397258 (= lt!283708 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283716 vacantSpotIndex!68 lt!283707 lt!283712 mask!3053)))))

(assert (=> b!616680 (= lt!283708 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283716 vacantSpotIndex!68 (select (arr!17999 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616680 (= lt!283707 (select (store (arr!17999 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283714 () Unit!20118)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20118)

(assert (=> b!616680 (= lt!283714 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283716 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616680 (= lt!283716 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616681 () Bool)

(declare-fun lt!283711 () SeekEntryResult!6439)

(assert (=> b!616681 (= e!353598 (= lt!283711 lt!283708))))

(declare-fun b!616683 () Bool)

(declare-fun res!397248 () Bool)

(assert (=> b!616683 (= res!397248 (arrayContainsKey!0 lt!283712 (select (arr!17999 a!2986) j!136) j!136))))

(assert (=> b!616683 (=> (not res!397248) (not e!353601))))

(declare-fun e!353602 () Bool)

(assert (=> b!616683 (= e!353602 e!353601)))

(declare-fun b!616684 () Bool)

(declare-fun res!397247 () Bool)

(assert (=> b!616684 (= res!397247 (bvsge j!136 index!984))))

(assert (=> b!616684 (=> res!397247 e!353602)))

(assert (=> b!616684 (= e!353594 e!353602)))

(declare-fun b!616685 () Bool)

(declare-fun Unit!20124 () Unit!20118)

(assert (=> b!616685 (= e!353606 Unit!20124)))

(declare-fun b!616686 () Bool)

(declare-fun res!397243 () Bool)

(declare-fun e!353593 () Bool)

(assert (=> b!616686 (=> (not res!397243) (not e!353593))))

(assert (=> b!616686 (= res!397243 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17999 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616687 () Bool)

(declare-fun Unit!20125 () Unit!20118)

(assert (=> b!616687 (= e!353607 Unit!20125)))

(assert (=> b!616687 false))

(declare-fun b!616688 () Bool)

(declare-fun e!353600 () Bool)

(assert (=> b!616688 (= e!353593 e!353600)))

(declare-fun res!397250 () Bool)

(assert (=> b!616688 (=> (not res!397250) (not e!353600))))

(assert (=> b!616688 (= res!397250 (= (select (store (arr!17999 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616688 (= lt!283712 (array!37507 (store (arr!17999 a!2986) i!1108 k!1786) (size!18363 a!2986)))))

(declare-fun b!616689 () Bool)

(declare-fun res!397246 () Bool)

(assert (=> b!616689 (=> (not res!397246) (not e!353593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37506 (_ BitVec 32)) Bool)

(assert (=> b!616689 (= res!397246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616690 () Bool)

(assert (=> b!616690 (= e!353605 e!353593)))

(declare-fun res!397256 () Bool)

(assert (=> b!616690 (=> (not res!397256) (not e!353593))))

(declare-fun lt!283715 () SeekEntryResult!6439)

(assert (=> b!616690 (= res!397256 (or (= lt!283715 (MissingZero!6439 i!1108)) (= lt!283715 (MissingVacant!6439 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37506 (_ BitVec 32)) SeekEntryResult!6439)

(assert (=> b!616690 (= lt!283715 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616691 () Bool)

(declare-fun res!397249 () Bool)

(assert (=> b!616691 (=> (not res!397249) (not e!353605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616691 (= res!397249 (validKeyInArray!0 (select (arr!17999 a!2986) j!136)))))

(declare-fun b!616692 () Bool)

(declare-fun res!397259 () Bool)

(assert (=> b!616692 (=> (not res!397259) (not e!353605))))

(assert (=> b!616692 (= res!397259 (and (= (size!18363 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18363 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18363 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616693 () Bool)

(declare-fun res!397245 () Bool)

(assert (=> b!616693 (=> (not res!397245) (not e!353605))))

(assert (=> b!616693 (= res!397245 (validKeyInArray!0 k!1786))))

(declare-fun b!616694 () Bool)

(assert (=> b!616694 (= e!353600 e!353603)))

(declare-fun res!397253 () Bool)

(assert (=> b!616694 (=> (not res!397253) (not e!353603))))

(assert (=> b!616694 (= res!397253 (and (= lt!283711 (Found!6439 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17999 a!2986) index!984) (select (arr!17999 a!2986) j!136))) (not (= (select (arr!17999 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616694 (= lt!283711 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17999 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616695 () Bool)

(assert (=> b!616695 false))

(declare-fun lt!283710 () Unit!20118)

(assert (=> b!616695 (= lt!283710 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283712 (select (arr!17999 a!2986) j!136) index!984 Nil!12037))))

(assert (=> b!616695 (arrayNoDuplicates!0 lt!283712 index!984 Nil!12037)))

(declare-fun lt!283700 () Unit!20118)

(assert (=> b!616695 (= lt!283700 (lemmaNoDuplicateFromThenFromBigger!0 lt!283712 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616695 (arrayNoDuplicates!0 lt!283712 #b00000000000000000000000000000000 Nil!12037)))

(declare-fun lt!283717 () Unit!20118)

(assert (=> b!616695 (= lt!283717 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12037))))

(assert (=> b!616695 (arrayContainsKey!0 lt!283712 (select (arr!17999 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283705 () Unit!20118)

(assert (=> b!616695 (= lt!283705 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283712 (select (arr!17999 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353595 () Bool)

(assert (=> b!616695 e!353595))

(declare-fun res!397252 () Bool)

(assert (=> b!616695 (=> (not res!397252) (not e!353595))))

(assert (=> b!616695 (= res!397252 (arrayContainsKey!0 lt!283712 (select (arr!17999 a!2986) j!136) j!136))))

(declare-fun Unit!20126 () Unit!20118)

(assert (=> b!616695 (= e!353606 Unit!20126)))

(declare-fun b!616696 () Bool)

(declare-fun res!397254 () Bool)

(assert (=> b!616696 (=> (not res!397254) (not e!353593))))

(assert (=> b!616696 (= res!397254 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12037))))

(declare-fun b!616697 () Bool)

(declare-fun Unit!20127 () Unit!20118)

(assert (=> b!616697 (= e!353597 Unit!20127)))

(declare-fun res!397255 () Bool)

(assert (=> start!56036 (=> (not res!397255) (not e!353605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56036 (= res!397255 (validMask!0 mask!3053))))

(assert (=> start!56036 e!353605))

(assert (=> start!56036 true))

(declare-fun array_inv!13795 (array!37506) Bool)

(assert (=> start!56036 (array_inv!13795 a!2986)))

(declare-fun b!616682 () Bool)

(assert (=> b!616682 (= e!353595 (arrayContainsKey!0 lt!283712 (select (arr!17999 a!2986) j!136) index!984))))

(assert (= (and start!56036 res!397255) b!616692))

(assert (= (and b!616692 res!397259) b!616691))

(assert (= (and b!616691 res!397249) b!616693))

(assert (= (and b!616693 res!397245) b!616677))

(assert (= (and b!616677 res!397244) b!616690))

(assert (= (and b!616690 res!397256) b!616689))

(assert (= (and b!616689 res!397246) b!616696))

(assert (= (and b!616696 res!397254) b!616686))

(assert (= (and b!616686 res!397243) b!616688))

(assert (= (and b!616688 res!397250) b!616694))

(assert (= (and b!616694 res!397253) b!616680))

(assert (= (and b!616680 res!397258) b!616681))

(assert (= (and b!616680 c!70083) b!616687))

(assert (= (and b!616680 (not c!70083)) b!616678))

(assert (= (and b!616680 c!70085) b!616675))

(assert (= (and b!616680 (not c!70085)) b!616697))

(assert (= (and b!616675 res!397257) b!616684))

(assert (= (and b!616684 (not res!397247)) b!616683))

(assert (= (and b!616683 res!397248) b!616679))

(assert (= (and b!616675 c!70084) b!616673))

(assert (= (and b!616675 (not c!70084)) b!616674))

(assert (= (and b!616675 c!70082) b!616695))

(assert (= (and b!616675 (not c!70082)) b!616685))

(assert (= (and b!616695 res!397252) b!616682))

(assert (= (and b!616680 (not res!397251)) b!616676))

(declare-fun m!592831 () Bool)

(assert (=> b!616677 m!592831))

(declare-fun m!592833 () Bool)

(assert (=> b!616679 m!592833))

(assert (=> b!616679 m!592833))

(declare-fun m!592835 () Bool)

(assert (=> b!616679 m!592835))

(declare-fun m!592837 () Bool)

(assert (=> b!616693 m!592837))

(declare-fun m!592839 () Bool)

(assert (=> b!616690 m!592839))

(declare-fun m!592841 () Bool)

(assert (=> b!616686 m!592841))

(assert (=> b!616695 m!592833))

(declare-fun m!592843 () Bool)

(assert (=> b!616695 m!592843))

(assert (=> b!616695 m!592833))

(declare-fun m!592845 () Bool)

(assert (=> b!616695 m!592845))

(assert (=> b!616695 m!592833))

(declare-fun m!592847 () Bool)

(assert (=> b!616695 m!592847))

(assert (=> b!616695 m!592833))

(declare-fun m!592849 () Bool)

(assert (=> b!616695 m!592849))

(declare-fun m!592851 () Bool)

(assert (=> b!616695 m!592851))

(declare-fun m!592853 () Bool)

(assert (=> b!616695 m!592853))

(assert (=> b!616695 m!592833))

(declare-fun m!592855 () Bool)

(assert (=> b!616695 m!592855))

(declare-fun m!592857 () Bool)

(assert (=> b!616695 m!592857))

(assert (=> b!616691 m!592833))

(assert (=> b!616691 m!592833))

(declare-fun m!592859 () Bool)

(assert (=> b!616691 m!592859))

(declare-fun m!592861 () Bool)

(assert (=> b!616689 m!592861))

(declare-fun m!592863 () Bool)

(assert (=> b!616696 m!592863))

(declare-fun m!592865 () Bool)

(assert (=> start!56036 m!592865))

(declare-fun m!592867 () Bool)

(assert (=> start!56036 m!592867))

(declare-fun m!592869 () Bool)

(assert (=> b!616694 m!592869))

(assert (=> b!616694 m!592833))

(assert (=> b!616694 m!592833))

(declare-fun m!592871 () Bool)

(assert (=> b!616694 m!592871))

(assert (=> b!616682 m!592833))

(assert (=> b!616682 m!592833))

(assert (=> b!616682 m!592835))

(declare-fun m!592873 () Bool)

(assert (=> b!616680 m!592873))

(declare-fun m!592875 () Bool)

(assert (=> b!616680 m!592875))

(declare-fun m!592877 () Bool)

(assert (=> b!616680 m!592877))

(assert (=> b!616680 m!592833))

(declare-fun m!592879 () Bool)

(assert (=> b!616680 m!592879))

(declare-fun m!592881 () Bool)

(assert (=> b!616680 m!592881))

(assert (=> b!616680 m!592833))

(declare-fun m!592883 () Bool)

(assert (=> b!616680 m!592883))

(declare-fun m!592885 () Bool)

(assert (=> b!616680 m!592885))

(assert (=> b!616675 m!592879))

(declare-fun m!592887 () Bool)

(assert (=> b!616675 m!592887))

(assert (=> b!616675 m!592833))

(assert (=> b!616688 m!592879))

(declare-fun m!592889 () Bool)

(assert (=> b!616688 m!592889))

(assert (=> b!616676 m!592879))

(assert (=> b!616676 m!592887))

(assert (=> b!616673 m!592833))

(declare-fun m!592891 () Bool)

(assert (=> b!616673 m!592891))

(assert (=> b!616673 m!592833))

(assert (=> b!616673 m!592853))

(declare-fun m!592893 () Bool)

(assert (=> b!616673 m!592893))

(declare-fun m!592895 () Bool)

(assert (=> b!616673 m!592895))

(assert (=> b!616673 m!592833))

(declare-fun m!592897 () Bool)

(assert (=> b!616673 m!592897))

(assert (=> b!616673 m!592833))

(declare-fun m!592899 () Bool)

(assert (=> b!616673 m!592899))

(assert (=> b!616673 m!592857))

(assert (=> b!616683 m!592833))

(assert (=> b!616683 m!592833))

(assert (=> b!616683 m!592855))

(push 1)

