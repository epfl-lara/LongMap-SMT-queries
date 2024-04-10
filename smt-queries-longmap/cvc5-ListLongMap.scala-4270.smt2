; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59360 () Bool)

(assert start!59360)

(declare-fun b!655533 () Bool)

(declare-fun res!425239 () Bool)

(declare-fun e!376463 () Bool)

(assert (=> b!655533 (=> (not res!425239) (not e!376463))))

(declare-datatypes ((array!38680 0))(
  ( (array!38681 (arr!18540 (Array (_ BitVec 32) (_ BitVec 64))) (size!18904 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38680)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38680 (_ BitVec 32)) Bool)

(assert (=> b!655533 (= res!425239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655534 () Bool)

(declare-datatypes ((Unit!22554 0))(
  ( (Unit!22555) )
))
(declare-fun e!376464 () Unit!22554)

(declare-fun Unit!22556 () Unit!22554)

(assert (=> b!655534 (= e!376464 Unit!22556)))

(declare-fun b!655535 () Bool)

(declare-fun e!376471 () Bool)

(assert (=> b!655535 (= e!376471 (not true))))

(declare-fun lt!305780 () Unit!22554)

(assert (=> b!655535 (= lt!305780 e!376464)))

(declare-fun c!75517 () Bool)

(declare-datatypes ((SeekEntryResult!6980 0))(
  ( (MissingZero!6980 (index!30279 (_ BitVec 32))) (Found!6980 (index!30280 (_ BitVec 32))) (Intermediate!6980 (undefined!7792 Bool) (index!30281 (_ BitVec 32)) (x!59069 (_ BitVec 32))) (Undefined!6980) (MissingVacant!6980 (index!30282 (_ BitVec 32))) )
))
(declare-fun lt!305764 () SeekEntryResult!6980)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!655535 (= c!75517 (= lt!305764 (Found!6980 index!984)))))

(declare-fun lt!305774 () Unit!22554)

(declare-fun e!376475 () Unit!22554)

(assert (=> b!655535 (= lt!305774 e!376475)))

(declare-fun c!75518 () Bool)

(assert (=> b!655535 (= c!75518 (= lt!305764 Undefined!6980))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!305782 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!305766 () array!38680)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38680 (_ BitVec 32)) SeekEntryResult!6980)

(assert (=> b!655535 (= lt!305764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305782 lt!305766 mask!3053))))

(declare-fun e!376468 () Bool)

(assert (=> b!655535 e!376468))

(declare-fun res!425242 () Bool)

(assert (=> b!655535 (=> (not res!425242) (not e!376468))))

(declare-fun lt!305778 () (_ BitVec 32))

(declare-fun lt!305765 () SeekEntryResult!6980)

