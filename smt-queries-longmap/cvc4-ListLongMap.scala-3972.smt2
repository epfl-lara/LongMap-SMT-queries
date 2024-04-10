; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53906 () Bool)

(assert start!53906)

(declare-fun res!375812 () Bool)

(declare-fun e!335900 () Bool)

(assert (=> start!53906 (=> (not res!375812) (not e!335900))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53906 (= res!375812 (validMask!0 mask!3053))))

(assert (=> start!53906 e!335900))

(assert (=> start!53906 true))

(declare-datatypes ((array!36750 0))(
  ( (array!36751 (arr!17648 (Array (_ BitVec 32) (_ BitVec 64))) (size!18012 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36750)

(declare-fun array_inv!13444 (array!36750) Bool)

(assert (=> start!53906 (array_inv!13444 a!2986)))

(declare-fun b!588175 () Bool)

(declare-fun res!375818 () Bool)

(assert (=> b!588175 (=> (not res!375818) (not e!335900))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588175 (= res!375818 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588176 () Bool)

(declare-fun e!335903 () Bool)

(assert (=> b!588176 (= e!335900 e!335903)))

(declare-fun res!375817 () Bool)

(assert (=> b!588176 (=> (not res!375817) (not e!335903))))

(declare-datatypes ((SeekEntryResult!6088 0))(
  ( (MissingZero!6088 (index!26582 (_ BitVec 32))) (Found!6088 (index!26583 (_ BitVec 32))) (Intermediate!6088 (undefined!6900 Bool) (index!26584 (_ BitVec 32)) (x!55382 (_ BitVec 32))) (Undefined!6088) (MissingVacant!6088 (index!26585 (_ BitVec 32))) )
))
(declare-fun lt!266673 () SeekEntryResult!6088)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588176 (= res!375817 (or (= lt!266673 (MissingZero!6088 i!1108)) (= lt!266673 (MissingVacant!6088 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36750 (_ BitVec 32)) SeekEntryResult!6088)

(assert (=> b!588176 (= lt!266673 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588177 () Bool)

(declare-fun res!375816 () Bool)

(assert (=> b!588177 (=> (not res!375816) (not e!335900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588177 (= res!375816 (validKeyInArray!0 k!1786))))

(declare-fun b!588178 () Bool)

(declare-fun e!335901 () Bool)

(assert (=> b!588178 (= e!335901 (not true))))

(declare-fun e!335902 () Bool)

(assert (=> b!588178 e!335902))

(declare-fun res!375821 () Bool)

(assert (=> b!588178 (=> (not res!375821) (not e!335902))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266671 () SeekEntryResult!6088)

(declare-fun lt!266670 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36750 (_ BitVec 32)) SeekEntryResult!6088)

(assert (=> b!588178 (= res!375821 (= lt!266671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266670 vacantSpotIndex!68 (select (store (arr!17648 a!2986) i!1108 k!1786) j!136) (array!36751 (store (arr!17648 a!2986) i!1108 k!1786) (size!18012 a!2986)) mask!3053)))))

(assert (=> b!588178 (= lt!266671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266670 vacantSpotIndex!68 (select (arr!17648 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18296 0))(
  ( (Unit!18297) )
))
(declare-fun lt!266674 () Unit!18296)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36750 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18296)

(assert (=> b!588178 (= lt!266674 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266670 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588178 (= lt!266670 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588179 () Bool)

(declare-fun res!375815 () Bool)

(assert (=> b!588179 (=> (not res!375815) (not e!335903))))

(assert (=> b!588179 (= res!375815 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17648 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17648 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588180 () Bool)

(declare-fun res!375811 () Bool)

(assert (=> b!588180 (=> (not res!375811) (not e!335900))))

(assert (=> b!588180 (= res!375811 (and (= (size!18012 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18012 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18012 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588181 () Bool)

(assert (=> b!588181 (= e!335903 e!335901)))

(declare-fun res!375819 () Bool)

(assert (=> b!588181 (=> (not res!375819) (not e!335901))))

(declare-fun lt!266672 () SeekEntryResult!6088)

(assert (=> b!588181 (= res!375819 (and (= lt!266672 (Found!6088 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17648 a!2986) index!984) (select (arr!17648 a!2986) j!136))) (not (= (select (arr!17648 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588181 (= lt!266672 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17648 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588182 () Bool)

(declare-fun res!375813 () Bool)

(assert (=> b!588182 (=> (not res!375813) (not e!335900))))

(assert (=> b!588182 (= res!375813 (validKeyInArray!0 (select (arr!17648 a!2986) j!136)))))

(declare-fun b!588183 () Bool)

(declare-fun res!375820 () Bool)

(assert (=> b!588183 (=> (not res!375820) (not e!335903))))

(declare-datatypes ((List!11689 0))(
  ( (Nil!11686) (Cons!11685 (h!12730 (_ BitVec 64)) (t!17917 List!11689)) )
))
(declare-fun arrayNoDuplicates!0 (array!36750 (_ BitVec 32) List!11689) Bool)

(assert (=> b!588183 (= res!375820 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11686))))

(declare-fun b!588184 () Bool)

(assert (=> b!588184 (= e!335902 (= lt!266672 lt!266671))))

(declare-fun b!588185 () Bool)

(declare-fun res!375814 () Bool)

(assert (=> b!588185 (=> (not res!375814) (not e!335903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36750 (_ BitVec 32)) Bool)

(assert (=> b!588185 (= res!375814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53906 res!375812) b!588180))

(assert (= (and b!588180 res!375811) b!588182))

(assert (= (and b!588182 res!375813) b!588177))

(assert (= (and b!588177 res!375816) b!588175))

(assert (= (and b!588175 res!375818) b!588176))

(assert (= (and b!588176 res!375817) b!588185))

(assert (= (and b!588185 res!375814) b!588183))

(assert (= (and b!588183 res!375820) b!588179))

(assert (= (and b!588179 res!375815) b!588181))

(assert (= (and b!588181 res!375819) b!588178))

(assert (= (and b!588178 res!375821) b!588184))

(declare-fun m!566687 () Bool)

(assert (=> b!588177 m!566687))

(declare-fun m!566689 () Bool)

(assert (=> b!588176 m!566689))

(declare-fun m!566691 () Bool)

(assert (=> b!588182 m!566691))

(assert (=> b!588182 m!566691))

(declare-fun m!566693 () Bool)

(assert (=> b!588182 m!566693))

(declare-fun m!566695 () Bool)

(assert (=> b!588178 m!566695))

(declare-fun m!566697 () Bool)

(assert (=> b!588178 m!566697))

(declare-fun m!566699 () Bool)

(assert (=> b!588178 m!566699))

(declare-fun m!566701 () Bool)

(assert (=> b!588178 m!566701))

(assert (=> b!588178 m!566691))

(declare-fun m!566703 () Bool)

(assert (=> b!588178 m!566703))

(assert (=> b!588178 m!566691))

(assert (=> b!588178 m!566697))

(declare-fun m!566705 () Bool)

(assert (=> b!588178 m!566705))

(declare-fun m!566707 () Bool)

(assert (=> b!588179 m!566707))

(assert (=> b!588179 m!566701))

(declare-fun m!566709 () Bool)

(assert (=> b!588179 m!566709))

(declare-fun m!566711 () Bool)

(assert (=> b!588175 m!566711))

(declare-fun m!566713 () Bool)

(assert (=> b!588183 m!566713))

(declare-fun m!566715 () Bool)

(assert (=> start!53906 m!566715))

(declare-fun m!566717 () Bool)

(assert (=> start!53906 m!566717))

(declare-fun m!566719 () Bool)

(assert (=> b!588181 m!566719))

(assert (=> b!588181 m!566691))

(assert (=> b!588181 m!566691))

(declare-fun m!566721 () Bool)

(assert (=> b!588181 m!566721))

(declare-fun m!566723 () Bool)

(assert (=> b!588185 m!566723))

(push 1)

