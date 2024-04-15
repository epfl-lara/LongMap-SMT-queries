; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58868 () Bool)

(assert start!58868)

(declare-fun b!649316 () Bool)

(declare-fun e!372425 () Bool)

(declare-fun e!372420 () Bool)

(assert (=> b!649316 (= e!372425 e!372420)))

(declare-fun res!420959 () Bool)

(assert (=> b!649316 (=> (not res!420959) (not e!372420))))

(declare-datatypes ((SeekEntryResult!6913 0))(
  ( (MissingZero!6913 (index!29999 (_ BitVec 32))) (Found!6913 (index!30000 (_ BitVec 32))) (Intermediate!6913 (undefined!7725 Bool) (index!30001 (_ BitVec 32)) (x!58793 (_ BitVec 32))) (Undefined!6913) (MissingVacant!6913 (index!30002 (_ BitVec 32))) )
))
(declare-fun lt!301438 () SeekEntryResult!6913)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!649316 (= res!420959 (or (= lt!301438 (MissingZero!6913 i!1108)) (= lt!301438 (MissingVacant!6913 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38541 0))(
  ( (array!38542 (arr!18476 (Array (_ BitVec 32) (_ BitVec 64))) (size!18841 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38541)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38541 (_ BitVec 32)) SeekEntryResult!6913)

(assert (=> b!649316 (= lt!301438 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649317 () Bool)

(declare-fun e!372415 () Bool)

(assert (=> b!649317 (= e!372420 e!372415)))

(declare-fun res!420955 () Bool)

(assert (=> b!649317 (=> (not res!420955) (not e!372415))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!649317 (= res!420955 (= (select (store (arr!18476 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301432 () array!38541)

(assert (=> b!649317 (= lt!301432 (array!38542 (store (arr!18476 a!2986) i!1108 k0!1786) (size!18841 a!2986)))))

(declare-fun b!649318 () Bool)

(declare-fun res!420963 () Bool)

(assert (=> b!649318 (=> (not res!420963) (not e!372420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38541 (_ BitVec 32)) Bool)

(assert (=> b!649318 (= res!420963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649319 () Bool)

(declare-fun e!372416 () Bool)

(declare-fun e!372424 () Bool)

(assert (=> b!649319 (= e!372416 e!372424)))

(declare-fun res!420962 () Bool)

(assert (=> b!649319 (=> res!420962 e!372424)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!649319 (= res!420962 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22106 0))(
  ( (Unit!22107) )
))
(declare-fun lt!301443 () Unit!22106)

(declare-fun e!372422 () Unit!22106)

(assert (=> b!649319 (= lt!301443 e!372422)))

(declare-fun c!74553 () Bool)

(assert (=> b!649319 (= c!74553 (bvslt j!136 index!984))))

(declare-fun b!649320 () Bool)

(assert (=> b!649320 (= e!372424 true)))

(declare-datatypes ((List!12556 0))(
  ( (Nil!12553) (Cons!12552 (h!13597 (_ BitVec 64)) (t!18775 List!12556)) )
))
(declare-fun arrayNoDuplicates!0 (array!38541 (_ BitVec 32) List!12556) Bool)

(assert (=> b!649320 (arrayNoDuplicates!0 lt!301432 #b00000000000000000000000000000000 Nil!12553)))

(declare-fun lt!301435 () Unit!22106)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12556) Unit!22106)

(assert (=> b!649320 (= lt!301435 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12553))))

(declare-fun arrayContainsKey!0 (array!38541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649320 (arrayContainsKey!0 lt!301432 (select (arr!18476 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301433 () Unit!22106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22106)

(assert (=> b!649320 (= lt!301433 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301432 (select (arr!18476 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372418 () Bool)

(assert (=> b!649320 e!372418))

(declare-fun res!420946 () Bool)

(assert (=> b!649320 (=> (not res!420946) (not e!372418))))

(assert (=> b!649320 (= res!420946 (arrayContainsKey!0 lt!301432 (select (arr!18476 a!2986) j!136) j!136))))

(declare-fun b!649321 () Bool)

(declare-fun e!372423 () Bool)

(declare-fun lt!301440 () SeekEntryResult!6913)

(declare-fun lt!301429 () SeekEntryResult!6913)

(assert (=> b!649321 (= e!372423 (= lt!301440 lt!301429))))

(declare-fun b!649322 () Bool)

(declare-fun e!372419 () Bool)

(declare-fun e!372421 () Bool)

(assert (=> b!649322 (= e!372419 e!372421)))

(declare-fun res!420949 () Bool)

(assert (=> b!649322 (=> (not res!420949) (not e!372421))))

(assert (=> b!649322 (= res!420949 (arrayContainsKey!0 lt!301432 (select (arr!18476 a!2986) j!136) j!136))))

(declare-fun b!649323 () Bool)

(declare-fun Unit!22108 () Unit!22106)

(assert (=> b!649323 (= e!372422 Unit!22108)))

(declare-fun lt!301427 () Unit!22106)

(assert (=> b!649323 (= lt!301427 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301432 (select (arr!18476 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649323 (arrayContainsKey!0 lt!301432 (select (arr!18476 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301441 () Unit!22106)

(assert (=> b!649323 (= lt!301441 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12553))))

(assert (=> b!649323 (arrayNoDuplicates!0 lt!301432 #b00000000000000000000000000000000 Nil!12553)))

(declare-fun lt!301436 () Unit!22106)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38541 (_ BitVec 32) (_ BitVec 32)) Unit!22106)

(assert (=> b!649323 (= lt!301436 (lemmaNoDuplicateFromThenFromBigger!0 lt!301432 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649323 (arrayNoDuplicates!0 lt!301432 j!136 Nil!12553)))

(declare-fun lt!301437 () Unit!22106)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38541 (_ BitVec 64) (_ BitVec 32) List!12556) Unit!22106)

(assert (=> b!649323 (= lt!301437 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301432 (select (arr!18476 a!2986) j!136) j!136 Nil!12553))))

(assert (=> b!649323 false))

(declare-fun res!420954 () Bool)

(assert (=> start!58868 (=> (not res!420954) (not e!372425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58868 (= res!420954 (validMask!0 mask!3053))))

(assert (=> start!58868 e!372425))

(assert (=> start!58868 true))

(declare-fun array_inv!14359 (array!38541) Bool)

(assert (=> start!58868 (array_inv!14359 a!2986)))

(declare-fun b!649324 () Bool)

(declare-fun e!372414 () Unit!22106)

(declare-fun Unit!22109 () Unit!22106)

(assert (=> b!649324 (= e!372414 Unit!22109)))

(assert (=> b!649324 false))

(declare-fun b!649325 () Bool)

(declare-fun res!420950 () Bool)

(assert (=> b!649325 (=> (not res!420950) (not e!372425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649325 (= res!420950 (validKeyInArray!0 k0!1786))))

(declare-fun b!649326 () Bool)

(declare-fun e!372417 () Bool)

(declare-fun e!372426 () Bool)

(assert (=> b!649326 (= e!372417 (not e!372426))))

(declare-fun res!420958 () Bool)

(assert (=> b!649326 (=> res!420958 e!372426)))

(declare-fun lt!301442 () SeekEntryResult!6913)

(assert (=> b!649326 (= res!420958 (not (= lt!301442 (Found!6913 index!984))))))

(declare-fun lt!301439 () Unit!22106)

(assert (=> b!649326 (= lt!301439 e!372414)))

(declare-fun c!74552 () Bool)

(assert (=> b!649326 (= c!74552 (= lt!301442 Undefined!6913))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!301431 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38541 (_ BitVec 32)) SeekEntryResult!6913)

(assert (=> b!649326 (= lt!301442 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301431 lt!301432 mask!3053))))

(assert (=> b!649326 e!372423))

(declare-fun res!420956 () Bool)

(assert (=> b!649326 (=> (not res!420956) (not e!372423))))

(declare-fun lt!301430 () (_ BitVec 32))

(assert (=> b!649326 (= res!420956 (= lt!301429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301430 vacantSpotIndex!68 lt!301431 lt!301432 mask!3053)))))

(assert (=> b!649326 (= lt!301429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301430 vacantSpotIndex!68 (select (arr!18476 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649326 (= lt!301431 (select (store (arr!18476 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301428 () Unit!22106)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38541 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22106)

(assert (=> b!649326 (= lt!301428 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301430 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649326 (= lt!301430 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649327 () Bool)

(assert (=> b!649327 (= e!372426 e!372416)))

(declare-fun res!420957 () Bool)

(assert (=> b!649327 (=> res!420957 e!372416)))

(declare-fun lt!301434 () (_ BitVec 64))

(assert (=> b!649327 (= res!420957 (or (not (= (select (arr!18476 a!2986) j!136) lt!301431)) (not (= (select (arr!18476 a!2986) j!136) lt!301434))))))

(declare-fun e!372427 () Bool)

(assert (=> b!649327 e!372427))

(declare-fun res!420960 () Bool)

(assert (=> b!649327 (=> (not res!420960) (not e!372427))))

(assert (=> b!649327 (= res!420960 (= lt!301434 (select (arr!18476 a!2986) j!136)))))

(assert (=> b!649327 (= lt!301434 (select (store (arr!18476 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!649328 () Bool)

(declare-fun res!420948 () Bool)

(assert (=> b!649328 (=> (not res!420948) (not e!372420))))

(assert (=> b!649328 (= res!420948 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12553))))

(declare-fun b!649329 () Bool)

(declare-fun res!420964 () Bool)

(assert (=> b!649329 (=> (not res!420964) (not e!372425))))

(assert (=> b!649329 (= res!420964 (and (= (size!18841 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18841 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18841 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649330 () Bool)

(declare-fun Unit!22110 () Unit!22106)

(assert (=> b!649330 (= e!372422 Unit!22110)))

(declare-fun b!649331 () Bool)

(assert (=> b!649331 (= e!372415 e!372417)))

(declare-fun res!420951 () Bool)

(assert (=> b!649331 (=> (not res!420951) (not e!372417))))

(assert (=> b!649331 (= res!420951 (and (= lt!301440 (Found!6913 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18476 a!2986) index!984) (select (arr!18476 a!2986) j!136))) (not (= (select (arr!18476 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649331 (= lt!301440 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18476 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649332 () Bool)

(declare-fun res!420961 () Bool)

(assert (=> b!649332 (=> (not res!420961) (not e!372425))))

(assert (=> b!649332 (= res!420961 (validKeyInArray!0 (select (arr!18476 a!2986) j!136)))))

(declare-fun b!649333 () Bool)

(assert (=> b!649333 (= e!372427 e!372419)))

(declare-fun res!420952 () Bool)

(assert (=> b!649333 (=> res!420952 e!372419)))

(assert (=> b!649333 (= res!420952 (or (not (= (select (arr!18476 a!2986) j!136) lt!301431)) (not (= (select (arr!18476 a!2986) j!136) lt!301434)) (bvsge j!136 index!984)))))

(declare-fun b!649334 () Bool)

(declare-fun Unit!22111 () Unit!22106)

(assert (=> b!649334 (= e!372414 Unit!22111)))

(declare-fun b!649335 () Bool)

(declare-fun res!420953 () Bool)

(assert (=> b!649335 (=> (not res!420953) (not e!372425))))

(assert (=> b!649335 (= res!420953 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649336 () Bool)

(assert (=> b!649336 (= e!372418 (arrayContainsKey!0 lt!301432 (select (arr!18476 a!2986) j!136) index!984))))

(declare-fun b!649337 () Bool)

(declare-fun res!420947 () Bool)

(assert (=> b!649337 (=> (not res!420947) (not e!372420))))

(assert (=> b!649337 (= res!420947 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18476 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649338 () Bool)

(assert (=> b!649338 (= e!372421 (arrayContainsKey!0 lt!301432 (select (arr!18476 a!2986) j!136) index!984))))

(assert (= (and start!58868 res!420954) b!649329))

(assert (= (and b!649329 res!420964) b!649332))

(assert (= (and b!649332 res!420961) b!649325))

(assert (= (and b!649325 res!420950) b!649335))

(assert (= (and b!649335 res!420953) b!649316))

(assert (= (and b!649316 res!420959) b!649318))

(assert (= (and b!649318 res!420963) b!649328))

(assert (= (and b!649328 res!420948) b!649337))

(assert (= (and b!649337 res!420947) b!649317))

(assert (= (and b!649317 res!420955) b!649331))

(assert (= (and b!649331 res!420951) b!649326))

(assert (= (and b!649326 res!420956) b!649321))

(assert (= (and b!649326 c!74552) b!649324))

(assert (= (and b!649326 (not c!74552)) b!649334))

(assert (= (and b!649326 (not res!420958)) b!649327))

(assert (= (and b!649327 res!420960) b!649333))

(assert (= (and b!649333 (not res!420952)) b!649322))

(assert (= (and b!649322 res!420949) b!649338))

(assert (= (and b!649327 (not res!420957)) b!649319))

(assert (= (and b!649319 c!74553) b!649323))

(assert (= (and b!649319 (not c!74553)) b!649330))

(assert (= (and b!649319 (not res!420962)) b!649320))

(assert (= (and b!649320 res!420946) b!649336))

(declare-fun m!622071 () Bool)

(assert (=> b!649331 m!622071))

(declare-fun m!622073 () Bool)

(assert (=> b!649331 m!622073))

(assert (=> b!649331 m!622073))

(declare-fun m!622075 () Bool)

(assert (=> b!649331 m!622075))

(declare-fun m!622077 () Bool)

(assert (=> b!649325 m!622077))

(declare-fun m!622079 () Bool)

(assert (=> b!649335 m!622079))

(declare-fun m!622081 () Bool)

(assert (=> b!649337 m!622081))

(assert (=> b!649327 m!622073))

(declare-fun m!622083 () Bool)

(assert (=> b!649327 m!622083))

(declare-fun m!622085 () Bool)

(assert (=> b!649327 m!622085))

(declare-fun m!622087 () Bool)

(assert (=> b!649318 m!622087))

(assert (=> b!649336 m!622073))

(assert (=> b!649336 m!622073))

(declare-fun m!622089 () Bool)

(assert (=> b!649336 m!622089))

(declare-fun m!622091 () Bool)

(assert (=> b!649328 m!622091))

(assert (=> b!649338 m!622073))

(assert (=> b!649338 m!622073))

(assert (=> b!649338 m!622089))

(assert (=> b!649333 m!622073))

(assert (=> b!649317 m!622083))

(declare-fun m!622093 () Bool)

(assert (=> b!649317 m!622093))

(declare-fun m!622095 () Bool)

(assert (=> b!649316 m!622095))

(assert (=> b!649322 m!622073))

(assert (=> b!649322 m!622073))

(declare-fun m!622097 () Bool)

(assert (=> b!649322 m!622097))

(assert (=> b!649332 m!622073))

(assert (=> b!649332 m!622073))

(declare-fun m!622099 () Bool)

(assert (=> b!649332 m!622099))

(declare-fun m!622101 () Bool)

(assert (=> start!58868 m!622101))

(declare-fun m!622103 () Bool)

(assert (=> start!58868 m!622103))

(assert (=> b!649323 m!622073))

(declare-fun m!622105 () Bool)

(assert (=> b!649323 m!622105))

(declare-fun m!622107 () Bool)

(assert (=> b!649323 m!622107))

(declare-fun m!622109 () Bool)

(assert (=> b!649323 m!622109))

(assert (=> b!649323 m!622073))

(declare-fun m!622111 () Bool)

(assert (=> b!649323 m!622111))

(assert (=> b!649323 m!622073))

(declare-fun m!622113 () Bool)

(assert (=> b!649323 m!622113))

(assert (=> b!649323 m!622073))

(declare-fun m!622115 () Bool)

(assert (=> b!649323 m!622115))

(declare-fun m!622117 () Bool)

(assert (=> b!649323 m!622117))

(assert (=> b!649320 m!622073))

(declare-fun m!622119 () Bool)

(assert (=> b!649320 m!622119))

(assert (=> b!649320 m!622073))

(assert (=> b!649320 m!622073))

(assert (=> b!649320 m!622097))

(assert (=> b!649320 m!622107))

(assert (=> b!649320 m!622073))

(declare-fun m!622121 () Bool)

(assert (=> b!649320 m!622121))

(assert (=> b!649320 m!622117))

(declare-fun m!622123 () Bool)

(assert (=> b!649326 m!622123))

(declare-fun m!622125 () Bool)

(assert (=> b!649326 m!622125))

(declare-fun m!622127 () Bool)

(assert (=> b!649326 m!622127))

(assert (=> b!649326 m!622073))

(assert (=> b!649326 m!622083))

(declare-fun m!622129 () Bool)

(assert (=> b!649326 m!622129))

(assert (=> b!649326 m!622073))

(declare-fun m!622131 () Bool)

(assert (=> b!649326 m!622131))

(declare-fun m!622133 () Bool)

(assert (=> b!649326 m!622133))

(check-sat (not b!649336) (not b!649331) (not b!649328) (not b!649322) (not b!649332) (not b!649316) (not b!649326) (not b!649335) (not start!58868) (not b!649325) (not b!649318) (not b!649338) (not b!649323) (not b!649320))
(check-sat)
