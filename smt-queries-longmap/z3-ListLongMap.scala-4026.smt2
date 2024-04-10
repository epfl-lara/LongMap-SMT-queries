; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54864 () Bool)

(assert start!54864)

(declare-fun b!599789 () Bool)

(declare-fun e!342912 () Bool)

(declare-fun e!342911 () Bool)

(assert (=> b!599789 (= e!342912 e!342911)))

(declare-fun res!384751 () Bool)

(assert (=> b!599789 (=> (not res!384751) (not e!342911))))

(declare-datatypes ((SeekEntryResult!6249 0))(
  ( (MissingZero!6249 (index!27253 (_ BitVec 32))) (Found!6249 (index!27254 (_ BitVec 32))) (Intermediate!6249 (undefined!7061 Bool) (index!27255 (_ BitVec 32)) (x!56056 (_ BitVec 32))) (Undefined!6249) (MissingVacant!6249 (index!27256 (_ BitVec 32))) )
))
(declare-fun lt!272718 () SeekEntryResult!6249)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599789 (= res!384751 (or (= lt!272718 (MissingZero!6249 i!1108)) (= lt!272718 (MissingVacant!6249 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37099 0))(
  ( (array!37100 (arr!17809 (Array (_ BitVec 32) (_ BitVec 64))) (size!18173 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37099)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37099 (_ BitVec 32)) SeekEntryResult!6249)

(assert (=> b!599789 (= lt!272718 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!384739 () Bool)

(assert (=> start!54864 (=> (not res!384739) (not e!342912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54864 (= res!384739 (validMask!0 mask!3053))))

(assert (=> start!54864 e!342912))

(assert (=> start!54864 true))

(declare-fun array_inv!13605 (array!37099) Bool)

(assert (=> start!54864 (array_inv!13605 a!2986)))

(declare-fun b!599790 () Bool)

(declare-fun e!342918 () Bool)

(declare-fun e!342920 () Bool)

(assert (=> b!599790 (= e!342918 e!342920)))

(declare-fun res!384748 () Bool)

(assert (=> b!599790 (=> res!384748 e!342920)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272726 () (_ BitVec 64))

(declare-fun lt!272725 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599790 (= res!384748 (or (not (= (select (arr!17809 a!2986) j!136) lt!272725)) (not (= (select (arr!17809 a!2986) j!136) lt!272726)) (bvsge j!136 index!984)))))

(declare-fun e!342914 () Bool)

(assert (=> b!599790 e!342914))

(declare-fun res!384750 () Bool)

(assert (=> b!599790 (=> (not res!384750) (not e!342914))))

(assert (=> b!599790 (= res!384750 (= lt!272726 (select (arr!17809 a!2986) j!136)))))

(assert (=> b!599790 (= lt!272726 (select (store (arr!17809 a!2986) i!1108 k0!1786) index!984))))

(declare-fun lt!272720 () array!37099)

(declare-fun e!342909 () Bool)

(declare-fun b!599791 () Bool)

(declare-fun arrayContainsKey!0 (array!37099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599791 (= e!342909 (arrayContainsKey!0 lt!272720 (select (arr!17809 a!2986) j!136) index!984))))

(declare-fun b!599792 () Bool)

(declare-fun e!342919 () Bool)

(assert (=> b!599792 (= e!342914 e!342919)))

(declare-fun res!384736 () Bool)

(assert (=> b!599792 (=> res!384736 e!342919)))

(assert (=> b!599792 (= res!384736 (or (not (= (select (arr!17809 a!2986) j!136) lt!272725)) (not (= (select (arr!17809 a!2986) j!136) lt!272726)) (bvsge j!136 index!984)))))

(declare-fun b!599793 () Bool)

(declare-fun res!384744 () Bool)

(declare-fun e!342917 () Bool)

(assert (=> b!599793 (=> res!384744 e!342917)))

(declare-datatypes ((List!11850 0))(
  ( (Nil!11847) (Cons!11846 (h!12891 (_ BitVec 64)) (t!18078 List!11850)) )
))
(declare-fun noDuplicate!283 (List!11850) Bool)

(assert (=> b!599793 (= res!384744 (not (noDuplicate!283 Nil!11847)))))

(declare-fun b!599794 () Bool)

(declare-fun res!384738 () Bool)

(assert (=> b!599794 (=> (not res!384738) (not e!342911))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599794 (= res!384738 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17809 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599795 () Bool)

(declare-fun res!384746 () Bool)

(assert (=> b!599795 (=> (not res!384746) (not e!342912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599795 (= res!384746 (validKeyInArray!0 (select (arr!17809 a!2986) j!136)))))

(declare-fun b!599796 () Bool)

(declare-fun e!342921 () Bool)

(assert (=> b!599796 (= e!342911 e!342921)))

(declare-fun res!384740 () Bool)

(assert (=> b!599796 (=> (not res!384740) (not e!342921))))

(assert (=> b!599796 (= res!384740 (= (select (store (arr!17809 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599796 (= lt!272720 (array!37100 (store (arr!17809 a!2986) i!1108 k0!1786) (size!18173 a!2986)))))

(declare-fun b!599797 () Bool)

(declare-fun res!384733 () Bool)

(assert (=> b!599797 (=> (not res!384733) (not e!342911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37099 (_ BitVec 32)) Bool)

(assert (=> b!599797 (= res!384733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599798 () Bool)

(declare-fun e!342913 () Bool)

(assert (=> b!599798 (= e!342913 (not e!342918))))

(declare-fun res!384745 () Bool)

(assert (=> b!599798 (=> res!384745 e!342918)))

(declare-fun lt!272729 () SeekEntryResult!6249)

(assert (=> b!599798 (= res!384745 (not (= lt!272729 (Found!6249 index!984))))))

(declare-datatypes ((Unit!18914 0))(
  ( (Unit!18915) )
))
(declare-fun lt!272728 () Unit!18914)

(declare-fun e!342910 () Unit!18914)

(assert (=> b!599798 (= lt!272728 e!342910)))

(declare-fun c!67895 () Bool)

(assert (=> b!599798 (= c!67895 (= lt!272729 Undefined!6249))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37099 (_ BitVec 32)) SeekEntryResult!6249)

(assert (=> b!599798 (= lt!272729 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272725 lt!272720 mask!3053))))

(declare-fun e!342915 () Bool)

(assert (=> b!599798 e!342915))

(declare-fun res!384747 () Bool)

(assert (=> b!599798 (=> (not res!384747) (not e!342915))))

(declare-fun lt!272721 () (_ BitVec 32))

(declare-fun lt!272731 () SeekEntryResult!6249)

(assert (=> b!599798 (= res!384747 (= lt!272731 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272721 vacantSpotIndex!68 lt!272725 lt!272720 mask!3053)))))

(assert (=> b!599798 (= lt!272731 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272721 vacantSpotIndex!68 (select (arr!17809 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599798 (= lt!272725 (select (store (arr!17809 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272727 () Unit!18914)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37099 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18914)

(assert (=> b!599798 (= lt!272727 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272721 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599798 (= lt!272721 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599799 () Bool)

(assert (=> b!599799 (= e!342917 true)))

(declare-fun lt!272724 () Bool)

(declare-fun contains!2966 (List!11850 (_ BitVec 64)) Bool)

(assert (=> b!599799 (= lt!272724 (contains!2966 Nil!11847 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599800 () Bool)

(declare-fun lt!272719 () SeekEntryResult!6249)

(assert (=> b!599800 (= e!342915 (= lt!272719 lt!272731))))

(declare-fun b!599801 () Bool)

(declare-fun res!384734 () Bool)

(assert (=> b!599801 (=> res!384734 e!342917)))

(assert (=> b!599801 (= res!384734 (contains!2966 Nil!11847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599802 () Bool)

(assert (=> b!599802 (= e!342921 e!342913)))

(declare-fun res!384743 () Bool)

(assert (=> b!599802 (=> (not res!384743) (not e!342913))))

(assert (=> b!599802 (= res!384743 (and (= lt!272719 (Found!6249 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17809 a!2986) index!984) (select (arr!17809 a!2986) j!136))) (not (= (select (arr!17809 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599802 (= lt!272719 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17809 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599803 () Bool)

(declare-fun res!384742 () Bool)

(assert (=> b!599803 (=> (not res!384742) (not e!342912))))

(assert (=> b!599803 (= res!384742 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599804 () Bool)

(assert (=> b!599804 (= e!342920 e!342917)))

(declare-fun res!384735 () Bool)

(assert (=> b!599804 (=> res!384735 e!342917)))

(assert (=> b!599804 (= res!384735 (or (bvsge (size!18173 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18173 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37099 (_ BitVec 32) List!11850) Bool)

(assert (=> b!599804 (arrayNoDuplicates!0 lt!272720 j!136 Nil!11847)))

(declare-fun lt!272722 () Unit!18914)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37099 (_ BitVec 32) (_ BitVec 32)) Unit!18914)

(assert (=> b!599804 (= lt!272722 (lemmaNoDuplicateFromThenFromBigger!0 lt!272720 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599804 (arrayNoDuplicates!0 lt!272720 #b00000000000000000000000000000000 Nil!11847)))

(declare-fun lt!272730 () Unit!18914)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37099 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11850) Unit!18914)

(assert (=> b!599804 (= lt!272730 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11847))))

(assert (=> b!599804 (arrayContainsKey!0 lt!272720 (select (arr!17809 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272723 () Unit!18914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37099 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18914)

(assert (=> b!599804 (= lt!272723 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272720 (select (arr!17809 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599805 () Bool)

(declare-fun Unit!18916 () Unit!18914)

(assert (=> b!599805 (= e!342910 Unit!18916)))

(declare-fun b!599806 () Bool)

(declare-fun res!384749 () Bool)

(assert (=> b!599806 (=> (not res!384749) (not e!342912))))

(assert (=> b!599806 (= res!384749 (validKeyInArray!0 k0!1786))))

(declare-fun b!599807 () Bool)

(declare-fun res!384737 () Bool)

(assert (=> b!599807 (=> (not res!384737) (not e!342912))))

(assert (=> b!599807 (= res!384737 (and (= (size!18173 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18173 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18173 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599808 () Bool)

(assert (=> b!599808 (= e!342919 e!342909)))

(declare-fun res!384752 () Bool)

(assert (=> b!599808 (=> (not res!384752) (not e!342909))))

(assert (=> b!599808 (= res!384752 (arrayContainsKey!0 lt!272720 (select (arr!17809 a!2986) j!136) j!136))))

(declare-fun b!599809 () Bool)

(declare-fun Unit!18917 () Unit!18914)

(assert (=> b!599809 (= e!342910 Unit!18917)))

(assert (=> b!599809 false))

(declare-fun b!599810 () Bool)

(declare-fun res!384741 () Bool)

(assert (=> b!599810 (=> (not res!384741) (not e!342911))))

(assert (=> b!599810 (= res!384741 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11847))))

(assert (= (and start!54864 res!384739) b!599807))

(assert (= (and b!599807 res!384737) b!599795))

(assert (= (and b!599795 res!384746) b!599806))

(assert (= (and b!599806 res!384749) b!599803))

(assert (= (and b!599803 res!384742) b!599789))

(assert (= (and b!599789 res!384751) b!599797))

(assert (= (and b!599797 res!384733) b!599810))

(assert (= (and b!599810 res!384741) b!599794))

(assert (= (and b!599794 res!384738) b!599796))

(assert (= (and b!599796 res!384740) b!599802))

(assert (= (and b!599802 res!384743) b!599798))

(assert (= (and b!599798 res!384747) b!599800))

(assert (= (and b!599798 c!67895) b!599809))

(assert (= (and b!599798 (not c!67895)) b!599805))

(assert (= (and b!599798 (not res!384745)) b!599790))

(assert (= (and b!599790 res!384750) b!599792))

(assert (= (and b!599792 (not res!384736)) b!599808))

(assert (= (and b!599808 res!384752) b!599791))

(assert (= (and b!599790 (not res!384748)) b!599804))

(assert (= (and b!599804 (not res!384735)) b!599793))

(assert (= (and b!599793 (not res!384744)) b!599801))

(assert (= (and b!599801 (not res!384734)) b!599799))

(declare-fun m!577029 () Bool)

(assert (=> b!599802 m!577029))

(declare-fun m!577031 () Bool)

(assert (=> b!599802 m!577031))

(assert (=> b!599802 m!577031))

(declare-fun m!577033 () Bool)

(assert (=> b!599802 m!577033))

(assert (=> b!599790 m!577031))

(declare-fun m!577035 () Bool)

(assert (=> b!599790 m!577035))

(declare-fun m!577037 () Bool)

(assert (=> b!599790 m!577037))

(declare-fun m!577039 () Bool)

(assert (=> b!599797 m!577039))

(declare-fun m!577041 () Bool)

(assert (=> b!599810 m!577041))

(declare-fun m!577043 () Bool)

(assert (=> b!599804 m!577043))

(assert (=> b!599804 m!577031))

(assert (=> b!599804 m!577031))

(declare-fun m!577045 () Bool)

(assert (=> b!599804 m!577045))

(declare-fun m!577047 () Bool)

(assert (=> b!599804 m!577047))

(assert (=> b!599804 m!577031))

(declare-fun m!577049 () Bool)

(assert (=> b!599804 m!577049))

(declare-fun m!577051 () Bool)

(assert (=> b!599804 m!577051))

(declare-fun m!577053 () Bool)

(assert (=> b!599804 m!577053))

(declare-fun m!577055 () Bool)

(assert (=> b!599798 m!577055))

(assert (=> b!599798 m!577031))

(assert (=> b!599798 m!577035))

(declare-fun m!577057 () Bool)

(assert (=> b!599798 m!577057))

(declare-fun m!577059 () Bool)

(assert (=> b!599798 m!577059))

(assert (=> b!599798 m!577031))

(declare-fun m!577061 () Bool)

(assert (=> b!599798 m!577061))

(declare-fun m!577063 () Bool)

(assert (=> b!599798 m!577063))

(declare-fun m!577065 () Bool)

(assert (=> b!599798 m!577065))

(declare-fun m!577067 () Bool)

(assert (=> b!599794 m!577067))

(declare-fun m!577069 () Bool)

(assert (=> b!599789 m!577069))

(declare-fun m!577071 () Bool)

(assert (=> b!599793 m!577071))

(declare-fun m!577073 () Bool)

(assert (=> b!599803 m!577073))

(assert (=> b!599791 m!577031))

(assert (=> b!599791 m!577031))

(declare-fun m!577075 () Bool)

(assert (=> b!599791 m!577075))

(assert (=> b!599796 m!577035))

(declare-fun m!577077 () Bool)

(assert (=> b!599796 m!577077))

(assert (=> b!599795 m!577031))

(assert (=> b!599795 m!577031))

(declare-fun m!577079 () Bool)

(assert (=> b!599795 m!577079))

(assert (=> b!599792 m!577031))

(assert (=> b!599808 m!577031))

(assert (=> b!599808 m!577031))

(declare-fun m!577081 () Bool)

(assert (=> b!599808 m!577081))

(declare-fun m!577083 () Bool)

(assert (=> b!599799 m!577083))

(declare-fun m!577085 () Bool)

(assert (=> start!54864 m!577085))

(declare-fun m!577087 () Bool)

(assert (=> start!54864 m!577087))

(declare-fun m!577089 () Bool)

(assert (=> b!599801 m!577089))

(declare-fun m!577091 () Bool)

(assert (=> b!599806 m!577091))

(check-sat (not b!599808) (not b!599803) (not start!54864) (not b!599804) (not b!599789) (not b!599802) (not b!599793) (not b!599801) (not b!599798) (not b!599791) (not b!599806) (not b!599810) (not b!599795) (not b!599797) (not b!599799))
(check-sat)
