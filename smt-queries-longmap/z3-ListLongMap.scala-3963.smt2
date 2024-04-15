; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53772 () Bool)

(assert start!53772)

(declare-fun b!586695 () Bool)

(declare-fun res!374660 () Bool)

(declare-fun e!335235 () Bool)

(assert (=> b!586695 (=> (not res!374660) (not e!335235))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36687 0))(
  ( (array!36688 (arr!17618 (Array (_ BitVec 32) (_ BitVec 64))) (size!17983 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36687)

(assert (=> b!586695 (= res!374660 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17618 a!2986) index!984) (select (arr!17618 a!2986) j!136))) (not (= (select (arr!17618 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!374658 () Bool)

(declare-fun e!335233 () Bool)

(assert (=> start!53772 (=> (not res!374658) (not e!335233))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53772 (= res!374658 (validMask!0 mask!3053))))

(assert (=> start!53772 e!335233))

(assert (=> start!53772 true))

(declare-fun array_inv!13501 (array!36687) Bool)

(assert (=> start!53772 (array_inv!13501 a!2986)))

(declare-fun b!586696 () Bool)

(declare-fun res!374657 () Bool)

(assert (=> b!586696 (=> (not res!374657) (not e!335233))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586696 (= res!374657 (and (= (size!17983 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17983 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17983 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586697 () Bool)

(declare-fun res!374656 () Bool)

(assert (=> b!586697 (=> (not res!374656) (not e!335235))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6055 0))(
  ( (MissingZero!6055 (index!26447 (_ BitVec 32))) (Found!6055 (index!26448 (_ BitVec 32))) (Intermediate!6055 (undefined!6867 Bool) (index!26449 (_ BitVec 32)) (x!55263 (_ BitVec 32))) (Undefined!6055) (MissingVacant!6055 (index!26450 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36687 (_ BitVec 32)) SeekEntryResult!6055)

(assert (=> b!586697 (= res!374656 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17618 a!2986) j!136) a!2986 mask!3053) (Found!6055 j!136)))))

(declare-fun b!586698 () Bool)

(declare-fun res!374659 () Bool)

(assert (=> b!586698 (=> (not res!374659) (not e!335233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586698 (= res!374659 (validKeyInArray!0 (select (arr!17618 a!2986) j!136)))))

(declare-fun b!586699 () Bool)

(assert (=> b!586699 (= e!335235 (not true))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!266005 () (_ BitVec 32))

(assert (=> b!586699 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266005 vacantSpotIndex!68 (select (arr!17618 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266005 vacantSpotIndex!68 (select (store (arr!17618 a!2986) i!1108 k0!1786) j!136) (array!36688 (store (arr!17618 a!2986) i!1108 k0!1786) (size!17983 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18216 0))(
  ( (Unit!18217) )
))
(declare-fun lt!266003 () Unit!18216)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36687 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18216)

(assert (=> b!586699 (= lt!266003 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266005 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586699 (= lt!266005 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586700 () Bool)

(declare-fun res!374654 () Bool)

(assert (=> b!586700 (=> (not res!374654) (not e!335233))))

(declare-fun arrayContainsKey!0 (array!36687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586700 (= res!374654 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586701 () Bool)

(declare-fun res!374662 () Bool)

(assert (=> b!586701 (=> (not res!374662) (not e!335235))))

(declare-datatypes ((List!11698 0))(
  ( (Nil!11695) (Cons!11694 (h!12739 (_ BitVec 64)) (t!17917 List!11698)) )
))
(declare-fun arrayNoDuplicates!0 (array!36687 (_ BitVec 32) List!11698) Bool)

(assert (=> b!586701 (= res!374662 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11695))))

(declare-fun b!586702 () Bool)

(declare-fun res!374655 () Bool)

(assert (=> b!586702 (=> (not res!374655) (not e!335233))))

(assert (=> b!586702 (= res!374655 (validKeyInArray!0 k0!1786))))

(declare-fun b!586703 () Bool)

(declare-fun res!374653 () Bool)

(assert (=> b!586703 (=> (not res!374653) (not e!335235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36687 (_ BitVec 32)) Bool)

(assert (=> b!586703 (= res!374653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586704 () Bool)

(assert (=> b!586704 (= e!335233 e!335235)))

(declare-fun res!374663 () Bool)

(assert (=> b!586704 (=> (not res!374663) (not e!335235))))

(declare-fun lt!266004 () SeekEntryResult!6055)

(assert (=> b!586704 (= res!374663 (or (= lt!266004 (MissingZero!6055 i!1108)) (= lt!266004 (MissingVacant!6055 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36687 (_ BitVec 32)) SeekEntryResult!6055)

(assert (=> b!586704 (= lt!266004 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586705 () Bool)

(declare-fun res!374661 () Bool)

(assert (=> b!586705 (=> (not res!374661) (not e!335235))))

(assert (=> b!586705 (= res!374661 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17618 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17618 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53772 res!374658) b!586696))

(assert (= (and b!586696 res!374657) b!586698))

(assert (= (and b!586698 res!374659) b!586702))

(assert (= (and b!586702 res!374655) b!586700))

(assert (= (and b!586700 res!374654) b!586704))

(assert (= (and b!586704 res!374663) b!586703))

(assert (= (and b!586703 res!374653) b!586701))

(assert (= (and b!586701 res!374662) b!586705))

(assert (= (and b!586705 res!374661) b!586697))

(assert (= (and b!586697 res!374656) b!586695))

(assert (= (and b!586695 res!374660) b!586699))

(declare-fun m!564619 () Bool)

(assert (=> b!586697 m!564619))

(assert (=> b!586697 m!564619))

(declare-fun m!564621 () Bool)

(assert (=> b!586697 m!564621))

(declare-fun m!564623 () Bool)

(assert (=> b!586703 m!564623))

(declare-fun m!564625 () Bool)

(assert (=> b!586695 m!564625))

(assert (=> b!586695 m!564619))

(declare-fun m!564627 () Bool)

(assert (=> start!53772 m!564627))

(declare-fun m!564629 () Bool)

(assert (=> start!53772 m!564629))

(declare-fun m!564631 () Bool)

(assert (=> b!586705 m!564631))

(declare-fun m!564633 () Bool)

(assert (=> b!586705 m!564633))

(declare-fun m!564635 () Bool)

(assert (=> b!586705 m!564635))

(declare-fun m!564637 () Bool)

(assert (=> b!586704 m!564637))

(declare-fun m!564639 () Bool)

(assert (=> b!586701 m!564639))

(declare-fun m!564641 () Bool)

(assert (=> b!586702 m!564641))

(declare-fun m!564643 () Bool)

(assert (=> b!586699 m!564643))

(declare-fun m!564645 () Bool)

(assert (=> b!586699 m!564645))

(assert (=> b!586699 m!564619))

(assert (=> b!586699 m!564645))

(declare-fun m!564647 () Bool)

(assert (=> b!586699 m!564647))

(assert (=> b!586699 m!564633))

(assert (=> b!586699 m!564619))

(declare-fun m!564649 () Bool)

(assert (=> b!586699 m!564649))

(declare-fun m!564651 () Bool)

(assert (=> b!586699 m!564651))

(declare-fun m!564653 () Bool)

(assert (=> b!586700 m!564653))

(assert (=> b!586698 m!564619))

(assert (=> b!586698 m!564619))

(declare-fun m!564655 () Bool)

(assert (=> b!586698 m!564655))

(check-sat (not b!586699) (not b!586700) (not b!586701) (not b!586703) (not b!586698) (not b!586697) (not b!586704) (not b!586702) (not start!53772))
(check-sat)
