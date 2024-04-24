; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53658 () Bool)

(assert start!53658)

(declare-fun b!584063 () Bool)

(declare-fun res!371776 () Bool)

(declare-fun e!334584 () Bool)

(assert (=> b!584063 (=> (not res!371776) (not e!334584))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36504 0))(
  ( (array!36505 (arr!17524 (Array (_ BitVec 32) (_ BitVec 64))) (size!17888 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36504)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584063 (= res!371776 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17524 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17524 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584064 () Bool)

(declare-fun e!334586 () Bool)

(assert (=> b!584064 (= e!334584 e!334586)))

(declare-fun res!371781 () Bool)

(assert (=> b!584064 (=> (not res!371781) (not e!334586))))

(declare-fun lt!265530 () (_ BitVec 32))

(assert (=> b!584064 (= res!371781 (and (bvsge lt!265530 #b00000000000000000000000000000000) (bvslt lt!265530 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584064 (= lt!265530 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584065 () Bool)

(declare-fun res!371778 () Bool)

(declare-fun e!334585 () Bool)

(assert (=> b!584065 (=> (not res!371778) (not e!334585))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!584065 (= res!371778 (and (= (size!17888 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17888 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17888 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584066 () Bool)

(declare-fun res!371777 () Bool)

(assert (=> b!584066 (=> (not res!371777) (not e!334585))))

(declare-fun arrayContainsKey!0 (array!36504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584066 (= res!371777 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584067 () Bool)

(assert (=> b!584067 (= e!334586 false)))

(declare-datatypes ((SeekEntryResult!5920 0))(
  ( (MissingZero!5920 (index!25907 (_ BitVec 32))) (Found!5920 (index!25908 (_ BitVec 32))) (Intermediate!5920 (undefined!6732 Bool) (index!25909 (_ BitVec 32)) (x!54896 (_ BitVec 32))) (Undefined!5920) (MissingVacant!5920 (index!25910 (_ BitVec 32))) )
))
(declare-fun lt!265531 () SeekEntryResult!5920)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36504 (_ BitVec 32)) SeekEntryResult!5920)

(assert (=> b!584067 (= lt!265531 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265530 vacantSpotIndex!68 (select (arr!17524 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584068 () Bool)

(declare-fun res!371780 () Bool)

(assert (=> b!584068 (=> (not res!371780) (not e!334584))))

(assert (=> b!584068 (= res!371780 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17524 a!2986) j!136) a!2986 mask!3053) (Found!5920 j!136)))))

(declare-fun b!584069 () Bool)

(declare-fun res!371775 () Bool)

(assert (=> b!584069 (=> (not res!371775) (not e!334584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36504 (_ BitVec 32)) Bool)

(assert (=> b!584069 (= res!371775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584071 () Bool)

(declare-fun res!371782 () Bool)

(assert (=> b!584071 (=> (not res!371782) (not e!334585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584071 (= res!371782 (validKeyInArray!0 (select (arr!17524 a!2986) j!136)))))

(declare-fun b!584072 () Bool)

(assert (=> b!584072 (= e!334585 e!334584)))

(declare-fun res!371779 () Bool)

(assert (=> b!584072 (=> (not res!371779) (not e!334584))))

(declare-fun lt!265529 () SeekEntryResult!5920)

(assert (=> b!584072 (= res!371779 (or (= lt!265529 (MissingZero!5920 i!1108)) (= lt!265529 (MissingVacant!5920 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36504 (_ BitVec 32)) SeekEntryResult!5920)

(assert (=> b!584072 (= lt!265529 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584073 () Bool)

(declare-fun res!371783 () Bool)

(assert (=> b!584073 (=> (not res!371783) (not e!334584))))

(assert (=> b!584073 (= res!371783 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17524 a!2986) index!984) (select (arr!17524 a!2986) j!136))) (not (= (select (arr!17524 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584074 () Bool)

(declare-fun res!371774 () Bool)

(assert (=> b!584074 (=> (not res!371774) (not e!334584))))

(declare-datatypes ((List!11472 0))(
  ( (Nil!11469) (Cons!11468 (h!12516 (_ BitVec 64)) (t!17692 List!11472)) )
))
(declare-fun arrayNoDuplicates!0 (array!36504 (_ BitVec 32) List!11472) Bool)

(assert (=> b!584074 (= res!371774 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11469))))

(declare-fun b!584070 () Bool)

(declare-fun res!371785 () Bool)

(assert (=> b!584070 (=> (not res!371785) (not e!334585))))

(assert (=> b!584070 (= res!371785 (validKeyInArray!0 k0!1786))))

(declare-fun res!371784 () Bool)

(assert (=> start!53658 (=> (not res!371784) (not e!334585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53658 (= res!371784 (validMask!0 mask!3053))))

(assert (=> start!53658 e!334585))

(assert (=> start!53658 true))

(declare-fun array_inv!13383 (array!36504) Bool)

(assert (=> start!53658 (array_inv!13383 a!2986)))

(assert (= (and start!53658 res!371784) b!584065))

(assert (= (and b!584065 res!371778) b!584071))

(assert (= (and b!584071 res!371782) b!584070))

(assert (= (and b!584070 res!371785) b!584066))

(assert (= (and b!584066 res!371777) b!584072))

(assert (= (and b!584072 res!371779) b!584069))

(assert (= (and b!584069 res!371775) b!584074))

(assert (= (and b!584074 res!371774) b!584063))

(assert (= (and b!584063 res!371776) b!584068))

(assert (= (and b!584068 res!371780) b!584073))

(assert (= (and b!584073 res!371783) b!584064))

(assert (= (and b!584064 res!371781) b!584067))

(declare-fun m!562631 () Bool)

(assert (=> b!584068 m!562631))

(assert (=> b!584068 m!562631))

(declare-fun m!562633 () Bool)

(assert (=> b!584068 m!562633))

(declare-fun m!562635 () Bool)

(assert (=> b!584073 m!562635))

(assert (=> b!584073 m!562631))

(declare-fun m!562637 () Bool)

(assert (=> start!53658 m!562637))

(declare-fun m!562639 () Bool)

(assert (=> start!53658 m!562639))

(declare-fun m!562641 () Bool)

(assert (=> b!584072 m!562641))

(declare-fun m!562643 () Bool)

(assert (=> b!584069 m!562643))

(assert (=> b!584071 m!562631))

(assert (=> b!584071 m!562631))

(declare-fun m!562645 () Bool)

(assert (=> b!584071 m!562645))

(declare-fun m!562647 () Bool)

(assert (=> b!584063 m!562647))

(declare-fun m!562649 () Bool)

(assert (=> b!584063 m!562649))

(declare-fun m!562651 () Bool)

(assert (=> b!584063 m!562651))

(declare-fun m!562653 () Bool)

(assert (=> b!584070 m!562653))

(declare-fun m!562655 () Bool)

(assert (=> b!584066 m!562655))

(declare-fun m!562657 () Bool)

(assert (=> b!584074 m!562657))

(assert (=> b!584067 m!562631))

(assert (=> b!584067 m!562631))

(declare-fun m!562659 () Bool)

(assert (=> b!584067 m!562659))

(declare-fun m!562661 () Bool)

(assert (=> b!584064 m!562661))

(check-sat (not b!584066) (not b!584074) (not b!584067) (not b!584072) (not b!584070) (not start!53658) (not b!584068) (not b!584071) (not b!584069) (not b!584064))
(check-sat)
