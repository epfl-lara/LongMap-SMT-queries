; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59102 () Bool)

(assert start!59102)

(declare-fun b!652276 () Bool)

(declare-fun e!374384 () Bool)

(declare-fun e!374379 () Bool)

(assert (=> b!652276 (= e!374384 e!374379)))

(declare-fun res!423084 () Bool)

(assert (=> b!652276 (=> res!423084 e!374379)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!652276 (= res!423084 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22304 0))(
  ( (Unit!22305) )
))
(declare-fun lt!303463 () Unit!22304)

(declare-fun e!374373 () Unit!22304)

(assert (=> b!652276 (= lt!303463 e!374373)))

(declare-fun c!74964 () Bool)

(assert (=> b!652276 (= c!74964 (bvslt j!136 index!984))))

(declare-fun b!652277 () Bool)

(declare-fun e!374381 () Unit!22304)

(declare-fun Unit!22306 () Unit!22304)

(assert (=> b!652277 (= e!374381 Unit!22306)))

(declare-fun b!652278 () Bool)

(declare-fun e!374372 () Bool)

(declare-fun e!374376 () Bool)

(assert (=> b!652278 (= e!374372 e!374376)))

(declare-fun res!423088 () Bool)

(assert (=> b!652278 (=> (not res!423088) (not e!374376))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6946 0))(
  ( (MissingZero!6946 (index!30137 (_ BitVec 32))) (Found!6946 (index!30138 (_ BitVec 32))) (Intermediate!6946 (undefined!7758 Bool) (index!30139 (_ BitVec 32)) (x!58932 (_ BitVec 32))) (Undefined!6946) (MissingVacant!6946 (index!30140 (_ BitVec 32))) )
))
(declare-fun lt!303471 () SeekEntryResult!6946)

