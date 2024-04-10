; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55016 () Bool)

(assert start!55016)

(declare-fun b!602333 () Bool)

(declare-datatypes ((Unit!19078 0))(
  ( (Unit!19079) )
))
(declare-fun e!344487 () Unit!19078)

(declare-fun Unit!19080 () Unit!19078)

(assert (=> b!602333 (= e!344487 Unit!19080)))

(declare-fun b!602334 () Bool)

(declare-fun e!344481 () Bool)

(declare-fun e!344486 () Bool)

(assert (=> b!602334 (= e!344481 e!344486)))

(declare-fun res!386790 () Bool)

(assert (=> b!602334 (=> res!386790 e!344486)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!274334 () (_ BitVec 64))

(declare-fun lt!274336 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37170 0))(
  ( (array!37171 (arr!17843 (Array (_ BitVec 32) (_ BitVec 64))) (size!18207 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37170)

(assert (=> b!602334 (= res!386790 (or (not (= (select (arr!17843 a!2986) j!136) lt!274336)) (not (= (select (arr!17843 a!2986) j!136) lt!274334)) (bvsge j!136 index!984)))))

(declare-fun b!602335 () Bool)

(declare-fun res!386781 () Bool)

(declare-fun e!344478 () Bool)

(assert (=> b!602335 (=> (not res!386781) (not e!344478))))

(declare-datatypes ((List!11884 0))(
  ( (Nil!11881) (Cons!11880 (h!12925 (_ BitVec 64)) (t!18112 List!11884)) )
))
(declare-fun arrayNoDuplicates!0 (array!37170 (_ BitVec 32) List!11884) Bool)

(assert (=> b!602335 (= res!386781 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11881))))

(declare-fun b!602336 () Bool)

(declare-fun Unit!19081 () Unit!19078)

(assert (=> b!602336 (= e!344487 Unit!19081)))

(declare-fun lt!274335 () array!37170)

(declare-fun lt!274347 () Unit!19078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19078)

(assert (=> b!602336 (= lt!274347 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274335 (select (arr!17843 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602336 (arrayContainsKey!0 lt!274335 (select (arr!17843 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!274339 () Unit!19078)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11884) Unit!19078)

(assert (=> b!602336 (= lt!274339 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11881))))

(assert (=> b!602336 (arrayNoDuplicates!0 lt!274335 #b00000000000000000000000000000000 Nil!11881)))

(declare-fun lt!274345 () Unit!19078)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37170 (_ BitVec 32) (_ BitVec 32)) Unit!19078)

(assert (=> b!602336 (= lt!274345 (lemmaNoDuplicateFromThenFromBigger!0 lt!274335 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602336 (arrayNoDuplicates!0 lt!274335 j!136 Nil!11881)))

(declare-fun lt!274344 () Unit!19078)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37170 (_ BitVec 64) (_ BitVec 32) List!11884) Unit!19078)

(assert (=> b!602336 (= lt!274344 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274335 (select (arr!17843 a!2986) j!136) j!136 Nil!11881))))

(assert (=> b!602336 false))

(declare-fun b!602337 () Bool)

(declare-fun e!344477 () Bool)

(declare-fun e!344485 () Bool)

(assert (=> b!602337 (= e!344477 e!344485)))

(declare-fun res!386776 () Bool)

(assert (=> b!602337 (=> (not res!386776) (not e!344485))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6283 0))(
  ( (MissingZero!6283 (index!27392 (_ BitVec 32))) (Found!6283 (index!27393 (_ BitVec 32))) (Intermediate!6283 (undefined!7095 Bool) (index!27394 (_ BitVec 32)) (x!56187 (_ BitVec 32))) (Undefined!6283) (MissingVacant!6283 (index!27395 (_ BitVec 32))) )
))
(declare-fun lt!274338 () SeekEntryResult!6283)

(assert (=> b!602337 (= res!386776 (and (= lt!274338 (Found!6283 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17843 a!2986) index!984) (select (arr!17843 a!2986) j!136))) (not (= (select (arr!17843 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37170 (_ BitVec 32)) SeekEntryResult!6283)

(assert (=> b!602337 (= lt!274338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602338 () Bool)

(declare-fun res!386791 () Bool)

(assert (=> b!602338 (=> (not res!386791) (not e!344478))))

(assert (=> b!602338 (= res!386791 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17843 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602339 () Bool)

(declare-fun e!344475 () Unit!19078)

(declare-fun Unit!19082 () Unit!19078)

(assert (=> b!602339 (= e!344475 Unit!19082)))

(assert (=> b!602339 false))

(declare-fun b!602340 () Bool)

(declare-fun res!386780 () Bool)

(assert (=> b!602340 (=> (not res!386780) (not e!344478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37170 (_ BitVec 32)) Bool)

(assert (=> b!602340 (= res!386780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602341 () Bool)

(declare-fun e!344482 () Bool)

(assert (=> b!602341 (= e!344482 e!344478)))

(declare-fun res!386782 () Bool)

(assert (=> b!602341 (=> (not res!386782) (not e!344478))))

(declare-fun lt!274340 () SeekEntryResult!6283)

(assert (=> b!602341 (= res!386782 (or (= lt!274340 (MissingZero!6283 i!1108)) (= lt!274340 (MissingVacant!6283 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37170 (_ BitVec 32)) SeekEntryResult!6283)

(assert (=> b!602341 (= lt!274340 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!602342 () Bool)

(assert (=> b!602342 (= e!344478 e!344477)))

(declare-fun res!386786 () Bool)

(assert (=> b!602342 (=> (not res!386786) (not e!344477))))

(assert (=> b!602342 (= res!386786 (= (select (store (arr!17843 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602342 (= lt!274335 (array!37171 (store (arr!17843 a!2986) i!1108 k!1786) (size!18207 a!2986)))))

(declare-fun b!602343 () Bool)

(declare-fun res!386789 () Bool)

(assert (=> b!602343 (=> (not res!386789) (not e!344482))))

(assert (=> b!602343 (= res!386789 (and (= (size!18207 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18207 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18207 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602345 () Bool)

(declare-fun e!344474 () Bool)

(declare-fun e!344479 () Bool)

(assert (=> b!602345 (= e!344474 e!344479)))

(declare-fun res!386778 () Bool)

(assert (=> b!602345 (=> res!386778 e!344479)))

(assert (=> b!602345 (= res!386778 (bvsge index!984 j!136))))

(declare-fun lt!274337 () Unit!19078)

(assert (=> b!602345 (= lt!274337 e!344487)))

(declare-fun c!68147 () Bool)

(assert (=> b!602345 (= c!68147 (bvslt j!136 index!984))))

(declare-fun b!602346 () Bool)

(declare-fun e!344483 () Bool)

(assert (=> b!602346 (= e!344483 e!344474)))

(declare-fun res!386788 () Bool)

(assert (=> b!602346 (=> res!386788 e!344474)))

(assert (=> b!602346 (= res!386788 (or (not (= (select (arr!17843 a!2986) j!136) lt!274336)) (not (= (select (arr!17843 a!2986) j!136) lt!274334))))))

(assert (=> b!602346 e!344481))

(declare-fun res!386783 () Bool)

(assert (=> b!602346 (=> (not res!386783) (not e!344481))))

(assert (=> b!602346 (= res!386783 (= lt!274334 (select (arr!17843 a!2986) j!136)))))

(assert (=> b!602346 (= lt!274334 (select (store (arr!17843 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602347 () Bool)

(declare-fun res!386777 () Bool)

(assert (=> b!602347 (=> (not res!386777) (not e!344482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602347 (= res!386777 (validKeyInArray!0 (select (arr!17843 a!2986) j!136)))))

(declare-fun b!602348 () Bool)

(declare-fun Unit!19083 () Unit!19078)

(assert (=> b!602348 (= e!344475 Unit!19083)))

(declare-fun b!602349 () Bool)

(declare-fun res!386785 () Bool)

(assert (=> b!602349 (=> (not res!386785) (not e!344482))))

(assert (=> b!602349 (= res!386785 (validKeyInArray!0 k!1786))))

(declare-fun b!602350 () Bool)

(declare-fun res!386775 () Bool)

(assert (=> b!602350 (=> (not res!386775) (not e!344482))))

(assert (=> b!602350 (= res!386775 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602344 () Bool)

(declare-fun e!344476 () Bool)

(assert (=> b!602344 (= e!344476 (arrayContainsKey!0 lt!274335 (select (arr!17843 a!2986) j!136) index!984))))

(declare-fun res!386779 () Bool)

(assert (=> start!55016 (=> (not res!386779) (not e!344482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55016 (= res!386779 (validMask!0 mask!3053))))

(assert (=> start!55016 e!344482))

(assert (=> start!55016 true))

(declare-fun array_inv!13639 (array!37170) Bool)

(assert (=> start!55016 (array_inv!13639 a!2986)))

(declare-fun b!602351 () Bool)

(assert (=> b!602351 (= e!344479 (bvslt index!984 (size!18207 a!2986)))))

(assert (=> b!602351 (arrayContainsKey!0 lt!274335 (select (arr!17843 a!2986) j!136) j!136)))

(declare-fun b!602352 () Bool)

(assert (=> b!602352 (= e!344486 e!344476)))

(declare-fun res!386787 () Bool)

(assert (=> b!602352 (=> (not res!386787) (not e!344476))))

(assert (=> b!602352 (= res!386787 (arrayContainsKey!0 lt!274335 (select (arr!17843 a!2986) j!136) j!136))))

(declare-fun b!602353 () Bool)

(assert (=> b!602353 (= e!344485 (not e!344483))))

(declare-fun res!386784 () Bool)

(assert (=> b!602353 (=> res!386784 e!344483)))

(declare-fun lt!274342 () SeekEntryResult!6283)

(assert (=> b!602353 (= res!386784 (not (= lt!274342 (Found!6283 index!984))))))

(declare-fun lt!274343 () Unit!19078)

(assert (=> b!602353 (= lt!274343 e!344475)))

(declare-fun c!68146 () Bool)

(assert (=> b!602353 (= c!68146 (= lt!274342 Undefined!6283))))

(assert (=> b!602353 (= lt!274342 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274336 lt!274335 mask!3053))))

(declare-fun e!344484 () Bool)

(assert (=> b!602353 e!344484))

(declare-fun res!386792 () Bool)

(assert (=> b!602353 (=> (not res!386792) (not e!344484))))

(declare-fun lt!274346 () SeekEntryResult!6283)

(declare-fun lt!274348 () (_ BitVec 32))

(assert (=> b!602353 (= res!386792 (= lt!274346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274348 vacantSpotIndex!68 lt!274336 lt!274335 mask!3053)))))

(assert (=> b!602353 (= lt!274346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274348 vacantSpotIndex!68 (select (arr!17843 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602353 (= lt!274336 (select (store (arr!17843 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274341 () Unit!19078)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37170 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19078)

(assert (=> b!602353 (= lt!274341 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274348 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602353 (= lt!274348 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602354 () Bool)

(assert (=> b!602354 (= e!344484 (= lt!274338 lt!274346))))

(assert (= (and start!55016 res!386779) b!602343))

(assert (= (and b!602343 res!386789) b!602347))

(assert (= (and b!602347 res!386777) b!602349))

(assert (= (and b!602349 res!386785) b!602350))

(assert (= (and b!602350 res!386775) b!602341))

(assert (= (and b!602341 res!386782) b!602340))

(assert (= (and b!602340 res!386780) b!602335))

(assert (= (and b!602335 res!386781) b!602338))

(assert (= (and b!602338 res!386791) b!602342))

(assert (= (and b!602342 res!386786) b!602337))

(assert (= (and b!602337 res!386776) b!602353))

(assert (= (and b!602353 res!386792) b!602354))

(assert (= (and b!602353 c!68146) b!602339))

(assert (= (and b!602353 (not c!68146)) b!602348))

(assert (= (and b!602353 (not res!386784)) b!602346))

(assert (= (and b!602346 res!386783) b!602334))

(assert (= (and b!602334 (not res!386790)) b!602352))

(assert (= (and b!602352 res!386787) b!602344))

(assert (= (and b!602346 (not res!386788)) b!602345))

(assert (= (and b!602345 c!68147) b!602336))

(assert (= (and b!602345 (not c!68147)) b!602333))

(assert (= (and b!602345 (not res!386778)) b!602351))

(declare-fun m!579461 () Bool)

(assert (=> b!602344 m!579461))

(assert (=> b!602344 m!579461))

(declare-fun m!579463 () Bool)

(assert (=> b!602344 m!579463))

(declare-fun m!579465 () Bool)

(assert (=> b!602335 m!579465))

(declare-fun m!579467 () Bool)

(assert (=> b!602349 m!579467))

(assert (=> b!602351 m!579461))

(assert (=> b!602351 m!579461))

(declare-fun m!579469 () Bool)

(assert (=> b!602351 m!579469))

(assert (=> b!602336 m!579461))

(assert (=> b!602336 m!579461))

(declare-fun m!579471 () Bool)

(assert (=> b!602336 m!579471))

(assert (=> b!602336 m!579461))

(declare-fun m!579473 () Bool)

(assert (=> b!602336 m!579473))

(declare-fun m!579475 () Bool)

(assert (=> b!602336 m!579475))

(declare-fun m!579477 () Bool)

(assert (=> b!602336 m!579477))

(declare-fun m!579479 () Bool)

(assert (=> b!602336 m!579479))

(assert (=> b!602336 m!579461))

(declare-fun m!579481 () Bool)

(assert (=> b!602336 m!579481))

(declare-fun m!579483 () Bool)

(assert (=> b!602336 m!579483))

(declare-fun m!579485 () Bool)

(assert (=> start!55016 m!579485))

(declare-fun m!579487 () Bool)

(assert (=> start!55016 m!579487))

(declare-fun m!579489 () Bool)

(assert (=> b!602353 m!579489))

(declare-fun m!579491 () Bool)

(assert (=> b!602353 m!579491))

(assert (=> b!602353 m!579461))

(declare-fun m!579493 () Bool)

(assert (=> b!602353 m!579493))

(declare-fun m!579495 () Bool)

(assert (=> b!602353 m!579495))

(declare-fun m!579497 () Bool)

(assert (=> b!602353 m!579497))

(assert (=> b!602353 m!579461))

(declare-fun m!579499 () Bool)

(assert (=> b!602353 m!579499))

(declare-fun m!579501 () Bool)

(assert (=> b!602353 m!579501))

(assert (=> b!602352 m!579461))

(assert (=> b!602352 m!579461))

(assert (=> b!602352 m!579469))

(assert (=> b!602342 m!579493))

(declare-fun m!579503 () Bool)

(assert (=> b!602342 m!579503))

(assert (=> b!602346 m!579461))

(assert (=> b!602346 m!579493))

(declare-fun m!579505 () Bool)

(assert (=> b!602346 m!579505))

(declare-fun m!579507 () Bool)

(assert (=> b!602350 m!579507))

(assert (=> b!602347 m!579461))

(assert (=> b!602347 m!579461))

(declare-fun m!579509 () Bool)

(assert (=> b!602347 m!579509))

(declare-fun m!579511 () Bool)

(assert (=> b!602341 m!579511))

(declare-fun m!579513 () Bool)

(assert (=> b!602340 m!579513))

(assert (=> b!602334 m!579461))

(declare-fun m!579515 () Bool)

(assert (=> b!602338 m!579515))

(declare-fun m!579517 () Bool)

(assert (=> b!602337 m!579517))

(assert (=> b!602337 m!579461))

(assert (=> b!602337 m!579461))

(declare-fun m!579519 () Bool)

(assert (=> b!602337 m!579519))

(push 1)

(assert (not b!602340))

(assert (not b!602336))

(assert (not b!602337))

(assert (not b!602351))

(assert (not b!602350))

(assert (not b!602341))

(assert (not b!602352))

(assert (not b!602347))

(assert (not b!602353))

(assert (not b!602344))

(assert (not b!602335))

(assert (not start!55016))

(assert (not b!602349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

