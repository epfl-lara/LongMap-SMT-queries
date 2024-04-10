; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56168 () Bool)

(assert start!56168)

(declare-fun b!621561 () Bool)

(assert (=> b!621561 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20778 0))(
  ( (Unit!20779) )
))
(declare-fun lt!287661 () Unit!20778)

(declare-datatypes ((array!37638 0))(
  ( (array!37639 (arr!18065 (Array (_ BitVec 32) (_ BitVec 64))) (size!18429 (_ BitVec 32))) )
))
(declare-fun lt!287662 () array!37638)

(declare-fun a!2986 () array!37638)

(declare-datatypes ((List!12106 0))(
  ( (Nil!12103) (Cons!12102 (h!13147 (_ BitVec 64)) (t!18334 List!12106)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37638 (_ BitVec 64) (_ BitVec 32) List!12106) Unit!20778)

(assert (=> b!621561 (= lt!287661 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287662 (select (arr!18065 a!2986) j!136) j!136 Nil!12103))))

(declare-fun arrayNoDuplicates!0 (array!37638 (_ BitVec 32) List!12106) Bool)

(assert (=> b!621561 (arrayNoDuplicates!0 lt!287662 j!136 Nil!12103)))

(declare-fun lt!287676 () Unit!20778)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37638 (_ BitVec 32) (_ BitVec 32)) Unit!20778)

