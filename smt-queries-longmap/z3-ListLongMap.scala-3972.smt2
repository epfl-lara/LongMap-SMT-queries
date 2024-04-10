; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53904 () Bool)

(assert start!53904)

(declare-fun b!588142 () Bool)

(declare-fun e!335888 () Bool)

(declare-fun e!335887 () Bool)

(assert (=> b!588142 (= e!335888 e!335887)))

(declare-fun res!375784 () Bool)

(assert (=> b!588142 (=> (not res!375784) (not e!335887))))

(declare-datatypes ((SeekEntryResult!6087 0))(
  ( (MissingZero!6087 (index!26578 (_ BitVec 32))) (Found!6087 (index!26579 (_ BitVec 32))) (Intermediate!6087 (undefined!6899 Bool) (index!26580 (_ BitVec 32)) (x!55381 (_ BitVec 32))) (Undefined!6087) (MissingVacant!6087 (index!26581 (_ BitVec 32))) )
))
(declare-fun lt!266656 () SeekEntryResult!6087)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588142 (= res!375784 (or (= lt!266656 (MissingZero!6087 i!1108)) (= lt!266656 (MissingVacant!6087 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36748 0))(
  ( (array!36749 (arr!17647 (Array (_ BitVec 32) (_ BitVec 64))) (size!18011 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36748)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36748 (_ BitVec 32)) SeekEntryResult!6087)

(assert (=> b!588142 (= lt!266656 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588143 () Bool)

(declare-fun res!375786 () Bool)

(assert (=> b!588143 (=> (not res!375786) (not e!335888))))

(declare-fun arrayContainsKey!0 (array!36748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588143 (= res!375786 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588144 () Bool)

(declare-fun e!335885 () Bool)

(assert (=> b!588144 (= e!335885 (not true))))

(declare-fun e!335886 () Bool)

(assert (=> b!588144 e!335886))

(declare-fun res!375785 () Bool)

(assert (=> b!588144 (=> (not res!375785) (not e!335886))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!266659 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266657 () SeekEntryResult!6087)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36748 (_ BitVec 32)) SeekEntryResult!6087)

(assert (=> b!588144 (= res!375785 (= lt!266657 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266659 vacantSpotIndex!68 (select (store (arr!17647 a!2986) i!1108 k0!1786) j!136) (array!36749 (store (arr!17647 a!2986) i!1108 k0!1786) (size!18011 a!2986)) mask!3053)))))

(assert (=> b!588144 (= lt!266657 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266659 vacantSpotIndex!68 (select (arr!17647 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18294 0))(
  ( (Unit!18295) )
))
(declare-fun lt!266658 () Unit!18294)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36748 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18294)

(assert (=> b!588144 (= lt!266658 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266659 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588144 (= lt!266659 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588145 () Bool)

(declare-fun res!375779 () Bool)

(assert (=> b!588145 (=> (not res!375779) (not e!335888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588145 (= res!375779 (validKeyInArray!0 k0!1786))))

(declare-fun b!588146 () Bool)

(declare-fun res!375783 () Bool)

(assert (=> b!588146 (=> (not res!375783) (not e!335887))))

(assert (=> b!588146 (= res!375783 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17647 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17647 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588147 () Bool)

(assert (=> b!588147 (= e!335887 e!335885)))

(declare-fun res!375778 () Bool)

(assert (=> b!588147 (=> (not res!375778) (not e!335885))))

(declare-fun lt!266655 () SeekEntryResult!6087)

(assert (=> b!588147 (= res!375778 (and (= lt!266655 (Found!6087 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17647 a!2986) index!984) (select (arr!17647 a!2986) j!136))) (not (= (select (arr!17647 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588147 (= lt!266655 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17647 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588148 () Bool)

(declare-fun res!375781 () Bool)

(assert (=> b!588148 (=> (not res!375781) (not e!335887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36748 (_ BitVec 32)) Bool)

(assert (=> b!588148 (= res!375781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588149 () Bool)

(assert (=> b!588149 (= e!335886 (= lt!266655 lt!266657))))

(declare-fun b!588150 () Bool)

(declare-fun res!375788 () Bool)

(assert (=> b!588150 (=> (not res!375788) (not e!335888))))

(assert (=> b!588150 (= res!375788 (validKeyInArray!0 (select (arr!17647 a!2986) j!136)))))

(declare-fun b!588152 () Bool)

(declare-fun res!375782 () Bool)

(assert (=> b!588152 (=> (not res!375782) (not e!335888))))

(assert (=> b!588152 (= res!375782 (and (= (size!18011 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18011 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18011 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!375780 () Bool)

(assert (=> start!53904 (=> (not res!375780) (not e!335888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53904 (= res!375780 (validMask!0 mask!3053))))

(assert (=> start!53904 e!335888))

(assert (=> start!53904 true))

(declare-fun array_inv!13443 (array!36748) Bool)

(assert (=> start!53904 (array_inv!13443 a!2986)))

(declare-fun b!588151 () Bool)

(declare-fun res!375787 () Bool)

(assert (=> b!588151 (=> (not res!375787) (not e!335887))))

(declare-datatypes ((List!11688 0))(
  ( (Nil!11685) (Cons!11684 (h!12729 (_ BitVec 64)) (t!17916 List!11688)) )
))
(declare-fun arrayNoDuplicates!0 (array!36748 (_ BitVec 32) List!11688) Bool)

(assert (=> b!588151 (= res!375787 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11685))))

(assert (= (and start!53904 res!375780) b!588152))

(assert (= (and b!588152 res!375782) b!588150))

(assert (= (and b!588150 res!375788) b!588145))

(assert (= (and b!588145 res!375779) b!588143))

(assert (= (and b!588143 res!375786) b!588142))

(assert (= (and b!588142 res!375784) b!588148))

(assert (= (and b!588148 res!375781) b!588151))

(assert (= (and b!588151 res!375787) b!588146))

(assert (= (and b!588146 res!375783) b!588147))

(assert (= (and b!588147 res!375778) b!588144))

(assert (= (and b!588144 res!375785) b!588149))

(declare-fun m!566649 () Bool)

(assert (=> b!588144 m!566649))

(declare-fun m!566651 () Bool)

(assert (=> b!588144 m!566651))

(declare-fun m!566653 () Bool)

(assert (=> b!588144 m!566653))

(assert (=> b!588144 m!566651))

(declare-fun m!566655 () Bool)

(assert (=> b!588144 m!566655))

(declare-fun m!566657 () Bool)

(assert (=> b!588144 m!566657))

(assert (=> b!588144 m!566653))

(declare-fun m!566659 () Bool)

(assert (=> b!588144 m!566659))

(declare-fun m!566661 () Bool)

(assert (=> b!588144 m!566661))

(declare-fun m!566663 () Bool)

(assert (=> b!588151 m!566663))

(assert (=> b!588150 m!566653))

(assert (=> b!588150 m!566653))

(declare-fun m!566665 () Bool)

(assert (=> b!588150 m!566665))

(declare-fun m!566667 () Bool)

(assert (=> b!588148 m!566667))

(declare-fun m!566669 () Bool)

(assert (=> b!588146 m!566669))

(assert (=> b!588146 m!566657))

(declare-fun m!566671 () Bool)

(assert (=> b!588146 m!566671))

(declare-fun m!566673 () Bool)

(assert (=> b!588143 m!566673))

(declare-fun m!566675 () Bool)

(assert (=> start!53904 m!566675))

(declare-fun m!566677 () Bool)

(assert (=> start!53904 m!566677))

(declare-fun m!566679 () Bool)

(assert (=> b!588145 m!566679))

(declare-fun m!566681 () Bool)

(assert (=> b!588147 m!566681))

(assert (=> b!588147 m!566653))

(assert (=> b!588147 m!566653))

(declare-fun m!566683 () Bool)

(assert (=> b!588147 m!566683))

(declare-fun m!566685 () Bool)

(assert (=> b!588142 m!566685))

(check-sat (not b!588142) (not b!588143) (not start!53904) (not b!588145) (not b!588150) (not b!588147) (not b!588151) (not b!588144) (not b!588148))
(check-sat)