(declare-datatypes ((array!38613 0))(
  ( (array!38614 (arr!18509 (Array (_ BitVec 32) (_ BitVec 64))) (size!18874 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38613)

(assert (=> b!652278 (= res!423088 (and (= lt!303471 (Found!6946 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18509 a!2986) index!984) (select (arr!18509 a!2986) j!136))) (not (= (select (arr!18509 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38613 (_ BitVec 32)) SeekEntryResult!6946)

(assert (=> b!652278 (= lt!303471 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652279 () Bool)

(declare-fun res!423102 () Bool)

(declare-fun e!374374 () Bool)

(assert (=> b!652279 (=> (not res!423102) (not e!374374))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!652279 (= res!423102 (and (= (size!18874 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18874 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652280 () Bool)

(declare-fun e!374370 () Bool)

(assert (=> b!652280 (= e!374374 e!374370)))

(declare-fun res!423085 () Bool)

(assert (=> b!652280 (=> (not res!423085) (not e!374370))))

(declare-fun lt!303459 () SeekEntryResult!6946)

(assert (=> b!652280 (= res!423085 (or (= lt!303459 (MissingZero!6946 i!1108)) (= lt!303459 (MissingVacant!6946 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38613 (_ BitVec 32)) SeekEntryResult!6946)

(assert (=> b!652280 (= lt!303459 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652281 () Bool)

(declare-fun e!374378 () Bool)

(assert (=> b!652281 (= e!374378 e!374384)))

(declare-fun res!423086 () Bool)

(assert (=> b!652281 (=> res!423086 e!374384)))

(declare-fun lt!303464 () (_ BitVec 64))

(declare-fun lt!303456 () (_ BitVec 64))

(assert (=> b!652281 (= res!423086 (or (not (= (select (arr!18509 a!2986) j!136) lt!303456)) (not (= (select (arr!18509 a!2986) j!136) lt!303464))))))

(declare-fun e!374371 () Bool)

(assert (=> b!652281 e!374371))

(declare-fun res!423096 () Bool)

(assert (=> b!652281 (=> (not res!423096) (not e!374371))))

(assert (=> b!652281 (= res!423096 (= lt!303464 (select (arr!18509 a!2986) j!136)))))

(assert (=> b!652281 (= lt!303464 (select (store (arr!18509 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652283 () Bool)

(assert (=> b!652283 (= e!374370 e!374372)))

(declare-fun res!423093 () Bool)

(assert (=> b!652283 (=> (not res!423093) (not e!374372))))

(assert (=> b!652283 (= res!423093 (= (select (store (arr!18509 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!303467 () array!38613)

(assert (=> b!652283 (= lt!303467 (array!38614 (store (arr!18509 a!2986) i!1108 k0!1786) (size!18874 a!2986)))))

(declare-fun b!652284 () Bool)

(declare-fun Unit!22307 () Unit!22304)

(assert (=> b!652284 (= e!374373 Unit!22307)))

(declare-fun lt!303458 () Unit!22304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22304)

(assert (=> b!652284 (= lt!303458 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303467 (select (arr!18509 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652284 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303460 () Unit!22304)

(declare-datatypes ((List!12589 0))(
  ( (Nil!12586) (Cons!12585 (h!13630 (_ BitVec 64)) (t!18808 List!12589)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12589) Unit!22304)

(assert (=> b!652284 (= lt!303460 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12586))))

(declare-fun arrayNoDuplicates!0 (array!38613 (_ BitVec 32) List!12589) Bool)

(assert (=> b!652284 (arrayNoDuplicates!0 lt!303467 #b00000000000000000000000000000000 Nil!12586)))

(declare-fun lt!303466 () Unit!22304)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38613 (_ BitVec 32) (_ BitVec 32)) Unit!22304)

(assert (=> b!652284 (= lt!303466 (lemmaNoDuplicateFromThenFromBigger!0 lt!303467 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652284 (arrayNoDuplicates!0 lt!303467 j!136 Nil!12586)))

(declare-fun lt!303469 () Unit!22304)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38613 (_ BitVec 64) (_ BitVec 32) List!12589) Unit!22304)

(assert (=> b!652284 (= lt!303469 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303467 (select (arr!18509 a!2986) j!136) j!136 Nil!12586))))

(assert (=> b!652284 false))

(declare-fun b!652285 () Bool)

(declare-fun res!423098 () Bool)

(assert (=> b!652285 (=> (not res!423098) (not e!374370))))

(assert (=> b!652285 (= res!423098 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12586))))

(declare-fun b!652286 () Bool)

(declare-fun e!374382 () Bool)

(declare-fun lt!303462 () SeekEntryResult!6946)

(assert (=> b!652286 (= e!374382 (= lt!303471 lt!303462))))

(declare-fun b!652287 () Bool)

(declare-fun e!374369 () Bool)

(declare-fun noDuplicate!440 (List!12589) Bool)

(assert (=> b!652287 (= e!374369 (noDuplicate!440 Nil!12586))))

(declare-fun b!652282 () Bool)

(declare-fun Unit!22308 () Unit!22304)

(assert (=> b!652282 (= e!374381 Unit!22308)))

(assert (=> b!652282 false))

(declare-fun res!423095 () Bool)

(assert (=> start!59102 (=> (not res!423095) (not e!374374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59102 (= res!423095 (validMask!0 mask!3053))))

(assert (=> start!59102 e!374374))

(assert (=> start!59102 true))

(declare-fun array_inv!14392 (array!38613) Bool)

(assert (=> start!59102 (array_inv!14392 a!2986)))

(declare-fun b!652288 () Bool)

(declare-fun res!423094 () Bool)

(assert (=> b!652288 (=> (not res!423094) (not e!374374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652288 (= res!423094 (validKeyInArray!0 (select (arr!18509 a!2986) j!136)))))

(declare-fun b!652289 () Bool)

(declare-fun e!374380 () Bool)

(assert (=> b!652289 (= e!374371 e!374380)))

(declare-fun res!423092 () Bool)

(assert (=> b!652289 (=> res!423092 e!374380)))

(assert (=> b!652289 (= res!423092 (or (not (= (select (arr!18509 a!2986) j!136) lt!303456)) (not (= (select (arr!18509 a!2986) j!136) lt!303464)) (bvsge j!136 index!984)))))

(declare-fun e!374383 () Bool)

(declare-fun b!652290 () Bool)

(assert (=> b!652290 (= e!374383 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) index!984))))

(declare-fun b!652291 () Bool)

(declare-fun res!423087 () Bool)

(assert (=> b!652291 (=> (not res!423087) (not e!374370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38613 (_ BitVec 32)) Bool)

(assert (=> b!652291 (= res!423087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652292 () Bool)

(declare-fun res!423097 () Bool)

(assert (=> b!652292 (=> (not res!423097) (not e!374374))))

(assert (=> b!652292 (= res!423097 (validKeyInArray!0 k0!1786))))

(declare-fun b!652293 () Bool)

(assert (=> b!652293 (= e!374376 (not e!374378))))

(declare-fun res!423089 () Bool)

(assert (=> b!652293 (=> res!423089 e!374378)))

(declare-fun lt!303457 () SeekEntryResult!6946)

(assert (=> b!652293 (= res!423089 (not (= lt!303457 (Found!6946 index!984))))))

(declare-fun lt!303461 () Unit!22304)

(assert (=> b!652293 (= lt!303461 e!374381)))

(declare-fun c!74963 () Bool)

(assert (=> b!652293 (= c!74963 (= lt!303457 Undefined!6946))))

(assert (=> b!652293 (= lt!303457 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303456 lt!303467 mask!3053))))

(assert (=> b!652293 e!374382))

(declare-fun res!423103 () Bool)

(assert (=> b!652293 (=> (not res!423103) (not e!374382))))

(declare-fun lt!303468 () (_ BitVec 32))

(assert (=> b!652293 (= res!423103 (= lt!303462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 lt!303456 lt!303467 mask!3053)))))

(assert (=> b!652293 (= lt!303462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652293 (= lt!303456 (select (store (arr!18509 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303455 () Unit!22304)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38613 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22304)

(assert (=> b!652293 (= lt!303455 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652293 (= lt!303468 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652294 () Bool)

(declare-fun res!423101 () Bool)

(assert (=> b!652294 (=> (not res!423101) (not e!374374))))

(assert (=> b!652294 (= res!423101 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652295 () Bool)

(assert (=> b!652295 (= e!374379 e!374369)))

(declare-fun res!423091 () Bool)

(assert (=> b!652295 (=> res!423091 e!374369)))

(assert (=> b!652295 (= res!423091 (or (bvsge (size!18874 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18874 a!2986)) (bvsge index!984 (size!18874 a!2986))))))

(assert (=> b!652295 (arrayNoDuplicates!0 lt!303467 index!984 Nil!12586)))

(declare-fun lt!303454 () Unit!22304)

(assert (=> b!652295 (= lt!303454 (lemmaNoDuplicateFromThenFromBigger!0 lt!303467 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652295 (arrayNoDuplicates!0 lt!303467 #b00000000000000000000000000000000 Nil!12586)))

(declare-fun lt!303465 () Unit!22304)

(assert (=> b!652295 (= lt!303465 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12586))))

(assert (=> b!652295 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303470 () Unit!22304)

(assert (=> b!652295 (= lt!303470 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303467 (select (arr!18509 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374375 () Bool)

(assert (=> b!652295 e!374375))

(declare-fun res!423090 () Bool)

(assert (=> b!652295 (=> (not res!423090) (not e!374375))))

(assert (=> b!652295 (= res!423090 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) j!136))))

(declare-fun b!652296 () Bool)

(assert (=> b!652296 (= e!374375 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) index!984))))

(declare-fun b!652297 () Bool)

(declare-fun Unit!22309 () Unit!22304)

(assert (=> b!652297 (= e!374373 Unit!22309)))

(declare-fun b!652298 () Bool)

(declare-fun res!423099 () Bool)

(assert (=> b!652298 (=> (not res!423099) (not e!374370))))

(assert (=> b!652298 (= res!423099 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18509 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652299 () Bool)

(assert (=> b!652299 (= e!374380 e!374383)))

(declare-fun res!423100 () Bool)

(assert (=> b!652299 (=> (not res!423100) (not e!374383))))

(assert (=> b!652299 (= res!423100 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) j!136))))

(assert (= (and start!59102 res!423095) b!652279))

(assert (= (and b!652279 res!423102) b!652288))

(assert (= (and b!652288 res!423094) b!652292))

(assert (= (and b!652292 res!423097) b!652294))

(assert (= (and b!652294 res!423101) b!652280))

(assert (= (and b!652280 res!423085) b!652291))

(assert (= (and b!652291 res!423087) b!652285))

(assert (= (and b!652285 res!423098) b!652298))

(assert (= (and b!652298 res!423099) b!652283))

(assert (= (and b!652283 res!423093) b!652278))

(assert (= (and b!652278 res!423088) b!652293))

(assert (= (and b!652293 res!423103) b!652286))

(assert (= (and b!652293 c!74963) b!652282))

(assert (= (and b!652293 (not c!74963)) b!652277))

(assert (= (and b!652293 (not res!423089)) b!652281))

(assert (= (and b!652281 res!423096) b!652289))

(assert (= (and b!652289 (not res!423092)) b!652299))

(assert (= (and b!652299 res!423100) b!652290))

(assert (= (and b!652281 (not res!423086)) b!652276))

(assert (= (and b!652276 c!74964) b!652284))

(assert (= (and b!652276 (not c!74964)) b!652297))

(assert (= (and b!652276 (not res!423084)) b!652295))

(assert (= (and b!652295 res!423090) b!652296))

(assert (= (and b!652295 (not res!423091)) b!652287))

(declare-fun m!624927 () Bool)

(assert (=> b!652289 m!624927))

(assert (=> b!652288 m!624927))

(assert (=> b!652288 m!624927))

(declare-fun m!624929 () Bool)

(assert (=> b!652288 m!624929))

(declare-fun m!624931 () Bool)

(assert (=> b!652283 m!624931))

(declare-fun m!624933 () Bool)

(assert (=> b!652283 m!624933))

(declare-fun m!624935 () Bool)

(assert (=> b!652291 m!624935))

(declare-fun m!624937 () Bool)

(assert (=> b!652278 m!624937))

(assert (=> b!652278 m!624927))

(assert (=> b!652278 m!624927))

(declare-fun m!624939 () Bool)

(assert (=> b!652278 m!624939))

(assert (=> b!652296 m!624927))

(assert (=> b!652296 m!624927))

(declare-fun m!624941 () Bool)

(assert (=> b!652296 m!624941))

(assert (=> b!652281 m!624927))

(assert (=> b!652281 m!624931))

(declare-fun m!624943 () Bool)

(assert (=> b!652281 m!624943))

(declare-fun m!624945 () Bool)

(assert (=> b!652280 m!624945))

(declare-fun m!624947 () Bool)

(assert (=> b!652293 m!624947))

(declare-fun m!624949 () Bool)

(assert (=> b!652293 m!624949))

(declare-fun m!624951 () Bool)

(assert (=> b!652293 m!624951))

(assert (=> b!652293 m!624927))

(assert (=> b!652293 m!624931))

(assert (=> b!652293 m!624927))

(declare-fun m!624953 () Bool)

(assert (=> b!652293 m!624953))

(declare-fun m!624955 () Bool)

(assert (=> b!652293 m!624955))

(declare-fun m!624957 () Bool)

(assert (=> b!652293 m!624957))

(declare-fun m!624959 () Bool)

(assert (=> start!59102 m!624959))

(declare-fun m!624961 () Bool)

(assert (=> start!59102 m!624961))

(declare-fun m!624963 () Bool)

(assert (=> b!652285 m!624963))

(declare-fun m!624965 () Bool)

(assert (=> b!652298 m!624965))

(declare-fun m!624967 () Bool)

(assert (=> b!652294 m!624967))

(declare-fun m!624969 () Bool)

(assert (=> b!652287 m!624969))

(declare-fun m!624971 () Bool)

(assert (=> b!652292 m!624971))

(assert (=> b!652290 m!624927))

(assert (=> b!652290 m!624927))

(assert (=> b!652290 m!624941))

(assert (=> b!652299 m!624927))

(assert (=> b!652299 m!624927))

(declare-fun m!624973 () Bool)

(assert (=> b!652299 m!624973))

(declare-fun m!624975 () Bool)

(assert (=> b!652295 m!624975))

(declare-fun m!624977 () Bool)

(assert (=> b!652295 m!624977))

(assert (=> b!652295 m!624927))

(assert (=> b!652295 m!624927))

(declare-fun m!624979 () Bool)

(assert (=> b!652295 m!624979))

(assert (=> b!652295 m!624927))

(assert (=> b!652295 m!624973))

(declare-fun m!624981 () Bool)

(assert (=> b!652295 m!624981))

(assert (=> b!652295 m!624927))

(declare-fun m!624983 () Bool)

(assert (=> b!652295 m!624983))

(declare-fun m!624985 () Bool)

(assert (=> b!652295 m!624985))

(assert (=> b!652284 m!624927))

(assert (=> b!652284 m!624927))

(declare-fun m!624987 () Bool)

(assert (=> b!652284 m!624987))

(assert (=> b!652284 m!624981))

(assert (=> b!652284 m!624927))

(declare-fun m!624989 () Bool)

(assert (=> b!652284 m!624989))

(assert (=> b!652284 m!624927))

(declare-fun m!624991 () Bool)

(assert (=> b!652284 m!624991))

(assert (=> b!652284 m!624985))

(declare-fun m!624993 () Bool)

(assert (=> b!652284 m!624993))

(declare-fun m!624995 () Bool)

(assert (=> b!652284 m!624995))

(check-sat (not b!652287) (not b!652296) (not b!652290) (not b!652295) (not start!59102) (not b!652284) (not b!652280) (not b!652299) (not b!652278) (not b!652291) (not b!652288) (not b!652285) (not b!652293) (not b!652294) (not b!652292))
(check-sat)
(get-model)

(declare-fun d!92005 () Bool)

(declare-fun res!423228 () Bool)

(declare-fun e!374485 () Bool)

(assert (=> d!92005 (=> res!423228 e!374485)))

(get-info :version)

(assert (=> d!92005 (= res!423228 ((_ is Nil!12586) Nil!12586))))

(assert (=> d!92005 (= (noDuplicate!440 Nil!12586) e!374485)))

(declare-fun b!652448 () Bool)

(declare-fun e!374486 () Bool)

(assert (=> b!652448 (= e!374485 e!374486)))

(declare-fun res!423229 () Bool)

(assert (=> b!652448 (=> (not res!423229) (not e!374486))))

(declare-fun contains!3162 (List!12589 (_ BitVec 64)) Bool)

(assert (=> b!652448 (= res!423229 (not (contains!3162 (t!18808 Nil!12586) (h!13630 Nil!12586))))))

(declare-fun b!652449 () Bool)

(assert (=> b!652449 (= e!374486 (noDuplicate!440 (t!18808 Nil!12586)))))

(assert (= (and d!92005 (not res!423228)) b!652448))

(assert (= (and b!652448 res!423229) b!652449))

(declare-fun m!625137 () Bool)

(assert (=> b!652448 m!625137))

(declare-fun m!625139 () Bool)

(assert (=> b!652449 m!625139))

(assert (=> b!652287 d!92005))

(declare-fun d!92007 () Bool)

(declare-fun res!423234 () Bool)

(declare-fun e!374491 () Bool)

(assert (=> d!92007 (=> res!423234 e!374491)))

(assert (=> d!92007 (= res!423234 (= (select (arr!18509 lt!303467) index!984) (select (arr!18509 a!2986) j!136)))))

(assert (=> d!92007 (= (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) index!984) e!374491)))

(declare-fun b!652454 () Bool)

(declare-fun e!374492 () Bool)

(assert (=> b!652454 (= e!374491 e!374492)))

(declare-fun res!423235 () Bool)

(assert (=> b!652454 (=> (not res!423235) (not e!374492))))

(assert (=> b!652454 (= res!423235 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18874 lt!303467)))))

(declare-fun b!652455 () Bool)

(assert (=> b!652455 (= e!374492 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92007 (not res!423234)) b!652454))

(assert (= (and b!652454 res!423235) b!652455))

(declare-fun m!625141 () Bool)

(assert (=> d!92007 m!625141))

(assert (=> b!652455 m!624927))

(declare-fun m!625143 () Bool)

(assert (=> b!652455 m!625143))

(assert (=> b!652296 d!92007))

(declare-fun bm!33751 () Bool)

(declare-fun call!33754 () Bool)

(declare-fun c!74979 () Bool)

(assert (=> bm!33751 (= call!33754 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74979 (Cons!12585 (select (arr!18509 a!2986) #b00000000000000000000000000000000) Nil!12586) Nil!12586)))))

(declare-fun d!92009 () Bool)

(declare-fun res!423244 () Bool)

(declare-fun e!374503 () Bool)

(assert (=> d!92009 (=> res!423244 e!374503)))

(assert (=> d!92009 (= res!423244 (bvsge #b00000000000000000000000000000000 (size!18874 a!2986)))))

(assert (=> d!92009 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12586) e!374503)))

(declare-fun b!652466 () Bool)

(declare-fun e!374504 () Bool)

(assert (=> b!652466 (= e!374504 call!33754)))

(declare-fun b!652467 () Bool)

(declare-fun e!374502 () Bool)

(assert (=> b!652467 (= e!374502 (contains!3162 Nil!12586 (select (arr!18509 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!652468 () Bool)

(declare-fun e!374501 () Bool)

(assert (=> b!652468 (= e!374503 e!374501)))

(declare-fun res!423242 () Bool)

(assert (=> b!652468 (=> (not res!423242) (not e!374501))))

(assert (=> b!652468 (= res!423242 (not e!374502))))

(declare-fun res!423243 () Bool)

(assert (=> b!652468 (=> (not res!423243) (not e!374502))))

(assert (=> b!652468 (= res!423243 (validKeyInArray!0 (select (arr!18509 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!652469 () Bool)

(assert (=> b!652469 (= e!374504 call!33754)))

(declare-fun b!652470 () Bool)

(assert (=> b!652470 (= e!374501 e!374504)))

(assert (=> b!652470 (= c!74979 (validKeyInArray!0 (select (arr!18509 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92009 (not res!423244)) b!652468))

(assert (= (and b!652468 res!423243) b!652467))

(assert (= (and b!652468 res!423242) b!652470))

(assert (= (and b!652470 c!74979) b!652469))

(assert (= (and b!652470 (not c!74979)) b!652466))

(assert (= (or b!652469 b!652466) bm!33751))

(declare-fun m!625145 () Bool)

(assert (=> bm!33751 m!625145))

(declare-fun m!625147 () Bool)

(assert (=> bm!33751 m!625147))

(assert (=> b!652467 m!625145))

(assert (=> b!652467 m!625145))

(declare-fun m!625149 () Bool)

(assert (=> b!652467 m!625149))

(assert (=> b!652468 m!625145))

(assert (=> b!652468 m!625145))

(declare-fun m!625151 () Bool)

(assert (=> b!652468 m!625151))

(assert (=> b!652470 m!625145))

(assert (=> b!652470 m!625145))

(assert (=> b!652470 m!625151))

(assert (=> b!652285 d!92009))

(declare-fun c!74980 () Bool)

(declare-fun bm!33752 () Bool)

(declare-fun call!33755 () Bool)

(assert (=> bm!33752 (= call!33755 (arrayNoDuplicates!0 lt!303467 (bvadd index!984 #b00000000000000000000000000000001) (ite c!74980 (Cons!12585 (select (arr!18509 lt!303467) index!984) Nil!12586) Nil!12586)))))

(declare-fun d!92011 () Bool)

(declare-fun res!423247 () Bool)

(declare-fun e!374507 () Bool)

(assert (=> d!92011 (=> res!423247 e!374507)))

(assert (=> d!92011 (= res!423247 (bvsge index!984 (size!18874 lt!303467)))))

(assert (=> d!92011 (= (arrayNoDuplicates!0 lt!303467 index!984 Nil!12586) e!374507)))

(declare-fun b!652471 () Bool)

(declare-fun e!374508 () Bool)

(assert (=> b!652471 (= e!374508 call!33755)))

(declare-fun b!652472 () Bool)

(declare-fun e!374506 () Bool)

(assert (=> b!652472 (= e!374506 (contains!3162 Nil!12586 (select (arr!18509 lt!303467) index!984)))))

(declare-fun b!652473 () Bool)

(declare-fun e!374505 () Bool)

(assert (=> b!652473 (= e!374507 e!374505)))

(declare-fun res!423245 () Bool)

(assert (=> b!652473 (=> (not res!423245) (not e!374505))))

(assert (=> b!652473 (= res!423245 (not e!374506))))

(declare-fun res!423246 () Bool)

(assert (=> b!652473 (=> (not res!423246) (not e!374506))))

(assert (=> b!652473 (= res!423246 (validKeyInArray!0 (select (arr!18509 lt!303467) index!984)))))

(declare-fun b!652474 () Bool)

(assert (=> b!652474 (= e!374508 call!33755)))

(declare-fun b!652475 () Bool)

(assert (=> b!652475 (= e!374505 e!374508)))

(assert (=> b!652475 (= c!74980 (validKeyInArray!0 (select (arr!18509 lt!303467) index!984)))))

(assert (= (and d!92011 (not res!423247)) b!652473))

(assert (= (and b!652473 res!423246) b!652472))

(assert (= (and b!652473 res!423245) b!652475))

(assert (= (and b!652475 c!74980) b!652474))

(assert (= (and b!652475 (not c!74980)) b!652471))

(assert (= (or b!652474 b!652471) bm!33752))

(assert (=> bm!33752 m!625141))

(declare-fun m!625153 () Bool)

(assert (=> bm!33752 m!625153))

(assert (=> b!652472 m!625141))

(assert (=> b!652472 m!625141))

(declare-fun m!625155 () Bool)

(assert (=> b!652472 m!625155))

(assert (=> b!652473 m!625141))

(assert (=> b!652473 m!625141))

(declare-fun m!625157 () Bool)

(assert (=> b!652473 m!625157))

(assert (=> b!652475 m!625141))

(assert (=> b!652475 m!625141))

(assert (=> b!652475 m!625157))

(assert (=> b!652295 d!92011))

(declare-fun d!92013 () Bool)

(assert (=> d!92013 (arrayNoDuplicates!0 lt!303467 index!984 Nil!12586)))

(declare-fun lt!303582 () Unit!22304)

(declare-fun choose!39 (array!38613 (_ BitVec 32) (_ BitVec 32)) Unit!22304)

(assert (=> d!92013 (= lt!303582 (choose!39 lt!303467 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92013 (bvslt (size!18874 lt!303467) #b01111111111111111111111111111111)))

(assert (=> d!92013 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303467 #b00000000000000000000000000000000 index!984) lt!303582)))

(declare-fun bs!19422 () Bool)

(assert (= bs!19422 d!92013))

(assert (=> bs!19422 m!624975))

(declare-fun m!625159 () Bool)

(assert (=> bs!19422 m!625159))

(assert (=> b!652295 d!92013))

(declare-fun bm!33753 () Bool)

(declare-fun call!33756 () Bool)

(declare-fun c!74981 () Bool)

(assert (=> bm!33753 (= call!33756 (arrayNoDuplicates!0 lt!303467 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74981 (Cons!12585 (select (arr!18509 lt!303467) #b00000000000000000000000000000000) Nil!12586) Nil!12586)))))

(declare-fun d!92015 () Bool)

(declare-fun res!423250 () Bool)

(declare-fun e!374511 () Bool)

(assert (=> d!92015 (=> res!423250 e!374511)))

(assert (=> d!92015 (= res!423250 (bvsge #b00000000000000000000000000000000 (size!18874 lt!303467)))))

(assert (=> d!92015 (= (arrayNoDuplicates!0 lt!303467 #b00000000000000000000000000000000 Nil!12586) e!374511)))

(declare-fun b!652476 () Bool)

(declare-fun e!374512 () Bool)

(assert (=> b!652476 (= e!374512 call!33756)))

(declare-fun b!652477 () Bool)

(declare-fun e!374510 () Bool)

(assert (=> b!652477 (= e!374510 (contains!3162 Nil!12586 (select (arr!18509 lt!303467) #b00000000000000000000000000000000)))))

(declare-fun b!652478 () Bool)

(declare-fun e!374509 () Bool)

(assert (=> b!652478 (= e!374511 e!374509)))

(declare-fun res!423248 () Bool)

(assert (=> b!652478 (=> (not res!423248) (not e!374509))))

(assert (=> b!652478 (= res!423248 (not e!374510))))

(declare-fun res!423249 () Bool)

(assert (=> b!652478 (=> (not res!423249) (not e!374510))))

(assert (=> b!652478 (= res!423249 (validKeyInArray!0 (select (arr!18509 lt!303467) #b00000000000000000000000000000000)))))

(declare-fun b!652479 () Bool)

(assert (=> b!652479 (= e!374512 call!33756)))

(declare-fun b!652480 () Bool)

(assert (=> b!652480 (= e!374509 e!374512)))

(assert (=> b!652480 (= c!74981 (validKeyInArray!0 (select (arr!18509 lt!303467) #b00000000000000000000000000000000)))))

(assert (= (and d!92015 (not res!423250)) b!652478))

(assert (= (and b!652478 res!423249) b!652477))

(assert (= (and b!652478 res!423248) b!652480))

(assert (= (and b!652480 c!74981) b!652479))

(assert (= (and b!652480 (not c!74981)) b!652476))

(assert (= (or b!652479 b!652476) bm!33753))

(declare-fun m!625161 () Bool)

(assert (=> bm!33753 m!625161))

(declare-fun m!625163 () Bool)

(assert (=> bm!33753 m!625163))

(assert (=> b!652477 m!625161))

(assert (=> b!652477 m!625161))

(declare-fun m!625165 () Bool)

(assert (=> b!652477 m!625165))

(assert (=> b!652478 m!625161))

(assert (=> b!652478 m!625161))

(declare-fun m!625167 () Bool)

(assert (=> b!652478 m!625167))

(assert (=> b!652480 m!625161))

(assert (=> b!652480 m!625161))

(assert (=> b!652480 m!625167))

(assert (=> b!652295 d!92015))

(declare-fun d!92017 () Bool)

(declare-fun res!423251 () Bool)

(declare-fun e!374513 () Bool)

(assert (=> d!92017 (=> res!423251 e!374513)))

(assert (=> d!92017 (= res!423251 (= (select (arr!18509 lt!303467) j!136) (select (arr!18509 a!2986) j!136)))))

(assert (=> d!92017 (= (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) j!136) e!374513)))

(declare-fun b!652481 () Bool)

(declare-fun e!374514 () Bool)

(assert (=> b!652481 (= e!374513 e!374514)))

(declare-fun res!423252 () Bool)

(assert (=> b!652481 (=> (not res!423252) (not e!374514))))

(assert (=> b!652481 (= res!423252 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18874 lt!303467)))))

(declare-fun b!652482 () Bool)

(assert (=> b!652482 (= e!374514 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92017 (not res!423251)) b!652481))

(assert (= (and b!652481 res!423252) b!652482))

(declare-fun m!625169 () Bool)

(assert (=> d!92017 m!625169))

(assert (=> b!652482 m!624927))

(declare-fun m!625171 () Bool)

(assert (=> b!652482 m!625171))

(assert (=> b!652295 d!92017))

(declare-fun d!92019 () Bool)

(assert (=> d!92019 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303585 () Unit!22304)

(declare-fun choose!114 (array!38613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22304)

(assert (=> d!92019 (= lt!303585 (choose!114 lt!303467 (select (arr!18509 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92019 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92019 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303467 (select (arr!18509 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!303585)))

(declare-fun bs!19423 () Bool)

(assert (= bs!19423 d!92019))

(assert (=> bs!19423 m!624927))

(assert (=> bs!19423 m!624979))

(assert (=> bs!19423 m!624927))

(declare-fun m!625173 () Bool)

(assert (=> bs!19423 m!625173))

(assert (=> b!652295 d!92019))

(declare-fun d!92021 () Bool)

(declare-fun res!423253 () Bool)

(declare-fun e!374515 () Bool)

(assert (=> d!92021 (=> res!423253 e!374515)))

(assert (=> d!92021 (= res!423253 (= (select (arr!18509 lt!303467) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18509 a!2986) j!136)))))

(assert (=> d!92021 (= (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!374515)))

(declare-fun b!652483 () Bool)

(declare-fun e!374516 () Bool)

(assert (=> b!652483 (= e!374515 e!374516)))

(declare-fun res!423254 () Bool)

(assert (=> b!652483 (=> (not res!423254) (not e!374516))))

(assert (=> b!652483 (= res!423254 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18874 lt!303467)))))

(declare-fun b!652484 () Bool)

(assert (=> b!652484 (= e!374516 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92021 (not res!423253)) b!652483))

(assert (= (and b!652483 res!423254) b!652484))

(declare-fun m!625175 () Bool)

(assert (=> d!92021 m!625175))

(assert (=> b!652484 m!624927))

(declare-fun m!625177 () Bool)

(assert (=> b!652484 m!625177))

(assert (=> b!652295 d!92021))

(declare-fun d!92023 () Bool)

(declare-fun e!374519 () Bool)

(assert (=> d!92023 e!374519))

(declare-fun res!423257 () Bool)

(assert (=> d!92023 (=> (not res!423257) (not e!374519))))

(assert (=> d!92023 (= res!423257 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986))))))

(declare-fun lt!303588 () Unit!22304)

(declare-fun choose!41 (array!38613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12589) Unit!22304)

(assert (=> d!92023 (= lt!303588 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12586))))

(assert (=> d!92023 (bvslt (size!18874 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92023 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12586) lt!303588)))

(declare-fun b!652487 () Bool)

(assert (=> b!652487 (= e!374519 (arrayNoDuplicates!0 (array!38614 (store (arr!18509 a!2986) i!1108 k0!1786) (size!18874 a!2986)) #b00000000000000000000000000000000 Nil!12586))))

(assert (= (and d!92023 res!423257) b!652487))

(declare-fun m!625179 () Bool)

(assert (=> d!92023 m!625179))

(assert (=> b!652487 m!624931))

(declare-fun m!625181 () Bool)

(assert (=> b!652487 m!625181))

(assert (=> b!652295 d!92023))

(declare-fun call!33757 () Bool)

(declare-fun bm!33754 () Bool)

(declare-fun c!74982 () Bool)

(assert (=> bm!33754 (= call!33757 (arrayNoDuplicates!0 lt!303467 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74982 (Cons!12585 (select (arr!18509 lt!303467) j!136) Nil!12586) Nil!12586)))))

(declare-fun d!92025 () Bool)

(declare-fun res!423260 () Bool)

(declare-fun e!374522 () Bool)

(assert (=> d!92025 (=> res!423260 e!374522)))

(assert (=> d!92025 (= res!423260 (bvsge j!136 (size!18874 lt!303467)))))

(assert (=> d!92025 (= (arrayNoDuplicates!0 lt!303467 j!136 Nil!12586) e!374522)))

(declare-fun b!652488 () Bool)

(declare-fun e!374523 () Bool)

(assert (=> b!652488 (= e!374523 call!33757)))

(declare-fun b!652489 () Bool)

(declare-fun e!374521 () Bool)

(assert (=> b!652489 (= e!374521 (contains!3162 Nil!12586 (select (arr!18509 lt!303467) j!136)))))

(declare-fun b!652490 () Bool)

(declare-fun e!374520 () Bool)

(assert (=> b!652490 (= e!374522 e!374520)))

(declare-fun res!423258 () Bool)

(assert (=> b!652490 (=> (not res!423258) (not e!374520))))

(assert (=> b!652490 (= res!423258 (not e!374521))))

(declare-fun res!423259 () Bool)

(assert (=> b!652490 (=> (not res!423259) (not e!374521))))

(assert (=> b!652490 (= res!423259 (validKeyInArray!0 (select (arr!18509 lt!303467) j!136)))))

(declare-fun b!652491 () Bool)

(assert (=> b!652491 (= e!374523 call!33757)))

(declare-fun b!652492 () Bool)

(assert (=> b!652492 (= e!374520 e!374523)))

(assert (=> b!652492 (= c!74982 (validKeyInArray!0 (select (arr!18509 lt!303467) j!136)))))

(assert (= (and d!92025 (not res!423260)) b!652490))

(assert (= (and b!652490 res!423259) b!652489))

(assert (= (and b!652490 res!423258) b!652492))

(assert (= (and b!652492 c!74982) b!652491))

(assert (= (and b!652492 (not c!74982)) b!652488))

(assert (= (or b!652491 b!652488) bm!33754))

(assert (=> bm!33754 m!625169))

(declare-fun m!625183 () Bool)

(assert (=> bm!33754 m!625183))

(assert (=> b!652489 m!625169))

(assert (=> b!652489 m!625169))

(declare-fun m!625185 () Bool)

(assert (=> b!652489 m!625185))

(assert (=> b!652490 m!625169))

(assert (=> b!652490 m!625169))

(declare-fun m!625187 () Bool)

(assert (=> b!652490 m!625187))

(assert (=> b!652492 m!625169))

(assert (=> b!652492 m!625169))

(assert (=> b!652492 m!625187))

(assert (=> b!652284 d!92025))

(assert (=> b!652284 d!92015))

(declare-fun d!92027 () Bool)

(assert (=> d!92027 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303589 () Unit!22304)

(assert (=> d!92027 (= lt!303589 (choose!114 lt!303467 (select (arr!18509 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92027 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92027 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303467 (select (arr!18509 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303589)))

(declare-fun bs!19424 () Bool)

(assert (= bs!19424 d!92027))

(assert (=> bs!19424 m!624927))

(assert (=> bs!19424 m!624991))

(assert (=> bs!19424 m!624927))

(declare-fun m!625189 () Bool)

(assert (=> bs!19424 m!625189))

(assert (=> b!652284 d!92027))

(declare-fun d!92029 () Bool)

(assert (=> d!92029 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18874 lt!303467)) (not (= (select (arr!18509 lt!303467) j!136) (select (arr!18509 a!2986) j!136))))))

(declare-fun lt!303592 () Unit!22304)

(declare-fun choose!21 (array!38613 (_ BitVec 64) (_ BitVec 32) List!12589) Unit!22304)

(assert (=> d!92029 (= lt!303592 (choose!21 lt!303467 (select (arr!18509 a!2986) j!136) j!136 Nil!12586))))

(assert (=> d!92029 (bvslt (size!18874 lt!303467) #b01111111111111111111111111111111)))

(assert (=> d!92029 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303467 (select (arr!18509 a!2986) j!136) j!136 Nil!12586) lt!303592)))

(declare-fun bs!19425 () Bool)

(assert (= bs!19425 d!92029))

(assert (=> bs!19425 m!625169))

(assert (=> bs!19425 m!624927))

(declare-fun m!625191 () Bool)

(assert (=> bs!19425 m!625191))

(assert (=> b!652284 d!92029))

(declare-fun d!92031 () Bool)

(declare-fun res!423261 () Bool)

(declare-fun e!374524 () Bool)

(assert (=> d!92031 (=> res!423261 e!374524)))

(assert (=> d!92031 (= res!423261 (= (select (arr!18509 lt!303467) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18509 a!2986) j!136)))))

(assert (=> d!92031 (= (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!374524)))

(declare-fun b!652493 () Bool)

(declare-fun e!374525 () Bool)

(assert (=> b!652493 (= e!374524 e!374525)))

(declare-fun res!423262 () Bool)

(assert (=> b!652493 (=> (not res!423262) (not e!374525))))

(assert (=> b!652493 (= res!423262 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18874 lt!303467)))))

(declare-fun b!652494 () Bool)

(assert (=> b!652494 (= e!374525 (arrayContainsKey!0 lt!303467 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92031 (not res!423261)) b!652493))

(assert (= (and b!652493 res!423262) b!652494))

(declare-fun m!625193 () Bool)

(assert (=> d!92031 m!625193))

(assert (=> b!652494 m!624927))

(declare-fun m!625195 () Bool)

(assert (=> b!652494 m!625195))

(assert (=> b!652284 d!92031))

(declare-fun d!92033 () Bool)

(assert (=> d!92033 (arrayNoDuplicates!0 lt!303467 j!136 Nil!12586)))

(declare-fun lt!303593 () Unit!22304)

(assert (=> d!92033 (= lt!303593 (choose!39 lt!303467 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92033 (bvslt (size!18874 lt!303467) #b01111111111111111111111111111111)))

(assert (=> d!92033 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303467 #b00000000000000000000000000000000 j!136) lt!303593)))

(declare-fun bs!19426 () Bool)

(assert (= bs!19426 d!92033))

(assert (=> bs!19426 m!624993))

(declare-fun m!625197 () Bool)

(assert (=> bs!19426 m!625197))

(assert (=> b!652284 d!92033))

(assert (=> b!652284 d!92023))

(declare-fun d!92035 () Bool)

(declare-fun res!423263 () Bool)

(declare-fun e!374526 () Bool)

(assert (=> d!92035 (=> res!423263 e!374526)))

(assert (=> d!92035 (= res!423263 (= (select (arr!18509 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92035 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!374526)))

(declare-fun b!652495 () Bool)

(declare-fun e!374527 () Bool)

(assert (=> b!652495 (= e!374526 e!374527)))

(declare-fun res!423264 () Bool)

(assert (=> b!652495 (=> (not res!423264) (not e!374527))))

(assert (=> b!652495 (= res!423264 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18874 a!2986)))))

(declare-fun b!652496 () Bool)

(assert (=> b!652496 (= e!374527 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92035 (not res!423263)) b!652495))

(assert (= (and b!652495 res!423264) b!652496))

(assert (=> d!92035 m!625145))

(declare-fun m!625199 () Bool)

(assert (=> b!652496 m!625199))

(assert (=> b!652294 d!92035))

(declare-fun d!92037 () Bool)

(assert (=> d!92037 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59102 d!92037))

(declare-fun d!92039 () Bool)

(assert (=> d!92039 (= (array_inv!14392 a!2986) (bvsge (size!18874 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59102 d!92039))

(declare-fun b!652509 () Bool)

(declare-fun e!374534 () SeekEntryResult!6946)

(assert (=> b!652509 (= e!374534 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303468 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!303456 lt!303467 mask!3053))))

(declare-fun b!652510 () Bool)

(declare-fun e!374536 () SeekEntryResult!6946)

(declare-fun e!374535 () SeekEntryResult!6946)

(assert (=> b!652510 (= e!374536 e!374535)))

(declare-fun c!74991 () Bool)

(declare-fun lt!303598 () (_ BitVec 64))

(assert (=> b!652510 (= c!74991 (= lt!303598 lt!303456))))

(declare-fun b!652511 () Bool)

(assert (=> b!652511 (= e!374536 Undefined!6946)))

(declare-fun d!92041 () Bool)

(declare-fun lt!303599 () SeekEntryResult!6946)

(assert (=> d!92041 (and (or ((_ is Undefined!6946) lt!303599) (not ((_ is Found!6946) lt!303599)) (and (bvsge (index!30138 lt!303599) #b00000000000000000000000000000000) (bvslt (index!30138 lt!303599) (size!18874 lt!303467)))) (or ((_ is Undefined!6946) lt!303599) ((_ is Found!6946) lt!303599) (not ((_ is MissingVacant!6946) lt!303599)) (not (= (index!30140 lt!303599) vacantSpotIndex!68)) (and (bvsge (index!30140 lt!303599) #b00000000000000000000000000000000) (bvslt (index!30140 lt!303599) (size!18874 lt!303467)))) (or ((_ is Undefined!6946) lt!303599) (ite ((_ is Found!6946) lt!303599) (= (select (arr!18509 lt!303467) (index!30138 lt!303599)) lt!303456) (and ((_ is MissingVacant!6946) lt!303599) (= (index!30140 lt!303599) vacantSpotIndex!68) (= (select (arr!18509 lt!303467) (index!30140 lt!303599)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92041 (= lt!303599 e!374536)))

(declare-fun c!74989 () Bool)

(assert (=> d!92041 (= c!74989 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92041 (= lt!303598 (select (arr!18509 lt!303467) lt!303468))))

(assert (=> d!92041 (validMask!0 mask!3053)))

(assert (=> d!92041 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 lt!303456 lt!303467 mask!3053) lt!303599)))

(declare-fun b!652512 () Bool)

(assert (=> b!652512 (= e!374534 (MissingVacant!6946 vacantSpotIndex!68))))

(declare-fun b!652513 () Bool)

(declare-fun c!74990 () Bool)

(assert (=> b!652513 (= c!74990 (= lt!303598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652513 (= e!374535 e!374534)))

(declare-fun b!652514 () Bool)

(assert (=> b!652514 (= e!374535 (Found!6946 lt!303468))))

(assert (= (and d!92041 c!74989) b!652511))

(assert (= (and d!92041 (not c!74989)) b!652510))

(assert (= (and b!652510 c!74991) b!652514))

(assert (= (and b!652510 (not c!74991)) b!652513))

(assert (= (and b!652513 c!74990) b!652512))

(assert (= (and b!652513 (not c!74990)) b!652509))

(declare-fun m!625201 () Bool)

(assert (=> b!652509 m!625201))

(assert (=> b!652509 m!625201))

(declare-fun m!625203 () Bool)

(assert (=> b!652509 m!625203))

(declare-fun m!625205 () Bool)

(assert (=> d!92041 m!625205))

(declare-fun m!625207 () Bool)

(assert (=> d!92041 m!625207))

(declare-fun m!625209 () Bool)

(assert (=> d!92041 m!625209))

(assert (=> d!92041 m!624959))

(assert (=> b!652293 d!92041))

(declare-fun e!374537 () SeekEntryResult!6946)

(declare-fun b!652515 () Bool)

(assert (=> b!652515 (= e!374537 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303468 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652516 () Bool)

(declare-fun e!374539 () SeekEntryResult!6946)

(declare-fun e!374538 () SeekEntryResult!6946)

(assert (=> b!652516 (= e!374539 e!374538)))

(declare-fun c!74994 () Bool)

(declare-fun lt!303600 () (_ BitVec 64))

(assert (=> b!652516 (= c!74994 (= lt!303600 (select (arr!18509 a!2986) j!136)))))

(declare-fun b!652517 () Bool)

(assert (=> b!652517 (= e!374539 Undefined!6946)))

(declare-fun d!92043 () Bool)

(declare-fun lt!303601 () SeekEntryResult!6946)

(assert (=> d!92043 (and (or ((_ is Undefined!6946) lt!303601) (not ((_ is Found!6946) lt!303601)) (and (bvsge (index!30138 lt!303601) #b00000000000000000000000000000000) (bvslt (index!30138 lt!303601) (size!18874 a!2986)))) (or ((_ is Undefined!6946) lt!303601) ((_ is Found!6946) lt!303601) (not ((_ is MissingVacant!6946) lt!303601)) (not (= (index!30140 lt!303601) vacantSpotIndex!68)) (and (bvsge (index!30140 lt!303601) #b00000000000000000000000000000000) (bvslt (index!30140 lt!303601) (size!18874 a!2986)))) (or ((_ is Undefined!6946) lt!303601) (ite ((_ is Found!6946) lt!303601) (= (select (arr!18509 a!2986) (index!30138 lt!303601)) (select (arr!18509 a!2986) j!136)) (and ((_ is MissingVacant!6946) lt!303601) (= (index!30140 lt!303601) vacantSpotIndex!68) (= (select (arr!18509 a!2986) (index!30140 lt!303601)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92043 (= lt!303601 e!374539)))

(declare-fun c!74992 () Bool)

(assert (=> d!92043 (= c!74992 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92043 (= lt!303600 (select (arr!18509 a!2986) lt!303468))))

(assert (=> d!92043 (validMask!0 mask!3053)))

(assert (=> d!92043 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053) lt!303601)))

(declare-fun b!652518 () Bool)

(assert (=> b!652518 (= e!374537 (MissingVacant!6946 vacantSpotIndex!68))))

(declare-fun b!652519 () Bool)

(declare-fun c!74993 () Bool)

(assert (=> b!652519 (= c!74993 (= lt!303600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652519 (= e!374538 e!374537)))

(declare-fun b!652520 () Bool)

(assert (=> b!652520 (= e!374538 (Found!6946 lt!303468))))

(assert (= (and d!92043 c!74992) b!652517))

(assert (= (and d!92043 (not c!74992)) b!652516))

(assert (= (and b!652516 c!74994) b!652520))

(assert (= (and b!652516 (not c!74994)) b!652519))

(assert (= (and b!652519 c!74993) b!652518))

(assert (= (and b!652519 (not c!74993)) b!652515))

(assert (=> b!652515 m!625201))

(assert (=> b!652515 m!625201))

(assert (=> b!652515 m!624927))

(declare-fun m!625211 () Bool)

(assert (=> b!652515 m!625211))

(declare-fun m!625213 () Bool)

(assert (=> d!92043 m!625213))

(declare-fun m!625215 () Bool)

(assert (=> d!92043 m!625215))

(declare-fun m!625217 () Bool)

(assert (=> d!92043 m!625217))

(assert (=> d!92043 m!624959))

(assert (=> b!652293 d!92043))

(declare-fun d!92047 () Bool)

(declare-fun lt!303604 () (_ BitVec 32))

(assert (=> d!92047 (and (bvsge lt!303604 #b00000000000000000000000000000000) (bvslt lt!303604 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92047 (= lt!303604 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92047 (validMask!0 mask!3053)))

(assert (=> d!92047 (= (nextIndex!0 index!984 x!910 mask!3053) lt!303604)))

(declare-fun bs!19427 () Bool)

(assert (= bs!19427 d!92047))

(declare-fun m!625219 () Bool)

(assert (=> bs!19427 m!625219))

(assert (=> bs!19427 m!624959))

(assert (=> b!652293 d!92047))

(declare-fun d!92051 () Bool)

(declare-fun e!374554 () Bool)

(assert (=> d!92051 e!374554))

(declare-fun res!423273 () Bool)

(assert (=> d!92051 (=> (not res!423273) (not e!374554))))

(assert (=> d!92051 (= res!423273 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18874 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18874 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18874 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986))))))

(declare-fun lt!303611 () Unit!22304)

(declare-fun choose!9 (array!38613 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22304)

(assert (=> d!92051 (= lt!303611 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92051 (validMask!0 mask!3053)))

(assert (=> d!92051 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 mask!3053) lt!303611)))

(declare-fun b!652541 () Bool)

(assert (=> b!652541 (= e!374554 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303468 vacantSpotIndex!68 (select (store (arr!18509 a!2986) i!1108 k0!1786) j!136) (array!38614 (store (arr!18509 a!2986) i!1108 k0!1786) (size!18874 a!2986)) mask!3053)))))

(assert (= (and d!92051 res!423273) b!652541))

(declare-fun m!625225 () Bool)

(assert (=> d!92051 m!625225))

(assert (=> d!92051 m!624959))

(assert (=> b!652541 m!624927))

(assert (=> b!652541 m!624949))

(declare-fun m!625227 () Bool)

(assert (=> b!652541 m!625227))

(assert (=> b!652541 m!624949))

(assert (=> b!652541 m!624931))

(assert (=> b!652541 m!624927))

(assert (=> b!652541 m!624953))

(assert (=> b!652293 d!92051))

(declare-fun b!652542 () Bool)

(declare-fun e!374555 () SeekEntryResult!6946)

(assert (=> b!652542 (= e!374555 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!303456 lt!303467 mask!3053))))

(declare-fun b!652543 () Bool)

(declare-fun e!374557 () SeekEntryResult!6946)

(declare-fun e!374556 () SeekEntryResult!6946)

(assert (=> b!652543 (= e!374557 e!374556)))

(declare-fun c!75003 () Bool)

(declare-fun lt!303612 () (_ BitVec 64))

(assert (=> b!652543 (= c!75003 (= lt!303612 lt!303456))))

(declare-fun b!652544 () Bool)

(assert (=> b!652544 (= e!374557 Undefined!6946)))

(declare-fun d!92055 () Bool)

(declare-fun lt!303613 () SeekEntryResult!6946)

(assert (=> d!92055 (and (or ((_ is Undefined!6946) lt!303613) (not ((_ is Found!6946) lt!303613)) (and (bvsge (index!30138 lt!303613) #b00000000000000000000000000000000) (bvslt (index!30138 lt!303613) (size!18874 lt!303467)))) (or ((_ is Undefined!6946) lt!303613) ((_ is Found!6946) lt!303613) (not ((_ is MissingVacant!6946) lt!303613)) (not (= (index!30140 lt!303613) vacantSpotIndex!68)) (and (bvsge (index!30140 lt!303613) #b00000000000000000000000000000000) (bvslt (index!30140 lt!303613) (size!18874 lt!303467)))) (or ((_ is Undefined!6946) lt!303613) (ite ((_ is Found!6946) lt!303613) (= (select (arr!18509 lt!303467) (index!30138 lt!303613)) lt!303456) (and ((_ is MissingVacant!6946) lt!303613) (= (index!30140 lt!303613) vacantSpotIndex!68) (= (select (arr!18509 lt!303467) (index!30140 lt!303613)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92055 (= lt!303613 e!374557)))

(declare-fun c!75001 () Bool)

(assert (=> d!92055 (= c!75001 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92055 (= lt!303612 (select (arr!18509 lt!303467) index!984))))

(assert (=> d!92055 (validMask!0 mask!3053)))

(assert (=> d!92055 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303456 lt!303467 mask!3053) lt!303613)))

(declare-fun b!652545 () Bool)

(assert (=> b!652545 (= e!374555 (MissingVacant!6946 vacantSpotIndex!68))))

(declare-fun b!652546 () Bool)

(declare-fun c!75002 () Bool)

(assert (=> b!652546 (= c!75002 (= lt!303612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652546 (= e!374556 e!374555)))

(declare-fun b!652547 () Bool)

(assert (=> b!652547 (= e!374556 (Found!6946 index!984))))

(assert (= (and d!92055 c!75001) b!652544))

(assert (= (and d!92055 (not c!75001)) b!652543))

(assert (= (and b!652543 c!75003) b!652547))

(assert (= (and b!652543 (not c!75003)) b!652546))

(assert (= (and b!652546 c!75002) b!652545))

(assert (= (and b!652546 (not c!75002)) b!652542))

(assert (=> b!652542 m!624947))

(assert (=> b!652542 m!624947))

(declare-fun m!625229 () Bool)

(assert (=> b!652542 m!625229))

(declare-fun m!625231 () Bool)

(assert (=> d!92055 m!625231))

(declare-fun m!625233 () Bool)

(assert (=> d!92055 m!625233))

(assert (=> d!92055 m!625141))

(assert (=> d!92055 m!624959))

(assert (=> b!652293 d!92055))

(declare-fun d!92057 () Bool)

(assert (=> d!92057 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652292 d!92057))

(declare-fun b!652595 () Bool)

(declare-fun e!374589 () Bool)

(declare-fun call!33763 () Bool)

(assert (=> b!652595 (= e!374589 call!33763)))

(declare-fun b!652596 () Bool)

(declare-fun e!374590 () Bool)

(assert (=> b!652596 (= e!374589 e!374590)))

(declare-fun lt!303628 () (_ BitVec 64))

(assert (=> b!652596 (= lt!303628 (select (arr!18509 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!303629 () Unit!22304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38613 (_ BitVec 64) (_ BitVec 32)) Unit!22304)

(assert (=> b!652596 (= lt!303629 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!303628 #b00000000000000000000000000000000))))

(assert (=> b!652596 (arrayContainsKey!0 a!2986 lt!303628 #b00000000000000000000000000000000)))

(declare-fun lt!303630 () Unit!22304)

(assert (=> b!652596 (= lt!303630 lt!303629)))

(declare-fun res!423287 () Bool)

(assert (=> b!652596 (= res!423287 (= (seekEntryOrOpen!0 (select (arr!18509 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6946 #b00000000000000000000000000000000)))))

(assert (=> b!652596 (=> (not res!423287) (not e!374590))))

(declare-fun d!92059 () Bool)

(declare-fun res!423288 () Bool)

(declare-fun e!374588 () Bool)

(assert (=> d!92059 (=> res!423288 e!374588)))

(assert (=> d!92059 (= res!423288 (bvsge #b00000000000000000000000000000000 (size!18874 a!2986)))))

(assert (=> d!92059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!374588)))

(declare-fun bm!33760 () Bool)

(assert (=> bm!33760 (= call!33763 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!652597 () Bool)

(assert (=> b!652597 (= e!374588 e!374589)))

(declare-fun c!75021 () Bool)

(assert (=> b!652597 (= c!75021 (validKeyInArray!0 (select (arr!18509 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!652598 () Bool)

(assert (=> b!652598 (= e!374590 call!33763)))

(assert (= (and d!92059 (not res!423288)) b!652597))

(assert (= (and b!652597 c!75021) b!652596))

(assert (= (and b!652597 (not c!75021)) b!652595))

(assert (= (and b!652596 res!423287) b!652598))

(assert (= (or b!652598 b!652595) bm!33760))

(assert (=> b!652596 m!625145))

(declare-fun m!625263 () Bool)

(assert (=> b!652596 m!625263))

(declare-fun m!625265 () Bool)

(assert (=> b!652596 m!625265))

(assert (=> b!652596 m!625145))

(declare-fun m!625267 () Bool)

(assert (=> b!652596 m!625267))

(declare-fun m!625269 () Bool)

(assert (=> bm!33760 m!625269))

(assert (=> b!652597 m!625145))

(assert (=> b!652597 m!625145))

(assert (=> b!652597 m!625151))

(assert (=> b!652291 d!92059))

(declare-fun b!652640 () Bool)

(declare-fun e!374616 () SeekEntryResult!6946)

(declare-fun lt!303656 () SeekEntryResult!6946)

(assert (=> b!652640 (= e!374616 (MissingZero!6946 (index!30139 lt!303656)))))

(declare-fun b!652641 () Bool)

(declare-fun e!374618 () SeekEntryResult!6946)

(assert (=> b!652641 (= e!374618 Undefined!6946)))

(declare-fun b!652642 () Bool)

(declare-fun c!75038 () Bool)

(declare-fun lt!303655 () (_ BitVec 64))

(assert (=> b!652642 (= c!75038 (= lt!303655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374617 () SeekEntryResult!6946)

(assert (=> b!652642 (= e!374617 e!374616)))

(declare-fun b!652643 () Bool)

(assert (=> b!652643 (= e!374616 (seekKeyOrZeroReturnVacant!0 (x!58932 lt!303656) (index!30139 lt!303656) (index!30139 lt!303656) k0!1786 a!2986 mask!3053))))

(declare-fun b!652644 () Bool)

(assert (=> b!652644 (= e!374617 (Found!6946 (index!30139 lt!303656)))))

(declare-fun b!652639 () Bool)

(assert (=> b!652639 (= e!374618 e!374617)))

(assert (=> b!652639 (= lt!303655 (select (arr!18509 a!2986) (index!30139 lt!303656)))))

(declare-fun c!75037 () Bool)

(assert (=> b!652639 (= c!75037 (= lt!303655 k0!1786))))

(declare-fun d!92073 () Bool)

(declare-fun lt!303657 () SeekEntryResult!6946)

(assert (=> d!92073 (and (or ((_ is Undefined!6946) lt!303657) (not ((_ is Found!6946) lt!303657)) (and (bvsge (index!30138 lt!303657) #b00000000000000000000000000000000) (bvslt (index!30138 lt!303657) (size!18874 a!2986)))) (or ((_ is Undefined!6946) lt!303657) ((_ is Found!6946) lt!303657) (not ((_ is MissingZero!6946) lt!303657)) (and (bvsge (index!30137 lt!303657) #b00000000000000000000000000000000) (bvslt (index!30137 lt!303657) (size!18874 a!2986)))) (or ((_ is Undefined!6946) lt!303657) ((_ is Found!6946) lt!303657) ((_ is MissingZero!6946) lt!303657) (not ((_ is MissingVacant!6946) lt!303657)) (and (bvsge (index!30140 lt!303657) #b00000000000000000000000000000000) (bvslt (index!30140 lt!303657) (size!18874 a!2986)))) (or ((_ is Undefined!6946) lt!303657) (ite ((_ is Found!6946) lt!303657) (= (select (arr!18509 a!2986) (index!30138 lt!303657)) k0!1786) (ite ((_ is MissingZero!6946) lt!303657) (= (select (arr!18509 a!2986) (index!30137 lt!303657)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6946) lt!303657) (= (select (arr!18509 a!2986) (index!30140 lt!303657)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92073 (= lt!303657 e!374618)))

(declare-fun c!75039 () Bool)

(assert (=> d!92073 (= c!75039 (and ((_ is Intermediate!6946) lt!303656) (undefined!7758 lt!303656)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38613 (_ BitVec 32)) SeekEntryResult!6946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92073 (= lt!303656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92073 (validMask!0 mask!3053)))

(assert (=> d!92073 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!303657)))

(assert (= (and d!92073 c!75039) b!652641))

(assert (= (and d!92073 (not c!75039)) b!652639))

(assert (= (and b!652639 c!75037) b!652644))

(assert (= (and b!652639 (not c!75037)) b!652642))

(assert (= (and b!652642 c!75038) b!652640))

(assert (= (and b!652642 (not c!75038)) b!652643))

(declare-fun m!625297 () Bool)

(assert (=> b!652643 m!625297))

(declare-fun m!625299 () Bool)

(assert (=> b!652639 m!625299))

(declare-fun m!625301 () Bool)

(assert (=> d!92073 m!625301))

(declare-fun m!625303 () Bool)

(assert (=> d!92073 m!625303))

(declare-fun m!625305 () Bool)

(assert (=> d!92073 m!625305))

(declare-fun m!625307 () Bool)

(assert (=> d!92073 m!625307))

(assert (=> d!92073 m!625303))

(declare-fun m!625309 () Bool)

(assert (=> d!92073 m!625309))

(assert (=> d!92073 m!624959))

(assert (=> b!652280 d!92073))

(assert (=> b!652290 d!92007))

(declare-fun b!652646 () Bool)

(declare-fun e!374620 () SeekEntryResult!6946)

(assert (=> b!652646 (= e!374620 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652647 () Bool)

(declare-fun e!374622 () SeekEntryResult!6946)

(declare-fun e!374621 () SeekEntryResult!6946)

(assert (=> b!652647 (= e!374622 e!374621)))

(declare-fun c!75042 () Bool)

(declare-fun lt!303659 () (_ BitVec 64))

(assert (=> b!652647 (= c!75042 (= lt!303659 (select (arr!18509 a!2986) j!136)))))

(declare-fun b!652648 () Bool)

(assert (=> b!652648 (= e!374622 Undefined!6946)))

(declare-fun d!92087 () Bool)

(declare-fun lt!303660 () SeekEntryResult!6946)

(assert (=> d!92087 (and (or ((_ is Undefined!6946) lt!303660) (not ((_ is Found!6946) lt!303660)) (and (bvsge (index!30138 lt!303660) #b00000000000000000000000000000000) (bvslt (index!30138 lt!303660) (size!18874 a!2986)))) (or ((_ is Undefined!6946) lt!303660) ((_ is Found!6946) lt!303660) (not ((_ is MissingVacant!6946) lt!303660)) (not (= (index!30140 lt!303660) vacantSpotIndex!68)) (and (bvsge (index!30140 lt!303660) #b00000000000000000000000000000000) (bvslt (index!30140 lt!303660) (size!18874 a!2986)))) (or ((_ is Undefined!6946) lt!303660) (ite ((_ is Found!6946) lt!303660) (= (select (arr!18509 a!2986) (index!30138 lt!303660)) (select (arr!18509 a!2986) j!136)) (and ((_ is MissingVacant!6946) lt!303660) (= (index!30140 lt!303660) vacantSpotIndex!68) (= (select (arr!18509 a!2986) (index!30140 lt!303660)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92087 (= lt!303660 e!374622)))

(declare-fun c!75040 () Bool)

(assert (=> d!92087 (= c!75040 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92087 (= lt!303659 (select (arr!18509 a!2986) index!984))))

(assert (=> d!92087 (validMask!0 mask!3053)))

(assert (=> d!92087 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053) lt!303660)))

(declare-fun b!652649 () Bool)

(assert (=> b!652649 (= e!374620 (MissingVacant!6946 vacantSpotIndex!68))))

(declare-fun b!652650 () Bool)

(declare-fun c!75041 () Bool)

(assert (=> b!652650 (= c!75041 (= lt!303659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652650 (= e!374621 e!374620)))

(declare-fun b!652651 () Bool)

(assert (=> b!652651 (= e!374621 (Found!6946 index!984))))

(assert (= (and d!92087 c!75040) b!652648))

(assert (= (and d!92087 (not c!75040)) b!652647))

(assert (= (and b!652647 c!75042) b!652651))

(assert (= (and b!652647 (not c!75042)) b!652650))

(assert (= (and b!652650 c!75041) b!652649))

(assert (= (and b!652650 (not c!75041)) b!652646))

(assert (=> b!652646 m!624947))

(assert (=> b!652646 m!624947))

(assert (=> b!652646 m!624927))

(declare-fun m!625315 () Bool)

(assert (=> b!652646 m!625315))

(declare-fun m!625317 () Bool)

(assert (=> d!92087 m!625317))

(declare-fun m!625319 () Bool)

(assert (=> d!92087 m!625319))

(assert (=> d!92087 m!624937))

(assert (=> d!92087 m!624959))

(assert (=> b!652278 d!92087))

(assert (=> b!652299 d!92017))

(declare-fun d!92091 () Bool)

(assert (=> d!92091 (= (validKeyInArray!0 (select (arr!18509 a!2986) j!136)) (and (not (= (select (arr!18509 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18509 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652288 d!92091))

(check-sat (not b!652492) (not bm!33753) (not d!92023) (not b!652643) (not b!652482) (not d!92051) (not d!92047) (not bm!33752) (not b!652475) (not b!652449) (not d!92041) (not d!92027) (not d!92043) (not d!92073) (not d!92087) (not b!652473) (not b!652489) (not b!652496) (not b!652480) (not b!652646) (not b!652478) (not b!652477) (not b!652468) (not d!92019) (not b!652509) (not bm!33754) (not b!652487) (not b!652467) (not b!652470) (not b!652455) (not bm!33751) (not d!92055) (not b!652541) (not b!652542) (not d!92029) (not b!652515) (not b!652494) (not b!652472) (not bm!33760) (not b!652448) (not b!652484) (not b!652596) (not b!652490) (not d!92033) (not d!92013) (not b!652597))
(check-sat)
