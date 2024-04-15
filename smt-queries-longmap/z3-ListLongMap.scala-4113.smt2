; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56160 () Bool)

(assert start!56160)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!356508 () Bool)

(declare-fun b!621578 () Bool)

(declare-datatypes ((array!37644 0))(
  ( (array!37645 (arr!18068 (Array (_ BitVec 32) (_ BitVec 64))) (size!18433 (_ BitVec 32))) )
))
(declare-fun lt!287675 () array!37644)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37644)

(declare-fun arrayContainsKey!0 (array!37644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621578 (= e!356508 (arrayContainsKey!0 lt!287675 (select (arr!18068 a!2986) j!136) index!984))))

(declare-fun b!621579 () Bool)

(declare-fun e!356506 () Bool)

(declare-fun e!356496 () Bool)

(assert (=> b!621579 (= e!356506 e!356496)))

(declare-fun res!400621 () Bool)

(assert (=> b!621579 (=> (not res!400621) (not e!356496))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6505 0))(
  ( (MissingZero!6505 (index!28304 (_ BitVec 32))) (Found!6505 (index!28305 (_ BitVec 32))) (Intermediate!6505 (undefined!7317 Bool) (index!28306 (_ BitVec 32)) (x!57084 (_ BitVec 32))) (Undefined!6505) (MissingVacant!6505 (index!28307 (_ BitVec 32))) )
))
(declare-fun lt!287674 () SeekEntryResult!6505)

