; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56194 () Bool)

(assert start!56194)

(declare-fun b!622497 () Bool)

(declare-fun e!357052 () Bool)

(declare-fun e!357058 () Bool)

(assert (=> b!622497 (= e!357052 e!357058)))

(declare-fun res!401176 () Bool)

(assert (=> b!622497 (=> (not res!401176) (not e!357058))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37664 0))(
  ( (array!37665 (arr!18078 (Array (_ BitVec 32) (_ BitVec 64))) (size!18442 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37664)

(assert (=> b!622497 (= res!401176 (= (select (store (arr!18078 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!288456 () array!37664)

(assert (=> b!622497 (= lt!288456 (array!37665 (store (arr!18078 a!2986) i!1108 k!1786) (size!18442 a!2986)))))

(declare-fun b!622498 () Bool)

(declare-datatypes ((Unit!20908 0))(
  ( (Unit!20909) )
))
(declare-fun e!357051 () Unit!20908)

(declare-fun Unit!20910 () Unit!20908)

(assert (=> b!622498 (= e!357051 Unit!20910)))

(declare-fun b!622499 () Bool)

(declare-fun res!401186 () Bool)

(declare-fun e!357059 () Bool)

(assert (=> b!622499 (=> (not res!401186) (not e!357059))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622499 (= res!401186 (validKeyInArray!0 (select (arr!18078 a!2986) j!136)))))

(declare-fun b!622500 () Bool)

(declare-fun e!357057 () Bool)

(assert (=> b!622500 (= e!357058 e!357057)))

(declare-fun res!401174 () Bool)

(assert (=> b!622500 (=> (not res!401174) (not e!357057))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6518 0))(
  ( (MissingZero!6518 (index!28356 (_ BitVec 32))) (Found!6518 (index!28357 (_ BitVec 32))) (Intermediate!6518 (undefined!7330 Bool) (index!28358 (_ BitVec 32)) (x!57126 (_ BitVec 32))) (Undefined!6518) (MissingVacant!6518 (index!28359 (_ BitVec 32))) )
))
(declare-fun lt!288448 () SeekEntryResult!6518)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622500 (= res!401174 (and (= lt!288448 (Found!6518 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18078 a!2986) index!984) (select (arr!18078 a!2986) j!136))) (not (= (select (arr!18078 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37664 (_ BitVec 32)) SeekEntryResult!6518)

(assert (=> b!622500 (= lt!288448 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18078 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622501 () Bool)

(declare-fun e!357054 () Unit!20908)

(declare-fun Unit!20911 () Unit!20908)

(assert (=> b!622501 (= e!357054 Unit!20911)))

(declare-fun b!622502 () Bool)

(declare-fun e!357048 () Unit!20908)

(declare-fun Unit!20912 () Unit!20908)

(assert (=> b!622502 (= e!357048 Unit!20912)))

(declare-fun res!401183 () Bool)

(assert (=> b!622502 (= res!401183 (= (select (store (arr!18078 a!2986) i!1108 k!1786) index!984) (select (arr!18078 a!2986) j!136)))))

(declare-fun e!357053 () Bool)

(assert (=> b!622502 (=> (not res!401183) (not e!357053))))

(assert (=> b!622502 e!357053))

(declare-fun c!71032 () Bool)

(assert (=> b!622502 (= c!71032 (bvslt j!136 index!984))))

(declare-fun lt!288444 () Unit!20908)

(assert (=> b!622502 (= lt!288444 e!357054)))

(declare-fun c!71033 () Bool)

(assert (=> b!622502 (= c!71033 (bvslt index!984 j!136))))

(declare-fun lt!288455 () Unit!20908)

(declare-fun e!357050 () Unit!20908)

(assert (=> b!622502 (= lt!288455 e!357050)))

(assert (=> b!622502 false))

(declare-fun b!622503 () Bool)

(declare-fun res!401173 () Bool)

(assert (=> b!622503 (= res!401173 (bvsge j!136 index!984))))

(declare-fun e!357060 () Bool)

(assert (=> b!622503 (=> res!401173 e!357060)))

(assert (=> b!622503 (= e!357053 e!357060)))

(declare-fun b!622504 () Bool)

(declare-fun e!357056 () Bool)

(declare-fun lt!288453 () SeekEntryResult!6518)

(assert (=> b!622504 (= e!357056 (= lt!288448 lt!288453))))

(declare-fun b!622505 () Bool)

(declare-fun Unit!20913 () Unit!20908)

(assert (=> b!622505 (= e!357051 Unit!20913)))

(assert (=> b!622505 false))

(declare-fun e!357047 () Bool)

(declare-fun b!622506 () Bool)

(declare-fun arrayContainsKey!0 (array!37664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622506 (= e!357047 (arrayContainsKey!0 lt!288456 (select (arr!18078 a!2986) j!136) index!984))))

(declare-fun b!622507 () Bool)

(assert (=> b!622507 (= e!357057 (not true))))

(declare-fun lt!288454 () Unit!20908)

(assert (=> b!622507 (= lt!288454 e!357048)))

(declare-fun c!71030 () Bool)

(declare-fun lt!288450 () SeekEntryResult!6518)

(assert (=> b!622507 (= c!71030 (= lt!288450 (Found!6518 index!984)))))

(declare-fun lt!288446 () Unit!20908)

(assert (=> b!622507 (= lt!288446 e!357051)))

(declare-fun c!71031 () Bool)

(assert (=> b!622507 (= c!71031 (= lt!288450 Undefined!6518))))

(declare-fun lt!288438 () (_ BitVec 64))

(assert (=> b!622507 (= lt!288450 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288438 lt!288456 mask!3053))))

(assert (=> b!622507 e!357056))

(declare-fun res!401185 () Bool)

(assert (=> b!622507 (=> (not res!401185) (not e!357056))))

(declare-fun lt!288441 () (_ BitVec 32))

(assert (=> b!622507 (= res!401185 (= lt!288453 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288441 vacantSpotIndex!68 lt!288438 lt!288456 mask!3053)))))

(assert (=> b!622507 (= lt!288453 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288441 vacantSpotIndex!68 (select (arr!18078 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622507 (= lt!288438 (select (store (arr!18078 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288440 () Unit!20908)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37664 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20908)

(assert (=> b!622507 (= lt!288440 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288441 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622507 (= lt!288441 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!401171 () Bool)

(assert (=> start!56194 (=> (not res!401171) (not e!357059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56194 (= res!401171 (validMask!0 mask!3053))))

(assert (=> start!56194 e!357059))

(assert (=> start!56194 true))

(declare-fun array_inv!13874 (array!37664) Bool)

(assert (=> start!56194 (array_inv!13874 a!2986)))

(declare-fun b!622508 () Bool)

(declare-fun res!401184 () Bool)

(assert (=> b!622508 (=> (not res!401184) (not e!357059))))

(assert (=> b!622508 (= res!401184 (and (= (size!18442 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18442 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18442 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622509 () Bool)

(declare-fun res!401182 () Bool)

(assert (=> b!622509 (=> (not res!401182) (not e!357052))))

(declare-datatypes ((List!12119 0))(
  ( (Nil!12116) (Cons!12115 (h!13160 (_ BitVec 64)) (t!18347 List!12119)) )
))
(declare-fun arrayNoDuplicates!0 (array!37664 (_ BitVec 32) List!12119) Bool)

(assert (=> b!622509 (= res!401182 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12116))))

(declare-fun b!622510 () Bool)

(assert (=> b!622510 false))

(declare-fun lt!288445 () Unit!20908)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37664 (_ BitVec 64) (_ BitVec 32) List!12119) Unit!20908)

(assert (=> b!622510 (= lt!288445 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288456 (select (arr!18078 a!2986) j!136) index!984 Nil!12116))))

(assert (=> b!622510 (arrayNoDuplicates!0 lt!288456 index!984 Nil!12116)))

(declare-fun lt!288449 () Unit!20908)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37664 (_ BitVec 32) (_ BitVec 32)) Unit!20908)

(assert (=> b!622510 (= lt!288449 (lemmaNoDuplicateFromThenFromBigger!0 lt!288456 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622510 (arrayNoDuplicates!0 lt!288456 #b00000000000000000000000000000000 Nil!12116)))

(declare-fun lt!288447 () Unit!20908)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12119) Unit!20908)

(assert (=> b!622510 (= lt!288447 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12116))))

(assert (=> b!622510 (arrayContainsKey!0 lt!288456 (select (arr!18078 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288442 () Unit!20908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20908)

(assert (=> b!622510 (= lt!288442 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288456 (select (arr!18078 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622510 e!357047))

(declare-fun res!401175 () Bool)

(assert (=> b!622510 (=> (not res!401175) (not e!357047))))

(assert (=> b!622510 (= res!401175 (arrayContainsKey!0 lt!288456 (select (arr!18078 a!2986) j!136) j!136))))

(declare-fun Unit!20914 () Unit!20908)

(assert (=> b!622510 (= e!357050 Unit!20914)))

(declare-fun b!622511 () Bool)

(declare-fun res!401181 () Bool)

(assert (=> b!622511 (= res!401181 (arrayContainsKey!0 lt!288456 (select (arr!18078 a!2986) j!136) j!136))))

(declare-fun e!357055 () Bool)

(assert (=> b!622511 (=> (not res!401181) (not e!357055))))

(assert (=> b!622511 (= e!357060 e!357055)))

(declare-fun b!622512 () Bool)

(declare-fun res!401179 () Bool)

(assert (=> b!622512 (=> (not res!401179) (not e!357052))))

(assert (=> b!622512 (= res!401179 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18078 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622513 () Bool)

(declare-fun res!401177 () Bool)

(assert (=> b!622513 (=> (not res!401177) (not e!357059))))

(assert (=> b!622513 (= res!401177 (validKeyInArray!0 k!1786))))

(declare-fun b!622514 () Bool)

(declare-fun Unit!20915 () Unit!20908)

(assert (=> b!622514 (= e!357050 Unit!20915)))

(declare-fun b!622515 () Bool)

(declare-fun res!401178 () Bool)

(assert (=> b!622515 (=> (not res!401178) (not e!357059))))

(assert (=> b!622515 (= res!401178 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622516 () Bool)

(declare-fun res!401180 () Bool)

(assert (=> b!622516 (=> (not res!401180) (not e!357052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37664 (_ BitVec 32)) Bool)

(assert (=> b!622516 (= res!401180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622517 () Bool)

(assert (=> b!622517 (= e!357059 e!357052)))

(declare-fun res!401172 () Bool)

(assert (=> b!622517 (=> (not res!401172) (not e!357052))))

(declare-fun lt!288439 () SeekEntryResult!6518)

(assert (=> b!622517 (= res!401172 (or (= lt!288439 (MissingZero!6518 i!1108)) (= lt!288439 (MissingVacant!6518 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37664 (_ BitVec 32)) SeekEntryResult!6518)

(assert (=> b!622517 (= lt!288439 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622518 () Bool)

(assert (=> b!622518 false))

(declare-fun lt!288443 () Unit!20908)

(assert (=> b!622518 (= lt!288443 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288456 (select (arr!18078 a!2986) j!136) j!136 Nil!12116))))

(assert (=> b!622518 (arrayNoDuplicates!0 lt!288456 j!136 Nil!12116)))

(declare-fun lt!288457 () Unit!20908)

(assert (=> b!622518 (= lt!288457 (lemmaNoDuplicateFromThenFromBigger!0 lt!288456 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622518 (arrayNoDuplicates!0 lt!288456 #b00000000000000000000000000000000 Nil!12116)))

(declare-fun lt!288452 () Unit!20908)

(assert (=> b!622518 (= lt!288452 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12116))))

(assert (=> b!622518 (arrayContainsKey!0 lt!288456 (select (arr!18078 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288451 () Unit!20908)

(assert (=> b!622518 (= lt!288451 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288456 (select (arr!18078 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20916 () Unit!20908)

(assert (=> b!622518 (= e!357054 Unit!20916)))

(declare-fun b!622519 () Bool)

(assert (=> b!622519 (= e!357055 (arrayContainsKey!0 lt!288456 (select (arr!18078 a!2986) j!136) index!984))))

(declare-fun b!622520 () Bool)

(declare-fun Unit!20917 () Unit!20908)

(assert (=> b!622520 (= e!357048 Unit!20917)))

(assert (= (and start!56194 res!401171) b!622508))

(assert (= (and b!622508 res!401184) b!622499))

(assert (= (and b!622499 res!401186) b!622513))

(assert (= (and b!622513 res!401177) b!622515))

(assert (= (and b!622515 res!401178) b!622517))

(assert (= (and b!622517 res!401172) b!622516))

(assert (= (and b!622516 res!401180) b!622509))

(assert (= (and b!622509 res!401182) b!622512))

(assert (= (and b!622512 res!401179) b!622497))

(assert (= (and b!622497 res!401176) b!622500))

(assert (= (and b!622500 res!401174) b!622507))

(assert (= (and b!622507 res!401185) b!622504))

(assert (= (and b!622507 c!71031) b!622505))

(assert (= (and b!622507 (not c!71031)) b!622498))

(assert (= (and b!622507 c!71030) b!622502))

(assert (= (and b!622507 (not c!71030)) b!622520))

(assert (= (and b!622502 res!401183) b!622503))

(assert (= (and b!622503 (not res!401173)) b!622511))

(assert (= (and b!622511 res!401181) b!622519))

(assert (= (and b!622502 c!71032) b!622518))

(assert (= (and b!622502 (not c!71032)) b!622501))

(assert (= (and b!622502 c!71033) b!622510))

(assert (= (and b!622502 (not c!71033)) b!622514))

(assert (= (and b!622510 res!401175) b!622506))

(declare-fun m!598361 () Bool)

(assert (=> b!622502 m!598361))

(declare-fun m!598363 () Bool)

(assert (=> b!622502 m!598363))

(declare-fun m!598365 () Bool)

(assert (=> b!622502 m!598365))

(assert (=> b!622506 m!598365))

(assert (=> b!622506 m!598365))

(declare-fun m!598367 () Bool)

(assert (=> b!622506 m!598367))

(declare-fun m!598369 () Bool)

(assert (=> b!622507 m!598369))

(declare-fun m!598371 () Bool)

(assert (=> b!622507 m!598371))

(assert (=> b!622507 m!598365))

(assert (=> b!622507 m!598361))

(declare-fun m!598373 () Bool)

(assert (=> b!622507 m!598373))

(declare-fun m!598375 () Bool)

(assert (=> b!622507 m!598375))

(declare-fun m!598377 () Bool)

(assert (=> b!622507 m!598377))

(assert (=> b!622507 m!598365))

(declare-fun m!598379 () Bool)

(assert (=> b!622507 m!598379))

(assert (=> b!622510 m!598365))

(declare-fun m!598381 () Bool)

(assert (=> b!622510 m!598381))

(declare-fun m!598383 () Bool)

(assert (=> b!622510 m!598383))

(assert (=> b!622510 m!598365))

(assert (=> b!622510 m!598365))

(declare-fun m!598385 () Bool)

(assert (=> b!622510 m!598385))

(declare-fun m!598387 () Bool)

(assert (=> b!622510 m!598387))

(assert (=> b!622510 m!598365))

(declare-fun m!598389 () Bool)

(assert (=> b!622510 m!598389))

(assert (=> b!622510 m!598365))

(declare-fun m!598391 () Bool)

(assert (=> b!622510 m!598391))

(declare-fun m!598393 () Bool)

(assert (=> b!622510 m!598393))

(declare-fun m!598395 () Bool)

(assert (=> b!622510 m!598395))

(declare-fun m!598397 () Bool)

(assert (=> start!56194 m!598397))

(declare-fun m!598399 () Bool)

(assert (=> start!56194 m!598399))

(declare-fun m!598401 () Bool)

(assert (=> b!622513 m!598401))

(declare-fun m!598403 () Bool)

(assert (=> b!622517 m!598403))

(assert (=> b!622497 m!598361))

(declare-fun m!598405 () Bool)

(assert (=> b!622497 m!598405))

(assert (=> b!622519 m!598365))

(assert (=> b!622519 m!598365))

(assert (=> b!622519 m!598367))

(declare-fun m!598407 () Bool)

(assert (=> b!622518 m!598407))

(assert (=> b!622518 m!598365))

(declare-fun m!598409 () Bool)

(assert (=> b!622518 m!598409))

(assert (=> b!622518 m!598365))

(assert (=> b!622518 m!598387))

(declare-fun m!598411 () Bool)

(assert (=> b!622518 m!598411))

(assert (=> b!622518 m!598365))

(declare-fun m!598413 () Bool)

(assert (=> b!622518 m!598413))

(assert (=> b!622518 m!598365))

(declare-fun m!598415 () Bool)

(assert (=> b!622518 m!598415))

(assert (=> b!622518 m!598395))

(declare-fun m!598417 () Bool)

(assert (=> b!622516 m!598417))

(declare-fun m!598419 () Bool)

(assert (=> b!622500 m!598419))

(assert (=> b!622500 m!598365))

(assert (=> b!622500 m!598365))

(declare-fun m!598421 () Bool)

(assert (=> b!622500 m!598421))

(assert (=> b!622499 m!598365))

(assert (=> b!622499 m!598365))

(declare-fun m!598423 () Bool)

(assert (=> b!622499 m!598423))

(declare-fun m!598425 () Bool)

(assert (=> b!622509 m!598425))

(declare-fun m!598427 () Bool)

(assert (=> b!622515 m!598427))

(assert (=> b!622511 m!598365))

(assert (=> b!622511 m!598365))

(assert (=> b!622511 m!598385))

(declare-fun m!598429 () Bool)

(assert (=> b!622512 m!598429))

(push 1)

