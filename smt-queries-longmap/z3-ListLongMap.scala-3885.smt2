; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53370 () Bool)

(assert start!53370)

(declare-fun b!580034 () Bool)

(declare-fun res!367751 () Bool)

(declare-fun e!333261 () Bool)

(assert (=> b!580034 (=> (not res!367751) (not e!333261))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36216 0))(
  ( (array!36217 (arr!17380 (Array (_ BitVec 32) (_ BitVec 64))) (size!17744 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36216)

(assert (=> b!580034 (= res!367751 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17380 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17380 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580035 () Bool)

(assert (=> b!580035 (= e!333261 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5776 0))(
  ( (MissingZero!5776 (index!25331 (_ BitVec 32))) (Found!5776 (index!25332 (_ BitVec 32))) (Intermediate!5776 (undefined!6588 Bool) (index!25333 (_ BitVec 32)) (x!54368 (_ BitVec 32))) (Undefined!5776) (MissingVacant!5776 (index!25334 (_ BitVec 32))) )
))
(declare-fun lt!264682 () SeekEntryResult!5776)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36216 (_ BitVec 32)) SeekEntryResult!5776)

(assert (=> b!580035 (= lt!264682 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17380 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580036 () Bool)

(declare-fun res!367749 () Bool)

(declare-fun e!333259 () Bool)

(assert (=> b!580036 (=> (not res!367749) (not e!333259))))

(assert (=> b!580036 (= res!367749 (and (= (size!17744 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17744 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17744 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367747 () Bool)

(assert (=> start!53370 (=> (not res!367747) (not e!333259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53370 (= res!367747 (validMask!0 mask!3053))))

(assert (=> start!53370 e!333259))

(assert (=> start!53370 true))

(declare-fun array_inv!13239 (array!36216) Bool)

(assert (=> start!53370 (array_inv!13239 a!2986)))

(declare-fun b!580037 () Bool)

(assert (=> b!580037 (= e!333259 e!333261)))

(declare-fun res!367753 () Bool)

(assert (=> b!580037 (=> (not res!367753) (not e!333261))))

(declare-fun lt!264681 () SeekEntryResult!5776)

(assert (=> b!580037 (= res!367753 (or (= lt!264681 (MissingZero!5776 i!1108)) (= lt!264681 (MissingVacant!5776 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36216 (_ BitVec 32)) SeekEntryResult!5776)

(assert (=> b!580037 (= lt!264681 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580038 () Bool)

(declare-fun res!367746 () Bool)

(assert (=> b!580038 (=> (not res!367746) (not e!333259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580038 (= res!367746 (validKeyInArray!0 (select (arr!17380 a!2986) j!136)))))

(declare-fun b!580039 () Bool)

(declare-fun res!367750 () Bool)

(assert (=> b!580039 (=> (not res!367750) (not e!333259))))

(assert (=> b!580039 (= res!367750 (validKeyInArray!0 k0!1786))))

(declare-fun b!580040 () Bool)

(declare-fun res!367745 () Bool)

(assert (=> b!580040 (=> (not res!367745) (not e!333261))))

(declare-datatypes ((List!11328 0))(
  ( (Nil!11325) (Cons!11324 (h!12372 (_ BitVec 64)) (t!17548 List!11328)) )
))
(declare-fun arrayNoDuplicates!0 (array!36216 (_ BitVec 32) List!11328) Bool)

(assert (=> b!580040 (= res!367745 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11325))))

(declare-fun b!580041 () Bool)

(declare-fun res!367752 () Bool)

(assert (=> b!580041 (=> (not res!367752) (not e!333261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36216 (_ BitVec 32)) Bool)

(assert (=> b!580041 (= res!367752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580042 () Bool)

(declare-fun res!367748 () Bool)

(assert (=> b!580042 (=> (not res!367748) (not e!333259))))

(declare-fun arrayContainsKey!0 (array!36216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580042 (= res!367748 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53370 res!367747) b!580036))

(assert (= (and b!580036 res!367749) b!580038))

(assert (= (and b!580038 res!367746) b!580039))

(assert (= (and b!580039 res!367750) b!580042))

(assert (= (and b!580042 res!367748) b!580037))

(assert (= (and b!580037 res!367753) b!580041))

(assert (= (and b!580041 res!367752) b!580040))

(assert (= (and b!580040 res!367745) b!580034))

(assert (= (and b!580034 res!367751) b!580035))

(declare-fun m!558791 () Bool)

(assert (=> start!53370 m!558791))

(declare-fun m!558793 () Bool)

(assert (=> start!53370 m!558793))

(declare-fun m!558795 () Bool)

(assert (=> b!580041 m!558795))

(declare-fun m!558797 () Bool)

(assert (=> b!580034 m!558797))

(declare-fun m!558799 () Bool)

(assert (=> b!580034 m!558799))

(declare-fun m!558801 () Bool)

(assert (=> b!580034 m!558801))

(declare-fun m!558803 () Bool)

(assert (=> b!580042 m!558803))

(declare-fun m!558805 () Bool)

(assert (=> b!580037 m!558805))

(declare-fun m!558807 () Bool)

(assert (=> b!580038 m!558807))

(assert (=> b!580038 m!558807))

(declare-fun m!558809 () Bool)

(assert (=> b!580038 m!558809))

(declare-fun m!558811 () Bool)

(assert (=> b!580040 m!558811))

(declare-fun m!558813 () Bool)

(assert (=> b!580039 m!558813))

(assert (=> b!580035 m!558807))

(assert (=> b!580035 m!558807))

(declare-fun m!558815 () Bool)

(assert (=> b!580035 m!558815))

(check-sat (not b!580042) (not start!53370) (not b!580039) (not b!580037) (not b!580041) (not b!580038) (not b!580040) (not b!580035))
(check-sat)
