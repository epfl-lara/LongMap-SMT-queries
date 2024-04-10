; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53414 () Bool)

(assert start!53414)

(declare-fun b!581112 () Bool)

(declare-fun res!368936 () Bool)

(declare-fun e!333555 () Bool)

(assert (=> b!581112 (=> (not res!368936) (not e!333555))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36315 0))(
  ( (array!36316 (arr!17432 (Array (_ BitVec 32) (_ BitVec 64))) (size!17796 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36315)

(assert (=> b!581112 (= res!368936 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17432 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17432 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581113 () Bool)

(declare-fun e!333553 () Bool)

(assert (=> b!581113 (= e!333553 e!333555)))

(declare-fun res!368934 () Bool)

(assert (=> b!581113 (=> (not res!368934) (not e!333555))))

(declare-datatypes ((SeekEntryResult!5872 0))(
  ( (MissingZero!5872 (index!25715 (_ BitVec 32))) (Found!5872 (index!25716 (_ BitVec 32))) (Intermediate!5872 (undefined!6684 Bool) (index!25717 (_ BitVec 32)) (x!54581 (_ BitVec 32))) (Undefined!5872) (MissingVacant!5872 (index!25718 (_ BitVec 32))) )
))
(declare-fun lt!264843 () SeekEntryResult!5872)

(assert (=> b!581113 (= res!368934 (or (= lt!264843 (MissingZero!5872 i!1108)) (= lt!264843 (MissingVacant!5872 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36315 (_ BitVec 32)) SeekEntryResult!5872)

(assert (=> b!581113 (= lt!264843 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581114 () Bool)

(declare-fun res!368932 () Bool)

(assert (=> b!581114 (=> (not res!368932) (not e!333555))))

(declare-datatypes ((List!11473 0))(
  ( (Nil!11470) (Cons!11469 (h!12514 (_ BitVec 64)) (t!17701 List!11473)) )
))
(declare-fun arrayNoDuplicates!0 (array!36315 (_ BitVec 32) List!11473) Bool)

(assert (=> b!581114 (= res!368932 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11470))))

(declare-fun b!581115 () Bool)

(declare-fun res!368935 () Bool)

(assert (=> b!581115 (=> (not res!368935) (not e!333555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36315 (_ BitVec 32)) Bool)

(assert (=> b!581115 (= res!368935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368931 () Bool)

(assert (=> start!53414 (=> (not res!368931) (not e!333553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53414 (= res!368931 (validMask!0 mask!3053))))

(assert (=> start!53414 e!333553))

(assert (=> start!53414 true))

(declare-fun array_inv!13228 (array!36315) Bool)

(assert (=> start!53414 (array_inv!13228 a!2986)))

(declare-fun b!581116 () Bool)

(declare-fun res!368933 () Bool)

(assert (=> b!581116 (=> (not res!368933) (not e!333553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581116 (= res!368933 (validKeyInArray!0 k!1786))))

(declare-fun b!581117 () Bool)

(assert (=> b!581117 (= e!333555 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264844 () SeekEntryResult!5872)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36315 (_ BitVec 32)) SeekEntryResult!5872)

(assert (=> b!581117 (= lt!264844 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17432 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581118 () Bool)

(declare-fun res!368930 () Bool)

(assert (=> b!581118 (=> (not res!368930) (not e!333553))))

(assert (=> b!581118 (= res!368930 (validKeyInArray!0 (select (arr!17432 a!2986) j!136)))))

(declare-fun b!581119 () Bool)

(declare-fun res!368928 () Bool)

(assert (=> b!581119 (=> (not res!368928) (not e!333553))))

(declare-fun arrayContainsKey!0 (array!36315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581119 (= res!368928 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581120 () Bool)

(declare-fun res!368929 () Bool)

(assert (=> b!581120 (=> (not res!368929) (not e!333553))))

(assert (=> b!581120 (= res!368929 (and (= (size!17796 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17796 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17796 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53414 res!368931) b!581120))

(assert (= (and b!581120 res!368929) b!581118))

(assert (= (and b!581118 res!368930) b!581116))

(assert (= (and b!581116 res!368933) b!581119))

(assert (= (and b!581119 res!368928) b!581113))

(assert (= (and b!581113 res!368934) b!581115))

(assert (= (and b!581115 res!368935) b!581114))

(assert (= (and b!581114 res!368932) b!581112))

(assert (= (and b!581112 res!368936) b!581117))

(declare-fun m!559667 () Bool)

(assert (=> b!581114 m!559667))

(declare-fun m!559669 () Bool)

(assert (=> b!581118 m!559669))

(assert (=> b!581118 m!559669))

(declare-fun m!559671 () Bool)

(assert (=> b!581118 m!559671))

(declare-fun m!559673 () Bool)

(assert (=> b!581112 m!559673))

(declare-fun m!559675 () Bool)

(assert (=> b!581112 m!559675))

(declare-fun m!559677 () Bool)

(assert (=> b!581112 m!559677))

(assert (=> b!581117 m!559669))

(assert (=> b!581117 m!559669))

(declare-fun m!559679 () Bool)

(assert (=> b!581117 m!559679))

(declare-fun m!559681 () Bool)

(assert (=> b!581115 m!559681))

(declare-fun m!559683 () Bool)

(assert (=> b!581113 m!559683))

(declare-fun m!559685 () Bool)

(assert (=> b!581119 m!559685))

(declare-fun m!559687 () Bool)

(assert (=> start!53414 m!559687))

(declare-fun m!559689 () Bool)

(assert (=> start!53414 m!559689))

(declare-fun m!559691 () Bool)

(assert (=> b!581116 m!559691))

(push 1)

(assert (not b!581116))

(assert (not b!581118))

(assert (not b!581114))

(assert (not b!581119))

(assert (not b!581117))

(assert (not b!581115))

