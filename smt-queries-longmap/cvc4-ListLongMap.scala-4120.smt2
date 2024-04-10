; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56222 () Bool)

(assert start!56222)

(declare-fun b!623513 () Bool)

(declare-fun res!401862 () Bool)

(declare-fun e!357646 () Bool)

(assert (=> b!623513 (=> (not res!401862) (not e!357646))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37692 0))(
  ( (array!37693 (arr!18092 (Array (_ BitVec 32) (_ BitVec 64))) (size!18456 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37692)

(assert (=> b!623513 (= res!401862 (and (= (size!18456 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18456 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18456 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623514 () Bool)

(declare-fun res!401855 () Bool)

(declare-fun e!357652 () Bool)

(assert (=> b!623514 (=> (not res!401855) (not e!357652))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623514 (= res!401855 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18092 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623515 () Bool)

(declare-datatypes ((Unit!21048 0))(
  ( (Unit!21049) )
))
(declare-fun e!357644 () Unit!21048)

(declare-fun Unit!21050 () Unit!21048)

(assert (=> b!623515 (= e!357644 Unit!21050)))

(declare-fun b!623516 () Bool)

(declare-fun lt!289284 () array!37692)

(declare-fun e!357657 () Bool)

(declare-fun arrayContainsKey!0 (array!37692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623516 (= e!357657 (arrayContainsKey!0 lt!289284 (select (arr!18092 a!2986) j!136) index!984))))

(declare-fun res!401860 () Bool)

(declare-fun b!623518 () Bool)

(assert (=> b!623518 (= res!401860 (arrayContainsKey!0 lt!289284 (select (arr!18092 a!2986) j!136) j!136))))

(assert (=> b!623518 (=> (not res!401860) (not e!357657))))

(declare-fun e!357645 () Bool)

(assert (=> b!623518 (= e!357645 e!357657)))

(declare-fun b!623519 () Bool)

(declare-fun res!401866 () Bool)

(assert (=> b!623519 (=> (not res!401866) (not e!357646))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!623519 (= res!401866 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623520 () Bool)

(declare-fun e!357655 () Unit!21048)

(declare-fun Unit!21051 () Unit!21048)

(assert (=> b!623520 (= e!357655 Unit!21051)))

(declare-fun res!401858 () Bool)

(assert (=> b!623520 (= res!401858 (= (select (store (arr!18092 a!2986) i!1108 k!1786) index!984) (select (arr!18092 a!2986) j!136)))))

(declare-fun e!357654 () Bool)

(assert (=> b!623520 (=> (not res!401858) (not e!357654))))

(assert (=> b!623520 e!357654))

(declare-fun c!71198 () Bool)

(assert (=> b!623520 (= c!71198 (bvslt j!136 index!984))))

(declare-fun lt!289296 () Unit!21048)

(declare-fun e!357647 () Unit!21048)

(assert (=> b!623520 (= lt!289296 e!357647)))

(declare-fun c!71199 () Bool)

(assert (=> b!623520 (= c!71199 (bvslt index!984 j!136))))

(declare-fun lt!289293 () Unit!21048)

(declare-fun e!357651 () Unit!21048)

(assert (=> b!623520 (= lt!289293 e!357651)))

(assert (=> b!623520 false))

(declare-fun b!623521 () Bool)

(declare-fun res!401857 () Bool)

(assert (=> b!623521 (=> (not res!401857) (not e!357652))))

(declare-datatypes ((List!12133 0))(
  ( (Nil!12130) (Cons!12129 (h!13174 (_ BitVec 64)) (t!18361 List!12133)) )
))
(declare-fun arrayNoDuplicates!0 (array!37692 (_ BitVec 32) List!12133) Bool)

(assert (=> b!623521 (= res!401857 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12130))))

(declare-fun b!623522 () Bool)

(declare-fun e!357649 () Bool)

(declare-fun lt!289283 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623522 (= e!357649 (validKeyInArray!0 lt!289283))))

(declare-fun b!623523 () Bool)

(assert (=> b!623523 false))

(declare-fun lt!289288 () Unit!21048)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37692 (_ BitVec 64) (_ BitVec 32) List!12133) Unit!21048)

(assert (=> b!623523 (= lt!289288 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289284 (select (arr!18092 a!2986) j!136) j!136 Nil!12130))))

(assert (=> b!623523 (arrayNoDuplicates!0 lt!289284 j!136 Nil!12130)))

(declare-fun lt!289297 () Unit!21048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37692 (_ BitVec 32) (_ BitVec 32)) Unit!21048)

(assert (=> b!623523 (= lt!289297 (lemmaNoDuplicateFromThenFromBigger!0 lt!289284 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623523 (arrayNoDuplicates!0 lt!289284 #b00000000000000000000000000000000 Nil!12130)))

(declare-fun lt!289291 () Unit!21048)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12133) Unit!21048)

(assert (=> b!623523 (= lt!289291 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12130))))

(assert (=> b!623523 (arrayContainsKey!0 lt!289284 (select (arr!18092 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!289289 () Unit!21048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21048)

(assert (=> b!623523 (= lt!289289 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289284 (select (arr!18092 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!21052 () Unit!21048)

(assert (=> b!623523 (= e!357647 Unit!21052)))

(declare-fun b!623524 () Bool)

(declare-fun res!401864 () Bool)

(assert (=> b!623524 (=> (not res!401864) (not e!357652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37692 (_ BitVec 32)) Bool)

(assert (=> b!623524 (= res!401864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623525 () Bool)

(declare-fun e!357656 () Bool)

(assert (=> b!623525 (= e!357652 e!357656)))

(declare-fun res!401851 () Bool)

(assert (=> b!623525 (=> (not res!401851) (not e!357656))))

(assert (=> b!623525 (= res!401851 (= (select (store (arr!18092 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623525 (= lt!289284 (array!37693 (store (arr!18092 a!2986) i!1108 k!1786) (size!18456 a!2986)))))

(declare-fun b!623526 () Bool)

(declare-fun e!357653 () Bool)

(assert (=> b!623526 (= e!357653 (arrayContainsKey!0 lt!289284 (select (arr!18092 a!2986) j!136) index!984))))

(declare-fun b!623527 () Bool)

(declare-fun res!401859 () Bool)

(assert (=> b!623527 (=> (not res!401859) (not e!357646))))

(assert (=> b!623527 (= res!401859 (validKeyInArray!0 (select (arr!18092 a!2986) j!136)))))

(declare-fun b!623528 () Bool)

(declare-fun res!401861 () Bool)

(assert (=> b!623528 (= res!401861 (bvsge j!136 index!984))))

(assert (=> b!623528 (=> res!401861 e!357645)))

(assert (=> b!623528 (= e!357654 e!357645)))

(declare-fun b!623529 () Bool)

(declare-fun res!401852 () Bool)

(assert (=> b!623529 (=> (not res!401852) (not e!357646))))

(assert (=> b!623529 (= res!401852 (validKeyInArray!0 k!1786))))

(declare-fun b!623530 () Bool)

(assert (=> b!623530 (= e!357646 e!357652)))

(declare-fun res!401856 () Bool)

(assert (=> b!623530 (=> (not res!401856) (not e!357652))))

(declare-datatypes ((SeekEntryResult!6532 0))(
  ( (MissingZero!6532 (index!28412 (_ BitVec 32))) (Found!6532 (index!28413 (_ BitVec 32))) (Intermediate!6532 (undefined!7344 Bool) (index!28414 (_ BitVec 32)) (x!57172 (_ BitVec 32))) (Undefined!6532) (MissingVacant!6532 (index!28415 (_ BitVec 32))) )
))
(declare-fun lt!289292 () SeekEntryResult!6532)

(assert (=> b!623530 (= res!401856 (or (= lt!289292 (MissingZero!6532 i!1108)) (= lt!289292 (MissingVacant!6532 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37692 (_ BitVec 32)) SeekEntryResult!6532)

(assert (=> b!623530 (= lt!289292 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!623531 () Bool)

(declare-fun Unit!21053 () Unit!21048)

(assert (=> b!623531 (= e!357651 Unit!21053)))

(declare-fun b!623532 () Bool)

(declare-fun e!357650 () Bool)

(assert (=> b!623532 (= e!357656 e!357650)))

(declare-fun res!401854 () Bool)

(assert (=> b!623532 (=> (not res!401854) (not e!357650))))

(declare-fun lt!289281 () SeekEntryResult!6532)

(assert (=> b!623532 (= res!401854 (and (= lt!289281 (Found!6532 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18092 a!2986) index!984) (select (arr!18092 a!2986) j!136))) (not (= (select (arr!18092 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37692 (_ BitVec 32)) SeekEntryResult!6532)

(assert (=> b!623532 (= lt!289281 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18092 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623533 () Bool)

(declare-fun Unit!21054 () Unit!21048)

(assert (=> b!623533 (= e!357655 Unit!21054)))

(declare-fun b!623534 () Bool)

(declare-fun Unit!21055 () Unit!21048)

(assert (=> b!623534 (= e!357644 Unit!21055)))

(assert (=> b!623534 false))

(declare-fun b!623535 () Bool)

(declare-fun Unit!21056 () Unit!21048)

(assert (=> b!623535 (= e!357647 Unit!21056)))

(declare-fun b!623517 () Bool)

(assert (=> b!623517 false))

(declare-fun lt!289295 () Unit!21048)

(assert (=> b!623517 (= lt!289295 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289284 (select (arr!18092 a!2986) j!136) index!984 Nil!12130))))

(assert (=> b!623517 (arrayNoDuplicates!0 lt!289284 index!984 Nil!12130)))

(declare-fun lt!289290 () Unit!21048)

(assert (=> b!623517 (= lt!289290 (lemmaNoDuplicateFromThenFromBigger!0 lt!289284 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623517 (arrayNoDuplicates!0 lt!289284 #b00000000000000000000000000000000 Nil!12130)))

(declare-fun lt!289278 () Unit!21048)

(assert (=> b!623517 (= lt!289278 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12130))))

(assert (=> b!623517 (arrayContainsKey!0 lt!289284 (select (arr!18092 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!289287 () Unit!21048)

(assert (=> b!623517 (= lt!289287 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289284 (select (arr!18092 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623517 e!357653))

(declare-fun res!401865 () Bool)

(assert (=> b!623517 (=> (not res!401865) (not e!357653))))

(assert (=> b!623517 (= res!401865 (arrayContainsKey!0 lt!289284 (select (arr!18092 a!2986) j!136) j!136))))

(declare-fun Unit!21057 () Unit!21048)

(assert (=> b!623517 (= e!357651 Unit!21057)))

(declare-fun res!401853 () Bool)

(assert (=> start!56222 (=> (not res!401853) (not e!357646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56222 (= res!401853 (validMask!0 mask!3053))))

(assert (=> start!56222 e!357646))

(assert (=> start!56222 true))

(declare-fun array_inv!13888 (array!37692) Bool)

(assert (=> start!56222 (array_inv!13888 a!2986)))

(declare-fun b!623536 () Bool)

(assert (=> b!623536 (= e!357650 (not e!357649))))

(declare-fun res!401867 () Bool)

(assert (=> b!623536 (=> res!401867 e!357649)))

(declare-fun lt!289286 () SeekEntryResult!6532)

(assert (=> b!623536 (= res!401867 (or (= lt!289286 (MissingVacant!6532 vacantSpotIndex!68)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!289279 () Unit!21048)

(assert (=> b!623536 (= lt!289279 e!357655)))

(declare-fun c!71200 () Bool)

(assert (=> b!623536 (= c!71200 (= lt!289286 (Found!6532 index!984)))))

(declare-fun lt!289282 () Unit!21048)

(assert (=> b!623536 (= lt!289282 e!357644)))

(declare-fun c!71201 () Bool)

(assert (=> b!623536 (= c!71201 (= lt!289286 Undefined!6532))))

(assert (=> b!623536 (= lt!289286 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289283 lt!289284 mask!3053))))

(declare-fun e!357648 () Bool)

(assert (=> b!623536 e!357648))

(declare-fun res!401863 () Bool)

(assert (=> b!623536 (=> (not res!401863) (not e!357648))))

(declare-fun lt!289285 () (_ BitVec 32))

(declare-fun lt!289280 () SeekEntryResult!6532)

(assert (=> b!623536 (= res!401863 (= lt!289280 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289285 vacantSpotIndex!68 lt!289283 lt!289284 mask!3053)))))

(assert (=> b!623536 (= lt!289280 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289285 vacantSpotIndex!68 (select (arr!18092 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623536 (= lt!289283 (select (store (arr!18092 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!289294 () Unit!21048)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37692 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21048)

(assert (=> b!623536 (= lt!289294 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289285 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623536 (= lt!289285 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623537 () Bool)

(assert (=> b!623537 (= e!357648 (= lt!289281 lt!289280))))

(assert (= (and start!56222 res!401853) b!623513))

(assert (= (and b!623513 res!401862) b!623527))

(assert (= (and b!623527 res!401859) b!623529))

(assert (= (and b!623529 res!401852) b!623519))

(assert (= (and b!623519 res!401866) b!623530))

(assert (= (and b!623530 res!401856) b!623524))

(assert (= (and b!623524 res!401864) b!623521))

(assert (= (and b!623521 res!401857) b!623514))

(assert (= (and b!623514 res!401855) b!623525))

(assert (= (and b!623525 res!401851) b!623532))

(assert (= (and b!623532 res!401854) b!623536))

(assert (= (and b!623536 res!401863) b!623537))

(assert (= (and b!623536 c!71201) b!623534))

(assert (= (and b!623536 (not c!71201)) b!623515))

(assert (= (and b!623536 c!71200) b!623520))

(assert (= (and b!623536 (not c!71200)) b!623533))

(assert (= (and b!623520 res!401858) b!623528))

(assert (= (and b!623528 (not res!401861)) b!623518))

(assert (= (and b!623518 res!401860) b!623516))

(assert (= (and b!623520 c!71198) b!623523))

(assert (= (and b!623520 (not c!71198)) b!623535))

(assert (= (and b!623520 c!71199) b!623517))

(assert (= (and b!623520 (not c!71199)) b!623531))

(assert (= (and b!623517 res!401865) b!623526))

(assert (= (and b!623536 (not res!401867)) b!623522))

(declare-fun m!599345 () Bool)

(assert (=> b!623530 m!599345))

(declare-fun m!599347 () Bool)

(assert (=> b!623518 m!599347))

(assert (=> b!623518 m!599347))

(declare-fun m!599349 () Bool)

(assert (=> b!623518 m!599349))

(declare-fun m!599351 () Bool)

(assert (=> b!623522 m!599351))

(declare-fun m!599353 () Bool)

(assert (=> b!623524 m!599353))

(declare-fun m!599355 () Bool)

(assert (=> b!623536 m!599355))

(declare-fun m!599357 () Bool)

(assert (=> b!623536 m!599357))

(assert (=> b!623536 m!599347))

(declare-fun m!599359 () Bool)

(assert (=> b!623536 m!599359))

(assert (=> b!623536 m!599347))

(declare-fun m!599361 () Bool)

(assert (=> b!623536 m!599361))

(declare-fun m!599363 () Bool)

(assert (=> b!623536 m!599363))

(declare-fun m!599365 () Bool)

(assert (=> b!623536 m!599365))

(declare-fun m!599367 () Bool)

(assert (=> b!623536 m!599367))

(declare-fun m!599369 () Bool)

(assert (=> b!623521 m!599369))

(assert (=> b!623520 m!599361))

(declare-fun m!599371 () Bool)

(assert (=> b!623520 m!599371))

(assert (=> b!623520 m!599347))

(declare-fun m!599373 () Bool)

(assert (=> b!623514 m!599373))

(assert (=> b!623525 m!599361))

(declare-fun m!599375 () Bool)

(assert (=> b!623525 m!599375))

(declare-fun m!599377 () Bool)

(assert (=> b!623529 m!599377))

(declare-fun m!599379 () Bool)

(assert (=> b!623532 m!599379))

(assert (=> b!623532 m!599347))

(assert (=> b!623532 m!599347))

(declare-fun m!599381 () Bool)

(assert (=> b!623532 m!599381))

(assert (=> b!623526 m!599347))

(assert (=> b!623526 m!599347))

(declare-fun m!599383 () Bool)

(assert (=> b!623526 m!599383))

(assert (=> b!623527 m!599347))

(assert (=> b!623527 m!599347))

(declare-fun m!599385 () Bool)

(assert (=> b!623527 m!599385))

(assert (=> b!623523 m!599347))

(assert (=> b!623523 m!599347))

(declare-fun m!599387 () Bool)

(assert (=> b!623523 m!599387))

(declare-fun m!599389 () Bool)

(assert (=> b!623523 m!599389))

(declare-fun m!599391 () Bool)

(assert (=> b!623523 m!599391))

(assert (=> b!623523 m!599347))

(declare-fun m!599393 () Bool)

(assert (=> b!623523 m!599393))

(declare-fun m!599395 () Bool)

(assert (=> b!623523 m!599395))

(assert (=> b!623523 m!599347))

(declare-fun m!599397 () Bool)

(assert (=> b!623523 m!599397))

(declare-fun m!599399 () Bool)

(assert (=> b!623523 m!599399))

(declare-fun m!599401 () Bool)

(assert (=> b!623519 m!599401))

(declare-fun m!599403 () Bool)

(assert (=> start!56222 m!599403))

(declare-fun m!599405 () Bool)

(assert (=> start!56222 m!599405))

(assert (=> b!623517 m!599347))

(assert (=> b!623517 m!599347))

(declare-fun m!599407 () Bool)

(assert (=> b!623517 m!599407))

(declare-fun m!599409 () Bool)

(assert (=> b!623517 m!599409))

(declare-fun m!599411 () Bool)

(assert (=> b!623517 m!599411))

(assert (=> b!623517 m!599347))

(declare-fun m!599413 () Bool)

(assert (=> b!623517 m!599413))

(assert (=> b!623517 m!599391))

(assert (=> b!623517 m!599347))

(assert (=> b!623517 m!599349))

(assert (=> b!623517 m!599347))

(declare-fun m!599415 () Bool)

(assert (=> b!623517 m!599415))

(assert (=> b!623517 m!599399))

(assert (=> b!623516 m!599347))

(assert (=> b!623516 m!599347))

(assert (=> b!623516 m!599383))

(push 1)

