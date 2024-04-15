; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53562 () Bool)

(assert start!53562)

(declare-fun b!583091 () Bool)

(declare-fun e!334117 () Bool)

(assert (=> b!583091 (= e!334117 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5950 0))(
  ( (MissingZero!5950 (index!26027 (_ BitVec 32))) (Found!5950 (index!26028 (_ BitVec 32))) (Intermediate!5950 (undefined!6762 Bool) (index!26029 (_ BitVec 32)) (x!54878 (_ BitVec 32))) (Undefined!5950) (MissingVacant!5950 (index!26030 (_ BitVec 32))) )
))
(declare-fun lt!265075 () SeekEntryResult!5950)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36477 0))(
  ( (array!36478 (arr!17513 (Array (_ BitVec 32) (_ BitVec 64))) (size!17878 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36477)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36477 (_ BitVec 32)) SeekEntryResult!5950)

(assert (=> b!583091 (= lt!265075 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17513 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583093 () Bool)

(declare-fun res!371052 () Bool)

(declare-fun e!334119 () Bool)

(assert (=> b!583093 (=> (not res!371052) (not e!334119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583093 (= res!371052 (validKeyInArray!0 (select (arr!17513 a!2986) j!136)))))

(declare-fun b!583094 () Bool)

(declare-fun res!371057 () Bool)

(assert (=> b!583094 (=> (not res!371057) (not e!334117))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!583094 (= res!371057 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17513 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17513 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583095 () Bool)

(declare-fun res!371050 () Bool)

(assert (=> b!583095 (=> (not res!371050) (not e!334119))))

(declare-fun arrayContainsKey!0 (array!36477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583095 (= res!371050 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583096 () Bool)

(declare-fun res!371049 () Bool)

(assert (=> b!583096 (=> (not res!371049) (not e!334117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36477 (_ BitVec 32)) Bool)

(assert (=> b!583096 (= res!371049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583097 () Bool)

(declare-fun res!371053 () Bool)

(assert (=> b!583097 (=> (not res!371053) (not e!334117))))

(declare-datatypes ((List!11593 0))(
  ( (Nil!11590) (Cons!11589 (h!12634 (_ BitVec 64)) (t!17812 List!11593)) )
))
(declare-fun arrayNoDuplicates!0 (array!36477 (_ BitVec 32) List!11593) Bool)

(assert (=> b!583097 (= res!371053 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11590))))

(declare-fun b!583098 () Bool)

(declare-fun res!371056 () Bool)

(assert (=> b!583098 (=> (not res!371056) (not e!334119))))

(assert (=> b!583098 (= res!371056 (validKeyInArray!0 k0!1786))))

(declare-fun b!583099 () Bool)

(assert (=> b!583099 (= e!334119 e!334117)))

(declare-fun res!371051 () Bool)

(assert (=> b!583099 (=> (not res!371051) (not e!334117))))

(declare-fun lt!265074 () SeekEntryResult!5950)

(assert (=> b!583099 (= res!371051 (or (= lt!265074 (MissingZero!5950 i!1108)) (= lt!265074 (MissingVacant!5950 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36477 (_ BitVec 32)) SeekEntryResult!5950)

(assert (=> b!583099 (= lt!265074 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!371055 () Bool)

(assert (=> start!53562 (=> (not res!371055) (not e!334119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53562 (= res!371055 (validMask!0 mask!3053))))

(assert (=> start!53562 e!334119))

(assert (=> start!53562 true))

(declare-fun array_inv!13396 (array!36477) Bool)

(assert (=> start!53562 (array_inv!13396 a!2986)))

(declare-fun b!583092 () Bool)

(declare-fun res!371054 () Bool)

(assert (=> b!583092 (=> (not res!371054) (not e!334119))))

(assert (=> b!583092 (= res!371054 (and (= (size!17878 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17878 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17878 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53562 res!371055) b!583092))

(assert (= (and b!583092 res!371054) b!583093))

(assert (= (and b!583093 res!371052) b!583098))

(assert (= (and b!583098 res!371056) b!583095))

(assert (= (and b!583095 res!371050) b!583099))

(assert (= (and b!583099 res!371051) b!583096))

(assert (= (and b!583096 res!371049) b!583097))

(assert (= (and b!583097 res!371053) b!583094))

(assert (= (and b!583094 res!371057) b!583091))

(declare-fun m!561043 () Bool)

(assert (=> b!583098 m!561043))

(declare-fun m!561045 () Bool)

(assert (=> b!583095 m!561045))

(declare-fun m!561047 () Bool)

(assert (=> b!583091 m!561047))

(assert (=> b!583091 m!561047))

(declare-fun m!561049 () Bool)

(assert (=> b!583091 m!561049))

(declare-fun m!561051 () Bool)

(assert (=> b!583096 m!561051))

(declare-fun m!561053 () Bool)

(assert (=> b!583099 m!561053))

(declare-fun m!561055 () Bool)

(assert (=> b!583094 m!561055))

(declare-fun m!561057 () Bool)

(assert (=> b!583094 m!561057))

(declare-fun m!561059 () Bool)

(assert (=> b!583094 m!561059))

(assert (=> b!583093 m!561047))

(assert (=> b!583093 m!561047))

(declare-fun m!561061 () Bool)

(assert (=> b!583093 m!561061))

(declare-fun m!561063 () Bool)

(assert (=> start!53562 m!561063))

(declare-fun m!561065 () Bool)

(assert (=> start!53562 m!561065))

(declare-fun m!561067 () Bool)

(assert (=> b!583097 m!561067))

(check-sat (not start!53562) (not b!583098) (not b!583099) (not b!583091) (not b!583096) (not b!583097) (not b!583095) (not b!583093))
(check-sat)
