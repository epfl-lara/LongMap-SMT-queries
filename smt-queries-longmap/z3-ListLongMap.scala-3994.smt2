; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54204 () Bool)

(assert start!54204)

(declare-fun b!591749 () Bool)

(declare-datatypes ((Unit!18505 0))(
  ( (Unit!18506) )
))
(declare-fun e!337892 () Unit!18505)

(declare-fun Unit!18507 () Unit!18505)

(assert (=> b!591749 (= e!337892 Unit!18507)))

(declare-fun b!591750 () Bool)

(declare-fun e!337889 () Bool)

(declare-fun e!337894 () Bool)

(assert (=> b!591750 (= e!337889 e!337894)))

(declare-fun res!378589 () Bool)

(assert (=> b!591750 (=> res!378589 e!337894)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268527 () (_ BitVec 64))

(declare-fun lt!268534 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36879 0))(
  ( (array!36880 (arr!17707 (Array (_ BitVec 32) (_ BitVec 64))) (size!18071 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36879)

(assert (=> b!591750 (= res!378589 (or (not (= (select (arr!17707 a!2986) j!136) lt!268527)) (not (= (select (arr!17707 a!2986) j!136) lt!268534)) (bvsge j!136 index!984)))))

(declare-fun b!591751 () Bool)

(declare-fun e!337898 () Bool)

(declare-fun e!337890 () Bool)

(assert (=> b!591751 (= e!337898 e!337890)))

(declare-fun res!378586 () Bool)

(assert (=> b!591751 (=> (not res!378586) (not e!337890))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591751 (= res!378586 (= (select (store (arr!17707 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268528 () array!36879)

(assert (=> b!591751 (= lt!268528 (array!36880 (store (arr!17707 a!2986) i!1108 k0!1786) (size!18071 a!2986)))))

(declare-fun b!591752 () Bool)

(declare-fun res!378575 () Bool)

(declare-fun e!337899 () Bool)

(assert (=> b!591752 (=> (not res!378575) (not e!337899))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!591752 (= res!378575 (and (= (size!18071 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18071 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18071 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591753 () Bool)

(declare-fun e!337893 () Bool)

(assert (=> b!591753 (= e!337890 e!337893)))

(declare-fun res!378584 () Bool)

(assert (=> b!591753 (=> (not res!378584) (not e!337893))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6103 0))(
  ( (MissingZero!6103 (index!26648 (_ BitVec 32))) (Found!6103 (index!26649 (_ BitVec 32))) (Intermediate!6103 (undefined!6915 Bool) (index!26650 (_ BitVec 32)) (x!55594 (_ BitVec 32))) (Undefined!6103) (MissingVacant!6103 (index!26651 (_ BitVec 32))) )
))
(declare-fun lt!268525 () SeekEntryResult!6103)

(assert (=> b!591753 (= res!378584 (and (= lt!268525 (Found!6103 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17707 a!2986) index!984) (select (arr!17707 a!2986) j!136))) (not (= (select (arr!17707 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36879 (_ BitVec 32)) SeekEntryResult!6103)

(assert (=> b!591753 (= lt!268525 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17707 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591754 () Bool)

(declare-fun res!378581 () Bool)

(assert (=> b!591754 (=> (not res!378581) (not e!337899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591754 (= res!378581 (validKeyInArray!0 k0!1786))))

(declare-fun b!591755 () Bool)

(declare-fun e!337897 () Bool)

(assert (=> b!591755 (= e!337893 (not e!337897))))

(declare-fun res!378585 () Bool)

(assert (=> b!591755 (=> res!378585 e!337897)))

(declare-fun lt!268533 () SeekEntryResult!6103)

(assert (=> b!591755 (= res!378585 (not (= lt!268533 (Found!6103 index!984))))))

(declare-fun lt!268526 () Unit!18505)

(assert (=> b!591755 (= lt!268526 e!337892)))

(declare-fun c!66956 () Bool)

(assert (=> b!591755 (= c!66956 (= lt!268533 Undefined!6103))))

(assert (=> b!591755 (= lt!268533 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268527 lt!268528 mask!3053))))

(declare-fun e!337891 () Bool)

(assert (=> b!591755 e!337891))

(declare-fun res!378582 () Bool)

(assert (=> b!591755 (=> (not res!378582) (not e!337891))))

(declare-fun lt!268530 () SeekEntryResult!6103)

(declare-fun lt!268531 () (_ BitVec 32))

(assert (=> b!591755 (= res!378582 (= lt!268530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268531 vacantSpotIndex!68 lt!268527 lt!268528 mask!3053)))))

(assert (=> b!591755 (= lt!268530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268531 vacantSpotIndex!68 (select (arr!17707 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591755 (= lt!268527 (select (store (arr!17707 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268529 () Unit!18505)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36879 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18505)

(assert (=> b!591755 (= lt!268529 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268531 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591755 (= lt!268531 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!591756 () Bool)

(declare-fun e!337896 () Bool)

(declare-fun arrayContainsKey!0 (array!36879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591756 (= e!337896 (arrayContainsKey!0 lt!268528 (select (arr!17707 a!2986) j!136) index!984))))

(declare-fun b!591757 () Bool)

(assert (=> b!591757 (= e!337897 true)))

(assert (=> b!591757 e!337889))

(declare-fun res!378578 () Bool)

(assert (=> b!591757 (=> (not res!378578) (not e!337889))))

(assert (=> b!591757 (= res!378578 (= lt!268534 (select (arr!17707 a!2986) j!136)))))

(assert (=> b!591757 (= lt!268534 (select (store (arr!17707 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591758 () Bool)

(declare-fun res!378588 () Bool)

(assert (=> b!591758 (=> (not res!378588) (not e!337899))))

(assert (=> b!591758 (= res!378588 (validKeyInArray!0 (select (arr!17707 a!2986) j!136)))))

(declare-fun b!591759 () Bool)

(declare-fun res!378587 () Bool)

(assert (=> b!591759 (=> (not res!378587) (not e!337898))))

(declare-datatypes ((List!11655 0))(
  ( (Nil!11652) (Cons!11651 (h!12699 (_ BitVec 64)) (t!17875 List!11655)) )
))
(declare-fun arrayNoDuplicates!0 (array!36879 (_ BitVec 32) List!11655) Bool)

(assert (=> b!591759 (= res!378587 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11652))))

(declare-fun res!378579 () Bool)

(assert (=> start!54204 (=> (not res!378579) (not e!337899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54204 (= res!378579 (validMask!0 mask!3053))))

(assert (=> start!54204 e!337899))

(assert (=> start!54204 true))

(declare-fun array_inv!13566 (array!36879) Bool)

(assert (=> start!54204 (array_inv!13566 a!2986)))

(declare-fun b!591760 () Bool)

(assert (=> b!591760 (= e!337899 e!337898)))

(declare-fun res!378576 () Bool)

(assert (=> b!591760 (=> (not res!378576) (not e!337898))))

(declare-fun lt!268532 () SeekEntryResult!6103)

(assert (=> b!591760 (= res!378576 (or (= lt!268532 (MissingZero!6103 i!1108)) (= lt!268532 (MissingVacant!6103 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36879 (_ BitVec 32)) SeekEntryResult!6103)

(assert (=> b!591760 (= lt!268532 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591761 () Bool)

(declare-fun res!378580 () Bool)

(assert (=> b!591761 (=> (not res!378580) (not e!337898))))

(assert (=> b!591761 (= res!378580 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17707 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591762 () Bool)

(declare-fun Unit!18508 () Unit!18505)

(assert (=> b!591762 (= e!337892 Unit!18508)))

(assert (=> b!591762 false))

(declare-fun b!591763 () Bool)

(assert (=> b!591763 (= e!337894 e!337896)))

(declare-fun res!378583 () Bool)

(assert (=> b!591763 (=> (not res!378583) (not e!337896))))

(assert (=> b!591763 (= res!378583 (arrayContainsKey!0 lt!268528 (select (arr!17707 a!2986) j!136) j!136))))

(declare-fun b!591764 () Bool)

(assert (=> b!591764 (= e!337891 (= lt!268525 lt!268530))))

(declare-fun b!591765 () Bool)

(declare-fun res!378574 () Bool)

(assert (=> b!591765 (=> (not res!378574) (not e!337898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36879 (_ BitVec 32)) Bool)

(assert (=> b!591765 (= res!378574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591766 () Bool)

(declare-fun res!378577 () Bool)

(assert (=> b!591766 (=> (not res!378577) (not e!337899))))

(assert (=> b!591766 (= res!378577 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54204 res!378579) b!591752))

(assert (= (and b!591752 res!378575) b!591758))

(assert (= (and b!591758 res!378588) b!591754))

(assert (= (and b!591754 res!378581) b!591766))

(assert (= (and b!591766 res!378577) b!591760))

(assert (= (and b!591760 res!378576) b!591765))

(assert (= (and b!591765 res!378574) b!591759))

(assert (= (and b!591759 res!378587) b!591761))

(assert (= (and b!591761 res!378580) b!591751))

(assert (= (and b!591751 res!378586) b!591753))

(assert (= (and b!591753 res!378584) b!591755))

(assert (= (and b!591755 res!378582) b!591764))

(assert (= (and b!591755 c!66956) b!591762))

(assert (= (and b!591755 (not c!66956)) b!591749))

(assert (= (and b!591755 (not res!378585)) b!591757))

(assert (= (and b!591757 res!378578) b!591750))

(assert (= (and b!591750 (not res!378589)) b!591763))

(assert (= (and b!591763 res!378583) b!591756))

(declare-fun m!570149 () Bool)

(assert (=> b!591754 m!570149))

(declare-fun m!570151 () Bool)

(assert (=> b!591757 m!570151))

(declare-fun m!570153 () Bool)

(assert (=> b!591757 m!570153))

(declare-fun m!570155 () Bool)

(assert (=> b!591757 m!570155))

(assert (=> b!591763 m!570151))

(assert (=> b!591763 m!570151))

(declare-fun m!570157 () Bool)

(assert (=> b!591763 m!570157))

(declare-fun m!570159 () Bool)

(assert (=> b!591765 m!570159))

(assert (=> b!591758 m!570151))

(assert (=> b!591758 m!570151))

(declare-fun m!570161 () Bool)

(assert (=> b!591758 m!570161))

(declare-fun m!570163 () Bool)

(assert (=> b!591766 m!570163))

(declare-fun m!570165 () Bool)

(assert (=> b!591761 m!570165))

(assert (=> b!591756 m!570151))

(assert (=> b!591756 m!570151))

(declare-fun m!570167 () Bool)

(assert (=> b!591756 m!570167))

(declare-fun m!570169 () Bool)

(assert (=> b!591760 m!570169))

(declare-fun m!570171 () Bool)

(assert (=> start!54204 m!570171))

(declare-fun m!570173 () Bool)

(assert (=> start!54204 m!570173))

(declare-fun m!570175 () Bool)

(assert (=> b!591753 m!570175))

(assert (=> b!591753 m!570151))

(assert (=> b!591753 m!570151))

(declare-fun m!570177 () Bool)

(assert (=> b!591753 m!570177))

(assert (=> b!591750 m!570151))

(declare-fun m!570179 () Bool)

(assert (=> b!591755 m!570179))

(assert (=> b!591755 m!570151))

(assert (=> b!591755 m!570153))

(assert (=> b!591755 m!570151))

(declare-fun m!570181 () Bool)

(assert (=> b!591755 m!570181))

(declare-fun m!570183 () Bool)

(assert (=> b!591755 m!570183))

(declare-fun m!570185 () Bool)

(assert (=> b!591755 m!570185))

(declare-fun m!570187 () Bool)

(assert (=> b!591755 m!570187))

(declare-fun m!570189 () Bool)

(assert (=> b!591755 m!570189))

(assert (=> b!591751 m!570153))

(declare-fun m!570191 () Bool)

(assert (=> b!591751 m!570191))

(declare-fun m!570193 () Bool)

(assert (=> b!591759 m!570193))

(check-sat (not b!591759) (not b!591765) (not b!591755) (not b!591766) (not b!591753) (not b!591763) (not start!54204) (not b!591754) (not b!591758) (not b!591760) (not b!591756))
(check-sat)
