; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56196 () Bool)

(assert start!56196)

(declare-fun b!622874 () Bool)

(declare-fun res!401486 () Bool)

(declare-fun e!357257 () Bool)

(assert (=> b!622874 (=> (not res!401486) (not e!357257))))

(declare-datatypes ((array!37680 0))(
  ( (array!37681 (arr!18086 (Array (_ BitVec 32) (_ BitVec 64))) (size!18451 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37680)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622874 (= res!401486 (validKeyInArray!0 (select (arr!18086 a!2986) j!136)))))

(declare-fun b!622875 () Bool)

(assert (=> b!622875 false))

(declare-fun lt!288744 () array!37680)

(declare-datatypes ((Unit!20976 0))(
  ( (Unit!20977) )
))
(declare-fun lt!288762 () Unit!20976)

(declare-datatypes ((List!12166 0))(
  ( (Nil!12163) (Cons!12162 (h!13207 (_ BitVec 64)) (t!18385 List!12166)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37680 (_ BitVec 64) (_ BitVec 32) List!12166) Unit!20976)

(assert (=> b!622875 (= lt!288762 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288744 (select (arr!18086 a!2986) j!136) j!136 Nil!12163))))

(declare-fun arrayNoDuplicates!0 (array!37680 (_ BitVec 32) List!12166) Bool)

(assert (=> b!622875 (arrayNoDuplicates!0 lt!288744 j!136 Nil!12163)))

(declare-fun lt!288749 () Unit!20976)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37680 (_ BitVec 32) (_ BitVec 32)) Unit!20976)

(assert (=> b!622875 (= lt!288749 (lemmaNoDuplicateFromThenFromBigger!0 lt!288744 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622875 (arrayNoDuplicates!0 lt!288744 #b00000000000000000000000000000000 Nil!12163)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!288746 () Unit!20976)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12166) Unit!20976)

(assert (=> b!622875 (= lt!288746 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12163))))

(declare-fun arrayContainsKey!0 (array!37680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622875 (arrayContainsKey!0 lt!288744 (select (arr!18086 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288758 () Unit!20976)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20976)

(assert (=> b!622875 (= lt!288758 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288744 (select (arr!18086 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357252 () Unit!20976)

(declare-fun Unit!20978 () Unit!20976)

(assert (=> b!622875 (= e!357252 Unit!20978)))

(declare-fun b!622876 () Bool)

(declare-fun res!401489 () Bool)

(declare-fun e!357263 () Bool)

(assert (=> b!622876 (=> (not res!401489) (not e!357263))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37680 (_ BitVec 32)) Bool)

(assert (=> b!622876 (= res!401489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622877 () Bool)

(declare-fun res!401479 () Bool)

(assert (=> b!622877 (= res!401479 (bvsge j!136 index!984))))

(declare-fun e!357262 () Bool)

(assert (=> b!622877 (=> res!401479 e!357262)))

(declare-fun e!357258 () Bool)

(assert (=> b!622877 (= e!357258 e!357262)))

(declare-fun b!622878 () Bool)

(declare-fun res!401476 () Bool)

(assert (=> b!622878 (=> (not res!401476) (not e!357257))))

(assert (=> b!622878 (= res!401476 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622879 () Bool)

(declare-fun e!357254 () Unit!20976)

(declare-fun Unit!20979 () Unit!20976)

(assert (=> b!622879 (= e!357254 Unit!20979)))

(declare-fun b!622880 () Bool)

(declare-fun e!357256 () Bool)

(declare-datatypes ((SeekEntryResult!6523 0))(
  ( (MissingZero!6523 (index!28376 (_ BitVec 32))) (Found!6523 (index!28377 (_ BitVec 32))) (Intermediate!6523 (undefined!7335 Bool) (index!28378 (_ BitVec 32)) (x!57150 (_ BitVec 32))) (Undefined!6523) (MissingVacant!6523 (index!28379 (_ BitVec 32))) )
))
(declare-fun lt!288752 () SeekEntryResult!6523)

(declare-fun lt!288757 () SeekEntryResult!6523)

(assert (=> b!622880 (= e!357256 (= lt!288752 lt!288757))))

(declare-fun b!622881 () Bool)

(declare-fun res!401483 () Bool)

(assert (=> b!622881 (=> (not res!401483) (not e!357257))))

(assert (=> b!622881 (= res!401483 (and (= (size!18451 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18451 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18451 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!357255 () Bool)

(declare-fun b!622882 () Bool)

(assert (=> b!622882 (= e!357255 (arrayContainsKey!0 lt!288744 (select (arr!18086 a!2986) j!136) index!984))))

(declare-fun b!622883 () Bool)

(declare-fun e!357253 () Unit!20976)

(declare-fun Unit!20980 () Unit!20976)

(assert (=> b!622883 (= e!357253 Unit!20980)))

(assert (=> b!622883 false))

(declare-fun b!622884 () Bool)

(declare-fun res!401488 () Bool)

(assert (=> b!622884 (= res!401488 (arrayContainsKey!0 lt!288744 (select (arr!18086 a!2986) j!136) j!136))))

(declare-fun e!357261 () Bool)

(assert (=> b!622884 (=> (not res!401488) (not e!357261))))

(assert (=> b!622884 (= e!357262 e!357261)))

(declare-fun b!622886 () Bool)

(declare-fun res!401480 () Bool)

(assert (=> b!622886 (=> (not res!401480) (not e!357263))))

(assert (=> b!622886 (= res!401480 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12163))))

(declare-fun b!622887 () Bool)

(declare-fun Unit!20981 () Unit!20976)

(assert (=> b!622887 (= e!357254 Unit!20981)))

(declare-fun res!401485 () Bool)

(assert (=> b!622887 (= res!401485 (= (select (store (arr!18086 a!2986) i!1108 k0!1786) index!984) (select (arr!18086 a!2986) j!136)))))

(assert (=> b!622887 (=> (not res!401485) (not e!357258))))

(assert (=> b!622887 e!357258))

(declare-fun c!71070 () Bool)

(assert (=> b!622887 (= c!71070 (bvslt j!136 index!984))))

(declare-fun lt!288745 () Unit!20976)

(assert (=> b!622887 (= lt!288745 e!357252)))

(declare-fun c!71069 () Bool)

(assert (=> b!622887 (= c!71069 (bvslt index!984 j!136))))

(declare-fun lt!288747 () Unit!20976)

(declare-fun e!357259 () Unit!20976)

(assert (=> b!622887 (= lt!288747 e!357259)))

(assert (=> b!622887 false))

(declare-fun b!622888 () Bool)

(declare-fun Unit!20982 () Unit!20976)

(assert (=> b!622888 (= e!357252 Unit!20982)))

(declare-fun b!622889 () Bool)

(assert (=> b!622889 (= e!357261 (arrayContainsKey!0 lt!288744 (select (arr!18086 a!2986) j!136) index!984))))

(declare-fun b!622890 () Bool)

(declare-fun e!357264 () Bool)

(assert (=> b!622890 (= e!357263 e!357264)))

(declare-fun res!401478 () Bool)

(assert (=> b!622890 (=> (not res!401478) (not e!357264))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!622890 (= res!401478 (= (select (store (arr!18086 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622890 (= lt!288744 (array!37681 (store (arr!18086 a!2986) i!1108 k0!1786) (size!18451 a!2986)))))

(declare-fun b!622891 () Bool)

(declare-fun Unit!20983 () Unit!20976)

(assert (=> b!622891 (= e!357259 Unit!20983)))

(declare-fun b!622892 () Bool)

(declare-fun res!401487 () Bool)

(assert (=> b!622892 (=> (not res!401487) (not e!357257))))

(assert (=> b!622892 (= res!401487 (validKeyInArray!0 k0!1786))))

(declare-fun b!622893 () Bool)

(declare-fun e!357260 () Bool)

(assert (=> b!622893 (= e!357264 e!357260)))

(declare-fun res!401474 () Bool)

(assert (=> b!622893 (=> (not res!401474) (not e!357260))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622893 (= res!401474 (and (= lt!288752 (Found!6523 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18086 a!2986) index!984) (select (arr!18086 a!2986) j!136))) (not (= (select (arr!18086 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37680 (_ BitVec 32)) SeekEntryResult!6523)

(assert (=> b!622893 (= lt!288752 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18086 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622894 () Bool)

(assert (=> b!622894 (= e!357257 e!357263)))

(declare-fun res!401481 () Bool)

(assert (=> b!622894 (=> (not res!401481) (not e!357263))))

(declare-fun lt!288754 () SeekEntryResult!6523)

(assert (=> b!622894 (= res!401481 (or (= lt!288754 (MissingZero!6523 i!1108)) (= lt!288754 (MissingVacant!6523 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37680 (_ BitVec 32)) SeekEntryResult!6523)

(assert (=> b!622894 (= lt!288754 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622895 () Bool)

(declare-fun Unit!20984 () Unit!20976)

(assert (=> b!622895 (= e!357253 Unit!20984)))

(declare-fun b!622896 () Bool)

(declare-fun res!401482 () Bool)

(assert (=> b!622896 (=> (not res!401482) (not e!357263))))

(assert (=> b!622896 (= res!401482 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18086 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622897 () Bool)

(assert (=> b!622897 false))

(declare-fun lt!288760 () Unit!20976)

(assert (=> b!622897 (= lt!288760 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288744 (select (arr!18086 a!2986) j!136) index!984 Nil!12163))))

(assert (=> b!622897 (arrayNoDuplicates!0 lt!288744 index!984 Nil!12163)))

(declare-fun lt!288761 () Unit!20976)

(assert (=> b!622897 (= lt!288761 (lemmaNoDuplicateFromThenFromBigger!0 lt!288744 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622897 (arrayNoDuplicates!0 lt!288744 #b00000000000000000000000000000000 Nil!12163)))

(declare-fun lt!288755 () Unit!20976)

(assert (=> b!622897 (= lt!288755 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12163))))

(assert (=> b!622897 (arrayContainsKey!0 lt!288744 (select (arr!18086 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288753 () Unit!20976)

(assert (=> b!622897 (= lt!288753 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288744 (select (arr!18086 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622897 e!357255))

(declare-fun res!401475 () Bool)

(assert (=> b!622897 (=> (not res!401475) (not e!357255))))

(assert (=> b!622897 (= res!401475 (arrayContainsKey!0 lt!288744 (select (arr!18086 a!2986) j!136) j!136))))

(declare-fun Unit!20985 () Unit!20976)

(assert (=> b!622897 (= e!357259 Unit!20985)))

(declare-fun res!401477 () Bool)

(assert (=> start!56196 (=> (not res!401477) (not e!357257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56196 (= res!401477 (validMask!0 mask!3053))))

(assert (=> start!56196 e!357257))

(assert (=> start!56196 true))

(declare-fun array_inv!13969 (array!37680) Bool)

(assert (=> start!56196 (array_inv!13969 a!2986)))

(declare-fun b!622885 () Bool)

(assert (=> b!622885 (= e!357260 (not true))))

(declare-fun lt!288751 () Unit!20976)

(assert (=> b!622885 (= lt!288751 e!357254)))

(declare-fun c!71067 () Bool)

(declare-fun lt!288748 () SeekEntryResult!6523)

(assert (=> b!622885 (= c!71067 (= lt!288748 (Found!6523 index!984)))))

(declare-fun lt!288756 () Unit!20976)

(assert (=> b!622885 (= lt!288756 e!357253)))

(declare-fun c!71068 () Bool)

(assert (=> b!622885 (= c!71068 (= lt!288748 Undefined!6523))))

(declare-fun lt!288750 () (_ BitVec 64))

(assert (=> b!622885 (= lt!288748 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288750 lt!288744 mask!3053))))

(assert (=> b!622885 e!357256))

(declare-fun res!401484 () Bool)

(assert (=> b!622885 (=> (not res!401484) (not e!357256))))

(declare-fun lt!288763 () (_ BitVec 32))

(assert (=> b!622885 (= res!401484 (= lt!288757 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288763 vacantSpotIndex!68 lt!288750 lt!288744 mask!3053)))))

(assert (=> b!622885 (= lt!288757 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288763 vacantSpotIndex!68 (select (arr!18086 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622885 (= lt!288750 (select (store (arr!18086 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288759 () Unit!20976)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37680 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20976)

(assert (=> b!622885 (= lt!288759 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288763 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622885 (= lt!288763 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56196 res!401477) b!622881))

(assert (= (and b!622881 res!401483) b!622874))

(assert (= (and b!622874 res!401486) b!622892))

(assert (= (and b!622892 res!401487) b!622878))

(assert (= (and b!622878 res!401476) b!622894))

(assert (= (and b!622894 res!401481) b!622876))

(assert (= (and b!622876 res!401489) b!622886))

(assert (= (and b!622886 res!401480) b!622896))

(assert (= (and b!622896 res!401482) b!622890))

(assert (= (and b!622890 res!401478) b!622893))

(assert (= (and b!622893 res!401474) b!622885))

(assert (= (and b!622885 res!401484) b!622880))

(assert (= (and b!622885 c!71068) b!622883))

(assert (= (and b!622885 (not c!71068)) b!622895))

(assert (= (and b!622885 c!71067) b!622887))

(assert (= (and b!622885 (not c!71067)) b!622879))

(assert (= (and b!622887 res!401485) b!622877))

(assert (= (and b!622877 (not res!401479)) b!622884))

(assert (= (and b!622884 res!401488) b!622889))

(assert (= (and b!622887 c!71070) b!622875))

(assert (= (and b!622887 (not c!71070)) b!622888))

(assert (= (and b!622887 c!71069) b!622897))

(assert (= (and b!622887 (not c!71069)) b!622891))

(assert (= (and b!622897 res!401475) b!622882))

(declare-fun m!598219 () Bool)

(assert (=> b!622882 m!598219))

(assert (=> b!622882 m!598219))

(declare-fun m!598221 () Bool)

(assert (=> b!622882 m!598221))

(assert (=> b!622889 m!598219))

(assert (=> b!622889 m!598219))

(assert (=> b!622889 m!598221))

(assert (=> b!622884 m!598219))

(assert (=> b!622884 m!598219))

(declare-fun m!598223 () Bool)

(assert (=> b!622884 m!598223))

(declare-fun m!598225 () Bool)

(assert (=> b!622893 m!598225))

(assert (=> b!622893 m!598219))

(assert (=> b!622893 m!598219))

(declare-fun m!598227 () Bool)

(assert (=> b!622893 m!598227))

(declare-fun m!598229 () Bool)

(assert (=> b!622887 m!598229))

(declare-fun m!598231 () Bool)

(assert (=> b!622887 m!598231))

(assert (=> b!622887 m!598219))

(assert (=> b!622874 m!598219))

(assert (=> b!622874 m!598219))

(declare-fun m!598233 () Bool)

(assert (=> b!622874 m!598233))

(declare-fun m!598235 () Bool)

(assert (=> b!622885 m!598235))

(declare-fun m!598237 () Bool)

(assert (=> b!622885 m!598237))

(assert (=> b!622885 m!598219))

(declare-fun m!598239 () Bool)

(assert (=> b!622885 m!598239))

(assert (=> b!622885 m!598219))

(assert (=> b!622885 m!598229))

(declare-fun m!598241 () Bool)

(assert (=> b!622885 m!598241))

(declare-fun m!598243 () Bool)

(assert (=> b!622885 m!598243))

(declare-fun m!598245 () Bool)

(assert (=> b!622885 m!598245))

(declare-fun m!598247 () Bool)

(assert (=> b!622876 m!598247))

(declare-fun m!598249 () Bool)

(assert (=> b!622896 m!598249))

(declare-fun m!598251 () Bool)

(assert (=> start!56196 m!598251))

(declare-fun m!598253 () Bool)

(assert (=> start!56196 m!598253))

(assert (=> b!622897 m!598219))

(declare-fun m!598255 () Bool)

(assert (=> b!622897 m!598255))

(declare-fun m!598257 () Bool)

(assert (=> b!622897 m!598257))

(assert (=> b!622897 m!598219))

(declare-fun m!598259 () Bool)

(assert (=> b!622897 m!598259))

(assert (=> b!622897 m!598219))

(declare-fun m!598261 () Bool)

(assert (=> b!622897 m!598261))

(assert (=> b!622897 m!598219))

(declare-fun m!598263 () Bool)

(assert (=> b!622897 m!598263))

(declare-fun m!598265 () Bool)

(assert (=> b!622897 m!598265))

(assert (=> b!622897 m!598219))

(assert (=> b!622897 m!598223))

(declare-fun m!598267 () Bool)

(assert (=> b!622897 m!598267))

(assert (=> b!622890 m!598229))

(declare-fun m!598269 () Bool)

(assert (=> b!622890 m!598269))

(declare-fun m!598271 () Bool)

(assert (=> b!622894 m!598271))

(declare-fun m!598273 () Bool)

(assert (=> b!622878 m!598273))

(declare-fun m!598275 () Bool)

(assert (=> b!622892 m!598275))

(declare-fun m!598277 () Bool)

(assert (=> b!622886 m!598277))

(assert (=> b!622875 m!598219))

(assert (=> b!622875 m!598255))

(declare-fun m!598279 () Bool)

(assert (=> b!622875 m!598279))

(assert (=> b!622875 m!598219))

(declare-fun m!598281 () Bool)

(assert (=> b!622875 m!598281))

(assert (=> b!622875 m!598265))

(declare-fun m!598283 () Bool)

(assert (=> b!622875 m!598283))

(assert (=> b!622875 m!598219))

(declare-fun m!598285 () Bool)

(assert (=> b!622875 m!598285))

(assert (=> b!622875 m!598219))

(declare-fun m!598287 () Bool)

(assert (=> b!622875 m!598287))

(check-sat (not b!622894) (not b!622897) (not b!622882) (not b!622886) (not b!622876) (not b!622878) (not b!622889) (not b!622884) (not b!622892) (not b!622885) (not b!622875) (not b!622893) (not start!56196) (not b!622874))
(check-sat)
