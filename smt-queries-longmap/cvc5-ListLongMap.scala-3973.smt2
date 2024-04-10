; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53908 () Bool)

(assert start!53908)

(declare-fun b!588208 () Bool)

(declare-fun e!335915 () Bool)

(assert (=> b!588208 (= e!335915 (not true))))

(declare-fun e!335919 () Bool)

(assert (=> b!588208 e!335919))

(declare-fun res!375853 () Bool)

(assert (=> b!588208 (=> (not res!375853) (not e!335919))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6089 0))(
  ( (MissingZero!6089 (index!26586 (_ BitVec 32))) (Found!6089 (index!26587 (_ BitVec 32))) (Intermediate!6089 (undefined!6901 Bool) (index!26588 (_ BitVec 32)) (x!55391 (_ BitVec 32))) (Undefined!6089) (MissingVacant!6089 (index!26589 (_ BitVec 32))) )
))
(declare-fun lt!266685 () SeekEntryResult!6089)

(declare-fun lt!266688 () (_ BitVec 32))

(declare-datatypes ((array!36752 0))(
  ( (array!36753 (arr!17649 (Array (_ BitVec 32) (_ BitVec 64))) (size!18013 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36752)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36752 (_ BitVec 32)) SeekEntryResult!6089)

(assert (=> b!588208 (= res!375853 (= lt!266685 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266688 vacantSpotIndex!68 (select (store (arr!17649 a!2986) i!1108 k!1786) j!136) (array!36753 (store (arr!17649 a!2986) i!1108 k!1786) (size!18013 a!2986)) mask!3053)))))

(assert (=> b!588208 (= lt!266685 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266688 vacantSpotIndex!68 (select (arr!17649 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18298 0))(
  ( (Unit!18299) )
))
(declare-fun lt!266689 () Unit!18298)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36752 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18298)

(assert (=> b!588208 (= lt!266689 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266688 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588208 (= lt!266688 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!375848 () Bool)

(declare-fun e!335917 () Bool)

(assert (=> start!53908 (=> (not res!375848) (not e!335917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53908 (= res!375848 (validMask!0 mask!3053))))

(assert (=> start!53908 e!335917))

(assert (=> start!53908 true))

(declare-fun array_inv!13445 (array!36752) Bool)

(assert (=> start!53908 (array_inv!13445 a!2986)))

(declare-fun b!588209 () Bool)

(declare-fun res!375849 () Bool)

(assert (=> b!588209 (=> (not res!375849) (not e!335917))))

(declare-fun arrayContainsKey!0 (array!36752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588209 (= res!375849 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588210 () Bool)

(declare-fun res!375852 () Bool)

(declare-fun e!335916 () Bool)

(assert (=> b!588210 (=> (not res!375852) (not e!335916))))

(declare-datatypes ((List!11690 0))(
  ( (Nil!11687) (Cons!11686 (h!12731 (_ BitVec 64)) (t!17918 List!11690)) )
))
(declare-fun arrayNoDuplicates!0 (array!36752 (_ BitVec 32) List!11690) Bool)

(assert (=> b!588210 (= res!375852 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11687))))

(declare-fun b!588211 () Bool)

(declare-fun lt!266687 () SeekEntryResult!6089)

(assert (=> b!588211 (= e!335919 (= lt!266687 lt!266685))))

(declare-fun b!588212 () Bool)

(assert (=> b!588212 (= e!335916 e!335915)))

(declare-fun res!375845 () Bool)

(assert (=> b!588212 (=> (not res!375845) (not e!335915))))

(assert (=> b!588212 (= res!375845 (and (= lt!266687 (Found!6089 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17649 a!2986) index!984) (select (arr!17649 a!2986) j!136))) (not (= (select (arr!17649 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588212 (= lt!266687 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17649 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588213 () Bool)

(declare-fun res!375847 () Bool)

(assert (=> b!588213 (=> (not res!375847) (not e!335917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588213 (= res!375847 (validKeyInArray!0 k!1786))))

(declare-fun b!588214 () Bool)

(assert (=> b!588214 (= e!335917 e!335916)))

(declare-fun res!375844 () Bool)

(assert (=> b!588214 (=> (not res!375844) (not e!335916))))

(declare-fun lt!266686 () SeekEntryResult!6089)

(assert (=> b!588214 (= res!375844 (or (= lt!266686 (MissingZero!6089 i!1108)) (= lt!266686 (MissingVacant!6089 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36752 (_ BitVec 32)) SeekEntryResult!6089)

(assert (=> b!588214 (= lt!266686 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588215 () Bool)

(declare-fun res!375846 () Bool)

(assert (=> b!588215 (=> (not res!375846) (not e!335916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36752 (_ BitVec 32)) Bool)

(assert (=> b!588215 (= res!375846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588216 () Bool)

(declare-fun res!375851 () Bool)

(assert (=> b!588216 (=> (not res!375851) (not e!335917))))

(assert (=> b!588216 (= res!375851 (validKeyInArray!0 (select (arr!17649 a!2986) j!136)))))

(declare-fun b!588217 () Bool)

(declare-fun res!375854 () Bool)

(assert (=> b!588217 (=> (not res!375854) (not e!335916))))

(assert (=> b!588217 (= res!375854 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17649 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17649 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588218 () Bool)

(declare-fun res!375850 () Bool)

(assert (=> b!588218 (=> (not res!375850) (not e!335917))))

(assert (=> b!588218 (= res!375850 (and (= (size!18013 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18013 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18013 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53908 res!375848) b!588218))

(assert (= (and b!588218 res!375850) b!588216))

(assert (= (and b!588216 res!375851) b!588213))

(assert (= (and b!588213 res!375847) b!588209))

(assert (= (and b!588209 res!375849) b!588214))

(assert (= (and b!588214 res!375844) b!588215))

(assert (= (and b!588215 res!375846) b!588210))

(assert (= (and b!588210 res!375852) b!588217))

(assert (= (and b!588217 res!375854) b!588212))

(assert (= (and b!588212 res!375845) b!588208))

(assert (= (and b!588208 res!375853) b!588211))

(declare-fun m!566725 () Bool)

(assert (=> b!588217 m!566725))

(declare-fun m!566727 () Bool)

(assert (=> b!588217 m!566727))

(declare-fun m!566729 () Bool)

(assert (=> b!588217 m!566729))

(declare-fun m!566731 () Bool)

(assert (=> b!588213 m!566731))

(declare-fun m!566733 () Bool)

(assert (=> b!588212 m!566733))

(declare-fun m!566735 () Bool)

(assert (=> b!588212 m!566735))

(assert (=> b!588212 m!566735))

(declare-fun m!566737 () Bool)

(assert (=> b!588212 m!566737))

(declare-fun m!566739 () Bool)

(assert (=> b!588208 m!566739))

(declare-fun m!566741 () Bool)

(assert (=> b!588208 m!566741))

(assert (=> b!588208 m!566735))

(assert (=> b!588208 m!566741))

(declare-fun m!566743 () Bool)

(assert (=> b!588208 m!566743))

(assert (=> b!588208 m!566735))

(declare-fun m!566745 () Bool)

(assert (=> b!588208 m!566745))

(assert (=> b!588208 m!566727))

(declare-fun m!566747 () Bool)

(assert (=> b!588208 m!566747))

(declare-fun m!566749 () Bool)

(assert (=> b!588214 m!566749))

(declare-fun m!566751 () Bool)

(assert (=> b!588215 m!566751))

(declare-fun m!566753 () Bool)

(assert (=> start!53908 m!566753))

(declare-fun m!566755 () Bool)

(assert (=> start!53908 m!566755))

(assert (=> b!588216 m!566735))

(assert (=> b!588216 m!566735))

(declare-fun m!566757 () Bool)

(assert (=> b!588216 m!566757))

(declare-fun m!566759 () Bool)

(assert (=> b!588210 m!566759))

(declare-fun m!566761 () Bool)

(assert (=> b!588209 m!566761))

(push 1)

(assert (not b!588212))

(assert (not b!588213))

(assert (not start!53908))

(assert (not b!588210))

