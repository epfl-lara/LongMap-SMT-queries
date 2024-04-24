; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53028 () Bool)

(assert start!53028)

(declare-fun b!577203 () Bool)

(declare-fun res!365130 () Bool)

(declare-fun e!332082 () Bool)

(assert (=> b!577203 (=> (not res!365130) (not e!332082))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!35991 0))(
  ( (array!35992 (arr!17272 (Array (_ BitVec 32) (_ BitVec 64))) (size!17636 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35991)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577203 (= res!365130 (and (= (size!17636 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17636 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17636 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577204 () Bool)

(declare-fun res!365133 () Bool)

(assert (=> b!577204 (=> (not res!365133) (not e!332082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577204 (= res!365133 (validKeyInArray!0 (select (arr!17272 a!2986) j!136)))))

(declare-fun b!577205 () Bool)

(declare-fun res!365134 () Bool)

(assert (=> b!577205 (=> (not res!365134) (not e!332082))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577205 (= res!365134 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577206 () Bool)

(assert (=> b!577206 (= e!332082 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!577207 () Bool)

(declare-fun res!365132 () Bool)

(assert (=> b!577207 (=> (not res!365132) (not e!332082))))

(assert (=> b!577207 (= res!365132 (validKeyInArray!0 k0!1786))))

(declare-fun res!365131 () Bool)

(assert (=> start!53028 (=> (not res!365131) (not e!332082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53028 (= res!365131 (validMask!0 mask!3053))))

(assert (=> start!53028 e!332082))

(assert (=> start!53028 true))

(declare-fun array_inv!13131 (array!35991) Bool)

(assert (=> start!53028 (array_inv!13131 a!2986)))

(assert (= (and start!53028 res!365131) b!577203))

(assert (= (and b!577203 res!365130) b!577204))

(assert (= (and b!577204 res!365133) b!577207))

(assert (= (and b!577207 res!365132) b!577205))

(assert (= (and b!577205 res!365134) b!577206))

(declare-fun m!556277 () Bool)

(assert (=> b!577204 m!556277))

(assert (=> b!577204 m!556277))

(declare-fun m!556279 () Bool)

(assert (=> b!577204 m!556279))

(declare-fun m!556281 () Bool)

(assert (=> b!577205 m!556281))

(declare-fun m!556283 () Bool)

(assert (=> b!577207 m!556283))

(declare-fun m!556285 () Bool)

(assert (=> start!53028 m!556285))

(declare-fun m!556287 () Bool)

(assert (=> start!53028 m!556287))

(check-sat (not b!577207) (not start!53028) (not b!577204) (not b!577205))
(check-sat)
