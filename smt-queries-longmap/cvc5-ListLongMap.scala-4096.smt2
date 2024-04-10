; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56074 () Bool)

(assert start!56074)

(declare-fun b!618098 () Bool)

(declare-fun res!398223 () Bool)

(declare-fun e!354462 () Bool)

(assert (=> b!618098 (=> (not res!398223) (not e!354462))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37544 0))(
  ( (array!37545 (arr!18018 (Array (_ BitVec 32) (_ BitVec 64))) (size!18382 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37544)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618098 (= res!398223 (and (= (size!18382 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18382 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18382 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618099 () Bool)

(declare-datatypes ((Unit!20308 0))(
  ( (Unit!20309) )
))
(declare-fun e!354457 () Unit!20308)

(declare-fun Unit!20310 () Unit!20308)

(assert (=> b!618099 (= e!354457 Unit!20310)))

(declare-fun e!354449 () Bool)

(declare-fun lt!284853 () array!37544)

(declare-fun b!618100 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618100 (= e!354449 (arrayContainsKey!0 lt!284853 (select (arr!18018 a!2986) j!136) index!984))))

(declare-fun b!618101 () Bool)

(declare-fun e!354453 () Bool)

(assert (=> b!618101 (= e!354453 true)))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!618101 (= (select (store (arr!18018 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618102 () Bool)

(declare-fun res!398219 () Bool)

(declare-fun e!354448 () Bool)

(assert (=> b!618102 (=> (not res!398219) (not e!354448))))

(declare-datatypes ((List!12059 0))(
  ( (Nil!12056) (Cons!12055 (h!13100 (_ BitVec 64)) (t!18287 List!12059)) )
))
(declare-fun arrayNoDuplicates!0 (array!37544 (_ BitVec 32) List!12059) Bool)

(assert (=> b!618102 (= res!398219 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12056))))

(declare-fun b!618103 () Bool)

(declare-fun e!354452 () Unit!20308)

(declare-fun Unit!20311 () Unit!20308)

(assert (=> b!618103 (= e!354452 Unit!20311)))

(assert (=> b!618103 false))

(declare-fun b!618104 () Bool)

(declare-fun e!354461 () Unit!20308)

(declare-fun Unit!20312 () Unit!20308)

(assert (=> b!618104 (= e!354461 Unit!20312)))

(declare-fun b!618105 () Bool)

(declare-fun res!398214 () Bool)

(assert (=> b!618105 (=> (not res!398214) (not e!354462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618105 (= res!398214 (validKeyInArray!0 (select (arr!18018 a!2986) j!136)))))

(declare-fun b!618106 () Bool)

(declare-fun res!398213 () Bool)

(assert (=> b!618106 (=> (not res!398213) (not e!354448))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618106 (= res!398213 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18018 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618107 () Bool)

(declare-fun e!354454 () Unit!20308)

(declare-fun Unit!20313 () Unit!20308)

(assert (=> b!618107 (= e!354454 Unit!20313)))

(declare-fun b!618108 () Bool)

(assert (=> b!618108 false))

(declare-fun lt!284857 () Unit!20308)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37544 (_ BitVec 64) (_ BitVec 32) List!12059) Unit!20308)

(assert (=> b!618108 (= lt!284857 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284853 (select (arr!18018 a!2986) j!136) index!984 Nil!12056))))

(assert (=> b!618108 (arrayNoDuplicates!0 lt!284853 index!984 Nil!12056)))

(declare-fun lt!284854 () Unit!20308)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37544 (_ BitVec 32) (_ BitVec 32)) Unit!20308)

(assert (=> b!618108 (= lt!284854 (lemmaNoDuplicateFromThenFromBigger!0 lt!284853 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618108 (arrayNoDuplicates!0 lt!284853 #b00000000000000000000000000000000 Nil!12056)))

(declare-fun lt!284843 () Unit!20308)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12059) Unit!20308)

(assert (=> b!618108 (= lt!284843 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12056))))

(assert (=> b!618108 (arrayContainsKey!0 lt!284853 (select (arr!18018 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284846 () Unit!20308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20308)

(assert (=> b!618108 (= lt!284846 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284853 (select (arr!18018 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354459 () Bool)

(assert (=> b!618108 e!354459))

(declare-fun res!398222 () Bool)

(assert (=> b!618108 (=> (not res!398222) (not e!354459))))

(assert (=> b!618108 (= res!398222 (arrayContainsKey!0 lt!284853 (select (arr!18018 a!2986) j!136) j!136))))

(declare-fun Unit!20314 () Unit!20308)

(assert (=> b!618108 (= e!354461 Unit!20314)))

(declare-fun b!618109 () Bool)

(declare-fun res!398215 () Bool)

(assert (=> b!618109 (= res!398215 (arrayContainsKey!0 lt!284853 (select (arr!18018 a!2986) j!136) j!136))))

(assert (=> b!618109 (=> (not res!398215) (not e!354449))))

(declare-fun e!354458 () Bool)

(assert (=> b!618109 (= e!354458 e!354449)))

(declare-fun b!618110 () Bool)

(declare-fun res!398225 () Bool)

(assert (=> b!618110 (=> (not res!398225) (not e!354462))))

(assert (=> b!618110 (= res!398225 (validKeyInArray!0 k!1786))))

(declare-fun b!618111 () Bool)

(declare-fun res!398216 () Bool)

(assert (=> b!618111 (= res!398216 (bvsge j!136 index!984))))

(assert (=> b!618111 (=> res!398216 e!354458)))

(declare-fun e!354455 () Bool)

(assert (=> b!618111 (= e!354455 e!354458)))

(declare-fun b!618112 () Bool)

(assert (=> b!618112 (= e!354462 e!354448)))

(declare-fun res!398221 () Bool)

(assert (=> b!618112 (=> (not res!398221) (not e!354448))))

(declare-datatypes ((SeekEntryResult!6458 0))(
  ( (MissingZero!6458 (index!28116 (_ BitVec 32))) (Found!6458 (index!28117 (_ BitVec 32))) (Intermediate!6458 (undefined!7270 Bool) (index!28118 (_ BitVec 32)) (x!56906 (_ BitVec 32))) (Undefined!6458) (MissingVacant!6458 (index!28119 (_ BitVec 32))) )
))
(declare-fun lt!284849 () SeekEntryResult!6458)

(assert (=> b!618112 (= res!398221 (or (= lt!284849 (MissingZero!6458 i!1108)) (= lt!284849 (MissingVacant!6458 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37544 (_ BitVec 32)) SeekEntryResult!6458)

(assert (=> b!618112 (= lt!284849 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618113 () Bool)

(declare-fun res!398224 () Bool)

(assert (=> b!618113 (=> (not res!398224) (not e!354462))))

(assert (=> b!618113 (= res!398224 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618114 () Bool)

(declare-fun e!354460 () Bool)

(assert (=> b!618114 (= e!354460 (not e!354453))))

(declare-fun res!398227 () Bool)

(assert (=> b!618114 (=> res!398227 e!354453)))

(declare-fun lt!284852 () SeekEntryResult!6458)

(assert (=> b!618114 (= res!398227 (not (= lt!284852 (MissingVacant!6458 vacantSpotIndex!68))))))

(declare-fun lt!284844 () Unit!20308)

(assert (=> b!618114 (= lt!284844 e!354457)))

(declare-fun c!70312 () Bool)

(assert (=> b!618114 (= c!70312 (= lt!284852 (Found!6458 index!984)))))

(declare-fun lt!284847 () Unit!20308)

(assert (=> b!618114 (= lt!284847 e!354452)))

(declare-fun c!70313 () Bool)

(assert (=> b!618114 (= c!70313 (= lt!284852 Undefined!6458))))

(declare-fun lt!284840 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37544 (_ BitVec 32)) SeekEntryResult!6458)

(assert (=> b!618114 (= lt!284852 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284840 lt!284853 mask!3053))))

(declare-fun e!354450 () Bool)

(assert (=> b!618114 e!354450))

(declare-fun res!398218 () Bool)

(assert (=> b!618114 (=> (not res!398218) (not e!354450))))

(declare-fun lt!284845 () SeekEntryResult!6458)

(declare-fun lt!284838 () (_ BitVec 32))

(assert (=> b!618114 (= res!398218 (= lt!284845 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284838 vacantSpotIndex!68 lt!284840 lt!284853 mask!3053)))))

(assert (=> b!618114 (= lt!284845 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284838 vacantSpotIndex!68 (select (arr!18018 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618114 (= lt!284840 (select (store (arr!18018 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284850 () Unit!20308)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37544 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20308)

(assert (=> b!618114 (= lt!284850 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284838 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618114 (= lt!284838 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618115 () Bool)

(declare-fun Unit!20315 () Unit!20308)

(assert (=> b!618115 (= e!354457 Unit!20315)))

(declare-fun res!398217 () Bool)

(assert (=> b!618115 (= res!398217 (= (select (store (arr!18018 a!2986) i!1108 k!1786) index!984) (select (arr!18018 a!2986) j!136)))))

(assert (=> b!618115 (=> (not res!398217) (not e!354455))))

(assert (=> b!618115 e!354455))

(declare-fun c!70311 () Bool)

(assert (=> b!618115 (= c!70311 (bvslt j!136 index!984))))

(declare-fun lt!284841 () Unit!20308)

(assert (=> b!618115 (= lt!284841 e!354454)))

(declare-fun c!70310 () Bool)

(assert (=> b!618115 (= c!70310 (bvslt index!984 j!136))))

(declare-fun lt!284851 () Unit!20308)

(assert (=> b!618115 (= lt!284851 e!354461)))

(assert (=> b!618115 false))

(declare-fun b!618116 () Bool)

(declare-fun e!354451 () Bool)

(assert (=> b!618116 (= e!354448 e!354451)))

(declare-fun res!398228 () Bool)

(assert (=> b!618116 (=> (not res!398228) (not e!354451))))

(assert (=> b!618116 (= res!398228 (= (select (store (arr!18018 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618116 (= lt!284853 (array!37545 (store (arr!18018 a!2986) i!1108 k!1786) (size!18382 a!2986)))))

(declare-fun b!618117 () Bool)

(declare-fun Unit!20316 () Unit!20308)

(assert (=> b!618117 (= e!354452 Unit!20316)))

(declare-fun res!398226 () Bool)

(assert (=> start!56074 (=> (not res!398226) (not e!354462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56074 (= res!398226 (validMask!0 mask!3053))))

(assert (=> start!56074 e!354462))

(assert (=> start!56074 true))

(declare-fun array_inv!13814 (array!37544) Bool)

(assert (=> start!56074 (array_inv!13814 a!2986)))

(declare-fun b!618118 () Bool)

(assert (=> b!618118 (= e!354459 (arrayContainsKey!0 lt!284853 (select (arr!18018 a!2986) j!136) index!984))))

(declare-fun b!618119 () Bool)

(assert (=> b!618119 (= e!354451 e!354460)))

(declare-fun res!398220 () Bool)

(assert (=> b!618119 (=> (not res!398220) (not e!354460))))

(declare-fun lt!284839 () SeekEntryResult!6458)

(assert (=> b!618119 (= res!398220 (and (= lt!284839 (Found!6458 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18018 a!2986) index!984) (select (arr!18018 a!2986) j!136))) (not (= (select (arr!18018 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618119 (= lt!284839 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18018 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618120 () Bool)

(assert (=> b!618120 (= e!354450 (= lt!284839 lt!284845))))

(declare-fun b!618121 () Bool)

(declare-fun res!398212 () Bool)

(assert (=> b!618121 (=> (not res!398212) (not e!354448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37544 (_ BitVec 32)) Bool)

(assert (=> b!618121 (= res!398212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618122 () Bool)

(assert (=> b!618122 false))

(declare-fun lt!284855 () Unit!20308)

(assert (=> b!618122 (= lt!284855 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284853 (select (arr!18018 a!2986) j!136) j!136 Nil!12056))))

(assert (=> b!618122 (arrayNoDuplicates!0 lt!284853 j!136 Nil!12056)))

(declare-fun lt!284856 () Unit!20308)

(assert (=> b!618122 (= lt!284856 (lemmaNoDuplicateFromThenFromBigger!0 lt!284853 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618122 (arrayNoDuplicates!0 lt!284853 #b00000000000000000000000000000000 Nil!12056)))

(declare-fun lt!284848 () Unit!20308)

(assert (=> b!618122 (= lt!284848 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12056))))

(assert (=> b!618122 (arrayContainsKey!0 lt!284853 (select (arr!18018 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284842 () Unit!20308)

(assert (=> b!618122 (= lt!284842 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284853 (select (arr!18018 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20317 () Unit!20308)

(assert (=> b!618122 (= e!354454 Unit!20317)))

(assert (= (and start!56074 res!398226) b!618098))

(assert (= (and b!618098 res!398223) b!618105))

(assert (= (and b!618105 res!398214) b!618110))

(assert (= (and b!618110 res!398225) b!618113))

(assert (= (and b!618113 res!398224) b!618112))

(assert (= (and b!618112 res!398221) b!618121))

(assert (= (and b!618121 res!398212) b!618102))

(assert (= (and b!618102 res!398219) b!618106))

(assert (= (and b!618106 res!398213) b!618116))

(assert (= (and b!618116 res!398228) b!618119))

(assert (= (and b!618119 res!398220) b!618114))

(assert (= (and b!618114 res!398218) b!618120))

(assert (= (and b!618114 c!70313) b!618103))

(assert (= (and b!618114 (not c!70313)) b!618117))

(assert (= (and b!618114 c!70312) b!618115))

(assert (= (and b!618114 (not c!70312)) b!618099))

(assert (= (and b!618115 res!398217) b!618111))

(assert (= (and b!618111 (not res!398216)) b!618109))

(assert (= (and b!618109 res!398215) b!618100))

(assert (= (and b!618115 c!70311) b!618122))

(assert (= (and b!618115 (not c!70311)) b!618107))

(assert (= (and b!618115 c!70310) b!618108))

(assert (= (and b!618115 (not c!70310)) b!618104))

(assert (= (and b!618108 res!398222) b!618118))

(assert (= (and b!618114 (not res!398227)) b!618101))

(declare-fun m!594161 () Bool)

(assert (=> b!618118 m!594161))

(assert (=> b!618118 m!594161))

(declare-fun m!594163 () Bool)

(assert (=> b!618118 m!594163))

(declare-fun m!594165 () Bool)

(assert (=> start!56074 m!594165))

(declare-fun m!594167 () Bool)

(assert (=> start!56074 m!594167))

(declare-fun m!594169 () Bool)

(assert (=> b!618115 m!594169))

(declare-fun m!594171 () Bool)

(assert (=> b!618115 m!594171))

(assert (=> b!618115 m!594161))

(assert (=> b!618105 m!594161))

(assert (=> b!618105 m!594161))

(declare-fun m!594173 () Bool)

(assert (=> b!618105 m!594173))

(declare-fun m!594175 () Bool)

(assert (=> b!618106 m!594175))

(declare-fun m!594177 () Bool)

(assert (=> b!618102 m!594177))

(assert (=> b!618109 m!594161))

(assert (=> b!618109 m!594161))

(declare-fun m!594179 () Bool)

(assert (=> b!618109 m!594179))

(assert (=> b!618100 m!594161))

(assert (=> b!618100 m!594161))

(assert (=> b!618100 m!594163))

(declare-fun m!594181 () Bool)

(assert (=> b!618110 m!594181))

(declare-fun m!594183 () Bool)

(assert (=> b!618122 m!594183))

(assert (=> b!618122 m!594161))

(declare-fun m!594185 () Bool)

(assert (=> b!618122 m!594185))

(assert (=> b!618122 m!594161))

(declare-fun m!594187 () Bool)

(assert (=> b!618122 m!594187))

(declare-fun m!594189 () Bool)

(assert (=> b!618122 m!594189))

(assert (=> b!618122 m!594161))

(declare-fun m!594191 () Bool)

(assert (=> b!618122 m!594191))

(assert (=> b!618122 m!594161))

(declare-fun m!594193 () Bool)

(assert (=> b!618122 m!594193))

(declare-fun m!594195 () Bool)

(assert (=> b!618122 m!594195))

(assert (=> b!618101 m!594169))

(assert (=> b!618101 m!594171))

(declare-fun m!594197 () Bool)

(assert (=> b!618114 m!594197))

(assert (=> b!618114 m!594161))

(declare-fun m!594199 () Bool)

(assert (=> b!618114 m!594199))

(assert (=> b!618114 m!594161))

(assert (=> b!618114 m!594169))

(declare-fun m!594201 () Bool)

(assert (=> b!618114 m!594201))

(declare-fun m!594203 () Bool)

(assert (=> b!618114 m!594203))

(declare-fun m!594205 () Bool)

(assert (=> b!618114 m!594205))

(declare-fun m!594207 () Bool)

(assert (=> b!618114 m!594207))

(assert (=> b!618116 m!594169))

(declare-fun m!594209 () Bool)

(assert (=> b!618116 m!594209))

(declare-fun m!594211 () Bool)

(assert (=> b!618108 m!594211))

(assert (=> b!618108 m!594161))

(assert (=> b!618108 m!594195))

(declare-fun m!594213 () Bool)

(assert (=> b!618108 m!594213))

(assert (=> b!618108 m!594161))

(declare-fun m!594215 () Bool)

(assert (=> b!618108 m!594215))

(assert (=> b!618108 m!594161))

(declare-fun m!594217 () Bool)

(assert (=> b!618108 m!594217))

(assert (=> b!618108 m!594161))

(assert (=> b!618108 m!594179))

(assert (=> b!618108 m!594161))

(declare-fun m!594219 () Bool)

(assert (=> b!618108 m!594219))

(assert (=> b!618108 m!594189))

(declare-fun m!594221 () Bool)

(assert (=> b!618121 m!594221))

(declare-fun m!594223 () Bool)

(assert (=> b!618119 m!594223))

(assert (=> b!618119 m!594161))

(assert (=> b!618119 m!594161))

(declare-fun m!594225 () Bool)

(assert (=> b!618119 m!594225))

(declare-fun m!594227 () Bool)

(assert (=> b!618112 m!594227))

(declare-fun m!594229 () Bool)

(assert (=> b!618113 m!594229))

(push 1)

