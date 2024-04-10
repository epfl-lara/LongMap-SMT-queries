; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53772 () Bool)

(assert start!53772)

(declare-fun b!586702 () Bool)

(declare-fun res!374525 () Bool)

(declare-fun e!335335 () Bool)

(assert (=> b!586702 (=> (not res!374525) (not e!335335))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36673 0))(
  ( (array!36674 (arr!17611 (Array (_ BitVec 32) (_ BitVec 64))) (size!17975 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36673)

(assert (=> b!586702 (= res!374525 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17611 a!2986) index!984) (select (arr!17611 a!2986) j!136))) (not (= (select (arr!17611 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586703 () Bool)

(declare-fun res!374518 () Bool)

(declare-fun e!335337 () Bool)

(assert (=> b!586703 (=> (not res!374518) (not e!335337))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586703 (= res!374518 (and (= (size!17975 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17975 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17975 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586704 () Bool)

(assert (=> b!586704 (= e!335335 (not true))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!266166 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6051 0))(
  ( (MissingZero!6051 (index!26431 (_ BitVec 32))) (Found!6051 (index!26432 (_ BitVec 32))) (Intermediate!6051 (undefined!6863 Bool) (index!26433 (_ BitVec 32)) (x!55240 (_ BitVec 32))) (Undefined!6051) (MissingVacant!6051 (index!26434 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36673 (_ BitVec 32)) SeekEntryResult!6051)

(assert (=> b!586704 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266166 vacantSpotIndex!68 (select (arr!17611 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266166 vacantSpotIndex!68 (select (store (arr!17611 a!2986) i!1108 k0!1786) j!136) (array!36674 (store (arr!17611 a!2986) i!1108 k0!1786) (size!17975 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18222 0))(
  ( (Unit!18223) )
))
(declare-fun lt!266167 () Unit!18222)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18222)

(assert (=> b!586704 (= lt!266167 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266166 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586704 (= lt!266166 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586705 () Bool)

(declare-fun res!374526 () Bool)

(assert (=> b!586705 (=> (not res!374526) (not e!335337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586705 (= res!374526 (validKeyInArray!0 k0!1786))))

(declare-fun b!586706 () Bool)

(declare-fun res!374523 () Bool)

(assert (=> b!586706 (=> (not res!374523) (not e!335335))))

(assert (=> b!586706 (= res!374523 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17611 a!2986) j!136) a!2986 mask!3053) (Found!6051 j!136)))))

(declare-fun b!586707 () Bool)

(declare-fun res!374527 () Bool)

(assert (=> b!586707 (=> (not res!374527) (not e!335335))))

(assert (=> b!586707 (= res!374527 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17611 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17611 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586709 () Bool)

(assert (=> b!586709 (= e!335337 e!335335)))

(declare-fun res!374528 () Bool)

(assert (=> b!586709 (=> (not res!374528) (not e!335335))))

(declare-fun lt!266165 () SeekEntryResult!6051)

(assert (=> b!586709 (= res!374528 (or (= lt!266165 (MissingZero!6051 i!1108)) (= lt!266165 (MissingVacant!6051 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36673 (_ BitVec 32)) SeekEntryResult!6051)

(assert (=> b!586709 (= lt!266165 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586710 () Bool)

(declare-fun res!374522 () Bool)

(assert (=> b!586710 (=> (not res!374522) (not e!335337))))

(assert (=> b!586710 (= res!374522 (validKeyInArray!0 (select (arr!17611 a!2986) j!136)))))

(declare-fun b!586711 () Bool)

(declare-fun res!374520 () Bool)

(assert (=> b!586711 (=> (not res!374520) (not e!335337))))

(declare-fun arrayContainsKey!0 (array!36673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586711 (= res!374520 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586712 () Bool)

(declare-fun res!374521 () Bool)

(assert (=> b!586712 (=> (not res!374521) (not e!335335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36673 (_ BitVec 32)) Bool)

(assert (=> b!586712 (= res!374521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586708 () Bool)

(declare-fun res!374519 () Bool)

(assert (=> b!586708 (=> (not res!374519) (not e!335335))))

(declare-datatypes ((List!11652 0))(
  ( (Nil!11649) (Cons!11648 (h!12693 (_ BitVec 64)) (t!17880 List!11652)) )
))
(declare-fun arrayNoDuplicates!0 (array!36673 (_ BitVec 32) List!11652) Bool)

(assert (=> b!586708 (= res!374519 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11649))))

(declare-fun res!374524 () Bool)

(assert (=> start!53772 (=> (not res!374524) (not e!335337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53772 (= res!374524 (validMask!0 mask!3053))))

(assert (=> start!53772 e!335337))

(assert (=> start!53772 true))

(declare-fun array_inv!13407 (array!36673) Bool)

(assert (=> start!53772 (array_inv!13407 a!2986)))

(assert (= (and start!53772 res!374524) b!586703))

(assert (= (and b!586703 res!374518) b!586710))

(assert (= (and b!586710 res!374522) b!586705))

(assert (= (and b!586705 res!374526) b!586711))

(assert (= (and b!586711 res!374520) b!586709))

(assert (= (and b!586709 res!374528) b!586712))

(assert (= (and b!586712 res!374521) b!586708))

(assert (= (and b!586708 res!374519) b!586707))

(assert (= (and b!586707 res!374527) b!586706))

(assert (= (and b!586706 res!374523) b!586702))

(assert (= (and b!586702 res!374525) b!586704))

(declare-fun m!565101 () Bool)

(assert (=> b!586702 m!565101))

(declare-fun m!565103 () Bool)

(assert (=> b!586702 m!565103))

(assert (=> b!586706 m!565103))

(assert (=> b!586706 m!565103))

(declare-fun m!565105 () Bool)

(assert (=> b!586706 m!565105))

(assert (=> b!586710 m!565103))

(assert (=> b!586710 m!565103))

(declare-fun m!565107 () Bool)

(assert (=> b!586710 m!565107))

(declare-fun m!565109 () Bool)

(assert (=> b!586705 m!565109))

(declare-fun m!565111 () Bool)

(assert (=> start!53772 m!565111))

(declare-fun m!565113 () Bool)

(assert (=> start!53772 m!565113))

(declare-fun m!565115 () Bool)

(assert (=> b!586711 m!565115))

(declare-fun m!565117 () Bool)

(assert (=> b!586712 m!565117))

(declare-fun m!565119 () Bool)

(assert (=> b!586709 m!565119))

(declare-fun m!565121 () Bool)

(assert (=> b!586708 m!565121))

(declare-fun m!565123 () Bool)

(assert (=> b!586704 m!565123))

(declare-fun m!565125 () Bool)

(assert (=> b!586704 m!565125))

(assert (=> b!586704 m!565103))

(declare-fun m!565127 () Bool)

(assert (=> b!586704 m!565127))

(declare-fun m!565129 () Bool)

(assert (=> b!586704 m!565129))

(assert (=> b!586704 m!565103))

(declare-fun m!565131 () Bool)

(assert (=> b!586704 m!565131))

(assert (=> b!586704 m!565125))

(declare-fun m!565133 () Bool)

(assert (=> b!586704 m!565133))

(declare-fun m!565135 () Bool)

(assert (=> b!586707 m!565135))

(assert (=> b!586707 m!565129))

(declare-fun m!565137 () Bool)

(assert (=> b!586707 m!565137))

(check-sat (not b!586709) (not b!586712) (not start!53772) (not b!586711) (not b!586708) (not b!586706) (not b!586704) (not b!586710) (not b!586705))
(check-sat)
