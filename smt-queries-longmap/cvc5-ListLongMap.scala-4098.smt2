; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56086 () Bool)

(assert start!56086)

(declare-fun b!618548 () Bool)

(declare-datatypes ((Unit!20368 0))(
  ( (Unit!20369) )
))
(declare-fun e!354722 () Unit!20368)

(declare-fun Unit!20370 () Unit!20368)

(assert (=> b!618548 (= e!354722 Unit!20370)))

(declare-fun b!618549 () Bool)

(declare-fun e!354720 () Bool)

(declare-fun e!354723 () Bool)

(assert (=> b!618549 (= e!354720 e!354723)))

(declare-fun res!398519 () Bool)

(assert (=> b!618549 (=> (not res!398519) (not e!354723))))

(declare-datatypes ((SeekEntryResult!6464 0))(
  ( (MissingZero!6464 (index!28140 (_ BitVec 32))) (Found!6464 (index!28141 (_ BitVec 32))) (Intermediate!6464 (undefined!7276 Bool) (index!28142 (_ BitVec 32)) (x!56928 (_ BitVec 32))) (Undefined!6464) (MissingVacant!6464 (index!28143 (_ BitVec 32))) )
))
(declare-fun lt!285200 () SeekEntryResult!6464)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618549 (= res!398519 (or (= lt!285200 (MissingZero!6464 i!1108)) (= lt!285200 (MissingVacant!6464 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37556 0))(
  ( (array!37557 (arr!18024 (Array (_ BitVec 32) (_ BitVec 64))) (size!18388 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37556)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37556 (_ BitVec 32)) SeekEntryResult!6464)

(assert (=> b!618549 (= lt!285200 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618551 () Bool)

(declare-fun res!398520 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!618551 (= res!398520 (bvsge j!136 index!984))))

(declare-fun e!354729 () Bool)

(assert (=> b!618551 (=> res!398520 e!354729)))

(declare-fun e!354726 () Bool)

(assert (=> b!618551 (= e!354726 e!354729)))

(declare-fun b!618552 () Bool)

(declare-fun res!398526 () Bool)

(assert (=> b!618552 (=> (not res!398526) (not e!354720))))

(assert (=> b!618552 (= res!398526 (and (= (size!18388 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18388 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18388 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618553 () Bool)

(declare-fun res!398518 () Bool)

(assert (=> b!618553 (=> (not res!398518) (not e!354720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618553 (= res!398518 (validKeyInArray!0 k!1786))))

(declare-fun b!618554 () Bool)

(declare-fun e!354719 () Unit!20368)

(declare-fun Unit!20371 () Unit!20368)

(assert (=> b!618554 (= e!354719 Unit!20371)))

(assert (=> b!618554 false))

(declare-fun b!618555 () Bool)

(declare-fun e!354721 () Bool)

(declare-fun e!354724 () Bool)

(assert (=> b!618555 (= e!354721 (not e!354724))))

(declare-fun res!398532 () Bool)

(assert (=> b!618555 (=> res!398532 e!354724)))

(declare-fun lt!285212 () SeekEntryResult!6464)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618555 (= res!398532 (not (= lt!285212 (MissingVacant!6464 vacantSpotIndex!68))))))

(declare-fun lt!285203 () Unit!20368)

(declare-fun e!354730 () Unit!20368)

(assert (=> b!618555 (= lt!285203 e!354730)))

(declare-fun c!70382 () Bool)

(assert (=> b!618555 (= c!70382 (= lt!285212 (Found!6464 index!984)))))

(declare-fun lt!285201 () Unit!20368)

(assert (=> b!618555 (= lt!285201 e!354719)))

(declare-fun c!70383 () Bool)

(assert (=> b!618555 (= c!70383 (= lt!285212 Undefined!6464))))

(declare-fun lt!285214 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285211 () array!37556)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37556 (_ BitVec 32)) SeekEntryResult!6464)

(assert (=> b!618555 (= lt!285212 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285214 lt!285211 mask!3053))))

(declare-fun e!354727 () Bool)

(assert (=> b!618555 e!354727))

(declare-fun res!398523 () Bool)

(assert (=> b!618555 (=> (not res!398523) (not e!354727))))

(declare-fun lt!285210 () (_ BitVec 32))

(declare-fun lt!285205 () SeekEntryResult!6464)

(assert (=> b!618555 (= res!398523 (= lt!285205 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285210 vacantSpotIndex!68 lt!285214 lt!285211 mask!3053)))))

(assert (=> b!618555 (= lt!285205 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285210 vacantSpotIndex!68 (select (arr!18024 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618555 (= lt!285214 (select (store (arr!18024 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285204 () Unit!20368)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37556 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20368)

(assert (=> b!618555 (= lt!285204 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285210 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618555 (= lt!285210 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618556 () Bool)

(assert (=> b!618556 false))

(declare-fun lt!285209 () Unit!20368)

(declare-datatypes ((List!12065 0))(
  ( (Nil!12062) (Cons!12061 (h!13106 (_ BitVec 64)) (t!18293 List!12065)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37556 (_ BitVec 64) (_ BitVec 32) List!12065) Unit!20368)

(assert (=> b!618556 (= lt!285209 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285211 (select (arr!18024 a!2986) j!136) j!136 Nil!12062))))

(declare-fun arrayNoDuplicates!0 (array!37556 (_ BitVec 32) List!12065) Bool)

(assert (=> b!618556 (arrayNoDuplicates!0 lt!285211 j!136 Nil!12062)))

(declare-fun lt!285199 () Unit!20368)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37556 (_ BitVec 32) (_ BitVec 32)) Unit!20368)

(assert (=> b!618556 (= lt!285199 (lemmaNoDuplicateFromThenFromBigger!0 lt!285211 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618556 (arrayNoDuplicates!0 lt!285211 #b00000000000000000000000000000000 Nil!12062)))

(declare-fun lt!285216 () Unit!20368)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12065) Unit!20368)

(assert (=> b!618556 (= lt!285216 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12062))))

(declare-fun arrayContainsKey!0 (array!37556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618556 (arrayContainsKey!0 lt!285211 (select (arr!18024 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285206 () Unit!20368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20368)

(assert (=> b!618556 (= lt!285206 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285211 (select (arr!18024 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354718 () Unit!20368)

(declare-fun Unit!20372 () Unit!20368)

(assert (=> b!618556 (= e!354718 Unit!20372)))

(declare-fun e!354728 () Bool)

(declare-fun b!618557 () Bool)

(assert (=> b!618557 (= e!354728 (arrayContainsKey!0 lt!285211 (select (arr!18024 a!2986) j!136) index!984))))

(declare-fun b!618558 () Bool)

(assert (=> b!618558 (= e!354724 true)))

(assert (=> b!618558 (= (select (store (arr!18024 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618559 () Bool)

(declare-fun Unit!20373 () Unit!20368)

(assert (=> b!618559 (= e!354718 Unit!20373)))

(declare-fun b!618560 () Bool)

(assert (=> b!618560 false))

(declare-fun lt!285213 () Unit!20368)

(assert (=> b!618560 (= lt!285213 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285211 (select (arr!18024 a!2986) j!136) index!984 Nil!12062))))

(assert (=> b!618560 (arrayNoDuplicates!0 lt!285211 index!984 Nil!12062)))

(declare-fun lt!285207 () Unit!20368)

(assert (=> b!618560 (= lt!285207 (lemmaNoDuplicateFromThenFromBigger!0 lt!285211 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618560 (arrayNoDuplicates!0 lt!285211 #b00000000000000000000000000000000 Nil!12062)))

(declare-fun lt!285198 () Unit!20368)

(assert (=> b!618560 (= lt!285198 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12062))))

(assert (=> b!618560 (arrayContainsKey!0 lt!285211 (select (arr!18024 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285215 () Unit!20368)

(assert (=> b!618560 (= lt!285215 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285211 (select (arr!18024 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618560 e!354728))

(declare-fun res!398530 () Bool)

(assert (=> b!618560 (=> (not res!398530) (not e!354728))))

(assert (=> b!618560 (= res!398530 (arrayContainsKey!0 lt!285211 (select (arr!18024 a!2986) j!136) j!136))))

(declare-fun Unit!20374 () Unit!20368)

(assert (=> b!618560 (= e!354722 Unit!20374)))

(declare-fun res!398528 () Bool)

(assert (=> start!56086 (=> (not res!398528) (not e!354720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56086 (= res!398528 (validMask!0 mask!3053))))

(assert (=> start!56086 e!354720))

(assert (=> start!56086 true))

(declare-fun array_inv!13820 (array!37556) Bool)

(assert (=> start!56086 (array_inv!13820 a!2986)))

(declare-fun b!618550 () Bool)

(declare-fun e!354732 () Bool)

(assert (=> b!618550 (= e!354732 (arrayContainsKey!0 lt!285211 (select (arr!18024 a!2986) j!136) index!984))))

(declare-fun b!618561 () Bool)

(declare-fun Unit!20375 () Unit!20368)

(assert (=> b!618561 (= e!354730 Unit!20375)))

(declare-fun b!618562 () Bool)

(declare-fun res!398534 () Bool)

(assert (=> b!618562 (=> (not res!398534) (not e!354723))))

(assert (=> b!618562 (= res!398534 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18024 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618563 () Bool)

(declare-fun res!398521 () Bool)

(assert (=> b!618563 (=> (not res!398521) (not e!354720))))

(assert (=> b!618563 (= res!398521 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618564 () Bool)

(declare-fun res!398527 () Bool)

(assert (=> b!618564 (= res!398527 (arrayContainsKey!0 lt!285211 (select (arr!18024 a!2986) j!136) j!136))))

(assert (=> b!618564 (=> (not res!398527) (not e!354732))))

(assert (=> b!618564 (= e!354729 e!354732)))

(declare-fun b!618565 () Bool)

(declare-fun res!398529 () Bool)

(assert (=> b!618565 (=> (not res!398529) (not e!354723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37556 (_ BitVec 32)) Bool)

(assert (=> b!618565 (= res!398529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618566 () Bool)

(declare-fun e!354731 () Bool)

(assert (=> b!618566 (= e!354731 e!354721)))

(declare-fun res!398531 () Bool)

(assert (=> b!618566 (=> (not res!398531) (not e!354721))))

(declare-fun lt!285217 () SeekEntryResult!6464)

(assert (=> b!618566 (= res!398531 (and (= lt!285217 (Found!6464 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18024 a!2986) index!984) (select (arr!18024 a!2986) j!136))) (not (= (select (arr!18024 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618566 (= lt!285217 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18024 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618567 () Bool)

(declare-fun Unit!20376 () Unit!20368)

(assert (=> b!618567 (= e!354730 Unit!20376)))

(declare-fun res!398533 () Bool)

(assert (=> b!618567 (= res!398533 (= (select (store (arr!18024 a!2986) i!1108 k!1786) index!984) (select (arr!18024 a!2986) j!136)))))

(assert (=> b!618567 (=> (not res!398533) (not e!354726))))

(assert (=> b!618567 e!354726))

(declare-fun c!70385 () Bool)

(assert (=> b!618567 (= c!70385 (bvslt j!136 index!984))))

(declare-fun lt!285202 () Unit!20368)

(assert (=> b!618567 (= lt!285202 e!354718)))

(declare-fun c!70384 () Bool)

(assert (=> b!618567 (= c!70384 (bvslt index!984 j!136))))

(declare-fun lt!285208 () Unit!20368)

(assert (=> b!618567 (= lt!285208 e!354722)))

(assert (=> b!618567 false))

(declare-fun b!618568 () Bool)

(assert (=> b!618568 (= e!354723 e!354731)))

(declare-fun res!398522 () Bool)

(assert (=> b!618568 (=> (not res!398522) (not e!354731))))

(assert (=> b!618568 (= res!398522 (= (select (store (arr!18024 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618568 (= lt!285211 (array!37557 (store (arr!18024 a!2986) i!1108 k!1786) (size!18388 a!2986)))))

(declare-fun b!618569 () Bool)

(declare-fun res!398524 () Bool)

(assert (=> b!618569 (=> (not res!398524) (not e!354723))))

(assert (=> b!618569 (= res!398524 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12062))))

(declare-fun b!618570 () Bool)

(assert (=> b!618570 (= e!354727 (= lt!285217 lt!285205))))

(declare-fun b!618571 () Bool)

(declare-fun Unit!20377 () Unit!20368)

(assert (=> b!618571 (= e!354719 Unit!20377)))

(declare-fun b!618572 () Bool)

(declare-fun res!398525 () Bool)

(assert (=> b!618572 (=> (not res!398525) (not e!354720))))

(assert (=> b!618572 (= res!398525 (validKeyInArray!0 (select (arr!18024 a!2986) j!136)))))

(assert (= (and start!56086 res!398528) b!618552))

(assert (= (and b!618552 res!398526) b!618572))

(assert (= (and b!618572 res!398525) b!618553))

(assert (= (and b!618553 res!398518) b!618563))

(assert (= (and b!618563 res!398521) b!618549))

(assert (= (and b!618549 res!398519) b!618565))

(assert (= (and b!618565 res!398529) b!618569))

(assert (= (and b!618569 res!398524) b!618562))

(assert (= (and b!618562 res!398534) b!618568))

(assert (= (and b!618568 res!398522) b!618566))

(assert (= (and b!618566 res!398531) b!618555))

(assert (= (and b!618555 res!398523) b!618570))

(assert (= (and b!618555 c!70383) b!618554))

(assert (= (and b!618555 (not c!70383)) b!618571))

(assert (= (and b!618555 c!70382) b!618567))

(assert (= (and b!618555 (not c!70382)) b!618561))

(assert (= (and b!618567 res!398533) b!618551))

(assert (= (and b!618551 (not res!398520)) b!618564))

(assert (= (and b!618564 res!398527) b!618550))

(assert (= (and b!618567 c!70385) b!618556))

(assert (= (and b!618567 (not c!70385)) b!618559))

(assert (= (and b!618567 c!70384) b!618560))

(assert (= (and b!618567 (not c!70384)) b!618548))

(assert (= (and b!618560 res!398530) b!618557))

(assert (= (and b!618555 (not res!398532)) b!618558))

(declare-fun m!594581 () Bool)

(assert (=> b!618562 m!594581))

(declare-fun m!594583 () Bool)

(assert (=> b!618567 m!594583))

(declare-fun m!594585 () Bool)

(assert (=> b!618567 m!594585))

(declare-fun m!594587 () Bool)

(assert (=> b!618567 m!594587))

(assert (=> b!618556 m!594587))

(assert (=> b!618556 m!594587))

(declare-fun m!594589 () Bool)

(assert (=> b!618556 m!594589))

(assert (=> b!618556 m!594587))

(declare-fun m!594591 () Bool)

(assert (=> b!618556 m!594591))

(assert (=> b!618556 m!594587))

(declare-fun m!594593 () Bool)

(assert (=> b!618556 m!594593))

(declare-fun m!594595 () Bool)

(assert (=> b!618556 m!594595))

(declare-fun m!594597 () Bool)

(assert (=> b!618556 m!594597))

(declare-fun m!594599 () Bool)

(assert (=> b!618556 m!594599))

(declare-fun m!594601 () Bool)

(assert (=> b!618556 m!594601))

(declare-fun m!594603 () Bool)

(assert (=> b!618566 m!594603))

(assert (=> b!618566 m!594587))

(assert (=> b!618566 m!594587))

(declare-fun m!594605 () Bool)

(assert (=> b!618566 m!594605))

(declare-fun m!594607 () Bool)

(assert (=> b!618563 m!594607))

(declare-fun m!594609 () Bool)

(assert (=> b!618569 m!594609))

(assert (=> b!618558 m!594583))

(assert (=> b!618558 m!594585))

(assert (=> b!618557 m!594587))

(assert (=> b!618557 m!594587))

(declare-fun m!594611 () Bool)

(assert (=> b!618557 m!594611))

(assert (=> b!618568 m!594583))

(declare-fun m!594613 () Bool)

(assert (=> b!618568 m!594613))

(declare-fun m!594615 () Bool)

(assert (=> b!618560 m!594615))

(assert (=> b!618560 m!594587))

(assert (=> b!618560 m!594587))

(declare-fun m!594617 () Bool)

(assert (=> b!618560 m!594617))

(assert (=> b!618560 m!594587))

(declare-fun m!594619 () Bool)

(assert (=> b!618560 m!594619))

(assert (=> b!618560 m!594587))

(declare-fun m!594621 () Bool)

(assert (=> b!618560 m!594621))

(declare-fun m!594623 () Bool)

(assert (=> b!618560 m!594623))

(assert (=> b!618560 m!594587))

(declare-fun m!594625 () Bool)

(assert (=> b!618560 m!594625))

(assert (=> b!618560 m!594599))

(assert (=> b!618560 m!594601))

(assert (=> b!618564 m!594587))

(assert (=> b!618564 m!594587))

(assert (=> b!618564 m!594619))

(assert (=> b!618572 m!594587))

(assert (=> b!618572 m!594587))

(declare-fun m!594627 () Bool)

(assert (=> b!618572 m!594627))

(assert (=> b!618550 m!594587))

(assert (=> b!618550 m!594587))

(assert (=> b!618550 m!594611))

(declare-fun m!594629 () Bool)

(assert (=> b!618555 m!594629))

(declare-fun m!594631 () Bool)

(assert (=> b!618555 m!594631))

(declare-fun m!594633 () Bool)

(assert (=> b!618555 m!594633))

(assert (=> b!618555 m!594587))

(assert (=> b!618555 m!594583))

(declare-fun m!594635 () Bool)

(assert (=> b!618555 m!594635))

(assert (=> b!618555 m!594587))

(declare-fun m!594637 () Bool)

(assert (=> b!618555 m!594637))

(declare-fun m!594639 () Bool)

(assert (=> b!618555 m!594639))

(declare-fun m!594641 () Bool)

(assert (=> start!56086 m!594641))

(declare-fun m!594643 () Bool)

(assert (=> start!56086 m!594643))

(declare-fun m!594645 () Bool)

(assert (=> b!618553 m!594645))

(declare-fun m!594647 () Bool)

(assert (=> b!618565 m!594647))

(declare-fun m!594649 () Bool)

(assert (=> b!618549 m!594649))

(push 1)

