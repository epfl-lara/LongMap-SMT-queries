; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56204 () Bool)

(assert start!56204)

(declare-fun b!622857 () Bool)

(assert (=> b!622857 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37674 0))(
  ( (array!37675 (arr!18083 (Array (_ BitVec 32) (_ BitVec 64))) (size!18447 (_ BitVec 32))) )
))
(declare-fun lt!288750 () array!37674)

(declare-datatypes ((Unit!20958 0))(
  ( (Unit!20959) )
))
(declare-fun lt!288752 () Unit!20958)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37674)

(declare-datatypes ((List!12124 0))(
  ( (Nil!12121) (Cons!12120 (h!13165 (_ BitVec 64)) (t!18352 List!12124)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37674 (_ BitVec 64) (_ BitVec 32) List!12124) Unit!20958)

(assert (=> b!622857 (= lt!288752 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288750 (select (arr!18083 a!2986) j!136) index!984 Nil!12121))))

(declare-fun arrayNoDuplicates!0 (array!37674 (_ BitVec 32) List!12124) Bool)

(assert (=> b!622857 (arrayNoDuplicates!0 lt!288750 index!984 Nil!12121)))

(declare-fun lt!288747 () Unit!20958)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37674 (_ BitVec 32) (_ BitVec 32)) Unit!20958)

