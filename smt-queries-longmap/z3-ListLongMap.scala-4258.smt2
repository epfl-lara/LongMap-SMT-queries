; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59090 () Bool)

(assert start!59090)

(declare-fun b!651860 () Bool)

(declare-fun res!422747 () Bool)

(declare-fun e!374099 () Bool)

(assert (=> b!651860 (=> (not res!422747) (not e!374099))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651860 (= res!422747 (validKeyInArray!0 k0!1786))))

(declare-fun b!651861 () Bool)

(declare-fun e!374098 () Bool)

(declare-datatypes ((array!38601 0))(
  ( (array!38602 (arr!18503 (Array (_ BitVec 32) (_ BitVec 64))) (size!18868 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38601)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!651861 (= e!374098 (or (bvsge (size!18868 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18868 a!2986))))))

(declare-fun lt!303142 () array!38601)

(declare-datatypes ((List!12583 0))(
  ( (Nil!12580) (Cons!12579 (h!13624 (_ BitVec 64)) (t!18802 List!12583)) )
))
(declare-fun arrayNoDuplicates!0 (array!38601 (_ BitVec 32) List!12583) Bool)

(assert (=> b!651861 (arrayNoDuplicates!0 lt!303142 index!984 Nil!12580)))

(declare-datatypes ((Unit!22268 0))(
  ( (Unit!22269) )
))
(declare-fun lt!303131 () Unit!22268)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38601 (_ BitVec 32) (_ BitVec 32)) Unit!22268)

