; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58648 () Bool)

(assert start!58648)

(declare-fun b!647248 () Bool)

(declare-fun e!371100 () Bool)

(declare-fun e!371109 () Bool)

(assert (=> b!647248 (= e!371100 e!371109)))

(declare-fun res!419389 () Bool)

(assert (=> b!647248 (=> res!419389 e!371109)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!300356 () (_ BitVec 64))

(declare-fun lt!300367 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38496 0))(
  ( (array!38497 (arr!18457 (Array (_ BitVec 32) (_ BitVec 64))) (size!18821 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38496)

(assert (=> b!647248 (= res!419389 (or (not (= (select (arr!18457 a!2986) j!136) lt!300356)) (not (= (select (arr!18457 a!2986) j!136) lt!300367)) (bvsge j!136 index!984)))))

(declare-fun b!647249 () Bool)

(declare-fun e!371102 () Bool)

(declare-fun e!371111 () Bool)

(assert (=> b!647249 (= e!371102 e!371111)))

(declare-fun res!419386 () Bool)

(assert (=> b!647249 (=> (not res!419386) (not e!371111))))

(declare-datatypes ((SeekEntryResult!6897 0))(
  ( (MissingZero!6897 (index!29929 (_ BitVec 32))) (Found!6897 (index!29930 (_ BitVec 32))) (Intermediate!6897 (undefined!7709 Bool) (index!29931 (_ BitVec 32)) (x!58708 (_ BitVec 32))) (Undefined!6897) (MissingVacant!6897 (index!29932 (_ BitVec 32))) )
))
(declare-fun lt!300359 () SeekEntryResult!6897)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!647249 (= res!419386 (or (= lt!300359 (MissingZero!6897 i!1108)) (= lt!300359 (MissingVacant!6897 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38496 (_ BitVec 32)) SeekEntryResult!6897)

(assert (=> b!647249 (= lt!300359 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!647250 () Bool)

(declare-fun e!371104 () Bool)

(declare-fun e!371096 () Bool)

(assert (=> b!647250 (= e!371104 e!371096)))

(declare-fun res!419384 () Bool)

(assert (=> b!647250 (=> res!419384 e!371096)))

(assert (=> b!647250 (= res!419384 (or (bvsge (size!18821 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18821 a!2986))))))

(declare-fun lt!300370 () array!38496)

(declare-fun arrayContainsKey!0 (array!38496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647250 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!22008 0))(
  ( (Unit!22009) )
))
(declare-fun lt!300369 () Unit!22008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22008)

(assert (=> b!647250 (= lt!300369 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300370 (select (arr!18457 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371097 () Bool)

(assert (=> b!647250 e!371097))

(declare-fun res!419395 () Bool)

(assert (=> b!647250 (=> (not res!419395) (not e!371097))))

(assert (=> b!647250 (= res!419395 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) j!136))))

(declare-fun b!647251 () Bool)

(declare-fun e!371103 () Unit!22008)

(declare-fun Unit!22010 () Unit!22008)

(assert (=> b!647251 (= e!371103 Unit!22010)))

(declare-fun b!647252 () Bool)

(declare-fun e!371107 () Bool)

(declare-fun e!371108 () Bool)

(assert (=> b!647252 (= e!371107 e!371108)))

(declare-fun res!419382 () Bool)

(assert (=> b!647252 (=> res!419382 e!371108)))

(assert (=> b!647252 (= res!419382 (or (not (= (select (arr!18457 a!2986) j!136) lt!300356)) (not (= (select (arr!18457 a!2986) j!136) lt!300367))))))

(assert (=> b!647252 e!371100))

(declare-fun res!419379 () Bool)

(assert (=> b!647252 (=> (not res!419379) (not e!371100))))

(assert (=> b!647252 (= res!419379 (= lt!300367 (select (arr!18457 a!2986) j!136)))))

(assert (=> b!647252 (= lt!300367 (select (store (arr!18457 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!647253 () Bool)

(declare-fun e!371098 () Bool)

(declare-fun e!371106 () Bool)

(assert (=> b!647253 (= e!371098 e!371106)))

(declare-fun res!419390 () Bool)

(assert (=> b!647253 (=> (not res!419390) (not e!371106))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!300366 () SeekEntryResult!6897)

(assert (=> b!647253 (= res!419390 (and (= lt!300366 (Found!6897 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18457 a!2986) index!984) (select (arr!18457 a!2986) j!136))) (not (= (select (arr!18457 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38496 (_ BitVec 32)) SeekEntryResult!6897)

(assert (=> b!647253 (= lt!300366 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!419388 () Bool)

(assert (=> start!58648 (=> (not res!419388) (not e!371102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58648 (= res!419388 (validMask!0 mask!3053))))

(assert (=> start!58648 e!371102))

(assert (=> start!58648 true))

(declare-fun array_inv!14253 (array!38496) Bool)

(assert (=> start!58648 (array_inv!14253 a!2986)))

(declare-fun b!647254 () Bool)

(declare-fun res!419399 () Bool)

(assert (=> b!647254 (=> res!419399 e!371096)))

(declare-datatypes ((List!12498 0))(
  ( (Nil!12495) (Cons!12494 (h!13539 (_ BitVec 64)) (t!18726 List!12498)) )
))
(declare-fun noDuplicate!415 (List!12498) Bool)

(assert (=> b!647254 (= res!419399 (not (noDuplicate!415 Nil!12495)))))

(declare-fun b!647255 () Bool)

(declare-fun res!419387 () Bool)

(assert (=> b!647255 (=> (not res!419387) (not e!371102))))

(assert (=> b!647255 (= res!419387 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!647256 () Bool)

(assert (=> b!647256 (= e!371097 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) index!984))))

(declare-fun b!647257 () Bool)

(assert (=> b!647257 (= e!371108 e!371104)))

(declare-fun res!419398 () Bool)

(assert (=> b!647257 (=> res!419398 e!371104)))

(assert (=> b!647257 (= res!419398 (bvsge index!984 j!136))))

(declare-fun lt!300368 () Unit!22008)

(assert (=> b!647257 (= lt!300368 e!371103)))

(declare-fun c!74303 () Bool)

(assert (=> b!647257 (= c!74303 (bvslt j!136 index!984))))

(declare-fun b!647258 () Bool)

(declare-fun res!419385 () Bool)

(assert (=> b!647258 (=> (not res!419385) (not e!371102))))

(assert (=> b!647258 (= res!419385 (and (= (size!18821 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18821 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18821 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!647259 () Bool)

(declare-fun e!371112 () Bool)

(declare-fun lt!300363 () SeekEntryResult!6897)

(assert (=> b!647259 (= e!371112 (= lt!300366 lt!300363))))

(declare-fun b!647260 () Bool)

(declare-fun Unit!22011 () Unit!22008)

(assert (=> b!647260 (= e!371103 Unit!22011)))

(declare-fun lt!300358 () Unit!22008)

(assert (=> b!647260 (= lt!300358 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300370 (select (arr!18457 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!647260 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300362 () Unit!22008)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12498) Unit!22008)

(assert (=> b!647260 (= lt!300362 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12495))))

(declare-fun arrayNoDuplicates!0 (array!38496 (_ BitVec 32) List!12498) Bool)

(assert (=> b!647260 (arrayNoDuplicates!0 lt!300370 #b00000000000000000000000000000000 Nil!12495)))

(declare-fun lt!300365 () Unit!22008)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38496 (_ BitVec 32) (_ BitVec 32)) Unit!22008)

(assert (=> b!647260 (= lt!300365 (lemmaNoDuplicateFromThenFromBigger!0 lt!300370 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647260 (arrayNoDuplicates!0 lt!300370 j!136 Nil!12495)))

(declare-fun lt!300361 () Unit!22008)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38496 (_ BitVec 64) (_ BitVec 32) List!12498) Unit!22008)

(assert (=> b!647260 (= lt!300361 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300370 (select (arr!18457 a!2986) j!136) j!136 Nil!12495))))

(assert (=> b!647260 false))

(declare-fun b!647261 () Bool)

(declare-fun res!419393 () Bool)

(assert (=> b!647261 (=> (not res!419393) (not e!371102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647261 (= res!419393 (validKeyInArray!0 k0!1786))))

(declare-fun b!647262 () Bool)

(assert (=> b!647262 (= e!371106 (not e!371107))))

(declare-fun res!419380 () Bool)

(assert (=> b!647262 (=> res!419380 e!371107)))

(declare-fun lt!300357 () SeekEntryResult!6897)

(assert (=> b!647262 (= res!419380 (not (= lt!300357 (Found!6897 index!984))))))

(declare-fun lt!300360 () Unit!22008)

(declare-fun e!371099 () Unit!22008)

(assert (=> b!647262 (= lt!300360 e!371099)))

(declare-fun c!74302 () Bool)

(assert (=> b!647262 (= c!74302 (= lt!300357 Undefined!6897))))

(assert (=> b!647262 (= lt!300357 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300356 lt!300370 mask!3053))))

(assert (=> b!647262 e!371112))

(declare-fun res!419394 () Bool)

(assert (=> b!647262 (=> (not res!419394) (not e!371112))))

(declare-fun lt!300355 () (_ BitVec 32))

(assert (=> b!647262 (= res!419394 (= lt!300363 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 lt!300356 lt!300370 mask!3053)))))

(assert (=> b!647262 (= lt!300363 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!647262 (= lt!300356 (select (store (arr!18457 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300364 () Unit!22008)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22008)

(assert (=> b!647262 (= lt!300364 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647262 (= lt!300355 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!647263 () Bool)

(declare-fun e!371110 () Bool)

(assert (=> b!647263 (= e!371109 e!371110)))

(declare-fun res!419381 () Bool)

(assert (=> b!647263 (=> (not res!419381) (not e!371110))))

(assert (=> b!647263 (= res!419381 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) j!136))))

(declare-fun b!647264 () Bool)

(declare-fun e!371101 () Bool)

(assert (=> b!647264 (= e!371096 e!371101)))

(declare-fun res!419391 () Bool)

(assert (=> b!647264 (=> (not res!419391) (not e!371101))))

(declare-fun contains!3153 (List!12498 (_ BitVec 64)) Bool)

(assert (=> b!647264 (= res!419391 (not (contains!3153 Nil!12495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647265 () Bool)

(declare-fun Unit!22012 () Unit!22008)

(assert (=> b!647265 (= e!371099 Unit!22012)))

(declare-fun b!647266 () Bool)

(declare-fun res!419378 () Bool)

(assert (=> b!647266 (=> (not res!419378) (not e!371111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38496 (_ BitVec 32)) Bool)

(assert (=> b!647266 (= res!419378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!647267 () Bool)

(declare-fun res!419396 () Bool)

(assert (=> b!647267 (=> (not res!419396) (not e!371102))))

(assert (=> b!647267 (= res!419396 (validKeyInArray!0 (select (arr!18457 a!2986) j!136)))))

(declare-fun b!647268 () Bool)

(declare-fun res!419383 () Bool)

(assert (=> b!647268 (=> (not res!419383) (not e!371111))))

(assert (=> b!647268 (= res!419383 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12495))))

(declare-fun b!647269 () Bool)

(declare-fun Unit!22013 () Unit!22008)

(assert (=> b!647269 (= e!371099 Unit!22013)))

(assert (=> b!647269 false))

(declare-fun b!647270 () Bool)

(declare-fun res!419397 () Bool)

(assert (=> b!647270 (=> (not res!419397) (not e!371111))))

(assert (=> b!647270 (= res!419397 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18457 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647271 () Bool)

(assert (=> b!647271 (= e!371111 e!371098)))

(declare-fun res!419392 () Bool)

(assert (=> b!647271 (=> (not res!419392) (not e!371098))))

(assert (=> b!647271 (= res!419392 (= (select (store (arr!18457 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647271 (= lt!300370 (array!38497 (store (arr!18457 a!2986) i!1108 k0!1786) (size!18821 a!2986)))))

(declare-fun b!647272 () Bool)

(assert (=> b!647272 (= e!371101 (not (contains!3153 Nil!12495 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647273 () Bool)

(assert (=> b!647273 (= e!371110 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) index!984))))

(assert (= (and start!58648 res!419388) b!647258))

(assert (= (and b!647258 res!419385) b!647267))

(assert (= (and b!647267 res!419396) b!647261))

(assert (= (and b!647261 res!419393) b!647255))

(assert (= (and b!647255 res!419387) b!647249))

(assert (= (and b!647249 res!419386) b!647266))

(assert (= (and b!647266 res!419378) b!647268))

(assert (= (and b!647268 res!419383) b!647270))

(assert (= (and b!647270 res!419397) b!647271))

(assert (= (and b!647271 res!419392) b!647253))

(assert (= (and b!647253 res!419390) b!647262))

(assert (= (and b!647262 res!419394) b!647259))

(assert (= (and b!647262 c!74302) b!647269))

(assert (= (and b!647262 (not c!74302)) b!647265))

(assert (= (and b!647262 (not res!419380)) b!647252))

(assert (= (and b!647252 res!419379) b!647248))

(assert (= (and b!647248 (not res!419389)) b!647263))

(assert (= (and b!647263 res!419381) b!647273))

(assert (= (and b!647252 (not res!419382)) b!647257))

(assert (= (and b!647257 c!74303) b!647260))

(assert (= (and b!647257 (not c!74303)) b!647251))

(assert (= (and b!647257 (not res!419398)) b!647250))

(assert (= (and b!647250 res!419395) b!647256))

(assert (= (and b!647250 (not res!419384)) b!647254))

(assert (= (and b!647254 (not res!419399)) b!647264))

(assert (= (and b!647264 res!419391) b!647272))

(declare-fun m!620661 () Bool)

(assert (=> b!647261 m!620661))

(declare-fun m!620663 () Bool)

(assert (=> b!647249 m!620663))

(declare-fun m!620665 () Bool)

(assert (=> b!647271 m!620665))

(declare-fun m!620667 () Bool)

(assert (=> b!647271 m!620667))

(declare-fun m!620669 () Bool)

(assert (=> b!647267 m!620669))

(assert (=> b!647267 m!620669))

(declare-fun m!620671 () Bool)

(assert (=> b!647267 m!620671))

(declare-fun m!620673 () Bool)

(assert (=> b!647272 m!620673))

(declare-fun m!620675 () Bool)

(assert (=> b!647262 m!620675))

(declare-fun m!620677 () Bool)

(assert (=> b!647262 m!620677))

(declare-fun m!620679 () Bool)

(assert (=> b!647262 m!620679))

(assert (=> b!647262 m!620665))

(declare-fun m!620681 () Bool)

(assert (=> b!647262 m!620681))

(assert (=> b!647262 m!620669))

(declare-fun m!620683 () Bool)

(assert (=> b!647262 m!620683))

(assert (=> b!647262 m!620669))

(declare-fun m!620685 () Bool)

(assert (=> b!647262 m!620685))

(declare-fun m!620687 () Bool)

(assert (=> b!647268 m!620687))

(assert (=> b!647263 m!620669))

(assert (=> b!647263 m!620669))

(declare-fun m!620689 () Bool)

(assert (=> b!647263 m!620689))

(assert (=> b!647248 m!620669))

(assert (=> b!647260 m!620669))

(declare-fun m!620691 () Bool)

(assert (=> b!647260 m!620691))

(assert (=> b!647260 m!620669))

(assert (=> b!647260 m!620669))

(declare-fun m!620693 () Bool)

(assert (=> b!647260 m!620693))

(declare-fun m!620695 () Bool)

(assert (=> b!647260 m!620695))

(declare-fun m!620697 () Bool)

(assert (=> b!647260 m!620697))

(declare-fun m!620699 () Bool)

(assert (=> b!647260 m!620699))

(declare-fun m!620701 () Bool)

(assert (=> b!647260 m!620701))

(assert (=> b!647260 m!620669))

(declare-fun m!620703 () Bool)

(assert (=> b!647260 m!620703))

(assert (=> b!647256 m!620669))

(assert (=> b!647256 m!620669))

(declare-fun m!620705 () Bool)

(assert (=> b!647256 m!620705))

(declare-fun m!620707 () Bool)

(assert (=> b!647253 m!620707))

(assert (=> b!647253 m!620669))

(assert (=> b!647253 m!620669))

(declare-fun m!620709 () Bool)

(assert (=> b!647253 m!620709))

(declare-fun m!620711 () Bool)

(assert (=> b!647266 m!620711))

(assert (=> b!647273 m!620669))

(assert (=> b!647273 m!620669))

(assert (=> b!647273 m!620705))

(declare-fun m!620713 () Bool)

(assert (=> b!647264 m!620713))

(assert (=> b!647250 m!620669))

(assert (=> b!647250 m!620669))

(declare-fun m!620715 () Bool)

(assert (=> b!647250 m!620715))

(assert (=> b!647250 m!620669))

(declare-fun m!620717 () Bool)

(assert (=> b!647250 m!620717))

(assert (=> b!647250 m!620669))

(assert (=> b!647250 m!620689))

(declare-fun m!620719 () Bool)

(assert (=> b!647254 m!620719))

(declare-fun m!620721 () Bool)

(assert (=> b!647255 m!620721))

(declare-fun m!620723 () Bool)

(assert (=> b!647270 m!620723))

(assert (=> b!647252 m!620669))

(assert (=> b!647252 m!620665))

(declare-fun m!620725 () Bool)

(assert (=> b!647252 m!620725))

(declare-fun m!620727 () Bool)

(assert (=> start!58648 m!620727))

(declare-fun m!620729 () Bool)

(assert (=> start!58648 m!620729))

(check-sat (not start!58648) (not b!647255) (not b!647266) (not b!647253) (not b!647268) (not b!647261) (not b!647267) (not b!647273) (not b!647250) (not b!647272) (not b!647256) (not b!647249) (not b!647260) (not b!647262) (not b!647264) (not b!647263) (not b!647254))
(check-sat)
(get-model)

(declare-fun d!91531 () Bool)

(declare-fun res!419470 () Bool)

(declare-fun e!371168 () Bool)

(assert (=> d!91531 (=> res!419470 e!371168)))

(assert (=> d!91531 (= res!419470 (= (select (arr!18457 lt!300370) index!984) (select (arr!18457 a!2986) j!136)))))

(assert (=> d!91531 (= (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) index!984) e!371168)))

(declare-fun b!647356 () Bool)

(declare-fun e!371169 () Bool)

(assert (=> b!647356 (= e!371168 e!371169)))

(declare-fun res!419471 () Bool)

(assert (=> b!647356 (=> (not res!419471) (not e!371169))))

(assert (=> b!647356 (= res!419471 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18821 lt!300370)))))

(declare-fun b!647357 () Bool)

(assert (=> b!647357 (= e!371169 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91531 (not res!419470)) b!647356))

(assert (= (and b!647356 res!419471) b!647357))

(declare-fun m!620801 () Bool)

(assert (=> d!91531 m!620801))

(assert (=> b!647357 m!620669))

(declare-fun m!620803 () Bool)

(assert (=> b!647357 m!620803))

(assert (=> b!647256 d!91531))

(declare-fun bm!33680 () Bool)

(declare-fun call!33683 () Bool)

(assert (=> bm!33680 (= call!33683 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!647367 () Bool)

(declare-fun e!371177 () Bool)

(declare-fun e!371176 () Bool)

(assert (=> b!647367 (= e!371177 e!371176)))

(declare-fun lt!300426 () (_ BitVec 64))

(assert (=> b!647367 (= lt!300426 (select (arr!18457 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300425 () Unit!22008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38496 (_ BitVec 64) (_ BitVec 32)) Unit!22008)

(assert (=> b!647367 (= lt!300425 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300426 #b00000000000000000000000000000000))))

(assert (=> b!647367 (arrayContainsKey!0 a!2986 lt!300426 #b00000000000000000000000000000000)))

(declare-fun lt!300427 () Unit!22008)

(assert (=> b!647367 (= lt!300427 lt!300425)))

(declare-fun res!419477 () Bool)

(assert (=> b!647367 (= res!419477 (= (seekEntryOrOpen!0 (select (arr!18457 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6897 #b00000000000000000000000000000000)))))

(assert (=> b!647367 (=> (not res!419477) (not e!371176))))

(declare-fun b!647368 () Bool)

(declare-fun e!371178 () Bool)

(assert (=> b!647368 (= e!371178 e!371177)))

(declare-fun c!74312 () Bool)

(assert (=> b!647368 (= c!74312 (validKeyInArray!0 (select (arr!18457 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647369 () Bool)

(assert (=> b!647369 (= e!371177 call!33683)))

(declare-fun b!647366 () Bool)

(assert (=> b!647366 (= e!371176 call!33683)))

(declare-fun d!91533 () Bool)

(declare-fun res!419476 () Bool)

(assert (=> d!91533 (=> res!419476 e!371178)))

(assert (=> d!91533 (= res!419476 (bvsge #b00000000000000000000000000000000 (size!18821 a!2986)))))

(assert (=> d!91533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371178)))

(assert (= (and d!91533 (not res!419476)) b!647368))

(assert (= (and b!647368 c!74312) b!647367))

(assert (= (and b!647368 (not c!74312)) b!647369))

(assert (= (and b!647367 res!419477) b!647366))

(assert (= (or b!647366 b!647369) bm!33680))

(declare-fun m!620805 () Bool)

(assert (=> bm!33680 m!620805))

(declare-fun m!620807 () Bool)

(assert (=> b!647367 m!620807))

(declare-fun m!620809 () Bool)

(assert (=> b!647367 m!620809))

(declare-fun m!620811 () Bool)

(assert (=> b!647367 m!620811))

(assert (=> b!647367 m!620807))

(declare-fun m!620813 () Bool)

(assert (=> b!647367 m!620813))

(assert (=> b!647368 m!620807))

(assert (=> b!647368 m!620807))

(declare-fun m!620815 () Bool)

(assert (=> b!647368 m!620815))

(assert (=> b!647266 d!91533))

(declare-fun d!91535 () Bool)

(declare-fun res!419478 () Bool)

(declare-fun e!371179 () Bool)

(assert (=> d!91535 (=> res!419478 e!371179)))

(assert (=> d!91535 (= res!419478 (= (select (arr!18457 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91535 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!371179)))

(declare-fun b!647370 () Bool)

(declare-fun e!371180 () Bool)

(assert (=> b!647370 (= e!371179 e!371180)))

(declare-fun res!419479 () Bool)

(assert (=> b!647370 (=> (not res!419479) (not e!371180))))

(assert (=> b!647370 (= res!419479 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18821 a!2986)))))

(declare-fun b!647371 () Bool)

(assert (=> b!647371 (= e!371180 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91535 (not res!419478)) b!647370))

(assert (= (and b!647370 res!419479) b!647371))

(assert (=> d!91535 m!620807))

(declare-fun m!620817 () Bool)

(assert (=> b!647371 m!620817))

(assert (=> b!647255 d!91535))

(declare-fun d!91537 () Bool)

(declare-fun res!419484 () Bool)

(declare-fun e!371185 () Bool)

(assert (=> d!91537 (=> res!419484 e!371185)))

(get-info :version)

(assert (=> d!91537 (= res!419484 ((_ is Nil!12495) Nil!12495))))

(assert (=> d!91537 (= (noDuplicate!415 Nil!12495) e!371185)))

(declare-fun b!647376 () Bool)

(declare-fun e!371186 () Bool)

(assert (=> b!647376 (= e!371185 e!371186)))

(declare-fun res!419485 () Bool)

(assert (=> b!647376 (=> (not res!419485) (not e!371186))))

(assert (=> b!647376 (= res!419485 (not (contains!3153 (t!18726 Nil!12495) (h!13539 Nil!12495))))))

(declare-fun b!647377 () Bool)

(assert (=> b!647377 (= e!371186 (noDuplicate!415 (t!18726 Nil!12495)))))

(assert (= (and d!91537 (not res!419484)) b!647376))

(assert (= (and b!647376 res!419485) b!647377))

(declare-fun m!620819 () Bool)

(assert (=> b!647376 m!620819))

(declare-fun m!620821 () Bool)

(assert (=> b!647377 m!620821))

(assert (=> b!647254 d!91537))

(declare-fun d!91539 () Bool)

(assert (=> d!91539 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58648 d!91539))

(declare-fun d!91541 () Bool)

(assert (=> d!91541 (= (array_inv!14253 a!2986) (bvsge (size!18821 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58648 d!91541))

(declare-fun d!91543 () Bool)

(declare-fun res!419493 () Bool)

(declare-fun e!371196 () Bool)

(assert (=> d!91543 (=> res!419493 e!371196)))

(assert (=> d!91543 (= res!419493 (bvsge #b00000000000000000000000000000000 (size!18821 a!2986)))))

(assert (=> d!91543 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12495) e!371196)))

(declare-fun b!647388 () Bool)

(declare-fun e!371195 () Bool)

(declare-fun call!33686 () Bool)

(assert (=> b!647388 (= e!371195 call!33686)))

(declare-fun b!647389 () Bool)

(assert (=> b!647389 (= e!371195 call!33686)))

(declare-fun b!647390 () Bool)

(declare-fun e!371198 () Bool)

(assert (=> b!647390 (= e!371196 e!371198)))

(declare-fun res!419492 () Bool)

(assert (=> b!647390 (=> (not res!419492) (not e!371198))))

(declare-fun e!371197 () Bool)

(assert (=> b!647390 (= res!419492 (not e!371197))))

(declare-fun res!419494 () Bool)

(assert (=> b!647390 (=> (not res!419494) (not e!371197))))

(assert (=> b!647390 (= res!419494 (validKeyInArray!0 (select (arr!18457 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647391 () Bool)

(assert (=> b!647391 (= e!371197 (contains!3153 Nil!12495 (select (arr!18457 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647392 () Bool)

(assert (=> b!647392 (= e!371198 e!371195)))

(declare-fun c!74315 () Bool)

(assert (=> b!647392 (= c!74315 (validKeyInArray!0 (select (arr!18457 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33683 () Bool)

(assert (=> bm!33683 (= call!33686 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74315 (Cons!12494 (select (arr!18457 a!2986) #b00000000000000000000000000000000) Nil!12495) Nil!12495)))))

(assert (= (and d!91543 (not res!419493)) b!647390))

(assert (= (and b!647390 res!419494) b!647391))

(assert (= (and b!647390 res!419492) b!647392))

(assert (= (and b!647392 c!74315) b!647389))

(assert (= (and b!647392 (not c!74315)) b!647388))

(assert (= (or b!647389 b!647388) bm!33683))

(assert (=> b!647390 m!620807))

(assert (=> b!647390 m!620807))

(assert (=> b!647390 m!620815))

(assert (=> b!647391 m!620807))

(assert (=> b!647391 m!620807))

(declare-fun m!620823 () Bool)

(assert (=> b!647391 m!620823))

(assert (=> b!647392 m!620807))

(assert (=> b!647392 m!620807))

(assert (=> b!647392 m!620815))

(assert (=> bm!33683 m!620807))

(declare-fun m!620825 () Bool)

(assert (=> bm!33683 m!620825))

(assert (=> b!647268 d!91543))

(declare-fun d!91545 () Bool)

(assert (=> d!91545 (= (validKeyInArray!0 (select (arr!18457 a!2986) j!136)) (and (not (= (select (arr!18457 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18457 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647267 d!91545))

(declare-fun d!91547 () Bool)

(declare-fun lt!300430 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!248 (List!12498) (InoxSet (_ BitVec 64)))

(assert (=> d!91547 (= lt!300430 (select (content!248 Nil!12495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371203 () Bool)

(assert (=> d!91547 (= lt!300430 e!371203)))

(declare-fun res!419500 () Bool)

(assert (=> d!91547 (=> (not res!419500) (not e!371203))))

(assert (=> d!91547 (= res!419500 ((_ is Cons!12494) Nil!12495))))

(assert (=> d!91547 (= (contains!3153 Nil!12495 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300430)))

(declare-fun b!647397 () Bool)

(declare-fun e!371204 () Bool)

(assert (=> b!647397 (= e!371203 e!371204)))

(declare-fun res!419499 () Bool)

(assert (=> b!647397 (=> res!419499 e!371204)))

(assert (=> b!647397 (= res!419499 (= (h!13539 Nil!12495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647398 () Bool)

(assert (=> b!647398 (= e!371204 (contains!3153 (t!18726 Nil!12495) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91547 res!419500) b!647397))

(assert (= (and b!647397 (not res!419499)) b!647398))

(declare-fun m!620827 () Bool)

(assert (=> d!91547 m!620827))

(declare-fun m!620829 () Bool)

(assert (=> d!91547 m!620829))

(declare-fun m!620831 () Bool)

(assert (=> b!647398 m!620831))

(assert (=> b!647272 d!91547))

(declare-fun d!91549 () Bool)

(assert (=> d!91549 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647261 d!91549))

(declare-fun d!91551 () Bool)

(declare-fun res!419501 () Bool)

(declare-fun e!371205 () Bool)

(assert (=> d!91551 (=> res!419501 e!371205)))

(assert (=> d!91551 (= res!419501 (= (select (arr!18457 lt!300370) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18457 a!2986) j!136)))))

(assert (=> d!91551 (= (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371205)))

(declare-fun b!647399 () Bool)

(declare-fun e!371206 () Bool)

(assert (=> b!647399 (= e!371205 e!371206)))

(declare-fun res!419502 () Bool)

(assert (=> b!647399 (=> (not res!419502) (not e!371206))))

(assert (=> b!647399 (= res!419502 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18821 lt!300370)))))

(declare-fun b!647400 () Bool)

(assert (=> b!647400 (= e!371206 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91551 (not res!419501)) b!647399))

(assert (= (and b!647399 res!419502) b!647400))

(declare-fun m!620833 () Bool)

(assert (=> d!91551 m!620833))

(assert (=> b!647400 m!620669))

(declare-fun m!620835 () Bool)

(assert (=> b!647400 m!620835))

(assert (=> b!647250 d!91551))

(declare-fun d!91553 () Bool)

(assert (=> d!91553 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300433 () Unit!22008)

(declare-fun choose!114 (array!38496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22008)

(assert (=> d!91553 (= lt!300433 (choose!114 lt!300370 (select (arr!18457 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91553 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91553 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300370 (select (arr!18457 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300433)))

(declare-fun bs!19336 () Bool)

(assert (= bs!19336 d!91553))

(assert (=> bs!19336 m!620669))

(assert (=> bs!19336 m!620715))

(assert (=> bs!19336 m!620669))

(declare-fun m!620837 () Bool)

(assert (=> bs!19336 m!620837))

(assert (=> b!647250 d!91553))

(declare-fun d!91555 () Bool)

(declare-fun res!419503 () Bool)

(declare-fun e!371207 () Bool)

(assert (=> d!91555 (=> res!419503 e!371207)))

(assert (=> d!91555 (= res!419503 (= (select (arr!18457 lt!300370) j!136) (select (arr!18457 a!2986) j!136)))))

(assert (=> d!91555 (= (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) j!136) e!371207)))

(declare-fun b!647401 () Bool)

(declare-fun e!371208 () Bool)

(assert (=> b!647401 (= e!371207 e!371208)))

(declare-fun res!419504 () Bool)

(assert (=> b!647401 (=> (not res!419504) (not e!371208))))

(assert (=> b!647401 (= res!419504 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18821 lt!300370)))))

(declare-fun b!647402 () Bool)

(assert (=> b!647402 (= e!371208 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91555 (not res!419503)) b!647401))

(assert (= (and b!647401 res!419504) b!647402))

(declare-fun m!620839 () Bool)

(assert (=> d!91555 m!620839))

(assert (=> b!647402 m!620669))

(declare-fun m!620841 () Bool)

(assert (=> b!647402 m!620841))

(assert (=> b!647250 d!91555))

(declare-fun d!91557 () Bool)

(declare-fun res!419506 () Bool)

(declare-fun e!371210 () Bool)

(assert (=> d!91557 (=> res!419506 e!371210)))

(assert (=> d!91557 (= res!419506 (bvsge #b00000000000000000000000000000000 (size!18821 lt!300370)))))

(assert (=> d!91557 (= (arrayNoDuplicates!0 lt!300370 #b00000000000000000000000000000000 Nil!12495) e!371210)))

(declare-fun b!647403 () Bool)

(declare-fun e!371209 () Bool)

(declare-fun call!33687 () Bool)

(assert (=> b!647403 (= e!371209 call!33687)))

(declare-fun b!647404 () Bool)

(assert (=> b!647404 (= e!371209 call!33687)))

(declare-fun b!647405 () Bool)

(declare-fun e!371212 () Bool)

(assert (=> b!647405 (= e!371210 e!371212)))

(declare-fun res!419505 () Bool)

(assert (=> b!647405 (=> (not res!419505) (not e!371212))))

(declare-fun e!371211 () Bool)

(assert (=> b!647405 (= res!419505 (not e!371211))))

(declare-fun res!419507 () Bool)

(assert (=> b!647405 (=> (not res!419507) (not e!371211))))

(assert (=> b!647405 (= res!419507 (validKeyInArray!0 (select (arr!18457 lt!300370) #b00000000000000000000000000000000)))))

(declare-fun b!647406 () Bool)

(assert (=> b!647406 (= e!371211 (contains!3153 Nil!12495 (select (arr!18457 lt!300370) #b00000000000000000000000000000000)))))

(declare-fun b!647407 () Bool)

(assert (=> b!647407 (= e!371212 e!371209)))

(declare-fun c!74316 () Bool)

(assert (=> b!647407 (= c!74316 (validKeyInArray!0 (select (arr!18457 lt!300370) #b00000000000000000000000000000000)))))

(declare-fun bm!33684 () Bool)

(assert (=> bm!33684 (= call!33687 (arrayNoDuplicates!0 lt!300370 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74316 (Cons!12494 (select (arr!18457 lt!300370) #b00000000000000000000000000000000) Nil!12495) Nil!12495)))))

(assert (= (and d!91557 (not res!419506)) b!647405))

(assert (= (and b!647405 res!419507) b!647406))

(assert (= (and b!647405 res!419505) b!647407))

(assert (= (and b!647407 c!74316) b!647404))

(assert (= (and b!647407 (not c!74316)) b!647403))

(assert (= (or b!647404 b!647403) bm!33684))

(declare-fun m!620843 () Bool)

(assert (=> b!647405 m!620843))

(assert (=> b!647405 m!620843))

(declare-fun m!620845 () Bool)

(assert (=> b!647405 m!620845))

(assert (=> b!647406 m!620843))

(assert (=> b!647406 m!620843))

(declare-fun m!620847 () Bool)

(assert (=> b!647406 m!620847))

(assert (=> b!647407 m!620843))

(assert (=> b!647407 m!620843))

(assert (=> b!647407 m!620845))

(assert (=> bm!33684 m!620843))

(declare-fun m!620849 () Bool)

(assert (=> bm!33684 m!620849))

(assert (=> b!647260 d!91557))

(declare-fun d!91559 () Bool)

(assert (=> d!91559 (arrayNoDuplicates!0 lt!300370 j!136 Nil!12495)))

(declare-fun lt!300436 () Unit!22008)

(declare-fun choose!39 (array!38496 (_ BitVec 32) (_ BitVec 32)) Unit!22008)

(assert (=> d!91559 (= lt!300436 (choose!39 lt!300370 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91559 (bvslt (size!18821 lt!300370) #b01111111111111111111111111111111)))

(assert (=> d!91559 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300370 #b00000000000000000000000000000000 j!136) lt!300436)))

(declare-fun bs!19337 () Bool)

(assert (= bs!19337 d!91559))

(assert (=> bs!19337 m!620695))

(declare-fun m!620851 () Bool)

(assert (=> bs!19337 m!620851))

(assert (=> b!647260 d!91559))

(declare-fun d!91561 () Bool)

(declare-fun res!419508 () Bool)

(declare-fun e!371213 () Bool)

(assert (=> d!91561 (=> res!419508 e!371213)))

(assert (=> d!91561 (= res!419508 (= (select (arr!18457 lt!300370) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18457 a!2986) j!136)))))

(assert (=> d!91561 (= (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371213)))

(declare-fun b!647408 () Bool)

(declare-fun e!371214 () Bool)

(assert (=> b!647408 (= e!371213 e!371214)))

(declare-fun res!419509 () Bool)

(assert (=> b!647408 (=> (not res!419509) (not e!371214))))

(assert (=> b!647408 (= res!419509 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18821 lt!300370)))))

(declare-fun b!647409 () Bool)

(assert (=> b!647409 (= e!371214 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91561 (not res!419508)) b!647408))

(assert (= (and b!647408 res!419509) b!647409))

(declare-fun m!620853 () Bool)

(assert (=> d!91561 m!620853))

(assert (=> b!647409 m!620669))

(declare-fun m!620855 () Bool)

(assert (=> b!647409 m!620855))

(assert (=> b!647260 d!91561))

(declare-fun d!91563 () Bool)

(assert (=> d!91563 (arrayContainsKey!0 lt!300370 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300437 () Unit!22008)

(assert (=> d!91563 (= lt!300437 (choose!114 lt!300370 (select (arr!18457 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91563 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91563 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300370 (select (arr!18457 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300437)))

(declare-fun bs!19338 () Bool)

(assert (= bs!19338 d!91563))

(assert (=> bs!19338 m!620669))

(assert (=> bs!19338 m!620691))

(assert (=> bs!19338 m!620669))

(declare-fun m!620857 () Bool)

(assert (=> bs!19338 m!620857))

(assert (=> b!647260 d!91563))

(declare-fun d!91565 () Bool)

(assert (=> d!91565 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18821 lt!300370)) (not (= (select (arr!18457 lt!300370) j!136) (select (arr!18457 a!2986) j!136))))))

(declare-fun lt!300440 () Unit!22008)

(declare-fun choose!21 (array!38496 (_ BitVec 64) (_ BitVec 32) List!12498) Unit!22008)

(assert (=> d!91565 (= lt!300440 (choose!21 lt!300370 (select (arr!18457 a!2986) j!136) j!136 Nil!12495))))

(assert (=> d!91565 (bvslt (size!18821 lt!300370) #b01111111111111111111111111111111)))

(assert (=> d!91565 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300370 (select (arr!18457 a!2986) j!136) j!136 Nil!12495) lt!300440)))

(declare-fun bs!19339 () Bool)

(assert (= bs!19339 d!91565))

(assert (=> bs!19339 m!620839))

(assert (=> bs!19339 m!620669))

(declare-fun m!620859 () Bool)

(assert (=> bs!19339 m!620859))

(assert (=> b!647260 d!91565))

(declare-fun d!91569 () Bool)

(declare-fun res!419511 () Bool)

(declare-fun e!371216 () Bool)

(assert (=> d!91569 (=> res!419511 e!371216)))

(assert (=> d!91569 (= res!419511 (bvsge j!136 (size!18821 lt!300370)))))

(assert (=> d!91569 (= (arrayNoDuplicates!0 lt!300370 j!136 Nil!12495) e!371216)))

(declare-fun b!647410 () Bool)

(declare-fun e!371215 () Bool)

(declare-fun call!33688 () Bool)

(assert (=> b!647410 (= e!371215 call!33688)))

(declare-fun b!647411 () Bool)

(assert (=> b!647411 (= e!371215 call!33688)))

(declare-fun b!647412 () Bool)

(declare-fun e!371218 () Bool)

(assert (=> b!647412 (= e!371216 e!371218)))

(declare-fun res!419510 () Bool)

(assert (=> b!647412 (=> (not res!419510) (not e!371218))))

(declare-fun e!371217 () Bool)

(assert (=> b!647412 (= res!419510 (not e!371217))))

(declare-fun res!419512 () Bool)

(assert (=> b!647412 (=> (not res!419512) (not e!371217))))

(assert (=> b!647412 (= res!419512 (validKeyInArray!0 (select (arr!18457 lt!300370) j!136)))))

(declare-fun b!647413 () Bool)

(assert (=> b!647413 (= e!371217 (contains!3153 Nil!12495 (select (arr!18457 lt!300370) j!136)))))

(declare-fun b!647414 () Bool)

(assert (=> b!647414 (= e!371218 e!371215)))

(declare-fun c!74317 () Bool)

(assert (=> b!647414 (= c!74317 (validKeyInArray!0 (select (arr!18457 lt!300370) j!136)))))

(declare-fun bm!33685 () Bool)

(assert (=> bm!33685 (= call!33688 (arrayNoDuplicates!0 lt!300370 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74317 (Cons!12494 (select (arr!18457 lt!300370) j!136) Nil!12495) Nil!12495)))))

(assert (= (and d!91569 (not res!419511)) b!647412))

(assert (= (and b!647412 res!419512) b!647413))

(assert (= (and b!647412 res!419510) b!647414))

(assert (= (and b!647414 c!74317) b!647411))

(assert (= (and b!647414 (not c!74317)) b!647410))

(assert (= (or b!647411 b!647410) bm!33685))

(assert (=> b!647412 m!620839))

(assert (=> b!647412 m!620839))

(declare-fun m!620861 () Bool)

(assert (=> b!647412 m!620861))

(assert (=> b!647413 m!620839))

(assert (=> b!647413 m!620839))

(declare-fun m!620863 () Bool)

(assert (=> b!647413 m!620863))

(assert (=> b!647414 m!620839))

(assert (=> b!647414 m!620839))

(assert (=> b!647414 m!620861))

(assert (=> bm!33685 m!620839))

(declare-fun m!620865 () Bool)

(assert (=> bm!33685 m!620865))

(assert (=> b!647260 d!91569))

(declare-fun d!91571 () Bool)

(declare-fun e!371221 () Bool)

(assert (=> d!91571 e!371221))

(declare-fun res!419515 () Bool)

(assert (=> d!91571 (=> (not res!419515) (not e!371221))))

(assert (=> d!91571 (= res!419515 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18821 a!2986))))))

(declare-fun lt!300443 () Unit!22008)

(declare-fun choose!41 (array!38496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12498) Unit!22008)

(assert (=> d!91571 (= lt!300443 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12495))))

(assert (=> d!91571 (bvslt (size!18821 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91571 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12495) lt!300443)))

(declare-fun b!647417 () Bool)

(assert (=> b!647417 (= e!371221 (arrayNoDuplicates!0 (array!38497 (store (arr!18457 a!2986) i!1108 k0!1786) (size!18821 a!2986)) #b00000000000000000000000000000000 Nil!12495))))

(assert (= (and d!91571 res!419515) b!647417))

(declare-fun m!620867 () Bool)

(assert (=> d!91571 m!620867))

(assert (=> b!647417 m!620665))

(declare-fun m!620869 () Bool)

(assert (=> b!647417 m!620869))

(assert (=> b!647260 d!91571))

(declare-fun b!647464 () Bool)

(declare-fun e!371252 () SeekEntryResult!6897)

(assert (=> b!647464 (= e!371252 Undefined!6897)))

(declare-fun d!91573 () Bool)

(declare-fun lt!300458 () SeekEntryResult!6897)

(assert (=> d!91573 (and (or ((_ is Undefined!6897) lt!300458) (not ((_ is Found!6897) lt!300458)) (and (bvsge (index!29930 lt!300458) #b00000000000000000000000000000000) (bvslt (index!29930 lt!300458) (size!18821 a!2986)))) (or ((_ is Undefined!6897) lt!300458) ((_ is Found!6897) lt!300458) (not ((_ is MissingZero!6897) lt!300458)) (and (bvsge (index!29929 lt!300458) #b00000000000000000000000000000000) (bvslt (index!29929 lt!300458) (size!18821 a!2986)))) (or ((_ is Undefined!6897) lt!300458) ((_ is Found!6897) lt!300458) ((_ is MissingZero!6897) lt!300458) (not ((_ is MissingVacant!6897) lt!300458)) (and (bvsge (index!29932 lt!300458) #b00000000000000000000000000000000) (bvslt (index!29932 lt!300458) (size!18821 a!2986)))) (or ((_ is Undefined!6897) lt!300458) (ite ((_ is Found!6897) lt!300458) (= (select (arr!18457 a!2986) (index!29930 lt!300458)) k0!1786) (ite ((_ is MissingZero!6897) lt!300458) (= (select (arr!18457 a!2986) (index!29929 lt!300458)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6897) lt!300458) (= (select (arr!18457 a!2986) (index!29932 lt!300458)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91573 (= lt!300458 e!371252)))

(declare-fun c!74337 () Bool)

(declare-fun lt!300456 () SeekEntryResult!6897)

(assert (=> d!91573 (= c!74337 (and ((_ is Intermediate!6897) lt!300456) (undefined!7709 lt!300456)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38496 (_ BitVec 32)) SeekEntryResult!6897)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91573 (= lt!300456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91573 (validMask!0 mask!3053)))

(assert (=> d!91573 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300458)))

(declare-fun b!647465 () Bool)

(declare-fun e!371251 () SeekEntryResult!6897)

(assert (=> b!647465 (= e!371251 (Found!6897 (index!29931 lt!300456)))))

(declare-fun b!647466 () Bool)

(declare-fun e!371253 () SeekEntryResult!6897)

(assert (=> b!647466 (= e!371253 (MissingZero!6897 (index!29931 lt!300456)))))

(declare-fun b!647467 () Bool)

(assert (=> b!647467 (= e!371253 (seekKeyOrZeroReturnVacant!0 (x!58708 lt!300456) (index!29931 lt!300456) (index!29931 lt!300456) k0!1786 a!2986 mask!3053))))

(declare-fun b!647468 () Bool)

(declare-fun c!74336 () Bool)

(declare-fun lt!300457 () (_ BitVec 64))

(assert (=> b!647468 (= c!74336 (= lt!300457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647468 (= e!371251 e!371253)))

(declare-fun b!647469 () Bool)

(assert (=> b!647469 (= e!371252 e!371251)))

(assert (=> b!647469 (= lt!300457 (select (arr!18457 a!2986) (index!29931 lt!300456)))))

(declare-fun c!74335 () Bool)

(assert (=> b!647469 (= c!74335 (= lt!300457 k0!1786))))

(assert (= (and d!91573 c!74337) b!647464))

(assert (= (and d!91573 (not c!74337)) b!647469))

(assert (= (and b!647469 c!74335) b!647465))

(assert (= (and b!647469 (not c!74335)) b!647468))

(assert (= (and b!647468 c!74336) b!647466))

(assert (= (and b!647468 (not c!74336)) b!647467))

(declare-fun m!620881 () Bool)

(assert (=> d!91573 m!620881))

(assert (=> d!91573 m!620727))

(declare-fun m!620883 () Bool)

(assert (=> d!91573 m!620883))

(declare-fun m!620885 () Bool)

(assert (=> d!91573 m!620885))

(assert (=> d!91573 m!620883))

(declare-fun m!620887 () Bool)

(assert (=> d!91573 m!620887))

(declare-fun m!620889 () Bool)

(assert (=> d!91573 m!620889))

(declare-fun m!620891 () Bool)

(assert (=> b!647467 m!620891))

(declare-fun m!620893 () Bool)

(assert (=> b!647469 m!620893))

(assert (=> b!647249 d!91573))

(declare-fun d!91581 () Bool)

(declare-fun lt!300459 () Bool)

(assert (=> d!91581 (= lt!300459 (select (content!248 Nil!12495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371258 () Bool)

(assert (=> d!91581 (= lt!300459 e!371258)))

(declare-fun res!419532 () Bool)

(assert (=> d!91581 (=> (not res!419532) (not e!371258))))

(assert (=> d!91581 (= res!419532 ((_ is Cons!12494) Nil!12495))))

(assert (=> d!91581 (= (contains!3153 Nil!12495 #b0000000000000000000000000000000000000000000000000000000000000000) lt!300459)))

(declare-fun b!647475 () Bool)

(declare-fun e!371259 () Bool)

(assert (=> b!647475 (= e!371258 e!371259)))

(declare-fun res!419531 () Bool)

(assert (=> b!647475 (=> res!419531 e!371259)))

(assert (=> b!647475 (= res!419531 (= (h!13539 Nil!12495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647476 () Bool)

(assert (=> b!647476 (= e!371259 (contains!3153 (t!18726 Nil!12495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91581 res!419532) b!647475))

(assert (= (and b!647475 (not res!419531)) b!647476))

(assert (=> d!91581 m!620827))

(declare-fun m!620903 () Bool)

(assert (=> d!91581 m!620903))

(declare-fun m!620905 () Bool)

(assert (=> b!647476 m!620905))

(assert (=> b!647264 d!91581))

(declare-fun e!371292 () SeekEntryResult!6897)

(declare-fun b!647523 () Bool)

(assert (=> b!647523 (= e!371292 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!300474 () SeekEntryResult!6897)

(declare-fun d!91585 () Bool)

(assert (=> d!91585 (and (or ((_ is Undefined!6897) lt!300474) (not ((_ is Found!6897) lt!300474)) (and (bvsge (index!29930 lt!300474) #b00000000000000000000000000000000) (bvslt (index!29930 lt!300474) (size!18821 a!2986)))) (or ((_ is Undefined!6897) lt!300474) ((_ is Found!6897) lt!300474) (not ((_ is MissingVacant!6897) lt!300474)) (not (= (index!29932 lt!300474) vacantSpotIndex!68)) (and (bvsge (index!29932 lt!300474) #b00000000000000000000000000000000) (bvslt (index!29932 lt!300474) (size!18821 a!2986)))) (or ((_ is Undefined!6897) lt!300474) (ite ((_ is Found!6897) lt!300474) (= (select (arr!18457 a!2986) (index!29930 lt!300474)) (select (arr!18457 a!2986) j!136)) (and ((_ is MissingVacant!6897) lt!300474) (= (index!29932 lt!300474) vacantSpotIndex!68) (= (select (arr!18457 a!2986) (index!29932 lt!300474)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!371291 () SeekEntryResult!6897)

(assert (=> d!91585 (= lt!300474 e!371291)))

(declare-fun c!74354 () Bool)

(assert (=> d!91585 (= c!74354 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300473 () (_ BitVec 64))

(assert (=> d!91585 (= lt!300473 (select (arr!18457 a!2986) index!984))))

(assert (=> d!91585 (validMask!0 mask!3053)))

(assert (=> d!91585 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053) lt!300474)))

(declare-fun b!647524 () Bool)

(assert (=> b!647524 (= e!371292 (MissingVacant!6897 vacantSpotIndex!68))))

(declare-fun b!647525 () Bool)

(declare-fun c!74356 () Bool)

(assert (=> b!647525 (= c!74356 (= lt!300473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371293 () SeekEntryResult!6897)

(assert (=> b!647525 (= e!371293 e!371292)))

(declare-fun b!647526 () Bool)

(assert (=> b!647526 (= e!371291 Undefined!6897)))

(declare-fun b!647527 () Bool)

(assert (=> b!647527 (= e!371293 (Found!6897 index!984))))

(declare-fun b!647528 () Bool)

(assert (=> b!647528 (= e!371291 e!371293)))

(declare-fun c!74355 () Bool)

(assert (=> b!647528 (= c!74355 (= lt!300473 (select (arr!18457 a!2986) j!136)))))

(assert (= (and d!91585 c!74354) b!647526))

(assert (= (and d!91585 (not c!74354)) b!647528))

(assert (= (and b!647528 c!74355) b!647527))

(assert (= (and b!647528 (not c!74355)) b!647525))

(assert (= (and b!647525 c!74356) b!647524))

(assert (= (and b!647525 (not c!74356)) b!647523))

(assert (=> b!647523 m!620675))

(assert (=> b!647523 m!620675))

(assert (=> b!647523 m!620669))

(declare-fun m!620937 () Bool)

(assert (=> b!647523 m!620937))

(declare-fun m!620939 () Bool)

(assert (=> d!91585 m!620939))

(declare-fun m!620941 () Bool)

(assert (=> d!91585 m!620941))

(assert (=> d!91585 m!620707))

(assert (=> d!91585 m!620727))

(assert (=> b!647253 d!91585))

(assert (=> b!647263 d!91555))

(assert (=> b!647273 d!91531))

(declare-fun b!647529 () Bool)

(declare-fun e!371295 () SeekEntryResult!6897)

(assert (=> b!647529 (= e!371295 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300355 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!300476 () SeekEntryResult!6897)

(declare-fun d!91599 () Bool)

(assert (=> d!91599 (and (or ((_ is Undefined!6897) lt!300476) (not ((_ is Found!6897) lt!300476)) (and (bvsge (index!29930 lt!300476) #b00000000000000000000000000000000) (bvslt (index!29930 lt!300476) (size!18821 a!2986)))) (or ((_ is Undefined!6897) lt!300476) ((_ is Found!6897) lt!300476) (not ((_ is MissingVacant!6897) lt!300476)) (not (= (index!29932 lt!300476) vacantSpotIndex!68)) (and (bvsge (index!29932 lt!300476) #b00000000000000000000000000000000) (bvslt (index!29932 lt!300476) (size!18821 a!2986)))) (or ((_ is Undefined!6897) lt!300476) (ite ((_ is Found!6897) lt!300476) (= (select (arr!18457 a!2986) (index!29930 lt!300476)) (select (arr!18457 a!2986) j!136)) (and ((_ is MissingVacant!6897) lt!300476) (= (index!29932 lt!300476) vacantSpotIndex!68) (= (select (arr!18457 a!2986) (index!29932 lt!300476)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!371294 () SeekEntryResult!6897)

(assert (=> d!91599 (= lt!300476 e!371294)))

(declare-fun c!74357 () Bool)

(assert (=> d!91599 (= c!74357 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!300475 () (_ BitVec 64))

(assert (=> d!91599 (= lt!300475 (select (arr!18457 a!2986) lt!300355))))

(assert (=> d!91599 (validMask!0 mask!3053)))

(assert (=> d!91599 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053) lt!300476)))

(declare-fun b!647530 () Bool)

(assert (=> b!647530 (= e!371295 (MissingVacant!6897 vacantSpotIndex!68))))

(declare-fun b!647531 () Bool)

(declare-fun c!74359 () Bool)

(assert (=> b!647531 (= c!74359 (= lt!300475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371296 () SeekEntryResult!6897)

(assert (=> b!647531 (= e!371296 e!371295)))

(declare-fun b!647532 () Bool)

(assert (=> b!647532 (= e!371294 Undefined!6897)))

(declare-fun b!647533 () Bool)

(assert (=> b!647533 (= e!371296 (Found!6897 lt!300355))))

(declare-fun b!647534 () Bool)

(assert (=> b!647534 (= e!371294 e!371296)))

(declare-fun c!74358 () Bool)

(assert (=> b!647534 (= c!74358 (= lt!300475 (select (arr!18457 a!2986) j!136)))))

(assert (= (and d!91599 c!74357) b!647532))

(assert (= (and d!91599 (not c!74357)) b!647534))

(assert (= (and b!647534 c!74358) b!647533))

(assert (= (and b!647534 (not c!74358)) b!647531))

(assert (= (and b!647531 c!74359) b!647530))

(assert (= (and b!647531 (not c!74359)) b!647529))

(declare-fun m!620943 () Bool)

(assert (=> b!647529 m!620943))

(assert (=> b!647529 m!620943))

(assert (=> b!647529 m!620669))

(declare-fun m!620945 () Bool)

(assert (=> b!647529 m!620945))

(declare-fun m!620947 () Bool)

(assert (=> d!91599 m!620947))

(declare-fun m!620949 () Bool)

(assert (=> d!91599 m!620949))

(declare-fun m!620951 () Bool)

(assert (=> d!91599 m!620951))

(assert (=> d!91599 m!620727))

(assert (=> b!647262 d!91599))

(declare-fun b!647535 () Bool)

(declare-fun e!371298 () SeekEntryResult!6897)

(assert (=> b!647535 (= e!371298 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!300356 lt!300370 mask!3053))))

(declare-fun d!91601 () Bool)

(declare-fun lt!300478 () SeekEntryResult!6897)

(assert (=> d!91601 (and (or ((_ is Undefined!6897) lt!300478) (not ((_ is Found!6897) lt!300478)) (and (bvsge (index!29930 lt!300478) #b00000000000000000000000000000000) (bvslt (index!29930 lt!300478) (size!18821 lt!300370)))) (or ((_ is Undefined!6897) lt!300478) ((_ is Found!6897) lt!300478) (not ((_ is MissingVacant!6897) lt!300478)) (not (= (index!29932 lt!300478) vacantSpotIndex!68)) (and (bvsge (index!29932 lt!300478) #b00000000000000000000000000000000) (bvslt (index!29932 lt!300478) (size!18821 lt!300370)))) (or ((_ is Undefined!6897) lt!300478) (ite ((_ is Found!6897) lt!300478) (= (select (arr!18457 lt!300370) (index!29930 lt!300478)) lt!300356) (and ((_ is MissingVacant!6897) lt!300478) (= (index!29932 lt!300478) vacantSpotIndex!68) (= (select (arr!18457 lt!300370) (index!29932 lt!300478)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!371297 () SeekEntryResult!6897)

(assert (=> d!91601 (= lt!300478 e!371297)))

(declare-fun c!74360 () Bool)

(assert (=> d!91601 (= c!74360 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300477 () (_ BitVec 64))

(assert (=> d!91601 (= lt!300477 (select (arr!18457 lt!300370) index!984))))

(assert (=> d!91601 (validMask!0 mask!3053)))

(assert (=> d!91601 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300356 lt!300370 mask!3053) lt!300478)))

(declare-fun b!647536 () Bool)

(assert (=> b!647536 (= e!371298 (MissingVacant!6897 vacantSpotIndex!68))))

(declare-fun b!647537 () Bool)

(declare-fun c!74362 () Bool)

(assert (=> b!647537 (= c!74362 (= lt!300477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371299 () SeekEntryResult!6897)

(assert (=> b!647537 (= e!371299 e!371298)))

(declare-fun b!647538 () Bool)

(assert (=> b!647538 (= e!371297 Undefined!6897)))

(declare-fun b!647539 () Bool)

(assert (=> b!647539 (= e!371299 (Found!6897 index!984))))

(declare-fun b!647540 () Bool)

(assert (=> b!647540 (= e!371297 e!371299)))

(declare-fun c!74361 () Bool)

(assert (=> b!647540 (= c!74361 (= lt!300477 lt!300356))))

(assert (= (and d!91601 c!74360) b!647538))

(assert (= (and d!91601 (not c!74360)) b!647540))

(assert (= (and b!647540 c!74361) b!647539))

(assert (= (and b!647540 (not c!74361)) b!647537))

(assert (= (and b!647537 c!74362) b!647536))

(assert (= (and b!647537 (not c!74362)) b!647535))

(assert (=> b!647535 m!620675))

(assert (=> b!647535 m!620675))

(declare-fun m!620953 () Bool)

(assert (=> b!647535 m!620953))

(declare-fun m!620955 () Bool)

(assert (=> d!91601 m!620955))

(declare-fun m!620957 () Bool)

(assert (=> d!91601 m!620957))

(assert (=> d!91601 m!620801))

(assert (=> d!91601 m!620727))

(assert (=> b!647262 d!91601))

(declare-fun b!647541 () Bool)

(declare-fun e!371301 () SeekEntryResult!6897)

(assert (=> b!647541 (= e!371301 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300355 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!300356 lt!300370 mask!3053))))

(declare-fun lt!300480 () SeekEntryResult!6897)

(declare-fun d!91603 () Bool)

(assert (=> d!91603 (and (or ((_ is Undefined!6897) lt!300480) (not ((_ is Found!6897) lt!300480)) (and (bvsge (index!29930 lt!300480) #b00000000000000000000000000000000) (bvslt (index!29930 lt!300480) (size!18821 lt!300370)))) (or ((_ is Undefined!6897) lt!300480) ((_ is Found!6897) lt!300480) (not ((_ is MissingVacant!6897) lt!300480)) (not (= (index!29932 lt!300480) vacantSpotIndex!68)) (and (bvsge (index!29932 lt!300480) #b00000000000000000000000000000000) (bvslt (index!29932 lt!300480) (size!18821 lt!300370)))) (or ((_ is Undefined!6897) lt!300480) (ite ((_ is Found!6897) lt!300480) (= (select (arr!18457 lt!300370) (index!29930 lt!300480)) lt!300356) (and ((_ is MissingVacant!6897) lt!300480) (= (index!29932 lt!300480) vacantSpotIndex!68) (= (select (arr!18457 lt!300370) (index!29932 lt!300480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!371300 () SeekEntryResult!6897)

(assert (=> d!91603 (= lt!300480 e!371300)))

(declare-fun c!74363 () Bool)

(assert (=> d!91603 (= c!74363 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!300479 () (_ BitVec 64))

(assert (=> d!91603 (= lt!300479 (select (arr!18457 lt!300370) lt!300355))))

(assert (=> d!91603 (validMask!0 mask!3053)))

(assert (=> d!91603 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 lt!300356 lt!300370 mask!3053) lt!300480)))

(declare-fun b!647542 () Bool)

(assert (=> b!647542 (= e!371301 (MissingVacant!6897 vacantSpotIndex!68))))

(declare-fun b!647543 () Bool)

(declare-fun c!74365 () Bool)

(assert (=> b!647543 (= c!74365 (= lt!300479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371302 () SeekEntryResult!6897)

(assert (=> b!647543 (= e!371302 e!371301)))

(declare-fun b!647544 () Bool)

(assert (=> b!647544 (= e!371300 Undefined!6897)))

(declare-fun b!647545 () Bool)

(assert (=> b!647545 (= e!371302 (Found!6897 lt!300355))))

(declare-fun b!647546 () Bool)

(assert (=> b!647546 (= e!371300 e!371302)))

(declare-fun c!74364 () Bool)

(assert (=> b!647546 (= c!74364 (= lt!300479 lt!300356))))

(assert (= (and d!91603 c!74363) b!647544))

(assert (= (and d!91603 (not c!74363)) b!647546))

(assert (= (and b!647546 c!74364) b!647545))

(assert (= (and b!647546 (not c!74364)) b!647543))

(assert (= (and b!647543 c!74365) b!647542))

(assert (= (and b!647543 (not c!74365)) b!647541))

(assert (=> b!647541 m!620943))

(assert (=> b!647541 m!620943))

(declare-fun m!620959 () Bool)

(assert (=> b!647541 m!620959))

(declare-fun m!620961 () Bool)

(assert (=> d!91603 m!620961))

(declare-fun m!620963 () Bool)

(assert (=> d!91603 m!620963))

(declare-fun m!620965 () Bool)

(assert (=> d!91603 m!620965))

(assert (=> d!91603 m!620727))

(assert (=> b!647262 d!91603))

(declare-fun d!91605 () Bool)

(declare-fun e!371320 () Bool)

(assert (=> d!91605 e!371320))

(declare-fun res!419555 () Bool)

(assert (=> d!91605 (=> (not res!419555) (not e!371320))))

(assert (=> d!91605 (= res!419555 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18821 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18821 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18821 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18821 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18821 a!2986))))))

(declare-fun lt!300498 () Unit!22008)

(declare-fun choose!9 (array!38496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22008)

(assert (=> d!91605 (= lt!300498 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91605 (validMask!0 mask!3053)))

(assert (=> d!91605 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 mask!3053) lt!300498)))

(declare-fun b!647575 () Bool)

(assert (=> b!647575 (= e!371320 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300355 vacantSpotIndex!68 (select (store (arr!18457 a!2986) i!1108 k0!1786) j!136) (array!38497 (store (arr!18457 a!2986) i!1108 k0!1786) (size!18821 a!2986)) mask!3053)))))

(assert (= (and d!91605 res!419555) b!647575))

(declare-fun m!620981 () Bool)

(assert (=> d!91605 m!620981))

(assert (=> d!91605 m!620727))

(assert (=> b!647575 m!620669))

(assert (=> b!647575 m!620683))

(assert (=> b!647575 m!620677))

(declare-fun m!620983 () Bool)

(assert (=> b!647575 m!620983))

(assert (=> b!647575 m!620665))

(assert (=> b!647575 m!620677))

(assert (=> b!647575 m!620669))

(assert (=> b!647262 d!91605))

(declare-fun d!91613 () Bool)

(declare-fun lt!300504 () (_ BitVec 32))

(assert (=> d!91613 (and (bvsge lt!300504 #b00000000000000000000000000000000) (bvslt lt!300504 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91613 (= lt!300504 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91613 (validMask!0 mask!3053)))

(assert (=> d!91613 (= (nextIndex!0 index!984 x!910 mask!3053) lt!300504)))

(declare-fun bs!19340 () Bool)

(assert (= bs!19340 d!91613))

(declare-fun m!620995 () Bool)

(assert (=> bs!19340 m!620995))

(assert (=> bs!19340 m!620727))

(assert (=> b!647262 d!91613))

(check-sat (not b!647476) (not d!91613) (not d!91565) (not b!647529) (not b!647371) (not b!647357) (not b!647467) (not b!647398) (not b!647413) (not d!91603) (not b!647407) (not d!91585) (not b!647402) (not d!91547) (not b!647391) (not bm!33685) (not d!91553) (not d!91573) (not b!647575) (not bm!33680) (not b!647541) (not bm!33683) (not d!91581) (not d!91601) (not b!647405) (not d!91571) (not b!647390) (not b!647412) (not d!91599) (not b!647376) (not d!91563) (not b!647368) (not b!647377) (not b!647392) (not b!647417) (not b!647367) (not b!647406) (not d!91605) (not b!647535) (not b!647409) (not b!647523) (not bm!33684) (not b!647400) (not d!91559) (not b!647414))
(check-sat)
