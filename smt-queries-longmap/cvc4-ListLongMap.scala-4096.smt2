; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56078 () Bool)

(assert start!56078)

(declare-fun b!618248 () Bool)

(declare-datatypes ((Unit!20328 0))(
  ( (Unit!20329) )
))
(declare-fun e!354541 () Unit!20328)

(declare-fun Unit!20330 () Unit!20328)

(assert (=> b!618248 (= e!354541 Unit!20330)))

(declare-fun b!618249 () Bool)

(declare-fun res!398327 () Bool)

(declare-fun e!354538 () Bool)

(assert (=> b!618249 (=> (not res!398327) (not e!354538))))

(declare-datatypes ((array!37548 0))(
  ( (array!37549 (arr!18020 (Array (_ BitVec 32) (_ BitVec 64))) (size!18384 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37548)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618249 (= res!398327 (validKeyInArray!0 (select (arr!18020 a!2986) j!136)))))

(declare-fun res!398328 () Bool)

(assert (=> start!56078 (=> (not res!398328) (not e!354538))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56078 (= res!398328 (validMask!0 mask!3053))))

(assert (=> start!56078 e!354538))

(assert (=> start!56078 true))

(declare-fun array_inv!13816 (array!37548) Bool)

(assert (=> start!56078 (array_inv!13816 a!2986)))

(declare-fun b!618250 () Bool)

(declare-fun res!398315 () Bool)

(declare-fun e!354547 () Bool)

(assert (=> b!618250 (=> (not res!398315) (not e!354547))))

(declare-datatypes ((List!12061 0))(
  ( (Nil!12058) (Cons!12057 (h!13102 (_ BitVec 64)) (t!18289 List!12061)) )
))
(declare-fun arrayNoDuplicates!0 (array!37548 (_ BitVec 32) List!12061) Bool)

(assert (=> b!618250 (= res!398315 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12058))))

(declare-fun b!618251 () Bool)

(declare-fun res!398317 () Bool)

(assert (=> b!618251 (=> (not res!398317) (not e!354538))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618251 (= res!398317 (and (= (size!18384 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18384 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18384 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!284964 () array!37548)

(declare-fun e!354549 () Bool)

(declare-fun b!618252 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618252 (= e!354549 (arrayContainsKey!0 lt!284964 (select (arr!18020 a!2986) j!136) index!984))))

(declare-fun b!618253 () Bool)

(declare-fun e!354542 () Bool)

(declare-fun e!354540 () Bool)

(assert (=> b!618253 (= e!354542 (not e!354540))))

(declare-fun res!398322 () Bool)

(assert (=> b!618253 (=> res!398322 e!354540)))

(declare-datatypes ((SeekEntryResult!6460 0))(
  ( (MissingZero!6460 (index!28124 (_ BitVec 32))) (Found!6460 (index!28125 (_ BitVec 32))) (Intermediate!6460 (undefined!7272 Bool) (index!28126 (_ BitVec 32)) (x!56908 (_ BitVec 32))) (Undefined!6460) (MissingVacant!6460 (index!28127 (_ BitVec 32))) )
))
(declare-fun lt!284976 () SeekEntryResult!6460)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618253 (= res!398322 (not (= lt!284976 (MissingVacant!6460 vacantSpotIndex!68))))))

(declare-fun lt!284975 () Unit!20328)

(declare-fun e!354551 () Unit!20328)

(assert (=> b!618253 (= lt!284975 e!354551)))

(declare-fun c!70337 () Bool)

(assert (=> b!618253 (= c!70337 (= lt!284976 (Found!6460 index!984)))))

(declare-fun lt!284965 () Unit!20328)

(assert (=> b!618253 (= lt!284965 e!354541)))

(declare-fun c!70336 () Bool)

(assert (=> b!618253 (= c!70336 (= lt!284976 Undefined!6460))))

(declare-fun lt!284960 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37548 (_ BitVec 32)) SeekEntryResult!6460)

(assert (=> b!618253 (= lt!284976 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284960 lt!284964 mask!3053))))

(declare-fun e!354546 () Bool)

(assert (=> b!618253 e!354546))

(declare-fun res!398321 () Bool)

(assert (=> b!618253 (=> (not res!398321) (not e!354546))))

(declare-fun lt!284958 () SeekEntryResult!6460)

(declare-fun lt!284959 () (_ BitVec 32))

(assert (=> b!618253 (= res!398321 (= lt!284958 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284959 vacantSpotIndex!68 lt!284960 lt!284964 mask!3053)))))