(assert (=> b!651861 (= lt!303131 (lemmaNoDuplicateFromThenFromBigger!0 lt!303142 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651861 (arrayNoDuplicates!0 lt!303142 #b00000000000000000000000000000000 Nil!12580)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!303135 () Unit!22268)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38601 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12583) Unit!22268)

(assert (=> b!651861 (= lt!303135 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12580))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651861 (arrayContainsKey!0 lt!303142 (select (arr!18503 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303141 () Unit!22268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38601 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22268)

(assert (=> b!651861 (= lt!303141 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303142 (select (arr!18503 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374104 () Bool)

(assert (=> b!651861 e!374104))

(declare-fun res!422744 () Bool)

(assert (=> b!651861 (=> (not res!422744) (not e!374104))))

(assert (=> b!651861 (= res!422744 (arrayContainsKey!0 lt!303142 (select (arr!18503 a!2986) j!136) j!136))))

(declare-fun b!651862 () Bool)

(declare-fun res!422754 () Bool)

(assert (=> b!651862 (=> (not res!422754) (not e!374099))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!651862 (= res!422754 (and (= (size!18868 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18868 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18868 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651863 () Bool)

(declare-fun res!422741 () Bool)

(declare-fun e!374111 () Bool)

(assert (=> b!651863 (=> (not res!422741) (not e!374111))))

(assert (=> b!651863 (= res!422741 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12580))))

(declare-fun b!651864 () Bool)

(declare-fun e!374109 () Bool)

(declare-fun e!374101 () Bool)

(assert (=> b!651864 (= e!374109 e!374101)))

(declare-fun res!422748 () Bool)

(assert (=> b!651864 (=> res!422748 e!374101)))

(declare-fun lt!303144 () (_ BitVec 64))

(declare-fun lt!303140 () (_ BitVec 64))

(assert (=> b!651864 (= res!422748 (or (not (= (select (arr!18503 a!2986) j!136) lt!303140)) (not (= (select (arr!18503 a!2986) j!136) lt!303144)) (bvsge j!136 index!984)))))

(declare-fun b!651865 () Bool)

(declare-fun res!422740 () Bool)

(assert (=> b!651865 (=> (not res!422740) (not e!374099))))

(assert (=> b!651865 (= res!422740 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651866 () Bool)

(declare-fun e!374102 () Unit!22268)

(declare-fun Unit!22270 () Unit!22268)

(assert (=> b!651866 (= e!374102 Unit!22270)))

(assert (=> b!651866 false))

(declare-fun b!651867 () Bool)

(declare-fun e!374107 () Bool)

(declare-fun e!374106 () Bool)

(assert (=> b!651867 (= e!374107 e!374106)))

(declare-fun res!422753 () Bool)

(assert (=> b!651867 (=> (not res!422753) (not e!374106))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6940 0))(
  ( (MissingZero!6940 (index!30113 (_ BitVec 32))) (Found!6940 (index!30114 (_ BitVec 32))) (Intermediate!6940 (undefined!7752 Bool) (index!30115 (_ BitVec 32)) (x!58910 (_ BitVec 32))) (Undefined!6940) (MissingVacant!6940 (index!30116 (_ BitVec 32))) )
))
(declare-fun lt!303139 () SeekEntryResult!6940)

(assert (=> b!651867 (= res!422753 (and (= lt!303139 (Found!6940 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18503 a!2986) index!984) (select (arr!18503 a!2986) j!136))) (not (= (select (arr!18503 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38601 (_ BitVec 32)) SeekEntryResult!6940)

(assert (=> b!651867 (= lt!303139 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18503 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651869 () Bool)

(declare-fun e!374100 () Bool)

(declare-fun e!374105 () Bool)

(assert (=> b!651869 (= e!374100 e!374105)))

(declare-fun res!422746 () Bool)

(assert (=> b!651869 (=> res!422746 e!374105)))

(assert (=> b!651869 (= res!422746 (or (not (= (select (arr!18503 a!2986) j!136) lt!303140)) (not (= (select (arr!18503 a!2986) j!136) lt!303144))))))

(assert (=> b!651869 e!374109))

(declare-fun res!422743 () Bool)

(assert (=> b!651869 (=> (not res!422743) (not e!374109))))

(assert (=> b!651869 (= res!422743 (= lt!303144 (select (arr!18503 a!2986) j!136)))))

(assert (=> b!651869 (= lt!303144 (select (store (arr!18503 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651870 () Bool)

(assert (=> b!651870 (= e!374104 (arrayContainsKey!0 lt!303142 (select (arr!18503 a!2986) j!136) index!984))))

(declare-fun b!651871 () Bool)

(declare-fun res!422755 () Bool)

(assert (=> b!651871 (=> (not res!422755) (not e!374099))))

(assert (=> b!651871 (= res!422755 (validKeyInArray!0 (select (arr!18503 a!2986) j!136)))))

(declare-fun b!651872 () Bool)

(assert (=> b!651872 (= e!374106 (not e!374100))))

(declare-fun res!422758 () Bool)

(assert (=> b!651872 (=> res!422758 e!374100)))

(declare-fun lt!303146 () SeekEntryResult!6940)

(assert (=> b!651872 (= res!422758 (not (= lt!303146 (Found!6940 index!984))))))

(declare-fun lt!303145 () Unit!22268)

(assert (=> b!651872 (= lt!303145 e!374102)))

(declare-fun c!74928 () Bool)

(assert (=> b!651872 (= c!74928 (= lt!303146 Undefined!6940))))

(assert (=> b!651872 (= lt!303146 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303140 lt!303142 mask!3053))))

(declare-fun e!374110 () Bool)

(assert (=> b!651872 e!374110))

(declare-fun res!422757 () Bool)

(assert (=> b!651872 (=> (not res!422757) (not e!374110))))

(declare-fun lt!303134 () SeekEntryResult!6940)

(declare-fun lt!303137 () (_ BitVec 32))

(assert (=> b!651872 (= res!422757 (= lt!303134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303137 vacantSpotIndex!68 lt!303140 lt!303142 mask!3053)))))

(assert (=> b!651872 (= lt!303134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303137 vacantSpotIndex!68 (select (arr!18503 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651872 (= lt!303140 (select (store (arr!18503 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303133 () Unit!22268)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22268)

(assert (=> b!651872 (= lt!303133 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303137 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651872 (= lt!303137 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651873 () Bool)

(assert (=> b!651873 (= e!374099 e!374111)))

(declare-fun res!422752 () Bool)

(assert (=> b!651873 (=> (not res!422752) (not e!374111))))

(declare-fun lt!303138 () SeekEntryResult!6940)

(assert (=> b!651873 (= res!422752 (or (= lt!303138 (MissingZero!6940 i!1108)) (= lt!303138 (MissingVacant!6940 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38601 (_ BitVec 32)) SeekEntryResult!6940)

(assert (=> b!651873 (= lt!303138 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651874 () Bool)

(assert (=> b!651874 (= e!374105 e!374098)))

(declare-fun res!422742 () Bool)

(assert (=> b!651874 (=> res!422742 e!374098)))

(assert (=> b!651874 (= res!422742 (bvsge index!984 j!136))))

(declare-fun lt!303130 () Unit!22268)

(declare-fun e!374097 () Unit!22268)

(assert (=> b!651874 (= lt!303130 e!374097)))

(declare-fun c!74927 () Bool)

(assert (=> b!651874 (= c!74927 (bvslt j!136 index!984))))

(declare-fun b!651875 () Bool)

(declare-fun res!422756 () Bool)

(assert (=> b!651875 (=> (not res!422756) (not e!374111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38601 (_ BitVec 32)) Bool)

(assert (=> b!651875 (= res!422756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651876 () Bool)

(assert (=> b!651876 (= e!374110 (= lt!303139 lt!303134))))

(declare-fun b!651877 () Bool)

(declare-fun e!374103 () Bool)

(assert (=> b!651877 (= e!374103 (arrayContainsKey!0 lt!303142 (select (arr!18503 a!2986) j!136) index!984))))

(declare-fun b!651878 () Bool)

(declare-fun res!422749 () Bool)

(assert (=> b!651878 (=> (not res!422749) (not e!374111))))

(assert (=> b!651878 (= res!422749 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18503 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651879 () Bool)

(declare-fun Unit!22271 () Unit!22268)

(assert (=> b!651879 (= e!374097 Unit!22271)))

(declare-fun lt!303136 () Unit!22268)

(assert (=> b!651879 (= lt!303136 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303142 (select (arr!18503 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651879 (arrayContainsKey!0 lt!303142 (select (arr!18503 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303147 () Unit!22268)

(assert (=> b!651879 (= lt!303147 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12580))))

(assert (=> b!651879 (arrayNoDuplicates!0 lt!303142 #b00000000000000000000000000000000 Nil!12580)))

(declare-fun lt!303143 () Unit!22268)

(assert (=> b!651879 (= lt!303143 (lemmaNoDuplicateFromThenFromBigger!0 lt!303142 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651879 (arrayNoDuplicates!0 lt!303142 j!136 Nil!12580)))

(declare-fun lt!303132 () Unit!22268)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38601 (_ BitVec 64) (_ BitVec 32) List!12583) Unit!22268)

(assert (=> b!651879 (= lt!303132 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303142 (select (arr!18503 a!2986) j!136) j!136 Nil!12580))))

(assert (=> b!651879 false))

(declare-fun b!651880 () Bool)

(declare-fun Unit!22272 () Unit!22268)

(assert (=> b!651880 (= e!374097 Unit!22272)))

(declare-fun b!651881 () Bool)

(assert (=> b!651881 (= e!374101 e!374103)))

(declare-fun res!422745 () Bool)

(assert (=> b!651881 (=> (not res!422745) (not e!374103))))

(assert (=> b!651881 (= res!422745 (arrayContainsKey!0 lt!303142 (select (arr!18503 a!2986) j!136) j!136))))

(declare-fun b!651882 () Bool)

(declare-fun Unit!22273 () Unit!22268)

(assert (=> b!651882 (= e!374102 Unit!22273)))

(declare-fun b!651868 () Bool)

(assert (=> b!651868 (= e!374111 e!374107)))

(declare-fun res!422750 () Bool)

(assert (=> b!651868 (=> (not res!422750) (not e!374107))))

(assert (=> b!651868 (= res!422750 (= (select (store (arr!18503 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651868 (= lt!303142 (array!38602 (store (arr!18503 a!2986) i!1108 k0!1786) (size!18868 a!2986)))))

(declare-fun res!422751 () Bool)

(assert (=> start!59090 (=> (not res!422751) (not e!374099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59090 (= res!422751 (validMask!0 mask!3053))))

(assert (=> start!59090 e!374099))

(assert (=> start!59090 true))

(declare-fun array_inv!14386 (array!38601) Bool)

(assert (=> start!59090 (array_inv!14386 a!2986)))

(assert (= (and start!59090 res!422751) b!651862))

(assert (= (and b!651862 res!422754) b!651871))

(assert (= (and b!651871 res!422755) b!651860))

(assert (= (and b!651860 res!422747) b!651865))

(assert (= (and b!651865 res!422740) b!651873))

(assert (= (and b!651873 res!422752) b!651875))

(assert (= (and b!651875 res!422756) b!651863))

(assert (= (and b!651863 res!422741) b!651878))

(assert (= (and b!651878 res!422749) b!651868))

(assert (= (and b!651868 res!422750) b!651867))

(assert (= (and b!651867 res!422753) b!651872))

(assert (= (and b!651872 res!422757) b!651876))

(assert (= (and b!651872 c!74928) b!651866))

(assert (= (and b!651872 (not c!74928)) b!651882))

(assert (= (and b!651872 (not res!422758)) b!651869))

(assert (= (and b!651869 res!422743) b!651864))

(assert (= (and b!651864 (not res!422748)) b!651881))

(assert (= (and b!651881 res!422745) b!651877))

(assert (= (and b!651869 (not res!422746)) b!651874))

(assert (= (and b!651874 c!74927) b!651879))

(assert (= (and b!651874 (not c!74927)) b!651880))

(assert (= (and b!651874 (not res!422742)) b!651861))

(assert (= (and b!651861 res!422744) b!651870))

(declare-fun m!624519 () Bool)

(assert (=> b!651879 m!624519))

(declare-fun m!624521 () Bool)

(assert (=> b!651879 m!624521))

(declare-fun m!624523 () Bool)

(assert (=> b!651879 m!624523))

(declare-fun m!624525 () Bool)

(assert (=> b!651879 m!624525))

(assert (=> b!651879 m!624519))

(declare-fun m!624527 () Bool)

(assert (=> b!651879 m!624527))

(assert (=> b!651879 m!624519))

(declare-fun m!624529 () Bool)

(assert (=> b!651879 m!624529))

(declare-fun m!624531 () Bool)

(assert (=> b!651879 m!624531))

(assert (=> b!651879 m!624519))

(declare-fun m!624533 () Bool)

(assert (=> b!651879 m!624533))

(declare-fun m!624535 () Bool)

(assert (=> b!651873 m!624535))

(declare-fun m!624537 () Bool)

(assert (=> b!651863 m!624537))

(declare-fun m!624539 () Bool)

(assert (=> start!59090 m!624539))

(declare-fun m!624541 () Bool)

(assert (=> start!59090 m!624541))

(declare-fun m!624543 () Bool)

(assert (=> b!651868 m!624543))

(declare-fun m!624545 () Bool)

(assert (=> b!651868 m!624545))

(declare-fun m!624547 () Bool)

(assert (=> b!651875 m!624547))

(assert (=> b!651877 m!624519))

(assert (=> b!651877 m!624519))

(declare-fun m!624549 () Bool)

(assert (=> b!651877 m!624549))

(declare-fun m!624551 () Bool)

(assert (=> b!651860 m!624551))

(declare-fun m!624553 () Bool)

(assert (=> b!651865 m!624553))

(assert (=> b!651861 m!624519))

(declare-fun m!624555 () Bool)

(assert (=> b!651861 m!624555))

(assert (=> b!651861 m!624519))

(declare-fun m!624557 () Bool)

(assert (=> b!651861 m!624557))

(declare-fun m!624559 () Bool)

(assert (=> b!651861 m!624559))

(assert (=> b!651861 m!624519))

(declare-fun m!624561 () Bool)

(assert (=> b!651861 m!624561))

(assert (=> b!651861 m!624531))

(assert (=> b!651861 m!624519))

(declare-fun m!624563 () Bool)

(assert (=> b!651861 m!624563))

(assert (=> b!651861 m!624523))

(assert (=> b!651869 m!624519))

(assert (=> b!651869 m!624543))

(declare-fun m!624565 () Bool)

(assert (=> b!651869 m!624565))

(assert (=> b!651871 m!624519))

(assert (=> b!651871 m!624519))

(declare-fun m!624567 () Bool)

(assert (=> b!651871 m!624567))

(declare-fun m!624569 () Bool)

(assert (=> b!651867 m!624569))

(assert (=> b!651867 m!624519))

(assert (=> b!651867 m!624519))

(declare-fun m!624571 () Bool)

(assert (=> b!651867 m!624571))

(declare-fun m!624573 () Bool)

(assert (=> b!651878 m!624573))

(assert (=> b!651870 m!624519))

(assert (=> b!651870 m!624519))

(assert (=> b!651870 m!624549))

(assert (=> b!651864 m!624519))

(assert (=> b!651881 m!624519))

(assert (=> b!651881 m!624519))

(assert (=> b!651881 m!624563))

(declare-fun m!624575 () Bool)

(assert (=> b!651872 m!624575))

(declare-fun m!624577 () Bool)

(assert (=> b!651872 m!624577))

(assert (=> b!651872 m!624519))

(declare-fun m!624579 () Bool)

(assert (=> b!651872 m!624579))

(assert (=> b!651872 m!624543))

(declare-fun m!624581 () Bool)

(assert (=> b!651872 m!624581))

(assert (=> b!651872 m!624519))

(declare-fun m!624583 () Bool)

(assert (=> b!651872 m!624583))

(declare-fun m!624585 () Bool)

(assert (=> b!651872 m!624585))

(check-sat (not b!651875) (not b!651863) (not b!651870) (not b!651881) (not b!651865) (not b!651873) (not b!651860) (not b!651867) (not b!651861) (not b!651879) (not b!651877) (not b!651872) (not b!651871) (not start!59090))
(check-sat)
