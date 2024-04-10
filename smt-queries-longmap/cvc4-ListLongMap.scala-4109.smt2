; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56156 () Bool)

(assert start!56156)

(declare-fun b!621129 () Bool)

(declare-datatypes ((Unit!20718 0))(
  ( (Unit!20719) )
))
(declare-fun e!356256 () Unit!20718)

(declare-fun Unit!20720 () Unit!20718)

(assert (=> b!621129 (= e!356256 Unit!20720)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!400270 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37626 0))(
  ( (array!37627 (arr!18059 (Array (_ BitVec 32) (_ BitVec 64))) (size!18423 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37626)

(assert (=> b!621129 (= res!400270 (= (select (store (arr!18059 a!2986) i!1108 k!1786) index!984) (select (arr!18059 a!2986) j!136)))))

(declare-fun e!356252 () Bool)

(assert (=> b!621129 (=> (not res!400270) (not e!356252))))

(assert (=> b!621129 e!356252))

(declare-fun c!70803 () Bool)

(assert (=> b!621129 (= c!70803 (bvslt j!136 index!984))))

(declare-fun lt!287299 () Unit!20718)

(declare-fun e!356249 () Unit!20718)

(assert (=> b!621129 (= lt!287299 e!356249)))

(declare-fun c!70802 () Bool)

(assert (=> b!621129 (= c!70802 (bvslt index!984 j!136))))

(declare-fun lt!287311 () Unit!20718)

(declare-fun e!356251 () Unit!20718)

(assert (=> b!621129 (= lt!287311 e!356251)))

(assert (=> b!621129 false))

(declare-fun b!621130 () Bool)

(declare-fun e!356259 () Bool)

(assert (=> b!621130 (= e!356259 (not true))))

(declare-fun lt!287314 () Unit!20718)

(assert (=> b!621130 (= lt!287314 e!356256)))

(declare-fun c!70805 () Bool)

(declare-datatypes ((SeekEntryResult!6499 0))(
  ( (MissingZero!6499 (index!28280 (_ BitVec 32))) (Found!6499 (index!28281 (_ BitVec 32))) (Intermediate!6499 (undefined!7311 Bool) (index!28282 (_ BitVec 32)) (x!57051 (_ BitVec 32))) (Undefined!6499) (MissingVacant!6499 (index!28283 (_ BitVec 32))) )
))
(declare-fun lt!287298 () SeekEntryResult!6499)

(assert (=> b!621130 (= c!70805 (= lt!287298 (Found!6499 index!984)))))

(declare-fun lt!287309 () Unit!20718)

(declare-fun e!356254 () Unit!20718)

(assert (=> b!621130 (= lt!287309 e!356254)))

(declare-fun c!70804 () Bool)

(assert (=> b!621130 (= c!70804 (= lt!287298 Undefined!6499))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!287300 () (_ BitVec 64))

(declare-fun lt!287310 () array!37626)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37626 (_ BitVec 32)) SeekEntryResult!6499)

(assert (=> b!621130 (= lt!287298 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287300 lt!287310 mask!3053))))

(declare-fun e!356255 () Bool)

(assert (=> b!621130 e!356255))

(declare-fun res!400262 () Bool)

(assert (=> b!621130 (=> (not res!400262) (not e!356255))))

(declare-fun lt!287304 () (_ BitVec 32))

(declare-fun lt!287302 () SeekEntryResult!6499)

(assert (=> b!621130 (= res!400262 (= lt!287302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287304 vacantSpotIndex!68 lt!287300 lt!287310 mask!3053)))))

