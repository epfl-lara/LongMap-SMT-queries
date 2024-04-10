; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55022 () Bool)

(assert start!55022)

(declare-fun b!602531 () Bool)

(declare-fun e!344603 () Bool)

(declare-datatypes ((SeekEntryResult!6286 0))(
  ( (MissingZero!6286 (index!27404 (_ BitVec 32))) (Found!6286 (index!27405 (_ BitVec 32))) (Intermediate!6286 (undefined!7098 Bool) (index!27406 (_ BitVec 32)) (x!56198 (_ BitVec 32))) (Undefined!6286) (MissingVacant!6286 (index!27407 (_ BitVec 32))) )
))
(declare-fun lt!274480 () SeekEntryResult!6286)

(declare-fun lt!274477 () SeekEntryResult!6286)

(assert (=> b!602531 (= e!344603 (= lt!274480 lt!274477))))

(declare-fun res!386952 () Bool)

(declare-fun e!344604 () Bool)

(assert (=> start!55022 (=> (not res!386952) (not e!344604))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55022 (= res!386952 (validMask!0 mask!3053))))

(assert (=> start!55022 e!344604))

(assert (=> start!55022 true))

(declare-datatypes ((array!37176 0))(
  ( (array!37177 (arr!17846 (Array (_ BitVec 32) (_ BitVec 64))) (size!18210 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37176)

(declare-fun array_inv!13642 (array!37176) Bool)

(assert (=> start!55022 (array_inv!13642 a!2986)))

(declare-fun b!602532 () Bool)

(declare-fun e!344602 () Bool)

(declare-fun e!344606 () Bool)

(assert (=> b!602532 (= e!344602 e!344606)))

(declare-fun res!386943 () Bool)

(assert (=> b!602532 (=> (not res!386943) (not e!344606))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!274483 () array!37176)

(declare-fun arrayContainsKey!0 (array!37176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602532 (= res!386943 (arrayContainsKey!0 lt!274483 (select (arr!17846 a!2986) j!136) j!136))))

(declare-fun b!602533 () Bool)

(declare-fun e!344601 () Bool)

(declare-fun e!344609 () Bool)

(assert (=> b!602533 (= e!344601 e!344609)))

(declare-fun res!386942 () Bool)

(assert (=> b!602533 (=> (not res!386942) (not e!344609))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!602533 (= res!386942 (= (select (store (arr!17846 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602533 (= lt!274483 (array!37177 (store (arr!17846 a!2986) i!1108 k!1786) (size!18210 a!2986)))))

(declare-fun b!602534 () Bool)

(declare-fun e!344608 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602534 (= e!344608 (or (bvsge index!984 (size!18210 a!2986)) (bvslt (size!18210 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!602534 (arrayContainsKey!0 lt!274483 (select (arr!17846 a!2986) j!136) j!136)))

(declare-fun b!602535 () Bool)

(declare-datatypes ((Unit!19096 0))(
  ( (Unit!19097) )
))
(declare-fun e!344607 () Unit!19096)

(declare-fun Unit!19098 () Unit!19096)

(assert (=> b!602535 (= e!344607 Unit!19098)))

(declare-fun b!602536 () Bool)

(declare-fun e!344612 () Bool)

(assert (=> b!602536 (= e!344609 e!344612)))

(declare-fun res!386944 () Bool)

(assert (=> b!602536 (=> (not res!386944) (not e!344612))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!602536 (= res!386944 (and (= lt!274480 (Found!6286 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17846 a!2986) index!984) (select (arr!17846 a!2986) j!136))) (not (= (select (arr!17846 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37176 (_ BitVec 32)) SeekEntryResult!6286)

(assert (=> b!602536 (= lt!274480 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17846 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602537 () Bool)

(declare-fun e!344605 () Bool)

(assert (=> b!602537 (= e!344605 e!344608)))

(declare-fun res!386938 () Bool)

(assert (=> b!602537 (=> res!386938 e!344608)))

(assert (=> b!602537 (= res!386938 (bvsge index!984 j!136))))

(declare-fun lt!274476 () Unit!19096)

(assert (=> b!602537 (= lt!274476 e!344607)))

(declare-fun c!68165 () Bool)

(assert (=> b!602537 (= c!68165 (bvslt j!136 index!984))))

(declare-fun b!602538 () Bool)

(declare-fun res!386945 () Bool)

(assert (=> b!602538 (=> (not res!386945) (not e!344604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602538 (= res!386945 (validKeyInArray!0 k!1786))))

(declare-fun b!602539 () Bool)

(declare-fun Unit!19099 () Unit!19096)

(assert (=> b!602539 (= e!344607 Unit!19099)))

(declare-fun lt!274481 () Unit!19096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19096)

(assert (=> b!602539 (= lt!274481 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274483 (select (arr!17846 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602539 (arrayContainsKey!0 lt!274483 (select (arr!17846 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274478 () Unit!19096)

(declare-datatypes ((List!11887 0))(
  ( (Nil!11884) (Cons!11883 (h!12928 (_ BitVec 64)) (t!18115 List!11887)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11887) Unit!19096)

(assert (=> b!602539 (= lt!274478 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11884))))

(declare-fun arrayNoDuplicates!0 (array!37176 (_ BitVec 32) List!11887) Bool)

(assert (=> b!602539 (arrayNoDuplicates!0 lt!274483 #b00000000000000000000000000000000 Nil!11884)))

(declare-fun lt!274479 () Unit!19096)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37176 (_ BitVec 32) (_ BitVec 32)) Unit!19096)

(assert (=> b!602539 (= lt!274479 (lemmaNoDuplicateFromThenFromBigger!0 lt!274483 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602539 (arrayNoDuplicates!0 lt!274483 j!136 Nil!11884)))

(declare-fun lt!274472 () Unit!19096)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37176 (_ BitVec 64) (_ BitVec 32) List!11887) Unit!19096)

(assert (=> b!602539 (= lt!274472 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274483 (select (arr!17846 a!2986) j!136) j!136 Nil!11884))))

(assert (=> b!602539 false))

(declare-fun b!602540 () Bool)

(declare-fun e!344613 () Bool)

(assert (=> b!602540 (= e!344612 (not e!344613))))

(declare-fun res!386951 () Bool)

(assert (=> b!602540 (=> res!386951 e!344613)))

(declare-fun lt!274482 () SeekEntryResult!6286)

(assert (=> b!602540 (= res!386951 (not (= lt!274482 (Found!6286 index!984))))))

(declare-fun lt!274473 () Unit!19096)

(declare-fun e!344600 () Unit!19096)

(assert (=> b!602540 (= lt!274473 e!344600)))

(declare-fun c!68164 () Bool)

(assert (=> b!602540 (= c!68164 (= lt!274482 Undefined!6286))))

(declare-fun lt!274471 () (_ BitVec 64))

(assert (=> b!602540 (= lt!274482 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274471 lt!274483 mask!3053))))

(assert (=> b!602540 e!344603))

(declare-fun res!386948 () Bool)

(assert (=> b!602540 (=> (not res!386948) (not e!344603))))

(declare-fun lt!274475 () (_ BitVec 32))

(assert (=> b!602540 (= res!386948 (= lt!274477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274475 vacantSpotIndex!68 lt!274471 lt!274483 mask!3053)))))

(assert (=> b!602540 (= lt!274477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274475 vacantSpotIndex!68 (select (arr!17846 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602540 (= lt!274471 (select (store (arr!17846 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274469 () Unit!19096)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19096)

(assert (=> b!602540 (= lt!274469 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274475 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602540 (= lt!274475 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602541 () Bool)

(declare-fun res!386939 () Bool)

(assert (=> b!602541 (=> (not res!386939) (not e!344604))))

(assert (=> b!602541 (= res!386939 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602542 () Bool)

(declare-fun Unit!19100 () Unit!19096)

(assert (=> b!602542 (= e!344600 Unit!19100)))

(assert (=> b!602542 false))

(declare-fun b!602543 () Bool)

(declare-fun res!386937 () Bool)

(assert (=> b!602543 (=> (not res!386937) (not e!344604))))

(assert (=> b!602543 (= res!386937 (and (= (size!18210 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18210 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18210 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602544 () Bool)

(declare-fun res!386953 () Bool)

(assert (=> b!602544 (=> (not res!386953) (not e!344601))))

(assert (=> b!602544 (= res!386953 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17846 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602545 () Bool)

(assert (=> b!602545 (= e!344604 e!344601)))

(declare-fun res!386954 () Bool)

(assert (=> b!602545 (=> (not res!386954) (not e!344601))))

(declare-fun lt!274474 () SeekEntryResult!6286)

(assert (=> b!602545 (= res!386954 (or (= lt!274474 (MissingZero!6286 i!1108)) (= lt!274474 (MissingVacant!6286 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37176 (_ BitVec 32)) SeekEntryResult!6286)

(assert (=> b!602545 (= lt!274474 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!602546 () Bool)

(declare-fun res!386941 () Bool)

(assert (=> b!602546 (=> (not res!386941) (not e!344604))))

(assert (=> b!602546 (= res!386941 (validKeyInArray!0 (select (arr!17846 a!2986) j!136)))))

(declare-fun b!602547 () Bool)

(assert (=> b!602547 (= e!344606 (arrayContainsKey!0 lt!274483 (select (arr!17846 a!2986) j!136) index!984))))

(declare-fun b!602548 () Bool)

(assert (=> b!602548 (= e!344613 e!344605)))

(declare-fun res!386940 () Bool)

(assert (=> b!602548 (=> res!386940 e!344605)))

(declare-fun lt!274470 () (_ BitVec 64))

(assert (=> b!602548 (= res!386940 (or (not (= (select (arr!17846 a!2986) j!136) lt!274471)) (not (= (select (arr!17846 a!2986) j!136) lt!274470))))))

(declare-fun e!344611 () Bool)

(assert (=> b!602548 e!344611))

(declare-fun res!386946 () Bool)

(assert (=> b!602548 (=> (not res!386946) (not e!344611))))

(assert (=> b!602548 (= res!386946 (= lt!274470 (select (arr!17846 a!2986) j!136)))))

(assert (=> b!602548 (= lt!274470 (select (store (arr!17846 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602549 () Bool)

(declare-fun res!386947 () Bool)

(assert (=> b!602549 (=> (not res!386947) (not e!344601))))

(assert (=> b!602549 (= res!386947 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11884))))

(declare-fun b!602550 () Bool)

(declare-fun Unit!19101 () Unit!19096)

(assert (=> b!602550 (= e!344600 Unit!19101)))

(declare-fun b!602551 () Bool)

(assert (=> b!602551 (= e!344611 e!344602)))

(declare-fun res!386949 () Bool)

(assert (=> b!602551 (=> res!386949 e!344602)))

(assert (=> b!602551 (= res!386949 (or (not (= (select (arr!17846 a!2986) j!136) lt!274471)) (not (= (select (arr!17846 a!2986) j!136) lt!274470)) (bvsge j!136 index!984)))))

(declare-fun b!602552 () Bool)

(declare-fun res!386950 () Bool)

(assert (=> b!602552 (=> (not res!386950) (not e!344601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37176 (_ BitVec 32)) Bool)

(assert (=> b!602552 (= res!386950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55022 res!386952) b!602543))

(assert (= (and b!602543 res!386937) b!602546))

(assert (= (and b!602546 res!386941) b!602538))

(assert (= (and b!602538 res!386945) b!602541))

(assert (= (and b!602541 res!386939) b!602545))

(assert (= (and b!602545 res!386954) b!602552))

(assert (= (and b!602552 res!386950) b!602549))

(assert (= (and b!602549 res!386947) b!602544))

(assert (= (and b!602544 res!386953) b!602533))

(assert (= (and b!602533 res!386942) b!602536))

(assert (= (and b!602536 res!386944) b!602540))

(assert (= (and b!602540 res!386948) b!602531))

(assert (= (and b!602540 c!68164) b!602542))

(assert (= (and b!602540 (not c!68164)) b!602550))

(assert (= (and b!602540 (not res!386951)) b!602548))

(assert (= (and b!602548 res!386946) b!602551))

(assert (= (and b!602551 (not res!386949)) b!602532))

(assert (= (and b!602532 res!386943) b!602547))

(assert (= (and b!602548 (not res!386940)) b!602537))

(assert (= (and b!602537 c!68165) b!602539))

(assert (= (and b!602537 (not c!68165)) b!602535))

(assert (= (and b!602537 (not res!386938)) b!602534))

(declare-fun m!579641 () Bool)

(assert (=> b!602548 m!579641))

(declare-fun m!579643 () Bool)

(assert (=> b!602548 m!579643))

(declare-fun m!579645 () Bool)

(assert (=> b!602548 m!579645))

(declare-fun m!579647 () Bool)

(assert (=> b!602552 m!579647))

(assert (=> b!602532 m!579641))

(assert (=> b!602532 m!579641))

(declare-fun m!579649 () Bool)

(assert (=> b!602532 m!579649))

(declare-fun m!579651 () Bool)

(assert (=> b!602538 m!579651))

(assert (=> b!602547 m!579641))

(assert (=> b!602547 m!579641))

(declare-fun m!579653 () Bool)

(assert (=> b!602547 m!579653))

(declare-fun m!579655 () Bool)

(assert (=> b!602544 m!579655))

(assert (=> b!602534 m!579641))

(assert (=> b!602534 m!579641))

(assert (=> b!602534 m!579649))

(assert (=> b!602546 m!579641))

(assert (=> b!602546 m!579641))

(declare-fun m!579657 () Bool)

(assert (=> b!602546 m!579657))

(declare-fun m!579659 () Bool)

(assert (=> b!602545 m!579659))

(declare-fun m!579661 () Bool)

(assert (=> b!602549 m!579661))

(declare-fun m!579663 () Bool)

(assert (=> b!602541 m!579663))

(declare-fun m!579665 () Bool)

(assert (=> start!55022 m!579665))

(declare-fun m!579667 () Bool)

(assert (=> start!55022 m!579667))

(assert (=> b!602533 m!579643))

(declare-fun m!579669 () Bool)

(assert (=> b!602533 m!579669))

(assert (=> b!602539 m!579641))

(declare-fun m!579671 () Bool)

(assert (=> b!602539 m!579671))

(assert (=> b!602539 m!579641))

(declare-fun m!579673 () Bool)

(assert (=> b!602539 m!579673))

(assert (=> b!602539 m!579641))

(declare-fun m!579675 () Bool)

(assert (=> b!602539 m!579675))

(assert (=> b!602539 m!579641))

(declare-fun m!579677 () Bool)

(assert (=> b!602539 m!579677))

(declare-fun m!579679 () Bool)

(assert (=> b!602539 m!579679))

(declare-fun m!579681 () Bool)

(assert (=> b!602539 m!579681))

(declare-fun m!579683 () Bool)

(assert (=> b!602539 m!579683))

(declare-fun m!579685 () Bool)

(assert (=> b!602540 m!579685))

(declare-fun m!579687 () Bool)

(assert (=> b!602540 m!579687))

(declare-fun m!579689 () Bool)

(assert (=> b!602540 m!579689))

(assert (=> b!602540 m!579641))

(declare-fun m!579691 () Bool)

(assert (=> b!602540 m!579691))

(assert (=> b!602540 m!579641))

(assert (=> b!602540 m!579643))

(declare-fun m!579693 () Bool)

(assert (=> b!602540 m!579693))

(declare-fun m!579695 () Bool)

(assert (=> b!602540 m!579695))

(declare-fun m!579697 () Bool)

(assert (=> b!602536 m!579697))

(assert (=> b!602536 m!579641))

(assert (=> b!602536 m!579641))

(declare-fun m!579699 () Bool)

(assert (=> b!602536 m!579699))

(assert (=> b!602551 m!579641))

(push 1)

(assert (not b!602545))

(assert (not b!602534))

(assert (not b!602539))

(assert (not b!602536))

(assert (not b!602547))

(assert (not b!602538))

(assert (not b!602552))

(assert (not b!602546))

(assert (not b!602540))

(assert (not b!602549))

(assert (not start!55022))

(assert (not b!602541))

(assert (not b!602532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87295 () Bool)

(declare-fun res!386981 () Bool)

(declare-fun e!344658 () Bool)

(assert (=> d!87295 (=> res!386981 e!344658)))

(assert (=> d!87295 (= res!386981 (= (select (arr!17846 lt!274483) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17846 a!2986) j!136)))))

(assert (=> d!87295 (= (arrayContainsKey!0 lt!274483 (select (arr!17846 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344658)))

(declare-fun b!602615 () Bool)

(declare-fun e!344659 () Bool)

(assert (=> b!602615 (= e!344658 e!344659)))

(declare-fun res!386982 () Bool)

(assert (=> b!602615 (=> (not res!386982) (not e!344659))))

(assert (=> b!602615 (= res!386982 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18210 lt!274483)))))

(declare-fun b!602616 () Bool)

(assert (=> b!602616 (= e!344659 (arrayContainsKey!0 lt!274483 (select (arr!17846 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87295 (not res!386981)) b!602615))

(assert (= (and b!602615 res!386982) b!602616))

(declare-fun m!579745 () Bool)

(assert (=> d!87295 m!579745))

(assert (=> b!602616 m!579641))

(declare-fun m!579747 () Bool)

(assert (=> b!602616 m!579747))

(assert (=> b!602539 d!87295))

(declare-fun bm!32994 () Bool)

(declare-fun call!32997 () Bool)

(declare-fun c!68187 () Bool)

(assert (=> bm!32994 (= call!32997 (arrayNoDuplicates!0 lt!274483 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68187 (Cons!11883 (select (arr!17846 lt!274483) j!136) Nil!11884) Nil!11884)))))

(declare-fun b!602639 () Bool)

(declare-fun e!344679 () Bool)

(declare-fun e!344681 () Bool)

(assert (=> b!602639 (= e!344679 e!344681)))

(declare-fun res!386999 () Bool)

(assert (=> b!602639 (=> (not res!386999) (not e!344681))))

(declare-fun e!344680 () Bool)

(assert (=> b!602639 (= res!386999 (not e!344680))))

(declare-fun res!387000 () Bool)

(assert (=> b!602639 (=> (not res!387000) (not e!344680))))

(assert (=> b!602639 (= res!387000 (validKeyInArray!0 (select (arr!17846 lt!274483) j!136)))))

(declare-fun b!602640 () Bool)

(declare-fun contains!2990 (List!11887 (_ BitVec 64)) Bool)

(assert (=> b!602640 (= e!344680 (contains!2990 Nil!11884 (select (arr!17846 lt!274483) j!136)))))

(declare-fun b!602641 () Bool)

(declare-fun e!344678 () Bool)

(assert (=> b!602641 (= e!344678 call!32997)))

(declare-fun b!602642 () Bool)

(assert (=> b!602642 (= e!344678 call!32997)))

(declare-fun b!602638 () Bool)

(assert (=> b!602638 (= e!344681 e!344678)))

(assert (=> b!602638 (= c!68187 (validKeyInArray!0 (select (arr!17846 lt!274483) j!136)))))

(declare-fun d!87301 () Bool)

(declare-fun res!386998 () Bool)

(assert (=> d!87301 (=> res!386998 e!344679)))

(assert (=> d!87301 (= res!386998 (bvsge j!136 (size!18210 lt!274483)))))

(assert (=> d!87301 (= (arrayNoDuplicates!0 lt!274483 j!136 Nil!11884) e!344679)))

(assert (= (and d!87301 (not res!386998)) b!602639))

(assert (= (and b!602639 res!387000) b!602640))

(assert (= (and b!602639 res!386999) b!602638))

(assert (= (and b!602638 c!68187) b!602642))

(assert (= (and b!602638 (not c!68187)) b!602641))

(assert (= (or b!602642 b!602641) bm!32994))

(declare-fun m!579773 () Bool)

(assert (=> bm!32994 m!579773))

(declare-fun m!579775 () Bool)

(assert (=> bm!32994 m!579775))

(assert (=> b!602639 m!579773))

(assert (=> b!602639 m!579773))

(declare-fun m!579777 () Bool)

(assert (=> b!602639 m!579777))

(assert (=> b!602640 m!579773))

(assert (=> b!602640 m!579773))

(declare-fun m!579779 () Bool)

(assert (=> b!602640 m!579779))

(assert (=> b!602638 m!579773))

(assert (=> b!602638 m!579773))

(assert (=> b!602638 m!579777))

(assert (=> b!602539 d!87301))

(declare-fun d!87319 () Bool)

(assert (=> d!87319 (arrayNoDuplicates!0 lt!274483 j!136 Nil!11884)))

(declare-fun lt!274511 () Unit!19096)

(declare-fun choose!39 (array!37176 (_ BitVec 32) (_ BitVec 32)) Unit!19096)

(assert (=> d!87319 (= lt!274511 (choose!39 lt!274483 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87319 (bvslt (size!18210 lt!274483) #b01111111111111111111111111111111)))

(assert (=> d!87319 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!274483 #b00000000000000000000000000000000 j!136) lt!274511)))

(declare-fun bs!18464 () Bool)

(assert (= bs!18464 d!87319))

(assert (=> bs!18464 m!579681))

(declare-fun m!579783 () Bool)

(assert (=> bs!18464 m!579783))

(assert (=> b!602539 d!87319))

(declare-fun d!87323 () Bool)

(assert (=> d!87323 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18210 lt!274483)) (not (= (select (arr!17846 lt!274483) j!136) (select (arr!17846 a!2986) j!136))))))

(declare-fun lt!274519 () Unit!19096)

(declare-fun choose!21 (array!37176 (_ BitVec 64) (_ BitVec 32) List!11887) Unit!19096)

(assert (=> d!87323 (= lt!274519 (choose!21 lt!274483 (select (arr!17846 a!2986) j!136) j!136 Nil!11884))))

(assert (=> d!87323 (bvslt (size!18210 lt!274483) #b01111111111111111111111111111111)))

(assert (=> d!87323 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274483 (select (arr!17846 a!2986) j!136) j!136 Nil!11884) lt!274519)))

(declare-fun bs!18465 () Bool)

(assert (= bs!18465 d!87323))

(assert (=> bs!18465 m!579773))

(assert (=> bs!18465 m!579641))

(declare-fun m!579791 () Bool)

(assert (=> bs!18465 m!579791))

(assert (=> b!602539 d!87323))

(declare-fun d!87329 () Bool)

(assert (=> d!87329 (arrayContainsKey!0 lt!274483 (select (arr!17846 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274522 () Unit!19096)

(declare-fun choose!114 (array!37176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19096)

(assert (=> d!87329 (= lt!274522 (choose!114 lt!274483 (select (arr!17846 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87329 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87329 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274483 (select (arr!17846 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!274522)))

(declare-fun bs!18466 () Bool)

(assert (= bs!18466 d!87329))

(assert (=> bs!18466 m!579641))

(assert (=> bs!18466 m!579675))

(assert (=> bs!18466 m!579641))

(declare-fun m!579799 () Bool)

(assert (=> bs!18466 m!579799))

(assert (=> b!602539 d!87329))

(declare-fun d!87335 () Bool)

(declare-fun e!344698 () Bool)

(assert (=> d!87335 e!344698))

(declare-fun res!387008 () Bool)

(assert (=> d!87335 (=> (not res!387008) (not e!344698))))

(assert (=> d!87335 (= res!387008 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18210 a!2986))))))

(declare-fun lt!274531 () Unit!19096)

(declare-fun choose!41 (array!37176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11887) Unit!19096)

(assert (=> d!87335 (= lt!274531 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11884))))

(assert (=> d!87335 (bvslt (size!18210 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87335 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11884) lt!274531)))

(declare-fun b!602668 () Bool)

(assert (=> b!602668 (= e!344698 (arrayNoDuplicates!0 (array!37177 (store (arr!17846 a!2986) i!1108 k!1786) (size!18210 a!2986)) #b00000000000000000000000000000000 Nil!11884))))

(assert (= (and d!87335 res!387008) b!602668))

(declare-fun m!579801 () Bool)

(assert (=> d!87335 m!579801))

(assert (=> b!602668 m!579643))

(declare-fun m!579803 () Bool)

(assert (=> b!602668 m!579803))

(assert (=> b!602539 d!87335))

(declare-fun bm!32995 () Bool)

(declare-fun call!32998 () Bool)

(declare-fun c!68199 () Bool)

(assert (=> bm!32995 (= call!32998 (arrayNoDuplicates!0 lt!274483 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68199 (Cons!11883 (select (arr!17846 lt!274483) #b00000000000000000000000000000000) Nil!11884) Nil!11884)))))

(declare-fun b!602678 () Bool)

(declare-fun e!344706 () Bool)

(declare-fun e!344708 () Bool)

(assert (=> b!602678 (= e!344706 e!344708)))

(declare-fun res!387014 () Bool)

(assert (=> b!602678 (=> (not res!387014) (not e!344708))))

(declare-fun e!344707 () Bool)

(assert (=> b!602678 (= res!387014 (not e!344707))))

(declare-fun res!387015 () Bool)

(assert (=> b!602678 (=> (not res!387015) (not e!344707))))

(assert (=> b!602678 (= res!387015 (validKeyInArray!0 (select (arr!17846 lt!274483) #b00000000000000000000000000000000)))))

(declare-fun b!602679 () Bool)

(assert (=> b!602679 (= e!344707 (contains!2990 Nil!11884 (select (arr!17846 lt!274483) #b00000000000000000000000000000000)))))

(declare-fun b!602680 () Bool)

(declare-fun e!344705 () Bool)

(assert (=> b!602680 (= e!344705 call!32998)))

(declare-fun b!602681 () Bool)

(assert (=> b!602681 (= e!344705 call!32998)))

(declare-fun b!602677 () Bool)

(assert (=> b!602677 (= e!344708 e!344705)))

(assert (=> b!602677 (= c!68199 (validKeyInArray!0 (select (arr!17846 lt!274483) #b00000000000000000000000000000000)))))

(declare-fun d!87337 () Bool)

(declare-fun res!387013 () Bool)

(assert (=> d!87337 (=> res!387013 e!344706)))

(assert (=> d!87337 (= res!387013 (bvsge #b00000000000000000000000000000000 (size!18210 lt!274483)))))

(assert (=> d!87337 (= (arrayNoDuplicates!0 lt!274483 #b00000000000000000000000000000000 Nil!11884) e!344706)))

(assert (= (and d!87337 (not res!387013)) b!602678))

(assert (= (and b!602678 res!387015) b!602679))

(assert (= (and b!602678 res!387014) b!602677))

(assert (= (and b!602677 c!68199) b!602681))

(assert (= (and b!602677 (not c!68199)) b!602680))

(assert (= (or b!602681 b!602680) bm!32995))

(declare-fun m!579805 () Bool)

(assert (=> bm!32995 m!579805))

(declare-fun m!579807 () Bool)

(assert (=> bm!32995 m!579807))

(assert (=> b!602678 m!579805))

(assert (=> b!602678 m!579805))

(declare-fun m!579809 () Bool)

(assert (=> b!602678 m!579809))

(assert (=> b!602679 m!579805))

(assert (=> b!602679 m!579805))

(declare-fun m!579811 () Bool)

(assert (=> b!602679 m!579811))

(assert (=> b!602677 m!579805))

(assert (=> b!602677 m!579805))

(assert (=> b!602677 m!579809))

(assert (=> b!602539 d!87337))

(declare-fun d!87339 () Bool)

(declare-fun e!344719 () Bool)

(assert (=> d!87339 e!344719))

(declare-fun res!387022 () Bool)

(assert (=> d!87339 (=> (not res!387022) (not e!344719))))

(assert (=> d!87339 (= res!387022 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18210 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18210 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18210 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18210 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18210 a!2986))))))

(declare-fun lt!274546 () Unit!19096)

(declare-fun choose!9 (array!37176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19096)

(assert (=> d!87339 (= lt!274546 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274475 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87339 (validMask!0 mask!3053)))

(assert (=> d!87339 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274475 vacantSpotIndex!68 mask!3053) lt!274546)))

(declare-fun b!602696 () Bool)

(assert (=> b!602696 (= e!344719 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274475 vacantSpotIndex!68 (select (arr!17846 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274475 vacantSpotIndex!68 (select (store (arr!17846 a!2986) i!1108 k!1786) j!136) (array!37177 (store (arr!17846 a!2986) i!1108 k!1786) (size!18210 a!2986)) mask!3053)))))

(assert (= (and d!87339 res!387022) b!602696))

(declare-fun m!579841 () Bool)

(assert (=> d!87339 m!579841))

(assert (=> d!87339 m!579665))

(assert (=> b!602696 m!579689))

(assert (=> b!602696 m!579689))

(declare-fun m!579843 () Bool)

(assert (=> b!602696 m!579843))

(assert (=> b!602696 m!579641))

(assert (=> b!602696 m!579643))

(assert (=> b!602696 m!579641))

(assert (=> b!602696 m!579691))

(assert (=> b!602540 d!87339))

(declare-fun d!87353 () Bool)

(declare-fun lt!274553 () (_ BitVec 32))

(assert (=> d!87353 (and (bvsge lt!274553 #b00000000000000000000000000000000) (bvslt lt!274553 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87353 (= lt!274553 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87353 (validMask!0 mask!3053)))

(assert (=> d!87353 (= (nextIndex!0 index!984 x!910 mask!3053) lt!274553)))

(declare-fun bs!18467 () Bool)

(assert (= bs!18467 d!87353))

(declare-fun m!579847 () Bool)

(assert (=> bs!18467 m!579847))

(assert (=> bs!18467 m!579665))

(assert (=> b!602540 d!87353))

(declare-fun b!602747 () Bool)

(declare-fun e!344746 () SeekEntryResult!6286)

(assert (=> b!602747 (= e!344746 (Found!6286 lt!274475))))

(declare-fun d!87357 () Bool)

(declare-fun lt!274571 () SeekEntryResult!6286)

(assert (=> d!87357 (and (or (is-Undefined!6286 lt!274571) (not (is-Found!6286 lt!274571)) (and (bvsge (index!27405 lt!274571) #b00000000000000000000000000000000) (bvslt (index!27405 lt!274571) (size!18210 lt!274483)))) (or (is-Undefined!6286 lt!274571) (is-Found!6286 lt!274571) (not (is-MissingVacant!6286 lt!274571)) (not (= (index!27407 lt!274571) vacantSpotIndex!68)) (and (bvsge (index!27407 lt!274571) #b00000000000000000000000000000000) (bvslt (index!27407 lt!274571) (size!18210 lt!274483)))) (or (is-Undefined!6286 lt!274571) (ite (is-Found!6286 lt!274571) (= (select (arr!17846 lt!274483) (index!27405 lt!274571)) lt!274471) (and (is-MissingVacant!6286 lt!274571) (= (index!27407 lt!274571) vacantSpotIndex!68) (= (select (arr!17846 lt!274483) (index!27407 lt!274571)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!344747 () SeekEntryResult!6286)

(assert (=> d!87357 (= lt!274571 e!344747)))

