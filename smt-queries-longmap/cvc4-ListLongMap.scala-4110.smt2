; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56162 () Bool)

(assert start!56162)

(declare-fun b!621345 () Bool)

(declare-datatypes ((Unit!20748 0))(
  ( (Unit!20749) )
))
(declare-fun e!356376 () Unit!20748)

(declare-fun Unit!20750 () Unit!20748)

(assert (=> b!621345 (= e!356376 Unit!20750)))

(assert (=> b!621345 false))

(declare-fun b!621346 () Bool)

(declare-fun e!356387 () Bool)

(declare-fun e!356383 () Bool)

(assert (=> b!621346 (= e!356387 e!356383)))

(declare-fun res!400416 () Bool)

(assert (=> b!621346 (=> (not res!400416) (not e!356383))))

(declare-datatypes ((SeekEntryResult!6502 0))(
  ( (MissingZero!6502 (index!28292 (_ BitVec 32))) (Found!6502 (index!28293 (_ BitVec 32))) (Intermediate!6502 (undefined!7314 Bool) (index!28294 (_ BitVec 32)) (x!57062 (_ BitVec 32))) (Undefined!6502) (MissingVacant!6502 (index!28295 (_ BitVec 32))) )
))
(declare-fun lt!287481 () SeekEntryResult!6502)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!621346 (= res!400416 (or (= lt!287481 (MissingZero!6502 i!1108)) (= lt!287481 (MissingVacant!6502 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37632 0))(
  ( (array!37633 (arr!18062 (Array (_ BitVec 32) (_ BitVec 64))) (size!18426 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37632)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37632 (_ BitVec 32)) SeekEntryResult!6502)

(assert (=> b!621346 (= lt!287481 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!400403 () Bool)

(assert (=> start!56162 (=> (not res!400403) (not e!356387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56162 (= res!400403 (validMask!0 mask!3053))))

(assert (=> start!56162 e!356387))

(assert (=> start!56162 true))

(declare-fun array_inv!13858 (array!37632) Bool)

(assert (=> start!56162 (array_inv!13858 a!2986)))

(declare-fun b!621347 () Bool)

(declare-fun res!400408 () Bool)

(assert (=> b!621347 (=> (not res!400408) (not e!356387))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!621347 (= res!400408 (and (= (size!18426 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18426 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18426 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621348 () Bool)

(declare-fun res!400411 () Bool)

(assert (=> b!621348 (=> (not res!400411) (not e!356383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37632 (_ BitVec 32)) Bool)

(assert (=> b!621348 (= res!400411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621349 () Bool)

(declare-fun res!400406 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621349 (= res!400406 (bvsge j!136 index!984))))

(declare-fun e!356384 () Bool)

(assert (=> b!621349 (=> res!400406 e!356384)))

(declare-fun e!356375 () Bool)

(assert (=> b!621349 (= e!356375 e!356384)))

(declare-fun b!621350 () Bool)

(declare-fun e!356377 () Unit!20748)

(declare-fun Unit!20751 () Unit!20748)

(assert (=> b!621350 (= e!356377 Unit!20751)))

(declare-fun res!400418 () Bool)

(assert (=> b!621350 (= res!400418 (= (select (store (arr!18062 a!2986) i!1108 k!1786) index!984) (select (arr!18062 a!2986) j!136)))))

(assert (=> b!621350 (=> (not res!400418) (not e!356375))))

(assert (=> b!621350 e!356375))

(declare-fun c!70839 () Bool)

(assert (=> b!621350 (= c!70839 (bvslt j!136 index!984))))

(declare-fun lt!287494 () Unit!20748)

(declare-fun e!356381 () Unit!20748)

(assert (=> b!621350 (= lt!287494 e!356381)))

(declare-fun c!70841 () Bool)

(assert (=> b!621350 (= c!70841 (bvslt index!984 j!136))))

(declare-fun lt!287492 () Unit!20748)

(declare-fun e!356379 () Unit!20748)

(assert (=> b!621350 (= lt!287492 e!356379)))

(assert (=> b!621350 false))

(declare-fun b!621351 () Bool)

(declare-fun Unit!20752 () Unit!20748)

(assert (=> b!621351 (= e!356376 Unit!20752)))

(declare-fun b!621352 () Bool)

(declare-fun Unit!20753 () Unit!20748)

(assert (=> b!621352 (= e!356377 Unit!20753)))

(declare-fun b!621353 () Bool)

(declare-fun res!400409 () Bool)

(declare-fun lt!287478 () array!37632)

(declare-fun arrayContainsKey!0 (array!37632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621353 (= res!400409 (arrayContainsKey!0 lt!287478 (select (arr!18062 a!2986) j!136) j!136))))

(declare-fun e!356388 () Bool)

(assert (=> b!621353 (=> (not res!400409) (not e!356388))))

(assert (=> b!621353 (= e!356384 e!356388)))

(declare-fun b!621354 () Bool)

(declare-fun res!400412 () Bool)

(assert (=> b!621354 (=> (not res!400412) (not e!356387))))

(assert (=> b!621354 (= res!400412 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621355 () Bool)

(declare-fun e!356382 () Bool)

(declare-fun lt!287495 () SeekEntryResult!6502)

(declare-fun lt!287487 () SeekEntryResult!6502)

(assert (=> b!621355 (= e!356382 (= lt!287495 lt!287487))))

(declare-fun b!621356 () Bool)

(assert (=> b!621356 (= e!356388 (arrayContainsKey!0 lt!287478 (select (arr!18062 a!2986) j!136) index!984))))

(declare-fun b!621357 () Bool)

(declare-fun e!356380 () Bool)

(declare-fun e!356385 () Bool)

(assert (=> b!621357 (= e!356380 e!356385)))

(declare-fun res!400405 () Bool)

(assert (=> b!621357 (=> (not res!400405) (not e!356385))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621357 (= res!400405 (and (= lt!287495 (Found!6502 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18062 a!2986) index!984) (select (arr!18062 a!2986) j!136))) (not (= (select (arr!18062 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37632 (_ BitVec 32)) SeekEntryResult!6502)

(assert (=> b!621357 (= lt!287495 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18062 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621358 () Bool)

(declare-fun e!356386 () Bool)

(assert (=> b!621358 (= e!356386 (arrayContainsKey!0 lt!287478 (select (arr!18062 a!2986) j!136) index!984))))

(declare-fun b!621359 () Bool)

(declare-fun Unit!20754 () Unit!20748)

(assert (=> b!621359 (= e!356379 Unit!20754)))

(declare-fun b!621360 () Bool)

(assert (=> b!621360 (= e!356385 (not true))))

(declare-fun lt!287489 () Unit!20748)

(assert (=> b!621360 (= lt!287489 e!356377)))

(declare-fun c!70840 () Bool)

(declare-fun lt!287493 () SeekEntryResult!6502)

(assert (=> b!621360 (= c!70840 (= lt!287493 (Found!6502 index!984)))))

(declare-fun lt!287482 () Unit!20748)

(assert (=> b!621360 (= lt!287482 e!356376)))

(declare-fun c!70838 () Bool)

(assert (=> b!621360 (= c!70838 (= lt!287493 Undefined!6502))))

(declare-fun lt!287479 () (_ BitVec 64))

(assert (=> b!621360 (= lt!287493 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287479 lt!287478 mask!3053))))

(assert (=> b!621360 e!356382))

(declare-fun res!400415 () Bool)

(assert (=> b!621360 (=> (not res!400415) (not e!356382))))

(declare-fun lt!287491 () (_ BitVec 32))

(assert (=> b!621360 (= res!400415 (= lt!287487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287491 vacantSpotIndex!68 lt!287479 lt!287478 mask!3053)))))

(assert (=> b!621360 (= lt!287487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287491 vacantSpotIndex!68 (select (arr!18062 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621360 (= lt!287479 (select (store (arr!18062 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287485 () Unit!20748)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37632 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20748)

(assert (=> b!621360 (= lt!287485 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287491 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621360 (= lt!287491 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621361 () Bool)

(assert (=> b!621361 false))

(declare-fun lt!287486 () Unit!20748)

(declare-datatypes ((List!12103 0))(
  ( (Nil!12100) (Cons!12099 (h!13144 (_ BitVec 64)) (t!18331 List!12103)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37632 (_ BitVec 64) (_ BitVec 32) List!12103) Unit!20748)

(assert (=> b!621361 (= lt!287486 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287478 (select (arr!18062 a!2986) j!136) index!984 Nil!12100))))

(declare-fun arrayNoDuplicates!0 (array!37632 (_ BitVec 32) List!12103) Bool)

(assert (=> b!621361 (arrayNoDuplicates!0 lt!287478 index!984 Nil!12100)))

(declare-fun lt!287497 () Unit!20748)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37632 (_ BitVec 32) (_ BitVec 32)) Unit!20748)

(assert (=> b!621361 (= lt!287497 (lemmaNoDuplicateFromThenFromBigger!0 lt!287478 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621361 (arrayNoDuplicates!0 lt!287478 #b00000000000000000000000000000000 Nil!12100)))

(declare-fun lt!287484 () Unit!20748)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12103) Unit!20748)

(assert (=> b!621361 (= lt!287484 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12100))))

(assert (=> b!621361 (arrayContainsKey!0 lt!287478 (select (arr!18062 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287483 () Unit!20748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20748)

(assert (=> b!621361 (= lt!287483 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287478 (select (arr!18062 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621361 e!356386))

(declare-fun res!400410 () Bool)

(assert (=> b!621361 (=> (not res!400410) (not e!356386))))

(assert (=> b!621361 (= res!400410 (arrayContainsKey!0 lt!287478 (select (arr!18062 a!2986) j!136) j!136))))

(declare-fun Unit!20755 () Unit!20748)

(assert (=> b!621361 (= e!356379 Unit!20755)))

(declare-fun b!621362 () Bool)

(assert (=> b!621362 false))

(declare-fun lt!287490 () Unit!20748)

(assert (=> b!621362 (= lt!287490 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287478 (select (arr!18062 a!2986) j!136) j!136 Nil!12100))))

(assert (=> b!621362 (arrayNoDuplicates!0 lt!287478 j!136 Nil!12100)))

(declare-fun lt!287480 () Unit!20748)

(assert (=> b!621362 (= lt!287480 (lemmaNoDuplicateFromThenFromBigger!0 lt!287478 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621362 (arrayNoDuplicates!0 lt!287478 #b00000000000000000000000000000000 Nil!12100)))

(declare-fun lt!287496 () Unit!20748)

(assert (=> b!621362 (= lt!287496 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12100))))

(assert (=> b!621362 (arrayContainsKey!0 lt!287478 (select (arr!18062 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287488 () Unit!20748)

(assert (=> b!621362 (= lt!287488 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287478 (select (arr!18062 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20756 () Unit!20748)

(assert (=> b!621362 (= e!356381 Unit!20756)))

(declare-fun b!621363 () Bool)

(declare-fun res!400404 () Bool)

(assert (=> b!621363 (=> (not res!400404) (not e!356383))))

(assert (=> b!621363 (= res!400404 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18062 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621364 () Bool)

(assert (=> b!621364 (= e!356383 e!356380)))

(declare-fun res!400414 () Bool)

(assert (=> b!621364 (=> (not res!400414) (not e!356380))))

(assert (=> b!621364 (= res!400414 (= (select (store (arr!18062 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621364 (= lt!287478 (array!37633 (store (arr!18062 a!2986) i!1108 k!1786) (size!18426 a!2986)))))

(declare-fun b!621365 () Bool)

(declare-fun res!400417 () Bool)

(assert (=> b!621365 (=> (not res!400417) (not e!356383))))

(assert (=> b!621365 (= res!400417 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12100))))

(declare-fun b!621366 () Bool)

(declare-fun res!400407 () Bool)

(assert (=> b!621366 (=> (not res!400407) (not e!356387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621366 (= res!400407 (validKeyInArray!0 k!1786))))

(declare-fun b!621367 () Bool)

(declare-fun Unit!20757 () Unit!20748)

(assert (=> b!621367 (= e!356381 Unit!20757)))

(declare-fun b!621368 () Bool)

(declare-fun res!400413 () Bool)

(assert (=> b!621368 (=> (not res!400413) (not e!356387))))

(assert (=> b!621368 (= res!400413 (validKeyInArray!0 (select (arr!18062 a!2986) j!136)))))

(assert (= (and start!56162 res!400403) b!621347))

(assert (= (and b!621347 res!400408) b!621368))

(assert (= (and b!621368 res!400413) b!621366))

(assert (= (and b!621366 res!400407) b!621354))

(assert (= (and b!621354 res!400412) b!621346))

(assert (= (and b!621346 res!400416) b!621348))

(assert (= (and b!621348 res!400411) b!621365))

(assert (= (and b!621365 res!400417) b!621363))

(assert (= (and b!621363 res!400404) b!621364))

(assert (= (and b!621364 res!400414) b!621357))

(assert (= (and b!621357 res!400405) b!621360))

(assert (= (and b!621360 res!400415) b!621355))

(assert (= (and b!621360 c!70838) b!621345))

(assert (= (and b!621360 (not c!70838)) b!621351))

(assert (= (and b!621360 c!70840) b!621350))

(assert (= (and b!621360 (not c!70840)) b!621352))

(assert (= (and b!621350 res!400418) b!621349))

(assert (= (and b!621349 (not res!400406)) b!621353))

(assert (= (and b!621353 res!400409) b!621356))

(assert (= (and b!621350 c!70839) b!621362))

(assert (= (and b!621350 (not c!70839)) b!621367))

(assert (= (and b!621350 c!70841) b!621361))

(assert (= (and b!621350 (not c!70841)) b!621359))

(assert (= (and b!621361 res!400410) b!621358))

(declare-fun m!597241 () Bool)

(assert (=> b!621357 m!597241))

(declare-fun m!597243 () Bool)

(assert (=> b!621357 m!597243))

(assert (=> b!621357 m!597243))

(declare-fun m!597245 () Bool)

(assert (=> b!621357 m!597245))

(assert (=> b!621362 m!597243))

(declare-fun m!597247 () Bool)

(assert (=> b!621362 m!597247))

(assert (=> b!621362 m!597243))

(declare-fun m!597249 () Bool)

(assert (=> b!621362 m!597249))

(declare-fun m!597251 () Bool)

(assert (=> b!621362 m!597251))

(declare-fun m!597253 () Bool)

(assert (=> b!621362 m!597253))

(declare-fun m!597255 () Bool)

(assert (=> b!621362 m!597255))

(declare-fun m!597257 () Bool)

(assert (=> b!621362 m!597257))

(assert (=> b!621362 m!597243))

(assert (=> b!621362 m!597243))

(declare-fun m!597259 () Bool)

(assert (=> b!621362 m!597259))

(declare-fun m!597261 () Bool)

(assert (=> b!621360 m!597261))

(declare-fun m!597263 () Bool)

(assert (=> b!621360 m!597263))

(declare-fun m!597265 () Bool)

(assert (=> b!621360 m!597265))

(declare-fun m!597267 () Bool)

(assert (=> b!621360 m!597267))

(assert (=> b!621360 m!597243))

(declare-fun m!597269 () Bool)

(assert (=> b!621360 m!597269))

(assert (=> b!621360 m!597243))

(declare-fun m!597271 () Bool)

(assert (=> b!621360 m!597271))

(declare-fun m!597273 () Bool)

(assert (=> b!621360 m!597273))

(declare-fun m!597275 () Bool)

(assert (=> b!621354 m!597275))

(assert (=> b!621353 m!597243))

(assert (=> b!621353 m!597243))

(declare-fun m!597277 () Bool)

(assert (=> b!621353 m!597277))

(declare-fun m!597279 () Bool)

(assert (=> b!621348 m!597279))

(assert (=> b!621358 m!597243))

(assert (=> b!621358 m!597243))

(declare-fun m!597281 () Bool)

(assert (=> b!621358 m!597281))

(declare-fun m!597283 () Bool)

(assert (=> b!621366 m!597283))

(assert (=> b!621361 m!597243))

(declare-fun m!597285 () Bool)

(assert (=> b!621361 m!597285))

(assert (=> b!621361 m!597243))

(assert (=> b!621361 m!597277))

(declare-fun m!597287 () Bool)

(assert (=> b!621361 m!597287))

(assert (=> b!621361 m!597253))

(assert (=> b!621361 m!597243))

(declare-fun m!597289 () Bool)

(assert (=> b!621361 m!597289))

(declare-fun m!597291 () Bool)

(assert (=> b!621361 m!597291))

(assert (=> b!621361 m!597257))

(assert (=> b!621361 m!597243))

(assert (=> b!621361 m!597243))

(declare-fun m!597293 () Bool)

(assert (=> b!621361 m!597293))

(declare-fun m!597295 () Bool)

(assert (=> start!56162 m!597295))

(declare-fun m!597297 () Bool)

(assert (=> start!56162 m!597297))

(assert (=> b!621350 m!597271))

(declare-fun m!597299 () Bool)

(assert (=> b!621350 m!597299))

(assert (=> b!621350 m!597243))

(declare-fun m!597301 () Bool)

(assert (=> b!621365 m!597301))

(assert (=> b!621364 m!597271))

(declare-fun m!597303 () Bool)

(assert (=> b!621364 m!597303))

(declare-fun m!597305 () Bool)

(assert (=> b!621346 m!597305))

(declare-fun m!597307 () Bool)

(assert (=> b!621363 m!597307))

(assert (=> b!621368 m!597243))

(assert (=> b!621368 m!597243))

(declare-fun m!597309 () Bool)

(assert (=> b!621368 m!597309))

(assert (=> b!621356 m!597243))

(assert (=> b!621356 m!597243))

(assert (=> b!621356 m!597281))

(push 1)

