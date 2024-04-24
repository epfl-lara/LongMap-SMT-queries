; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53832 () Bool)

(assert start!53832)

(declare-fun b!587076 () Bool)

(declare-fun res!374787 () Bool)

(declare-fun e!335509 () Bool)

(assert (=> b!587076 (=> (not res!374787) (not e!335509))))

(declare-datatypes ((array!36678 0))(
  ( (array!36679 (arr!17611 (Array (_ BitVec 32) (_ BitVec 64))) (size!17975 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36678)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587076 (= res!374787 (validKeyInArray!0 (select (arr!17611 a!2986) j!136)))))

(declare-fun res!374797 () Bool)

(assert (=> start!53832 (=> (not res!374797) (not e!335509))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53832 (= res!374797 (validMask!0 mask!3053))))

(assert (=> start!53832 e!335509))

(assert (=> start!53832 true))

(declare-fun array_inv!13470 (array!36678) Bool)

(assert (=> start!53832 (array_inv!13470 a!2986)))

(declare-fun b!587077 () Bool)

(declare-fun res!374791 () Bool)

(declare-fun e!335510 () Bool)

(assert (=> b!587077 (=> (not res!374791) (not e!335510))))

(declare-datatypes ((List!11559 0))(
  ( (Nil!11556) (Cons!11555 (h!12603 (_ BitVec 64)) (t!17779 List!11559)) )
))
(declare-fun arrayNoDuplicates!0 (array!36678 (_ BitVec 32) List!11559) Bool)

(assert (=> b!587077 (= res!374791 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11556))))

(declare-fun b!587078 () Bool)

(declare-fun res!374790 () Bool)

(assert (=> b!587078 (=> (not res!374790) (not e!335509))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587078 (= res!374790 (and (= (size!17975 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17975 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17975 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587079 () Bool)

(declare-fun res!374788 () Bool)

(assert (=> b!587079 (=> (not res!374788) (not e!335510))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587079 (= res!374788 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17611 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17611 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587080 () Bool)

(declare-fun res!374795 () Bool)

(assert (=> b!587080 (=> (not res!374795) (not e!335509))))

(assert (=> b!587080 (= res!374795 (validKeyInArray!0 k0!1786))))

(declare-fun b!587081 () Bool)

(declare-fun res!374794 () Bool)

(assert (=> b!587081 (=> (not res!374794) (not e!335510))))

(declare-datatypes ((SeekEntryResult!6007 0))(
  ( (MissingZero!6007 (index!26255 (_ BitVec 32))) (Found!6007 (index!26256 (_ BitVec 32))) (Intermediate!6007 (undefined!6819 Bool) (index!26257 (_ BitVec 32)) (x!55215 (_ BitVec 32))) (Undefined!6007) (MissingVacant!6007 (index!26258 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36678 (_ BitVec 32)) SeekEntryResult!6007)

(assert (=> b!587081 (= res!374794 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17611 a!2986) j!136) a!2986 mask!3053) (Found!6007 j!136)))))

(declare-fun b!587082 () Bool)

(declare-fun res!374792 () Bool)

(assert (=> b!587082 (=> (not res!374792) (not e!335509))))

(declare-fun arrayContainsKey!0 (array!36678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587082 (= res!374792 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587083 () Bool)

(assert (=> b!587083 (= e!335510 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!266312 () (_ BitVec 32))

(assert (=> b!587083 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266312 vacantSpotIndex!68 (select (arr!17611 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266312 vacantSpotIndex!68 (select (store (arr!17611 a!2986) i!1108 k0!1786) j!136) (array!36679 (store (arr!17611 a!2986) i!1108 k0!1786) (size!17975 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18211 0))(
  ( (Unit!18212) )
))
(declare-fun lt!266314 () Unit!18211)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36678 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18211)

(assert (=> b!587083 (= lt!266314 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266312 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587083 (= lt!266312 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!587084 () Bool)

(declare-fun res!374793 () Bool)

(assert (=> b!587084 (=> (not res!374793) (not e!335510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36678 (_ BitVec 32)) Bool)

(assert (=> b!587084 (= res!374793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587085 () Bool)

(assert (=> b!587085 (= e!335509 e!335510)))

(declare-fun res!374789 () Bool)

(assert (=> b!587085 (=> (not res!374789) (not e!335510))))

(declare-fun lt!266313 () SeekEntryResult!6007)

(assert (=> b!587085 (= res!374789 (or (= lt!266313 (MissingZero!6007 i!1108)) (= lt!266313 (MissingVacant!6007 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36678 (_ BitVec 32)) SeekEntryResult!6007)

(assert (=> b!587085 (= lt!266313 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587086 () Bool)

(declare-fun res!374796 () Bool)

(assert (=> b!587086 (=> (not res!374796) (not e!335510))))

(assert (=> b!587086 (= res!374796 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17611 a!2986) index!984) (select (arr!17611 a!2986) j!136))) (not (= (select (arr!17611 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53832 res!374797) b!587078))

(assert (= (and b!587078 res!374790) b!587076))

(assert (= (and b!587076 res!374787) b!587080))

(assert (= (and b!587080 res!374795) b!587082))

(assert (= (and b!587082 res!374792) b!587085))

(assert (= (and b!587085 res!374789) b!587084))

(assert (= (and b!587084 res!374793) b!587077))

(assert (= (and b!587077 res!374791) b!587079))

(assert (= (and b!587079 res!374788) b!587081))

(assert (= (and b!587081 res!374794) b!587086))

(assert (= (and b!587086 res!374796) b!587083))

(declare-fun m!565649 () Bool)

(assert (=> b!587077 m!565649))

(declare-fun m!565651 () Bool)

(assert (=> b!587079 m!565651))

(declare-fun m!565653 () Bool)

(assert (=> b!587079 m!565653))

(declare-fun m!565655 () Bool)

(assert (=> b!587079 m!565655))

(declare-fun m!565657 () Bool)

(assert (=> b!587082 m!565657))

(declare-fun m!565659 () Bool)

(assert (=> b!587083 m!565659))

(declare-fun m!565661 () Bool)

(assert (=> b!587083 m!565661))

(declare-fun m!565663 () Bool)

(assert (=> b!587083 m!565663))

(assert (=> b!587083 m!565661))

(declare-fun m!565665 () Bool)

(assert (=> b!587083 m!565665))

(assert (=> b!587083 m!565653))

(assert (=> b!587083 m!565663))

(declare-fun m!565667 () Bool)

(assert (=> b!587083 m!565667))

(declare-fun m!565669 () Bool)

(assert (=> b!587083 m!565669))

(declare-fun m!565671 () Bool)

(assert (=> b!587085 m!565671))

(declare-fun m!565673 () Bool)

(assert (=> b!587084 m!565673))

(assert (=> b!587081 m!565663))

(assert (=> b!587081 m!565663))

(declare-fun m!565675 () Bool)

(assert (=> b!587081 m!565675))

(assert (=> b!587076 m!565663))

(assert (=> b!587076 m!565663))

(declare-fun m!565677 () Bool)

(assert (=> b!587076 m!565677))

(declare-fun m!565679 () Bool)

(assert (=> b!587080 m!565679))

(declare-fun m!565681 () Bool)

(assert (=> start!53832 m!565681))

(declare-fun m!565683 () Bool)

(assert (=> start!53832 m!565683))

(declare-fun m!565685 () Bool)

(assert (=> b!587086 m!565685))

(assert (=> b!587086 m!565663))

(check-sat (not b!587081) (not start!53832) (not b!587080) (not b!587085) (not b!587083) (not b!587077) (not b!587084) (not b!587082) (not b!587076))
(check-sat)
