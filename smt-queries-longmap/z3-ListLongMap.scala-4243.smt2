; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58806 () Bool)

(assert start!58806)

(declare-fun b!648005 () Bool)

(declare-fun e!371619 () Bool)

(declare-fun e!371612 () Bool)

(assert (=> b!648005 (= e!371619 e!371612)))

(declare-fun res!419798 () Bool)

(assert (=> b!648005 (=> (not res!419798) (not e!371612))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6850 0))(
  ( (MissingZero!6850 (index!29744 (_ BitVec 32))) (Found!6850 (index!29745 (_ BitVec 32))) (Intermediate!6850 (undefined!7662 Bool) (index!29746 (_ BitVec 32)) (x!58681 (_ BitVec 32))) (Undefined!6850) (MissingVacant!6850 (index!29747 (_ BitVec 32))) )
))
(declare-fun lt!300715 () SeekEntryResult!6850)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38499 0))(
  ( (array!38500 (arr!18454 (Array (_ BitVec 32) (_ BitVec 64))) (size!18818 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38499)

(assert (=> b!648005 (= res!419798 (and (= lt!300715 (Found!6850 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18454 a!2986) index!984) (select (arr!18454 a!2986) j!136))) (not (= (select (arr!18454 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38499 (_ BitVec 32)) SeekEntryResult!6850)

(assert (=> b!648005 (= lt!300715 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648006 () Bool)

(declare-fun res!419812 () Bool)

(declare-fun e!371609 () Bool)

(assert (=> b!648006 (=> (not res!419812) (not e!371609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38499 (_ BitVec 32)) Bool)

(assert (=> b!648006 (= res!419812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648007 () Bool)

(declare-fun e!371610 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12402 0))(
  ( (Nil!12399) (Cons!12398 (h!13446 (_ BitVec 64)) (t!18622 List!12402)) )
))
(declare-fun contains!3134 (List!12402 (_ BitVec 64)) Bool)

(assert (=> b!648007 (= e!371610 (not (contains!3134 Nil!12399 k0!1786)))))

(declare-fun b!648008 () Bool)

(declare-datatypes ((Unit!21999 0))(
  ( (Unit!22000) )
))
(declare-fun e!371611 () Unit!21999)

(declare-fun Unit!22001 () Unit!21999)

(assert (=> b!648008 (= e!371611 Unit!22001)))

(declare-fun b!648009 () Bool)

(declare-fun res!419802 () Bool)

(declare-fun e!371607 () Bool)

(assert (=> b!648009 (=> (not res!419802) (not e!371607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648009 (= res!419802 (validKeyInArray!0 k0!1786))))

(declare-fun b!648010 () Bool)

(declare-fun e!371620 () Bool)

(declare-fun e!371622 () Bool)

(assert (=> b!648010 (= e!371620 e!371622)))

(declare-fun res!419792 () Bool)

(assert (=> b!648010 (=> res!419792 e!371622)))

(assert (=> b!648010 (= res!419792 (bvsge index!984 j!136))))

(declare-fun lt!300716 () Unit!21999)

(assert (=> b!648010 (= lt!300716 e!371611)))

(declare-fun c!74477 () Bool)

(assert (=> b!648010 (= c!74477 (bvslt j!136 index!984))))

(declare-fun lt!300722 () array!38499)

(declare-fun b!648011 () Bool)

(declare-fun e!371616 () Bool)

(declare-fun arrayContainsKey!0 (array!38499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648011 (= e!371616 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) index!984))))

(declare-fun b!648012 () Bool)

(assert (=> b!648012 (= e!371609 e!371619)))

(declare-fun res!419806 () Bool)

(assert (=> b!648012 (=> (not res!419806) (not e!371619))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648012 (= res!419806 (= (select (store (arr!18454 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648012 (= lt!300722 (array!38500 (store (arr!18454 a!2986) i!1108 k0!1786) (size!18818 a!2986)))))

(declare-fun b!648013 () Bool)

(declare-fun e!371614 () Unit!21999)

(declare-fun Unit!22002 () Unit!21999)

(assert (=> b!648013 (= e!371614 Unit!22002)))

(declare-fun b!648014 () Bool)

(assert (=> b!648014 (= e!371622 e!371610)))

(declare-fun res!419803 () Bool)

(assert (=> b!648014 (=> res!419803 e!371610)))

(assert (=> b!648014 (= res!419803 (or (bvsge (size!18818 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18818 a!2986))))))

(assert (=> b!648014 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300713 () Unit!21999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21999)

(assert (=> b!648014 (= lt!300713 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300722 (select (arr!18454 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!648014 e!371616))

(declare-fun res!419793 () Bool)

(assert (=> b!648014 (=> (not res!419793) (not e!371616))))

(assert (=> b!648014 (= res!419793 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) j!136))))

(declare-fun b!648015 () Bool)

(declare-fun res!419805 () Bool)

(assert (=> b!648015 (=> res!419805 e!371610)))

(assert (=> b!648015 (= res!419805 (contains!3134 Nil!12399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648016 () Bool)

(declare-fun res!419797 () Bool)

(assert (=> b!648016 (=> (not res!419797) (not e!371609))))

(declare-fun arrayNoDuplicates!0 (array!38499 (_ BitVec 32) List!12402) Bool)

(assert (=> b!648016 (= res!419797 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12399))))

(declare-fun b!648017 () Bool)

(declare-fun res!419808 () Bool)

(assert (=> b!648017 (=> (not res!419808) (not e!371607))))

(assert (=> b!648017 (= res!419808 (and (= (size!18818 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18818 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648018 () Bool)

(declare-fun res!419804 () Bool)

(assert (=> b!648018 (=> (not res!419804) (not e!371609))))

(assert (=> b!648018 (= res!419804 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18454 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648019 () Bool)

(declare-fun e!371613 () Bool)

(declare-fun e!371608 () Bool)

(assert (=> b!648019 (= e!371613 e!371608)))

(declare-fun res!419799 () Bool)

(assert (=> b!648019 (=> (not res!419799) (not e!371608))))

(assert (=> b!648019 (= res!419799 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) j!136))))

(declare-fun b!648020 () Bool)

(declare-fun res!419809 () Bool)

(assert (=> b!648020 (=> res!419809 e!371610)))

(assert (=> b!648020 (= res!419809 (contains!3134 Nil!12399 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648021 () Bool)

(declare-fun res!419807 () Bool)

(assert (=> b!648021 (=> (not res!419807) (not e!371607))))

(assert (=> b!648021 (= res!419807 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648022 () Bool)

(declare-fun e!371615 () Bool)

(assert (=> b!648022 (= e!371612 (not e!371615))))

(declare-fun res!419810 () Bool)

(assert (=> b!648022 (=> res!419810 e!371615)))

(declare-fun lt!300724 () SeekEntryResult!6850)

(assert (=> b!648022 (= res!419810 (not (= lt!300724 (Found!6850 index!984))))))

(declare-fun lt!300720 () Unit!21999)

(assert (=> b!648022 (= lt!300720 e!371614)))

(declare-fun c!74476 () Bool)

(assert (=> b!648022 (= c!74476 (= lt!300724 Undefined!6850))))

(declare-fun lt!300719 () (_ BitVec 64))

(assert (=> b!648022 (= lt!300724 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300719 lt!300722 mask!3053))))

(declare-fun e!371617 () Bool)

(assert (=> b!648022 e!371617))

(declare-fun res!419811 () Bool)

(assert (=> b!648022 (=> (not res!419811) (not e!371617))))

(declare-fun lt!300717 () SeekEntryResult!6850)

(declare-fun lt!300721 () (_ BitVec 32))

(assert (=> b!648022 (= res!419811 (= lt!300717 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 lt!300719 lt!300722 mask!3053)))))

(assert (=> b!648022 (= lt!300717 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648022 (= lt!300719 (select (store (arr!18454 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300726 () Unit!21999)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21999)

(assert (=> b!648022 (= lt!300726 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648022 (= lt!300721 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!648023 () Bool)

(declare-fun res!419800 () Bool)

(assert (=> b!648023 (=> (not res!419800) (not e!371607))))

(assert (=> b!648023 (= res!419800 (validKeyInArray!0 (select (arr!18454 a!2986) j!136)))))

(declare-fun b!648024 () Bool)

(declare-fun Unit!22003 () Unit!21999)

(assert (=> b!648024 (= e!371614 Unit!22003)))

(assert (=> b!648024 false))

(declare-fun b!648025 () Bool)

(declare-fun res!419801 () Bool)

(assert (=> b!648025 (=> res!419801 e!371610)))

(declare-fun noDuplicate!421 (List!12402) Bool)

(assert (=> b!648025 (= res!419801 (not (noDuplicate!421 Nil!12399)))))

(declare-fun b!648026 () Bool)

(assert (=> b!648026 (= e!371607 e!371609)))

(declare-fun res!419795 () Bool)

(assert (=> b!648026 (=> (not res!419795) (not e!371609))))

(declare-fun lt!300725 () SeekEntryResult!6850)

(assert (=> b!648026 (= res!419795 (or (= lt!300725 (MissingZero!6850 i!1108)) (= lt!300725 (MissingVacant!6850 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38499 (_ BitVec 32)) SeekEntryResult!6850)

(assert (=> b!648026 (= lt!300725 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648027 () Bool)

(assert (=> b!648027 (= e!371615 e!371620)))

(declare-fun res!419791 () Bool)

(assert (=> b!648027 (=> res!419791 e!371620)))

(declare-fun lt!300723 () (_ BitVec 64))

(assert (=> b!648027 (= res!419791 (or (not (= (select (arr!18454 a!2986) j!136) lt!300719)) (not (= (select (arr!18454 a!2986) j!136) lt!300723))))))

(declare-fun e!371621 () Bool)

(assert (=> b!648027 e!371621))

(declare-fun res!419794 () Bool)

(assert (=> b!648027 (=> (not res!419794) (not e!371621))))

(assert (=> b!648027 (= res!419794 (= lt!300723 (select (arr!18454 a!2986) j!136)))))

(assert (=> b!648027 (= lt!300723 (select (store (arr!18454 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648028 () Bool)

(assert (=> b!648028 (= e!371617 (= lt!300715 lt!300717))))

(declare-fun res!419790 () Bool)

(assert (=> start!58806 (=> (not res!419790) (not e!371607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58806 (= res!419790 (validMask!0 mask!3053))))

(assert (=> start!58806 e!371607))

(assert (=> start!58806 true))

(declare-fun array_inv!14313 (array!38499) Bool)

(assert (=> start!58806 (array_inv!14313 a!2986)))

(declare-fun b!648029 () Bool)

(declare-fun Unit!22004 () Unit!21999)

(assert (=> b!648029 (= e!371611 Unit!22004)))

(declare-fun lt!300727 () Unit!21999)

(assert (=> b!648029 (= lt!300727 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300722 (select (arr!18454 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648029 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300712 () Unit!21999)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12402) Unit!21999)

(assert (=> b!648029 (= lt!300712 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12399))))

(assert (=> b!648029 (arrayNoDuplicates!0 lt!300722 #b00000000000000000000000000000000 Nil!12399)))

(declare-fun lt!300714 () Unit!21999)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38499 (_ BitVec 32) (_ BitVec 32)) Unit!21999)

(assert (=> b!648029 (= lt!300714 (lemmaNoDuplicateFromThenFromBigger!0 lt!300722 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648029 (arrayNoDuplicates!0 lt!300722 j!136 Nil!12399)))

(declare-fun lt!300718 () Unit!21999)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38499 (_ BitVec 64) (_ BitVec 32) List!12402) Unit!21999)

(assert (=> b!648029 (= lt!300718 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300722 (select (arr!18454 a!2986) j!136) j!136 Nil!12399))))

(assert (=> b!648029 false))

(declare-fun b!648030 () Bool)

(assert (=> b!648030 (= e!371621 e!371613)))

(declare-fun res!419796 () Bool)

(assert (=> b!648030 (=> res!419796 e!371613)))

(assert (=> b!648030 (= res!419796 (or (not (= (select (arr!18454 a!2986) j!136) lt!300719)) (not (= (select (arr!18454 a!2986) j!136) lt!300723)) (bvsge j!136 index!984)))))

(declare-fun b!648031 () Bool)

(assert (=> b!648031 (= e!371608 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) index!984))))

(assert (= (and start!58806 res!419790) b!648017))

(assert (= (and b!648017 res!419808) b!648023))

(assert (= (and b!648023 res!419800) b!648009))

(assert (= (and b!648009 res!419802) b!648021))

(assert (= (and b!648021 res!419807) b!648026))

(assert (= (and b!648026 res!419795) b!648006))

(assert (= (and b!648006 res!419812) b!648016))

(assert (= (and b!648016 res!419797) b!648018))

(assert (= (and b!648018 res!419804) b!648012))

(assert (= (and b!648012 res!419806) b!648005))

(assert (= (and b!648005 res!419798) b!648022))

(assert (= (and b!648022 res!419811) b!648028))

(assert (= (and b!648022 c!74476) b!648024))

(assert (= (and b!648022 (not c!74476)) b!648013))

(assert (= (and b!648022 (not res!419810)) b!648027))

(assert (= (and b!648027 res!419794) b!648030))

(assert (= (and b!648030 (not res!419796)) b!648019))

(assert (= (and b!648019 res!419799) b!648031))

(assert (= (and b!648027 (not res!419791)) b!648010))

(assert (= (and b!648010 c!74477) b!648029))

(assert (= (and b!648010 (not c!74477)) b!648008))

(assert (= (and b!648010 (not res!419792)) b!648014))

(assert (= (and b!648014 res!419793) b!648011))

(assert (= (and b!648014 (not res!419803)) b!648025))

(assert (= (and b!648025 (not res!419801)) b!648015))

(assert (= (and b!648015 (not res!419805)) b!648020))

(assert (= (and b!648020 (not res!419809)) b!648007))

(declare-fun m!621823 () Bool)

(assert (=> b!648014 m!621823))

(assert (=> b!648014 m!621823))

(declare-fun m!621825 () Bool)

(assert (=> b!648014 m!621825))

(assert (=> b!648014 m!621823))

(declare-fun m!621827 () Bool)

(assert (=> b!648014 m!621827))

(assert (=> b!648014 m!621823))

(declare-fun m!621829 () Bool)

(assert (=> b!648014 m!621829))

(declare-fun m!621831 () Bool)

(assert (=> b!648021 m!621831))

(declare-fun m!621833 () Bool)

(assert (=> b!648009 m!621833))

(declare-fun m!621835 () Bool)

(assert (=> b!648022 m!621835))

(declare-fun m!621837 () Bool)

(assert (=> b!648022 m!621837))

(assert (=> b!648022 m!621823))

(declare-fun m!621839 () Bool)

(assert (=> b!648022 m!621839))

(assert (=> b!648022 m!621823))

(declare-fun m!621841 () Bool)

(assert (=> b!648022 m!621841))

(declare-fun m!621843 () Bool)

(assert (=> b!648022 m!621843))

(declare-fun m!621845 () Bool)

(assert (=> b!648022 m!621845))

(declare-fun m!621847 () Bool)

(assert (=> b!648022 m!621847))

(declare-fun m!621849 () Bool)

(assert (=> b!648006 m!621849))

(declare-fun m!621851 () Bool)

(assert (=> b!648020 m!621851))

(declare-fun m!621853 () Bool)

(assert (=> b!648015 m!621853))

(assert (=> b!648031 m!621823))

(assert (=> b!648031 m!621823))

(declare-fun m!621855 () Bool)

(assert (=> b!648031 m!621855))

(assert (=> b!648027 m!621823))

(assert (=> b!648027 m!621839))

(declare-fun m!621857 () Bool)

(assert (=> b!648027 m!621857))

(declare-fun m!621859 () Bool)

(assert (=> b!648018 m!621859))

(declare-fun m!621861 () Bool)

(assert (=> b!648005 m!621861))

(assert (=> b!648005 m!621823))

(assert (=> b!648005 m!621823))

(declare-fun m!621863 () Bool)

(assert (=> b!648005 m!621863))

(declare-fun m!621865 () Bool)

(assert (=> b!648026 m!621865))

(declare-fun m!621867 () Bool)

(assert (=> b!648029 m!621867))

(assert (=> b!648029 m!621823))

(assert (=> b!648029 m!621823))

(declare-fun m!621869 () Bool)

(assert (=> b!648029 m!621869))

(declare-fun m!621871 () Bool)

(assert (=> b!648029 m!621871))

(declare-fun m!621873 () Bool)

(assert (=> b!648029 m!621873))

(assert (=> b!648029 m!621823))

(declare-fun m!621875 () Bool)

(assert (=> b!648029 m!621875))

(assert (=> b!648029 m!621823))

(declare-fun m!621877 () Bool)

(assert (=> b!648029 m!621877))

(declare-fun m!621879 () Bool)

(assert (=> b!648029 m!621879))

(declare-fun m!621881 () Bool)

(assert (=> b!648016 m!621881))

(assert (=> b!648011 m!621823))

(assert (=> b!648011 m!621823))

(assert (=> b!648011 m!621855))

(declare-fun m!621883 () Bool)

(assert (=> b!648007 m!621883))

(declare-fun m!621885 () Bool)

(assert (=> start!58806 m!621885))

(declare-fun m!621887 () Bool)

(assert (=> start!58806 m!621887))

(declare-fun m!621889 () Bool)

(assert (=> b!648025 m!621889))

(assert (=> b!648019 m!621823))

(assert (=> b!648019 m!621823))

(assert (=> b!648019 m!621829))

(assert (=> b!648023 m!621823))

(assert (=> b!648023 m!621823))

(declare-fun m!621891 () Bool)

(assert (=> b!648023 m!621891))

(assert (=> b!648012 m!621839))

(declare-fun m!621893 () Bool)

(assert (=> b!648012 m!621893))

(assert (=> b!648030 m!621823))

(check-sat (not b!648025) (not b!648005) (not b!648020) (not b!648007) (not b!648011) (not b!648019) (not b!648016) (not b!648031) (not b!648026) (not b!648006) (not b!648023) (not b!648029) (not b!648015) (not b!648014) (not b!648022) (not start!58806) (not b!648021) (not b!648009))
(check-sat)
(get-model)

(declare-fun d!91823 () Bool)

(declare-fun lt!300826 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!251 (List!12402) (InoxSet (_ BitVec 64)))

(assert (=> d!91823 (= lt!300826 (select (content!251 Nil!12399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371724 () Bool)

(assert (=> d!91823 (= lt!300826 e!371724)))

(declare-fun res!419956 () Bool)

(assert (=> d!91823 (=> (not res!419956) (not e!371724))))

(get-info :version)

(assert (=> d!91823 (= res!419956 ((_ is Cons!12398) Nil!12399))))

(assert (=> d!91823 (= (contains!3134 Nil!12399 #b0000000000000000000000000000000000000000000000000000000000000000) lt!300826)))

(declare-fun b!648198 () Bool)

(declare-fun e!371723 () Bool)

(assert (=> b!648198 (= e!371724 e!371723)))

(declare-fun res!419955 () Bool)

(assert (=> b!648198 (=> res!419955 e!371723)))

(assert (=> b!648198 (= res!419955 (= (h!13446 Nil!12399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648199 () Bool)

(assert (=> b!648199 (= e!371723 (contains!3134 (t!18622 Nil!12399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91823 res!419956) b!648198))

(assert (= (and b!648198 (not res!419955)) b!648199))

(declare-fun m!622039 () Bool)

(assert (=> d!91823 m!622039))

(declare-fun m!622041 () Bool)

(assert (=> d!91823 m!622041))

(declare-fun m!622043 () Bool)

(assert (=> b!648199 m!622043))

(assert (=> b!648015 d!91823))

(declare-fun b!648212 () Bool)

(declare-fun c!74496 () Bool)

(declare-fun lt!300833 () (_ BitVec 64))

(assert (=> b!648212 (= c!74496 (= lt!300833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371733 () SeekEntryResult!6850)

(declare-fun e!371732 () SeekEntryResult!6850)

(assert (=> b!648212 (= e!371733 e!371732)))

(declare-fun b!648213 () Bool)

(declare-fun e!371731 () SeekEntryResult!6850)

(assert (=> b!648213 (= e!371731 Undefined!6850)))

(declare-fun b!648214 () Bool)

(declare-fun lt!300834 () SeekEntryResult!6850)

(assert (=> b!648214 (= e!371732 (MissingZero!6850 (index!29746 lt!300834)))))

(declare-fun d!91825 () Bool)

(declare-fun lt!300835 () SeekEntryResult!6850)

(assert (=> d!91825 (and (or ((_ is Undefined!6850) lt!300835) (not ((_ is Found!6850) lt!300835)) (and (bvsge (index!29745 lt!300835) #b00000000000000000000000000000000) (bvslt (index!29745 lt!300835) (size!18818 a!2986)))) (or ((_ is Undefined!6850) lt!300835) ((_ is Found!6850) lt!300835) (not ((_ is MissingZero!6850) lt!300835)) (and (bvsge (index!29744 lt!300835) #b00000000000000000000000000000000) (bvslt (index!29744 lt!300835) (size!18818 a!2986)))) (or ((_ is Undefined!6850) lt!300835) ((_ is Found!6850) lt!300835) ((_ is MissingZero!6850) lt!300835) (not ((_ is MissingVacant!6850) lt!300835)) (and (bvsge (index!29747 lt!300835) #b00000000000000000000000000000000) (bvslt (index!29747 lt!300835) (size!18818 a!2986)))) (or ((_ is Undefined!6850) lt!300835) (ite ((_ is Found!6850) lt!300835) (= (select (arr!18454 a!2986) (index!29745 lt!300835)) k0!1786) (ite ((_ is MissingZero!6850) lt!300835) (= (select (arr!18454 a!2986) (index!29744 lt!300835)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6850) lt!300835) (= (select (arr!18454 a!2986) (index!29747 lt!300835)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91825 (= lt!300835 e!371731)))

(declare-fun c!74498 () Bool)

(assert (=> d!91825 (= c!74498 (and ((_ is Intermediate!6850) lt!300834) (undefined!7662 lt!300834)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38499 (_ BitVec 32)) SeekEntryResult!6850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91825 (= lt!300834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91825 (validMask!0 mask!3053)))

(assert (=> d!91825 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300835)))

(declare-fun b!648215 () Bool)

(assert (=> b!648215 (= e!371733 (Found!6850 (index!29746 lt!300834)))))

(declare-fun b!648216 () Bool)

(assert (=> b!648216 (= e!371731 e!371733)))

(assert (=> b!648216 (= lt!300833 (select (arr!18454 a!2986) (index!29746 lt!300834)))))

(declare-fun c!74497 () Bool)

(assert (=> b!648216 (= c!74497 (= lt!300833 k0!1786))))

(declare-fun b!648217 () Bool)

(assert (=> b!648217 (= e!371732 (seekKeyOrZeroReturnVacant!0 (x!58681 lt!300834) (index!29746 lt!300834) (index!29746 lt!300834) k0!1786 a!2986 mask!3053))))

(assert (= (and d!91825 c!74498) b!648213))

(assert (= (and d!91825 (not c!74498)) b!648216))

(assert (= (and b!648216 c!74497) b!648215))

(assert (= (and b!648216 (not c!74497)) b!648212))

(assert (= (and b!648212 c!74496) b!648214))

(assert (= (and b!648212 (not c!74496)) b!648217))

(assert (=> d!91825 m!621885))

(declare-fun m!622045 () Bool)

(assert (=> d!91825 m!622045))

(declare-fun m!622047 () Bool)

(assert (=> d!91825 m!622047))

(declare-fun m!622049 () Bool)

(assert (=> d!91825 m!622049))

(assert (=> d!91825 m!622047))

(declare-fun m!622051 () Bool)

(assert (=> d!91825 m!622051))

(declare-fun m!622053 () Bool)

(assert (=> d!91825 m!622053))

(declare-fun m!622055 () Bool)

(assert (=> b!648216 m!622055))

(declare-fun m!622057 () Bool)

(assert (=> b!648217 m!622057))

(assert (=> b!648026 d!91825))

(declare-fun b!648230 () Bool)

(declare-fun e!371742 () SeekEntryResult!6850)

(assert (=> b!648230 (= e!371742 Undefined!6850)))

(declare-fun d!91827 () Bool)

(declare-fun lt!300841 () SeekEntryResult!6850)

(assert (=> d!91827 (and (or ((_ is Undefined!6850) lt!300841) (not ((_ is Found!6850) lt!300841)) (and (bvsge (index!29745 lt!300841) #b00000000000000000000000000000000) (bvslt (index!29745 lt!300841) (size!18818 a!2986)))) (or ((_ is Undefined!6850) lt!300841) ((_ is Found!6850) lt!300841) (not ((_ is MissingVacant!6850) lt!300841)) (not (= (index!29747 lt!300841) vacantSpotIndex!68)) (and (bvsge (index!29747 lt!300841) #b00000000000000000000000000000000) (bvslt (index!29747 lt!300841) (size!18818 a!2986)))) (or ((_ is Undefined!6850) lt!300841) (ite ((_ is Found!6850) lt!300841) (= (select (arr!18454 a!2986) (index!29745 lt!300841)) (select (arr!18454 a!2986) j!136)) (and ((_ is MissingVacant!6850) lt!300841) (= (index!29747 lt!300841) vacantSpotIndex!68) (= (select (arr!18454 a!2986) (index!29747 lt!300841)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91827 (= lt!300841 e!371742)))

(declare-fun c!74505 () Bool)

(assert (=> d!91827 (= c!74505 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300840 () (_ BitVec 64))

(assert (=> d!91827 (= lt!300840 (select (arr!18454 a!2986) index!984))))

(assert (=> d!91827 (validMask!0 mask!3053)))

(assert (=> d!91827 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053) lt!300841)))

(declare-fun b!648231 () Bool)

(declare-fun e!371740 () SeekEntryResult!6850)

(assert (=> b!648231 (= e!371740 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648232 () Bool)

(declare-fun e!371741 () SeekEntryResult!6850)

(assert (=> b!648232 (= e!371742 e!371741)))

(declare-fun c!74507 () Bool)

(assert (=> b!648232 (= c!74507 (= lt!300840 (select (arr!18454 a!2986) j!136)))))

(declare-fun b!648233 () Bool)

(assert (=> b!648233 (= e!371741 (Found!6850 index!984))))

(declare-fun b!648234 () Bool)

(assert (=> b!648234 (= e!371740 (MissingVacant!6850 vacantSpotIndex!68))))

(declare-fun b!648235 () Bool)

(declare-fun c!74506 () Bool)

(assert (=> b!648235 (= c!74506 (= lt!300840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648235 (= e!371741 e!371740)))

(assert (= (and d!91827 c!74505) b!648230))

(assert (= (and d!91827 (not c!74505)) b!648232))

(assert (= (and b!648232 c!74507) b!648233))

(assert (= (and b!648232 (not c!74507)) b!648235))

(assert (= (and b!648235 c!74506) b!648234))

(assert (= (and b!648235 (not c!74506)) b!648231))

(declare-fun m!622059 () Bool)

(assert (=> d!91827 m!622059))

(declare-fun m!622061 () Bool)

(assert (=> d!91827 m!622061))

(assert (=> d!91827 m!621861))

(assert (=> d!91827 m!621885))

(declare-fun m!622063 () Bool)

(assert (=> b!648231 m!622063))

(assert (=> b!648231 m!622063))

(assert (=> b!648231 m!621823))

(declare-fun m!622065 () Bool)

(assert (=> b!648231 m!622065))

(assert (=> b!648005 d!91827))

(declare-fun bm!33711 () Bool)

(declare-fun call!33714 () Bool)

(declare-fun c!74510 () Bool)

(assert (=> bm!33711 (= call!33714 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74510 (Cons!12398 (select (arr!18454 a!2986) #b00000000000000000000000000000000) Nil!12399) Nil!12399)))))

(declare-fun b!648246 () Bool)

(declare-fun e!371753 () Bool)

(assert (=> b!648246 (= e!371753 call!33714)))

(declare-fun d!91829 () Bool)

(declare-fun res!419965 () Bool)

(declare-fun e!371751 () Bool)

(assert (=> d!91829 (=> res!419965 e!371751)))

(assert (=> d!91829 (= res!419965 (bvsge #b00000000000000000000000000000000 (size!18818 a!2986)))))

(assert (=> d!91829 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12399) e!371751)))

(declare-fun b!648247 () Bool)

(assert (=> b!648247 (= e!371753 call!33714)))

(declare-fun b!648248 () Bool)

(declare-fun e!371752 () Bool)

(assert (=> b!648248 (= e!371751 e!371752)))

(declare-fun res!419964 () Bool)

(assert (=> b!648248 (=> (not res!419964) (not e!371752))))

(declare-fun e!371754 () Bool)

(assert (=> b!648248 (= res!419964 (not e!371754))))

(declare-fun res!419963 () Bool)

(assert (=> b!648248 (=> (not res!419963) (not e!371754))))

(assert (=> b!648248 (= res!419963 (validKeyInArray!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!648249 () Bool)

(assert (=> b!648249 (= e!371752 e!371753)))

(assert (=> b!648249 (= c!74510 (validKeyInArray!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!648250 () Bool)

(assert (=> b!648250 (= e!371754 (contains!3134 Nil!12399 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91829 (not res!419965)) b!648248))

(assert (= (and b!648248 res!419963) b!648250))

(assert (= (and b!648248 res!419964) b!648249))

(assert (= (and b!648249 c!74510) b!648246))

(assert (= (and b!648249 (not c!74510)) b!648247))

(assert (= (or b!648246 b!648247) bm!33711))

(declare-fun m!622067 () Bool)

(assert (=> bm!33711 m!622067))

(declare-fun m!622069 () Bool)

(assert (=> bm!33711 m!622069))

(assert (=> b!648248 m!622067))

(assert (=> b!648248 m!622067))

(declare-fun m!622071 () Bool)

(assert (=> b!648248 m!622071))

(assert (=> b!648249 m!622067))

(assert (=> b!648249 m!622067))

(assert (=> b!648249 m!622071))

(assert (=> b!648250 m!622067))

(assert (=> b!648250 m!622067))

(declare-fun m!622073 () Bool)

(assert (=> b!648250 m!622073))

(assert (=> b!648016 d!91829))

(declare-fun d!91831 () Bool)

(assert (=> d!91831 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58806 d!91831))

(declare-fun d!91839 () Bool)

(assert (=> d!91839 (= (array_inv!14313 a!2986) (bvsge (size!18818 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58806 d!91839))

(declare-fun d!91841 () Bool)

(declare-fun res!419988 () Bool)

(declare-fun e!371777 () Bool)

(assert (=> d!91841 (=> res!419988 e!371777)))

(assert (=> d!91841 (= res!419988 (= (select (arr!18454 lt!300722) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91841 (= (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371777)))

(declare-fun b!648273 () Bool)

(declare-fun e!371778 () Bool)

(assert (=> b!648273 (= e!371777 e!371778)))

(declare-fun res!419989 () Bool)

(assert (=> b!648273 (=> (not res!419989) (not e!371778))))

(assert (=> b!648273 (= res!419989 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18818 lt!300722)))))

(declare-fun b!648274 () Bool)

(assert (=> b!648274 (= e!371778 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91841 (not res!419988)) b!648273))

(assert (= (and b!648273 res!419989) b!648274))

(declare-fun m!622089 () Bool)

(assert (=> d!91841 m!622089))

(assert (=> b!648274 m!621823))

(declare-fun m!622091 () Bool)

(assert (=> b!648274 m!622091))

(assert (=> b!648014 d!91841))

(declare-fun d!91847 () Bool)

(assert (=> d!91847 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300847 () Unit!21999)

(declare-fun choose!114 (array!38499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21999)

(assert (=> d!91847 (= lt!300847 (choose!114 lt!300722 (select (arr!18454 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91847 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91847 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300722 (select (arr!18454 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300847)))

(declare-fun bs!19373 () Bool)

(assert (= bs!19373 d!91847))

(assert (=> bs!19373 m!621823))

(assert (=> bs!19373 m!621825))

(assert (=> bs!19373 m!621823))

(declare-fun m!622093 () Bool)

(assert (=> bs!19373 m!622093))

(assert (=> b!648014 d!91847))

(declare-fun d!91849 () Bool)

(declare-fun res!419990 () Bool)

(declare-fun e!371779 () Bool)

(assert (=> d!91849 (=> res!419990 e!371779)))

(assert (=> d!91849 (= res!419990 (= (select (arr!18454 lt!300722) j!136) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91849 (= (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) j!136) e!371779)))

(declare-fun b!648275 () Bool)

(declare-fun e!371780 () Bool)

(assert (=> b!648275 (= e!371779 e!371780)))

(declare-fun res!419991 () Bool)

(assert (=> b!648275 (=> (not res!419991) (not e!371780))))

(assert (=> b!648275 (= res!419991 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18818 lt!300722)))))

(declare-fun b!648276 () Bool)

(assert (=> b!648276 (= e!371780 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91849 (not res!419990)) b!648275))

(assert (= (and b!648275 res!419991) b!648276))

(declare-fun m!622095 () Bool)

(assert (=> d!91849 m!622095))

(assert (=> b!648276 m!621823))

(declare-fun m!622097 () Bool)

(assert (=> b!648276 m!622097))

(assert (=> b!648014 d!91849))

(declare-fun d!91851 () Bool)

(declare-fun res!420002 () Bool)

(declare-fun e!371793 () Bool)

(assert (=> d!91851 (=> res!420002 e!371793)))

(assert (=> d!91851 (= res!420002 ((_ is Nil!12399) Nil!12399))))

(assert (=> d!91851 (= (noDuplicate!421 Nil!12399) e!371793)))

(declare-fun b!648291 () Bool)

(declare-fun e!371794 () Bool)

(assert (=> b!648291 (= e!371793 e!371794)))

(declare-fun res!420003 () Bool)

(assert (=> b!648291 (=> (not res!420003) (not e!371794))))

(assert (=> b!648291 (= res!420003 (not (contains!3134 (t!18622 Nil!12399) (h!13446 Nil!12399))))))

(declare-fun b!648292 () Bool)

(assert (=> b!648292 (= e!371794 (noDuplicate!421 (t!18622 Nil!12399)))))

(assert (= (and d!91851 (not res!420002)) b!648291))

(assert (= (and b!648291 res!420003) b!648292))

(declare-fun m!622099 () Bool)

(assert (=> b!648291 m!622099))

(declare-fun m!622101 () Bool)

(assert (=> b!648292 m!622101))

(assert (=> b!648025 d!91851))

(declare-fun d!91853 () Bool)

(declare-fun lt!300848 () Bool)

(assert (=> d!91853 (= lt!300848 (select (content!251 Nil!12399) k0!1786))))

(declare-fun e!371796 () Bool)

(assert (=> d!91853 (= lt!300848 e!371796)))

(declare-fun res!420005 () Bool)

(assert (=> d!91853 (=> (not res!420005) (not e!371796))))

(assert (=> d!91853 (= res!420005 ((_ is Cons!12398) Nil!12399))))

(assert (=> d!91853 (= (contains!3134 Nil!12399 k0!1786) lt!300848)))

(declare-fun b!648293 () Bool)

(declare-fun e!371795 () Bool)

(assert (=> b!648293 (= e!371796 e!371795)))

(declare-fun res!420004 () Bool)

(assert (=> b!648293 (=> res!420004 e!371795)))

(assert (=> b!648293 (= res!420004 (= (h!13446 Nil!12399) k0!1786))))

(declare-fun b!648294 () Bool)

(assert (=> b!648294 (= e!371795 (contains!3134 (t!18622 Nil!12399) k0!1786))))

(assert (= (and d!91853 res!420005) b!648293))

(assert (= (and b!648293 (not res!420004)) b!648294))

(assert (=> d!91853 m!622039))

(declare-fun m!622103 () Bool)

(assert (=> d!91853 m!622103))

(declare-fun m!622105 () Bool)

(assert (=> b!648294 m!622105))

(assert (=> b!648007 d!91853))

(declare-fun bm!33715 () Bool)

(declare-fun call!33718 () Bool)

(declare-fun c!74514 () Bool)

(assert (=> bm!33715 (= call!33718 (arrayNoDuplicates!0 lt!300722 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74514 (Cons!12398 (select (arr!18454 lt!300722) #b00000000000000000000000000000000) Nil!12399) Nil!12399)))))

(declare-fun b!648300 () Bool)

(declare-fun e!371803 () Bool)

(assert (=> b!648300 (= e!371803 call!33718)))

(declare-fun d!91855 () Bool)

(declare-fun res!420011 () Bool)

(declare-fun e!371801 () Bool)

(assert (=> d!91855 (=> res!420011 e!371801)))

(assert (=> d!91855 (= res!420011 (bvsge #b00000000000000000000000000000000 (size!18818 lt!300722)))))

(assert (=> d!91855 (= (arrayNoDuplicates!0 lt!300722 #b00000000000000000000000000000000 Nil!12399) e!371801)))

(declare-fun b!648301 () Bool)

(assert (=> b!648301 (= e!371803 call!33718)))

(declare-fun b!648302 () Bool)

(declare-fun e!371802 () Bool)

(assert (=> b!648302 (= e!371801 e!371802)))

(declare-fun res!420010 () Bool)

(assert (=> b!648302 (=> (not res!420010) (not e!371802))))

(declare-fun e!371804 () Bool)

(assert (=> b!648302 (= res!420010 (not e!371804))))

(declare-fun res!420009 () Bool)

(assert (=> b!648302 (=> (not res!420009) (not e!371804))))

(assert (=> b!648302 (= res!420009 (validKeyInArray!0 (select (arr!18454 lt!300722) #b00000000000000000000000000000000)))))

(declare-fun b!648303 () Bool)

(assert (=> b!648303 (= e!371802 e!371803)))

(assert (=> b!648303 (= c!74514 (validKeyInArray!0 (select (arr!18454 lt!300722) #b00000000000000000000000000000000)))))

(declare-fun b!648304 () Bool)

(assert (=> b!648304 (= e!371804 (contains!3134 Nil!12399 (select (arr!18454 lt!300722) #b00000000000000000000000000000000)))))

(assert (= (and d!91855 (not res!420011)) b!648302))

(assert (= (and b!648302 res!420009) b!648304))

(assert (= (and b!648302 res!420010) b!648303))

(assert (= (and b!648303 c!74514) b!648300))

(assert (= (and b!648303 (not c!74514)) b!648301))

(assert (= (or b!648300 b!648301) bm!33715))

(declare-fun m!622113 () Bool)

(assert (=> bm!33715 m!622113))

(declare-fun m!622115 () Bool)

(assert (=> bm!33715 m!622115))

(assert (=> b!648302 m!622113))

(assert (=> b!648302 m!622113))

(declare-fun m!622119 () Bool)

(assert (=> b!648302 m!622119))

(assert (=> b!648303 m!622113))

(assert (=> b!648303 m!622113))

(assert (=> b!648303 m!622119))

(assert (=> b!648304 m!622113))

(assert (=> b!648304 m!622113))

(declare-fun m!622121 () Bool)

(assert (=> b!648304 m!622121))

(assert (=> b!648029 d!91855))

(declare-fun d!91859 () Bool)

(assert (=> d!91859 (arrayNoDuplicates!0 lt!300722 j!136 Nil!12399)))

(declare-fun lt!300851 () Unit!21999)

(declare-fun choose!39 (array!38499 (_ BitVec 32) (_ BitVec 32)) Unit!21999)

(assert (=> d!91859 (= lt!300851 (choose!39 lt!300722 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91859 (bvslt (size!18818 lt!300722) #b01111111111111111111111111111111)))

(assert (=> d!91859 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300722 #b00000000000000000000000000000000 j!136) lt!300851)))

(declare-fun bs!19374 () Bool)

(assert (= bs!19374 d!91859))

(assert (=> bs!19374 m!621873))

(declare-fun m!622127 () Bool)

(assert (=> bs!19374 m!622127))

(assert (=> b!648029 d!91859))

(declare-fun bm!33716 () Bool)

(declare-fun c!74515 () Bool)

(declare-fun call!33719 () Bool)

(assert (=> bm!33716 (= call!33719 (arrayNoDuplicates!0 lt!300722 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74515 (Cons!12398 (select (arr!18454 lt!300722) j!136) Nil!12399) Nil!12399)))))

(declare-fun b!648307 () Bool)

(declare-fun e!371809 () Bool)

(assert (=> b!648307 (= e!371809 call!33719)))

(declare-fun d!91863 () Bool)

(declare-fun res!420016 () Bool)

(declare-fun e!371807 () Bool)

(assert (=> d!91863 (=> res!420016 e!371807)))

(assert (=> d!91863 (= res!420016 (bvsge j!136 (size!18818 lt!300722)))))

(assert (=> d!91863 (= (arrayNoDuplicates!0 lt!300722 j!136 Nil!12399) e!371807)))

(declare-fun b!648308 () Bool)

(assert (=> b!648308 (= e!371809 call!33719)))

(declare-fun b!648309 () Bool)

(declare-fun e!371808 () Bool)

(assert (=> b!648309 (= e!371807 e!371808)))

(declare-fun res!420015 () Bool)

(assert (=> b!648309 (=> (not res!420015) (not e!371808))))

(declare-fun e!371810 () Bool)

(assert (=> b!648309 (= res!420015 (not e!371810))))

(declare-fun res!420014 () Bool)

(assert (=> b!648309 (=> (not res!420014) (not e!371810))))

(assert (=> b!648309 (= res!420014 (validKeyInArray!0 (select (arr!18454 lt!300722) j!136)))))

(declare-fun b!648310 () Bool)

(assert (=> b!648310 (= e!371808 e!371809)))

(assert (=> b!648310 (= c!74515 (validKeyInArray!0 (select (arr!18454 lt!300722) j!136)))))

(declare-fun b!648311 () Bool)

(assert (=> b!648311 (= e!371810 (contains!3134 Nil!12399 (select (arr!18454 lt!300722) j!136)))))

(assert (= (and d!91863 (not res!420016)) b!648309))

(assert (= (and b!648309 res!420014) b!648311))

(assert (= (and b!648309 res!420015) b!648310))

(assert (= (and b!648310 c!74515) b!648307))

(assert (= (and b!648310 (not c!74515)) b!648308))

(assert (= (or b!648307 b!648308) bm!33716))

(assert (=> bm!33716 m!622095))

(declare-fun m!622129 () Bool)

(assert (=> bm!33716 m!622129))

(assert (=> b!648309 m!622095))

(assert (=> b!648309 m!622095))

(declare-fun m!622131 () Bool)

(assert (=> b!648309 m!622131))

(assert (=> b!648310 m!622095))

(assert (=> b!648310 m!622095))

(assert (=> b!648310 m!622131))

(assert (=> b!648311 m!622095))

(assert (=> b!648311 m!622095))

(declare-fun m!622133 () Bool)

(assert (=> b!648311 m!622133))

(assert (=> b!648029 d!91863))

(declare-fun d!91865 () Bool)

(assert (=> d!91865 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18818 lt!300722)) (not (= (select (arr!18454 lt!300722) j!136) (select (arr!18454 a!2986) j!136))))))

(declare-fun lt!300858 () Unit!21999)

(declare-fun choose!21 (array!38499 (_ BitVec 64) (_ BitVec 32) List!12402) Unit!21999)

(assert (=> d!91865 (= lt!300858 (choose!21 lt!300722 (select (arr!18454 a!2986) j!136) j!136 Nil!12399))))

(assert (=> d!91865 (bvslt (size!18818 lt!300722) #b01111111111111111111111111111111)))

(assert (=> d!91865 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300722 (select (arr!18454 a!2986) j!136) j!136 Nil!12399) lt!300858)))

(declare-fun bs!19375 () Bool)

(assert (= bs!19375 d!91865))

(assert (=> bs!19375 m!622095))

(assert (=> bs!19375 m!621823))

(declare-fun m!622135 () Bool)

(assert (=> bs!19375 m!622135))

(assert (=> b!648029 d!91865))

(declare-fun d!91867 () Bool)

(assert (=> d!91867 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300859 () Unit!21999)

(assert (=> d!91867 (= lt!300859 (choose!114 lt!300722 (select (arr!18454 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91867 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91867 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300722 (select (arr!18454 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300859)))

(declare-fun bs!19376 () Bool)

(assert (= bs!19376 d!91867))

(assert (=> bs!19376 m!621823))

(assert (=> bs!19376 m!621875))

(assert (=> bs!19376 m!621823))

(declare-fun m!622137 () Bool)

(assert (=> bs!19376 m!622137))

(assert (=> b!648029 d!91867))

(declare-fun d!91869 () Bool)

(declare-fun e!371822 () Bool)

(assert (=> d!91869 e!371822))

(declare-fun res!420019 () Bool)

(assert (=> d!91869 (=> (not res!420019) (not e!371822))))

(assert (=> d!91869 (= res!420019 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986))))))

(declare-fun lt!300864 () Unit!21999)

(declare-fun choose!41 (array!38499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12402) Unit!21999)

(assert (=> d!91869 (= lt!300864 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12399))))

(assert (=> d!91869 (bvslt (size!18818 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91869 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12399) lt!300864)))

(declare-fun b!648332 () Bool)

(assert (=> b!648332 (= e!371822 (arrayNoDuplicates!0 (array!38500 (store (arr!18454 a!2986) i!1108 k0!1786) (size!18818 a!2986)) #b00000000000000000000000000000000 Nil!12399))))

(assert (= (and d!91869 res!420019) b!648332))

(declare-fun m!622147 () Bool)

(assert (=> d!91869 m!622147))

(assert (=> b!648332 m!621839))

(declare-fun m!622149 () Bool)

(assert (=> b!648332 m!622149))

(assert (=> b!648029 d!91869))

(declare-fun d!91877 () Bool)

(declare-fun res!420020 () Bool)

(declare-fun e!371823 () Bool)

(assert (=> d!91877 (=> res!420020 e!371823)))

(assert (=> d!91877 (= res!420020 (= (select (arr!18454 lt!300722) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91877 (= (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371823)))

(declare-fun b!648333 () Bool)

(declare-fun e!371824 () Bool)

(assert (=> b!648333 (= e!371823 e!371824)))

(declare-fun res!420021 () Bool)

(assert (=> b!648333 (=> (not res!420021) (not e!371824))))

(assert (=> b!648333 (= res!420021 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18818 lt!300722)))))

(declare-fun b!648334 () Bool)

(assert (=> b!648334 (= e!371824 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91877 (not res!420020)) b!648333))

(assert (= (and b!648333 res!420021) b!648334))

(declare-fun m!622151 () Bool)

(assert (=> d!91877 m!622151))

(assert (=> b!648334 m!621823))

(declare-fun m!622153 () Bool)

(assert (=> b!648334 m!622153))

(assert (=> b!648029 d!91877))

(declare-fun b!648343 () Bool)

(declare-fun e!371831 () Bool)

(declare-fun call!33722 () Bool)

(assert (=> b!648343 (= e!371831 call!33722)))

(declare-fun bm!33719 () Bool)

(assert (=> bm!33719 (= call!33722 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!648344 () Bool)

(declare-fun e!371832 () Bool)

(assert (=> b!648344 (= e!371831 e!371832)))

(declare-fun lt!300872 () (_ BitVec 64))

(assert (=> b!648344 (= lt!300872 (select (arr!18454 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300871 () Unit!21999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38499 (_ BitVec 64) (_ BitVec 32)) Unit!21999)

(assert (=> b!648344 (= lt!300871 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300872 #b00000000000000000000000000000000))))

(assert (=> b!648344 (arrayContainsKey!0 a!2986 lt!300872 #b00000000000000000000000000000000)))

(declare-fun lt!300873 () Unit!21999)

(assert (=> b!648344 (= lt!300873 lt!300871)))

(declare-fun res!420027 () Bool)

(assert (=> b!648344 (= res!420027 (= (seekEntryOrOpen!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6850 #b00000000000000000000000000000000)))))

(assert (=> b!648344 (=> (not res!420027) (not e!371832))))

(declare-fun b!648345 () Bool)

(assert (=> b!648345 (= e!371832 call!33722)))

(declare-fun d!91879 () Bool)

(declare-fun res!420026 () Bool)

(declare-fun e!371833 () Bool)

(assert (=> d!91879 (=> res!420026 e!371833)))

(assert (=> d!91879 (= res!420026 (bvsge #b00000000000000000000000000000000 (size!18818 a!2986)))))

(assert (=> d!91879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371833)))

(declare-fun b!648346 () Bool)

(assert (=> b!648346 (= e!371833 e!371831)))

(declare-fun c!74527 () Bool)

(assert (=> b!648346 (= c!74527 (validKeyInArray!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91879 (not res!420026)) b!648346))

(assert (= (and b!648346 c!74527) b!648344))

(assert (= (and b!648346 (not c!74527)) b!648343))

(assert (= (and b!648344 res!420027) b!648345))

(assert (= (or b!648345 b!648343) bm!33719))

(declare-fun m!622155 () Bool)

(assert (=> bm!33719 m!622155))

(assert (=> b!648344 m!622067))

(declare-fun m!622157 () Bool)

(assert (=> b!648344 m!622157))

(declare-fun m!622159 () Bool)

(assert (=> b!648344 m!622159))

(assert (=> b!648344 m!622067))

(declare-fun m!622161 () Bool)

(assert (=> b!648344 m!622161))

(assert (=> b!648346 m!622067))

(assert (=> b!648346 m!622067))

(assert (=> b!648346 m!622071))

(assert (=> b!648006 d!91879))

(declare-fun d!91881 () Bool)

(declare-fun res!420030 () Bool)

(declare-fun e!371836 () Bool)

(assert (=> d!91881 (=> res!420030 e!371836)))

(assert (=> d!91881 (= res!420030 (= (select (arr!18454 lt!300722) index!984) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91881 (= (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) index!984) e!371836)))

(declare-fun b!648349 () Bool)

(declare-fun e!371837 () Bool)

(assert (=> b!648349 (= e!371836 e!371837)))

(declare-fun res!420031 () Bool)

(assert (=> b!648349 (=> (not res!420031) (not e!371837))))

(assert (=> b!648349 (= res!420031 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18818 lt!300722)))))

(declare-fun b!648350 () Bool)

(assert (=> b!648350 (= e!371837 (arrayContainsKey!0 lt!300722 (select (arr!18454 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91881 (not res!420030)) b!648349))

(assert (= (and b!648349 res!420031) b!648350))

(declare-fun m!622163 () Bool)

(assert (=> d!91881 m!622163))

(assert (=> b!648350 m!621823))

(declare-fun m!622165 () Bool)

(assert (=> b!648350 m!622165))

(assert (=> b!648031 d!91881))

(declare-fun d!91883 () Bool)

(declare-fun res!420032 () Bool)

(declare-fun e!371838 () Bool)

(assert (=> d!91883 (=> res!420032 e!371838)))

(assert (=> d!91883 (= res!420032 (= (select (arr!18454 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91883 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!371838)))

(declare-fun b!648351 () Bool)

(declare-fun e!371839 () Bool)

(assert (=> b!648351 (= e!371838 e!371839)))

(declare-fun res!420033 () Bool)

(assert (=> b!648351 (=> (not res!420033) (not e!371839))))

(assert (=> b!648351 (= res!420033 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18818 a!2986)))))

(declare-fun b!648352 () Bool)

(assert (=> b!648352 (= e!371839 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91883 (not res!420032)) b!648351))

(assert (= (and b!648351 res!420033) b!648352))

(assert (=> d!91883 m!622067))

(declare-fun m!622167 () Bool)

(assert (=> b!648352 m!622167))

(assert (=> b!648021 d!91883))

(assert (=> b!648019 d!91849))

(declare-fun d!91885 () Bool)

(assert (=> d!91885 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!648009 d!91885))

(declare-fun d!91887 () Bool)

(declare-fun lt!300877 () Bool)

(assert (=> d!91887 (= lt!300877 (select (content!251 Nil!12399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371842 () Bool)

(assert (=> d!91887 (= lt!300877 e!371842)))

(declare-fun res!420036 () Bool)

(assert (=> d!91887 (=> (not res!420036) (not e!371842))))

(assert (=> d!91887 (= res!420036 ((_ is Cons!12398) Nil!12399))))

(assert (=> d!91887 (= (contains!3134 Nil!12399 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300877)))

(declare-fun b!648354 () Bool)

(declare-fun e!371841 () Bool)

(assert (=> b!648354 (= e!371842 e!371841)))

(declare-fun res!420035 () Bool)

(assert (=> b!648354 (=> res!420035 e!371841)))

(assert (=> b!648354 (= res!420035 (= (h!13446 Nil!12399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648355 () Bool)

(assert (=> b!648355 (= e!371841 (contains!3134 (t!18622 Nil!12399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91887 res!420036) b!648354))

(assert (= (and b!648354 (not res!420035)) b!648355))

(assert (=> d!91887 m!622039))

(declare-fun m!622171 () Bool)

(assert (=> d!91887 m!622171))

(declare-fun m!622173 () Bool)

(assert (=> b!648355 m!622173))

(assert (=> b!648020 d!91887))

(declare-fun d!91889 () Bool)

(assert (=> d!91889 (= (validKeyInArray!0 (select (arr!18454 a!2986) j!136)) (and (not (= (select (arr!18454 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18454 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!648023 d!91889))

(assert (=> b!648011 d!91881))

(declare-fun b!648356 () Bool)

(declare-fun e!371845 () SeekEntryResult!6850)

(assert (=> b!648356 (= e!371845 Undefined!6850)))

(declare-fun d!91891 () Bool)

(declare-fun lt!300879 () SeekEntryResult!6850)

(assert (=> d!91891 (and (or ((_ is Undefined!6850) lt!300879) (not ((_ is Found!6850) lt!300879)) (and (bvsge (index!29745 lt!300879) #b00000000000000000000000000000000) (bvslt (index!29745 lt!300879) (size!18818 a!2986)))) (or ((_ is Undefined!6850) lt!300879) ((_ is Found!6850) lt!300879) (not ((_ is MissingVacant!6850) lt!300879)) (not (= (index!29747 lt!300879) vacantSpotIndex!68)) (and (bvsge (index!29747 lt!300879) #b00000000000000000000000000000000) (bvslt (index!29747 lt!300879) (size!18818 a!2986)))) (or ((_ is Undefined!6850) lt!300879) (ite ((_ is Found!6850) lt!300879) (= (select (arr!18454 a!2986) (index!29745 lt!300879)) (select (arr!18454 a!2986) j!136)) (and ((_ is MissingVacant!6850) lt!300879) (= (index!29747 lt!300879) vacantSpotIndex!68) (= (select (arr!18454 a!2986) (index!29747 lt!300879)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91891 (= lt!300879 e!371845)))

(declare-fun c!74528 () Bool)

(assert (=> d!91891 (= c!74528 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!300878 () (_ BitVec 64))

(assert (=> d!91891 (= lt!300878 (select (arr!18454 a!2986) lt!300721))))

(assert (=> d!91891 (validMask!0 mask!3053)))

(assert (=> d!91891 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053) lt!300879)))

(declare-fun b!648357 () Bool)

(declare-fun e!371843 () SeekEntryResult!6850)

(assert (=> b!648357 (= e!371843 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300721 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648358 () Bool)

(declare-fun e!371844 () SeekEntryResult!6850)

(assert (=> b!648358 (= e!371845 e!371844)))

(declare-fun c!74530 () Bool)

(assert (=> b!648358 (= c!74530 (= lt!300878 (select (arr!18454 a!2986) j!136)))))

(declare-fun b!648359 () Bool)

(assert (=> b!648359 (= e!371844 (Found!6850 lt!300721))))

(declare-fun b!648360 () Bool)

(assert (=> b!648360 (= e!371843 (MissingVacant!6850 vacantSpotIndex!68))))

(declare-fun b!648361 () Bool)

(declare-fun c!74529 () Bool)

(assert (=> b!648361 (= c!74529 (= lt!300878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648361 (= e!371844 e!371843)))

(assert (= (and d!91891 c!74528) b!648356))

(assert (= (and d!91891 (not c!74528)) b!648358))

(assert (= (and b!648358 c!74530) b!648359))

(assert (= (and b!648358 (not c!74530)) b!648361))

(assert (= (and b!648361 c!74529) b!648360))

(assert (= (and b!648361 (not c!74529)) b!648357))

(declare-fun m!622177 () Bool)

(assert (=> d!91891 m!622177))

(declare-fun m!622179 () Bool)

(assert (=> d!91891 m!622179))

(declare-fun m!622181 () Bool)

(assert (=> d!91891 m!622181))

(assert (=> d!91891 m!621885))

(declare-fun m!622183 () Bool)

(assert (=> b!648357 m!622183))

(assert (=> b!648357 m!622183))

(assert (=> b!648357 m!621823))

(declare-fun m!622185 () Bool)

(assert (=> b!648357 m!622185))

(assert (=> b!648022 d!91891))

(declare-fun d!91895 () Bool)

(declare-fun e!371872 () Bool)

(assert (=> d!91895 e!371872))

(declare-fun res!420045 () Bool)

(assert (=> d!91895 (=> (not res!420045) (not e!371872))))

(assert (=> d!91895 (= res!420045 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18818 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18818 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18818 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986))))))

(declare-fun lt!300900 () Unit!21999)

(declare-fun choose!9 (array!38499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21999)

(assert (=> d!91895 (= lt!300900 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91895 (validMask!0 mask!3053)))

(assert (=> d!91895 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 mask!3053) lt!300900)))

(declare-fun b!648406 () Bool)

(assert (=> b!648406 (= e!371872 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 (select (store (arr!18454 a!2986) i!1108 k0!1786) j!136) (array!38500 (store (arr!18454 a!2986) i!1108 k0!1786) (size!18818 a!2986)) mask!3053)))))

(assert (= (and d!91895 res!420045) b!648406))

(declare-fun m!622217 () Bool)

(assert (=> d!91895 m!622217))

(assert (=> d!91895 m!621885))

(assert (=> b!648406 m!621823))

(assert (=> b!648406 m!621841))

(assert (=> b!648406 m!621823))

(assert (=> b!648406 m!621837))

(assert (=> b!648406 m!621837))

(declare-fun m!622219 () Bool)

(assert (=> b!648406 m!622219))

(assert (=> b!648406 m!621839))

(assert (=> b!648022 d!91895))

(declare-fun b!648407 () Bool)

(declare-fun e!371875 () SeekEntryResult!6850)

(assert (=> b!648407 (= e!371875 Undefined!6850)))

(declare-fun d!91903 () Bool)

(declare-fun lt!300902 () SeekEntryResult!6850)

(assert (=> d!91903 (and (or ((_ is Undefined!6850) lt!300902) (not ((_ is Found!6850) lt!300902)) (and (bvsge (index!29745 lt!300902) #b00000000000000000000000000000000) (bvslt (index!29745 lt!300902) (size!18818 lt!300722)))) (or ((_ is Undefined!6850) lt!300902) ((_ is Found!6850) lt!300902) (not ((_ is MissingVacant!6850) lt!300902)) (not (= (index!29747 lt!300902) vacantSpotIndex!68)) (and (bvsge (index!29747 lt!300902) #b00000000000000000000000000000000) (bvslt (index!29747 lt!300902) (size!18818 lt!300722)))) (or ((_ is Undefined!6850) lt!300902) (ite ((_ is Found!6850) lt!300902) (= (select (arr!18454 lt!300722) (index!29745 lt!300902)) lt!300719) (and ((_ is MissingVacant!6850) lt!300902) (= (index!29747 lt!300902) vacantSpotIndex!68) (= (select (arr!18454 lt!300722) (index!29747 lt!300902)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91903 (= lt!300902 e!371875)))

(declare-fun c!74549 () Bool)

(assert (=> d!91903 (= c!74549 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!300901 () (_ BitVec 64))

(assert (=> d!91903 (= lt!300901 (select (arr!18454 lt!300722) lt!300721))))

(assert (=> d!91903 (validMask!0 mask!3053)))

(assert (=> d!91903 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 lt!300719 lt!300722 mask!3053) lt!300902)))

(declare-fun b!648408 () Bool)

(declare-fun e!371873 () SeekEntryResult!6850)

(assert (=> b!648408 (= e!371873 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300721 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!300719 lt!300722 mask!3053))))

(declare-fun b!648409 () Bool)

(declare-fun e!371874 () SeekEntryResult!6850)

(assert (=> b!648409 (= e!371875 e!371874)))

(declare-fun c!74551 () Bool)

(assert (=> b!648409 (= c!74551 (= lt!300901 lt!300719))))

(declare-fun b!648410 () Bool)

(assert (=> b!648410 (= e!371874 (Found!6850 lt!300721))))

(declare-fun b!648411 () Bool)

(assert (=> b!648411 (= e!371873 (MissingVacant!6850 vacantSpotIndex!68))))

(declare-fun b!648412 () Bool)

(declare-fun c!74550 () Bool)

(assert (=> b!648412 (= c!74550 (= lt!300901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648412 (= e!371874 e!371873)))

(assert (= (and d!91903 c!74549) b!648407))

(assert (= (and d!91903 (not c!74549)) b!648409))

(assert (= (and b!648409 c!74551) b!648410))

(assert (= (and b!648409 (not c!74551)) b!648412))

(assert (= (and b!648412 c!74550) b!648411))

(assert (= (and b!648412 (not c!74550)) b!648408))

(declare-fun m!622221 () Bool)

(assert (=> d!91903 m!622221))

(declare-fun m!622223 () Bool)

(assert (=> d!91903 m!622223))

(declare-fun m!622225 () Bool)

(assert (=> d!91903 m!622225))

(assert (=> d!91903 m!621885))

(assert (=> b!648408 m!622183))

(assert (=> b!648408 m!622183))

(declare-fun m!622227 () Bool)

(assert (=> b!648408 m!622227))

(assert (=> b!648022 d!91903))

(declare-fun d!91905 () Bool)

(declare-fun lt!300909 () (_ BitVec 32))

(assert (=> d!91905 (and (bvsge lt!300909 #b00000000000000000000000000000000) (bvslt lt!300909 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91905 (= lt!300909 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!91905 (validMask!0 mask!3053)))

(assert (=> d!91905 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!300909)))

(declare-fun bs!19377 () Bool)

(assert (= bs!19377 d!91905))

(declare-fun m!622247 () Bool)

(assert (=> bs!19377 m!622247))

(assert (=> bs!19377 m!621885))

(assert (=> b!648022 d!91905))

(declare-fun b!648425 () Bool)

(declare-fun e!371884 () SeekEntryResult!6850)

(assert (=> b!648425 (= e!371884 Undefined!6850)))

(declare-fun lt!300911 () SeekEntryResult!6850)

(declare-fun d!91911 () Bool)

(assert (=> d!91911 (and (or ((_ is Undefined!6850) lt!300911) (not ((_ is Found!6850) lt!300911)) (and (bvsge (index!29745 lt!300911) #b00000000000000000000000000000000) (bvslt (index!29745 lt!300911) (size!18818 lt!300722)))) (or ((_ is Undefined!6850) lt!300911) ((_ is Found!6850) lt!300911) (not ((_ is MissingVacant!6850) lt!300911)) (not (= (index!29747 lt!300911) vacantSpotIndex!68)) (and (bvsge (index!29747 lt!300911) #b00000000000000000000000000000000) (bvslt (index!29747 lt!300911) (size!18818 lt!300722)))) (or ((_ is Undefined!6850) lt!300911) (ite ((_ is Found!6850) lt!300911) (= (select (arr!18454 lt!300722) (index!29745 lt!300911)) lt!300719) (and ((_ is MissingVacant!6850) lt!300911) (= (index!29747 lt!300911) vacantSpotIndex!68) (= (select (arr!18454 lt!300722) (index!29747 lt!300911)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91911 (= lt!300911 e!371884)))

(declare-fun c!74558 () Bool)

(assert (=> d!91911 (= c!74558 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300910 () (_ BitVec 64))

(assert (=> d!91911 (= lt!300910 (select (arr!18454 lt!300722) index!984))))

(assert (=> d!91911 (validMask!0 mask!3053)))

(assert (=> d!91911 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300719 lt!300722 mask!3053) lt!300911)))

(declare-fun b!648426 () Bool)

(declare-fun e!371882 () SeekEntryResult!6850)

(assert (=> b!648426 (= e!371882 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!300719 lt!300722 mask!3053))))

(declare-fun b!648427 () Bool)

(declare-fun e!371883 () SeekEntryResult!6850)

(assert (=> b!648427 (= e!371884 e!371883)))

(declare-fun c!74560 () Bool)

(assert (=> b!648427 (= c!74560 (= lt!300910 lt!300719))))

(declare-fun b!648428 () Bool)

(assert (=> b!648428 (= e!371883 (Found!6850 index!984))))

(declare-fun b!648429 () Bool)

(assert (=> b!648429 (= e!371882 (MissingVacant!6850 vacantSpotIndex!68))))

(declare-fun b!648430 () Bool)

(declare-fun c!74559 () Bool)

(assert (=> b!648430 (= c!74559 (= lt!300910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648430 (= e!371883 e!371882)))

(assert (= (and d!91911 c!74558) b!648425))

(assert (= (and d!91911 (not c!74558)) b!648427))

(assert (= (and b!648427 c!74560) b!648428))

(assert (= (and b!648427 (not c!74560)) b!648430))

(assert (= (and b!648430 c!74559) b!648429))

(assert (= (and b!648430 (not c!74559)) b!648426))

(declare-fun m!622249 () Bool)

(assert (=> d!91911 m!622249))

(declare-fun m!622251 () Bool)

(assert (=> d!91911 m!622251))

(assert (=> d!91911 m!622163))

(assert (=> d!91911 m!621885))

(assert (=> b!648426 m!622063))

(assert (=> b!648426 m!622063))

(declare-fun m!622253 () Bool)

(assert (=> b!648426 m!622253))

(assert (=> b!648022 d!91911))

(check-sat (not b!648332) (not bm!33716) (not d!91859) (not b!648408) (not b!648249) (not d!91847) (not b!648352) (not b!648302) (not b!648406) (not b!648426) (not d!91903) (not d!91825) (not b!648346) (not b!648311) (not b!648276) (not d!91869) (not bm!33715) (not b!648357) (not b!648199) (not b!648231) (not b!648355) (not b!648304) (not b!648250) (not b!648303) (not b!648350) (not d!91865) (not b!648334) (not d!91827) (not b!648310) (not b!648344) (not d!91887) (not b!648217) (not bm!33711) (not d!91911) (not d!91867) (not b!648274) (not b!648291) (not d!91905) (not d!91891) (not b!648294) (not d!91823) (not bm!33719) (not d!91853) (not b!648292) (not b!648248) (not b!648309) (not d!91895))
(check-sat)
