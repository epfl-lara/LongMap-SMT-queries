; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56172 () Bool)

(assert start!56172)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37642 0))(
  ( (array!37643 (arr!18067 (Array (_ BitVec 32) (_ BitVec 64))) (size!18431 (_ BitVec 32))) )
))
(declare-fun lt!287794 () array!37642)

(declare-fun res!400648 () Bool)

(declare-fun a!2986 () array!37642)

(declare-fun b!621705 () Bool)

(declare-fun arrayContainsKey!0 (array!37642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621705 (= res!400648 (arrayContainsKey!0 lt!287794 (select (arr!18067 a!2986) j!136) j!136))))

(declare-fun e!356585 () Bool)

(assert (=> b!621705 (=> (not res!400648) (not e!356585))))

(declare-fun e!356593 () Bool)

(assert (=> b!621705 (= e!356593 e!356585)))

(declare-fun b!621706 () Bool)

(assert (=> b!621706 false))

(declare-datatypes ((Unit!20798 0))(
  ( (Unit!20799) )
))
(declare-fun lt!287793 () Unit!20798)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12108 0))(
  ( (Nil!12105) (Cons!12104 (h!13149 (_ BitVec 64)) (t!18336 List!12108)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37642 (_ BitVec 64) (_ BitVec 32) List!12108) Unit!20798)

(assert (=> b!621706 (= lt!287793 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287794 (select (arr!18067 a!2986) j!136) index!984 Nil!12105))))

(declare-fun arrayNoDuplicates!0 (array!37642 (_ BitVec 32) List!12108) Bool)

(assert (=> b!621706 (arrayNoDuplicates!0 lt!287794 index!984 Nil!12105)))

(declare-fun lt!287797 () Unit!20798)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37642 (_ BitVec 32) (_ BitVec 32)) Unit!20798)

