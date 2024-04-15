; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59576 () Bool)

(assert start!59576)

(declare-fun b!658147 () Bool)

(declare-fun e!378075 () Bool)

(declare-datatypes ((SeekEntryResult!7006 0))(
  ( (MissingZero!7006 (index!30389 (_ BitVec 32))) (Found!7006 (index!30390 (_ BitVec 32))) (Intermediate!7006 (undefined!7818 Bool) (index!30391 (_ BitVec 32)) (x!59188 (_ BitVec 32))) (Undefined!7006) (MissingVacant!7006 (index!30392 (_ BitVec 32))) )
))
(declare-fun lt!307618 () SeekEntryResult!7006)

(declare-fun lt!307626 () SeekEntryResult!7006)

(assert (=> b!658147 (= e!378075 (= lt!307618 lt!307626))))

(declare-fun b!658148 () Bool)

(declare-fun e!378080 () Bool)

(declare-fun e!378068 () Bool)

(assert (=> b!658148 (= e!378080 e!378068)))

(declare-fun res!426859 () Bool)

(assert (=> b!658148 (=> (not res!426859) (not e!378068))))

(declare-fun lt!307624 () SeekEntryResult!7006)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658148 (= res!426859 (or (= lt!307624 (MissingZero!7006 i!1108)) (= lt!307624 (MissingVacant!7006 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38745 0))(
  ( (array!38746 (arr!18569 (Array (_ BitVec 32) (_ BitVec 64))) (size!18934 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38745)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38745 (_ BitVec 32)) SeekEntryResult!7006)

(assert (=> b!658148 (= lt!307624 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!426866 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!658149 () Bool)

(declare-fun lt!307613 () array!38745)

(declare-fun arrayContainsKey!0 (array!38745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658149 (= res!426866 (arrayContainsKey!0 lt!307613 (select (arr!18569 a!2986) j!136) j!136))))

(declare-fun e!378067 () Bool)

(assert (=> b!658149 (=> (not res!426866) (not e!378067))))

(declare-fun e!378079 () Bool)

(assert (=> b!658149 (= e!378079 e!378067)))

(declare-fun b!658150 () Bool)

(declare-fun res!426869 () Bool)

(assert (=> b!658150 (=> (not res!426869) (not e!378068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38745 (_ BitVec 32)) Bool)

(assert (=> b!658150 (= res!426869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658151 () Bool)

(declare-fun res!426863 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658151 (= res!426863 (bvsge j!136 index!984))))

(assert (=> b!658151 (=> res!426863 e!378079)))

(declare-fun e!378078 () Bool)

(assert (=> b!658151 (= e!378078 e!378079)))

(declare-fun b!658152 () Bool)

(declare-datatypes ((Unit!22832 0))(
  ( (Unit!22833) )
))
(declare-fun e!378071 () Unit!22832)

(declare-fun Unit!22834 () Unit!22832)

(assert (=> b!658152 (= e!378071 Unit!22834)))

(declare-fun b!658153 () Bool)

(declare-fun e!378074 () Unit!22832)

(declare-fun Unit!22835 () Unit!22832)

(assert (=> b!658153 (= e!378074 Unit!22835)))

(declare-fun b!658154 () Bool)

(declare-fun Unit!22836 () Unit!22832)

(assert (=> b!658154 (= e!378071 Unit!22836)))

(assert (=> b!658154 false))

(declare-fun b!658155 () Bool)

(declare-fun e!378072 () Unit!22832)

(declare-fun Unit!22837 () Unit!22832)

(assert (=> b!658155 (= e!378072 Unit!22837)))

(declare-fun b!658156 () Bool)

(declare-fun e!378069 () Bool)

(declare-fun e!378070 () Bool)

(assert (=> b!658156 (= e!378069 e!378070)))

(declare-fun res!426867 () Bool)

(assert (=> b!658156 (=> (not res!426867) (not e!378070))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!658156 (= res!426867 (and (= lt!307618 (Found!7006 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18569 a!2986) index!984) (select (arr!18569 a!2986) j!136))) (not (= (select (arr!18569 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38745 (_ BitVec 32)) SeekEntryResult!7006)

(assert (=> b!658156 (= lt!307618 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18569 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658157 () Bool)

(declare-fun e!378076 () Bool)

(assert (=> b!658157 (= e!378076 (arrayContainsKey!0 lt!307613 (select (arr!18569 a!2986) j!136) index!984))))

(declare-fun b!658158 () Bool)

(declare-fun res!426864 () Bool)

(assert (=> b!658158 (=> (not res!426864) (not e!378068))))

(declare-datatypes ((List!12649 0))(
  ( (Nil!12646) (Cons!12645 (h!13690 (_ BitVec 64)) (t!18868 List!12649)) )
))
(declare-fun arrayNoDuplicates!0 (array!38745 (_ BitVec 32) List!12649) Bool)

(assert (=> b!658158 (= res!426864 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12646))))

(declare-fun b!658159 () Bool)

(declare-fun e!378077 () Unit!22832)

(declare-fun Unit!22838 () Unit!22832)

(assert (=> b!658159 (= e!378077 Unit!22838)))

(declare-fun b!658160 () Bool)

(assert (=> b!658160 false))

(declare-fun lt!307625 () Unit!22832)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38745 (_ BitVec 64) (_ BitVec 32) List!12649) Unit!22832)

(assert (=> b!658160 (= lt!307625 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307613 (select (arr!18569 a!2986) j!136) index!984 Nil!12646))))

(assert (=> b!658160 (arrayNoDuplicates!0 lt!307613 index!984 Nil!12646)))

(declare-fun lt!307628 () Unit!22832)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38745 (_ BitVec 32) (_ BitVec 32)) Unit!22832)

(assert (=> b!658160 (= lt!307628 (lemmaNoDuplicateFromThenFromBigger!0 lt!307613 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658160 (arrayNoDuplicates!0 lt!307613 #b00000000000000000000000000000000 Nil!12646)))

(declare-fun lt!307615 () Unit!22832)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38745 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12649) Unit!22832)

(assert (=> b!658160 (= lt!307615 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12646))))

(assert (=> b!658160 (arrayContainsKey!0 lt!307613 (select (arr!18569 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307621 () Unit!22832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38745 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22832)

(assert (=> b!658160 (= lt!307621 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307613 (select (arr!18569 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658160 e!378076))

(declare-fun res!426861 () Bool)

(assert (=> b!658160 (=> (not res!426861) (not e!378076))))

(assert (=> b!658160 (= res!426861 (arrayContainsKey!0 lt!307613 (select (arr!18569 a!2986) j!136) j!136))))

(declare-fun Unit!22839 () Unit!22832)

(assert (=> b!658160 (= e!378072 Unit!22839)))

(declare-fun b!658161 () Bool)

(declare-fun res!426868 () Bool)

(assert (=> b!658161 (=> (not res!426868) (not e!378080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658161 (= res!426868 (validKeyInArray!0 k0!1786))))

(declare-fun b!658162 () Bool)

(declare-fun res!426874 () Bool)

(assert (=> b!658162 (=> (not res!426874) (not e!378080))))

(assert (=> b!658162 (= res!426874 (and (= (size!18934 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18934 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18934 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658163 () Bool)

(declare-fun res!426872 () Bool)

(assert (=> b!658163 (=> (not res!426872) (not e!378068))))

(assert (=> b!658163 (= res!426872 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18569 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!426862 () Bool)

(assert (=> start!59576 (=> (not res!426862) (not e!378080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59576 (= res!426862 (validMask!0 mask!3053))))

(assert (=> start!59576 e!378080))

(assert (=> start!59576 true))

(declare-fun array_inv!14452 (array!38745) Bool)

(assert (=> start!59576 (array_inv!14452 a!2986)))

(declare-fun b!658164 () Bool)

(assert (=> b!658164 (= e!378068 e!378069)))

(declare-fun res!426870 () Bool)

(assert (=> b!658164 (=> (not res!426870) (not e!378069))))

(assert (=> b!658164 (= res!426870 (= (select (store (arr!18569 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658164 (= lt!307613 (array!38746 (store (arr!18569 a!2986) i!1108 k0!1786) (size!18934 a!2986)))))

(declare-fun b!658165 () Bool)

(declare-fun Unit!22840 () Unit!22832)

(assert (=> b!658165 (= e!378074 Unit!22840)))

(declare-fun res!426871 () Bool)

(assert (=> b!658165 (= res!426871 (= (select (store (arr!18569 a!2986) i!1108 k0!1786) index!984) (select (arr!18569 a!2986) j!136)))))

(assert (=> b!658165 (=> (not res!426871) (not e!378078))))

(assert (=> b!658165 e!378078))

(declare-fun c!76011 () Bool)

(assert (=> b!658165 (= c!76011 (bvslt j!136 index!984))))

(declare-fun lt!307632 () Unit!22832)

(assert (=> b!658165 (= lt!307632 e!378077)))

(declare-fun c!76012 () Bool)

(assert (=> b!658165 (= c!76012 (bvslt index!984 j!136))))

(declare-fun lt!307630 () Unit!22832)

(assert (=> b!658165 (= lt!307630 e!378072)))

(assert (=> b!658165 false))

(declare-fun b!658166 () Bool)

(assert (=> b!658166 (= e!378070 (not true))))

(declare-fun lt!307616 () Unit!22832)

(assert (=> b!658166 (= lt!307616 e!378074)))

(declare-fun c!76013 () Bool)

(declare-fun lt!307622 () SeekEntryResult!7006)

(assert (=> b!658166 (= c!76013 (= lt!307622 (Found!7006 index!984)))))

(declare-fun lt!307620 () Unit!22832)

(assert (=> b!658166 (= lt!307620 e!378071)))

(declare-fun c!76014 () Bool)

(assert (=> b!658166 (= c!76014 (= lt!307622 Undefined!7006))))

(declare-fun lt!307627 () (_ BitVec 64))

(assert (=> b!658166 (= lt!307622 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307627 lt!307613 mask!3053))))

(assert (=> b!658166 e!378075))

(declare-fun res!426873 () Bool)

(assert (=> b!658166 (=> (not res!426873) (not e!378075))))

(declare-fun lt!307619 () (_ BitVec 32))

(assert (=> b!658166 (= res!426873 (= lt!307626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307619 vacantSpotIndex!68 lt!307627 lt!307613 mask!3053)))))

(assert (=> b!658166 (= lt!307626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307619 vacantSpotIndex!68 (select (arr!18569 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658166 (= lt!307627 (select (store (arr!18569 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307631 () Unit!22832)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22832)

(assert (=> b!658166 (= lt!307631 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307619 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658166 (= lt!307619 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658167 () Bool)

(declare-fun res!426860 () Bool)

(assert (=> b!658167 (=> (not res!426860) (not e!378080))))

(assert (=> b!658167 (= res!426860 (validKeyInArray!0 (select (arr!18569 a!2986) j!136)))))

(declare-fun b!658168 () Bool)

(assert (=> b!658168 false))

(declare-fun lt!307614 () Unit!22832)

(assert (=> b!658168 (= lt!307614 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307613 (select (arr!18569 a!2986) j!136) j!136 Nil!12646))))

(assert (=> b!658168 (arrayNoDuplicates!0 lt!307613 j!136 Nil!12646)))

(declare-fun lt!307617 () Unit!22832)

(assert (=> b!658168 (= lt!307617 (lemmaNoDuplicateFromThenFromBigger!0 lt!307613 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658168 (arrayNoDuplicates!0 lt!307613 #b00000000000000000000000000000000 Nil!12646)))

(declare-fun lt!307629 () Unit!22832)

(assert (=> b!658168 (= lt!307629 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12646))))

(assert (=> b!658168 (arrayContainsKey!0 lt!307613 (select (arr!18569 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307623 () Unit!22832)

(assert (=> b!658168 (= lt!307623 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307613 (select (arr!18569 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22841 () Unit!22832)

(assert (=> b!658168 (= e!378077 Unit!22841)))

(declare-fun b!658169 () Bool)

(assert (=> b!658169 (= e!378067 (arrayContainsKey!0 lt!307613 (select (arr!18569 a!2986) j!136) index!984))))

(declare-fun b!658170 () Bool)

(declare-fun res!426865 () Bool)

(assert (=> b!658170 (=> (not res!426865) (not e!378080))))

(assert (=> b!658170 (= res!426865 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!59576 res!426862) b!658162))

(assert (= (and b!658162 res!426874) b!658167))

(assert (= (and b!658167 res!426860) b!658161))

(assert (= (and b!658161 res!426868) b!658170))

(assert (= (and b!658170 res!426865) b!658148))

(assert (= (and b!658148 res!426859) b!658150))

(assert (= (and b!658150 res!426869) b!658158))

(assert (= (and b!658158 res!426864) b!658163))

(assert (= (and b!658163 res!426872) b!658164))

(assert (= (and b!658164 res!426870) b!658156))

(assert (= (and b!658156 res!426867) b!658166))

(assert (= (and b!658166 res!426873) b!658147))

(assert (= (and b!658166 c!76014) b!658154))

(assert (= (and b!658166 (not c!76014)) b!658152))

(assert (= (and b!658166 c!76013) b!658165))

(assert (= (and b!658166 (not c!76013)) b!658153))

(assert (= (and b!658165 res!426871) b!658151))

(assert (= (and b!658151 (not res!426863)) b!658149))

(assert (= (and b!658149 res!426866) b!658169))

(assert (= (and b!658165 c!76011) b!658168))

(assert (= (and b!658165 (not c!76011)) b!658159))

(assert (= (and b!658165 c!76012) b!658160))

(assert (= (and b!658165 (not c!76012)) b!658155))

(assert (= (and b!658160 res!426861) b!658157))

(declare-fun m!630645 () Bool)

(assert (=> b!658169 m!630645))

(assert (=> b!658169 m!630645))

(declare-fun m!630647 () Bool)

(assert (=> b!658169 m!630647))

(declare-fun m!630649 () Bool)

(assert (=> b!658166 m!630649))

(declare-fun m!630651 () Bool)

(assert (=> b!658166 m!630651))

(declare-fun m!630653 () Bool)

(assert (=> b!658166 m!630653))

(assert (=> b!658166 m!630645))

(declare-fun m!630655 () Bool)

(assert (=> b!658166 m!630655))

(declare-fun m!630657 () Bool)

(assert (=> b!658166 m!630657))

(declare-fun m!630659 () Bool)

(assert (=> b!658166 m!630659))

(assert (=> b!658166 m!630645))

(declare-fun m!630661 () Bool)

(assert (=> b!658166 m!630661))

(declare-fun m!630663 () Bool)

(assert (=> b!658148 m!630663))

(declare-fun m!630665 () Bool)

(assert (=> b!658170 m!630665))

(declare-fun m!630667 () Bool)

(assert (=> b!658156 m!630667))

(assert (=> b!658156 m!630645))

(assert (=> b!658156 m!630645))

(declare-fun m!630669 () Bool)

(assert (=> b!658156 m!630669))

(assert (=> b!658164 m!630655))

(declare-fun m!630671 () Bool)

(assert (=> b!658164 m!630671))

(assert (=> b!658168 m!630645))

(declare-fun m!630673 () Bool)

(assert (=> b!658168 m!630673))

(declare-fun m!630675 () Bool)

(assert (=> b!658168 m!630675))

(assert (=> b!658168 m!630645))

(declare-fun m!630677 () Bool)

(assert (=> b!658168 m!630677))

(declare-fun m!630679 () Bool)

(assert (=> b!658168 m!630679))

(assert (=> b!658168 m!630645))

(declare-fun m!630681 () Bool)

(assert (=> b!658168 m!630681))

(declare-fun m!630683 () Bool)

(assert (=> b!658168 m!630683))

(assert (=> b!658168 m!630645))

(declare-fun m!630685 () Bool)

(assert (=> b!658168 m!630685))

(declare-fun m!630687 () Bool)

(assert (=> start!59576 m!630687))

(declare-fun m!630689 () Bool)

(assert (=> start!59576 m!630689))

(assert (=> b!658165 m!630655))

(declare-fun m!630691 () Bool)

(assert (=> b!658165 m!630691))

(assert (=> b!658165 m!630645))

(assert (=> b!658157 m!630645))

(assert (=> b!658157 m!630645))

(assert (=> b!658157 m!630647))

(assert (=> b!658160 m!630645))

(declare-fun m!630693 () Bool)

(assert (=> b!658160 m!630693))

(declare-fun m!630695 () Bool)

(assert (=> b!658160 m!630695))

(assert (=> b!658160 m!630645))

(declare-fun m!630697 () Bool)

(assert (=> b!658160 m!630697))

(assert (=> b!658160 m!630645))

(declare-fun m!630699 () Bool)

(assert (=> b!658160 m!630699))

(assert (=> b!658160 m!630679))

(assert (=> b!658160 m!630645))

(assert (=> b!658160 m!630681))

(assert (=> b!658160 m!630645))

(declare-fun m!630701 () Bool)

(assert (=> b!658160 m!630701))

(declare-fun m!630703 () Bool)

(assert (=> b!658160 m!630703))

(declare-fun m!630705 () Bool)

(assert (=> b!658163 m!630705))

(assert (=> b!658149 m!630645))

(assert (=> b!658149 m!630645))

(assert (=> b!658149 m!630701))

(declare-fun m!630707 () Bool)

(assert (=> b!658150 m!630707))

(assert (=> b!658167 m!630645))

(assert (=> b!658167 m!630645))

(declare-fun m!630709 () Bool)

(assert (=> b!658167 m!630709))

(declare-fun m!630711 () Bool)

(assert (=> b!658161 m!630711))

(declare-fun m!630713 () Bool)

(assert (=> b!658158 m!630713))

(check-sat (not b!658168) (not b!658158) (not b!658170) (not b!658156) (not b!658149) (not b!658160) (not b!658169) (not b!658167) (not b!658166) (not b!658161) (not b!658148) (not start!59576) (not b!658150) (not b!658157))
(check-sat)
