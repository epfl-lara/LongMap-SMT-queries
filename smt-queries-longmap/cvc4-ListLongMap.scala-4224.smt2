; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58026 () Bool)

(assert start!58026)

(declare-fun b!641606 () Bool)

(declare-fun e!367377 () Bool)

(declare-fun e!367374 () Bool)

(assert (=> b!641606 (= e!367377 e!367374)))

(declare-fun res!415586 () Bool)

(assert (=> b!641606 (=> (not res!415586) (not e!367374))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38372 0))(
  ( (array!38373 (arr!18404 (Array (_ BitVec 32) (_ BitVec 64))) (size!18768 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38372)

(assert (=> b!641606 (= res!415586 (= (select (store (arr!18404 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!297078 () array!38372)

(assert (=> b!641606 (= lt!297078 (array!38373 (store (arr!18404 a!2986) i!1108 k!1786) (size!18768 a!2986)))))

(declare-fun b!641608 () Bool)

(declare-fun e!367372 () Bool)

(assert (=> b!641608 (= e!367374 e!367372)))

(declare-fun res!415589 () Bool)

(assert (=> b!641608 (=> (not res!415589) (not e!367372))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6844 0))(
  ( (MissingZero!6844 (index!29699 (_ BitVec 32))) (Found!6844 (index!29700 (_ BitVec 32))) (Intermediate!6844 (undefined!7656 Bool) (index!29701 (_ BitVec 32)) (x!58457 (_ BitVec 32))) (Undefined!6844) (MissingVacant!6844 (index!29702 (_ BitVec 32))) )
))
(declare-fun lt!297076 () SeekEntryResult!6844)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!641608 (= res!415589 (and (= lt!297076 (Found!6844 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18404 a!2986) index!984) (select (arr!18404 a!2986) j!136))) (not (= (select (arr!18404 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38372 (_ BitVec 32)) SeekEntryResult!6844)

(assert (=> b!641608 (= lt!297076 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18404 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641609 () Bool)

(declare-fun res!415591 () Bool)

(declare-fun e!367378 () Bool)

(assert (=> b!641609 (=> (not res!415591) (not e!367378))))

(declare-fun arrayContainsKey!0 (array!38372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641609 (= res!415591 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641610 () Bool)

(declare-datatypes ((Unit!21710 0))(
  ( (Unit!21711) )
))
(declare-fun e!367383 () Unit!21710)

(declare-fun Unit!21712 () Unit!21710)

(assert (=> b!641610 (= e!367383 Unit!21712)))

(assert (=> b!641610 false))

(declare-fun b!641611 () Bool)

(declare-fun res!415576 () Bool)

(assert (=> b!641611 (=> (not res!415576) (not e!367378))))

(assert (=> b!641611 (= res!415576 (and (= (size!18768 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18768 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18768 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641612 () Bool)

(declare-fun res!415580 () Bool)

(assert (=> b!641612 (=> (not res!415580) (not e!367377))))

(declare-datatypes ((List!12445 0))(
  ( (Nil!12442) (Cons!12441 (h!13486 (_ BitVec 64)) (t!18673 List!12445)) )
))
(declare-fun arrayNoDuplicates!0 (array!38372 (_ BitVec 32) List!12445) Bool)

(assert (=> b!641612 (= res!415580 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12442))))

(declare-fun b!641613 () Bool)

(declare-fun res!415578 () Bool)

(assert (=> b!641613 (=> (not res!415578) (not e!367378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641613 (= res!415578 (validKeyInArray!0 (select (arr!18404 a!2986) j!136)))))

(declare-fun b!641614 () Bool)

(declare-fun e!367371 () Bool)

(declare-fun e!367375 () Bool)

(assert (=> b!641614 (= e!367371 e!367375)))

(declare-fun res!415582 () Bool)

(assert (=> b!641614 (=> (not res!415582) (not e!367375))))

(declare-fun contains!3132 (List!12445 (_ BitVec 64)) Bool)

(assert (=> b!641614 (= res!415582 (not (contains!3132 Nil!12442 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641615 () Bool)

(declare-fun e!367370 () Bool)

(assert (=> b!641615 (= e!367370 e!367371)))

(declare-fun res!415583 () Bool)

(assert (=> b!641615 (=> res!415583 e!367371)))

(assert (=> b!641615 (= res!415583 (or (bvsge (size!18768 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18768 a!2986))))))

(assert (=> b!641615 (arrayNoDuplicates!0 lt!297078 j!136 Nil!12442)))

(declare-fun lt!297074 () Unit!21710)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38372 (_ BitVec 32) (_ BitVec 32)) Unit!21710)

(assert (=> b!641615 (= lt!297074 (lemmaNoDuplicateFromThenFromBigger!0 lt!297078 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641615 (arrayNoDuplicates!0 lt!297078 #b00000000000000000000000000000000 Nil!12442)))

(declare-fun lt!297069 () Unit!21710)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12445) Unit!21710)

(assert (=> b!641615 (= lt!297069 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12442))))

(assert (=> b!641615 (arrayContainsKey!0 lt!297078 (select (arr!18404 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297072 () Unit!21710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21710)

(assert (=> b!641615 (= lt!297072 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297078 (select (arr!18404 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641616 () Bool)

(declare-fun e!367381 () Bool)

(assert (=> b!641616 (= e!367372 (not e!367381))))

(declare-fun res!415584 () Bool)

(assert (=> b!641616 (=> res!415584 e!367381)))

(declare-fun lt!297071 () SeekEntryResult!6844)

(assert (=> b!641616 (= res!415584 (not (= lt!297071 (Found!6844 index!984))))))

(declare-fun lt!297073 () Unit!21710)

(assert (=> b!641616 (= lt!297073 e!367383)))

(declare-fun c!73382 () Bool)

(assert (=> b!641616 (= c!73382 (= lt!297071 Undefined!6844))))

(declare-fun lt!297075 () (_ BitVec 64))

(assert (=> b!641616 (= lt!297071 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297075 lt!297078 mask!3053))))

(declare-fun e!367373 () Bool)

(assert (=> b!641616 e!367373))

(declare-fun res!415581 () Bool)

(assert (=> b!641616 (=> (not res!415581) (not e!367373))))

(declare-fun lt!297070 () (_ BitVec 32))

(declare-fun lt!297067 () SeekEntryResult!6844)

(assert (=> b!641616 (= res!415581 (= lt!297067 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297070 vacantSpotIndex!68 lt!297075 lt!297078 mask!3053)))))

(assert (=> b!641616 (= lt!297067 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297070 vacantSpotIndex!68 (select (arr!18404 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641616 (= lt!297075 (select (store (arr!18404 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297079 () Unit!21710)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38372 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21710)

(assert (=> b!641616 (= lt!297079 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297070 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641616 (= lt!297070 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641607 () Bool)

(declare-fun res!415590 () Bool)

(assert (=> b!641607 (=> (not res!415590) (not e!367377))))

(assert (=> b!641607 (= res!415590 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18404 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!415592 () Bool)

(assert (=> start!58026 (=> (not res!415592) (not e!367378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58026 (= res!415592 (validMask!0 mask!3053))))

(assert (=> start!58026 e!367378))

(assert (=> start!58026 true))

(declare-fun array_inv!14200 (array!38372) Bool)

(assert (=> start!58026 (array_inv!14200 a!2986)))

(declare-fun b!641617 () Bool)

(declare-fun Unit!21713 () Unit!21710)

(assert (=> b!641617 (= e!367383 Unit!21713)))

(declare-fun b!641618 () Bool)

(declare-fun e!367380 () Bool)

(declare-fun e!367382 () Bool)

(assert (=> b!641618 (= e!367380 e!367382)))

(declare-fun res!415593 () Bool)

(assert (=> b!641618 (=> res!415593 e!367382)))

(declare-fun lt!297077 () (_ BitVec 64))

(assert (=> b!641618 (= res!415593 (or (not (= (select (arr!18404 a!2986) j!136) lt!297075)) (not (= (select (arr!18404 a!2986) j!136) lt!297077)) (bvsge j!136 index!984)))))

(declare-fun b!641619 () Bool)

(assert (=> b!641619 (= e!367373 (= lt!297076 lt!297067))))

(declare-fun b!641620 () Bool)

(declare-fun res!415587 () Bool)

(assert (=> b!641620 (=> res!415587 e!367371)))

(declare-fun noDuplicate!404 (List!12445) Bool)

(assert (=> b!641620 (= res!415587 (not (noDuplicate!404 Nil!12442)))))

(declare-fun b!641621 () Bool)

(assert (=> b!641621 (= e!367381 e!367370)))

(declare-fun res!415577 () Bool)

(assert (=> b!641621 (=> res!415577 e!367370)))

(assert (=> b!641621 (= res!415577 (or (not (= (select (arr!18404 a!2986) j!136) lt!297075)) (not (= (select (arr!18404 a!2986) j!136) lt!297077)) (bvsge j!136 index!984)))))

(assert (=> b!641621 e!367380))

(declare-fun res!415579 () Bool)

(assert (=> b!641621 (=> (not res!415579) (not e!367380))))

(assert (=> b!641621 (= res!415579 (= lt!297077 (select (arr!18404 a!2986) j!136)))))

(assert (=> b!641621 (= lt!297077 (select (store (arr!18404 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!641622 () Bool)

(declare-fun e!367379 () Bool)

(assert (=> b!641622 (= e!367382 e!367379)))

(declare-fun res!415595 () Bool)

(assert (=> b!641622 (=> (not res!415595) (not e!367379))))

(assert (=> b!641622 (= res!415595 (arrayContainsKey!0 lt!297078 (select (arr!18404 a!2986) j!136) j!136))))

(declare-fun b!641623 () Bool)

(declare-fun res!415594 () Bool)

(assert (=> b!641623 (=> (not res!415594) (not e!367378))))

(assert (=> b!641623 (= res!415594 (validKeyInArray!0 k!1786))))

(declare-fun b!641624 () Bool)

(assert (=> b!641624 (= e!367378 e!367377)))

(declare-fun res!415588 () Bool)

(assert (=> b!641624 (=> (not res!415588) (not e!367377))))

(declare-fun lt!297068 () SeekEntryResult!6844)

(assert (=> b!641624 (= res!415588 (or (= lt!297068 (MissingZero!6844 i!1108)) (= lt!297068 (MissingVacant!6844 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38372 (_ BitVec 32)) SeekEntryResult!6844)

(assert (=> b!641624 (= lt!297068 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!641625 () Bool)

(assert (=> b!641625 (= e!367379 (arrayContainsKey!0 lt!297078 (select (arr!18404 a!2986) j!136) index!984))))

(declare-fun b!641626 () Bool)

(assert (=> b!641626 (= e!367375 (not (contains!3132 Nil!12442 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641627 () Bool)

(declare-fun res!415585 () Bool)

(assert (=> b!641627 (=> (not res!415585) (not e!367377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38372 (_ BitVec 32)) Bool)

(assert (=> b!641627 (= res!415585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58026 res!415592) b!641611))

(assert (= (and b!641611 res!415576) b!641613))

(assert (= (and b!641613 res!415578) b!641623))

(assert (= (and b!641623 res!415594) b!641609))

(assert (= (and b!641609 res!415591) b!641624))

(assert (= (and b!641624 res!415588) b!641627))

(assert (= (and b!641627 res!415585) b!641612))

(assert (= (and b!641612 res!415580) b!641607))

(assert (= (and b!641607 res!415590) b!641606))

(assert (= (and b!641606 res!415586) b!641608))

(assert (= (and b!641608 res!415589) b!641616))

(assert (= (and b!641616 res!415581) b!641619))

(assert (= (and b!641616 c!73382) b!641610))

(assert (= (and b!641616 (not c!73382)) b!641617))

(assert (= (and b!641616 (not res!415584)) b!641621))

(assert (= (and b!641621 res!415579) b!641618))

(assert (= (and b!641618 (not res!415593)) b!641622))

(assert (= (and b!641622 res!415595) b!641625))

(assert (= (and b!641621 (not res!415577)) b!641615))

(assert (= (and b!641615 (not res!415583)) b!641620))

(assert (= (and b!641620 (not res!415587)) b!641614))

(assert (= (and b!641614 res!415582) b!641626))

(declare-fun m!615409 () Bool)

(assert (=> b!641609 m!615409))

(declare-fun m!615411 () Bool)

(assert (=> b!641615 m!615411))

(declare-fun m!615413 () Bool)

(assert (=> b!641615 m!615413))

(declare-fun m!615415 () Bool)

(assert (=> b!641615 m!615415))

(assert (=> b!641615 m!615411))

(declare-fun m!615417 () Bool)

(assert (=> b!641615 m!615417))

(declare-fun m!615419 () Bool)

(assert (=> b!641615 m!615419))

(declare-fun m!615421 () Bool)

(assert (=> b!641615 m!615421))

(assert (=> b!641615 m!615411))

(declare-fun m!615423 () Bool)

(assert (=> b!641615 m!615423))

(declare-fun m!615425 () Bool)

(assert (=> b!641608 m!615425))

(assert (=> b!641608 m!615411))

(assert (=> b!641608 m!615411))

(declare-fun m!615427 () Bool)

(assert (=> b!641608 m!615427))

(declare-fun m!615429 () Bool)

(assert (=> b!641626 m!615429))

(declare-fun m!615431 () Bool)

(assert (=> b!641606 m!615431))

(declare-fun m!615433 () Bool)

(assert (=> b!641606 m!615433))

(declare-fun m!615435 () Bool)

(assert (=> b!641607 m!615435))

(declare-fun m!615437 () Bool)

(assert (=> start!58026 m!615437))

(declare-fun m!615439 () Bool)

(assert (=> start!58026 m!615439))

(assert (=> b!641613 m!615411))

(assert (=> b!641613 m!615411))

(declare-fun m!615441 () Bool)

(assert (=> b!641613 m!615441))

(declare-fun m!615443 () Bool)

(assert (=> b!641627 m!615443))

(declare-fun m!615445 () Bool)

(assert (=> b!641620 m!615445))

(declare-fun m!615447 () Bool)

(assert (=> b!641624 m!615447))

(declare-fun m!615449 () Bool)

(assert (=> b!641623 m!615449))

(assert (=> b!641621 m!615411))

(assert (=> b!641621 m!615431))

(declare-fun m!615451 () Bool)

(assert (=> b!641621 m!615451))

(declare-fun m!615453 () Bool)

(assert (=> b!641616 m!615453))

(declare-fun m!615455 () Bool)

(assert (=> b!641616 m!615455))

(declare-fun m!615457 () Bool)

(assert (=> b!641616 m!615457))

(assert (=> b!641616 m!615411))

(declare-fun m!615459 () Bool)

(assert (=> b!641616 m!615459))

(assert (=> b!641616 m!615431))

(declare-fun m!615461 () Bool)

(assert (=> b!641616 m!615461))

(assert (=> b!641616 m!615411))

(declare-fun m!615463 () Bool)

(assert (=> b!641616 m!615463))

(declare-fun m!615465 () Bool)

(assert (=> b!641612 m!615465))

(assert (=> b!641622 m!615411))

(assert (=> b!641622 m!615411))

(declare-fun m!615467 () Bool)

(assert (=> b!641622 m!615467))

(assert (=> b!641618 m!615411))

(assert (=> b!641625 m!615411))

(assert (=> b!641625 m!615411))

(declare-fun m!615469 () Bool)

(assert (=> b!641625 m!615469))

(declare-fun m!615471 () Bool)

(assert (=> b!641614 m!615471))

(push 1)

(assert (not b!641612))

(assert (not b!641624))

(assert (not b!641614))

(assert (not start!58026))

(assert (not b!641616))

(assert (not b!641622))

(assert (not b!641613))

(assert (not b!641608))

(assert (not b!641615))

(assert (not b!641620))

(assert (not b!641627))

(assert (not b!641623))

(assert (not b!641625))

(assert (not b!641626))

(assert (not b!641609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!641727 () Bool)

(declare-fun e!367455 () Bool)

(declare-fun call!33544 () Bool)

(assert (=> b!641727 (= e!367455 call!33544)))

(declare-fun bm!33541 () Bool)

(declare-fun c!73414 () Bool)

(assert (=> bm!33541 (= call!33544 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73414 (Cons!12441 (select (arr!18404 a!2986) #b00000000000000000000000000000000) Nil!12442) Nil!12442)))))

(declare-fun b!641728 () Bool)

(declare-fun e!367453 () Bool)

(declare-fun e!367454 () Bool)

(assert (=> b!641728 (= e!367453 e!367454)))

(declare-fun res!415633 () Bool)

(assert (=> b!641728 (=> (not res!415633) (not e!367454))))

(declare-fun e!367452 () Bool)

(assert (=> b!641728 (= res!415633 (not e!367452))))

(declare-fun res!415635 () Bool)

(assert (=> b!641728 (=> (not res!415635) (not e!367452))))

(assert (=> b!641728 (= res!415635 (validKeyInArray!0 (select (arr!18404 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90645 () Bool)

(declare-fun res!415634 () Bool)

(assert (=> d!90645 (=> res!415634 e!367453)))

(assert (=> d!90645 (= res!415634 (bvsge #b00000000000000000000000000000000 (size!18768 a!2986)))))

(assert (=> d!90645 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12442) e!367453)))

(declare-fun b!641729 () Bool)

(assert (=> b!641729 (= e!367452 (contains!3132 Nil!12442 (select (arr!18404 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641730 () Bool)

(assert (=> b!641730 (= e!367455 call!33544)))

(declare-fun b!641731 () Bool)

(assert (=> b!641731 (= e!367454 e!367455)))

(assert (=> b!641731 (= c!73414 (validKeyInArray!0 (select (arr!18404 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90645 (not res!415634)) b!641728))

(assert (= (and b!641728 res!415635) b!641729))

(assert (= (and b!641728 res!415633) b!641731))

(assert (= (and b!641731 c!73414) b!641727))

(assert (= (and b!641731 (not c!73414)) b!641730))

(assert (= (or b!641727 b!641730) bm!33541))

(declare-fun m!615515 () Bool)

(assert (=> bm!33541 m!615515))

(declare-fun m!615517 () Bool)

(assert (=> bm!33541 m!615517))

(assert (=> b!641728 m!615515))

(assert (=> b!641728 m!615515))

(declare-fun m!615519 () Bool)

(assert (=> b!641728 m!615519))

(assert (=> b!641729 m!615515))

(assert (=> b!641729 m!615515))

(declare-fun m!615521 () Bool)

(assert (=> b!641729 m!615521))

(assert (=> b!641731 m!615515))

(assert (=> b!641731 m!615515))

(assert (=> b!641731 m!615519))

(assert (=> b!641612 d!90645))

(declare-fun d!90649 () Bool)

(declare-fun res!415648 () Bool)

(declare-fun e!367478 () Bool)

(assert (=> d!90649 (=> res!415648 e!367478)))

(assert (=> d!90649 (= res!415648 (= (select (arr!18404 lt!297078) j!136) (select (arr!18404 a!2986) j!136)))))

(assert (=> d!90649 (= (arrayContainsKey!0 lt!297078 (select (arr!18404 a!2986) j!136) j!136) e!367478)))

(declare-fun b!641764 () Bool)

(declare-fun e!367479 () Bool)

(assert (=> b!641764 (= e!367478 e!367479)))

(declare-fun res!415649 () Bool)

(assert (=> b!641764 (=> (not res!415649) (not e!367479))))

(assert (=> b!641764 (= res!415649 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18768 lt!297078)))))

(declare-fun b!641765 () Bool)

(assert (=> b!641765 (= e!367479 (arrayContainsKey!0 lt!297078 (select (arr!18404 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90649 (not res!415648)) b!641764))

(assert (= (and b!641764 res!415649) b!641765))

(declare-fun m!615567 () Bool)

(assert (=> d!90649 m!615567))

(assert (=> b!641765 m!615411))

(declare-fun m!615569 () Bool)

(assert (=> b!641765 m!615569))

(assert (=> b!641622 d!90649))

(declare-fun b!641829 () Bool)

(declare-fun e!367525 () SeekEntryResult!6844)

(declare-fun lt!297142 () SeekEntryResult!6844)

(assert (=> b!641829 (= e!367525 (MissingZero!6844 (index!29701 lt!297142)))))

(declare-fun b!641830 () Bool)

(declare-fun e!367524 () SeekEntryResult!6844)

(declare-fun e!367523 () SeekEntryResult!6844)

(assert (=> b!641830 (= e!367524 e!367523)))

(declare-fun lt!297144 () (_ BitVec 64))

(assert (=> b!641830 (= lt!297144 (select (arr!18404 a!2986) (index!29701 lt!297142)))))

(declare-fun c!73446 () Bool)

(assert (=> b!641830 (= c!73446 (= lt!297144 k!1786))))

(declare-fun b!641831 () Bool)

(assert (=> b!641831 (= e!367523 (Found!6844 (index!29701 lt!297142)))))

(declare-fun b!641832 () Bool)

(assert (=> b!641832 (= e!367524 Undefined!6844)))

(declare-fun b!641833 () Bool)

(assert (=> b!641833 (= e!367525 (seekKeyOrZeroReturnVacant!0 (x!58457 lt!297142) (index!29701 lt!297142) (index!29701 lt!297142) k!1786 a!2986 mask!3053))))

(declare-fun b!641834 () Bool)

(declare-fun c!73447 () Bool)

(assert (=> b!641834 (= c!73447 (= lt!297144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641834 (= e!367523 e!367525)))

(declare-fun d!90661 () Bool)

(declare-fun lt!297143 () SeekEntryResult!6844)

(assert (=> d!90661 (and (or (is-Undefined!6844 lt!297143) (not (is-Found!6844 lt!297143)) (and (bvsge (index!29700 lt!297143) #b00000000000000000000000000000000) (bvslt (index!29700 lt!297143) (size!18768 a!2986)))) (or (is-Undefined!6844 lt!297143) (is-Found!6844 lt!297143) (not (is-MissingZero!6844 lt!297143)) (and (bvsge (index!29699 lt!297143) #b00000000000000000000000000000000) (bvslt (index!29699 lt!297143) (size!18768 a!2986)))) (or (is-Undefined!6844 lt!297143) (is-Found!6844 lt!297143) (is-MissingZero!6844 lt!297143) (not (is-MissingVacant!6844 lt!297143)) (and (bvsge (index!29702 lt!297143) #b00000000000000000000000000000000) (bvslt (index!29702 lt!297143) (size!18768 a!2986)))) (or (is-Undefined!6844 lt!297143) (ite (is-Found!6844 lt!297143) (= (select (arr!18404 a!2986) (index!29700 lt!297143)) k!1786) (ite (is-MissingZero!6844 lt!297143) (= (select (arr!18404 a!2986) (index!29699 lt!297143)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6844 lt!297143) (= (select (arr!18404 a!2986) (index!29702 lt!297143)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90661 (= lt!297143 e!367524)))

(declare-fun c!73445 () Bool)

(assert (=> d!90661 (= c!73445 (and (is-Intermediate!6844 lt!297142) (undefined!7656 lt!297142)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38372 (_ BitVec 32)) SeekEntryResult!6844)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90661 (= lt!297142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90661 (validMask!0 mask!3053)))

(assert (=> d!90661 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!297143)))

(assert (= (and d!90661 c!73445) b!641832))

(assert (= (and d!90661 (not c!73445)) b!641830))

(assert (= (and b!641830 c!73446) b!641831))

(assert (= (and b!641830 (not c!73446)) b!641834))

(assert (= (and b!641834 c!73447) b!641829))

(assert (= (and b!641834 (not c!73447)) b!641833))

(declare-fun m!615623 () Bool)

(assert (=> b!641830 m!615623))

(declare-fun m!615625 () Bool)

(assert (=> b!641833 m!615625))

(declare-fun m!615627 () Bool)

(assert (=> d!90661 m!615627))

(declare-fun m!615629 () Bool)

(assert (=> d!90661 m!615629))

(assert (=> d!90661 m!615629))

(declare-fun m!615631 () Bool)

(assert (=> d!90661 m!615631))

(assert (=> d!90661 m!615437))

(declare-fun m!615633 () Bool)

(assert (=> d!90661 m!615633))

(declare-fun m!615635 () Bool)

(assert (=> d!90661 m!615635))

(assert (=> b!641624 d!90661))

(declare-fun d!90683 () Bool)

(assert (=> d!90683 (= (validKeyInArray!0 (select (arr!18404 a!2986) j!136)) (and (not (= (select (arr!18404 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18404 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641613 d!90683))

(declare-fun d!90689 () Bool)

(assert (=> d!90689 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641623 d!90689))

(declare-fun d!90691 () Bool)

(declare-fun res!415677 () Bool)

(declare-fun e!367530 () Bool)

(assert (=> d!90691 (=> res!415677 e!367530)))

(assert (=> d!90691 (= res!415677 (= (select (arr!18404 lt!297078) index!984) (select (arr!18404 a!2986) j!136)))))

(assert (=> d!90691 (= (arrayContainsKey!0 lt!297078 (select (arr!18404 a!2986) j!136) index!984) e!367530)))

(declare-fun b!641839 () Bool)

(declare-fun e!367531 () Bool)

(assert (=> b!641839 (= e!367530 e!367531)))

(declare-fun res!415678 () Bool)

(assert (=> b!641839 (=> (not res!415678) (not e!367531))))

(assert (=> b!641839 (= res!415678 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18768 lt!297078)))))

(declare-fun b!641840 () Bool)

(assert (=> b!641840 (= e!367531 (arrayContainsKey!0 lt!297078 (select (arr!18404 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90691 (not res!415677)) b!641839))

(assert (= (and b!641839 res!415678) b!641840))

(declare-fun m!615637 () Bool)

(assert (=> d!90691 m!615637))

(assert (=> b!641840 m!615411))

(declare-fun m!615639 () Bool)

(assert (=> b!641840 m!615639))

(assert (=> b!641625 d!90691))

(declare-fun d!90693 () Bool)

(declare-fun lt!297154 () Bool)

(declare-fun content!247 (List!12445) (Set (_ BitVec 64)))

(assert (=> d!90693 (= lt!297154 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!247 Nil!12442)))))

(declare-fun e!367538 () Bool)

(assert (=> d!90693 (= lt!297154 e!367538)))

(declare-fun res!415684 () Bool)

(assert (=> d!90693 (=> (not res!415684) (not e!367538))))

(assert (=> d!90693 (= res!415684 (is-Cons!12441 Nil!12442))))

(assert (=> d!90693 (= (contains!3132 Nil!12442 #b0000000000000000000000000000000000000000000000000000000000000000) lt!297154)))

(declare-fun b!641846 () Bool)

(declare-fun e!367537 () Bool)

(assert (=> b!641846 (= e!367538 e!367537)))

(declare-fun res!415685 () Bool)

(assert (=> b!641846 (=> res!415685 e!367537)))

(assert (=> b!641846 (= res!415685 (= (h!13486 Nil!12442) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641847 () Bool)

(assert (=> b!641847 (= e!367537 (contains!3132 (t!18673 Nil!12442) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90693 res!415684) b!641846))

(assert (= (and b!641846 (not res!415685)) b!641847))

(declare-fun m!615647 () Bool)

(assert (=> d!90693 m!615647))

(declare-fun m!615649 () Bool)

(assert (=> d!90693 m!615649))

(declare-fun m!615651 () Bool)

(assert (=> b!641847 m!615651))

(assert (=> b!641614 d!90693))

(declare-fun b!641869 () Bool)

(declare-fun c!73456 () Bool)

(declare-fun lt!297166 () (_ BitVec 64))

(assert (=> b!641869 (= c!73456 (= lt!297166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367554 () SeekEntryResult!6844)

(declare-fun e!367556 () SeekEntryResult!6844)

(assert (=> b!641869 (= e!367554 e!367556)))

(declare-fun b!641870 () Bool)

(assert (=> b!641870 (= e!367556 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297075 lt!297078 mask!3053))))

(declare-fun b!641871 () Bool)

(declare-fun e!367555 () SeekEntryResult!6844)

(assert (=> b!641871 (= e!367555 e!367554)))

(declare-fun c!73454 () Bool)

(assert (=> b!641871 (= c!73454 (= lt!297166 lt!297075))))

(declare-fun b!641872 () Bool)

(assert (=> b!641872 (= e!367556 (MissingVacant!6844 vacantSpotIndex!68))))

(declare-fun b!641873 () Bool)

(assert (=> b!641873 (= e!367555 Undefined!6844)))

(declare-fun b!641874 () Bool)

(assert (=> b!641874 (= e!367554 (Found!6844 index!984))))

(declare-fun lt!297167 () SeekEntryResult!6844)

(declare-fun d!90699 () Bool)

(assert (=> d!90699 (and (or (is-Undefined!6844 lt!297167) (not (is-Found!6844 lt!297167)) (and (bvsge (index!29700 lt!297167) #b00000000000000000000000000000000) (bvslt (index!29700 lt!297167) (size!18768 lt!297078)))) (or (is-Undefined!6844 lt!297167) (is-Found!6844 lt!297167) (not (is-MissingVacant!6844 lt!297167)) (not (= (index!29702 lt!297167) vacantSpotIndex!68)) (and (bvsge (index!29702 lt!297167) #b00000000000000000000000000000000) (bvslt (index!29702 lt!297167) (size!18768 lt!297078)))) (or (is-Undefined!6844 lt!297167) (ite (is-Found!6844 lt!297167) (= (select (arr!18404 lt!297078) (index!29700 lt!297167)) lt!297075) (and (is-MissingVacant!6844 lt!297167) (= (index!29702 lt!297167) vacantSpotIndex!68) (= (select (arr!18404 lt!297078) (index!29702 lt!297167)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90699 (= lt!297167 e!367555)))

(declare-fun c!73455 () Bool)

(assert (=> d!90699 (= c!73455 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90699 (= lt!297166 (select (arr!18404 lt!297078) index!984))))

(assert (=> d!90699 (validMask!0 mask!3053)))

(assert (=> d!90699 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297075 lt!297078 mask!3053) lt!297167)))

(assert (= (and d!90699 c!73455) b!641873))

(assert (= (and d!90699 (not c!73455)) b!641871))

(assert (= (and b!641871 c!73454) b!641874))

(assert (= (and b!641871 (not c!73454)) b!641869))

(assert (= (and b!641869 c!73456) b!641872))

(assert (= (and b!641869 (not c!73456)) b!641870))

(assert (=> b!641870 m!615453))

(assert (=> b!641870 m!615453))

(declare-fun m!615667 () Bool)

(assert (=> b!641870 m!615667))

(declare-fun m!615669 () Bool)

