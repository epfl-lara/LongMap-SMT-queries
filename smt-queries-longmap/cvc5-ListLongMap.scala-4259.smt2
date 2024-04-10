; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59108 () Bool)

(assert start!59108)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!374425 () Bool)

(declare-datatypes ((array!38608 0))(
  ( (array!38609 (arr!18507 (Array (_ BitVec 32) (_ BitVec 64))) (size!18871 (_ BitVec 32))) )
))
(declare-fun lt!303565 () array!38608)

(declare-fun b!652363 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38608)

(declare-fun arrayContainsKey!0 (array!38608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652363 (= e!374425 (arrayContainsKey!0 lt!303565 (select (arr!18507 a!2986) j!136) index!984))))

(declare-fun b!652364 () Bool)

(declare-datatypes ((Unit!22308 0))(
  ( (Unit!22309) )
))
(declare-fun e!374432 () Unit!22308)

(declare-fun Unit!22310 () Unit!22308)

(assert (=> b!652364 (= e!374432 Unit!22310)))

(declare-fun b!652365 () Bool)

(declare-fun e!374430 () Bool)

(assert (=> b!652365 (= e!374430 (arrayContainsKey!0 lt!303565 (select (arr!18507 a!2986) j!136) index!984))))

(declare-fun b!652366 () Bool)

(declare-fun res!423052 () Bool)

(declare-fun e!374436 () Bool)

