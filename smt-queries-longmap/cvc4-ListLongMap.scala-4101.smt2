; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56108 () Bool)

(assert start!56108)

(declare-fun b!619373 () Bool)

(declare-datatypes ((Unit!20478 0))(
  ( (Unit!20479) )
))
(declare-fun e!355215 () Unit!20478)

(declare-fun Unit!20480 () Unit!20478)

(assert (=> b!619373 (= e!355215 Unit!20480)))

(assert (=> b!619373 false))

(declare-fun b!619374 () Bool)

(declare-fun Unit!20481 () Unit!20478)

(assert (=> b!619374 (= e!355215 Unit!20481)))

(declare-fun b!619375 () Bool)

(declare-fun e!355218 () Bool)

(assert (=> b!619375 (= e!355218 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37578 0))(
  ( (array!37579 (arr!18035 (Array (_ BitVec 32) (_ BitVec 64))) (size!18399 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37578)

(assert (=> b!619375 (= (select (store (arr!18035 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619376 () Bool)

(declare-fun e!355223 () Unit!20478)

(declare-fun Unit!20482 () Unit!20478)

(assert (=> b!619376 (= e!355223 Unit!20482)))

(declare-fun b!619377 () Bool)

(declare-fun res!399084 () Bool)

(declare-fun e!355227 () Bool)

(assert (=> b!619377 (=> (not res!399084) (not e!355227))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619377 (= res!399084 (validKeyInArray!0 (select (arr!18035 a!2986) j!136)))))

(declare-fun b!619378 () Bool)

(declare-fun e!355226 () Bool)

(declare-datatypes ((SeekEntryResult!6475 0))(
  ( (MissingZero!6475 (index!28184 (_ BitVec 32))) (Found!6475 (index!28185 (_ BitVec 32))) (Intermediate!6475 (undefined!7287 Bool) (index!28186 (_ BitVec 32)) (x!56963 (_ BitVec 32))) (Undefined!6475) (MissingVacant!6475 (index!28187 (_ BitVec 32))) )
))
(declare-fun lt!285875 () SeekEntryResult!6475)

(declare-fun lt!285872 () SeekEntryResult!6475)

(assert (=> b!619378 (= e!355226 (= lt!285875 lt!285872))))

(declare-fun b!619379 () Bool)

(declare-fun e!355217 () Bool)

(assert (=> b!619379 (= e!355217 (not e!355218))))

(declare-fun res!399080 () Bool)

(assert (=> b!619379 (=> res!399080 e!355218)))

(declare-fun lt!285861 () SeekEntryResult!6475)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619379 (= res!399080 (not (= lt!285861 (MissingVacant!6475 vacantSpotIndex!68))))))

(declare-fun lt!285865 () Unit!20478)

(declare-fun e!355219 () Unit!20478)

(assert (=> b!619379 (= lt!285865 e!355219)))

(declare-fun c!70517 () Bool)

(assert (=> b!619379 (= c!70517 (= lt!285861 (Found!6475 index!984)))))

(declare-fun lt!285859 () Unit!20478)

(assert (=> b!619379 (= lt!285859 e!355215)))

(declare-fun c!70515 () Bool)

(assert (=> b!619379 (= c!70515 (= lt!285861 Undefined!6475))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285871 () array!37578)

(declare-fun lt!285864 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37578 (_ BitVec 32)) SeekEntryResult!6475)

(assert (=> b!619379 (= lt!285861 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285864 lt!285871 mask!3053))))

(assert (=> b!619379 e!355226))

(declare-fun res!399079 () Bool)

(assert (=> b!619379 (=> (not res!399079) (not e!355226))))

(declare-fun lt!285874 () (_ BitVec 32))

(assert (=> b!619379 (= res!399079 (= lt!285872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285874 vacantSpotIndex!68 lt!285864 lt!285871 mask!3053)))))

(assert (=> b!619379 (= lt!285872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285874 vacantSpotIndex!68 (select (arr!18035 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619379 (= lt!285864 (select (store (arr!18035 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285877 () Unit!20478)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20478)

(assert (=> b!619379 (= lt!285877 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285874 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619379 (= lt!285874 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619381 () Bool)

(declare-fun Unit!20483 () Unit!20478)

(assert (=> b!619381 (= e!355219 Unit!20483)))

(declare-fun b!619382 () Bool)

(declare-fun e!355224 () Bool)

(assert (=> b!619382 (= e!355227 e!355224)))

(declare-fun res!399082 () Bool)

(assert (=> b!619382 (=> (not res!399082) (not e!355224))))

(declare-fun lt!285870 () SeekEntryResult!6475)

(assert (=> b!619382 (= res!399082 (or (= lt!285870 (MissingZero!6475 i!1108)) (= lt!285870 (MissingVacant!6475 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37578 (_ BitVec 32)) SeekEntryResult!6475)

(assert (=> b!619382 (= lt!285870 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619383 () Bool)

(declare-fun res!399092 () Bool)

(assert (=> b!619383 (=> (not res!399092) (not e!355224))))

(assert (=> b!619383 (= res!399092 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18035 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619384 () Bool)

(declare-fun res!399086 () Bool)

(assert (=> b!619384 (=> (not res!399086) (not e!355227))))

(assert (=> b!619384 (= res!399086 (validKeyInArray!0 k!1786))))

(declare-fun b!619385 () Bool)

(declare-fun e!355222 () Bool)

(assert (=> b!619385 (= e!355222 e!355217)))

(declare-fun res!399094 () Bool)

(assert (=> b!619385 (=> (not res!399094) (not e!355217))))

(assert (=> b!619385 (= res!399094 (and (= lt!285875 (Found!6475 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18035 a!2986) index!984) (select (arr!18035 a!2986) j!136))) (not (= (select (arr!18035 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619385 (= lt!285875 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18035 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619386 () Bool)

(declare-fun e!355213 () Unit!20478)

(declare-fun Unit!20484 () Unit!20478)

(assert (=> b!619386 (= e!355213 Unit!20484)))

(declare-fun b!619387 () Bool)

(declare-fun e!355225 () Bool)

(declare-fun arrayContainsKey!0 (array!37578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619387 (= e!355225 (arrayContainsKey!0 lt!285871 (select (arr!18035 a!2986) j!136) index!984))))

(declare-fun b!619388 () Bool)

(declare-fun Unit!20485 () Unit!20478)

(assert (=> b!619388 (= e!355219 Unit!20485)))

(declare-fun res!399090 () Bool)

(assert (=> b!619388 (= res!399090 (= (select (store (arr!18035 a!2986) i!1108 k!1786) index!984) (select (arr!18035 a!2986) j!136)))))

(declare-fun e!355220 () Bool)

(assert (=> b!619388 (=> (not res!399090) (not e!355220))))

(assert (=> b!619388 e!355220))

(declare-fun c!70514 () Bool)

(assert (=> b!619388 (= c!70514 (bvslt j!136 index!984))))

(declare-fun lt!285867 () Unit!20478)

(assert (=> b!619388 (= lt!285867 e!355213)))

(declare-fun c!70516 () Bool)

(assert (=> b!619388 (= c!70516 (bvslt index!984 j!136))))

(declare-fun lt!285869 () Unit!20478)

(assert (=> b!619388 (= lt!285869 e!355223)))

(assert (=> b!619388 false))

(declare-fun b!619389 () Bool)

(declare-fun e!355221 () Bool)

(assert (=> b!619389 (= e!355221 (arrayContainsKey!0 lt!285871 (select (arr!18035 a!2986) j!136) index!984))))

(declare-fun b!619390 () Bool)

(assert (=> b!619390 false))

(declare-fun lt!285868 () Unit!20478)

(declare-datatypes ((List!12076 0))(
  ( (Nil!12073) (Cons!12072 (h!13117 (_ BitVec 64)) (t!18304 List!12076)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37578 (_ BitVec 64) (_ BitVec 32) List!12076) Unit!20478)

(assert (=> b!619390 (= lt!285868 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285871 (select (arr!18035 a!2986) j!136) index!984 Nil!12073))))

(declare-fun arrayNoDuplicates!0 (array!37578 (_ BitVec 32) List!12076) Bool)

(assert (=> b!619390 (arrayNoDuplicates!0 lt!285871 index!984 Nil!12073)))

(declare-fun lt!285873 () Unit!20478)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37578 (_ BitVec 32) (_ BitVec 32)) Unit!20478)

(assert (=> b!619390 (= lt!285873 (lemmaNoDuplicateFromThenFromBigger!0 lt!285871 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619390 (arrayNoDuplicates!0 lt!285871 #b00000000000000000000000000000000 Nil!12073)))

(declare-fun lt!285876 () Unit!20478)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37578 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12076) Unit!20478)

(assert (=> b!619390 (= lt!285876 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12073))))

(assert (=> b!619390 (arrayContainsKey!0 lt!285871 (select (arr!18035 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285863 () Unit!20478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37578 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20478)

(assert (=> b!619390 (= lt!285863 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285871 (select (arr!18035 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619390 e!355221))

(declare-fun res!399081 () Bool)

(assert (=> b!619390 (=> (not res!399081) (not e!355221))))

(assert (=> b!619390 (= res!399081 (arrayContainsKey!0 lt!285871 (select (arr!18035 a!2986) j!136) j!136))))

(declare-fun Unit!20486 () Unit!20478)

(assert (=> b!619390 (= e!355223 Unit!20486)))

(declare-fun b!619391 () Bool)

(declare-fun res!399083 () Bool)

(assert (=> b!619391 (=> (not res!399083) (not e!355227))))

(assert (=> b!619391 (= res!399083 (and (= (size!18399 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18399 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18399 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619392 () Bool)

(assert (=> b!619392 (= e!355224 e!355222)))

(declare-fun res!399085 () Bool)

(assert (=> b!619392 (=> (not res!399085) (not e!355222))))

(assert (=> b!619392 (= res!399085 (= (select (store (arr!18035 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619392 (= lt!285871 (array!37579 (store (arr!18035 a!2986) i!1108 k!1786) (size!18399 a!2986)))))

(declare-fun b!619380 () Bool)

(declare-fun res!399088 () Bool)

(assert (=> b!619380 (=> (not res!399088) (not e!355224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37578 (_ BitVec 32)) Bool)

(assert (=> b!619380 (= res!399088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!399091 () Bool)

(assert (=> start!56108 (=> (not res!399091) (not e!355227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56108 (= res!399091 (validMask!0 mask!3053))))

(assert (=> start!56108 e!355227))

(assert (=> start!56108 true))

(declare-fun array_inv!13831 (array!37578) Bool)

(assert (=> start!56108 (array_inv!13831 a!2986)))

(declare-fun b!619393 () Bool)

(declare-fun res!399095 () Bool)

(assert (=> b!619393 (=> (not res!399095) (not e!355227))))

(assert (=> b!619393 (= res!399095 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619394 () Bool)

(declare-fun res!399093 () Bool)

(assert (=> b!619394 (=> (not res!399093) (not e!355224))))

(assert (=> b!619394 (= res!399093 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12073))))

(declare-fun b!619395 () Bool)

(assert (=> b!619395 false))

(declare-fun lt!285858 () Unit!20478)

(assert (=> b!619395 (= lt!285858 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285871 (select (arr!18035 a!2986) j!136) j!136 Nil!12073))))

(assert (=> b!619395 (arrayNoDuplicates!0 lt!285871 j!136 Nil!12073)))

(declare-fun lt!285862 () Unit!20478)

(assert (=> b!619395 (= lt!285862 (lemmaNoDuplicateFromThenFromBigger!0 lt!285871 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619395 (arrayNoDuplicates!0 lt!285871 #b00000000000000000000000000000000 Nil!12073)))

(declare-fun lt!285860 () Unit!20478)

(assert (=> b!619395 (= lt!285860 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12073))))

(assert (=> b!619395 (arrayContainsKey!0 lt!285871 (select (arr!18035 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285866 () Unit!20478)

(assert (=> b!619395 (= lt!285866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285871 (select (arr!18035 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20487 () Unit!20478)

(assert (=> b!619395 (= e!355213 Unit!20487)))

(declare-fun b!619396 () Bool)

(declare-fun res!399089 () Bool)

(assert (=> b!619396 (= res!399089 (arrayContainsKey!0 lt!285871 (select (arr!18035 a!2986) j!136) j!136))))

(assert (=> b!619396 (=> (not res!399089) (not e!355225))))

(declare-fun e!355216 () Bool)

(assert (=> b!619396 (= e!355216 e!355225)))

(declare-fun b!619397 () Bool)

(declare-fun res!399087 () Bool)

(assert (=> b!619397 (= res!399087 (bvsge j!136 index!984))))

(assert (=> b!619397 (=> res!399087 e!355216)))

(assert (=> b!619397 (= e!355220 e!355216)))

(assert (= (and start!56108 res!399091) b!619391))

(assert (= (and b!619391 res!399083) b!619377))

(assert (= (and b!619377 res!399084) b!619384))

(assert (= (and b!619384 res!399086) b!619393))

(assert (= (and b!619393 res!399095) b!619382))

(assert (= (and b!619382 res!399082) b!619380))

(assert (= (and b!619380 res!399088) b!619394))

(assert (= (and b!619394 res!399093) b!619383))

(assert (= (and b!619383 res!399092) b!619392))

(assert (= (and b!619392 res!399085) b!619385))

(assert (= (and b!619385 res!399094) b!619379))

(assert (= (and b!619379 res!399079) b!619378))

(assert (= (and b!619379 c!70515) b!619373))

(assert (= (and b!619379 (not c!70515)) b!619374))

(assert (= (and b!619379 c!70517) b!619388))

(assert (= (and b!619379 (not c!70517)) b!619381))

(assert (= (and b!619388 res!399090) b!619397))

(assert (= (and b!619397 (not res!399087)) b!619396))

(assert (= (and b!619396 res!399089) b!619387))

(assert (= (and b!619388 c!70514) b!619395))

(assert (= (and b!619388 (not c!70514)) b!619386))

(assert (= (and b!619388 c!70516) b!619390))

(assert (= (and b!619388 (not c!70516)) b!619376))

(assert (= (and b!619390 res!399081) b!619389))

(assert (= (and b!619379 (not res!399080)) b!619375))

(declare-fun m!595351 () Bool)

(assert (=> b!619383 m!595351))

(declare-fun m!595353 () Bool)

(assert (=> b!619382 m!595353))

(declare-fun m!595355 () Bool)

(assert (=> b!619394 m!595355))

(declare-fun m!595357 () Bool)

(assert (=> b!619387 m!595357))

(assert (=> b!619387 m!595357))

(declare-fun m!595359 () Bool)

(assert (=> b!619387 m!595359))

(declare-fun m!595361 () Bool)

(assert (=> b!619392 m!595361))

(declare-fun m!595363 () Bool)

(assert (=> b!619392 m!595363))

(assert (=> b!619396 m!595357))

(assert (=> b!619396 m!595357))

(declare-fun m!595365 () Bool)

(assert (=> b!619396 m!595365))

(assert (=> b!619389 m!595357))

(assert (=> b!619389 m!595357))

(assert (=> b!619389 m!595359))

(assert (=> b!619395 m!595357))

(declare-fun m!595367 () Bool)

(assert (=> b!619395 m!595367))

(declare-fun m!595369 () Bool)

(assert (=> b!619395 m!595369))

(declare-fun m!595371 () Bool)

(assert (=> b!619395 m!595371))

(assert (=> b!619395 m!595357))

(declare-fun m!595373 () Bool)

(assert (=> b!619395 m!595373))

(assert (=> b!619395 m!595357))

(declare-fun m!595375 () Bool)

(assert (=> b!619395 m!595375))

(assert (=> b!619395 m!595357))

(declare-fun m!595377 () Bool)

(assert (=> b!619395 m!595377))

(declare-fun m!595379 () Bool)

(assert (=> b!619395 m!595379))

(declare-fun m!595381 () Bool)

(assert (=> b!619384 m!595381))

(declare-fun m!595383 () Bool)

(assert (=> b!619390 m!595383))

(assert (=> b!619390 m!595357))

(assert (=> b!619390 m!595357))

(declare-fun m!595385 () Bool)

(assert (=> b!619390 m!595385))

(assert (=> b!619390 m!595357))

(declare-fun m!595387 () Bool)

(assert (=> b!619390 m!595387))

(assert (=> b!619390 m!595371))

(declare-fun m!595389 () Bool)

(assert (=> b!619390 m!595389))

(assert (=> b!619390 m!595357))

(declare-fun m!595391 () Bool)

(assert (=> b!619390 m!595391))

(assert (=> b!619390 m!595357))

(assert (=> b!619390 m!595365))

(assert (=> b!619390 m!595379))

(declare-fun m!595393 () Bool)

(assert (=> start!56108 m!595393))

(declare-fun m!595395 () Bool)

(assert (=> start!56108 m!595395))

(assert (=> b!619388 m!595361))

(declare-fun m!595397 () Bool)

(assert (=> b!619388 m!595397))

(assert (=> b!619388 m!595357))

(declare-fun m!595399 () Bool)

(assert (=> b!619379 m!595399))

(declare-fun m!595401 () Bool)

(assert (=> b!619379 m!595401))

(assert (=> b!619379 m!595357))

(assert (=> b!619379 m!595361))

(declare-fun m!595403 () Bool)

(assert (=> b!619379 m!595403))

(declare-fun m!595405 () Bool)

(assert (=> b!619379 m!595405))

(declare-fun m!595407 () Bool)

(assert (=> b!619379 m!595407))

(assert (=> b!619379 m!595357))

(declare-fun m!595409 () Bool)

(assert (=> b!619379 m!595409))

(assert (=> b!619375 m!595361))

(assert (=> b!619375 m!595397))

(declare-fun m!595411 () Bool)

(assert (=> b!619393 m!595411))

(assert (=> b!619377 m!595357))

(assert (=> b!619377 m!595357))

(declare-fun m!595413 () Bool)

(assert (=> b!619377 m!595413))

(declare-fun m!595415 () Bool)

(assert (=> b!619380 m!595415))

(declare-fun m!595417 () Bool)

(assert (=> b!619385 m!595417))

(assert (=> b!619385 m!595357))

(assert (=> b!619385 m!595357))

(declare-fun m!595419 () Bool)

(assert (=> b!619385 m!595419))

(push 1)

