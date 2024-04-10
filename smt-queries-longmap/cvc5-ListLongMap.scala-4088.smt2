; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56026 () Bool)

(assert start!56026)

(declare-fun b!616298 () Bool)

(declare-datatypes ((Unit!20068 0))(
  ( (Unit!20069) )
))
(declare-fun e!353375 () Unit!20068)

(declare-fun Unit!20070 () Unit!20068)

(assert (=> b!616298 (= e!353375 Unit!20070)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!396998 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37496 0))(
  ( (array!37497 (arr!17994 (Array (_ BitVec 32) (_ BitVec 64))) (size!18358 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37496)

(assert (=> b!616298 (= res!396998 (= (select (store (arr!17994 a!2986) i!1108 k!1786) index!984) (select (arr!17994 a!2986) j!136)))))

(declare-fun e!353376 () Bool)

(assert (=> b!616298 (=> (not res!396998) (not e!353376))))

(assert (=> b!616298 e!353376))

(declare-fun c!70025 () Bool)

(assert (=> b!616298 (= c!70025 (bvslt j!136 index!984))))

(declare-fun lt!283413 () Unit!20068)

(declare-fun e!353381 () Unit!20068)

(assert (=> b!616298 (= lt!283413 e!353381)))

(declare-fun c!70024 () Bool)

(assert (=> b!616298 (= c!70024 (bvslt index!984 j!136))))

(declare-fun lt!283400 () Unit!20068)

(declare-fun e!353382 () Unit!20068)

(assert (=> b!616298 (= lt!283400 e!353382)))

(assert (=> b!616298 false))

(declare-fun b!616299 () Bool)

(declare-fun res!396992 () Bool)

(declare-fun e!353374 () Bool)

(assert (=> b!616299 (=> (not res!396992) (not e!353374))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37496 (_ BitVec 32)) Bool)

(assert (=> b!616299 (= res!396992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616300 () Bool)

(declare-fun e!353380 () Bool)

(declare-fun e!353370 () Bool)

(assert (=> b!616300 (= e!353380 e!353370)))

(declare-fun res!396996 () Bool)

(assert (=> b!616300 (=> (not res!396996) (not e!353370))))

(declare-datatypes ((SeekEntryResult!6434 0))(
  ( (MissingZero!6434 (index!28020 (_ BitVec 32))) (Found!6434 (index!28021 (_ BitVec 32))) (Intermediate!6434 (undefined!7246 Bool) (index!28022 (_ BitVec 32)) (x!56818 (_ BitVec 32))) (Undefined!6434) (MissingVacant!6434 (index!28023 (_ BitVec 32))) )
))
(declare-fun lt!283408 () SeekEntryResult!6434)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616300 (= res!396996 (and (= lt!283408 (Found!6434 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17994 a!2986) index!984) (select (arr!17994 a!2986) j!136))) (not (= (select (arr!17994 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37496 (_ BitVec 32)) SeekEntryResult!6434)

(assert (=> b!616300 (= lt!283408 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17994 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616301 () Bool)

(declare-fun res!397001 () Bool)

(assert (=> b!616301 (= res!397001 (bvsge j!136 index!984))))

(declare-fun e!353371 () Bool)

(assert (=> b!616301 (=> res!397001 e!353371)))

(assert (=> b!616301 (= e!353376 e!353371)))

(declare-fun b!616302 () Bool)

(declare-fun res!396999 () Bool)

(assert (=> b!616302 (=> (not res!396999) (not e!353374))))

(assert (=> b!616302 (= res!396999 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17994 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616303 () Bool)

(declare-fun e!353368 () Bool)

(declare-fun lt!283403 () SeekEntryResult!6434)

(assert (=> b!616303 (= e!353368 (= lt!283408 lt!283403))))

(declare-fun b!616304 () Bool)

(assert (=> b!616304 false))

(declare-fun lt!283399 () Unit!20068)

(declare-fun lt!283402 () array!37496)

(declare-datatypes ((List!12035 0))(
  ( (Nil!12032) (Cons!12031 (h!13076 (_ BitVec 64)) (t!18263 List!12035)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37496 (_ BitVec 64) (_ BitVec 32) List!12035) Unit!20068)

(assert (=> b!616304 (= lt!283399 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283402 (select (arr!17994 a!2986) j!136) j!136 Nil!12032))))

(declare-fun arrayNoDuplicates!0 (array!37496 (_ BitVec 32) List!12035) Bool)

(assert (=> b!616304 (arrayNoDuplicates!0 lt!283402 j!136 Nil!12032)))

(declare-fun lt!283401 () Unit!20068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37496 (_ BitVec 32) (_ BitVec 32)) Unit!20068)

(assert (=> b!616304 (= lt!283401 (lemmaNoDuplicateFromThenFromBigger!0 lt!283402 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616304 (arrayNoDuplicates!0 lt!283402 #b00000000000000000000000000000000 Nil!12032)))

(declare-fun lt!283415 () Unit!20068)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12035) Unit!20068)

(assert (=> b!616304 (= lt!283415 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12032))))

(declare-fun arrayContainsKey!0 (array!37496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616304 (arrayContainsKey!0 lt!283402 (select (arr!17994 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283407 () Unit!20068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20068)

(assert (=> b!616304 (= lt!283407 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283402 (select (arr!17994 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20071 () Unit!20068)

(assert (=> b!616304 (= e!353381 Unit!20071)))

(declare-fun b!616305 () Bool)

(declare-fun res!397000 () Bool)

(declare-fun e!353369 () Bool)

(assert (=> b!616305 (=> (not res!397000) (not e!353369))))

(assert (=> b!616305 (= res!397000 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616306 () Bool)

(declare-fun Unit!20072 () Unit!20068)

(assert (=> b!616306 (= e!353375 Unit!20072)))

(declare-fun b!616307 () Bool)

(declare-fun e!353377 () Bool)

(assert (=> b!616307 (= e!353377 (arrayContainsKey!0 lt!283402 (select (arr!17994 a!2986) j!136) index!984))))

(declare-fun b!616309 () Bool)

(declare-fun Unit!20073 () Unit!20068)

(assert (=> b!616309 (= e!353382 Unit!20073)))

(declare-fun b!616310 () Bool)

(declare-fun e!353373 () Bool)

(declare-fun lt!283406 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616310 (= e!353373 (validKeyInArray!0 lt!283406))))

(declare-fun b!616311 () Bool)

(declare-fun e!353378 () Unit!20068)

(declare-fun Unit!20074 () Unit!20068)

(assert (=> b!616311 (= e!353378 Unit!20074)))

(assert (=> b!616311 false))

(declare-fun b!616312 () Bool)

(assert (=> b!616312 false))

(declare-fun lt!283405 () Unit!20068)

(assert (=> b!616312 (= lt!283405 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283402 (select (arr!17994 a!2986) j!136) index!984 Nil!12032))))

(assert (=> b!616312 (arrayNoDuplicates!0 lt!283402 index!984 Nil!12032)))

(declare-fun lt!283414 () Unit!20068)

(assert (=> b!616312 (= lt!283414 (lemmaNoDuplicateFromThenFromBigger!0 lt!283402 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616312 (arrayNoDuplicates!0 lt!283402 #b00000000000000000000000000000000 Nil!12032)))

(declare-fun lt!283411 () Unit!20068)

(assert (=> b!616312 (= lt!283411 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12032))))

(assert (=> b!616312 (arrayContainsKey!0 lt!283402 (select (arr!17994 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283398 () Unit!20068)

(assert (=> b!616312 (= lt!283398 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283402 (select (arr!17994 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353372 () Bool)

(assert (=> b!616312 e!353372))

(declare-fun res!396994 () Bool)

(assert (=> b!616312 (=> (not res!396994) (not e!353372))))

(assert (=> b!616312 (= res!396994 (arrayContainsKey!0 lt!283402 (select (arr!17994 a!2986) j!136) j!136))))

(declare-fun Unit!20075 () Unit!20068)

(assert (=> b!616312 (= e!353382 Unit!20075)))

(declare-fun b!616313 () Bool)

(assert (=> b!616313 (= e!353372 (arrayContainsKey!0 lt!283402 (select (arr!17994 a!2986) j!136) index!984))))

(declare-fun b!616314 () Bool)

(assert (=> b!616314 (= e!353369 e!353374)))

(declare-fun res!396995 () Bool)

(assert (=> b!616314 (=> (not res!396995) (not e!353374))))

(declare-fun lt!283412 () SeekEntryResult!6434)

(assert (=> b!616314 (= res!396995 (or (= lt!283412 (MissingZero!6434 i!1108)) (= lt!283412 (MissingVacant!6434 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37496 (_ BitVec 32)) SeekEntryResult!6434)

(assert (=> b!616314 (= lt!283412 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616315 () Bool)

(assert (=> b!616315 (= e!353370 (not e!353373))))

(declare-fun res!396991 () Bool)

(assert (=> b!616315 (=> res!396991 e!353373)))

(assert (=> b!616315 (= res!396991 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!283409 () Unit!20068)

(assert (=> b!616315 (= lt!283409 e!353375)))

(declare-fun c!70022 () Bool)

(declare-fun lt!283404 () SeekEntryResult!6434)

(assert (=> b!616315 (= c!70022 (= lt!283404 (Found!6434 index!984)))))

(declare-fun lt!283417 () Unit!20068)

(assert (=> b!616315 (= lt!283417 e!353378)))

(declare-fun c!70023 () Bool)

(assert (=> b!616315 (= c!70023 (= lt!283404 Undefined!6434))))

(assert (=> b!616315 (= lt!283404 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283406 lt!283402 mask!3053))))

(assert (=> b!616315 e!353368))

(declare-fun res!396993 () Bool)

(assert (=> b!616315 (=> (not res!396993) (not e!353368))))

(declare-fun lt!283410 () (_ BitVec 32))

(assert (=> b!616315 (= res!396993 (= lt!283403 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283410 vacantSpotIndex!68 lt!283406 lt!283402 mask!3053)))))

(assert (=> b!616315 (= lt!283403 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283410 vacantSpotIndex!68 (select (arr!17994 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616315 (= lt!283406 (select (store (arr!17994 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283416 () Unit!20068)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20068)

(assert (=> b!616315 (= lt!283416 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283410 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616315 (= lt!283410 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616316 () Bool)

(declare-fun res!396990 () Bool)

(assert (=> b!616316 (=> (not res!396990) (not e!353369))))

(assert (=> b!616316 (= res!396990 (validKeyInArray!0 (select (arr!17994 a!2986) j!136)))))

(declare-fun b!616317 () Bool)

(declare-fun res!396997 () Bool)

(assert (=> b!616317 (=> (not res!396997) (not e!353369))))

(assert (=> b!616317 (= res!396997 (validKeyInArray!0 k!1786))))

(declare-fun b!616318 () Bool)

(assert (=> b!616318 (= e!353374 e!353380)))

(declare-fun res!396989 () Bool)

(assert (=> b!616318 (=> (not res!396989) (not e!353380))))

(assert (=> b!616318 (= res!396989 (= (select (store (arr!17994 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616318 (= lt!283402 (array!37497 (store (arr!17994 a!2986) i!1108 k!1786) (size!18358 a!2986)))))

(declare-fun b!616319 () Bool)

(declare-fun Unit!20076 () Unit!20068)

(assert (=> b!616319 (= e!353381 Unit!20076)))

(declare-fun b!616320 () Bool)

(declare-fun res!397004 () Bool)

(assert (=> b!616320 (=> (not res!397004) (not e!353374))))

(assert (=> b!616320 (= res!397004 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12032))))

(declare-fun b!616321 () Bool)

(declare-fun res!396988 () Bool)

(assert (=> b!616321 (= res!396988 (arrayContainsKey!0 lt!283402 (select (arr!17994 a!2986) j!136) j!136))))

(assert (=> b!616321 (=> (not res!396988) (not e!353377))))

(assert (=> b!616321 (= e!353371 e!353377)))

(declare-fun b!616322 () Bool)

(declare-fun Unit!20077 () Unit!20068)

(assert (=> b!616322 (= e!353378 Unit!20077)))

(declare-fun b!616308 () Bool)

(declare-fun res!397003 () Bool)

(assert (=> b!616308 (=> (not res!397003) (not e!353369))))

(assert (=> b!616308 (= res!397003 (and (= (size!18358 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18358 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18358 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!397002 () Bool)

(assert (=> start!56026 (=> (not res!397002) (not e!353369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56026 (= res!397002 (validMask!0 mask!3053))))

(assert (=> start!56026 e!353369))

(assert (=> start!56026 true))

(declare-fun array_inv!13790 (array!37496) Bool)

(assert (=> start!56026 (array_inv!13790 a!2986)))

(assert (= (and start!56026 res!397002) b!616308))

(assert (= (and b!616308 res!397003) b!616316))

(assert (= (and b!616316 res!396990) b!616317))

(assert (= (and b!616317 res!396997) b!616305))

(assert (= (and b!616305 res!397000) b!616314))

(assert (= (and b!616314 res!396995) b!616299))

(assert (= (and b!616299 res!396992) b!616320))

(assert (= (and b!616320 res!397004) b!616302))

(assert (= (and b!616302 res!396999) b!616318))

(assert (= (and b!616318 res!396989) b!616300))

(assert (= (and b!616300 res!396996) b!616315))

(assert (= (and b!616315 res!396993) b!616303))

(assert (= (and b!616315 c!70023) b!616311))

(assert (= (and b!616315 (not c!70023)) b!616322))

(assert (= (and b!616315 c!70022) b!616298))

(assert (= (and b!616315 (not c!70022)) b!616306))

(assert (= (and b!616298 res!396998) b!616301))

(assert (= (and b!616301 (not res!397001)) b!616321))

(assert (= (and b!616321 res!396988) b!616307))

(assert (= (and b!616298 c!70025) b!616304))

(assert (= (and b!616298 (not c!70025)) b!616319))

(assert (= (and b!616298 c!70024) b!616312))

(assert (= (and b!616298 (not c!70024)) b!616309))

(assert (= (and b!616312 res!396994) b!616313))

(assert (= (and b!616315 (not res!396991)) b!616310))

(declare-fun m!592475 () Bool)

(assert (=> b!616300 m!592475))

(declare-fun m!592477 () Bool)

(assert (=> b!616300 m!592477))

(assert (=> b!616300 m!592477))

(declare-fun m!592479 () Bool)

(assert (=> b!616300 m!592479))

(declare-fun m!592481 () Bool)

(assert (=> b!616299 m!592481))

(declare-fun m!592483 () Bool)

(assert (=> b!616302 m!592483))

(declare-fun m!592485 () Bool)

(assert (=> b!616305 m!592485))

(declare-fun m!592487 () Bool)

(assert (=> b!616315 m!592487))

(declare-fun m!592489 () Bool)

(assert (=> b!616315 m!592489))

(declare-fun m!592491 () Bool)

(assert (=> b!616315 m!592491))

(assert (=> b!616315 m!592477))

(declare-fun m!592493 () Bool)

(assert (=> b!616315 m!592493))

(declare-fun m!592495 () Bool)

(assert (=> b!616315 m!592495))

(declare-fun m!592497 () Bool)

(assert (=> b!616315 m!592497))

(assert (=> b!616315 m!592477))

(declare-fun m!592499 () Bool)

(assert (=> b!616315 m!592499))

(declare-fun m!592501 () Bool)

(assert (=> b!616317 m!592501))

(assert (=> b!616318 m!592493))

(declare-fun m!592503 () Bool)

(assert (=> b!616318 m!592503))

(declare-fun m!592505 () Bool)

(assert (=> start!56026 m!592505))

(declare-fun m!592507 () Bool)

(assert (=> start!56026 m!592507))

(assert (=> b!616321 m!592477))

(assert (=> b!616321 m!592477))

(declare-fun m!592509 () Bool)

(assert (=> b!616321 m!592509))

(assert (=> b!616298 m!592493))

(declare-fun m!592511 () Bool)

(assert (=> b!616298 m!592511))

(assert (=> b!616298 m!592477))

(assert (=> b!616312 m!592477))

(declare-fun m!592513 () Bool)

(assert (=> b!616312 m!592513))

(assert (=> b!616312 m!592477))

(declare-fun m!592515 () Bool)

(assert (=> b!616312 m!592515))

(assert (=> b!616312 m!592477))

(declare-fun m!592517 () Bool)

(assert (=> b!616312 m!592517))

(declare-fun m!592519 () Bool)

(assert (=> b!616312 m!592519))

(assert (=> b!616312 m!592477))

(declare-fun m!592521 () Bool)

(assert (=> b!616312 m!592521))

(declare-fun m!592523 () Bool)

(assert (=> b!616312 m!592523))

(assert (=> b!616312 m!592477))

(assert (=> b!616312 m!592509))

(declare-fun m!592525 () Bool)

(assert (=> b!616312 m!592525))

(assert (=> b!616307 m!592477))

(assert (=> b!616307 m!592477))

(declare-fun m!592527 () Bool)

(assert (=> b!616307 m!592527))

(declare-fun m!592529 () Bool)

(assert (=> b!616304 m!592529))

(assert (=> b!616304 m!592519))

(assert (=> b!616304 m!592477))

(declare-fun m!592531 () Bool)

(assert (=> b!616304 m!592531))

(assert (=> b!616304 m!592477))

(declare-fun m!592533 () Bool)

(assert (=> b!616304 m!592533))

(assert (=> b!616304 m!592477))

(declare-fun m!592535 () Bool)

(assert (=> b!616304 m!592535))

(assert (=> b!616304 m!592477))

(declare-fun m!592537 () Bool)

(assert (=> b!616304 m!592537))

(assert (=> b!616304 m!592525))

(declare-fun m!592539 () Bool)

(assert (=> b!616314 m!592539))

(assert (=> b!616316 m!592477))

(assert (=> b!616316 m!592477))

(declare-fun m!592541 () Bool)

(assert (=> b!616316 m!592541))

(declare-fun m!592543 () Bool)

(assert (=> b!616310 m!592543))

(assert (=> b!616313 m!592477))

(assert (=> b!616313 m!592477))

(assert (=> b!616313 m!592527))

(declare-fun m!592545 () Bool)

(assert (=> b!616320 m!592545))

(push 1)

