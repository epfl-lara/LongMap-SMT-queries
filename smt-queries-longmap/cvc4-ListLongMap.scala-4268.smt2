; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59352 () Bool)

(assert start!59352)

(declare-fun b!655245 () Bool)

(declare-datatypes ((Unit!22514 0))(
  ( (Unit!22515) )
))
(declare-fun e!376303 () Unit!22514)

(declare-fun Unit!22516 () Unit!22514)

(assert (=> b!655245 (= e!376303 Unit!22516)))

(declare-fun b!655246 () Bool)

(declare-fun e!376308 () Unit!22514)

(declare-fun Unit!22517 () Unit!22514)

(assert (=> b!655246 (= e!376308 Unit!22517)))

(declare-fun b!655247 () Bool)

(declare-fun res!425051 () Bool)

(declare-fun e!376299 () Bool)

(assert (=> b!655247 (=> (not res!425051) (not e!376299))))

(declare-datatypes ((array!38672 0))(
  ( (array!38673 (arr!18536 (Array (_ BitVec 32) (_ BitVec 64))) (size!18900 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38672)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655247 (= res!425051 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!305531 () array!38672)

(declare-fun b!655248 () Bool)

(declare-fun res!425059 () Bool)

(assert (=> b!655248 (= res!425059 (arrayContainsKey!0 lt!305531 (select (arr!18536 a!2986) j!136) j!136))))

(declare-fun e!376301 () Bool)

(assert (=> b!655248 (=> (not res!425059) (not e!376301))))

(declare-fun e!376296 () Bool)

(assert (=> b!655248 (= e!376296 e!376301)))

(declare-fun b!655249 () Bool)

(declare-fun e!376305 () Unit!22514)

(declare-fun Unit!22518 () Unit!22514)

(assert (=> b!655249 (= e!376305 Unit!22518)))

(declare-fun b!655250 () Bool)

(declare-fun e!376302 () Unit!22514)

(declare-fun Unit!22519 () Unit!22514)

(assert (=> b!655250 (= e!376302 Unit!22519)))

(declare-fun b!655252 () Bool)

(declare-fun e!376300 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!655252 (= e!376300 (arrayContainsKey!0 lt!305531 (select (arr!18536 a!2986) j!136) index!984))))

(declare-fun b!655253 () Bool)

(declare-fun e!376304 () Bool)

(assert (=> b!655253 (= e!376299 e!376304)))

(declare-fun res!425045 () Bool)

(assert (=> b!655253 (=> (not res!425045) (not e!376304))))

(declare-datatypes ((SeekEntryResult!6976 0))(
  ( (MissingZero!6976 (index!30263 (_ BitVec 32))) (Found!6976 (index!30264 (_ BitVec 32))) (Intermediate!6976 (undefined!7788 Bool) (index!30265 (_ BitVec 32)) (x!59049 (_ BitVec 32))) (Undefined!6976) (MissingVacant!6976 (index!30266 (_ BitVec 32))) )
))
(declare-fun lt!305538 () SeekEntryResult!6976)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!655253 (= res!425045 (or (= lt!305538 (MissingZero!6976 i!1108)) (= lt!305538 (MissingVacant!6976 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38672 (_ BitVec 32)) SeekEntryResult!6976)

(assert (=> b!655253 (= lt!305538 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655254 () Bool)

(declare-fun res!425053 () Bool)

(assert (=> b!655254 (=> (not res!425053) (not e!376299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655254 (= res!425053 (validKeyInArray!0 k!1786))))

(declare-fun b!655255 () Bool)

(declare-fun e!376295 () Bool)

(declare-fun e!376306 () Bool)

(assert (=> b!655255 (= e!376295 e!376306)))

(declare-fun res!425055 () Bool)

(assert (=> b!655255 (=> (not res!425055) (not e!376306))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!305532 () SeekEntryResult!6976)

(assert (=> b!655255 (= res!425055 (and (= lt!305532 (Found!6976 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18536 a!2986) index!984) (select (arr!18536 a!2986) j!136))) (not (= (select (arr!18536 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38672 (_ BitVec 32)) SeekEntryResult!6976)

(assert (=> b!655255 (= lt!305532 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18536 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655256 () Bool)

(declare-fun e!376307 () Bool)

(declare-fun lt!305526 () SeekEntryResult!6976)

(assert (=> b!655256 (= e!376307 (= lt!305532 lt!305526))))

(declare-fun b!655257 () Bool)

(assert (=> b!655257 (= e!376301 (arrayContainsKey!0 lt!305531 (select (arr!18536 a!2986) j!136) index!984))))

(declare-fun b!655258 () Bool)

(declare-fun res!425056 () Bool)

(assert (=> b!655258 (=> (not res!425056) (not e!376304))))

(declare-datatypes ((List!12577 0))(
  ( (Nil!12574) (Cons!12573 (h!13618 (_ BitVec 64)) (t!18805 List!12577)) )
))
(declare-fun arrayNoDuplicates!0 (array!38672 (_ BitVec 32) List!12577) Bool)

(assert (=> b!655258 (= res!425056 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12574))))

(declare-fun b!655259 () Bool)

(assert (=> b!655259 (= e!376306 (not true))))

(declare-fun lt!305525 () Unit!22514)

(assert (=> b!655259 (= lt!305525 e!376303)))

(declare-fun c!75470 () Bool)

(declare-fun lt!305527 () SeekEntryResult!6976)

(assert (=> b!655259 (= c!75470 (= lt!305527 (Found!6976 index!984)))))

(declare-fun lt!305537 () Unit!22514)

(assert (=> b!655259 (= lt!305537 e!376305)))

(declare-fun c!75469 () Bool)

(assert (=> b!655259 (= c!75469 (= lt!305527 Undefined!6976))))

(declare-fun lt!305541 () (_ BitVec 64))

(assert (=> b!655259 (= lt!305527 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305541 lt!305531 mask!3053))))

(assert (=> b!655259 e!376307))

(declare-fun res!425054 () Bool)

(assert (=> b!655259 (=> (not res!425054) (not e!376307))))

(declare-fun lt!305523 () (_ BitVec 32))

(assert (=> b!655259 (= res!425054 (= lt!305526 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305523 vacantSpotIndex!68 lt!305541 lt!305531 mask!3053)))))

(assert (=> b!655259 (= lt!305526 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305523 vacantSpotIndex!68 (select (arr!18536 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655259 (= lt!305541 (select (store (arr!18536 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305524 () Unit!22514)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38672 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22514)

(assert (=> b!655259 (= lt!305524 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305523 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655259 (= lt!305523 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655260 () Bool)

(declare-fun Unit!22520 () Unit!22514)

(assert (=> b!655260 (= e!376303 Unit!22520)))

(declare-fun res!425049 () Bool)

(assert (=> b!655260 (= res!425049 (= (select (store (arr!18536 a!2986) i!1108 k!1786) index!984) (select (arr!18536 a!2986) j!136)))))

(declare-fun e!376298 () Bool)

(assert (=> b!655260 (=> (not res!425049) (not e!376298))))

(assert (=> b!655260 e!376298))

(declare-fun c!75468 () Bool)

(assert (=> b!655260 (= c!75468 (bvslt j!136 index!984))))

(declare-fun lt!305530 () Unit!22514)

(assert (=> b!655260 (= lt!305530 e!376302)))

(declare-fun c!75467 () Bool)

(assert (=> b!655260 (= c!75467 (bvslt index!984 j!136))))

(declare-fun lt!305535 () Unit!22514)

(assert (=> b!655260 (= lt!305535 e!376308)))

(assert (=> b!655260 false))

(declare-fun b!655261 () Bool)

(declare-fun Unit!22521 () Unit!22514)

(assert (=> b!655261 (= e!376305 Unit!22521)))

(assert (=> b!655261 false))

(declare-fun b!655262 () Bool)

(declare-fun res!425052 () Bool)

(assert (=> b!655262 (=> (not res!425052) (not e!376304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38672 (_ BitVec 32)) Bool)

(assert (=> b!655262 (= res!425052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655251 () Bool)

(assert (=> b!655251 false))

(declare-fun lt!305528 () Unit!22514)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38672 (_ BitVec 64) (_ BitVec 32) List!12577) Unit!22514)

(assert (=> b!655251 (= lt!305528 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305531 (select (arr!18536 a!2986) j!136) index!984 Nil!12574))))

(assert (=> b!655251 (arrayNoDuplicates!0 lt!305531 index!984 Nil!12574)))

(declare-fun lt!305536 () Unit!22514)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38672 (_ BitVec 32) (_ BitVec 32)) Unit!22514)

(assert (=> b!655251 (= lt!305536 (lemmaNoDuplicateFromThenFromBigger!0 lt!305531 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655251 (arrayNoDuplicates!0 lt!305531 #b00000000000000000000000000000000 Nil!12574)))

(declare-fun lt!305539 () Unit!22514)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38672 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12577) Unit!22514)

(assert (=> b!655251 (= lt!305539 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12574))))

(assert (=> b!655251 (arrayContainsKey!0 lt!305531 (select (arr!18536 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305542 () Unit!22514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38672 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22514)

(assert (=> b!655251 (= lt!305542 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305531 (select (arr!18536 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655251 e!376300))

(declare-fun res!425048 () Bool)

(assert (=> b!655251 (=> (not res!425048) (not e!376300))))

(assert (=> b!655251 (= res!425048 (arrayContainsKey!0 lt!305531 (select (arr!18536 a!2986) j!136) j!136))))

(declare-fun Unit!22522 () Unit!22514)

(assert (=> b!655251 (= e!376308 Unit!22522)))

(declare-fun res!425050 () Bool)

(assert (=> start!59352 (=> (not res!425050) (not e!376299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59352 (= res!425050 (validMask!0 mask!3053))))

(assert (=> start!59352 e!376299))

(assert (=> start!59352 true))

(declare-fun array_inv!14332 (array!38672) Bool)

(assert (=> start!59352 (array_inv!14332 a!2986)))

(declare-fun b!655263 () Bool)

(assert (=> b!655263 (= e!376304 e!376295)))

(declare-fun res!425058 () Bool)

(assert (=> b!655263 (=> (not res!425058) (not e!376295))))

(assert (=> b!655263 (= res!425058 (= (select (store (arr!18536 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655263 (= lt!305531 (array!38673 (store (arr!18536 a!2986) i!1108 k!1786) (size!18900 a!2986)))))

(declare-fun b!655264 () Bool)

(assert (=> b!655264 false))

(declare-fun lt!305540 () Unit!22514)

(assert (=> b!655264 (= lt!305540 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305531 (select (arr!18536 a!2986) j!136) j!136 Nil!12574))))

(assert (=> b!655264 (arrayNoDuplicates!0 lt!305531 j!136 Nil!12574)))

(declare-fun lt!305534 () Unit!22514)

(assert (=> b!655264 (= lt!305534 (lemmaNoDuplicateFromThenFromBigger!0 lt!305531 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655264 (arrayNoDuplicates!0 lt!305531 #b00000000000000000000000000000000 Nil!12574)))

(declare-fun lt!305533 () Unit!22514)

(assert (=> b!655264 (= lt!305533 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12574))))

(assert (=> b!655264 (arrayContainsKey!0 lt!305531 (select (arr!18536 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305529 () Unit!22514)

(assert (=> b!655264 (= lt!305529 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305531 (select (arr!18536 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22523 () Unit!22514)

(assert (=> b!655264 (= e!376302 Unit!22523)))

(declare-fun b!655265 () Bool)

(declare-fun res!425047 () Bool)

(assert (=> b!655265 (=> (not res!425047) (not e!376299))))

(assert (=> b!655265 (= res!425047 (and (= (size!18900 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18900 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18900 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655266 () Bool)

(declare-fun res!425057 () Bool)

(assert (=> b!655266 (=> (not res!425057) (not e!376299))))

(assert (=> b!655266 (= res!425057 (validKeyInArray!0 (select (arr!18536 a!2986) j!136)))))

(declare-fun b!655267 () Bool)

(declare-fun res!425046 () Bool)

(assert (=> b!655267 (= res!425046 (bvsge j!136 index!984))))

(assert (=> b!655267 (=> res!425046 e!376296)))

(assert (=> b!655267 (= e!376298 e!376296)))

(declare-fun b!655268 () Bool)

(declare-fun res!425060 () Bool)

(assert (=> b!655268 (=> (not res!425060) (not e!376304))))

(assert (=> b!655268 (= res!425060 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18536 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59352 res!425050) b!655265))

(assert (= (and b!655265 res!425047) b!655266))

(assert (= (and b!655266 res!425057) b!655254))

(assert (= (and b!655254 res!425053) b!655247))

(assert (= (and b!655247 res!425051) b!655253))

(assert (= (and b!655253 res!425045) b!655262))

(assert (= (and b!655262 res!425052) b!655258))

(assert (= (and b!655258 res!425056) b!655268))

(assert (= (and b!655268 res!425060) b!655263))

(assert (= (and b!655263 res!425058) b!655255))

(assert (= (and b!655255 res!425055) b!655259))

(assert (= (and b!655259 res!425054) b!655256))

(assert (= (and b!655259 c!75469) b!655261))

(assert (= (and b!655259 (not c!75469)) b!655249))

(assert (= (and b!655259 c!75470) b!655260))

(assert (= (and b!655259 (not c!75470)) b!655245))

(assert (= (and b!655260 res!425049) b!655267))

(assert (= (and b!655267 (not res!425046)) b!655248))

(assert (= (and b!655248 res!425059) b!655257))

(assert (= (and b!655260 c!75468) b!655264))

(assert (= (and b!655260 (not c!75468)) b!655250))

(assert (= (and b!655260 c!75467) b!655251))

(assert (= (and b!655260 (not c!75467)) b!655246))

(assert (= (and b!655251 res!425048) b!655252))

(declare-fun m!628327 () Bool)

(assert (=> start!59352 m!628327))

(declare-fun m!628329 () Bool)

(assert (=> start!59352 m!628329))

(declare-fun m!628331 () Bool)

(assert (=> b!655259 m!628331))

(declare-fun m!628333 () Bool)

(assert (=> b!655259 m!628333))

(declare-fun m!628335 () Bool)

(assert (=> b!655259 m!628335))

(declare-fun m!628337 () Bool)

(assert (=> b!655259 m!628337))

(declare-fun m!628339 () Bool)

(assert (=> b!655259 m!628339))

(declare-fun m!628341 () Bool)

(assert (=> b!655259 m!628341))

(declare-fun m!628343 () Bool)

(assert (=> b!655259 m!628343))

(assert (=> b!655259 m!628335))

(declare-fun m!628345 () Bool)

(assert (=> b!655259 m!628345))

(declare-fun m!628347 () Bool)

(assert (=> b!655262 m!628347))

(assert (=> b!655260 m!628337))

(declare-fun m!628349 () Bool)

(assert (=> b!655260 m!628349))

(assert (=> b!655260 m!628335))

(assert (=> b!655266 m!628335))

(assert (=> b!655266 m!628335))

(declare-fun m!628351 () Bool)

(assert (=> b!655266 m!628351))

(assert (=> b!655257 m!628335))

(assert (=> b!655257 m!628335))

(declare-fun m!628353 () Bool)

(assert (=> b!655257 m!628353))

(declare-fun m!628355 () Bool)

(assert (=> b!655268 m!628355))

(declare-fun m!628357 () Bool)

(assert (=> b!655255 m!628357))

(assert (=> b!655255 m!628335))

(assert (=> b!655255 m!628335))

(declare-fun m!628359 () Bool)

(assert (=> b!655255 m!628359))

(declare-fun m!628361 () Bool)

(assert (=> b!655254 m!628361))

(declare-fun m!628363 () Bool)

(assert (=> b!655258 m!628363))

(assert (=> b!655252 m!628335))

(assert (=> b!655252 m!628335))

(assert (=> b!655252 m!628353))

(declare-fun m!628365 () Bool)

(assert (=> b!655251 m!628365))

(declare-fun m!628367 () Bool)

(assert (=> b!655251 m!628367))

(assert (=> b!655251 m!628335))

(declare-fun m!628369 () Bool)

(assert (=> b!655251 m!628369))

(assert (=> b!655251 m!628335))

(declare-fun m!628371 () Bool)

(assert (=> b!655251 m!628371))

(declare-fun m!628373 () Bool)

(assert (=> b!655251 m!628373))

(assert (=> b!655251 m!628335))

(declare-fun m!628375 () Bool)

(assert (=> b!655251 m!628375))

(declare-fun m!628377 () Bool)

(assert (=> b!655251 m!628377))

(assert (=> b!655251 m!628335))

(assert (=> b!655251 m!628335))

(declare-fun m!628379 () Bool)

(assert (=> b!655251 m!628379))

(assert (=> b!655264 m!628335))

(declare-fun m!628381 () Bool)

(assert (=> b!655264 m!628381))

(assert (=> b!655264 m!628335))

(declare-fun m!628383 () Bool)

(assert (=> b!655264 m!628383))

(assert (=> b!655264 m!628335))

(declare-fun m!628385 () Bool)

(assert (=> b!655264 m!628385))

(declare-fun m!628387 () Bool)

(assert (=> b!655264 m!628387))

(assert (=> b!655264 m!628335))

(declare-fun m!628389 () Bool)

(assert (=> b!655264 m!628389))

(assert (=> b!655264 m!628373))

(assert (=> b!655264 m!628377))

(declare-fun m!628391 () Bool)

(assert (=> b!655247 m!628391))

(assert (=> b!655263 m!628337))

(declare-fun m!628393 () Bool)

(assert (=> b!655263 m!628393))

(assert (=> b!655248 m!628335))

(assert (=> b!655248 m!628335))

(assert (=> b!655248 m!628375))

(declare-fun m!628395 () Bool)

(assert (=> b!655253 m!628395))

(push 1)

