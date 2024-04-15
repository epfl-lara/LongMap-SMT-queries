; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53460 () Bool)

(assert start!53460)

(declare-fun res!369665 () Bool)

(declare-fun e!333660 () Bool)

(assert (=> start!53460 (=> (not res!369665) (not e!333660))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53460 (= res!369665 (validMask!0 mask!3053))))

(assert (=> start!53460 e!333660))

(assert (=> start!53460 true))

(declare-datatypes ((array!36375 0))(
  ( (array!36376 (arr!17462 (Array (_ BitVec 32) (_ BitVec 64))) (size!17827 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36375)

(declare-fun array_inv!13345 (array!36375) Bool)

(assert (=> start!53460 (array_inv!13345 a!2986)))

(declare-fun b!581705 () Bool)

(declare-fun res!369668 () Bool)

(declare-fun e!333659 () Bool)

(assert (=> b!581705 (=> (not res!369668) (not e!333659))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581705 (= res!369668 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17462 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17462 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581706 () Bool)

(declare-fun res!369664 () Bool)

(assert (=> b!581706 (=> (not res!369664) (not e!333659))))

(declare-datatypes ((List!11542 0))(
  ( (Nil!11539) (Cons!11538 (h!12583 (_ BitVec 64)) (t!17761 List!11542)) )
))
(declare-fun arrayNoDuplicates!0 (array!36375 (_ BitVec 32) List!11542) Bool)

(assert (=> b!581706 (= res!369664 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11539))))

(declare-fun b!581707 () Bool)

(assert (=> b!581707 (= e!333660 e!333659)))

(declare-fun res!369670 () Bool)

(assert (=> b!581707 (=> (not res!369670) (not e!333659))))

(declare-datatypes ((SeekEntryResult!5899 0))(
  ( (MissingZero!5899 (index!25823 (_ BitVec 32))) (Found!5899 (index!25824 (_ BitVec 32))) (Intermediate!5899 (undefined!6711 Bool) (index!25825 (_ BitVec 32)) (x!54691 (_ BitVec 32))) (Undefined!5899) (MissingVacant!5899 (index!25826 (_ BitVec 32))) )
))
(declare-fun lt!264778 () SeekEntryResult!5899)

(assert (=> b!581707 (= res!369670 (or (= lt!264778 (MissingZero!5899 i!1108)) (= lt!264778 (MissingVacant!5899 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36375 (_ BitVec 32)) SeekEntryResult!5899)

(assert (=> b!581707 (= lt!264778 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581708 () Bool)

(declare-fun res!369666 () Bool)

(assert (=> b!581708 (=> (not res!369666) (not e!333660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581708 (= res!369666 (validKeyInArray!0 k0!1786))))

(declare-fun b!581709 () Bool)

(declare-fun res!369671 () Bool)

(assert (=> b!581709 (=> (not res!369671) (not e!333660))))

(declare-fun arrayContainsKey!0 (array!36375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581709 (= res!369671 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581710 () Bool)

(declare-fun res!369669 () Bool)

(assert (=> b!581710 (=> (not res!369669) (not e!333660))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581710 (= res!369669 (validKeyInArray!0 (select (arr!17462 a!2986) j!136)))))

(declare-fun b!581711 () Bool)

(assert (=> b!581711 (= e!333659 false)))

(declare-fun lt!264777 () SeekEntryResult!5899)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36375 (_ BitVec 32)) SeekEntryResult!5899)

(assert (=> b!581711 (= lt!264777 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17462 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581712 () Bool)

(declare-fun res!369663 () Bool)

(assert (=> b!581712 (=> (not res!369663) (not e!333659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36375 (_ BitVec 32)) Bool)

(assert (=> b!581712 (= res!369663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581713 () Bool)

(declare-fun res!369667 () Bool)

(assert (=> b!581713 (=> (not res!369667) (not e!333660))))

(assert (=> b!581713 (= res!369667 (and (= (size!17827 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17827 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17827 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53460 res!369665) b!581713))

(assert (= (and b!581713 res!369667) b!581710))

(assert (= (and b!581710 res!369669) b!581708))

(assert (= (and b!581708 res!369666) b!581709))

(assert (= (and b!581709 res!369671) b!581707))

(assert (= (and b!581707 res!369670) b!581712))

(assert (= (and b!581712 res!369663) b!581706))

(assert (= (and b!581706 res!369664) b!581705))

(assert (= (and b!581705 res!369668) b!581711))

(declare-fun m!559711 () Bool)

(assert (=> b!581707 m!559711))

(declare-fun m!559713 () Bool)

(assert (=> b!581709 m!559713))

(declare-fun m!559715 () Bool)

(assert (=> b!581710 m!559715))

(assert (=> b!581710 m!559715))

(declare-fun m!559717 () Bool)

(assert (=> b!581710 m!559717))

(declare-fun m!559719 () Bool)

(assert (=> b!581706 m!559719))

(assert (=> b!581711 m!559715))

(assert (=> b!581711 m!559715))

(declare-fun m!559721 () Bool)

(assert (=> b!581711 m!559721))

(declare-fun m!559723 () Bool)

(assert (=> b!581705 m!559723))

(declare-fun m!559725 () Bool)

(assert (=> b!581705 m!559725))

(declare-fun m!559727 () Bool)

(assert (=> b!581705 m!559727))

(declare-fun m!559729 () Bool)

(assert (=> b!581708 m!559729))

(declare-fun m!559731 () Bool)

(assert (=> start!53460 m!559731))

(declare-fun m!559733 () Bool)

(assert (=> start!53460 m!559733))

(declare-fun m!559735 () Bool)

(assert (=> b!581712 m!559735))

(check-sat (not b!581710) (not b!581706) (not b!581711) (not b!581709) (not start!53460) (not b!581707) (not b!581708) (not b!581712))
(check-sat)
