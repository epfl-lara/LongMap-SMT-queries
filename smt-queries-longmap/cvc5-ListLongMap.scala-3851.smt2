; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52990 () Bool)

(assert start!52990)

(declare-fun b!577096 () Bool)

(declare-fun res!365128 () Bool)

(declare-fun e!331988 () Bool)

(assert (=> b!577096 (=> (not res!365128) (not e!331988))))

(declare-datatypes ((array!36008 0))(
  ( (array!36009 (arr!17283 (Array (_ BitVec 32) (_ BitVec 64))) (size!17647 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36008)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577096 (= res!365128 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577097 () Bool)

(declare-fun res!365130 () Bool)

(assert (=> b!577097 (=> (not res!365130) (not e!331988))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5723 0))(
  ( (MissingZero!5723 (index!25119 (_ BitVec 32))) (Found!5723 (index!25120 (_ BitVec 32))) (Intermediate!5723 (undefined!6535 Bool) (index!25121 (_ BitVec 32)) (x!54040 (_ BitVec 32))) (Undefined!5723) (MissingVacant!5723 (index!25122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36008 (_ BitVec 32)) SeekEntryResult!5723)

(assert (=> b!577097 (= res!365130 (not (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) (MissingZero!5723 i!1108))))))

(declare-fun b!577098 () Bool)

(declare-fun res!365131 () Bool)

(assert (=> b!577098 (=> (not res!365131) (not e!331988))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577098 (= res!365131 (and (= (size!17647 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17647 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17647 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577099 () Bool)

(declare-fun res!365132 () Bool)

(assert (=> b!577099 (=> (not res!365132) (not e!331988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577099 (= res!365132 (validKeyInArray!0 (select (arr!17283 a!2986) j!136)))))

(declare-fun b!577100 () Bool)

(assert (=> b!577100 (= e!331988 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!577095 () Bool)

(declare-fun res!365129 () Bool)

(assert (=> b!577095 (=> (not res!365129) (not e!331988))))

(assert (=> b!577095 (= res!365129 (validKeyInArray!0 k!1786))))

(declare-fun res!365127 () Bool)

(assert (=> start!52990 (=> (not res!365127) (not e!331988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52990 (= res!365127 (validMask!0 mask!3053))))

(assert (=> start!52990 e!331988))

(assert (=> start!52990 true))

(declare-fun array_inv!13079 (array!36008) Bool)

(assert (=> start!52990 (array_inv!13079 a!2986)))

(assert (= (and start!52990 res!365127) b!577098))

(assert (= (and b!577098 res!365131) b!577099))

(assert (= (and b!577099 res!365132) b!577095))

(assert (= (and b!577095 res!365129) b!577096))

(assert (= (and b!577096 res!365128) b!577097))

(assert (= (and b!577097 res!365130) b!577100))

(declare-fun m!556017 () Bool)

(assert (=> b!577097 m!556017))

(declare-fun m!556019 () Bool)

(assert (=> b!577099 m!556019))

(assert (=> b!577099 m!556019))

(declare-fun m!556021 () Bool)

(assert (=> b!577099 m!556021))

(declare-fun m!556023 () Bool)

(assert (=> start!52990 m!556023))

(declare-fun m!556025 () Bool)

(assert (=> start!52990 m!556025))

(declare-fun m!556027 () Bool)

(assert (=> b!577095 m!556027))

(declare-fun m!556029 () Bool)

(assert (=> b!577096 m!556029))

(push 1)

(assert (not start!52990))

(assert (not b!577095))

(assert (not b!577097))

(assert (not b!577096))

(assert (not b!577099))

(check-sat)

