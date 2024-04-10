; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54852 () Bool)

(assert start!54852)

(declare-fun b!599393 () Bool)

(declare-fun res!384390 () Bool)

(declare-fun e!342675 () Bool)

(assert (=> b!599393 (=> (not res!384390) (not e!342675))))

(declare-datatypes ((array!37087 0))(
  ( (array!37088 (arr!17803 (Array (_ BitVec 32) (_ BitVec 64))) (size!18167 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37087)

(declare-datatypes ((List!11844 0))(
  ( (Nil!11841) (Cons!11840 (h!12885 (_ BitVec 64)) (t!18072 List!11844)) )
))
(declare-fun arrayNoDuplicates!0 (array!37087 (_ BitVec 32) List!11844) Bool)

(assert (=> b!599393 (= res!384390 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11841))))

(declare-fun b!599394 () Bool)

(declare-fun e!342686 () Bool)

(declare-fun e!342677 () Bool)

(assert (=> b!599394 (= e!342686 e!342677)))

(declare-fun res!384381 () Bool)

(assert (=> b!599394 (=> res!384381 e!342677)))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!599394 (= res!384381 (or (bvsge (size!18167 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18167 a!2986))))))

(declare-fun lt!272474 () array!37087)

(assert (=> b!599394 (arrayNoDuplicates!0 lt!272474 j!136 Nil!11841)))

(declare-datatypes ((Unit!18890 0))(
  ( (Unit!18891) )
))
(declare-fun lt!272468 () Unit!18890)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37087 (_ BitVec 32) (_ BitVec 32)) Unit!18890)