(assert (=> b!655535 (= res!425242 (= lt!305765 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305778 vacantSpotIndex!68 lt!305782 lt!305766 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!655535 (= lt!305765 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305778 vacantSpotIndex!68 (select (arr!18540 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!655535 (= lt!305782 (select (store (arr!18540 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305763 () Unit!22554)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38680 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22554)

(assert (=> b!655535 (= lt!305763 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305778 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655535 (= lt!305778 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655536 () Bool)

(declare-fun e!376467 () Bool)

(assert (=> b!655536 (= e!376467 e!376463)))

(declare-fun res!425238 () Bool)

(assert (=> b!655536 (=> (not res!425238) (not e!376463))))

(declare-fun lt!305769 () SeekEntryResult!6980)

(assert (=> b!655536 (= res!425238 (or (= lt!305769 (MissingZero!6980 i!1108)) (= lt!305769 (MissingVacant!6980 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38680 (_ BitVec 32)) SeekEntryResult!6980)

(assert (=> b!655536 (= lt!305769 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655537 () Bool)

(declare-fun res!425249 () Bool)

(assert (=> b!655537 (=> (not res!425249) (not e!376467))))

(declare-fun arrayContainsKey!0 (array!38680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655537 (= res!425249 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655538 () Bool)

(declare-fun e!376465 () Unit!22554)

(declare-fun Unit!22557 () Unit!22554)

(assert (=> b!655538 (= e!376465 Unit!22557)))

(declare-fun e!376476 () Bool)

(declare-fun b!655539 () Bool)

(assert (=> b!655539 (= e!376476 (arrayContainsKey!0 lt!305766 (select (arr!18540 a!2986) j!136) index!984))))

(declare-fun b!655540 () Bool)

(declare-fun res!425248 () Bool)

(assert (=> b!655540 (=> (not res!425248) (not e!376467))))

(assert (=> b!655540 (= res!425248 (and (= (size!18904 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18904 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18904 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655541 () Bool)

(declare-fun e!376466 () Bool)

(assert (=> b!655541 (= e!376466 e!376471)))

(declare-fun res!425252 () Bool)

(assert (=> b!655541 (=> (not res!425252) (not e!376471))))

(declare-fun lt!305770 () SeekEntryResult!6980)

(assert (=> b!655541 (= res!425252 (and (= lt!305770 (Found!6980 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18540 a!2986) index!984) (select (arr!18540 a!2986) j!136))) (not (= (select (arr!18540 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655541 (= lt!305770 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18540 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655542 () Bool)

(declare-fun Unit!22558 () Unit!22554)

(assert (=> b!655542 (= e!376464 Unit!22558)))

(declare-fun res!425245 () Bool)

(assert (=> b!655542 (= res!425245 (= (select (store (arr!18540 a!2986) i!1108 k!1786) index!984) (select (arr!18540 a!2986) j!136)))))

(declare-fun e!376474 () Bool)

(assert (=> b!655542 (=> (not res!425245) (not e!376474))))

(assert (=> b!655542 e!376474))

(declare-fun c!75515 () Bool)

(assert (=> b!655542 (= c!75515 (bvslt j!136 index!984))))

(declare-fun lt!305768 () Unit!22554)

(declare-fun e!376473 () Unit!22554)

(assert (=> b!655542 (= lt!305768 e!376473)))

(declare-fun c!75516 () Bool)

(assert (=> b!655542 (= c!75516 (bvslt index!984 j!136))))

(declare-fun lt!305767 () Unit!22554)

(assert (=> b!655542 (= lt!305767 e!376465)))

(assert (=> b!655542 false))

(declare-fun res!425237 () Bool)

(assert (=> start!59360 (=> (not res!425237) (not e!376467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59360 (= res!425237 (validMask!0 mask!3053))))

(assert (=> start!59360 e!376467))

(assert (=> start!59360 true))

(declare-fun array_inv!14336 (array!38680) Bool)

(assert (=> start!59360 (array_inv!14336 a!2986)))

(declare-fun b!655543 () Bool)

(declare-fun res!425247 () Bool)

(assert (=> b!655543 (=> (not res!425247) (not e!376463))))

(assert (=> b!655543 (= res!425247 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18540 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655544 () Bool)

(declare-fun Unit!22559 () Unit!22554)

(assert (=> b!655544 (= e!376473 Unit!22559)))

(declare-fun b!655545 () Bool)

(declare-fun e!376470 () Bool)

(assert (=> b!655545 (= e!376470 (arrayContainsKey!0 lt!305766 (select (arr!18540 a!2986) j!136) index!984))))

(declare-fun b!655546 () Bool)

(declare-fun Unit!22560 () Unit!22554)

(assert (=> b!655546 (= e!376475 Unit!22560)))

(assert (=> b!655546 false))

(declare-fun res!425246 () Bool)

(declare-fun b!655547 () Bool)

(assert (=> b!655547 (= res!425246 (arrayContainsKey!0 lt!305766 (select (arr!18540 a!2986) j!136) j!136))))

(assert (=> b!655547 (=> (not res!425246) (not e!376470))))

(declare-fun e!376469 () Bool)

(assert (=> b!655547 (= e!376469 e!376470)))

(declare-fun b!655548 () Bool)

(declare-fun Unit!22561 () Unit!22554)

(assert (=> b!655548 (= e!376475 Unit!22561)))

(declare-fun b!655549 () Bool)

(assert (=> b!655549 (= e!376468 (= lt!305770 lt!305765))))

(declare-fun b!655550 () Bool)

(assert (=> b!655550 false))

(declare-fun lt!305773 () Unit!22554)

(declare-datatypes ((List!12581 0))(
  ( (Nil!12578) (Cons!12577 (h!13622 (_ BitVec 64)) (t!18809 List!12581)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38680 (_ BitVec 64) (_ BitVec 32) List!12581) Unit!22554)

(assert (=> b!655550 (= lt!305773 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305766 (select (arr!18540 a!2986) j!136) j!136 Nil!12578))))

(declare-fun arrayNoDuplicates!0 (array!38680 (_ BitVec 32) List!12581) Bool)

(assert (=> b!655550 (arrayNoDuplicates!0 lt!305766 j!136 Nil!12578)))

(declare-fun lt!305776 () Unit!22554)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38680 (_ BitVec 32) (_ BitVec 32)) Unit!22554)

(assert (=> b!655550 (= lt!305776 (lemmaNoDuplicateFromThenFromBigger!0 lt!305766 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655550 (arrayNoDuplicates!0 lt!305766 #b00000000000000000000000000000000 Nil!12578)))

(declare-fun lt!305772 () Unit!22554)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12581) Unit!22554)

(assert (=> b!655550 (= lt!305772 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12578))))

(assert (=> b!655550 (arrayContainsKey!0 lt!305766 (select (arr!18540 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305779 () Unit!22554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22554)

(assert (=> b!655550 (= lt!305779 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305766 (select (arr!18540 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22562 () Unit!22554)

(assert (=> b!655550 (= e!376473 Unit!22562)))

(declare-fun b!655551 () Bool)

(assert (=> b!655551 false))

(declare-fun lt!305777 () Unit!22554)

(assert (=> b!655551 (= lt!305777 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305766 (select (arr!18540 a!2986) j!136) index!984 Nil!12578))))

(assert (=> b!655551 (arrayNoDuplicates!0 lt!305766 index!984 Nil!12578)))

(declare-fun lt!305775 () Unit!22554)

(assert (=> b!655551 (= lt!305775 (lemmaNoDuplicateFromThenFromBigger!0 lt!305766 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655551 (arrayNoDuplicates!0 lt!305766 #b00000000000000000000000000000000 Nil!12578)))

(declare-fun lt!305781 () Unit!22554)

(assert (=> b!655551 (= lt!305781 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12578))))

(assert (=> b!655551 (arrayContainsKey!0 lt!305766 (select (arr!18540 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305771 () Unit!22554)

(assert (=> b!655551 (= lt!305771 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305766 (select (arr!18540 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655551 e!376476))

(declare-fun res!425241 () Bool)

(assert (=> b!655551 (=> (not res!425241) (not e!376476))))

(assert (=> b!655551 (= res!425241 (arrayContainsKey!0 lt!305766 (select (arr!18540 a!2986) j!136) j!136))))

(declare-fun Unit!22563 () Unit!22554)

(assert (=> b!655551 (= e!376465 Unit!22563)))

(declare-fun b!655552 () Bool)

(declare-fun res!425240 () Bool)

(assert (=> b!655552 (=> (not res!425240) (not e!376467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655552 (= res!425240 (validKeyInArray!0 k!1786))))

(declare-fun b!655553 () Bool)

(declare-fun res!425250 () Bool)

(assert (=> b!655553 (= res!425250 (bvsge j!136 index!984))))

(assert (=> b!655553 (=> res!425250 e!376469)))

(assert (=> b!655553 (= e!376474 e!376469)))

(declare-fun b!655554 () Bool)

(declare-fun res!425244 () Bool)

(assert (=> b!655554 (=> (not res!425244) (not e!376467))))

(assert (=> b!655554 (= res!425244 (validKeyInArray!0 (select (arr!18540 a!2986) j!136)))))

(declare-fun b!655555 () Bool)

(declare-fun res!425251 () Bool)

(assert (=> b!655555 (=> (not res!425251) (not e!376463))))

(assert (=> b!655555 (= res!425251 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12578))))

(declare-fun b!655556 () Bool)

(assert (=> b!655556 (= e!376463 e!376466)))

(declare-fun res!425243 () Bool)

(assert (=> b!655556 (=> (not res!425243) (not e!376466))))

(assert (=> b!655556 (= res!425243 (= (select (store (arr!18540 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655556 (= lt!305766 (array!38681 (store (arr!18540 a!2986) i!1108 k!1786) (size!18904 a!2986)))))

(assert (= (and start!59360 res!425237) b!655540))

(assert (= (and b!655540 res!425248) b!655554))

(assert (= (and b!655554 res!425244) b!655552))

(assert (= (and b!655552 res!425240) b!655537))

(assert (= (and b!655537 res!425249) b!655536))

(assert (= (and b!655536 res!425238) b!655533))

(assert (= (and b!655533 res!425239) b!655555))

(assert (= (and b!655555 res!425251) b!655543))

(assert (= (and b!655543 res!425247) b!655556))

(assert (= (and b!655556 res!425243) b!655541))

(assert (= (and b!655541 res!425252) b!655535))

(assert (= (and b!655535 res!425242) b!655549))

(assert (= (and b!655535 c!75518) b!655546))

(assert (= (and b!655535 (not c!75518)) b!655548))

(assert (= (and b!655535 c!75517) b!655542))

(assert (= (and b!655535 (not c!75517)) b!655534))

(assert (= (and b!655542 res!425245) b!655553))

(assert (= (and b!655553 (not res!425250)) b!655547))

(assert (= (and b!655547 res!425246) b!655545))

(assert (= (and b!655542 c!75515) b!655550))

(assert (= (and b!655542 (not c!75515)) b!655544))

(assert (= (and b!655542 c!75516) b!655551))

(assert (= (and b!655542 (not c!75516)) b!655538))

(assert (= (and b!655551 res!425241) b!655539))

(declare-fun m!628607 () Bool)

(assert (=> b!655551 m!628607))

(declare-fun m!628609 () Bool)

(assert (=> b!655551 m!628609))

(declare-fun m!628611 () Bool)

(assert (=> b!655551 m!628611))

(assert (=> b!655551 m!628609))

(declare-fun m!628613 () Bool)

(assert (=> b!655551 m!628613))

(declare-fun m!628615 () Bool)

(assert (=> b!655551 m!628615))

(declare-fun m!628617 () Bool)

(assert (=> b!655551 m!628617))

(assert (=> b!655551 m!628609))

(assert (=> b!655551 m!628609))

(declare-fun m!628619 () Bool)

(assert (=> b!655551 m!628619))

(declare-fun m!628621 () Bool)

(assert (=> b!655551 m!628621))

(assert (=> b!655551 m!628609))

(declare-fun m!628623 () Bool)

(assert (=> b!655551 m!628623))

(assert (=> b!655539 m!628609))

(assert (=> b!655539 m!628609))

(declare-fun m!628625 () Bool)

(assert (=> b!655539 m!628625))

(declare-fun m!628627 () Bool)

(assert (=> b!655555 m!628627))

(declare-fun m!628629 () Bool)

(assert (=> b!655535 m!628629))

(declare-fun m!628631 () Bool)

(assert (=> b!655535 m!628631))

(assert (=> b!655535 m!628609))

(declare-fun m!628633 () Bool)

(assert (=> b!655535 m!628633))

(assert (=> b!655535 m!628609))

(declare-fun m!628635 () Bool)

(assert (=> b!655535 m!628635))

(declare-fun m!628637 () Bool)

(assert (=> b!655535 m!628637))

(declare-fun m!628639 () Bool)

(assert (=> b!655535 m!628639))

(declare-fun m!628641 () Bool)

(assert (=> b!655535 m!628641))

(declare-fun m!628643 () Bool)

(assert (=> b!655537 m!628643))

(declare-fun m!628645 () Bool)

(assert (=> b!655552 m!628645))

(declare-fun m!628647 () Bool)

(assert (=> start!59360 m!628647))

(declare-fun m!628649 () Bool)

(assert (=> start!59360 m!628649))

(declare-fun m!628651 () Bool)

(assert (=> b!655536 m!628651))

(assert (=> b!655554 m!628609))

(assert (=> b!655554 m!628609))

(declare-fun m!628653 () Bool)

(assert (=> b!655554 m!628653))

(declare-fun m!628655 () Bool)

(assert (=> b!655541 m!628655))

(assert (=> b!655541 m!628609))

(assert (=> b!655541 m!628609))

(declare-fun m!628657 () Bool)

(assert (=> b!655541 m!628657))

(assert (=> b!655556 m!628635))

(declare-fun m!628659 () Bool)

(assert (=> b!655556 m!628659))

(declare-fun m!628661 () Bool)

(assert (=> b!655533 m!628661))

(assert (=> b!655550 m!628609))

(declare-fun m!628663 () Bool)

(assert (=> b!655550 m!628663))

(declare-fun m!628665 () Bool)

(assert (=> b!655550 m!628665))

(assert (=> b!655550 m!628609))

(declare-fun m!628667 () Bool)

(assert (=> b!655550 m!628667))

(assert (=> b!655550 m!628621))

(assert (=> b!655550 m!628609))

(declare-fun m!628669 () Bool)

(assert (=> b!655550 m!628669))

(assert (=> b!655550 m!628609))

(declare-fun m!628671 () Bool)

(assert (=> b!655550 m!628671))

(assert (=> b!655550 m!628617))

(declare-fun m!628673 () Bool)

(assert (=> b!655543 m!628673))

(assert (=> b!655545 m!628609))

(assert (=> b!655545 m!628609))

(assert (=> b!655545 m!628625))

(assert (=> b!655547 m!628609))

(assert (=> b!655547 m!628609))

(assert (=> b!655547 m!628611))

(assert (=> b!655542 m!628635))

(declare-fun m!628675 () Bool)

(assert (=> b!655542 m!628675))

(assert (=> b!655542 m!628609))

(push 1)

