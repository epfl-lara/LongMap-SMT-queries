; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55896 () Bool)

(assert start!55896)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37380 0))(
  ( (array!37381 (arr!17936 (Array (_ BitVec 32) (_ BitVec 64))) (size!18301 (_ BitVec 32))) )
))
(declare-fun lt!279916 () array!37380)

(declare-fun b!611784 () Bool)

(declare-fun e!350620 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37380)

(declare-fun arrayContainsKey!0 (array!37380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611784 (= e!350620 (arrayContainsKey!0 lt!279916 (select (arr!17936 a!2986) j!136) index!984))))

(declare-fun b!611785 () Bool)

(declare-fun res!393562 () Bool)

(declare-fun e!350611 () Bool)

(assert (=> b!611785 (=> (not res!393562) (not e!350611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611785 (= res!393562 (validKeyInArray!0 (select (arr!17936 a!2986) j!136)))))

(declare-fun res!393572 () Bool)

(assert (=> start!55896 (=> (not res!393572) (not e!350611))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55896 (= res!393572 (validMask!0 mask!3053))))

(assert (=> start!55896 e!350611))

(assert (=> start!55896 true))

(declare-fun array_inv!13819 (array!37380) Bool)

(assert (=> start!55896 (array_inv!13819 a!2986)))

(declare-fun b!611786 () Bool)

(declare-fun res!393561 () Bool)

(assert (=> b!611786 (=> (not res!393561) (not e!350611))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!611786 (= res!393561 (validKeyInArray!0 k0!1786))))

(declare-fun b!611787 () Bool)

(declare-fun e!350621 () Bool)

(declare-datatypes ((SeekEntryResult!6373 0))(
  ( (MissingZero!6373 (index!27776 (_ BitVec 32))) (Found!6373 (index!27777 (_ BitVec 32))) (Intermediate!6373 (undefined!7185 Bool) (index!27778 (_ BitVec 32)) (x!56600 (_ BitVec 32))) (Undefined!6373) (MissingVacant!6373 (index!27779 (_ BitVec 32))) )
))
(declare-fun lt!279907 () SeekEntryResult!6373)

(declare-fun lt!279915 () SeekEntryResult!6373)

(assert (=> b!611787 (= e!350621 (= lt!279907 lt!279915))))

(declare-fun b!611788 () Bool)

(declare-fun e!350619 () Bool)

(assert (=> b!611788 (= e!350611 e!350619)))

(declare-fun res!393565 () Bool)

(assert (=> b!611788 (=> (not res!393565) (not e!350619))))

(declare-fun lt!279902 () SeekEntryResult!6373)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!611788 (= res!393565 (or (= lt!279902 (MissingZero!6373 i!1108)) (= lt!279902 (MissingVacant!6373 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37380 (_ BitVec 32)) SeekEntryResult!6373)

(assert (=> b!611788 (= lt!279902 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611789 () Bool)

(declare-fun e!350616 () Bool)

(declare-fun e!350624 () Bool)

(assert (=> b!611789 (= e!350616 e!350624)))

(declare-fun res!393576 () Bool)

(assert (=> b!611789 (=> res!393576 e!350624)))

(declare-fun lt!279911 () (_ BitVec 64))

(declare-fun lt!279912 () (_ BitVec 64))

(assert (=> b!611789 (= res!393576 (or (not (= (select (arr!17936 a!2986) j!136) lt!279912)) (not (= (select (arr!17936 a!2986) j!136) lt!279911)) (bvsge j!136 index!984)))))

(declare-fun e!350625 () Bool)

(declare-fun b!611790 () Bool)

(assert (=> b!611790 (= e!350625 (arrayContainsKey!0 lt!279916 (select (arr!17936 a!2986) j!136) index!984))))

(declare-fun b!611791 () Bool)

(declare-fun res!393569 () Bool)

(assert (=> b!611791 (=> (not res!393569) (not e!350611))))

(assert (=> b!611791 (= res!393569 (and (= (size!18301 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18301 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18301 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611792 () Bool)

(declare-fun res!393570 () Bool)

(assert (=> b!611792 (=> (not res!393570) (not e!350619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37380 (_ BitVec 32)) Bool)

(assert (=> b!611792 (= res!393570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611793 () Bool)

(declare-fun e!350613 () Bool)

(assert (=> b!611793 (= e!350613 true)))

(declare-datatypes ((List!12016 0))(
  ( (Nil!12013) (Cons!12012 (h!13057 (_ BitVec 64)) (t!18235 List!12016)) )
))
(declare-fun arrayNoDuplicates!0 (array!37380 (_ BitVec 32) List!12016) Bool)

(assert (=> b!611793 (arrayNoDuplicates!0 lt!279916 #b00000000000000000000000000000000 Nil!12013)))

(declare-datatypes ((Unit!19620 0))(
  ( (Unit!19621) )
))
(declare-fun lt!279913 () Unit!19620)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12016) Unit!19620)

(assert (=> b!611793 (= lt!279913 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12013))))

(assert (=> b!611793 (arrayContainsKey!0 lt!279916 (select (arr!17936 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279900 () Unit!19620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19620)

(assert (=> b!611793 (= lt!279900 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279916 (select (arr!17936 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!611793 e!350620))

(declare-fun res!393568 () Bool)

(assert (=> b!611793 (=> (not res!393568) (not e!350620))))

(assert (=> b!611793 (= res!393568 (arrayContainsKey!0 lt!279916 (select (arr!17936 a!2986) j!136) j!136))))

(declare-fun b!611794 () Bool)

(assert (=> b!611794 (= e!350624 e!350625)))

(declare-fun res!393567 () Bool)

(assert (=> b!611794 (=> (not res!393567) (not e!350625))))

(assert (=> b!611794 (= res!393567 (arrayContainsKey!0 lt!279916 (select (arr!17936 a!2986) j!136) j!136))))

(declare-fun b!611795 () Bool)

(declare-fun e!350612 () Unit!19620)

(declare-fun Unit!19622 () Unit!19620)

(assert (=> b!611795 (= e!350612 Unit!19622)))

(declare-fun lt!279908 () Unit!19620)

(assert (=> b!611795 (= lt!279908 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279916 (select (arr!17936 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611795 (arrayContainsKey!0 lt!279916 (select (arr!17936 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279914 () Unit!19620)

(assert (=> b!611795 (= lt!279914 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12013))))

(assert (=> b!611795 (arrayNoDuplicates!0 lt!279916 #b00000000000000000000000000000000 Nil!12013)))

(declare-fun lt!279909 () Unit!19620)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37380 (_ BitVec 32) (_ BitVec 32)) Unit!19620)

(assert (=> b!611795 (= lt!279909 (lemmaNoDuplicateFromThenFromBigger!0 lt!279916 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611795 (arrayNoDuplicates!0 lt!279916 j!136 Nil!12013)))

(declare-fun lt!279906 () Unit!19620)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37380 (_ BitVec 64) (_ BitVec 32) List!12016) Unit!19620)

(assert (=> b!611795 (= lt!279906 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279916 (select (arr!17936 a!2986) j!136) j!136 Nil!12013))))

(assert (=> b!611795 false))

(declare-fun b!611796 () Bool)

(declare-fun e!350617 () Unit!19620)

(declare-fun Unit!19623 () Unit!19620)

(assert (=> b!611796 (= e!350617 Unit!19623)))

(assert (=> b!611796 false))

(declare-fun b!611797 () Bool)

(declare-fun e!350615 () Bool)

(assert (=> b!611797 (= e!350619 e!350615)))

(declare-fun res!393573 () Bool)

(assert (=> b!611797 (=> (not res!393573) (not e!350615))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!611797 (= res!393573 (= (select (store (arr!17936 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611797 (= lt!279916 (array!37381 (store (arr!17936 a!2986) i!1108 k0!1786) (size!18301 a!2986)))))

(declare-fun b!611798 () Bool)

(declare-fun e!350623 () Bool)

(assert (=> b!611798 (= e!350615 e!350623)))

(declare-fun res!393563 () Bool)

(assert (=> b!611798 (=> (not res!393563) (not e!350623))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!611798 (= res!393563 (and (= lt!279907 (Found!6373 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17936 a!2986) index!984) (select (arr!17936 a!2986) j!136))) (not (= (select (arr!17936 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37380 (_ BitVec 32)) SeekEntryResult!6373)

(assert (=> b!611798 (= lt!279907 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17936 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611799 () Bool)

(declare-fun e!350622 () Bool)

(declare-fun e!350618 () Bool)

(assert (=> b!611799 (= e!350622 e!350618)))

(declare-fun res!393564 () Bool)

(assert (=> b!611799 (=> res!393564 e!350618)))

(assert (=> b!611799 (= res!393564 (or (not (= (select (arr!17936 a!2986) j!136) lt!279912)) (not (= (select (arr!17936 a!2986) j!136) lt!279911))))))

(assert (=> b!611799 e!350616))

(declare-fun res!393571 () Bool)

(assert (=> b!611799 (=> (not res!393571) (not e!350616))))

(assert (=> b!611799 (= res!393571 (= lt!279911 (select (arr!17936 a!2986) j!136)))))

(assert (=> b!611799 (= lt!279911 (select (store (arr!17936 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!611800 () Bool)

(declare-fun Unit!19624 () Unit!19620)

(assert (=> b!611800 (= e!350617 Unit!19624)))

(declare-fun b!611801 () Bool)

(declare-fun Unit!19625 () Unit!19620)

(assert (=> b!611801 (= e!350612 Unit!19625)))

(declare-fun b!611802 () Bool)

(assert (=> b!611802 (= e!350618 e!350613)))

(declare-fun res!393577 () Bool)

(assert (=> b!611802 (=> res!393577 e!350613)))

(assert (=> b!611802 (= res!393577 (bvsge index!984 j!136))))

(declare-fun lt!279903 () Unit!19620)

(assert (=> b!611802 (= lt!279903 e!350612)))

(declare-fun c!69479 () Bool)

(assert (=> b!611802 (= c!69479 (bvslt j!136 index!984))))

(declare-fun b!611803 () Bool)

(declare-fun res!393574 () Bool)

(assert (=> b!611803 (=> (not res!393574) (not e!350619))))

(assert (=> b!611803 (= res!393574 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17936 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611804 () Bool)

(declare-fun res!393566 () Bool)

(assert (=> b!611804 (=> (not res!393566) (not e!350611))))

(assert (=> b!611804 (= res!393566 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611805 () Bool)

(declare-fun res!393578 () Bool)

(assert (=> b!611805 (=> (not res!393578) (not e!350619))))

(assert (=> b!611805 (= res!393578 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12013))))

(declare-fun b!611806 () Bool)

(assert (=> b!611806 (= e!350623 (not e!350622))))

(declare-fun res!393560 () Bool)

(assert (=> b!611806 (=> res!393560 e!350622)))

(declare-fun lt!279905 () SeekEntryResult!6373)

(assert (=> b!611806 (= res!393560 (not (= lt!279905 (Found!6373 index!984))))))

(declare-fun lt!279901 () Unit!19620)

(assert (=> b!611806 (= lt!279901 e!350617)))

(declare-fun c!69480 () Bool)

(assert (=> b!611806 (= c!69480 (= lt!279905 Undefined!6373))))

(assert (=> b!611806 (= lt!279905 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279912 lt!279916 mask!3053))))

(assert (=> b!611806 e!350621))

(declare-fun res!393575 () Bool)

(assert (=> b!611806 (=> (not res!393575) (not e!350621))))

(declare-fun lt!279910 () (_ BitVec 32))

(assert (=> b!611806 (= res!393575 (= lt!279915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279910 vacantSpotIndex!68 lt!279912 lt!279916 mask!3053)))))

(assert (=> b!611806 (= lt!279915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279910 vacantSpotIndex!68 (select (arr!17936 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611806 (= lt!279912 (select (store (arr!17936 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279904 () Unit!19620)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37380 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19620)

(assert (=> b!611806 (= lt!279904 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279910 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611806 (= lt!279910 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55896 res!393572) b!611791))

(assert (= (and b!611791 res!393569) b!611785))

(assert (= (and b!611785 res!393562) b!611786))

(assert (= (and b!611786 res!393561) b!611804))

(assert (= (and b!611804 res!393566) b!611788))

(assert (= (and b!611788 res!393565) b!611792))

(assert (= (and b!611792 res!393570) b!611805))

(assert (= (and b!611805 res!393578) b!611803))

(assert (= (and b!611803 res!393574) b!611797))

(assert (= (and b!611797 res!393573) b!611798))

(assert (= (and b!611798 res!393563) b!611806))

(assert (= (and b!611806 res!393575) b!611787))

(assert (= (and b!611806 c!69480) b!611796))

(assert (= (and b!611806 (not c!69480)) b!611800))

(assert (= (and b!611806 (not res!393560)) b!611799))

(assert (= (and b!611799 res!393571) b!611789))

(assert (= (and b!611789 (not res!393576)) b!611794))

(assert (= (and b!611794 res!393567) b!611790))

(assert (= (and b!611799 (not res!393564)) b!611802))

(assert (= (and b!611802 c!69479) b!611795))

(assert (= (and b!611802 (not c!69479)) b!611801))

(assert (= (and b!611802 (not res!393577)) b!611793))

(assert (= (and b!611793 res!393568) b!611784))

(declare-fun m!587659 () Bool)

(assert (=> b!611797 m!587659))

(declare-fun m!587661 () Bool)

(assert (=> b!611797 m!587661))

(declare-fun m!587663 () Bool)

(assert (=> b!611792 m!587663))

(declare-fun m!587665 () Bool)

(assert (=> b!611795 m!587665))

(declare-fun m!587667 () Bool)

(assert (=> b!611795 m!587667))

(assert (=> b!611795 m!587665))

(declare-fun m!587669 () Bool)

(assert (=> b!611795 m!587669))

(assert (=> b!611795 m!587665))

(assert (=> b!611795 m!587665))

(declare-fun m!587671 () Bool)

(assert (=> b!611795 m!587671))

(declare-fun m!587673 () Bool)

(assert (=> b!611795 m!587673))

(declare-fun m!587675 () Bool)

(assert (=> b!611795 m!587675))

(declare-fun m!587677 () Bool)

(assert (=> b!611795 m!587677))

(declare-fun m!587679 () Bool)

(assert (=> b!611795 m!587679))

(declare-fun m!587681 () Bool)

(assert (=> b!611788 m!587681))

(assert (=> b!611793 m!587665))

(assert (=> b!611793 m!587665))

(declare-fun m!587683 () Bool)

(assert (=> b!611793 m!587683))

(assert (=> b!611793 m!587665))

(declare-fun m!587685 () Bool)

(assert (=> b!611793 m!587685))

(assert (=> b!611793 m!587665))

(declare-fun m!587687 () Bool)

(assert (=> b!611793 m!587687))

(assert (=> b!611793 m!587677))

(assert (=> b!611793 m!587679))

(declare-fun m!587689 () Bool)

(assert (=> b!611804 m!587689))

(assert (=> b!611784 m!587665))

(assert (=> b!611784 m!587665))

(declare-fun m!587691 () Bool)

(assert (=> b!611784 m!587691))

(declare-fun m!587693 () Bool)

(assert (=> b!611786 m!587693))

(assert (=> b!611799 m!587665))

(assert (=> b!611799 m!587659))

(declare-fun m!587695 () Bool)

(assert (=> b!611799 m!587695))

(assert (=> b!611790 m!587665))

(assert (=> b!611790 m!587665))

(assert (=> b!611790 m!587691))

(assert (=> b!611785 m!587665))

(assert (=> b!611785 m!587665))

(declare-fun m!587697 () Bool)

(assert (=> b!611785 m!587697))

(declare-fun m!587699 () Bool)

(assert (=> start!55896 m!587699))

(declare-fun m!587701 () Bool)

(assert (=> start!55896 m!587701))

(declare-fun m!587703 () Bool)

(assert (=> b!611798 m!587703))

(assert (=> b!611798 m!587665))

(assert (=> b!611798 m!587665))

(declare-fun m!587705 () Bool)

(assert (=> b!611798 m!587705))

(declare-fun m!587707 () Bool)

(assert (=> b!611803 m!587707))

(declare-fun m!587709 () Bool)

(assert (=> b!611805 m!587709))

(assert (=> b!611794 m!587665))

(assert (=> b!611794 m!587665))

(assert (=> b!611794 m!587683))

(declare-fun m!587711 () Bool)

(assert (=> b!611806 m!587711))

(declare-fun m!587713 () Bool)

(assert (=> b!611806 m!587713))

(assert (=> b!611806 m!587665))

(assert (=> b!611806 m!587659))

(declare-fun m!587715 () Bool)

(assert (=> b!611806 m!587715))

(declare-fun m!587717 () Bool)

(assert (=> b!611806 m!587717))

(assert (=> b!611806 m!587665))

(declare-fun m!587719 () Bool)

(assert (=> b!611806 m!587719))

(declare-fun m!587721 () Bool)

(assert (=> b!611806 m!587721))

(assert (=> b!611789 m!587665))

(check-sat (not b!611785) (not b!611792) (not b!611805) (not b!611795) (not b!611786) (not b!611790) (not start!55896) (not b!611788) (not b!611793) (not b!611806) (not b!611784) (not b!611794) (not b!611804) (not b!611798))
(check-sat)