(assert (=> b!599394 (= lt!272468 (lemmaNoDuplicateFromThenFromBigger!0 lt!272474 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599394 (arrayNoDuplicates!0 lt!272474 #b00000000000000000000000000000000 Nil!11841)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!272476 () Unit!18890)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37087 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11844) Unit!18890)

(assert (=> b!599394 (= lt!272476 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11841))))

(declare-fun arrayContainsKey!0 (array!37087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599394 (arrayContainsKey!0 lt!272474 (select (arr!17803 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272479 () Unit!18890)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37087 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18890)

(assert (=> b!599394 (= lt!272479 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272474 (select (arr!17803 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599395 () Bool)

(declare-fun res!384380 () Bool)

(declare-fun e!342679 () Bool)

(assert (=> b!599395 (=> (not res!384380) (not e!342679))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!599395 (= res!384380 (and (= (size!18167 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18167 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18167 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599396 () Bool)

(declare-fun res!384385 () Bool)

(assert (=> b!599396 (=> (not res!384385) (not e!342675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37087 (_ BitVec 32)) Bool)

(assert (=> b!599396 (= res!384385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599397 () Bool)

(declare-fun res!384386 () Bool)

(assert (=> b!599397 (=> res!384386 e!342677)))

(declare-fun contains!2960 (List!11844 (_ BitVec 64)) Bool)

(assert (=> b!599397 (= res!384386 (contains!2960 Nil!11841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599398 () Bool)

(declare-fun e!342684 () Bool)

(assert (=> b!599398 (= e!342684 (arrayContainsKey!0 lt!272474 (select (arr!17803 a!2986) j!136) index!984))))

(declare-fun b!599399 () Bool)

(assert (=> b!599399 (= e!342679 e!342675)))

(declare-fun res!384375 () Bool)

(assert (=> b!599399 (=> (not res!384375) (not e!342675))))

(declare-datatypes ((SeekEntryResult!6243 0))(
  ( (MissingZero!6243 (index!27229 (_ BitVec 32))) (Found!6243 (index!27230 (_ BitVec 32))) (Intermediate!6243 (undefined!7055 Bool) (index!27231 (_ BitVec 32)) (x!56034 (_ BitVec 32))) (Undefined!6243) (MissingVacant!6243 (index!27232 (_ BitVec 32))) )
))
(declare-fun lt!272475 () SeekEntryResult!6243)

(assert (=> b!599399 (= res!384375 (or (= lt!272475 (MissingZero!6243 i!1108)) (= lt!272475 (MissingVacant!6243 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37087 (_ BitVec 32)) SeekEntryResult!6243)

(assert (=> b!599399 (= lt!272475 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599400 () Bool)

(declare-fun e!342687 () Bool)

(declare-fun e!342681 () Bool)

(assert (=> b!599400 (= e!342687 (not e!342681))))

(declare-fun res!384392 () Bool)

(assert (=> b!599400 (=> res!384392 e!342681)))

(declare-fun lt!272469 () SeekEntryResult!6243)

(assert (=> b!599400 (= res!384392 (not (= lt!272469 (Found!6243 index!984))))))

(declare-fun lt!272471 () Unit!18890)

(declare-fun e!342680 () Unit!18890)

(assert (=> b!599400 (= lt!272471 e!342680)))

(declare-fun c!67877 () Bool)

(assert (=> b!599400 (= c!67877 (= lt!272469 Undefined!6243))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!272470 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37087 (_ BitVec 32)) SeekEntryResult!6243)

(assert (=> b!599400 (= lt!272469 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272470 lt!272474 mask!3053))))

(declare-fun e!342683 () Bool)

(assert (=> b!599400 e!342683))

(declare-fun res!384387 () Bool)

(assert (=> b!599400 (=> (not res!384387) (not e!342683))))

(declare-fun lt!272478 () (_ BitVec 32))

(declare-fun lt!272466 () SeekEntryResult!6243)

(assert (=> b!599400 (= res!384387 (= lt!272466 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272478 vacantSpotIndex!68 lt!272470 lt!272474 mask!3053)))))

(assert (=> b!599400 (= lt!272466 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272478 vacantSpotIndex!68 (select (arr!17803 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599400 (= lt!272470 (select (store (arr!17803 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272472 () Unit!18890)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37087 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18890)

(assert (=> b!599400 (= lt!272472 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272478 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599400 (= lt!272478 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599401 () Bool)

(declare-fun e!342685 () Bool)

(assert (=> b!599401 (= e!342675 e!342685)))

(declare-fun res!384391 () Bool)

(assert (=> b!599401 (=> (not res!384391) (not e!342685))))

(assert (=> b!599401 (= res!384391 (= (select (store (arr!17803 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599401 (= lt!272474 (array!37088 (store (arr!17803 a!2986) i!1108 k0!1786) (size!18167 a!2986)))))

(declare-fun b!599402 () Bool)

(declare-fun res!384378 () Bool)

(assert (=> b!599402 (=> (not res!384378) (not e!342679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599402 (= res!384378 (validKeyInArray!0 (select (arr!17803 a!2986) j!136)))))

(declare-fun b!599403 () Bool)

(declare-fun res!384374 () Bool)

(assert (=> b!599403 (=> res!384374 e!342677)))

(declare-fun noDuplicate!277 (List!11844) Bool)

(assert (=> b!599403 (= res!384374 (not (noDuplicate!277 Nil!11841)))))

(declare-fun b!599404 () Bool)

(assert (=> b!599404 (= e!342677 true)))

(declare-fun lt!272467 () Bool)

(assert (=> b!599404 (= lt!272467 (contains!2960 Nil!11841 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599405 () Bool)

(declare-fun lt!272477 () SeekEntryResult!6243)

(assert (=> b!599405 (= e!342683 (= lt!272477 lt!272466))))

(declare-fun b!599406 () Bool)

(assert (=> b!599406 (= e!342681 e!342686)))

(declare-fun res!384389 () Bool)

(assert (=> b!599406 (=> res!384389 e!342686)))

(declare-fun lt!272473 () (_ BitVec 64))

(assert (=> b!599406 (= res!384389 (or (not (= (select (arr!17803 a!2986) j!136) lt!272470)) (not (= (select (arr!17803 a!2986) j!136) lt!272473)) (bvsge j!136 index!984)))))

(declare-fun e!342676 () Bool)

(assert (=> b!599406 e!342676))

(declare-fun res!384382 () Bool)

(assert (=> b!599406 (=> (not res!384382) (not e!342676))))

(assert (=> b!599406 (= res!384382 (= lt!272473 (select (arr!17803 a!2986) j!136)))))

(assert (=> b!599406 (= lt!272473 (select (store (arr!17803 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599407 () Bool)

(declare-fun res!384383 () Bool)

(assert (=> b!599407 (=> (not res!384383) (not e!342679))))

(assert (=> b!599407 (= res!384383 (validKeyInArray!0 k0!1786))))

(declare-fun b!599408 () Bool)

(declare-fun Unit!18892 () Unit!18890)

(assert (=> b!599408 (= e!342680 Unit!18892)))

(assert (=> b!599408 false))

(declare-fun res!384384 () Bool)

(assert (=> start!54852 (=> (not res!384384) (not e!342679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54852 (= res!384384 (validMask!0 mask!3053))))

(assert (=> start!54852 e!342679))

(assert (=> start!54852 true))

(declare-fun array_inv!13599 (array!37087) Bool)

(assert (=> start!54852 (array_inv!13599 a!2986)))

(declare-fun b!599409 () Bool)

(declare-fun e!342678 () Bool)

(assert (=> b!599409 (= e!342678 e!342684)))

(declare-fun res!384373 () Bool)

(assert (=> b!599409 (=> (not res!384373) (not e!342684))))

(assert (=> b!599409 (= res!384373 (arrayContainsKey!0 lt!272474 (select (arr!17803 a!2986) j!136) j!136))))

(declare-fun b!599410 () Bool)

(assert (=> b!599410 (= e!342676 e!342678)))

(declare-fun res!384376 () Bool)

(assert (=> b!599410 (=> res!384376 e!342678)))

(assert (=> b!599410 (= res!384376 (or (not (= (select (arr!17803 a!2986) j!136) lt!272470)) (not (= (select (arr!17803 a!2986) j!136) lt!272473)) (bvsge j!136 index!984)))))

(declare-fun b!599411 () Bool)

(assert (=> b!599411 (= e!342685 e!342687)))

(declare-fun res!384377 () Bool)

(assert (=> b!599411 (=> (not res!384377) (not e!342687))))

(assert (=> b!599411 (= res!384377 (and (= lt!272477 (Found!6243 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17803 a!2986) index!984) (select (arr!17803 a!2986) j!136))) (not (= (select (arr!17803 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599411 (= lt!272477 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17803 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599412 () Bool)

(declare-fun Unit!18893 () Unit!18890)

(assert (=> b!599412 (= e!342680 Unit!18893)))

(declare-fun b!599413 () Bool)

(declare-fun res!384388 () Bool)

(assert (=> b!599413 (=> (not res!384388) (not e!342679))))

(assert (=> b!599413 (= res!384388 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599414 () Bool)

(declare-fun res!384379 () Bool)

(assert (=> b!599414 (=> (not res!384379) (not e!342675))))

(assert (=> b!599414 (= res!384379 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17803 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54852 res!384384) b!599395))

(assert (= (and b!599395 res!384380) b!599402))

(assert (= (and b!599402 res!384378) b!599407))

(assert (= (and b!599407 res!384383) b!599413))

(assert (= (and b!599413 res!384388) b!599399))

(assert (= (and b!599399 res!384375) b!599396))

(assert (= (and b!599396 res!384385) b!599393))

(assert (= (and b!599393 res!384390) b!599414))

(assert (= (and b!599414 res!384379) b!599401))

(assert (= (and b!599401 res!384391) b!599411))

(assert (= (and b!599411 res!384377) b!599400))

(assert (= (and b!599400 res!384387) b!599405))

(assert (= (and b!599400 c!67877) b!599408))

(assert (= (and b!599400 (not c!67877)) b!599412))

(assert (= (and b!599400 (not res!384392)) b!599406))

(assert (= (and b!599406 res!384382) b!599410))

(assert (= (and b!599410 (not res!384376)) b!599409))

(assert (= (and b!599409 res!384373) b!599398))

(assert (= (and b!599406 (not res!384389)) b!599394))

(assert (= (and b!599394 (not res!384381)) b!599403))

(assert (= (and b!599403 (not res!384374)) b!599397))

(assert (= (and b!599397 (not res!384386)) b!599404))

(declare-fun m!576645 () Bool)

(assert (=> b!599396 m!576645))

(declare-fun m!576647 () Bool)

(assert (=> b!599406 m!576647))

(declare-fun m!576649 () Bool)

(assert (=> b!599406 m!576649))

(declare-fun m!576651 () Bool)

(assert (=> b!599406 m!576651))

(declare-fun m!576653 () Bool)

(assert (=> b!599403 m!576653))

(declare-fun m!576655 () Bool)

(assert (=> start!54852 m!576655))

(declare-fun m!576657 () Bool)

(assert (=> start!54852 m!576657))

(assert (=> b!599409 m!576647))

(assert (=> b!599409 m!576647))

(declare-fun m!576659 () Bool)

(assert (=> b!599409 m!576659))

(declare-fun m!576661 () Bool)

(assert (=> b!599399 m!576661))

(assert (=> b!599410 m!576647))

(assert (=> b!599398 m!576647))

(assert (=> b!599398 m!576647))

(declare-fun m!576663 () Bool)

(assert (=> b!599398 m!576663))

(declare-fun m!576665 () Bool)

(assert (=> b!599413 m!576665))

(declare-fun m!576667 () Bool)

(assert (=> b!599400 m!576667))

(declare-fun m!576669 () Bool)

(assert (=> b!599400 m!576669))

(assert (=> b!599400 m!576647))

(assert (=> b!599400 m!576649))

(declare-fun m!576671 () Bool)

(assert (=> b!599400 m!576671))

(assert (=> b!599400 m!576647))

(declare-fun m!576673 () Bool)

(assert (=> b!599400 m!576673))

(declare-fun m!576675 () Bool)

(assert (=> b!599400 m!576675))

(declare-fun m!576677 () Bool)

(assert (=> b!599400 m!576677))

(assert (=> b!599402 m!576647))

(assert (=> b!599402 m!576647))

(declare-fun m!576679 () Bool)

(assert (=> b!599402 m!576679))

(assert (=> b!599394 m!576647))

(declare-fun m!576681 () Bool)

(assert (=> b!599394 m!576681))

(declare-fun m!576683 () Bool)

(assert (=> b!599394 m!576683))

(declare-fun m!576685 () Bool)

(assert (=> b!599394 m!576685))

(declare-fun m!576687 () Bool)

(assert (=> b!599394 m!576687))

(assert (=> b!599394 m!576647))

(declare-fun m!576689 () Bool)

(assert (=> b!599394 m!576689))

(assert (=> b!599394 m!576647))

(declare-fun m!576691 () Bool)

(assert (=> b!599394 m!576691))

(declare-fun m!576693 () Bool)

(assert (=> b!599393 m!576693))

(assert (=> b!599401 m!576649))

(declare-fun m!576695 () Bool)

(assert (=> b!599401 m!576695))

(declare-fun m!576697 () Bool)

(assert (=> b!599397 m!576697))

(declare-fun m!576699 () Bool)

(assert (=> b!599411 m!576699))

(assert (=> b!599411 m!576647))

(assert (=> b!599411 m!576647))

(declare-fun m!576701 () Bool)

(assert (=> b!599411 m!576701))

(declare-fun m!576703 () Bool)

(assert (=> b!599414 m!576703))

(declare-fun m!576705 () Bool)

(assert (=> b!599407 m!576705))

(declare-fun m!576707 () Bool)

(assert (=> b!599404 m!576707))

(check-sat (not b!599397) (not b!599394) (not b!599393) (not b!599399) (not b!599398) (not b!599411) (not b!599403) (not start!54852) (not b!599409) (not b!599413) (not b!599396) (not b!599400) (not b!599402) (not b!599404) (not b!599407))
(check-sat)
