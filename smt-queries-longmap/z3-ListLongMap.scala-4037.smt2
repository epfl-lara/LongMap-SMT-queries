; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55014 () Bool)

(assert start!55014)

(declare-fun b!602267 () Bool)

(declare-fun res!386729 () Bool)

(declare-fun e!344434 () Bool)

(assert (=> b!602267 (=> (not res!386729) (not e!344434))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37168 0))(
  ( (array!37169 (arr!17842 (Array (_ BitVec 32) (_ BitVec 64))) (size!18206 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37168)

(assert (=> b!602267 (= res!386729 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17842 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602268 () Bool)

(declare-fun res!386730 () Bool)

(declare-fun e!344445 () Bool)

(assert (=> b!602268 (=> (not res!386730) (not e!344445))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602268 (= res!386730 (validKeyInArray!0 (select (arr!17842 a!2986) j!136)))))

(declare-fun b!602269 () Bool)

(declare-fun res!386733 () Bool)

(assert (=> b!602269 (=> (not res!386733) (not e!344445))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!602269 (= res!386733 (validKeyInArray!0 k0!1786))))

(declare-fun b!602270 () Bool)

(declare-fun res!386738 () Bool)

(assert (=> b!602270 (=> (not res!386738) (not e!344445))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602270 (= res!386738 (and (= (size!18206 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18206 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18206 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602271 () Bool)

(declare-fun e!344432 () Bool)

(declare-fun e!344439 () Bool)

(assert (=> b!602271 (= e!344432 (not e!344439))))

(declare-fun res!386721 () Bool)

(assert (=> b!602271 (=> res!386721 e!344439)))

(declare-datatypes ((SeekEntryResult!6282 0))(
  ( (MissingZero!6282 (index!27388 (_ BitVec 32))) (Found!6282 (index!27389 (_ BitVec 32))) (Intermediate!6282 (undefined!7094 Bool) (index!27390 (_ BitVec 32)) (x!56186 (_ BitVec 32))) (Undefined!6282) (MissingVacant!6282 (index!27391 (_ BitVec 32))) )
))
(declare-fun lt!274289 () SeekEntryResult!6282)

(assert (=> b!602271 (= res!386721 (not (= lt!274289 (Found!6282 index!984))))))

(declare-datatypes ((Unit!19072 0))(
  ( (Unit!19073) )
))
(declare-fun lt!274300 () Unit!19072)

(declare-fun e!344442 () Unit!19072)

(assert (=> b!602271 (= lt!274300 e!344442)))

(declare-fun c!68140 () Bool)

(assert (=> b!602271 (= c!68140 (= lt!274289 Undefined!6282))))

(declare-fun lt!274297 () array!37168)

(declare-fun lt!274303 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37168 (_ BitVec 32)) SeekEntryResult!6282)

(assert (=> b!602271 (= lt!274289 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274303 lt!274297 mask!3053))))

(declare-fun e!344443 () Bool)

(assert (=> b!602271 e!344443))

(declare-fun res!386731 () Bool)

(assert (=> b!602271 (=> (not res!386731) (not e!344443))))

(declare-fun lt!274295 () (_ BitVec 32))

(declare-fun lt!274290 () SeekEntryResult!6282)

(assert (=> b!602271 (= res!386731 (= lt!274290 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274295 vacantSpotIndex!68 lt!274303 lt!274297 mask!3053)))))

(assert (=> b!602271 (= lt!274290 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274295 vacantSpotIndex!68 (select (arr!17842 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602271 (= lt!274303 (select (store (arr!17842 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274293 () Unit!19072)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37168 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19072)

(assert (=> b!602271 (= lt!274293 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274295 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602271 (= lt!274295 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602272 () Bool)

(assert (=> b!602272 (= e!344445 e!344434)))

(declare-fun res!386724 () Bool)

(assert (=> b!602272 (=> (not res!386724) (not e!344434))))

(declare-fun lt!274302 () SeekEntryResult!6282)

(assert (=> b!602272 (= res!386724 (or (= lt!274302 (MissingZero!6282 i!1108)) (= lt!274302 (MissingVacant!6282 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37168 (_ BitVec 32)) SeekEntryResult!6282)

(assert (=> b!602272 (= lt!274302 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602273 () Bool)

(declare-fun e!344441 () Bool)

(assert (=> b!602273 (= e!344441 e!344432)))

(declare-fun res!386725 () Bool)

(assert (=> b!602273 (=> (not res!386725) (not e!344432))))

(declare-fun lt!274298 () SeekEntryResult!6282)

(assert (=> b!602273 (= res!386725 (and (= lt!274298 (Found!6282 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17842 a!2986) index!984) (select (arr!17842 a!2986) j!136))) (not (= (select (arr!17842 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602273 (= lt!274298 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17842 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602274 () Bool)

(declare-fun res!386732 () Bool)

(assert (=> b!602274 (=> (not res!386732) (not e!344434))))

(declare-datatypes ((List!11883 0))(
  ( (Nil!11880) (Cons!11879 (h!12924 (_ BitVec 64)) (t!18111 List!11883)) )
))
(declare-fun arrayNoDuplicates!0 (array!37168 (_ BitVec 32) List!11883) Bool)

(assert (=> b!602274 (= res!386732 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11880))))

(declare-fun res!386735 () Bool)

(assert (=> start!55014 (=> (not res!386735) (not e!344445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55014 (= res!386735 (validMask!0 mask!3053))))

(assert (=> start!55014 e!344445))

(assert (=> start!55014 true))

(declare-fun array_inv!13638 (array!37168) Bool)

(assert (=> start!55014 (array_inv!13638 a!2986)))

(declare-fun b!602275 () Bool)

(assert (=> b!602275 (= e!344434 e!344441)))

(declare-fun res!386736 () Bool)

(assert (=> b!602275 (=> (not res!386736) (not e!344441))))

(assert (=> b!602275 (= res!386736 (= (select (store (arr!17842 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602275 (= lt!274297 (array!37169 (store (arr!17842 a!2986) i!1108 k0!1786) (size!18206 a!2986)))))

(declare-fun b!602276 () Bool)

(declare-fun e!344435 () Bool)

(assert (=> b!602276 (= e!344435 (bvslt index!984 (size!18206 a!2986)))))

(declare-fun arrayContainsKey!0 (array!37168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602276 (arrayContainsKey!0 lt!274297 (select (arr!17842 a!2986) j!136) j!136)))

(declare-fun b!602277 () Bool)

(assert (=> b!602277 (= e!344443 (= lt!274298 lt!274290))))

(declare-fun b!602278 () Bool)

(declare-fun e!344433 () Bool)

(assert (=> b!602278 (= e!344433 (arrayContainsKey!0 lt!274297 (select (arr!17842 a!2986) j!136) index!984))))

(declare-fun b!602279 () Bool)

(declare-fun res!386734 () Bool)

(assert (=> b!602279 (=> (not res!386734) (not e!344445))))

(assert (=> b!602279 (= res!386734 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602280 () Bool)

(declare-fun res!386728 () Bool)

(assert (=> b!602280 (=> (not res!386728) (not e!344434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37168 (_ BitVec 32)) Bool)

(assert (=> b!602280 (= res!386728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602281 () Bool)

(declare-fun e!344444 () Bool)

(assert (=> b!602281 (= e!344444 e!344435)))

(declare-fun res!386737 () Bool)

(assert (=> b!602281 (=> res!386737 e!344435)))

(assert (=> b!602281 (= res!386737 (bvsge index!984 j!136))))

(declare-fun lt!274296 () Unit!19072)

(declare-fun e!344436 () Unit!19072)

(assert (=> b!602281 (= lt!274296 e!344436)))

(declare-fun c!68141 () Bool)

(assert (=> b!602281 (= c!68141 (bvslt j!136 index!984))))

(declare-fun b!602282 () Bool)

(declare-fun Unit!19074 () Unit!19072)

(assert (=> b!602282 (= e!344442 Unit!19074)))

(assert (=> b!602282 false))

(declare-fun b!602283 () Bool)

(declare-fun Unit!19075 () Unit!19072)

(assert (=> b!602283 (= e!344442 Unit!19075)))

(declare-fun b!602284 () Bool)

(declare-fun e!344437 () Bool)

(assert (=> b!602284 (= e!344437 e!344433)))

(declare-fun res!386723 () Bool)

(assert (=> b!602284 (=> (not res!386723) (not e!344433))))

(assert (=> b!602284 (= res!386723 (arrayContainsKey!0 lt!274297 (select (arr!17842 a!2986) j!136) j!136))))

(declare-fun b!602285 () Bool)

(assert (=> b!602285 (= e!344439 e!344444)))

(declare-fun res!386722 () Bool)

(assert (=> b!602285 (=> res!386722 e!344444)))

(declare-fun lt!274301 () (_ BitVec 64))

(assert (=> b!602285 (= res!386722 (or (not (= (select (arr!17842 a!2986) j!136) lt!274303)) (not (= (select (arr!17842 a!2986) j!136) lt!274301))))))

(declare-fun e!344438 () Bool)

(assert (=> b!602285 e!344438))

(declare-fun res!386726 () Bool)

(assert (=> b!602285 (=> (not res!386726) (not e!344438))))

(assert (=> b!602285 (= res!386726 (= lt!274301 (select (arr!17842 a!2986) j!136)))))

(assert (=> b!602285 (= lt!274301 (select (store (arr!17842 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602286 () Bool)

(declare-fun Unit!19076 () Unit!19072)

(assert (=> b!602286 (= e!344436 Unit!19076)))

(declare-fun lt!274291 () Unit!19072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37168 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19072)

(assert (=> b!602286 (= lt!274291 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274297 (select (arr!17842 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602286 (arrayContainsKey!0 lt!274297 (select (arr!17842 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274294 () Unit!19072)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37168 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11883) Unit!19072)

(assert (=> b!602286 (= lt!274294 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11880))))

(assert (=> b!602286 (arrayNoDuplicates!0 lt!274297 #b00000000000000000000000000000000 Nil!11880)))

(declare-fun lt!274299 () Unit!19072)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37168 (_ BitVec 32) (_ BitVec 32)) Unit!19072)

(assert (=> b!602286 (= lt!274299 (lemmaNoDuplicateFromThenFromBigger!0 lt!274297 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602286 (arrayNoDuplicates!0 lt!274297 j!136 Nil!11880)))

(declare-fun lt!274292 () Unit!19072)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37168 (_ BitVec 64) (_ BitVec 32) List!11883) Unit!19072)

(assert (=> b!602286 (= lt!274292 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274297 (select (arr!17842 a!2986) j!136) j!136 Nil!11880))))

(assert (=> b!602286 false))

(declare-fun b!602287 () Bool)

(declare-fun Unit!19077 () Unit!19072)

(assert (=> b!602287 (= e!344436 Unit!19077)))

(declare-fun b!602288 () Bool)

(assert (=> b!602288 (= e!344438 e!344437)))

(declare-fun res!386727 () Bool)

(assert (=> b!602288 (=> res!386727 e!344437)))

(assert (=> b!602288 (= res!386727 (or (not (= (select (arr!17842 a!2986) j!136) lt!274303)) (not (= (select (arr!17842 a!2986) j!136) lt!274301)) (bvsge j!136 index!984)))))

(assert (= (and start!55014 res!386735) b!602270))

(assert (= (and b!602270 res!386738) b!602268))

(assert (= (and b!602268 res!386730) b!602269))

(assert (= (and b!602269 res!386733) b!602279))

(assert (= (and b!602279 res!386734) b!602272))

(assert (= (and b!602272 res!386724) b!602280))

(assert (= (and b!602280 res!386728) b!602274))

(assert (= (and b!602274 res!386732) b!602267))

(assert (= (and b!602267 res!386729) b!602275))

(assert (= (and b!602275 res!386736) b!602273))

(assert (= (and b!602273 res!386725) b!602271))

(assert (= (and b!602271 res!386731) b!602277))

(assert (= (and b!602271 c!68140) b!602282))

(assert (= (and b!602271 (not c!68140)) b!602283))

(assert (= (and b!602271 (not res!386721)) b!602285))

(assert (= (and b!602285 res!386726) b!602288))

(assert (= (and b!602288 (not res!386727)) b!602284))

(assert (= (and b!602284 res!386723) b!602278))

(assert (= (and b!602285 (not res!386722)) b!602281))

(assert (= (and b!602281 c!68141) b!602286))

(assert (= (and b!602281 (not c!68141)) b!602287))

(assert (= (and b!602281 (not res!386737)) b!602276))

(declare-fun m!579401 () Bool)

(assert (=> b!602284 m!579401))

(assert (=> b!602284 m!579401))

(declare-fun m!579403 () Bool)

(assert (=> b!602284 m!579403))

(assert (=> b!602285 m!579401))

(declare-fun m!579405 () Bool)

(assert (=> b!602285 m!579405))

(declare-fun m!579407 () Bool)

(assert (=> b!602285 m!579407))

(declare-fun m!579409 () Bool)

(assert (=> b!602280 m!579409))

(declare-fun m!579411 () Bool)

(assert (=> b!602269 m!579411))

(declare-fun m!579413 () Bool)

(assert (=> b!602279 m!579413))

(declare-fun m!579415 () Bool)

(assert (=> b!602267 m!579415))

(assert (=> b!602275 m!579405))

(declare-fun m!579417 () Bool)

(assert (=> b!602275 m!579417))

(declare-fun m!579419 () Bool)

(assert (=> start!55014 m!579419))

(declare-fun m!579421 () Bool)

(assert (=> start!55014 m!579421))

(assert (=> b!602276 m!579401))

(assert (=> b!602276 m!579401))

(assert (=> b!602276 m!579403))

(assert (=> b!602288 m!579401))

(assert (=> b!602278 m!579401))

(assert (=> b!602278 m!579401))

(declare-fun m!579423 () Bool)

(assert (=> b!602278 m!579423))

(declare-fun m!579425 () Bool)

(assert (=> b!602271 m!579425))

(assert (=> b!602271 m!579401))

(declare-fun m!579427 () Bool)

(assert (=> b!602271 m!579427))

(assert (=> b!602271 m!579405))

(declare-fun m!579429 () Bool)

(assert (=> b!602271 m!579429))

(assert (=> b!602271 m!579401))

(declare-fun m!579431 () Bool)

(assert (=> b!602271 m!579431))

(declare-fun m!579433 () Bool)

(assert (=> b!602271 m!579433))

(declare-fun m!579435 () Bool)

(assert (=> b!602271 m!579435))

(assert (=> b!602268 m!579401))

(assert (=> b!602268 m!579401))

(declare-fun m!579437 () Bool)

(assert (=> b!602268 m!579437))

(declare-fun m!579439 () Bool)

(assert (=> b!602273 m!579439))

(assert (=> b!602273 m!579401))

(assert (=> b!602273 m!579401))

(declare-fun m!579441 () Bool)

(assert (=> b!602273 m!579441))

(declare-fun m!579443 () Bool)

(assert (=> b!602272 m!579443))

(declare-fun m!579445 () Bool)

(assert (=> b!602274 m!579445))

(assert (=> b!602286 m!579401))

(assert (=> b!602286 m!579401))

(declare-fun m!579447 () Bool)

(assert (=> b!602286 m!579447))

(declare-fun m!579449 () Bool)

(assert (=> b!602286 m!579449))

(assert (=> b!602286 m!579401))

(declare-fun m!579451 () Bool)

(assert (=> b!602286 m!579451))

(assert (=> b!602286 m!579401))

(declare-fun m!579453 () Bool)

(assert (=> b!602286 m!579453))

(declare-fun m!579455 () Bool)

(assert (=> b!602286 m!579455))

(declare-fun m!579457 () Bool)

(assert (=> b!602286 m!579457))

(declare-fun m!579459 () Bool)

(assert (=> b!602286 m!579459))

(check-sat (not b!602286) (not b!602276) (not b!602271) (not b!602269) (not b!602279) (not start!55014) (not b!602272) (not b!602274) (not b!602280) (not b!602278) (not b!602268) (not b!602284) (not b!602273))
(check-sat)
