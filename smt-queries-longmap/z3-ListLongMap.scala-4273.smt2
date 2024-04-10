; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59464 () Bool)

(assert start!59464)

(declare-fun b!656606 () Bool)

(declare-fun res!425867 () Bool)

(declare-fun e!377128 () Bool)

(assert (=> b!656606 (=> (not res!425867) (not e!377128))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38703 0))(
  ( (array!38704 (arr!18550 (Array (_ BitVec 32) (_ BitVec 64))) (size!18914 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38703)

(assert (=> b!656606 (= res!425867 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18550 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!656607 () Bool)

(declare-fun e!377136 () Bool)

(assert (=> b!656607 (= e!377128 e!377136)))

(declare-fun res!425862 () Bool)

(assert (=> b!656607 (=> (not res!425862) (not e!377136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!656607 (= res!425862 (= (select (store (arr!18550 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!306524 () array!38703)

(assert (=> b!656607 (= lt!306524 (array!38704 (store (arr!18550 a!2986) i!1108 k0!1786) (size!18914 a!2986)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!425870 () Bool)

(declare-fun b!656608 () Bool)

(declare-fun arrayContainsKey!0 (array!38703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656608 (= res!425870 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) j!136))))

(declare-fun e!377133 () Bool)

(assert (=> b!656608 (=> (not res!425870) (not e!377133))))

(declare-fun e!377130 () Bool)

(assert (=> b!656608 (= e!377130 e!377133)))

(declare-fun b!656609 () Bool)

(declare-fun res!425868 () Bool)

(assert (=> b!656609 (=> (not res!425868) (not e!377128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38703 (_ BitVec 32)) Bool)

(assert (=> b!656609 (= res!425868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656611 () Bool)

(declare-fun e!377135 () Bool)

(assert (=> b!656611 (= e!377135 false)))

(assert (=> b!656611 (= (select (store (arr!18550 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!656612 () Bool)

(declare-fun e!377140 () Bool)

(assert (=> b!656612 (= e!377140 (not e!377135))))

(declare-fun res!425865 () Bool)

(assert (=> b!656612 (=> res!425865 e!377135)))

(declare-datatypes ((SeekEntryResult!6990 0))(
  ( (MissingZero!6990 (index!30322 (_ BitVec 32))) (Found!6990 (index!30323 (_ BitVec 32))) (Intermediate!6990 (undefined!7802 Bool) (index!30324 (_ BitVec 32)) (x!59112 (_ BitVec 32))) (Undefined!6990) (MissingVacant!6990 (index!30325 (_ BitVec 32))) )
))
(declare-fun lt!306522 () SeekEntryResult!6990)

(assert (=> b!656612 (= res!425865 (not (= lt!306522 (MissingVacant!6990 vacantSpotIndex!68))))))

(declare-datatypes ((Unit!22654 0))(
  ( (Unit!22655) )
))
(declare-fun lt!306527 () Unit!22654)

(declare-fun e!377131 () Unit!22654)

(assert (=> b!656612 (= lt!306527 e!377131)))

(declare-fun c!75746 () Bool)

(assert (=> b!656612 (= c!75746 (= lt!306522 (Found!6990 index!984)))))

(declare-fun lt!306523 () Unit!22654)

(declare-fun e!377138 () Unit!22654)

(assert (=> b!656612 (= lt!306523 e!377138)))

(declare-fun c!75743 () Bool)

(assert (=> b!656612 (= c!75743 (= lt!306522 Undefined!6990))))

(declare-fun lt!306530 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38703 (_ BitVec 32)) SeekEntryResult!6990)

(assert (=> b!656612 (= lt!306522 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306530 lt!306524 mask!3053))))

(declare-fun e!377137 () Bool)

(assert (=> b!656612 e!377137))

(declare-fun res!425854 () Bool)

(assert (=> b!656612 (=> (not res!425854) (not e!377137))))

(declare-fun lt!306519 () (_ BitVec 32))

(declare-fun lt!306531 () SeekEntryResult!6990)

(assert (=> b!656612 (= res!425854 (= lt!306531 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 lt!306530 lt!306524 mask!3053)))))

(assert (=> b!656612 (= lt!306531 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656612 (= lt!306530 (select (store (arr!18550 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306526 () Unit!22654)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38703 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22654)

(assert (=> b!656612 (= lt!306526 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656612 (= lt!306519 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!656613 () Bool)

(assert (=> b!656613 (= e!377133 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) index!984))))

(declare-fun b!656614 () Bool)

(declare-fun Unit!22656 () Unit!22654)

(assert (=> b!656614 (= e!377138 Unit!22656)))

(declare-fun b!656615 () Bool)

(declare-fun Unit!22657 () Unit!22654)

(assert (=> b!656615 (= e!377131 Unit!22657)))

(declare-fun b!656616 () Bool)

(declare-fun res!425860 () Bool)

(declare-fun e!377129 () Bool)

(assert (=> b!656616 (=> (not res!425860) (not e!377129))))

(assert (=> b!656616 (= res!425860 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656617 () Bool)

(assert (=> b!656617 (= e!377129 e!377128)))

(declare-fun res!425855 () Bool)

(assert (=> b!656617 (=> (not res!425855) (not e!377128))))

(declare-fun lt!306533 () SeekEntryResult!6990)

(assert (=> b!656617 (= res!425855 (or (= lt!306533 (MissingZero!6990 i!1108)) (= lt!306533 (MissingVacant!6990 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38703 (_ BitVec 32)) SeekEntryResult!6990)

(assert (=> b!656617 (= lt!306533 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!656618 () Bool)

(declare-fun Unit!22658 () Unit!22654)

(assert (=> b!656618 (= e!377138 Unit!22658)))

(assert (=> b!656618 false))

(declare-fun b!656619 () Bool)

(declare-fun res!425869 () Bool)

(assert (=> b!656619 (=> (not res!425869) (not e!377129))))

(assert (=> b!656619 (= res!425869 (and (= (size!18914 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18914 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18914 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656610 () Bool)

(declare-fun res!425856 () Bool)

(assert (=> b!656610 (= res!425856 (bvsge j!136 index!984))))

(assert (=> b!656610 (=> res!425856 e!377130)))

(declare-fun e!377142 () Bool)

(assert (=> b!656610 (= e!377142 e!377130)))

(declare-fun res!425861 () Bool)

(assert (=> start!59464 (=> (not res!425861) (not e!377129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59464 (= res!425861 (validMask!0 mask!3053))))

(assert (=> start!59464 e!377129))

(assert (=> start!59464 true))

(declare-fun array_inv!14346 (array!38703) Bool)

(assert (=> start!59464 (array_inv!14346 a!2986)))

(declare-fun b!656620 () Bool)

(declare-fun Unit!22659 () Unit!22654)

(assert (=> b!656620 (= e!377131 Unit!22659)))

(declare-fun res!425866 () Bool)

(assert (=> b!656620 (= res!425866 (= (select (store (arr!18550 a!2986) i!1108 k0!1786) index!984) (select (arr!18550 a!2986) j!136)))))

(assert (=> b!656620 (=> (not res!425866) (not e!377142))))

(assert (=> b!656620 e!377142))

(declare-fun c!75745 () Bool)

(assert (=> b!656620 (= c!75745 (bvslt j!136 index!984))))

(declare-fun lt!306517 () Unit!22654)

(declare-fun e!377141 () Unit!22654)

(assert (=> b!656620 (= lt!306517 e!377141)))

(declare-fun c!75744 () Bool)

(assert (=> b!656620 (= c!75744 (bvslt index!984 j!136))))

(declare-fun lt!306521 () Unit!22654)

(declare-fun e!377134 () Unit!22654)

(assert (=> b!656620 (= lt!306521 e!377134)))

(assert (=> b!656620 false))

(declare-fun b!656621 () Bool)

(assert (=> b!656621 false))

(declare-fun lt!306516 () Unit!22654)

(declare-datatypes ((List!12591 0))(
  ( (Nil!12588) (Cons!12587 (h!13632 (_ BitVec 64)) (t!18819 List!12591)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38703 (_ BitVec 64) (_ BitVec 32) List!12591) Unit!22654)

(assert (=> b!656621 (= lt!306516 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306524 (select (arr!18550 a!2986) j!136) index!984 Nil!12588))))

(declare-fun arrayNoDuplicates!0 (array!38703 (_ BitVec 32) List!12591) Bool)

(assert (=> b!656621 (arrayNoDuplicates!0 lt!306524 index!984 Nil!12588)))

(declare-fun lt!306528 () Unit!22654)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38703 (_ BitVec 32) (_ BitVec 32)) Unit!22654)

(assert (=> b!656621 (= lt!306528 (lemmaNoDuplicateFromThenFromBigger!0 lt!306524 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656621 (arrayNoDuplicates!0 lt!306524 #b00000000000000000000000000000000 Nil!12588)))

(declare-fun lt!306534 () Unit!22654)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38703 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12591) Unit!22654)

(assert (=> b!656621 (= lt!306534 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12588))))

(assert (=> b!656621 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306525 () Unit!22654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38703 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22654)

(assert (=> b!656621 (= lt!306525 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306524 (select (arr!18550 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377139 () Bool)

(assert (=> b!656621 e!377139))

(declare-fun res!425863 () Bool)

(assert (=> b!656621 (=> (not res!425863) (not e!377139))))

(assert (=> b!656621 (= res!425863 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) j!136))))

(declare-fun Unit!22660 () Unit!22654)

(assert (=> b!656621 (= e!377134 Unit!22660)))

(declare-fun b!656622 () Bool)

(assert (=> b!656622 (= e!377139 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) index!984))))

(declare-fun b!656623 () Bool)

(declare-fun res!425857 () Bool)

(assert (=> b!656623 (=> (not res!425857) (not e!377129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656623 (= res!425857 (validKeyInArray!0 (select (arr!18550 a!2986) j!136)))))

(declare-fun b!656624 () Bool)

(assert (=> b!656624 false))

(declare-fun lt!306520 () Unit!22654)

(assert (=> b!656624 (= lt!306520 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306524 (select (arr!18550 a!2986) j!136) j!136 Nil!12588))))

(assert (=> b!656624 (arrayNoDuplicates!0 lt!306524 j!136 Nil!12588)))

(declare-fun lt!306535 () Unit!22654)

(assert (=> b!656624 (= lt!306535 (lemmaNoDuplicateFromThenFromBigger!0 lt!306524 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656624 (arrayNoDuplicates!0 lt!306524 #b00000000000000000000000000000000 Nil!12588)))

(declare-fun lt!306532 () Unit!22654)

(assert (=> b!656624 (= lt!306532 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12588))))

(assert (=> b!656624 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306529 () Unit!22654)

(assert (=> b!656624 (= lt!306529 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306524 (select (arr!18550 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22661 () Unit!22654)

(assert (=> b!656624 (= e!377141 Unit!22661)))

(declare-fun b!656625 () Bool)

(declare-fun lt!306518 () SeekEntryResult!6990)

(assert (=> b!656625 (= e!377137 (= lt!306518 lt!306531))))

(declare-fun b!656626 () Bool)

(assert (=> b!656626 (= e!377136 e!377140)))

(declare-fun res!425859 () Bool)

(assert (=> b!656626 (=> (not res!425859) (not e!377140))))

(assert (=> b!656626 (= res!425859 (and (= lt!306518 (Found!6990 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18550 a!2986) index!984) (select (arr!18550 a!2986) j!136))) (not (= (select (arr!18550 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!656626 (= lt!306518 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656627 () Bool)

(declare-fun res!425864 () Bool)

(assert (=> b!656627 (=> (not res!425864) (not e!377129))))

(assert (=> b!656627 (= res!425864 (validKeyInArray!0 k0!1786))))

(declare-fun b!656628 () Bool)

(declare-fun res!425858 () Bool)

(assert (=> b!656628 (=> (not res!425858) (not e!377128))))

(assert (=> b!656628 (= res!425858 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12588))))

(declare-fun b!656629 () Bool)

(declare-fun Unit!22662 () Unit!22654)

(assert (=> b!656629 (= e!377141 Unit!22662)))

(declare-fun b!656630 () Bool)

(declare-fun Unit!22663 () Unit!22654)

(assert (=> b!656630 (= e!377134 Unit!22663)))

(assert (= (and start!59464 res!425861) b!656619))

(assert (= (and b!656619 res!425869) b!656623))

(assert (= (and b!656623 res!425857) b!656627))

(assert (= (and b!656627 res!425864) b!656616))

(assert (= (and b!656616 res!425860) b!656617))

(assert (= (and b!656617 res!425855) b!656609))

(assert (= (and b!656609 res!425868) b!656628))

(assert (= (and b!656628 res!425858) b!656606))

(assert (= (and b!656606 res!425867) b!656607))

(assert (= (and b!656607 res!425862) b!656626))

(assert (= (and b!656626 res!425859) b!656612))

(assert (= (and b!656612 res!425854) b!656625))

(assert (= (and b!656612 c!75743) b!656618))

(assert (= (and b!656612 (not c!75743)) b!656614))

(assert (= (and b!656612 c!75746) b!656620))

(assert (= (and b!656612 (not c!75746)) b!656615))

(assert (= (and b!656620 res!425866) b!656610))

(assert (= (and b!656610 (not res!425856)) b!656608))

(assert (= (and b!656608 res!425870) b!656613))

(assert (= (and b!656620 c!75745) b!656624))

(assert (= (and b!656620 (not c!75745)) b!656629))

(assert (= (and b!656620 c!75744) b!656621))

(assert (= (and b!656620 (not c!75744)) b!656630))

(assert (= (and b!656621 res!425863) b!656622))

(assert (= (and b!656612 (not res!425865)) b!656611))

(declare-fun m!629667 () Bool)

(assert (=> start!59464 m!629667))

(declare-fun m!629669 () Bool)

(assert (=> start!59464 m!629669))

(declare-fun m!629671 () Bool)

(assert (=> b!656622 m!629671))

(assert (=> b!656622 m!629671))

(declare-fun m!629673 () Bool)

(assert (=> b!656622 m!629673))

(declare-fun m!629675 () Bool)

(assert (=> b!656611 m!629675))

(declare-fun m!629677 () Bool)

(assert (=> b!656611 m!629677))

(declare-fun m!629679 () Bool)

(assert (=> b!656609 m!629679))

(assert (=> b!656607 m!629675))

(declare-fun m!629681 () Bool)

(assert (=> b!656607 m!629681))

(assert (=> b!656608 m!629671))

(assert (=> b!656608 m!629671))

(declare-fun m!629683 () Bool)

(assert (=> b!656608 m!629683))

(assert (=> b!656621 m!629671))

(declare-fun m!629685 () Bool)

(assert (=> b!656621 m!629685))

(declare-fun m!629687 () Bool)

(assert (=> b!656621 m!629687))

(assert (=> b!656621 m!629671))

(declare-fun m!629689 () Bool)

(assert (=> b!656621 m!629689))

(assert (=> b!656621 m!629671))

(declare-fun m!629691 () Bool)

(assert (=> b!656621 m!629691))

(assert (=> b!656621 m!629671))

(assert (=> b!656621 m!629683))

(declare-fun m!629693 () Bool)

(assert (=> b!656621 m!629693))

(assert (=> b!656621 m!629671))

(declare-fun m!629695 () Bool)

(assert (=> b!656621 m!629695))

(declare-fun m!629697 () Bool)

(assert (=> b!656621 m!629697))

(declare-fun m!629699 () Bool)

(assert (=> b!656606 m!629699))

(assert (=> b!656612 m!629671))

(declare-fun m!629701 () Bool)

(assert (=> b!656612 m!629701))

(declare-fun m!629703 () Bool)

(assert (=> b!656612 m!629703))

(declare-fun m!629705 () Bool)

(assert (=> b!656612 m!629705))

(assert (=> b!656612 m!629671))

(declare-fun m!629707 () Bool)

(assert (=> b!656612 m!629707))

(assert (=> b!656612 m!629675))

(declare-fun m!629709 () Bool)

(assert (=> b!656612 m!629709))

(declare-fun m!629711 () Bool)

(assert (=> b!656612 m!629711))

(declare-fun m!629713 () Bool)

(assert (=> b!656626 m!629713))

(assert (=> b!656626 m!629671))

(assert (=> b!656626 m!629671))

(declare-fun m!629715 () Bool)

(assert (=> b!656626 m!629715))

(assert (=> b!656620 m!629675))

(assert (=> b!656620 m!629677))

(assert (=> b!656620 m!629671))

(declare-fun m!629717 () Bool)

(assert (=> b!656628 m!629717))

(declare-fun m!629719 () Bool)

(assert (=> b!656616 m!629719))

(assert (=> b!656623 m!629671))

(assert (=> b!656623 m!629671))

(declare-fun m!629721 () Bool)

(assert (=> b!656623 m!629721))

(declare-fun m!629723 () Bool)

(assert (=> b!656627 m!629723))

(declare-fun m!629725 () Bool)

(assert (=> b!656617 m!629725))

(assert (=> b!656624 m!629671))

(declare-fun m!629727 () Bool)

(assert (=> b!656624 m!629727))

(assert (=> b!656624 m!629671))

(declare-fun m!629729 () Bool)

(assert (=> b!656624 m!629729))

(assert (=> b!656624 m!629671))

(declare-fun m!629731 () Bool)

(assert (=> b!656624 m!629731))

(assert (=> b!656624 m!629671))

(declare-fun m!629733 () Bool)

(assert (=> b!656624 m!629733))

(assert (=> b!656624 m!629697))

(declare-fun m!629735 () Bool)

(assert (=> b!656624 m!629735))

(assert (=> b!656624 m!629687))

(assert (=> b!656613 m!629671))

(assert (=> b!656613 m!629671))

(assert (=> b!656613 m!629673))

(check-sat (not b!656626) (not b!656621) (not b!656616) (not b!656613) (not b!656609) (not b!656623) (not b!656627) (not b!656628) (not b!656622) (not b!656617) (not b!656612) (not b!656608) (not start!59464) (not b!656624))
(check-sat)
(get-model)

(declare-fun d!92763 () Bool)

(declare-fun res!425926 () Bool)

(declare-fun e!377192 () Bool)

(assert (=> d!92763 (=> res!425926 e!377192)))

(assert (=> d!92763 (= res!425926 (= (select (arr!18550 lt!306524) j!136) (select (arr!18550 a!2986) j!136)))))

(assert (=> d!92763 (= (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) j!136) e!377192)))

(declare-fun b!656710 () Bool)

(declare-fun e!377193 () Bool)

(assert (=> b!656710 (= e!377192 e!377193)))

(declare-fun res!425927 () Bool)

(assert (=> b!656710 (=> (not res!425927) (not e!377193))))

(assert (=> b!656710 (= res!425927 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18914 lt!306524)))))

(declare-fun b!656711 () Bool)

(assert (=> b!656711 (= e!377193 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92763 (not res!425926)) b!656710))

(assert (= (and b!656710 res!425927) b!656711))

(declare-fun m!629807 () Bool)

(assert (=> d!92763 m!629807))

(assert (=> b!656711 m!629671))

(declare-fun m!629809 () Bool)

(assert (=> b!656711 m!629809))

(assert (=> b!656608 d!92763))

(declare-fun b!656720 () Bool)

(declare-fun e!377201 () Bool)

(declare-fun e!377200 () Bool)

(assert (=> b!656720 (= e!377201 e!377200)))

(declare-fun c!75761 () Bool)

(assert (=> b!656720 (= c!75761 (validKeyInArray!0 (select (arr!18550 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656721 () Bool)

(declare-fun e!377202 () Bool)

(assert (=> b!656721 (= e!377200 e!377202)))

(declare-fun lt!306603 () (_ BitVec 64))

(assert (=> b!656721 (= lt!306603 (select (arr!18550 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306602 () Unit!22654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38703 (_ BitVec 64) (_ BitVec 32)) Unit!22654)

(assert (=> b!656721 (= lt!306602 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306603 #b00000000000000000000000000000000))))

(assert (=> b!656721 (arrayContainsKey!0 a!2986 lt!306603 #b00000000000000000000000000000000)))

(declare-fun lt!306604 () Unit!22654)

(assert (=> b!656721 (= lt!306604 lt!306602)))

(declare-fun res!425932 () Bool)

(assert (=> b!656721 (= res!425932 (= (seekEntryOrOpen!0 (select (arr!18550 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6990 #b00000000000000000000000000000000)))))

(assert (=> b!656721 (=> (not res!425932) (not e!377202))))

(declare-fun b!656722 () Bool)

(declare-fun call!33863 () Bool)

(assert (=> b!656722 (= e!377202 call!33863)))

(declare-fun d!92765 () Bool)

(declare-fun res!425933 () Bool)

(assert (=> d!92765 (=> res!425933 e!377201)))

(assert (=> d!92765 (= res!425933 (bvsge #b00000000000000000000000000000000 (size!18914 a!2986)))))

(assert (=> d!92765 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!377201)))

(declare-fun b!656723 () Bool)

(assert (=> b!656723 (= e!377200 call!33863)))

(declare-fun bm!33860 () Bool)

(assert (=> bm!33860 (= call!33863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!92765 (not res!425933)) b!656720))

(assert (= (and b!656720 c!75761) b!656721))

(assert (= (and b!656720 (not c!75761)) b!656723))

(assert (= (and b!656721 res!425932) b!656722))

(assert (= (or b!656722 b!656723) bm!33860))

(declare-fun m!629811 () Bool)

(assert (=> b!656720 m!629811))

(assert (=> b!656720 m!629811))

(declare-fun m!629813 () Bool)

(assert (=> b!656720 m!629813))

(assert (=> b!656721 m!629811))

(declare-fun m!629815 () Bool)

(assert (=> b!656721 m!629815))

(declare-fun m!629817 () Bool)

(assert (=> b!656721 m!629817))

(assert (=> b!656721 m!629811))

(declare-fun m!629819 () Bool)

(assert (=> b!656721 m!629819))

(declare-fun m!629821 () Bool)

(assert (=> bm!33860 m!629821))

(assert (=> b!656609 d!92765))

(declare-fun d!92767 () Bool)

(declare-fun res!425934 () Bool)

(declare-fun e!377203 () Bool)

(assert (=> d!92767 (=> res!425934 e!377203)))

(assert (=> d!92767 (= res!425934 (= (select (arr!18550 lt!306524) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18550 a!2986) j!136)))))

(assert (=> d!92767 (= (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!377203)))

(declare-fun b!656724 () Bool)

(declare-fun e!377204 () Bool)

(assert (=> b!656724 (= e!377203 e!377204)))

(declare-fun res!425935 () Bool)

(assert (=> b!656724 (=> (not res!425935) (not e!377204))))

(assert (=> b!656724 (= res!425935 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18914 lt!306524)))))

(declare-fun b!656725 () Bool)

(assert (=> b!656725 (= e!377204 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92767 (not res!425934)) b!656724))

(assert (= (and b!656724 res!425935) b!656725))

(declare-fun m!629823 () Bool)

(assert (=> d!92767 m!629823))

(assert (=> b!656725 m!629671))

(declare-fun m!629825 () Bool)

(assert (=> b!656725 m!629825))

(assert (=> b!656621 d!92767))

(declare-fun d!92769 () Bool)

(assert (=> d!92769 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18914 lt!306524)) (not (= (select (arr!18550 lt!306524) index!984) (select (arr!18550 a!2986) j!136))))))

(declare-fun lt!306607 () Unit!22654)

(declare-fun choose!21 (array!38703 (_ BitVec 64) (_ BitVec 32) List!12591) Unit!22654)

(assert (=> d!92769 (= lt!306607 (choose!21 lt!306524 (select (arr!18550 a!2986) j!136) index!984 Nil!12588))))

(assert (=> d!92769 (bvslt (size!18914 lt!306524) #b01111111111111111111111111111111)))

(assert (=> d!92769 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306524 (select (arr!18550 a!2986) j!136) index!984 Nil!12588) lt!306607)))

(declare-fun bs!19549 () Bool)

(assert (= bs!19549 d!92769))

(declare-fun m!629827 () Bool)

(assert (=> bs!19549 m!629827))

(assert (=> bs!19549 m!629671))

(declare-fun m!629829 () Bool)

(assert (=> bs!19549 m!629829))

(assert (=> b!656621 d!92769))

(declare-fun d!92771 () Bool)

(assert (=> d!92771 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306610 () Unit!22654)

(declare-fun choose!114 (array!38703 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22654)

(assert (=> d!92771 (= lt!306610 (choose!114 lt!306524 (select (arr!18550 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92771 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92771 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306524 (select (arr!18550 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306610)))

(declare-fun bs!19550 () Bool)

(assert (= bs!19550 d!92771))

(assert (=> bs!19550 m!629671))

(assert (=> bs!19550 m!629691))

(assert (=> bs!19550 m!629671))

(declare-fun m!629831 () Bool)

(assert (=> bs!19550 m!629831))

(assert (=> b!656621 d!92771))

(declare-fun d!92773 () Bool)

(declare-fun e!377207 () Bool)

(assert (=> d!92773 e!377207))

(declare-fun res!425938 () Bool)

(assert (=> d!92773 (=> (not res!425938) (not e!377207))))

(assert (=> d!92773 (= res!425938 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18914 a!2986))))))

(declare-fun lt!306613 () Unit!22654)

(declare-fun choose!41 (array!38703 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12591) Unit!22654)

(assert (=> d!92773 (= lt!306613 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12588))))

(assert (=> d!92773 (bvslt (size!18914 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92773 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12588) lt!306613)))

(declare-fun b!656728 () Bool)

(assert (=> b!656728 (= e!377207 (arrayNoDuplicates!0 (array!38704 (store (arr!18550 a!2986) i!1108 k0!1786) (size!18914 a!2986)) #b00000000000000000000000000000000 Nil!12588))))

(assert (= (and d!92773 res!425938) b!656728))

(declare-fun m!629833 () Bool)

(assert (=> d!92773 m!629833))

(assert (=> b!656728 m!629675))

(declare-fun m!629835 () Bool)

(assert (=> b!656728 m!629835))

(assert (=> b!656621 d!92773))

(declare-fun b!656739 () Bool)

(declare-fun e!377218 () Bool)

(declare-fun e!377216 () Bool)

(assert (=> b!656739 (= e!377218 e!377216)))

(declare-fun c!75764 () Bool)

(assert (=> b!656739 (= c!75764 (validKeyInArray!0 (select (arr!18550 lt!306524) index!984)))))

(declare-fun b!656740 () Bool)

(declare-fun e!377217 () Bool)

(assert (=> b!656740 (= e!377217 e!377218)))

(declare-fun res!425946 () Bool)

(assert (=> b!656740 (=> (not res!425946) (not e!377218))))

(declare-fun e!377219 () Bool)

(assert (=> b!656740 (= res!425946 (not e!377219))))

(declare-fun res!425945 () Bool)

(assert (=> b!656740 (=> (not res!425945) (not e!377219))))

(assert (=> b!656740 (= res!425945 (validKeyInArray!0 (select (arr!18550 lt!306524) index!984)))))

(declare-fun b!656741 () Bool)

(declare-fun call!33866 () Bool)

(assert (=> b!656741 (= e!377216 call!33866)))

(declare-fun bm!33863 () Bool)

(assert (=> bm!33863 (= call!33866 (arrayNoDuplicates!0 lt!306524 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75764 (Cons!12587 (select (arr!18550 lt!306524) index!984) Nil!12588) Nil!12588)))))

(declare-fun b!656742 () Bool)

(assert (=> b!656742 (= e!377216 call!33866)))

(declare-fun d!92775 () Bool)

(declare-fun res!425947 () Bool)

(assert (=> d!92775 (=> res!425947 e!377217)))

(assert (=> d!92775 (= res!425947 (bvsge index!984 (size!18914 lt!306524)))))

(assert (=> d!92775 (= (arrayNoDuplicates!0 lt!306524 index!984 Nil!12588) e!377217)))

(declare-fun b!656743 () Bool)

(declare-fun contains!3194 (List!12591 (_ BitVec 64)) Bool)

(assert (=> b!656743 (= e!377219 (contains!3194 Nil!12588 (select (arr!18550 lt!306524) index!984)))))

(assert (= (and d!92775 (not res!425947)) b!656740))

(assert (= (and b!656740 res!425945) b!656743))

(assert (= (and b!656740 res!425946) b!656739))

(assert (= (and b!656739 c!75764) b!656742))

(assert (= (and b!656739 (not c!75764)) b!656741))

(assert (= (or b!656742 b!656741) bm!33863))

(assert (=> b!656739 m!629827))

(assert (=> b!656739 m!629827))

(declare-fun m!629837 () Bool)

(assert (=> b!656739 m!629837))

(assert (=> b!656740 m!629827))

(assert (=> b!656740 m!629827))

(assert (=> b!656740 m!629837))

(assert (=> bm!33863 m!629827))

(declare-fun m!629839 () Bool)

(assert (=> bm!33863 m!629839))

(assert (=> b!656743 m!629827))

(assert (=> b!656743 m!629827))

(declare-fun m!629841 () Bool)

(assert (=> b!656743 m!629841))

(assert (=> b!656621 d!92775))

(declare-fun d!92779 () Bool)

(assert (=> d!92779 (arrayNoDuplicates!0 lt!306524 index!984 Nil!12588)))

(declare-fun lt!306620 () Unit!22654)

(declare-fun choose!39 (array!38703 (_ BitVec 32) (_ BitVec 32)) Unit!22654)

(assert (=> d!92779 (= lt!306620 (choose!39 lt!306524 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92779 (bvslt (size!18914 lt!306524) #b01111111111111111111111111111111)))

(assert (=> d!92779 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306524 #b00000000000000000000000000000000 index!984) lt!306620)))

(declare-fun bs!19551 () Bool)

(assert (= bs!19551 d!92779))

(assert (=> bs!19551 m!629693))

(declare-fun m!629843 () Bool)

(assert (=> bs!19551 m!629843))

(assert (=> b!656621 d!92779))

(declare-fun b!656756 () Bool)

(declare-fun e!377228 () Bool)

(declare-fun e!377226 () Bool)

(assert (=> b!656756 (= e!377228 e!377226)))

(declare-fun c!75771 () Bool)

(assert (=> b!656756 (= c!75771 (validKeyInArray!0 (select (arr!18550 lt!306524) #b00000000000000000000000000000000)))))

(declare-fun b!656757 () Bool)

(declare-fun e!377227 () Bool)

(assert (=> b!656757 (= e!377227 e!377228)))

(declare-fun res!425949 () Bool)

(assert (=> b!656757 (=> (not res!425949) (not e!377228))))

(declare-fun e!377229 () Bool)

(assert (=> b!656757 (= res!425949 (not e!377229))))

(declare-fun res!425948 () Bool)

(assert (=> b!656757 (=> (not res!425948) (not e!377229))))

(assert (=> b!656757 (= res!425948 (validKeyInArray!0 (select (arr!18550 lt!306524) #b00000000000000000000000000000000)))))

(declare-fun b!656758 () Bool)

(declare-fun call!33867 () Bool)

(assert (=> b!656758 (= e!377226 call!33867)))

(declare-fun bm!33864 () Bool)

(assert (=> bm!33864 (= call!33867 (arrayNoDuplicates!0 lt!306524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75771 (Cons!12587 (select (arr!18550 lt!306524) #b00000000000000000000000000000000) Nil!12588) Nil!12588)))))

(declare-fun b!656759 () Bool)

(assert (=> b!656759 (= e!377226 call!33867)))

(declare-fun d!92781 () Bool)

(declare-fun res!425950 () Bool)

(assert (=> d!92781 (=> res!425950 e!377227)))

(assert (=> d!92781 (= res!425950 (bvsge #b00000000000000000000000000000000 (size!18914 lt!306524)))))

(assert (=> d!92781 (= (arrayNoDuplicates!0 lt!306524 #b00000000000000000000000000000000 Nil!12588) e!377227)))

(declare-fun b!656760 () Bool)

(assert (=> b!656760 (= e!377229 (contains!3194 Nil!12588 (select (arr!18550 lt!306524) #b00000000000000000000000000000000)))))

(assert (= (and d!92781 (not res!425950)) b!656757))

(assert (= (and b!656757 res!425948) b!656760))

(assert (= (and b!656757 res!425949) b!656756))

(assert (= (and b!656756 c!75771) b!656759))

(assert (= (and b!656756 (not c!75771)) b!656758))

(assert (= (or b!656759 b!656758) bm!33864))

(declare-fun m!629845 () Bool)

(assert (=> b!656756 m!629845))

(assert (=> b!656756 m!629845))

(declare-fun m!629847 () Bool)

(assert (=> b!656756 m!629847))

(assert (=> b!656757 m!629845))

(assert (=> b!656757 m!629845))

(assert (=> b!656757 m!629847))

(assert (=> bm!33864 m!629845))

(declare-fun m!629849 () Bool)

(assert (=> bm!33864 m!629849))

(assert (=> b!656760 m!629845))

(assert (=> b!656760 m!629845))

(declare-fun m!629851 () Bool)

(assert (=> b!656760 m!629851))

(assert (=> b!656621 d!92781))

(assert (=> b!656621 d!92763))

(declare-fun d!92783 () Bool)

(assert (=> d!92783 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656627 d!92783))

(declare-fun d!92787 () Bool)

(declare-fun res!425951 () Bool)

(declare-fun e!377233 () Bool)

(assert (=> d!92787 (=> res!425951 e!377233)))

(assert (=> d!92787 (= res!425951 (= (select (arr!18550 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92787 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!377233)))

(declare-fun b!656767 () Bool)

(declare-fun e!377234 () Bool)

(assert (=> b!656767 (= e!377233 e!377234)))

(declare-fun res!425952 () Bool)

(assert (=> b!656767 (=> (not res!425952) (not e!377234))))

(assert (=> b!656767 (= res!425952 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18914 a!2986)))))

(declare-fun b!656768 () Bool)

(assert (=> b!656768 (= e!377234 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92787 (not res!425951)) b!656767))

(assert (= (and b!656767 res!425952) b!656768))

(assert (=> d!92787 m!629811))

(declare-fun m!629859 () Bool)

(assert (=> b!656768 m!629859))

(assert (=> b!656616 d!92787))

(declare-fun b!656810 () Bool)

(declare-fun c!75792 () Bool)

(declare-fun lt!306644 () (_ BitVec 64))

(assert (=> b!656810 (= c!75792 (= lt!306644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377263 () SeekEntryResult!6990)

(declare-fun e!377261 () SeekEntryResult!6990)

(assert (=> b!656810 (= e!377263 e!377261)))

(declare-fun lt!306643 () SeekEntryResult!6990)

(declare-fun b!656811 () Bool)

(assert (=> b!656811 (= e!377261 (seekKeyOrZeroReturnVacant!0 (x!59112 lt!306643) (index!30324 lt!306643) (index!30324 lt!306643) k0!1786 a!2986 mask!3053))))

(declare-fun b!656812 () Bool)

(assert (=> b!656812 (= e!377263 (Found!6990 (index!30324 lt!306643)))))

(declare-fun b!656813 () Bool)

(declare-fun e!377262 () SeekEntryResult!6990)

(assert (=> b!656813 (= e!377262 e!377263)))

(assert (=> b!656813 (= lt!306644 (select (arr!18550 a!2986) (index!30324 lt!306643)))))

(declare-fun c!75791 () Bool)

(assert (=> b!656813 (= c!75791 (= lt!306644 k0!1786))))

(declare-fun d!92789 () Bool)

(declare-fun lt!306645 () SeekEntryResult!6990)

(get-info :version)

(assert (=> d!92789 (and (or ((_ is Undefined!6990) lt!306645) (not ((_ is Found!6990) lt!306645)) (and (bvsge (index!30323 lt!306645) #b00000000000000000000000000000000) (bvslt (index!30323 lt!306645) (size!18914 a!2986)))) (or ((_ is Undefined!6990) lt!306645) ((_ is Found!6990) lt!306645) (not ((_ is MissingZero!6990) lt!306645)) (and (bvsge (index!30322 lt!306645) #b00000000000000000000000000000000) (bvslt (index!30322 lt!306645) (size!18914 a!2986)))) (or ((_ is Undefined!6990) lt!306645) ((_ is Found!6990) lt!306645) ((_ is MissingZero!6990) lt!306645) (not ((_ is MissingVacant!6990) lt!306645)) (and (bvsge (index!30325 lt!306645) #b00000000000000000000000000000000) (bvslt (index!30325 lt!306645) (size!18914 a!2986)))) (or ((_ is Undefined!6990) lt!306645) (ite ((_ is Found!6990) lt!306645) (= (select (arr!18550 a!2986) (index!30323 lt!306645)) k0!1786) (ite ((_ is MissingZero!6990) lt!306645) (= (select (arr!18550 a!2986) (index!30322 lt!306645)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6990) lt!306645) (= (select (arr!18550 a!2986) (index!30325 lt!306645)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92789 (= lt!306645 e!377262)))

(declare-fun c!75790 () Bool)

(assert (=> d!92789 (= c!75790 (and ((_ is Intermediate!6990) lt!306643) (undefined!7802 lt!306643)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38703 (_ BitVec 32)) SeekEntryResult!6990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92789 (= lt!306643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92789 (validMask!0 mask!3053)))

(assert (=> d!92789 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!306645)))

(declare-fun b!656814 () Bool)

(assert (=> b!656814 (= e!377262 Undefined!6990)))

(declare-fun b!656815 () Bool)

(assert (=> b!656815 (= e!377261 (MissingZero!6990 (index!30324 lt!306643)))))

(assert (= (and d!92789 c!75790) b!656814))

(assert (= (and d!92789 (not c!75790)) b!656813))

(assert (= (and b!656813 c!75791) b!656812))

(assert (= (and b!656813 (not c!75791)) b!656810))

(assert (= (and b!656810 c!75792) b!656815))

(assert (= (and b!656810 (not c!75792)) b!656811))

(declare-fun m!629901 () Bool)

(assert (=> b!656811 m!629901))

(declare-fun m!629903 () Bool)

(assert (=> b!656813 m!629903))

(declare-fun m!629907 () Bool)

(assert (=> d!92789 m!629907))

(declare-fun m!629909 () Bool)

(assert (=> d!92789 m!629909))

(assert (=> d!92789 m!629907))

(declare-fun m!629913 () Bool)

(assert (=> d!92789 m!629913))

(assert (=> d!92789 m!629667))

(declare-fun m!629915 () Bool)

(assert (=> d!92789 m!629915))

(declare-fun m!629917 () Bool)

(assert (=> d!92789 m!629917))

(assert (=> b!656617 d!92789))

(declare-fun b!656818 () Bool)

(declare-fun e!377268 () Bool)

(declare-fun e!377266 () Bool)

(assert (=> b!656818 (= e!377268 e!377266)))

(declare-fun c!75793 () Bool)

(assert (=> b!656818 (= c!75793 (validKeyInArray!0 (select (arr!18550 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656819 () Bool)

(declare-fun e!377267 () Bool)

(assert (=> b!656819 (= e!377267 e!377268)))

(declare-fun res!425967 () Bool)

(assert (=> b!656819 (=> (not res!425967) (not e!377268))))

(declare-fun e!377269 () Bool)

(assert (=> b!656819 (= res!425967 (not e!377269))))

(declare-fun res!425966 () Bool)

(assert (=> b!656819 (=> (not res!425966) (not e!377269))))

(assert (=> b!656819 (= res!425966 (validKeyInArray!0 (select (arr!18550 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656820 () Bool)

(declare-fun call!33868 () Bool)

(assert (=> b!656820 (= e!377266 call!33868)))

(declare-fun bm!33865 () Bool)

(assert (=> bm!33865 (= call!33868 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75793 (Cons!12587 (select (arr!18550 a!2986) #b00000000000000000000000000000000) Nil!12588) Nil!12588)))))

(declare-fun b!656821 () Bool)

(assert (=> b!656821 (= e!377266 call!33868)))

(declare-fun d!92813 () Bool)

(declare-fun res!425968 () Bool)

(assert (=> d!92813 (=> res!425968 e!377267)))

(assert (=> d!92813 (= res!425968 (bvsge #b00000000000000000000000000000000 (size!18914 a!2986)))))

(assert (=> d!92813 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12588) e!377267)))

(declare-fun b!656822 () Bool)

(assert (=> b!656822 (= e!377269 (contains!3194 Nil!12588 (select (arr!18550 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92813 (not res!425968)) b!656819))

(assert (= (and b!656819 res!425966) b!656822))

(assert (= (and b!656819 res!425967) b!656818))

(assert (= (and b!656818 c!75793) b!656821))

(assert (= (and b!656818 (not c!75793)) b!656820))

(assert (= (or b!656821 b!656820) bm!33865))

(assert (=> b!656818 m!629811))

(assert (=> b!656818 m!629811))

(assert (=> b!656818 m!629813))

(assert (=> b!656819 m!629811))

(assert (=> b!656819 m!629811))

(assert (=> b!656819 m!629813))

(assert (=> bm!33865 m!629811))

(declare-fun m!629919 () Bool)

(assert (=> bm!33865 m!629919))

(assert (=> b!656822 m!629811))

(assert (=> b!656822 m!629811))

(declare-fun m!629921 () Bool)

(assert (=> b!656822 m!629921))

(assert (=> b!656628 d!92813))

(declare-fun b!656823 () Bool)

(declare-fun e!377272 () Bool)

(declare-fun e!377270 () Bool)

(assert (=> b!656823 (= e!377272 e!377270)))

(declare-fun c!75794 () Bool)

(assert (=> b!656823 (= c!75794 (validKeyInArray!0 (select (arr!18550 lt!306524) j!136)))))

(declare-fun b!656824 () Bool)

(declare-fun e!377271 () Bool)

(assert (=> b!656824 (= e!377271 e!377272)))

(declare-fun res!425970 () Bool)

(assert (=> b!656824 (=> (not res!425970) (not e!377272))))

(declare-fun e!377273 () Bool)

(assert (=> b!656824 (= res!425970 (not e!377273))))

(declare-fun res!425969 () Bool)

(assert (=> b!656824 (=> (not res!425969) (not e!377273))))

(assert (=> b!656824 (= res!425969 (validKeyInArray!0 (select (arr!18550 lt!306524) j!136)))))

(declare-fun b!656825 () Bool)

(declare-fun call!33869 () Bool)

(assert (=> b!656825 (= e!377270 call!33869)))

(declare-fun bm!33866 () Bool)

(assert (=> bm!33866 (= call!33869 (arrayNoDuplicates!0 lt!306524 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75794 (Cons!12587 (select (arr!18550 lt!306524) j!136) Nil!12588) Nil!12588)))))

(declare-fun b!656826 () Bool)

(assert (=> b!656826 (= e!377270 call!33869)))

(declare-fun d!92815 () Bool)

(declare-fun res!425971 () Bool)

(assert (=> d!92815 (=> res!425971 e!377271)))

(assert (=> d!92815 (= res!425971 (bvsge j!136 (size!18914 lt!306524)))))

(assert (=> d!92815 (= (arrayNoDuplicates!0 lt!306524 j!136 Nil!12588) e!377271)))

(declare-fun b!656827 () Bool)

(assert (=> b!656827 (= e!377273 (contains!3194 Nil!12588 (select (arr!18550 lt!306524) j!136)))))

(assert (= (and d!92815 (not res!425971)) b!656824))

(assert (= (and b!656824 res!425969) b!656827))

(assert (= (and b!656824 res!425970) b!656823))

(assert (= (and b!656823 c!75794) b!656826))

(assert (= (and b!656823 (not c!75794)) b!656825))

(assert (= (or b!656826 b!656825) bm!33866))

(assert (=> b!656823 m!629807))

(assert (=> b!656823 m!629807))

(declare-fun m!629923 () Bool)

(assert (=> b!656823 m!629923))

(assert (=> b!656824 m!629807))

(assert (=> b!656824 m!629807))

(assert (=> b!656824 m!629923))

(assert (=> bm!33866 m!629807))

(declare-fun m!629925 () Bool)

(assert (=> bm!33866 m!629925))

(assert (=> b!656827 m!629807))

(assert (=> b!656827 m!629807))

(declare-fun m!629927 () Bool)

(assert (=> b!656827 m!629927))

(assert (=> b!656624 d!92815))

(declare-fun d!92817 () Bool)

(assert (=> d!92817 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306649 () Unit!22654)

(assert (=> d!92817 (= lt!306649 (choose!114 lt!306524 (select (arr!18550 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92817 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92817 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306524 (select (arr!18550 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!306649)))

(declare-fun bs!19554 () Bool)

(assert (= bs!19554 d!92817))

(assert (=> bs!19554 m!629671))

(assert (=> bs!19554 m!629733))

(assert (=> bs!19554 m!629671))

(declare-fun m!629929 () Bool)

(assert (=> bs!19554 m!629929))

(assert (=> b!656624 d!92817))

(declare-fun d!92819 () Bool)

(assert (=> d!92819 (arrayNoDuplicates!0 lt!306524 j!136 Nil!12588)))

(declare-fun lt!306651 () Unit!22654)

(assert (=> d!92819 (= lt!306651 (choose!39 lt!306524 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92819 (bvslt (size!18914 lt!306524) #b01111111111111111111111111111111)))

(assert (=> d!92819 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306524 #b00000000000000000000000000000000 j!136) lt!306651)))

(declare-fun bs!19556 () Bool)

(assert (= bs!19556 d!92819))

(assert (=> bs!19556 m!629727))

(declare-fun m!629933 () Bool)

(assert (=> bs!19556 m!629933))

(assert (=> b!656624 d!92819))

(assert (=> b!656624 d!92781))

(declare-fun d!92823 () Bool)

(declare-fun res!425972 () Bool)

(declare-fun e!377274 () Bool)

(assert (=> d!92823 (=> res!425972 e!377274)))

(assert (=> d!92823 (= res!425972 (= (select (arr!18550 lt!306524) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18550 a!2986) j!136)))))

(assert (=> d!92823 (= (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!377274)))

(declare-fun b!656828 () Bool)

(declare-fun e!377275 () Bool)

(assert (=> b!656828 (= e!377274 e!377275)))

(declare-fun res!425973 () Bool)

(assert (=> b!656828 (=> (not res!425973) (not e!377275))))

(assert (=> b!656828 (= res!425973 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18914 lt!306524)))))

(declare-fun b!656829 () Bool)

(assert (=> b!656829 (= e!377275 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92823 (not res!425972)) b!656828))

(assert (= (and b!656828 res!425973) b!656829))

(declare-fun m!629935 () Bool)

(assert (=> d!92823 m!629935))

(assert (=> b!656829 m!629671))

(declare-fun m!629937 () Bool)

(assert (=> b!656829 m!629937))

(assert (=> b!656624 d!92823))

(declare-fun d!92825 () Bool)

(assert (=> d!92825 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18914 lt!306524)) (not (= (select (arr!18550 lt!306524) j!136) (select (arr!18550 a!2986) j!136))))))

(declare-fun lt!306652 () Unit!22654)

(assert (=> d!92825 (= lt!306652 (choose!21 lt!306524 (select (arr!18550 a!2986) j!136) j!136 Nil!12588))))

(assert (=> d!92825 (bvslt (size!18914 lt!306524) #b01111111111111111111111111111111)))

(assert (=> d!92825 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306524 (select (arr!18550 a!2986) j!136) j!136 Nil!12588) lt!306652)))

(declare-fun bs!19557 () Bool)

(assert (= bs!19557 d!92825))

(assert (=> bs!19557 m!629807))

(assert (=> bs!19557 m!629671))

(declare-fun m!629939 () Bool)

(assert (=> bs!19557 m!629939))

(assert (=> b!656624 d!92825))

(assert (=> b!656624 d!92773))

(declare-fun b!656885 () Bool)

(declare-fun e!377319 () SeekEntryResult!6990)

(declare-fun e!377318 () SeekEntryResult!6990)

(assert (=> b!656885 (= e!377319 e!377318)))

(declare-fun lt!306666 () (_ BitVec 64))

(declare-fun c!75809 () Bool)

(assert (=> b!656885 (= c!75809 (= lt!306666 (select (arr!18550 a!2986) j!136)))))

(declare-fun e!377317 () SeekEntryResult!6990)

(declare-fun b!656886 () Bool)

(assert (=> b!656886 (= e!377317 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656887 () Bool)

(assert (=> b!656887 (= e!377318 (Found!6990 index!984))))

(declare-fun b!656888 () Bool)

(assert (=> b!656888 (= e!377319 Undefined!6990)))

(declare-fun d!92827 () Bool)

(declare-fun lt!306665 () SeekEntryResult!6990)

(assert (=> d!92827 (and (or ((_ is Undefined!6990) lt!306665) (not ((_ is Found!6990) lt!306665)) (and (bvsge (index!30323 lt!306665) #b00000000000000000000000000000000) (bvslt (index!30323 lt!306665) (size!18914 a!2986)))) (or ((_ is Undefined!6990) lt!306665) ((_ is Found!6990) lt!306665) (not ((_ is MissingVacant!6990) lt!306665)) (not (= (index!30325 lt!306665) vacantSpotIndex!68)) (and (bvsge (index!30325 lt!306665) #b00000000000000000000000000000000) (bvslt (index!30325 lt!306665) (size!18914 a!2986)))) (or ((_ is Undefined!6990) lt!306665) (ite ((_ is Found!6990) lt!306665) (= (select (arr!18550 a!2986) (index!30323 lt!306665)) (select (arr!18550 a!2986) j!136)) (and ((_ is MissingVacant!6990) lt!306665) (= (index!30325 lt!306665) vacantSpotIndex!68) (= (select (arr!18550 a!2986) (index!30325 lt!306665)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92827 (= lt!306665 e!377319)))

(declare-fun c!75811 () Bool)

(assert (=> d!92827 (= c!75811 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92827 (= lt!306666 (select (arr!18550 a!2986) index!984))))

(assert (=> d!92827 (validMask!0 mask!3053)))

(assert (=> d!92827 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053) lt!306665)))

(declare-fun b!656889 () Bool)

(declare-fun c!75810 () Bool)

(assert (=> b!656889 (= c!75810 (= lt!306666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656889 (= e!377318 e!377317)))

(declare-fun b!656890 () Bool)

(assert (=> b!656890 (= e!377317 (MissingVacant!6990 vacantSpotIndex!68))))

(assert (= (and d!92827 c!75811) b!656888))

(assert (= (and d!92827 (not c!75811)) b!656885))

(assert (= (and b!656885 c!75809) b!656887))

(assert (= (and b!656885 (not c!75809)) b!656889))

(assert (= (and b!656889 c!75810) b!656890))

(assert (= (and b!656889 (not c!75810)) b!656886))

(assert (=> b!656886 m!629703))

(assert (=> b!656886 m!629703))

(assert (=> b!656886 m!629671))

(declare-fun m!629983 () Bool)

(assert (=> b!656886 m!629983))

(declare-fun m!629985 () Bool)

(assert (=> d!92827 m!629985))

(declare-fun m!629989 () Bool)

(assert (=> d!92827 m!629989))

(assert (=> d!92827 m!629713))

(assert (=> d!92827 m!629667))

(assert (=> b!656626 d!92827))

(declare-fun d!92851 () Bool)

(assert (=> d!92851 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59464 d!92851))

(declare-fun d!92855 () Bool)

(assert (=> d!92855 (= (array_inv!14346 a!2986) (bvsge (size!18914 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59464 d!92855))

(declare-fun d!92857 () Bool)

(declare-fun res!426009 () Bool)

(declare-fun e!377328 () Bool)

(assert (=> d!92857 (=> res!426009 e!377328)))

(assert (=> d!92857 (= res!426009 (= (select (arr!18550 lt!306524) index!984) (select (arr!18550 a!2986) j!136)))))

(assert (=> d!92857 (= (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) index!984) e!377328)))

(declare-fun b!656899 () Bool)

(declare-fun e!377329 () Bool)

(assert (=> b!656899 (= e!377328 e!377329)))

(declare-fun res!426010 () Bool)

(assert (=> b!656899 (=> (not res!426010) (not e!377329))))

(assert (=> b!656899 (= res!426010 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18914 lt!306524)))))

(declare-fun b!656900 () Bool)

(assert (=> b!656900 (= e!377329 (arrayContainsKey!0 lt!306524 (select (arr!18550 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92857 (not res!426009)) b!656899))

(assert (= (and b!656899 res!426010) b!656900))

(assert (=> d!92857 m!629827))

(assert (=> b!656900 m!629671))

(declare-fun m!629995 () Bool)

(assert (=> b!656900 m!629995))

(assert (=> b!656622 d!92857))

(declare-fun d!92859 () Bool)

(assert (=> d!92859 (= (validKeyInArray!0 (select (arr!18550 a!2986) j!136)) (and (not (= (select (arr!18550 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18550 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656623 d!92859))

(declare-fun d!92861 () Bool)

(declare-fun lt!306670 () (_ BitVec 32))

(assert (=> d!92861 (and (bvsge lt!306670 #b00000000000000000000000000000000) (bvslt lt!306670 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92861 (= lt!306670 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92861 (validMask!0 mask!3053)))

(assert (=> d!92861 (= (nextIndex!0 index!984 x!910 mask!3053) lt!306670)))

(declare-fun bs!19562 () Bool)

(assert (= bs!19562 d!92861))

(declare-fun m!629997 () Bool)

(assert (=> bs!19562 m!629997))

(assert (=> bs!19562 m!629667))

(assert (=> b!656612 d!92861))

(declare-fun b!656901 () Bool)

(declare-fun e!377332 () SeekEntryResult!6990)

(declare-fun e!377331 () SeekEntryResult!6990)

(assert (=> b!656901 (= e!377332 e!377331)))

(declare-fun lt!306672 () (_ BitVec 64))

(declare-fun c!75812 () Bool)

(assert (=> b!656901 (= c!75812 (= lt!306672 (select (arr!18550 a!2986) j!136)))))

(declare-fun e!377330 () SeekEntryResult!6990)

(declare-fun b!656902 () Bool)

(assert (=> b!656902 (= e!377330 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306519 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656903 () Bool)

(assert (=> b!656903 (= e!377331 (Found!6990 lt!306519))))

(declare-fun b!656904 () Bool)

(assert (=> b!656904 (= e!377332 Undefined!6990)))

(declare-fun d!92863 () Bool)

(declare-fun lt!306671 () SeekEntryResult!6990)

(assert (=> d!92863 (and (or ((_ is Undefined!6990) lt!306671) (not ((_ is Found!6990) lt!306671)) (and (bvsge (index!30323 lt!306671) #b00000000000000000000000000000000) (bvslt (index!30323 lt!306671) (size!18914 a!2986)))) (or ((_ is Undefined!6990) lt!306671) ((_ is Found!6990) lt!306671) (not ((_ is MissingVacant!6990) lt!306671)) (not (= (index!30325 lt!306671) vacantSpotIndex!68)) (and (bvsge (index!30325 lt!306671) #b00000000000000000000000000000000) (bvslt (index!30325 lt!306671) (size!18914 a!2986)))) (or ((_ is Undefined!6990) lt!306671) (ite ((_ is Found!6990) lt!306671) (= (select (arr!18550 a!2986) (index!30323 lt!306671)) (select (arr!18550 a!2986) j!136)) (and ((_ is MissingVacant!6990) lt!306671) (= (index!30325 lt!306671) vacantSpotIndex!68) (= (select (arr!18550 a!2986) (index!30325 lt!306671)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92863 (= lt!306671 e!377332)))

(declare-fun c!75814 () Bool)

(assert (=> d!92863 (= c!75814 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92863 (= lt!306672 (select (arr!18550 a!2986) lt!306519))))

(assert (=> d!92863 (validMask!0 mask!3053)))

(assert (=> d!92863 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053) lt!306671)))

(declare-fun b!656905 () Bool)

(declare-fun c!75813 () Bool)

(assert (=> b!656905 (= c!75813 (= lt!306672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656905 (= e!377331 e!377330)))

(declare-fun b!656906 () Bool)

(assert (=> b!656906 (= e!377330 (MissingVacant!6990 vacantSpotIndex!68))))

(assert (= (and d!92863 c!75814) b!656904))

(assert (= (and d!92863 (not c!75814)) b!656901))

(assert (= (and b!656901 c!75812) b!656903))

(assert (= (and b!656901 (not c!75812)) b!656905))

(assert (= (and b!656905 c!75813) b!656906))

(assert (= (and b!656905 (not c!75813)) b!656902))

(declare-fun m!629999 () Bool)

(assert (=> b!656902 m!629999))

(assert (=> b!656902 m!629999))

(assert (=> b!656902 m!629671))

(declare-fun m!630001 () Bool)

(assert (=> b!656902 m!630001))

(declare-fun m!630003 () Bool)

(assert (=> d!92863 m!630003))

(declare-fun m!630005 () Bool)

(assert (=> d!92863 m!630005))

(declare-fun m!630007 () Bool)

(assert (=> d!92863 m!630007))

(assert (=> d!92863 m!629667))

(assert (=> b!656612 d!92863))

(declare-fun b!656907 () Bool)

(declare-fun e!377335 () SeekEntryResult!6990)

(declare-fun e!377334 () SeekEntryResult!6990)

(assert (=> b!656907 (= e!377335 e!377334)))

(declare-fun c!75815 () Bool)

(declare-fun lt!306674 () (_ BitVec 64))

(assert (=> b!656907 (= c!75815 (= lt!306674 lt!306530))))

(declare-fun b!656908 () Bool)

(declare-fun e!377333 () SeekEntryResult!6990)

(assert (=> b!656908 (= e!377333 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306519 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!306530 lt!306524 mask!3053))))

(declare-fun b!656909 () Bool)

(assert (=> b!656909 (= e!377334 (Found!6990 lt!306519))))

(declare-fun b!656910 () Bool)

(assert (=> b!656910 (= e!377335 Undefined!6990)))

(declare-fun d!92865 () Bool)

(declare-fun lt!306673 () SeekEntryResult!6990)

(assert (=> d!92865 (and (or ((_ is Undefined!6990) lt!306673) (not ((_ is Found!6990) lt!306673)) (and (bvsge (index!30323 lt!306673) #b00000000000000000000000000000000) (bvslt (index!30323 lt!306673) (size!18914 lt!306524)))) (or ((_ is Undefined!6990) lt!306673) ((_ is Found!6990) lt!306673) (not ((_ is MissingVacant!6990) lt!306673)) (not (= (index!30325 lt!306673) vacantSpotIndex!68)) (and (bvsge (index!30325 lt!306673) #b00000000000000000000000000000000) (bvslt (index!30325 lt!306673) (size!18914 lt!306524)))) (or ((_ is Undefined!6990) lt!306673) (ite ((_ is Found!6990) lt!306673) (= (select (arr!18550 lt!306524) (index!30323 lt!306673)) lt!306530) (and ((_ is MissingVacant!6990) lt!306673) (= (index!30325 lt!306673) vacantSpotIndex!68) (= (select (arr!18550 lt!306524) (index!30325 lt!306673)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92865 (= lt!306673 e!377335)))

(declare-fun c!75817 () Bool)

(assert (=> d!92865 (= c!75817 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92865 (= lt!306674 (select (arr!18550 lt!306524) lt!306519))))

(assert (=> d!92865 (validMask!0 mask!3053)))

(assert (=> d!92865 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 lt!306530 lt!306524 mask!3053) lt!306673)))

(declare-fun b!656911 () Bool)

(declare-fun c!75816 () Bool)

(assert (=> b!656911 (= c!75816 (= lt!306674 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656911 (= e!377334 e!377333)))

(declare-fun b!656912 () Bool)

(assert (=> b!656912 (= e!377333 (MissingVacant!6990 vacantSpotIndex!68))))

(assert (= (and d!92865 c!75817) b!656910))

(assert (= (and d!92865 (not c!75817)) b!656907))

(assert (= (and b!656907 c!75815) b!656909))

(assert (= (and b!656907 (not c!75815)) b!656911))

(assert (= (and b!656911 c!75816) b!656912))

(assert (= (and b!656911 (not c!75816)) b!656908))

(assert (=> b!656908 m!629999))

(assert (=> b!656908 m!629999))

(declare-fun m!630009 () Bool)

(assert (=> b!656908 m!630009))

(declare-fun m!630011 () Bool)

(assert (=> d!92865 m!630011))

(declare-fun m!630013 () Bool)

(assert (=> d!92865 m!630013))

(declare-fun m!630015 () Bool)

(assert (=> d!92865 m!630015))

(assert (=> d!92865 m!629667))

(assert (=> b!656612 d!92865))

(declare-fun b!656913 () Bool)

(declare-fun e!377338 () SeekEntryResult!6990)

(declare-fun e!377337 () SeekEntryResult!6990)

(assert (=> b!656913 (= e!377338 e!377337)))

(declare-fun c!75818 () Bool)

(declare-fun lt!306676 () (_ BitVec 64))

(assert (=> b!656913 (= c!75818 (= lt!306676 lt!306530))))

(declare-fun b!656914 () Bool)

(declare-fun e!377336 () SeekEntryResult!6990)

(assert (=> b!656914 (= e!377336 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!306530 lt!306524 mask!3053))))

(declare-fun b!656915 () Bool)

(assert (=> b!656915 (= e!377337 (Found!6990 index!984))))

(declare-fun b!656916 () Bool)

(assert (=> b!656916 (= e!377338 Undefined!6990)))

(declare-fun d!92867 () Bool)

(declare-fun lt!306675 () SeekEntryResult!6990)

(assert (=> d!92867 (and (or ((_ is Undefined!6990) lt!306675) (not ((_ is Found!6990) lt!306675)) (and (bvsge (index!30323 lt!306675) #b00000000000000000000000000000000) (bvslt (index!30323 lt!306675) (size!18914 lt!306524)))) (or ((_ is Undefined!6990) lt!306675) ((_ is Found!6990) lt!306675) (not ((_ is MissingVacant!6990) lt!306675)) (not (= (index!30325 lt!306675) vacantSpotIndex!68)) (and (bvsge (index!30325 lt!306675) #b00000000000000000000000000000000) (bvslt (index!30325 lt!306675) (size!18914 lt!306524)))) (or ((_ is Undefined!6990) lt!306675) (ite ((_ is Found!6990) lt!306675) (= (select (arr!18550 lt!306524) (index!30323 lt!306675)) lt!306530) (and ((_ is MissingVacant!6990) lt!306675) (= (index!30325 lt!306675) vacantSpotIndex!68) (= (select (arr!18550 lt!306524) (index!30325 lt!306675)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92867 (= lt!306675 e!377338)))

(declare-fun c!75820 () Bool)

(assert (=> d!92867 (= c!75820 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92867 (= lt!306676 (select (arr!18550 lt!306524) index!984))))

(assert (=> d!92867 (validMask!0 mask!3053)))

(assert (=> d!92867 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306530 lt!306524 mask!3053) lt!306675)))

(declare-fun b!656917 () Bool)

(declare-fun c!75819 () Bool)

(assert (=> b!656917 (= c!75819 (= lt!306676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656917 (= e!377337 e!377336)))

(declare-fun b!656918 () Bool)

(assert (=> b!656918 (= e!377336 (MissingVacant!6990 vacantSpotIndex!68))))

(assert (= (and d!92867 c!75820) b!656916))

(assert (= (and d!92867 (not c!75820)) b!656913))

(assert (= (and b!656913 c!75818) b!656915))

(assert (= (and b!656913 (not c!75818)) b!656917))

(assert (= (and b!656917 c!75819) b!656918))

(assert (= (and b!656917 (not c!75819)) b!656914))

(assert (=> b!656914 m!629703))

(assert (=> b!656914 m!629703))

(declare-fun m!630017 () Bool)

(assert (=> b!656914 m!630017))

(declare-fun m!630019 () Bool)

(assert (=> d!92867 m!630019))

(declare-fun m!630021 () Bool)

(assert (=> d!92867 m!630021))

(assert (=> d!92867 m!629827))

(assert (=> d!92867 m!629667))

(assert (=> b!656612 d!92867))

(declare-fun d!92869 () Bool)

(declare-fun e!377367 () Bool)

(assert (=> d!92869 e!377367))

(declare-fun res!426020 () Bool)

(assert (=> d!92869 (=> (not res!426020) (not e!377367))))

(assert (=> d!92869 (= res!426020 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18914 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18914 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18914 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18914 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18914 a!2986))))))

(declare-fun lt!306694 () Unit!22654)

(declare-fun choose!9 (array!38703 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22654)

(assert (=> d!92869 (= lt!306694 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92869 (validMask!0 mask!3053)))

(assert (=> d!92869 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 mask!3053) lt!306694)))

(declare-fun b!656966 () Bool)

(assert (=> b!656966 (= e!377367 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306519 vacantSpotIndex!68 (select (store (arr!18550 a!2986) i!1108 k0!1786) j!136) (array!38704 (store (arr!18550 a!2986) i!1108 k0!1786) (size!18914 a!2986)) mask!3053)))))

(assert (= (and d!92869 res!426020) b!656966))

(declare-fun m!630053 () Bool)

(assert (=> d!92869 m!630053))

(assert (=> d!92869 m!629667))

(assert (=> b!656966 m!629675))

(assert (=> b!656966 m!629705))

(assert (=> b!656966 m!629671))

(assert (=> b!656966 m!629671))

(assert (=> b!656966 m!629701))

(assert (=> b!656966 m!629705))

(declare-fun m!630055 () Bool)

(assert (=> b!656966 m!630055))

(assert (=> b!656612 d!92869))

(assert (=> b!656613 d!92857))

(check-sat (not d!92865) (not b!656823) (not d!92867) (not d!92861) (not b!656886) (not d!92869) (not d!92819) (not d!92771) (not d!92769) (not b!656902) (not b!656900) (not d!92789) (not b!656757) (not b!656740) (not d!92779) (not bm!33865) (not b!656829) (not b!656721) (not b!656822) (not bm!33864) (not d!92827) (not b!656811) (not b!656720) (not b!656768) (not d!92773) (not b!656711) (not bm!33863) (not d!92825) (not b!656760) (not b!656818) (not b!656728) (not bm!33866) (not d!92863) (not b!656756) (not b!656743) (not b!656966) (not d!92817) (not b!656908) (not bm!33860) (not b!656819) (not b!656824) (not b!656739) (not b!656914) (not b!656827) (not b!656725))
(check-sat)
