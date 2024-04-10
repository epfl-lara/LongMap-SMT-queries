; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56104 () Bool)

(assert start!56104)

(declare-fun b!619223 () Bool)

(declare-fun res!398988 () Bool)

(declare-fun e!355125 () Bool)

(assert (=> b!619223 (=> (not res!398988) (not e!355125))))

(declare-datatypes ((array!37574 0))(
  ( (array!37575 (arr!18033 (Array (_ BitVec 32) (_ BitVec 64))) (size!18397 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37574)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37574 (_ BitVec 32)) Bool)

(assert (=> b!619223 (= res!398988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619224 () Bool)

(declare-fun res!398978 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!619224 (= res!398978 (bvsge j!136 index!984))))

(declare-fun e!355135 () Bool)

(assert (=> b!619224 (=> res!398978 e!355135)))

(declare-fun e!355134 () Bool)

(assert (=> b!619224 (= e!355134 e!355135)))

(declare-fun b!619225 () Bool)

(assert (=> b!619225 false))

(declare-datatypes ((Unit!20458 0))(
  ( (Unit!20459) )
))
(declare-fun lt!285741 () Unit!20458)

(declare-fun lt!285757 () array!37574)

(declare-datatypes ((List!12074 0))(
  ( (Nil!12071) (Cons!12070 (h!13115 (_ BitVec 64)) (t!18302 List!12074)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37574 (_ BitVec 64) (_ BitVec 32) List!12074) Unit!20458)

(assert (=> b!619225 (= lt!285741 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285757 (select (arr!18033 a!2986) j!136) j!136 Nil!12071))))

(declare-fun arrayNoDuplicates!0 (array!37574 (_ BitVec 32) List!12074) Bool)

(assert (=> b!619225 (arrayNoDuplicates!0 lt!285757 j!136 Nil!12071)))

(declare-fun lt!285742 () Unit!20458)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37574 (_ BitVec 32) (_ BitVec 32)) Unit!20458)

(assert (=> b!619225 (= lt!285742 (lemmaNoDuplicateFromThenFromBigger!0 lt!285757 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619225 (arrayNoDuplicates!0 lt!285757 #b00000000000000000000000000000000 Nil!12071)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!285753 () Unit!20458)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37574 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12074) Unit!20458)

(assert (=> b!619225 (= lt!285753 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12071))))

(declare-fun arrayContainsKey!0 (array!37574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619225 (arrayContainsKey!0 lt!285757 (select (arr!18033 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285745 () Unit!20458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37574 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20458)

(assert (=> b!619225 (= lt!285745 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285757 (select (arr!18033 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355126 () Unit!20458)

(declare-fun Unit!20460 () Unit!20458)

(assert (=> b!619225 (= e!355126 Unit!20460)))

(declare-fun res!398983 () Bool)

(declare-fun e!355123 () Bool)

(assert (=> start!56104 (=> (not res!398983) (not e!355123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56104 (= res!398983 (validMask!0 mask!3053))))

(assert (=> start!56104 e!355123))

(assert (=> start!56104 true))

(declare-fun array_inv!13829 (array!37574) Bool)

(assert (=> start!56104 (array_inv!13829 a!2986)))

(declare-fun b!619226 () Bool)

(declare-fun e!355133 () Unit!20458)

(declare-fun Unit!20461 () Unit!20458)

(assert (=> b!619226 (= e!355133 Unit!20461)))

(assert (=> b!619226 false))

(declare-fun b!619227 () Bool)

(declare-fun res!398986 () Bool)

(assert (=> b!619227 (=> (not res!398986) (not e!355123))))

(assert (=> b!619227 (= res!398986 (and (= (size!18397 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18397 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18397 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619228 () Bool)

(declare-fun e!355127 () Unit!20458)

(declare-fun Unit!20462 () Unit!20458)

(assert (=> b!619228 (= e!355127 Unit!20462)))

(declare-fun b!619229 () Bool)

(declare-fun res!398981 () Bool)

(assert (=> b!619229 (=> (not res!398981) (not e!355125))))

(assert (=> b!619229 (= res!398981 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12071))))

(declare-fun b!619230 () Bool)

(declare-fun res!398990 () Bool)

(assert (=> b!619230 (= res!398990 (arrayContainsKey!0 lt!285757 (select (arr!18033 a!2986) j!136) j!136))))

(declare-fun e!355129 () Bool)

(assert (=> b!619230 (=> (not res!398990) (not e!355129))))

(assert (=> b!619230 (= e!355135 e!355129)))

(declare-fun e!355132 () Bool)

(declare-fun b!619231 () Bool)

(assert (=> b!619231 (= e!355132 (arrayContainsKey!0 lt!285757 (select (arr!18033 a!2986) j!136) index!984))))

(declare-fun b!619232 () Bool)

(declare-fun e!355130 () Bool)

(assert (=> b!619232 (= e!355130 true)))

(assert (=> b!619232 (= (select (store (arr!18033 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619233 () Bool)

(declare-fun res!398987 () Bool)

(assert (=> b!619233 (=> (not res!398987) (not e!355123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619233 (= res!398987 (validKeyInArray!0 k!1786))))

(declare-fun b!619234 () Bool)

(declare-fun e!355136 () Bool)

(assert (=> b!619234 (= e!355136 (not e!355130))))

(declare-fun res!398980 () Bool)

(assert (=> b!619234 (=> res!398980 e!355130)))

(declare-datatypes ((SeekEntryResult!6473 0))(
  ( (MissingZero!6473 (index!28176 (_ BitVec 32))) (Found!6473 (index!28177 (_ BitVec 32))) (Intermediate!6473 (undefined!7285 Bool) (index!28178 (_ BitVec 32)) (x!56961 (_ BitVec 32))) (Undefined!6473) (MissingVacant!6473 (index!28179 (_ BitVec 32))) )
))
(declare-fun lt!285751 () SeekEntryResult!6473)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619234 (= res!398980 (not (= lt!285751 (MissingVacant!6473 vacantSpotIndex!68))))))

(declare-fun lt!285754 () Unit!20458)

(declare-fun e!355131 () Unit!20458)

(assert (=> b!619234 (= lt!285754 e!355131)))

(declare-fun c!70490 () Bool)

(assert (=> b!619234 (= c!70490 (= lt!285751 (Found!6473 index!984)))))

(declare-fun lt!285739 () Unit!20458)

(assert (=> b!619234 (= lt!285739 e!355133)))

(declare-fun c!70493 () Bool)

(assert (=> b!619234 (= c!70493 (= lt!285751 Undefined!6473))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285752 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37574 (_ BitVec 32)) SeekEntryResult!6473)

(assert (=> b!619234 (= lt!285751 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285752 lt!285757 mask!3053))))

(declare-fun e!355137 () Bool)

(assert (=> b!619234 e!355137))

(declare-fun res!398991 () Bool)

(assert (=> b!619234 (=> (not res!398991) (not e!355137))))

(declare-fun lt!285748 () SeekEntryResult!6473)

(declare-fun lt!285756 () (_ BitVec 32))

(assert (=> b!619234 (= res!398991 (= lt!285748 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285756 vacantSpotIndex!68 lt!285752 lt!285757 mask!3053)))))

(assert (=> b!619234 (= lt!285748 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285756 vacantSpotIndex!68 (select (arr!18033 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619234 (= lt!285752 (select (store (arr!18033 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285744 () Unit!20458)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37574 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20458)

(assert (=> b!619234 (= lt!285744 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285756 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619234 (= lt!285756 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619235 () Bool)

(declare-fun res!398993 () Bool)

(assert (=> b!619235 (=> (not res!398993) (not e!355123))))

(assert (=> b!619235 (= res!398993 (validKeyInArray!0 (select (arr!18033 a!2986) j!136)))))

(declare-fun b!619236 () Bool)

(assert (=> b!619236 false))

(declare-fun lt!285738 () Unit!20458)

(assert (=> b!619236 (= lt!285738 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285757 (select (arr!18033 a!2986) j!136) index!984 Nil!12071))))

(assert (=> b!619236 (arrayNoDuplicates!0 lt!285757 index!984 Nil!12071)))

(declare-fun lt!285747 () Unit!20458)

(assert (=> b!619236 (= lt!285747 (lemmaNoDuplicateFromThenFromBigger!0 lt!285757 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619236 (arrayNoDuplicates!0 lt!285757 #b00000000000000000000000000000000 Nil!12071)))

(declare-fun lt!285740 () Unit!20458)

(assert (=> b!619236 (= lt!285740 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12071))))

(assert (=> b!619236 (arrayContainsKey!0 lt!285757 (select (arr!18033 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285746 () Unit!20458)

(assert (=> b!619236 (= lt!285746 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285757 (select (arr!18033 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619236 e!355132))

(declare-fun res!398984 () Bool)

(assert (=> b!619236 (=> (not res!398984) (not e!355132))))

(assert (=> b!619236 (= res!398984 (arrayContainsKey!0 lt!285757 (select (arr!18033 a!2986) j!136) j!136))))

(declare-fun Unit!20463 () Unit!20458)

(assert (=> b!619236 (= e!355127 Unit!20463)))

(declare-fun b!619237 () Bool)

(declare-fun lt!285749 () SeekEntryResult!6473)

(assert (=> b!619237 (= e!355137 (= lt!285749 lt!285748))))

(declare-fun b!619238 () Bool)

(declare-fun e!355124 () Bool)

(assert (=> b!619238 (= e!355124 e!355136)))

(declare-fun res!398982 () Bool)

(assert (=> b!619238 (=> (not res!398982) (not e!355136))))

(assert (=> b!619238 (= res!398982 (and (= lt!285749 (Found!6473 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18033 a!2986) index!984) (select (arr!18033 a!2986) j!136))) (not (= (select (arr!18033 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619238 (= lt!285749 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18033 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619239 () Bool)

(declare-fun Unit!20464 () Unit!20458)

(assert (=> b!619239 (= e!355133 Unit!20464)))

(declare-fun b!619240 () Bool)

(declare-fun res!398985 () Bool)

(assert (=> b!619240 (=> (not res!398985) (not e!355123))))

(assert (=> b!619240 (= res!398985 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619241 () Bool)

(declare-fun Unit!20465 () Unit!20458)

(assert (=> b!619241 (= e!355126 Unit!20465)))

(declare-fun b!619242 () Bool)

(assert (=> b!619242 (= e!355123 e!355125)))

(declare-fun res!398979 () Bool)

(assert (=> b!619242 (=> (not res!398979) (not e!355125))))

(declare-fun lt!285750 () SeekEntryResult!6473)

(assert (=> b!619242 (= res!398979 (or (= lt!285750 (MissingZero!6473 i!1108)) (= lt!285750 (MissingVacant!6473 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37574 (_ BitVec 32)) SeekEntryResult!6473)

(assert (=> b!619242 (= lt!285750 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619243 () Bool)

(declare-fun Unit!20466 () Unit!20458)

(assert (=> b!619243 (= e!355131 Unit!20466)))

(declare-fun res!398977 () Bool)

(assert (=> b!619243 (= res!398977 (= (select (store (arr!18033 a!2986) i!1108 k!1786) index!984) (select (arr!18033 a!2986) j!136)))))

(assert (=> b!619243 (=> (not res!398977) (not e!355134))))

(assert (=> b!619243 e!355134))

(declare-fun c!70491 () Bool)

(assert (=> b!619243 (= c!70491 (bvslt j!136 index!984))))

(declare-fun lt!285755 () Unit!20458)

(assert (=> b!619243 (= lt!285755 e!355126)))

(declare-fun c!70492 () Bool)

(assert (=> b!619243 (= c!70492 (bvslt index!984 j!136))))

(declare-fun lt!285743 () Unit!20458)

(assert (=> b!619243 (= lt!285743 e!355127)))

(assert (=> b!619243 false))

(declare-fun b!619244 () Bool)

(assert (=> b!619244 (= e!355129 (arrayContainsKey!0 lt!285757 (select (arr!18033 a!2986) j!136) index!984))))

(declare-fun b!619245 () Bool)

(declare-fun res!398992 () Bool)

(assert (=> b!619245 (=> (not res!398992) (not e!355125))))

(assert (=> b!619245 (= res!398992 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18033 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619246 () Bool)

(declare-fun Unit!20467 () Unit!20458)

(assert (=> b!619246 (= e!355131 Unit!20467)))

(declare-fun b!619247 () Bool)

(assert (=> b!619247 (= e!355125 e!355124)))

(declare-fun res!398989 () Bool)

(assert (=> b!619247 (=> (not res!398989) (not e!355124))))

(assert (=> b!619247 (= res!398989 (= (select (store (arr!18033 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619247 (= lt!285757 (array!37575 (store (arr!18033 a!2986) i!1108 k!1786) (size!18397 a!2986)))))

(assert (= (and start!56104 res!398983) b!619227))

(assert (= (and b!619227 res!398986) b!619235))

(assert (= (and b!619235 res!398993) b!619233))

(assert (= (and b!619233 res!398987) b!619240))

(assert (= (and b!619240 res!398985) b!619242))

(assert (= (and b!619242 res!398979) b!619223))

(assert (= (and b!619223 res!398988) b!619229))

(assert (= (and b!619229 res!398981) b!619245))

(assert (= (and b!619245 res!398992) b!619247))

(assert (= (and b!619247 res!398989) b!619238))

(assert (= (and b!619238 res!398982) b!619234))

(assert (= (and b!619234 res!398991) b!619237))

(assert (= (and b!619234 c!70493) b!619226))

(assert (= (and b!619234 (not c!70493)) b!619239))

(assert (= (and b!619234 c!70490) b!619243))

(assert (= (and b!619234 (not c!70490)) b!619246))

(assert (= (and b!619243 res!398977) b!619224))

(assert (= (and b!619224 (not res!398978)) b!619230))

(assert (= (and b!619230 res!398990) b!619244))

(assert (= (and b!619243 c!70491) b!619225))

(assert (= (and b!619243 (not c!70491)) b!619241))

(assert (= (and b!619243 c!70492) b!619236))

(assert (= (and b!619243 (not c!70492)) b!619228))

(assert (= (and b!619236 res!398984) b!619231))

(assert (= (and b!619234 (not res!398980)) b!619232))

(declare-fun m!595211 () Bool)

(assert (=> b!619223 m!595211))

(declare-fun m!595213 () Bool)

(assert (=> b!619235 m!595213))

(assert (=> b!619235 m!595213))

(declare-fun m!595215 () Bool)

(assert (=> b!619235 m!595215))

(assert (=> b!619225 m!595213))

(declare-fun m!595217 () Bool)

(assert (=> b!619225 m!595217))

(assert (=> b!619225 m!595213))

(declare-fun m!595219 () Bool)

(assert (=> b!619225 m!595219))

(assert (=> b!619225 m!595213))

(declare-fun m!595221 () Bool)

(assert (=> b!619225 m!595221))

(assert (=> b!619225 m!595213))

(declare-fun m!595223 () Bool)

(assert (=> b!619225 m!595223))

(declare-fun m!595225 () Bool)

(assert (=> b!619225 m!595225))

(declare-fun m!595227 () Bool)

(assert (=> b!619225 m!595227))

(declare-fun m!595229 () Bool)

(assert (=> b!619225 m!595229))

(declare-fun m!595231 () Bool)

(assert (=> b!619238 m!595231))

(assert (=> b!619238 m!595213))

(assert (=> b!619238 m!595213))

(declare-fun m!595233 () Bool)

(assert (=> b!619238 m!595233))

(declare-fun m!595235 () Bool)

(assert (=> b!619232 m!595235))

(declare-fun m!595237 () Bool)

(assert (=> b!619232 m!595237))

(declare-fun m!595239 () Bool)

(assert (=> b!619233 m!595239))

(assert (=> b!619247 m!595235))

(declare-fun m!595241 () Bool)

(assert (=> b!619247 m!595241))

(declare-fun m!595243 () Bool)

(assert (=> b!619245 m!595243))

(assert (=> b!619236 m!595213))

(assert (=> b!619236 m!595213))

(declare-fun m!595245 () Bool)

(assert (=> b!619236 m!595245))

(declare-fun m!595247 () Bool)

(assert (=> b!619236 m!595247))

(declare-fun m!595249 () Bool)

(assert (=> b!619236 m!595249))

(assert (=> b!619236 m!595213))

(declare-fun m!595251 () Bool)

(assert (=> b!619236 m!595251))

(assert (=> b!619236 m!595225))

(assert (=> b!619236 m!595229))

(assert (=> b!619236 m!595213))

(declare-fun m!595253 () Bool)

(assert (=> b!619236 m!595253))

(assert (=> b!619236 m!595213))

(declare-fun m!595255 () Bool)

(assert (=> b!619236 m!595255))

(declare-fun m!595257 () Bool)

(assert (=> b!619242 m!595257))

(declare-fun m!595259 () Bool)

(assert (=> b!619234 m!595259))

(declare-fun m!595261 () Bool)

(assert (=> b!619234 m!595261))

(declare-fun m!595263 () Bool)

(assert (=> b!619234 m!595263))

(assert (=> b!619234 m!595213))

(assert (=> b!619234 m!595235))

(declare-fun m!595265 () Bool)

(assert (=> b!619234 m!595265))

(declare-fun m!595267 () Bool)

(assert (=> b!619234 m!595267))

(assert (=> b!619234 m!595213))

(declare-fun m!595269 () Bool)

(assert (=> b!619234 m!595269))

(assert (=> b!619244 m!595213))

(assert (=> b!619244 m!595213))

(declare-fun m!595271 () Bool)

(assert (=> b!619244 m!595271))

(assert (=> b!619231 m!595213))

(assert (=> b!619231 m!595213))

(assert (=> b!619231 m!595271))

(declare-fun m!595273 () Bool)

(assert (=> start!56104 m!595273))

(declare-fun m!595275 () Bool)

(assert (=> start!56104 m!595275))

(declare-fun m!595277 () Bool)

(assert (=> b!619240 m!595277))

(declare-fun m!595279 () Bool)

(assert (=> b!619229 m!595279))

(assert (=> b!619243 m!595235))

(assert (=> b!619243 m!595237))

(assert (=> b!619243 m!595213))

(assert (=> b!619230 m!595213))

(assert (=> b!619230 m!595213))

(assert (=> b!619230 m!595251))

(push 1)

