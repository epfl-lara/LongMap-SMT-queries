; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53658 () Bool)

(assert start!53658)

(declare-fun b!584771 () Bool)

(declare-fun res!372730 () Bool)

(declare-fun e!334679 () Bool)

(assert (=> b!584771 (=> (not res!372730) (not e!334679))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584771 (= res!372730 (validKeyInArray!0 k0!1786))))

(declare-fun b!584772 () Bool)

(declare-fun res!372731 () Bool)

(declare-fun e!334678 () Bool)

(assert (=> b!584772 (=> (not res!372731) (not e!334678))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36573 0))(
  ( (array!36574 (arr!17561 (Array (_ BitVec 32) (_ BitVec 64))) (size!17926 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36573)

(declare-datatypes ((SeekEntryResult!5998 0))(
  ( (MissingZero!5998 (index!26219 (_ BitVec 32))) (Found!5998 (index!26220 (_ BitVec 32))) (Intermediate!5998 (undefined!6810 Bool) (index!26221 (_ BitVec 32)) (x!55054 (_ BitVec 32))) (Undefined!5998) (MissingVacant!5998 (index!26222 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36573 (_ BitVec 32)) SeekEntryResult!5998)

(assert (=> b!584772 (= res!372731 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17561 a!2986) j!136) a!2986 mask!3053) (Found!5998 j!136)))))

(declare-fun b!584773 () Bool)

(assert (=> b!584773 (= e!334679 e!334678)))

(declare-fun res!372739 () Bool)

(assert (=> b!584773 (=> (not res!372739) (not e!334678))))

(declare-fun lt!265492 () SeekEntryResult!5998)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584773 (= res!372739 (or (= lt!265492 (MissingZero!5998 i!1108)) (= lt!265492 (MissingVacant!5998 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36573 (_ BitVec 32)) SeekEntryResult!5998)

(assert (=> b!584773 (= lt!265492 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584774 () Bool)

(declare-fun res!372732 () Bool)

(assert (=> b!584774 (=> (not res!372732) (not e!334679))))

(declare-fun arrayContainsKey!0 (array!36573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584774 (= res!372732 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584775 () Bool)

(declare-fun e!334680 () Bool)

(assert (=> b!584775 (= e!334678 e!334680)))

(declare-fun res!372735 () Bool)

(assert (=> b!584775 (=> (not res!372735) (not e!334680))))

(declare-fun lt!265490 () (_ BitVec 32))

(assert (=> b!584775 (= res!372735 (and (bvsge lt!265490 #b00000000000000000000000000000000) (bvslt lt!265490 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584775 (= lt!265490 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584776 () Bool)

(declare-fun res!372733 () Bool)

(assert (=> b!584776 (=> (not res!372733) (not e!334678))))

(assert (=> b!584776 (= res!372733 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17561 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17561 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584777 () Bool)

(declare-fun res!372736 () Bool)

(assert (=> b!584777 (=> (not res!372736) (not e!334679))))

(assert (=> b!584777 (= res!372736 (and (= (size!17926 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17926 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17926 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584778 () Bool)

(declare-fun res!372738 () Bool)

(assert (=> b!584778 (=> (not res!372738) (not e!334679))))

(assert (=> b!584778 (= res!372738 (validKeyInArray!0 (select (arr!17561 a!2986) j!136)))))

(declare-fun b!584779 () Bool)

(assert (=> b!584779 (= e!334680 false)))

(declare-fun lt!265491 () SeekEntryResult!5998)

(assert (=> b!584779 (= lt!265491 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265490 vacantSpotIndex!68 (select (arr!17561 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!372729 () Bool)

(assert (=> start!53658 (=> (not res!372729) (not e!334679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53658 (= res!372729 (validMask!0 mask!3053))))

(assert (=> start!53658 e!334679))

(assert (=> start!53658 true))

(declare-fun array_inv!13444 (array!36573) Bool)

(assert (=> start!53658 (array_inv!13444 a!2986)))

(declare-fun b!584780 () Bool)

(declare-fun res!372734 () Bool)

(assert (=> b!584780 (=> (not res!372734) (not e!334678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36573 (_ BitVec 32)) Bool)

(assert (=> b!584780 (= res!372734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584781 () Bool)

(declare-fun res!372740 () Bool)

(assert (=> b!584781 (=> (not res!372740) (not e!334678))))

(declare-datatypes ((List!11641 0))(
  ( (Nil!11638) (Cons!11637 (h!12682 (_ BitVec 64)) (t!17860 List!11641)) )
))
(declare-fun arrayNoDuplicates!0 (array!36573 (_ BitVec 32) List!11641) Bool)

(assert (=> b!584781 (= res!372740 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11638))))

(declare-fun b!584782 () Bool)

(declare-fun res!372737 () Bool)

(assert (=> b!584782 (=> (not res!372737) (not e!334678))))

(assert (=> b!584782 (= res!372737 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17561 a!2986) index!984) (select (arr!17561 a!2986) j!136))) (not (= (select (arr!17561 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53658 res!372729) b!584777))

(assert (= (and b!584777 res!372736) b!584778))

(assert (= (and b!584778 res!372738) b!584771))

(assert (= (and b!584771 res!372730) b!584774))

(assert (= (and b!584774 res!372732) b!584773))

(assert (= (and b!584773 res!372739) b!584780))

(assert (= (and b!584780 res!372734) b!584781))

(assert (= (and b!584781 res!372740) b!584776))

(assert (= (and b!584776 res!372733) b!584772))

(assert (= (and b!584772 res!372731) b!584782))

(assert (= (and b!584782 res!372737) b!584775))

(assert (= (and b!584775 res!372735) b!584779))

(declare-fun m!562543 () Bool)

(assert (=> b!584782 m!562543))

(declare-fun m!562545 () Bool)

(assert (=> b!584782 m!562545))

(declare-fun m!562547 () Bool)

(assert (=> start!53658 m!562547))

(declare-fun m!562549 () Bool)

(assert (=> start!53658 m!562549))

(assert (=> b!584772 m!562545))

(assert (=> b!584772 m!562545))

(declare-fun m!562551 () Bool)

(assert (=> b!584772 m!562551))

(declare-fun m!562553 () Bool)

(assert (=> b!584773 m!562553))

(declare-fun m!562555 () Bool)

(assert (=> b!584781 m!562555))

(assert (=> b!584778 m!562545))

(assert (=> b!584778 m!562545))

(declare-fun m!562557 () Bool)

(assert (=> b!584778 m!562557))

(declare-fun m!562559 () Bool)

(assert (=> b!584775 m!562559))

(declare-fun m!562561 () Bool)

(assert (=> b!584774 m!562561))

(declare-fun m!562563 () Bool)

(assert (=> b!584780 m!562563))

(assert (=> b!584779 m!562545))

(assert (=> b!584779 m!562545))

(declare-fun m!562565 () Bool)

(assert (=> b!584779 m!562565))

(declare-fun m!562567 () Bool)

(assert (=> b!584776 m!562567))

(declare-fun m!562569 () Bool)

(assert (=> b!584776 m!562569))

(declare-fun m!562571 () Bool)

(assert (=> b!584776 m!562571))

(declare-fun m!562573 () Bool)

(assert (=> b!584771 m!562573))

(check-sat (not b!584773) (not b!584774) (not b!584779) (not b!584771) (not b!584772) (not b!584778) (not b!584780) (not b!584781) (not start!53658) (not b!584775))
(check-sat)
