; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59462 () Bool)

(assert start!59462)

(declare-fun b!656531 () Bool)

(declare-fun res!425805 () Bool)

(declare-fun e!377092 () Bool)

(assert (=> b!656531 (=> (not res!425805) (not e!377092))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38701 0))(
  ( (array!38702 (arr!18549 (Array (_ BitVec 32) (_ BitVec 64))) (size!18913 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38701)

(assert (=> b!656531 (= res!425805 (and (= (size!18913 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18913 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18913 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656532 () Bool)

(declare-fun res!425810 () Bool)

(assert (=> b!656532 (=> (not res!425810) (not e!377092))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656532 (= res!425810 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656533 () Bool)

(declare-datatypes ((Unit!22644 0))(
  ( (Unit!22645) )
))
(declare-fun e!377090 () Unit!22644)

(declare-fun Unit!22646 () Unit!22644)

(assert (=> b!656533 (= e!377090 Unit!22646)))

(assert (=> b!656533 false))

(declare-fun b!656534 () Bool)

(declare-fun res!425809 () Bool)

(declare-fun e!377085 () Bool)

(assert (=> b!656534 (=> (not res!425809) (not e!377085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38701 (_ BitVec 32)) Bool)

(assert (=> b!656534 (= res!425809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656535 () Bool)

(declare-fun res!425812 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!656535 (= res!425812 (bvsge j!136 index!984))))

(declare-fun e!377091 () Bool)

(assert (=> b!656535 (=> res!425812 e!377091)))

(declare-fun e!377096 () Bool)

(assert (=> b!656535 (= e!377096 e!377091)))

(declare-fun res!425815 () Bool)

(assert (=> start!59462 (=> (not res!425815) (not e!377092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59462 (= res!425815 (validMask!0 mask!3053))))

(assert (=> start!59462 e!377092))

(assert (=> start!59462 true))

(declare-fun array_inv!14345 (array!38701) Bool)

(assert (=> start!59462 (array_inv!14345 a!2986)))

(declare-fun b!656536 () Bool)

(declare-fun e!377093 () Bool)

(declare-fun e!377097 () Bool)

(assert (=> b!656536 (= e!377093 e!377097)))

(declare-fun res!425803 () Bool)

(assert (=> b!656536 (=> (not res!425803) (not e!377097))))

(declare-datatypes ((SeekEntryResult!6989 0))(
  ( (MissingZero!6989 (index!30318 (_ BitVec 32))) (Found!6989 (index!30319 (_ BitVec 32))) (Intermediate!6989 (undefined!7801 Bool) (index!30320 (_ BitVec 32)) (x!59111 (_ BitVec 32))) (Undefined!6989) (MissingVacant!6989 (index!30321 (_ BitVec 32))) )
))
(declare-fun lt!306474 () SeekEntryResult!6989)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!656536 (= res!425803 (and (= lt!306474 (Found!6989 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18549 a!2986) index!984) (select (arr!18549 a!2986) j!136))) (not (= (select (arr!18549 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38701 (_ BitVec 32)) SeekEntryResult!6989)

(assert (=> b!656536 (= lt!306474 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18549 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656537 () Bool)

(declare-fun res!425814 () Bool)

(declare-fun lt!306467 () array!38701)

(assert (=> b!656537 (= res!425814 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) j!136))))

(declare-fun e!377089 () Bool)

(assert (=> b!656537 (=> (not res!425814) (not e!377089))))

(assert (=> b!656537 (= e!377091 e!377089)))

(declare-fun b!656538 () Bool)

(declare-fun res!425817 () Bool)

(assert (=> b!656538 (=> (not res!425817) (not e!377092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656538 (= res!425817 (validKeyInArray!0 (select (arr!18549 a!2986) j!136)))))

(declare-fun b!656539 () Bool)

(declare-fun e!377084 () Bool)

(assert (=> b!656539 (= e!377084 false)))

(assert (=> b!656539 (= (select (store (arr!18549 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun e!377094 () Bool)

(declare-fun b!656540 () Bool)

(assert (=> b!656540 (= e!377094 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) index!984))))

(declare-fun b!656541 () Bool)

(assert (=> b!656541 (= e!377089 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) index!984))))

(declare-fun b!656542 () Bool)

(declare-fun res!425818 () Bool)

(assert (=> b!656542 (=> (not res!425818) (not e!377085))))

(assert (=> b!656542 (= res!425818 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18549 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!656543 () Bool)

(declare-fun e!377083 () Unit!22644)

(declare-fun Unit!22647 () Unit!22644)

(assert (=> b!656543 (= e!377083 Unit!22647)))

(declare-fun b!656544 () Bool)

(declare-fun e!377088 () Unit!22644)

(declare-fun Unit!22648 () Unit!22644)

(assert (=> b!656544 (= e!377088 Unit!22648)))

(declare-fun b!656545 () Bool)

(assert (=> b!656545 false))

(declare-fun lt!306464 () Unit!22644)

(declare-datatypes ((List!12590 0))(
  ( (Nil!12587) (Cons!12586 (h!13631 (_ BitVec 64)) (t!18818 List!12590)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38701 (_ BitVec 64) (_ BitVec 32) List!12590) Unit!22644)

(assert (=> b!656545 (= lt!306464 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306467 (select (arr!18549 a!2986) j!136) index!984 Nil!12587))))

(declare-fun arrayNoDuplicates!0 (array!38701 (_ BitVec 32) List!12590) Bool)

(assert (=> b!656545 (arrayNoDuplicates!0 lt!306467 index!984 Nil!12587)))

(declare-fun lt!306456 () Unit!22644)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38701 (_ BitVec 32) (_ BitVec 32)) Unit!22644)

(assert (=> b!656545 (= lt!306456 (lemmaNoDuplicateFromThenFromBigger!0 lt!306467 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656545 (arrayNoDuplicates!0 lt!306467 #b00000000000000000000000000000000 Nil!12587)))

(declare-fun lt!306465 () Unit!22644)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38701 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12590) Unit!22644)

(assert (=> b!656545 (= lt!306465 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12587))))

(assert (=> b!656545 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306459 () Unit!22644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38701 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22644)

(assert (=> b!656545 (= lt!306459 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306467 (select (arr!18549 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!656545 e!377094))

(declare-fun res!425806 () Bool)

(assert (=> b!656545 (=> (not res!425806) (not e!377094))))

(assert (=> b!656545 (= res!425806 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) j!136))))

(declare-fun e!377086 () Unit!22644)

(declare-fun Unit!22649 () Unit!22644)

(assert (=> b!656545 (= e!377086 Unit!22649)))

(declare-fun b!656546 () Bool)

(assert (=> b!656546 (= e!377092 e!377085)))

(declare-fun res!425807 () Bool)

(assert (=> b!656546 (=> (not res!425807) (not e!377085))))

(declare-fun lt!306461 () SeekEntryResult!6989)

(assert (=> b!656546 (= res!425807 (or (= lt!306461 (MissingZero!6989 i!1108)) (= lt!306461 (MissingVacant!6989 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38701 (_ BitVec 32)) SeekEntryResult!6989)

(assert (=> b!656546 (= lt!306461 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!656547 () Bool)

(declare-fun Unit!22650 () Unit!22644)

(assert (=> b!656547 (= e!377090 Unit!22650)))

(declare-fun b!656548 () Bool)

(declare-fun Unit!22651 () Unit!22644)

(assert (=> b!656548 (= e!377083 Unit!22651)))

(declare-fun res!425808 () Bool)

(assert (=> b!656548 (= res!425808 (= (select (store (arr!18549 a!2986) i!1108 k!1786) index!984) (select (arr!18549 a!2986) j!136)))))

(assert (=> b!656548 (=> (not res!425808) (not e!377096))))

(assert (=> b!656548 e!377096))

(declare-fun c!75732 () Bool)

(assert (=> b!656548 (= c!75732 (bvslt j!136 index!984))))

(declare-fun lt!306466 () Unit!22644)

(assert (=> b!656548 (= lt!306466 e!377088)))

(declare-fun c!75734 () Bool)

(assert (=> b!656548 (= c!75734 (bvslt index!984 j!136))))

(declare-fun lt!306475 () Unit!22644)

(assert (=> b!656548 (= lt!306475 e!377086)))

(assert (=> b!656548 false))

(declare-fun b!656549 () Bool)

(assert (=> b!656549 (= e!377097 (not e!377084))))

(declare-fun res!425811 () Bool)

(assert (=> b!656549 (=> res!425811 e!377084)))

(declare-fun lt!306462 () SeekEntryResult!6989)

(assert (=> b!656549 (= res!425811 (not (= lt!306462 (MissingVacant!6989 vacantSpotIndex!68))))))

(declare-fun lt!306469 () Unit!22644)

(assert (=> b!656549 (= lt!306469 e!377083)))

(declare-fun c!75733 () Bool)

(assert (=> b!656549 (= c!75733 (= lt!306462 (Found!6989 index!984)))))

(declare-fun lt!306460 () Unit!22644)

(assert (=> b!656549 (= lt!306460 e!377090)))

(declare-fun c!75731 () Bool)

(assert (=> b!656549 (= c!75731 (= lt!306462 Undefined!6989))))

(declare-fun lt!306472 () (_ BitVec 64))

(assert (=> b!656549 (= lt!306462 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306472 lt!306467 mask!3053))))

(declare-fun e!377095 () Bool)

(assert (=> b!656549 e!377095))

(declare-fun res!425813 () Bool)

(assert (=> b!656549 (=> (not res!425813) (not e!377095))))

(declare-fun lt!306458 () (_ BitVec 32))

(declare-fun lt!306473 () SeekEntryResult!6989)

(assert (=> b!656549 (= res!425813 (= lt!306473 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306458 vacantSpotIndex!68 lt!306472 lt!306467 mask!3053)))))

(assert (=> b!656549 (= lt!306473 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306458 vacantSpotIndex!68 (select (arr!18549 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656549 (= lt!306472 (select (store (arr!18549 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306470 () Unit!22644)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38701 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22644)

(assert (=> b!656549 (= lt!306470 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306458 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656549 (= lt!306458 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!656550 () Bool)

(declare-fun res!425816 () Bool)

(assert (=> b!656550 (=> (not res!425816) (not e!377085))))

(assert (=> b!656550 (= res!425816 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12587))))

(declare-fun b!656551 () Bool)

(declare-fun Unit!22652 () Unit!22644)

(assert (=> b!656551 (= e!377086 Unit!22652)))

(declare-fun b!656552 () Bool)

(declare-fun res!425819 () Bool)

(assert (=> b!656552 (=> (not res!425819) (not e!377092))))

(assert (=> b!656552 (= res!425819 (validKeyInArray!0 k!1786))))

(declare-fun b!656553 () Bool)

(assert (=> b!656553 false))

(declare-fun lt!306463 () Unit!22644)

(assert (=> b!656553 (= lt!306463 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306467 (select (arr!18549 a!2986) j!136) j!136 Nil!12587))))

(assert (=> b!656553 (arrayNoDuplicates!0 lt!306467 j!136 Nil!12587)))

(declare-fun lt!306471 () Unit!22644)

(assert (=> b!656553 (= lt!306471 (lemmaNoDuplicateFromThenFromBigger!0 lt!306467 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656553 (arrayNoDuplicates!0 lt!306467 #b00000000000000000000000000000000 Nil!12587)))

(declare-fun lt!306468 () Unit!22644)

(assert (=> b!656553 (= lt!306468 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12587))))

(assert (=> b!656553 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306457 () Unit!22644)

(assert (=> b!656553 (= lt!306457 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306467 (select (arr!18549 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22653 () Unit!22644)

(assert (=> b!656553 (= e!377088 Unit!22653)))

(declare-fun b!656554 () Bool)

(assert (=> b!656554 (= e!377085 e!377093)))

(declare-fun res!425804 () Bool)

(assert (=> b!656554 (=> (not res!425804) (not e!377093))))

(assert (=> b!656554 (= res!425804 (= (select (store (arr!18549 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656554 (= lt!306467 (array!38702 (store (arr!18549 a!2986) i!1108 k!1786) (size!18913 a!2986)))))

(declare-fun b!656555 () Bool)

(assert (=> b!656555 (= e!377095 (= lt!306474 lt!306473))))

(assert (= (and start!59462 res!425815) b!656531))

(assert (= (and b!656531 res!425805) b!656538))

(assert (= (and b!656538 res!425817) b!656552))

(assert (= (and b!656552 res!425819) b!656532))

(assert (= (and b!656532 res!425810) b!656546))

(assert (= (and b!656546 res!425807) b!656534))

(assert (= (and b!656534 res!425809) b!656550))

(assert (= (and b!656550 res!425816) b!656542))

(assert (= (and b!656542 res!425818) b!656554))

(assert (= (and b!656554 res!425804) b!656536))

(assert (= (and b!656536 res!425803) b!656549))

(assert (= (and b!656549 res!425813) b!656555))

(assert (= (and b!656549 c!75731) b!656533))

(assert (= (and b!656549 (not c!75731)) b!656547))

(assert (= (and b!656549 c!75733) b!656548))

(assert (= (and b!656549 (not c!75733)) b!656543))

(assert (= (and b!656548 res!425808) b!656535))

(assert (= (and b!656535 (not res!425812)) b!656537))

(assert (= (and b!656537 res!425814) b!656541))

(assert (= (and b!656548 c!75732) b!656553))

(assert (= (and b!656548 (not c!75732)) b!656544))

(assert (= (and b!656548 c!75734) b!656545))

(assert (= (and b!656548 (not c!75734)) b!656551))

(assert (= (and b!656545 res!425806) b!656540))

(assert (= (and b!656549 (not res!425811)) b!656539))

(declare-fun m!629597 () Bool)

(assert (=> b!656550 m!629597))

(declare-fun m!629599 () Bool)

(assert (=> b!656540 m!629599))

(assert (=> b!656540 m!629599))

(declare-fun m!629601 () Bool)

(assert (=> b!656540 m!629601))

(declare-fun m!629603 () Bool)

(assert (=> start!59462 m!629603))

(declare-fun m!629605 () Bool)

(assert (=> start!59462 m!629605))

(declare-fun m!629607 () Bool)

(assert (=> b!656554 m!629607))

(declare-fun m!629609 () Bool)

(assert (=> b!656554 m!629609))

(declare-fun m!629611 () Bool)

(assert (=> b!656549 m!629611))

(declare-fun m!629613 () Bool)

(assert (=> b!656549 m!629613))

(assert (=> b!656549 m!629599))

(declare-fun m!629615 () Bool)

(assert (=> b!656549 m!629615))

(declare-fun m!629617 () Bool)

(assert (=> b!656549 m!629617))

(assert (=> b!656549 m!629607))

(declare-fun m!629619 () Bool)

(assert (=> b!656549 m!629619))

(assert (=> b!656549 m!629599))

(declare-fun m!629621 () Bool)

(assert (=> b!656549 m!629621))

(assert (=> b!656538 m!629599))

(assert (=> b!656538 m!629599))

(declare-fun m!629623 () Bool)

(assert (=> b!656538 m!629623))

(declare-fun m!629625 () Bool)

(assert (=> b!656542 m!629625))

(declare-fun m!629627 () Bool)

(assert (=> b!656546 m!629627))

(assert (=> b!656548 m!629607))

(declare-fun m!629629 () Bool)

(assert (=> b!656548 m!629629))

(assert (=> b!656548 m!629599))

(assert (=> b!656541 m!629599))

(assert (=> b!656541 m!629599))

(assert (=> b!656541 m!629601))

(declare-fun m!629631 () Bool)

(assert (=> b!656532 m!629631))

(assert (=> b!656553 m!629599))

(declare-fun m!629633 () Bool)

(assert (=> b!656553 m!629633))

(assert (=> b!656553 m!629599))

(assert (=> b!656553 m!629599))

(declare-fun m!629635 () Bool)

(assert (=> b!656553 m!629635))

(declare-fun m!629637 () Bool)

(assert (=> b!656553 m!629637))

(declare-fun m!629639 () Bool)

(assert (=> b!656553 m!629639))

(declare-fun m!629641 () Bool)

(assert (=> b!656553 m!629641))

(assert (=> b!656553 m!629599))

(declare-fun m!629643 () Bool)

(assert (=> b!656553 m!629643))

(declare-fun m!629645 () Bool)

(assert (=> b!656553 m!629645))

(assert (=> b!656539 m!629607))

(assert (=> b!656539 m!629629))

(declare-fun m!629647 () Bool)

(assert (=> b!656536 m!629647))

(assert (=> b!656536 m!629599))

(assert (=> b!656536 m!629599))

(declare-fun m!629649 () Bool)

(assert (=> b!656536 m!629649))

(declare-fun m!629651 () Bool)

(assert (=> b!656552 m!629651))

(declare-fun m!629653 () Bool)

(assert (=> b!656534 m!629653))

(assert (=> b!656545 m!629599))

(declare-fun m!629655 () Bool)

(assert (=> b!656545 m!629655))

(assert (=> b!656545 m!629599))

(declare-fun m!629657 () Bool)

(assert (=> b!656545 m!629657))

(assert (=> b!656545 m!629599))

(declare-fun m!629659 () Bool)

(assert (=> b!656545 m!629659))

(assert (=> b!656545 m!629641))

(declare-fun m!629661 () Bool)

(assert (=> b!656545 m!629661))

(assert (=> b!656545 m!629645))

(assert (=> b!656545 m!629599))

(declare-fun m!629663 () Bool)

(assert (=> b!656545 m!629663))

(assert (=> b!656545 m!629599))

(declare-fun m!629665 () Bool)

(assert (=> b!656545 m!629665))

(assert (=> b!656537 m!629599))

(assert (=> b!656537 m!629599))

(assert (=> b!656537 m!629665))

(push 1)

(assert (not b!656552))

(assert (not b!656537))

(assert (not b!656549))

(assert (not b!656550))

(assert (not b!656553))

(assert (not b!656534))

(assert (not b!656541))

(assert (not b!656546))

(assert (not b!656538))

(assert (not b!656536))

(assert (not b!656545))

(assert (not b!656532))

(assert (not b!656540))

(assert (not start!59462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!656880 () Bool)

(declare-fun e!377313 () Bool)

(declare-fun e!377315 () Bool)

(assert (=> b!656880 (= e!377313 e!377315)))

(declare-fun res!426000 () Bool)

(assert (=> b!656880 (=> (not res!426000) (not e!377315))))

(declare-fun e!377314 () Bool)

(assert (=> b!656880 (= res!426000 (not e!377314))))

(declare-fun res!425999 () Bool)

(assert (=> b!656880 (=> (not res!425999) (not e!377314))))

(assert (=> b!656880 (= res!425999 (validKeyInArray!0 (select (arr!18549 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92831 () Bool)

(declare-fun res!425998 () Bool)

(assert (=> d!92831 (=> res!425998 e!377313)))

(assert (=> d!92831 (= res!425998 (bvsge #b00000000000000000000000000000000 (size!18913 a!2986)))))

(assert (=> d!92831 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12587) e!377313)))

(declare-fun bm!33874 () Bool)

(declare-fun call!33877 () Bool)

(declare-fun c!75808 () Bool)

(assert (=> bm!33874 (= call!33877 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75808 (Cons!12586 (select (arr!18549 a!2986) #b00000000000000000000000000000000) Nil!12587) Nil!12587)))))

(declare-fun b!656881 () Bool)

(declare-fun contains!3196 (List!12590 (_ BitVec 64)) Bool)

(assert (=> b!656881 (= e!377314 (contains!3196 Nil!12587 (select (arr!18549 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656882 () Bool)

(declare-fun e!377316 () Bool)

(assert (=> b!656882 (= e!377316 call!33877)))

(declare-fun b!656883 () Bool)

(assert (=> b!656883 (= e!377316 call!33877)))

(declare-fun b!656884 () Bool)

(assert (=> b!656884 (= e!377315 e!377316)))

(assert (=> b!656884 (= c!75808 (validKeyInArray!0 (select (arr!18549 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92831 (not res!425998)) b!656880))

(assert (= (and b!656880 res!425999) b!656881))

(assert (= (and b!656880 res!426000) b!656884))

(assert (= (and b!656884 c!75808) b!656883))

(assert (= (and b!656884 (not c!75808)) b!656882))

(assert (= (or b!656883 b!656882) bm!33874))

(declare-fun m!629969 () Bool)

(assert (=> b!656880 m!629969))

(assert (=> b!656880 m!629969))

(declare-fun m!629973 () Bool)

(assert (=> b!656880 m!629973))

(assert (=> bm!33874 m!629969))

(declare-fun m!629975 () Bool)

(assert (=> bm!33874 m!629975))

(assert (=> b!656881 m!629969))

(assert (=> b!656881 m!629969))

(declare-fun m!629977 () Bool)

(assert (=> b!656881 m!629977))

(assert (=> b!656884 m!629969))

(assert (=> b!656884 m!629969))

(assert (=> b!656884 m!629973))

(assert (=> b!656550 d!92831))

(declare-fun d!92845 () Bool)

(declare-fun res!426007 () Bool)

(declare-fun e!377326 () Bool)

(assert (=> d!92845 (=> res!426007 e!377326)))

(assert (=> d!92845 (= res!426007 (= (select (arr!18549 lt!306467) index!984) (select (arr!18549 a!2986) j!136)))))

(assert (=> d!92845 (= (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) index!984) e!377326)))

(declare-fun b!656897 () Bool)

(declare-fun e!377327 () Bool)

(assert (=> b!656897 (= e!377326 e!377327)))

(declare-fun res!426008 () Bool)

(assert (=> b!656897 (=> (not res!426008) (not e!377327))))

(assert (=> b!656897 (= res!426008 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18913 lt!306467)))))

(declare-fun b!656898 () Bool)

(assert (=> b!656898 (= e!377327 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92845 (not res!426007)) b!656897))

(assert (= (and b!656897 res!426008) b!656898))

(declare-fun m!629991 () Bool)

(assert (=> d!92845 m!629991))

(assert (=> b!656898 m!629599))

(declare-fun m!629993 () Bool)

(assert (=> b!656898 m!629993))

(assert (=> b!656540 d!92845))

(assert (=> b!656541 d!92845))

(declare-fun b!656954 () Bool)

(declare-fun e!377360 () SeekEntryResult!6989)

(assert (=> b!656954 (= e!377360 (MissingVacant!6989 vacantSpotIndex!68))))

(declare-fun b!656955 () Bool)

(declare-fun c!75839 () Bool)

(declare-fun lt!306690 () (_ BitVec 64))

(assert (=> b!656955 (= c!75839 (= lt!306690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377359 () SeekEntryResult!6989)

(assert (=> b!656955 (= e!377359 e!377360)))

(declare-fun b!656956 () Bool)

(declare-fun e!377358 () SeekEntryResult!6989)

(assert (=> b!656956 (= e!377358 e!377359)))

(declare-fun c!75837 () Bool)

(assert (=> b!656956 (= c!75837 (= lt!306690 (select (arr!18549 a!2986) j!136)))))

(declare-fun lt!306691 () SeekEntryResult!6989)

(declare-fun d!92853 () Bool)

(assert (=> d!92853 (and (or (is-Undefined!6989 lt!306691) (not (is-Found!6989 lt!306691)) (and (bvsge (index!30319 lt!306691) #b00000000000000000000000000000000) (bvslt (index!30319 lt!306691) (size!18913 a!2986)))) (or (is-Undefined!6989 lt!306691) (is-Found!6989 lt!306691) (not (is-MissingVacant!6989 lt!306691)) (not (= (index!30321 lt!306691) vacantSpotIndex!68)) (and (bvsge (index!30321 lt!306691) #b00000000000000000000000000000000) (bvslt (index!30321 lt!306691) (size!18913 a!2986)))) (or (is-Undefined!6989 lt!306691) (ite (is-Found!6989 lt!306691) (= (select (arr!18549 a!2986) (index!30319 lt!306691)) (select (arr!18549 a!2986) j!136)) (and (is-MissingVacant!6989 lt!306691) (= (index!30321 lt!306691) vacantSpotIndex!68) (= (select (arr!18549 a!2986) (index!30321 lt!306691)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92853 (= lt!306691 e!377358)))

(declare-fun c!75838 () Bool)

(assert (=> d!92853 (= c!75838 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92853 (= lt!306690 (select (arr!18549 a!2986) index!984))))

(assert (=> d!92853 (validMask!0 mask!3053)))

(assert (=> d!92853 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18549 a!2986) j!136) a!2986 mask!3053) lt!306691)))

(declare-fun b!656957 () Bool)

(assert (=> b!656957 (= e!377360 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18549 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656958 () Bool)

(assert (=> b!656958 (= e!377359 (Found!6989 index!984))))

(declare-fun b!656959 () Bool)

(assert (=> b!656959 (= e!377358 Undefined!6989)))

(assert (= (and d!92853 c!75838) b!656959))

(assert (= (and d!92853 (not c!75838)) b!656956))

(assert (= (and b!656956 c!75837) b!656958))

(assert (= (and b!656956 (not c!75837)) b!656955))

(assert (= (and b!656955 c!75839) b!656954))

(assert (= (and b!656955 (not c!75839)) b!656957))

(declare-fun m!630047 () Bool)

(assert (=> d!92853 m!630047))

(declare-fun m!630049 () Bool)

(assert (=> d!92853 m!630049))

(assert (=> d!92853 m!629647))

(assert (=> d!92853 m!629603))

(assert (=> b!656957 m!629611))

(assert (=> b!656957 m!629611))

(assert (=> b!656957 m!629599))

(declare-fun m!630051 () Bool)

(assert (=> b!656957 m!630051))

(assert (=> b!656536 d!92853))

(declare-fun d!92879 () Bool)

(assert (=> d!92879 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59462 d!92879))

(declare-fun d!92883 () Bool)

(assert (=> d!92883 (= (array_inv!14345 a!2986) (bvsge (size!18913 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59462 d!92883))

(declare-fun d!92885 () Bool)

(declare-fun res!426025 () Bool)

(declare-fun e!377375 () Bool)

(assert (=> d!92885 (=> res!426025 e!377375)))

(assert (=> d!92885 (= res!426025 (= (select (arr!18549 lt!306467) j!136) (select (arr!18549 a!2986) j!136)))))

(assert (=> d!92885 (= (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) j!136) e!377375)))

(declare-fun b!656977 () Bool)

(declare-fun e!377376 () Bool)

(assert (=> b!656977 (= e!377375 e!377376)))

(declare-fun res!426026 () Bool)

(assert (=> b!656977 (=> (not res!426026) (not e!377376))))

(assert (=> b!656977 (= res!426026 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18913 lt!306467)))))

(declare-fun b!656978 () Bool)

(assert (=> b!656978 (= e!377376 (arrayContainsKey!0 lt!306467 (select (arr!18549 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92885 (not res!426025)) b!656977))

(assert (= (and b!656977 res!426026) b!656978))

(declare-fun m!630065 () Bool)

(assert (=> d!92885 m!630065))

(assert (=> b!656978 m!629599))

(declare-fun m!630067 () Bool)

(assert (=> b!656978 m!630067))

(assert (=> b!656537 d!92885))

(declare-fun b!656979 () Bool)

(declare-fun e!377379 () SeekEntryResult!6989)

(assert (=> b!656979 (= e!377379 (MissingVacant!6989 vacantSpotIndex!68))))

(declare-fun b!656980 () Bool)

(declare-fun c!75845 () Bool)

(declare-fun lt!306704 () (_ BitVec 64))

(assert (=> b!656980 (= c!75845 (= lt!306704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377378 () SeekEntryResult!6989)

(assert (=> b!656980 (= e!377378 e!377379)))

(declare-fun b!656981 () Bool)

(declare-fun e!377377 () SeekEntryResult!6989)

(assert (=> b!656981 (= e!377377 e!377378)))

(declare-fun c!75843 () Bool)

(assert (=> b!656981 (= c!75843 (= lt!306704 lt!306472))))

(declare-fun d!92887 () Bool)

(declare-fun lt!306705 () SeekEntryResult!6989)

(assert (=> d!92887 (and (or (is-Undefined!6989 lt!306705) (not (is-Found!6989 lt!306705)) (and (bvsge (index!30319 lt!306705) #b00000000000000000000000000000000) (bvslt (index!30319 lt!306705) (size!18913 lt!306467)))) (or (is-Undefined!6989 lt!306705) (is-Found!6989 lt!306705) (not (is-MissingVacant!6989 lt!306705)) (not (= (index!30321 lt!306705) vacantSpotIndex!68)) (and (bvsge (index!30321 lt!306705) #b00000000000000000000000000000000) (bvslt (index!30321 lt!306705) (size!18913 lt!306467)))) (or (is-Undefined!6989 lt!306705) (ite (is-Found!6989 lt!306705) (= (select (arr!18549 lt!306467) (index!30319 lt!306705)) lt!306472) (and (is-MissingVacant!6989 lt!306705) (= (index!30321 lt!306705) vacantSpotIndex!68) (= (select (arr!18549 lt!306467) (index!30321 lt!306705)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92887 (= lt!306705 e!377377)))

(declare-fun c!75844 () Bool)

(assert (=> d!92887 (= c!75844 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92887 (= lt!306704 (select (arr!18549 lt!306467) lt!306458))))

(assert (=> d!92887 (validMask!0 mask!3053)))

(assert (=> d!92887 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306458 vacantSpotIndex!68 lt!306472 lt!306467 mask!3053) lt!306705)))

(declare-fun b!656982 () Bool)

(assert (=> b!656982 (= e!377379 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306458 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!306472 lt!306467 mask!3053))))

(declare-fun b!656983 () Bool)

