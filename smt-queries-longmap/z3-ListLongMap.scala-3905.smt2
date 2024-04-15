; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53424 () Bool)

(assert start!53424)

(declare-fun b!581201 () Bool)

(declare-fun e!333497 () Bool)

(declare-fun e!333496 () Bool)

(assert (=> b!581201 (= e!333497 e!333496)))

(declare-fun res!369163 () Bool)

(assert (=> b!581201 (=> (not res!369163) (not e!333496))))

(declare-datatypes ((SeekEntryResult!5881 0))(
  ( (MissingZero!5881 (index!25751 (_ BitVec 32))) (Found!5881 (index!25752 (_ BitVec 32))) (Intermediate!5881 (undefined!6693 Bool) (index!25753 (_ BitVec 32)) (x!54625 (_ BitVec 32))) (Undefined!5881) (MissingVacant!5881 (index!25754 (_ BitVec 32))) )
))
(declare-fun lt!264678 () SeekEntryResult!5881)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581201 (= res!369163 (or (= lt!264678 (MissingZero!5881 i!1108)) (= lt!264678 (MissingVacant!5881 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36339 0))(
  ( (array!36340 (arr!17444 (Array (_ BitVec 32) (_ BitVec 64))) (size!17809 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36339)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36339 (_ BitVec 32)) SeekEntryResult!5881)

(assert (=> b!581201 (= lt!264678 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581202 () Bool)

(declare-fun res!369159 () Bool)

(assert (=> b!581202 (=> (not res!369159) (not e!333497))))

(declare-fun arrayContainsKey!0 (array!36339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581202 (= res!369159 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581204 () Bool)

(declare-fun res!369165 () Bool)

(assert (=> b!581204 (=> (not res!369165) (not e!333497))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581204 (= res!369165 (and (= (size!17809 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17809 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17809 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581205 () Bool)

(declare-fun res!369167 () Bool)

(assert (=> b!581205 (=> (not res!369167) (not e!333496))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581205 (= res!369167 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17444 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17444 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581206 () Bool)

(declare-fun res!369164 () Bool)

(assert (=> b!581206 (=> (not res!369164) (not e!333496))))

(declare-datatypes ((List!11524 0))(
  ( (Nil!11521) (Cons!11520 (h!12565 (_ BitVec 64)) (t!17743 List!11524)) )
))
(declare-fun arrayNoDuplicates!0 (array!36339 (_ BitVec 32) List!11524) Bool)

(assert (=> b!581206 (= res!369164 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11521))))

(declare-fun b!581207 () Bool)

(declare-fun res!369162 () Bool)

(assert (=> b!581207 (=> (not res!369162) (not e!333497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581207 (= res!369162 (validKeyInArray!0 (select (arr!17444 a!2986) j!136)))))

(declare-fun b!581208 () Bool)

(assert (=> b!581208 (= e!333496 false)))

(declare-fun lt!264679 () SeekEntryResult!5881)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36339 (_ BitVec 32)) SeekEntryResult!5881)

(assert (=> b!581208 (= lt!264679 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17444 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581209 () Bool)

(declare-fun res!369160 () Bool)

(assert (=> b!581209 (=> (not res!369160) (not e!333496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36339 (_ BitVec 32)) Bool)

(assert (=> b!581209 (= res!369160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581203 () Bool)

(declare-fun res!369166 () Bool)

(assert (=> b!581203 (=> (not res!369166) (not e!333497))))

(assert (=> b!581203 (= res!369166 (validKeyInArray!0 k0!1786))))

(declare-fun res!369161 () Bool)

(assert (=> start!53424 (=> (not res!369161) (not e!333497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53424 (= res!369161 (validMask!0 mask!3053))))

(assert (=> start!53424 e!333497))

(assert (=> start!53424 true))

(declare-fun array_inv!13327 (array!36339) Bool)

(assert (=> start!53424 (array_inv!13327 a!2986)))

(assert (= (and start!53424 res!369161) b!581204))

(assert (= (and b!581204 res!369165) b!581207))

(assert (= (and b!581207 res!369162) b!581203))

(assert (= (and b!581203 res!369166) b!581202))

(assert (= (and b!581202 res!369159) b!581201))

(assert (= (and b!581201 res!369163) b!581209))

(assert (= (and b!581209 res!369160) b!581206))

(assert (= (and b!581206 res!369164) b!581205))

(assert (= (and b!581205 res!369167) b!581208))

(declare-fun m!559225 () Bool)

(assert (=> b!581206 m!559225))

(declare-fun m!559227 () Bool)

(assert (=> start!53424 m!559227))

(declare-fun m!559229 () Bool)

(assert (=> start!53424 m!559229))

(declare-fun m!559231 () Bool)

(assert (=> b!581205 m!559231))

(declare-fun m!559233 () Bool)

(assert (=> b!581205 m!559233))

(declare-fun m!559235 () Bool)

(assert (=> b!581205 m!559235))

(declare-fun m!559237 () Bool)

(assert (=> b!581202 m!559237))

(declare-fun m!559239 () Bool)

(assert (=> b!581203 m!559239))

(declare-fun m!559241 () Bool)

(assert (=> b!581209 m!559241))

(declare-fun m!559243 () Bool)

(assert (=> b!581207 m!559243))

(assert (=> b!581207 m!559243))

(declare-fun m!559245 () Bool)

(assert (=> b!581207 m!559245))

(assert (=> b!581208 m!559243))

(assert (=> b!581208 m!559243))

(declare-fun m!559247 () Bool)

(assert (=> b!581208 m!559247))

(declare-fun m!559249 () Bool)

(assert (=> b!581201 m!559249))

(check-sat (not b!581202) (not b!581209) (not b!581208) (not b!581206) (not start!53424) (not b!581207) (not b!581201) (not b!581203))
(check-sat)
