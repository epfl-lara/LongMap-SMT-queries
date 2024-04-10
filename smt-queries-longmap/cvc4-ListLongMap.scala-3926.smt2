; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53570 () Bool)

(assert start!53570)

(declare-fun b!583245 () Bool)

(declare-fun res!371062 () Bool)

(declare-fun e!334255 () Bool)

(assert (=> b!583245 (=> (not res!371062) (not e!334255))))

(declare-datatypes ((array!36471 0))(
  ( (array!36472 (arr!17510 (Array (_ BitVec 32) (_ BitVec 64))) (size!17874 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36471)

(declare-datatypes ((List!11551 0))(
  ( (Nil!11548) (Cons!11547 (h!12592 (_ BitVec 64)) (t!17779 List!11551)) )
))
(declare-fun arrayNoDuplicates!0 (array!36471 (_ BitVec 32) List!11551) Bool)

(assert (=> b!583245 (= res!371062 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11548))))

(declare-fun b!583246 () Bool)

(declare-fun res!371069 () Bool)

(declare-fun e!334256 () Bool)

(assert (=> b!583246 (=> (not res!371069) (not e!334256))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583246 (= res!371069 (and (= (size!17874 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17874 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17874 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583247 () Bool)

(assert (=> b!583247 (= e!334256 e!334255)))

(declare-fun res!371063 () Bool)

(assert (=> b!583247 (=> (not res!371063) (not e!334255))))

(declare-datatypes ((SeekEntryResult!5950 0))(
  ( (MissingZero!5950 (index!26027 (_ BitVec 32))) (Found!5950 (index!26028 (_ BitVec 32))) (Intermediate!5950 (undefined!6762 Bool) (index!26029 (_ BitVec 32)) (x!54867 (_ BitVec 32))) (Undefined!5950) (MissingVacant!5950 (index!26030 (_ BitVec 32))) )
))
(declare-fun lt!265293 () SeekEntryResult!5950)

(assert (=> b!583247 (= res!371063 (or (= lt!265293 (MissingZero!5950 i!1108)) (= lt!265293 (MissingVacant!5950 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36471 (_ BitVec 32)) SeekEntryResult!5950)

(assert (=> b!583247 (= lt!265293 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583248 () Bool)

(declare-fun res!371065 () Bool)

(assert (=> b!583248 (=> (not res!371065) (not e!334256))))

(declare-fun arrayContainsKey!0 (array!36471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583248 (= res!371065 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583249 () Bool)

(declare-fun res!371067 () Bool)

(assert (=> b!583249 (=> (not res!371067) (not e!334255))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583249 (= res!371067 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17510 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17510 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583250 () Bool)

(assert (=> b!583250 (= e!334255 false)))

(declare-fun lt!265294 () SeekEntryResult!5950)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36471 (_ BitVec 32)) SeekEntryResult!5950)

(assert (=> b!583250 (= lt!265294 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17510 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583251 () Bool)

(declare-fun res!371061 () Bool)

(assert (=> b!583251 (=> (not res!371061) (not e!334256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583251 (= res!371061 (validKeyInArray!0 (select (arr!17510 a!2986) j!136)))))

(declare-fun res!371068 () Bool)

(assert (=> start!53570 (=> (not res!371068) (not e!334256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53570 (= res!371068 (validMask!0 mask!3053))))

(assert (=> start!53570 e!334256))

(assert (=> start!53570 true))

(declare-fun array_inv!13306 (array!36471) Bool)

(assert (=> start!53570 (array_inv!13306 a!2986)))

(declare-fun b!583252 () Bool)

(declare-fun res!371064 () Bool)

(assert (=> b!583252 (=> (not res!371064) (not e!334256))))

(assert (=> b!583252 (= res!371064 (validKeyInArray!0 k!1786))))

(declare-fun b!583253 () Bool)

(declare-fun res!371066 () Bool)

(assert (=> b!583253 (=> (not res!371066) (not e!334255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36471 (_ BitVec 32)) Bool)

(assert (=> b!583253 (= res!371066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53570 res!371068) b!583246))

(assert (= (and b!583246 res!371069) b!583251))

(assert (= (and b!583251 res!371061) b!583252))

(assert (= (and b!583252 res!371064) b!583248))

(assert (= (and b!583248 res!371065) b!583247))

(assert (= (and b!583247 res!371063) b!583253))

(assert (= (and b!583253 res!371066) b!583245))

(assert (= (and b!583245 res!371062) b!583249))

(assert (= (and b!583249 res!371067) b!583250))

(declare-fun m!561719 () Bool)

(assert (=> b!583252 m!561719))

(declare-fun m!561721 () Bool)

(assert (=> start!53570 m!561721))

(declare-fun m!561723 () Bool)

(assert (=> start!53570 m!561723))

(declare-fun m!561725 () Bool)

(assert (=> b!583249 m!561725))

(declare-fun m!561727 () Bool)

(assert (=> b!583249 m!561727))

(declare-fun m!561729 () Bool)

(assert (=> b!583249 m!561729))

(declare-fun m!561731 () Bool)

(assert (=> b!583248 m!561731))

(declare-fun m!561733 () Bool)

(assert (=> b!583251 m!561733))

(assert (=> b!583251 m!561733))

(declare-fun m!561735 () Bool)

(assert (=> b!583251 m!561735))

(declare-fun m!561737 () Bool)

(assert (=> b!583245 m!561737))

(declare-fun m!561739 () Bool)

(assert (=> b!583247 m!561739))

(declare-fun m!561741 () Bool)

(assert (=> b!583253 m!561741))

(assert (=> b!583250 m!561733))

(assert (=> b!583250 m!561733))

(declare-fun m!561743 () Bool)

(assert (=> b!583250 m!561743))

(push 1)

(assert (not b!583245))

(assert (not start!53570))

(assert (not b!583250))

(assert (not b!583253))

(assert (not b!583248))

(assert (not b!583247))

(assert (not b!583251))

