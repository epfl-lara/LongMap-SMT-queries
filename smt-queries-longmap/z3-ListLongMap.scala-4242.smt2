; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58704 () Bool)

(assert start!58704)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!647394 () Bool)

(declare-datatypes ((array!38490 0))(
  ( (array!38491 (arr!18451 (Array (_ BitVec 32) (_ BitVec 64))) (size!18815 (_ BitVec 32))) )
))
(declare-fun lt!300423 () array!38490)

(declare-fun e!371202 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38490)

(declare-fun arrayContainsKey!0 (array!38490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647394 (= e!371202 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) index!984))))

(declare-fun b!647395 () Bool)

(declare-fun e!371189 () Bool)

(declare-fun e!371197 () Bool)

(assert (=> b!647395 (= e!371189 e!371197)))

(declare-fun res!419440 () Bool)

(assert (=> b!647395 (=> (not res!419440) (not e!371197))))

(assert (=> b!647395 (= res!419440 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) j!136))))

(declare-fun b!647396 () Bool)

(declare-datatypes ((Unit!21981 0))(
  ( (Unit!21982) )
))
(declare-fun e!371195 () Unit!21981)

(declare-fun Unit!21983 () Unit!21981)

(assert (=> b!647396 (= e!371195 Unit!21983)))

(declare-fun res!419435 () Bool)

(declare-fun e!371190 () Bool)

(assert (=> start!58704 (=> (not res!419435) (not e!371190))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58704 (= res!419435 (validMask!0 mask!3053))))

(assert (=> start!58704 e!371190))

(assert (=> start!58704 true))

(declare-fun array_inv!14310 (array!38490) Bool)

(assert (=> start!58704 (array_inv!14310 a!2986)))

(declare-fun b!647397 () Bool)

(declare-fun res!419428 () Bool)

