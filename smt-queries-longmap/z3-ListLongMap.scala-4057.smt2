; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55620 () Bool)

(assert start!55620)

(declare-fun b!608477 () Bool)

(declare-fun e!348475 () Bool)

(declare-fun e!348471 () Bool)

(assert (=> b!608477 (= e!348475 e!348471)))

(declare-fun res!391089 () Bool)

(assert (=> b!608477 (=> (not res!391089) (not e!348471))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37296 0))(
  ( (array!37297 (arr!17896 (Array (_ BitVec 32) (_ BitVec 64))) (size!18260 (_ BitVec 32))) )
))
(declare-fun lt!277956 () array!37296)

(declare-fun a!2986 () array!37296)

(declare-fun arrayContainsKey!0 (array!37296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608477 (= res!391089 (arrayContainsKey!0 lt!277956 (select (arr!17896 a!2986) j!136) j!136))))

(declare-fun b!608478 () Bool)

(declare-datatypes ((Unit!19405 0))(
  ( (Unit!19406) )
))
(declare-fun e!348476 () Unit!19405)

(declare-fun Unit!19407 () Unit!19405)

(assert (=> b!608478 (= e!348476 Unit!19407)))

(assert (=> b!608478 false))

(declare-fun b!608479 () Bool)

(declare-fun res!391081 () Bool)

(declare-fun e!348479 () Bool)