(assert (=> b!621561 (= lt!287676 (lemmaNoDuplicateFromThenFromBigger!0 lt!287662 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621561 (arrayNoDuplicates!0 lt!287662 #b00000000000000000000000000000000 Nil!12103)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!287663 () Unit!20778)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12106) Unit!20778)

(assert (=> b!621561 (= lt!287663 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12103))))

(declare-fun arrayContainsKey!0 (array!37638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621561 (arrayContainsKey!0 lt!287662 (select (arr!18065 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287659 () Unit!20778)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20778)

(assert (=> b!621561 (= lt!287659 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287662 (select (arr!18065 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356505 () Unit!20778)

(declare-fun Unit!20780 () Unit!20778)

(assert (=> b!621561 (= e!356505 Unit!20780)))

(declare-fun b!621562 () Bool)

(declare-fun res!400562 () Bool)

(declare-fun e!356508 () Bool)

(assert (=> b!621562 (=> (not res!400562) (not e!356508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621562 (= res!400562 (validKeyInArray!0 k!1786))))

(declare-fun b!621563 () Bool)

(declare-fun e!356513 () Bool)

(assert (=> b!621563 (= e!356508 e!356513)))

(declare-fun res!400551 () Bool)

(assert (=> b!621563 (=> (not res!400551) (not e!356513))))

(declare-datatypes ((SeekEntryResult!6505 0))(
  ( (MissingZero!6505 (index!28304 (_ BitVec 32))) (Found!6505 (index!28305 (_ BitVec 32))) (Intermediate!6505 (undefined!7317 Bool) (index!28306 (_ BitVec 32)) (x!57073 (_ BitVec 32))) (Undefined!6505) (MissingVacant!6505 (index!28307 (_ BitVec 32))) )
))
(declare-fun lt!287668 () SeekEntryResult!6505)

(assert (=> b!621563 (= res!400551 (or (= lt!287668 (MissingZero!6505 i!1108)) (= lt!287668 (MissingVacant!6505 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37638 (_ BitVec 32)) SeekEntryResult!6505)

(assert (=> b!621563 (= lt!287668 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!621564 () Bool)

(declare-fun res!400548 () Bool)

(assert (=> b!621564 (=> (not res!400548) (not e!356508))))

(assert (=> b!621564 (= res!400548 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!400560 () Bool)

(declare-fun b!621565 () Bool)

(assert (=> b!621565 (= res!400560 (arrayContainsKey!0 lt!287662 (select (arr!18065 a!2986) j!136) j!136))))

(declare-fun e!356502 () Bool)

(assert (=> b!621565 (=> (not res!400560) (not e!356502))))

(declare-fun e!356511 () Bool)

(assert (=> b!621565 (= e!356511 e!356502)))

(declare-fun b!621566 () Bool)

(declare-fun e!356507 () Bool)

(declare-fun e!356503 () Bool)

(assert (=> b!621566 (= e!356507 e!356503)))

(declare-fun res!400557 () Bool)

(assert (=> b!621566 (=> (not res!400557) (not e!356503))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!287674 () SeekEntryResult!6505)

(assert (=> b!621566 (= res!400557 (and (= lt!287674 (Found!6505 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18065 a!2986) index!984) (select (arr!18065 a!2986) j!136))) (not (= (select (arr!18065 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37638 (_ BitVec 32)) SeekEntryResult!6505)

(assert (=> b!621566 (= lt!287674 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18065 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621567 () Bool)

(assert (=> b!621567 false))

(declare-fun lt!287673 () Unit!20778)

(assert (=> b!621567 (= lt!287673 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287662 (select (arr!18065 a!2986) j!136) index!984 Nil!12103))))

(assert (=> b!621567 (arrayNoDuplicates!0 lt!287662 index!984 Nil!12103)))

(declare-fun lt!287660 () Unit!20778)

(assert (=> b!621567 (= lt!287660 (lemmaNoDuplicateFromThenFromBigger!0 lt!287662 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621567 (arrayNoDuplicates!0 lt!287662 #b00000000000000000000000000000000 Nil!12103)))

(declare-fun lt!287675 () Unit!20778)

(assert (=> b!621567 (= lt!287675 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12103))))

(assert (=> b!621567 (arrayContainsKey!0 lt!287662 (select (arr!18065 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287664 () Unit!20778)

(assert (=> b!621567 (= lt!287664 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287662 (select (arr!18065 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356514 () Bool)

(assert (=> b!621567 e!356514))

(declare-fun res!400554 () Bool)

(assert (=> b!621567 (=> (not res!400554) (not e!356514))))

(assert (=> b!621567 (= res!400554 (arrayContainsKey!0 lt!287662 (select (arr!18065 a!2986) j!136) j!136))))

(declare-fun e!356512 () Unit!20778)

(declare-fun Unit!20781 () Unit!20778)

(assert (=> b!621567 (= e!356512 Unit!20781)))

(declare-fun b!621568 () Bool)

(declare-fun res!400549 () Bool)

(assert (=> b!621568 (= res!400549 (bvsge j!136 index!984))))

(assert (=> b!621568 (=> res!400549 e!356511)))

(declare-fun e!356510 () Bool)

(assert (=> b!621568 (= e!356510 e!356511)))

(declare-fun b!621569 () Bool)

(declare-fun Unit!20782 () Unit!20778)

(assert (=> b!621569 (= e!356505 Unit!20782)))

(declare-fun b!621570 () Bool)

(declare-fun e!356504 () Unit!20778)

(declare-fun Unit!20783 () Unit!20778)

(assert (=> b!621570 (= e!356504 Unit!20783)))

(assert (=> b!621570 false))

(declare-fun res!400555 () Bool)

(assert (=> start!56168 (=> (not res!400555) (not e!356508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56168 (= res!400555 (validMask!0 mask!3053))))

(assert (=> start!56168 e!356508))

(assert (=> start!56168 true))

(declare-fun array_inv!13861 (array!37638) Bool)

(assert (=> start!56168 (array_inv!13861 a!2986)))

(declare-fun b!621571 () Bool)

(declare-fun res!400561 () Bool)

(assert (=> b!621571 (=> (not res!400561) (not e!356513))))

(assert (=> b!621571 (= res!400561 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18065 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621572 () Bool)

(declare-fun res!400558 () Bool)

(assert (=> b!621572 (=> (not res!400558) (not e!356508))))

(assert (=> b!621572 (= res!400558 (and (= (size!18429 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18429 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18429 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621573 () Bool)

(assert (=> b!621573 (= e!356503 (not true))))

(declare-fun lt!287670 () Unit!20778)

(declare-fun e!356509 () Unit!20778)

(assert (=> b!621573 (= lt!287670 e!356509)))

(declare-fun c!70875 () Bool)

(declare-fun lt!287677 () SeekEntryResult!6505)

(assert (=> b!621573 (= c!70875 (= lt!287677 (Found!6505 index!984)))))

(declare-fun lt!287658 () Unit!20778)

(assert (=> b!621573 (= lt!287658 e!356504)))

(declare-fun c!70877 () Bool)

(assert (=> b!621573 (= c!70877 (= lt!287677 Undefined!6505))))

(declare-fun lt!287672 () (_ BitVec 64))

(assert (=> b!621573 (= lt!287677 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287672 lt!287662 mask!3053))))

(declare-fun e!356501 () Bool)

(assert (=> b!621573 e!356501))

(declare-fun res!400552 () Bool)

(assert (=> b!621573 (=> (not res!400552) (not e!356501))))

(declare-fun lt!287671 () SeekEntryResult!6505)

(declare-fun lt!287667 () (_ BitVec 32))

(assert (=> b!621573 (= res!400552 (= lt!287671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287667 vacantSpotIndex!68 lt!287672 lt!287662 mask!3053)))))

(assert (=> b!621573 (= lt!287671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287667 vacantSpotIndex!68 (select (arr!18065 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621573 (= lt!287672 (select (store (arr!18065 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287669 () Unit!20778)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37638 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20778)

(assert (=> b!621573 (= lt!287669 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287667 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621573 (= lt!287667 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621574 () Bool)

(declare-fun res!400547 () Bool)

(assert (=> b!621574 (=> (not res!400547) (not e!356513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37638 (_ BitVec 32)) Bool)

(assert (=> b!621574 (= res!400547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621575 () Bool)

(declare-fun res!400550 () Bool)

(assert (=> b!621575 (=> (not res!400550) (not e!356508))))

(assert (=> b!621575 (= res!400550 (validKeyInArray!0 (select (arr!18065 a!2986) j!136)))))

(declare-fun b!621576 () Bool)

(declare-fun Unit!20784 () Unit!20778)

(assert (=> b!621576 (= e!356509 Unit!20784)))

(declare-fun res!400559 () Bool)

(assert (=> b!621576 (= res!400559 (= (select (store (arr!18065 a!2986) i!1108 k!1786) index!984) (select (arr!18065 a!2986) j!136)))))

(assert (=> b!621576 (=> (not res!400559) (not e!356510))))

(assert (=> b!621576 e!356510))

(declare-fun c!70876 () Bool)

(assert (=> b!621576 (= c!70876 (bvslt j!136 index!984))))

(declare-fun lt!287666 () Unit!20778)

(assert (=> b!621576 (= lt!287666 e!356505)))

(declare-fun c!70874 () Bool)

(assert (=> b!621576 (= c!70874 (bvslt index!984 j!136))))

(declare-fun lt!287665 () Unit!20778)

(assert (=> b!621576 (= lt!287665 e!356512)))

(assert (=> b!621576 false))

(declare-fun b!621577 () Bool)

(assert (=> b!621577 (= e!356513 e!356507)))

(declare-fun res!400556 () Bool)

(assert (=> b!621577 (=> (not res!400556) (not e!356507))))

(assert (=> b!621577 (= res!400556 (= (select (store (arr!18065 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621577 (= lt!287662 (array!37639 (store (arr!18065 a!2986) i!1108 k!1786) (size!18429 a!2986)))))

(declare-fun b!621578 () Bool)

(declare-fun Unit!20785 () Unit!20778)

(assert (=> b!621578 (= e!356509 Unit!20785)))

(declare-fun b!621579 () Bool)

(assert (=> b!621579 (= e!356514 (arrayContainsKey!0 lt!287662 (select (arr!18065 a!2986) j!136) index!984))))

(declare-fun b!621580 () Bool)

(assert (=> b!621580 (= e!356501 (= lt!287674 lt!287671))))

(declare-fun b!621581 () Bool)

(declare-fun Unit!20786 () Unit!20778)

(assert (=> b!621581 (= e!356512 Unit!20786)))

(declare-fun b!621582 () Bool)

(declare-fun res!400553 () Bool)

(assert (=> b!621582 (=> (not res!400553) (not e!356513))))

(assert (=> b!621582 (= res!400553 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12103))))

(declare-fun b!621583 () Bool)

(assert (=> b!621583 (= e!356502 (arrayContainsKey!0 lt!287662 (select (arr!18065 a!2986) j!136) index!984))))

(declare-fun b!621584 () Bool)

(declare-fun Unit!20787 () Unit!20778)

(assert (=> b!621584 (= e!356504 Unit!20787)))

(assert (= (and start!56168 res!400555) b!621572))

(assert (= (and b!621572 res!400558) b!621575))

(assert (= (and b!621575 res!400550) b!621562))

(assert (= (and b!621562 res!400562) b!621564))

(assert (= (and b!621564 res!400548) b!621563))

(assert (= (and b!621563 res!400551) b!621574))

(assert (= (and b!621574 res!400547) b!621582))

(assert (= (and b!621582 res!400553) b!621571))

(assert (= (and b!621571 res!400561) b!621577))

(assert (= (and b!621577 res!400556) b!621566))

(assert (= (and b!621566 res!400557) b!621573))

(assert (= (and b!621573 res!400552) b!621580))

(assert (= (and b!621573 c!70877) b!621570))

(assert (= (and b!621573 (not c!70877)) b!621584))

(assert (= (and b!621573 c!70875) b!621576))

(assert (= (and b!621573 (not c!70875)) b!621578))

(assert (= (and b!621576 res!400559) b!621568))

(assert (= (and b!621568 (not res!400549)) b!621565))

(assert (= (and b!621565 res!400560) b!621583))

(assert (= (and b!621576 c!70876) b!621561))

(assert (= (and b!621576 (not c!70876)) b!621569))

(assert (= (and b!621576 c!70874) b!621567))

(assert (= (and b!621576 (not c!70874)) b!621581))

(assert (= (and b!621567 res!400554) b!621579))

(declare-fun m!597451 () Bool)

(assert (=> b!621562 m!597451))

(declare-fun m!597453 () Bool)

(assert (=> b!621565 m!597453))

(assert (=> b!621565 m!597453))

(declare-fun m!597455 () Bool)

(assert (=> b!621565 m!597455))

(assert (=> b!621583 m!597453))

(assert (=> b!621583 m!597453))

(declare-fun m!597457 () Bool)

(assert (=> b!621583 m!597457))

(declare-fun m!597459 () Bool)

(assert (=> b!621573 m!597459))

(declare-fun m!597461 () Bool)

(assert (=> b!621573 m!597461))

(assert (=> b!621573 m!597453))

(declare-fun m!597463 () Bool)

(assert (=> b!621573 m!597463))

(assert (=> b!621573 m!597453))

(declare-fun m!597465 () Bool)

(assert (=> b!621573 m!597465))

(declare-fun m!597467 () Bool)

(assert (=> b!621573 m!597467))

(declare-fun m!597469 () Bool)

(assert (=> b!621573 m!597469))

(declare-fun m!597471 () Bool)

(assert (=> b!621573 m!597471))

(declare-fun m!597473 () Bool)

(assert (=> b!621571 m!597473))

(assert (=> b!621575 m!597453))

(assert (=> b!621575 m!597453))

(declare-fun m!597475 () Bool)

(assert (=> b!621575 m!597475))

(declare-fun m!597477 () Bool)

(assert (=> b!621561 m!597477))

(assert (=> b!621561 m!597453))

(assert (=> b!621561 m!597453))

(declare-fun m!597479 () Bool)

(assert (=> b!621561 m!597479))

(declare-fun m!597481 () Bool)

(assert (=> b!621561 m!597481))

(assert (=> b!621561 m!597453))

(declare-fun m!597483 () Bool)

(assert (=> b!621561 m!597483))

(declare-fun m!597485 () Bool)

(assert (=> b!621561 m!597485))

(declare-fun m!597487 () Bool)

(assert (=> b!621561 m!597487))

(assert (=> b!621561 m!597453))

(declare-fun m!597489 () Bool)

(assert (=> b!621561 m!597489))

(declare-fun m!597491 () Bool)

(assert (=> b!621582 m!597491))

(assert (=> b!621576 m!597465))

(declare-fun m!597493 () Bool)

(assert (=> b!621576 m!597493))

(assert (=> b!621576 m!597453))

(assert (=> b!621579 m!597453))

(assert (=> b!621579 m!597453))

(assert (=> b!621579 m!597457))

(assert (=> b!621577 m!597465))

(declare-fun m!597495 () Bool)

(assert (=> b!621577 m!597495))

(declare-fun m!597497 () Bool)

(assert (=> b!621564 m!597497))

(declare-fun m!597499 () Bool)

(assert (=> start!56168 m!597499))

(declare-fun m!597501 () Bool)

(assert (=> start!56168 m!597501))

(declare-fun m!597503 () Bool)

(assert (=> b!621567 m!597503))

(assert (=> b!621567 m!597453))

(declare-fun m!597505 () Bool)

(assert (=> b!621567 m!597505))

(assert (=> b!621567 m!597477))

(assert (=> b!621567 m!597453))

(assert (=> b!621567 m!597453))

(declare-fun m!597507 () Bool)

(assert (=> b!621567 m!597507))

(assert (=> b!621567 m!597453))

(assert (=> b!621567 m!597455))

(declare-fun m!597509 () Bool)

(assert (=> b!621567 m!597509))

(assert (=> b!621567 m!597453))

(declare-fun m!597511 () Bool)

(assert (=> b!621567 m!597511))

(assert (=> b!621567 m!597485))

(declare-fun m!597513 () Bool)

(assert (=> b!621566 m!597513))

(assert (=> b!621566 m!597453))

(assert (=> b!621566 m!597453))

(declare-fun m!597515 () Bool)

(assert (=> b!621566 m!597515))

(declare-fun m!597517 () Bool)

(assert (=> b!621563 m!597517))

(declare-fun m!597519 () Bool)

(assert (=> b!621574 m!597519))

(push 1)

