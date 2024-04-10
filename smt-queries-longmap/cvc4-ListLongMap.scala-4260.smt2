; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59118 () Bool)

(assert start!59118)

(declare-fun b!652716 () Bool)

(declare-fun res!423340 () Bool)

(declare-fun e!374666 () Bool)

(assert (=> b!652716 (=> (not res!423340) (not e!374666))))

(declare-datatypes ((array!38618 0))(
  ( (array!38619 (arr!18512 (Array (_ BitVec 32) (_ BitVec 64))) (size!18876 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38618)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38618 (_ BitVec 32)) Bool)

(assert (=> b!652716 (= res!423340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652717 () Bool)

(declare-fun e!374668 () Bool)

(declare-fun e!374664 () Bool)

(assert (=> b!652717 (= e!374668 e!374664)))

(declare-fun res!423348 () Bool)

(assert (=> b!652717 (=> (not res!423348) (not e!374664))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303824 () array!38618)

(declare-fun arrayContainsKey!0 (array!38618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652717 (= res!423348 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) j!136))))

(declare-fun b!652718 () Bool)

(declare-fun res!423357 () Bool)

(declare-fun e!374656 () Bool)

(assert (=> b!652718 (=> (not res!423357) (not e!374656))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!652718 (= res!423357 (and (= (size!18876 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18876 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18876 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652719 () Bool)

(declare-fun e!374667 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652719 (= e!374667 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) index!984))))

(declare-fun b!652720 () Bool)

(declare-fun res!423359 () Bool)

(assert (=> b!652720 (=> (not res!423359) (not e!374666))))

(declare-datatypes ((List!12553 0))(
  ( (Nil!12550) (Cons!12549 (h!13594 (_ BitVec 64)) (t!18781 List!12553)) )
))
(declare-fun arrayNoDuplicates!0 (array!38618 (_ BitVec 32) List!12553) Bool)

(assert (=> b!652720 (= res!423359 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12550))))

(declare-fun b!652721 () Bool)

(declare-datatypes ((Unit!22338 0))(
  ( (Unit!22339) )
))
(declare-fun e!374662 () Unit!22338)

(declare-fun Unit!22340 () Unit!22338)

(assert (=> b!652721 (= e!374662 Unit!22340)))

(declare-fun lt!303832 () Unit!22338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22338)

(assert (=> b!652721 (= lt!303832 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303824 (select (arr!18512 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652721 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!303827 () Unit!22338)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12553) Unit!22338)

(assert (=> b!652721 (= lt!303827 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12550))))

(assert (=> b!652721 (arrayNoDuplicates!0 lt!303824 #b00000000000000000000000000000000 Nil!12550)))

(declare-fun lt!303831 () Unit!22338)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38618 (_ BitVec 32) (_ BitVec 32)) Unit!22338)

(assert (=> b!652721 (= lt!303831 (lemmaNoDuplicateFromThenFromBigger!0 lt!303824 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652721 (arrayNoDuplicates!0 lt!303824 j!136 Nil!12550)))

(declare-fun lt!303835 () Unit!22338)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38618 (_ BitVec 64) (_ BitVec 32) List!12553) Unit!22338)

(assert (=> b!652721 (= lt!303835 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303824 (select (arr!18512 a!2986) j!136) j!136 Nil!12550))))

(assert (=> b!652721 false))

(declare-fun b!652723 () Bool)

(declare-fun e!374657 () Bool)

(assert (=> b!652723 (= e!374666 e!374657)))

(declare-fun res!423341 () Bool)

(assert (=> b!652723 (=> (not res!423341) (not e!374657))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!652723 (= res!423341 (= (select (store (arr!18512 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652723 (= lt!303824 (array!38619 (store (arr!18512 a!2986) i!1108 k!1786) (size!18876 a!2986)))))

(declare-fun b!652724 () Bool)

(declare-fun e!374665 () Bool)

(declare-fun e!374658 () Bool)

(assert (=> b!652724 (= e!374665 (not e!374658))))

(declare-fun res!423351 () Bool)

(assert (=> b!652724 (=> res!423351 e!374658)))

(declare-datatypes ((SeekEntryResult!6952 0))(
  ( (MissingZero!6952 (index!30161 (_ BitVec 32))) (Found!6952 (index!30162 (_ BitVec 32))) (Intermediate!6952 (undefined!7764 Bool) (index!30163 (_ BitVec 32)) (x!58943 (_ BitVec 32))) (Undefined!6952) (MissingVacant!6952 (index!30164 (_ BitVec 32))) )
))
(declare-fun lt!303819 () SeekEntryResult!6952)

(assert (=> b!652724 (= res!423351 (not (= lt!303819 (Found!6952 index!984))))))

(declare-fun lt!303820 () Unit!22338)

(declare-fun e!374669 () Unit!22338)

(assert (=> b!652724 (= lt!303820 e!374669)))

(declare-fun c!75056 () Bool)

(assert (=> b!652724 (= c!75056 (= lt!303819 Undefined!6952))))

(declare-fun lt!303834 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38618 (_ BitVec 32)) SeekEntryResult!6952)

(assert (=> b!652724 (= lt!303819 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303834 lt!303824 mask!3053))))

(declare-fun e!374660 () Bool)

(assert (=> b!652724 e!374660))

(declare-fun res!423354 () Bool)

(assert (=> b!652724 (=> (not res!423354) (not e!374660))))

(declare-fun lt!303829 () (_ BitVec 32))

(declare-fun lt!303818 () SeekEntryResult!6952)

(assert (=> b!652724 (= res!423354 (= lt!303818 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 lt!303834 lt!303824 mask!3053)))))

(assert (=> b!652724 (= lt!303818 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652724 (= lt!303834 (select (store (arr!18512 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303823 () Unit!22338)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38618 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22338)

(assert (=> b!652724 (= lt!303823 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652724 (= lt!303829 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652725 () Bool)

(declare-fun Unit!22341 () Unit!22338)

(assert (=> b!652725 (= e!374669 Unit!22341)))

(declare-fun b!652726 () Bool)

(declare-fun e!374663 () Bool)

(assert (=> b!652726 (= e!374658 e!374663)))

(declare-fun res!423355 () Bool)

(assert (=> b!652726 (=> res!423355 e!374663)))

(declare-fun lt!303821 () (_ BitVec 64))

(assert (=> b!652726 (= res!423355 (or (not (= (select (arr!18512 a!2986) j!136) lt!303834)) (not (= (select (arr!18512 a!2986) j!136) lt!303821))))))

(declare-fun e!374670 () Bool)

(assert (=> b!652726 e!374670))

(declare-fun res!423344 () Bool)

(assert (=> b!652726 (=> (not res!423344) (not e!374670))))

(assert (=> b!652726 (= res!423344 (= lt!303821 (select (arr!18512 a!2986) j!136)))))

(assert (=> b!652726 (= lt!303821 (select (store (arr!18512 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!652727 () Bool)

(declare-fun Unit!22342 () Unit!22338)

(assert (=> b!652727 (= e!374662 Unit!22342)))

(declare-fun b!652728 () Bool)

(declare-fun e!374655 () Bool)

(assert (=> b!652728 (= e!374663 e!374655)))

(declare-fun res!423343 () Bool)

(assert (=> b!652728 (=> res!423343 e!374655)))

(assert (=> b!652728 (= res!423343 (bvsge index!984 j!136))))

(declare-fun lt!303830 () Unit!22338)

(assert (=> b!652728 (= lt!303830 e!374662)))

(declare-fun c!75055 () Bool)

(assert (=> b!652728 (= c!75055 (bvslt j!136 index!984))))

(declare-fun b!652729 () Bool)

(assert (=> b!652729 (= e!374670 e!374668)))

(declare-fun res!423349 () Bool)

(assert (=> b!652729 (=> res!423349 e!374668)))

(assert (=> b!652729 (= res!423349 (or (not (= (select (arr!18512 a!2986) j!136) lt!303834)) (not (= (select (arr!18512 a!2986) j!136) lt!303821)) (bvsge j!136 index!984)))))

(declare-fun b!652730 () Bool)

(declare-fun Unit!22343 () Unit!22338)

(assert (=> b!652730 (= e!374669 Unit!22343)))

(assert (=> b!652730 false))

(declare-fun b!652731 () Bool)

(declare-fun res!423352 () Bool)

(assert (=> b!652731 (=> (not res!423352) (not e!374656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652731 (= res!423352 (validKeyInArray!0 (select (arr!18512 a!2986) j!136)))))

(declare-fun b!652732 () Bool)

(declare-fun e!374661 () Bool)

(assert (=> b!652732 (= e!374655 e!374661)))

(declare-fun res!423345 () Bool)

(assert (=> b!652732 (=> res!423345 e!374661)))

(assert (=> b!652732 (= res!423345 (or (bvsge (size!18876 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18876 a!2986)) (bvsge index!984 (size!18876 a!2986))))))

(assert (=> b!652732 (arrayNoDuplicates!0 lt!303824 index!984 Nil!12550)))

(declare-fun lt!303826 () Unit!22338)

(assert (=> b!652732 (= lt!303826 (lemmaNoDuplicateFromThenFromBigger!0 lt!303824 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652732 (arrayNoDuplicates!0 lt!303824 #b00000000000000000000000000000000 Nil!12550)))

(declare-fun lt!303822 () Unit!22338)

(assert (=> b!652732 (= lt!303822 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12550))))

(assert (=> b!652732 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303833 () Unit!22338)

(assert (=> b!652732 (= lt!303833 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303824 (select (arr!18512 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652732 e!374667))

(declare-fun res!423347 () Bool)

(assert (=> b!652732 (=> (not res!423347) (not e!374667))))

(assert (=> b!652732 (= res!423347 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) j!136))))

(declare-fun b!652722 () Bool)

(declare-fun res!423356 () Bool)

(assert (=> b!652722 (=> (not res!423356) (not e!374666))))

(assert (=> b!652722 (= res!423356 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18512 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!423358 () Bool)

(assert (=> start!59118 (=> (not res!423358) (not e!374656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59118 (= res!423358 (validMask!0 mask!3053))))

(assert (=> start!59118 e!374656))

(assert (=> start!59118 true))

(declare-fun array_inv!14308 (array!38618) Bool)

(assert (=> start!59118 (array_inv!14308 a!2986)))

(declare-fun b!652733 () Bool)

(declare-fun noDuplicate!437 (List!12553) Bool)

(assert (=> b!652733 (= e!374661 (noDuplicate!437 Nil!12550))))

(declare-fun b!652734 () Bool)

(assert (=> b!652734 (= e!374657 e!374665)))

(declare-fun res!423342 () Bool)

(assert (=> b!652734 (=> (not res!423342) (not e!374665))))

(declare-fun lt!303825 () SeekEntryResult!6952)

(assert (=> b!652734 (= res!423342 (and (= lt!303825 (Found!6952 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18512 a!2986) index!984) (select (arr!18512 a!2986) j!136))) (not (= (select (arr!18512 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652734 (= lt!303825 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652735 () Bool)

(assert (=> b!652735 (= e!374656 e!374666)))

(declare-fun res!423353 () Bool)

(assert (=> b!652735 (=> (not res!423353) (not e!374666))))

(declare-fun lt!303828 () SeekEntryResult!6952)

(assert (=> b!652735 (= res!423353 (or (= lt!303828 (MissingZero!6952 i!1108)) (= lt!303828 (MissingVacant!6952 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38618 (_ BitVec 32)) SeekEntryResult!6952)

(assert (=> b!652735 (= lt!303828 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!652736 () Bool)

(assert (=> b!652736 (= e!374660 (= lt!303825 lt!303818))))

(declare-fun b!652737 () Bool)

(declare-fun res!423350 () Bool)

(assert (=> b!652737 (=> (not res!423350) (not e!374656))))

(assert (=> b!652737 (= res!423350 (validKeyInArray!0 k!1786))))

(declare-fun b!652738 () Bool)

(declare-fun res!423346 () Bool)

(assert (=> b!652738 (=> (not res!423346) (not e!374656))))

(assert (=> b!652738 (= res!423346 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652739 () Bool)

(assert (=> b!652739 (= e!374664 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) index!984))))

(assert (= (and start!59118 res!423358) b!652718))

(assert (= (and b!652718 res!423357) b!652731))

(assert (= (and b!652731 res!423352) b!652737))

(assert (= (and b!652737 res!423350) b!652738))

(assert (= (and b!652738 res!423346) b!652735))

(assert (= (and b!652735 res!423353) b!652716))

(assert (= (and b!652716 res!423340) b!652720))

(assert (= (and b!652720 res!423359) b!652722))

(assert (= (and b!652722 res!423356) b!652723))

(assert (= (and b!652723 res!423341) b!652734))

(assert (= (and b!652734 res!423342) b!652724))

(assert (= (and b!652724 res!423354) b!652736))

(assert (= (and b!652724 c!75056) b!652730))

(assert (= (and b!652724 (not c!75056)) b!652725))

(assert (= (and b!652724 (not res!423351)) b!652726))

(assert (= (and b!652726 res!423344) b!652729))

(assert (= (and b!652729 (not res!423349)) b!652717))

(assert (= (and b!652717 res!423348) b!652739))

(assert (= (and b!652726 (not res!423355)) b!652728))

(assert (= (and b!652728 c!75055) b!652721))

(assert (= (and b!652728 (not c!75055)) b!652727))

(assert (= (and b!652728 (not res!423343)) b!652732))

(assert (= (and b!652732 res!423347) b!652719))

(assert (= (and b!652732 (not res!423345)) b!652733))

(declare-fun m!625849 () Bool)

(assert (=> b!652723 m!625849))

(declare-fun m!625851 () Bool)

(assert (=> b!652723 m!625851))

(declare-fun m!625853 () Bool)

(assert (=> b!652726 m!625853))

(assert (=> b!652726 m!625849))

(declare-fun m!625855 () Bool)

(assert (=> b!652726 m!625855))

(assert (=> b!652719 m!625853))

(assert (=> b!652719 m!625853))

(declare-fun m!625857 () Bool)

(assert (=> b!652719 m!625857))

(assert (=> b!652732 m!625853))

(assert (=> b!652732 m!625853))

(declare-fun m!625859 () Bool)

(assert (=> b!652732 m!625859))

(declare-fun m!625861 () Bool)

(assert (=> b!652732 m!625861))

(assert (=> b!652732 m!625853))

(declare-fun m!625863 () Bool)

(assert (=> b!652732 m!625863))

(declare-fun m!625865 () Bool)

(assert (=> b!652732 m!625865))

(assert (=> b!652732 m!625853))

(declare-fun m!625867 () Bool)

(assert (=> b!652732 m!625867))

(declare-fun m!625869 () Bool)

(assert (=> b!652732 m!625869))

(declare-fun m!625871 () Bool)

(assert (=> b!652732 m!625871))

(declare-fun m!625873 () Bool)

(assert (=> b!652738 m!625873))

(declare-fun m!625875 () Bool)

(assert (=> b!652735 m!625875))

(assert (=> b!652721 m!625853))

(declare-fun m!625877 () Bool)

(assert (=> b!652721 m!625877))

(assert (=> b!652721 m!625861))

(declare-fun m!625879 () Bool)

(assert (=> b!652721 m!625879))

(declare-fun m!625881 () Bool)

(assert (=> b!652721 m!625881))

(assert (=> b!652721 m!625853))

(declare-fun m!625883 () Bool)

(assert (=> b!652721 m!625883))

(assert (=> b!652721 m!625871))

(assert (=> b!652721 m!625853))

(assert (=> b!652721 m!625853))

(declare-fun m!625885 () Bool)

(assert (=> b!652721 m!625885))

(declare-fun m!625887 () Bool)

(assert (=> b!652724 m!625887))

(declare-fun m!625889 () Bool)

(assert (=> b!652724 m!625889))

(assert (=> b!652724 m!625853))

(assert (=> b!652724 m!625849))

(assert (=> b!652724 m!625853))

(declare-fun m!625891 () Bool)

(assert (=> b!652724 m!625891))

(declare-fun m!625893 () Bool)

(assert (=> b!652724 m!625893))

(declare-fun m!625895 () Bool)

(assert (=> b!652724 m!625895))

(declare-fun m!625897 () Bool)

(assert (=> b!652724 m!625897))

(declare-fun m!625899 () Bool)

(assert (=> b!652733 m!625899))

(assert (=> b!652731 m!625853))

(assert (=> b!652731 m!625853))

(declare-fun m!625901 () Bool)

(assert (=> b!652731 m!625901))

(declare-fun m!625903 () Bool)

(assert (=> b!652737 m!625903))

(declare-fun m!625905 () Bool)

(assert (=> b!652734 m!625905))

(assert (=> b!652734 m!625853))

(assert (=> b!652734 m!625853))

(declare-fun m!625907 () Bool)

(assert (=> b!652734 m!625907))

(assert (=> b!652729 m!625853))

(declare-fun m!625909 () Bool)

(assert (=> b!652720 m!625909))

(assert (=> b!652739 m!625853))

(assert (=> b!652739 m!625853))

(assert (=> b!652739 m!625857))

(declare-fun m!625911 () Bool)

(assert (=> b!652716 m!625911))

(declare-fun m!625913 () Bool)

(assert (=> b!652722 m!625913))

(assert (=> b!652717 m!625853))

(assert (=> b!652717 m!625853))

(assert (=> b!652717 m!625859))

(declare-fun m!625915 () Bool)

(assert (=> start!59118 m!625915))

(declare-fun m!625917 () Bool)

(assert (=> start!59118 m!625917))

(push 1)

(assert (not b!652739))

(assert (not start!59118))

(assert (not b!652724))

(assert (not b!652731))

(assert (not b!652721))

(assert (not b!652738))

(assert (not b!652734))

(assert (not b!652717))

(assert (not b!652720))

(assert (not b!652716))

(assert (not b!652732))

(assert (not b!652737))

(assert (not b!652735))

(assert (not b!652733))

(assert (not b!652719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!652807 () Bool)

(declare-fun c!75077 () Bool)

(declare-fun lt!303855 () (_ BitVec 64))

(assert (=> b!652807 (= c!75077 (= lt!303855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374720 () SeekEntryResult!6952)

(declare-fun e!374719 () SeekEntryResult!6952)

(assert (=> b!652807 (= e!374720 e!374719)))

(declare-fun lt!303856 () SeekEntryResult!6952)

(declare-fun d!92233 () Bool)

(assert (=> d!92233 (and (or (is-Undefined!6952 lt!303856) (not (is-Found!6952 lt!303856)) (and (bvsge (index!30162 lt!303856) #b00000000000000000000000000000000) (bvslt (index!30162 lt!303856) (size!18876 a!2986)))) (or (is-Undefined!6952 lt!303856) (is-Found!6952 lt!303856) (not (is-MissingVacant!6952 lt!303856)) (not (= (index!30164 lt!303856) vacantSpotIndex!68)) (and (bvsge (index!30164 lt!303856) #b00000000000000000000000000000000) (bvslt (index!30164 lt!303856) (size!18876 a!2986)))) (or (is-Undefined!6952 lt!303856) (ite (is-Found!6952 lt!303856) (= (select (arr!18512 a!2986) (index!30162 lt!303856)) (select (arr!18512 a!2986) j!136)) (and (is-MissingVacant!6952 lt!303856) (= (index!30164 lt!303856) vacantSpotIndex!68) (= (select (arr!18512 a!2986) (index!30164 lt!303856)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374721 () SeekEntryResult!6952)

(assert (=> d!92233 (= lt!303856 e!374721)))

(declare-fun c!75078 () Bool)

(assert (=> d!92233 (= c!75078 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92233 (= lt!303855 (select (arr!18512 a!2986) lt!303829))))

(assert (=> d!92233 (validMask!0 mask!3053)))

(assert (=> d!92233 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053) lt!303856)))

(declare-fun b!652808 () Bool)

(assert (=> b!652808 (= e!374721 e!374720)))

(declare-fun c!75076 () Bool)

(assert (=> b!652808 (= c!75076 (= lt!303855 (select (arr!18512 a!2986) j!136)))))

(declare-fun b!652809 () Bool)

(assert (=> b!652809 (= e!374719 (MissingVacant!6952 vacantSpotIndex!68))))

(declare-fun b!652810 () Bool)

(assert (=> b!652810 (= e!374721 Undefined!6952)))

(declare-fun b!652811 () Bool)

(assert (=> b!652811 (= e!374719 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303829 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652812 () Bool)

(assert (=> b!652812 (= e!374720 (Found!6952 lt!303829))))

(assert (= (and d!92233 c!75078) b!652810))

(assert (= (and d!92233 (not c!75078)) b!652808))

(assert (= (and b!652808 c!75076) b!652812))

(assert (= (and b!652808 (not c!75076)) b!652807))

(assert (= (and b!652807 c!75077) b!652809))

(assert (= (and b!652807 (not c!75077)) b!652811))

(declare-fun m!625961 () Bool)

(assert (=> d!92233 m!625961))

(declare-fun m!625963 () Bool)

(assert (=> d!92233 m!625963))

(declare-fun m!625965 () Bool)

(assert (=> d!92233 m!625965))

(assert (=> d!92233 m!625915))

(declare-fun m!625967 () Bool)

(assert (=> b!652811 m!625967))

(assert (=> b!652811 m!625967))

(assert (=> b!652811 m!625853))

(declare-fun m!625969 () Bool)

(assert (=> b!652811 m!625969))

(assert (=> b!652724 d!92233))

(declare-fun b!652813 () Bool)

(declare-fun c!75080 () Bool)

(declare-fun lt!303857 () (_ BitVec 64))

(assert (=> b!652813 (= c!75080 (= lt!303857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374723 () SeekEntryResult!6952)

(declare-fun e!374722 () SeekEntryResult!6952)

(assert (=> b!652813 (= e!374723 e!374722)))

(declare-fun d!92253 () Bool)

(declare-fun lt!303858 () SeekEntryResult!6952)

(assert (=> d!92253 (and (or (is-Undefined!6952 lt!303858) (not (is-Found!6952 lt!303858)) (and (bvsge (index!30162 lt!303858) #b00000000000000000000000000000000) (bvslt (index!30162 lt!303858) (size!18876 lt!303824)))) (or (is-Undefined!6952 lt!303858) (is-Found!6952 lt!303858) (not (is-MissingVacant!6952 lt!303858)) (not (= (index!30164 lt!303858) vacantSpotIndex!68)) (and (bvsge (index!30164 lt!303858) #b00000000000000000000000000000000) (bvslt (index!30164 lt!303858) (size!18876 lt!303824)))) (or (is-Undefined!6952 lt!303858) (ite (is-Found!6952 lt!303858) (= (select (arr!18512 lt!303824) (index!30162 lt!303858)) lt!303834) (and (is-MissingVacant!6952 lt!303858) (= (index!30164 lt!303858) vacantSpotIndex!68) (= (select (arr!18512 lt!303824) (index!30164 lt!303858)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374724 () SeekEntryResult!6952)

(assert (=> d!92253 (= lt!303858 e!374724)))

(declare-fun c!75081 () Bool)

(assert (=> d!92253 (= c!75081 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92253 (= lt!303857 (select (arr!18512 lt!303824) index!984))))

(assert (=> d!92253 (validMask!0 mask!3053)))

(assert (=> d!92253 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303834 lt!303824 mask!3053) lt!303858)))

(declare-fun b!652814 () Bool)

(assert (=> b!652814 (= e!374724 e!374723)))

(declare-fun c!75079 () Bool)

(assert (=> b!652814 (= c!75079 (= lt!303857 lt!303834))))

(declare-fun b!652815 () Bool)

(assert (=> b!652815 (= e!374722 (MissingVacant!6952 vacantSpotIndex!68))))

(declare-fun b!652816 () Bool)

(assert (=> b!652816 (= e!374724 Undefined!6952)))

(declare-fun b!652817 () Bool)

(assert (=> b!652817 (= e!374722 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!303834 lt!303824 mask!3053))))

(declare-fun b!652818 () Bool)

(assert (=> b!652818 (= e!374723 (Found!6952 index!984))))

(assert (= (and d!92253 c!75081) b!652816))

(assert (= (and d!92253 (not c!75081)) b!652814))

(assert (= (and b!652814 c!75079) b!652818))

(assert (= (and b!652814 (not c!75079)) b!652813))

(assert (= (and b!652813 c!75080) b!652815))

(assert (= (and b!652813 (not c!75080)) b!652817))

(declare-fun m!625971 () Bool)

(assert (=> d!92253 m!625971))

(declare-fun m!625973 () Bool)

(assert (=> d!92253 m!625973))

(declare-fun m!625975 () Bool)

(assert (=> d!92253 m!625975))

(assert (=> d!92253 m!625915))

(assert (=> b!652817 m!625887))

(assert (=> b!652817 m!625887))

(declare-fun m!625977 () Bool)

(assert (=> b!652817 m!625977))

(assert (=> b!652724 d!92253))

(declare-fun d!92255 () Bool)

(declare-fun lt!303867 () (_ BitVec 32))

(assert (=> d!92255 (and (bvsge lt!303867 #b00000000000000000000000000000000) (bvslt lt!303867 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92255 (= lt!303867 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92255 (validMask!0 mask!3053)))

(assert (=> d!92255 (= (nextIndex!0 index!984 x!910 mask!3053) lt!303867)))

(declare-fun bs!19457 () Bool)

(assert (= bs!19457 d!92255))

(declare-fun m!625987 () Bool)

(assert (=> bs!19457 m!625987))

(assert (=> bs!19457 m!625915))

(assert (=> b!652724 d!92255))

(declare-fun b!652821 () Bool)

(declare-fun c!75083 () Bool)

(declare-fun lt!303868 () (_ BitVec 64))

(assert (=> b!652821 (= c!75083 (= lt!303868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374728 () SeekEntryResult!6952)

(declare-fun e!374727 () SeekEntryResult!6952)

(assert (=> b!652821 (= e!374728 e!374727)))

(declare-fun lt!303869 () SeekEntryResult!6952)

(declare-fun d!92265 () Bool)

(assert (=> d!92265 (and (or (is-Undefined!6952 lt!303869) (not (is-Found!6952 lt!303869)) (and (bvsge (index!30162 lt!303869) #b00000000000000000000000000000000) (bvslt (index!30162 lt!303869) (size!18876 lt!303824)))) (or (is-Undefined!6952 lt!303869) (is-Found!6952 lt!303869) (not (is-MissingVacant!6952 lt!303869)) (not (= (index!30164 lt!303869) vacantSpotIndex!68)) (and (bvsge (index!30164 lt!303869) #b00000000000000000000000000000000) (bvslt (index!30164 lt!303869) (size!18876 lt!303824)))) (or (is-Undefined!6952 lt!303869) (ite (is-Found!6952 lt!303869) (= (select (arr!18512 lt!303824) (index!30162 lt!303869)) lt!303834) (and (is-MissingVacant!6952 lt!303869) (= (index!30164 lt!303869) vacantSpotIndex!68) (= (select (arr!18512 lt!303824) (index!30164 lt!303869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374729 () SeekEntryResult!6952)

(assert (=> d!92265 (= lt!303869 e!374729)))

(declare-fun c!75084 () Bool)

(assert (=> d!92265 (= c!75084 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92265 (= lt!303868 (select (arr!18512 lt!303824) lt!303829))))

(assert (=> d!92265 (validMask!0 mask!3053)))

(assert (=> d!92265 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 lt!303834 lt!303824 mask!3053) lt!303869)))

(declare-fun b!652822 () Bool)

(assert (=> b!652822 (= e!374729 e!374728)))

(declare-fun c!75082 () Bool)

(assert (=> b!652822 (= c!75082 (= lt!303868 lt!303834))))

(declare-fun b!652823 () Bool)

(assert (=> b!652823 (= e!374727 (MissingVacant!6952 vacantSpotIndex!68))))

(declare-fun b!652824 () Bool)

(assert (=> b!652824 (= e!374729 Undefined!6952)))

(declare-fun b!652825 () Bool)

(assert (=> b!652825 (= e!374727 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303829 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!303834 lt!303824 mask!3053))))

(declare-fun b!652826 () Bool)

(assert (=> b!652826 (= e!374728 (Found!6952 lt!303829))))

(assert (= (and d!92265 c!75084) b!652824))

(assert (= (and d!92265 (not c!75084)) b!652822))

(assert (= (and b!652822 c!75082) b!652826))

(assert (= (and b!652822 (not c!75082)) b!652821))

(assert (= (and b!652821 c!75083) b!652823))

(assert (= (and b!652821 (not c!75083)) b!652825))

(declare-fun m!625989 () Bool)

(assert (=> d!92265 m!625989))

(declare-fun m!625991 () Bool)

(assert (=> d!92265 m!625991))

(declare-fun m!625993 () Bool)

(assert (=> d!92265 m!625993))

(assert (=> d!92265 m!625915))

(assert (=> b!652825 m!625967))

(assert (=> b!652825 m!625967))

(declare-fun m!625995 () Bool)

(assert (=> b!652825 m!625995))

(assert (=> b!652724 d!92265))

(declare-fun d!92267 () Bool)

(declare-fun e!374757 () Bool)

(assert (=> d!92267 e!374757))

(declare-fun res!423411 () Bool)

(assert (=> d!92267 (=> (not res!423411) (not e!374757))))

(assert (=> d!92267 (= res!423411 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18876 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18876 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18876 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18876 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18876 a!2986))))))

(declare-fun lt!303887 () Unit!22338)

(declare-fun choose!9 (array!38618 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22338)

(assert (=> d!92267 (= lt!303887 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92267 (validMask!0 mask!3053)))

(assert (=> d!92267 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 mask!3053) lt!303887)))

(declare-fun b!652861 () Bool)

(assert (=> b!652861 (= e!374757 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303829 vacantSpotIndex!68 (select (store (arr!18512 a!2986) i!1108 k!1786) j!136) (array!38619 (store (arr!18512 a!2986) i!1108 k!1786) (size!18876 a!2986)) mask!3053)))))

(assert (= (and d!92267 res!423411) b!652861))

(declare-fun m!626025 () Bool)

(assert (=> d!92267 m!626025))

(assert (=> d!92267 m!625915))

(assert (=> b!652861 m!625889))

(assert (=> b!652861 m!625853))

(assert (=> b!652861 m!625849))

(assert (=> b!652861 m!625853))

(assert (=> b!652861 m!625891))

(assert (=> b!652861 m!625889))

(declare-fun m!626027 () Bool)

(assert (=> b!652861 m!626027))

(assert (=> b!652724 d!92267))

(declare-fun b!652910 () Bool)

(declare-fun e!374788 () SeekEntryResult!6952)

(assert (=> b!652910 (= e!374788 Undefined!6952)))

(declare-fun b!652911 () Bool)

(declare-fun c!75111 () Bool)

(declare-fun lt!303920 () (_ BitVec 64))

(assert (=> b!652911 (= c!75111 (= lt!303920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374790 () SeekEntryResult!6952)

(declare-fun e!374789 () SeekEntryResult!6952)

(assert (=> b!652911 (= e!374790 e!374789)))

(declare-fun lt!303918 () SeekEntryResult!6952)

(declare-fun b!652912 () Bool)

(assert (=> b!652912 (= e!374789 (seekKeyOrZeroReturnVacant!0 (x!58943 lt!303918) (index!30163 lt!303918) (index!30163 lt!303918) k!1786 a!2986 mask!3053))))

(declare-fun b!652913 () Bool)

(assert (=> b!652913 (= e!374789 (MissingZero!6952 (index!30163 lt!303918)))))

(declare-fun d!92279 () Bool)

(declare-fun lt!303919 () SeekEntryResult!6952)

(assert (=> d!92279 (and (or (is-Undefined!6952 lt!303919) (not (is-Found!6952 lt!303919)) (and (bvsge (index!30162 lt!303919) #b00000000000000000000000000000000) (bvslt (index!30162 lt!303919) (size!18876 a!2986)))) (or (is-Undefined!6952 lt!303919) (is-Found!6952 lt!303919) (not (is-MissingZero!6952 lt!303919)) (and (bvsge (index!30161 lt!303919) #b00000000000000000000000000000000) (bvslt (index!30161 lt!303919) (size!18876 a!2986)))) (or (is-Undefined!6952 lt!303919) (is-Found!6952 lt!303919) (is-MissingZero!6952 lt!303919) (not (is-MissingVacant!6952 lt!303919)) (and (bvsge (index!30164 lt!303919) #b00000000000000000000000000000000) (bvslt (index!30164 lt!303919) (size!18876 a!2986)))) (or (is-Undefined!6952 lt!303919) (ite (is-Found!6952 lt!303919) (= (select (arr!18512 a!2986) (index!30162 lt!303919)) k!1786) (ite (is-MissingZero!6952 lt!303919) (= (select (arr!18512 a!2986) (index!30161 lt!303919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6952 lt!303919) (= (select (arr!18512 a!2986) (index!30164 lt!303919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92279 (= lt!303919 e!374788)))

(declare-fun c!75112 () Bool)

(assert (=> d!92279 (= c!75112 (and (is-Intermediate!6952 lt!303918) (undefined!7764 lt!303918)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38618 (_ BitVec 32)) SeekEntryResult!6952)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92279 (= lt!303918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!92279 (validMask!0 mask!3053)))

(assert (=> d!92279 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!303919)))

(declare-fun b!652914 () Bool)

(assert (=> b!652914 (= e!374788 e!374790)))

(assert (=> b!652914 (= lt!303920 (select (arr!18512 a!2986) (index!30163 lt!303918)))))

(declare-fun c!75110 () Bool)

(assert (=> b!652914 (= c!75110 (= lt!303920 k!1786))))

(declare-fun b!652915 () Bool)

(assert (=> b!652915 (= e!374790 (Found!6952 (index!30163 lt!303918)))))

(assert (= (and d!92279 c!75112) b!652910))

(assert (= (and d!92279 (not c!75112)) b!652914))

(assert (= (and b!652914 c!75110) b!652915))

(assert (= (and b!652914 (not c!75110)) b!652911))

(assert (= (and b!652911 c!75111) b!652913))

(assert (= (and b!652911 (not c!75111)) b!652912))

(declare-fun m!626077 () Bool)

(assert (=> b!652912 m!626077))

(declare-fun m!626079 () Bool)

(assert (=> d!92279 m!626079))

(declare-fun m!626081 () Bool)

(assert (=> d!92279 m!626081))

(declare-fun m!626083 () Bool)

(assert (=> d!92279 m!626083))

(assert (=> d!92279 m!625915))

(declare-fun m!626085 () Bool)

(assert (=> d!92279 m!626085))

(assert (=> d!92279 m!626083))

(declare-fun m!626087 () Bool)

(assert (=> d!92279 m!626087))

(declare-fun m!626089 () Bool)

(assert (=> b!652914 m!626089))

(assert (=> b!652735 d!92279))

(declare-fun d!92295 () Bool)

(declare-fun res!423428 () Bool)

(declare-fun e!374795 () Bool)

(assert (=> d!92295 (=> res!423428 e!374795)))

(assert (=> d!92295 (= res!423428 (is-Nil!12550 Nil!12550))))

(assert (=> d!92295 (= (noDuplicate!437 Nil!12550) e!374795)))

(declare-fun b!652920 () Bool)

(declare-fun e!374796 () Bool)

(assert (=> b!652920 (= e!374795 e!374796)))

(declare-fun res!423429 () Bool)

(assert (=> b!652920 (=> (not res!423429) (not e!374796))))

(declare-fun contains!3181 (List!12553 (_ BitVec 64)) Bool)

(assert (=> b!652920 (= res!423429 (not (contains!3181 (t!18781 Nil!12550) (h!13594 Nil!12550))))))

(declare-fun b!652921 () Bool)

(assert (=> b!652921 (= e!374796 (noDuplicate!437 (t!18781 Nil!12550)))))

(assert (= (and d!92295 (not res!423428)) b!652920))

(assert (= (and b!652920 res!423429) b!652921))

(declare-fun m!626091 () Bool)

(assert (=> b!652920 m!626091))

(declare-fun m!626093 () Bool)

(assert (=> b!652921 m!626093))

(assert (=> b!652733 d!92295))

(declare-fun d!92297 () Bool)

(assert (=> d!92297 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59118 d!92297))

(declare-fun d!92305 () Bool)

(assert (=> d!92305 (= (array_inv!14308 a!2986) (bvsge (size!18876 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59118 d!92305))

(declare-fun b!652940 () Bool)

(declare-fun c!75123 () Bool)

(declare-fun lt!303930 () (_ BitVec 64))

(assert (=> b!652940 (= c!75123 (= lt!303930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374807 () SeekEntryResult!6952)

(declare-fun e!374806 () SeekEntryResult!6952)

(assert (=> b!652940 (= e!374807 e!374806)))

(declare-fun lt!303931 () SeekEntryResult!6952)

(declare-fun d!92307 () Bool)

(assert (=> d!92307 (and (or (is-Undefined!6952 lt!303931) (not (is-Found!6952 lt!303931)) (and (bvsge (index!30162 lt!303931) #b00000000000000000000000000000000) (bvslt (index!30162 lt!303931) (size!18876 a!2986)))) (or (is-Undefined!6952 lt!303931) (is-Found!6952 lt!303931) (not (is-MissingVacant!6952 lt!303931)) (not (= (index!30164 lt!303931) vacantSpotIndex!68)) (and (bvsge (index!30164 lt!303931) #b00000000000000000000000000000000) (bvslt (index!30164 lt!303931) (size!18876 a!2986)))) (or (is-Undefined!6952 lt!303931) (ite (is-Found!6952 lt!303931) (= (select (arr!18512 a!2986) (index!30162 lt!303931)) (select (arr!18512 a!2986) j!136)) (and (is-MissingVacant!6952 lt!303931) (= (index!30164 lt!303931) vacantSpotIndex!68) (= (select (arr!18512 a!2986) (index!30164 lt!303931)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374808 () SeekEntryResult!6952)

(assert (=> d!92307 (= lt!303931 e!374808)))

(declare-fun c!75124 () Bool)

(assert (=> d!92307 (= c!75124 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92307 (= lt!303930 (select (arr!18512 a!2986) index!984))))

(assert (=> d!92307 (validMask!0 mask!3053)))

(assert (=> d!92307 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053) lt!303931)))

(declare-fun b!652941 () Bool)

(assert (=> b!652941 (= e!374808 e!374807)))

(declare-fun c!75122 () Bool)

(assert (=> b!652941 (= c!75122 (= lt!303930 (select (arr!18512 a!2986) j!136)))))

(declare-fun b!652942 () Bool)

(assert (=> b!652942 (= e!374806 (MissingVacant!6952 vacantSpotIndex!68))))

(declare-fun b!652943 () Bool)

(assert (=> b!652943 (= e!374808 Undefined!6952)))

(declare-fun b!652944 () Bool)

(assert (=> b!652944 (= e!374806 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652945 () Bool)

(assert (=> b!652945 (= e!374807 (Found!6952 index!984))))

(assert (= (and d!92307 c!75124) b!652943))

(assert (= (and d!92307 (not c!75124)) b!652941))

(assert (= (and b!652941 c!75122) b!652945))

(assert (= (and b!652941 (not c!75122)) b!652940))

(assert (= (and b!652940 c!75123) b!652942))

(assert (= (and b!652940 (not c!75123)) b!652944))

(declare-fun m!626109 () Bool)

(assert (=> d!92307 m!626109))

(declare-fun m!626111 () Bool)

(assert (=> d!92307 m!626111))

(assert (=> d!92307 m!625905))

(assert (=> d!92307 m!625915))

(assert (=> b!652944 m!625887))

(assert (=> b!652944 m!625887))

(assert (=> b!652944 m!625853))

(declare-fun m!626113 () Bool)

(assert (=> b!652944 m!626113))

(assert (=> b!652734 d!92307))

(declare-fun d!92309 () Bool)

(declare-fun res!423434 () Bool)

(declare-fun e!374813 () Bool)

(assert (=> d!92309 (=> res!423434 e!374813)))

(assert (=> d!92309 (= res!423434 (= (select (arr!18512 lt!303824) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92309 (= (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!374813)))

(declare-fun b!652950 () Bool)

(declare-fun e!374814 () Bool)

(assert (=> b!652950 (= e!374813 e!374814)))

(declare-fun res!423435 () Bool)

(assert (=> b!652950 (=> (not res!423435) (not e!374814))))

(assert (=> b!652950 (= res!423435 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18876 lt!303824)))))

(declare-fun b!652951 () Bool)

(assert (=> b!652951 (= e!374814 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92309 (not res!423434)) b!652950))

(assert (= (and b!652950 res!423435) b!652951))

(declare-fun m!626115 () Bool)

(assert (=> d!92309 m!626115))

(assert (=> b!652951 m!625853))

(declare-fun m!626117 () Bool)

(assert (=> b!652951 m!626117))

(assert (=> b!652721 d!92309))

(declare-fun b!652974 () Bool)

(declare-fun e!374831 () Bool)

(declare-fun e!374830 () Bool)

(assert (=> b!652974 (= e!374831 e!374830)))

(declare-fun res!423444 () Bool)

(assert (=> b!652974 (=> (not res!423444) (not e!374830))))

(declare-fun e!374832 () Bool)

(assert (=> b!652974 (= res!423444 (not e!374832))))

(declare-fun res!423442 () Bool)

(assert (=> b!652974 (=> (not res!423442) (not e!374832))))

(assert (=> b!652974 (= res!423442 (validKeyInArray!0 (select (arr!18512 lt!303824) j!136)))))

(declare-fun d!92311 () Bool)

(declare-fun res!423443 () Bool)

(assert (=> d!92311 (=> res!423443 e!374831)))

(assert (=> d!92311 (= res!423443 (bvsge j!136 (size!18876 lt!303824)))))

(assert (=> d!92311 (= (arrayNoDuplicates!0 lt!303824 j!136 Nil!12550) e!374831)))

(declare-fun b!652975 () Bool)

(declare-fun e!374829 () Bool)

(declare-fun call!33796 () Bool)

(assert (=> b!652975 (= e!374829 call!33796)))

(declare-fun b!652976 () Bool)

(assert (=> b!652976 (= e!374830 e!374829)))

(declare-fun c!75133 () Bool)

(assert (=> b!652976 (= c!75133 (validKeyInArray!0 (select (arr!18512 lt!303824) j!136)))))

(declare-fun b!652977 () Bool)

(assert (=> b!652977 (= e!374829 call!33796)))

(declare-fun bm!33793 () Bool)

(assert (=> bm!33793 (= call!33796 (arrayNoDuplicates!0 lt!303824 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75133 (Cons!12549 (select (arr!18512 lt!303824) j!136) Nil!12550) Nil!12550)))))

(declare-fun b!652978 () Bool)

(assert (=> b!652978 (= e!374832 (contains!3181 Nil!12550 (select (arr!18512 lt!303824) j!136)))))

(assert (= (and d!92311 (not res!423443)) b!652974))

(assert (= (and b!652974 res!423442) b!652978))

(assert (= (and b!652974 res!423444) b!652976))

(assert (= (and b!652976 c!75133) b!652975))

(assert (= (and b!652976 (not c!75133)) b!652977))

(assert (= (or b!652975 b!652977) bm!33793))

(declare-fun m!626119 () Bool)

(assert (=> b!652974 m!626119))

(assert (=> b!652974 m!626119))

(declare-fun m!626121 () Bool)

(assert (=> b!652974 m!626121))

(assert (=> b!652976 m!626119))

(assert (=> b!652976 m!626119))

(assert (=> b!652976 m!626121))

(assert (=> bm!33793 m!626119))

(declare-fun m!626123 () Bool)

(assert (=> bm!33793 m!626123))

(assert (=> b!652978 m!626119))

(assert (=> b!652978 m!626119))

(declare-fun m!626125 () Bool)

(assert (=> b!652978 m!626125))

(assert (=> b!652721 d!92311))

(declare-fun d!92313 () Bool)

(assert (=> d!92313 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18876 lt!303824)) (not (= (select (arr!18512 lt!303824) j!136) (select (arr!18512 a!2986) j!136))))))

(declare-fun lt!303940 () Unit!22338)

(declare-fun choose!21 (array!38618 (_ BitVec 64) (_ BitVec 32) List!12553) Unit!22338)

(assert (=> d!92313 (= lt!303940 (choose!21 lt!303824 (select (arr!18512 a!2986) j!136) j!136 Nil!12550))))

(assert (=> d!92313 (bvslt (size!18876 lt!303824) #b01111111111111111111111111111111)))

(assert (=> d!92313 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303824 (select (arr!18512 a!2986) j!136) j!136 Nil!12550) lt!303940)))

(declare-fun bs!19461 () Bool)

(assert (= bs!19461 d!92313))

(assert (=> bs!19461 m!626119))

(assert (=> bs!19461 m!625853))

(declare-fun m!626133 () Bool)

(assert (=> bs!19461 m!626133))

(assert (=> b!652721 d!92313))

(declare-fun b!652985 () Bool)

(declare-fun e!374838 () Bool)

(declare-fun e!374837 () Bool)

(assert (=> b!652985 (= e!374838 e!374837)))

(declare-fun res!423447 () Bool)

(assert (=> b!652985 (=> (not res!423447) (not e!374837))))

(declare-fun e!374839 () Bool)

(assert (=> b!652985 (= res!423447 (not e!374839))))

(declare-fun res!423445 () Bool)

(assert (=> b!652985 (=> (not res!423445) (not e!374839))))

(assert (=> b!652985 (= res!423445 (validKeyInArray!0 (select (arr!18512 lt!303824) #b00000000000000000000000000000000)))))

(declare-fun d!92315 () Bool)

(declare-fun res!423446 () Bool)

(assert (=> d!92315 (=> res!423446 e!374838)))

(assert (=> d!92315 (= res!423446 (bvsge #b00000000000000000000000000000000 (size!18876 lt!303824)))))

(assert (=> d!92315 (= (arrayNoDuplicates!0 lt!303824 #b00000000000000000000000000000000 Nil!12550) e!374838)))

(declare-fun b!652986 () Bool)

(declare-fun e!374836 () Bool)

(declare-fun call!33797 () Bool)

(assert (=> b!652986 (= e!374836 call!33797)))

(declare-fun b!652987 () Bool)

(assert (=> b!652987 (= e!374837 e!374836)))

(declare-fun c!75137 () Bool)

(assert (=> b!652987 (= c!75137 (validKeyInArray!0 (select (arr!18512 lt!303824) #b00000000000000000000000000000000)))))

(declare-fun b!652988 () Bool)

(assert (=> b!652988 (= e!374836 call!33797)))

(declare-fun bm!33794 () Bool)

(assert (=> bm!33794 (= call!33797 (arrayNoDuplicates!0 lt!303824 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75137 (Cons!12549 (select (arr!18512 lt!303824) #b00000000000000000000000000000000) Nil!12550) Nil!12550)))))

(declare-fun b!652989 () Bool)

(assert (=> b!652989 (= e!374839 (contains!3181 Nil!12550 (select (arr!18512 lt!303824) #b00000000000000000000000000000000)))))

(assert (= (and d!92315 (not res!423446)) b!652985))

(assert (= (and b!652985 res!423445) b!652989))

(assert (= (and b!652985 res!423447) b!652987))

(assert (= (and b!652987 c!75137) b!652986))

(assert (= (and b!652987 (not c!75137)) b!652988))

(assert (= (or b!652986 b!652988) bm!33794))

(declare-fun m!626137 () Bool)

(assert (=> b!652985 m!626137))

(assert (=> b!652985 m!626137))

(declare-fun m!626139 () Bool)

(assert (=> b!652985 m!626139))

(assert (=> b!652987 m!626137))

(assert (=> b!652987 m!626137))

(assert (=> b!652987 m!626139))

(assert (=> bm!33794 m!626137))

(declare-fun m!626141 () Bool)

(assert (=> bm!33794 m!626141))

(assert (=> b!652989 m!626137))

(assert (=> b!652989 m!626137))

(declare-fun m!626143 () Bool)

(assert (=> b!652989 m!626143))

(assert (=> b!652721 d!92315))

(declare-fun d!92319 () Bool)

(declare-fun e!374848 () Bool)

(assert (=> d!92319 e!374848))

(declare-fun res!423450 () Bool)

(assert (=> d!92319 (=> (not res!423450) (not e!374848))))

(assert (=> d!92319 (= res!423450 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18876 a!2986))))))

(declare-fun lt!303949 () Unit!22338)

(declare-fun choose!41 (array!38618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12553) Unit!22338)

(assert (=> d!92319 (= lt!303949 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12550))))

(assert (=> d!92319 (bvslt (size!18876 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92319 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12550) lt!303949)))

(declare-fun b!653004 () Bool)

(assert (=> b!653004 (= e!374848 (arrayNoDuplicates!0 (array!38619 (store (arr!18512 a!2986) i!1108 k!1786) (size!18876 a!2986)) #b00000000000000000000000000000000 Nil!12550))))

(assert (= (and d!92319 res!423450) b!653004))

(declare-fun m!626145 () Bool)

(assert (=> d!92319 m!626145))

(assert (=> b!653004 m!625849))

(declare-fun m!626147 () Bool)

(assert (=> b!653004 m!626147))

(assert (=> b!652721 d!92319))

(declare-fun d!92321 () Bool)

(assert (=> d!92321 (arrayNoDuplicates!0 lt!303824 j!136 Nil!12550)))

(declare-fun lt!303952 () Unit!22338)

(declare-fun choose!39 (array!38618 (_ BitVec 32) (_ BitVec 32)) Unit!22338)

(assert (=> d!92321 (= lt!303952 (choose!39 lt!303824 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92321 (bvslt (size!18876 lt!303824) #b01111111111111111111111111111111)))

(assert (=> d!92321 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303824 #b00000000000000000000000000000000 j!136) lt!303952)))

(declare-fun bs!19462 () Bool)

(assert (= bs!19462 d!92321))

(assert (=> bs!19462 m!625881))

(declare-fun m!626149 () Bool)

(assert (=> bs!19462 m!626149))

(assert (=> b!652721 d!92321))

(declare-fun d!92323 () Bool)

(assert (=> d!92323 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303958 () Unit!22338)

(declare-fun choose!114 (array!38618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22338)

(assert (=> d!92323 (= lt!303958 (choose!114 lt!303824 (select (arr!18512 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92323 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92323 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303824 (select (arr!18512 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303958)))

(declare-fun bs!19463 () Bool)

(assert (= bs!19463 d!92323))

(assert (=> bs!19463 m!625853))

(assert (=> bs!19463 m!625885))

(assert (=> bs!19463 m!625853))

(declare-fun m!626165 () Bool)

(assert (=> bs!19463 m!626165))

(assert (=> b!652721 d!92323))

(declare-fun d!92327 () Bool)

(declare-fun res!423454 () Bool)

(declare-fun e!374856 () Bool)

(assert (=> d!92327 (=> res!423454 e!374856)))

(assert (=> d!92327 (= res!423454 (= (select (arr!18512 lt!303824) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92327 (= (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!374856)))

(declare-fun b!653016 () Bool)

(declare-fun e!374857 () Bool)

(assert (=> b!653016 (= e!374856 e!374857)))

(declare-fun res!423455 () Bool)

(assert (=> b!653016 (=> (not res!423455) (not e!374857))))

(assert (=> b!653016 (= res!423455 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18876 lt!303824)))))

(declare-fun b!653017 () Bool)

(assert (=> b!653017 (= e!374857 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92327 (not res!423454)) b!653016))

(assert (= (and b!653016 res!423455) b!653017))

(declare-fun m!626167 () Bool)

(assert (=> d!92327 m!626167))

(assert (=> b!653017 m!625853))

(declare-fun m!626169 () Bool)

(assert (=> b!653017 m!626169))

(assert (=> b!652732 d!92327))

(declare-fun d!92329 () Bool)

(assert (=> d!92329 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303961 () Unit!22338)

(assert (=> d!92329 (= lt!303961 (choose!114 lt!303824 (select (arr!18512 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92329 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92329 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303824 (select (arr!18512 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!303961)))

(declare-fun bs!19464 () Bool)

(assert (= bs!19464 d!92329))

(assert (=> bs!19464 m!625853))

(assert (=> bs!19464 m!625867))

(assert (=> bs!19464 m!625853))

(declare-fun m!626173 () Bool)

(assert (=> bs!19464 m!626173))

(assert (=> b!652732 d!92329))

(declare-fun b!653020 () Bool)

(declare-fun e!374862 () Bool)

(declare-fun e!374861 () Bool)

(assert (=> b!653020 (= e!374862 e!374861)))

(declare-fun res!423460 () Bool)

(assert (=> b!653020 (=> (not res!423460) (not e!374861))))

(declare-fun e!374863 () Bool)

(assert (=> b!653020 (= res!423460 (not e!374863))))

(declare-fun res!423458 () Bool)

(assert (=> b!653020 (=> (not res!423458) (not e!374863))))

(assert (=> b!653020 (= res!423458 (validKeyInArray!0 (select (arr!18512 lt!303824) index!984)))))

(declare-fun d!92331 () Bool)

(declare-fun res!423459 () Bool)

(assert (=> d!92331 (=> res!423459 e!374862)))

(assert (=> d!92331 (= res!423459 (bvsge index!984 (size!18876 lt!303824)))))

(assert (=> d!92331 (= (arrayNoDuplicates!0 lt!303824 index!984 Nil!12550) e!374862)))

(declare-fun b!653021 () Bool)

(declare-fun e!374860 () Bool)

(declare-fun call!33799 () Bool)

(assert (=> b!653021 (= e!374860 call!33799)))

(declare-fun b!653022 () Bool)

(assert (=> b!653022 (= e!374861 e!374860)))

(declare-fun c!75148 () Bool)

(assert (=> b!653022 (= c!75148 (validKeyInArray!0 (select (arr!18512 lt!303824) index!984)))))

(declare-fun b!653023 () Bool)

(assert (=> b!653023 (= e!374860 call!33799)))

(declare-fun bm!33796 () Bool)

(assert (=> bm!33796 (= call!33799 (arrayNoDuplicates!0 lt!303824 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75148 (Cons!12549 (select (arr!18512 lt!303824) index!984) Nil!12550) Nil!12550)))))

(declare-fun b!653024 () Bool)

(assert (=> b!653024 (= e!374863 (contains!3181 Nil!12550 (select (arr!18512 lt!303824) index!984)))))

(assert (= (and d!92331 (not res!423459)) b!653020))

(assert (= (and b!653020 res!423458) b!653024))

(assert (= (and b!653020 res!423460) b!653022))

(assert (= (and b!653022 c!75148) b!653021))

(assert (= (and b!653022 (not c!75148)) b!653023))

(assert (= (or b!653021 b!653023) bm!33796))

(assert (=> b!653020 m!625975))

(assert (=> b!653020 m!625975))

(declare-fun m!626177 () Bool)

(assert (=> b!653020 m!626177))

(assert (=> b!653022 m!625975))

(assert (=> b!653022 m!625975))

(assert (=> b!653022 m!626177))

(assert (=> bm!33796 m!625975))

(declare-fun m!626179 () Bool)

(assert (=> bm!33796 m!626179))

(assert (=> b!653024 m!625975))

(assert (=> b!653024 m!625975))

(declare-fun m!626181 () Bool)

(assert (=> b!653024 m!626181))

(assert (=> b!652732 d!92331))

(assert (=> b!652732 d!92315))

(assert (=> b!652732 d!92319))

(declare-fun d!92335 () Bool)

(declare-fun res!423461 () Bool)

(declare-fun e!374864 () Bool)

(assert (=> d!92335 (=> res!423461 e!374864)))

(assert (=> d!92335 (= res!423461 (= (select (arr!18512 lt!303824) j!136) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92335 (= (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) j!136) e!374864)))

(declare-fun b!653025 () Bool)

(declare-fun e!374865 () Bool)

(assert (=> b!653025 (= e!374864 e!374865)))

(declare-fun res!423462 () Bool)

(assert (=> b!653025 (=> (not res!423462) (not e!374865))))

(assert (=> b!653025 (= res!423462 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18876 lt!303824)))))

(declare-fun b!653026 () Bool)

(assert (=> b!653026 (= e!374865 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92335 (not res!423461)) b!653025))

(assert (= (and b!653025 res!423462) b!653026))

(assert (=> d!92335 m!626119))

(assert (=> b!653026 m!625853))

(declare-fun m!626183 () Bool)

(assert (=> b!653026 m!626183))

(assert (=> b!652732 d!92335))

(declare-fun d!92337 () Bool)

(assert (=> d!92337 (arrayNoDuplicates!0 lt!303824 index!984 Nil!12550)))

(declare-fun lt!303962 () Unit!22338)

(assert (=> d!92337 (= lt!303962 (choose!39 lt!303824 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92337 (bvslt (size!18876 lt!303824) #b01111111111111111111111111111111)))

(assert (=> d!92337 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303824 #b00000000000000000000000000000000 index!984) lt!303962)))

(declare-fun bs!19465 () Bool)

(assert (= bs!19465 d!92337))

(assert (=> bs!19465 m!625869))

(declare-fun m!626185 () Bool)

(assert (=> bs!19465 m!626185))

(assert (=> b!652732 d!92337))

(declare-fun b!653031 () Bool)

(declare-fun e!374872 () Bool)

(declare-fun e!374871 () Bool)

(assert (=> b!653031 (= e!374872 e!374871)))

(declare-fun res!423469 () Bool)

(assert (=> b!653031 (=> (not res!423469) (not e!374871))))

(declare-fun e!374873 () Bool)

(assert (=> b!653031 (= res!423469 (not e!374873))))

(declare-fun res!423467 () Bool)

(assert (=> b!653031 (=> (not res!423467) (not e!374873))))

(assert (=> b!653031 (= res!423467 (validKeyInArray!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92339 () Bool)

(declare-fun res!423468 () Bool)

(assert (=> d!92339 (=> res!423468 e!374872)))

(assert (=> d!92339 (= res!423468 (bvsge #b00000000000000000000000000000000 (size!18876 a!2986)))))

(assert (=> d!92339 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12550) e!374872)))

(declare-fun b!653032 () Bool)

(declare-fun e!374870 () Bool)

(declare-fun call!33800 () Bool)

(assert (=> b!653032 (= e!374870 call!33800)))

(declare-fun b!653033 () Bool)

(assert (=> b!653033 (= e!374871 e!374870)))

(declare-fun c!75149 () Bool)

(assert (=> b!653033 (= c!75149 (validKeyInArray!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653034 () Bool)

(assert (=> b!653034 (= e!374870 call!33800)))

(declare-fun bm!33797 () Bool)

(assert (=> bm!33797 (= call!33800 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75149 (Cons!12549 (select (arr!18512 a!2986) #b00000000000000000000000000000000) Nil!12550) Nil!12550)))))

(declare-fun b!653035 () Bool)

(assert (=> b!653035 (= e!374873 (contains!3181 Nil!12550 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92339 (not res!423468)) b!653031))

(assert (= (and b!653031 res!423467) b!653035))

(assert (= (and b!653031 res!423469) b!653033))

(assert (= (and b!653033 c!75149) b!653032))

(assert (= (and b!653033 (not c!75149)) b!653034))

(assert (= (or b!653032 b!653034) bm!33797))

(declare-fun m!626187 () Bool)

(assert (=> b!653031 m!626187))

(assert (=> b!653031 m!626187))

(declare-fun m!626191 () Bool)

(assert (=> b!653031 m!626191))

(assert (=> b!653033 m!626187))

(assert (=> b!653033 m!626187))

(assert (=> b!653033 m!626191))

(assert (=> bm!33797 m!626187))

(declare-fun m!626193 () Bool)

(assert (=> bm!33797 m!626193))

(assert (=> b!653035 m!626187))

(assert (=> b!653035 m!626187))

(declare-fun m!626197 () Bool)

(assert (=> b!653035 m!626197))

(assert (=> b!652720 d!92339))

(declare-fun d!92341 () Bool)

(assert (=> d!92341 (= (validKeyInArray!0 (select (arr!18512 a!2986) j!136)) (and (not (= (select (arr!18512 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18512 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652731 d!92341))

(declare-fun d!92347 () Bool)

(declare-fun res!423475 () Bool)

(declare-fun e!374879 () Bool)

(assert (=> d!92347 (=> res!423475 e!374879)))

(assert (=> d!92347 (= res!423475 (= (select (arr!18512 lt!303824) index!984) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92347 (= (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) index!984) e!374879)))

(declare-fun b!653041 () Bool)

(declare-fun e!374880 () Bool)

(assert (=> b!653041 (= e!374879 e!374880)))

(declare-fun res!423476 () Bool)

(assert (=> b!653041 (=> (not res!423476) (not e!374880))))

(assert (=> b!653041 (= res!423476 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18876 lt!303824)))))

(declare-fun b!653042 () Bool)

(assert (=> b!653042 (= e!374880 (arrayContainsKey!0 lt!303824 (select (arr!18512 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92347 (not res!423475)) b!653041))

(assert (= (and b!653041 res!423476) b!653042))

(assert (=> d!92347 m!625975))

(assert (=> b!653042 m!625853))

(declare-fun m!626205 () Bool)

(assert (=> b!653042 m!626205))

(assert (=> b!652719 d!92347))

(assert (=> b!652717 d!92335))

(assert (=> b!652739 d!92347))

(declare-fun d!92351 () Bool)

(assert (=> d!92351 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652737 d!92351))

(declare-fun b!653094 () Bool)

(declare-fun e!374919 () Bool)

(declare-fun e!374920 () Bool)

(assert (=> b!653094 (= e!374919 e!374920)))

(declare-fun c!75164 () Bool)

(assert (=> b!653094 (= c!75164 (validKeyInArray!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33803 () Bool)

(declare-fun call!33806 () Bool)

(assert (=> bm!33803 (= call!33806 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!653095 () Bool)

(declare-fun e!374918 () Bool)

(assert (=> b!653095 (= e!374920 e!374918)))

(declare-fun lt!303983 () (_ BitVec 64))

(assert (=> b!653095 (= lt!303983 (select (arr!18512 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!303985 () Unit!22338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38618 (_ BitVec 64) (_ BitVec 32)) Unit!22338)

(assert (=> b!653095 (= lt!303985 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!303983 #b00000000000000000000000000000000))))

(assert (=> b!653095 (arrayContainsKey!0 a!2986 lt!303983 #b00000000000000000000000000000000)))

(declare-fun lt!303984 () Unit!22338)

(assert (=> b!653095 (= lt!303984 lt!303985)))

(declare-fun res!423500 () Bool)

(assert (=> b!653095 (= res!423500 (= (seekEntryOrOpen!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6952 #b00000000000000000000000000000000)))))

(assert (=> b!653095 (=> (not res!423500) (not e!374918))))

(declare-fun d!92353 () Bool)

(declare-fun res!423501 () Bool)

(assert (=> d!92353 (=> res!423501 e!374919)))

(assert (=> d!92353 (= res!423501 (bvsge #b00000000000000000000000000000000 (size!18876 a!2986)))))

