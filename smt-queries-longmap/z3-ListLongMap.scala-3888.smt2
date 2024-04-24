; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53388 () Bool)

(assert start!53388)

(declare-fun b!580278 () Bool)

(declare-fun res!367993 () Bool)

(declare-fun e!333341 () Bool)

(assert (=> b!580278 (=> (not res!367993) (not e!333341))))

(declare-datatypes ((array!36234 0))(
  ( (array!36235 (arr!17389 (Array (_ BitVec 32) (_ BitVec 64))) (size!17753 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36234)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36234 (_ BitVec 32)) Bool)

(assert (=> b!580278 (= res!367993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580279 () Bool)

(assert (=> b!580279 (= e!333341 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5785 0))(
  ( (MissingZero!5785 (index!25367 (_ BitVec 32))) (Found!5785 (index!25368 (_ BitVec 32))) (Intermediate!5785 (undefined!6597 Bool) (index!25369 (_ BitVec 32)) (x!54401 (_ BitVec 32))) (Undefined!5785) (MissingVacant!5785 (index!25370 (_ BitVec 32))) )
))
(declare-fun lt!264735 () SeekEntryResult!5785)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36234 (_ BitVec 32)) SeekEntryResult!5785)

(assert (=> b!580279 (= lt!264735 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17389 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580280 () Bool)

(declare-fun res!367990 () Bool)

(declare-fun e!333340 () Bool)

(assert (=> b!580280 (=> (not res!367990) (not e!333340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580280 (= res!367990 (validKeyInArray!0 (select (arr!17389 a!2986) j!136)))))

(declare-fun b!580281 () Bool)

(declare-fun res!367994 () Bool)

(assert (=> b!580281 (=> (not res!367994) (not e!333340))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580281 (= res!367994 (and (= (size!17753 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17753 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17753 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580282 () Bool)

(declare-fun res!367989 () Bool)

(assert (=> b!580282 (=> (not res!367989) (not e!333341))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!580282 (= res!367989 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17389 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17389 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580283 () Bool)

(assert (=> b!580283 (= e!333340 e!333341)))

(declare-fun res!367988 () Bool)

(assert (=> b!580283 (=> (not res!367988) (not e!333341))))

(declare-fun lt!264736 () SeekEntryResult!5785)

(assert (=> b!580283 (= res!367988 (or (= lt!264736 (MissingZero!5785 i!1108)) (= lt!264736 (MissingVacant!5785 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36234 (_ BitVec 32)) SeekEntryResult!5785)

(assert (=> b!580283 (= lt!264736 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580284 () Bool)

(declare-fun res!367995 () Bool)

(assert (=> b!580284 (=> (not res!367995) (not e!333340))))

(assert (=> b!580284 (= res!367995 (validKeyInArray!0 k0!1786))))

(declare-fun b!580285 () Bool)

(declare-fun res!367992 () Bool)

(assert (=> b!580285 (=> (not res!367992) (not e!333341))))

(declare-datatypes ((List!11337 0))(
  ( (Nil!11334) (Cons!11333 (h!12381 (_ BitVec 64)) (t!17557 List!11337)) )
))
(declare-fun arrayNoDuplicates!0 (array!36234 (_ BitVec 32) List!11337) Bool)

(assert (=> b!580285 (= res!367992 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11334))))

(declare-fun b!580277 () Bool)

(declare-fun res!367996 () Bool)

(assert (=> b!580277 (=> (not res!367996) (not e!333340))))

(declare-fun arrayContainsKey!0 (array!36234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580277 (= res!367996 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!367991 () Bool)

(assert (=> start!53388 (=> (not res!367991) (not e!333340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53388 (= res!367991 (validMask!0 mask!3053))))

(assert (=> start!53388 e!333340))

(assert (=> start!53388 true))

(declare-fun array_inv!13248 (array!36234) Bool)

(assert (=> start!53388 (array_inv!13248 a!2986)))

(assert (= (and start!53388 res!367991) b!580281))

(assert (= (and b!580281 res!367994) b!580280))

(assert (= (and b!580280 res!367990) b!580284))

(assert (= (and b!580284 res!367995) b!580277))

(assert (= (and b!580277 res!367996) b!580283))

(assert (= (and b!580283 res!367988) b!580278))

(assert (= (and b!580278 res!367993) b!580285))

(assert (= (and b!580285 res!367992) b!580282))

(assert (= (and b!580282 res!367989) b!580279))

(declare-fun m!559025 () Bool)

(assert (=> b!580282 m!559025))

(declare-fun m!559027 () Bool)

(assert (=> b!580282 m!559027))

(declare-fun m!559029 () Bool)

(assert (=> b!580282 m!559029))

(declare-fun m!559031 () Bool)

(assert (=> b!580280 m!559031))

(assert (=> b!580280 m!559031))

(declare-fun m!559033 () Bool)

(assert (=> b!580280 m!559033))

(declare-fun m!559035 () Bool)

(assert (=> b!580277 m!559035))

(declare-fun m!559037 () Bool)

(assert (=> b!580278 m!559037))

(declare-fun m!559039 () Bool)

(assert (=> b!580283 m!559039))

(declare-fun m!559041 () Bool)

(assert (=> b!580285 m!559041))

(assert (=> b!580279 m!559031))

(assert (=> b!580279 m!559031))

(declare-fun m!559043 () Bool)

(assert (=> b!580279 m!559043))

(declare-fun m!559045 () Bool)

(assert (=> start!53388 m!559045))

(declare-fun m!559047 () Bool)

(assert (=> start!53388 m!559047))

(declare-fun m!559049 () Bool)

(assert (=> b!580284 m!559049))

(check-sat (not b!580283) (not b!580285) (not b!580278) (not b!580277) (not start!53388) (not b!580279) (not b!580284) (not b!580280))
(check-sat)
