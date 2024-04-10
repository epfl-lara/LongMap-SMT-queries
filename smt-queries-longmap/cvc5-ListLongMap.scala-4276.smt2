; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59564 () Bool)

(assert start!59564)

(declare-fun b!657554 () Bool)

(declare-fun res!426409 () Bool)

(declare-fun e!377741 () Bool)

(assert (=> b!657554 (=> (not res!426409) (not e!377741))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38722 0))(
  ( (array!38723 (arr!18558 (Array (_ BitVec 32) (_ BitVec 64))) (size!18922 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38722)

(assert (=> b!657554 (= res!426409 (and (= (size!18922 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18922 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18922 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657555 () Bool)

(declare-fun res!426404 () Bool)

(declare-fun e!377732 () Bool)

(assert (=> b!657555 (=> (not res!426404) (not e!377732))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657555 (= res!426404 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18558 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657556 () Bool)

(declare-fun e!377731 () Bool)

(assert (=> b!657556 (= e!377732 e!377731)))

(declare-fun res!426401 () Bool)

(assert (=> b!657556 (=> (not res!426401) (not e!377731))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!657556 (= res!426401 (= (select (store (arr!18558 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!307161 () array!38722)

(assert (=> b!657556 (= lt!307161 (array!38723 (store (arr!18558 a!2986) i!1108 k!1786) (size!18922 a!2986)))))

(declare-fun b!657557 () Bool)

(declare-fun res!426394 () Bool)

(assert (=> b!657557 (=> (not res!426394) (not e!377732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38722 (_ BitVec 32)) Bool)

(assert (=> b!657557 (= res!426394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657558 () Bool)

(declare-fun e!377733 () Bool)

(declare-datatypes ((SeekEntryResult!6998 0))(
  ( (MissingZero!6998 (index!30357 (_ BitVec 32))) (Found!6998 (index!30358 (_ BitVec 32))) (Intermediate!6998 (undefined!7810 Bool) (index!30359 (_ BitVec 32)) (x!59153 (_ BitVec 32))) (Undefined!6998) (MissingVacant!6998 (index!30360 (_ BitVec 32))) )
))
(declare-fun lt!307156 () SeekEntryResult!6998)

(declare-fun lt!307167 () SeekEntryResult!6998)

(assert (=> b!657558 (= e!377733 (= lt!307156 lt!307167))))

(declare-fun b!657559 () Bool)

(declare-fun e!377742 () Bool)

(declare-fun arrayContainsKey!0 (array!38722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657559 (= e!377742 (arrayContainsKey!0 lt!307161 (select (arr!18558 a!2986) j!136) index!984))))

(declare-fun b!657560 () Bool)

(declare-fun e!377728 () Bool)

(assert (=> b!657560 (= e!377731 e!377728)))

(declare-fun res!426403 () Bool)

(assert (=> b!657560 (=> (not res!426403) (not e!377728))))

(assert (=> b!657560 (= res!426403 (and (= lt!307156 (Found!6998 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18558 a!2986) index!984) (select (arr!18558 a!2986) j!136))) (not (= (select (arr!18558 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38722 (_ BitVec 32)) SeekEntryResult!6998)

(assert (=> b!657560 (= lt!307156 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18558 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657561 () Bool)

(declare-datatypes ((Unit!22734 0))(
  ( (Unit!22735) )
))
(declare-fun e!377739 () Unit!22734)

(declare-fun Unit!22736 () Unit!22734)

(assert (=> b!657561 (= e!377739 Unit!22736)))

(declare-fun b!657562 () Bool)

(declare-fun res!426396 () Bool)

(assert (=> b!657562 (=> (not res!426396) (not e!377741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657562 (= res!426396 (validKeyInArray!0 k!1786))))

(declare-fun b!657563 () Bool)

(declare-fun res!426407 () Bool)

(assert (=> b!657563 (=> (not res!426407) (not e!377741))))

(assert (=> b!657563 (= res!426407 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657564 () Bool)

(declare-fun e!377729 () Unit!22734)

(declare-fun Unit!22737 () Unit!22734)

(assert (=> b!657564 (= e!377729 Unit!22737)))

(assert (=> b!657564 false))

(declare-fun b!657565 () Bool)

(assert (=> b!657565 false))

(declare-fun lt!307157 () Unit!22734)

(declare-datatypes ((List!12599 0))(
  ( (Nil!12596) (Cons!12595 (h!13640 (_ BitVec 64)) (t!18827 List!12599)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38722 (_ BitVec 64) (_ BitVec 32) List!12599) Unit!22734)

(assert (=> b!657565 (= lt!307157 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307161 (select (arr!18558 a!2986) j!136) j!136 Nil!12596))))

(declare-fun arrayNoDuplicates!0 (array!38722 (_ BitVec 32) List!12599) Bool)

(assert (=> b!657565 (arrayNoDuplicates!0 lt!307161 j!136 Nil!12596)))

(declare-fun lt!307153 () Unit!22734)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38722 (_ BitVec 32) (_ BitVec 32)) Unit!22734)

(assert (=> b!657565 (= lt!307153 (lemmaNoDuplicateFromThenFromBigger!0 lt!307161 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657565 (arrayNoDuplicates!0 lt!307161 #b00000000000000000000000000000000 Nil!12596)))

(declare-fun lt!307150 () Unit!22734)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38722 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12599) Unit!22734)

(assert (=> b!657565 (= lt!307150 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12596))))

(assert (=> b!657565 (arrayContainsKey!0 lt!307161 (select (arr!18558 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307149 () Unit!22734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38722 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22734)

(assert (=> b!657565 (= lt!307149 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307161 (select (arr!18558 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22738 () Unit!22734)

(assert (=> b!657565 (= e!377739 Unit!22738)))

(declare-fun b!657566 () Bool)

(declare-fun res!426402 () Bool)

(assert (=> b!657566 (=> (not res!426402) (not e!377732))))

(assert (=> b!657566 (= res!426402 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12596))))

(declare-fun b!657567 () Bool)

(declare-fun e!377730 () Bool)

(assert (=> b!657567 (= e!377730 (arrayContainsKey!0 lt!307161 (select (arr!18558 a!2986) j!136) index!984))))

(declare-fun res!426408 () Bool)

(assert (=> start!59564 (=> (not res!426408) (not e!377741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59564 (= res!426408 (validMask!0 mask!3053))))

(assert (=> start!59564 e!377741))

(assert (=> start!59564 true))

(declare-fun array_inv!14354 (array!38722) Bool)

(assert (=> start!59564 (array_inv!14354 a!2986)))

(declare-fun res!426405 () Bool)

(declare-fun b!657568 () Bool)

(assert (=> b!657568 (= res!426405 (arrayContainsKey!0 lt!307161 (select (arr!18558 a!2986) j!136) j!136))))

(assert (=> b!657568 (=> (not res!426405) (not e!377730))))

(declare-fun e!377740 () Bool)

(assert (=> b!657568 (= e!377740 e!377730)))

(declare-fun b!657569 () Bool)

(declare-fun Unit!22739 () Unit!22734)

(assert (=> b!657569 (= e!377729 Unit!22739)))

(declare-fun b!657570 () Bool)

(declare-fun res!426399 () Bool)

(assert (=> b!657570 (=> (not res!426399) (not e!377741))))

(assert (=> b!657570 (= res!426399 (validKeyInArray!0 (select (arr!18558 a!2986) j!136)))))

(declare-fun b!657571 () Bool)

(declare-fun res!426397 () Bool)

(assert (=> b!657571 (= res!426397 (bvsge j!136 index!984))))

(assert (=> b!657571 (=> res!426397 e!377740)))

(declare-fun e!377737 () Bool)

(assert (=> b!657571 (= e!377737 e!377740)))

(declare-fun b!657572 () Bool)

(declare-fun e!377735 () Unit!22734)

(declare-fun Unit!22740 () Unit!22734)

(assert (=> b!657572 (= e!377735 Unit!22740)))

(declare-fun b!657573 () Bool)

(declare-fun e!377736 () Unit!22734)

(declare-fun Unit!22741 () Unit!22734)

(assert (=> b!657573 (= e!377736 Unit!22741)))

(declare-fun res!426398 () Bool)

(assert (=> b!657573 (= res!426398 (= (select (store (arr!18558 a!2986) i!1108 k!1786) index!984) (select (arr!18558 a!2986) j!136)))))

(assert (=> b!657573 (=> (not res!426398) (not e!377737))))

(assert (=> b!657573 e!377737))

(declare-fun c!75948 () Bool)

(assert (=> b!657573 (= c!75948 (bvslt j!136 index!984))))

(declare-fun lt!307168 () Unit!22734)

(assert (=> b!657573 (= lt!307168 e!377739)))

(declare-fun c!75947 () Bool)

(assert (=> b!657573 (= c!75947 (bvslt index!984 j!136))))

(declare-fun lt!307159 () Unit!22734)

(assert (=> b!657573 (= lt!307159 e!377735)))

(assert (=> b!657573 false))

(declare-fun b!657574 () Bool)

(assert (=> b!657574 (= e!377741 e!377732)))

(declare-fun res!426400 () Bool)

(assert (=> b!657574 (=> (not res!426400) (not e!377732))))

(declare-fun lt!307162 () SeekEntryResult!6998)

(assert (=> b!657574 (= res!426400 (or (= lt!307162 (MissingZero!6998 i!1108)) (= lt!307162 (MissingVacant!6998 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38722 (_ BitVec 32)) SeekEntryResult!6998)

(assert (=> b!657574 (= lt!307162 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657575 () Bool)

(declare-fun e!377738 () Bool)

(assert (=> b!657575 (= e!377728 (not e!377738))))

(declare-fun res!426395 () Bool)

(assert (=> b!657575 (=> res!426395 e!377738)))

(declare-fun lt!307160 () SeekEntryResult!6998)

(assert (=> b!657575 (= res!426395 (not (= lt!307160 (MissingVacant!6998 vacantSpotIndex!68))))))

(declare-fun lt!307166 () Unit!22734)

(assert (=> b!657575 (= lt!307166 e!377736)))

(declare-fun c!75949 () Bool)

(assert (=> b!657575 (= c!75949 (= lt!307160 (Found!6998 index!984)))))

(declare-fun lt!307154 () Unit!22734)

(assert (=> b!657575 (= lt!307154 e!377729)))

(declare-fun c!75950 () Bool)

(assert (=> b!657575 (= c!75950 (= lt!307160 Undefined!6998))))

(declare-fun lt!307155 () (_ BitVec 64))

(assert (=> b!657575 (= lt!307160 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307155 lt!307161 mask!3053))))

(assert (=> b!657575 e!377733))

(declare-fun res!426410 () Bool)

(assert (=> b!657575 (=> (not res!426410) (not e!377733))))

(declare-fun lt!307163 () (_ BitVec 32))

(assert (=> b!657575 (= res!426410 (= lt!307167 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307163 vacantSpotIndex!68 lt!307155 lt!307161 mask!3053)))))

(assert (=> b!657575 (= lt!307167 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307163 vacantSpotIndex!68 (select (arr!18558 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657575 (= lt!307155 (select (store (arr!18558 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307152 () Unit!22734)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38722 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22734)

(assert (=> b!657575 (= lt!307152 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307163 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657575 (= lt!307163 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657576 () Bool)

(assert (=> b!657576 false))

(declare-fun lt!307165 () Unit!22734)

(assert (=> b!657576 (= lt!307165 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307161 (select (arr!18558 a!2986) j!136) index!984 Nil!12596))))

(assert (=> b!657576 (arrayNoDuplicates!0 lt!307161 index!984 Nil!12596)))

(declare-fun lt!307151 () Unit!22734)

(assert (=> b!657576 (= lt!307151 (lemmaNoDuplicateFromThenFromBigger!0 lt!307161 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657576 (arrayNoDuplicates!0 lt!307161 #b00000000000000000000000000000000 Nil!12596)))

(declare-fun lt!307158 () Unit!22734)

(assert (=> b!657576 (= lt!307158 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12596))))

(assert (=> b!657576 (arrayContainsKey!0 lt!307161 (select (arr!18558 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307164 () Unit!22734)

(assert (=> b!657576 (= lt!307164 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307161 (select (arr!18558 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657576 e!377742))

(declare-fun res!426406 () Bool)

(assert (=> b!657576 (=> (not res!426406) (not e!377742))))

(assert (=> b!657576 (= res!426406 (arrayContainsKey!0 lt!307161 (select (arr!18558 a!2986) j!136) j!136))))

(declare-fun Unit!22742 () Unit!22734)

(assert (=> b!657576 (= e!377735 Unit!22742)))

(declare-fun b!657577 () Bool)

(declare-fun Unit!22743 () Unit!22734)

(assert (=> b!657577 (= e!377736 Unit!22743)))

(declare-fun b!657578 () Bool)

(assert (=> b!657578 (= e!377738 true)))

(assert (=> b!657578 (= (select (store (arr!18558 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and start!59564 res!426408) b!657554))

(assert (= (and b!657554 res!426409) b!657570))

(assert (= (and b!657570 res!426399) b!657562))

(assert (= (and b!657562 res!426396) b!657563))

(assert (= (and b!657563 res!426407) b!657574))

(assert (= (and b!657574 res!426400) b!657557))

(assert (= (and b!657557 res!426394) b!657566))

(assert (= (and b!657566 res!426402) b!657555))

(assert (= (and b!657555 res!426404) b!657556))

(assert (= (and b!657556 res!426401) b!657560))

(assert (= (and b!657560 res!426403) b!657575))

(assert (= (and b!657575 res!426410) b!657558))

(assert (= (and b!657575 c!75950) b!657564))

(assert (= (and b!657575 (not c!75950)) b!657569))

(assert (= (and b!657575 c!75949) b!657573))

(assert (= (and b!657575 (not c!75949)) b!657577))

(assert (= (and b!657573 res!426398) b!657571))

(assert (= (and b!657571 (not res!426397)) b!657568))

(assert (= (and b!657568 res!426405) b!657567))

(assert (= (and b!657573 c!75948) b!657565))

(assert (= (and b!657573 (not c!75948)) b!657561))

(assert (= (and b!657573 c!75947) b!657576))

(assert (= (and b!657573 (not c!75947)) b!657572))

(assert (= (and b!657576 res!426406) b!657559))

(assert (= (and b!657575 (not res!426395)) b!657578))

(declare-fun m!630587 () Bool)

(assert (=> b!657575 m!630587))

(declare-fun m!630589 () Bool)

(assert (=> b!657575 m!630589))

(declare-fun m!630591 () Bool)

(assert (=> b!657575 m!630591))

(declare-fun m!630593 () Bool)

(assert (=> b!657575 m!630593))

(declare-fun m!630595 () Bool)

(assert (=> b!657575 m!630595))

(declare-fun m!630597 () Bool)

(assert (=> b!657575 m!630597))

(assert (=> b!657575 m!630593))

(declare-fun m!630599 () Bool)

(assert (=> b!657575 m!630599))

(declare-fun m!630601 () Bool)

(assert (=> b!657575 m!630601))

(assert (=> b!657578 m!630595))

(declare-fun m!630603 () Bool)

(assert (=> b!657578 m!630603))

(declare-fun m!630605 () Bool)

(assert (=> b!657557 m!630605))

(declare-fun m!630607 () Bool)

(assert (=> b!657560 m!630607))

(assert (=> b!657560 m!630593))

(assert (=> b!657560 m!630593))

(declare-fun m!630609 () Bool)

(assert (=> b!657560 m!630609))

(assert (=> b!657570 m!630593))

(assert (=> b!657570 m!630593))

(declare-fun m!630611 () Bool)

(assert (=> b!657570 m!630611))

(declare-fun m!630613 () Bool)

(assert (=> b!657562 m!630613))

(assert (=> b!657559 m!630593))

(assert (=> b!657559 m!630593))

(declare-fun m!630615 () Bool)

(assert (=> b!657559 m!630615))

(assert (=> b!657576 m!630593))

(assert (=> b!657576 m!630593))

(declare-fun m!630617 () Bool)

(assert (=> b!657576 m!630617))

(assert (=> b!657576 m!630593))

(declare-fun m!630619 () Bool)

(assert (=> b!657576 m!630619))

(declare-fun m!630621 () Bool)

(assert (=> b!657576 m!630621))

(assert (=> b!657576 m!630593))

(declare-fun m!630623 () Bool)

(assert (=> b!657576 m!630623))

(declare-fun m!630625 () Bool)

(assert (=> b!657576 m!630625))

(assert (=> b!657576 m!630593))

(declare-fun m!630627 () Bool)

(assert (=> b!657576 m!630627))

(declare-fun m!630629 () Bool)

(assert (=> b!657576 m!630629))

(declare-fun m!630631 () Bool)

(assert (=> b!657576 m!630631))

(declare-fun m!630633 () Bool)

(assert (=> start!59564 m!630633))

(declare-fun m!630635 () Bool)

(assert (=> start!59564 m!630635))

(declare-fun m!630637 () Bool)

(assert (=> b!657555 m!630637))

(declare-fun m!630639 () Bool)

(assert (=> b!657563 m!630639))

(assert (=> b!657567 m!630593))

(assert (=> b!657567 m!630593))

(assert (=> b!657567 m!630615))

(declare-fun m!630641 () Bool)

(assert (=> b!657574 m!630641))

(declare-fun m!630643 () Bool)

(assert (=> b!657566 m!630643))

(assert (=> b!657573 m!630595))

(assert (=> b!657573 m!630603))

(assert (=> b!657573 m!630593))

(assert (=> b!657568 m!630593))

(assert (=> b!657568 m!630593))

(assert (=> b!657568 m!630617))

(assert (=> b!657565 m!630593))

(assert (=> b!657565 m!630593))

(declare-fun m!630645 () Bool)

(assert (=> b!657565 m!630645))

(declare-fun m!630647 () Bool)

(assert (=> b!657565 m!630647))

(declare-fun m!630649 () Bool)

(assert (=> b!657565 m!630649))

(assert (=> b!657565 m!630625))

(assert (=> b!657565 m!630593))

(declare-fun m!630651 () Bool)

(assert (=> b!657565 m!630651))

(assert (=> b!657565 m!630593))

(declare-fun m!630653 () Bool)

(assert (=> b!657565 m!630653))

(assert (=> b!657565 m!630621))

(assert (=> b!657556 m!630595))

(declare-fun m!630655 () Bool)

(assert (=> b!657556 m!630655))

(push 1)

