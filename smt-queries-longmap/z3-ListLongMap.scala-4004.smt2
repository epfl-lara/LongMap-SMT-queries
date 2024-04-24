; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54546 () Bool)

(assert start!54546)

(declare-fun res!380559 () Bool)

(declare-fun e!339797 () Bool)

(assert (=> start!54546 (=> (not res!380559) (not e!339797))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54546 (= res!380559 (validMask!0 mask!3053))))

(assert (=> start!54546 e!339797))

(assert (=> start!54546 true))

(declare-datatypes ((array!36951 0))(
  ( (array!36952 (arr!17737 (Array (_ BitVec 32) (_ BitVec 64))) (size!18101 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36951)

(declare-fun array_inv!13596 (array!36951) Bool)

(assert (=> start!54546 (array_inv!13596 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!269979 () array!36951)

(declare-fun b!594690 () Bool)

(declare-fun e!339792 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594690 (= e!339792 (arrayContainsKey!0 lt!269979 (select (arr!17737 a!2986) j!136) index!984))))

(declare-fun b!594691 () Bool)

(declare-fun e!339800 () Bool)

(declare-fun e!339798 () Bool)

(assert (=> b!594691 (= e!339800 e!339798)))

(declare-fun res!380562 () Bool)

(assert (=> b!594691 (=> res!380562 e!339798)))

(declare-fun lt!269973 () (_ BitVec 64))

(declare-fun lt!269974 () (_ BitVec 64))

(assert (=> b!594691 (= res!380562 (or (not (= (select (arr!17737 a!2986) j!136) lt!269973)) (not (= (select (arr!17737 a!2986) j!136) lt!269974)) (bvsge j!136 index!984)))))

(declare-fun b!594692 () Bool)

(declare-fun e!339791 () Bool)

(declare-fun e!339796 () Bool)

(assert (=> b!594692 (= e!339791 e!339796)))

(declare-fun res!380551 () Bool)

(assert (=> b!594692 (=> res!380551 e!339796)))

(assert (=> b!594692 (= res!380551 (or (bvsge (size!18101 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18101 a!2986))))))

(assert (=> b!594692 (arrayContainsKey!0 lt!269979 (select (arr!17737 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18625 0))(
  ( (Unit!18626) )
))
(declare-fun lt!269975 () Unit!18625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36951 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18625)

(assert (=> b!594692 (= lt!269975 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269979 (select (arr!17737 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594693 () Bool)

(declare-fun e!339790 () Bool)

(assert (=> b!594693 (= e!339790 e!339791)))

(declare-fun res!380552 () Bool)

(assert (=> b!594693 (=> res!380552 e!339791)))

(assert (=> b!594693 (= res!380552 (or (not (= (select (arr!17737 a!2986) j!136) lt!269973)) (not (= (select (arr!17737 a!2986) j!136) lt!269974)) (bvsge j!136 index!984)))))

(assert (=> b!594693 e!339800))

(declare-fun res!380547 () Bool)

(assert (=> b!594693 (=> (not res!380547) (not e!339800))))

(assert (=> b!594693 (= res!380547 (= lt!269974 (select (arr!17737 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!594693 (= lt!269974 (select (store (arr!17737 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594694 () Bool)

(assert (=> b!594694 (= e!339798 e!339792)))

(declare-fun res!380548 () Bool)

(assert (=> b!594694 (=> (not res!380548) (not e!339792))))

(assert (=> b!594694 (= res!380548 (arrayContainsKey!0 lt!269979 (select (arr!17737 a!2986) j!136) j!136))))

(declare-fun b!594695 () Bool)

(declare-fun res!380558 () Bool)

(assert (=> b!594695 (=> (not res!380558) (not e!339797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594695 (= res!380558 (validKeyInArray!0 (select (arr!17737 a!2986) j!136)))))

(declare-fun b!594696 () Bool)

(declare-fun res!380545 () Bool)

(assert (=> b!594696 (=> res!380545 e!339796)))

(declare-datatypes ((List!11685 0))(
  ( (Nil!11682) (Cons!11681 (h!12729 (_ BitVec 64)) (t!17905 List!11685)) )
))
(declare-fun contains!2894 (List!11685 (_ BitVec 64)) Bool)

(assert (=> b!594696 (= res!380545 (contains!2894 Nil!11682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594697 () Bool)

(declare-fun e!339789 () Bool)

(declare-datatypes ((SeekEntryResult!6133 0))(
  ( (MissingZero!6133 (index!26780 (_ BitVec 32))) (Found!6133 (index!26781 (_ BitVec 32))) (Intermediate!6133 (undefined!6945 Bool) (index!26782 (_ BitVec 32)) (x!55740 (_ BitVec 32))) (Undefined!6133) (MissingVacant!6133 (index!26783 (_ BitVec 32))) )
))
(declare-fun lt!269981 () SeekEntryResult!6133)

(declare-fun lt!269980 () SeekEntryResult!6133)

(assert (=> b!594697 (= e!339789 (= lt!269981 lt!269980))))

(declare-fun b!594698 () Bool)

(declare-fun res!380560 () Bool)

(declare-fun e!339799 () Bool)

(assert (=> b!594698 (=> (not res!380560) (not e!339799))))

(declare-fun arrayNoDuplicates!0 (array!36951 (_ BitVec 32) List!11685) Bool)

(assert (=> b!594698 (= res!380560 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11682))))

(declare-fun b!594699 () Bool)

(declare-fun e!339794 () Bool)

(assert (=> b!594699 (= e!339794 (not e!339790))))

(declare-fun res!380549 () Bool)

(assert (=> b!594699 (=> res!380549 e!339790)))

(declare-fun lt!269983 () SeekEntryResult!6133)

(assert (=> b!594699 (= res!380549 (not (= lt!269983 (Found!6133 index!984))))))

(declare-fun lt!269977 () Unit!18625)

(declare-fun e!339801 () Unit!18625)

(assert (=> b!594699 (= lt!269977 e!339801)))

(declare-fun c!67442 () Bool)

(assert (=> b!594699 (= c!67442 (= lt!269983 Undefined!6133))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36951 (_ BitVec 32)) SeekEntryResult!6133)

(assert (=> b!594699 (= lt!269983 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269973 lt!269979 mask!3053))))

(assert (=> b!594699 e!339789))

(declare-fun res!380544 () Bool)

(assert (=> b!594699 (=> (not res!380544) (not e!339789))))

(declare-fun lt!269972 () (_ BitVec 32))

(assert (=> b!594699 (= res!380544 (= lt!269980 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269972 vacantSpotIndex!68 lt!269973 lt!269979 mask!3053)))))

(assert (=> b!594699 (= lt!269980 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269972 vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594699 (= lt!269973 (select (store (arr!17737 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269982 () Unit!18625)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36951 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18625)

(assert (=> b!594699 (= lt!269982 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269972 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594699 (= lt!269972 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!594700 () Bool)

(declare-fun Unit!18627 () Unit!18625)

(assert (=> b!594700 (= e!339801 Unit!18627)))

(declare-fun b!594701 () Bool)

(declare-fun Unit!18628 () Unit!18625)

(assert (=> b!594701 (= e!339801 Unit!18628)))

(assert (=> b!594701 false))

(declare-fun b!594702 () Bool)

(assert (=> b!594702 (= e!339797 e!339799)))

(declare-fun res!380543 () Bool)

(assert (=> b!594702 (=> (not res!380543) (not e!339799))))

(declare-fun lt!269978 () SeekEntryResult!6133)

(assert (=> b!594702 (= res!380543 (or (= lt!269978 (MissingZero!6133 i!1108)) (= lt!269978 (MissingVacant!6133 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36951 (_ BitVec 32)) SeekEntryResult!6133)

(assert (=> b!594702 (= lt!269978 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594703 () Bool)

(assert (=> b!594703 (= e!339796 true)))

(declare-fun lt!269976 () Bool)

(assert (=> b!594703 (= lt!269976 (contains!2894 Nil!11682 k0!1786))))

(declare-fun b!594704 () Bool)

(declare-fun res!380550 () Bool)

(assert (=> b!594704 (=> (not res!380550) (not e!339799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36951 (_ BitVec 32)) Bool)

(assert (=> b!594704 (= res!380550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594705 () Bool)

(declare-fun res!380553 () Bool)

(assert (=> b!594705 (=> (not res!380553) (not e!339797))))

(assert (=> b!594705 (= res!380553 (and (= (size!18101 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18101 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18101 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594706 () Bool)

(declare-fun res!380561 () Bool)

(assert (=> b!594706 (=> (not res!380561) (not e!339797))))

(assert (=> b!594706 (= res!380561 (validKeyInArray!0 k0!1786))))

(declare-fun b!594707 () Bool)

(declare-fun res!380555 () Bool)

(assert (=> b!594707 (=> res!380555 e!339796)))

(assert (=> b!594707 (= res!380555 (contains!2894 Nil!11682 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594708 () Bool)

(declare-fun res!380557 () Bool)

(assert (=> b!594708 (=> res!380557 e!339796)))

(declare-fun noDuplicate!241 (List!11685) Bool)

(assert (=> b!594708 (= res!380557 (not (noDuplicate!241 Nil!11682)))))

(declare-fun b!594709 () Bool)

(declare-fun res!380556 () Bool)

(assert (=> b!594709 (=> (not res!380556) (not e!339797))))

(assert (=> b!594709 (= res!380556 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594710 () Bool)

(declare-fun res!380546 () Bool)

(assert (=> b!594710 (=> (not res!380546) (not e!339799))))

(assert (=> b!594710 (= res!380546 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17737 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594711 () Bool)

(declare-fun e!339793 () Bool)

(assert (=> b!594711 (= e!339799 e!339793)))

(declare-fun res!380563 () Bool)

(assert (=> b!594711 (=> (not res!380563) (not e!339793))))

(assert (=> b!594711 (= res!380563 (= (select (store (arr!17737 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594711 (= lt!269979 (array!36952 (store (arr!17737 a!2986) i!1108 k0!1786) (size!18101 a!2986)))))

(declare-fun b!594712 () Bool)

(assert (=> b!594712 (= e!339793 e!339794)))

(declare-fun res!380554 () Bool)

(assert (=> b!594712 (=> (not res!380554) (not e!339794))))

(assert (=> b!594712 (= res!380554 (and (= lt!269981 (Found!6133 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17737 a!2986) index!984) (select (arr!17737 a!2986) j!136))) (not (= (select (arr!17737 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594712 (= lt!269981 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54546 res!380559) b!594705))

(assert (= (and b!594705 res!380553) b!594695))

(assert (= (and b!594695 res!380558) b!594706))

(assert (= (and b!594706 res!380561) b!594709))

(assert (= (and b!594709 res!380556) b!594702))

(assert (= (and b!594702 res!380543) b!594704))

(assert (= (and b!594704 res!380550) b!594698))

(assert (= (and b!594698 res!380560) b!594710))

(assert (= (and b!594710 res!380546) b!594711))

(assert (= (and b!594711 res!380563) b!594712))

(assert (= (and b!594712 res!380554) b!594699))

(assert (= (and b!594699 res!380544) b!594697))

(assert (= (and b!594699 c!67442) b!594701))

(assert (= (and b!594699 (not c!67442)) b!594700))

(assert (= (and b!594699 (not res!380549)) b!594693))

(assert (= (and b!594693 res!380547) b!594691))

(assert (= (and b!594691 (not res!380562)) b!594694))

(assert (= (and b!594694 res!380548) b!594690))

(assert (= (and b!594693 (not res!380552)) b!594692))

(assert (= (and b!594692 (not res!380551)) b!594708))

(assert (= (and b!594708 (not res!380557)) b!594696))

(assert (= (and b!594696 (not res!380545)) b!594707))

(assert (= (and b!594707 (not res!380555)) b!594703))

(declare-fun m!572699 () Bool)

(assert (=> b!594710 m!572699))

(declare-fun m!572701 () Bool)

(assert (=> start!54546 m!572701))

(declare-fun m!572703 () Bool)

(assert (=> start!54546 m!572703))

(declare-fun m!572705 () Bool)

(assert (=> b!594702 m!572705))

(declare-fun m!572707 () Bool)

(assert (=> b!594692 m!572707))

(assert (=> b!594692 m!572707))

(declare-fun m!572709 () Bool)

(assert (=> b!594692 m!572709))

(assert (=> b!594692 m!572707))

(declare-fun m!572711 () Bool)

(assert (=> b!594692 m!572711))

(declare-fun m!572713 () Bool)

(assert (=> b!594708 m!572713))

(declare-fun m!572715 () Bool)

(assert (=> b!594707 m!572715))

(declare-fun m!572717 () Bool)

(assert (=> b!594712 m!572717))

(assert (=> b!594712 m!572707))

(assert (=> b!594712 m!572707))

(declare-fun m!572719 () Bool)

(assert (=> b!594712 m!572719))

(declare-fun m!572721 () Bool)

(assert (=> b!594699 m!572721))

(declare-fun m!572723 () Bool)

(assert (=> b!594699 m!572723))

(assert (=> b!594699 m!572707))

(assert (=> b!594699 m!572707))

(declare-fun m!572725 () Bool)

(assert (=> b!594699 m!572725))

(declare-fun m!572727 () Bool)

(assert (=> b!594699 m!572727))

(declare-fun m!572729 () Bool)

(assert (=> b!594699 m!572729))

(declare-fun m!572731 () Bool)

(assert (=> b!594699 m!572731))

(declare-fun m!572733 () Bool)

(assert (=> b!594699 m!572733))

(assert (=> b!594694 m!572707))

(assert (=> b!594694 m!572707))

(declare-fun m!572735 () Bool)

(assert (=> b!594694 m!572735))

(declare-fun m!572737 () Bool)

(assert (=> b!594706 m!572737))

(declare-fun m!572739 () Bool)

(assert (=> b!594703 m!572739))

(assert (=> b!594691 m!572707))

(assert (=> b!594711 m!572727))

(declare-fun m!572741 () Bool)

(assert (=> b!594711 m!572741))

(declare-fun m!572743 () Bool)

(assert (=> b!594709 m!572743))

(declare-fun m!572745 () Bool)

(assert (=> b!594696 m!572745))

(assert (=> b!594690 m!572707))

(assert (=> b!594690 m!572707))

(declare-fun m!572747 () Bool)

(assert (=> b!594690 m!572747))

(declare-fun m!572749 () Bool)

(assert (=> b!594704 m!572749))

(assert (=> b!594695 m!572707))

(assert (=> b!594695 m!572707))

(declare-fun m!572751 () Bool)

(assert (=> b!594695 m!572751))

(assert (=> b!594693 m!572707))

(assert (=> b!594693 m!572727))

(declare-fun m!572753 () Bool)

(assert (=> b!594693 m!572753))

(declare-fun m!572755 () Bool)

(assert (=> b!594698 m!572755))

(check-sat (not b!594696) (not b!594707) (not b!594703) (not b!594708) (not b!594712) (not b!594706) (not b!594695) (not b!594694) (not b!594690) (not b!594699) (not b!594698) (not b!594702) (not b!594692) (not b!594704) (not b!594709) (not start!54546))
(check-sat)
