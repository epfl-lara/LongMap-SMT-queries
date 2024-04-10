; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53614 () Bool)

(assert start!53614)

(declare-fun b!583962 () Bool)

(declare-fun res!371789 () Bool)

(declare-fun e!334492 () Bool)

(assert (=> b!583962 (=> (not res!371789) (not e!334492))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36515 0))(
  ( (array!36516 (arr!17532 (Array (_ BitVec 32) (_ BitVec 64))) (size!17896 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36515)

(assert (=> b!583962 (= res!371789 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17532 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17532 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583963 () Bool)

(declare-fun res!371782 () Bool)

(declare-fun e!334493 () Bool)

(assert (=> b!583963 (=> (not res!371782) (not e!334493))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583963 (= res!371782 (and (= (size!17896 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17896 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17896 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583964 () Bool)

(declare-fun res!371787 () Bool)

(assert (=> b!583964 (=> (not res!371787) (not e!334493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583964 (= res!371787 (validKeyInArray!0 (select (arr!17532 a!2986) j!136)))))

(declare-fun b!583965 () Bool)

(assert (=> b!583965 (= e!334493 e!334492)))

(declare-fun res!371785 () Bool)

(assert (=> b!583965 (=> (not res!371785) (not e!334492))))

(declare-datatypes ((SeekEntryResult!5972 0))(
  ( (MissingZero!5972 (index!26115 (_ BitVec 32))) (Found!5972 (index!26116 (_ BitVec 32))) (Intermediate!5972 (undefined!6784 Bool) (index!26117 (_ BitVec 32)) (x!54953 (_ BitVec 32))) (Undefined!5972) (MissingVacant!5972 (index!26118 (_ BitVec 32))) )
))
(declare-fun lt!265455 () SeekEntryResult!5972)

(assert (=> b!583965 (= res!371785 (or (= lt!265455 (MissingZero!5972 i!1108)) (= lt!265455 (MissingVacant!5972 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36515 (_ BitVec 32)) SeekEntryResult!5972)

(assert (=> b!583965 (= lt!265455 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583966 () Bool)

(declare-fun e!334491 () Bool)

(assert (=> b!583966 (= e!334491 false)))

(declare-fun lt!265454 () SeekEntryResult!5972)

(declare-fun lt!265456 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36515 (_ BitVec 32)) SeekEntryResult!5972)

(assert (=> b!583966 (= lt!265454 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265456 vacantSpotIndex!68 (select (arr!17532 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!371778 () Bool)

(assert (=> start!53614 (=> (not res!371778) (not e!334493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53614 (= res!371778 (validMask!0 mask!3053))))

(assert (=> start!53614 e!334493))

(assert (=> start!53614 true))

(declare-fun array_inv!13328 (array!36515) Bool)

(assert (=> start!53614 (array_inv!13328 a!2986)))

(declare-fun b!583967 () Bool)

(declare-fun res!371781 () Bool)

(assert (=> b!583967 (=> (not res!371781) (not e!334492))))

(assert (=> b!583967 (= res!371781 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17532 a!2986) j!136) a!2986 mask!3053) (Found!5972 j!136)))))

(declare-fun b!583968 () Bool)

(declare-fun res!371780 () Bool)

(assert (=> b!583968 (=> (not res!371780) (not e!334492))))

(declare-datatypes ((List!11573 0))(
  ( (Nil!11570) (Cons!11569 (h!12614 (_ BitVec 64)) (t!17801 List!11573)) )
))
(declare-fun arrayNoDuplicates!0 (array!36515 (_ BitVec 32) List!11573) Bool)

(assert (=> b!583968 (= res!371780 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11570))))

(declare-fun b!583969 () Bool)

(declare-fun res!371783 () Bool)

(assert (=> b!583969 (=> (not res!371783) (not e!334493))))

(assert (=> b!583969 (= res!371783 (validKeyInArray!0 k!1786))))

(declare-fun b!583970 () Bool)

(declare-fun res!371784 () Bool)

(assert (=> b!583970 (=> (not res!371784) (not e!334492))))

(assert (=> b!583970 (= res!371784 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17532 a!2986) index!984) (select (arr!17532 a!2986) j!136))) (not (= (select (arr!17532 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583971 () Bool)

(assert (=> b!583971 (= e!334492 e!334491)))

(declare-fun res!371786 () Bool)

(assert (=> b!583971 (=> (not res!371786) (not e!334491))))

(assert (=> b!583971 (= res!371786 (and (bvsge lt!265456 #b00000000000000000000000000000000) (bvslt lt!265456 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583971 (= lt!265456 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583972 () Bool)

(declare-fun res!371788 () Bool)

(assert (=> b!583972 (=> (not res!371788) (not e!334493))))

(declare-fun arrayContainsKey!0 (array!36515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583972 (= res!371788 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583973 () Bool)

(declare-fun res!371779 () Bool)

(assert (=> b!583973 (=> (not res!371779) (not e!334492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36515 (_ BitVec 32)) Bool)

(assert (=> b!583973 (= res!371779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53614 res!371778) b!583963))

(assert (= (and b!583963 res!371782) b!583964))

(assert (= (and b!583964 res!371787) b!583969))

(assert (= (and b!583969 res!371783) b!583972))

(assert (= (and b!583972 res!371788) b!583965))

(assert (= (and b!583965 res!371785) b!583973))

(assert (= (and b!583973 res!371779) b!583968))

(assert (= (and b!583968 res!371780) b!583962))

(assert (= (and b!583962 res!371789) b!583967))

(assert (= (and b!583967 res!371781) b!583970))

(assert (= (and b!583970 res!371784) b!583971))

(assert (= (and b!583971 res!371786) b!583966))

(declare-fun m!562369 () Bool)

(assert (=> b!583967 m!562369))

(assert (=> b!583967 m!562369))

(declare-fun m!562371 () Bool)

(assert (=> b!583967 m!562371))

(declare-fun m!562373 () Bool)

(assert (=> b!583971 m!562373))

(declare-fun m!562375 () Bool)

(assert (=> b!583968 m!562375))

(declare-fun m!562377 () Bool)

(assert (=> start!53614 m!562377))

(declare-fun m!562379 () Bool)

(assert (=> start!53614 m!562379))

(declare-fun m!562381 () Bool)

(assert (=> b!583972 m!562381))

(declare-fun m!562383 () Bool)

(assert (=> b!583969 m!562383))

(assert (=> b!583964 m!562369))

(assert (=> b!583964 m!562369))

(declare-fun m!562385 () Bool)

(assert (=> b!583964 m!562385))

(declare-fun m!562387 () Bool)

(assert (=> b!583965 m!562387))

(declare-fun m!562389 () Bool)

(assert (=> b!583973 m!562389))

(assert (=> b!583966 m!562369))

(assert (=> b!583966 m!562369))

(declare-fun m!562391 () Bool)

(assert (=> b!583966 m!562391))

(declare-fun m!562393 () Bool)

(assert (=> b!583962 m!562393))

(declare-fun m!562395 () Bool)

(assert (=> b!583962 m!562395))

(declare-fun m!562397 () Bool)

(assert (=> b!583962 m!562397))

(declare-fun m!562399 () Bool)

(assert (=> b!583970 m!562399))

(assert (=> b!583970 m!562369))

(push 1)

