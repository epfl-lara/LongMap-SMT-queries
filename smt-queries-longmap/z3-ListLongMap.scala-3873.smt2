; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53250 () Bool)

(assert start!53250)

(declare-fun b!578890 () Bool)

(declare-fun res!366708 () Bool)

(declare-fun e!332817 () Bool)

(assert (=> b!578890 (=> (not res!366708) (not e!332817))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36151 0))(
  ( (array!36152 (arr!17350 (Array (_ BitVec 32) (_ BitVec 64))) (size!17714 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36151)

(assert (=> b!578890 (= res!366708 (and (= (size!17714 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17714 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17714 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578891 () Bool)

(declare-fun res!366712 () Bool)

(assert (=> b!578891 (=> (not res!366712) (not e!332817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578891 (= res!366712 (validKeyInArray!0 (select (arr!17350 a!2986) j!136)))))

(declare-fun b!578892 () Bool)

(declare-fun res!366705 () Bool)

(assert (=> b!578892 (=> (not res!366705) (not e!332817))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!578892 (= res!366705 (validKeyInArray!0 k0!1786))))

(declare-fun b!578893 () Bool)

(declare-fun res!366707 () Bool)

(assert (=> b!578893 (=> (not res!366707) (not e!332817))))

(declare-fun arrayContainsKey!0 (array!36151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578893 (= res!366707 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578894 () Bool)

(declare-fun res!366713 () Bool)

(declare-fun e!332815 () Bool)

(assert (=> b!578894 (=> (not res!366713) (not e!332815))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578894 (= res!366713 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17350 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17350 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578895 () Bool)

(assert (=> b!578895 (= e!332815 false)))

(declare-datatypes ((SeekEntryResult!5790 0))(
  ( (MissingZero!5790 (index!25387 (_ BitVec 32))) (Found!5790 (index!25388 (_ BitVec 32))) (Intermediate!5790 (undefined!6602 Bool) (index!25389 (_ BitVec 32)) (x!54283 (_ BitVec 32))) (Undefined!5790) (MissingVacant!5790 (index!25390 (_ BitVec 32))) )
))
(declare-fun lt!264361 () SeekEntryResult!5790)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36151 (_ BitVec 32)) SeekEntryResult!5790)

(assert (=> b!578895 (= lt!264361 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17350 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!366710 () Bool)

(assert (=> start!53250 (=> (not res!366710) (not e!332817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53250 (= res!366710 (validMask!0 mask!3053))))

(assert (=> start!53250 e!332817))

(assert (=> start!53250 true))

(declare-fun array_inv!13146 (array!36151) Bool)

(assert (=> start!53250 (array_inv!13146 a!2986)))

(declare-fun b!578889 () Bool)

(declare-fun res!366706 () Bool)

(assert (=> b!578889 (=> (not res!366706) (not e!332815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36151 (_ BitVec 32)) Bool)

(assert (=> b!578889 (= res!366706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578896 () Bool)

(assert (=> b!578896 (= e!332817 e!332815)))

(declare-fun res!366709 () Bool)

(assert (=> b!578896 (=> (not res!366709) (not e!332815))))

(declare-fun lt!264360 () SeekEntryResult!5790)

(assert (=> b!578896 (= res!366709 (or (= lt!264360 (MissingZero!5790 i!1108)) (= lt!264360 (MissingVacant!5790 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36151 (_ BitVec 32)) SeekEntryResult!5790)

(assert (=> b!578896 (= lt!264360 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578897 () Bool)

(declare-fun res!366711 () Bool)

(assert (=> b!578897 (=> (not res!366711) (not e!332815))))

(declare-datatypes ((List!11391 0))(
  ( (Nil!11388) (Cons!11387 (h!12432 (_ BitVec 64)) (t!17619 List!11391)) )
))
(declare-fun arrayNoDuplicates!0 (array!36151 (_ BitVec 32) List!11391) Bool)

(assert (=> b!578897 (= res!366711 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11388))))

(assert (= (and start!53250 res!366710) b!578890))

(assert (= (and b!578890 res!366708) b!578891))

(assert (= (and b!578891 res!366712) b!578892))

(assert (= (and b!578892 res!366705) b!578893))

(assert (= (and b!578893 res!366707) b!578896))

(assert (= (and b!578896 res!366709) b!578889))

(assert (= (and b!578889 res!366706) b!578897))

(assert (= (and b!578897 res!366711) b!578894))

(assert (= (and b!578894 res!366713) b!578895))

(declare-fun m!557529 () Bool)

(assert (=> b!578893 m!557529))

(declare-fun m!557531 () Bool)

(assert (=> b!578895 m!557531))

(assert (=> b!578895 m!557531))

(declare-fun m!557533 () Bool)

(assert (=> b!578895 m!557533))

(declare-fun m!557535 () Bool)

(assert (=> b!578889 m!557535))

(declare-fun m!557537 () Bool)

(assert (=> b!578894 m!557537))

(declare-fun m!557539 () Bool)

(assert (=> b!578894 m!557539))

(declare-fun m!557541 () Bool)

(assert (=> b!578894 m!557541))

(declare-fun m!557543 () Bool)

(assert (=> b!578897 m!557543))

(declare-fun m!557545 () Bool)

(assert (=> start!53250 m!557545))

(declare-fun m!557547 () Bool)

(assert (=> start!53250 m!557547))

(declare-fun m!557549 () Bool)

(assert (=> b!578896 m!557549))

(assert (=> b!578891 m!557531))

(assert (=> b!578891 m!557531))

(declare-fun m!557551 () Bool)

(assert (=> b!578891 m!557551))

(declare-fun m!557553 () Bool)

(assert (=> b!578892 m!557553))

(check-sat (not start!53250) (not b!578893) (not b!578889) (not b!578897) (not b!578896) (not b!578891) (not b!578892) (not b!578895))
