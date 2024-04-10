; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53424 () Bool)

(assert start!53424)

(declare-fun b!581247 () Bool)

(declare-fun res!369070 () Bool)

(declare-fun e!333598 () Bool)

(assert (=> b!581247 (=> (not res!369070) (not e!333598))))

(declare-datatypes ((array!36325 0))(
  ( (array!36326 (arr!17437 (Array (_ BitVec 32) (_ BitVec 64))) (size!17801 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36325)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581247 (= res!369070 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581248 () Bool)

(declare-fun res!369065 () Bool)

(assert (=> b!581248 (=> (not res!369065) (not e!333598))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581248 (= res!369065 (validKeyInArray!0 (select (arr!17437 a!2986) j!136)))))

(declare-fun b!581249 () Bool)

(declare-fun res!369063 () Bool)

(declare-fun e!333600 () Bool)

(assert (=> b!581249 (=> (not res!369063) (not e!333600))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581249 (= res!369063 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17437 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17437 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581250 () Bool)

(declare-fun res!369068 () Bool)

(assert (=> b!581250 (=> (not res!369068) (not e!333598))))

(assert (=> b!581250 (= res!369068 (validKeyInArray!0 k0!1786))))

(declare-fun b!581251 () Bool)

(declare-fun res!369064 () Bool)

(assert (=> b!581251 (=> (not res!369064) (not e!333598))))

(assert (=> b!581251 (= res!369064 (and (= (size!17801 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17801 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17801 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!369069 () Bool)

(assert (=> start!53424 (=> (not res!369069) (not e!333598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53424 (= res!369069 (validMask!0 mask!3053))))

(assert (=> start!53424 e!333598))

(assert (=> start!53424 true))

(declare-fun array_inv!13233 (array!36325) Bool)

(assert (=> start!53424 (array_inv!13233 a!2986)))

(declare-fun b!581252 () Bool)

(assert (=> b!581252 (= e!333598 e!333600)))

(declare-fun res!369067 () Bool)

(assert (=> b!581252 (=> (not res!369067) (not e!333600))))

(declare-datatypes ((SeekEntryResult!5877 0))(
  ( (MissingZero!5877 (index!25735 (_ BitVec 32))) (Found!5877 (index!25736 (_ BitVec 32))) (Intermediate!5877 (undefined!6689 Bool) (index!25737 (_ BitVec 32)) (x!54602 (_ BitVec 32))) (Undefined!5877) (MissingVacant!5877 (index!25738 (_ BitVec 32))) )
))
(declare-fun lt!264873 () SeekEntryResult!5877)

(assert (=> b!581252 (= res!369067 (or (= lt!264873 (MissingZero!5877 i!1108)) (= lt!264873 (MissingVacant!5877 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36325 (_ BitVec 32)) SeekEntryResult!5877)

(assert (=> b!581252 (= lt!264873 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581253 () Bool)

(assert (=> b!581253 (= e!333600 false)))

(declare-fun lt!264874 () SeekEntryResult!5877)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36325 (_ BitVec 32)) SeekEntryResult!5877)

(assert (=> b!581253 (= lt!264874 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17437 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581254 () Bool)

(declare-fun res!369071 () Bool)

(assert (=> b!581254 (=> (not res!369071) (not e!333600))))

(declare-datatypes ((List!11478 0))(
  ( (Nil!11475) (Cons!11474 (h!12519 (_ BitVec 64)) (t!17706 List!11478)) )
))
(declare-fun arrayNoDuplicates!0 (array!36325 (_ BitVec 32) List!11478) Bool)

(assert (=> b!581254 (= res!369071 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11475))))

(declare-fun b!581255 () Bool)

(declare-fun res!369066 () Bool)

(assert (=> b!581255 (=> (not res!369066) (not e!333600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36325 (_ BitVec 32)) Bool)

(assert (=> b!581255 (= res!369066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53424 res!369069) b!581251))

(assert (= (and b!581251 res!369064) b!581248))

(assert (= (and b!581248 res!369065) b!581250))

(assert (= (and b!581250 res!369068) b!581247))

(assert (= (and b!581247 res!369070) b!581252))

(assert (= (and b!581252 res!369067) b!581255))

(assert (= (and b!581255 res!369066) b!581254))

(assert (= (and b!581254 res!369071) b!581249))

(assert (= (and b!581249 res!369063) b!581253))

(declare-fun m!559797 () Bool)

(assert (=> b!581255 m!559797))

(declare-fun m!559799 () Bool)

(assert (=> start!53424 m!559799))

(declare-fun m!559801 () Bool)

(assert (=> start!53424 m!559801))

(declare-fun m!559803 () Bool)

(assert (=> b!581254 m!559803))

(declare-fun m!559805 () Bool)

(assert (=> b!581248 m!559805))

(assert (=> b!581248 m!559805))

(declare-fun m!559807 () Bool)

(assert (=> b!581248 m!559807))

(declare-fun m!559809 () Bool)

(assert (=> b!581250 m!559809))

(declare-fun m!559811 () Bool)

(assert (=> b!581247 m!559811))

(declare-fun m!559813 () Bool)

(assert (=> b!581252 m!559813))

(assert (=> b!581253 m!559805))

(assert (=> b!581253 m!559805))

(declare-fun m!559815 () Bool)

(assert (=> b!581253 m!559815))

(declare-fun m!559817 () Bool)

(assert (=> b!581249 m!559817))

(declare-fun m!559819 () Bool)

(assert (=> b!581249 m!559819))

(declare-fun m!559821 () Bool)

(assert (=> b!581249 m!559821))

(check-sat (not b!581250) (not b!581248) (not start!53424) (not b!581247) (not b!581254) (not b!581252) (not b!581255) (not b!581253))
(check-sat)