(assert (=> b!622857 (= lt!288747 (lemmaNoDuplicateFromThenFromBigger!0 lt!288750 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622857 (arrayNoDuplicates!0 lt!288750 #b00000000000000000000000000000000 Nil!12121)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!288742 () Unit!20958)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12124) Unit!20958)

(assert (=> b!622857 (= lt!288742 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12121))))

(declare-fun arrayContainsKey!0 (array!37674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622857 (arrayContainsKey!0 lt!288750 (select (arr!18083 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288746 () Unit!20958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20958)

(assert (=> b!622857 (= lt!288746 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288750 (select (arr!18083 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357258 () Bool)

(assert (=> b!622857 e!357258))

(declare-fun res!401411 () Bool)

(assert (=> b!622857 (=> (not res!401411) (not e!357258))))

(assert (=> b!622857 (= res!401411 (arrayContainsKey!0 lt!288750 (select (arr!18083 a!2986) j!136) j!136))))

(declare-fun e!357260 () Unit!20958)

(declare-fun Unit!20960 () Unit!20958)

(assert (=> b!622857 (= e!357260 Unit!20960)))

(declare-fun b!622858 () Bool)

(declare-fun res!401420 () Bool)

(declare-fun e!357266 () Bool)

(assert (=> b!622858 (=> (not res!401420) (not e!357266))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37674 (_ BitVec 32)) Bool)

(assert (=> b!622858 (= res!401420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!357268 () Bool)

(declare-fun b!622859 () Bool)

(assert (=> b!622859 (= e!357268 (arrayContainsKey!0 lt!288750 (select (arr!18083 a!2986) j!136) index!984))))

(declare-fun b!622860 () Bool)

(declare-fun e!357265 () Unit!20958)

(declare-fun Unit!20961 () Unit!20958)

(assert (=> b!622860 (= e!357265 Unit!20961)))

(declare-fun b!622861 () Bool)

(declare-fun e!357264 () Bool)

(assert (=> b!622861 (= e!357264 e!357266)))

(declare-fun res!401421 () Bool)

(assert (=> b!622861 (=> (not res!401421) (not e!357266))))

(declare-datatypes ((SeekEntryResult!6523 0))(
  ( (MissingZero!6523 (index!28376 (_ BitVec 32))) (Found!6523 (index!28377 (_ BitVec 32))) (Intermediate!6523 (undefined!7335 Bool) (index!28378 (_ BitVec 32)) (x!57139 (_ BitVec 32))) (Undefined!6523) (MissingVacant!6523 (index!28379 (_ BitVec 32))) )
))
(declare-fun lt!288741 () SeekEntryResult!6523)

(assert (=> b!622861 (= res!401421 (or (= lt!288741 (MissingZero!6523 i!1108)) (= lt!288741 (MissingVacant!6523 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37674 (_ BitVec 32)) SeekEntryResult!6523)

(assert (=> b!622861 (= lt!288741 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622862 () Bool)

(declare-fun Unit!20962 () Unit!20958)

(assert (=> b!622862 (= e!357265 Unit!20962)))

(declare-fun res!401415 () Bool)

(assert (=> b!622862 (= res!401415 (= (select (store (arr!18083 a!2986) i!1108 k!1786) index!984) (select (arr!18083 a!2986) j!136)))))

(declare-fun e!357270 () Bool)

(assert (=> b!622862 (=> (not res!401415) (not e!357270))))

(assert (=> b!622862 e!357270))

(declare-fun c!71092 () Bool)

(assert (=> b!622862 (= c!71092 (bvslt j!136 index!984))))

(declare-fun lt!288749 () Unit!20958)

(declare-fun e!357269 () Unit!20958)

(assert (=> b!622862 (= lt!288749 e!357269)))

(declare-fun c!71093 () Bool)

(assert (=> b!622862 (= c!71093 (bvslt index!984 j!136))))

(declare-fun lt!288755 () Unit!20958)

(assert (=> b!622862 (= lt!288755 e!357260)))

(assert (=> b!622862 false))

(declare-fun b!622863 () Bool)

(declare-fun res!401426 () Bool)

(assert (=> b!622863 (=> (not res!401426) (not e!357264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622863 (= res!401426 (validKeyInArray!0 (select (arr!18083 a!2986) j!136)))))

(declare-fun b!622864 () Bool)

(declare-fun res!401416 () Bool)

(assert (=> b!622864 (=> (not res!401416) (not e!357266))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622864 (= res!401416 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18083 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622865 () Bool)

(assert (=> b!622865 (= e!357258 (arrayContainsKey!0 lt!288750 (select (arr!18083 a!2986) j!136) index!984))))

(declare-fun b!622866 () Bool)

(assert (=> b!622866 false))

(declare-fun lt!288743 () Unit!20958)

(assert (=> b!622866 (= lt!288743 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288750 (select (arr!18083 a!2986) j!136) j!136 Nil!12121))))

(assert (=> b!622866 (arrayNoDuplicates!0 lt!288750 j!136 Nil!12121)))

(declare-fun lt!288739 () Unit!20958)

(assert (=> b!622866 (= lt!288739 (lemmaNoDuplicateFromThenFromBigger!0 lt!288750 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622866 (arrayNoDuplicates!0 lt!288750 #b00000000000000000000000000000000 Nil!12121)))

(declare-fun lt!288751 () Unit!20958)

(assert (=> b!622866 (= lt!288751 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12121))))

(assert (=> b!622866 (arrayContainsKey!0 lt!288750 (select (arr!18083 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288740 () Unit!20958)

(assert (=> b!622866 (= lt!288740 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288750 (select (arr!18083 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20963 () Unit!20958)

(assert (=> b!622866 (= e!357269 Unit!20963)))

(declare-fun b!622867 () Bool)

(declare-fun e!357259 () Bool)

(assert (=> b!622867 (= e!357266 e!357259)))

(declare-fun res!401413 () Bool)

(assert (=> b!622867 (=> (not res!401413) (not e!357259))))

(assert (=> b!622867 (= res!401413 (= (select (store (arr!18083 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622867 (= lt!288750 (array!37675 (store (arr!18083 a!2986) i!1108 k!1786) (size!18447 a!2986)))))

(declare-fun b!622868 () Bool)

(declare-fun e!357257 () Unit!20958)

(declare-fun Unit!20964 () Unit!20958)

(assert (=> b!622868 (= e!357257 Unit!20964)))

(assert (=> b!622868 false))

(declare-fun b!622869 () Bool)

(declare-fun res!401425 () Bool)

(assert (=> b!622869 (=> (not res!401425) (not e!357266))))

(assert (=> b!622869 (= res!401425 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12121))))

(declare-fun b!622870 () Bool)

(declare-fun Unit!20965 () Unit!20958)

(assert (=> b!622870 (= e!357260 Unit!20965)))

(declare-fun b!622871 () Bool)

(declare-fun e!357261 () Bool)

(assert (=> b!622871 (= e!357261 (not true))))

(declare-fun lt!288756 () Unit!20958)

(assert (=> b!622871 (= lt!288756 e!357265)))

(declare-fun c!71090 () Bool)

(declare-fun lt!288744 () SeekEntryResult!6523)

(assert (=> b!622871 (= c!71090 (= lt!288744 (Found!6523 index!984)))))

(declare-fun lt!288754 () Unit!20958)

(assert (=> b!622871 (= lt!288754 e!357257)))

(declare-fun c!71091 () Bool)

(assert (=> b!622871 (= c!71091 (= lt!288744 Undefined!6523))))

(declare-fun lt!288753 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37674 (_ BitVec 32)) SeekEntryResult!6523)

(assert (=> b!622871 (= lt!288744 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288753 lt!288750 mask!3053))))

(declare-fun e!357262 () Bool)

(assert (=> b!622871 e!357262))

(declare-fun res!401414 () Bool)

(assert (=> b!622871 (=> (not res!401414) (not e!357262))))

(declare-fun lt!288738 () (_ BitVec 32))

(declare-fun lt!288757 () SeekEntryResult!6523)

(assert (=> b!622871 (= res!401414 (= lt!288757 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288738 vacantSpotIndex!68 lt!288753 lt!288750 mask!3053)))))

(assert (=> b!622871 (= lt!288757 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288738 vacantSpotIndex!68 (select (arr!18083 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622871 (= lt!288753 (select (store (arr!18083 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288748 () Unit!20958)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37674 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20958)

(assert (=> b!622871 (= lt!288748 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288738 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622871 (= lt!288738 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622872 () Bool)

(declare-fun Unit!20966 () Unit!20958)

(assert (=> b!622872 (= e!357269 Unit!20966)))

(declare-fun b!622873 () Bool)

(declare-fun res!401417 () Bool)

(assert (=> b!622873 (= res!401417 (bvsge j!136 index!984))))

(declare-fun e!357263 () Bool)

(assert (=> b!622873 (=> res!401417 e!357263)))

(assert (=> b!622873 (= e!357270 e!357263)))

(declare-fun b!622874 () Bool)

(declare-fun res!401422 () Bool)

(assert (=> b!622874 (=> (not res!401422) (not e!357264))))

(assert (=> b!622874 (= res!401422 (validKeyInArray!0 k!1786))))

(declare-fun b!622875 () Bool)

(declare-fun res!401418 () Bool)

(assert (=> b!622875 (=> (not res!401418) (not e!357264))))

(assert (=> b!622875 (= res!401418 (and (= (size!18447 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18447 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18447 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!401424 () Bool)

(assert (=> start!56204 (=> (not res!401424) (not e!357264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56204 (= res!401424 (validMask!0 mask!3053))))

(assert (=> start!56204 e!357264))

(assert (=> start!56204 true))

(declare-fun array_inv!13879 (array!37674) Bool)

(assert (=> start!56204 (array_inv!13879 a!2986)))

(declare-fun b!622876 () Bool)

(declare-fun res!401419 () Bool)

(assert (=> b!622876 (=> (not res!401419) (not e!357264))))

(assert (=> b!622876 (= res!401419 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622877 () Bool)

(declare-fun Unit!20967 () Unit!20958)

(assert (=> b!622877 (= e!357257 Unit!20967)))

(declare-fun b!622878 () Bool)

(declare-fun lt!288745 () SeekEntryResult!6523)

(assert (=> b!622878 (= e!357262 (= lt!288745 lt!288757))))

(declare-fun b!622879 () Bool)

(declare-fun res!401412 () Bool)

(assert (=> b!622879 (= res!401412 (arrayContainsKey!0 lt!288750 (select (arr!18083 a!2986) j!136) j!136))))

(assert (=> b!622879 (=> (not res!401412) (not e!357268))))

(assert (=> b!622879 (= e!357263 e!357268)))

(declare-fun b!622880 () Bool)

(assert (=> b!622880 (= e!357259 e!357261)))

(declare-fun res!401423 () Bool)

(assert (=> b!622880 (=> (not res!401423) (not e!357261))))

(assert (=> b!622880 (= res!401423 (and (= lt!288745 (Found!6523 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18083 a!2986) index!984) (select (arr!18083 a!2986) j!136))) (not (= (select (arr!18083 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622880 (= lt!288745 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18083 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56204 res!401424) b!622875))

(assert (= (and b!622875 res!401418) b!622863))

(assert (= (and b!622863 res!401426) b!622874))

(assert (= (and b!622874 res!401422) b!622876))

(assert (= (and b!622876 res!401419) b!622861))

(assert (= (and b!622861 res!401421) b!622858))

(assert (= (and b!622858 res!401420) b!622869))

(assert (= (and b!622869 res!401425) b!622864))

(assert (= (and b!622864 res!401416) b!622867))

(assert (= (and b!622867 res!401413) b!622880))

(assert (= (and b!622880 res!401423) b!622871))

(assert (= (and b!622871 res!401414) b!622878))

(assert (= (and b!622871 c!71091) b!622868))

(assert (= (and b!622871 (not c!71091)) b!622877))

(assert (= (and b!622871 c!71090) b!622862))

(assert (= (and b!622871 (not c!71090)) b!622860))

(assert (= (and b!622862 res!401415) b!622873))

(assert (= (and b!622873 (not res!401417)) b!622879))

(assert (= (and b!622879 res!401412) b!622859))

(assert (= (and b!622862 c!71092) b!622866))

(assert (= (and b!622862 (not c!71092)) b!622872))

(assert (= (and b!622862 c!71093) b!622857))

(assert (= (and b!622862 (not c!71093)) b!622870))

(assert (= (and b!622857 res!401411) b!622865))

(declare-fun m!598711 () Bool)

(assert (=> b!622858 m!598711))

(declare-fun m!598713 () Bool)

(assert (=> start!56204 m!598713))

(declare-fun m!598715 () Bool)

(assert (=> start!56204 m!598715))

(declare-fun m!598717 () Bool)

(assert (=> b!622871 m!598717))

(declare-fun m!598719 () Bool)

(assert (=> b!622871 m!598719))

(declare-fun m!598721 () Bool)

(assert (=> b!622871 m!598721))

(declare-fun m!598723 () Bool)

(assert (=> b!622871 m!598723))

(declare-fun m!598725 () Bool)

(assert (=> b!622871 m!598725))

(declare-fun m!598727 () Bool)

(assert (=> b!622871 m!598727))

(declare-fun m!598729 () Bool)

(assert (=> b!622871 m!598729))

(assert (=> b!622871 m!598723))

(declare-fun m!598731 () Bool)

(assert (=> b!622871 m!598731))

(assert (=> b!622859 m!598723))

(assert (=> b!622859 m!598723))

(declare-fun m!598733 () Bool)

(assert (=> b!622859 m!598733))

(declare-fun m!598735 () Bool)

(assert (=> b!622864 m!598735))

(assert (=> b!622862 m!598725))

(declare-fun m!598737 () Bool)

(assert (=> b!622862 m!598737))

(assert (=> b!622862 m!598723))

(declare-fun m!598739 () Bool)

(assert (=> b!622876 m!598739))

(declare-fun m!598741 () Bool)

(assert (=> b!622866 m!598741))

(assert (=> b!622866 m!598723))

(declare-fun m!598743 () Bool)

(assert (=> b!622866 m!598743))

(assert (=> b!622866 m!598723))

(declare-fun m!598745 () Bool)

(assert (=> b!622866 m!598745))

(declare-fun m!598747 () Bool)

(assert (=> b!622866 m!598747))

(assert (=> b!622866 m!598723))

(declare-fun m!598749 () Bool)

(assert (=> b!622866 m!598749))

(assert (=> b!622866 m!598723))

(declare-fun m!598751 () Bool)

(assert (=> b!622866 m!598751))

(declare-fun m!598753 () Bool)

(assert (=> b!622866 m!598753))

(declare-fun m!598755 () Bool)

(assert (=> b!622874 m!598755))

(assert (=> b!622857 m!598723))

(declare-fun m!598757 () Bool)

(assert (=> b!622857 m!598757))

(assert (=> b!622857 m!598723))

(assert (=> b!622857 m!598743))

(assert (=> b!622857 m!598723))

(declare-fun m!598759 () Bool)

(assert (=> b!622857 m!598759))

(declare-fun m!598761 () Bool)

(assert (=> b!622857 m!598761))

(assert (=> b!622857 m!598723))

(declare-fun m!598763 () Bool)

(assert (=> b!622857 m!598763))

(declare-fun m!598765 () Bool)

(assert (=> b!622857 m!598765))

(assert (=> b!622857 m!598723))

(declare-fun m!598767 () Bool)

(assert (=> b!622857 m!598767))

(assert (=> b!622857 m!598753))

(declare-fun m!598769 () Bool)

(assert (=> b!622880 m!598769))

(assert (=> b!622880 m!598723))

(assert (=> b!622880 m!598723))

(declare-fun m!598771 () Bool)

(assert (=> b!622880 m!598771))

(assert (=> b!622867 m!598725))

(declare-fun m!598773 () Bool)

(assert (=> b!622867 m!598773))

(assert (=> b!622863 m!598723))

(assert (=> b!622863 m!598723))

(declare-fun m!598775 () Bool)

(assert (=> b!622863 m!598775))

(declare-fun m!598777 () Bool)

(assert (=> b!622869 m!598777))

(assert (=> b!622865 m!598723))

(assert (=> b!622865 m!598723))

(assert (=> b!622865 m!598733))

(declare-fun m!598779 () Bool)

(assert (=> b!622861 m!598779))

(assert (=> b!622879 m!598723))

(assert (=> b!622879 m!598723))

(assert (=> b!622879 m!598757))

(push 1)

