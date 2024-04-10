; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56088 () Bool)

(assert start!56088)

(declare-fun b!618623 () Bool)

(declare-fun e!354775 () Bool)

(declare-fun e!354768 () Bool)

(assert (=> b!618623 (= e!354775 e!354768)))

(declare-fun res!398570 () Bool)

(assert (=> b!618623 (=> (not res!398570) (not e!354768))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37558 0))(
  ( (array!37559 (arr!18025 (Array (_ BitVec 32) (_ BitVec 64))) (size!18389 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37558)

(assert (=> b!618623 (= res!398570 (= (select (store (arr!18025 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!285263 () array!37558)

(assert (=> b!618623 (= lt!285263 (array!37559 (store (arr!18025 a!2986) i!1108 k0!1786) (size!18389 a!2986)))))

(declare-fun b!618624 () Bool)

(declare-fun e!354777 () Bool)

(assert (=> b!618624 (= e!354777 true)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!618624 (= (select (store (arr!18025 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618625 () Bool)

(declare-datatypes ((Unit!20378 0))(
  ( (Unit!20379) )
))
(declare-fun e!354774 () Unit!20378)

(declare-fun Unit!20380 () Unit!20378)

(assert (=> b!618625 (= e!354774 Unit!20380)))

(declare-fun b!618626 () Bool)

(declare-fun e!354769 () Bool)

(declare-datatypes ((SeekEntryResult!6465 0))(
  ( (MissingZero!6465 (index!28144 (_ BitVec 32))) (Found!6465 (index!28145 (_ BitVec 32))) (Intermediate!6465 (undefined!7277 Bool) (index!28146 (_ BitVec 32)) (x!56929 (_ BitVec 32))) (Undefined!6465) (MissingVacant!6465 (index!28147 (_ BitVec 32))) )
))
(declare-fun lt!285264 () SeekEntryResult!6465)

(declare-fun lt!285276 () SeekEntryResult!6465)

(assert (=> b!618626 (= e!354769 (= lt!285264 lt!285276))))

(declare-fun b!618627 () Bool)

(declare-fun e!354764 () Unit!20378)

(declare-fun Unit!20381 () Unit!20378)

(assert (=> b!618627 (= e!354764 Unit!20381)))

(assert (=> b!618627 false))

(declare-fun res!398582 () Bool)

(declare-fun e!354767 () Bool)

(assert (=> start!56088 (=> (not res!398582) (not e!354767))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56088 (= res!398582 (validMask!0 mask!3053))))

(assert (=> start!56088 e!354767))

(assert (=> start!56088 true))

(declare-fun array_inv!13821 (array!37558) Bool)

(assert (=> start!56088 (array_inv!13821 a!2986)))

(declare-fun b!618628 () Bool)

(declare-fun e!354763 () Unit!20378)

(declare-fun Unit!20382 () Unit!20378)

(assert (=> b!618628 (= e!354763 Unit!20382)))

(declare-fun b!618629 () Bool)

(declare-fun res!398585 () Bool)

(assert (=> b!618629 (=> (not res!398585) (not e!354775))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618629 (= res!398585 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18025 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618630 () Bool)

(declare-fun res!398574 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!618630 (= res!398574 (bvsge j!136 index!984))))

(declare-fun e!354776 () Bool)

(assert (=> b!618630 (=> res!398574 e!354776)))

(declare-fun e!354770 () Bool)

(assert (=> b!618630 (= e!354770 e!354776)))

(declare-fun b!618631 () Bool)

(declare-fun Unit!20383 () Unit!20378)

(assert (=> b!618631 (= e!354774 Unit!20383)))

(declare-fun res!398571 () Bool)

(assert (=> b!618631 (= res!398571 (= (select (store (arr!18025 a!2986) i!1108 k0!1786) index!984) (select (arr!18025 a!2986) j!136)))))

(assert (=> b!618631 (=> (not res!398571) (not e!354770))))

(assert (=> b!618631 e!354770))

(declare-fun c!70396 () Bool)

(assert (=> b!618631 (= c!70396 (bvslt j!136 index!984))))

(declare-fun lt!285268 () Unit!20378)

(assert (=> b!618631 (= lt!285268 e!354763)))

(declare-fun c!70394 () Bool)

(assert (=> b!618631 (= c!70394 (bvslt index!984 j!136))))

(declare-fun lt!285258 () Unit!20378)

(declare-fun e!354765 () Unit!20378)

(assert (=> b!618631 (= lt!285258 e!354765)))

(assert (=> b!618631 false))

(declare-fun b!618632 () Bool)

(declare-fun res!398584 () Bool)

(assert (=> b!618632 (=> (not res!398584) (not e!354767))))

(assert (=> b!618632 (= res!398584 (and (= (size!18389 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18389 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18389 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618633 () Bool)

(declare-fun e!354771 () Bool)

(declare-fun arrayContainsKey!0 (array!37558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618633 (= e!354771 (arrayContainsKey!0 lt!285263 (select (arr!18025 a!2986) j!136) index!984))))

(declare-fun b!618634 () Bool)

(assert (=> b!618634 false))

(declare-fun lt!285271 () Unit!20378)

(declare-datatypes ((List!12066 0))(
  ( (Nil!12063) (Cons!12062 (h!13107 (_ BitVec 64)) (t!18294 List!12066)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37558 (_ BitVec 64) (_ BitVec 32) List!12066) Unit!20378)

(assert (=> b!618634 (= lt!285271 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285263 (select (arr!18025 a!2986) j!136) index!984 Nil!12063))))

(declare-fun arrayNoDuplicates!0 (array!37558 (_ BitVec 32) List!12066) Bool)

(assert (=> b!618634 (arrayNoDuplicates!0 lt!285263 index!984 Nil!12063)))

(declare-fun lt!285267 () Unit!20378)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37558 (_ BitVec 32) (_ BitVec 32)) Unit!20378)

(assert (=> b!618634 (= lt!285267 (lemmaNoDuplicateFromThenFromBigger!0 lt!285263 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618634 (arrayNoDuplicates!0 lt!285263 #b00000000000000000000000000000000 Nil!12063)))

(declare-fun lt!285262 () Unit!20378)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37558 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12066) Unit!20378)

(assert (=> b!618634 (= lt!285262 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12063))))

(assert (=> b!618634 (arrayContainsKey!0 lt!285263 (select (arr!18025 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285260 () Unit!20378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37558 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20378)

(assert (=> b!618634 (= lt!285260 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285263 (select (arr!18025 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354773 () Bool)

(assert (=> b!618634 e!354773))

(declare-fun res!398569 () Bool)

(assert (=> b!618634 (=> (not res!398569) (not e!354773))))

(assert (=> b!618634 (= res!398569 (arrayContainsKey!0 lt!285263 (select (arr!18025 a!2986) j!136) j!136))))

(declare-fun Unit!20384 () Unit!20378)

(assert (=> b!618634 (= e!354765 Unit!20384)))

(declare-fun b!618635 () Bool)

(assert (=> b!618635 false))

(declare-fun lt!285277 () Unit!20378)

(assert (=> b!618635 (= lt!285277 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285263 (select (arr!18025 a!2986) j!136) j!136 Nil!12063))))

(assert (=> b!618635 (arrayNoDuplicates!0 lt!285263 j!136 Nil!12063)))

(declare-fun lt!285259 () Unit!20378)

(assert (=> b!618635 (= lt!285259 (lemmaNoDuplicateFromThenFromBigger!0 lt!285263 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618635 (arrayNoDuplicates!0 lt!285263 #b00000000000000000000000000000000 Nil!12063)))

(declare-fun lt!285274 () Unit!20378)

(assert (=> b!618635 (= lt!285274 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12063))))

(assert (=> b!618635 (arrayContainsKey!0 lt!285263 (select (arr!18025 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285261 () Unit!20378)

(assert (=> b!618635 (= lt!285261 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285263 (select (arr!18025 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20385 () Unit!20378)

(assert (=> b!618635 (= e!354763 Unit!20385)))

(declare-fun b!618636 () Bool)

(declare-fun res!398577 () Bool)

(assert (=> b!618636 (=> (not res!398577) (not e!354767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618636 (= res!398577 (validKeyInArray!0 k0!1786))))

(declare-fun b!618637 () Bool)

(declare-fun e!354772 () Bool)

(assert (=> b!618637 (= e!354768 e!354772)))

(declare-fun res!398576 () Bool)

(assert (=> b!618637 (=> (not res!398576) (not e!354772))))

(assert (=> b!618637 (= res!398576 (and (= lt!285264 (Found!6465 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18025 a!2986) index!984) (select (arr!18025 a!2986) j!136))) (not (= (select (arr!18025 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37558 (_ BitVec 32)) SeekEntryResult!6465)

(assert (=> b!618637 (= lt!285264 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18025 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618638 () Bool)

(declare-fun res!398573 () Bool)

(assert (=> b!618638 (= res!398573 (arrayContainsKey!0 lt!285263 (select (arr!18025 a!2986) j!136) j!136))))

(assert (=> b!618638 (=> (not res!398573) (not e!354771))))

(assert (=> b!618638 (= e!354776 e!354771)))

(declare-fun b!618639 () Bool)

(declare-fun res!398572 () Bool)

(assert (=> b!618639 (=> (not res!398572) (not e!354775))))

(assert (=> b!618639 (= res!398572 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12063))))

(declare-fun b!618640 () Bool)

(assert (=> b!618640 (= e!354767 e!354775)))

(declare-fun res!398578 () Bool)

(assert (=> b!618640 (=> (not res!398578) (not e!354775))))

(declare-fun lt!285270 () SeekEntryResult!6465)

(assert (=> b!618640 (= res!398578 (or (= lt!285270 (MissingZero!6465 i!1108)) (= lt!285270 (MissingVacant!6465 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37558 (_ BitVec 32)) SeekEntryResult!6465)

(assert (=> b!618640 (= lt!285270 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618641 () Bool)

(assert (=> b!618641 (= e!354773 (arrayContainsKey!0 lt!285263 (select (arr!18025 a!2986) j!136) index!984))))

(declare-fun b!618642 () Bool)

(assert (=> b!618642 (= e!354772 (not e!354777))))

(declare-fun res!398579 () Bool)

(assert (=> b!618642 (=> res!398579 e!354777)))

(declare-fun lt!285266 () SeekEntryResult!6465)

(assert (=> b!618642 (= res!398579 (not (= lt!285266 (MissingVacant!6465 vacantSpotIndex!68))))))

(declare-fun lt!285265 () Unit!20378)

(assert (=> b!618642 (= lt!285265 e!354774)))

(declare-fun c!70395 () Bool)

(assert (=> b!618642 (= c!70395 (= lt!285266 (Found!6465 index!984)))))

(declare-fun lt!285273 () Unit!20378)

(assert (=> b!618642 (= lt!285273 e!354764)))

(declare-fun c!70397 () Bool)

(assert (=> b!618642 (= c!70397 (= lt!285266 Undefined!6465))))

(declare-fun lt!285275 () (_ BitVec 64))

(assert (=> b!618642 (= lt!285266 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285275 lt!285263 mask!3053))))

(assert (=> b!618642 e!354769))

(declare-fun res!398583 () Bool)

(assert (=> b!618642 (=> (not res!398583) (not e!354769))))

(declare-fun lt!285272 () (_ BitVec 32))

(assert (=> b!618642 (= res!398583 (= lt!285276 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285272 vacantSpotIndex!68 lt!285275 lt!285263 mask!3053)))))

(assert (=> b!618642 (= lt!285276 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285272 vacantSpotIndex!68 (select (arr!18025 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618642 (= lt!285275 (select (store (arr!18025 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285269 () Unit!20378)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37558 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20378)

(assert (=> b!618642 (= lt!285269 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285272 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618642 (= lt!285272 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618643 () Bool)

(declare-fun res!398580 () Bool)

(assert (=> b!618643 (=> (not res!398580) (not e!354767))))

(assert (=> b!618643 (= res!398580 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618644 () Bool)

(declare-fun Unit!20386 () Unit!20378)

(assert (=> b!618644 (= e!354764 Unit!20386)))

(declare-fun b!618645 () Bool)

(declare-fun res!398581 () Bool)

(assert (=> b!618645 (=> (not res!398581) (not e!354767))))

(assert (=> b!618645 (= res!398581 (validKeyInArray!0 (select (arr!18025 a!2986) j!136)))))

(declare-fun b!618646 () Bool)

(declare-fun Unit!20387 () Unit!20378)

(assert (=> b!618646 (= e!354765 Unit!20387)))

(declare-fun b!618647 () Bool)

(declare-fun res!398575 () Bool)

(assert (=> b!618647 (=> (not res!398575) (not e!354775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37558 (_ BitVec 32)) Bool)

(assert (=> b!618647 (= res!398575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56088 res!398582) b!618632))

(assert (= (and b!618632 res!398584) b!618645))

(assert (= (and b!618645 res!398581) b!618636))

(assert (= (and b!618636 res!398577) b!618643))

(assert (= (and b!618643 res!398580) b!618640))

(assert (= (and b!618640 res!398578) b!618647))

(assert (= (and b!618647 res!398575) b!618639))

(assert (= (and b!618639 res!398572) b!618629))

(assert (= (and b!618629 res!398585) b!618623))

(assert (= (and b!618623 res!398570) b!618637))

(assert (= (and b!618637 res!398576) b!618642))

(assert (= (and b!618642 res!398583) b!618626))

(assert (= (and b!618642 c!70397) b!618627))

(assert (= (and b!618642 (not c!70397)) b!618644))

(assert (= (and b!618642 c!70395) b!618631))

(assert (= (and b!618642 (not c!70395)) b!618625))

(assert (= (and b!618631 res!398571) b!618630))

(assert (= (and b!618630 (not res!398574)) b!618638))

(assert (= (and b!618638 res!398573) b!618633))

(assert (= (and b!618631 c!70396) b!618635))

(assert (= (and b!618631 (not c!70396)) b!618628))

(assert (= (and b!618631 c!70394) b!618634))

(assert (= (and b!618631 (not c!70394)) b!618646))

(assert (= (and b!618634 res!398569) b!618641))

(assert (= (and b!618642 (not res!398579)) b!618624))

(declare-fun m!594651 () Bool)

(assert (=> b!618643 m!594651))

(declare-fun m!594653 () Bool)

(assert (=> b!618635 m!594653))

(declare-fun m!594655 () Bool)

(assert (=> b!618635 m!594655))

(assert (=> b!618635 m!594653))

(declare-fun m!594657 () Bool)

(assert (=> b!618635 m!594657))

(assert (=> b!618635 m!594653))

(declare-fun m!594659 () Bool)

(assert (=> b!618635 m!594659))

(declare-fun m!594661 () Bool)

(assert (=> b!618635 m!594661))

(assert (=> b!618635 m!594653))

(declare-fun m!594663 () Bool)

(assert (=> b!618635 m!594663))

(declare-fun m!594665 () Bool)

(assert (=> b!618635 m!594665))

(declare-fun m!594667 () Bool)

(assert (=> b!618635 m!594667))

(declare-fun m!594669 () Bool)

(assert (=> b!618629 m!594669))

(declare-fun m!594671 () Bool)

(assert (=> b!618637 m!594671))

(assert (=> b!618637 m!594653))

(assert (=> b!618637 m!594653))

(declare-fun m!594673 () Bool)

(assert (=> b!618637 m!594673))

(assert (=> b!618641 m!594653))

(assert (=> b!618641 m!594653))

(declare-fun m!594675 () Bool)

(assert (=> b!618641 m!594675))

(assert (=> b!618645 m!594653))

(assert (=> b!618645 m!594653))

(declare-fun m!594677 () Bool)

(assert (=> b!618645 m!594677))

(assert (=> b!618633 m!594653))

(assert (=> b!618633 m!594653))

(assert (=> b!618633 m!594675))

(declare-fun m!594679 () Bool)

(assert (=> b!618636 m!594679))

(assert (=> b!618638 m!594653))

(assert (=> b!618638 m!594653))

(declare-fun m!594681 () Bool)

(assert (=> b!618638 m!594681))

(declare-fun m!594683 () Bool)

(assert (=> b!618624 m!594683))

(declare-fun m!594685 () Bool)

(assert (=> b!618624 m!594685))

(declare-fun m!594687 () Bool)

(assert (=> b!618642 m!594687))

(declare-fun m!594689 () Bool)

(assert (=> b!618642 m!594689))

(assert (=> b!618642 m!594653))

(declare-fun m!594691 () Bool)

(assert (=> b!618642 m!594691))

(assert (=> b!618642 m!594683))

(declare-fun m!594693 () Bool)

(assert (=> b!618642 m!594693))

(assert (=> b!618642 m!594653))

(declare-fun m!594695 () Bool)

(assert (=> b!618642 m!594695))

(declare-fun m!594697 () Bool)

(assert (=> b!618642 m!594697))

(declare-fun m!594699 () Bool)

(assert (=> b!618639 m!594699))

(assert (=> b!618631 m!594683))

(assert (=> b!618631 m!594685))

(assert (=> b!618631 m!594653))

(assert (=> b!618623 m!594683))

(declare-fun m!594701 () Bool)

(assert (=> b!618623 m!594701))

(declare-fun m!594703 () Bool)

(assert (=> b!618647 m!594703))

(declare-fun m!594705 () Bool)

(assert (=> b!618634 m!594705))

(assert (=> b!618634 m!594653))

(assert (=> b!618634 m!594681))

(assert (=> b!618634 m!594653))

(assert (=> b!618634 m!594653))

(declare-fun m!594707 () Bool)

(assert (=> b!618634 m!594707))

(assert (=> b!618634 m!594653))

(declare-fun m!594709 () Bool)

(assert (=> b!618634 m!594709))

(assert (=> b!618634 m!594653))

(declare-fun m!594711 () Bool)

(assert (=> b!618634 m!594711))

(declare-fun m!594713 () Bool)

(assert (=> b!618634 m!594713))

(assert (=> b!618634 m!594665))

(assert (=> b!618634 m!594667))

(declare-fun m!594715 () Bool)

(assert (=> b!618640 m!594715))

(declare-fun m!594717 () Bool)

(assert (=> start!56088 m!594717))

(declare-fun m!594719 () Bool)

(assert (=> start!56088 m!594719))

(check-sat (not b!618643) (not b!618642) (not b!618647) (not b!618639) (not b!618638) (not b!618633) (not b!618635) (not b!618634) (not b!618636) (not b!618645) (not b!618640) (not b!618637) (not b!618641) (not start!56088))
(check-sat)