(assert (=> b!652366 (=> (not res!423052) (not e!374436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652366 (= res!423052 (validKeyInArray!0 (select (arr!18507 a!2986) j!136)))))

(declare-fun b!652367 () Bool)

(declare-fun e!374424 () Unit!22308)

(declare-fun Unit!22311 () Unit!22308)

(assert (=> b!652367 (= e!374424 Unit!22311)))

(declare-fun b!652368 () Bool)

(declare-fun e!374422 () Bool)

(assert (=> b!652368 (= e!374436 e!374422)))

(declare-fun res!423057 () Bool)

(assert (=> b!652368 (=> (not res!423057) (not e!374422))))

(declare-datatypes ((SeekEntryResult!6947 0))(
  ( (MissingZero!6947 (index!30141 (_ BitVec 32))) (Found!6947 (index!30142 (_ BitVec 32))) (Intermediate!6947 (undefined!7759 Bool) (index!30143 (_ BitVec 32)) (x!58930 (_ BitVec 32))) (Undefined!6947) (MissingVacant!6947 (index!30144 (_ BitVec 32))) )
))
(declare-fun lt!303554 () SeekEntryResult!6947)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!652368 (= res!423057 (or (= lt!303554 (MissingZero!6947 i!1108)) (= lt!303554 (MissingVacant!6947 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38608 (_ BitVec 32)) SeekEntryResult!6947)

(assert (=> b!652368 (= lt!303554 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!652369 () Bool)

(declare-fun res!423049 () Bool)

(assert (=> b!652369 (=> (not res!423049) (not e!374422))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!652369 (= res!423049 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18507 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652370 () Bool)

(declare-fun res!423060 () Bool)

(assert (=> b!652370 (=> (not res!423060) (not e!374436))))

(assert (=> b!652370 (= res!423060 (and (= (size!18871 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18871 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18871 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652371 () Bool)

(declare-fun e!374433 () Bool)

(declare-fun lt!303550 () SeekEntryResult!6947)

(declare-fun lt!303549 () SeekEntryResult!6947)

(assert (=> b!652371 (= e!374433 (= lt!303550 lt!303549))))

(declare-fun res!423059 () Bool)

(assert (=> start!59108 (=> (not res!423059) (not e!374436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59108 (= res!423059 (validMask!0 mask!3053))))

(assert (=> start!59108 e!374436))

(assert (=> start!59108 true))

(declare-fun array_inv!14303 (array!38608) Bool)

(assert (=> start!59108 (array_inv!14303 a!2986)))

(declare-fun b!652372 () Bool)

(declare-fun e!374429 () Bool)

(declare-fun e!374427 () Bool)

(assert (=> b!652372 (= e!374429 (not e!374427))))

(declare-fun res!423048 () Bool)

(assert (=> b!652372 (=> res!423048 e!374427)))

(declare-fun lt!303563 () SeekEntryResult!6947)

(assert (=> b!652372 (= res!423048 (not (= lt!303563 (Found!6947 index!984))))))

(declare-fun lt!303555 () Unit!22308)

(assert (=> b!652372 (= lt!303555 e!374424)))

(declare-fun c!75026 () Bool)

(assert (=> b!652372 (= c!75026 (= lt!303563 Undefined!6947))))

(declare-fun lt!303560 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38608 (_ BitVec 32)) SeekEntryResult!6947)

(assert (=> b!652372 (= lt!303563 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303560 lt!303565 mask!3053))))

(assert (=> b!652372 e!374433))

(declare-fun res!423047 () Bool)

(assert (=> b!652372 (=> (not res!423047) (not e!374433))))

(declare-fun lt!303564 () (_ BitVec 32))

(assert (=> b!652372 (= res!423047 (= lt!303549 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303564 vacantSpotIndex!68 lt!303560 lt!303565 mask!3053)))))

(assert (=> b!652372 (= lt!303549 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303564 vacantSpotIndex!68 (select (arr!18507 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652372 (= lt!303560 (select (store (arr!18507 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303548 () Unit!22308)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38608 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22308)

(assert (=> b!652372 (= lt!303548 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303564 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652372 (= lt!303564 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652373 () Bool)

(declare-fun e!374435 () Bool)

(assert (=> b!652373 (= e!374427 e!374435)))

(declare-fun res!423058 () Bool)

(assert (=> b!652373 (=> res!423058 e!374435)))

(declare-fun lt!303561 () (_ BitVec 64))

(assert (=> b!652373 (= res!423058 (or (not (= (select (arr!18507 a!2986) j!136) lt!303560)) (not (= (select (arr!18507 a!2986) j!136) lt!303561))))))

(declare-fun e!374434 () Bool)

(assert (=> b!652373 e!374434))

(declare-fun res!423062 () Bool)

(assert (=> b!652373 (=> (not res!423062) (not e!374434))))

(assert (=> b!652373 (= res!423062 (= lt!303561 (select (arr!18507 a!2986) j!136)))))

(assert (=> b!652373 (= lt!303561 (select (store (arr!18507 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!652374 () Bool)

(declare-fun e!374431 () Bool)

(assert (=> b!652374 (= e!374435 e!374431)))

(declare-fun res!423055 () Bool)

(assert (=> b!652374 (=> res!423055 e!374431)))

(assert (=> b!652374 (= res!423055 (bvsge index!984 j!136))))

(declare-fun lt!303552 () Unit!22308)

(assert (=> b!652374 (= lt!303552 e!374432)))

(declare-fun c!75025 () Bool)

(assert (=> b!652374 (= c!75025 (bvslt j!136 index!984))))

(declare-fun b!652375 () Bool)

(declare-fun e!374428 () Bool)

(assert (=> b!652375 (= e!374428 e!374429)))

(declare-fun res!423063 () Bool)

(assert (=> b!652375 (=> (not res!423063) (not e!374429))))

(assert (=> b!652375 (= res!423063 (and (= lt!303550 (Found!6947 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18507 a!2986) index!984) (select (arr!18507 a!2986) j!136))) (not (= (select (arr!18507 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652375 (= lt!303550 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18507 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652376 () Bool)

(assert (=> b!652376 (= e!374422 e!374428)))

(declare-fun res!423053 () Bool)

(assert (=> b!652376 (=> (not res!423053) (not e!374428))))

(assert (=> b!652376 (= res!423053 (= (select (store (arr!18507 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652376 (= lt!303565 (array!38609 (store (arr!18507 a!2986) i!1108 k!1786) (size!18871 a!2986)))))

(declare-fun b!652377 () Bool)

(declare-fun res!423054 () Bool)

(assert (=> b!652377 (=> (not res!423054) (not e!374436))))

(assert (=> b!652377 (= res!423054 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652378 () Bool)

(declare-fun res!423051 () Bool)

(assert (=> b!652378 (=> (not res!423051) (not e!374422))))

(declare-datatypes ((List!12548 0))(
  ( (Nil!12545) (Cons!12544 (h!13589 (_ BitVec 64)) (t!18776 List!12548)) )
))
(declare-fun arrayNoDuplicates!0 (array!38608 (_ BitVec 32) List!12548) Bool)

(assert (=> b!652378 (= res!423051 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12545))))

(declare-fun b!652379 () Bool)

(declare-fun Unit!22312 () Unit!22308)

(assert (=> b!652379 (= e!374424 Unit!22312)))

(assert (=> b!652379 false))

(declare-fun b!652380 () Bool)

(assert (=> b!652380 (= e!374431 (or (bvsge (size!18871 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18871 a!2986)) (bvslt index!984 (size!18871 a!2986))))))

(assert (=> b!652380 (arrayNoDuplicates!0 lt!303565 index!984 Nil!12545)))

(declare-fun lt!303558 () Unit!22308)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38608 (_ BitVec 32) (_ BitVec 32)) Unit!22308)

(assert (=> b!652380 (= lt!303558 (lemmaNoDuplicateFromThenFromBigger!0 lt!303565 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652380 (arrayNoDuplicates!0 lt!303565 #b00000000000000000000000000000000 Nil!12545)))

(declare-fun lt!303559 () Unit!22308)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12548) Unit!22308)

(assert (=> b!652380 (= lt!303559 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12545))))

(assert (=> b!652380 (arrayContainsKey!0 lt!303565 (select (arr!18507 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303557 () Unit!22308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22308)

(assert (=> b!652380 (= lt!303557 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303565 (select (arr!18507 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652380 e!374430))

(declare-fun res!423056 () Bool)

(assert (=> b!652380 (=> (not res!423056) (not e!374430))))

(assert (=> b!652380 (= res!423056 (arrayContainsKey!0 lt!303565 (select (arr!18507 a!2986) j!136) j!136))))

(declare-fun b!652381 () Bool)

(declare-fun e!374423 () Bool)

(assert (=> b!652381 (= e!374423 e!374425)))

(declare-fun res!423050 () Bool)

(assert (=> b!652381 (=> (not res!423050) (not e!374425))))

(assert (=> b!652381 (= res!423050 (arrayContainsKey!0 lt!303565 (select (arr!18507 a!2986) j!136) j!136))))

(declare-fun b!652382 () Bool)

(declare-fun res!423065 () Bool)

(assert (=> b!652382 (=> (not res!423065) (not e!374422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38608 (_ BitVec 32)) Bool)

(assert (=> b!652382 (= res!423065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652383 () Bool)

(declare-fun Unit!22313 () Unit!22308)

(assert (=> b!652383 (= e!374432 Unit!22313)))

(declare-fun lt!303553 () Unit!22308)

(assert (=> b!652383 (= lt!303553 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303565 (select (arr!18507 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652383 (arrayContainsKey!0 lt!303565 (select (arr!18507 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303562 () Unit!22308)

(assert (=> b!652383 (= lt!303562 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12545))))

(assert (=> b!652383 (arrayNoDuplicates!0 lt!303565 #b00000000000000000000000000000000 Nil!12545)))

(declare-fun lt!303551 () Unit!22308)

(assert (=> b!652383 (= lt!303551 (lemmaNoDuplicateFromThenFromBigger!0 lt!303565 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652383 (arrayNoDuplicates!0 lt!303565 j!136 Nil!12545)))

(declare-fun lt!303556 () Unit!22308)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38608 (_ BitVec 64) (_ BitVec 32) List!12548) Unit!22308)

(assert (=> b!652383 (= lt!303556 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303565 (select (arr!18507 a!2986) j!136) j!136 Nil!12545))))

(assert (=> b!652383 false))

(declare-fun b!652384 () Bool)

(declare-fun res!423064 () Bool)

(assert (=> b!652384 (=> (not res!423064) (not e!374436))))

(assert (=> b!652384 (= res!423064 (validKeyInArray!0 k!1786))))

(declare-fun b!652385 () Bool)

(assert (=> b!652385 (= e!374434 e!374423)))

(declare-fun res!423061 () Bool)

(assert (=> b!652385 (=> res!423061 e!374423)))

(assert (=> b!652385 (= res!423061 (or (not (= (select (arr!18507 a!2986) j!136) lt!303560)) (not (= (select (arr!18507 a!2986) j!136) lt!303561)) (bvsge j!136 index!984)))))

(assert (= (and start!59108 res!423059) b!652370))

(assert (= (and b!652370 res!423060) b!652366))

(assert (= (and b!652366 res!423052) b!652384))

(assert (= (and b!652384 res!423064) b!652377))

(assert (= (and b!652377 res!423054) b!652368))

(assert (= (and b!652368 res!423057) b!652382))

(assert (= (and b!652382 res!423065) b!652378))

(assert (= (and b!652378 res!423051) b!652369))

(assert (= (and b!652369 res!423049) b!652376))

(assert (= (and b!652376 res!423053) b!652375))

(assert (= (and b!652375 res!423063) b!652372))

(assert (= (and b!652372 res!423047) b!652371))

(assert (= (and b!652372 c!75026) b!652379))

(assert (= (and b!652372 (not c!75026)) b!652367))

(assert (= (and b!652372 (not res!423048)) b!652373))

(assert (= (and b!652373 res!423062) b!652385))

(assert (= (and b!652385 (not res!423061)) b!652381))

(assert (= (and b!652381 res!423050) b!652363))

(assert (= (and b!652373 (not res!423058)) b!652374))

(assert (= (and b!652374 c!75025) b!652383))

(assert (= (and b!652374 (not c!75025)) b!652364))

(assert (= (and b!652374 (not res!423055)) b!652380))

(assert (= (and b!652380 res!423056) b!652365))

(declare-fun m!625505 () Bool)

(assert (=> b!652384 m!625505))

(declare-fun m!625507 () Bool)

(assert (=> b!652382 m!625507))

(declare-fun m!625509 () Bool)

(assert (=> b!652372 m!625509))

(declare-fun m!625511 () Bool)

(assert (=> b!652372 m!625511))

(declare-fun m!625513 () Bool)

(assert (=> b!652372 m!625513))

(declare-fun m!625515 () Bool)

(assert (=> b!652372 m!625515))

(declare-fun m!625517 () Bool)

(assert (=> b!652372 m!625517))

(declare-fun m!625519 () Bool)

(assert (=> b!652372 m!625519))

(assert (=> b!652372 m!625513))

(declare-fun m!625521 () Bool)

(assert (=> b!652372 m!625521))

(declare-fun m!625523 () Bool)

(assert (=> b!652372 m!625523))

(declare-fun m!625525 () Bool)

(assert (=> b!652377 m!625525))

(declare-fun m!625527 () Bool)

(assert (=> b!652375 m!625527))

(assert (=> b!652375 m!625513))

(assert (=> b!652375 m!625513))

(declare-fun m!625529 () Bool)

(assert (=> b!652375 m!625529))

(declare-fun m!625531 () Bool)

(assert (=> b!652378 m!625531))

(assert (=> b!652381 m!625513))

(assert (=> b!652381 m!625513))

(declare-fun m!625533 () Bool)

(assert (=> b!652381 m!625533))

(assert (=> b!652373 m!625513))

(assert (=> b!652373 m!625515))

(declare-fun m!625535 () Bool)

(assert (=> b!652373 m!625535))

(declare-fun m!625537 () Bool)

(assert (=> start!59108 m!625537))

(declare-fun m!625539 () Bool)

(assert (=> start!59108 m!625539))

(assert (=> b!652366 m!625513))

(assert (=> b!652366 m!625513))

(declare-fun m!625541 () Bool)

(assert (=> b!652366 m!625541))

(assert (=> b!652365 m!625513))

(assert (=> b!652365 m!625513))

(declare-fun m!625543 () Bool)

(assert (=> b!652365 m!625543))

(declare-fun m!625545 () Bool)

(assert (=> b!652383 m!625545))

(declare-fun m!625547 () Bool)

(assert (=> b!652383 m!625547))

(assert (=> b!652383 m!625513))

(assert (=> b!652383 m!625513))

(declare-fun m!625549 () Bool)

(assert (=> b!652383 m!625549))

(declare-fun m!625551 () Bool)

(assert (=> b!652383 m!625551))

(assert (=> b!652383 m!625513))

(declare-fun m!625553 () Bool)

(assert (=> b!652383 m!625553))

(assert (=> b!652383 m!625513))

(declare-fun m!625555 () Bool)

(assert (=> b!652383 m!625555))

(declare-fun m!625557 () Bool)

(assert (=> b!652383 m!625557))

(declare-fun m!625559 () Bool)

(assert (=> b!652369 m!625559))

(assert (=> b!652363 m!625513))

(assert (=> b!652363 m!625513))

(assert (=> b!652363 m!625543))

(assert (=> b!652380 m!625513))

(assert (=> b!652380 m!625513))

(declare-fun m!625561 () Bool)

(assert (=> b!652380 m!625561))

(assert (=> b!652380 m!625513))

(declare-fun m!625563 () Bool)

(assert (=> b!652380 m!625563))

(declare-fun m!625565 () Bool)

(assert (=> b!652380 m!625565))

(assert (=> b!652380 m!625513))

(assert (=> b!652380 m!625533))

(assert (=> b!652380 m!625557))

(assert (=> b!652380 m!625545))

(declare-fun m!625567 () Bool)

(assert (=> b!652380 m!625567))

(assert (=> b!652385 m!625513))

(declare-fun m!625569 () Bool)

(assert (=> b!652368 m!625569))

(assert (=> b!652376 m!625515))

(declare-fun m!625571 () Bool)

(assert (=> b!652376 m!625571))

(push 1)

(assert (not b!652363))

(assert (not b!652368))

(assert (not b!652382))

(assert (not b!652365))

(assert (not b!652366))

(assert (not b!652372))

(assert (not b!652375))

(assert (not b!652381))

(assert (not b!652380))

(assert (not b!652377))

(assert (not b!652378))

(assert (not start!59108))

(assert (not b!652383))

(assert (not b!652384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

