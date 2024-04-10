; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53464 () Bool)

(assert start!53464)

(declare-fun b!581800 () Bool)

(declare-fun e!333779 () Bool)

(declare-fun e!333778 () Bool)

(assert (=> b!581800 (= e!333779 e!333778)))

(declare-fun res!369619 () Bool)

(assert (=> b!581800 (=> (not res!369619) (not e!333778))))

(declare-datatypes ((SeekEntryResult!5897 0))(
  ( (MissingZero!5897 (index!25815 (_ BitVec 32))) (Found!5897 (index!25816 (_ BitVec 32))) (Intermediate!5897 (undefined!6709 Bool) (index!25817 (_ BitVec 32)) (x!54678 (_ BitVec 32))) (Undefined!5897) (MissingVacant!5897 (index!25818 (_ BitVec 32))) )
))
(declare-fun lt!264982 () SeekEntryResult!5897)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581800 (= res!369619 (or (= lt!264982 (MissingZero!5897 i!1108)) (= lt!264982 (MissingVacant!5897 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36365 0))(
  ( (array!36366 (arr!17457 (Array (_ BitVec 32) (_ BitVec 64))) (size!17821 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36365)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36365 (_ BitVec 32)) SeekEntryResult!5897)

(assert (=> b!581800 (= lt!264982 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581801 () Bool)

(declare-fun res!369620 () Bool)

(assert (=> b!581801 (=> (not res!369620) (not e!333778))))

(declare-datatypes ((List!11498 0))(
  ( (Nil!11495) (Cons!11494 (h!12539 (_ BitVec 64)) (t!17726 List!11498)) )
))
(declare-fun arrayNoDuplicates!0 (array!36365 (_ BitVec 32) List!11498) Bool)

(assert (=> b!581801 (= res!369620 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11495))))

(declare-fun b!581802 () Bool)

(declare-fun res!369624 () Bool)

(assert (=> b!581802 (=> (not res!369624) (not e!333779))))

(declare-fun arrayContainsKey!0 (array!36365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581802 (= res!369624 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581803 () Bool)

(declare-fun res!369622 () Bool)

(assert (=> b!581803 (=> (not res!369622) (not e!333779))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581803 (= res!369622 (validKeyInArray!0 (select (arr!17457 a!2986) j!136)))))

(declare-fun b!581804 () Bool)

(declare-fun res!369625 () Bool)

(assert (=> b!581804 (=> (not res!369625) (not e!333778))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581804 (= res!369625 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17457 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17457 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581806 () Bool)

(declare-fun res!369617 () Bool)

(assert (=> b!581806 (=> (not res!369617) (not e!333779))))

(assert (=> b!581806 (= res!369617 (and (= (size!17821 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17821 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17821 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581807 () Bool)

(declare-fun res!369616 () Bool)

(assert (=> b!581807 (=> (not res!369616) (not e!333779))))

(assert (=> b!581807 (= res!369616 (validKeyInArray!0 k!1786))))

(declare-fun b!581808 () Bool)

(declare-fun res!369621 () Bool)

(assert (=> b!581808 (=> (not res!369621) (not e!333778))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36365 (_ BitVec 32)) SeekEntryResult!5897)

(assert (=> b!581808 (= res!369621 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17457 a!2986) j!136) a!2986 mask!3053) (Found!5897 j!136)))))

(declare-fun b!581809 () Bool)

(declare-fun res!369618 () Bool)

(assert (=> b!581809 (=> (not res!369618) (not e!333778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36365 (_ BitVec 32)) Bool)

(assert (=> b!581809 (= res!369618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581810 () Bool)

(declare-fun res!369623 () Bool)

(assert (=> b!581810 (=> (not res!369623) (not e!333778))))

(assert (=> b!581810 (= res!369623 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17457 a!2986) index!984) (select (arr!17457 a!2986) j!136)) (= index!984 j!136) (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!581805 () Bool)

(assert (=> b!581805 (= e!333778 (not (validKeyInArray!0 (select (store (arr!17457 a!2986) i!1108 k!1786) j!136))))))

(declare-fun res!369626 () Bool)

(assert (=> start!53464 (=> (not res!369626) (not e!333779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53464 (= res!369626 (validMask!0 mask!3053))))

(assert (=> start!53464 e!333779))

(assert (=> start!53464 true))

(declare-fun array_inv!13253 (array!36365) Bool)

(assert (=> start!53464 (array_inv!13253 a!2986)))

(assert (= (and start!53464 res!369626) b!581806))

(assert (= (and b!581806 res!369617) b!581803))

(assert (= (and b!581803 res!369622) b!581807))

(assert (= (and b!581807 res!369616) b!581802))

(assert (= (and b!581802 res!369624) b!581800))

(assert (= (and b!581800 res!369619) b!581809))

(assert (= (and b!581809 res!369618) b!581801))

(assert (= (and b!581801 res!369620) b!581804))

(assert (= (and b!581804 res!369625) b!581808))

(assert (= (and b!581808 res!369621) b!581810))

(assert (= (and b!581810 res!369623) b!581805))

(declare-fun m!560323 () Bool)

(assert (=> b!581800 m!560323))

(declare-fun m!560325 () Bool)

(assert (=> start!53464 m!560325))

(declare-fun m!560327 () Bool)

(assert (=> start!53464 m!560327))

(declare-fun m!560329 () Bool)

(assert (=> b!581810 m!560329))

(declare-fun m!560331 () Bool)

(assert (=> b!581810 m!560331))

(declare-fun m!560333 () Bool)

(assert (=> b!581807 m!560333))

(declare-fun m!560335 () Bool)

(assert (=> b!581801 m!560335))

(assert (=> b!581803 m!560331))

(assert (=> b!581803 m!560331))

(declare-fun m!560337 () Bool)

(assert (=> b!581803 m!560337))

(assert (=> b!581808 m!560331))

(assert (=> b!581808 m!560331))

(declare-fun m!560339 () Bool)

(assert (=> b!581808 m!560339))

(declare-fun m!560341 () Bool)

(assert (=> b!581804 m!560341))

(declare-fun m!560343 () Bool)

(assert (=> b!581804 m!560343))

(declare-fun m!560345 () Bool)

(assert (=> b!581804 m!560345))

(declare-fun m!560347 () Bool)

(assert (=> b!581809 m!560347))

(assert (=> b!581805 m!560343))

(declare-fun m!560349 () Bool)

(assert (=> b!581805 m!560349))

(assert (=> b!581805 m!560349))

(declare-fun m!560351 () Bool)

(assert (=> b!581805 m!560351))

(declare-fun m!560353 () Bool)

(assert (=> b!581802 m!560353))

(push 1)

(assert (not b!581800))

(assert (not b!581808))

(assert (not b!581803))

(assert (not b!581807))

