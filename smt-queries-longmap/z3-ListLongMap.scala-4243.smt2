; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58750 () Bool)

(assert start!58750)

(declare-fun b!647862 () Bool)

(declare-fun res!419759 () Bool)

(declare-fun e!371516 () Bool)

(assert (=> b!647862 (=> (not res!419759) (not e!371516))))

(declare-datatypes ((array!38505 0))(
  ( (array!38506 (arr!18460 (Array (_ BitVec 32) (_ BitVec 64))) (size!18824 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38505)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647862 (= res!419759 (validKeyInArray!0 (select (arr!18460 a!2986) j!136)))))

(declare-fun b!647863 () Bool)

(declare-fun res!419760 () Bool)

(declare-fun e!371515 () Bool)

(assert (=> b!647863 (=> res!419760 e!371515)))

(declare-datatypes ((List!12501 0))(
  ( (Nil!12498) (Cons!12497 (h!13542 (_ BitVec 64)) (t!18729 List!12501)) )
))
(declare-fun noDuplicate!418 (List!12501) Bool)

(assert (=> b!647863 (= res!419760 (not (noDuplicate!418 Nil!12498)))))

(declare-fun b!647864 () Bool)

(declare-fun res!419748 () Bool)

(assert (=> b!647864 (=> res!419748 e!371515)))

(declare-fun contains!3156 (List!12501 (_ BitVec 64)) Bool)

(assert (=> b!647864 (= res!419748 (contains!3156 Nil!12498 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647865 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!647865 (= e!371515 (not (contains!3156 Nil!12498 k0!1786)))))

(declare-fun b!647866 () Bool)

(declare-fun res!419751 () Bool)

(assert (=> b!647866 (=> (not res!419751) (not e!371516))))

(declare-fun arrayContainsKey!0 (array!38505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647866 (= res!419751 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!647867 () Bool)

(declare-fun e!371528 () Bool)

(assert (=> b!647867 (= e!371528 e!371515)))

(declare-fun res!419765 () Bool)

(assert (=> b!647867 (=> res!419765 e!371515)))

(assert (=> b!647867 (= res!419765 (or (bvsge (size!18824 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18824 a!2986))))))

(declare-fun lt!300658 () array!38505)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!647867 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!22026 0))(
  ( (Unit!22027) )
))
(declare-fun lt!300661 () Unit!22026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22026)

(assert (=> b!647867 (= lt!300661 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300658 (select (arr!18460 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371520 () Bool)

(assert (=> b!647867 e!371520))

(declare-fun res!419756 () Bool)

(assert (=> b!647867 (=> (not res!419756) (not e!371520))))

(assert (=> b!647867 (= res!419756 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) j!136))))

(declare-fun b!647868 () Bool)

(declare-fun e!371523 () Bool)

(assert (=> b!647868 (= e!371523 e!371528)))

(declare-fun res!419747 () Bool)

(assert (=> b!647868 (=> res!419747 e!371528)))

(assert (=> b!647868 (= res!419747 (bvsge index!984 j!136))))

(declare-fun lt!300666 () Unit!22026)

(declare-fun e!371521 () Unit!22026)

(assert (=> b!647868 (= lt!300666 e!371521)))

(declare-fun c!74425 () Bool)

(assert (=> b!647868 (= c!74425 (bvslt j!136 index!984))))

(declare-fun b!647870 () Bool)

(declare-fun e!371527 () Bool)

(assert (=> b!647870 (= e!371527 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) index!984))))

(declare-fun b!647871 () Bool)

(declare-fun e!371522 () Bool)

(declare-fun e!371524 () Bool)

(assert (=> b!647871 (= e!371522 e!371524)))

(declare-fun res!419755 () Bool)

(assert (=> b!647871 (=> (not res!419755) (not e!371524))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!647871 (= res!419755 (= (select (store (arr!18460 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647871 (= lt!300658 (array!38506 (store (arr!18460 a!2986) i!1108 k0!1786) (size!18824 a!2986)))))

(declare-fun b!647872 () Bool)

(declare-fun e!371514 () Bool)

(assert (=> b!647872 (= e!371514 e!371527)))

(declare-fun res!419749 () Bool)

(assert (=> b!647872 (=> (not res!419749) (not e!371527))))

(assert (=> b!647872 (= res!419749 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) j!136))))

(declare-fun b!647873 () Bool)

(declare-fun e!371529 () Bool)

(declare-fun e!371525 () Bool)

(assert (=> b!647873 (= e!371529 (not e!371525))))

(declare-fun res!419746 () Bool)

(assert (=> b!647873 (=> res!419746 e!371525)))

(declare-datatypes ((SeekEntryResult!6900 0))(
  ( (MissingZero!6900 (index!29944 (_ BitVec 32))) (Found!6900 (index!29945 (_ BitVec 32))) (Intermediate!6900 (undefined!7712 Bool) (index!29946 (_ BitVec 32)) (x!58728 (_ BitVec 32))) (Undefined!6900) (MissingVacant!6900 (index!29947 (_ BitVec 32))) )
))
(declare-fun lt!300662 () SeekEntryResult!6900)

(assert (=> b!647873 (= res!419746 (not (= lt!300662 (Found!6900 index!984))))))

(declare-fun lt!300667 () Unit!22026)

(declare-fun e!371519 () Unit!22026)

(assert (=> b!647873 (= lt!300667 e!371519)))

(declare-fun c!74426 () Bool)

(assert (=> b!647873 (= c!74426 (= lt!300662 Undefined!6900))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!300665 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38505 (_ BitVec 32)) SeekEntryResult!6900)

(assert (=> b!647873 (= lt!300662 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300665 lt!300658 mask!3053))))

(declare-fun e!371526 () Bool)

(assert (=> b!647873 e!371526))

(declare-fun res!419768 () Bool)

(assert (=> b!647873 (=> (not res!419768) (not e!371526))))

(declare-fun lt!300669 () SeekEntryResult!6900)

(declare-fun lt!300664 () (_ BitVec 32))

(assert (=> b!647873 (= res!419768 (= lt!300669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 lt!300665 lt!300658 mask!3053)))))

(assert (=> b!647873 (= lt!300669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!647873 (= lt!300665 (select (store (arr!18460 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300660 () Unit!22026)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22026)

(assert (=> b!647873 (= lt!300660 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647873 (= lt!300664 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!647874 () Bool)

(declare-fun lt!300670 () SeekEntryResult!6900)

(assert (=> b!647874 (= e!371526 (= lt!300670 lt!300669))))

(declare-fun b!647875 () Bool)

(declare-fun res!419766 () Bool)

(assert (=> b!647875 (=> res!419766 e!371515)))

(assert (=> b!647875 (= res!419766 (contains!3156 Nil!12498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647876 () Bool)

(declare-fun Unit!22028 () Unit!22026)

(assert (=> b!647876 (= e!371519 Unit!22028)))

(declare-fun b!647877 () Bool)

(declare-fun e!371518 () Bool)

(assert (=> b!647877 (= e!371518 e!371514)))

(declare-fun res!419763 () Bool)

(assert (=> b!647877 (=> res!419763 e!371514)))

(declare-fun lt!300659 () (_ BitVec 64))

(assert (=> b!647877 (= res!419763 (or (not (= (select (arr!18460 a!2986) j!136) lt!300665)) (not (= (select (arr!18460 a!2986) j!136) lt!300659)) (bvsge j!136 index!984)))))

(declare-fun b!647878 () Bool)

(assert (=> b!647878 (= e!371516 e!371522)))

(declare-fun res!419752 () Bool)

(assert (=> b!647878 (=> (not res!419752) (not e!371522))))

(declare-fun lt!300663 () SeekEntryResult!6900)

(assert (=> b!647878 (= res!419752 (or (= lt!300663 (MissingZero!6900 i!1108)) (= lt!300663 (MissingVacant!6900 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38505 (_ BitVec 32)) SeekEntryResult!6900)

(assert (=> b!647878 (= lt!300663 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!647879 () Bool)

(declare-fun res!419764 () Bool)

(assert (=> b!647879 (=> (not res!419764) (not e!371522))))

(assert (=> b!647879 (= res!419764 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18460 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647880 () Bool)

(declare-fun res!419762 () Bool)

(assert (=> b!647880 (=> (not res!419762) (not e!371516))))

(assert (=> b!647880 (= res!419762 (and (= (size!18824 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18824 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18824 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!647869 () Bool)

(assert (=> b!647869 (= e!371520 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) index!984))))

(declare-fun res!419758 () Bool)

(assert (=> start!58750 (=> (not res!419758) (not e!371516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58750 (= res!419758 (validMask!0 mask!3053))))

(assert (=> start!58750 e!371516))

(assert (=> start!58750 true))

(declare-fun array_inv!14256 (array!38505) Bool)

(assert (=> start!58750 (array_inv!14256 a!2986)))

(declare-fun b!647881 () Bool)

(declare-fun res!419757 () Bool)

(assert (=> b!647881 (=> (not res!419757) (not e!371522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38505 (_ BitVec 32)) Bool)

(assert (=> b!647881 (= res!419757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!647882 () Bool)

(declare-fun res!419761 () Bool)

(assert (=> b!647882 (=> (not res!419761) (not e!371522))))

(declare-fun arrayNoDuplicates!0 (array!38505 (_ BitVec 32) List!12501) Bool)

(assert (=> b!647882 (= res!419761 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12498))))

(declare-fun b!647883 () Bool)

(declare-fun res!419767 () Bool)

(assert (=> b!647883 (=> (not res!419767) (not e!371516))))

(assert (=> b!647883 (= res!419767 (validKeyInArray!0 k0!1786))))

(declare-fun b!647884 () Bool)

(declare-fun Unit!22029 () Unit!22026)

(assert (=> b!647884 (= e!371521 Unit!22029)))

(declare-fun lt!300671 () Unit!22026)

(assert (=> b!647884 (= lt!300671 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300658 (select (arr!18460 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!647884 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300672 () Unit!22026)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12501) Unit!22026)

(assert (=> b!647884 (= lt!300672 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12498))))

(assert (=> b!647884 (arrayNoDuplicates!0 lt!300658 #b00000000000000000000000000000000 Nil!12498)))

(declare-fun lt!300668 () Unit!22026)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38505 (_ BitVec 32) (_ BitVec 32)) Unit!22026)

(assert (=> b!647884 (= lt!300668 (lemmaNoDuplicateFromThenFromBigger!0 lt!300658 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647884 (arrayNoDuplicates!0 lt!300658 j!136 Nil!12498)))

(declare-fun lt!300673 () Unit!22026)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38505 (_ BitVec 64) (_ BitVec 32) List!12501) Unit!22026)

(assert (=> b!647884 (= lt!300673 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300658 (select (arr!18460 a!2986) j!136) j!136 Nil!12498))))

(assert (=> b!647884 false))

(declare-fun b!647885 () Bool)

(assert (=> b!647885 (= e!371524 e!371529)))

(declare-fun res!419753 () Bool)

(assert (=> b!647885 (=> (not res!419753) (not e!371529))))

(assert (=> b!647885 (= res!419753 (and (= lt!300670 (Found!6900 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18460 a!2986) index!984) (select (arr!18460 a!2986) j!136))) (not (= (select (arr!18460 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!647885 (= lt!300670 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647886 () Bool)

(declare-fun Unit!22030 () Unit!22026)

(assert (=> b!647886 (= e!371519 Unit!22030)))

(assert (=> b!647886 false))

(declare-fun b!647887 () Bool)

(declare-fun Unit!22031 () Unit!22026)

(assert (=> b!647887 (= e!371521 Unit!22031)))

(declare-fun b!647888 () Bool)

(assert (=> b!647888 (= e!371525 e!371523)))

(declare-fun res!419754 () Bool)

(assert (=> b!647888 (=> res!419754 e!371523)))

(assert (=> b!647888 (= res!419754 (or (not (= (select (arr!18460 a!2986) j!136) lt!300665)) (not (= (select (arr!18460 a!2986) j!136) lt!300659))))))

(assert (=> b!647888 e!371518))

(declare-fun res!419750 () Bool)

(assert (=> b!647888 (=> (not res!419750) (not e!371518))))

(assert (=> b!647888 (= res!419750 (= lt!300659 (select (arr!18460 a!2986) j!136)))))

(assert (=> b!647888 (= lt!300659 (select (store (arr!18460 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!58750 res!419758) b!647880))

(assert (= (and b!647880 res!419762) b!647862))

(assert (= (and b!647862 res!419759) b!647883))

(assert (= (and b!647883 res!419767) b!647866))

(assert (= (and b!647866 res!419751) b!647878))

(assert (= (and b!647878 res!419752) b!647881))

(assert (= (and b!647881 res!419757) b!647882))

(assert (= (and b!647882 res!419761) b!647879))

(assert (= (and b!647879 res!419764) b!647871))

(assert (= (and b!647871 res!419755) b!647885))

(assert (= (and b!647885 res!419753) b!647873))

(assert (= (and b!647873 res!419768) b!647874))

(assert (= (and b!647873 c!74426) b!647886))

(assert (= (and b!647873 (not c!74426)) b!647876))

(assert (= (and b!647873 (not res!419746)) b!647888))

(assert (= (and b!647888 res!419750) b!647877))

(assert (= (and b!647877 (not res!419763)) b!647872))

(assert (= (and b!647872 res!419749) b!647870))

(assert (= (and b!647888 (not res!419754)) b!647868))

(assert (= (and b!647868 c!74425) b!647884))

(assert (= (and b!647868 (not c!74425)) b!647887))

(assert (= (and b!647868 (not res!419747)) b!647867))

(assert (= (and b!647867 res!419756) b!647869))

(assert (= (and b!647867 (not res!419765)) b!647863))

(assert (= (and b!647863 (not res!419760)) b!647875))

(assert (= (and b!647875 (not res!419766)) b!647864))

(assert (= (and b!647864 (not res!419748)) b!647865))

(declare-fun m!621245 () Bool)

(assert (=> b!647869 m!621245))

(assert (=> b!647869 m!621245))

(declare-fun m!621247 () Bool)

(assert (=> b!647869 m!621247))

(declare-fun m!621249 () Bool)

(assert (=> b!647866 m!621249))

(declare-fun m!621251 () Bool)

(assert (=> b!647879 m!621251))

(assert (=> b!647872 m!621245))

(assert (=> b!647872 m!621245))

(declare-fun m!621253 () Bool)

(assert (=> b!647872 m!621253))

(declare-fun m!621255 () Bool)

(assert (=> b!647871 m!621255))

(declare-fun m!621257 () Bool)

(assert (=> b!647871 m!621257))

(declare-fun m!621259 () Bool)

(assert (=> b!647875 m!621259))

(declare-fun m!621261 () Bool)

(assert (=> b!647881 m!621261))

(assert (=> b!647873 m!621245))

(declare-fun m!621263 () Bool)

(assert (=> b!647873 m!621263))

(declare-fun m!621265 () Bool)

(assert (=> b!647873 m!621265))

(declare-fun m!621267 () Bool)

(assert (=> b!647873 m!621267))

(assert (=> b!647873 m!621245))

(assert (=> b!647873 m!621255))

(declare-fun m!621269 () Bool)

(assert (=> b!647873 m!621269))

(declare-fun m!621271 () Bool)

(assert (=> b!647873 m!621271))

(declare-fun m!621273 () Bool)

(assert (=> b!647873 m!621273))

(declare-fun m!621275 () Bool)

(assert (=> b!647863 m!621275))

(declare-fun m!621277 () Bool)

(assert (=> b!647883 m!621277))

(declare-fun m!621279 () Bool)

(assert (=> b!647882 m!621279))

(assert (=> b!647870 m!621245))

(assert (=> b!647870 m!621245))

(assert (=> b!647870 m!621247))

(assert (=> b!647884 m!621245))

(declare-fun m!621281 () Bool)

(assert (=> b!647884 m!621281))

(assert (=> b!647884 m!621245))

(declare-fun m!621283 () Bool)

(assert (=> b!647884 m!621283))

(assert (=> b!647884 m!621245))

(declare-fun m!621285 () Bool)

(assert (=> b!647884 m!621285))

(declare-fun m!621287 () Bool)

(assert (=> b!647884 m!621287))

(declare-fun m!621289 () Bool)

(assert (=> b!647884 m!621289))

(assert (=> b!647884 m!621245))

(declare-fun m!621291 () Bool)

(assert (=> b!647884 m!621291))

(declare-fun m!621293 () Bool)

(assert (=> b!647884 m!621293))

(declare-fun m!621295 () Bool)

(assert (=> start!58750 m!621295))

(declare-fun m!621297 () Bool)

(assert (=> start!58750 m!621297))

(assert (=> b!647867 m!621245))

(assert (=> b!647867 m!621245))

(declare-fun m!621299 () Bool)

(assert (=> b!647867 m!621299))

(assert (=> b!647867 m!621245))

(declare-fun m!621301 () Bool)

(assert (=> b!647867 m!621301))

(assert (=> b!647867 m!621245))

(assert (=> b!647867 m!621253))

(assert (=> b!647877 m!621245))

(declare-fun m!621303 () Bool)

(assert (=> b!647878 m!621303))

(declare-fun m!621305 () Bool)

(assert (=> b!647865 m!621305))

(assert (=> b!647862 m!621245))

(assert (=> b!647862 m!621245))

(declare-fun m!621307 () Bool)

(assert (=> b!647862 m!621307))

(assert (=> b!647888 m!621245))

(assert (=> b!647888 m!621255))

(declare-fun m!621309 () Bool)

(assert (=> b!647888 m!621309))

(declare-fun m!621311 () Bool)

(assert (=> b!647864 m!621311))

(declare-fun m!621313 () Bool)

(assert (=> b!647885 m!621313))

(assert (=> b!647885 m!621245))

(assert (=> b!647885 m!621245))

(declare-fun m!621315 () Bool)

(assert (=> b!647885 m!621315))

(check-sat (not b!647878) (not b!647875) (not b!647862) (not b!647883) (not b!647864) (not b!647885) (not start!58750) (not b!647882) (not b!647865) (not b!647873) (not b!647870) (not b!647884) (not b!647869) (not b!647881) (not b!647867) (not b!647872) (not b!647866) (not b!647863))
(check-sat)
(get-model)

(declare-fun d!91701 () Bool)

(declare-fun res!419842 () Bool)

(declare-fun e!371582 () Bool)

(assert (=> d!91701 (=> res!419842 e!371582)))

(assert (=> d!91701 (= res!419842 (= (select (arr!18460 lt!300658) j!136) (select (arr!18460 a!2986) j!136)))))

(assert (=> d!91701 (= (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) j!136) e!371582)))

(declare-fun b!647974 () Bool)

(declare-fun e!371583 () Bool)

(assert (=> b!647974 (= e!371582 e!371583)))

(declare-fun res!419843 () Bool)

(assert (=> b!647974 (=> (not res!419843) (not e!371583))))

(assert (=> b!647974 (= res!419843 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18824 lt!300658)))))

(declare-fun b!647975 () Bool)

(assert (=> b!647975 (= e!371583 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91701 (not res!419842)) b!647974))

(assert (= (and b!647974 res!419843) b!647975))

(declare-fun m!621389 () Bool)

(assert (=> d!91701 m!621389))

(assert (=> b!647975 m!621245))

(declare-fun m!621391 () Bool)

(assert (=> b!647975 m!621391))

(assert (=> b!647872 d!91701))

(declare-fun d!91703 () Bool)

(assert (=> d!91703 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647883 d!91703))

(declare-fun d!91705 () Bool)

(assert (=> d!91705 (= (validKeyInArray!0 (select (arr!18460 a!2986) j!136)) (and (not (= (select (arr!18460 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18460 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647862 d!91705))

(declare-fun d!91707 () Bool)

(declare-fun e!371586 () Bool)

(assert (=> d!91707 e!371586))

(declare-fun res!419846 () Bool)

(assert (=> d!91707 (=> (not res!419846) (not e!371586))))

(assert (=> d!91707 (= res!419846 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18824 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18824 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18824 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18824 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18824 a!2986))))))

(declare-fun lt!300724 () Unit!22026)

(declare-fun choose!9 (array!38505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22026)

(assert (=> d!91707 (= lt!300724 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91707 (validMask!0 mask!3053)))

(assert (=> d!91707 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 mask!3053) lt!300724)))

(declare-fun b!647978 () Bool)

(assert (=> b!647978 (= e!371586 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 (select (store (arr!18460 a!2986) i!1108 k0!1786) j!136) (array!38506 (store (arr!18460 a!2986) i!1108 k0!1786) (size!18824 a!2986)) mask!3053)))))

(assert (= (and d!91707 res!419846) b!647978))

(declare-fun m!621393 () Bool)

(assert (=> d!91707 m!621393))

(assert (=> d!91707 m!621295))

(assert (=> b!647978 m!621255))

(assert (=> b!647978 m!621245))

(assert (=> b!647978 m!621263))

(assert (=> b!647978 m!621273))

(assert (=> b!647978 m!621245))

(assert (=> b!647978 m!621273))

(declare-fun m!621395 () Bool)

(assert (=> b!647978 m!621395))

(assert (=> b!647873 d!91707))

(declare-fun b!647991 () Bool)

(declare-fun e!371593 () SeekEntryResult!6900)

(assert (=> b!647991 (= e!371593 (Found!6900 lt!300664))))

(declare-fun b!647992 () Bool)

(declare-fun e!371594 () SeekEntryResult!6900)

(assert (=> b!647992 (= e!371594 e!371593)))

(declare-fun c!74440 () Bool)

(declare-fun lt!300729 () (_ BitVec 64))

(assert (=> b!647992 (= c!74440 (= lt!300729 lt!300665))))

(declare-fun b!647993 () Bool)

(declare-fun e!371595 () SeekEntryResult!6900)

(assert (=> b!647993 (= e!371595 (MissingVacant!6900 vacantSpotIndex!68))))

(declare-fun b!647995 () Bool)

(assert (=> b!647995 (= e!371594 Undefined!6900)))

(declare-fun b!647996 () Bool)

(assert (=> b!647996 (= e!371595 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300664 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!300665 lt!300658 mask!3053))))

(declare-fun b!647994 () Bool)

(declare-fun c!74439 () Bool)

(assert (=> b!647994 (= c!74439 (= lt!300729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647994 (= e!371593 e!371595)))

(declare-fun d!91709 () Bool)

(declare-fun lt!300730 () SeekEntryResult!6900)

(get-info :version)

(assert (=> d!91709 (and (or ((_ is Undefined!6900) lt!300730) (not ((_ is Found!6900) lt!300730)) (and (bvsge (index!29945 lt!300730) #b00000000000000000000000000000000) (bvslt (index!29945 lt!300730) (size!18824 lt!300658)))) (or ((_ is Undefined!6900) lt!300730) ((_ is Found!6900) lt!300730) (not ((_ is MissingVacant!6900) lt!300730)) (not (= (index!29947 lt!300730) vacantSpotIndex!68)) (and (bvsge (index!29947 lt!300730) #b00000000000000000000000000000000) (bvslt (index!29947 lt!300730) (size!18824 lt!300658)))) (or ((_ is Undefined!6900) lt!300730) (ite ((_ is Found!6900) lt!300730) (= (select (arr!18460 lt!300658) (index!29945 lt!300730)) lt!300665) (and ((_ is MissingVacant!6900) lt!300730) (= (index!29947 lt!300730) vacantSpotIndex!68) (= (select (arr!18460 lt!300658) (index!29947 lt!300730)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91709 (= lt!300730 e!371594)))

(declare-fun c!74441 () Bool)

(assert (=> d!91709 (= c!74441 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91709 (= lt!300729 (select (arr!18460 lt!300658) lt!300664))))

(assert (=> d!91709 (validMask!0 mask!3053)))

(assert (=> d!91709 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 lt!300665 lt!300658 mask!3053) lt!300730)))

(assert (= (and d!91709 c!74441) b!647995))

(assert (= (and d!91709 (not c!74441)) b!647992))

(assert (= (and b!647992 c!74440) b!647991))

(assert (= (and b!647992 (not c!74440)) b!647994))

(assert (= (and b!647994 c!74439) b!647993))

(assert (= (and b!647994 (not c!74439)) b!647996))

(declare-fun m!621397 () Bool)

(assert (=> b!647996 m!621397))

(assert (=> b!647996 m!621397))

(declare-fun m!621399 () Bool)

(assert (=> b!647996 m!621399))

(declare-fun m!621401 () Bool)

(assert (=> d!91709 m!621401))

(declare-fun m!621403 () Bool)

(assert (=> d!91709 m!621403))

(declare-fun m!621405 () Bool)

(assert (=> d!91709 m!621405))

(assert (=> d!91709 m!621295))

(assert (=> b!647873 d!91709))

(declare-fun b!647997 () Bool)

(declare-fun e!371596 () SeekEntryResult!6900)

(assert (=> b!647997 (= e!371596 (Found!6900 lt!300664))))

(declare-fun b!647998 () Bool)

(declare-fun e!371597 () SeekEntryResult!6900)

(assert (=> b!647998 (= e!371597 e!371596)))

(declare-fun c!74443 () Bool)

(declare-fun lt!300731 () (_ BitVec 64))

(assert (=> b!647998 (= c!74443 (= lt!300731 (select (arr!18460 a!2986) j!136)))))

(declare-fun b!647999 () Bool)

(declare-fun e!371598 () SeekEntryResult!6900)

(assert (=> b!647999 (= e!371598 (MissingVacant!6900 vacantSpotIndex!68))))

(declare-fun b!648001 () Bool)

(assert (=> b!648001 (= e!371597 Undefined!6900)))

(declare-fun b!648002 () Bool)

(assert (=> b!648002 (= e!371598 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300664 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648000 () Bool)

(declare-fun c!74442 () Bool)

(assert (=> b!648000 (= c!74442 (= lt!300731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648000 (= e!371596 e!371598)))

(declare-fun d!91711 () Bool)

(declare-fun lt!300732 () SeekEntryResult!6900)

(assert (=> d!91711 (and (or ((_ is Undefined!6900) lt!300732) (not ((_ is Found!6900) lt!300732)) (and (bvsge (index!29945 lt!300732) #b00000000000000000000000000000000) (bvslt (index!29945 lt!300732) (size!18824 a!2986)))) (or ((_ is Undefined!6900) lt!300732) ((_ is Found!6900) lt!300732) (not ((_ is MissingVacant!6900) lt!300732)) (not (= (index!29947 lt!300732) vacantSpotIndex!68)) (and (bvsge (index!29947 lt!300732) #b00000000000000000000000000000000) (bvslt (index!29947 lt!300732) (size!18824 a!2986)))) (or ((_ is Undefined!6900) lt!300732) (ite ((_ is Found!6900) lt!300732) (= (select (arr!18460 a!2986) (index!29945 lt!300732)) (select (arr!18460 a!2986) j!136)) (and ((_ is MissingVacant!6900) lt!300732) (= (index!29947 lt!300732) vacantSpotIndex!68) (= (select (arr!18460 a!2986) (index!29947 lt!300732)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91711 (= lt!300732 e!371597)))

(declare-fun c!74444 () Bool)

(assert (=> d!91711 (= c!74444 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91711 (= lt!300731 (select (arr!18460 a!2986) lt!300664))))

(assert (=> d!91711 (validMask!0 mask!3053)))

(assert (=> d!91711 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300664 vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053) lt!300732)))

(assert (= (and d!91711 c!74444) b!648001))

(assert (= (and d!91711 (not c!74444)) b!647998))

(assert (= (and b!647998 c!74443) b!647997))

(assert (= (and b!647998 (not c!74443)) b!648000))

(assert (= (and b!648000 c!74442) b!647999))

(assert (= (and b!648000 (not c!74442)) b!648002))

(assert (=> b!648002 m!621397))

(assert (=> b!648002 m!621397))

(assert (=> b!648002 m!621245))

(declare-fun m!621407 () Bool)

(assert (=> b!648002 m!621407))

(declare-fun m!621409 () Bool)

(assert (=> d!91711 m!621409))

(declare-fun m!621411 () Bool)

(assert (=> d!91711 m!621411))

(declare-fun m!621413 () Bool)

(assert (=> d!91711 m!621413))

(assert (=> d!91711 m!621295))

(assert (=> b!647873 d!91711))

(declare-fun b!648003 () Bool)

(declare-fun e!371599 () SeekEntryResult!6900)

(assert (=> b!648003 (= e!371599 (Found!6900 index!984))))

(declare-fun b!648004 () Bool)

(declare-fun e!371600 () SeekEntryResult!6900)

(assert (=> b!648004 (= e!371600 e!371599)))

(declare-fun c!74446 () Bool)

(declare-fun lt!300733 () (_ BitVec 64))

(assert (=> b!648004 (= c!74446 (= lt!300733 lt!300665))))

(declare-fun b!648005 () Bool)

(declare-fun e!371601 () SeekEntryResult!6900)

(assert (=> b!648005 (= e!371601 (MissingVacant!6900 vacantSpotIndex!68))))

(declare-fun b!648007 () Bool)

(assert (=> b!648007 (= e!371600 Undefined!6900)))

(declare-fun b!648008 () Bool)

(assert (=> b!648008 (= e!371601 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!300665 lt!300658 mask!3053))))

(declare-fun b!648006 () Bool)

(declare-fun c!74445 () Bool)

(assert (=> b!648006 (= c!74445 (= lt!300733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648006 (= e!371599 e!371601)))

(declare-fun d!91713 () Bool)

(declare-fun lt!300734 () SeekEntryResult!6900)

(assert (=> d!91713 (and (or ((_ is Undefined!6900) lt!300734) (not ((_ is Found!6900) lt!300734)) (and (bvsge (index!29945 lt!300734) #b00000000000000000000000000000000) (bvslt (index!29945 lt!300734) (size!18824 lt!300658)))) (or ((_ is Undefined!6900) lt!300734) ((_ is Found!6900) lt!300734) (not ((_ is MissingVacant!6900) lt!300734)) (not (= (index!29947 lt!300734) vacantSpotIndex!68)) (and (bvsge (index!29947 lt!300734) #b00000000000000000000000000000000) (bvslt (index!29947 lt!300734) (size!18824 lt!300658)))) (or ((_ is Undefined!6900) lt!300734) (ite ((_ is Found!6900) lt!300734) (= (select (arr!18460 lt!300658) (index!29945 lt!300734)) lt!300665) (and ((_ is MissingVacant!6900) lt!300734) (= (index!29947 lt!300734) vacantSpotIndex!68) (= (select (arr!18460 lt!300658) (index!29947 lt!300734)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91713 (= lt!300734 e!371600)))

(declare-fun c!74447 () Bool)

(assert (=> d!91713 (= c!74447 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91713 (= lt!300733 (select (arr!18460 lt!300658) index!984))))

(assert (=> d!91713 (validMask!0 mask!3053)))

(assert (=> d!91713 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300665 lt!300658 mask!3053) lt!300734)))

(assert (= (and d!91713 c!74447) b!648007))

(assert (= (and d!91713 (not c!74447)) b!648004))

(assert (= (and b!648004 c!74446) b!648003))

(assert (= (and b!648004 (not c!74446)) b!648006))

(assert (= (and b!648006 c!74445) b!648005))

(assert (= (and b!648006 (not c!74445)) b!648008))

(assert (=> b!648008 m!621265))

(assert (=> b!648008 m!621265))

(declare-fun m!621415 () Bool)

(assert (=> b!648008 m!621415))

(declare-fun m!621417 () Bool)

(assert (=> d!91713 m!621417))

(declare-fun m!621419 () Bool)

(assert (=> d!91713 m!621419))

(declare-fun m!621421 () Bool)

(assert (=> d!91713 m!621421))

(assert (=> d!91713 m!621295))

(assert (=> b!647873 d!91713))

(declare-fun d!91715 () Bool)

(declare-fun lt!300737 () (_ BitVec 32))

(assert (=> d!91715 (and (bvsge lt!300737 #b00000000000000000000000000000000) (bvslt lt!300737 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91715 (= lt!300737 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91715 (validMask!0 mask!3053)))

(assert (=> d!91715 (= (nextIndex!0 index!984 x!910 mask!3053) lt!300737)))

(declare-fun bs!19354 () Bool)

(assert (= bs!19354 d!91715))

(declare-fun m!621423 () Bool)

(assert (=> bs!19354 m!621423))

(assert (=> bs!19354 m!621295))

(assert (=> b!647873 d!91715))

(declare-fun d!91717 () Bool)

(assert (=> d!91717 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58750 d!91717))

(declare-fun d!91723 () Bool)

(assert (=> d!91723 (= (array_inv!14256 a!2986) (bvsge (size!18824 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58750 d!91723))

(declare-fun b!648039 () Bool)

(declare-fun e!371631 () Bool)

(assert (=> b!648039 (= e!371631 (contains!3156 Nil!12498 (select (arr!18460 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33704 () Bool)

(declare-fun call!33707 () Bool)

(declare-fun c!74450 () Bool)

(assert (=> bm!33704 (= call!33707 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74450 (Cons!12497 (select (arr!18460 a!2986) #b00000000000000000000000000000000) Nil!12498) Nil!12498)))))

(declare-fun b!648040 () Bool)

(declare-fun e!371630 () Bool)

(declare-fun e!371633 () Bool)

(assert (=> b!648040 (= e!371630 e!371633)))

(assert (=> b!648040 (= c!74450 (validKeyInArray!0 (select (arr!18460 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91725 () Bool)

(declare-fun res!419873 () Bool)

(declare-fun e!371632 () Bool)

(assert (=> d!91725 (=> res!419873 e!371632)))

(assert (=> d!91725 (= res!419873 (bvsge #b00000000000000000000000000000000 (size!18824 a!2986)))))

(assert (=> d!91725 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12498) e!371632)))

(declare-fun b!648041 () Bool)

(assert (=> b!648041 (= e!371633 call!33707)))

(declare-fun b!648042 () Bool)

(assert (=> b!648042 (= e!371633 call!33707)))

(declare-fun b!648043 () Bool)

(assert (=> b!648043 (= e!371632 e!371630)))

(declare-fun res!419874 () Bool)

(assert (=> b!648043 (=> (not res!419874) (not e!371630))))

(assert (=> b!648043 (= res!419874 (not e!371631))))

(declare-fun res!419875 () Bool)

(assert (=> b!648043 (=> (not res!419875) (not e!371631))))

(assert (=> b!648043 (= res!419875 (validKeyInArray!0 (select (arr!18460 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91725 (not res!419873)) b!648043))

(assert (= (and b!648043 res!419875) b!648039))

(assert (= (and b!648043 res!419874) b!648040))

(assert (= (and b!648040 c!74450) b!648041))

(assert (= (and b!648040 (not c!74450)) b!648042))

(assert (= (or b!648041 b!648042) bm!33704))

(declare-fun m!621443 () Bool)

(assert (=> b!648039 m!621443))

(assert (=> b!648039 m!621443))

(declare-fun m!621445 () Bool)

(assert (=> b!648039 m!621445))

(assert (=> bm!33704 m!621443))

(declare-fun m!621447 () Bool)

(assert (=> bm!33704 m!621447))

(assert (=> b!648040 m!621443))

(assert (=> b!648040 m!621443))

(declare-fun m!621451 () Bool)

(assert (=> b!648040 m!621451))

(assert (=> b!648043 m!621443))

(assert (=> b!648043 m!621443))

(assert (=> b!648043 m!621451))

(assert (=> b!647882 d!91725))

(declare-fun d!91739 () Bool)

(declare-fun lt!300747 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!249 (List!12501) (InoxSet (_ BitVec 64)))

(assert (=> d!91739 (= lt!300747 (select (content!249 Nil!12498) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371644 () Bool)

(assert (=> d!91739 (= lt!300747 e!371644)))

(declare-fun res!419886 () Bool)

(assert (=> d!91739 (=> (not res!419886) (not e!371644))))

(assert (=> d!91739 (= res!419886 ((_ is Cons!12497) Nil!12498))))

(assert (=> d!91739 (= (contains!3156 Nil!12498 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300747)))

(declare-fun b!648054 () Bool)

(declare-fun e!371645 () Bool)

(assert (=> b!648054 (= e!371644 e!371645)))

(declare-fun res!419887 () Bool)

(assert (=> b!648054 (=> res!419887 e!371645)))

(assert (=> b!648054 (= res!419887 (= (h!13542 Nil!12498) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648055 () Bool)

(assert (=> b!648055 (= e!371645 (contains!3156 (t!18729 Nil!12498) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91739 res!419886) b!648054))

(assert (= (and b!648054 (not res!419887)) b!648055))

(declare-fun m!621465 () Bool)

(assert (=> d!91739 m!621465))

(declare-fun m!621467 () Bool)

(assert (=> d!91739 m!621467))

(declare-fun m!621469 () Bool)

(assert (=> b!648055 m!621469))

(assert (=> b!647864 d!91739))

(declare-fun d!91749 () Bool)

(declare-fun lt!300748 () Bool)

(assert (=> d!91749 (= lt!300748 (select (content!249 Nil!12498) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371646 () Bool)

(assert (=> d!91749 (= lt!300748 e!371646)))

(declare-fun res!419888 () Bool)

(assert (=> d!91749 (=> (not res!419888) (not e!371646))))

(assert (=> d!91749 (= res!419888 ((_ is Cons!12497) Nil!12498))))

(assert (=> d!91749 (= (contains!3156 Nil!12498 #b0000000000000000000000000000000000000000000000000000000000000000) lt!300748)))

(declare-fun b!648056 () Bool)

(declare-fun e!371647 () Bool)

(assert (=> b!648056 (= e!371646 e!371647)))

(declare-fun res!419889 () Bool)

(assert (=> b!648056 (=> res!419889 e!371647)))

(assert (=> b!648056 (= res!419889 (= (h!13542 Nil!12498) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648057 () Bool)

(assert (=> b!648057 (= e!371647 (contains!3156 (t!18729 Nil!12498) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91749 res!419888) b!648056))

(assert (= (and b!648056 (not res!419889)) b!648057))

(assert (=> d!91749 m!621465))

(declare-fun m!621471 () Bool)

(assert (=> d!91749 m!621471))

(declare-fun m!621473 () Bool)

(assert (=> b!648057 m!621473))

(assert (=> b!647875 d!91749))

(declare-fun d!91751 () Bool)

(declare-fun lt!300749 () Bool)

(assert (=> d!91751 (= lt!300749 (select (content!249 Nil!12498) k0!1786))))

(declare-fun e!371648 () Bool)

(assert (=> d!91751 (= lt!300749 e!371648)))

(declare-fun res!419890 () Bool)

(assert (=> d!91751 (=> (not res!419890) (not e!371648))))

(assert (=> d!91751 (= res!419890 ((_ is Cons!12497) Nil!12498))))

(assert (=> d!91751 (= (contains!3156 Nil!12498 k0!1786) lt!300749)))

(declare-fun b!648058 () Bool)

(declare-fun e!371649 () Bool)

(assert (=> b!648058 (= e!371648 e!371649)))

(declare-fun res!419891 () Bool)

(assert (=> b!648058 (=> res!419891 e!371649)))

(assert (=> b!648058 (= res!419891 (= (h!13542 Nil!12498) k0!1786))))

(declare-fun b!648059 () Bool)

(assert (=> b!648059 (= e!371649 (contains!3156 (t!18729 Nil!12498) k0!1786))))

(assert (= (and d!91751 res!419890) b!648058))

(assert (= (and b!648058 (not res!419891)) b!648059))

(assert (=> d!91751 m!621465))

(declare-fun m!621475 () Bool)

(assert (=> d!91751 m!621475))

(declare-fun m!621477 () Bool)

(assert (=> b!648059 m!621477))

(assert (=> b!647865 d!91751))

(declare-fun b!648060 () Bool)

(declare-fun e!371651 () Bool)

(assert (=> b!648060 (= e!371651 (contains!3156 Nil!12498 (select (arr!18460 lt!300658) j!136)))))

(declare-fun bm!33705 () Bool)

(declare-fun c!74451 () Bool)

(declare-fun call!33708 () Bool)

(assert (=> bm!33705 (= call!33708 (arrayNoDuplicates!0 lt!300658 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74451 (Cons!12497 (select (arr!18460 lt!300658) j!136) Nil!12498) Nil!12498)))))

(declare-fun b!648061 () Bool)

(declare-fun e!371650 () Bool)

(declare-fun e!371653 () Bool)

(assert (=> b!648061 (= e!371650 e!371653)))

(assert (=> b!648061 (= c!74451 (validKeyInArray!0 (select (arr!18460 lt!300658) j!136)))))

(declare-fun d!91753 () Bool)

(declare-fun res!419892 () Bool)

(declare-fun e!371652 () Bool)

(assert (=> d!91753 (=> res!419892 e!371652)))

(assert (=> d!91753 (= res!419892 (bvsge j!136 (size!18824 lt!300658)))))

(assert (=> d!91753 (= (arrayNoDuplicates!0 lt!300658 j!136 Nil!12498) e!371652)))

(declare-fun b!648062 () Bool)

(assert (=> b!648062 (= e!371653 call!33708)))

(declare-fun b!648063 () Bool)

(assert (=> b!648063 (= e!371653 call!33708)))

(declare-fun b!648064 () Bool)

(assert (=> b!648064 (= e!371652 e!371650)))

(declare-fun res!419893 () Bool)

(assert (=> b!648064 (=> (not res!419893) (not e!371650))))

(assert (=> b!648064 (= res!419893 (not e!371651))))

(declare-fun res!419894 () Bool)

(assert (=> b!648064 (=> (not res!419894) (not e!371651))))

(assert (=> b!648064 (= res!419894 (validKeyInArray!0 (select (arr!18460 lt!300658) j!136)))))

(assert (= (and d!91753 (not res!419892)) b!648064))

(assert (= (and b!648064 res!419894) b!648060))

(assert (= (and b!648064 res!419893) b!648061))

(assert (= (and b!648061 c!74451) b!648062))

(assert (= (and b!648061 (not c!74451)) b!648063))

(assert (= (or b!648062 b!648063) bm!33705))

(assert (=> b!648060 m!621389))

(assert (=> b!648060 m!621389))

(declare-fun m!621479 () Bool)

(assert (=> b!648060 m!621479))

(assert (=> bm!33705 m!621389))

(declare-fun m!621481 () Bool)

(assert (=> bm!33705 m!621481))

(assert (=> b!648061 m!621389))

(assert (=> b!648061 m!621389))

(declare-fun m!621483 () Bool)

(assert (=> b!648061 m!621483))

(assert (=> b!648064 m!621389))

(assert (=> b!648064 m!621389))

(assert (=> b!648064 m!621483))

(assert (=> b!647884 d!91753))

(declare-fun d!91755 () Bool)

(assert (=> d!91755 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300758 () Unit!22026)

(declare-fun choose!114 (array!38505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22026)

(assert (=> d!91755 (= lt!300758 (choose!114 lt!300658 (select (arr!18460 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91755 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91755 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300658 (select (arr!18460 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300758)))

(declare-fun bs!19356 () Bool)

(assert (= bs!19356 d!91755))

(assert (=> bs!19356 m!621245))

(assert (=> bs!19356 m!621291))

(assert (=> bs!19356 m!621245))

(declare-fun m!621485 () Bool)

(assert (=> bs!19356 m!621485))

(assert (=> b!647884 d!91755))

(declare-fun b!648073 () Bool)

(declare-fun e!371661 () Bool)

(assert (=> b!648073 (= e!371661 (contains!3156 Nil!12498 (select (arr!18460 lt!300658) #b00000000000000000000000000000000)))))

(declare-fun bm!33708 () Bool)

(declare-fun call!33711 () Bool)

(declare-fun c!74454 () Bool)

(assert (=> bm!33708 (= call!33711 (arrayNoDuplicates!0 lt!300658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74454 (Cons!12497 (select (arr!18460 lt!300658) #b00000000000000000000000000000000) Nil!12498) Nil!12498)))))

(declare-fun b!648074 () Bool)

(declare-fun e!371660 () Bool)

(declare-fun e!371663 () Bool)

(assert (=> b!648074 (= e!371660 e!371663)))

(assert (=> b!648074 (= c!74454 (validKeyInArray!0 (select (arr!18460 lt!300658) #b00000000000000000000000000000000)))))

(declare-fun d!91757 () Bool)

(declare-fun res!419899 () Bool)

(declare-fun e!371662 () Bool)

(assert (=> d!91757 (=> res!419899 e!371662)))

(assert (=> d!91757 (= res!419899 (bvsge #b00000000000000000000000000000000 (size!18824 lt!300658)))))

(assert (=> d!91757 (= (arrayNoDuplicates!0 lt!300658 #b00000000000000000000000000000000 Nil!12498) e!371662)))

(declare-fun b!648075 () Bool)

(assert (=> b!648075 (= e!371663 call!33711)))

(declare-fun b!648076 () Bool)

(assert (=> b!648076 (= e!371663 call!33711)))

(declare-fun b!648077 () Bool)

(assert (=> b!648077 (= e!371662 e!371660)))

(declare-fun res!419900 () Bool)

(assert (=> b!648077 (=> (not res!419900) (not e!371660))))

(assert (=> b!648077 (= res!419900 (not e!371661))))

(declare-fun res!419901 () Bool)

(assert (=> b!648077 (=> (not res!419901) (not e!371661))))

(assert (=> b!648077 (= res!419901 (validKeyInArray!0 (select (arr!18460 lt!300658) #b00000000000000000000000000000000)))))

(assert (= (and d!91757 (not res!419899)) b!648077))

(assert (= (and b!648077 res!419901) b!648073))

(assert (= (and b!648077 res!419900) b!648074))

(assert (= (and b!648074 c!74454) b!648075))

(assert (= (and b!648074 (not c!74454)) b!648076))

(assert (= (or b!648075 b!648076) bm!33708))

(declare-fun m!621487 () Bool)

(assert (=> b!648073 m!621487))

(assert (=> b!648073 m!621487))

(declare-fun m!621489 () Bool)

(assert (=> b!648073 m!621489))

(assert (=> bm!33708 m!621487))

(declare-fun m!621491 () Bool)

(assert (=> bm!33708 m!621491))

(assert (=> b!648074 m!621487))

(assert (=> b!648074 m!621487))

(declare-fun m!621493 () Bool)

(assert (=> b!648074 m!621493))

(assert (=> b!648077 m!621487))

(assert (=> b!648077 m!621487))

(assert (=> b!648077 m!621493))

(assert (=> b!647884 d!91757))

(declare-fun d!91759 () Bool)

(declare-fun res!419902 () Bool)

(declare-fun e!371664 () Bool)

(assert (=> d!91759 (=> res!419902 e!371664)))

(assert (=> d!91759 (= res!419902 (= (select (arr!18460 lt!300658) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18460 a!2986) j!136)))))

(assert (=> d!91759 (= (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371664)))

(declare-fun b!648078 () Bool)

(declare-fun e!371665 () Bool)

(assert (=> b!648078 (= e!371664 e!371665)))

(declare-fun res!419903 () Bool)

(assert (=> b!648078 (=> (not res!419903) (not e!371665))))

(assert (=> b!648078 (= res!419903 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18824 lt!300658)))))

(declare-fun b!648079 () Bool)

(assert (=> b!648079 (= e!371665 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91759 (not res!419902)) b!648078))

(assert (= (and b!648078 res!419903) b!648079))

(declare-fun m!621495 () Bool)

(assert (=> d!91759 m!621495))

(assert (=> b!648079 m!621245))

(declare-fun m!621497 () Bool)

(assert (=> b!648079 m!621497))

(assert (=> b!647884 d!91759))

(declare-fun d!91761 () Bool)

(assert (=> d!91761 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18824 lt!300658)) (not (= (select (arr!18460 lt!300658) j!136) (select (arr!18460 a!2986) j!136))))))

(declare-fun lt!300764 () Unit!22026)

(declare-fun choose!21 (array!38505 (_ BitVec 64) (_ BitVec 32) List!12501) Unit!22026)

(assert (=> d!91761 (= lt!300764 (choose!21 lt!300658 (select (arr!18460 a!2986) j!136) j!136 Nil!12498))))

(assert (=> d!91761 (bvslt (size!18824 lt!300658) #b01111111111111111111111111111111)))

(assert (=> d!91761 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300658 (select (arr!18460 a!2986) j!136) j!136 Nil!12498) lt!300764)))

(declare-fun bs!19357 () Bool)

(assert (= bs!19357 d!91761))

(assert (=> bs!19357 m!621389))

(assert (=> bs!19357 m!621245))

(declare-fun m!621509 () Bool)

(assert (=> bs!19357 m!621509))

(assert (=> b!647884 d!91761))

(declare-fun d!91765 () Bool)

(assert (=> d!91765 (arrayNoDuplicates!0 lt!300658 j!136 Nil!12498)))

(declare-fun lt!300769 () Unit!22026)

(declare-fun choose!39 (array!38505 (_ BitVec 32) (_ BitVec 32)) Unit!22026)

(assert (=> d!91765 (= lt!300769 (choose!39 lt!300658 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91765 (bvslt (size!18824 lt!300658) #b01111111111111111111111111111111)))

(assert (=> d!91765 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300658 #b00000000000000000000000000000000 j!136) lt!300769)))

(declare-fun bs!19358 () Bool)

(assert (= bs!19358 d!91765))

(assert (=> bs!19358 m!621289))

(declare-fun m!621511 () Bool)

(assert (=> bs!19358 m!621511))

(assert (=> b!647884 d!91765))

(declare-fun d!91767 () Bool)

(declare-fun e!371674 () Bool)

(assert (=> d!91767 e!371674))

(declare-fun res!419911 () Bool)

(assert (=> d!91767 (=> (not res!419911) (not e!371674))))

(assert (=> d!91767 (= res!419911 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18824 a!2986))))))

(declare-fun lt!300773 () Unit!22026)

(declare-fun choose!41 (array!38505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12501) Unit!22026)

(assert (=> d!91767 (= lt!300773 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12498))))

(assert (=> d!91767 (bvslt (size!18824 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91767 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12498) lt!300773)))

(declare-fun b!648089 () Bool)

(assert (=> b!648089 (= e!371674 (arrayNoDuplicates!0 (array!38506 (store (arr!18460 a!2986) i!1108 k0!1786) (size!18824 a!2986)) #b00000000000000000000000000000000 Nil!12498))))

(assert (= (and d!91767 res!419911) b!648089))

(declare-fun m!621517 () Bool)

(assert (=> d!91767 m!621517))

(assert (=> b!648089 m!621255))

(declare-fun m!621519 () Bool)

(assert (=> b!648089 m!621519))

(assert (=> b!647884 d!91767))

(declare-fun d!91771 () Bool)

(declare-fun res!419916 () Bool)

(declare-fun e!371679 () Bool)

(assert (=> d!91771 (=> res!419916 e!371679)))

(assert (=> d!91771 (= res!419916 ((_ is Nil!12498) Nil!12498))))

(assert (=> d!91771 (= (noDuplicate!418 Nil!12498) e!371679)))

(declare-fun b!648094 () Bool)

(declare-fun e!371680 () Bool)

(assert (=> b!648094 (= e!371679 e!371680)))

(declare-fun res!419917 () Bool)

(assert (=> b!648094 (=> (not res!419917) (not e!371680))))

(assert (=> b!648094 (= res!419917 (not (contains!3156 (t!18729 Nil!12498) (h!13542 Nil!12498))))))

(declare-fun b!648095 () Bool)

(assert (=> b!648095 (= e!371680 (noDuplicate!418 (t!18729 Nil!12498)))))

(assert (= (and d!91771 (not res!419916)) b!648094))

(assert (= (and b!648094 res!419917) b!648095))

(declare-fun m!621521 () Bool)

(assert (=> b!648094 m!621521))

(declare-fun m!621523 () Bool)

(assert (=> b!648095 m!621523))

(assert (=> b!647863 d!91771))

(declare-fun b!648096 () Bool)

(declare-fun e!371681 () SeekEntryResult!6900)

(assert (=> b!648096 (= e!371681 (Found!6900 index!984))))

(declare-fun b!648097 () Bool)

(declare-fun e!371682 () SeekEntryResult!6900)

(assert (=> b!648097 (= e!371682 e!371681)))

(declare-fun lt!300774 () (_ BitVec 64))

(declare-fun c!74457 () Bool)

(assert (=> b!648097 (= c!74457 (= lt!300774 (select (arr!18460 a!2986) j!136)))))

(declare-fun b!648098 () Bool)

(declare-fun e!371683 () SeekEntryResult!6900)

(assert (=> b!648098 (= e!371683 (MissingVacant!6900 vacantSpotIndex!68))))

(declare-fun b!648100 () Bool)

(assert (=> b!648100 (= e!371682 Undefined!6900)))

(declare-fun b!648101 () Bool)

(assert (=> b!648101 (= e!371683 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648099 () Bool)

(declare-fun c!74456 () Bool)

(assert (=> b!648099 (= c!74456 (= lt!300774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648099 (= e!371681 e!371683)))

(declare-fun lt!300775 () SeekEntryResult!6900)

(declare-fun d!91773 () Bool)

(assert (=> d!91773 (and (or ((_ is Undefined!6900) lt!300775) (not ((_ is Found!6900) lt!300775)) (and (bvsge (index!29945 lt!300775) #b00000000000000000000000000000000) (bvslt (index!29945 lt!300775) (size!18824 a!2986)))) (or ((_ is Undefined!6900) lt!300775) ((_ is Found!6900) lt!300775) (not ((_ is MissingVacant!6900) lt!300775)) (not (= (index!29947 lt!300775) vacantSpotIndex!68)) (and (bvsge (index!29947 lt!300775) #b00000000000000000000000000000000) (bvslt (index!29947 lt!300775) (size!18824 a!2986)))) (or ((_ is Undefined!6900) lt!300775) (ite ((_ is Found!6900) lt!300775) (= (select (arr!18460 a!2986) (index!29945 lt!300775)) (select (arr!18460 a!2986) j!136)) (and ((_ is MissingVacant!6900) lt!300775) (= (index!29947 lt!300775) vacantSpotIndex!68) (= (select (arr!18460 a!2986) (index!29947 lt!300775)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91773 (= lt!300775 e!371682)))

(declare-fun c!74458 () Bool)

(assert (=> d!91773 (= c!74458 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91773 (= lt!300774 (select (arr!18460 a!2986) index!984))))

(assert (=> d!91773 (validMask!0 mask!3053)))

(assert (=> d!91773 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18460 a!2986) j!136) a!2986 mask!3053) lt!300775)))

(assert (= (and d!91773 c!74458) b!648100))

(assert (= (and d!91773 (not c!74458)) b!648097))

(assert (= (and b!648097 c!74457) b!648096))

(assert (= (and b!648097 (not c!74457)) b!648099))

(assert (= (and b!648099 c!74456) b!648098))

(assert (= (and b!648099 (not c!74456)) b!648101))

(assert (=> b!648101 m!621265))

(assert (=> b!648101 m!621265))

(assert (=> b!648101 m!621245))

(declare-fun m!621525 () Bool)

(assert (=> b!648101 m!621525))

(declare-fun m!621527 () Bool)

(assert (=> d!91773 m!621527))

(declare-fun m!621529 () Bool)

(assert (=> d!91773 m!621529))

(assert (=> d!91773 m!621313))

(assert (=> d!91773 m!621295))

(assert (=> b!647885 d!91773))

(declare-fun d!91779 () Bool)

(declare-fun res!419918 () Bool)

(declare-fun e!371684 () Bool)

(assert (=> d!91779 (=> res!419918 e!371684)))

(assert (=> d!91779 (= res!419918 (= (select (arr!18460 lt!300658) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18460 a!2986) j!136)))))

(assert (=> d!91779 (= (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371684)))

(declare-fun b!648102 () Bool)

(declare-fun e!371685 () Bool)

(assert (=> b!648102 (= e!371684 e!371685)))

(declare-fun res!419919 () Bool)

(assert (=> b!648102 (=> (not res!419919) (not e!371685))))

(assert (=> b!648102 (= res!419919 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18824 lt!300658)))))

(declare-fun b!648103 () Bool)

(assert (=> b!648103 (= e!371685 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91779 (not res!419918)) b!648102))

(assert (= (and b!648102 res!419919) b!648103))

(declare-fun m!621531 () Bool)

(assert (=> d!91779 m!621531))

(assert (=> b!648103 m!621245))

(declare-fun m!621533 () Bool)

(assert (=> b!648103 m!621533))

(assert (=> b!647867 d!91779))

(declare-fun d!91781 () Bool)

(assert (=> d!91781 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300776 () Unit!22026)

(assert (=> d!91781 (= lt!300776 (choose!114 lt!300658 (select (arr!18460 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91781 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91781 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300658 (select (arr!18460 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300776)))

(declare-fun bs!19359 () Bool)

(assert (= bs!19359 d!91781))

(assert (=> bs!19359 m!621245))

(assert (=> bs!19359 m!621299))

(assert (=> bs!19359 m!621245))

(declare-fun m!621535 () Bool)

(assert (=> bs!19359 m!621535))

(assert (=> b!647867 d!91781))

(assert (=> b!647867 d!91701))

(declare-fun d!91783 () Bool)

(declare-fun lt!300801 () SeekEntryResult!6900)

(assert (=> d!91783 (and (or ((_ is Undefined!6900) lt!300801) (not ((_ is Found!6900) lt!300801)) (and (bvsge (index!29945 lt!300801) #b00000000000000000000000000000000) (bvslt (index!29945 lt!300801) (size!18824 a!2986)))) (or ((_ is Undefined!6900) lt!300801) ((_ is Found!6900) lt!300801) (not ((_ is MissingZero!6900) lt!300801)) (and (bvsge (index!29944 lt!300801) #b00000000000000000000000000000000) (bvslt (index!29944 lt!300801) (size!18824 a!2986)))) (or ((_ is Undefined!6900) lt!300801) ((_ is Found!6900) lt!300801) ((_ is MissingZero!6900) lt!300801) (not ((_ is MissingVacant!6900) lt!300801)) (and (bvsge (index!29947 lt!300801) #b00000000000000000000000000000000) (bvslt (index!29947 lt!300801) (size!18824 a!2986)))) (or ((_ is Undefined!6900) lt!300801) (ite ((_ is Found!6900) lt!300801) (= (select (arr!18460 a!2986) (index!29945 lt!300801)) k0!1786) (ite ((_ is MissingZero!6900) lt!300801) (= (select (arr!18460 a!2986) (index!29944 lt!300801)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6900) lt!300801) (= (select (arr!18460 a!2986) (index!29947 lt!300801)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!371734 () SeekEntryResult!6900)

(assert (=> d!91783 (= lt!300801 e!371734)))

(declare-fun c!74485 () Bool)

(declare-fun lt!300802 () SeekEntryResult!6900)

(assert (=> d!91783 (= c!74485 (and ((_ is Intermediate!6900) lt!300802) (undefined!7712 lt!300802)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38505 (_ BitVec 32)) SeekEntryResult!6900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91783 (= lt!300802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91783 (validMask!0 mask!3053)))

(assert (=> d!91783 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300801)))

(declare-fun b!648175 () Bool)

(assert (=> b!648175 (= e!371734 Undefined!6900)))

(declare-fun b!648176 () Bool)

(declare-fun c!74484 () Bool)

(declare-fun lt!300800 () (_ BitVec 64))

(assert (=> b!648176 (= c!74484 (= lt!300800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371733 () SeekEntryResult!6900)

(declare-fun e!371735 () SeekEntryResult!6900)

(assert (=> b!648176 (= e!371733 e!371735)))

(declare-fun b!648177 () Bool)

(assert (=> b!648177 (= e!371735 (seekKeyOrZeroReturnVacant!0 (x!58728 lt!300802) (index!29946 lt!300802) (index!29946 lt!300802) k0!1786 a!2986 mask!3053))))

(declare-fun b!648178 () Bool)

(assert (=> b!648178 (= e!371733 (Found!6900 (index!29946 lt!300802)))))

(declare-fun b!648179 () Bool)

(assert (=> b!648179 (= e!371734 e!371733)))

(assert (=> b!648179 (= lt!300800 (select (arr!18460 a!2986) (index!29946 lt!300802)))))

(declare-fun c!74483 () Bool)

(assert (=> b!648179 (= c!74483 (= lt!300800 k0!1786))))

(declare-fun b!648180 () Bool)

(assert (=> b!648180 (= e!371735 (MissingZero!6900 (index!29946 lt!300802)))))

(assert (= (and d!91783 c!74485) b!648175))

(assert (= (and d!91783 (not c!74485)) b!648179))

(assert (= (and b!648179 c!74483) b!648178))

(assert (= (and b!648179 (not c!74483)) b!648176))

(assert (= (and b!648176 c!74484) b!648180))

(assert (= (and b!648176 (not c!74484)) b!648177))

(declare-fun m!621581 () Bool)

(assert (=> d!91783 m!621581))

(declare-fun m!621583 () Bool)

(assert (=> d!91783 m!621583))

(declare-fun m!621585 () Bool)

(assert (=> d!91783 m!621585))

(declare-fun m!621587 () Bool)

(assert (=> d!91783 m!621587))

(assert (=> d!91783 m!621295))

(declare-fun m!621589 () Bool)

(assert (=> d!91783 m!621589))

(assert (=> d!91783 m!621581))

(declare-fun m!621591 () Bool)

(assert (=> b!648177 m!621591))

(declare-fun m!621593 () Bool)

(assert (=> b!648179 m!621593))

(assert (=> b!647878 d!91783))

(declare-fun d!91801 () Bool)

(declare-fun res!419943 () Bool)

(declare-fun e!371742 () Bool)

(assert (=> d!91801 (=> res!419943 e!371742)))

(assert (=> d!91801 (= res!419943 (= (select (arr!18460 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91801 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!371742)))

(declare-fun b!648193 () Bool)

(declare-fun e!371743 () Bool)

(assert (=> b!648193 (= e!371742 e!371743)))

(declare-fun res!419944 () Bool)

(assert (=> b!648193 (=> (not res!419944) (not e!371743))))

(assert (=> b!648193 (= res!419944 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18824 a!2986)))))

(declare-fun b!648194 () Bool)

(assert (=> b!648194 (= e!371743 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91801 (not res!419943)) b!648193))

(assert (= (and b!648193 res!419944) b!648194))

(assert (=> d!91801 m!621443))

(declare-fun m!621595 () Bool)

(assert (=> b!648194 m!621595))

(assert (=> b!647866 d!91801))

(declare-fun d!91803 () Bool)

(declare-fun res!419945 () Bool)

(declare-fun e!371744 () Bool)

(assert (=> d!91803 (=> res!419945 e!371744)))

(assert (=> d!91803 (= res!419945 (= (select (arr!18460 lt!300658) index!984) (select (arr!18460 a!2986) j!136)))))

(assert (=> d!91803 (= (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) index!984) e!371744)))

(declare-fun b!648195 () Bool)

(declare-fun e!371745 () Bool)

(assert (=> b!648195 (= e!371744 e!371745)))

(declare-fun res!419946 () Bool)

(assert (=> b!648195 (=> (not res!419946) (not e!371745))))

(assert (=> b!648195 (= res!419946 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18824 lt!300658)))))

(declare-fun b!648196 () Bool)

(assert (=> b!648196 (= e!371745 (arrayContainsKey!0 lt!300658 (select (arr!18460 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91803 (not res!419945)) b!648195))

(assert (= (and b!648195 res!419946) b!648196))

(assert (=> d!91803 m!621421))

(assert (=> b!648196 m!621245))

(declare-fun m!621597 () Bool)

(assert (=> b!648196 m!621597))

(assert (=> b!647870 d!91803))

(declare-fun bm!33715 () Bool)

(declare-fun call!33718 () Bool)

(assert (=> bm!33715 (= call!33718 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!91805 () Bool)

(declare-fun res!419958 () Bool)

(declare-fun e!371762 () Bool)

(assert (=> d!91805 (=> res!419958 e!371762)))

(assert (=> d!91805 (= res!419958 (bvsge #b00000000000000000000000000000000 (size!18824 a!2986)))))

(assert (=> d!91805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371762)))

(declare-fun b!648217 () Bool)

(declare-fun e!371761 () Bool)

(assert (=> b!648217 (= e!371761 call!33718)))

(declare-fun b!648218 () Bool)

(declare-fun e!371763 () Bool)

(assert (=> b!648218 (= e!371762 e!371763)))

(declare-fun c!74497 () Bool)

(assert (=> b!648218 (= c!74497 (validKeyInArray!0 (select (arr!18460 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!648219 () Bool)

(assert (=> b!648219 (= e!371763 e!371761)))

(declare-fun lt!300826 () (_ BitVec 64))

(assert (=> b!648219 (= lt!300826 (select (arr!18460 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300824 () Unit!22026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38505 (_ BitVec 64) (_ BitVec 32)) Unit!22026)

(assert (=> b!648219 (= lt!300824 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300826 #b00000000000000000000000000000000))))

(assert (=> b!648219 (arrayContainsKey!0 a!2986 lt!300826 #b00000000000000000000000000000000)))

(declare-fun lt!300825 () Unit!22026)

(assert (=> b!648219 (= lt!300825 lt!300824)))

(declare-fun res!419957 () Bool)

(assert (=> b!648219 (= res!419957 (= (seekEntryOrOpen!0 (select (arr!18460 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6900 #b00000000000000000000000000000000)))))

(assert (=> b!648219 (=> (not res!419957) (not e!371761))))

(declare-fun b!648220 () Bool)

(assert (=> b!648220 (= e!371763 call!33718)))

(assert (= (and d!91805 (not res!419958)) b!648218))

(assert (= (and b!648218 c!74497) b!648219))

(assert (= (and b!648218 (not c!74497)) b!648220))

(assert (= (and b!648219 res!419957) b!648217))

(assert (= (or b!648217 b!648220) bm!33715))

(declare-fun m!621621 () Bool)

(assert (=> bm!33715 m!621621))

(assert (=> b!648218 m!621443))

(assert (=> b!648218 m!621443))

(assert (=> b!648218 m!621451))

(assert (=> b!648219 m!621443))

(declare-fun m!621623 () Bool)

(assert (=> b!648219 m!621623))

(declare-fun m!621625 () Bool)

(assert (=> b!648219 m!621625))

(assert (=> b!648219 m!621443))

(declare-fun m!621627 () Bool)

(assert (=> b!648219 m!621627))

(assert (=> b!647881 d!91805))

(assert (=> b!647869 d!91803))

(check-sat (not b!648040) (not b!648043) (not d!91755) (not b!648103) (not d!91751) (not d!91767) (not b!648059) (not d!91781) (not b!648064) (not d!91711) (not b!648060) (not b!648095) (not bm!33704) (not bm!33705) (not d!91761) (not b!648101) (not b!648061) (not b!648196) (not d!91709) (not b!647996) (not b!648002) (not d!91783) (not b!647978) (not b!648055) (not b!647975) (not d!91715) (not b!648057) (not bm!33715) (not bm!33708) (not b!648008) (not d!91749) (not d!91739) (not d!91707) (not b!648074) (not b!648194) (not b!648219) (not b!648039) (not b!648177) (not b!648073) (not d!91713) (not b!648079) (not d!91765) (not b!648077) (not d!91773) (not b!648218) (not b!648094) (not b!648089))
(check-sat)
