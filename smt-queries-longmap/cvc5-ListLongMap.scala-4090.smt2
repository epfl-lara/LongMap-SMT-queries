; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56038 () Bool)

(assert start!56038)

(declare-fun b!616748 () Bool)

(declare-datatypes ((Unit!20128 0))(
  ( (Unit!20129) )
))
(declare-fun e!353650 () Unit!20128)

(declare-fun Unit!20130 () Unit!20128)

(assert (=> b!616748 (= e!353650 Unit!20130)))

(declare-fun b!616749 () Bool)

(declare-fun res!397310 () Bool)

(declare-fun e!353644 () Bool)

(assert (=> b!616749 (=> (not res!397310) (not e!353644))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616749 (= res!397310 (validKeyInArray!0 k!1786))))

(declare-fun b!616750 () Bool)

(declare-fun res!397301 () Bool)

(declare-fun e!353643 () Bool)

(assert (=> b!616750 (=> (not res!397301) (not e!353643))))

(declare-datatypes ((array!37508 0))(
  ( (array!37509 (arr!18000 (Array (_ BitVec 32) (_ BitVec 64))) (size!18364 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37508)

(declare-datatypes ((List!12041 0))(
  ( (Nil!12038) (Cons!12037 (h!13082 (_ BitVec 64)) (t!18269 List!12041)) )
))
(declare-fun arrayNoDuplicates!0 (array!37508 (_ BitVec 32) List!12041) Bool)

(assert (=> b!616750 (= res!397301 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12038))))

(declare-fun b!616751 () Bool)

(declare-fun res!397294 () Bool)

(assert (=> b!616751 (=> (not res!397294) (not e!353644))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!616751 (= res!397294 (validKeyInArray!0 (select (arr!18000 a!2986) j!136)))))

(declare-fun b!616752 () Bool)

(declare-fun e!353639 () Bool)

(assert (=> b!616752 (= e!353639 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616752 (= (select (store (arr!18000 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616753 () Bool)

(assert (=> b!616753 (= e!353644 e!353643)))

(declare-fun res!397305 () Bool)

(assert (=> b!616753 (=> (not res!397305) (not e!353643))))

(declare-datatypes ((SeekEntryResult!6440 0))(
  ( (MissingZero!6440 (index!28044 (_ BitVec 32))) (Found!6440 (index!28045 (_ BitVec 32))) (Intermediate!6440 (undefined!7252 Bool) (index!28046 (_ BitVec 32)) (x!56840 (_ BitVec 32))) (Undefined!6440) (MissingVacant!6440 (index!28047 (_ BitVec 32))) )
))
(declare-fun lt!283764 () SeekEntryResult!6440)

(assert (=> b!616753 (= res!397305 (or (= lt!283764 (MissingZero!6440 i!1108)) (= lt!283764 (MissingVacant!6440 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37508 (_ BitVec 32)) SeekEntryResult!6440)

(assert (=> b!616753 (= lt!283764 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!397306 () Bool)

(assert (=> start!56038 (=> (not res!397306) (not e!353644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56038 (= res!397306 (validMask!0 mask!3053))))

(assert (=> start!56038 e!353644))

(assert (=> start!56038 true))

(declare-fun array_inv!13796 (array!37508) Bool)

(assert (=> start!56038 (array_inv!13796 a!2986)))

(declare-fun b!616754 () Bool)

(declare-fun e!353648 () Unit!20128)

(declare-fun Unit!20131 () Unit!20128)

(assert (=> b!616754 (= e!353648 Unit!20131)))

(declare-fun b!616755 () Bool)

(declare-fun res!397308 () Bool)

(assert (=> b!616755 (=> (not res!397308) (not e!353643))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616755 (= res!397308 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18000 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616756 () Bool)

(declare-fun e!353638 () Unit!20128)

(declare-fun Unit!20132 () Unit!20128)

(assert (=> b!616756 (= e!353638 Unit!20132)))

(declare-fun b!616757 () Bool)

(declare-fun e!353640 () Unit!20128)

(declare-fun Unit!20133 () Unit!20128)

(assert (=> b!616757 (= e!353640 Unit!20133)))

(declare-fun b!616758 () Bool)

(declare-fun res!397303 () Bool)

(assert (=> b!616758 (=> (not res!397303) (not e!353644))))

(assert (=> b!616758 (= res!397303 (and (= (size!18364 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18364 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18364 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616759 () Bool)

(declare-fun e!353641 () Bool)

(declare-fun lt!283773 () array!37508)

(declare-fun arrayContainsKey!0 (array!37508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616759 (= e!353641 (arrayContainsKey!0 lt!283773 (select (arr!18000 a!2986) j!136) index!984))))

(declare-fun b!616760 () Bool)

(declare-fun Unit!20134 () Unit!20128)

(assert (=> b!616760 (= e!353650 Unit!20134)))

(assert (=> b!616760 false))

(declare-fun b!616761 () Bool)

(declare-fun res!397296 () Bool)

(assert (=> b!616761 (= res!397296 (bvsge j!136 index!984))))

(declare-fun e!353647 () Bool)

(assert (=> b!616761 (=> res!397296 e!353647)))

(declare-fun e!353652 () Bool)

(assert (=> b!616761 (= e!353652 e!353647)))

(declare-fun b!616762 () Bool)

(declare-fun e!353642 () Bool)

(assert (=> b!616762 (= e!353643 e!353642)))

(declare-fun res!397309 () Bool)

(assert (=> b!616762 (=> (not res!397309) (not e!353642))))

(assert (=> b!616762 (= res!397309 (= (select (store (arr!18000 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616762 (= lt!283773 (array!37509 (store (arr!18000 a!2986) i!1108 k!1786) (size!18364 a!2986)))))

(declare-fun b!616763 () Bool)

(declare-fun res!397304 () Bool)

(assert (=> b!616763 (=> (not res!397304) (not e!353644))))

(assert (=> b!616763 (= res!397304 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616764 () Bool)

(declare-fun e!353645 () Bool)

(assert (=> b!616764 (= e!353645 (not e!353639))))

(declare-fun res!397295 () Bool)

(assert (=> b!616764 (=> res!397295 e!353639)))

(declare-fun lt!283758 () SeekEntryResult!6440)

(assert (=> b!616764 (= res!397295 (not (= lt!283758 (MissingVacant!6440 vacantSpotIndex!68))))))

(declare-fun lt!283759 () Unit!20128)

(assert (=> b!616764 (= lt!283759 e!353638)))

(declare-fun c!70097 () Bool)

(assert (=> b!616764 (= c!70097 (= lt!283758 (Found!6440 index!984)))))

(declare-fun lt!283769 () Unit!20128)

(assert (=> b!616764 (= lt!283769 e!353650)))

(declare-fun c!70094 () Bool)

(assert (=> b!616764 (= c!70094 (= lt!283758 Undefined!6440))))

(declare-fun lt!283777 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37508 (_ BitVec 32)) SeekEntryResult!6440)

(assert (=> b!616764 (= lt!283758 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283777 lt!283773 mask!3053))))

(declare-fun e!353649 () Bool)

(assert (=> b!616764 e!353649))

(declare-fun res!397297 () Bool)

(assert (=> b!616764 (=> (not res!397297) (not e!353649))))

(declare-fun lt!283767 () (_ BitVec 32))

(declare-fun lt!283765 () SeekEntryResult!6440)

(assert (=> b!616764 (= res!397297 (= lt!283765 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283767 vacantSpotIndex!68 lt!283777 lt!283773 mask!3053)))))

(assert (=> b!616764 (= lt!283765 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283767 vacantSpotIndex!68 (select (arr!18000 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616764 (= lt!283777 (select (store (arr!18000 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283760 () Unit!20128)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20128)

(assert (=> b!616764 (= lt!283760 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283767 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616764 (= lt!283767 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616765 () Bool)

(declare-fun res!397302 () Bool)

(assert (=> b!616765 (= res!397302 (arrayContainsKey!0 lt!283773 (select (arr!18000 a!2986) j!136) j!136))))

(declare-fun e!353651 () Bool)

(assert (=> b!616765 (=> (not res!397302) (not e!353651))))

(assert (=> b!616765 (= e!353647 e!353651)))

(declare-fun b!616766 () Bool)

(assert (=> b!616766 false))

(declare-fun lt!283771 () Unit!20128)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37508 (_ BitVec 64) (_ BitVec 32) List!12041) Unit!20128)

(assert (=> b!616766 (= lt!283771 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283773 (select (arr!18000 a!2986) j!136) j!136 Nil!12038))))

(assert (=> b!616766 (arrayNoDuplicates!0 lt!283773 j!136 Nil!12038)))

(declare-fun lt!283772 () Unit!20128)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37508 (_ BitVec 32) (_ BitVec 32)) Unit!20128)

(assert (=> b!616766 (= lt!283772 (lemmaNoDuplicateFromThenFromBigger!0 lt!283773 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616766 (arrayNoDuplicates!0 lt!283773 #b00000000000000000000000000000000 Nil!12038)))

(declare-fun lt!283775 () Unit!20128)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37508 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12041) Unit!20128)

(assert (=> b!616766 (= lt!283775 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12038))))

(assert (=> b!616766 (arrayContainsKey!0 lt!283773 (select (arr!18000 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283770 () Unit!20128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37508 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20128)

(assert (=> b!616766 (= lt!283770 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283773 (select (arr!18000 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20135 () Unit!20128)

(assert (=> b!616766 (= e!353648 Unit!20135)))

(declare-fun b!616767 () Bool)

(declare-fun lt!283761 () SeekEntryResult!6440)

(assert (=> b!616767 (= e!353649 (= lt!283761 lt!283765))))

(declare-fun b!616768 () Bool)

(assert (=> b!616768 false))

(declare-fun lt!283766 () Unit!20128)

(assert (=> b!616768 (= lt!283766 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283773 (select (arr!18000 a!2986) j!136) index!984 Nil!12038))))

(assert (=> b!616768 (arrayNoDuplicates!0 lt!283773 index!984 Nil!12038)))

(declare-fun lt!283774 () Unit!20128)

(assert (=> b!616768 (= lt!283774 (lemmaNoDuplicateFromThenFromBigger!0 lt!283773 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616768 (arrayNoDuplicates!0 lt!283773 #b00000000000000000000000000000000 Nil!12038)))

(declare-fun lt!283762 () Unit!20128)

(assert (=> b!616768 (= lt!283762 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12038))))

(assert (=> b!616768 (arrayContainsKey!0 lt!283773 (select (arr!18000 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283776 () Unit!20128)

(assert (=> b!616768 (= lt!283776 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283773 (select (arr!18000 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616768 e!353641))

(declare-fun res!397298 () Bool)

(assert (=> b!616768 (=> (not res!397298) (not e!353641))))

(assert (=> b!616768 (= res!397298 (arrayContainsKey!0 lt!283773 (select (arr!18000 a!2986) j!136) j!136))))

(declare-fun Unit!20136 () Unit!20128)

(assert (=> b!616768 (= e!353640 Unit!20136)))

(declare-fun b!616769 () Bool)

(declare-fun Unit!20137 () Unit!20128)

(assert (=> b!616769 (= e!353638 Unit!20137)))

(declare-fun res!397300 () Bool)

(assert (=> b!616769 (= res!397300 (= (select (store (arr!18000 a!2986) i!1108 k!1786) index!984) (select (arr!18000 a!2986) j!136)))))

(assert (=> b!616769 (=> (not res!397300) (not e!353652))))

(assert (=> b!616769 e!353652))

(declare-fun c!70096 () Bool)

(assert (=> b!616769 (= c!70096 (bvslt j!136 index!984))))

(declare-fun lt!283768 () Unit!20128)

(assert (=> b!616769 (= lt!283768 e!353648)))

(declare-fun c!70095 () Bool)

(assert (=> b!616769 (= c!70095 (bvslt index!984 j!136))))

(declare-fun lt!283763 () Unit!20128)

(assert (=> b!616769 (= lt!283763 e!353640)))

(assert (=> b!616769 false))

(declare-fun b!616770 () Bool)

(assert (=> b!616770 (= e!353651 (arrayContainsKey!0 lt!283773 (select (arr!18000 a!2986) j!136) index!984))))

(declare-fun b!616771 () Bool)

(assert (=> b!616771 (= e!353642 e!353645)))

(declare-fun res!397299 () Bool)

(assert (=> b!616771 (=> (not res!397299) (not e!353645))))

(assert (=> b!616771 (= res!397299 (and (= lt!283761 (Found!6440 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18000 a!2986) index!984) (select (arr!18000 a!2986) j!136))) (not (= (select (arr!18000 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616771 (= lt!283761 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18000 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616772 () Bool)

(declare-fun res!397307 () Bool)

(assert (=> b!616772 (=> (not res!397307) (not e!353643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37508 (_ BitVec 32)) Bool)

(assert (=> b!616772 (= res!397307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56038 res!397306) b!616758))

(assert (= (and b!616758 res!397303) b!616751))

(assert (= (and b!616751 res!397294) b!616749))

(assert (= (and b!616749 res!397310) b!616763))

(assert (= (and b!616763 res!397304) b!616753))

(assert (= (and b!616753 res!397305) b!616772))

(assert (= (and b!616772 res!397307) b!616750))

(assert (= (and b!616750 res!397301) b!616755))

(assert (= (and b!616755 res!397308) b!616762))

(assert (= (and b!616762 res!397309) b!616771))

(assert (= (and b!616771 res!397299) b!616764))

(assert (= (and b!616764 res!397297) b!616767))

(assert (= (and b!616764 c!70094) b!616760))

(assert (= (and b!616764 (not c!70094)) b!616748))

(assert (= (and b!616764 c!70097) b!616769))

(assert (= (and b!616764 (not c!70097)) b!616756))

(assert (= (and b!616769 res!397300) b!616761))

(assert (= (and b!616761 (not res!397296)) b!616765))

(assert (= (and b!616765 res!397302) b!616770))

(assert (= (and b!616769 c!70096) b!616766))

(assert (= (and b!616769 (not c!70096)) b!616754))

(assert (= (and b!616769 c!70095) b!616768))

(assert (= (and b!616769 (not c!70095)) b!616757))

(assert (= (and b!616768 res!397298) b!616759))

(assert (= (and b!616764 (not res!397295)) b!616752))

(declare-fun m!592901 () Bool)

(assert (=> b!616769 m!592901))

(declare-fun m!592903 () Bool)

(assert (=> b!616769 m!592903))

(declare-fun m!592905 () Bool)

(assert (=> b!616769 m!592905))

(assert (=> b!616765 m!592905))

(assert (=> b!616765 m!592905))

(declare-fun m!592907 () Bool)

(assert (=> b!616765 m!592907))

(assert (=> b!616762 m!592901))

(declare-fun m!592909 () Bool)

(assert (=> b!616762 m!592909))

(declare-fun m!592911 () Bool)

(assert (=> b!616763 m!592911))

(assert (=> b!616752 m!592901))

(assert (=> b!616752 m!592903))

(assert (=> b!616759 m!592905))

(assert (=> b!616759 m!592905))

(declare-fun m!592913 () Bool)

(assert (=> b!616759 m!592913))

(declare-fun m!592915 () Bool)

(assert (=> b!616771 m!592915))

(assert (=> b!616771 m!592905))

(assert (=> b!616771 m!592905))

(declare-fun m!592917 () Bool)

(assert (=> b!616771 m!592917))

(declare-fun m!592919 () Bool)

(assert (=> b!616749 m!592919))

(declare-fun m!592921 () Bool)

(assert (=> b!616750 m!592921))

(declare-fun m!592923 () Bool)

(assert (=> start!56038 m!592923))

(declare-fun m!592925 () Bool)

(assert (=> start!56038 m!592925))

(declare-fun m!592927 () Bool)

(assert (=> b!616755 m!592927))

(assert (=> b!616766 m!592905))

(declare-fun m!592929 () Bool)

(assert (=> b!616766 m!592929))

(assert (=> b!616766 m!592905))

(assert (=> b!616766 m!592905))

(declare-fun m!592931 () Bool)

(assert (=> b!616766 m!592931))

(assert (=> b!616766 m!592905))

(declare-fun m!592933 () Bool)

(assert (=> b!616766 m!592933))

(declare-fun m!592935 () Bool)

(assert (=> b!616766 m!592935))

(declare-fun m!592937 () Bool)

(assert (=> b!616766 m!592937))

(declare-fun m!592939 () Bool)

(assert (=> b!616766 m!592939))

(declare-fun m!592941 () Bool)

(assert (=> b!616766 m!592941))

(declare-fun m!592943 () Bool)

(assert (=> b!616768 m!592943))

(assert (=> b!616768 m!592905))

(assert (=> b!616768 m!592905))

(declare-fun m!592945 () Bool)

(assert (=> b!616768 m!592945))

(assert (=> b!616768 m!592937))

(assert (=> b!616768 m!592905))

(assert (=> b!616768 m!592907))

(assert (=> b!616768 m!592905))

(declare-fun m!592947 () Bool)

(assert (=> b!616768 m!592947))

(assert (=> b!616768 m!592905))

(declare-fun m!592949 () Bool)

(assert (=> b!616768 m!592949))

(declare-fun m!592951 () Bool)

(assert (=> b!616768 m!592951))

(assert (=> b!616768 m!592941))

(declare-fun m!592953 () Bool)

(assert (=> b!616753 m!592953))

(assert (=> b!616770 m!592905))

(assert (=> b!616770 m!592905))

(assert (=> b!616770 m!592913))

(declare-fun m!592955 () Bool)

(assert (=> b!616764 m!592955))

(declare-fun m!592957 () Bool)

(assert (=> b!616764 m!592957))

(declare-fun m!592959 () Bool)

(assert (=> b!616764 m!592959))

(assert (=> b!616764 m!592905))

(assert (=> b!616764 m!592901))

(assert (=> b!616764 m!592905))

(declare-fun m!592961 () Bool)

(assert (=> b!616764 m!592961))

(declare-fun m!592963 () Bool)

(assert (=> b!616764 m!592963))

(declare-fun m!592965 () Bool)

(assert (=> b!616764 m!592965))

(declare-fun m!592967 () Bool)

(assert (=> b!616772 m!592967))

(assert (=> b!616751 m!592905))

(assert (=> b!616751 m!592905))

(declare-fun m!592969 () Bool)

(assert (=> b!616751 m!592969))

(push 1)

