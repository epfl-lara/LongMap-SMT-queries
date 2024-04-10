; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53334 () Bool)

(assert start!53334)

(declare-fun b!580023 () Bool)

(declare-fun res!367846 () Bool)

(declare-fun e!333193 () Bool)

(assert (=> b!580023 (=> (not res!367846) (not e!333193))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36235 0))(
  ( (array!36236 (arr!17392 (Array (_ BitVec 32) (_ BitVec 64))) (size!17756 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36235)

(assert (=> b!580023 (= res!367846 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17392 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17392 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580024 () Bool)

(declare-fun res!367841 () Bool)

(declare-fun e!333195 () Bool)

(assert (=> b!580024 (=> (not res!367841) (not e!333195))))

(declare-fun arrayContainsKey!0 (array!36235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580024 (= res!367841 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580025 () Bool)

(declare-fun res!367845 () Bool)

(assert (=> b!580025 (=> (not res!367845) (not e!333195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580025 (= res!367845 (validKeyInArray!0 k0!1786))))

(declare-fun b!580027 () Bool)

(declare-fun res!367840 () Bool)

(assert (=> b!580027 (=> (not res!367840) (not e!333195))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580027 (= res!367840 (validKeyInArray!0 (select (arr!17392 a!2986) j!136)))))

(declare-fun b!580028 () Bool)

(declare-fun res!367847 () Bool)

(assert (=> b!580028 (=> (not res!367847) (not e!333195))))

(assert (=> b!580028 (= res!367847 (and (= (size!17756 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17756 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17756 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580029 () Bool)

(declare-fun res!367844 () Bool)

(assert (=> b!580029 (=> (not res!367844) (not e!333193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36235 (_ BitVec 32)) Bool)

(assert (=> b!580029 (= res!367844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580030 () Bool)

(declare-fun res!367843 () Bool)

(assert (=> b!580030 (=> (not res!367843) (not e!333193))))

(declare-datatypes ((List!11433 0))(
  ( (Nil!11430) (Cons!11429 (h!12474 (_ BitVec 64)) (t!17661 List!11433)) )
))
(declare-fun arrayNoDuplicates!0 (array!36235 (_ BitVec 32) List!11433) Bool)

(assert (=> b!580030 (= res!367843 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11430))))

(declare-fun b!580031 () Bool)

(assert (=> b!580031 (= e!333195 e!333193)))

(declare-fun res!367839 () Bool)

(assert (=> b!580031 (=> (not res!367839) (not e!333193))))

(declare-datatypes ((SeekEntryResult!5832 0))(
  ( (MissingZero!5832 (index!25555 (_ BitVec 32))) (Found!5832 (index!25556 (_ BitVec 32))) (Intermediate!5832 (undefined!6644 Bool) (index!25557 (_ BitVec 32)) (x!54437 (_ BitVec 32))) (Undefined!5832) (MissingVacant!5832 (index!25558 (_ BitVec 32))) )
))
(declare-fun lt!264612 () SeekEntryResult!5832)

(assert (=> b!580031 (= res!367839 (or (= lt!264612 (MissingZero!5832 i!1108)) (= lt!264612 (MissingVacant!5832 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36235 (_ BitVec 32)) SeekEntryResult!5832)

(assert (=> b!580031 (= lt!264612 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!367842 () Bool)

(assert (=> start!53334 (=> (not res!367842) (not e!333195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53334 (= res!367842 (validMask!0 mask!3053))))

(assert (=> start!53334 e!333195))

(assert (=> start!53334 true))

(declare-fun array_inv!13188 (array!36235) Bool)

(assert (=> start!53334 (array_inv!13188 a!2986)))

(declare-fun b!580026 () Bool)

(assert (=> b!580026 (= e!333193 false)))

(declare-fun lt!264613 () SeekEntryResult!5832)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36235 (_ BitVec 32)) SeekEntryResult!5832)

(assert (=> b!580026 (= lt!264613 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17392 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53334 res!367842) b!580028))

(assert (= (and b!580028 res!367847) b!580027))

(assert (= (and b!580027 res!367840) b!580025))

(assert (= (and b!580025 res!367845) b!580024))

(assert (= (and b!580024 res!367841) b!580031))

(assert (= (and b!580031 res!367839) b!580029))

(assert (= (and b!580029 res!367844) b!580030))

(assert (= (and b!580030 res!367843) b!580023))

(assert (= (and b!580023 res!367846) b!580026))

(declare-fun m!558621 () Bool)

(assert (=> b!580024 m!558621))

(declare-fun m!558623 () Bool)

(assert (=> start!53334 m!558623))

(declare-fun m!558625 () Bool)

(assert (=> start!53334 m!558625))

(declare-fun m!558627 () Bool)

(assert (=> b!580023 m!558627))

(declare-fun m!558629 () Bool)

(assert (=> b!580023 m!558629))

(declare-fun m!558631 () Bool)

(assert (=> b!580023 m!558631))

(declare-fun m!558633 () Bool)

(assert (=> b!580031 m!558633))

(declare-fun m!558635 () Bool)

(assert (=> b!580026 m!558635))

(assert (=> b!580026 m!558635))

(declare-fun m!558637 () Bool)

(assert (=> b!580026 m!558637))

(declare-fun m!558639 () Bool)

(assert (=> b!580029 m!558639))

(declare-fun m!558641 () Bool)

(assert (=> b!580025 m!558641))

(assert (=> b!580027 m!558635))

(assert (=> b!580027 m!558635))

(declare-fun m!558643 () Bool)

(assert (=> b!580027 m!558643))

(declare-fun m!558645 () Bool)

(assert (=> b!580030 m!558645))

(check-sat (not b!580030) (not b!580025) (not b!580031) (not start!53334) (not b!580024) (not b!580026) (not b!580029) (not b!580027))
(check-sat)
