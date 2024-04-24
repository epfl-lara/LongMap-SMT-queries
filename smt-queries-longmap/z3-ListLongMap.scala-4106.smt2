; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56184 () Bool)

(assert start!56184)

(declare-fun b!620546 () Bool)

(declare-fun res!399844 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620546 (= res!399844 (bvsge j!136 index!984))))

(declare-fun e!355920 () Bool)

(assert (=> b!620546 (=> res!399844 e!355920)))

(declare-fun e!355926 () Bool)

(assert (=> b!620546 (= e!355926 e!355920)))

(declare-fun b!620547 () Bool)

(declare-datatypes ((Unit!20587 0))(
  ( (Unit!20588) )
))
(declare-fun e!355927 () Unit!20587)

(declare-fun Unit!20589 () Unit!20587)

(assert (=> b!620547 (= e!355927 Unit!20589)))

(declare-fun b!620548 () Bool)

(declare-fun res!399838 () Bool)

(declare-fun e!355917 () Bool)

(assert (=> b!620548 (=> (not res!399838) (not e!355917))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37599 0))(
  ( (array!37600 (arr!18043 (Array (_ BitVec 32) (_ BitVec 64))) (size!18407 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37599)

(assert (=> b!620548 (= res!399838 (and (= (size!18407 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18407 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18407 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620549 () Bool)

(declare-fun e!355924 () Bool)

(assert (=> b!620549 (= e!355917 e!355924)))

(declare-fun res!399841 () Bool)

(assert (=> b!620549 (=> (not res!399841) (not e!355924))))

(declare-datatypes ((SeekEntryResult!6439 0))(
  ( (MissingZero!6439 (index!28040 (_ BitVec 32))) (Found!6439 (index!28041 (_ BitVec 32))) (Intermediate!6439 (undefined!7251 Bool) (index!28042 (_ BitVec 32)) (x!56970 (_ BitVec 32))) (Undefined!6439) (MissingVacant!6439 (index!28043 (_ BitVec 32))) )
))
(declare-fun lt!286759 () SeekEntryResult!6439)

(assert (=> b!620549 (= res!399841 (or (= lt!286759 (MissingZero!6439 i!1108)) (= lt!286759 (MissingVacant!6439 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37599 (_ BitVec 32)) SeekEntryResult!6439)

(assert (=> b!620549 (= lt!286759 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620550 () Bool)

(declare-fun res!399848 () Bool)

(assert (=> b!620550 (=> (not res!399848) (not e!355924))))

(declare-datatypes ((List!11991 0))(
  ( (Nil!11988) (Cons!11987 (h!13035 (_ BitVec 64)) (t!18211 List!11991)) )
))
(declare-fun arrayNoDuplicates!0 (array!37599 (_ BitVec 32) List!11991) Bool)

(assert (=> b!620550 (= res!399848 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11988))))

(declare-fun b!620551 () Bool)

(declare-fun e!355922 () Bool)

(assert (=> b!620551 (= e!355924 e!355922)))

(declare-fun res!399842 () Bool)

(assert (=> b!620551 (=> (not res!399842) (not e!355922))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!620551 (= res!399842 (= (select (store (arr!18043 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286753 () array!37599)

(assert (=> b!620551 (= lt!286753 (array!37600 (store (arr!18043 a!2986) i!1108 k0!1786) (size!18407 a!2986)))))

(declare-fun lt!286754 () SeekEntryResult!6439)

(declare-fun b!620552 () Bool)

(declare-fun e!355916 () Bool)

(assert (=> b!620552 (= e!355916 (not (or (= lt!286754 (MissingVacant!6439 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!286756 () Unit!20587)

(declare-fun e!355921 () Unit!20587)

(assert (=> b!620552 (= lt!286756 e!355921)))

(declare-fun c!70726 () Bool)

(assert (=> b!620552 (= c!70726 (= lt!286754 (Found!6439 index!984)))))

(declare-fun lt!286741 () Unit!20587)

(declare-fun e!355923 () Unit!20587)

(assert (=> b!620552 (= lt!286741 e!355923)))

(declare-fun c!70725 () Bool)

(assert (=> b!620552 (= c!70725 (= lt!286754 Undefined!6439))))

(declare-fun lt!286744 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37599 (_ BitVec 32)) SeekEntryResult!6439)

(assert (=> b!620552 (= lt!286754 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286744 lt!286753 mask!3053))))

(declare-fun e!355929 () Bool)

(assert (=> b!620552 e!355929))

(declare-fun res!399835 () Bool)

(assert (=> b!620552 (=> (not res!399835) (not e!355929))))

(declare-fun lt!286745 () SeekEntryResult!6439)

(declare-fun lt!286749 () (_ BitVec 32))

(assert (=> b!620552 (= res!399835 (= lt!286745 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286749 vacantSpotIndex!68 lt!286744 lt!286753 mask!3053)))))

(assert (=> b!620552 (= lt!286745 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286749 vacantSpotIndex!68 (select (arr!18043 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620552 (= lt!286744 (select (store (arr!18043 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286748 () Unit!20587)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37599 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20587)

(assert (=> b!620552 (= lt!286748 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286749 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620552 (= lt!286749 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!620554 () Bool)

(declare-fun e!355928 () Unit!20587)

(declare-fun Unit!20590 () Unit!20587)

(assert (=> b!620554 (= e!355928 Unit!20590)))

(declare-fun b!620555 () Bool)

(declare-fun Unit!20591 () Unit!20587)

(assert (=> b!620555 (= e!355923 Unit!20591)))

(declare-fun b!620556 () Bool)

(declare-fun res!399840 () Bool)

(assert (=> b!620556 (=> (not res!399840) (not e!355924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37599 (_ BitVec 32)) Bool)

(assert (=> b!620556 (= res!399840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620557 () Bool)

(declare-fun res!399839 () Bool)

(assert (=> b!620557 (=> (not res!399839) (not e!355917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620557 (= res!399839 (validKeyInArray!0 (select (arr!18043 a!2986) j!136)))))

(declare-fun b!620558 () Bool)

(declare-fun e!355919 () Bool)

(declare-fun arrayContainsKey!0 (array!37599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620558 (= e!355919 (arrayContainsKey!0 lt!286753 (select (arr!18043 a!2986) j!136) index!984))))

(declare-fun b!620559 () Bool)

(declare-fun res!399847 () Bool)

(assert (=> b!620559 (= res!399847 (arrayContainsKey!0 lt!286753 (select (arr!18043 a!2986) j!136) j!136))))

(declare-fun e!355925 () Bool)

(assert (=> b!620559 (=> (not res!399847) (not e!355925))))

(assert (=> b!620559 (= e!355920 e!355925)))

(declare-fun b!620560 () Bool)

(declare-fun Unit!20592 () Unit!20587)

(assert (=> b!620560 (= e!355921 Unit!20592)))

(declare-fun res!399845 () Bool)

(assert (=> b!620560 (= res!399845 (= (select (store (arr!18043 a!2986) i!1108 k0!1786) index!984) (select (arr!18043 a!2986) j!136)))))

(assert (=> b!620560 (=> (not res!399845) (not e!355926))))

(assert (=> b!620560 e!355926))

(declare-fun c!70727 () Bool)

(assert (=> b!620560 (= c!70727 (bvslt j!136 index!984))))

(declare-fun lt!286746 () Unit!20587)

(assert (=> b!620560 (= lt!286746 e!355928)))

(declare-fun c!70724 () Bool)

(assert (=> b!620560 (= c!70724 (bvslt index!984 j!136))))

(declare-fun lt!286752 () Unit!20587)

(assert (=> b!620560 (= lt!286752 e!355927)))

(assert (=> b!620560 false))

(declare-fun b!620561 () Bool)

(declare-fun res!399843 () Bool)

(assert (=> b!620561 (=> (not res!399843) (not e!355917))))

(assert (=> b!620561 (= res!399843 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620562 () Bool)

(declare-fun lt!286751 () SeekEntryResult!6439)

(assert (=> b!620562 (= e!355929 (= lt!286751 lt!286745))))

(declare-fun b!620563 () Bool)

(declare-fun Unit!20593 () Unit!20587)

(assert (=> b!620563 (= e!355921 Unit!20593)))

(declare-fun b!620564 () Bool)

(assert (=> b!620564 (= e!355922 e!355916)))

(declare-fun res!399836 () Bool)

(assert (=> b!620564 (=> (not res!399836) (not e!355916))))

(assert (=> b!620564 (= res!399836 (and (= lt!286751 (Found!6439 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18043 a!2986) index!984) (select (arr!18043 a!2986) j!136))) (not (= (select (arr!18043 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620564 (= lt!286751 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18043 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620565 () Bool)

(declare-fun res!399850 () Bool)

(assert (=> b!620565 (=> (not res!399850) (not e!355917))))

(assert (=> b!620565 (= res!399850 (validKeyInArray!0 k0!1786))))

(declare-fun b!620566 () Bool)

(declare-fun res!399846 () Bool)

(assert (=> b!620566 (=> (not res!399846) (not e!355924))))

(assert (=> b!620566 (= res!399846 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18043 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620567 () Bool)

(assert (=> b!620567 false))

(declare-fun lt!286750 () Unit!20587)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37599 (_ BitVec 64) (_ BitVec 32) List!11991) Unit!20587)

(assert (=> b!620567 (= lt!286750 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286753 (select (arr!18043 a!2986) j!136) j!136 Nil!11988))))

(assert (=> b!620567 (arrayNoDuplicates!0 lt!286753 j!136 Nil!11988)))

(declare-fun lt!286747 () Unit!20587)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37599 (_ BitVec 32) (_ BitVec 32)) Unit!20587)

(assert (=> b!620567 (= lt!286747 (lemmaNoDuplicateFromThenFromBigger!0 lt!286753 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620567 (arrayNoDuplicates!0 lt!286753 #b00000000000000000000000000000000 Nil!11988)))

(declare-fun lt!286742 () Unit!20587)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11991) Unit!20587)

(assert (=> b!620567 (= lt!286742 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11988))))

(assert (=> b!620567 (arrayContainsKey!0 lt!286753 (select (arr!18043 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286755 () Unit!20587)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20587)

(assert (=> b!620567 (= lt!286755 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286753 (select (arr!18043 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20594 () Unit!20587)

(assert (=> b!620567 (= e!355928 Unit!20594)))

(declare-fun b!620568 () Bool)

(assert (=> b!620568 false))

(declare-fun lt!286740 () Unit!20587)

(assert (=> b!620568 (= lt!286740 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286753 (select (arr!18043 a!2986) j!136) index!984 Nil!11988))))

(assert (=> b!620568 (arrayNoDuplicates!0 lt!286753 index!984 Nil!11988)))

(declare-fun lt!286757 () Unit!20587)

(assert (=> b!620568 (= lt!286757 (lemmaNoDuplicateFromThenFromBigger!0 lt!286753 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620568 (arrayNoDuplicates!0 lt!286753 #b00000000000000000000000000000000 Nil!11988)))

(declare-fun lt!286758 () Unit!20587)

(assert (=> b!620568 (= lt!286758 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11988))))

(assert (=> b!620568 (arrayContainsKey!0 lt!286753 (select (arr!18043 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286743 () Unit!20587)

(assert (=> b!620568 (= lt!286743 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286753 (select (arr!18043 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620568 e!355919))

(declare-fun res!399837 () Bool)

(assert (=> b!620568 (=> (not res!399837) (not e!355919))))

(assert (=> b!620568 (= res!399837 (arrayContainsKey!0 lt!286753 (select (arr!18043 a!2986) j!136) j!136))))

(declare-fun Unit!20595 () Unit!20587)

(assert (=> b!620568 (= e!355927 Unit!20595)))

(declare-fun b!620569 () Bool)

(declare-fun Unit!20596 () Unit!20587)

(assert (=> b!620569 (= e!355923 Unit!20596)))

(assert (=> b!620569 false))

(declare-fun b!620553 () Bool)

(assert (=> b!620553 (= e!355925 (arrayContainsKey!0 lt!286753 (select (arr!18043 a!2986) j!136) index!984))))

(declare-fun res!399849 () Bool)

(assert (=> start!56184 (=> (not res!399849) (not e!355917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56184 (= res!399849 (validMask!0 mask!3053))))

(assert (=> start!56184 e!355917))

(assert (=> start!56184 true))

(declare-fun array_inv!13902 (array!37599) Bool)

(assert (=> start!56184 (array_inv!13902 a!2986)))

(assert (= (and start!56184 res!399849) b!620548))

(assert (= (and b!620548 res!399838) b!620557))

(assert (= (and b!620557 res!399839) b!620565))

(assert (= (and b!620565 res!399850) b!620561))

(assert (= (and b!620561 res!399843) b!620549))

(assert (= (and b!620549 res!399841) b!620556))

(assert (= (and b!620556 res!399840) b!620550))

(assert (= (and b!620550 res!399848) b!620566))

(assert (= (and b!620566 res!399846) b!620551))

(assert (= (and b!620551 res!399842) b!620564))

(assert (= (and b!620564 res!399836) b!620552))

(assert (= (and b!620552 res!399835) b!620562))

(assert (= (and b!620552 c!70725) b!620569))

(assert (= (and b!620552 (not c!70725)) b!620555))

(assert (= (and b!620552 c!70726) b!620560))

(assert (= (and b!620552 (not c!70726)) b!620563))

(assert (= (and b!620560 res!399845) b!620546))

(assert (= (and b!620546 (not res!399844)) b!620559))

(assert (= (and b!620559 res!399847) b!620553))

(assert (= (and b!620560 c!70727) b!620567))

(assert (= (and b!620560 (not c!70727)) b!620554))

(assert (= (and b!620560 c!70724) b!620568))

(assert (= (and b!620560 (not c!70724)) b!620547))

(assert (= (and b!620568 res!399837) b!620558))

(declare-fun m!596747 () Bool)

(assert (=> b!620551 m!596747))

(declare-fun m!596749 () Bool)

(assert (=> b!620551 m!596749))

(declare-fun m!596751 () Bool)

(assert (=> b!620566 m!596751))

(declare-fun m!596753 () Bool)

(assert (=> b!620553 m!596753))

(assert (=> b!620553 m!596753))

(declare-fun m!596755 () Bool)

(assert (=> b!620553 m!596755))

(assert (=> b!620558 m!596753))

(assert (=> b!620558 m!596753))

(assert (=> b!620558 m!596755))

(declare-fun m!596757 () Bool)

(assert (=> b!620561 m!596757))

(declare-fun m!596759 () Bool)

(assert (=> b!620567 m!596759))

(assert (=> b!620567 m!596753))

(assert (=> b!620567 m!596753))

(declare-fun m!596761 () Bool)

(assert (=> b!620567 m!596761))

(declare-fun m!596763 () Bool)

(assert (=> b!620567 m!596763))

(declare-fun m!596765 () Bool)

(assert (=> b!620567 m!596765))

(assert (=> b!620567 m!596753))

(declare-fun m!596767 () Bool)

(assert (=> b!620567 m!596767))

(assert (=> b!620567 m!596753))

(declare-fun m!596769 () Bool)

(assert (=> b!620567 m!596769))

(declare-fun m!596771 () Bool)

(assert (=> b!620567 m!596771))

(declare-fun m!596773 () Bool)

(assert (=> b!620564 m!596773))

(assert (=> b!620564 m!596753))

(assert (=> b!620564 m!596753))

(declare-fun m!596775 () Bool)

(assert (=> b!620564 m!596775))

(declare-fun m!596777 () Bool)

(assert (=> b!620550 m!596777))

(declare-fun m!596779 () Bool)

(assert (=> start!56184 m!596779))

(declare-fun m!596781 () Bool)

(assert (=> start!56184 m!596781))

(declare-fun m!596783 () Bool)

(assert (=> b!620549 m!596783))

(declare-fun m!596785 () Bool)

(assert (=> b!620565 m!596785))

(assert (=> b!620557 m!596753))

(assert (=> b!620557 m!596753))

(declare-fun m!596787 () Bool)

(assert (=> b!620557 m!596787))

(assert (=> b!620560 m!596747))

(declare-fun m!596789 () Bool)

(assert (=> b!620560 m!596789))

(assert (=> b!620560 m!596753))

(assert (=> b!620568 m!596753))

(declare-fun m!596791 () Bool)

(assert (=> b!620568 m!596791))

(assert (=> b!620568 m!596753))

(declare-fun m!596793 () Bool)

(assert (=> b!620568 m!596793))

(assert (=> b!620568 m!596759))

(assert (=> b!620568 m!596753))

(assert (=> b!620568 m!596753))

(declare-fun m!596795 () Bool)

(assert (=> b!620568 m!596795))

(declare-fun m!596797 () Bool)

(assert (=> b!620568 m!596797))

(declare-fun m!596799 () Bool)

(assert (=> b!620568 m!596799))

(assert (=> b!620568 m!596753))

(declare-fun m!596801 () Bool)

(assert (=> b!620568 m!596801))

(assert (=> b!620568 m!596771))

(declare-fun m!596803 () Bool)

(assert (=> b!620556 m!596803))

(assert (=> b!620559 m!596753))

(assert (=> b!620559 m!596753))

(assert (=> b!620559 m!596801))

(declare-fun m!596805 () Bool)

(assert (=> b!620552 m!596805))

(declare-fun m!596807 () Bool)

(assert (=> b!620552 m!596807))

(declare-fun m!596809 () Bool)

(assert (=> b!620552 m!596809))

(assert (=> b!620552 m!596747))

(declare-fun m!596811 () Bool)

(assert (=> b!620552 m!596811))

(assert (=> b!620552 m!596753))

(declare-fun m!596813 () Bool)

(assert (=> b!620552 m!596813))

(declare-fun m!596815 () Bool)

(assert (=> b!620552 m!596815))

(assert (=> b!620552 m!596753))

(check-sat (not b!620550) (not b!620553) (not b!620558) (not b!620552) (not b!620557) (not b!620549) (not b!620567) (not b!620556) (not b!620564) (not b!620565) (not b!620568) (not start!56184) (not b!620559) (not b!620561))
(check-sat)
