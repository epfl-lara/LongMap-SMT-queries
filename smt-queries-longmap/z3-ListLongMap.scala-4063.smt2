; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55590 () Bool)

(assert start!55590)

(declare-fun b!609447 () Bool)

(declare-fun e!349044 () Bool)

(declare-fun e!349042 () Bool)

(assert (=> b!609447 (= e!349044 e!349042)))

(declare-fun res!392079 () Bool)

(assert (=> b!609447 (=> res!392079 e!349042)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!278532 () (_ BitVec 64))

(declare-datatypes ((array!37335 0))(
  ( (array!37336 (arr!17918 (Array (_ BitVec 32) (_ BitVec 64))) (size!18283 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37335)

(declare-fun lt!278536 () (_ BitVec 64))

(assert (=> b!609447 (= res!392079 (or (not (= (select (arr!17918 a!2986) j!136) lt!278532)) (not (= (select (arr!17918 a!2986) j!136) lt!278536))))))

(declare-fun e!349037 () Bool)

(assert (=> b!609447 e!349037))

(declare-fun res!392073 () Bool)

(assert (=> b!609447 (=> (not res!392073) (not e!349037))))

(assert (=> b!609447 (= res!392073 (= lt!278536 (select (arr!17918 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609447 (= lt!278536 (select (store (arr!17918 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!349030 () Bool)

(declare-fun lt!278539 () array!37335)

(declare-fun b!609448 () Bool)

(declare-fun arrayContainsKey!0 (array!37335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609448 (= e!349030 (arrayContainsKey!0 lt!278539 (select (arr!17918 a!2986) j!136) index!984))))

(declare-fun b!609449 () Bool)

(declare-fun res!392084 () Bool)

(declare-fun e!349040 () Bool)

(assert (=> b!609449 (=> (not res!392084) (not e!349040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609449 (= res!392084 (validKeyInArray!0 k0!1786))))

(declare-fun b!609450 () Bool)

(declare-fun e!349034 () Bool)

(assert (=> b!609450 (= e!349034 (not e!349044))))

(declare-fun res!392081 () Bool)

(assert (=> b!609450 (=> res!392081 e!349044)))

(declare-datatypes ((SeekEntryResult!6355 0))(
  ( (MissingZero!6355 (index!27695 (_ BitVec 32))) (Found!6355 (index!27696 (_ BitVec 32))) (Intermediate!6355 (undefined!7167 Bool) (index!27697 (_ BitVec 32)) (x!56507 (_ BitVec 32))) (Undefined!6355) (MissingVacant!6355 (index!27698 (_ BitVec 32))) )
))
(declare-fun lt!278529 () SeekEntryResult!6355)

(assert (=> b!609450 (= res!392081 (not (= lt!278529 (Found!6355 index!984))))))

(declare-datatypes ((Unit!19512 0))(
  ( (Unit!19513) )
))
(declare-fun lt!278544 () Unit!19512)

(declare-fun e!349043 () Unit!19512)

(assert (=> b!609450 (= lt!278544 e!349043)))

(declare-fun c!69056 () Bool)

(assert (=> b!609450 (= c!69056 (= lt!278529 Undefined!6355))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37335 (_ BitVec 32)) SeekEntryResult!6355)

(assert (=> b!609450 (= lt!278529 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278532 lt!278539 mask!3053))))

(declare-fun e!349035 () Bool)

(assert (=> b!609450 e!349035))

(declare-fun res!392083 () Bool)

(assert (=> b!609450 (=> (not res!392083) (not e!349035))))

(declare-fun lt!278543 () SeekEntryResult!6355)

(declare-fun lt!278537 () (_ BitVec 32))

(assert (=> b!609450 (= res!392083 (= lt!278543 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278537 vacantSpotIndex!68 lt!278532 lt!278539 mask!3053)))))

(assert (=> b!609450 (= lt!278543 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278537 vacantSpotIndex!68 (select (arr!17918 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609450 (= lt!278532 (select (store (arr!17918 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278538 () Unit!19512)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19512)

(assert (=> b!609450 (= lt!278538 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278537 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609450 (= lt!278537 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609451 () Bool)

(declare-fun res!392075 () Bool)

(declare-fun e!349041 () Bool)

(assert (=> b!609451 (=> (not res!392075) (not e!349041))))

(declare-datatypes ((List!11998 0))(
  ( (Nil!11995) (Cons!11994 (h!13039 (_ BitVec 64)) (t!18217 List!11998)) )
))
(declare-fun arrayNoDuplicates!0 (array!37335 (_ BitVec 32) List!11998) Bool)

(assert (=> b!609451 (= res!392075 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11995))))

(declare-fun b!609452 () Bool)

(declare-fun e!349032 () Bool)

(assert (=> b!609452 (= e!349042 e!349032)))

(declare-fun res!392080 () Bool)

(assert (=> b!609452 (=> res!392080 e!349032)))

(assert (=> b!609452 (= res!392080 (bvsge index!984 j!136))))

(declare-fun lt!278545 () Unit!19512)

(declare-fun e!349038 () Unit!19512)

(assert (=> b!609452 (= lt!278545 e!349038)))

(declare-fun c!69057 () Bool)

(assert (=> b!609452 (= c!69057 (bvslt j!136 index!984))))

(declare-fun b!609453 () Bool)

(assert (=> b!609453 (= e!349040 e!349041)))

(declare-fun res!392077 () Bool)

(assert (=> b!609453 (=> (not res!392077) (not e!349041))))

(declare-fun lt!278535 () SeekEntryResult!6355)

(assert (=> b!609453 (= res!392077 (or (= lt!278535 (MissingZero!6355 i!1108)) (= lt!278535 (MissingVacant!6355 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37335 (_ BitVec 32)) SeekEntryResult!6355)

(assert (=> b!609453 (= lt!278535 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!392076 () Bool)

(assert (=> start!55590 (=> (not res!392076) (not e!349040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55590 (= res!392076 (validMask!0 mask!3053))))

(assert (=> start!55590 e!349040))

(assert (=> start!55590 true))

(declare-fun array_inv!13801 (array!37335) Bool)

(assert (=> start!55590 (array_inv!13801 a!2986)))

(declare-fun b!609454 () Bool)

(declare-fun res!392070 () Bool)

(assert (=> b!609454 (=> (not res!392070) (not e!349041))))

(assert (=> b!609454 (= res!392070 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17918 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!349031 () Bool)

(declare-fun b!609455 () Bool)

(assert (=> b!609455 (= e!349031 (arrayContainsKey!0 lt!278539 (select (arr!17918 a!2986) j!136) index!984))))

(declare-fun b!609456 () Bool)

(declare-fun e!349036 () Bool)

(assert (=> b!609456 (= e!349036 e!349031)))

(declare-fun res!392071 () Bool)

(assert (=> b!609456 (=> (not res!392071) (not e!349031))))

(assert (=> b!609456 (= res!392071 (arrayContainsKey!0 lt!278539 (select (arr!17918 a!2986) j!136) j!136))))

(declare-fun b!609457 () Bool)

(declare-fun Unit!19514 () Unit!19512)

(assert (=> b!609457 (= e!349043 Unit!19514)))

(assert (=> b!609457 false))

(declare-fun b!609458 () Bool)

(declare-fun res!392087 () Bool)

(assert (=> b!609458 (=> (not res!392087) (not e!349040))))

(assert (=> b!609458 (= res!392087 (and (= (size!18283 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18283 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18283 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609459 () Bool)

(assert (=> b!609459 (= e!349037 e!349036)))

(declare-fun res!392069 () Bool)

(assert (=> b!609459 (=> res!392069 e!349036)))

(assert (=> b!609459 (= res!392069 (or (not (= (select (arr!17918 a!2986) j!136) lt!278532)) (not (= (select (arr!17918 a!2986) j!136) lt!278536)) (bvsge j!136 index!984)))))

(declare-fun b!609460 () Bool)

(declare-fun e!349039 () Bool)

(assert (=> b!609460 (= e!349039 e!349034)))

(declare-fun res!392074 () Bool)

(assert (=> b!609460 (=> (not res!392074) (not e!349034))))

(declare-fun lt!278540 () SeekEntryResult!6355)

(assert (=> b!609460 (= res!392074 (and (= lt!278540 (Found!6355 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17918 a!2986) index!984) (select (arr!17918 a!2986) j!136))) (not (= (select (arr!17918 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609460 (= lt!278540 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17918 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609461 () Bool)

(assert (=> b!609461 (= e!349041 e!349039)))

(declare-fun res!392086 () Bool)

(assert (=> b!609461 (=> (not res!392086) (not e!349039))))

(assert (=> b!609461 (= res!392086 (= (select (store (arr!17918 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609461 (= lt!278539 (array!37336 (store (arr!17918 a!2986) i!1108 k0!1786) (size!18283 a!2986)))))

(declare-fun b!609462 () Bool)

(declare-fun res!392078 () Bool)

(assert (=> b!609462 (=> (not res!392078) (not e!349040))))

(assert (=> b!609462 (= res!392078 (validKeyInArray!0 (select (arr!17918 a!2986) j!136)))))

(declare-fun b!609463 () Bool)

(declare-fun Unit!19515 () Unit!19512)

(assert (=> b!609463 (= e!349038 Unit!19515)))

(declare-fun lt!278533 () Unit!19512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19512)

(assert (=> b!609463 (= lt!278533 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278539 (select (arr!17918 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609463 (arrayContainsKey!0 lt!278539 (select (arr!17918 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278534 () Unit!19512)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11998) Unit!19512)

(assert (=> b!609463 (= lt!278534 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11995))))

(assert (=> b!609463 (arrayNoDuplicates!0 lt!278539 #b00000000000000000000000000000000 Nil!11995)))

(declare-fun lt!278530 () Unit!19512)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37335 (_ BitVec 32) (_ BitVec 32)) Unit!19512)

(assert (=> b!609463 (= lt!278530 (lemmaNoDuplicateFromThenFromBigger!0 lt!278539 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609463 (arrayNoDuplicates!0 lt!278539 j!136 Nil!11995)))

(declare-fun lt!278542 () Unit!19512)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37335 (_ BitVec 64) (_ BitVec 32) List!11998) Unit!19512)

(assert (=> b!609463 (= lt!278542 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278539 (select (arr!17918 a!2986) j!136) j!136 Nil!11995))))

(assert (=> b!609463 false))

(declare-fun b!609464 () Bool)

(declare-fun res!392085 () Bool)

(assert (=> b!609464 (=> (not res!392085) (not e!349040))))

(assert (=> b!609464 (= res!392085 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609465 () Bool)

(declare-fun Unit!19516 () Unit!19512)

(assert (=> b!609465 (= e!349043 Unit!19516)))

(declare-fun b!609466 () Bool)

(declare-fun res!392082 () Bool)

(assert (=> b!609466 (=> (not res!392082) (not e!349041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37335 (_ BitVec 32)) Bool)

(assert (=> b!609466 (= res!392082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609467 () Bool)

(assert (=> b!609467 (= e!349035 (= lt!278540 lt!278543))))

(declare-fun b!609468 () Bool)

(assert (=> b!609468 (= e!349032 (bvsle #b00000000000000000000000000000000 (size!18283 a!2986)))))

(assert (=> b!609468 (arrayNoDuplicates!0 lt!278539 #b00000000000000000000000000000000 Nil!11995)))

(declare-fun lt!278531 () Unit!19512)

(assert (=> b!609468 (= lt!278531 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11995))))

(assert (=> b!609468 (arrayContainsKey!0 lt!278539 (select (arr!17918 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278541 () Unit!19512)

(assert (=> b!609468 (= lt!278541 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278539 (select (arr!17918 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609468 e!349030))

(declare-fun res!392072 () Bool)

(assert (=> b!609468 (=> (not res!392072) (not e!349030))))

(assert (=> b!609468 (= res!392072 (arrayContainsKey!0 lt!278539 (select (arr!17918 a!2986) j!136) j!136))))

(declare-fun b!609469 () Bool)

(declare-fun Unit!19517 () Unit!19512)

(assert (=> b!609469 (= e!349038 Unit!19517)))

(assert (= (and start!55590 res!392076) b!609458))

(assert (= (and b!609458 res!392087) b!609462))

(assert (= (and b!609462 res!392078) b!609449))

(assert (= (and b!609449 res!392084) b!609464))

(assert (= (and b!609464 res!392085) b!609453))

(assert (= (and b!609453 res!392077) b!609466))

(assert (= (and b!609466 res!392082) b!609451))

(assert (= (and b!609451 res!392075) b!609454))

(assert (= (and b!609454 res!392070) b!609461))

(assert (= (and b!609461 res!392086) b!609460))

(assert (= (and b!609460 res!392074) b!609450))

(assert (= (and b!609450 res!392083) b!609467))

(assert (= (and b!609450 c!69056) b!609457))

(assert (= (and b!609450 (not c!69056)) b!609465))

(assert (= (and b!609450 (not res!392081)) b!609447))

(assert (= (and b!609447 res!392073) b!609459))

(assert (= (and b!609459 (not res!392069)) b!609456))

(assert (= (and b!609456 res!392071) b!609455))

(assert (= (and b!609447 (not res!392079)) b!609452))

(assert (= (and b!609452 c!69057) b!609463))

(assert (= (and b!609452 (not c!69057)) b!609469))

(assert (= (and b!609452 (not res!392080)) b!609468))

(assert (= (and b!609468 res!392072) b!609448))

(declare-fun m!585439 () Bool)

(assert (=> b!609463 m!585439))

(declare-fun m!585441 () Bool)

(assert (=> b!609463 m!585441))

(declare-fun m!585443 () Bool)

(assert (=> b!609463 m!585443))

(declare-fun m!585445 () Bool)

(assert (=> b!609463 m!585445))

(assert (=> b!609463 m!585439))

(declare-fun m!585447 () Bool)

(assert (=> b!609463 m!585447))

(assert (=> b!609463 m!585439))

(declare-fun m!585449 () Bool)

(assert (=> b!609463 m!585449))

(assert (=> b!609463 m!585439))

(declare-fun m!585451 () Bool)

(assert (=> b!609463 m!585451))

(declare-fun m!585453 () Bool)

(assert (=> b!609463 m!585453))

(assert (=> b!609459 m!585439))

(declare-fun m!585455 () Bool)

(assert (=> b!609453 m!585455))

(assert (=> b!609462 m!585439))

(assert (=> b!609462 m!585439))

(declare-fun m!585457 () Bool)

(assert (=> b!609462 m!585457))

(declare-fun m!585459 () Bool)

(assert (=> b!609454 m!585459))

(declare-fun m!585461 () Bool)

(assert (=> b!609466 m!585461))

(assert (=> b!609455 m!585439))

(assert (=> b!609455 m!585439))

(declare-fun m!585463 () Bool)

(assert (=> b!609455 m!585463))

(declare-fun m!585465 () Bool)

(assert (=> b!609450 m!585465))

(declare-fun m!585467 () Bool)

(assert (=> b!609450 m!585467))

(declare-fun m!585469 () Bool)

(assert (=> b!609450 m!585469))

(declare-fun m!585471 () Bool)

(assert (=> b!609450 m!585471))

(assert (=> b!609450 m!585439))

(declare-fun m!585473 () Bool)

(assert (=> b!609450 m!585473))

(assert (=> b!609450 m!585439))

(declare-fun m!585475 () Bool)

(assert (=> b!609450 m!585475))

(declare-fun m!585477 () Bool)

(assert (=> b!609450 m!585477))

(declare-fun m!585479 () Bool)

(assert (=> start!55590 m!585479))

(declare-fun m!585481 () Bool)

(assert (=> start!55590 m!585481))

(assert (=> b!609456 m!585439))

(assert (=> b!609456 m!585439))

(declare-fun m!585483 () Bool)

(assert (=> b!609456 m!585483))

(declare-fun m!585485 () Bool)

(assert (=> b!609460 m!585485))

(assert (=> b!609460 m!585439))

(assert (=> b!609460 m!585439))

(declare-fun m!585487 () Bool)

(assert (=> b!609460 m!585487))

(assert (=> b!609447 m!585439))

(assert (=> b!609447 m!585475))

(declare-fun m!585489 () Bool)

(assert (=> b!609447 m!585489))

(assert (=> b!609448 m!585439))

(assert (=> b!609448 m!585439))

(assert (=> b!609448 m!585463))

(assert (=> b!609461 m!585475))

(declare-fun m!585491 () Bool)

(assert (=> b!609461 m!585491))

(declare-fun m!585493 () Bool)

(assert (=> b!609464 m!585493))

(assert (=> b!609468 m!585439))

(declare-fun m!585495 () Bool)

(assert (=> b!609468 m!585495))

(assert (=> b!609468 m!585439))

(assert (=> b!609468 m!585447))

(assert (=> b!609468 m!585439))

(declare-fun m!585497 () Bool)

(assert (=> b!609468 m!585497))

(assert (=> b!609468 m!585439))

(assert (=> b!609468 m!585483))

(assert (=> b!609468 m!585453))

(declare-fun m!585499 () Bool)

(assert (=> b!609449 m!585499))

(declare-fun m!585501 () Bool)

(assert (=> b!609451 m!585501))

(check-sat (not b!609468) (not b!609463) (not b!609448) (not b!609450) (not b!609462) (not b!609455) (not b!609449) (not b!609466) (not b!609453) (not b!609451) (not b!609464) (not b!609456) (not b!609460) (not start!55590))
(check-sat)
