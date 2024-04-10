; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59334 () Bool)

(assert start!59334)

(declare-fun b!654597 () Bool)

(declare-fun res!424610 () Bool)

(declare-fun e!375921 () Bool)

(assert (=> b!654597 (=> (not res!424610) (not e!375921))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38654 0))(
  ( (array!38655 (arr!18527 (Array (_ BitVec 32) (_ BitVec 64))) (size!18891 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38654)

(assert (=> b!654597 (= res!424610 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18527 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654598 () Bool)

(declare-fun res!424594 () Bool)

(declare-fun e!375908 () Bool)

(assert (=> b!654598 (=> (not res!424594) (not e!375908))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654598 (= res!424594 (validKeyInArray!0 k!1786))))

(declare-fun b!654599 () Bool)

(declare-datatypes ((Unit!22432 0))(
  ( (Unit!22433) )
))
(declare-fun e!375912 () Unit!22432)

(declare-fun Unit!22434 () Unit!22432)

(assert (=> b!654599 (= e!375912 Unit!22434)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!304987 () array!38654)

(declare-fun lt!304988 () Unit!22432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38654 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22432)

(assert (=> b!654599 (= lt!304988 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304987 (select (arr!18527 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654599 (arrayContainsKey!0 lt!304987 (select (arr!18527 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!304990 () Unit!22432)

(declare-datatypes ((List!12568 0))(
  ( (Nil!12565) (Cons!12564 (h!13609 (_ BitVec 64)) (t!18796 List!12568)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38654 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12568) Unit!22432)

(assert (=> b!654599 (= lt!304990 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12565))))

(declare-fun arrayNoDuplicates!0 (array!38654 (_ BitVec 32) List!12568) Bool)

(assert (=> b!654599 (arrayNoDuplicates!0 lt!304987 #b00000000000000000000000000000000 Nil!12565)))

(declare-fun lt!304984 () Unit!22432)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38654 (_ BitVec 32) (_ BitVec 32)) Unit!22432)

(assert (=> b!654599 (= lt!304984 (lemmaNoDuplicateFromThenFromBigger!0 lt!304987 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654599 (arrayNoDuplicates!0 lt!304987 j!136 Nil!12565)))

(declare-fun lt!304989 () Unit!22432)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38654 (_ BitVec 64) (_ BitVec 32) List!12568) Unit!22432)

(assert (=> b!654599 (= lt!304989 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304987 (select (arr!18527 a!2986) j!136) j!136 Nil!12565))))

(assert (=> b!654599 false))

(declare-fun b!654600 () Bool)

(declare-fun e!375918 () Bool)

(declare-fun e!375909 () Bool)

(assert (=> b!654600 (= e!375918 (not e!375909))))

(declare-fun res!424596 () Bool)

(assert (=> b!654600 (=> res!424596 e!375909)))

(declare-datatypes ((SeekEntryResult!6967 0))(
  ( (MissingZero!6967 (index!30227 (_ BitVec 32))) (Found!6967 (index!30228 (_ BitVec 32))) (Intermediate!6967 (undefined!7779 Bool) (index!30229 (_ BitVec 32)) (x!59016 (_ BitVec 32))) (Undefined!6967) (MissingVacant!6967 (index!30230 (_ BitVec 32))) )
))
(declare-fun lt!304997 () SeekEntryResult!6967)

(assert (=> b!654600 (= res!424596 (not (= lt!304997 (Found!6967 index!984))))))

(declare-fun lt!304992 () Unit!22432)

(declare-fun e!375914 () Unit!22432)

(assert (=> b!654600 (= lt!304992 e!375914)))

(declare-fun c!75370 () Bool)

(assert (=> b!654600 (= c!75370 (= lt!304997 Undefined!6967))))

(declare-fun lt!304983 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38654 (_ BitVec 32)) SeekEntryResult!6967)

(assert (=> b!654600 (= lt!304997 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304983 lt!304987 mask!3053))))

(declare-fun e!375915 () Bool)

(assert (=> b!654600 e!375915))

(declare-fun res!424597 () Bool)

(assert (=> b!654600 (=> (not res!424597) (not e!375915))))

(declare-fun lt!304986 () SeekEntryResult!6967)

(declare-fun lt!305000 () (_ BitVec 32))

(assert (=> b!654600 (= res!424597 (= lt!304986 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305000 vacantSpotIndex!68 lt!304983 lt!304987 mask!3053)))))

(assert (=> b!654600 (= lt!304986 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305000 vacantSpotIndex!68 (select (arr!18527 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654600 (= lt!304983 (select (store (arr!18527 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305001 () Unit!22432)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38654 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22432)

(assert (=> b!654600 (= lt!305001 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305000 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654600 (= lt!305000 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654601 () Bool)

(declare-fun Unit!22435 () Unit!22432)

(assert (=> b!654601 (= e!375912 Unit!22435)))

(declare-fun b!654602 () Bool)

(declare-fun lt!304994 () SeekEntryResult!6967)

(assert (=> b!654602 (= e!375915 (= lt!304994 lt!304986))))

(declare-fun b!654603 () Bool)

(declare-fun res!424603 () Bool)

(assert (=> b!654603 (=> (not res!424603) (not e!375908))))

(assert (=> b!654603 (= res!424603 (validKeyInArray!0 (select (arr!18527 a!2986) j!136)))))

(declare-fun b!654605 () Bool)

(declare-fun res!424607 () Bool)

(assert (=> b!654605 (=> (not res!424607) (not e!375908))))

(assert (=> b!654605 (= res!424607 (and (= (size!18891 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18891 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18891 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654606 () Bool)

(declare-fun e!375911 () Bool)

(assert (=> b!654606 (= e!375911 false)))

(declare-fun lt!304995 () Unit!22432)

(declare-fun e!375917 () Unit!22432)

(assert (=> b!654606 (= lt!304995 e!375917)))

(declare-fun c!75371 () Bool)

(assert (=> b!654606 (= c!75371 (bvslt index!984 j!136))))

(declare-fun lt!304991 () Unit!22432)

(assert (=> b!654606 (= lt!304991 e!375912)))

(declare-fun c!75369 () Bool)

(assert (=> b!654606 (= c!75369 (bvslt j!136 index!984))))

(declare-fun b!654607 () Bool)

(declare-fun e!375916 () Bool)

(declare-fun e!375919 () Bool)

(assert (=> b!654607 (= e!375916 e!375919)))

(declare-fun res!424601 () Bool)

(assert (=> b!654607 (=> res!424601 e!375919)))

(declare-fun lt!304996 () (_ BitVec 64))

(assert (=> b!654607 (= res!424601 (or (not (= (select (arr!18527 a!2986) j!136) lt!304983)) (not (= (select (arr!18527 a!2986) j!136) lt!304996)) (bvsge j!136 index!984)))))

(declare-fun b!654608 () Bool)

(declare-fun e!375913 () Bool)

(assert (=> b!654608 (= e!375913 e!375918)))

(declare-fun res!424608 () Bool)

(assert (=> b!654608 (=> (not res!424608) (not e!375918))))

(assert (=> b!654608 (= res!424608 (and (= lt!304994 (Found!6967 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18527 a!2986) index!984) (select (arr!18527 a!2986) j!136))) (not (= (select (arr!18527 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!654608 (= lt!304994 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18527 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654609 () Bool)

(declare-fun Unit!22436 () Unit!22432)

(assert (=> b!654609 (= e!375914 Unit!22436)))

(declare-fun b!654610 () Bool)

(assert (=> b!654610 (= e!375921 e!375913)))

(declare-fun res!424606 () Bool)

(assert (=> b!654610 (=> (not res!424606) (not e!375913))))

(assert (=> b!654610 (= res!424606 (= (select (store (arr!18527 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654610 (= lt!304987 (array!38655 (store (arr!18527 a!2986) i!1108 k!1786) (size!18891 a!2986)))))

(declare-fun res!424609 () Bool)

(assert (=> start!59334 (=> (not res!424609) (not e!375908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59334 (= res!424609 (validMask!0 mask!3053))))

(assert (=> start!59334 e!375908))

(assert (=> start!59334 true))

(declare-fun array_inv!14323 (array!38654) Bool)

(assert (=> start!59334 (array_inv!14323 a!2986)))

(declare-fun b!654604 () Bool)

(declare-fun res!424595 () Bool)

(assert (=> b!654604 (=> (not res!424595) (not e!375921))))

(assert (=> b!654604 (= res!424595 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12565))))

(declare-fun b!654611 () Bool)

(declare-fun e!375920 () Bool)

(assert (=> b!654611 (= e!375919 e!375920)))

(declare-fun res!424602 () Bool)

(assert (=> b!654611 (=> (not res!424602) (not e!375920))))

(assert (=> b!654611 (= res!424602 (arrayContainsKey!0 lt!304987 (select (arr!18527 a!2986) j!136) j!136))))

(declare-fun b!654612 () Bool)

(declare-fun Unit!22437 () Unit!22432)

(assert (=> b!654612 (= e!375914 Unit!22437)))

(assert (=> b!654612 false))

(declare-fun e!375910 () Bool)

(declare-fun b!654613 () Bool)

(assert (=> b!654613 (= e!375910 (arrayContainsKey!0 lt!304987 (select (arr!18527 a!2986) j!136) index!984))))

(declare-fun b!654614 () Bool)

(declare-fun res!424604 () Bool)

(assert (=> b!654614 (=> (not res!424604) (not e!375908))))

(assert (=> b!654614 (= res!424604 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654615 () Bool)

(declare-fun Unit!22438 () Unit!22432)

(assert (=> b!654615 (= e!375917 Unit!22438)))

(declare-fun res!424598 () Bool)

(assert (=> b!654615 (= res!424598 (arrayContainsKey!0 lt!304987 (select (arr!18527 a!2986) j!136) j!136))))

(assert (=> b!654615 (=> (not res!424598) (not e!375910))))

(assert (=> b!654615 e!375910))

(declare-fun lt!304999 () Unit!22432)

(assert (=> b!654615 (= lt!304999 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304987 (select (arr!18527 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654615 (arrayContainsKey!0 lt!304987 (select (arr!18527 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304985 () Unit!22432)

(assert (=> b!654615 (= lt!304985 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12565))))

(assert (=> b!654615 (arrayNoDuplicates!0 lt!304987 #b00000000000000000000000000000000 Nil!12565)))

(declare-fun lt!305002 () Unit!22432)

(assert (=> b!654615 (= lt!305002 (lemmaNoDuplicateFromThenFromBigger!0 lt!304987 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654615 (arrayNoDuplicates!0 lt!304987 index!984 Nil!12565)))

(declare-fun lt!304998 () Unit!22432)

(assert (=> b!654615 (= lt!304998 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304987 (select (arr!18527 a!2986) j!136) index!984 Nil!12565))))

(assert (=> b!654615 false))

(declare-fun b!654616 () Bool)

(assert (=> b!654616 (= e!375920 (arrayContainsKey!0 lt!304987 (select (arr!18527 a!2986) j!136) index!984))))

(declare-fun b!654617 () Bool)

(declare-fun res!424600 () Bool)

(assert (=> b!654617 (=> (not res!424600) (not e!375921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38654 (_ BitVec 32)) Bool)

(assert (=> b!654617 (= res!424600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654618 () Bool)

(assert (=> b!654618 (= e!375908 e!375921)))

(declare-fun res!424593 () Bool)

(assert (=> b!654618 (=> (not res!424593) (not e!375921))))

(declare-fun lt!304993 () SeekEntryResult!6967)

(assert (=> b!654618 (= res!424593 (or (= lt!304993 (MissingZero!6967 i!1108)) (= lt!304993 (MissingVacant!6967 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38654 (_ BitVec 32)) SeekEntryResult!6967)

(assert (=> b!654618 (= lt!304993 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!654619 () Bool)

(assert (=> b!654619 (= e!375909 e!375911)))

(declare-fun res!424599 () Bool)

(assert (=> b!654619 (=> res!424599 e!375911)))

(assert (=> b!654619 (= res!424599 (or (not (= (select (arr!18527 a!2986) j!136) lt!304983)) (not (= (select (arr!18527 a!2986) j!136) lt!304996))))))

(assert (=> b!654619 e!375916))

(declare-fun res!424605 () Bool)

(assert (=> b!654619 (=> (not res!424605) (not e!375916))))

(assert (=> b!654619 (= res!424605 (= lt!304996 (select (arr!18527 a!2986) j!136)))))

(assert (=> b!654619 (= lt!304996 (select (store (arr!18527 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!654620 () Bool)

(declare-fun Unit!22439 () Unit!22432)

(assert (=> b!654620 (= e!375917 Unit!22439)))

(assert (= (and start!59334 res!424609) b!654605))

(assert (= (and b!654605 res!424607) b!654603))

(assert (= (and b!654603 res!424603) b!654598))

(assert (= (and b!654598 res!424594) b!654614))

(assert (= (and b!654614 res!424604) b!654618))

(assert (= (and b!654618 res!424593) b!654617))

(assert (= (and b!654617 res!424600) b!654604))

(assert (= (and b!654604 res!424595) b!654597))

(assert (= (and b!654597 res!424610) b!654610))

(assert (= (and b!654610 res!424606) b!654608))

(assert (= (and b!654608 res!424608) b!654600))

(assert (= (and b!654600 res!424597) b!654602))

(assert (= (and b!654600 c!75370) b!654612))

(assert (= (and b!654600 (not c!75370)) b!654609))

(assert (= (and b!654600 (not res!424596)) b!654619))

(assert (= (and b!654619 res!424605) b!654607))

(assert (= (and b!654607 (not res!424601)) b!654611))

(assert (= (and b!654611 res!424602) b!654616))

(assert (= (and b!654619 (not res!424599)) b!654606))

(assert (= (and b!654606 c!75369) b!654599))

(assert (= (and b!654606 (not c!75369)) b!654601))

(assert (= (and b!654606 c!75371) b!654615))

(assert (= (and b!654606 (not c!75371)) b!654620))

(assert (= (and b!654615 res!424598) b!654613))

(declare-fun m!627697 () Bool)

(assert (=> b!654611 m!627697))

(assert (=> b!654611 m!627697))

(declare-fun m!627699 () Bool)

(assert (=> b!654611 m!627699))

(declare-fun m!627701 () Bool)

(assert (=> b!654614 m!627701))

(declare-fun m!627703 () Bool)

(assert (=> b!654610 m!627703))

(declare-fun m!627705 () Bool)

(assert (=> b!654610 m!627705))

(assert (=> b!654599 m!627697))

(declare-fun m!627707 () Bool)

(assert (=> b!654599 m!627707))

(assert (=> b!654599 m!627697))

(declare-fun m!627709 () Bool)

(assert (=> b!654599 m!627709))

(declare-fun m!627711 () Bool)

(assert (=> b!654599 m!627711))

(assert (=> b!654599 m!627697))

(declare-fun m!627713 () Bool)

(assert (=> b!654599 m!627713))

(assert (=> b!654599 m!627697))

(declare-fun m!627715 () Bool)

(assert (=> b!654599 m!627715))

(declare-fun m!627717 () Bool)

(assert (=> b!654599 m!627717))

(declare-fun m!627719 () Bool)

(assert (=> b!654599 m!627719))

(declare-fun m!627721 () Bool)

(assert (=> b!654608 m!627721))

(assert (=> b!654608 m!627697))

(assert (=> b!654608 m!627697))

(declare-fun m!627723 () Bool)

(assert (=> b!654608 m!627723))

(declare-fun m!627725 () Bool)

(assert (=> b!654598 m!627725))

(declare-fun m!627727 () Bool)

(assert (=> b!654617 m!627727))

(assert (=> b!654619 m!627697))

(assert (=> b!654619 m!627703))

(declare-fun m!627729 () Bool)

(assert (=> b!654619 m!627729))

(assert (=> b!654603 m!627697))

(assert (=> b!654603 m!627697))

(declare-fun m!627731 () Bool)

(assert (=> b!654603 m!627731))

(assert (=> b!654616 m!627697))

(assert (=> b!654616 m!627697))

(declare-fun m!627733 () Bool)

(assert (=> b!654616 m!627733))

(assert (=> b!654613 m!627697))

(assert (=> b!654613 m!627697))

(assert (=> b!654613 m!627733))

(assert (=> b!654607 m!627697))

(declare-fun m!627735 () Bool)

(assert (=> b!654618 m!627735))

(declare-fun m!627737 () Bool)

(assert (=> b!654600 m!627737))

(declare-fun m!627739 () Bool)

(assert (=> b!654600 m!627739))

(declare-fun m!627741 () Bool)

(assert (=> b!654600 m!627741))

(assert (=> b!654600 m!627703))

(declare-fun m!627743 () Bool)

(assert (=> b!654600 m!627743))

(assert (=> b!654600 m!627697))

(declare-fun m!627745 () Bool)

(assert (=> b!654600 m!627745))

(declare-fun m!627747 () Bool)

(assert (=> b!654600 m!627747))

(assert (=> b!654600 m!627697))

(declare-fun m!627749 () Bool)

(assert (=> b!654615 m!627749))

(assert (=> b!654615 m!627697))

(declare-fun m!627751 () Bool)

(assert (=> b!654615 m!627751))

(assert (=> b!654615 m!627707))

(assert (=> b!654615 m!627697))

(declare-fun m!627753 () Bool)

(assert (=> b!654615 m!627753))

(assert (=> b!654615 m!627697))

(declare-fun m!627755 () Bool)

(assert (=> b!654615 m!627755))

(assert (=> b!654615 m!627697))

(declare-fun m!627757 () Bool)

(assert (=> b!654615 m!627757))

(assert (=> b!654615 m!627697))

(assert (=> b!654615 m!627699))

(assert (=> b!654615 m!627719))

(declare-fun m!627759 () Bool)

(assert (=> b!654597 m!627759))

(declare-fun m!627761 () Bool)

(assert (=> start!59334 m!627761))

(declare-fun m!627763 () Bool)

(assert (=> start!59334 m!627763))

(declare-fun m!627765 () Bool)

(assert (=> b!654604 m!627765))

(push 1)

(assert (not b!654599))

(assert (not b!654615))

(assert (not b!654603))

(assert (not b!654613))

(assert (not b!654617))

(assert (not b!654616))

(assert (not b!654600))

(assert (not start!59334))

(assert (not b!654618))

(assert (not b!654604))

(assert (not b!654611))

(assert (not b!654608))

(assert (not b!654614))

(assert (not b!654598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

