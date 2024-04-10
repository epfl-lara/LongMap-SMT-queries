; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56080 () Bool)

(assert start!56080)

(declare-fun b!618323 () Bool)

(declare-fun res!398379 () Bool)

(declare-fun e!354587 () Bool)

(assert (=> b!618323 (=> (not res!398379) (not e!354587))))

(declare-datatypes ((array!37550 0))(
  ( (array!37551 (arr!18021 (Array (_ BitVec 32) (_ BitVec 64))) (size!18385 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37550)

(declare-datatypes ((List!12062 0))(
  ( (Nil!12059) (Cons!12058 (h!13103 (_ BitVec 64)) (t!18290 List!12062)) )
))
(declare-fun arrayNoDuplicates!0 (array!37550 (_ BitVec 32) List!12062) Bool)

(assert (=> b!618323 (= res!398379 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12059))))

(declare-fun b!618324 () Bool)

(declare-fun res!398378 () Bool)

(assert (=> b!618324 (=> (not res!398378) (not e!354587))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!618324 (= res!398378 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18021 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618325 () Bool)

(declare-datatypes ((Unit!20338 0))(
  ( (Unit!20339) )
))
(declare-fun e!354593 () Unit!20338)

(declare-fun Unit!20340 () Unit!20338)

(assert (=> b!618325 (= e!354593 Unit!20340)))

(assert (=> b!618325 false))

(declare-fun b!618326 () Bool)

(declare-fun e!354585 () Unit!20338)

(declare-fun Unit!20341 () Unit!20338)

(assert (=> b!618326 (= e!354585 Unit!20341)))

(declare-fun b!618327 () Bool)

(declare-fun e!354596 () Bool)

(assert (=> b!618327 (= e!354587 e!354596)))

(declare-fun res!398368 () Bool)

(assert (=> b!618327 (=> (not res!398368) (not e!354596))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!618327 (= res!398368 (= (select (store (arr!18021 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!285031 () array!37550)

(assert (=> b!618327 (= lt!285031 (array!37551 (store (arr!18021 a!2986) i!1108 k!1786) (size!18385 a!2986)))))

(declare-fun b!618328 () Bool)

(declare-fun e!354592 () Unit!20338)

(declare-fun Unit!20342 () Unit!20338)

(assert (=> b!618328 (= e!354592 Unit!20342)))

(declare-fun b!618329 () Bool)

(declare-fun res!398373 () Bool)

(declare-fun e!354590 () Bool)

(assert (=> b!618329 (=> (not res!398373) (not e!354590))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!618329 (= res!398373 (and (= (size!18385 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18385 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18385 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618330 () Bool)

(declare-fun res!398367 () Bool)

(assert (=> b!618330 (=> (not res!398367) (not e!354590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618330 (= res!398367 (validKeyInArray!0 k!1786))))

(declare-fun b!618331 () Bool)

(declare-fun e!354586 () Bool)

(declare-datatypes ((SeekEntryResult!6461 0))(
  ( (MissingZero!6461 (index!28128 (_ BitVec 32))) (Found!6461 (index!28129 (_ BitVec 32))) (Intermediate!6461 (undefined!7273 Bool) (index!28130 (_ BitVec 32)) (x!56917 (_ BitVec 32))) (Undefined!6461) (MissingVacant!6461 (index!28131 (_ BitVec 32))) )
))
(declare-fun lt!285021 () SeekEntryResult!6461)

(declare-fun lt!285032 () SeekEntryResult!6461)

(assert (=> b!618331 (= e!354586 (= lt!285021 lt!285032))))

(declare-fun b!618332 () Bool)

(declare-fun e!354583 () Bool)

(assert (=> b!618332 (= e!354596 e!354583)))

(declare-fun res!398377 () Bool)

(assert (=> b!618332 (=> (not res!398377) (not e!354583))))

(assert (=> b!618332 (= res!398377 (and (= lt!285021 (Found!6461 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18021 a!2986) index!984) (select (arr!18021 a!2986) j!136))) (not (= (select (arr!18021 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37550 (_ BitVec 32)) SeekEntryResult!6461)

(assert (=> b!618332 (= lt!285021 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18021 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618334 () Bool)

(assert (=> b!618334 (= e!354590 e!354587)))

(declare-fun res!398366 () Bool)

(assert (=> b!618334 (=> (not res!398366) (not e!354587))))

(declare-fun lt!285026 () SeekEntryResult!6461)

(assert (=> b!618334 (= res!398366 (or (= lt!285026 (MissingZero!6461 i!1108)) (= lt!285026 (MissingVacant!6461 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37550 (_ BitVec 32)) SeekEntryResult!6461)

(assert (=> b!618334 (= lt!285026 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618335 () Bool)

(declare-fun e!354589 () Bool)

(declare-fun arrayContainsKey!0 (array!37550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618335 (= e!354589 (arrayContainsKey!0 lt!285031 (select (arr!18021 a!2986) j!136) index!984))))

(declare-fun b!618336 () Bool)

(declare-fun e!354584 () Bool)

(assert (=> b!618336 (= e!354583 (not e!354584))))

(declare-fun res!398375 () Bool)

(assert (=> b!618336 (=> res!398375 e!354584)))

(declare-fun lt!285035 () SeekEntryResult!6461)

(assert (=> b!618336 (= res!398375 (not (= lt!285035 (MissingVacant!6461 vacantSpotIndex!68))))))

(declare-fun lt!285034 () Unit!20338)

(assert (=> b!618336 (= lt!285034 e!354592)))

(declare-fun c!70347 () Bool)

(assert (=> b!618336 (= c!70347 (= lt!285035 (Found!6461 index!984)))))

(declare-fun lt!285018 () Unit!20338)

(assert (=> b!618336 (= lt!285018 e!354593)))

(declare-fun c!70348 () Bool)

(assert (=> b!618336 (= c!70348 (= lt!285035 Undefined!6461))))

(declare-fun lt!285030 () (_ BitVec 64))

(assert (=> b!618336 (= lt!285035 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285030 lt!285031 mask!3053))))

(assert (=> b!618336 e!354586))

(declare-fun res!398381 () Bool)

(assert (=> b!618336 (=> (not res!398381) (not e!354586))))

(declare-fun lt!285037 () (_ BitVec 32))

(assert (=> b!618336 (= res!398381 (= lt!285032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285037 vacantSpotIndex!68 lt!285030 lt!285031 mask!3053)))))

(assert (=> b!618336 (= lt!285032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285037 vacantSpotIndex!68 (select (arr!18021 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618336 (= lt!285030 (select (store (arr!18021 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285023 () Unit!20338)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37550 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20338)

(assert (=> b!618336 (= lt!285023 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285037 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618336 (= lt!285037 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618337 () Bool)

(declare-fun res!398371 () Bool)

(assert (=> b!618337 (=> (not res!398371) (not e!354590))))

(assert (=> b!618337 (= res!398371 (validKeyInArray!0 (select (arr!18021 a!2986) j!136)))))

(declare-fun b!618338 () Bool)

(declare-fun Unit!20343 () Unit!20338)

(assert (=> b!618338 (= e!354592 Unit!20343)))

(declare-fun res!398376 () Bool)

(assert (=> b!618338 (= res!398376 (= (select (store (arr!18021 a!2986) i!1108 k!1786) index!984) (select (arr!18021 a!2986) j!136)))))

(declare-fun e!354594 () Bool)

(assert (=> b!618338 (=> (not res!398376) (not e!354594))))

(assert (=> b!618338 e!354594))

(declare-fun c!70349 () Bool)

(assert (=> b!618338 (= c!70349 (bvslt j!136 index!984))))

(declare-fun lt!285027 () Unit!20338)

(declare-fun e!354597 () Unit!20338)

(assert (=> b!618338 (= lt!285027 e!354597)))

(declare-fun c!70346 () Bool)

(assert (=> b!618338 (= c!70346 (bvslt index!984 j!136))))

(declare-fun lt!285024 () Unit!20338)

(assert (=> b!618338 (= lt!285024 e!354585)))

(assert (=> b!618338 false))

(declare-fun b!618339 () Bool)

(assert (=> b!618339 (= e!354584 true)))

(assert (=> b!618339 (= (select (store (arr!18021 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618340 () Bool)

(declare-fun e!354595 () Bool)

(assert (=> b!618340 (= e!354595 (arrayContainsKey!0 lt!285031 (select (arr!18021 a!2986) j!136) index!984))))

(declare-fun b!618341 () Bool)

(assert (=> b!618341 false))

(declare-fun lt!285028 () Unit!20338)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37550 (_ BitVec 64) (_ BitVec 32) List!12062) Unit!20338)

(assert (=> b!618341 (= lt!285028 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285031 (select (arr!18021 a!2986) j!136) index!984 Nil!12059))))

(assert (=> b!618341 (arrayNoDuplicates!0 lt!285031 index!984 Nil!12059)))

(declare-fun lt!285022 () Unit!20338)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37550 (_ BitVec 32) (_ BitVec 32)) Unit!20338)

(assert (=> b!618341 (= lt!285022 (lemmaNoDuplicateFromThenFromBigger!0 lt!285031 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618341 (arrayNoDuplicates!0 lt!285031 #b00000000000000000000000000000000 Nil!12059)))

(declare-fun lt!285036 () Unit!20338)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12062) Unit!20338)

(assert (=> b!618341 (= lt!285036 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12059))))

(assert (=> b!618341 (arrayContainsKey!0 lt!285031 (select (arr!18021 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285029 () Unit!20338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20338)

(assert (=> b!618341 (= lt!285029 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285031 (select (arr!18021 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618341 e!354595))

(declare-fun res!398370 () Bool)

(assert (=> b!618341 (=> (not res!398370) (not e!354595))))

(assert (=> b!618341 (= res!398370 (arrayContainsKey!0 lt!285031 (select (arr!18021 a!2986) j!136) j!136))))

(declare-fun Unit!20344 () Unit!20338)

(assert (=> b!618341 (= e!354585 Unit!20344)))

(declare-fun b!618342 () Bool)

(declare-fun res!398374 () Bool)

(assert (=> b!618342 (= res!398374 (bvsge j!136 index!984))))

(declare-fun e!354588 () Bool)

(assert (=> b!618342 (=> res!398374 e!354588)))

(assert (=> b!618342 (= e!354594 e!354588)))

(declare-fun res!398372 () Bool)

(declare-fun b!618343 () Bool)

(assert (=> b!618343 (= res!398372 (arrayContainsKey!0 lt!285031 (select (arr!18021 a!2986) j!136) j!136))))

(assert (=> b!618343 (=> (not res!398372) (not e!354589))))

(assert (=> b!618343 (= e!354588 e!354589)))

(declare-fun b!618344 () Bool)

(declare-fun Unit!20345 () Unit!20338)

(assert (=> b!618344 (= e!354593 Unit!20345)))

(declare-fun b!618345 () Bool)

(declare-fun Unit!20346 () Unit!20338)

(assert (=> b!618345 (= e!354597 Unit!20346)))

(declare-fun b!618346 () Bool)

(declare-fun res!398380 () Bool)

(assert (=> b!618346 (=> (not res!398380) (not e!354587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37550 (_ BitVec 32)) Bool)

(assert (=> b!618346 (= res!398380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618347 () Bool)

(assert (=> b!618347 false))

(declare-fun lt!285025 () Unit!20338)

(assert (=> b!618347 (= lt!285025 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285031 (select (arr!18021 a!2986) j!136) j!136 Nil!12059))))

(assert (=> b!618347 (arrayNoDuplicates!0 lt!285031 j!136 Nil!12059)))

(declare-fun lt!285019 () Unit!20338)

(assert (=> b!618347 (= lt!285019 (lemmaNoDuplicateFromThenFromBigger!0 lt!285031 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618347 (arrayNoDuplicates!0 lt!285031 #b00000000000000000000000000000000 Nil!12059)))

(declare-fun lt!285033 () Unit!20338)

(assert (=> b!618347 (= lt!285033 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12059))))

(assert (=> b!618347 (arrayContainsKey!0 lt!285031 (select (arr!18021 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285020 () Unit!20338)

(assert (=> b!618347 (= lt!285020 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285031 (select (arr!18021 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20347 () Unit!20338)

(assert (=> b!618347 (= e!354597 Unit!20347)))

(declare-fun b!618333 () Bool)

(declare-fun res!398365 () Bool)

(assert (=> b!618333 (=> (not res!398365) (not e!354590))))

(assert (=> b!618333 (= res!398365 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!398369 () Bool)

(assert (=> start!56080 (=> (not res!398369) (not e!354590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56080 (= res!398369 (validMask!0 mask!3053))))

(assert (=> start!56080 e!354590))

(assert (=> start!56080 true))

(declare-fun array_inv!13817 (array!37550) Bool)

(assert (=> start!56080 (array_inv!13817 a!2986)))

(assert (= (and start!56080 res!398369) b!618329))

(assert (= (and b!618329 res!398373) b!618337))

(assert (= (and b!618337 res!398371) b!618330))

(assert (= (and b!618330 res!398367) b!618333))

(assert (= (and b!618333 res!398365) b!618334))

(assert (= (and b!618334 res!398366) b!618346))

(assert (= (and b!618346 res!398380) b!618323))

(assert (= (and b!618323 res!398379) b!618324))

(assert (= (and b!618324 res!398378) b!618327))

(assert (= (and b!618327 res!398368) b!618332))

(assert (= (and b!618332 res!398377) b!618336))

(assert (= (and b!618336 res!398381) b!618331))

(assert (= (and b!618336 c!70348) b!618325))

(assert (= (and b!618336 (not c!70348)) b!618344))

(assert (= (and b!618336 c!70347) b!618338))

(assert (= (and b!618336 (not c!70347)) b!618328))

(assert (= (and b!618338 res!398376) b!618342))

(assert (= (and b!618342 (not res!398374)) b!618343))

(assert (= (and b!618343 res!398372) b!618335))

(assert (= (and b!618338 c!70349) b!618347))

(assert (= (and b!618338 (not c!70349)) b!618345))

(assert (= (and b!618338 c!70346) b!618341))

(assert (= (and b!618338 (not c!70346)) b!618326))

(assert (= (and b!618341 res!398370) b!618340))

(assert (= (and b!618336 (not res!398375)) b!618339))

(declare-fun m!594371 () Bool)

(assert (=> b!618333 m!594371))

(declare-fun m!594373 () Bool)

(assert (=> b!618327 m!594373))

(declare-fun m!594375 () Bool)

(assert (=> b!618327 m!594375))

(declare-fun m!594377 () Bool)

(assert (=> b!618324 m!594377))

(assert (=> b!618339 m!594373))

(declare-fun m!594379 () Bool)

(assert (=> b!618339 m!594379))

(declare-fun m!594381 () Bool)

(assert (=> b!618336 m!594381))

(declare-fun m!594383 () Bool)

(assert (=> b!618336 m!594383))

(assert (=> b!618336 m!594373))

(assert (=> b!618336 m!594383))

(declare-fun m!594385 () Bool)

(assert (=> b!618336 m!594385))

(declare-fun m!594387 () Bool)

(assert (=> b!618336 m!594387))

(declare-fun m!594389 () Bool)

(assert (=> b!618336 m!594389))

(declare-fun m!594391 () Bool)

(assert (=> b!618336 m!594391))

(declare-fun m!594393 () Bool)

(assert (=> b!618336 m!594393))

(declare-fun m!594395 () Bool)

(assert (=> b!618347 m!594395))

(assert (=> b!618347 m!594383))

(declare-fun m!594397 () Bool)

(assert (=> b!618347 m!594397))

(assert (=> b!618347 m!594383))

(assert (=> b!618347 m!594383))

(declare-fun m!594399 () Bool)

(assert (=> b!618347 m!594399))

(assert (=> b!618347 m!594383))

(declare-fun m!594401 () Bool)

(assert (=> b!618347 m!594401))

(declare-fun m!594403 () Bool)

(assert (=> b!618347 m!594403))

(declare-fun m!594405 () Bool)

(assert (=> b!618347 m!594405))

(declare-fun m!594407 () Bool)

(assert (=> b!618347 m!594407))

(assert (=> b!618337 m!594383))

(assert (=> b!618337 m!594383))

(declare-fun m!594409 () Bool)

(assert (=> b!618337 m!594409))

(assert (=> b!618335 m!594383))

(assert (=> b!618335 m!594383))

(declare-fun m!594411 () Bool)

(assert (=> b!618335 m!594411))

(declare-fun m!594413 () Bool)

(assert (=> b!618332 m!594413))

(assert (=> b!618332 m!594383))

(assert (=> b!618332 m!594383))

(declare-fun m!594415 () Bool)

(assert (=> b!618332 m!594415))

(declare-fun m!594417 () Bool)

(assert (=> b!618330 m!594417))

(declare-fun m!594419 () Bool)

(assert (=> b!618346 m!594419))

(declare-fun m!594421 () Bool)

(assert (=> start!56080 m!594421))

(declare-fun m!594423 () Bool)

(assert (=> start!56080 m!594423))

(declare-fun m!594425 () Bool)

(assert (=> b!618334 m!594425))

(assert (=> b!618341 m!594383))

(declare-fun m!594427 () Bool)

(assert (=> b!618341 m!594427))

(assert (=> b!618341 m!594383))

(declare-fun m!594429 () Bool)

(assert (=> b!618341 m!594429))

(assert (=> b!618341 m!594383))

(declare-fun m!594431 () Bool)

(assert (=> b!618341 m!594431))

(assert (=> b!618341 m!594403))

(declare-fun m!594433 () Bool)

(assert (=> b!618341 m!594433))

(assert (=> b!618341 m!594407))

(assert (=> b!618341 m!594383))

(declare-fun m!594435 () Bool)

(assert (=> b!618341 m!594435))

(assert (=> b!618341 m!594383))

(declare-fun m!594437 () Bool)

(assert (=> b!618341 m!594437))

(assert (=> b!618343 m!594383))

(assert (=> b!618343 m!594383))

(assert (=> b!618343 m!594435))

(declare-fun m!594439 () Bool)

(assert (=> b!618323 m!594439))

(assert (=> b!618340 m!594383))

(assert (=> b!618340 m!594383))

(assert (=> b!618340 m!594411))

(assert (=> b!618338 m!594373))

(assert (=> b!618338 m!594379))

(assert (=> b!618338 m!594383))

(push 1)

