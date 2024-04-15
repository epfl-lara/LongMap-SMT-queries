; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53568 () Bool)

(assert start!53568)

(declare-fun b!583172 () Bool)

(declare-fun res!371131 () Bool)

(declare-fun e!334146 () Bool)

(assert (=> b!583172 (=> (not res!371131) (not e!334146))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36483 0))(
  ( (array!36484 (arr!17516 (Array (_ BitVec 32) (_ BitVec 64))) (size!17881 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36483)

(assert (=> b!583172 (= res!371131 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17516 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17516 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583173 () Bool)

(declare-fun res!371136 () Bool)

(assert (=> b!583173 (=> (not res!371136) (not e!334146))))

(declare-datatypes ((List!11596 0))(
  ( (Nil!11593) (Cons!11592 (h!12637 (_ BitVec 64)) (t!17815 List!11596)) )
))
(declare-fun arrayNoDuplicates!0 (array!36483 (_ BitVec 32) List!11596) Bool)

(assert (=> b!583173 (= res!371136 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11593))))

(declare-fun b!583174 () Bool)

(declare-fun e!334145 () Bool)

(assert (=> b!583174 (= e!334145 e!334146)))

(declare-fun res!371130 () Bool)

(assert (=> b!583174 (=> (not res!371130) (not e!334146))))

(declare-datatypes ((SeekEntryResult!5953 0))(
  ( (MissingZero!5953 (index!26039 (_ BitVec 32))) (Found!5953 (index!26040 (_ BitVec 32))) (Intermediate!5953 (undefined!6765 Bool) (index!26041 (_ BitVec 32)) (x!54889 (_ BitVec 32))) (Undefined!5953) (MissingVacant!5953 (index!26042 (_ BitVec 32))) )
))
(declare-fun lt!265093 () SeekEntryResult!5953)

(assert (=> b!583174 (= res!371130 (or (= lt!265093 (MissingZero!5953 i!1108)) (= lt!265093 (MissingVacant!5953 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36483 (_ BitVec 32)) SeekEntryResult!5953)

(assert (=> b!583174 (= lt!265093 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583175 () Bool)

(assert (=> b!583175 (= e!334146 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!265092 () SeekEntryResult!5953)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36483 (_ BitVec 32)) SeekEntryResult!5953)

(assert (=> b!583175 (= lt!265092 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17516 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583176 () Bool)

(declare-fun res!371138 () Bool)

(assert (=> b!583176 (=> (not res!371138) (not e!334145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583176 (= res!371138 (validKeyInArray!0 k0!1786))))

(declare-fun b!583177 () Bool)

(declare-fun res!371133 () Bool)

(assert (=> b!583177 (=> (not res!371133) (not e!334146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36483 (_ BitVec 32)) Bool)

(assert (=> b!583177 (= res!371133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583178 () Bool)

(declare-fun res!371135 () Bool)

(assert (=> b!583178 (=> (not res!371135) (not e!334145))))

(assert (=> b!583178 (= res!371135 (and (= (size!17881 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17881 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17881 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583179 () Bool)

(declare-fun res!371137 () Bool)

(assert (=> b!583179 (=> (not res!371137) (not e!334145))))

(assert (=> b!583179 (= res!371137 (validKeyInArray!0 (select (arr!17516 a!2986) j!136)))))

(declare-fun b!583180 () Bool)

(declare-fun res!371134 () Bool)

(assert (=> b!583180 (=> (not res!371134) (not e!334145))))

(declare-fun arrayContainsKey!0 (array!36483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583180 (= res!371134 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!371132 () Bool)

(assert (=> start!53568 (=> (not res!371132) (not e!334145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53568 (= res!371132 (validMask!0 mask!3053))))

(assert (=> start!53568 e!334145))

(assert (=> start!53568 true))

(declare-fun array_inv!13399 (array!36483) Bool)

(assert (=> start!53568 (array_inv!13399 a!2986)))

(assert (= (and start!53568 res!371132) b!583178))

(assert (= (and b!583178 res!371135) b!583179))

(assert (= (and b!583179 res!371137) b!583176))

(assert (= (and b!583176 res!371138) b!583180))

(assert (= (and b!583180 res!371134) b!583174))

(assert (= (and b!583174 res!371130) b!583177))

(assert (= (and b!583177 res!371133) b!583173))

(assert (= (and b!583173 res!371136) b!583172))

(assert (= (and b!583172 res!371131) b!583175))

(declare-fun m!561121 () Bool)

(assert (=> b!583174 m!561121))

(declare-fun m!561123 () Bool)

(assert (=> b!583176 m!561123))

(declare-fun m!561125 () Bool)

(assert (=> b!583175 m!561125))

(assert (=> b!583175 m!561125))

(declare-fun m!561127 () Bool)

(assert (=> b!583175 m!561127))

(declare-fun m!561129 () Bool)

(assert (=> b!583180 m!561129))

(declare-fun m!561131 () Bool)

(assert (=> b!583172 m!561131))

(declare-fun m!561133 () Bool)

(assert (=> b!583172 m!561133))

(declare-fun m!561135 () Bool)

(assert (=> b!583172 m!561135))

(declare-fun m!561137 () Bool)

(assert (=> b!583177 m!561137))

(declare-fun m!561139 () Bool)

(assert (=> start!53568 m!561139))

(declare-fun m!561141 () Bool)

(assert (=> start!53568 m!561141))

(declare-fun m!561143 () Bool)

(assert (=> b!583173 m!561143))

(assert (=> b!583179 m!561125))

(assert (=> b!583179 m!561125))

(declare-fun m!561145 () Bool)

(assert (=> b!583179 m!561145))

(check-sat (not b!583175) (not start!53568) (not b!583173) (not b!583179) (not b!583176) (not b!583180) (not b!583177) (not b!583174))
(check-sat)
