; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56174 () Bool)

(assert start!56174)

(declare-fun b!621777 () Bool)

(declare-fun e!356627 () Bool)

(declare-datatypes ((SeekEntryResult!6508 0))(
  ( (MissingZero!6508 (index!28316 (_ BitVec 32))) (Found!6508 (index!28317 (_ BitVec 32))) (Intermediate!6508 (undefined!7320 Bool) (index!28318 (_ BitVec 32)) (x!57084 (_ BitVec 32))) (Undefined!6508) (MissingVacant!6508 (index!28319 (_ BitVec 32))) )
))
(declare-fun lt!287856 () SeekEntryResult!6508)

(declare-fun lt!287838 () SeekEntryResult!6508)

(assert (=> b!621777 (= e!356627 (= lt!287856 lt!287838))))

(declare-fun b!621778 () Bool)

(assert (=> b!621778 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20808 0))(
  ( (Unit!20809) )
))
(declare-fun lt!287845 () Unit!20808)

(declare-datatypes ((array!37644 0))(
  ( (array!37645 (arr!18068 (Array (_ BitVec 32) (_ BitVec 64))) (size!18432 (_ BitVec 32))) )
))
(declare-fun lt!287854 () array!37644)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37644)

(declare-datatypes ((List!12109 0))(
  ( (Nil!12106) (Cons!12105 (h!13150 (_ BitVec 64)) (t!18337 List!12109)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37644 (_ BitVec 64) (_ BitVec 32) List!12109) Unit!20808)

(assert (=> b!621778 (= lt!287845 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287854 (select (arr!18068 a!2986) j!136) index!984 Nil!12106))))

(declare-fun arrayNoDuplicates!0 (array!37644 (_ BitVec 32) List!12109) Bool)

(assert (=> b!621778 (arrayNoDuplicates!0 lt!287854 index!984 Nil!12106)))

(declare-fun lt!287847 () Unit!20808)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37644 (_ BitVec 32) (_ BitVec 32)) Unit!20808)