(assert (=> b!618253 (= lt!284958 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284959 vacantSpotIndex!68 (select (arr!18020 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!618253 (= lt!284960 (select (store (arr!18020 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284969 () Unit!20328)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37548 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20328)

(assert (=> b!618253 (= lt!284969 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284959 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618253 (= lt!284959 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618254 () Bool)

(assert (=> b!618254 (= e!354540 true)))

(assert (=> b!618254 (= (select (store (arr!18020 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618255 () Bool)

(declare-fun e!354550 () Bool)

(assert (=> b!618255 (= e!354550 e!354542)))

(declare-fun res!398318 () Bool)

(assert (=> b!618255 (=> (not res!398318) (not e!354542))))

(declare-fun lt!284962 () SeekEntryResult!6460)

(assert (=> b!618255 (= res!398318 (and (= lt!284962 (Found!6460 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18020 a!2986) index!984) (select (arr!18020 a!2986) j!136))) (not (= (select (arr!18020 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618255 (= lt!284962 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18020 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618256 () Bool)

(declare-fun res!398323 () Bool)

(assert (=> b!618256 (=> (not res!398323) (not e!354547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37548 (_ BitVec 32)) Bool)

(assert (=> b!618256 (= res!398323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618257 () Bool)

(assert (=> b!618257 (= e!354538 e!354547)))

(declare-fun res!398316 () Bool)

(assert (=> b!618257 (=> (not res!398316) (not e!354547))))

(declare-fun lt!284967 () SeekEntryResult!6460)

(assert (=> b!618257 (= res!398316 (or (= lt!284967 (MissingZero!6460 i!1108)) (= lt!284967 (MissingVacant!6460 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37548 (_ BitVec 32)) SeekEntryResult!6460)

(assert (=> b!618257 (= lt!284967 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618258 () Bool)

(declare-fun res!398319 () Bool)

(assert (=> b!618258 (= res!398319 (bvsge j!136 index!984))))

(declare-fun e!354544 () Bool)

(assert (=> b!618258 (=> res!398319 e!354544)))

(declare-fun e!354552 () Bool)

(assert (=> b!618258 (= e!354552 e!354544)))

(declare-fun b!618259 () Bool)

(declare-fun Unit!20331 () Unit!20328)

(assert (=> b!618259 (= e!354551 Unit!20331)))

(declare-fun res!398325 () Bool)

(assert (=> b!618259 (= res!398325 (= (select (store (arr!18020 a!2986) i!1108 k!1786) index!984) (select (arr!18020 a!2986) j!136)))))

(assert (=> b!618259 (=> (not res!398325) (not e!354552))))

(assert (=> b!618259 e!354552))

(declare-fun c!70334 () Bool)

(assert (=> b!618259 (= c!70334 (bvslt j!136 index!984))))

(declare-fun lt!284977 () Unit!20328)

(declare-fun e!354543 () Unit!20328)

(assert (=> b!618259 (= lt!284977 e!354543)))

(declare-fun c!70335 () Bool)

(assert (=> b!618259 (= c!70335 (bvslt index!984 j!136))))

(declare-fun lt!284963 () Unit!20328)

(declare-fun e!354548 () Unit!20328)

(assert (=> b!618259 (= lt!284963 e!354548)))

(assert (=> b!618259 false))

(declare-fun b!618260 () Bool)

(declare-fun res!398330 () Bool)

(assert (=> b!618260 (=> (not res!398330) (not e!354538))))

(assert (=> b!618260 (= res!398330 (validKeyInArray!0 k!1786))))

(declare-fun b!618261 () Bool)

(declare-fun Unit!20332 () Unit!20328)

(assert (=> b!618261 (= e!354543 Unit!20332)))

(declare-fun b!618262 () Bool)

(assert (=> b!618262 false))

(declare-fun lt!284971 () Unit!20328)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37548 (_ BitVec 64) (_ BitVec 32) List!12061) Unit!20328)

(assert (=> b!618262 (= lt!284971 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284964 (select (arr!18020 a!2986) j!136) index!984 Nil!12058))))

(assert (=> b!618262 (arrayNoDuplicates!0 lt!284964 index!984 Nil!12058)))

(declare-fun lt!284970 () Unit!20328)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37548 (_ BitVec 32) (_ BitVec 32)) Unit!20328)

(assert (=> b!618262 (= lt!284970 (lemmaNoDuplicateFromThenFromBigger!0 lt!284964 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618262 (arrayNoDuplicates!0 lt!284964 #b00000000000000000000000000000000 Nil!12058)))

(declare-fun lt!284973 () Unit!20328)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12061) Unit!20328)

(assert (=> b!618262 (= lt!284973 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12058))))

(assert (=> b!618262 (arrayContainsKey!0 lt!284964 (select (arr!18020 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284966 () Unit!20328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20328)

(assert (=> b!618262 (= lt!284966 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284964 (select (arr!18020 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618262 e!354549))

(declare-fun res!398324 () Bool)

(assert (=> b!618262 (=> (not res!398324) (not e!354549))))

(assert (=> b!618262 (= res!398324 (arrayContainsKey!0 lt!284964 (select (arr!18020 a!2986) j!136) j!136))))

(declare-fun Unit!20333 () Unit!20328)

(assert (=> b!618262 (= e!354548 Unit!20333)))

(declare-fun b!618263 () Bool)

(declare-fun res!398326 () Bool)

(assert (=> b!618263 (=> (not res!398326) (not e!354547))))

(assert (=> b!618263 (= res!398326 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18020 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618264 () Bool)

(declare-fun Unit!20334 () Unit!20328)

(assert (=> b!618264 (= e!354541 Unit!20334)))

(assert (=> b!618264 false))

(declare-fun b!618265 () Bool)

(declare-fun Unit!20335 () Unit!20328)

(assert (=> b!618265 (= e!354548 Unit!20335)))

(declare-fun b!618266 () Bool)

(declare-fun Unit!20336 () Unit!20328)

(assert (=> b!618266 (= e!354551 Unit!20336)))

(declare-fun b!618267 () Bool)

(declare-fun res!398314 () Bool)

(assert (=> b!618267 (= res!398314 (arrayContainsKey!0 lt!284964 (select (arr!18020 a!2986) j!136) j!136))))

(declare-fun e!354545 () Bool)

(assert (=> b!618267 (=> (not res!398314) (not e!354545))))

(assert (=> b!618267 (= e!354544 e!354545)))

(declare-fun b!618268 () Bool)

(assert (=> b!618268 (= e!354545 (arrayContainsKey!0 lt!284964 (select (arr!18020 a!2986) j!136) index!984))))

(declare-fun b!618269 () Bool)

(declare-fun res!398329 () Bool)

(assert (=> b!618269 (=> (not res!398329) (not e!354538))))

(assert (=> b!618269 (= res!398329 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618270 () Bool)

(assert (=> b!618270 (= e!354546 (= lt!284962 lt!284958))))

(declare-fun b!618271 () Bool)

(assert (=> b!618271 false))

(declare-fun lt!284968 () Unit!20328)

(assert (=> b!618271 (= lt!284968 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284964 (select (arr!18020 a!2986) j!136) j!136 Nil!12058))))

(assert (=> b!618271 (arrayNoDuplicates!0 lt!284964 j!136 Nil!12058)))

(declare-fun lt!284972 () Unit!20328)

(assert (=> b!618271 (= lt!284972 (lemmaNoDuplicateFromThenFromBigger!0 lt!284964 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618271 (arrayNoDuplicates!0 lt!284964 #b00000000000000000000000000000000 Nil!12058)))

(declare-fun lt!284974 () Unit!20328)

(assert (=> b!618271 (= lt!284974 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12058))))

(assert (=> b!618271 (arrayContainsKey!0 lt!284964 (select (arr!18020 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284961 () Unit!20328)

(assert (=> b!618271 (= lt!284961 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284964 (select (arr!18020 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20337 () Unit!20328)

(assert (=> b!618271 (= e!354543 Unit!20337)))

(declare-fun b!618272 () Bool)

(assert (=> b!618272 (= e!354547 e!354550)))

(declare-fun res!398320 () Bool)

(assert (=> b!618272 (=> (not res!398320) (not e!354550))))

(assert (=> b!618272 (= res!398320 (= (select (store (arr!18020 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618272 (= lt!284964 (array!37549 (store (arr!18020 a!2986) i!1108 k!1786) (size!18384 a!2986)))))

(assert (= (and start!56078 res!398328) b!618251))

(assert (= (and b!618251 res!398317) b!618249))

(assert (= (and b!618249 res!398327) b!618260))

(assert (= (and b!618260 res!398330) b!618269))

(assert (= (and b!618269 res!398329) b!618257))

(assert (= (and b!618257 res!398316) b!618256))

(assert (= (and b!618256 res!398323) b!618250))

(assert (= (and b!618250 res!398315) b!618263))

(assert (= (and b!618263 res!398326) b!618272))

(assert (= (and b!618272 res!398320) b!618255))

(assert (= (and b!618255 res!398318) b!618253))

(assert (= (and b!618253 res!398321) b!618270))

(assert (= (and b!618253 c!70336) b!618264))

(assert (= (and b!618253 (not c!70336)) b!618248))

(assert (= (and b!618253 c!70337) b!618259))

(assert (= (and b!618253 (not c!70337)) b!618266))

(assert (= (and b!618259 res!398325) b!618258))

(assert (= (and b!618258 (not res!398319)) b!618267))

(assert (= (and b!618267 res!398314) b!618268))

(assert (= (and b!618259 c!70334) b!618271))

(assert (= (and b!618259 (not c!70334)) b!618261))

(assert (= (and b!618259 c!70335) b!618262))

(assert (= (and b!618259 (not c!70335)) b!618265))

(assert (= (and b!618262 res!398324) b!618252))

(assert (= (and b!618253 (not res!398322)) b!618254))

(declare-fun m!594301 () Bool)

(assert (=> b!618267 m!594301))

(assert (=> b!618267 m!594301))

(declare-fun m!594303 () Bool)

(assert (=> b!618267 m!594303))

(assert (=> b!618249 m!594301))

(assert (=> b!618249 m!594301))

(declare-fun m!594305 () Bool)

(assert (=> b!618249 m!594305))

(declare-fun m!594307 () Bool)

(assert (=> b!618271 m!594307))

(assert (=> b!618271 m!594301))

(declare-fun m!594309 () Bool)

(assert (=> b!618271 m!594309))

(assert (=> b!618271 m!594301))

(declare-fun m!594311 () Bool)

(assert (=> b!618271 m!594311))

(assert (=> b!618271 m!594301))

(declare-fun m!594313 () Bool)

(assert (=> b!618271 m!594313))

(declare-fun m!594315 () Bool)

(assert (=> b!618271 m!594315))

(declare-fun m!594317 () Bool)

(assert (=> b!618271 m!594317))

(assert (=> b!618271 m!594301))

(declare-fun m!594319 () Bool)

(assert (=> b!618271 m!594319))

(declare-fun m!594321 () Bool)

(assert (=> b!618250 m!594321))

(declare-fun m!594323 () Bool)

(assert (=> b!618256 m!594323))

(declare-fun m!594325 () Bool)

(assert (=> b!618259 m!594325))

(declare-fun m!594327 () Bool)

(assert (=> b!618259 m!594327))

(assert (=> b!618259 m!594301))

(assert (=> b!618262 m!594301))

(declare-fun m!594329 () Bool)

(assert (=> b!618262 m!594329))

(assert (=> b!618262 m!594301))

(assert (=> b!618262 m!594303))

(assert (=> b!618262 m!594301))

(assert (=> b!618262 m!594301))

(declare-fun m!594331 () Bool)

(assert (=> b!618262 m!594331))

(declare-fun m!594333 () Bool)

(assert (=> b!618262 m!594333))

(assert (=> b!618262 m!594301))

(declare-fun m!594335 () Bool)

(assert (=> b!618262 m!594335))

(assert (=> b!618262 m!594315))

(assert (=> b!618262 m!594307))

(declare-fun m!594337 () Bool)

(assert (=> b!618262 m!594337))

(declare-fun m!594339 () Bool)

(assert (=> b!618253 m!594339))

(declare-fun m!594341 () Bool)

(assert (=> b!618253 m!594341))

(assert (=> b!618253 m!594301))

(declare-fun m!594343 () Bool)

(assert (=> b!618253 m!594343))

(assert (=> b!618253 m!594301))

(assert (=> b!618253 m!594325))

(declare-fun m!594345 () Bool)

(assert (=> b!618253 m!594345))

(declare-fun m!594347 () Bool)

(assert (=> b!618253 m!594347))

(declare-fun m!594349 () Bool)

(assert (=> b!618253 m!594349))

(declare-fun m!594351 () Bool)

(assert (=> b!618260 m!594351))

(assert (=> b!618252 m!594301))

(assert (=> b!618252 m!594301))

(declare-fun m!594353 () Bool)

(assert (=> b!618252 m!594353))

(assert (=> b!618272 m!594325))

(declare-fun m!594355 () Bool)

(assert (=> b!618272 m!594355))

(declare-fun m!594357 () Bool)

(assert (=> b!618269 m!594357))

(assert (=> b!618268 m!594301))

(assert (=> b!618268 m!594301))

(assert (=> b!618268 m!594353))

(declare-fun m!594359 () Bool)

(assert (=> b!618257 m!594359))

(declare-fun m!594361 () Bool)

(assert (=> b!618255 m!594361))

(assert (=> b!618255 m!594301))

(assert (=> b!618255 m!594301))

(declare-fun m!594363 () Bool)

(assert (=> b!618255 m!594363))

(declare-fun m!594365 () Bool)

(assert (=> b!618263 m!594365))

(assert (=> b!618254 m!594325))

(assert (=> b!618254 m!594327))

(declare-fun m!594367 () Bool)

(assert (=> start!56078 m!594367))

(declare-fun m!594369 () Bool)

(assert (=> start!56078 m!594369))

(push 1)

