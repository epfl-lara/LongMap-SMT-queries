; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53576 () Bool)

(assert start!53576)

(declare-fun res!371156 () Bool)

(declare-fun e!334282 () Bool)

(assert (=> start!53576 (=> (not res!371156) (not e!334282))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53576 (= res!371156 (validMask!0 mask!3053))))

(assert (=> start!53576 e!334282))

(assert (=> start!53576 true))

(declare-datatypes ((array!36477 0))(
  ( (array!36478 (arr!17513 (Array (_ BitVec 32) (_ BitVec 64))) (size!17877 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36477)

(declare-fun array_inv!13309 (array!36477) Bool)

(assert (=> start!53576 (array_inv!13309 a!2986)))

(declare-fun b!583334 () Bool)

(declare-fun res!371157 () Bool)

(declare-fun e!334284 () Bool)

(assert (=> b!583334 (=> (not res!371157) (not e!334284))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583334 (= res!371157 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17513 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17513 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583335 () Bool)

(declare-fun res!371158 () Bool)

(assert (=> b!583335 (=> (not res!371158) (not e!334282))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583335 (= res!371158 (validKeyInArray!0 (select (arr!17513 a!2986) j!136)))))

(declare-fun b!583336 () Bool)

(declare-fun res!371152 () Bool)

(assert (=> b!583336 (=> (not res!371152) (not e!334282))))

(assert (=> b!583336 (= res!371152 (and (= (size!17877 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17877 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17877 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583337 () Bool)

(declare-fun res!371153 () Bool)

(assert (=> b!583337 (=> (not res!371153) (not e!334282))))

(assert (=> b!583337 (= res!371153 (validKeyInArray!0 k!1786))))

(declare-fun b!583338 () Bool)

(declare-fun res!371155 () Bool)

(assert (=> b!583338 (=> (not res!371155) (not e!334282))))

(declare-fun arrayContainsKey!0 (array!36477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583338 (= res!371155 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583339 () Bool)

(declare-fun res!371159 () Bool)

(assert (=> b!583339 (=> (not res!371159) (not e!334284))))

(declare-datatypes ((SeekEntryResult!5953 0))(
  ( (MissingZero!5953 (index!26039 (_ BitVec 32))) (Found!5953 (index!26040 (_ BitVec 32))) (Intermediate!5953 (undefined!6765 Bool) (index!26041 (_ BitVec 32)) (x!54878 (_ BitVec 32))) (Undefined!5953) (MissingVacant!5953 (index!26042 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36477 (_ BitVec 32)) SeekEntryResult!5953)

(assert (=> b!583339 (= res!371159 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17513 a!2986) j!136) a!2986 mask!3053) (Found!5953 j!136)))))

(declare-fun b!583340 () Bool)

(declare-fun res!371150 () Bool)

(assert (=> b!583340 (=> (not res!371150) (not e!334284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36477 (_ BitVec 32)) Bool)

(assert (=> b!583340 (= res!371150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583341 () Bool)

(declare-fun res!371151 () Bool)

(assert (=> b!583341 (=> (not res!371151) (not e!334284))))

(declare-datatypes ((List!11554 0))(
  ( (Nil!11551) (Cons!11550 (h!12595 (_ BitVec 64)) (t!17782 List!11554)) )
))
(declare-fun arrayNoDuplicates!0 (array!36477 (_ BitVec 32) List!11554) Bool)

(assert (=> b!583341 (= res!371151 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11551))))

(declare-fun b!583342 () Bool)

(assert (=> b!583342 (= e!334284 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17513 a!2986) index!984) (select (arr!17513 a!2986) j!136))) (not (= (select (arr!17513 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!583343 () Bool)

(assert (=> b!583343 (= e!334282 e!334284)))

(declare-fun res!371154 () Bool)

(assert (=> b!583343 (=> (not res!371154) (not e!334284))))

(declare-fun lt!265303 () SeekEntryResult!5953)

(assert (=> b!583343 (= res!371154 (or (= lt!265303 (MissingZero!5953 i!1108)) (= lt!265303 (MissingVacant!5953 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36477 (_ BitVec 32)) SeekEntryResult!5953)

(assert (=> b!583343 (= lt!265303 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53576 res!371156) b!583336))

(assert (= (and b!583336 res!371152) b!583335))

(assert (= (and b!583335 res!371158) b!583337))

(assert (= (and b!583337 res!371153) b!583338))

(assert (= (and b!583338 res!371155) b!583343))

(assert (= (and b!583343 res!371154) b!583340))

(assert (= (and b!583340 res!371150) b!583341))

(assert (= (and b!583341 res!371151) b!583334))

(assert (= (and b!583334 res!371157) b!583339))

(assert (= (and b!583339 res!371159) b!583342))

(declare-fun m!561801 () Bool)

(assert (=> b!583341 m!561801))

(declare-fun m!561803 () Bool)

(assert (=> b!583339 m!561803))

(assert (=> b!583339 m!561803))

(declare-fun m!561805 () Bool)

(assert (=> b!583339 m!561805))

(declare-fun m!561807 () Bool)

(assert (=> start!53576 m!561807))

(declare-fun m!561809 () Bool)

(assert (=> start!53576 m!561809))

(declare-fun m!561811 () Bool)

(assert (=> b!583337 m!561811))

(declare-fun m!561813 () Bool)

(assert (=> b!583342 m!561813))

(assert (=> b!583342 m!561803))

(declare-fun m!561815 () Bool)

(assert (=> b!583340 m!561815))

(declare-fun m!561817 () Bool)

(assert (=> b!583334 m!561817))

(declare-fun m!561819 () Bool)

(assert (=> b!583334 m!561819))

(declare-fun m!561821 () Bool)

(assert (=> b!583334 m!561821))

(declare-fun m!561823 () Bool)

(assert (=> b!583343 m!561823))

(assert (=> b!583335 m!561803))

(assert (=> b!583335 m!561803))

(declare-fun m!561825 () Bool)

(assert (=> b!583335 m!561825))

(declare-fun m!561827 () Bool)

(assert (=> b!583338 m!561827))

(push 1)

(assert (not b!583341))

(assert (not b!583337))

(assert (not b!583340))

(assert (not start!53576))

(assert (not b!583338))

(assert (not b!583343))

(assert (not b!583335))

(assert (not b!583339))

(check-sat)

(pop 1)