(assert (=> b!621778 (= lt!287847 (lemmaNoDuplicateFromThenFromBigger!0 lt!287854 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621778 (arrayNoDuplicates!0 lt!287854 #b00000000000000000000000000000000 Nil!12106)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!287857 () Unit!20808)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12109) Unit!20808)

(assert (=> b!621778 (= lt!287857 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12106))))

(declare-fun arrayContainsKey!0 (array!37644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621778 (arrayContainsKey!0 lt!287854 (select (arr!18068 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287840 () Unit!20808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20808)

(assert (=> b!621778 (= lt!287840 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287854 (select (arr!18068 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356629 () Bool)

(assert (=> b!621778 e!356629))

(declare-fun res!400699 () Bool)

(assert (=> b!621778 (=> (not res!400699) (not e!356629))))

(assert (=> b!621778 (= res!400699 (arrayContainsKey!0 lt!287854 (select (arr!18068 a!2986) j!136) j!136))))

(declare-fun e!356640 () Unit!20808)

(declare-fun Unit!20810 () Unit!20808)

(assert (=> b!621778 (= e!356640 Unit!20810)))

(declare-fun b!621779 () Bool)

(declare-fun res!400705 () Bool)

(declare-fun e!356639 () Bool)

(assert (=> b!621779 (=> (not res!400705) (not e!356639))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!621779 (= res!400705 (and (= (size!18432 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18432 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18432 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621780 () Bool)

(declare-fun res!400703 () Bool)

(assert (=> b!621780 (=> (not res!400703) (not e!356639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621780 (= res!400703 (validKeyInArray!0 (select (arr!18068 a!2986) j!136)))))

(declare-fun b!621781 () Bool)

(declare-fun e!356632 () Bool)

(declare-fun e!356638 () Bool)

(assert (=> b!621781 (= e!356632 e!356638)))

(declare-fun res!400697 () Bool)

(assert (=> b!621781 (=> (not res!400697) (not e!356638))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!621781 (= res!400697 (= (select (store (arr!18068 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621781 (= lt!287854 (array!37645 (store (arr!18068 a!2986) i!1108 k!1786) (size!18432 a!2986)))))

(declare-fun b!621782 () Bool)

(declare-fun e!356633 () Unit!20808)

(declare-fun Unit!20811 () Unit!20808)

(assert (=> b!621782 (= e!356633 Unit!20811)))

(declare-fun b!621783 () Bool)

(assert (=> b!621783 (= e!356629 (arrayContainsKey!0 lt!287854 (select (arr!18068 a!2986) j!136) index!984))))

(declare-fun b!621784 () Bool)

(declare-fun res!400692 () Bool)

(assert (=> b!621784 (=> (not res!400692) (not e!356632))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621784 (= res!400692 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18068 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621785 () Bool)

(declare-fun res!400696 () Bool)

(assert (=> b!621785 (= res!400696 (bvsge j!136 index!984))))

(declare-fun e!356630 () Bool)

(assert (=> b!621785 (=> res!400696 e!356630)))

(declare-fun e!356635 () Bool)

(assert (=> b!621785 (= e!356635 e!356630)))

(declare-fun b!621786 () Bool)

(declare-fun e!356634 () Unit!20808)

(declare-fun Unit!20812 () Unit!20808)

(assert (=> b!621786 (= e!356634 Unit!20812)))

(declare-fun b!621787 () Bool)

(declare-fun Unit!20813 () Unit!20808)

(assert (=> b!621787 (= e!356634 Unit!20813)))

(assert (=> b!621787 false))

(declare-fun b!621788 () Bool)

(declare-fun e!356637 () Unit!20808)

(declare-fun Unit!20814 () Unit!20808)

(assert (=> b!621788 (= e!356637 Unit!20814)))

(declare-fun res!400691 () Bool)

(assert (=> b!621788 (= res!400691 (= (select (store (arr!18068 a!2986) i!1108 k!1786) index!984) (select (arr!18068 a!2986) j!136)))))

(assert (=> b!621788 (=> (not res!400691) (not e!356635))))

(assert (=> b!621788 e!356635))

(declare-fun c!70913 () Bool)

(assert (=> b!621788 (= c!70913 (bvslt j!136 index!984))))

(declare-fun lt!287843 () Unit!20808)

(assert (=> b!621788 (= lt!287843 e!356633)))

(declare-fun c!70911 () Bool)

(assert (=> b!621788 (= c!70911 (bvslt index!984 j!136))))

(declare-fun lt!287846 () Unit!20808)

(assert (=> b!621788 (= lt!287846 e!356640)))

(assert (=> b!621788 false))

(declare-fun res!400702 () Bool)

(declare-fun b!621789 () Bool)

(assert (=> b!621789 (= res!400702 (arrayContainsKey!0 lt!287854 (select (arr!18068 a!2986) j!136) j!136))))

(declare-fun e!356636 () Bool)

(assert (=> b!621789 (=> (not res!400702) (not e!356636))))

(assert (=> b!621789 (= e!356630 e!356636)))

(declare-fun b!621790 () Bool)

(assert (=> b!621790 (= e!356636 (arrayContainsKey!0 lt!287854 (select (arr!18068 a!2986) j!136) index!984))))

(declare-fun b!621791 () Bool)

(declare-fun Unit!20815 () Unit!20808)

(assert (=> b!621791 (= e!356637 Unit!20815)))

(declare-fun b!621792 () Bool)

(declare-fun res!400698 () Bool)

(assert (=> b!621792 (=> (not res!400698) (not e!356639))))

(assert (=> b!621792 (= res!400698 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621793 () Bool)

(declare-fun Unit!20816 () Unit!20808)

(assert (=> b!621793 (= e!356640 Unit!20816)))

(declare-fun b!621794 () Bool)

(declare-fun res!400694 () Bool)

(assert (=> b!621794 (=> (not res!400694) (not e!356632))))

(assert (=> b!621794 (= res!400694 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12106))))

(declare-fun b!621795 () Bool)

(declare-fun res!400695 () Bool)

(assert (=> b!621795 (=> (not res!400695) (not e!356639))))

(assert (=> b!621795 (= res!400695 (validKeyInArray!0 k!1786))))

(declare-fun b!621796 () Bool)

(declare-fun e!356631 () Bool)

(assert (=> b!621796 (= e!356638 e!356631)))

(declare-fun res!400701 () Bool)

(assert (=> b!621796 (=> (not res!400701) (not e!356631))))

(assert (=> b!621796 (= res!400701 (and (= lt!287856 (Found!6508 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18068 a!2986) index!984) (select (arr!18068 a!2986) j!136))) (not (= (select (arr!18068 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37644 (_ BitVec 32)) SeekEntryResult!6508)

(assert (=> b!621796 (= lt!287856 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18068 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621797 () Bool)

(assert (=> b!621797 (= e!356631 (not true))))

(declare-fun lt!287848 () Unit!20808)

(assert (=> b!621797 (= lt!287848 e!356637)))

(declare-fun c!70912 () Bool)

(declare-fun lt!287850 () SeekEntryResult!6508)

(assert (=> b!621797 (= c!70912 (= lt!287850 (Found!6508 index!984)))))

(declare-fun lt!287851 () Unit!20808)

(assert (=> b!621797 (= lt!287851 e!356634)))

(declare-fun c!70910 () Bool)

(assert (=> b!621797 (= c!70910 (= lt!287850 Undefined!6508))))

(declare-fun lt!287852 () (_ BitVec 64))

(assert (=> b!621797 (= lt!287850 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287852 lt!287854 mask!3053))))

(assert (=> b!621797 e!356627))

(declare-fun res!400706 () Bool)

(assert (=> b!621797 (=> (not res!400706) (not e!356627))))

(declare-fun lt!287855 () (_ BitVec 32))

(assert (=> b!621797 (= res!400706 (= lt!287838 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287855 vacantSpotIndex!68 lt!287852 lt!287854 mask!3053)))))

(assert (=> b!621797 (= lt!287838 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287855 vacantSpotIndex!68 (select (arr!18068 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621797 (= lt!287852 (select (store (arr!18068 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287841 () Unit!20808)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37644 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20808)

(assert (=> b!621797 (= lt!287841 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287855 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621797 (= lt!287855 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621798 () Bool)

(assert (=> b!621798 false))

(declare-fun lt!287839 () Unit!20808)

(assert (=> b!621798 (= lt!287839 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287854 (select (arr!18068 a!2986) j!136) j!136 Nil!12106))))

(assert (=> b!621798 (arrayNoDuplicates!0 lt!287854 j!136 Nil!12106)))

(declare-fun lt!287844 () Unit!20808)

(assert (=> b!621798 (= lt!287844 (lemmaNoDuplicateFromThenFromBigger!0 lt!287854 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621798 (arrayNoDuplicates!0 lt!287854 #b00000000000000000000000000000000 Nil!12106)))

(declare-fun lt!287853 () Unit!20808)

(assert (=> b!621798 (= lt!287853 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12106))))

(assert (=> b!621798 (arrayContainsKey!0 lt!287854 (select (arr!18068 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287849 () Unit!20808)

(assert (=> b!621798 (= lt!287849 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287854 (select (arr!18068 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20817 () Unit!20808)

(assert (=> b!621798 (= e!356633 Unit!20817)))

(declare-fun res!400693 () Bool)

(assert (=> start!56174 (=> (not res!400693) (not e!356639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56174 (= res!400693 (validMask!0 mask!3053))))

(assert (=> start!56174 e!356639))

(assert (=> start!56174 true))

(declare-fun array_inv!13864 (array!37644) Bool)

(assert (=> start!56174 (array_inv!13864 a!2986)))

(declare-fun b!621799 () Bool)

(declare-fun res!400704 () Bool)

(assert (=> b!621799 (=> (not res!400704) (not e!356632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37644 (_ BitVec 32)) Bool)

(assert (=> b!621799 (= res!400704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621800 () Bool)

(assert (=> b!621800 (= e!356639 e!356632)))

(declare-fun res!400700 () Bool)

(assert (=> b!621800 (=> (not res!400700) (not e!356632))))

(declare-fun lt!287842 () SeekEntryResult!6508)

(assert (=> b!621800 (= res!400700 (or (= lt!287842 (MissingZero!6508 i!1108)) (= lt!287842 (MissingVacant!6508 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37644 (_ BitVec 32)) SeekEntryResult!6508)

(assert (=> b!621800 (= lt!287842 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56174 res!400693) b!621779))

(assert (= (and b!621779 res!400705) b!621780))

(assert (= (and b!621780 res!400703) b!621795))

(assert (= (and b!621795 res!400695) b!621792))

(assert (= (and b!621792 res!400698) b!621800))

(assert (= (and b!621800 res!400700) b!621799))

(assert (= (and b!621799 res!400704) b!621794))

(assert (= (and b!621794 res!400694) b!621784))

(assert (= (and b!621784 res!400692) b!621781))

(assert (= (and b!621781 res!400697) b!621796))

(assert (= (and b!621796 res!400701) b!621797))

(assert (= (and b!621797 res!400706) b!621777))

(assert (= (and b!621797 c!70910) b!621787))

(assert (= (and b!621797 (not c!70910)) b!621786))

(assert (= (and b!621797 c!70912) b!621788))

(assert (= (and b!621797 (not c!70912)) b!621791))

(assert (= (and b!621788 res!400691) b!621785))

(assert (= (and b!621785 (not res!400696)) b!621789))

(assert (= (and b!621789 res!400702) b!621790))

(assert (= (and b!621788 c!70913) b!621798))

(assert (= (and b!621788 (not c!70913)) b!621782))

(assert (= (and b!621788 c!70911) b!621778))

(assert (= (and b!621788 (not c!70911)) b!621793))

(assert (= (and b!621778 res!400699) b!621783))

(declare-fun m!597661 () Bool)

(assert (=> b!621789 m!597661))

(assert (=> b!621789 m!597661))

(declare-fun m!597663 () Bool)

(assert (=> b!621789 m!597663))

(declare-fun m!597665 () Bool)

(assert (=> b!621799 m!597665))

(declare-fun m!597667 () Bool)

(assert (=> b!621792 m!597667))

(declare-fun m!597669 () Bool)

(assert (=> b!621797 m!597669))

(assert (=> b!621797 m!597661))

(declare-fun m!597671 () Bool)

(assert (=> b!621797 m!597671))

(declare-fun m!597673 () Bool)

(assert (=> b!621797 m!597673))

(declare-fun m!597675 () Bool)

(assert (=> b!621797 m!597675))

(assert (=> b!621797 m!597661))

(declare-fun m!597677 () Bool)

(assert (=> b!621797 m!597677))

(declare-fun m!597679 () Bool)

(assert (=> b!621797 m!597679))

(declare-fun m!597681 () Bool)

(assert (=> b!621797 m!597681))

(declare-fun m!597683 () Bool)

(assert (=> b!621796 m!597683))

(assert (=> b!621796 m!597661))

(assert (=> b!621796 m!597661))

(declare-fun m!597685 () Bool)

(assert (=> b!621796 m!597685))

(declare-fun m!597687 () Bool)

(assert (=> b!621784 m!597687))

(declare-fun m!597689 () Bool)

(assert (=> b!621778 m!597689))

(assert (=> b!621778 m!597661))

(declare-fun m!597691 () Bool)

(assert (=> b!621778 m!597691))

(assert (=> b!621778 m!597661))

(assert (=> b!621778 m!597661))

(declare-fun m!597693 () Bool)

(assert (=> b!621778 m!597693))

(assert (=> b!621778 m!597661))

(declare-fun m!597695 () Bool)

(assert (=> b!621778 m!597695))

(declare-fun m!597697 () Bool)

(assert (=> b!621778 m!597697))

(declare-fun m!597699 () Bool)

(assert (=> b!621778 m!597699))

(assert (=> b!621778 m!597661))

(assert (=> b!621778 m!597663))

(declare-fun m!597701 () Bool)

(assert (=> b!621778 m!597701))

(assert (=> b!621780 m!597661))

(assert (=> b!621780 m!597661))

(declare-fun m!597703 () Bool)

(assert (=> b!621780 m!597703))

(assert (=> b!621783 m!597661))

(assert (=> b!621783 m!597661))

(declare-fun m!597705 () Bool)

(assert (=> b!621783 m!597705))

(assert (=> b!621798 m!597689))

(assert (=> b!621798 m!597661))

(declare-fun m!597707 () Bool)

(assert (=> b!621798 m!597707))

(assert (=> b!621798 m!597661))

(declare-fun m!597709 () Bool)

(assert (=> b!621798 m!597709))

(declare-fun m!597711 () Bool)

(assert (=> b!621798 m!597711))

(assert (=> b!621798 m!597661))

(declare-fun m!597713 () Bool)

(assert (=> b!621798 m!597713))

(assert (=> b!621798 m!597661))

(declare-fun m!597715 () Bool)

(assert (=> b!621798 m!597715))

(assert (=> b!621798 m!597701))

(declare-fun m!597717 () Bool)

(assert (=> start!56174 m!597717))

(declare-fun m!597719 () Bool)

(assert (=> start!56174 m!597719))

(assert (=> b!621781 m!597673))

(declare-fun m!597721 () Bool)

(assert (=> b!621781 m!597721))

(declare-fun m!597723 () Bool)

(assert (=> b!621800 m!597723))

(declare-fun m!597725 () Bool)

(assert (=> b!621795 m!597725))

(assert (=> b!621790 m!597661))

(assert (=> b!621790 m!597661))

(assert (=> b!621790 m!597705))

(assert (=> b!621788 m!597673))

(declare-fun m!597727 () Bool)

(assert (=> b!621788 m!597727))

(assert (=> b!621788 m!597661))

(declare-fun m!597729 () Bool)

(assert (=> b!621794 m!597729))

(push 1)

