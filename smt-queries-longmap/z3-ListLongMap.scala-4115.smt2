; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56190 () Bool)

(assert start!56190)

(declare-fun b!622353 () Bool)

(declare-datatypes ((Unit!20888 0))(
  ( (Unit!20889) )
))
(declare-fun e!356966 () Unit!20888)

(declare-fun Unit!20890 () Unit!20888)

(assert (=> b!622353 (= e!356966 Unit!20890)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!356973 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37660 0))(
  ( (array!37661 (arr!18076 (Array (_ BitVec 32) (_ BitVec 64))) (size!18440 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37660)

(declare-fun b!622354 () Bool)

(declare-fun lt!288336 () array!37660)

(declare-fun arrayContainsKey!0 (array!37660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622354 (= e!356973 (arrayContainsKey!0 lt!288336 (select (arr!18076 a!2986) j!136) index!984))))

(declare-fun b!622355 () Bool)

(assert (=> b!622355 false))

(declare-fun lt!288329 () Unit!20888)

(declare-datatypes ((List!12117 0))(
  ( (Nil!12114) (Cons!12113 (h!13158 (_ BitVec 64)) (t!18345 List!12117)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37660 (_ BitVec 64) (_ BitVec 32) List!12117) Unit!20888)

(assert (=> b!622355 (= lt!288329 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288336 (select (arr!18076 a!2986) j!136) j!136 Nil!12114))))

(declare-fun arrayNoDuplicates!0 (array!37660 (_ BitVec 32) List!12117) Bool)

(assert (=> b!622355 (arrayNoDuplicates!0 lt!288336 j!136 Nil!12114)))

(declare-fun lt!288335 () Unit!20888)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37660 (_ BitVec 32) (_ BitVec 32)) Unit!20888)

(assert (=> b!622355 (= lt!288335 (lemmaNoDuplicateFromThenFromBigger!0 lt!288336 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622355 (arrayNoDuplicates!0 lt!288336 #b00000000000000000000000000000000 Nil!12114)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!288331 () Unit!20888)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12117) Unit!20888)

(assert (=> b!622355 (= lt!288331 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12114))))

(assert (=> b!622355 (arrayContainsKey!0 lt!288336 (select (arr!18076 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288318 () Unit!20888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20888)

(assert (=> b!622355 (= lt!288318 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288336 (select (arr!18076 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356969 () Unit!20888)

(declare-fun Unit!20891 () Unit!20888)

(assert (=> b!622355 (= e!356969 Unit!20891)))

(declare-fun b!622356 () Bool)

(declare-fun e!356964 () Bool)

(declare-datatypes ((SeekEntryResult!6516 0))(
  ( (MissingZero!6516 (index!28348 (_ BitVec 32))) (Found!6516 (index!28349 (_ BitVec 32))) (Intermediate!6516 (undefined!7328 Bool) (index!28350 (_ BitVec 32)) (x!57116 (_ BitVec 32))) (Undefined!6516) (MissingVacant!6516 (index!28351 (_ BitVec 32))) )
))
(declare-fun lt!288325 () SeekEntryResult!6516)

(declare-fun lt!288337 () SeekEntryResult!6516)

(assert (=> b!622356 (= e!356964 (= lt!288325 lt!288337))))

(declare-fun b!622357 () Bool)

(declare-fun e!356967 () Unit!20888)

(declare-fun Unit!20892 () Unit!20888)

(assert (=> b!622357 (= e!356967 Unit!20892)))

(assert (=> b!622357 false))

(declare-fun b!622358 () Bool)

(declare-fun e!356975 () Bool)

(declare-fun e!356963 () Bool)

(assert (=> b!622358 (= e!356975 e!356963)))

(declare-fun res!401083 () Bool)

(assert (=> b!622358 (=> (not res!401083) (not e!356963))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!622358 (= res!401083 (= (select (store (arr!18076 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622358 (= lt!288336 (array!37661 (store (arr!18076 a!2986) i!1108 k0!1786) (size!18440 a!2986)))))

(declare-fun b!622359 () Bool)

(declare-fun Unit!20893 () Unit!20888)

(assert (=> b!622359 (= e!356969 Unit!20893)))

(declare-fun b!622360 () Bool)

(declare-fun res!401089 () Bool)

(assert (=> b!622360 (= res!401089 (bvsge j!136 index!984))))

(declare-fun e!356976 () Bool)

(assert (=> b!622360 (=> res!401089 e!356976)))

(declare-fun e!356971 () Bool)

(assert (=> b!622360 (= e!356971 e!356976)))

(declare-fun b!622361 () Bool)

(declare-fun res!401085 () Bool)

(declare-fun e!356968 () Bool)

(assert (=> b!622361 (=> (not res!401085) (not e!356968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622361 (= res!401085 (validKeyInArray!0 (select (arr!18076 a!2986) j!136)))))

(declare-fun b!622362 () Bool)

(declare-fun res!401075 () Bool)

(assert (=> b!622362 (=> (not res!401075) (not e!356975))))

(assert (=> b!622362 (= res!401075 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12114))))

(declare-fun b!622363 () Bool)

(declare-fun res!401082 () Bool)

(assert (=> b!622363 (=> (not res!401082) (not e!356968))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!622363 (= res!401082 (and (= (size!18440 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18440 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18440 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622364 () Bool)

(declare-fun Unit!20894 () Unit!20888)

(assert (=> b!622364 (= e!356966 Unit!20894)))

(declare-fun res!401077 () Bool)

(assert (=> b!622364 (= res!401077 (= (select (store (arr!18076 a!2986) i!1108 k0!1786) index!984) (select (arr!18076 a!2986) j!136)))))

(assert (=> b!622364 (=> (not res!401077) (not e!356971))))

(assert (=> b!622364 e!356971))

(declare-fun c!71008 () Bool)

(assert (=> b!622364 (= c!71008 (bvslt j!136 index!984))))

(declare-fun lt!288332 () Unit!20888)

(assert (=> b!622364 (= lt!288332 e!356969)))

(declare-fun c!71009 () Bool)

(assert (=> b!622364 (= c!71009 (bvslt index!984 j!136))))

(declare-fun lt!288333 () Unit!20888)

(declare-fun e!356965 () Unit!20888)

(assert (=> b!622364 (= lt!288333 e!356965)))

(assert (=> b!622364 false))

(declare-fun b!622365 () Bool)

(declare-fun Unit!20895 () Unit!20888)

(assert (=> b!622365 (= e!356967 Unit!20895)))

(declare-fun b!622366 () Bool)

(declare-fun res!401076 () Bool)

(assert (=> b!622366 (=> (not res!401076) (not e!356968))))

(assert (=> b!622366 (= res!401076 (validKeyInArray!0 k0!1786))))

(declare-fun b!622368 () Bool)

(declare-fun res!401078 () Bool)

(assert (=> b!622368 (= res!401078 (arrayContainsKey!0 lt!288336 (select (arr!18076 a!2986) j!136) j!136))))

(assert (=> b!622368 (=> (not res!401078) (not e!356973))))

(assert (=> b!622368 (= e!356976 e!356973)))

(declare-fun b!622369 () Bool)

(assert (=> b!622369 false))

(declare-fun lt!288319 () Unit!20888)

(assert (=> b!622369 (= lt!288319 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288336 (select (arr!18076 a!2986) j!136) index!984 Nil!12114))))

(assert (=> b!622369 (arrayNoDuplicates!0 lt!288336 index!984 Nil!12114)))

(declare-fun lt!288324 () Unit!20888)

(assert (=> b!622369 (= lt!288324 (lemmaNoDuplicateFromThenFromBigger!0 lt!288336 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622369 (arrayNoDuplicates!0 lt!288336 #b00000000000000000000000000000000 Nil!12114)))

(declare-fun lt!288323 () Unit!20888)

(assert (=> b!622369 (= lt!288323 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12114))))

(assert (=> b!622369 (arrayContainsKey!0 lt!288336 (select (arr!18076 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288330 () Unit!20888)

(assert (=> b!622369 (= lt!288330 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288336 (select (arr!18076 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356974 () Bool)

(assert (=> b!622369 e!356974))

(declare-fun res!401084 () Bool)

(assert (=> b!622369 (=> (not res!401084) (not e!356974))))

(assert (=> b!622369 (= res!401084 (arrayContainsKey!0 lt!288336 (select (arr!18076 a!2986) j!136) j!136))))

(declare-fun Unit!20896 () Unit!20888)

(assert (=> b!622369 (= e!356965 Unit!20896)))

(declare-fun b!622370 () Bool)

(assert (=> b!622370 (= e!356974 (arrayContainsKey!0 lt!288336 (select (arr!18076 a!2986) j!136) index!984))))

(declare-fun b!622371 () Bool)

(assert (=> b!622371 (= e!356968 e!356975)))

(declare-fun res!401080 () Bool)

(assert (=> b!622371 (=> (not res!401080) (not e!356975))))

(declare-fun lt!288328 () SeekEntryResult!6516)

(assert (=> b!622371 (= res!401080 (or (= lt!288328 (MissingZero!6516 i!1108)) (= lt!288328 (MissingVacant!6516 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37660 (_ BitVec 32)) SeekEntryResult!6516)

(assert (=> b!622371 (= lt!288328 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622372 () Bool)

(declare-fun Unit!20897 () Unit!20888)

(assert (=> b!622372 (= e!356965 Unit!20897)))

(declare-fun b!622373 () Bool)

(declare-fun res!401090 () Bool)

(assert (=> b!622373 (=> (not res!401090) (not e!356975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37660 (_ BitVec 32)) Bool)

(assert (=> b!622373 (= res!401090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622374 () Bool)

(declare-fun res!401086 () Bool)

(assert (=> b!622374 (=> (not res!401086) (not e!356968))))

(assert (=> b!622374 (= res!401086 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622375 () Bool)

(declare-fun e!356972 () Bool)

(assert (=> b!622375 (= e!356963 e!356972)))

(declare-fun res!401081 () Bool)

(assert (=> b!622375 (=> (not res!401081) (not e!356972))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622375 (= res!401081 (and (= lt!288325 (Found!6516 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18076 a!2986) index!984) (select (arr!18076 a!2986) j!136))) (not (= (select (arr!18076 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37660 (_ BitVec 32)) SeekEntryResult!6516)

(assert (=> b!622375 (= lt!288325 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18076 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622376 () Bool)

(assert (=> b!622376 (= e!356972 (not true))))

(declare-fun lt!288334 () Unit!20888)

(assert (=> b!622376 (= lt!288334 e!356966)))

(declare-fun c!71007 () Bool)

(declare-fun lt!288320 () SeekEntryResult!6516)

(assert (=> b!622376 (= c!71007 (= lt!288320 (Found!6516 index!984)))))

(declare-fun lt!288322 () Unit!20888)

(assert (=> b!622376 (= lt!288322 e!356967)))

(declare-fun c!71006 () Bool)

(assert (=> b!622376 (= c!71006 (= lt!288320 Undefined!6516))))

(declare-fun lt!288321 () (_ BitVec 64))

(assert (=> b!622376 (= lt!288320 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288321 lt!288336 mask!3053))))

(assert (=> b!622376 e!356964))

(declare-fun res!401088 () Bool)

(assert (=> b!622376 (=> (not res!401088) (not e!356964))))

(declare-fun lt!288327 () (_ BitVec 32))

(assert (=> b!622376 (= res!401088 (= lt!288337 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288327 vacantSpotIndex!68 lt!288321 lt!288336 mask!3053)))))

(assert (=> b!622376 (= lt!288337 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288327 vacantSpotIndex!68 (select (arr!18076 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622376 (= lt!288321 (select (store (arr!18076 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288326 () Unit!20888)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37660 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20888)

(assert (=> b!622376 (= lt!288326 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288327 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622376 (= lt!288327 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622367 () Bool)

(declare-fun res!401087 () Bool)

(assert (=> b!622367 (=> (not res!401087) (not e!356975))))

(assert (=> b!622367 (= res!401087 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18076 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!401079 () Bool)

(assert (=> start!56190 (=> (not res!401079) (not e!356968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56190 (= res!401079 (validMask!0 mask!3053))))

(assert (=> start!56190 e!356968))

(assert (=> start!56190 true))

(declare-fun array_inv!13872 (array!37660) Bool)

(assert (=> start!56190 (array_inv!13872 a!2986)))

(assert (= (and start!56190 res!401079) b!622363))

(assert (= (and b!622363 res!401082) b!622361))

(assert (= (and b!622361 res!401085) b!622366))

(assert (= (and b!622366 res!401076) b!622374))

(assert (= (and b!622374 res!401086) b!622371))

(assert (= (and b!622371 res!401080) b!622373))

(assert (= (and b!622373 res!401090) b!622362))

(assert (= (and b!622362 res!401075) b!622367))

(assert (= (and b!622367 res!401087) b!622358))

(assert (= (and b!622358 res!401083) b!622375))

(assert (= (and b!622375 res!401081) b!622376))

(assert (= (and b!622376 res!401088) b!622356))

(assert (= (and b!622376 c!71006) b!622357))

(assert (= (and b!622376 (not c!71006)) b!622365))

(assert (= (and b!622376 c!71007) b!622364))

(assert (= (and b!622376 (not c!71007)) b!622353))

(assert (= (and b!622364 res!401077) b!622360))

(assert (= (and b!622360 (not res!401089)) b!622368))

(assert (= (and b!622368 res!401078) b!622354))

(assert (= (and b!622364 c!71008) b!622355))

(assert (= (and b!622364 (not c!71008)) b!622359))

(assert (= (and b!622364 c!71009) b!622369))

(assert (= (and b!622364 (not c!71009)) b!622372))

(assert (= (and b!622369 res!401084) b!622370))

(declare-fun m!598221 () Bool)

(assert (=> b!622369 m!598221))

(declare-fun m!598223 () Bool)

(assert (=> b!622369 m!598223))

(assert (=> b!622369 m!598221))

(declare-fun m!598225 () Bool)

(assert (=> b!622369 m!598225))

(declare-fun m!598227 () Bool)

(assert (=> b!622369 m!598227))

(declare-fun m!598229 () Bool)

(assert (=> b!622369 m!598229))

(assert (=> b!622369 m!598221))

(declare-fun m!598231 () Bool)

(assert (=> b!622369 m!598231))

(assert (=> b!622369 m!598221))

(declare-fun m!598233 () Bool)

(assert (=> b!622369 m!598233))

(assert (=> b!622369 m!598221))

(declare-fun m!598235 () Bool)

(assert (=> b!622369 m!598235))

(declare-fun m!598237 () Bool)

(assert (=> b!622369 m!598237))

(assert (=> b!622355 m!598221))

(assert (=> b!622355 m!598221))

(declare-fun m!598239 () Bool)

(assert (=> b!622355 m!598239))

(assert (=> b!622355 m!598229))

(declare-fun m!598241 () Bool)

(assert (=> b!622355 m!598241))

(declare-fun m!598243 () Bool)

(assert (=> b!622355 m!598243))

(assert (=> b!622355 m!598221))

(declare-fun m!598245 () Bool)

(assert (=> b!622355 m!598245))

(assert (=> b!622355 m!598221))

(declare-fun m!598247 () Bool)

(assert (=> b!622355 m!598247))

(assert (=> b!622355 m!598237))

(assert (=> b!622370 m!598221))

(assert (=> b!622370 m!598221))

(declare-fun m!598249 () Bool)

(assert (=> b!622370 m!598249))

(declare-fun m!598251 () Bool)

(assert (=> b!622374 m!598251))

(declare-fun m!598253 () Bool)

(assert (=> b!622375 m!598253))

(assert (=> b!622375 m!598221))

(assert (=> b!622375 m!598221))

(declare-fun m!598255 () Bool)

(assert (=> b!622375 m!598255))

(assert (=> b!622354 m!598221))

(assert (=> b!622354 m!598221))

(assert (=> b!622354 m!598249))

(declare-fun m!598257 () Bool)

(assert (=> b!622358 m!598257))

(declare-fun m!598259 () Bool)

(assert (=> b!622358 m!598259))

(declare-fun m!598261 () Bool)

(assert (=> b!622362 m!598261))

(declare-fun m!598263 () Bool)

(assert (=> b!622371 m!598263))

(assert (=> b!622361 m!598221))

(assert (=> b!622361 m!598221))

(declare-fun m!598265 () Bool)

(assert (=> b!622361 m!598265))

(declare-fun m!598267 () Bool)

(assert (=> b!622366 m!598267))

(declare-fun m!598269 () Bool)

(assert (=> start!56190 m!598269))

(declare-fun m!598271 () Bool)

(assert (=> start!56190 m!598271))

(declare-fun m!598273 () Bool)

(assert (=> b!622367 m!598273))

(declare-fun m!598275 () Bool)

(assert (=> b!622373 m!598275))

(assert (=> b!622364 m!598257))

(declare-fun m!598277 () Bool)

(assert (=> b!622364 m!598277))

(assert (=> b!622364 m!598221))

(assert (=> b!622368 m!598221))

(assert (=> b!622368 m!598221))

(assert (=> b!622368 m!598233))

(declare-fun m!598279 () Bool)

(assert (=> b!622376 m!598279))

(declare-fun m!598281 () Bool)

(assert (=> b!622376 m!598281))

(assert (=> b!622376 m!598221))

(assert (=> b!622376 m!598257))

(declare-fun m!598283 () Bool)

(assert (=> b!622376 m!598283))

(declare-fun m!598285 () Bool)

(assert (=> b!622376 m!598285))

(declare-fun m!598287 () Bool)

(assert (=> b!622376 m!598287))

(assert (=> b!622376 m!598221))

(declare-fun m!598289 () Bool)

(assert (=> b!622376 m!598289))

(check-sat (not b!622355) (not b!622354) (not start!56190) (not b!622376) (not b!622371) (not b!622361) (not b!622366) (not b!622375) (not b!622373) (not b!622374) (not b!622369) (not b!622370) (not b!622368) (not b!622362))
(check-sat)
