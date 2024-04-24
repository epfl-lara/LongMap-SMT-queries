; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59412 () Bool)

(assert start!59412)

(declare-fun res!425206 () Bool)

(declare-fun e!376485 () Bool)

(assert (=> start!59412 (=> (not res!425206) (not e!376485))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59412 (= res!425206 (validMask!0 mask!3053))))

(assert (=> start!59412 e!376485))

(assert (=> start!59412 true))

(declare-datatypes ((array!38670 0))(
  ( (array!38671 (arr!18532 (Array (_ BitVec 32) (_ BitVec 64))) (size!18896 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38670)

(declare-fun array_inv!14391 (array!38670) Bool)

(assert (=> start!59412 (array_inv!14391 a!2986)))

(declare-fun b!655541 () Bool)

(declare-fun lt!305691 () array!38670)

(declare-fun e!376483 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655541 (= e!376483 (arrayContainsKey!0 lt!305691 (select (arr!18532 a!2986) j!136) index!984))))

(declare-fun b!655542 () Bool)

(declare-fun e!376484 () Bool)

(assert (=> b!655542 (= e!376485 e!376484)))

(declare-fun res!425220 () Bool)

(assert (=> b!655542 (=> (not res!425220) (not e!376484))))

(declare-datatypes ((SeekEntryResult!6928 0))(
  ( (MissingZero!6928 (index!30071 (_ BitVec 32))) (Found!6928 (index!30072 (_ BitVec 32))) (Intermediate!6928 (undefined!7740 Bool) (index!30073 (_ BitVec 32)) (x!59012 (_ BitVec 32))) (Undefined!6928) (MissingVacant!6928 (index!30074 (_ BitVec 32))) )
))
(declare-fun lt!305699 () SeekEntryResult!6928)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!655542 (= res!425220 (or (= lt!305699 (MissingZero!6928 i!1108)) (= lt!305699 (MissingVacant!6928 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38670 (_ BitVec 32)) SeekEntryResult!6928)

(assert (=> b!655542 (= lt!305699 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655543 () Bool)

(declare-datatypes ((Unit!22503 0))(
  ( (Unit!22504) )
))
(declare-fun e!376490 () Unit!22503)

(declare-fun Unit!22505 () Unit!22503)

(assert (=> b!655543 (= e!376490 Unit!22505)))

(assert (=> b!655543 false))

(declare-fun b!655544 () Bool)

(declare-fun Unit!22506 () Unit!22503)

(assert (=> b!655544 (= e!376490 Unit!22506)))

(declare-fun b!655545 () Bool)

(declare-fun res!425214 () Bool)

(assert (=> b!655545 (= res!425214 (bvsge j!136 index!984))))

(declare-fun e!376478 () Bool)

(assert (=> b!655545 (=> res!425214 e!376478)))

(declare-fun e!376488 () Bool)

(assert (=> b!655545 (= e!376488 e!376478)))

(declare-fun b!655546 () Bool)

(assert (=> b!655546 false))

(declare-fun lt!305701 () Unit!22503)

(declare-datatypes ((List!12480 0))(
  ( (Nil!12477) (Cons!12476 (h!13524 (_ BitVec 64)) (t!18700 List!12480)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38670 (_ BitVec 64) (_ BitVec 32) List!12480) Unit!22503)

(assert (=> b!655546 (= lt!305701 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305691 (select (arr!18532 a!2986) j!136) j!136 Nil!12477))))

(declare-fun arrayNoDuplicates!0 (array!38670 (_ BitVec 32) List!12480) Bool)

(assert (=> b!655546 (arrayNoDuplicates!0 lt!305691 j!136 Nil!12477)))

(declare-fun lt!305692 () Unit!22503)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38670 (_ BitVec 32) (_ BitVec 32)) Unit!22503)

(assert (=> b!655546 (= lt!305692 (lemmaNoDuplicateFromThenFromBigger!0 lt!305691 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655546 (arrayNoDuplicates!0 lt!305691 #b00000000000000000000000000000000 Nil!12477)))

(declare-fun lt!305700 () Unit!22503)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12480) Unit!22503)

(assert (=> b!655546 (= lt!305700 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12477))))

(assert (=> b!655546 (arrayContainsKey!0 lt!305691 (select (arr!18532 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305685 () Unit!22503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22503)

(assert (=> b!655546 (= lt!305685 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305691 (select (arr!18532 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376486 () Unit!22503)

(declare-fun Unit!22507 () Unit!22503)

(assert (=> b!655546 (= e!376486 Unit!22507)))

(declare-fun b!655547 () Bool)

(declare-fun e!376491 () Unit!22503)

(declare-fun Unit!22508 () Unit!22503)

(assert (=> b!655547 (= e!376491 Unit!22508)))

(declare-fun b!655548 () Bool)

(declare-fun res!425208 () Bool)

(assert (=> b!655548 (=> (not res!425208) (not e!376485))))

(assert (=> b!655548 (= res!425208 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655549 () Bool)

(assert (=> b!655549 false))

(declare-fun lt!305702 () Unit!22503)

(assert (=> b!655549 (= lt!305702 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305691 (select (arr!18532 a!2986) j!136) index!984 Nil!12477))))

(assert (=> b!655549 (arrayNoDuplicates!0 lt!305691 index!984 Nil!12477)))

(declare-fun lt!305703 () Unit!22503)

(assert (=> b!655549 (= lt!305703 (lemmaNoDuplicateFromThenFromBigger!0 lt!305691 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655549 (arrayNoDuplicates!0 lt!305691 #b00000000000000000000000000000000 Nil!12477)))

(declare-fun lt!305688 () Unit!22503)

(assert (=> b!655549 (= lt!305688 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12477))))

(assert (=> b!655549 (arrayContainsKey!0 lt!305691 (select (arr!18532 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305698 () Unit!22503)

(assert (=> b!655549 (= lt!305698 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305691 (select (arr!18532 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655549 e!376483))

(declare-fun res!425215 () Bool)

(assert (=> b!655549 (=> (not res!425215) (not e!376483))))

(assert (=> b!655549 (= res!425215 (arrayContainsKey!0 lt!305691 (select (arr!18532 a!2986) j!136) j!136))))

(declare-fun e!376480 () Unit!22503)

(declare-fun Unit!22509 () Unit!22503)

(assert (=> b!655549 (= e!376480 Unit!22509)))

(declare-fun b!655550 () Bool)

(declare-fun res!425211 () Bool)

(assert (=> b!655550 (=> (not res!425211) (not e!376485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655550 (= res!425211 (validKeyInArray!0 k0!1786))))

(declare-fun b!655551 () Bool)

(declare-fun Unit!22510 () Unit!22503)

(assert (=> b!655551 (= e!376480 Unit!22510)))

(declare-fun b!655552 () Bool)

(declare-fun res!425216 () Bool)

(assert (=> b!655552 (=> (not res!425216) (not e!376484))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655552 (= res!425216 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18532 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655553 () Bool)

(declare-fun res!425210 () Bool)

(assert (=> b!655553 (=> (not res!425210) (not e!376485))))

(assert (=> b!655553 (= res!425210 (validKeyInArray!0 (select (arr!18532 a!2986) j!136)))))

(declare-fun b!655554 () Bool)

(declare-fun e!376489 () Bool)

(assert (=> b!655554 (= e!376484 e!376489)))

(declare-fun res!425218 () Bool)

(assert (=> b!655554 (=> (not res!425218) (not e!376489))))

(assert (=> b!655554 (= res!425218 (= (select (store (arr!18532 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655554 (= lt!305691 (array!38671 (store (arr!18532 a!2986) i!1108 k0!1786) (size!18896 a!2986)))))

(declare-fun b!655555 () Bool)

(declare-fun res!425221 () Bool)

(assert (=> b!655555 (=> (not res!425221) (not e!376484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38670 (_ BitVec 32)) Bool)

(assert (=> b!655555 (= res!425221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655556 () Bool)

(declare-fun e!376482 () Bool)

(declare-fun lt!305695 () SeekEntryResult!6928)

(declare-fun lt!305693 () SeekEntryResult!6928)

(assert (=> b!655556 (= e!376482 (= lt!305695 lt!305693))))

(declare-fun b!655557 () Bool)

(declare-fun Unit!22511 () Unit!22503)

(assert (=> b!655557 (= e!376491 Unit!22511)))

(declare-fun res!425209 () Bool)

(assert (=> b!655557 (= res!425209 (= (select (store (arr!18532 a!2986) i!1108 k0!1786) index!984) (select (arr!18532 a!2986) j!136)))))

(assert (=> b!655557 (=> (not res!425209) (not e!376488))))

(assert (=> b!655557 e!376488))

(declare-fun c!75538 () Bool)

(assert (=> b!655557 (= c!75538 (bvslt j!136 index!984))))

(declare-fun lt!305704 () Unit!22503)

(assert (=> b!655557 (= lt!305704 e!376486)))

(declare-fun c!75539 () Bool)

(assert (=> b!655557 (= c!75539 (bvslt index!984 j!136))))

(declare-fun lt!305697 () Unit!22503)

(assert (=> b!655557 (= lt!305697 e!376480)))

(assert (=> b!655557 false))

(declare-fun e!376487 () Bool)

(declare-fun b!655558 () Bool)

(assert (=> b!655558 (= e!376487 (arrayContainsKey!0 lt!305691 (select (arr!18532 a!2986) j!136) index!984))))

(declare-fun b!655559 () Bool)

(declare-fun res!425219 () Bool)

(assert (=> b!655559 (=> (not res!425219) (not e!376484))))

(assert (=> b!655559 (= res!425219 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12477))))

(declare-fun res!425212 () Bool)

(declare-fun b!655560 () Bool)

(assert (=> b!655560 (= res!425212 (arrayContainsKey!0 lt!305691 (select (arr!18532 a!2986) j!136) j!136))))

(assert (=> b!655560 (=> (not res!425212) (not e!376487))))

(assert (=> b!655560 (= e!376478 e!376487)))

(declare-fun b!655561 () Bool)

(declare-fun e!376481 () Bool)

(assert (=> b!655561 (= e!376489 e!376481)))

(declare-fun res!425207 () Bool)

(assert (=> b!655561 (=> (not res!425207) (not e!376481))))

(assert (=> b!655561 (= res!425207 (and (= lt!305695 (Found!6928 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18532 a!2986) index!984) (select (arr!18532 a!2986) j!136))) (not (= (select (arr!18532 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38670 (_ BitVec 32)) SeekEntryResult!6928)

(assert (=> b!655561 (= lt!305695 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18532 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655562 () Bool)

(declare-fun Unit!22512 () Unit!22503)

(assert (=> b!655562 (= e!376486 Unit!22512)))

(declare-fun b!655563 () Bool)

(assert (=> b!655563 (= e!376481 (not true))))

(declare-fun lt!305694 () Unit!22503)

(assert (=> b!655563 (= lt!305694 e!376491)))

(declare-fun c!75537 () Bool)

(declare-fun lt!305687 () SeekEntryResult!6928)

(assert (=> b!655563 (= c!75537 (= lt!305687 (Found!6928 index!984)))))

(declare-fun lt!305689 () Unit!22503)

(assert (=> b!655563 (= lt!305689 e!376490)))

(declare-fun c!75536 () Bool)

(assert (=> b!655563 (= c!75536 (= lt!305687 Undefined!6928))))

(declare-fun lt!305696 () (_ BitVec 64))

(assert (=> b!655563 (= lt!305687 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305696 lt!305691 mask!3053))))

(assert (=> b!655563 e!376482))

(declare-fun res!425217 () Bool)

(assert (=> b!655563 (=> (not res!425217) (not e!376482))))

(declare-fun lt!305686 () (_ BitVec 32))

(assert (=> b!655563 (= res!425217 (= lt!305693 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305686 vacantSpotIndex!68 lt!305696 lt!305691 mask!3053)))))

(assert (=> b!655563 (= lt!305693 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305686 vacantSpotIndex!68 (select (arr!18532 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655563 (= lt!305696 (select (store (arr!18532 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305690 () Unit!22503)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38670 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22503)

(assert (=> b!655563 (= lt!305690 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305686 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655563 (= lt!305686 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!655564 () Bool)

(declare-fun res!425213 () Bool)

(assert (=> b!655564 (=> (not res!425213) (not e!376485))))

(assert (=> b!655564 (= res!425213 (and (= (size!18896 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18896 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18896 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!59412 res!425206) b!655564))

(assert (= (and b!655564 res!425213) b!655553))

(assert (= (and b!655553 res!425210) b!655550))

(assert (= (and b!655550 res!425211) b!655548))

(assert (= (and b!655548 res!425208) b!655542))

(assert (= (and b!655542 res!425220) b!655555))

(assert (= (and b!655555 res!425221) b!655559))

(assert (= (and b!655559 res!425219) b!655552))

(assert (= (and b!655552 res!425216) b!655554))

(assert (= (and b!655554 res!425218) b!655561))

(assert (= (and b!655561 res!425207) b!655563))

(assert (= (and b!655563 res!425217) b!655556))

(assert (= (and b!655563 c!75536) b!655543))

(assert (= (and b!655563 (not c!75536)) b!655544))

(assert (= (and b!655563 c!75537) b!655557))

(assert (= (and b!655563 (not c!75537)) b!655547))

(assert (= (and b!655557 res!425209) b!655545))

(assert (= (and b!655545 (not res!425214)) b!655560))

(assert (= (and b!655560 res!425212) b!655558))

(assert (= (and b!655557 c!75538) b!655546))

(assert (= (and b!655557 (not c!75538)) b!655562))

(assert (= (and b!655557 c!75539) b!655549))

(assert (= (and b!655557 (not c!75539)) b!655551))

(assert (= (and b!655549 res!425215) b!655541))

(declare-fun m!629077 () Bool)

(assert (=> b!655563 m!629077))

(declare-fun m!629079 () Bool)

(assert (=> b!655563 m!629079))

(declare-fun m!629081 () Bool)

(assert (=> b!655563 m!629081))

(declare-fun m!629083 () Bool)

(assert (=> b!655563 m!629083))

(declare-fun m!629085 () Bool)

(assert (=> b!655563 m!629085))

(declare-fun m!629087 () Bool)

(assert (=> b!655563 m!629087))

(declare-fun m!629089 () Bool)

(assert (=> b!655563 m!629089))

(assert (=> b!655563 m!629087))

(declare-fun m!629091 () Bool)

(assert (=> b!655563 m!629091))

(assert (=> b!655554 m!629081))

(declare-fun m!629093 () Bool)

(assert (=> b!655554 m!629093))

(assert (=> b!655560 m!629087))

(assert (=> b!655560 m!629087))

(declare-fun m!629095 () Bool)

(assert (=> b!655560 m!629095))

(assert (=> b!655546 m!629087))

(declare-fun m!629097 () Bool)

(assert (=> b!655546 m!629097))

(declare-fun m!629099 () Bool)

(assert (=> b!655546 m!629099))

(declare-fun m!629101 () Bool)

(assert (=> b!655546 m!629101))

(assert (=> b!655546 m!629087))

(declare-fun m!629103 () Bool)

(assert (=> b!655546 m!629103))

(assert (=> b!655546 m!629087))

(declare-fun m!629105 () Bool)

(assert (=> b!655546 m!629105))

(declare-fun m!629107 () Bool)

(assert (=> b!655546 m!629107))

(assert (=> b!655546 m!629087))

(declare-fun m!629109 () Bool)

(assert (=> b!655546 m!629109))

(declare-fun m!629111 () Bool)

(assert (=> b!655550 m!629111))

(declare-fun m!629113 () Bool)

(assert (=> b!655548 m!629113))

(declare-fun m!629115 () Bool)

(assert (=> b!655559 m!629115))

(assert (=> b!655553 m!629087))

(assert (=> b!655553 m!629087))

(declare-fun m!629117 () Bool)

(assert (=> b!655553 m!629117))

(assert (=> b!655558 m!629087))

(assert (=> b!655558 m!629087))

(declare-fun m!629119 () Bool)

(assert (=> b!655558 m!629119))

(declare-fun m!629121 () Bool)

(assert (=> b!655552 m!629121))

(assert (=> b!655557 m!629081))

(declare-fun m!629123 () Bool)

(assert (=> b!655557 m!629123))

(assert (=> b!655557 m!629087))

(declare-fun m!629125 () Bool)

(assert (=> start!59412 m!629125))

(declare-fun m!629127 () Bool)

(assert (=> start!59412 m!629127))

(assert (=> b!655549 m!629087))

(declare-fun m!629129 () Bool)

(assert (=> b!655549 m!629129))

(assert (=> b!655549 m!629099))

(declare-fun m!629131 () Bool)

(assert (=> b!655549 m!629131))

(assert (=> b!655549 m!629087))

(declare-fun m!629133 () Bool)

(assert (=> b!655549 m!629133))

(assert (=> b!655549 m!629087))

(declare-fun m!629135 () Bool)

(assert (=> b!655549 m!629135))

(assert (=> b!655549 m!629107))

(assert (=> b!655549 m!629087))

(declare-fun m!629137 () Bool)

(assert (=> b!655549 m!629137))

(assert (=> b!655549 m!629087))

(assert (=> b!655549 m!629095))

(declare-fun m!629139 () Bool)

(assert (=> b!655561 m!629139))

(assert (=> b!655561 m!629087))

(assert (=> b!655561 m!629087))

(declare-fun m!629141 () Bool)

(assert (=> b!655561 m!629141))

(assert (=> b!655541 m!629087))

(assert (=> b!655541 m!629087))

(assert (=> b!655541 m!629119))

(declare-fun m!629143 () Bool)

(assert (=> b!655542 m!629143))

(declare-fun m!629145 () Bool)

(assert (=> b!655555 m!629145))

(check-sat (not b!655549) (not b!655541) (not b!655546) (not start!59412) (not b!655553) (not b!655560) (not b!655548) (not b!655555) (not b!655558) (not b!655542) (not b!655559) (not b!655561) (not b!655563) (not b!655550))
(check-sat)
