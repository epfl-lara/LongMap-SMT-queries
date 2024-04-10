; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55152 () Bool)

(assert start!55152)

(declare-fun b!604444 () Bool)

(declare-fun e!345859 () Bool)

(declare-fun e!345856 () Bool)

(assert (=> b!604444 (= e!345859 (not e!345856))))

(declare-fun res!388374 () Bool)

(assert (=> b!604444 (=> res!388374 e!345856)))

(declare-datatypes ((SeekEntryResult!6309 0))(
  ( (MissingZero!6309 (index!27499 (_ BitVec 32))) (Found!6309 (index!27500 (_ BitVec 32))) (Intermediate!6309 (undefined!7121 Bool) (index!27501 (_ BitVec 32)) (x!56294 (_ BitVec 32))) (Undefined!6309) (MissingVacant!6309 (index!27502 (_ BitVec 32))) )
))
(declare-fun lt!275664 () SeekEntryResult!6309)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604444 (= res!388374 (not (= lt!275664 (Found!6309 index!984))))))

(declare-datatypes ((Unit!19234 0))(
  ( (Unit!19235) )
))
(declare-fun lt!275670 () Unit!19234)

(declare-fun e!345860 () Unit!19234)

(assert (=> b!604444 (= lt!275670 e!345860)))

(declare-fun c!68408 () Bool)

(assert (=> b!604444 (= c!68408 (= lt!275664 Undefined!6309))))

(declare-fun lt!275662 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37225 0))(
  ( (array!37226 (arr!17869 (Array (_ BitVec 32) (_ BitVec 64))) (size!18233 (_ BitVec 32))) )
))
(declare-fun lt!275675 () array!37225)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37225 (_ BitVec 32)) SeekEntryResult!6309)

(assert (=> b!604444 (= lt!275664 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275662 lt!275675 mask!3053))))

(declare-fun e!345865 () Bool)

(assert (=> b!604444 e!345865))

(declare-fun res!388371 () Bool)

(assert (=> b!604444 (=> (not res!388371) (not e!345865))))

(declare-fun lt!275669 () SeekEntryResult!6309)

(declare-fun lt!275667 () (_ BitVec 32))