(assert (=> b!621130 (= lt!287302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287304 vacantSpotIndex!68 (select (arr!18059 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621130 (= lt!287300 (select (store (arr!18059 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287306 () Unit!20718)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37626 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20718)

(assert (=> b!621130 (= lt!287306 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287304 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621130 (= lt!287304 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!400259 () Bool)

(declare-fun b!621131 () Bool)

(declare-fun arrayContainsKey!0 (array!37626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621131 (= res!400259 (arrayContainsKey!0 lt!287310 (select (arr!18059 a!2986) j!136) j!136))))

(declare-fun e!356262 () Bool)

(assert (=> b!621131 (=> (not res!400259) (not e!356262))))

(declare-fun e!356250 () Bool)

(assert (=> b!621131 (= e!356250 e!356262)))

(declare-fun b!621132 () Bool)

(declare-fun res!400268 () Bool)

(declare-fun e!356253 () Bool)

(assert (=> b!621132 (=> (not res!400268) (not e!356253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37626 (_ BitVec 32)) Bool)

(assert (=> b!621132 (= res!400268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621133 () Bool)

(declare-fun res!400271 () Bool)

(declare-fun e!356261 () Bool)

(assert (=> b!621133 (=> (not res!400271) (not e!356261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621133 (= res!400271 (validKeyInArray!0 k!1786))))

(declare-fun res!400267 () Bool)

(assert (=> start!56156 (=> (not res!400267) (not e!356261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56156 (= res!400267 (validMask!0 mask!3053))))

(assert (=> start!56156 e!356261))

(assert (=> start!56156 true))

(declare-fun array_inv!13855 (array!37626) Bool)

(assert (=> start!56156 (array_inv!13855 a!2986)))

(declare-fun b!621134 () Bool)

(declare-fun e!356257 () Bool)

(assert (=> b!621134 (= e!356257 (arrayContainsKey!0 lt!287310 (select (arr!18059 a!2986) j!136) index!984))))

(declare-fun b!621135 () Bool)

(declare-fun res!400269 () Bool)

(assert (=> b!621135 (=> (not res!400269) (not e!356261))))

(assert (=> b!621135 (= res!400269 (validKeyInArray!0 (select (arr!18059 a!2986) j!136)))))

(declare-fun b!621136 () Bool)

(declare-fun lt!287308 () SeekEntryResult!6499)

(assert (=> b!621136 (= e!356255 (= lt!287308 lt!287302))))

(declare-fun b!621137 () Bool)

(declare-fun Unit!20721 () Unit!20718)

(assert (=> b!621137 (= e!356254 Unit!20721)))

(declare-fun b!621138 () Bool)

(declare-fun res!400264 () Bool)

(assert (=> b!621138 (= res!400264 (bvsge j!136 index!984))))

(assert (=> b!621138 (=> res!400264 e!356250)))

(assert (=> b!621138 (= e!356252 e!356250)))

(declare-fun b!621139 () Bool)

(assert (=> b!621139 (= e!356261 e!356253)))

(declare-fun res!400272 () Bool)

(assert (=> b!621139 (=> (not res!400272) (not e!356253))))

(declare-fun lt!287305 () SeekEntryResult!6499)

(assert (=> b!621139 (= res!400272 (or (= lt!287305 (MissingZero!6499 i!1108)) (= lt!287305 (MissingVacant!6499 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37626 (_ BitVec 32)) SeekEntryResult!6499)

(assert (=> b!621139 (= lt!287305 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!621140 () Bool)

(assert (=> b!621140 (= e!356262 (arrayContainsKey!0 lt!287310 (select (arr!18059 a!2986) j!136) index!984))))

(declare-fun b!621141 () Bool)

(declare-fun Unit!20722 () Unit!20718)

(assert (=> b!621141 (= e!356249 Unit!20722)))

(declare-fun b!621142 () Bool)

(declare-fun Unit!20723 () Unit!20718)

(assert (=> b!621142 (= e!356256 Unit!20723)))

(declare-fun b!621143 () Bool)

(declare-fun Unit!20724 () Unit!20718)

(assert (=> b!621143 (= e!356254 Unit!20724)))

(assert (=> b!621143 false))

(declare-fun b!621144 () Bool)

(declare-fun res!400261 () Bool)

(assert (=> b!621144 (=> (not res!400261) (not e!356261))))

(assert (=> b!621144 (= res!400261 (and (= (size!18423 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18423 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18423 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621145 () Bool)

(declare-fun res!400274 () Bool)

(assert (=> b!621145 (=> (not res!400274) (not e!356253))))

(assert (=> b!621145 (= res!400274 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18059 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621146 () Bool)

(assert (=> b!621146 false))

(declare-fun lt!287316 () Unit!20718)

(declare-datatypes ((List!12100 0))(
  ( (Nil!12097) (Cons!12096 (h!13141 (_ BitVec 64)) (t!18328 List!12100)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37626 (_ BitVec 64) (_ BitVec 32) List!12100) Unit!20718)

(assert (=> b!621146 (= lt!287316 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287310 (select (arr!18059 a!2986) j!136) index!984 Nil!12097))))

(declare-fun arrayNoDuplicates!0 (array!37626 (_ BitVec 32) List!12100) Bool)

(assert (=> b!621146 (arrayNoDuplicates!0 lt!287310 index!984 Nil!12097)))

(declare-fun lt!287312 () Unit!20718)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37626 (_ BitVec 32) (_ BitVec 32)) Unit!20718)

(assert (=> b!621146 (= lt!287312 (lemmaNoDuplicateFromThenFromBigger!0 lt!287310 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621146 (arrayNoDuplicates!0 lt!287310 #b00000000000000000000000000000000 Nil!12097)))

(declare-fun lt!287307 () Unit!20718)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12100) Unit!20718)

(assert (=> b!621146 (= lt!287307 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12097))))

(assert (=> b!621146 (arrayContainsKey!0 lt!287310 (select (arr!18059 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287303 () Unit!20718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20718)

(assert (=> b!621146 (= lt!287303 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287310 (select (arr!18059 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621146 e!356257))

(declare-fun res!400265 () Bool)

(assert (=> b!621146 (=> (not res!400265) (not e!356257))))

(assert (=> b!621146 (= res!400265 (arrayContainsKey!0 lt!287310 (select (arr!18059 a!2986) j!136) j!136))))

(declare-fun Unit!20725 () Unit!20718)

(assert (=> b!621146 (= e!356251 Unit!20725)))

(declare-fun b!621147 () Bool)

(declare-fun res!400263 () Bool)

(assert (=> b!621147 (=> (not res!400263) (not e!356261))))

(assert (=> b!621147 (= res!400263 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621148 () Bool)

(declare-fun e!356258 () Bool)

(assert (=> b!621148 (= e!356253 e!356258)))

(declare-fun res!400266 () Bool)

(assert (=> b!621148 (=> (not res!400266) (not e!356258))))

(assert (=> b!621148 (= res!400266 (= (select (store (arr!18059 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621148 (= lt!287310 (array!37627 (store (arr!18059 a!2986) i!1108 k!1786) (size!18423 a!2986)))))

(declare-fun b!621149 () Bool)

(declare-fun res!400273 () Bool)

(assert (=> b!621149 (=> (not res!400273) (not e!356253))))

(assert (=> b!621149 (= res!400273 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12097))))

(declare-fun b!621150 () Bool)

(assert (=> b!621150 (= e!356258 e!356259)))

(declare-fun res!400260 () Bool)

(assert (=> b!621150 (=> (not res!400260) (not e!356259))))

(assert (=> b!621150 (= res!400260 (and (= lt!287308 (Found!6499 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18059 a!2986) index!984) (select (arr!18059 a!2986) j!136))) (not (= (select (arr!18059 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621150 (= lt!287308 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18059 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621151 () Bool)

(declare-fun Unit!20726 () Unit!20718)

(assert (=> b!621151 (= e!356251 Unit!20726)))

(declare-fun b!621152 () Bool)

(assert (=> b!621152 false))

(declare-fun lt!287317 () Unit!20718)

(assert (=> b!621152 (= lt!287317 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287310 (select (arr!18059 a!2986) j!136) j!136 Nil!12097))))

(assert (=> b!621152 (arrayNoDuplicates!0 lt!287310 j!136 Nil!12097)))

(declare-fun lt!287315 () Unit!20718)

(assert (=> b!621152 (= lt!287315 (lemmaNoDuplicateFromThenFromBigger!0 lt!287310 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621152 (arrayNoDuplicates!0 lt!287310 #b00000000000000000000000000000000 Nil!12097)))

(declare-fun lt!287301 () Unit!20718)

(assert (=> b!621152 (= lt!287301 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12097))))

(assert (=> b!621152 (arrayContainsKey!0 lt!287310 (select (arr!18059 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287313 () Unit!20718)

(assert (=> b!621152 (= lt!287313 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287310 (select (arr!18059 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20727 () Unit!20718)

(assert (=> b!621152 (= e!356249 Unit!20727)))

(assert (= (and start!56156 res!400267) b!621144))

(assert (= (and b!621144 res!400261) b!621135))

(assert (= (and b!621135 res!400269) b!621133))

(assert (= (and b!621133 res!400271) b!621147))

(assert (= (and b!621147 res!400263) b!621139))

(assert (= (and b!621139 res!400272) b!621132))

(assert (= (and b!621132 res!400268) b!621149))

(assert (= (and b!621149 res!400273) b!621145))

(assert (= (and b!621145 res!400274) b!621148))

(assert (= (and b!621148 res!400266) b!621150))

(assert (= (and b!621150 res!400260) b!621130))

(assert (= (and b!621130 res!400262) b!621136))

(assert (= (and b!621130 c!70804) b!621143))

(assert (= (and b!621130 (not c!70804)) b!621137))

(assert (= (and b!621130 c!70805) b!621129))

(assert (= (and b!621130 (not c!70805)) b!621142))

(assert (= (and b!621129 res!400270) b!621138))

(assert (= (and b!621138 (not res!400264)) b!621131))

(assert (= (and b!621131 res!400259) b!621140))

(assert (= (and b!621129 c!70803) b!621152))

(assert (= (and b!621129 (not c!70803)) b!621141))

(assert (= (and b!621129 c!70802) b!621146))

(assert (= (and b!621129 (not c!70802)) b!621151))

(assert (= (and b!621146 res!400265) b!621134))

(declare-fun m!597031 () Bool)

(assert (=> b!621149 m!597031))

(declare-fun m!597033 () Bool)

(assert (=> b!621139 m!597033))

(declare-fun m!597035 () Bool)

(assert (=> start!56156 m!597035))

(declare-fun m!597037 () Bool)

(assert (=> start!56156 m!597037))

(declare-fun m!597039 () Bool)

(assert (=> b!621133 m!597039))

(declare-fun m!597041 () Bool)

(assert (=> b!621145 m!597041))

(declare-fun m!597043 () Bool)

(assert (=> b!621131 m!597043))

(assert (=> b!621131 m!597043))

(declare-fun m!597045 () Bool)

(assert (=> b!621131 m!597045))

(assert (=> b!621134 m!597043))

(assert (=> b!621134 m!597043))

(declare-fun m!597047 () Bool)

(assert (=> b!621134 m!597047))

(declare-fun m!597049 () Bool)

(assert (=> b!621147 m!597049))

(declare-fun m!597051 () Bool)

(assert (=> b!621152 m!597051))

(assert (=> b!621152 m!597043))

(assert (=> b!621152 m!597043))

(declare-fun m!597053 () Bool)

(assert (=> b!621152 m!597053))

(declare-fun m!597055 () Bool)

(assert (=> b!621152 m!597055))

(assert (=> b!621152 m!597043))

(declare-fun m!597057 () Bool)

(assert (=> b!621152 m!597057))

(assert (=> b!621152 m!597043))

(declare-fun m!597059 () Bool)

(assert (=> b!621152 m!597059))

(declare-fun m!597061 () Bool)

(assert (=> b!621152 m!597061))

(declare-fun m!597063 () Bool)

(assert (=> b!621152 m!597063))

(declare-fun m!597065 () Bool)

(assert (=> b!621130 m!597065))

(declare-fun m!597067 () Bool)

(assert (=> b!621130 m!597067))

(assert (=> b!621130 m!597043))

(declare-fun m!597069 () Bool)

(assert (=> b!621130 m!597069))

(declare-fun m!597071 () Bool)

(assert (=> b!621130 m!597071))

(assert (=> b!621130 m!597043))

(declare-fun m!597073 () Bool)

(assert (=> b!621130 m!597073))

(declare-fun m!597075 () Bool)

(assert (=> b!621130 m!597075))

(declare-fun m!597077 () Bool)

(assert (=> b!621130 m!597077))

(declare-fun m!597079 () Bool)

(assert (=> b!621132 m!597079))

(declare-fun m!597081 () Bool)

(assert (=> b!621150 m!597081))

(assert (=> b!621150 m!597043))

(assert (=> b!621150 m!597043))

(declare-fun m!597083 () Bool)

(assert (=> b!621150 m!597083))

(assert (=> b!621135 m!597043))

(assert (=> b!621135 m!597043))

(declare-fun m!597085 () Bool)

(assert (=> b!621135 m!597085))

(assert (=> b!621146 m!597043))

(declare-fun m!597087 () Bool)

(assert (=> b!621146 m!597087))

(assert (=> b!621146 m!597043))

(assert (=> b!621146 m!597043))

(declare-fun m!597089 () Bool)

(assert (=> b!621146 m!597089))

(declare-fun m!597091 () Bool)

(assert (=> b!621146 m!597091))

(assert (=> b!621146 m!597043))

(assert (=> b!621146 m!597045))

(assert (=> b!621146 m!597043))

(declare-fun m!597093 () Bool)

(assert (=> b!621146 m!597093))

(assert (=> b!621146 m!597063))

(declare-fun m!597095 () Bool)

(assert (=> b!621146 m!597095))

(assert (=> b!621146 m!597055))

(assert (=> b!621140 m!597043))

(assert (=> b!621140 m!597043))

(assert (=> b!621140 m!597047))

(assert (=> b!621148 m!597069))

(declare-fun m!597097 () Bool)

(assert (=> b!621148 m!597097))

(assert (=> b!621129 m!597069))

(declare-fun m!597099 () Bool)

(assert (=> b!621129 m!597099))

(assert (=> b!621129 m!597043))

(push 1)

(assert (not b!621139))

(assert (not b!621131))

(assert (not b!621146))

(assert (not start!56156))

(assert (not b!621150))

(assert (not b!621152))

(assert (not b!621140))

(assert (not b!621147))

(assert (not b!621149))

(assert (not b!621130))

(assert (not b!621132))

(assert (not b!621135))

(assert (not b!621134))

(assert (not b!621133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