(assert (=> b!621706 (= lt!287797 (lemmaNoDuplicateFromThenFromBigger!0 lt!287794 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621706 (arrayNoDuplicates!0 lt!287794 #b00000000000000000000000000000000 Nil!12105)))

(declare-fun lt!287790 () Unit!20798)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37642 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12108) Unit!20798)

(assert (=> b!621706 (= lt!287790 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12105))))

(assert (=> b!621706 (arrayContainsKey!0 lt!287794 (select (arr!18067 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287778 () Unit!20798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37642 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20798)

(assert (=> b!621706 (= lt!287778 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287794 (select (arr!18067 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356598 () Bool)

(assert (=> b!621706 e!356598))

(declare-fun res!400649 () Bool)

(assert (=> b!621706 (=> (not res!400649) (not e!356598))))

(assert (=> b!621706 (= res!400649 (arrayContainsKey!0 lt!287794 (select (arr!18067 a!2986) j!136) j!136))))

(declare-fun e!356594 () Unit!20798)

(declare-fun Unit!20800 () Unit!20798)

(assert (=> b!621706 (= e!356594 Unit!20800)))

(declare-fun b!621707 () Bool)

(declare-fun e!356591 () Bool)

(declare-fun e!356592 () Bool)

(assert (=> b!621707 (= e!356591 e!356592)))

(declare-fun res!400657 () Bool)

(assert (=> b!621707 (=> (not res!400657) (not e!356592))))

(declare-datatypes ((SeekEntryResult!6507 0))(
  ( (MissingZero!6507 (index!28312 (_ BitVec 32))) (Found!6507 (index!28313 (_ BitVec 32))) (Intermediate!6507 (undefined!7319 Bool) (index!28314 (_ BitVec 32)) (x!57083 (_ BitVec 32))) (Undefined!6507) (MissingVacant!6507 (index!28315 (_ BitVec 32))) )
))
(declare-fun lt!287791 () SeekEntryResult!6507)

(assert (=> b!621707 (= res!400657 (or (= lt!287791 (MissingZero!6507 i!1108)) (= lt!287791 (MissingVacant!6507 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37642 (_ BitVec 32)) SeekEntryResult!6507)

(assert (=> b!621707 (= lt!287791 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621709 () Bool)

(declare-fun res!400651 () Bool)

(assert (=> b!621709 (=> (not res!400651) (not e!356591))))

(assert (=> b!621709 (= res!400651 (and (= (size!18431 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18431 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18431 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621710 () Bool)

(declare-fun res!400650 () Bool)

(assert (=> b!621710 (= res!400650 (bvsge j!136 index!984))))

(assert (=> b!621710 (=> res!400650 e!356593)))

(declare-fun e!356597 () Bool)

(assert (=> b!621710 (= e!356597 e!356593)))

(declare-fun b!621711 () Bool)

(declare-fun res!400646 () Bool)

(assert (=> b!621711 (=> (not res!400646) (not e!356592))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621711 (= res!400646 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18067 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621712 () Bool)

(declare-fun e!356596 () Unit!20798)

(declare-fun Unit!20801 () Unit!20798)

(assert (=> b!621712 (= e!356596 Unit!20801)))

(declare-fun b!621713 () Bool)

(declare-fun e!356586 () Bool)

(assert (=> b!621713 (= e!356592 e!356586)))

(declare-fun res!400644 () Bool)

(assert (=> b!621713 (=> (not res!400644) (not e!356586))))

(assert (=> b!621713 (= res!400644 (= (select (store (arr!18067 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621713 (= lt!287794 (array!37643 (store (arr!18067 a!2986) i!1108 k0!1786) (size!18431 a!2986)))))

(declare-fun b!621714 () Bool)

(declare-fun Unit!20802 () Unit!20798)

(assert (=> b!621714 (= e!356596 Unit!20802)))

(assert (=> b!621714 false))

(declare-fun b!621715 () Bool)

(declare-fun res!400656 () Bool)

(assert (=> b!621715 (=> (not res!400656) (not e!356592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37642 (_ BitVec 32)) Bool)

(assert (=> b!621715 (= res!400656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621716 () Bool)

(declare-fun e!356590 () Bool)

(declare-fun lt!287795 () SeekEntryResult!6507)

(declare-fun lt!287785 () SeekEntryResult!6507)

(assert (=> b!621716 (= e!356590 (= lt!287795 lt!287785))))

(declare-fun b!621717 () Bool)

(declare-fun e!356589 () Bool)

(assert (=> b!621717 (= e!356586 e!356589)))

(declare-fun res!400655 () Bool)

(assert (=> b!621717 (=> (not res!400655) (not e!356589))))

(assert (=> b!621717 (= res!400655 (and (= lt!287795 (Found!6507 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18067 a!2986) index!984) (select (arr!18067 a!2986) j!136))) (not (= (select (arr!18067 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37642 (_ BitVec 32)) SeekEntryResult!6507)

(assert (=> b!621717 (= lt!287795 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18067 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621718 () Bool)

(declare-fun res!400654 () Bool)

(assert (=> b!621718 (=> (not res!400654) (not e!356591))))

(assert (=> b!621718 (= res!400654 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621719 () Bool)

(declare-fun e!356595 () Unit!20798)

(declare-fun Unit!20803 () Unit!20798)

(assert (=> b!621719 (= e!356595 Unit!20803)))

(declare-fun b!621720 () Bool)

(declare-fun e!356588 () Unit!20798)

(declare-fun Unit!20804 () Unit!20798)

(assert (=> b!621720 (= e!356588 Unit!20804)))

(declare-fun b!621708 () Bool)

(declare-fun res!400652 () Bool)

(assert (=> b!621708 (=> (not res!400652) (not e!356592))))

(assert (=> b!621708 (= res!400652 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12105))))

(declare-fun res!400658 () Bool)

(assert (=> start!56172 (=> (not res!400658) (not e!356591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56172 (= res!400658 (validMask!0 mask!3053))))

(assert (=> start!56172 e!356591))

(assert (=> start!56172 true))

(declare-fun array_inv!13863 (array!37642) Bool)

(assert (=> start!56172 (array_inv!13863 a!2986)))

(declare-fun b!621721 () Bool)

(assert (=> b!621721 false))

(declare-fun lt!287782 () Unit!20798)

(assert (=> b!621721 (= lt!287782 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287794 (select (arr!18067 a!2986) j!136) j!136 Nil!12105))))

(assert (=> b!621721 (arrayNoDuplicates!0 lt!287794 j!136 Nil!12105)))

(declare-fun lt!287784 () Unit!20798)

(assert (=> b!621721 (= lt!287784 (lemmaNoDuplicateFromThenFromBigger!0 lt!287794 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621721 (arrayNoDuplicates!0 lt!287794 #b00000000000000000000000000000000 Nil!12105)))

(declare-fun lt!287781 () Unit!20798)

(assert (=> b!621721 (= lt!287781 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12105))))

(assert (=> b!621721 (arrayContainsKey!0 lt!287794 (select (arr!18067 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287783 () Unit!20798)

(assert (=> b!621721 (= lt!287783 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287794 (select (arr!18067 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20805 () Unit!20798)

(assert (=> b!621721 (= e!356588 Unit!20805)))

(declare-fun b!621722 () Bool)

(declare-fun res!400643 () Bool)

(assert (=> b!621722 (=> (not res!400643) (not e!356591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621722 (= res!400643 (validKeyInArray!0 (select (arr!18067 a!2986) j!136)))))

(declare-fun b!621723 () Bool)

(declare-fun Unit!20806 () Unit!20798)

(assert (=> b!621723 (= e!356594 Unit!20806)))

(declare-fun b!621724 () Bool)

(assert (=> b!621724 (= e!356598 (arrayContainsKey!0 lt!287794 (select (arr!18067 a!2986) j!136) index!984))))

(declare-fun b!621725 () Bool)

(assert (=> b!621725 (= e!356585 (arrayContainsKey!0 lt!287794 (select (arr!18067 a!2986) j!136) index!984))))

(declare-fun b!621726 () Bool)

(declare-fun res!400647 () Bool)

(assert (=> b!621726 (=> (not res!400647) (not e!356591))))

(assert (=> b!621726 (= res!400647 (validKeyInArray!0 k0!1786))))

(declare-fun b!621727 () Bool)

(declare-fun Unit!20807 () Unit!20798)

(assert (=> b!621727 (= e!356595 Unit!20807)))

(declare-fun res!400653 () Bool)

(assert (=> b!621727 (= res!400653 (= (select (store (arr!18067 a!2986) i!1108 k0!1786) index!984) (select (arr!18067 a!2986) j!136)))))

(assert (=> b!621727 (=> (not res!400653) (not e!356597))))

(assert (=> b!621727 e!356597))

(declare-fun c!70898 () Bool)

(assert (=> b!621727 (= c!70898 (bvslt j!136 index!984))))

(declare-fun lt!287780 () Unit!20798)

(assert (=> b!621727 (= lt!287780 e!356588)))

(declare-fun c!70901 () Bool)

(assert (=> b!621727 (= c!70901 (bvslt index!984 j!136))))

(declare-fun lt!287787 () Unit!20798)

(assert (=> b!621727 (= lt!287787 e!356594)))

(assert (=> b!621727 false))

(declare-fun b!621728 () Bool)

(assert (=> b!621728 (= e!356589 (not true))))

(declare-fun lt!287789 () Unit!20798)

(assert (=> b!621728 (= lt!287789 e!356595)))

(declare-fun c!70899 () Bool)

(declare-fun lt!287786 () SeekEntryResult!6507)

(assert (=> b!621728 (= c!70899 (= lt!287786 (Found!6507 index!984)))))

(declare-fun lt!287779 () Unit!20798)

(assert (=> b!621728 (= lt!287779 e!356596)))

(declare-fun c!70900 () Bool)

(assert (=> b!621728 (= c!70900 (= lt!287786 Undefined!6507))))

(declare-fun lt!287788 () (_ BitVec 64))

(assert (=> b!621728 (= lt!287786 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287788 lt!287794 mask!3053))))

(assert (=> b!621728 e!356590))

(declare-fun res!400645 () Bool)

(assert (=> b!621728 (=> (not res!400645) (not e!356590))))

(declare-fun lt!287796 () (_ BitVec 32))

(assert (=> b!621728 (= res!400645 (= lt!287785 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287796 vacantSpotIndex!68 lt!287788 lt!287794 mask!3053)))))

(assert (=> b!621728 (= lt!287785 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287796 vacantSpotIndex!68 (select (arr!18067 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621728 (= lt!287788 (select (store (arr!18067 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287792 () Unit!20798)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37642 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20798)

(assert (=> b!621728 (= lt!287792 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287796 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621728 (= lt!287796 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56172 res!400658) b!621709))

(assert (= (and b!621709 res!400651) b!621722))

(assert (= (and b!621722 res!400643) b!621726))

(assert (= (and b!621726 res!400647) b!621718))

(assert (= (and b!621718 res!400654) b!621707))

(assert (= (and b!621707 res!400657) b!621715))

(assert (= (and b!621715 res!400656) b!621708))

(assert (= (and b!621708 res!400652) b!621711))

(assert (= (and b!621711 res!400646) b!621713))

(assert (= (and b!621713 res!400644) b!621717))

(assert (= (and b!621717 res!400655) b!621728))

(assert (= (and b!621728 res!400645) b!621716))

(assert (= (and b!621728 c!70900) b!621714))

(assert (= (and b!621728 (not c!70900)) b!621712))

(assert (= (and b!621728 c!70899) b!621727))

(assert (= (and b!621728 (not c!70899)) b!621719))

(assert (= (and b!621727 res!400653) b!621710))

(assert (= (and b!621710 (not res!400650)) b!621705))

(assert (= (and b!621705 res!400648) b!621725))

(assert (= (and b!621727 c!70898) b!621721))

(assert (= (and b!621727 (not c!70898)) b!621720))

(assert (= (and b!621727 c!70901) b!621706))

(assert (= (and b!621727 (not c!70901)) b!621723))

(assert (= (and b!621706 res!400649) b!621724))

(declare-fun m!597591 () Bool)

(assert (=> b!621705 m!597591))

(assert (=> b!621705 m!597591))

(declare-fun m!597593 () Bool)

(assert (=> b!621705 m!597593))

(declare-fun m!597595 () Bool)

(assert (=> b!621706 m!597595))

(assert (=> b!621706 m!597591))

(assert (=> b!621706 m!597591))

(declare-fun m!597597 () Bool)

(assert (=> b!621706 m!597597))

(assert (=> b!621706 m!597591))

(assert (=> b!621706 m!597593))

(assert (=> b!621706 m!597591))

(declare-fun m!597599 () Bool)

(assert (=> b!621706 m!597599))

(declare-fun m!597601 () Bool)

(assert (=> b!621706 m!597601))

(declare-fun m!597603 () Bool)

(assert (=> b!621706 m!597603))

(assert (=> b!621706 m!597591))

(declare-fun m!597605 () Bool)

(assert (=> b!621706 m!597605))

(declare-fun m!597607 () Bool)

(assert (=> b!621706 m!597607))

(declare-fun m!597609 () Bool)

(assert (=> b!621726 m!597609))

(assert (=> b!621725 m!597591))

(assert (=> b!621725 m!597591))

(declare-fun m!597611 () Bool)

(assert (=> b!621725 m!597611))

(declare-fun m!597613 () Bool)

(assert (=> b!621727 m!597613))

(declare-fun m!597615 () Bool)

(assert (=> b!621727 m!597615))

(assert (=> b!621727 m!597591))

(assert (=> b!621713 m!597613))

(declare-fun m!597617 () Bool)

(assert (=> b!621713 m!597617))

(declare-fun m!597619 () Bool)

(assert (=> b!621707 m!597619))

(declare-fun m!597621 () Bool)

(assert (=> b!621715 m!597621))

(declare-fun m!597623 () Bool)

(assert (=> start!56172 m!597623))

(declare-fun m!597625 () Bool)

(assert (=> start!56172 m!597625))

(assert (=> b!621724 m!597591))

(assert (=> b!621724 m!597591))

(assert (=> b!621724 m!597611))

(declare-fun m!597627 () Bool)

(assert (=> b!621717 m!597627))

(assert (=> b!621717 m!597591))

(assert (=> b!621717 m!597591))

(declare-fun m!597629 () Bool)

(assert (=> b!621717 m!597629))

(declare-fun m!597631 () Bool)

(assert (=> b!621728 m!597631))

(declare-fun m!597633 () Bool)

(assert (=> b!621728 m!597633))

(assert (=> b!621728 m!597591))

(declare-fun m!597635 () Bool)

(assert (=> b!621728 m!597635))

(assert (=> b!621728 m!597591))

(declare-fun m!597637 () Bool)

(assert (=> b!621728 m!597637))

(assert (=> b!621728 m!597613))

(declare-fun m!597639 () Bool)

(assert (=> b!621728 m!597639))

(declare-fun m!597641 () Bool)

(assert (=> b!621728 m!597641))

(assert (=> b!621722 m!597591))

(assert (=> b!621722 m!597591))

(declare-fun m!597643 () Bool)

(assert (=> b!621722 m!597643))

(assert (=> b!621721 m!597591))

(declare-fun m!597645 () Bool)

(assert (=> b!621721 m!597645))

(declare-fun m!597647 () Bool)

(assert (=> b!621721 m!597647))

(assert (=> b!621721 m!597591))

(assert (=> b!621721 m!597603))

(assert (=> b!621721 m!597591))

(declare-fun m!597649 () Bool)

(assert (=> b!621721 m!597649))

(assert (=> b!621721 m!597601))

(assert (=> b!621721 m!597591))

(declare-fun m!597651 () Bool)

(assert (=> b!621721 m!597651))

(declare-fun m!597653 () Bool)

(assert (=> b!621721 m!597653))

(declare-fun m!597655 () Bool)

(assert (=> b!621711 m!597655))

(declare-fun m!597657 () Bool)

(assert (=> b!621718 m!597657))

(declare-fun m!597659 () Bool)

(assert (=> b!621708 m!597659))

(check-sat (not b!621724) (not b!621725) (not b!621715) (not b!621722) (not b!621707) (not start!56172) (not b!621726) (not b!621708) (not b!621721) (not b!621717) (not b!621718) (not b!621705) (not b!621728) (not b!621706))
(check-sat)
