; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55914 () Bool)

(assert start!55914)

(declare-fun b!612411 () Bool)

(declare-datatypes ((Unit!19674 0))(
  ( (Unit!19675) )
))
(declare-fun e!351031 () Unit!19674)

(declare-fun Unit!19676 () Unit!19674)

(assert (=> b!612411 (= e!351031 Unit!19676)))

(assert (=> b!612411 false))

(declare-fun b!612412 () Bool)

(declare-fun e!351025 () Unit!19674)

(declare-fun Unit!19677 () Unit!19674)

(assert (=> b!612412 (= e!351025 Unit!19677)))

(declare-fun b!612413 () Bool)

(declare-fun e!351024 () Bool)

(declare-fun e!351026 () Bool)

(assert (=> b!612413 (= e!351024 e!351026)))

(declare-fun res!394086 () Bool)

(assert (=> b!612413 (=> res!394086 e!351026)))

(declare-fun lt!280374 () (_ BitVec 64))

(declare-fun lt!280368 () (_ BitVec 64))

(declare-datatypes ((array!37398 0))(
  ( (array!37399 (arr!17945 (Array (_ BitVec 32) (_ BitVec 64))) (size!18310 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37398)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!612413 (= res!394086 (or (not (= (select (arr!17945 a!2986) j!136) lt!280374)) (not (= (select (arr!17945 a!2986) j!136) lt!280368))))))

(declare-fun e!351028 () Bool)

(assert (=> b!612413 e!351028))

(declare-fun res!394080 () Bool)

(assert (=> b!612413 (=> (not res!394080) (not e!351028))))

(assert (=> b!612413 (= res!394080 (= lt!280368 (select (arr!17945 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612413 (= lt!280368 (select (store (arr!17945 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612414 () Bool)

(declare-fun res!394084 () Bool)

(declare-fun e!351023 () Bool)

(assert (=> b!612414 (=> (not res!394084) (not e!351023))))

(declare-datatypes ((List!12025 0))(
  ( (Nil!12022) (Cons!12021 (h!13066 (_ BitVec 64)) (t!18244 List!12025)) )
))
(declare-fun arrayNoDuplicates!0 (array!37398 (_ BitVec 32) List!12025) Bool)

(assert (=> b!612414 (= res!394084 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12022))))

(declare-fun b!612415 () Bool)

(declare-fun e!351021 () Bool)

(assert (=> b!612415 (= e!351026 e!351021)))

(declare-fun res!394082 () Bool)

(assert (=> b!612415 (=> res!394082 e!351021)))

(assert (=> b!612415 (= res!394082 (bvsge index!984 j!136))))

(declare-fun lt!280365 () Unit!19674)

(assert (=> b!612415 (= lt!280365 e!351025)))

(declare-fun c!69533 () Bool)

(assert (=> b!612415 (= c!69533 (bvslt j!136 index!984))))

(declare-fun b!612416 () Bool)

(declare-fun e!351027 () Bool)

(declare-fun e!351033 () Bool)

(assert (=> b!612416 (= e!351027 e!351033)))

(declare-fun res!394079 () Bool)

(assert (=> b!612416 (=> (not res!394079) (not e!351033))))

(declare-datatypes ((SeekEntryResult!6382 0))(
  ( (MissingZero!6382 (index!27812 (_ BitVec 32))) (Found!6382 (index!27813 (_ BitVec 32))) (Intermediate!6382 (undefined!7194 Bool) (index!27814 (_ BitVec 32)) (x!56633 (_ BitVec 32))) (Undefined!6382) (MissingVacant!6382 (index!27815 (_ BitVec 32))) )
))
(declare-fun lt!280375 () SeekEntryResult!6382)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!612416 (= res!394079 (and (= lt!280375 (Found!6382 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17945 a!2986) index!984) (select (arr!17945 a!2986) j!136))) (not (= (select (arr!17945 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37398 (_ BitVec 32)) SeekEntryResult!6382)

(assert (=> b!612416 (= lt!280375 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17945 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!280370 () array!37398)

(declare-fun b!612417 () Bool)

(declare-fun e!351019 () Bool)

(declare-fun arrayContainsKey!0 (array!37398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612417 (= e!351019 (arrayContainsKey!0 lt!280370 (select (arr!17945 a!2986) j!136) index!984))))

(declare-fun b!612418 () Bool)

(declare-fun res!394081 () Bool)

(assert (=> b!612418 (=> (not res!394081) (not e!351023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37398 (_ BitVec 32)) Bool)

(assert (=> b!612418 (= res!394081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612419 () Bool)

(declare-fun e!351032 () Bool)

(assert (=> b!612419 (= e!351032 e!351019)))

(declare-fun res!394090 () Bool)

(assert (=> b!612419 (=> (not res!394090) (not e!351019))))

(assert (=> b!612419 (= res!394090 (arrayContainsKey!0 lt!280370 (select (arr!17945 a!2986) j!136) j!136))))

(declare-fun b!612420 () Bool)

(declare-fun e!351029 () Bool)

(assert (=> b!612420 (= e!351029 (arrayContainsKey!0 lt!280370 (select (arr!17945 a!2986) j!136) index!984))))

(declare-fun b!612421 () Bool)

(declare-fun res!394098 () Bool)

(declare-fun e!351018 () Bool)

(assert (=> b!612421 (=> (not res!394098) (not e!351018))))

(assert (=> b!612421 (= res!394098 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612422 () Bool)

(assert (=> b!612422 (= e!351033 (not e!351024))))

(declare-fun res!394096 () Bool)

(assert (=> b!612422 (=> res!394096 e!351024)))

(declare-fun lt!280376 () SeekEntryResult!6382)

(assert (=> b!612422 (= res!394096 (not (= lt!280376 (Found!6382 index!984))))))

(declare-fun lt!280363 () Unit!19674)

(assert (=> b!612422 (= lt!280363 e!351031)))

(declare-fun c!69534 () Bool)

(assert (=> b!612422 (= c!69534 (= lt!280376 Undefined!6382))))

(assert (=> b!612422 (= lt!280376 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280374 lt!280370 mask!3053))))

(declare-fun e!351030 () Bool)

(assert (=> b!612422 e!351030))

(declare-fun res!394087 () Bool)

(assert (=> b!612422 (=> (not res!394087) (not e!351030))))

(declare-fun lt!280378 () (_ BitVec 32))

(declare-fun lt!280364 () SeekEntryResult!6382)

(assert (=> b!612422 (= res!394087 (= lt!280364 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280378 vacantSpotIndex!68 lt!280374 lt!280370 mask!3053)))))

(assert (=> b!612422 (= lt!280364 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280378 vacantSpotIndex!68 (select (arr!17945 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612422 (= lt!280374 (select (store (arr!17945 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280372 () Unit!19674)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37398 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19674)

(assert (=> b!612422 (= lt!280372 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280378 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612422 (= lt!280378 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612423 () Bool)

(declare-fun res!394088 () Bool)

(declare-fun e!351022 () Bool)

(assert (=> b!612423 (=> res!394088 e!351022)))

(declare-fun contains!3029 (List!12025 (_ BitVec 64)) Bool)

(assert (=> b!612423 (= res!394088 (contains!3029 Nil!12022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!612424 () Bool)

(declare-fun res!394097 () Bool)

(assert (=> b!612424 (=> res!394097 e!351022)))

(declare-fun noDuplicate!353 (List!12025) Bool)

(assert (=> b!612424 (= res!394097 (not (noDuplicate!353 Nil!12022)))))

(declare-fun b!612425 () Bool)

(assert (=> b!612425 (= e!351022 true)))

(declare-fun lt!280373 () Bool)

(assert (=> b!612425 (= lt!280373 (contains!3029 Nil!12022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!612426 () Bool)

(declare-fun res!394100 () Bool)

(assert (=> b!612426 (=> (not res!394100) (not e!351023))))

(assert (=> b!612426 (= res!394100 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17945 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612427 () Bool)

(declare-fun res!394089 () Bool)

(assert (=> b!612427 (=> (not res!394089) (not e!351018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612427 (= res!394089 (validKeyInArray!0 (select (arr!17945 a!2986) j!136)))))

(declare-fun b!612428 () Bool)

(assert (=> b!612428 (= e!351018 e!351023)))

(declare-fun res!394095 () Bool)

(assert (=> b!612428 (=> (not res!394095) (not e!351023))))

(declare-fun lt!280366 () SeekEntryResult!6382)

(assert (=> b!612428 (= res!394095 (or (= lt!280366 (MissingZero!6382 i!1108)) (= lt!280366 (MissingVacant!6382 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37398 (_ BitVec 32)) SeekEntryResult!6382)

(assert (=> b!612428 (= lt!280366 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612429 () Bool)

(assert (=> b!612429 (= e!351021 e!351022)))

(declare-fun res!394083 () Bool)

(assert (=> b!612429 (=> res!394083 e!351022)))

(assert (=> b!612429 (= res!394083 (or (bvsge (size!18310 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18310 a!2986)) (bvsge index!984 (size!18310 a!2986))))))

(assert (=> b!612429 (arrayNoDuplicates!0 lt!280370 index!984 Nil!12022)))

(declare-fun lt!280380 () Unit!19674)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37398 (_ BitVec 32) (_ BitVec 32)) Unit!19674)

(assert (=> b!612429 (= lt!280380 (lemmaNoDuplicateFromThenFromBigger!0 lt!280370 #b00000000000000000000000000000000 index!984))))

(assert (=> b!612429 (arrayNoDuplicates!0 lt!280370 #b00000000000000000000000000000000 Nil!12022)))

(declare-fun lt!280381 () Unit!19674)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37398 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12025) Unit!19674)

(assert (=> b!612429 (= lt!280381 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12022))))

(assert (=> b!612429 (arrayContainsKey!0 lt!280370 (select (arr!17945 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280369 () Unit!19674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37398 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19674)

(assert (=> b!612429 (= lt!280369 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280370 (select (arr!17945 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!612429 e!351029))

(declare-fun res!394085 () Bool)

(assert (=> b!612429 (=> (not res!394085) (not e!351029))))

(assert (=> b!612429 (= res!394085 (arrayContainsKey!0 lt!280370 (select (arr!17945 a!2986) j!136) j!136))))

(declare-fun res!394091 () Bool)

(assert (=> start!55914 (=> (not res!394091) (not e!351018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55914 (= res!394091 (validMask!0 mask!3053))))

(assert (=> start!55914 e!351018))

(assert (=> start!55914 true))

(declare-fun array_inv!13828 (array!37398) Bool)

(assert (=> start!55914 (array_inv!13828 a!2986)))

(declare-fun b!612430 () Bool)

(declare-fun Unit!19678 () Unit!19674)

(assert (=> b!612430 (= e!351031 Unit!19678)))

(declare-fun b!612431 () Bool)

(assert (=> b!612431 (= e!351028 e!351032)))

(declare-fun res!394094 () Bool)

(assert (=> b!612431 (=> res!394094 e!351032)))

(assert (=> b!612431 (= res!394094 (or (not (= (select (arr!17945 a!2986) j!136) lt!280374)) (not (= (select (arr!17945 a!2986) j!136) lt!280368)) (bvsge j!136 index!984)))))

(declare-fun b!612432 () Bool)

(declare-fun res!394093 () Bool)

(assert (=> b!612432 (=> (not res!394093) (not e!351018))))

(assert (=> b!612432 (= res!394093 (validKeyInArray!0 k0!1786))))

(declare-fun b!612433 () Bool)

(declare-fun Unit!19679 () Unit!19674)

(assert (=> b!612433 (= e!351025 Unit!19679)))

(declare-fun lt!280367 () Unit!19674)

(assert (=> b!612433 (= lt!280367 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280370 (select (arr!17945 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612433 (arrayContainsKey!0 lt!280370 (select (arr!17945 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280377 () Unit!19674)

(assert (=> b!612433 (= lt!280377 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12022))))

(assert (=> b!612433 (arrayNoDuplicates!0 lt!280370 #b00000000000000000000000000000000 Nil!12022)))

(declare-fun lt!280371 () Unit!19674)

(assert (=> b!612433 (= lt!280371 (lemmaNoDuplicateFromThenFromBigger!0 lt!280370 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612433 (arrayNoDuplicates!0 lt!280370 j!136 Nil!12022)))

(declare-fun lt!280379 () Unit!19674)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37398 (_ BitVec 64) (_ BitVec 32) List!12025) Unit!19674)

(assert (=> b!612433 (= lt!280379 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280370 (select (arr!17945 a!2986) j!136) j!136 Nil!12022))))

(assert (=> b!612433 false))

(declare-fun b!612434 () Bool)

(assert (=> b!612434 (= e!351030 (= lt!280375 lt!280364))))

(declare-fun b!612435 () Bool)

(declare-fun res!394092 () Bool)

(assert (=> b!612435 (=> (not res!394092) (not e!351018))))

(assert (=> b!612435 (= res!394092 (and (= (size!18310 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18310 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18310 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612436 () Bool)

(assert (=> b!612436 (= e!351023 e!351027)))

(declare-fun res!394099 () Bool)

(assert (=> b!612436 (=> (not res!394099) (not e!351027))))

(assert (=> b!612436 (= res!394099 (= (select (store (arr!17945 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612436 (= lt!280370 (array!37399 (store (arr!17945 a!2986) i!1108 k0!1786) (size!18310 a!2986)))))

(assert (= (and start!55914 res!394091) b!612435))

(assert (= (and b!612435 res!394092) b!612427))

(assert (= (and b!612427 res!394089) b!612432))

(assert (= (and b!612432 res!394093) b!612421))

(assert (= (and b!612421 res!394098) b!612428))

(assert (= (and b!612428 res!394095) b!612418))

(assert (= (and b!612418 res!394081) b!612414))

(assert (= (and b!612414 res!394084) b!612426))

(assert (= (and b!612426 res!394100) b!612436))

(assert (= (and b!612436 res!394099) b!612416))

(assert (= (and b!612416 res!394079) b!612422))

(assert (= (and b!612422 res!394087) b!612434))

(assert (= (and b!612422 c!69534) b!612411))

(assert (= (and b!612422 (not c!69534)) b!612430))

(assert (= (and b!612422 (not res!394096)) b!612413))

(assert (= (and b!612413 res!394080) b!612431))

(assert (= (and b!612431 (not res!394094)) b!612419))

(assert (= (and b!612419 res!394090) b!612417))

(assert (= (and b!612413 (not res!394086)) b!612415))

(assert (= (and b!612415 c!69533) b!612433))

(assert (= (and b!612415 (not c!69533)) b!612412))

(assert (= (and b!612415 (not res!394082)) b!612429))

(assert (= (and b!612429 res!394085) b!612420))

(assert (= (and b!612429 (not res!394083)) b!612424))

(assert (= (and b!612424 (not res!394097)) b!612423))

(assert (= (and b!612423 (not res!394088)) b!612425))

(declare-fun m!588235 () Bool)

(assert (=> b!612431 m!588235))

(declare-fun m!588237 () Bool)

(assert (=> b!612432 m!588237))

(assert (=> b!612433 m!588235))

(declare-fun m!588239 () Bool)

(assert (=> b!612433 m!588239))

(assert (=> b!612433 m!588235))

(assert (=> b!612433 m!588235))

(declare-fun m!588241 () Bool)

(assert (=> b!612433 m!588241))

(declare-fun m!588243 () Bool)

(assert (=> b!612433 m!588243))

(declare-fun m!588245 () Bool)

(assert (=> b!612433 m!588245))

(assert (=> b!612433 m!588235))

(declare-fun m!588247 () Bool)

(assert (=> b!612433 m!588247))

(declare-fun m!588249 () Bool)

(assert (=> b!612433 m!588249))

(declare-fun m!588251 () Bool)

(assert (=> b!612433 m!588251))

(assert (=> b!612413 m!588235))

(declare-fun m!588253 () Bool)

(assert (=> b!612413 m!588253))

(declare-fun m!588255 () Bool)

(assert (=> b!612413 m!588255))

(assert (=> b!612427 m!588235))

(assert (=> b!612427 m!588235))

(declare-fun m!588257 () Bool)

(assert (=> b!612427 m!588257))

(assert (=> b!612420 m!588235))

(assert (=> b!612420 m!588235))

(declare-fun m!588259 () Bool)

(assert (=> b!612420 m!588259))

(assert (=> b!612436 m!588253))

(declare-fun m!588261 () Bool)

(assert (=> b!612436 m!588261))

(declare-fun m!588263 () Bool)

(assert (=> start!55914 m!588263))

(declare-fun m!588265 () Bool)

(assert (=> start!55914 m!588265))

(declare-fun m!588267 () Bool)

(assert (=> b!612424 m!588267))

(declare-fun m!588269 () Bool)

(assert (=> b!612421 m!588269))

(declare-fun m!588271 () Bool)

(assert (=> b!612425 m!588271))

(declare-fun m!588273 () Bool)

(assert (=> b!612422 m!588273))

(declare-fun m!588275 () Bool)

(assert (=> b!612422 m!588275))

(assert (=> b!612422 m!588235))

(assert (=> b!612422 m!588253))

(declare-fun m!588277 () Bool)

(assert (=> b!612422 m!588277))

(declare-fun m!588279 () Bool)

(assert (=> b!612422 m!588279))

(assert (=> b!612422 m!588235))

(declare-fun m!588281 () Bool)

(assert (=> b!612422 m!588281))

(declare-fun m!588283 () Bool)

(assert (=> b!612422 m!588283))

(assert (=> b!612417 m!588235))

(assert (=> b!612417 m!588235))

(assert (=> b!612417 m!588259))

(declare-fun m!588285 () Bool)

(assert (=> b!612426 m!588285))

(declare-fun m!588287 () Bool)

(assert (=> b!612414 m!588287))

(declare-fun m!588289 () Bool)

(assert (=> b!612423 m!588289))

(declare-fun m!588291 () Bool)

(assert (=> b!612428 m!588291))

(assert (=> b!612429 m!588235))

(declare-fun m!588293 () Bool)

(assert (=> b!612429 m!588293))

(assert (=> b!612429 m!588235))

(declare-fun m!588295 () Bool)

(assert (=> b!612429 m!588295))

(assert (=> b!612429 m!588235))

(assert (=> b!612429 m!588235))

(declare-fun m!588297 () Bool)

(assert (=> b!612429 m!588297))

(assert (=> b!612429 m!588249))

(assert (=> b!612429 m!588251))

(declare-fun m!588299 () Bool)

(assert (=> b!612429 m!588299))

(declare-fun m!588301 () Bool)

(assert (=> b!612429 m!588301))

(assert (=> b!612419 m!588235))

(assert (=> b!612419 m!588235))

(assert (=> b!612419 m!588297))

(declare-fun m!588303 () Bool)

(assert (=> b!612418 m!588303))

(declare-fun m!588305 () Bool)

(assert (=> b!612416 m!588305))

(assert (=> b!612416 m!588235))

(assert (=> b!612416 m!588235))

(declare-fun m!588307 () Bool)

(assert (=> b!612416 m!588307))

(check-sat (not b!612424) (not b!612429) (not b!612417) (not b!612416) (not b!612418) (not b!612428) (not b!612420) (not b!612425) (not b!612427) (not b!612423) (not b!612414) (not b!612421) (not b!612432) (not start!55914) (not b!612422) (not b!612433) (not b!612419))
(check-sat)
