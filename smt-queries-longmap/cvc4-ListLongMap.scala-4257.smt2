; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59100 () Bool)

(assert start!59100)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!652087 () Bool)

(declare-datatypes ((array!38600 0))(
  ( (array!38601 (arr!18503 (Array (_ BitVec 32) (_ BitVec 64))) (size!18867 (_ BitVec 32))) )
))
(declare-fun lt!303333 () array!38600)

(declare-fun e!374251 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38600)

(declare-fun arrayContainsKey!0 (array!38600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652087 (= e!374251 (arrayContainsKey!0 lt!303333 (select (arr!18503 a!2986) j!136) index!984))))

(declare-fun b!652088 () Bool)

(declare-fun res!422825 () Bool)

(declare-fun e!374252 () Bool)

(assert (=> b!652088 (=> (not res!422825) (not e!374252))))

(declare-datatypes ((List!12544 0))(
  ( (Nil!12541) (Cons!12540 (h!13585 (_ BitVec 64)) (t!18772 List!12544)) )
))
(declare-fun arrayNoDuplicates!0 (array!38600 (_ BitVec 32) List!12544) Bool)

(assert (=> b!652088 (= res!422825 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12541))))

(declare-fun res!422821 () Bool)

(declare-fun e!374245 () Bool)

(assert (=> start!59100 (=> (not res!422821) (not e!374245))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59100 (= res!422821 (validMask!0 mask!3053))))

(assert (=> start!59100 e!374245))

(assert (=> start!59100 true))

(declare-fun array_inv!14299 (array!38600) Bool)

(assert (=> start!59100 (array_inv!14299 a!2986)))

(declare-fun b!652089 () Bool)

(assert (=> b!652089 (= e!374245 e!374252)))

(declare-fun res!422833 () Bool)

(assert (=> b!652089 (=> (not res!422833) (not e!374252))))