(assert (=> b!621579 (= res!400621 (and (= lt!287674 (Found!6505 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18068 a!2986) index!984) (select (arr!18068 a!2986) j!136))) (not (= (select (arr!18068 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37644 (_ BitVec 32)) SeekEntryResult!6505)

(assert (=> b!621579 (= lt!287674 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18068 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621580 () Bool)

(declare-fun res!400620 () Bool)

(declare-fun e!356495 () Bool)

(assert (=> b!621580 (=> (not res!400620) (not e!356495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621580 (= res!400620 (validKeyInArray!0 (select (arr!18068 a!2986) j!136)))))

(declare-fun e!356504 () Bool)

(declare-fun b!621582 () Bool)

(assert (=> b!621582 (= e!356504 (arrayContainsKey!0 lt!287675 (select (arr!18068 a!2986) j!136) index!984))))

(declare-fun res!400615 () Bool)

(declare-fun b!621583 () Bool)

(assert (=> b!621583 (= res!400615 (arrayContainsKey!0 lt!287675 (select (arr!18068 a!2986) j!136) j!136))))

(assert (=> b!621583 (=> (not res!400615) (not e!356508))))

(declare-fun e!356503 () Bool)

(assert (=> b!621583 (= e!356503 e!356508)))

(declare-fun b!621584 () Bool)

(declare-fun e!356499 () Bool)

(assert (=> b!621584 (= e!356499 e!356506)))

(declare-fun res!400625 () Bool)

(assert (=> b!621584 (=> (not res!400625) (not e!356506))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!621584 (= res!400625 (= (select (store (arr!18068 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621584 (= lt!287675 (array!37645 (store (arr!18068 a!2986) i!1108 k0!1786) (size!18433 a!2986)))))

(declare-fun b!621585 () Bool)

(assert (=> b!621585 false))

(declare-datatypes ((Unit!20796 0))(
  ( (Unit!20797) )
))
(declare-fun lt!287678 () Unit!20796)

(declare-datatypes ((List!12148 0))(
  ( (Nil!12145) (Cons!12144 (h!13189 (_ BitVec 64)) (t!18367 List!12148)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37644 (_ BitVec 64) (_ BitVec 32) List!12148) Unit!20796)

(assert (=> b!621585 (= lt!287678 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287675 (select (arr!18068 a!2986) j!136) j!136 Nil!12145))))

(declare-fun arrayNoDuplicates!0 (array!37644 (_ BitVec 32) List!12148) Bool)

(assert (=> b!621585 (arrayNoDuplicates!0 lt!287675 j!136 Nil!12145)))

(declare-fun lt!287677 () Unit!20796)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37644 (_ BitVec 32) (_ BitVec 32)) Unit!20796)

(assert (=> b!621585 (= lt!287677 (lemmaNoDuplicateFromThenFromBigger!0 lt!287675 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621585 (arrayNoDuplicates!0 lt!287675 #b00000000000000000000000000000000 Nil!12145)))

(declare-fun lt!287669 () Unit!20796)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12148) Unit!20796)

(assert (=> b!621585 (= lt!287669 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12145))))

(assert (=> b!621585 (arrayContainsKey!0 lt!287675 (select (arr!18068 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287682 () Unit!20796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20796)

(assert (=> b!621585 (= lt!287682 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287675 (select (arr!18068 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356502 () Unit!20796)

(declare-fun Unit!20798 () Unit!20796)

(assert (=> b!621585 (= e!356502 Unit!20798)))

(declare-fun b!621586 () Bool)

(declare-fun e!356498 () Unit!20796)

(declare-fun Unit!20799 () Unit!20796)

(assert (=> b!621586 (= e!356498 Unit!20799)))

(declare-fun b!621587 () Bool)

(declare-fun res!400622 () Bool)

(assert (=> b!621587 (=> (not res!400622) (not e!356495))))

(assert (=> b!621587 (= res!400622 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621588 () Bool)

(declare-fun e!356507 () Unit!20796)

(declare-fun Unit!20800 () Unit!20796)

(assert (=> b!621588 (= e!356507 Unit!20800)))

(declare-fun res!400619 () Bool)

(assert (=> b!621588 (= res!400619 (= (select (store (arr!18068 a!2986) i!1108 k0!1786) index!984) (select (arr!18068 a!2986) j!136)))))

(declare-fun e!356501 () Bool)

(assert (=> b!621588 (=> (not res!400619) (not e!356501))))

(assert (=> b!621588 e!356501))

(declare-fun c!70852 () Bool)

(assert (=> b!621588 (= c!70852 (bvslt j!136 index!984))))

(declare-fun lt!287676 () Unit!20796)

(assert (=> b!621588 (= lt!287676 e!356502)))

(declare-fun c!70853 () Bool)

(assert (=> b!621588 (= c!70853 (bvslt index!984 j!136))))

(declare-fun lt!287679 () Unit!20796)

(assert (=> b!621588 (= lt!287679 e!356498)))

(assert (=> b!621588 false))

(declare-fun b!621589 () Bool)

(assert (=> b!621589 (= e!356495 e!356499)))

(declare-fun res!400612 () Bool)

(assert (=> b!621589 (=> (not res!400612) (not e!356499))))

(declare-fun lt!287671 () SeekEntryResult!6505)

(assert (=> b!621589 (= res!400612 (or (= lt!287671 (MissingZero!6505 i!1108)) (= lt!287671 (MissingVacant!6505 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37644 (_ BitVec 32)) SeekEntryResult!6505)

(assert (=> b!621589 (= lt!287671 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!400613 () Bool)

(assert (=> start!56160 (=> (not res!400613) (not e!356495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56160 (= res!400613 (validMask!0 mask!3053))))

(assert (=> start!56160 e!356495))

(assert (=> start!56160 true))

(declare-fun array_inv!13951 (array!37644) Bool)

(assert (=> start!56160 (array_inv!13951 a!2986)))

(declare-fun b!621581 () Bool)

(assert (=> b!621581 (= e!356496 (not true))))

(declare-fun lt!287672 () Unit!20796)

(assert (=> b!621581 (= lt!287672 e!356507)))

(declare-fun c!70854 () Bool)

(declare-fun lt!287681 () SeekEntryResult!6505)

(assert (=> b!621581 (= c!70854 (= lt!287681 (Found!6505 index!984)))))

(declare-fun lt!287666 () Unit!20796)

(declare-fun e!356497 () Unit!20796)

(assert (=> b!621581 (= lt!287666 e!356497)))

(declare-fun c!70851 () Bool)

(assert (=> b!621581 (= c!70851 (= lt!287681 Undefined!6505))))

(declare-fun lt!287670 () (_ BitVec 64))

(assert (=> b!621581 (= lt!287681 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287670 lt!287675 mask!3053))))

(declare-fun e!356500 () Bool)

(assert (=> b!621581 e!356500))

(declare-fun res!400618 () Bool)

(assert (=> b!621581 (=> (not res!400618) (not e!356500))))

(declare-fun lt!287667 () SeekEntryResult!6505)

(declare-fun lt!287680 () (_ BitVec 32))

(assert (=> b!621581 (= res!400618 (= lt!287667 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287680 vacantSpotIndex!68 lt!287670 lt!287675 mask!3053)))))

(assert (=> b!621581 (= lt!287667 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287680 vacantSpotIndex!68 (select (arr!18068 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621581 (= lt!287670 (select (store (arr!18068 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287665 () Unit!20796)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37644 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20796)

(assert (=> b!621581 (= lt!287665 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287680 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621581 (= lt!287680 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621590 () Bool)

(declare-fun Unit!20801 () Unit!20796)

(assert (=> b!621590 (= e!356497 Unit!20801)))

(assert (=> b!621590 false))

(declare-fun b!621591 () Bool)

(assert (=> b!621591 (= e!356500 (= lt!287674 lt!287667))))

(declare-fun b!621592 () Bool)

(declare-fun res!400610 () Bool)

(assert (=> b!621592 (=> (not res!400610) (not e!356499))))

(assert (=> b!621592 (= res!400610 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12145))))

(declare-fun b!621593 () Bool)

(declare-fun res!400624 () Bool)

(assert (=> b!621593 (= res!400624 (bvsge j!136 index!984))))

(assert (=> b!621593 (=> res!400624 e!356503)))

(assert (=> b!621593 (= e!356501 e!356503)))

(declare-fun b!621594 () Bool)

(declare-fun Unit!20802 () Unit!20796)

(assert (=> b!621594 (= e!356497 Unit!20802)))

(declare-fun b!621595 () Bool)

(assert (=> b!621595 false))

(declare-fun lt!287668 () Unit!20796)

(assert (=> b!621595 (= lt!287668 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287675 (select (arr!18068 a!2986) j!136) index!984 Nil!12145))))

(assert (=> b!621595 (arrayNoDuplicates!0 lt!287675 index!984 Nil!12145)))

(declare-fun lt!287673 () Unit!20796)

(assert (=> b!621595 (= lt!287673 (lemmaNoDuplicateFromThenFromBigger!0 lt!287675 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621595 (arrayNoDuplicates!0 lt!287675 #b00000000000000000000000000000000 Nil!12145)))

(declare-fun lt!287683 () Unit!20796)

(assert (=> b!621595 (= lt!287683 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12145))))

(assert (=> b!621595 (arrayContainsKey!0 lt!287675 (select (arr!18068 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287664 () Unit!20796)

(assert (=> b!621595 (= lt!287664 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287675 (select (arr!18068 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621595 e!356504))

(declare-fun res!400623 () Bool)

(assert (=> b!621595 (=> (not res!400623) (not e!356504))))

(assert (=> b!621595 (= res!400623 (arrayContainsKey!0 lt!287675 (select (arr!18068 a!2986) j!136) j!136))))

(declare-fun Unit!20803 () Unit!20796)

(assert (=> b!621595 (= e!356498 Unit!20803)))

(declare-fun b!621596 () Bool)

(declare-fun res!400616 () Bool)

(assert (=> b!621596 (=> (not res!400616) (not e!356499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37644 (_ BitVec 32)) Bool)

(assert (=> b!621596 (= res!400616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621597 () Bool)

(declare-fun res!400614 () Bool)

(assert (=> b!621597 (=> (not res!400614) (not e!356495))))

(assert (=> b!621597 (= res!400614 (and (= (size!18433 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18433 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18433 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621598 () Bool)

(declare-fun Unit!20804 () Unit!20796)

(assert (=> b!621598 (= e!356502 Unit!20804)))

(declare-fun b!621599 () Bool)

(declare-fun Unit!20805 () Unit!20796)

(assert (=> b!621599 (= e!356507 Unit!20805)))

(declare-fun b!621600 () Bool)

(declare-fun res!400617 () Bool)

(assert (=> b!621600 (=> (not res!400617) (not e!356499))))

(assert (=> b!621600 (= res!400617 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18068 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621601 () Bool)

(declare-fun res!400611 () Bool)

(assert (=> b!621601 (=> (not res!400611) (not e!356495))))

(assert (=> b!621601 (= res!400611 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56160 res!400613) b!621597))

(assert (= (and b!621597 res!400614) b!621580))

(assert (= (and b!621580 res!400620) b!621601))

(assert (= (and b!621601 res!400611) b!621587))

(assert (= (and b!621587 res!400622) b!621589))

(assert (= (and b!621589 res!400612) b!621596))

(assert (= (and b!621596 res!400616) b!621592))

(assert (= (and b!621592 res!400610) b!621600))

(assert (= (and b!621600 res!400617) b!621584))

(assert (= (and b!621584 res!400625) b!621579))

(assert (= (and b!621579 res!400621) b!621581))

(assert (= (and b!621581 res!400618) b!621591))

(assert (= (and b!621581 c!70851) b!621590))

(assert (= (and b!621581 (not c!70851)) b!621594))

(assert (= (and b!621581 c!70854) b!621588))

(assert (= (and b!621581 (not c!70854)) b!621599))

(assert (= (and b!621588 res!400619) b!621593))

(assert (= (and b!621593 (not res!400624)) b!621583))

(assert (= (and b!621583 res!400615) b!621578))

(assert (= (and b!621588 c!70852) b!621585))

(assert (= (and b!621588 (not c!70852)) b!621598))

(assert (= (and b!621588 c!70853) b!621595))

(assert (= (and b!621588 (not c!70853)) b!621586))

(assert (= (and b!621595 res!400623) b!621582))

(declare-fun m!596959 () Bool)

(assert (=> b!621581 m!596959))

(declare-fun m!596961 () Bool)

(assert (=> b!621581 m!596961))

(declare-fun m!596963 () Bool)

(assert (=> b!621581 m!596963))

(declare-fun m!596965 () Bool)

(assert (=> b!621581 m!596965))

(declare-fun m!596967 () Bool)

(assert (=> b!621581 m!596967))

(declare-fun m!596969 () Bool)

(assert (=> b!621581 m!596969))

(declare-fun m!596971 () Bool)

(assert (=> b!621581 m!596971))

(assert (=> b!621581 m!596967))

(declare-fun m!596973 () Bool)

(assert (=> b!621581 m!596973))

(declare-fun m!596975 () Bool)

(assert (=> b!621589 m!596975))

(declare-fun m!596977 () Bool)

(assert (=> b!621579 m!596977))

(assert (=> b!621579 m!596967))

(assert (=> b!621579 m!596967))

(declare-fun m!596979 () Bool)

(assert (=> b!621579 m!596979))

(assert (=> b!621580 m!596967))

(assert (=> b!621580 m!596967))

(declare-fun m!596981 () Bool)

(assert (=> b!621580 m!596981))

(assert (=> b!621585 m!596967))

(declare-fun m!596983 () Bool)

(assert (=> b!621585 m!596983))

(assert (=> b!621585 m!596967))

(declare-fun m!596985 () Bool)

(assert (=> b!621585 m!596985))

(declare-fun m!596987 () Bool)

(assert (=> b!621585 m!596987))

(assert (=> b!621585 m!596967))

(declare-fun m!596989 () Bool)

(assert (=> b!621585 m!596989))

(declare-fun m!596991 () Bool)

(assert (=> b!621585 m!596991))

(declare-fun m!596993 () Bool)

(assert (=> b!621585 m!596993))

(assert (=> b!621585 m!596967))

(declare-fun m!596995 () Bool)

(assert (=> b!621585 m!596995))

(assert (=> b!621583 m!596967))

(assert (=> b!621583 m!596967))

(declare-fun m!596997 () Bool)

(assert (=> b!621583 m!596997))

(declare-fun m!596999 () Bool)

(assert (=> b!621587 m!596999))

(declare-fun m!597001 () Bool)

(assert (=> b!621600 m!597001))

(assert (=> b!621595 m!596967))

(declare-fun m!597003 () Bool)

(assert (=> b!621595 m!597003))

(declare-fun m!597005 () Bool)

(assert (=> b!621595 m!597005))

(assert (=> b!621595 m!596967))

(assert (=> b!621595 m!596967))

(declare-fun m!597007 () Bool)

(assert (=> b!621595 m!597007))

(assert (=> b!621595 m!596967))

(declare-fun m!597009 () Bool)

(assert (=> b!621595 m!597009))

(assert (=> b!621595 m!596967))

(assert (=> b!621595 m!596997))

(assert (=> b!621595 m!596991))

(declare-fun m!597011 () Bool)

(assert (=> b!621595 m!597011))

(assert (=> b!621595 m!596987))

(declare-fun m!597013 () Bool)

(assert (=> start!56160 m!597013))

(declare-fun m!597015 () Bool)

(assert (=> start!56160 m!597015))

(declare-fun m!597017 () Bool)

(assert (=> b!621592 m!597017))

(declare-fun m!597019 () Bool)

(assert (=> b!621596 m!597019))

(declare-fun m!597021 () Bool)

(assert (=> b!621601 m!597021))

(assert (=> b!621582 m!596967))

(assert (=> b!621582 m!596967))

(declare-fun m!597023 () Bool)

(assert (=> b!621582 m!597023))

(assert (=> b!621578 m!596967))

(assert (=> b!621578 m!596967))

(assert (=> b!621578 m!597023))

(assert (=> b!621584 m!596971))

(declare-fun m!597025 () Bool)

(assert (=> b!621584 m!597025))

(assert (=> b!621588 m!596971))

(declare-fun m!597027 () Bool)

(assert (=> b!621588 m!597027))

(assert (=> b!621588 m!596967))

(check-sat (not b!621601) (not start!56160) (not b!621581) (not b!621585) (not b!621582) (not b!621595) (not b!621589) (not b!621578) (not b!621587) (not b!621592) (not b!621579) (not b!621583) (not b!621596) (not b!621580))
(check-sat)
