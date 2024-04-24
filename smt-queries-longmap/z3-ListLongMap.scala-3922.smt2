; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53592 () Bool)

(assert start!53592)

(declare-fun b!583067 () Bool)

(declare-fun res!370785 () Bool)

(declare-fun e!334260 () Bool)

(assert (=> b!583067 (=> (not res!370785) (not e!334260))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583067 (= res!370785 (validKeyInArray!0 k0!1786))))

(declare-fun res!370781 () Bool)

(assert (=> start!53592 (=> (not res!370781) (not e!334260))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53592 (= res!370781 (validMask!0 mask!3053))))

(assert (=> start!53592 e!334260))

(assert (=> start!53592 true))

(declare-datatypes ((array!36438 0))(
  ( (array!36439 (arr!17491 (Array (_ BitVec 32) (_ BitVec 64))) (size!17855 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36438)

(declare-fun array_inv!13350 (array!36438) Bool)

(assert (=> start!53592 (array_inv!13350 a!2986)))

(declare-fun b!583068 () Bool)

(declare-fun e!334258 () Bool)

(assert (=> b!583068 (= e!334260 e!334258)))

(declare-fun res!370780 () Bool)

(assert (=> b!583068 (=> (not res!370780) (not e!334258))))

(declare-datatypes ((SeekEntryResult!5887 0))(
  ( (MissingZero!5887 (index!25775 (_ BitVec 32))) (Found!5887 (index!25776 (_ BitVec 32))) (Intermediate!5887 (undefined!6699 Bool) (index!25777 (_ BitVec 32)) (x!54775 (_ BitVec 32))) (Undefined!5887) (MissingVacant!5887 (index!25778 (_ BitVec 32))) )
))
(declare-fun lt!265321 () SeekEntryResult!5887)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583068 (= res!370780 (or (= lt!265321 (MissingZero!5887 i!1108)) (= lt!265321 (MissingVacant!5887 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36438 (_ BitVec 32)) SeekEntryResult!5887)

(assert (=> b!583068 (= lt!265321 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583069 () Bool)

(declare-fun res!370778 () Bool)

(assert (=> b!583069 (=> (not res!370778) (not e!334258))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583069 (= res!370778 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17491 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17491 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583070 () Bool)

(declare-fun res!370783 () Bool)

(assert (=> b!583070 (=> (not res!370783) (not e!334260))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583070 (= res!370783 (and (= (size!17855 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17855 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17855 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583071 () Bool)

(declare-fun res!370784 () Bool)

(assert (=> b!583071 (=> (not res!370784) (not e!334258))))

(declare-datatypes ((List!11439 0))(
  ( (Nil!11436) (Cons!11435 (h!12483 (_ BitVec 64)) (t!17659 List!11439)) )
))
(declare-fun arrayNoDuplicates!0 (array!36438 (_ BitVec 32) List!11439) Bool)

(assert (=> b!583071 (= res!370784 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11436))))

(declare-fun b!583072 () Bool)

(declare-fun res!370782 () Bool)

(assert (=> b!583072 (=> (not res!370782) (not e!334258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36438 (_ BitVec 32)) Bool)

(assert (=> b!583072 (= res!370782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583073 () Bool)

(assert (=> b!583073 (= e!334258 false)))

(declare-fun lt!265320 () SeekEntryResult!5887)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36438 (_ BitVec 32)) SeekEntryResult!5887)

(assert (=> b!583073 (= lt!265320 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17491 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583074 () Bool)

(declare-fun res!370779 () Bool)

(assert (=> b!583074 (=> (not res!370779) (not e!334260))))

(declare-fun arrayContainsKey!0 (array!36438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583074 (= res!370779 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583075 () Bool)

(declare-fun res!370786 () Bool)

(assert (=> b!583075 (=> (not res!370786) (not e!334260))))

(assert (=> b!583075 (= res!370786 (validKeyInArray!0 (select (arr!17491 a!2986) j!136)))))

(assert (= (and start!53592 res!370781) b!583070))

(assert (= (and b!583070 res!370783) b!583075))

(assert (= (and b!583075 res!370786) b!583067))

(assert (= (and b!583067 res!370785) b!583074))

(assert (= (and b!583074 res!370779) b!583068))

(assert (= (and b!583068 res!370780) b!583072))

(assert (= (and b!583072 res!370782) b!583071))

(assert (= (and b!583071 res!370784) b!583069))

(assert (= (and b!583069 res!370778) b!583073))

(declare-fun m!561707 () Bool)

(assert (=> start!53592 m!561707))

(declare-fun m!561709 () Bool)

(assert (=> start!53592 m!561709))

(declare-fun m!561711 () Bool)

(assert (=> b!583074 m!561711))

(declare-fun m!561713 () Bool)

(assert (=> b!583072 m!561713))

(declare-fun m!561715 () Bool)

(assert (=> b!583071 m!561715))

(declare-fun m!561717 () Bool)

(assert (=> b!583075 m!561717))

(assert (=> b!583075 m!561717))

(declare-fun m!561719 () Bool)

(assert (=> b!583075 m!561719))

(declare-fun m!561721 () Bool)

(assert (=> b!583069 m!561721))

(declare-fun m!561723 () Bool)

(assert (=> b!583069 m!561723))

(declare-fun m!561725 () Bool)

(assert (=> b!583069 m!561725))

(assert (=> b!583073 m!561717))

(assert (=> b!583073 m!561717))

(declare-fun m!561727 () Bool)

(assert (=> b!583073 m!561727))

(declare-fun m!561729 () Bool)

(assert (=> b!583067 m!561729))

(declare-fun m!561731 () Bool)

(assert (=> b!583068 m!561731))

(check-sat (not b!583072) (not start!53592) (not b!583068) (not b!583075) (not b!583071) (not b!583074) (not b!583067) (not b!583073))
(check-sat)