(assert (=> b!608479 (=> (not res!391081) (not e!348479))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608479 (= res!391081 (and (= (size!18260 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18260 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18260 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608480 () Bool)

(declare-fun e!348480 () Bool)

(declare-fun e!348485 () Bool)

(assert (=> b!608480 (= e!348480 e!348485)))

(declare-fun res!391087 () Bool)

(assert (=> b!608480 (=> res!391087 e!348485)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!608480 (= res!391087 (bvsge index!984 j!136))))

(declare-fun lt!277950 () Unit!19405)

(declare-fun e!348473 () Unit!19405)

(assert (=> b!608480 (= lt!277950 e!348473)))

(declare-fun c!69073 () Bool)

(assert (=> b!608480 (= c!69073 (bvslt j!136 index!984))))

(declare-fun b!608481 () Bool)

(declare-fun res!391086 () Bool)

(declare-fun e!348484 () Bool)

(assert (=> b!608481 (=> res!391086 e!348484)))

(declare-datatypes ((List!11844 0))(
  ( (Nil!11841) (Cons!11840 (h!12888 (_ BitVec 64)) (t!18064 List!11844)) )
))
(declare-fun contains!2994 (List!11844 (_ BitVec 64)) Bool)

(assert (=> b!608481 (= res!391086 (contains!2994 Nil!11841 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608482 () Bool)

(declare-fun res!391072 () Bool)

(assert (=> b!608482 (=> (not res!391072) (not e!348479))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608482 (= res!391072 (validKeyInArray!0 k0!1786))))

(declare-fun e!348481 () Bool)

(declare-fun b!608484 () Bool)

(assert (=> b!608484 (= e!348481 (arrayContainsKey!0 lt!277956 (select (arr!17896 a!2986) j!136) index!984))))

(declare-fun b!608485 () Bool)

(declare-fun res!391090 () Bool)

(declare-fun e!348482 () Bool)

(assert (=> b!608485 (=> (not res!391090) (not e!348482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37296 (_ BitVec 32)) Bool)

(assert (=> b!608485 (= res!391090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608486 () Bool)

(declare-fun Unit!19408 () Unit!19405)

(assert (=> b!608486 (= e!348473 Unit!19408)))

(declare-fun b!608487 () Bool)

(assert (=> b!608487 (= e!348485 e!348484)))

(declare-fun res!391070 () Bool)

(assert (=> b!608487 (=> res!391070 e!348484)))

(assert (=> b!608487 (= res!391070 (or (bvsge (size!18260 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18260 a!2986))))))

(assert (=> b!608487 (arrayContainsKey!0 lt!277956 (select (arr!17896 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277960 () Unit!19405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37296 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19405)

(assert (=> b!608487 (= lt!277960 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277956 (select (arr!17896 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608487 e!348481))

(declare-fun res!391073 () Bool)

(assert (=> b!608487 (=> (not res!391073) (not e!348481))))

(assert (=> b!608487 (= res!391073 (arrayContainsKey!0 lt!277956 (select (arr!17896 a!2986) j!136) j!136))))

(declare-fun b!608488 () Bool)

(declare-fun res!391078 () Bool)

(assert (=> b!608488 (=> (not res!391078) (not e!348482))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!608488 (= res!391078 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17896 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608489 () Bool)

(declare-fun e!348474 () Bool)

(assert (=> b!608489 (= e!348474 e!348475)))

(declare-fun res!391077 () Bool)

(assert (=> b!608489 (=> res!391077 e!348475)))

(declare-fun lt!277952 () (_ BitVec 64))

(declare-fun lt!277962 () (_ BitVec 64))

(assert (=> b!608489 (= res!391077 (or (not (= (select (arr!17896 a!2986) j!136) lt!277952)) (not (= (select (arr!17896 a!2986) j!136) lt!277962)) (bvsge j!136 index!984)))))

(declare-fun b!608490 () Bool)

(declare-fun res!391076 () Bool)

(assert (=> b!608490 (=> res!391076 e!348484)))

(declare-fun noDuplicate!328 (List!11844) Bool)

(assert (=> b!608490 (= res!391076 (not (noDuplicate!328 Nil!11841)))))

(declare-fun b!608491 () Bool)

(declare-fun res!391071 () Bool)

(assert (=> b!608491 (=> (not res!391071) (not e!348479))))

(assert (=> b!608491 (= res!391071 (validKeyInArray!0 (select (arr!17896 a!2986) j!136)))))

(declare-fun b!608492 () Bool)

(declare-fun e!348478 () Bool)

(assert (=> b!608492 (= e!348478 e!348480)))

(declare-fun res!391069 () Bool)

(assert (=> b!608492 (=> res!391069 e!348480)))

(assert (=> b!608492 (= res!391069 (or (not (= (select (arr!17896 a!2986) j!136) lt!277952)) (not (= (select (arr!17896 a!2986) j!136) lt!277962))))))

(assert (=> b!608492 e!348474))

(declare-fun res!391080 () Bool)

(assert (=> b!608492 (=> (not res!391080) (not e!348474))))

(assert (=> b!608492 (= res!391080 (= lt!277962 (select (arr!17896 a!2986) j!136)))))

(assert (=> b!608492 (= lt!277962 (select (store (arr!17896 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608493 () Bool)

(declare-fun e!348483 () Bool)

(assert (=> b!608493 (= e!348482 e!348483)))

(declare-fun res!391085 () Bool)

(assert (=> b!608493 (=> (not res!391085) (not e!348483))))

(assert (=> b!608493 (= res!391085 (= (select (store (arr!17896 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608493 (= lt!277956 (array!37297 (store (arr!17896 a!2986) i!1108 k0!1786) (size!18260 a!2986)))))

(declare-fun b!608494 () Bool)

(declare-fun e!348472 () Bool)

(assert (=> b!608494 (= e!348472 (not e!348478))))

(declare-fun res!391068 () Bool)

(assert (=> b!608494 (=> res!391068 e!348478)))

(declare-datatypes ((SeekEntryResult!6292 0))(
  ( (MissingZero!6292 (index!27443 (_ BitVec 32))) (Found!6292 (index!27444 (_ BitVec 32))) (Intermediate!6292 (undefined!7104 Bool) (index!27445 (_ BitVec 32)) (x!56404 (_ BitVec 32))) (Undefined!6292) (MissingVacant!6292 (index!27446 (_ BitVec 32))) )
))
(declare-fun lt!277957 () SeekEntryResult!6292)

(assert (=> b!608494 (= res!391068 (not (= lt!277957 (Found!6292 index!984))))))

(declare-fun lt!277948 () Unit!19405)

(assert (=> b!608494 (= lt!277948 e!348476)))

(declare-fun c!69074 () Bool)

(assert (=> b!608494 (= c!69074 (= lt!277957 Undefined!6292))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37296 (_ BitVec 32)) SeekEntryResult!6292)

(assert (=> b!608494 (= lt!277957 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277952 lt!277956 mask!3053))))

(declare-fun e!348477 () Bool)

(assert (=> b!608494 e!348477))

(declare-fun res!391082 () Bool)

(assert (=> b!608494 (=> (not res!391082) (not e!348477))))

(declare-fun lt!277959 () (_ BitVec 32))

(declare-fun lt!277951 () SeekEntryResult!6292)

(assert (=> b!608494 (= res!391082 (= lt!277951 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277959 vacantSpotIndex!68 lt!277952 lt!277956 mask!3053)))))

(assert (=> b!608494 (= lt!277951 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277959 vacantSpotIndex!68 (select (arr!17896 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608494 (= lt!277952 (select (store (arr!17896 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277947 () Unit!19405)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37296 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19405)

(assert (=> b!608494 (= lt!277947 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277959 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608494 (= lt!277959 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!608495 () Bool)

(assert (=> b!608495 (= e!348479 e!348482)))

(declare-fun res!391084 () Bool)

(assert (=> b!608495 (=> (not res!391084) (not e!348482))))

(declare-fun lt!277961 () SeekEntryResult!6292)

(assert (=> b!608495 (= res!391084 (or (= lt!277961 (MissingZero!6292 i!1108)) (= lt!277961 (MissingVacant!6292 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37296 (_ BitVec 32)) SeekEntryResult!6292)

(assert (=> b!608495 (= lt!277961 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608496 () Bool)

(declare-fun Unit!19409 () Unit!19405)

(assert (=> b!608496 (= e!348473 Unit!19409)))

(declare-fun lt!277955 () Unit!19405)

(assert (=> b!608496 (= lt!277955 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277956 (select (arr!17896 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608496 (arrayContainsKey!0 lt!277956 (select (arr!17896 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277963 () Unit!19405)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37296 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11844) Unit!19405)

(assert (=> b!608496 (= lt!277963 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11841))))

(declare-fun arrayNoDuplicates!0 (array!37296 (_ BitVec 32) List!11844) Bool)

(assert (=> b!608496 (arrayNoDuplicates!0 lt!277956 #b00000000000000000000000000000000 Nil!11841)))

(declare-fun lt!277954 () Unit!19405)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37296 (_ BitVec 32) (_ BitVec 32)) Unit!19405)

(assert (=> b!608496 (= lt!277954 (lemmaNoDuplicateFromThenFromBigger!0 lt!277956 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608496 (arrayNoDuplicates!0 lt!277956 j!136 Nil!11841)))

(declare-fun lt!277949 () Unit!19405)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37296 (_ BitVec 64) (_ BitVec 32) List!11844) Unit!19405)

(assert (=> b!608496 (= lt!277949 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277956 (select (arr!17896 a!2986) j!136) j!136 Nil!11841))))

(assert (=> b!608496 false))

(declare-fun b!608497 () Bool)

(declare-fun res!391074 () Bool)

(assert (=> b!608497 (=> (not res!391074) (not e!348482))))

(assert (=> b!608497 (= res!391074 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11841))))

(declare-fun b!608483 () Bool)

(declare-fun Unit!19410 () Unit!19405)

(assert (=> b!608483 (= e!348476 Unit!19410)))

(declare-fun res!391075 () Bool)

(assert (=> start!55620 (=> (not res!391075) (not e!348479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55620 (= res!391075 (validMask!0 mask!3053))))

(assert (=> start!55620 e!348479))

(assert (=> start!55620 true))

(declare-fun array_inv!13755 (array!37296) Bool)

(assert (=> start!55620 (array_inv!13755 a!2986)))

(declare-fun b!608498 () Bool)

(assert (=> b!608498 (= e!348484 true)))

(declare-fun lt!277958 () Bool)

(assert (=> b!608498 (= lt!277958 (contains!2994 Nil!11841 k0!1786))))

(declare-fun b!608499 () Bool)

(assert (=> b!608499 (= e!348483 e!348472)))

(declare-fun res!391088 () Bool)

(assert (=> b!608499 (=> (not res!391088) (not e!348472))))

(declare-fun lt!277953 () SeekEntryResult!6292)

(assert (=> b!608499 (= res!391088 (and (= lt!277953 (Found!6292 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17896 a!2986) index!984) (select (arr!17896 a!2986) j!136))) (not (= (select (arr!17896 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608499 (= lt!277953 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17896 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608500 () Bool)

(declare-fun res!391079 () Bool)

(assert (=> b!608500 (=> res!391079 e!348484)))

(assert (=> b!608500 (= res!391079 (contains!2994 Nil!11841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608501 () Bool)

(declare-fun res!391083 () Bool)

(assert (=> b!608501 (=> (not res!391083) (not e!348479))))

(assert (=> b!608501 (= res!391083 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608502 () Bool)

(assert (=> b!608502 (= e!348471 (arrayContainsKey!0 lt!277956 (select (arr!17896 a!2986) j!136) index!984))))

(declare-fun b!608503 () Bool)

(assert (=> b!608503 (= e!348477 (= lt!277953 lt!277951))))

(assert (= (and start!55620 res!391075) b!608479))

(assert (= (and b!608479 res!391081) b!608491))

(assert (= (and b!608491 res!391071) b!608482))

(assert (= (and b!608482 res!391072) b!608501))

(assert (= (and b!608501 res!391083) b!608495))

(assert (= (and b!608495 res!391084) b!608485))

(assert (= (and b!608485 res!391090) b!608497))

(assert (= (and b!608497 res!391074) b!608488))

(assert (= (and b!608488 res!391078) b!608493))

(assert (= (and b!608493 res!391085) b!608499))

(assert (= (and b!608499 res!391088) b!608494))

(assert (= (and b!608494 res!391082) b!608503))

(assert (= (and b!608494 c!69074) b!608478))

(assert (= (and b!608494 (not c!69074)) b!608483))

(assert (= (and b!608494 (not res!391068)) b!608492))

(assert (= (and b!608492 res!391080) b!608489))

(assert (= (and b!608489 (not res!391077)) b!608477))

(assert (= (and b!608477 res!391089) b!608502))

(assert (= (and b!608492 (not res!391069)) b!608480))

(assert (= (and b!608480 c!69073) b!608496))

(assert (= (and b!608480 (not c!69073)) b!608486))

(assert (= (and b!608480 (not res!391087)) b!608487))

(assert (= (and b!608487 res!391073) b!608484))

(assert (= (and b!608487 (not res!391070)) b!608490))

(assert (= (and b!608490 (not res!391076)) b!608500))

(assert (= (and b!608500 (not res!391079)) b!608481))

(assert (= (and b!608481 (not res!391086)) b!608498))

(declare-fun m!585383 () Bool)

(assert (=> b!608494 m!585383))

(declare-fun m!585385 () Bool)

(assert (=> b!608494 m!585385))

(declare-fun m!585387 () Bool)

(assert (=> b!608494 m!585387))

(declare-fun m!585389 () Bool)

(assert (=> b!608494 m!585389))

(declare-fun m!585391 () Bool)

(assert (=> b!608494 m!585391))

(declare-fun m!585393 () Bool)

(assert (=> b!608494 m!585393))

(assert (=> b!608494 m!585389))

(declare-fun m!585395 () Bool)

(assert (=> b!608494 m!585395))

(declare-fun m!585397 () Bool)

(assert (=> b!608494 m!585397))

(declare-fun m!585399 () Bool)

(assert (=> start!55620 m!585399))

(declare-fun m!585401 () Bool)

(assert (=> start!55620 m!585401))

(declare-fun m!585403 () Bool)

(assert (=> b!608498 m!585403))

(declare-fun m!585405 () Bool)

(assert (=> b!608485 m!585405))

(assert (=> b!608493 m!585391))

(declare-fun m!585407 () Bool)

(assert (=> b!608493 m!585407))

(assert (=> b!608487 m!585389))

(assert (=> b!608487 m!585389))

(declare-fun m!585409 () Bool)

(assert (=> b!608487 m!585409))

(assert (=> b!608487 m!585389))

(declare-fun m!585411 () Bool)

(assert (=> b!608487 m!585411))

(assert (=> b!608487 m!585389))

(declare-fun m!585413 () Bool)

(assert (=> b!608487 m!585413))

(declare-fun m!585415 () Bool)

(assert (=> b!608497 m!585415))

(assert (=> b!608502 m!585389))

(assert (=> b!608502 m!585389))

(declare-fun m!585417 () Bool)

(assert (=> b!608502 m!585417))

(declare-fun m!585419 () Bool)

(assert (=> b!608496 m!585419))

(assert (=> b!608496 m!585389))

(declare-fun m!585421 () Bool)

(assert (=> b!608496 m!585421))

(assert (=> b!608496 m!585389))

(declare-fun m!585423 () Bool)

(assert (=> b!608496 m!585423))

(declare-fun m!585425 () Bool)

(assert (=> b!608496 m!585425))

(declare-fun m!585427 () Bool)

(assert (=> b!608496 m!585427))

(assert (=> b!608496 m!585389))

(declare-fun m!585429 () Bool)

(assert (=> b!608496 m!585429))

(assert (=> b!608496 m!585389))

(declare-fun m!585431 () Bool)

(assert (=> b!608496 m!585431))

(declare-fun m!585433 () Bool)

(assert (=> b!608499 m!585433))

(assert (=> b!608499 m!585389))

(assert (=> b!608499 m!585389))

(declare-fun m!585435 () Bool)

(assert (=> b!608499 m!585435))

(assert (=> b!608484 m!585389))

(assert (=> b!608484 m!585389))

(assert (=> b!608484 m!585417))

(assert (=> b!608492 m!585389))

(assert (=> b!608492 m!585391))

(declare-fun m!585437 () Bool)

(assert (=> b!608492 m!585437))

(declare-fun m!585439 () Bool)

(assert (=> b!608490 m!585439))

(declare-fun m!585441 () Bool)

(assert (=> b!608501 m!585441))

(declare-fun m!585443 () Bool)

(assert (=> b!608488 m!585443))

(declare-fun m!585445 () Bool)

(assert (=> b!608500 m!585445))

(declare-fun m!585447 () Bool)

(assert (=> b!608482 m!585447))

(assert (=> b!608491 m!585389))

(assert (=> b!608491 m!585389))

(declare-fun m!585449 () Bool)

(assert (=> b!608491 m!585449))

(declare-fun m!585451 () Bool)

(assert (=> b!608495 m!585451))

(assert (=> b!608477 m!585389))

(assert (=> b!608477 m!585389))

(assert (=> b!608477 m!585413))

(assert (=> b!608489 m!585389))

(declare-fun m!585453 () Bool)

(assert (=> b!608481 m!585453))

(check-sat (not b!608500) (not b!608487) (not b!608491) (not b!608499) (not b!608482) (not start!55620) (not b!608497) (not b!608477) (not b!608484) (not b!608495) (not b!608481) (not b!608501) (not b!608490) (not b!608502) (not b!608485) (not b!608494) (not b!608498) (not b!608496))
(check-sat)
