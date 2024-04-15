; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53898 () Bool)

(assert start!53898)

(declare-fun b!588036 () Bool)

(declare-fun e!335786 () Bool)

(assert (=> b!588036 (= e!335786 (not true))))

(declare-fun e!335789 () Bool)

(assert (=> b!588036 e!335789))

(declare-fun res!375817 () Bool)

(assert (=> b!588036 (=> (not res!375817) (not e!335789))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6088 0))(
  ( (MissingZero!6088 (index!26582 (_ BitVec 32))) (Found!6088 (index!26583 (_ BitVec 32))) (Intermediate!6088 (undefined!6900 Bool) (index!26584 (_ BitVec 32)) (x!55393 (_ BitVec 32))) (Undefined!6088) (MissingVacant!6088 (index!26585 (_ BitVec 32))) )
))
(declare-fun lt!266499 () SeekEntryResult!6088)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266498 () (_ BitVec 32))

(declare-datatypes ((array!36756 0))(
  ( (array!36757 (arr!17651 (Array (_ BitVec 32) (_ BitVec 64))) (size!18016 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36756)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36756 (_ BitVec 32)) SeekEntryResult!6088)

(assert (=> b!588036 (= res!375817 (= lt!266499 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266498 vacantSpotIndex!68 (select (store (arr!17651 a!2986) i!1108 k0!1786) j!136) (array!36757 (store (arr!17651 a!2986) i!1108 k0!1786) (size!18016 a!2986)) mask!3053)))))

(assert (=> b!588036 (= lt!266499 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266498 vacantSpotIndex!68 (select (arr!17651 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18282 0))(
  ( (Unit!18283) )
))
(declare-fun lt!266496 () Unit!18282)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36756 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18282)

(assert (=> b!588036 (= lt!266496 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266498 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588036 (= lt!266498 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588037 () Bool)

(declare-fun res!375819 () Bool)

(declare-fun e!335790 () Bool)

(assert (=> b!588037 (=> (not res!375819) (not e!335790))))

(declare-fun arrayContainsKey!0 (array!36756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588037 (= res!375819 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588038 () Bool)

(declare-fun e!335788 () Bool)

(assert (=> b!588038 (= e!335788 e!335786)))

(declare-fun res!375818 () Bool)

(assert (=> b!588038 (=> (not res!375818) (not e!335786))))

(declare-fun lt!266500 () SeekEntryResult!6088)

(assert (=> b!588038 (= res!375818 (and (= lt!266500 (Found!6088 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17651 a!2986) index!984) (select (arr!17651 a!2986) j!136))) (not (= (select (arr!17651 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588038 (= lt!266500 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17651 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588039 () Bool)

(declare-fun res!375824 () Bool)

(assert (=> b!588039 (=> (not res!375824) (not e!335790))))

(assert (=> b!588039 (= res!375824 (and (= (size!18016 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18016 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18016 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588040 () Bool)

(declare-fun res!375815 () Bool)

(assert (=> b!588040 (=> (not res!375815) (not e!335788))))

(declare-datatypes ((List!11731 0))(
  ( (Nil!11728) (Cons!11727 (h!12772 (_ BitVec 64)) (t!17950 List!11731)) )
))
(declare-fun arrayNoDuplicates!0 (array!36756 (_ BitVec 32) List!11731) Bool)

(assert (=> b!588040 (= res!375815 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11728))))

(declare-fun b!588041 () Bool)

(declare-fun res!375820 () Bool)

(assert (=> b!588041 (=> (not res!375820) (not e!335788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36756 (_ BitVec 32)) Bool)

(assert (=> b!588041 (= res!375820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588042 () Bool)

(assert (=> b!588042 (= e!335790 e!335788)))

(declare-fun res!375823 () Bool)

(assert (=> b!588042 (=> (not res!375823) (not e!335788))))

(declare-fun lt!266497 () SeekEntryResult!6088)

(assert (=> b!588042 (= res!375823 (or (= lt!266497 (MissingZero!6088 i!1108)) (= lt!266497 (MissingVacant!6088 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36756 (_ BitVec 32)) SeekEntryResult!6088)

(assert (=> b!588042 (= lt!266497 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588043 () Bool)

(declare-fun res!375822 () Bool)

(assert (=> b!588043 (=> (not res!375822) (not e!335788))))

(assert (=> b!588043 (= res!375822 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17651 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17651 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588044 () Bool)

(declare-fun res!375816 () Bool)

(assert (=> b!588044 (=> (not res!375816) (not e!335790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588044 (= res!375816 (validKeyInArray!0 k0!1786))))

(declare-fun res!375814 () Bool)

(assert (=> start!53898 (=> (not res!375814) (not e!335790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53898 (= res!375814 (validMask!0 mask!3053))))

(assert (=> start!53898 e!335790))

(assert (=> start!53898 true))

(declare-fun array_inv!13534 (array!36756) Bool)

(assert (=> start!53898 (array_inv!13534 a!2986)))

(declare-fun b!588045 () Bool)

(declare-fun res!375821 () Bool)

(assert (=> b!588045 (=> (not res!375821) (not e!335790))))

(assert (=> b!588045 (= res!375821 (validKeyInArray!0 (select (arr!17651 a!2986) j!136)))))

(declare-fun b!588046 () Bool)

(assert (=> b!588046 (= e!335789 (= lt!266500 lt!266499))))

(assert (= (and start!53898 res!375814) b!588039))

(assert (= (and b!588039 res!375824) b!588045))

(assert (= (and b!588045 res!375821) b!588044))

(assert (= (and b!588044 res!375816) b!588037))

(assert (= (and b!588037 res!375819) b!588042))

(assert (= (and b!588042 res!375823) b!588041))

(assert (= (and b!588041 res!375820) b!588040))

(assert (= (and b!588040 res!375815) b!588043))

(assert (= (and b!588043 res!375822) b!588038))

(assert (= (and b!588038 res!375818) b!588036))

(assert (= (and b!588036 res!375817) b!588046))

(declare-fun m!566053 () Bool)

(assert (=> b!588040 m!566053))

(declare-fun m!566055 () Bool)

(assert (=> b!588045 m!566055))

(assert (=> b!588045 m!566055))

(declare-fun m!566057 () Bool)

(assert (=> b!588045 m!566057))

(declare-fun m!566059 () Bool)

(assert (=> b!588037 m!566059))

(declare-fun m!566061 () Bool)

(assert (=> b!588036 m!566061))

(declare-fun m!566063 () Bool)

(assert (=> b!588036 m!566063))

(assert (=> b!588036 m!566055))

(declare-fun m!566065 () Bool)

(assert (=> b!588036 m!566065))

(assert (=> b!588036 m!566063))

(declare-fun m!566067 () Bool)

(assert (=> b!588036 m!566067))

(declare-fun m!566069 () Bool)

(assert (=> b!588036 m!566069))

(assert (=> b!588036 m!566055))

(declare-fun m!566071 () Bool)

(assert (=> b!588036 m!566071))

(declare-fun m!566073 () Bool)

(assert (=> b!588044 m!566073))

(declare-fun m!566075 () Bool)

(assert (=> b!588038 m!566075))

(assert (=> b!588038 m!566055))

(assert (=> b!588038 m!566055))

(declare-fun m!566077 () Bool)

(assert (=> b!588038 m!566077))

(declare-fun m!566079 () Bool)

(assert (=> start!53898 m!566079))

(declare-fun m!566081 () Bool)

(assert (=> start!53898 m!566081))

(declare-fun m!566083 () Bool)

(assert (=> b!588041 m!566083))

(declare-fun m!566085 () Bool)

(assert (=> b!588043 m!566085))

(assert (=> b!588043 m!566065))

(declare-fun m!566087 () Bool)

(assert (=> b!588043 m!566087))

(declare-fun m!566089 () Bool)

(assert (=> b!588042 m!566089))

(check-sat (not b!588037) (not b!588042) (not b!588044) (not b!588038) (not b!588041) (not b!588045) (not b!588040) (not start!53898) (not b!588036))
(check-sat)
