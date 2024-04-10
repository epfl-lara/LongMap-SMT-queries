; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53650 () Bool)

(assert start!53650)

(declare-fun b!584610 () Bool)

(declare-fun res!372430 () Bool)

(declare-fun e!334710 () Bool)

(assert (=> b!584610 (=> (not res!372430) (not e!334710))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36551 0))(
  ( (array!36552 (arr!17550 (Array (_ BitVec 32) (_ BitVec 64))) (size!17914 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36551)

(assert (=> b!584610 (= res!372430 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17550 a!2986) index!984) (select (arr!17550 a!2986) j!136))) (not (= (select (arr!17550 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584611 () Bool)

(declare-fun res!372436 () Bool)

(declare-fun e!334709 () Bool)

(assert (=> b!584611 (=> (not res!372436) (not e!334709))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584611 (= res!372436 (validKeyInArray!0 k!1786))))

(declare-fun b!584612 () Bool)

(declare-fun e!334708 () Bool)

(assert (=> b!584612 (= e!334710 e!334708)))

(declare-fun res!372429 () Bool)

(assert (=> b!584612 (=> (not res!372429) (not e!334708))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265618 () (_ BitVec 32))

(assert (=> b!584612 (= res!372429 (and (bvsge lt!265618 #b00000000000000000000000000000000) (bvslt lt!265618 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584612 (= lt!265618 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584613 () Bool)

(declare-fun res!372427 () Bool)

(assert (=> b!584613 (=> (not res!372427) (not e!334709))))

(declare-fun arrayContainsKey!0 (array!36551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584613 (= res!372427 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584614 () Bool)

(declare-fun res!372434 () Bool)

(assert (=> b!584614 (=> (not res!372434) (not e!334709))))

(assert (=> b!584614 (= res!372434 (validKeyInArray!0 (select (arr!17550 a!2986) j!136)))))

(declare-fun b!584615 () Bool)

(declare-fun res!372428 () Bool)

(assert (=> b!584615 (=> (not res!372428) (not e!334710))))

(declare-datatypes ((List!11591 0))(
  ( (Nil!11588) (Cons!11587 (h!12632 (_ BitVec 64)) (t!17819 List!11591)) )
))
(declare-fun arrayNoDuplicates!0 (array!36551 (_ BitVec 32) List!11591) Bool)

(assert (=> b!584615 (= res!372428 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11588))))

(declare-fun b!584616 () Bool)

(assert (=> b!584616 (= e!334709 e!334710)))

(declare-fun res!372433 () Bool)

(assert (=> b!584616 (=> (not res!372433) (not e!334710))))

(declare-datatypes ((SeekEntryResult!5990 0))(
  ( (MissingZero!5990 (index!26187 (_ BitVec 32))) (Found!5990 (index!26188 (_ BitVec 32))) (Intermediate!5990 (undefined!6802 Bool) (index!26189 (_ BitVec 32)) (x!55019 (_ BitVec 32))) (Undefined!5990) (MissingVacant!5990 (index!26190 (_ BitVec 32))) )
))
(declare-fun lt!265617 () SeekEntryResult!5990)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584616 (= res!372433 (or (= lt!265617 (MissingZero!5990 i!1108)) (= lt!265617 (MissingVacant!5990 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36551 (_ BitVec 32)) SeekEntryResult!5990)

(assert (=> b!584616 (= lt!265617 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!372431 () Bool)

(assert (=> start!53650 (=> (not res!372431) (not e!334709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53650 (= res!372431 (validMask!0 mask!3053))))

(assert (=> start!53650 e!334709))

(assert (=> start!53650 true))

(declare-fun array_inv!13346 (array!36551) Bool)

(assert (=> start!53650 (array_inv!13346 a!2986)))

(declare-fun b!584617 () Bool)

(declare-fun res!372426 () Bool)

(assert (=> b!584617 (=> (not res!372426) (not e!334710))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!584617 (= res!372426 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17550 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17550 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584618 () Bool)

(declare-fun res!372432 () Bool)

(assert (=> b!584618 (=> (not res!372432) (not e!334710))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36551 (_ BitVec 32)) SeekEntryResult!5990)

(assert (=> b!584618 (= res!372432 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17550 a!2986) j!136) a!2986 mask!3053) (Found!5990 j!136)))))

(declare-fun b!584619 () Bool)

(declare-fun res!372435 () Bool)

(assert (=> b!584619 (=> (not res!372435) (not e!334710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36551 (_ BitVec 32)) Bool)

(assert (=> b!584619 (= res!372435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584620 () Bool)

(declare-fun res!372437 () Bool)

(assert (=> b!584620 (=> (not res!372437) (not e!334709))))

(assert (=> b!584620 (= res!372437 (and (= (size!17914 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17914 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17914 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584621 () Bool)

(assert (=> b!584621 (= e!334708 false)))

(declare-fun lt!265616 () SeekEntryResult!5990)

(assert (=> b!584621 (= lt!265616 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265618 vacantSpotIndex!68 (select (arr!17550 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53650 res!372431) b!584620))

(assert (= (and b!584620 res!372437) b!584614))

(assert (= (and b!584614 res!372434) b!584611))

(assert (= (and b!584611 res!372436) b!584613))

(assert (= (and b!584613 res!372427) b!584616))

(assert (= (and b!584616 res!372433) b!584619))

(assert (= (and b!584619 res!372435) b!584615))

(assert (= (and b!584615 res!372428) b!584617))

(assert (= (and b!584617 res!372426) b!584618))

(assert (= (and b!584618 res!372432) b!584610))

(assert (= (and b!584610 res!372430) b!584612))

(assert (= (and b!584612 res!372429) b!584621))

(declare-fun m!562945 () Bool)

(assert (=> b!584621 m!562945))

(assert (=> b!584621 m!562945))

(declare-fun m!562947 () Bool)

(assert (=> b!584621 m!562947))

(declare-fun m!562949 () Bool)

(assert (=> b!584610 m!562949))

(assert (=> b!584610 m!562945))

(declare-fun m!562951 () Bool)

(assert (=> b!584619 m!562951))

(declare-fun m!562953 () Bool)

(assert (=> start!53650 m!562953))

(declare-fun m!562955 () Bool)

(assert (=> start!53650 m!562955))

(declare-fun m!562957 () Bool)

(assert (=> b!584612 m!562957))

(declare-fun m!562959 () Bool)

(assert (=> b!584617 m!562959))

(declare-fun m!562961 () Bool)

(assert (=> b!584617 m!562961))

(declare-fun m!562963 () Bool)

(assert (=> b!584617 m!562963))

(declare-fun m!562965 () Bool)

(assert (=> b!584613 m!562965))

(assert (=> b!584618 m!562945))

(assert (=> b!584618 m!562945))

(declare-fun m!562967 () Bool)

(assert (=> b!584618 m!562967))

(declare-fun m!562969 () Bool)

(assert (=> b!584611 m!562969))

(declare-fun m!562971 () Bool)

(assert (=> b!584615 m!562971))

(assert (=> b!584614 m!562945))

(assert (=> b!584614 m!562945))

(declare-fun m!562973 () Bool)

(assert (=> b!584614 m!562973))

(declare-fun m!562975 () Bool)

(assert (=> b!584616 m!562975))

(push 1)

