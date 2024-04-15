; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53418 () Bool)

(assert start!53418)

(declare-fun b!581120 () Bool)

(declare-fun e!333469 () Bool)

(assert (=> b!581120 (= e!333469 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5878 0))(
  ( (MissingZero!5878 (index!25739 (_ BitVec 32))) (Found!5878 (index!25740 (_ BitVec 32))) (Intermediate!5878 (undefined!6690 Bool) (index!25741 (_ BitVec 32)) (x!54614 (_ BitVec 32))) (Undefined!5878) (MissingVacant!5878 (index!25742 (_ BitVec 32))) )
))
(declare-fun lt!264661 () SeekEntryResult!5878)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36333 0))(
  ( (array!36334 (arr!17441 (Array (_ BitVec 32) (_ BitVec 64))) (size!17806 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36333)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36333 (_ BitVec 32)) SeekEntryResult!5878)

(assert (=> b!581120 (= lt!264661 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17441 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581121 () Bool)

(declare-fun res!369085 () Bool)

(declare-fun e!333471 () Bool)

(assert (=> b!581121 (=> (not res!369085) (not e!333471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581121 (= res!369085 (validKeyInArray!0 (select (arr!17441 a!2986) j!136)))))

(declare-fun b!581123 () Bool)

(declare-fun res!369079 () Bool)

(assert (=> b!581123 (=> (not res!369079) (not e!333469))))

(declare-datatypes ((List!11521 0))(
  ( (Nil!11518) (Cons!11517 (h!12562 (_ BitVec 64)) (t!17740 List!11521)) )
))
(declare-fun arrayNoDuplicates!0 (array!36333 (_ BitVec 32) List!11521) Bool)

(assert (=> b!581123 (= res!369079 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11518))))

(declare-fun b!581124 () Bool)

(declare-fun res!369078 () Bool)

(assert (=> b!581124 (=> (not res!369078) (not e!333469))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!581124 (= res!369078 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17441 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17441 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581125 () Bool)

(declare-fun res!369080 () Bool)

(assert (=> b!581125 (=> (not res!369080) (not e!333471))))

(assert (=> b!581125 (= res!369080 (and (= (size!17806 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17806 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17806 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581126 () Bool)

(assert (=> b!581126 (= e!333471 e!333469)))

(declare-fun res!369086 () Bool)

(assert (=> b!581126 (=> (not res!369086) (not e!333469))))

(declare-fun lt!264660 () SeekEntryResult!5878)

(assert (=> b!581126 (= res!369086 (or (= lt!264660 (MissingZero!5878 i!1108)) (= lt!264660 (MissingVacant!5878 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36333 (_ BitVec 32)) SeekEntryResult!5878)

(assert (=> b!581126 (= lt!264660 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581127 () Bool)

(declare-fun res!369081 () Bool)

(assert (=> b!581127 (=> (not res!369081) (not e!333471))))

(declare-fun arrayContainsKey!0 (array!36333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581127 (= res!369081 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581128 () Bool)

(declare-fun res!369083 () Bool)

(assert (=> b!581128 (=> (not res!369083) (not e!333469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36333 (_ BitVec 32)) Bool)

(assert (=> b!581128 (= res!369083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581122 () Bool)

(declare-fun res!369082 () Bool)

(assert (=> b!581122 (=> (not res!369082) (not e!333471))))

(assert (=> b!581122 (= res!369082 (validKeyInArray!0 k0!1786))))

(declare-fun res!369084 () Bool)

(assert (=> start!53418 (=> (not res!369084) (not e!333471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53418 (= res!369084 (validMask!0 mask!3053))))

(assert (=> start!53418 e!333471))

(assert (=> start!53418 true))

(declare-fun array_inv!13324 (array!36333) Bool)

(assert (=> start!53418 (array_inv!13324 a!2986)))

(assert (= (and start!53418 res!369084) b!581125))

(assert (= (and b!581125 res!369080) b!581121))

(assert (= (and b!581121 res!369085) b!581122))

(assert (= (and b!581122 res!369082) b!581127))

(assert (= (and b!581127 res!369081) b!581126))

(assert (= (and b!581126 res!369086) b!581128))

(assert (= (and b!581128 res!369083) b!581123))

(assert (= (and b!581123 res!369079) b!581124))

(assert (= (and b!581124 res!369078) b!581120))

(declare-fun m!559147 () Bool)

(assert (=> b!581122 m!559147))

(declare-fun m!559149 () Bool)

(assert (=> b!581128 m!559149))

(declare-fun m!559151 () Bool)

(assert (=> start!53418 m!559151))

(declare-fun m!559153 () Bool)

(assert (=> start!53418 m!559153))

(declare-fun m!559155 () Bool)

(assert (=> b!581126 m!559155))

(declare-fun m!559157 () Bool)

(assert (=> b!581121 m!559157))

(assert (=> b!581121 m!559157))

(declare-fun m!559159 () Bool)

(assert (=> b!581121 m!559159))

(declare-fun m!559161 () Bool)

(assert (=> b!581127 m!559161))

(declare-fun m!559163 () Bool)

(assert (=> b!581124 m!559163))

(declare-fun m!559165 () Bool)

(assert (=> b!581124 m!559165))

(declare-fun m!559167 () Bool)

(assert (=> b!581124 m!559167))

(assert (=> b!581120 m!559157))

(assert (=> b!581120 m!559157))

(declare-fun m!559169 () Bool)

(assert (=> b!581120 m!559169))

(declare-fun m!559171 () Bool)

(assert (=> b!581123 m!559171))

(check-sat (not b!581120) (not b!581128) (not b!581126) (not start!53418) (not b!581121) (not b!581127) (not b!581123) (not b!581122))
(check-sat)