(assert (=> b!604444 (= res!388371 (= lt!275669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275667 vacantSpotIndex!68 lt!275662 lt!275675 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37225)

(assert (=> b!604444 (= lt!275669 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275667 vacantSpotIndex!68 (select (arr!17869 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!604444 (= lt!275662 (select (store (arr!17869 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275676 () Unit!19234)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19234)

(assert (=> b!604444 (= lt!275676 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275667 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604444 (= lt!275667 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604445 () Bool)

(declare-fun res!388379 () Bool)

(declare-fun e!345864 () Bool)

(assert (=> b!604445 (=> (not res!388379) (not e!345864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604445 (= res!388379 (validKeyInArray!0 (select (arr!17869 a!2986) j!136)))))

(declare-fun b!604446 () Bool)

(declare-fun e!345870 () Bool)

(assert (=> b!604446 (= e!345856 e!345870)))

(declare-fun res!388370 () Bool)

(assert (=> b!604446 (=> res!388370 e!345870)))

(declare-fun lt!275668 () (_ BitVec 64))

(assert (=> b!604446 (= res!388370 (or (not (= (select (arr!17869 a!2986) j!136) lt!275662)) (not (= (select (arr!17869 a!2986) j!136) lt!275668))))))

(declare-fun e!345867 () Bool)

(assert (=> b!604446 e!345867))

(declare-fun res!388369 () Bool)

(assert (=> b!604446 (=> (not res!388369) (not e!345867))))

(assert (=> b!604446 (= res!388369 (= lt!275668 (select (arr!17869 a!2986) j!136)))))

(assert (=> b!604446 (= lt!275668 (select (store (arr!17869 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604447 () Bool)

(declare-fun e!345866 () Bool)

(assert (=> b!604447 (= e!345870 e!345866)))

(declare-fun res!388381 () Bool)

(assert (=> b!604447 (=> res!388381 e!345866)))

(assert (=> b!604447 (= res!388381 (bvsge index!984 j!136))))

(declare-fun lt!275665 () Unit!19234)

(declare-fun e!345863 () Unit!19234)

(assert (=> b!604447 (= lt!275665 e!345863)))

(declare-fun c!68407 () Bool)

(assert (=> b!604447 (= c!68407 (bvslt j!136 index!984))))

(declare-fun b!604448 () Bool)

(declare-fun Unit!19236 () Unit!19234)

(assert (=> b!604448 (= e!345860 Unit!19236)))

(declare-fun b!604449 () Bool)

(declare-fun res!388378 () Bool)

(assert (=> b!604449 (=> (not res!388378) (not e!345864))))

(assert (=> b!604449 (= res!388378 (validKeyInArray!0 k0!1786))))

(declare-fun b!604450 () Bool)

(declare-fun Unit!19237 () Unit!19234)

(assert (=> b!604450 (= e!345863 Unit!19237)))

(declare-fun lt!275663 () Unit!19234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37225 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19234)

(assert (=> b!604450 (= lt!275663 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275675 (select (arr!17869 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604450 (arrayContainsKey!0 lt!275675 (select (arr!17869 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275673 () Unit!19234)

(declare-datatypes ((List!11910 0))(
  ( (Nil!11907) (Cons!11906 (h!12951 (_ BitVec 64)) (t!18138 List!11910)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37225 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11910) Unit!19234)

(assert (=> b!604450 (= lt!275673 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11907))))

(declare-fun arrayNoDuplicates!0 (array!37225 (_ BitVec 32) List!11910) Bool)

(assert (=> b!604450 (arrayNoDuplicates!0 lt!275675 #b00000000000000000000000000000000 Nil!11907)))

(declare-fun lt!275672 () Unit!19234)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37225 (_ BitVec 32) (_ BitVec 32)) Unit!19234)

(assert (=> b!604450 (= lt!275672 (lemmaNoDuplicateFromThenFromBigger!0 lt!275675 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604450 (arrayNoDuplicates!0 lt!275675 j!136 Nil!11907)))

(declare-fun lt!275666 () Unit!19234)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37225 (_ BitVec 64) (_ BitVec 32) List!11910) Unit!19234)

(assert (=> b!604450 (= lt!275666 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275675 (select (arr!17869 a!2986) j!136) j!136 Nil!11907))))

(assert (=> b!604450 false))

(declare-fun b!604451 () Bool)

(declare-fun res!388364 () Bool)

(assert (=> b!604451 (=> (not res!388364) (not e!345864))))

(assert (=> b!604451 (= res!388364 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604452 () Bool)

(declare-fun Unit!19238 () Unit!19234)

(assert (=> b!604452 (= e!345863 Unit!19238)))

(declare-fun b!604453 () Bool)

(declare-fun lt!275677 () SeekEntryResult!6309)

(assert (=> b!604453 (= e!345865 (= lt!275677 lt!275669))))

(declare-fun e!345858 () Bool)

(declare-fun b!604454 () Bool)

(assert (=> b!604454 (= e!345858 (arrayContainsKey!0 lt!275675 (select (arr!17869 a!2986) j!136) index!984))))

(declare-fun e!345857 () Bool)

(declare-fun b!604455 () Bool)

(assert (=> b!604455 (= e!345857 (arrayContainsKey!0 lt!275675 (select (arr!17869 a!2986) j!136) index!984))))

(declare-fun b!604456 () Bool)

(declare-fun res!388366 () Bool)

(declare-fun e!345861 () Bool)

(assert (=> b!604456 (=> (not res!388366) (not e!345861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37225 (_ BitVec 32)) Bool)

(assert (=> b!604456 (= res!388366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604457 () Bool)

(declare-fun e!345869 () Bool)

(assert (=> b!604457 (= e!345867 e!345869)))

(declare-fun res!388368 () Bool)

(assert (=> b!604457 (=> res!388368 e!345869)))

(assert (=> b!604457 (= res!388368 (or (not (= (select (arr!17869 a!2986) j!136) lt!275662)) (not (= (select (arr!17869 a!2986) j!136) lt!275668)) (bvsge j!136 index!984)))))

(declare-fun b!604458 () Bool)

(declare-fun e!345868 () Bool)

(assert (=> b!604458 (= e!345861 e!345868)))

(declare-fun res!388376 () Bool)

(assert (=> b!604458 (=> (not res!388376) (not e!345868))))

(assert (=> b!604458 (= res!388376 (= (select (store (arr!17869 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604458 (= lt!275675 (array!37226 (store (arr!17869 a!2986) i!1108 k0!1786) (size!18233 a!2986)))))

(declare-fun b!604459 () Bool)

(assert (=> b!604459 (= e!345864 e!345861)))

(declare-fun res!388367 () Bool)

(assert (=> b!604459 (=> (not res!388367) (not e!345861))))

(declare-fun lt!275671 () SeekEntryResult!6309)

(assert (=> b!604459 (= res!388367 (or (= lt!275671 (MissingZero!6309 i!1108)) (= lt!275671 (MissingVacant!6309 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37225 (_ BitVec 32)) SeekEntryResult!6309)

(assert (=> b!604459 (= lt!275671 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!388380 () Bool)

(assert (=> start!55152 (=> (not res!388380) (not e!345864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55152 (= res!388380 (validMask!0 mask!3053))))

(assert (=> start!55152 e!345864))

(assert (=> start!55152 true))

(declare-fun array_inv!13665 (array!37225) Bool)

(assert (=> start!55152 (array_inv!13665 a!2986)))

(declare-fun b!604460 () Bool)

(declare-fun Unit!19239 () Unit!19234)

(assert (=> b!604460 (= e!345860 Unit!19239)))

(assert (=> b!604460 false))

(declare-fun b!604461 () Bool)

(declare-fun res!388377 () Bool)

(assert (=> b!604461 (=> (not res!388377) (not e!345864))))

(assert (=> b!604461 (= res!388377 (and (= (size!18233 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18233 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18233 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604462 () Bool)

(assert (=> b!604462 (= e!345868 e!345859)))

(declare-fun res!388372 () Bool)

(assert (=> b!604462 (=> (not res!388372) (not e!345859))))

(assert (=> b!604462 (= res!388372 (and (= lt!275677 (Found!6309 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17869 a!2986) index!984) (select (arr!17869 a!2986) j!136))) (not (= (select (arr!17869 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604462 (= lt!275677 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17869 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604463 () Bool)

(declare-fun res!388382 () Bool)

(assert (=> b!604463 (=> (not res!388382) (not e!345861))))

(assert (=> b!604463 (= res!388382 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17869 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604464 () Bool)

(assert (=> b!604464 (= e!345866 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18233 a!2986))))))

(assert (=> b!604464 (arrayContainsKey!0 lt!275675 (select (arr!17869 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275674 () Unit!19234)

(assert (=> b!604464 (= lt!275674 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275675 (select (arr!17869 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!604464 e!345858))

(declare-fun res!388373 () Bool)

(assert (=> b!604464 (=> (not res!388373) (not e!345858))))

(assert (=> b!604464 (= res!388373 (arrayContainsKey!0 lt!275675 (select (arr!17869 a!2986) j!136) j!136))))

(declare-fun b!604465 () Bool)

(assert (=> b!604465 (= e!345869 e!345857)))

(declare-fun res!388365 () Bool)

(assert (=> b!604465 (=> (not res!388365) (not e!345857))))

(assert (=> b!604465 (= res!388365 (arrayContainsKey!0 lt!275675 (select (arr!17869 a!2986) j!136) j!136))))

(declare-fun b!604466 () Bool)

(declare-fun res!388375 () Bool)

(assert (=> b!604466 (=> (not res!388375) (not e!345861))))

(assert (=> b!604466 (= res!388375 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11907))))

(assert (= (and start!55152 res!388380) b!604461))

(assert (= (and b!604461 res!388377) b!604445))

(assert (= (and b!604445 res!388379) b!604449))

(assert (= (and b!604449 res!388378) b!604451))

(assert (= (and b!604451 res!388364) b!604459))

(assert (= (and b!604459 res!388367) b!604456))

(assert (= (and b!604456 res!388366) b!604466))

(assert (= (and b!604466 res!388375) b!604463))

(assert (= (and b!604463 res!388382) b!604458))

(assert (= (and b!604458 res!388376) b!604462))

(assert (= (and b!604462 res!388372) b!604444))

(assert (= (and b!604444 res!388371) b!604453))

(assert (= (and b!604444 c!68408) b!604460))

(assert (= (and b!604444 (not c!68408)) b!604448))

(assert (= (and b!604444 (not res!388374)) b!604446))

(assert (= (and b!604446 res!388369) b!604457))

(assert (= (and b!604457 (not res!388368)) b!604465))

(assert (= (and b!604465 res!388365) b!604455))

(assert (= (and b!604446 (not res!388370)) b!604447))

(assert (= (and b!604447 c!68407) b!604450))

(assert (= (and b!604447 (not c!68407)) b!604452))

(assert (= (and b!604447 (not res!388381)) b!604464))

(assert (= (and b!604464 res!388373) b!604454))

(declare-fun m!581349 () Bool)

(assert (=> b!604464 m!581349))

(assert (=> b!604464 m!581349))

(declare-fun m!581351 () Bool)

(assert (=> b!604464 m!581351))

(assert (=> b!604464 m!581349))

(declare-fun m!581353 () Bool)

(assert (=> b!604464 m!581353))

(assert (=> b!604464 m!581349))

(declare-fun m!581355 () Bool)

(assert (=> b!604464 m!581355))

(declare-fun m!581357 () Bool)

(assert (=> b!604456 m!581357))

(assert (=> b!604445 m!581349))

(assert (=> b!604445 m!581349))

(declare-fun m!581359 () Bool)

(assert (=> b!604445 m!581359))

(declare-fun m!581361 () Bool)

(assert (=> b!604449 m!581361))

(assert (=> b!604465 m!581349))

(assert (=> b!604465 m!581349))

(assert (=> b!604465 m!581355))

(declare-fun m!581363 () Bool)

(assert (=> start!55152 m!581363))

(declare-fun m!581365 () Bool)

(assert (=> start!55152 m!581365))

(assert (=> b!604454 m!581349))

(assert (=> b!604454 m!581349))

(declare-fun m!581367 () Bool)

(assert (=> b!604454 m!581367))

(assert (=> b!604455 m!581349))

(assert (=> b!604455 m!581349))

(assert (=> b!604455 m!581367))

(declare-fun m!581369 () Bool)

(assert (=> b!604466 m!581369))

(assert (=> b!604446 m!581349))

(declare-fun m!581371 () Bool)

(assert (=> b!604446 m!581371))

(declare-fun m!581373 () Bool)

(assert (=> b!604446 m!581373))

(assert (=> b!604457 m!581349))

(declare-fun m!581375 () Bool)

(assert (=> b!604462 m!581375))

(assert (=> b!604462 m!581349))

(assert (=> b!604462 m!581349))

(declare-fun m!581377 () Bool)

(assert (=> b!604462 m!581377))

(declare-fun m!581379 () Bool)

(assert (=> b!604459 m!581379))

(declare-fun m!581381 () Bool)

(assert (=> b!604444 m!581381))

(declare-fun m!581383 () Bool)

(assert (=> b!604444 m!581383))

(assert (=> b!604444 m!581349))

(assert (=> b!604444 m!581349))

(declare-fun m!581385 () Bool)

(assert (=> b!604444 m!581385))

(assert (=> b!604444 m!581371))

(declare-fun m!581387 () Bool)

(assert (=> b!604444 m!581387))

(declare-fun m!581389 () Bool)

(assert (=> b!604444 m!581389))

(declare-fun m!581391 () Bool)

(assert (=> b!604444 m!581391))

(declare-fun m!581393 () Bool)

(assert (=> b!604450 m!581393))

(declare-fun m!581395 () Bool)

(assert (=> b!604450 m!581395))

(assert (=> b!604450 m!581349))

(declare-fun m!581397 () Bool)

(assert (=> b!604450 m!581397))

(assert (=> b!604450 m!581349))

(declare-fun m!581399 () Bool)

(assert (=> b!604450 m!581399))

(assert (=> b!604450 m!581349))

(declare-fun m!581401 () Bool)

(assert (=> b!604450 m!581401))

(assert (=> b!604450 m!581349))

(declare-fun m!581403 () Bool)

(assert (=> b!604450 m!581403))

(declare-fun m!581405 () Bool)

(assert (=> b!604450 m!581405))

(assert (=> b!604458 m!581371))

(declare-fun m!581407 () Bool)

(assert (=> b!604458 m!581407))

(declare-fun m!581409 () Bool)

(assert (=> b!604463 m!581409))

(declare-fun m!581411 () Bool)

(assert (=> b!604451 m!581411))

(check-sat (not b!604450) (not b!604466) (not b!604456) (not b!604444) (not b!604459) (not b!604445) (not b!604464) (not start!55152) (not b!604455) (not b!604454) (not b!604449) (not b!604451) (not b!604462) (not b!604465))
(check-sat)