(declare-datatypes ((SeekEntryResult!6943 0))(
  ( (MissingZero!6943 (index!30125 (_ BitVec 32))) (Found!6943 (index!30126 (_ BitVec 32))) (Intermediate!6943 (undefined!7755 Bool) (index!30127 (_ BitVec 32)) (x!58910 (_ BitVec 32))) (Undefined!6943) (MissingVacant!6943 (index!30128 (_ BitVec 32))) )
))
(declare-fun lt!303346 () SeekEntryResult!6943)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!652089 (= res!422833 (or (= lt!303346 (MissingZero!6943 i!1108)) (= lt!303346 (MissingVacant!6943 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38600 (_ BitVec 32)) SeekEntryResult!6943)

(assert (=> b!652089 (= lt!303346 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!652090 () Bool)

(declare-datatypes ((Unit!22284 0))(
  ( (Unit!22285) )
))
(declare-fun e!374256 () Unit!22284)

(declare-fun Unit!22286 () Unit!22284)

(assert (=> b!652090 (= e!374256 Unit!22286)))

(declare-fun lt!303345 () Unit!22284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38600 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22284)

(assert (=> b!652090 (= lt!303345 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303333 (select (arr!18503 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652090 (arrayContainsKey!0 lt!303333 (select (arr!18503 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303338 () Unit!22284)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38600 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12544) Unit!22284)

(assert (=> b!652090 (= lt!303338 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12541))))

(assert (=> b!652090 (arrayNoDuplicates!0 lt!303333 #b00000000000000000000000000000000 Nil!12541)))

(declare-fun lt!303332 () Unit!22284)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38600 (_ BitVec 32) (_ BitVec 32)) Unit!22284)

(assert (=> b!652090 (= lt!303332 (lemmaNoDuplicateFromThenFromBigger!0 lt!303333 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652090 (arrayNoDuplicates!0 lt!303333 j!136 Nil!12541)))

(declare-fun lt!303349 () Unit!22284)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38600 (_ BitVec 64) (_ BitVec 32) List!12544) Unit!22284)

(assert (=> b!652090 (= lt!303349 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303333 (select (arr!18503 a!2986) j!136) j!136 Nil!12541))))

(assert (=> b!652090 false))

(declare-fun b!652091 () Bool)

(declare-fun e!374243 () Bool)

(assert (=> b!652091 (= e!374243 e!374251)))

(declare-fun res!422831 () Bool)

(assert (=> b!652091 (=> (not res!422831) (not e!374251))))

(assert (=> b!652091 (= res!422831 (arrayContainsKey!0 lt!303333 (select (arr!18503 a!2986) j!136) j!136))))

(declare-fun b!652092 () Bool)

(declare-fun res!422826 () Bool)

(assert (=> b!652092 (=> (not res!422826) (not e!374252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38600 (_ BitVec 32)) Bool)

(assert (=> b!652092 (= res!422826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652093 () Bool)

(declare-fun res!422823 () Bool)

(assert (=> b!652093 (=> (not res!422823) (not e!374252))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!652093 (= res!422823 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18503 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652094 () Bool)

(declare-fun e!374253 () Unit!22284)

(declare-fun Unit!22287 () Unit!22284)

(assert (=> b!652094 (= e!374253 Unit!22287)))

(assert (=> b!652094 false))

(declare-fun b!652095 () Bool)

(declare-fun e!374242 () Bool)

(declare-fun lt!303339 () SeekEntryResult!6943)

(declare-fun lt!303334 () SeekEntryResult!6943)

(assert (=> b!652095 (= e!374242 (= lt!303339 lt!303334))))

(declare-fun b!652096 () Bool)

(declare-fun e!374244 () Bool)

(assert (=> b!652096 (= e!374244 true)))

(assert (=> b!652096 (arrayNoDuplicates!0 lt!303333 index!984 Nil!12541)))

(declare-fun lt!303347 () Unit!22284)

(assert (=> b!652096 (= lt!303347 (lemmaNoDuplicateFromThenFromBigger!0 lt!303333 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652096 (arrayNoDuplicates!0 lt!303333 #b00000000000000000000000000000000 Nil!12541)))

(declare-fun lt!303337 () Unit!22284)

(assert (=> b!652096 (= lt!303337 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12541))))

(assert (=> b!652096 (arrayContainsKey!0 lt!303333 (select (arr!18503 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303341 () Unit!22284)

(assert (=> b!652096 (= lt!303341 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303333 (select (arr!18503 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374247 () Bool)

(assert (=> b!652096 e!374247))

(declare-fun res!422832 () Bool)

(assert (=> b!652096 (=> (not res!422832) (not e!374247))))

(assert (=> b!652096 (= res!422832 (arrayContainsKey!0 lt!303333 (select (arr!18503 a!2986) j!136) j!136))))

(declare-fun b!652097 () Bool)

(declare-fun res!422837 () Bool)

(assert (=> b!652097 (=> (not res!422837) (not e!374245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652097 (= res!422837 (validKeyInArray!0 k!1786))))

(declare-fun b!652098 () Bool)

(declare-fun res!422830 () Bool)

(assert (=> b!652098 (=> (not res!422830) (not e!374245))))

(assert (=> b!652098 (= res!422830 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652099 () Bool)

(declare-fun e!374255 () Bool)

(assert (=> b!652099 (= e!374255 e!374243)))

(declare-fun res!422822 () Bool)

(assert (=> b!652099 (=> res!422822 e!374243)))

(declare-fun lt!303342 () (_ BitVec 64))

(declare-fun lt!303336 () (_ BitVec 64))

(assert (=> b!652099 (= res!422822 (or (not (= (select (arr!18503 a!2986) j!136) lt!303336)) (not (= (select (arr!18503 a!2986) j!136) lt!303342)) (bvsge j!136 index!984)))))

(declare-fun b!652100 () Bool)

(declare-fun res!422827 () Bool)

(assert (=> b!652100 (=> (not res!422827) (not e!374245))))

(assert (=> b!652100 (= res!422827 (validKeyInArray!0 (select (arr!18503 a!2986) j!136)))))

(declare-fun b!652101 () Bool)

(declare-fun e!374250 () Bool)

(assert (=> b!652101 (= e!374250 e!374244)))

(declare-fun res!422824 () Bool)

(assert (=> b!652101 (=> res!422824 e!374244)))

(assert (=> b!652101 (= res!422824 (bvsge index!984 j!136))))

(declare-fun lt!303344 () Unit!22284)

(assert (=> b!652101 (= lt!303344 e!374256)))

(declare-fun c!75001 () Bool)

(assert (=> b!652101 (= c!75001 (bvslt j!136 index!984))))

(declare-fun b!652102 () Bool)

(declare-fun res!422820 () Bool)

(assert (=> b!652102 (=> (not res!422820) (not e!374245))))

(assert (=> b!652102 (= res!422820 (and (= (size!18867 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18867 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18867 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652103 () Bool)

(declare-fun e!374246 () Bool)

(declare-fun e!374248 () Bool)

(assert (=> b!652103 (= e!374246 e!374248)))

(declare-fun res!422834 () Bool)

(assert (=> b!652103 (=> (not res!422834) (not e!374248))))

(assert (=> b!652103 (= res!422834 (and (= lt!303339 (Found!6943 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18503 a!2986) index!984) (select (arr!18503 a!2986) j!136))) (not (= (select (arr!18503 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38600 (_ BitVec 32)) SeekEntryResult!6943)

(assert (=> b!652103 (= lt!303339 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18503 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652104 () Bool)

(declare-fun e!374249 () Bool)

(assert (=> b!652104 (= e!374248 (not e!374249))))

(declare-fun res!422835 () Bool)

(assert (=> b!652104 (=> res!422835 e!374249)))

(declare-fun lt!303335 () SeekEntryResult!6943)

(assert (=> b!652104 (= res!422835 (not (= lt!303335 (Found!6943 index!984))))))

(declare-fun lt!303348 () Unit!22284)

(assert (=> b!652104 (= lt!303348 e!374253)))

(declare-fun c!75002 () Bool)

(assert (=> b!652104 (= c!75002 (= lt!303335 Undefined!6943))))

(assert (=> b!652104 (= lt!303335 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303336 lt!303333 mask!3053))))

(assert (=> b!652104 e!374242))

(declare-fun res!422819 () Bool)

(assert (=> b!652104 (=> (not res!422819) (not e!374242))))

(declare-fun lt!303340 () (_ BitVec 32))

(assert (=> b!652104 (= res!422819 (= lt!303334 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303340 vacantSpotIndex!68 lt!303336 lt!303333 mask!3053)))))

(assert (=> b!652104 (= lt!303334 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303340 vacantSpotIndex!68 (select (arr!18503 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652104 (= lt!303336 (select (store (arr!18503 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303343 () Unit!22284)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38600 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22284)

(assert (=> b!652104 (= lt!303343 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303340 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652104 (= lt!303340 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652105 () Bool)

(declare-fun Unit!22288 () Unit!22284)

(assert (=> b!652105 (= e!374253 Unit!22288)))

(declare-fun b!652106 () Bool)

(assert (=> b!652106 (= e!374247 (arrayContainsKey!0 lt!303333 (select (arr!18503 a!2986) j!136) index!984))))

(declare-fun b!652107 () Bool)

(declare-fun Unit!22289 () Unit!22284)

(assert (=> b!652107 (= e!374256 Unit!22289)))

(declare-fun b!652108 () Bool)

(assert (=> b!652108 (= e!374252 e!374246)))

(declare-fun res!422829 () Bool)

(assert (=> b!652108 (=> (not res!422829) (not e!374246))))

(assert (=> b!652108 (= res!422829 (= (select (store (arr!18503 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652108 (= lt!303333 (array!38601 (store (arr!18503 a!2986) i!1108 k!1786) (size!18867 a!2986)))))

(declare-fun b!652109 () Bool)

(assert (=> b!652109 (= e!374249 e!374250)))

(declare-fun res!422836 () Bool)

(assert (=> b!652109 (=> res!422836 e!374250)))

(assert (=> b!652109 (= res!422836 (or (not (= (select (arr!18503 a!2986) j!136) lt!303336)) (not (= (select (arr!18503 a!2986) j!136) lt!303342))))))

(assert (=> b!652109 e!374255))

(declare-fun res!422828 () Bool)

(assert (=> b!652109 (=> (not res!422828) (not e!374255))))

(assert (=> b!652109 (= res!422828 (= lt!303342 (select (arr!18503 a!2986) j!136)))))

(assert (=> b!652109 (= lt!303342 (select (store (arr!18503 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!59100 res!422821) b!652102))

(assert (= (and b!652102 res!422820) b!652100))

(assert (= (and b!652100 res!422827) b!652097))

(assert (= (and b!652097 res!422837) b!652098))

(assert (= (and b!652098 res!422830) b!652089))

(assert (= (and b!652089 res!422833) b!652092))

(assert (= (and b!652092 res!422826) b!652088))

(assert (= (and b!652088 res!422825) b!652093))

(assert (= (and b!652093 res!422823) b!652108))

(assert (= (and b!652108 res!422829) b!652103))

(assert (= (and b!652103 res!422834) b!652104))

(assert (= (and b!652104 res!422819) b!652095))

(assert (= (and b!652104 c!75002) b!652094))

(assert (= (and b!652104 (not c!75002)) b!652105))

(assert (= (and b!652104 (not res!422835)) b!652109))

(assert (= (and b!652109 res!422828) b!652099))

(assert (= (and b!652099 (not res!422822)) b!652091))

(assert (= (and b!652091 res!422831) b!652087))

(assert (= (and b!652109 (not res!422836)) b!652101))

(assert (= (and b!652101 c!75001) b!652090))

(assert (= (and b!652101 (not c!75001)) b!652107))

(assert (= (and b!652101 (not res!422824)) b!652096))

(assert (= (and b!652096 res!422832) b!652106))

(declare-fun m!625233 () Bool)

(assert (=> b!652098 m!625233))

(declare-fun m!625235 () Bool)

(assert (=> b!652092 m!625235))

(declare-fun m!625237 () Bool)

(assert (=> b!652096 m!625237))

(declare-fun m!625239 () Bool)

(assert (=> b!652096 m!625239))

(assert (=> b!652096 m!625237))

(declare-fun m!625241 () Bool)

(assert (=> b!652096 m!625241))

(assert (=> b!652096 m!625237))

(declare-fun m!625243 () Bool)

(assert (=> b!652096 m!625243))

(declare-fun m!625245 () Bool)

(assert (=> b!652096 m!625245))

(assert (=> b!652096 m!625237))

(declare-fun m!625247 () Bool)

(assert (=> b!652096 m!625247))

(declare-fun m!625249 () Bool)

(assert (=> b!652096 m!625249))

(declare-fun m!625251 () Bool)

(assert (=> b!652096 m!625251))

(declare-fun m!625253 () Bool)

(assert (=> b!652103 m!625253))

(assert (=> b!652103 m!625237))

(assert (=> b!652103 m!625237))

(declare-fun m!625255 () Bool)

(assert (=> b!652103 m!625255))

(assert (=> b!652109 m!625237))

(declare-fun m!625257 () Bool)

(assert (=> b!652109 m!625257))

(declare-fun m!625259 () Bool)

(assert (=> b!652109 m!625259))

(assert (=> b!652106 m!625237))

(assert (=> b!652106 m!625237))

(declare-fun m!625261 () Bool)

(assert (=> b!652106 m!625261))

(declare-fun m!625263 () Bool)

(assert (=> b!652089 m!625263))

(assert (=> b!652108 m!625257))

(declare-fun m!625265 () Bool)

(assert (=> b!652108 m!625265))

(assert (=> b!652090 m!625237))

(assert (=> b!652090 m!625237))

(declare-fun m!625267 () Bool)

(assert (=> b!652090 m!625267))

(assert (=> b!652090 m!625243))

(assert (=> b!652090 m!625237))

(declare-fun m!625269 () Bool)

(assert (=> b!652090 m!625269))

(declare-fun m!625271 () Bool)

(assert (=> b!652090 m!625271))

(declare-fun m!625273 () Bool)

(assert (=> b!652090 m!625273))

(assert (=> b!652090 m!625237))

(declare-fun m!625275 () Bool)

(assert (=> b!652090 m!625275))

(assert (=> b!652090 m!625251))

(assert (=> b!652091 m!625237))

(assert (=> b!652091 m!625237))

(assert (=> b!652091 m!625247))

(assert (=> b!652087 m!625237))

(assert (=> b!652087 m!625237))

(assert (=> b!652087 m!625261))

(declare-fun m!625277 () Bool)

(assert (=> b!652093 m!625277))

(assert (=> b!652100 m!625237))

(assert (=> b!652100 m!625237))

(declare-fun m!625279 () Bool)

(assert (=> b!652100 m!625279))

(declare-fun m!625281 () Bool)

(assert (=> b!652088 m!625281))

(declare-fun m!625283 () Bool)

(assert (=> b!652104 m!625283))

(declare-fun m!625285 () Bool)

(assert (=> b!652104 m!625285))

(assert (=> b!652104 m!625237))

(assert (=> b!652104 m!625257))

(declare-fun m!625287 () Bool)

(assert (=> b!652104 m!625287))

(declare-fun m!625289 () Bool)

(assert (=> b!652104 m!625289))

(assert (=> b!652104 m!625237))

(declare-fun m!625291 () Bool)

(assert (=> b!652104 m!625291))

(declare-fun m!625293 () Bool)

(assert (=> b!652104 m!625293))

(declare-fun m!625295 () Bool)

(assert (=> b!652097 m!625295))

(assert (=> b!652099 m!625237))

(declare-fun m!625297 () Bool)

(assert (=> start!59100 m!625297))

(declare-fun m!625299 () Bool)

(assert (=> start!59100 m!625299))

(push 1)

