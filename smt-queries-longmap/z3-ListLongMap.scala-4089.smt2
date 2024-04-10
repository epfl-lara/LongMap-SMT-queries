; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56034 () Bool)

(assert start!56034)

(declare-fun b!616598 () Bool)

(declare-fun e!353554 () Bool)

(declare-datatypes ((SeekEntryResult!6438 0))(
  ( (MissingZero!6438 (index!28036 (_ BitVec 32))) (Found!6438 (index!28037 (_ BitVec 32))) (Intermediate!6438 (undefined!7250 Bool) (index!28038 (_ BitVec 32)) (x!56830 (_ BitVec 32))) (Undefined!6438) (MissingVacant!6438 (index!28039 (_ BitVec 32))) )
))
(declare-fun lt!283649 () SeekEntryResult!6438)

(declare-fun lt!283644 () SeekEntryResult!6438)

(assert (=> b!616598 (= e!353554 (= lt!283649 lt!283644))))

(declare-fun b!616599 () Bool)

(declare-fun res!397208 () Bool)

(declare-fun e!353558 () Bool)

(assert (=> b!616599 (=> (not res!397208) (not e!353558))))

(declare-datatypes ((array!37504 0))(
  ( (array!37505 (arr!17998 (Array (_ BitVec 32) (_ BitVec 64))) (size!18362 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37504)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616599 (= res!397208 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616600 () Bool)

(declare-datatypes ((Unit!20108 0))(
  ( (Unit!20109) )
))
(declare-fun e!353553 () Unit!20108)

(declare-fun Unit!20110 () Unit!20108)

(assert (=> b!616600 (= e!353553 Unit!20110)))

(assert (=> b!616600 false))

(declare-fun b!616601 () Bool)

(declare-fun e!353549 () Unit!20108)

(declare-fun Unit!20111 () Unit!20108)

(assert (=> b!616601 (= e!353549 Unit!20111)))

(declare-fun res!397196 () Bool)

(assert (=> start!56034 (=> (not res!397196) (not e!353558))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56034 (= res!397196 (validMask!0 mask!3053))))

(assert (=> start!56034 e!353558))

(assert (=> start!56034 true))

(declare-fun array_inv!13794 (array!37504) Bool)

(assert (=> start!56034 (array_inv!13794 a!2986)))

(declare-fun b!616602 () Bool)

(declare-fun res!397195 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616602 (= res!397195 (bvsge j!136 index!984))))

(declare-fun e!353560 () Bool)

(assert (=> b!616602 (=> res!397195 e!353560)))

(declare-fun e!353562 () Bool)

(assert (=> b!616602 (= e!353562 e!353560)))

(declare-fun res!397193 () Bool)

(declare-fun lt!283648 () array!37504)

(declare-fun b!616603 () Bool)

(assert (=> b!616603 (= res!397193 (arrayContainsKey!0 lt!283648 (select (arr!17998 a!2986) j!136) j!136))))

(declare-fun e!353561 () Bool)

(assert (=> b!616603 (=> (not res!397193) (not e!353561))))

(assert (=> b!616603 (= e!353560 e!353561)))

(declare-fun b!616604 () Bool)

(declare-fun e!353556 () Bool)

(declare-fun e!353548 () Bool)

(assert (=> b!616604 (= e!353556 e!353548)))

(declare-fun res!397204 () Bool)

(assert (=> b!616604 (=> (not res!397204) (not e!353548))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616604 (= res!397204 (= (select (store (arr!17998 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616604 (= lt!283648 (array!37505 (store (arr!17998 a!2986) i!1108 k0!1786) (size!18362 a!2986)))))

(declare-fun b!616605 () Bool)

(declare-fun e!353555 () Bool)

(assert (=> b!616605 (= e!353548 e!353555)))

(declare-fun res!397207 () Bool)

(assert (=> b!616605 (=> (not res!397207) (not e!353555))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616605 (= res!397207 (and (= lt!283649 (Found!6438 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17998 a!2986) index!984) (select (arr!17998 a!2986) j!136))) (not (= (select (arr!17998 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37504 (_ BitVec 32)) SeekEntryResult!6438)

(assert (=> b!616605 (= lt!283649 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17998 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616606 () Bool)

(declare-fun e!353552 () Bool)

(assert (=> b!616606 (= e!353555 (not e!353552))))

(declare-fun res!397201 () Bool)

(assert (=> b!616606 (=> res!397201 e!353552)))

(declare-fun lt!283657 () SeekEntryResult!6438)

(assert (=> b!616606 (= res!397201 (not (= lt!283657 (MissingVacant!6438 vacantSpotIndex!68))))))

(declare-fun lt!283655 () Unit!20108)

(declare-fun e!353551 () Unit!20108)

(assert (=> b!616606 (= lt!283655 e!353551)))

(declare-fun c!70070 () Bool)

(assert (=> b!616606 (= c!70070 (= lt!283657 (Found!6438 index!984)))))

(declare-fun lt!283654 () Unit!20108)

(assert (=> b!616606 (= lt!283654 e!353553)))

(declare-fun c!70073 () Bool)

(assert (=> b!616606 (= c!70073 (= lt!283657 Undefined!6438))))

(declare-fun lt!283638 () (_ BitVec 64))

(assert (=> b!616606 (= lt!283657 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283638 lt!283648 mask!3053))))

(assert (=> b!616606 e!353554))

(declare-fun res!397206 () Bool)

(assert (=> b!616606 (=> (not res!397206) (not e!353554))))

(declare-fun lt!283640 () (_ BitVec 32))

(assert (=> b!616606 (= res!397206 (= lt!283644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283640 vacantSpotIndex!68 lt!283638 lt!283648 mask!3053)))))

(assert (=> b!616606 (= lt!283644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283640 vacantSpotIndex!68 (select (arr!17998 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616606 (= lt!283638 (select (store (arr!17998 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283642 () Unit!20108)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20108)

(assert (=> b!616606 (= lt!283642 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283640 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616606 (= lt!283640 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616607 () Bool)

(declare-fun res!397199 () Bool)

(assert (=> b!616607 (=> (not res!397199) (not e!353556))))

(declare-datatypes ((List!12039 0))(
  ( (Nil!12036) (Cons!12035 (h!13080 (_ BitVec 64)) (t!18267 List!12039)) )
))
(declare-fun arrayNoDuplicates!0 (array!37504 (_ BitVec 32) List!12039) Bool)

(assert (=> b!616607 (= res!397199 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12036))))

(declare-fun b!616608 () Bool)

(assert (=> b!616608 (= e!353552 true)))

(assert (=> b!616608 (= (select (store (arr!17998 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616609 () Bool)

(assert (=> b!616609 false))

(declare-fun lt!283656 () Unit!20108)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37504 (_ BitVec 64) (_ BitVec 32) List!12039) Unit!20108)

(assert (=> b!616609 (= lt!283656 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283648 (select (arr!17998 a!2986) j!136) j!136 Nil!12036))))

(assert (=> b!616609 (arrayNoDuplicates!0 lt!283648 j!136 Nil!12036)))

(declare-fun lt!283641 () Unit!20108)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37504 (_ BitVec 32) (_ BitVec 32)) Unit!20108)

(assert (=> b!616609 (= lt!283641 (lemmaNoDuplicateFromThenFromBigger!0 lt!283648 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616609 (arrayNoDuplicates!0 lt!283648 #b00000000000000000000000000000000 Nil!12036)))

(declare-fun lt!283652 () Unit!20108)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37504 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12039) Unit!20108)

(assert (=> b!616609 (= lt!283652 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12036))))

(assert (=> b!616609 (arrayContainsKey!0 lt!283648 (select (arr!17998 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283651 () Unit!20108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37504 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20108)

(assert (=> b!616609 (= lt!283651 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283648 (select (arr!17998 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20112 () Unit!20108)

(assert (=> b!616609 (= e!353549 Unit!20112)))

(declare-fun b!616610 () Bool)

(assert (=> b!616610 false))

(declare-fun lt!283639 () Unit!20108)

(assert (=> b!616610 (= lt!283639 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283648 (select (arr!17998 a!2986) j!136) index!984 Nil!12036))))

(assert (=> b!616610 (arrayNoDuplicates!0 lt!283648 index!984 Nil!12036)))

(declare-fun lt!283653 () Unit!20108)

(assert (=> b!616610 (= lt!283653 (lemmaNoDuplicateFromThenFromBigger!0 lt!283648 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616610 (arrayNoDuplicates!0 lt!283648 #b00000000000000000000000000000000 Nil!12036)))

(declare-fun lt!283650 () Unit!20108)

(assert (=> b!616610 (= lt!283650 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12036))))

(assert (=> b!616610 (arrayContainsKey!0 lt!283648 (select (arr!17998 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283647 () Unit!20108)

(assert (=> b!616610 (= lt!283647 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283648 (select (arr!17998 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353550 () Bool)

(assert (=> b!616610 e!353550))

(declare-fun res!397203 () Bool)

(assert (=> b!616610 (=> (not res!397203) (not e!353550))))

(assert (=> b!616610 (= res!397203 (arrayContainsKey!0 lt!283648 (select (arr!17998 a!2986) j!136) j!136))))

(declare-fun e!353559 () Unit!20108)

(declare-fun Unit!20113 () Unit!20108)

(assert (=> b!616610 (= e!353559 Unit!20113)))

(declare-fun b!616611 () Bool)

(declare-fun res!397192 () Bool)

(assert (=> b!616611 (=> (not res!397192) (not e!353558))))

(assert (=> b!616611 (= res!397192 (and (= (size!18362 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18362 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18362 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616612 () Bool)

(declare-fun res!397194 () Bool)

(assert (=> b!616612 (=> (not res!397194) (not e!353556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37504 (_ BitVec 32)) Bool)

(assert (=> b!616612 (= res!397194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616613 () Bool)

(declare-fun res!397200 () Bool)

(assert (=> b!616613 (=> (not res!397200) (not e!353558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616613 (= res!397200 (validKeyInArray!0 (select (arr!17998 a!2986) j!136)))))

(declare-fun b!616614 () Bool)

(assert (=> b!616614 (= e!353561 (arrayContainsKey!0 lt!283648 (select (arr!17998 a!2986) j!136) index!984))))

(declare-fun b!616615 () Bool)

(declare-fun Unit!20114 () Unit!20108)

(assert (=> b!616615 (= e!353559 Unit!20114)))

(declare-fun b!616616 () Bool)

(declare-fun Unit!20115 () Unit!20108)

(assert (=> b!616616 (= e!353553 Unit!20115)))

(declare-fun b!616617 () Bool)

(declare-fun res!397202 () Bool)

(assert (=> b!616617 (=> (not res!397202) (not e!353556))))

(assert (=> b!616617 (= res!397202 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17998 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616618 () Bool)

(declare-fun res!397198 () Bool)

(assert (=> b!616618 (=> (not res!397198) (not e!353558))))

(assert (=> b!616618 (= res!397198 (validKeyInArray!0 k0!1786))))

(declare-fun b!616619 () Bool)

(assert (=> b!616619 (= e!353550 (arrayContainsKey!0 lt!283648 (select (arr!17998 a!2986) j!136) index!984))))

(declare-fun b!616620 () Bool)

(assert (=> b!616620 (= e!353558 e!353556)))

(declare-fun res!397197 () Bool)

(assert (=> b!616620 (=> (not res!397197) (not e!353556))))

(declare-fun lt!283643 () SeekEntryResult!6438)

(assert (=> b!616620 (= res!397197 (or (= lt!283643 (MissingZero!6438 i!1108)) (= lt!283643 (MissingVacant!6438 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37504 (_ BitVec 32)) SeekEntryResult!6438)

(assert (=> b!616620 (= lt!283643 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616621 () Bool)

(declare-fun Unit!20116 () Unit!20108)

(assert (=> b!616621 (= e!353551 Unit!20116)))

(declare-fun b!616622 () Bool)

(declare-fun Unit!20117 () Unit!20108)

(assert (=> b!616622 (= e!353551 Unit!20117)))

(declare-fun res!397205 () Bool)

(assert (=> b!616622 (= res!397205 (= (select (store (arr!17998 a!2986) i!1108 k0!1786) index!984) (select (arr!17998 a!2986) j!136)))))

(assert (=> b!616622 (=> (not res!397205) (not e!353562))))

(assert (=> b!616622 e!353562))

(declare-fun c!70071 () Bool)

(assert (=> b!616622 (= c!70071 (bvslt j!136 index!984))))

(declare-fun lt!283646 () Unit!20108)

(assert (=> b!616622 (= lt!283646 e!353549)))

(declare-fun c!70072 () Bool)

(assert (=> b!616622 (= c!70072 (bvslt index!984 j!136))))

(declare-fun lt!283645 () Unit!20108)

(assert (=> b!616622 (= lt!283645 e!353559)))

(assert (=> b!616622 false))

(assert (= (and start!56034 res!397196) b!616611))

(assert (= (and b!616611 res!397192) b!616613))

(assert (= (and b!616613 res!397200) b!616618))

(assert (= (and b!616618 res!397198) b!616599))

(assert (= (and b!616599 res!397208) b!616620))

(assert (= (and b!616620 res!397197) b!616612))

(assert (= (and b!616612 res!397194) b!616607))

(assert (= (and b!616607 res!397199) b!616617))

(assert (= (and b!616617 res!397202) b!616604))

(assert (= (and b!616604 res!397204) b!616605))

(assert (= (and b!616605 res!397207) b!616606))

(assert (= (and b!616606 res!397206) b!616598))

(assert (= (and b!616606 c!70073) b!616600))

(assert (= (and b!616606 (not c!70073)) b!616616))

(assert (= (and b!616606 c!70070) b!616622))

(assert (= (and b!616606 (not c!70070)) b!616621))

(assert (= (and b!616622 res!397205) b!616602))

(assert (= (and b!616602 (not res!397195)) b!616603))

(assert (= (and b!616603 res!397193) b!616614))

(assert (= (and b!616622 c!70071) b!616609))

(assert (= (and b!616622 (not c!70071)) b!616601))

(assert (= (and b!616622 c!70072) b!616610))

(assert (= (and b!616622 (not c!70072)) b!616615))

(assert (= (and b!616610 res!397203) b!616619))

(assert (= (and b!616606 (not res!397201)) b!616608))

(declare-fun m!592761 () Bool)

(assert (=> b!616606 m!592761))

(declare-fun m!592763 () Bool)

(assert (=> b!616606 m!592763))

(declare-fun m!592765 () Bool)

(assert (=> b!616606 m!592765))

(declare-fun m!592767 () Bool)

(assert (=> b!616606 m!592767))

(declare-fun m!592769 () Bool)

(assert (=> b!616606 m!592769))

(declare-fun m!592771 () Bool)

(assert (=> b!616606 m!592771))

(declare-fun m!592773 () Bool)

(assert (=> b!616606 m!592773))

(assert (=> b!616606 m!592763))

(declare-fun m!592775 () Bool)

(assert (=> b!616606 m!592775))

(declare-fun m!592777 () Bool)

(assert (=> b!616599 m!592777))

(declare-fun m!592779 () Bool)

(assert (=> b!616618 m!592779))

(assert (=> b!616604 m!592765))

(declare-fun m!592781 () Bool)

(assert (=> b!616604 m!592781))

(assert (=> b!616622 m!592765))

(declare-fun m!592783 () Bool)

(assert (=> b!616622 m!592783))

(assert (=> b!616622 m!592763))

(assert (=> b!616619 m!592763))

(assert (=> b!616619 m!592763))

(declare-fun m!592785 () Bool)

(assert (=> b!616619 m!592785))

(assert (=> b!616613 m!592763))

(assert (=> b!616613 m!592763))

(declare-fun m!592787 () Bool)

(assert (=> b!616613 m!592787))

(declare-fun m!592789 () Bool)

(assert (=> b!616605 m!592789))

(assert (=> b!616605 m!592763))

(assert (=> b!616605 m!592763))

(declare-fun m!592791 () Bool)

(assert (=> b!616605 m!592791))

(declare-fun m!592793 () Bool)

(assert (=> b!616612 m!592793))

(declare-fun m!592795 () Bool)

(assert (=> b!616607 m!592795))

(assert (=> b!616610 m!592763))

(declare-fun m!592797 () Bool)

(assert (=> b!616610 m!592797))

(assert (=> b!616610 m!592763))

(declare-fun m!592799 () Bool)

(assert (=> b!616610 m!592799))

(declare-fun m!592801 () Bool)

(assert (=> b!616610 m!592801))

(assert (=> b!616610 m!592763))

(declare-fun m!592803 () Bool)

(assert (=> b!616610 m!592803))

(assert (=> b!616610 m!592763))

(declare-fun m!592805 () Bool)

(assert (=> b!616610 m!592805))

(declare-fun m!592807 () Bool)

(assert (=> b!616610 m!592807))

(assert (=> b!616610 m!592763))

(declare-fun m!592809 () Bool)

(assert (=> b!616610 m!592809))

(declare-fun m!592811 () Bool)

(assert (=> b!616610 m!592811))

(declare-fun m!592813 () Bool)

(assert (=> b!616617 m!592813))

(declare-fun m!592815 () Bool)

(assert (=> b!616609 m!592815))

(assert (=> b!616609 m!592763))

(declare-fun m!592817 () Bool)

(assert (=> b!616609 m!592817))

(assert (=> b!616609 m!592763))

(declare-fun m!592819 () Bool)

(assert (=> b!616609 m!592819))

(assert (=> b!616609 m!592763))

(declare-fun m!592821 () Bool)

(assert (=> b!616609 m!592821))

(assert (=> b!616609 m!592763))

(declare-fun m!592823 () Bool)

(assert (=> b!616609 m!592823))

(assert (=> b!616609 m!592807))

(assert (=> b!616609 m!592811))

(declare-fun m!592825 () Bool)

(assert (=> start!56034 m!592825))

(declare-fun m!592827 () Bool)

(assert (=> start!56034 m!592827))

(assert (=> b!616603 m!592763))

(assert (=> b!616603 m!592763))

(assert (=> b!616603 m!592809))

(declare-fun m!592829 () Bool)

(assert (=> b!616620 m!592829))

(assert (=> b!616608 m!592765))

(assert (=> b!616608 m!592783))

(assert (=> b!616614 m!592763))

(assert (=> b!616614 m!592763))

(assert (=> b!616614 m!592785))

(check-sat (not b!616599) (not b!616612) (not start!56034) (not b!616613) (not b!616609) (not b!616607) (not b!616605) (not b!616614) (not b!616606) (not b!616620) (not b!616619) (not b!616618) (not b!616603) (not b!616610))
(check-sat)