(assert (=> b!647397 (=> (not res!419428) (not e!371190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647397 (= res!419428 (validKeyInArray!0 (select (arr!18451 a!2986) j!136)))))

(declare-fun b!647398 () Bool)

(declare-fun res!419427 () Bool)

(assert (=> b!647398 (=> (not res!419427) (not e!371190))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!647398 (= res!419427 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!647399 () Bool)

(declare-fun e!371191 () Bool)

(declare-datatypes ((SeekEntryResult!6847 0))(
  ( (MissingZero!6847 (index!29729 (_ BitVec 32))) (Found!6847 (index!29730 (_ BitVec 32))) (Intermediate!6847 (undefined!7659 Bool) (index!29731 (_ BitVec 32)) (x!58661 (_ BitVec 32))) (Undefined!6847) (MissingVacant!6847 (index!29732 (_ BitVec 32))) )
))
(declare-fun lt!300412 () SeekEntryResult!6847)

(declare-fun lt!300420 () SeekEntryResult!6847)

(assert (=> b!647399 (= e!371191 (= lt!300412 lt!300420))))

(declare-fun b!647400 () Bool)

(declare-fun e!371200 () Bool)

(declare-fun e!371187 () Bool)

(assert (=> b!647400 (= e!371200 (not e!371187))))

(declare-fun res!419433 () Bool)

(assert (=> b!647400 (=> res!419433 e!371187)))

(declare-fun lt!300419 () SeekEntryResult!6847)

(assert (=> b!647400 (= res!419433 (not (= lt!300419 (Found!6847 index!984))))))

(declare-fun lt!300415 () Unit!21981)

(assert (=> b!647400 (= lt!300415 e!371195)))

(declare-fun c!74353 () Bool)

(assert (=> b!647400 (= c!74353 (= lt!300419 Undefined!6847))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!300416 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38490 (_ BitVec 32)) SeekEntryResult!6847)

(assert (=> b!647400 (= lt!300419 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300416 lt!300423 mask!3053))))

(assert (=> b!647400 e!371191))

(declare-fun res!419429 () Bool)

(assert (=> b!647400 (=> (not res!419429) (not e!371191))))

(declare-fun lt!300424 () (_ BitVec 32))

(assert (=> b!647400 (= res!419429 (= lt!300420 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 lt!300416 lt!300423 mask!3053)))))

(assert (=> b!647400 (= lt!300420 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!647400 (= lt!300416 (select (store (arr!18451 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300418 () Unit!21981)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21981)

(assert (=> b!647400 (= lt!300418 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647400 (= lt!300424 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!647401 () Bool)

(declare-fun e!371193 () Bool)

(declare-fun e!371188 () Bool)

(assert (=> b!647401 (= e!371193 e!371188)))

(declare-fun res!419438 () Bool)

(assert (=> b!647401 (=> res!419438 e!371188)))

(assert (=> b!647401 (= res!419438 (bvsge index!984 j!136))))

(declare-fun lt!300409 () Unit!21981)

(declare-fun e!371199 () Unit!21981)

(assert (=> b!647401 (= lt!300409 e!371199)))

(declare-fun c!74354 () Bool)

(assert (=> b!647401 (= c!74354 (bvslt j!136 index!984))))

(declare-fun b!647402 () Bool)

(assert (=> b!647402 (= e!371187 e!371193)))

(declare-fun res!419434 () Bool)

(assert (=> b!647402 (=> res!419434 e!371193)))

(declare-fun lt!300422 () (_ BitVec 64))

(assert (=> b!647402 (= res!419434 (or (not (= (select (arr!18451 a!2986) j!136) lt!300416)) (not (= (select (arr!18451 a!2986) j!136) lt!300422))))))

(declare-fun e!371186 () Bool)

(assert (=> b!647402 e!371186))

(declare-fun res!419431 () Bool)

(assert (=> b!647402 (=> (not res!419431) (not e!371186))))

(assert (=> b!647402 (= res!419431 (= lt!300422 (select (arr!18451 a!2986) j!136)))))

(assert (=> b!647402 (= lt!300422 (select (store (arr!18451 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!647403 () Bool)

(assert (=> b!647403 (= e!371197 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) index!984))))

(declare-fun b!647404 () Bool)

(declare-fun e!371192 () Bool)

(declare-fun e!371196 () Bool)

(assert (=> b!647404 (= e!371192 e!371196)))

(declare-fun res!419444 () Bool)

(assert (=> b!647404 (=> (not res!419444) (not e!371196))))

(declare-datatypes ((List!12399 0))(
  ( (Nil!12396) (Cons!12395 (h!13443 (_ BitVec 64)) (t!18619 List!12399)) )
))
(declare-fun contains!3131 (List!12399 (_ BitVec 64)) Bool)

(assert (=> b!647404 (= res!419444 (not (contains!3131 Nil!12396 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647405 () Bool)

(assert (=> b!647405 (= e!371186 e!371189)))

(declare-fun res!419445 () Bool)

(assert (=> b!647405 (=> res!419445 e!371189)))

(assert (=> b!647405 (= res!419445 (or (not (= (select (arr!18451 a!2986) j!136) lt!300416)) (not (= (select (arr!18451 a!2986) j!136) lt!300422)) (bvsge j!136 index!984)))))

(declare-fun b!647406 () Bool)

(assert (=> b!647406 (= e!371196 (not (contains!3131 Nil!12396 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647407 () Bool)

(declare-fun res!419432 () Bool)

(declare-fun e!371194 () Bool)

(assert (=> b!647407 (=> (not res!419432) (not e!371194))))

(declare-fun arrayNoDuplicates!0 (array!38490 (_ BitVec 32) List!12399) Bool)

(assert (=> b!647407 (= res!419432 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12396))))

(declare-fun b!647408 () Bool)

(declare-fun res!419446 () Bool)

(assert (=> b!647408 (=> res!419446 e!371192)))

(declare-fun noDuplicate!418 (List!12399) Bool)

(assert (=> b!647408 (= res!419446 (not (noDuplicate!418 Nil!12396)))))

(declare-fun b!647409 () Bool)

(assert (=> b!647409 (= e!371188 e!371192)))

(declare-fun res!419442 () Bool)

(assert (=> b!647409 (=> res!419442 e!371192)))

(assert (=> b!647409 (= res!419442 (or (bvsge (size!18815 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18815 a!2986))))))

(assert (=> b!647409 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300413 () Unit!21981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38490 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21981)

(assert (=> b!647409 (= lt!300413 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300423 (select (arr!18451 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!647409 e!371202))

(declare-fun res!419425 () Bool)

(assert (=> b!647409 (=> (not res!419425) (not e!371202))))

(assert (=> b!647409 (= res!419425 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) j!136))))

(declare-fun b!647410 () Bool)

(declare-fun Unit!21984 () Unit!21981)

(assert (=> b!647410 (= e!371199 Unit!21984)))

(declare-fun b!647411 () Bool)

(declare-fun res!419443 () Bool)

(assert (=> b!647411 (=> (not res!419443) (not e!371194))))

(assert (=> b!647411 (= res!419443 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18451 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647412 () Bool)

(declare-fun Unit!21985 () Unit!21981)

(assert (=> b!647412 (= e!371199 Unit!21985)))

(declare-fun lt!300411 () Unit!21981)

(assert (=> b!647412 (= lt!300411 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300423 (select (arr!18451 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!647412 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300414 () Unit!21981)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38490 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12399) Unit!21981)

(assert (=> b!647412 (= lt!300414 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12396))))

(assert (=> b!647412 (arrayNoDuplicates!0 lt!300423 #b00000000000000000000000000000000 Nil!12396)))

(declare-fun lt!300417 () Unit!21981)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38490 (_ BitVec 32) (_ BitVec 32)) Unit!21981)

(assert (=> b!647412 (= lt!300417 (lemmaNoDuplicateFromThenFromBigger!0 lt!300423 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647412 (arrayNoDuplicates!0 lt!300423 j!136 Nil!12396)))

(declare-fun lt!300421 () Unit!21981)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38490 (_ BitVec 64) (_ BitVec 32) List!12399) Unit!21981)

(assert (=> b!647412 (= lt!300421 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300423 (select (arr!18451 a!2986) j!136) j!136 Nil!12396))))

(assert (=> b!647412 false))

(declare-fun b!647413 () Bool)

(declare-fun res!419441 () Bool)

(assert (=> b!647413 (=> (not res!419441) (not e!371190))))

(assert (=> b!647413 (= res!419441 (validKeyInArray!0 k0!1786))))

(declare-fun b!647414 () Bool)

(declare-fun e!371198 () Bool)

(assert (=> b!647414 (= e!371194 e!371198)))

(declare-fun res!419439 () Bool)

(assert (=> b!647414 (=> (not res!419439) (not e!371198))))

(assert (=> b!647414 (= res!419439 (= (select (store (arr!18451 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647414 (= lt!300423 (array!38491 (store (arr!18451 a!2986) i!1108 k0!1786) (size!18815 a!2986)))))

(declare-fun b!647415 () Bool)

(assert (=> b!647415 (= e!371190 e!371194)))

(declare-fun res!419426 () Bool)

(assert (=> b!647415 (=> (not res!419426) (not e!371194))))

(declare-fun lt!300410 () SeekEntryResult!6847)

(assert (=> b!647415 (= res!419426 (or (= lt!300410 (MissingZero!6847 i!1108)) (= lt!300410 (MissingVacant!6847 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38490 (_ BitVec 32)) SeekEntryResult!6847)

(assert (=> b!647415 (= lt!300410 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!647416 () Bool)

(assert (=> b!647416 (= e!371198 e!371200)))

(declare-fun res!419430 () Bool)

(assert (=> b!647416 (=> (not res!419430) (not e!371200))))

(assert (=> b!647416 (= res!419430 (and (= lt!300412 (Found!6847 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18451 a!2986) index!984) (select (arr!18451 a!2986) j!136))) (not (= (select (arr!18451 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!647416 (= lt!300412 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647417 () Bool)

(declare-fun res!419436 () Bool)

(assert (=> b!647417 (=> (not res!419436) (not e!371190))))

(assert (=> b!647417 (= res!419436 (and (= (size!18815 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18815 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18815 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!647418 () Bool)

(declare-fun Unit!21986 () Unit!21981)

(assert (=> b!647418 (= e!371195 Unit!21986)))

(assert (=> b!647418 false))

(declare-fun b!647419 () Bool)

(declare-fun res!419437 () Bool)

(assert (=> b!647419 (=> (not res!419437) (not e!371194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38490 (_ BitVec 32)) Bool)

(assert (=> b!647419 (= res!419437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58704 res!419435) b!647417))

(assert (= (and b!647417 res!419436) b!647397))

(assert (= (and b!647397 res!419428) b!647413))

(assert (= (and b!647413 res!419441) b!647398))

(assert (= (and b!647398 res!419427) b!647415))

(assert (= (and b!647415 res!419426) b!647419))

(assert (= (and b!647419 res!419437) b!647407))

(assert (= (and b!647407 res!419432) b!647411))

(assert (= (and b!647411 res!419443) b!647414))

(assert (= (and b!647414 res!419439) b!647416))

(assert (= (and b!647416 res!419430) b!647400))

(assert (= (and b!647400 res!419429) b!647399))

(assert (= (and b!647400 c!74353) b!647418))

(assert (= (and b!647400 (not c!74353)) b!647396))

(assert (= (and b!647400 (not res!419433)) b!647402))

(assert (= (and b!647402 res!419431) b!647405))

(assert (= (and b!647405 (not res!419445)) b!647395))

(assert (= (and b!647395 res!419440) b!647403))

(assert (= (and b!647402 (not res!419434)) b!647401))

(assert (= (and b!647401 c!74354) b!647412))

(assert (= (and b!647401 (not c!74354)) b!647410))

(assert (= (and b!647401 (not res!419438)) b!647409))

(assert (= (and b!647409 res!419425) b!647394))

(assert (= (and b!647409 (not res!419442)) b!647408))

(assert (= (and b!647408 (not res!419446)) b!647404))

(assert (= (and b!647404 res!419444) b!647406))

(declare-fun m!621235 () Bool)

(assert (=> b!647400 m!621235))

(declare-fun m!621237 () Bool)

(assert (=> b!647400 m!621237))

(declare-fun m!621239 () Bool)

(assert (=> b!647400 m!621239))

(declare-fun m!621241 () Bool)

(assert (=> b!647400 m!621241))

(declare-fun m!621243 () Bool)

(assert (=> b!647400 m!621243))

(assert (=> b!647400 m!621241))

(declare-fun m!621245 () Bool)

(assert (=> b!647400 m!621245))

(declare-fun m!621247 () Bool)

(assert (=> b!647400 m!621247))

(declare-fun m!621249 () Bool)

(assert (=> b!647400 m!621249))

(assert (=> b!647402 m!621241))

(assert (=> b!647402 m!621249))

(declare-fun m!621251 () Bool)

(assert (=> b!647402 m!621251))

(assert (=> b!647403 m!621241))

(assert (=> b!647403 m!621241))

(declare-fun m!621253 () Bool)

(assert (=> b!647403 m!621253))

(declare-fun m!621255 () Bool)

(assert (=> b!647398 m!621255))

(declare-fun m!621257 () Bool)

(assert (=> b!647404 m!621257))

(declare-fun m!621259 () Bool)

(assert (=> b!647415 m!621259))

(declare-fun m!621261 () Bool)

(assert (=> b!647407 m!621261))

(declare-fun m!621263 () Bool)

(assert (=> b!647411 m!621263))

(declare-fun m!621265 () Bool)

(assert (=> b!647406 m!621265))

(declare-fun m!621267 () Bool)

(assert (=> b!647416 m!621267))

(assert (=> b!647416 m!621241))

(assert (=> b!647416 m!621241))

(declare-fun m!621269 () Bool)

(assert (=> b!647416 m!621269))

(assert (=> b!647409 m!621241))

(assert (=> b!647409 m!621241))

(declare-fun m!621271 () Bool)

(assert (=> b!647409 m!621271))

(assert (=> b!647409 m!621241))

(declare-fun m!621273 () Bool)

(assert (=> b!647409 m!621273))

(assert (=> b!647409 m!621241))

(declare-fun m!621275 () Bool)

(assert (=> b!647409 m!621275))

(assert (=> b!647412 m!621241))

(declare-fun m!621277 () Bool)

(assert (=> b!647412 m!621277))

(assert (=> b!647412 m!621241))

(declare-fun m!621279 () Bool)

(assert (=> b!647412 m!621279))

(declare-fun m!621281 () Bool)

(assert (=> b!647412 m!621281))

(assert (=> b!647412 m!621241))

(declare-fun m!621283 () Bool)

(assert (=> b!647412 m!621283))

(declare-fun m!621285 () Bool)

(assert (=> b!647412 m!621285))

(declare-fun m!621287 () Bool)

(assert (=> b!647412 m!621287))

(assert (=> b!647412 m!621241))

(declare-fun m!621289 () Bool)

(assert (=> b!647412 m!621289))

(declare-fun m!621291 () Bool)

(assert (=> b!647408 m!621291))

(assert (=> b!647414 m!621249))

(declare-fun m!621293 () Bool)

(assert (=> b!647414 m!621293))

(assert (=> b!647397 m!621241))

(assert (=> b!647397 m!621241))

(declare-fun m!621295 () Bool)

(assert (=> b!647397 m!621295))

(assert (=> b!647394 m!621241))

(assert (=> b!647394 m!621241))

(assert (=> b!647394 m!621253))

(declare-fun m!621297 () Bool)

(assert (=> start!58704 m!621297))

(declare-fun m!621299 () Bool)

(assert (=> start!58704 m!621299))

(assert (=> b!647405 m!621241))

(declare-fun m!621301 () Bool)

(assert (=> b!647419 m!621301))

(assert (=> b!647395 m!621241))

(assert (=> b!647395 m!621241))

(assert (=> b!647395 m!621275))

(declare-fun m!621303 () Bool)

(assert (=> b!647413 m!621303))

(check-sat (not b!647415) (not b!647409) (not b!647406) (not b!647404) (not b!647397) (not b!647416) (not b!647398) (not b!647394) (not b!647413) (not b!647407) (not b!647400) (not b!647419) (not b!647403) (not b!647412) (not start!58704) (not b!647395) (not b!647408))
(check-sat)
(get-model)

(declare-fun d!91653 () Bool)

(declare-fun lt!300523 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!249 (List!12399) (InoxSet (_ BitVec 64)))

(assert (=> d!91653 (= lt!300523 (select (content!249 Nil!12396) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371309 () Bool)

(assert (=> d!91653 (= lt!300523 e!371309)))

(declare-fun res!419583 () Bool)

(assert (=> d!91653 (=> (not res!419583) (not e!371309))))

(get-info :version)

(assert (=> d!91653 (= res!419583 ((_ is Cons!12395) Nil!12396))))

(assert (=> d!91653 (= (contains!3131 Nil!12396 #b0000000000000000000000000000000000000000000000000000000000000000) lt!300523)))

(declare-fun b!647580 () Bool)

(declare-fun e!371310 () Bool)

(assert (=> b!647580 (= e!371309 e!371310)))

(declare-fun res!419584 () Bool)

(assert (=> b!647580 (=> res!419584 e!371310)))

(assert (=> b!647580 (= res!419584 (= (h!13443 Nil!12396) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647581 () Bool)

(assert (=> b!647581 (= e!371310 (contains!3131 (t!18619 Nil!12396) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91653 res!419583) b!647580))

(assert (= (and b!647580 (not res!419584)) b!647581))

(declare-fun m!621445 () Bool)

(assert (=> d!91653 m!621445))

(declare-fun m!621447 () Bool)

(assert (=> d!91653 m!621447))

(declare-fun m!621449 () Bool)

(assert (=> b!647581 m!621449))

(assert (=> b!647404 d!91653))

(declare-fun d!91655 () Bool)

(assert (=> d!91655 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58704 d!91655))

(declare-fun d!91657 () Bool)

(assert (=> d!91657 (= (array_inv!14310 a!2986) (bvsge (size!18815 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58704 d!91657))

(declare-fun d!91659 () Bool)

(declare-fun res!419589 () Bool)

(declare-fun e!371315 () Bool)

(assert (=> d!91659 (=> res!419589 e!371315)))

(assert (=> d!91659 (= res!419589 (= (select (arr!18451 lt!300423) index!984) (select (arr!18451 a!2986) j!136)))))

(assert (=> d!91659 (= (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) index!984) e!371315)))

(declare-fun b!647586 () Bool)

(declare-fun e!371316 () Bool)

(assert (=> b!647586 (= e!371315 e!371316)))

(declare-fun res!419590 () Bool)

(assert (=> b!647586 (=> (not res!419590) (not e!371316))))

(assert (=> b!647586 (= res!419590 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18815 lt!300423)))))

(declare-fun b!647587 () Bool)

(assert (=> b!647587 (= e!371316 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91659 (not res!419589)) b!647586))

(assert (= (and b!647586 res!419590) b!647587))

(declare-fun m!621451 () Bool)

(assert (=> d!91659 m!621451))

(assert (=> b!647587 m!621241))

(declare-fun m!621453 () Bool)

(assert (=> b!647587 m!621453))

(assert (=> b!647403 d!91659))

(declare-fun d!91661 () Bool)

(assert (=> d!91661 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647413 d!91661))

(declare-fun d!91663 () Bool)

(declare-fun lt!300524 () Bool)

(assert (=> d!91663 (= lt!300524 (select (content!249 Nil!12396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371317 () Bool)

(assert (=> d!91663 (= lt!300524 e!371317)))

(declare-fun res!419591 () Bool)

(assert (=> d!91663 (=> (not res!419591) (not e!371317))))

(assert (=> d!91663 (= res!419591 ((_ is Cons!12395) Nil!12396))))

(assert (=> d!91663 (= (contains!3131 Nil!12396 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300524)))

(declare-fun b!647588 () Bool)

(declare-fun e!371318 () Bool)

(assert (=> b!647588 (= e!371317 e!371318)))

(declare-fun res!419592 () Bool)

(assert (=> b!647588 (=> res!419592 e!371318)))

(assert (=> b!647588 (= res!419592 (= (h!13443 Nil!12396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647589 () Bool)

(assert (=> b!647589 (= e!371318 (contains!3131 (t!18619 Nil!12396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91663 res!419591) b!647588))

(assert (= (and b!647588 (not res!419592)) b!647589))

(assert (=> d!91663 m!621445))

(declare-fun m!621455 () Bool)

(assert (=> d!91663 m!621455))

(declare-fun m!621457 () Bool)

(assert (=> b!647589 m!621457))

(assert (=> b!647406 d!91663))

(declare-fun d!91665 () Bool)

(declare-fun res!419593 () Bool)

(declare-fun e!371319 () Bool)

(assert (=> d!91665 (=> res!419593 e!371319)))

(assert (=> d!91665 (= res!419593 (= (select (arr!18451 lt!300423) j!136) (select (arr!18451 a!2986) j!136)))))

(assert (=> d!91665 (= (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) j!136) e!371319)))

(declare-fun b!647590 () Bool)

(declare-fun e!371320 () Bool)

(assert (=> b!647590 (= e!371319 e!371320)))

(declare-fun res!419594 () Bool)

(assert (=> b!647590 (=> (not res!419594) (not e!371320))))

(assert (=> b!647590 (= res!419594 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18815 lt!300423)))))

(declare-fun b!647591 () Bool)

(assert (=> b!647591 (= e!371320 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91665 (not res!419593)) b!647590))

(assert (= (and b!647590 res!419594) b!647591))

(declare-fun m!621459 () Bool)

(assert (=> d!91665 m!621459))

(assert (=> b!647591 m!621241))

(declare-fun m!621461 () Bool)

(assert (=> b!647591 m!621461))

(assert (=> b!647395 d!91665))

(declare-fun b!647605 () Bool)

(declare-fun e!371327 () SeekEntryResult!6847)

(assert (=> b!647605 (= e!371327 Undefined!6847)))

(declare-fun b!647606 () Bool)

(declare-fun e!371329 () SeekEntryResult!6847)

(assert (=> b!647606 (= e!371329 (MissingVacant!6847 vacantSpotIndex!68))))

(declare-fun b!647607 () Bool)

(declare-fun e!371328 () SeekEntryResult!6847)

(assert (=> b!647607 (= e!371327 e!371328)))

(declare-fun c!74373 () Bool)

(declare-fun lt!300529 () (_ BitVec 64))

(assert (=> b!647607 (= c!74373 (= lt!300529 (select (arr!18451 a!2986) j!136)))))

(declare-fun b!647604 () Bool)

(assert (=> b!647604 (= e!371329 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!91667 () Bool)

(declare-fun lt!300530 () SeekEntryResult!6847)

(assert (=> d!91667 (and (or ((_ is Undefined!6847) lt!300530) (not ((_ is Found!6847) lt!300530)) (and (bvsge (index!29730 lt!300530) #b00000000000000000000000000000000) (bvslt (index!29730 lt!300530) (size!18815 a!2986)))) (or ((_ is Undefined!6847) lt!300530) ((_ is Found!6847) lt!300530) (not ((_ is MissingVacant!6847) lt!300530)) (not (= (index!29732 lt!300530) vacantSpotIndex!68)) (and (bvsge (index!29732 lt!300530) #b00000000000000000000000000000000) (bvslt (index!29732 lt!300530) (size!18815 a!2986)))) (or ((_ is Undefined!6847) lt!300530) (ite ((_ is Found!6847) lt!300530) (= (select (arr!18451 a!2986) (index!29730 lt!300530)) (select (arr!18451 a!2986) j!136)) (and ((_ is MissingVacant!6847) lt!300530) (= (index!29732 lt!300530) vacantSpotIndex!68) (= (select (arr!18451 a!2986) (index!29732 lt!300530)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91667 (= lt!300530 e!371327)))

(declare-fun c!74375 () Bool)

(assert (=> d!91667 (= c!74375 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91667 (= lt!300529 (select (arr!18451 a!2986) index!984))))

(assert (=> d!91667 (validMask!0 mask!3053)))

(assert (=> d!91667 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053) lt!300530)))

(declare-fun b!647608 () Bool)

(assert (=> b!647608 (= e!371328 (Found!6847 index!984))))

(declare-fun b!647609 () Bool)

(declare-fun c!74374 () Bool)

(assert (=> b!647609 (= c!74374 (= lt!300529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647609 (= e!371328 e!371329)))

(assert (= (and d!91667 c!74375) b!647605))

(assert (= (and d!91667 (not c!74375)) b!647607))

(assert (= (and b!647607 c!74373) b!647608))

(assert (= (and b!647607 (not c!74373)) b!647609))

(assert (= (and b!647609 c!74374) b!647606))

(assert (= (and b!647609 (not c!74374)) b!647604))

(declare-fun m!621463 () Bool)

(assert (=> b!647604 m!621463))

(assert (=> b!647604 m!621463))

(assert (=> b!647604 m!621241))

(declare-fun m!621465 () Bool)

(assert (=> b!647604 m!621465))

(declare-fun m!621467 () Bool)

(assert (=> d!91667 m!621467))

(declare-fun m!621469 () Bool)

(assert (=> d!91667 m!621469))

(assert (=> d!91667 m!621267))

(assert (=> d!91667 m!621297))

(assert (=> b!647416 d!91667))

(assert (=> b!647394 d!91659))

(declare-fun d!91669 () Bool)

(declare-fun lt!300550 () SeekEntryResult!6847)

(assert (=> d!91669 (and (or ((_ is Undefined!6847) lt!300550) (not ((_ is Found!6847) lt!300550)) (and (bvsge (index!29730 lt!300550) #b00000000000000000000000000000000) (bvslt (index!29730 lt!300550) (size!18815 a!2986)))) (or ((_ is Undefined!6847) lt!300550) ((_ is Found!6847) lt!300550) (not ((_ is MissingZero!6847) lt!300550)) (and (bvsge (index!29729 lt!300550) #b00000000000000000000000000000000) (bvslt (index!29729 lt!300550) (size!18815 a!2986)))) (or ((_ is Undefined!6847) lt!300550) ((_ is Found!6847) lt!300550) ((_ is MissingZero!6847) lt!300550) (not ((_ is MissingVacant!6847) lt!300550)) (and (bvsge (index!29732 lt!300550) #b00000000000000000000000000000000) (bvslt (index!29732 lt!300550) (size!18815 a!2986)))) (or ((_ is Undefined!6847) lt!300550) (ite ((_ is Found!6847) lt!300550) (= (select (arr!18451 a!2986) (index!29730 lt!300550)) k0!1786) (ite ((_ is MissingZero!6847) lt!300550) (= (select (arr!18451 a!2986) (index!29729 lt!300550)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6847) lt!300550) (= (select (arr!18451 a!2986) (index!29732 lt!300550)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!371351 () SeekEntryResult!6847)

(assert (=> d!91669 (= lt!300550 e!371351)))

(declare-fun c!74386 () Bool)

(declare-fun lt!300549 () SeekEntryResult!6847)

(assert (=> d!91669 (= c!74386 (and ((_ is Intermediate!6847) lt!300549) (undefined!7659 lt!300549)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38490 (_ BitVec 32)) SeekEntryResult!6847)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91669 (= lt!300549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91669 (validMask!0 mask!3053)))

(assert (=> d!91669 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300550)))

(declare-fun b!647640 () Bool)

(declare-fun e!371353 () SeekEntryResult!6847)

(assert (=> b!647640 (= e!371353 (Found!6847 (index!29731 lt!300549)))))

(declare-fun b!647641 () Bool)

(declare-fun e!371352 () SeekEntryResult!6847)

(assert (=> b!647641 (= e!371352 (MissingZero!6847 (index!29731 lt!300549)))))

(declare-fun b!647642 () Bool)

(assert (=> b!647642 (= e!371351 e!371353)))

(declare-fun lt!300551 () (_ BitVec 64))

(assert (=> b!647642 (= lt!300551 (select (arr!18451 a!2986) (index!29731 lt!300549)))))

(declare-fun c!74387 () Bool)

(assert (=> b!647642 (= c!74387 (= lt!300551 k0!1786))))

(declare-fun b!647643 () Bool)

(assert (=> b!647643 (= e!371351 Undefined!6847)))

(declare-fun b!647644 () Bool)

(assert (=> b!647644 (= e!371352 (seekKeyOrZeroReturnVacant!0 (x!58661 lt!300549) (index!29731 lt!300549) (index!29731 lt!300549) k0!1786 a!2986 mask!3053))))

(declare-fun b!647645 () Bool)

(declare-fun c!74385 () Bool)

(assert (=> b!647645 (= c!74385 (= lt!300551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647645 (= e!371353 e!371352)))

(assert (= (and d!91669 c!74386) b!647643))

(assert (= (and d!91669 (not c!74386)) b!647642))

(assert (= (and b!647642 c!74387) b!647640))

(assert (= (and b!647642 (not c!74387)) b!647645))

(assert (= (and b!647645 c!74385) b!647641))

(assert (= (and b!647645 (not c!74385)) b!647644))

(declare-fun m!621489 () Bool)

(assert (=> d!91669 m!621489))

(declare-fun m!621491 () Bool)

(assert (=> d!91669 m!621491))

(declare-fun m!621493 () Bool)

(assert (=> d!91669 m!621493))

(declare-fun m!621495 () Bool)

(assert (=> d!91669 m!621495))

(declare-fun m!621497 () Bool)

(assert (=> d!91669 m!621497))

(assert (=> d!91669 m!621297))

(assert (=> d!91669 m!621493))

(declare-fun m!621499 () Bool)

(assert (=> b!647642 m!621499))

(declare-fun m!621501 () Bool)

(assert (=> b!647644 m!621501))

(assert (=> b!647415 d!91669))

(declare-fun d!91685 () Bool)

(declare-fun res!419609 () Bool)

(declare-fun e!371358 () Bool)

(assert (=> d!91685 (=> res!419609 e!371358)))

(assert (=> d!91685 (= res!419609 (= (select (arr!18451 lt!300423) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18451 a!2986) j!136)))))

(assert (=> d!91685 (= (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371358)))

(declare-fun b!647652 () Bool)

(declare-fun e!371359 () Bool)

(assert (=> b!647652 (= e!371358 e!371359)))

(declare-fun res!419610 () Bool)

(assert (=> b!647652 (=> (not res!419610) (not e!371359))))

(assert (=> b!647652 (= res!419610 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18815 lt!300423)))))

(declare-fun b!647653 () Bool)

(assert (=> b!647653 (= e!371359 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91685 (not res!419609)) b!647652))

(assert (= (and b!647652 res!419610) b!647653))

(declare-fun m!621503 () Bool)

(assert (=> d!91685 m!621503))

(assert (=> b!647653 m!621241))

(declare-fun m!621505 () Bool)

(assert (=> b!647653 m!621505))

(assert (=> b!647409 d!91685))

(declare-fun d!91687 () Bool)

(assert (=> d!91687 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300560 () Unit!21981)

(declare-fun choose!114 (array!38490 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21981)

(assert (=> d!91687 (= lt!300560 (choose!114 lt!300423 (select (arr!18451 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91687 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91687 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300423 (select (arr!18451 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300560)))

(declare-fun bs!19355 () Bool)

(assert (= bs!19355 d!91687))

(assert (=> bs!19355 m!621241))

(assert (=> bs!19355 m!621271))

(assert (=> bs!19355 m!621241))

(declare-fun m!621507 () Bool)

(assert (=> bs!19355 m!621507))

(assert (=> b!647409 d!91687))

(assert (=> b!647409 d!91665))

(declare-fun d!91689 () Bool)

(declare-fun res!419613 () Bool)

(declare-fun e!371362 () Bool)

(assert (=> d!91689 (=> res!419613 e!371362)))

(assert (=> d!91689 (= res!419613 (= (select (arr!18451 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91689 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!371362)))

(declare-fun b!647656 () Bool)

(declare-fun e!371363 () Bool)

(assert (=> b!647656 (= e!371362 e!371363)))

(declare-fun res!419614 () Bool)

(assert (=> b!647656 (=> (not res!419614) (not e!371363))))

(assert (=> b!647656 (= res!419614 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18815 a!2986)))))

(declare-fun b!647657 () Bool)

(assert (=> b!647657 (= e!371363 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91689 (not res!419613)) b!647656))

(assert (= (and b!647656 res!419614) b!647657))

(declare-fun m!621509 () Bool)

(assert (=> d!91689 m!621509))

(declare-fun m!621511 () Bool)

(assert (=> b!647657 m!621511))

(assert (=> b!647398 d!91689))

(declare-fun b!647682 () Bool)

(declare-fun e!371387 () Bool)

(declare-fun call!33696 () Bool)

(assert (=> b!647682 (= e!371387 call!33696)))

(declare-fun bm!33693 () Bool)

(assert (=> bm!33693 (= call!33696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!91691 () Bool)

(declare-fun res!419632 () Bool)

(declare-fun e!371386 () Bool)

(assert (=> d!91691 (=> res!419632 e!371386)))

(assert (=> d!91691 (= res!419632 (bvsge #b00000000000000000000000000000000 (size!18815 a!2986)))))

(assert (=> d!91691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371386)))

(declare-fun b!647683 () Bool)

(declare-fun e!371385 () Bool)

(assert (=> b!647683 (= e!371386 e!371385)))

(declare-fun c!74393 () Bool)

(assert (=> b!647683 (= c!74393 (validKeyInArray!0 (select (arr!18451 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647684 () Bool)

(assert (=> b!647684 (= e!371385 call!33696)))

(declare-fun b!647685 () Bool)

(assert (=> b!647685 (= e!371385 e!371387)))

(declare-fun lt!300571 () (_ BitVec 64))

(assert (=> b!647685 (= lt!300571 (select (arr!18451 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300572 () Unit!21981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38490 (_ BitVec 64) (_ BitVec 32)) Unit!21981)

(assert (=> b!647685 (= lt!300572 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300571 #b00000000000000000000000000000000))))

(assert (=> b!647685 (arrayContainsKey!0 a!2986 lt!300571 #b00000000000000000000000000000000)))

(declare-fun lt!300570 () Unit!21981)

(assert (=> b!647685 (= lt!300570 lt!300572)))

(declare-fun res!419634 () Bool)

(assert (=> b!647685 (= res!419634 (= (seekEntryOrOpen!0 (select (arr!18451 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6847 #b00000000000000000000000000000000)))))

(assert (=> b!647685 (=> (not res!419634) (not e!371387))))

(assert (= (and d!91691 (not res!419632)) b!647683))

(assert (= (and b!647683 c!74393) b!647685))

(assert (= (and b!647683 (not c!74393)) b!647684))

(assert (= (and b!647685 res!419634) b!647682))

(assert (= (or b!647682 b!647684) bm!33693))

(declare-fun m!621533 () Bool)

(assert (=> bm!33693 m!621533))

(assert (=> b!647683 m!621509))

(assert (=> b!647683 m!621509))

(declare-fun m!621535 () Bool)

(assert (=> b!647683 m!621535))

(assert (=> b!647685 m!621509))

(declare-fun m!621537 () Bool)

(assert (=> b!647685 m!621537))

(declare-fun m!621539 () Bool)

(assert (=> b!647685 m!621539))

(assert (=> b!647685 m!621509))

(declare-fun m!621541 () Bool)

(assert (=> b!647685 m!621541))

(assert (=> b!647419 d!91691))

(declare-fun d!91703 () Bool)

(declare-fun res!419643 () Bool)

(declare-fun e!371396 () Bool)

(assert (=> d!91703 (=> res!419643 e!371396)))

(assert (=> d!91703 (= res!419643 ((_ is Nil!12396) Nil!12396))))

(assert (=> d!91703 (= (noDuplicate!418 Nil!12396) e!371396)))

(declare-fun b!647694 () Bool)

(declare-fun e!371397 () Bool)

(assert (=> b!647694 (= e!371396 e!371397)))

(declare-fun res!419644 () Bool)

(assert (=> b!647694 (=> (not res!419644) (not e!371397))))

(assert (=> b!647694 (= res!419644 (not (contains!3131 (t!18619 Nil!12396) (h!13443 Nil!12396))))))

(declare-fun b!647695 () Bool)

(assert (=> b!647695 (= e!371397 (noDuplicate!418 (t!18619 Nil!12396)))))

(assert (= (and d!91703 (not res!419643)) b!647694))

(assert (= (and b!647694 res!419644) b!647695))

(declare-fun m!621551 () Bool)

(assert (=> b!647694 m!621551))

(declare-fun m!621553 () Bool)

(assert (=> b!647695 m!621553))

(assert (=> b!647408 d!91703))

(declare-fun d!91709 () Bool)

(assert (=> d!91709 (= (validKeyInArray!0 (select (arr!18451 a!2986) j!136)) (and (not (= (select (arr!18451 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18451 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647397 d!91709))

(declare-fun b!647709 () Bool)

(declare-fun e!371410 () Bool)

(declare-fun call!33699 () Bool)

(assert (=> b!647709 (= e!371410 call!33699)))

(declare-fun b!647710 () Bool)

(declare-fun e!371412 () Bool)

(assert (=> b!647710 (= e!371412 e!371410)))

(declare-fun c!74396 () Bool)

(assert (=> b!647710 (= c!74396 (validKeyInArray!0 (select (arr!18451 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647711 () Bool)

(assert (=> b!647711 (= e!371410 call!33699)))

(declare-fun bm!33696 () Bool)

(assert (=> bm!33696 (= call!33699 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74396 (Cons!12395 (select (arr!18451 a!2986) #b00000000000000000000000000000000) Nil!12396) Nil!12396)))))

(declare-fun b!647712 () Bool)

(declare-fun e!371409 () Bool)

(assert (=> b!647712 (= e!371409 e!371412)))

(declare-fun res!419655 () Bool)

(assert (=> b!647712 (=> (not res!419655) (not e!371412))))

(declare-fun e!371411 () Bool)

(assert (=> b!647712 (= res!419655 (not e!371411))))

(declare-fun res!419656 () Bool)

(assert (=> b!647712 (=> (not res!419656) (not e!371411))))

(assert (=> b!647712 (= res!419656 (validKeyInArray!0 (select (arr!18451 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91711 () Bool)

(declare-fun res!419654 () Bool)

(assert (=> d!91711 (=> res!419654 e!371409)))

(assert (=> d!91711 (= res!419654 (bvsge #b00000000000000000000000000000000 (size!18815 a!2986)))))

(assert (=> d!91711 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12396) e!371409)))

(declare-fun b!647713 () Bool)

(assert (=> b!647713 (= e!371411 (contains!3131 Nil!12396 (select (arr!18451 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91711 (not res!419654)) b!647712))

(assert (= (and b!647712 res!419656) b!647713))

(assert (= (and b!647712 res!419655) b!647710))

(assert (= (and b!647710 c!74396) b!647709))

(assert (= (and b!647710 (not c!74396)) b!647711))

(assert (= (or b!647709 b!647711) bm!33696))

(assert (=> b!647710 m!621509))

(assert (=> b!647710 m!621509))

(assert (=> b!647710 m!621535))

(assert (=> bm!33696 m!621509))

(declare-fun m!621559 () Bool)

(assert (=> bm!33696 m!621559))

(assert (=> b!647712 m!621509))

(assert (=> b!647712 m!621509))

(assert (=> b!647712 m!621535))

(assert (=> b!647713 m!621509))

(assert (=> b!647713 m!621509))

(declare-fun m!621561 () Bool)

(assert (=> b!647713 m!621561))

(assert (=> b!647407 d!91711))

(declare-fun b!647714 () Bool)

(declare-fun e!371414 () Bool)

(declare-fun call!33700 () Bool)

(assert (=> b!647714 (= e!371414 call!33700)))

(declare-fun b!647715 () Bool)

(declare-fun e!371416 () Bool)

(assert (=> b!647715 (= e!371416 e!371414)))

(declare-fun c!74397 () Bool)

(assert (=> b!647715 (= c!74397 (validKeyInArray!0 (select (arr!18451 lt!300423) j!136)))))

(declare-fun b!647716 () Bool)

(assert (=> b!647716 (= e!371414 call!33700)))

(declare-fun bm!33697 () Bool)

(assert (=> bm!33697 (= call!33700 (arrayNoDuplicates!0 lt!300423 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74397 (Cons!12395 (select (arr!18451 lt!300423) j!136) Nil!12396) Nil!12396)))))

(declare-fun b!647717 () Bool)

(declare-fun e!371413 () Bool)

(assert (=> b!647717 (= e!371413 e!371416)))

(declare-fun res!419658 () Bool)

(assert (=> b!647717 (=> (not res!419658) (not e!371416))))

(declare-fun e!371415 () Bool)

(assert (=> b!647717 (= res!419658 (not e!371415))))

(declare-fun res!419659 () Bool)

(assert (=> b!647717 (=> (not res!419659) (not e!371415))))

(assert (=> b!647717 (= res!419659 (validKeyInArray!0 (select (arr!18451 lt!300423) j!136)))))

(declare-fun d!91715 () Bool)

(declare-fun res!419657 () Bool)

(assert (=> d!91715 (=> res!419657 e!371413)))

(assert (=> d!91715 (= res!419657 (bvsge j!136 (size!18815 lt!300423)))))

(assert (=> d!91715 (= (arrayNoDuplicates!0 lt!300423 j!136 Nil!12396) e!371413)))

(declare-fun b!647718 () Bool)

(assert (=> b!647718 (= e!371415 (contains!3131 Nil!12396 (select (arr!18451 lt!300423) j!136)))))

(assert (= (and d!91715 (not res!419657)) b!647717))

(assert (= (and b!647717 res!419659) b!647718))

(assert (= (and b!647717 res!419658) b!647715))

(assert (= (and b!647715 c!74397) b!647714))

(assert (= (and b!647715 (not c!74397)) b!647716))

(assert (= (or b!647714 b!647716) bm!33697))

(assert (=> b!647715 m!621459))

(assert (=> b!647715 m!621459))

(declare-fun m!621563 () Bool)

(assert (=> b!647715 m!621563))

(assert (=> bm!33697 m!621459))

(declare-fun m!621565 () Bool)

(assert (=> bm!33697 m!621565))

(assert (=> b!647717 m!621459))

(assert (=> b!647717 m!621459))

(assert (=> b!647717 m!621563))

(assert (=> b!647718 m!621459))

(assert (=> b!647718 m!621459))

(declare-fun m!621567 () Bool)

(assert (=> b!647718 m!621567))

(assert (=> b!647412 d!91715))

(declare-fun d!91717 () Bool)

(declare-fun res!419660 () Bool)

(declare-fun e!371417 () Bool)

(assert (=> d!91717 (=> res!419660 e!371417)))

(assert (=> d!91717 (= res!419660 (= (select (arr!18451 lt!300423) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18451 a!2986) j!136)))))

(assert (=> d!91717 (= (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371417)))

(declare-fun b!647719 () Bool)

(declare-fun e!371418 () Bool)

(assert (=> b!647719 (= e!371417 e!371418)))

(declare-fun res!419661 () Bool)

(assert (=> b!647719 (=> (not res!419661) (not e!371418))))

(assert (=> b!647719 (= res!419661 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18815 lt!300423)))))

(declare-fun b!647720 () Bool)

(assert (=> b!647720 (= e!371418 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91717 (not res!419660)) b!647719))

(assert (= (and b!647719 res!419661) b!647720))

(declare-fun m!621569 () Bool)

(assert (=> d!91717 m!621569))

(assert (=> b!647720 m!621241))

(declare-fun m!621571 () Bool)

(assert (=> b!647720 m!621571))

(assert (=> b!647412 d!91717))

(declare-fun d!91719 () Bool)

(assert (=> d!91719 (arrayContainsKey!0 lt!300423 (select (arr!18451 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300577 () Unit!21981)

(assert (=> d!91719 (= lt!300577 (choose!114 lt!300423 (select (arr!18451 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91719 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91719 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300423 (select (arr!18451 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300577)))

(declare-fun bs!19356 () Bool)

(assert (= bs!19356 d!91719))

(assert (=> bs!19356 m!621241))

(assert (=> bs!19356 m!621283))

(assert (=> bs!19356 m!621241))

(declare-fun m!621573 () Bool)

(assert (=> bs!19356 m!621573))

(assert (=> b!647412 d!91719))

(declare-fun b!647721 () Bool)

(declare-fun e!371420 () Bool)

(declare-fun call!33701 () Bool)

(assert (=> b!647721 (= e!371420 call!33701)))

(declare-fun b!647722 () Bool)

(declare-fun e!371422 () Bool)

(assert (=> b!647722 (= e!371422 e!371420)))

(declare-fun c!74398 () Bool)

(assert (=> b!647722 (= c!74398 (validKeyInArray!0 (select (arr!18451 lt!300423) #b00000000000000000000000000000000)))))

(declare-fun b!647723 () Bool)

(assert (=> b!647723 (= e!371420 call!33701)))

(declare-fun bm!33698 () Bool)

(assert (=> bm!33698 (= call!33701 (arrayNoDuplicates!0 lt!300423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74398 (Cons!12395 (select (arr!18451 lt!300423) #b00000000000000000000000000000000) Nil!12396) Nil!12396)))))

(declare-fun b!647724 () Bool)

(declare-fun e!371419 () Bool)

(assert (=> b!647724 (= e!371419 e!371422)))

(declare-fun res!419663 () Bool)

(assert (=> b!647724 (=> (not res!419663) (not e!371422))))

(declare-fun e!371421 () Bool)

(assert (=> b!647724 (= res!419663 (not e!371421))))

(declare-fun res!419664 () Bool)

(assert (=> b!647724 (=> (not res!419664) (not e!371421))))

(assert (=> b!647724 (= res!419664 (validKeyInArray!0 (select (arr!18451 lt!300423) #b00000000000000000000000000000000)))))

(declare-fun d!91721 () Bool)

(declare-fun res!419662 () Bool)

(assert (=> d!91721 (=> res!419662 e!371419)))

(assert (=> d!91721 (= res!419662 (bvsge #b00000000000000000000000000000000 (size!18815 lt!300423)))))

(assert (=> d!91721 (= (arrayNoDuplicates!0 lt!300423 #b00000000000000000000000000000000 Nil!12396) e!371419)))

(declare-fun b!647725 () Bool)

(assert (=> b!647725 (= e!371421 (contains!3131 Nil!12396 (select (arr!18451 lt!300423) #b00000000000000000000000000000000)))))

(assert (= (and d!91721 (not res!419662)) b!647724))

(assert (= (and b!647724 res!419664) b!647725))

(assert (= (and b!647724 res!419663) b!647722))

(assert (= (and b!647722 c!74398) b!647721))

(assert (= (and b!647722 (not c!74398)) b!647723))

(assert (= (or b!647721 b!647723) bm!33698))

(declare-fun m!621575 () Bool)

(assert (=> b!647722 m!621575))

(assert (=> b!647722 m!621575))

(declare-fun m!621577 () Bool)

(assert (=> b!647722 m!621577))

(assert (=> bm!33698 m!621575))

(declare-fun m!621579 () Bool)

(assert (=> bm!33698 m!621579))

(assert (=> b!647724 m!621575))

(assert (=> b!647724 m!621575))

(assert (=> b!647724 m!621577))

(assert (=> b!647725 m!621575))

(assert (=> b!647725 m!621575))

(declare-fun m!621581 () Bool)

(assert (=> b!647725 m!621581))

(assert (=> b!647412 d!91721))

(declare-fun d!91723 () Bool)

(assert (=> d!91723 (arrayNoDuplicates!0 lt!300423 j!136 Nil!12396)))

(declare-fun lt!300583 () Unit!21981)

(declare-fun choose!39 (array!38490 (_ BitVec 32) (_ BitVec 32)) Unit!21981)

(assert (=> d!91723 (= lt!300583 (choose!39 lt!300423 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91723 (bvslt (size!18815 lt!300423) #b01111111111111111111111111111111)))

(assert (=> d!91723 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300423 #b00000000000000000000000000000000 j!136) lt!300583)))

(declare-fun bs!19357 () Bool)

(assert (= bs!19357 d!91723))

(assert (=> bs!19357 m!621285))

(declare-fun m!621587 () Bool)

(assert (=> bs!19357 m!621587))

(assert (=> b!647412 d!91723))

(declare-fun d!91727 () Bool)

(assert (=> d!91727 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18815 lt!300423)) (not (= (select (arr!18451 lt!300423) j!136) (select (arr!18451 a!2986) j!136))))))

(declare-fun lt!300586 () Unit!21981)

(declare-fun choose!21 (array!38490 (_ BitVec 64) (_ BitVec 32) List!12399) Unit!21981)

(assert (=> d!91727 (= lt!300586 (choose!21 lt!300423 (select (arr!18451 a!2986) j!136) j!136 Nil!12396))))

(assert (=> d!91727 (bvslt (size!18815 lt!300423) #b01111111111111111111111111111111)))

(assert (=> d!91727 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300423 (select (arr!18451 a!2986) j!136) j!136 Nil!12396) lt!300586)))

(declare-fun bs!19358 () Bool)

(assert (= bs!19358 d!91727))

(assert (=> bs!19358 m!621459))

(assert (=> bs!19358 m!621241))

(declare-fun m!621589 () Bool)

(assert (=> bs!19358 m!621589))

(assert (=> b!647412 d!91727))

(declare-fun d!91729 () Bool)

(declare-fun e!371434 () Bool)

(assert (=> d!91729 e!371434))

(declare-fun res!419670 () Bool)

(assert (=> d!91729 (=> (not res!419670) (not e!371434))))

(assert (=> d!91729 (= res!419670 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18815 a!2986))))))

(declare-fun lt!300593 () Unit!21981)

(declare-fun choose!41 (array!38490 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12399) Unit!21981)

(assert (=> d!91729 (= lt!300593 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12396))))

(assert (=> d!91729 (bvslt (size!18815 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91729 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12396) lt!300593)))

(declare-fun b!647743 () Bool)

(assert (=> b!647743 (= e!371434 (arrayNoDuplicates!0 (array!38491 (store (arr!18451 a!2986) i!1108 k0!1786) (size!18815 a!2986)) #b00000000000000000000000000000000 Nil!12396))))

(assert (= (and d!91729 res!419670) b!647743))

(declare-fun m!621591 () Bool)

(assert (=> d!91729 m!621591))

(assert (=> b!647743 m!621249))

(declare-fun m!621593 () Bool)

(assert (=> b!647743 m!621593))

(assert (=> b!647412 d!91729))

(declare-fun b!647745 () Bool)

(declare-fun e!371435 () SeekEntryResult!6847)

(assert (=> b!647745 (= e!371435 Undefined!6847)))

(declare-fun b!647746 () Bool)

(declare-fun e!371437 () SeekEntryResult!6847)

(assert (=> b!647746 (= e!371437 (MissingVacant!6847 vacantSpotIndex!68))))

(declare-fun b!647747 () Bool)

(declare-fun e!371436 () SeekEntryResult!6847)

(assert (=> b!647747 (= e!371435 e!371436)))

(declare-fun c!74405 () Bool)

(declare-fun lt!300594 () (_ BitVec 64))

(assert (=> b!647747 (= c!74405 (= lt!300594 lt!300416))))

(declare-fun b!647744 () Bool)

(assert (=> b!647744 (= e!371437 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300424 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!300416 lt!300423 mask!3053))))

(declare-fun d!91731 () Bool)

(declare-fun lt!300595 () SeekEntryResult!6847)

(assert (=> d!91731 (and (or ((_ is Undefined!6847) lt!300595) (not ((_ is Found!6847) lt!300595)) (and (bvsge (index!29730 lt!300595) #b00000000000000000000000000000000) (bvslt (index!29730 lt!300595) (size!18815 lt!300423)))) (or ((_ is Undefined!6847) lt!300595) ((_ is Found!6847) lt!300595) (not ((_ is MissingVacant!6847) lt!300595)) (not (= (index!29732 lt!300595) vacantSpotIndex!68)) (and (bvsge (index!29732 lt!300595) #b00000000000000000000000000000000) (bvslt (index!29732 lt!300595) (size!18815 lt!300423)))) (or ((_ is Undefined!6847) lt!300595) (ite ((_ is Found!6847) lt!300595) (= (select (arr!18451 lt!300423) (index!29730 lt!300595)) lt!300416) (and ((_ is MissingVacant!6847) lt!300595) (= (index!29732 lt!300595) vacantSpotIndex!68) (= (select (arr!18451 lt!300423) (index!29732 lt!300595)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91731 (= lt!300595 e!371435)))

(declare-fun c!74407 () Bool)

(assert (=> d!91731 (= c!74407 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91731 (= lt!300594 (select (arr!18451 lt!300423) lt!300424))))

(assert (=> d!91731 (validMask!0 mask!3053)))

(assert (=> d!91731 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 lt!300416 lt!300423 mask!3053) lt!300595)))

(declare-fun b!647748 () Bool)

(assert (=> b!647748 (= e!371436 (Found!6847 lt!300424))))

(declare-fun b!647749 () Bool)

(declare-fun c!74406 () Bool)

(assert (=> b!647749 (= c!74406 (= lt!300594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647749 (= e!371436 e!371437)))

(assert (= (and d!91731 c!74407) b!647745))

(assert (= (and d!91731 (not c!74407)) b!647747))

(assert (= (and b!647747 c!74405) b!647748))

(assert (= (and b!647747 (not c!74405)) b!647749))

(assert (= (and b!647749 c!74406) b!647746))

(assert (= (and b!647749 (not c!74406)) b!647744))

(declare-fun m!621595 () Bool)

(assert (=> b!647744 m!621595))

(assert (=> b!647744 m!621595))

(declare-fun m!621597 () Bool)

(assert (=> b!647744 m!621597))

(declare-fun m!621601 () Bool)

(assert (=> d!91731 m!621601))

(declare-fun m!621603 () Bool)

(assert (=> d!91731 m!621603))

(declare-fun m!621605 () Bool)

(assert (=> d!91731 m!621605))

(assert (=> d!91731 m!621297))

(assert (=> b!647400 d!91731))

(declare-fun b!647757 () Bool)

(declare-fun e!371441 () SeekEntryResult!6847)

(assert (=> b!647757 (= e!371441 Undefined!6847)))

(declare-fun b!647758 () Bool)

(declare-fun e!371443 () SeekEntryResult!6847)

(assert (=> b!647758 (= e!371443 (MissingVacant!6847 vacantSpotIndex!68))))

(declare-fun b!647759 () Bool)

(declare-fun e!371442 () SeekEntryResult!6847)

(assert (=> b!647759 (= e!371441 e!371442)))

(declare-fun c!74411 () Bool)

(declare-fun lt!300598 () (_ BitVec 64))

(assert (=> b!647759 (= c!74411 (= lt!300598 (select (arr!18451 a!2986) j!136)))))

(declare-fun b!647756 () Bool)

(assert (=> b!647756 (= e!371443 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300424 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!300599 () SeekEntryResult!6847)

(declare-fun d!91733 () Bool)

(assert (=> d!91733 (and (or ((_ is Undefined!6847) lt!300599) (not ((_ is Found!6847) lt!300599)) (and (bvsge (index!29730 lt!300599) #b00000000000000000000000000000000) (bvslt (index!29730 lt!300599) (size!18815 a!2986)))) (or ((_ is Undefined!6847) lt!300599) ((_ is Found!6847) lt!300599) (not ((_ is MissingVacant!6847) lt!300599)) (not (= (index!29732 lt!300599) vacantSpotIndex!68)) (and (bvsge (index!29732 lt!300599) #b00000000000000000000000000000000) (bvslt (index!29732 lt!300599) (size!18815 a!2986)))) (or ((_ is Undefined!6847) lt!300599) (ite ((_ is Found!6847) lt!300599) (= (select (arr!18451 a!2986) (index!29730 lt!300599)) (select (arr!18451 a!2986) j!136)) (and ((_ is MissingVacant!6847) lt!300599) (= (index!29732 lt!300599) vacantSpotIndex!68) (= (select (arr!18451 a!2986) (index!29732 lt!300599)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91733 (= lt!300599 e!371441)))

(declare-fun c!74413 () Bool)

(assert (=> d!91733 (= c!74413 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91733 (= lt!300598 (select (arr!18451 a!2986) lt!300424))))

(assert (=> d!91733 (validMask!0 mask!3053)))

(assert (=> d!91733 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053) lt!300599)))

(declare-fun b!647760 () Bool)

(assert (=> b!647760 (= e!371442 (Found!6847 lt!300424))))

(declare-fun b!647761 () Bool)

(declare-fun c!74412 () Bool)

(assert (=> b!647761 (= c!74412 (= lt!300598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647761 (= e!371442 e!371443)))

(assert (= (and d!91733 c!74413) b!647757))

(assert (= (and d!91733 (not c!74413)) b!647759))

(assert (= (and b!647759 c!74411) b!647760))

(assert (= (and b!647759 (not c!74411)) b!647761))

(assert (= (and b!647761 c!74412) b!647758))

(assert (= (and b!647761 (not c!74412)) b!647756))

(assert (=> b!647756 m!621595))

(assert (=> b!647756 m!621595))

(assert (=> b!647756 m!621241))

(declare-fun m!621615 () Bool)

(assert (=> b!647756 m!621615))

(declare-fun m!621617 () Bool)

(assert (=> d!91733 m!621617))

(declare-fun m!621619 () Bool)

(assert (=> d!91733 m!621619))

(declare-fun m!621621 () Bool)

(assert (=> d!91733 m!621621))

(assert (=> d!91733 m!621297))

(assert (=> b!647400 d!91733))

(declare-fun b!647763 () Bool)

(declare-fun e!371444 () SeekEntryResult!6847)

(assert (=> b!647763 (= e!371444 Undefined!6847)))

(declare-fun b!647764 () Bool)

(declare-fun e!371446 () SeekEntryResult!6847)

(assert (=> b!647764 (= e!371446 (MissingVacant!6847 vacantSpotIndex!68))))

(declare-fun b!647765 () Bool)

(declare-fun e!371445 () SeekEntryResult!6847)

(assert (=> b!647765 (= e!371444 e!371445)))

(declare-fun c!74414 () Bool)

(declare-fun lt!300600 () (_ BitVec 64))

(assert (=> b!647765 (= c!74414 (= lt!300600 lt!300416))))

(declare-fun b!647762 () Bool)

(assert (=> b!647762 (= e!371446 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!300416 lt!300423 mask!3053))))

(declare-fun d!91737 () Bool)

(declare-fun lt!300601 () SeekEntryResult!6847)

(assert (=> d!91737 (and (or ((_ is Undefined!6847) lt!300601) (not ((_ is Found!6847) lt!300601)) (and (bvsge (index!29730 lt!300601) #b00000000000000000000000000000000) (bvslt (index!29730 lt!300601) (size!18815 lt!300423)))) (or ((_ is Undefined!6847) lt!300601) ((_ is Found!6847) lt!300601) (not ((_ is MissingVacant!6847) lt!300601)) (not (= (index!29732 lt!300601) vacantSpotIndex!68)) (and (bvsge (index!29732 lt!300601) #b00000000000000000000000000000000) (bvslt (index!29732 lt!300601) (size!18815 lt!300423)))) (or ((_ is Undefined!6847) lt!300601) (ite ((_ is Found!6847) lt!300601) (= (select (arr!18451 lt!300423) (index!29730 lt!300601)) lt!300416) (and ((_ is MissingVacant!6847) lt!300601) (= (index!29732 lt!300601) vacantSpotIndex!68) (= (select (arr!18451 lt!300423) (index!29732 lt!300601)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91737 (= lt!300601 e!371444)))

(declare-fun c!74416 () Bool)

(assert (=> d!91737 (= c!74416 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91737 (= lt!300600 (select (arr!18451 lt!300423) index!984))))

(assert (=> d!91737 (validMask!0 mask!3053)))

(assert (=> d!91737 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300416 lt!300423 mask!3053) lt!300601)))

(declare-fun b!647766 () Bool)

(assert (=> b!647766 (= e!371445 (Found!6847 index!984))))

(declare-fun b!647767 () Bool)

(declare-fun c!74415 () Bool)

(assert (=> b!647767 (= c!74415 (= lt!300600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647767 (= e!371445 e!371446)))

(assert (= (and d!91737 c!74416) b!647763))

(assert (= (and d!91737 (not c!74416)) b!647765))

(assert (= (and b!647765 c!74414) b!647766))

(assert (= (and b!647765 (not c!74414)) b!647767))

(assert (= (and b!647767 c!74415) b!647764))

(assert (= (and b!647767 (not c!74415)) b!647762))

(assert (=> b!647762 m!621463))

(assert (=> b!647762 m!621463))

(declare-fun m!621623 () Bool)

(assert (=> b!647762 m!621623))

(declare-fun m!621625 () Bool)

(assert (=> d!91737 m!621625))

(declare-fun m!621627 () Bool)

(assert (=> d!91737 m!621627))

(assert (=> d!91737 m!621451))

(assert (=> d!91737 m!621297))

(assert (=> b!647400 d!91737))

(declare-fun d!91739 () Bool)

(declare-fun e!371496 () Bool)

(assert (=> d!91739 e!371496))

(declare-fun res!419695 () Bool)

(assert (=> d!91739 (=> (not res!419695) (not e!371496))))

(assert (=> d!91739 (= res!419695 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18815 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18815 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18815 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18815 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18815 a!2986))))))

(declare-fun lt!300627 () Unit!21981)

(declare-fun choose!9 (array!38490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21981)

(assert (=> d!91739 (= lt!300627 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91739 (validMask!0 mask!3053)))

(assert (=> d!91739 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 mask!3053) lt!300627)))

(declare-fun b!647842 () Bool)

(assert (=> b!647842 (= e!371496 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 (select (arr!18451 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300424 vacantSpotIndex!68 (select (store (arr!18451 a!2986) i!1108 k0!1786) j!136) (array!38491 (store (arr!18451 a!2986) i!1108 k0!1786) (size!18815 a!2986)) mask!3053)))))

(assert (= (and d!91739 res!419695) b!647842))

(declare-fun m!621705 () Bool)

(assert (=> d!91739 m!621705))

(assert (=> d!91739 m!621297))

(assert (=> b!647842 m!621241))

(assert (=> b!647842 m!621237))

(declare-fun m!621707 () Bool)

(assert (=> b!647842 m!621707))

(assert (=> b!647842 m!621237))

(assert (=> b!647842 m!621249))

(assert (=> b!647842 m!621241))

(assert (=> b!647842 m!621245))

(assert (=> b!647400 d!91739))

(declare-fun d!91769 () Bool)

(declare-fun lt!300633 () (_ BitVec 32))

(assert (=> d!91769 (and (bvsge lt!300633 #b00000000000000000000000000000000) (bvslt lt!300633 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91769 (= lt!300633 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!91769 (validMask!0 mask!3053)))

(assert (=> d!91769 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!300633)))

(declare-fun bs!19363 () Bool)

(assert (= bs!19363 d!91769))

(declare-fun m!621711 () Bool)

(assert (=> bs!19363 m!621711))

(assert (=> bs!19363 m!621297))

(assert (=> b!647400 d!91769))

(check-sat (not d!91729) (not b!647591) (not b!647743) (not b!647725) (not b!647694) (not d!91723) (not b!647589) (not b!647744) (not d!91653) (not d!91687) (not b!647695) (not bm!33697) (not d!91669) (not b!647762) (not d!91737) (not d!91731) (not b!647720) (not b!647718) (not d!91719) (not d!91733) (not b!647756) (not b!647842) (not b!647717) (not d!91727) (not d!91663) (not d!91739) (not b!647581) (not b!647653) (not b!647685) (not b!647604) (not b!647715) (not b!647644) (not d!91667) (not b!647713) (not bm!33698) (not d!91769) (not b!647657) (not bm!33696) (not b!647722) (not b!647724) (not bm!33693) (not b!647683) (not b!647712) (not b!647710) (not b!647587))
(check-sat)
