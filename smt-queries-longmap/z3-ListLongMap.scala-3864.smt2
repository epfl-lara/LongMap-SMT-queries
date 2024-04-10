; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53196 () Bool)

(assert start!53196)

(declare-fun res!366067 () Bool)

(declare-fun e!332573 () Bool)

(assert (=> start!53196 (=> (not res!366067) (not e!332573))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53196 (= res!366067 (validMask!0 mask!3053))))

(assert (=> start!53196 e!332573))

(assert (=> start!53196 true))

(declare-datatypes ((array!36097 0))(
  ( (array!36098 (arr!17323 (Array (_ BitVec 32) (_ BitVec 64))) (size!17687 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36097)

(declare-fun array_inv!13119 (array!36097) Bool)

(assert (=> start!53196 (array_inv!13119 a!2986)))

(declare-fun b!578249 () Bool)

(declare-fun res!366071 () Bool)

(assert (=> b!578249 (=> (not res!366071) (not e!332573))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578249 (= res!366071 (validKeyInArray!0 (select (arr!17323 a!2986) j!136)))))

(declare-fun b!578250 () Bool)

(declare-fun e!332572 () Bool)

(assert (=> b!578250 (= e!332572 false)))

(declare-fun lt!264207 () Bool)

(declare-datatypes ((List!11364 0))(
  ( (Nil!11361) (Cons!11360 (h!12405 (_ BitVec 64)) (t!17592 List!11364)) )
))
(declare-fun arrayNoDuplicates!0 (array!36097 (_ BitVec 32) List!11364) Bool)

(assert (=> b!578250 (= lt!264207 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11361))))

(declare-fun b!578251 () Bool)

(declare-fun res!366070 () Bool)

(assert (=> b!578251 (=> (not res!366070) (not e!332573))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578251 (= res!366070 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578252 () Bool)

(assert (=> b!578252 (= e!332573 e!332572)))

(declare-fun res!366069 () Bool)

(assert (=> b!578252 (=> (not res!366069) (not e!332572))))

(declare-datatypes ((SeekEntryResult!5763 0))(
  ( (MissingZero!5763 (index!25279 (_ BitVec 32))) (Found!5763 (index!25280 (_ BitVec 32))) (Intermediate!5763 (undefined!6575 Bool) (index!25281 (_ BitVec 32)) (x!54184 (_ BitVec 32))) (Undefined!5763) (MissingVacant!5763 (index!25282 (_ BitVec 32))) )
))
(declare-fun lt!264208 () SeekEntryResult!5763)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578252 (= res!366069 (or (= lt!264208 (MissingZero!5763 i!1108)) (= lt!264208 (MissingVacant!5763 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36097 (_ BitVec 32)) SeekEntryResult!5763)

(assert (=> b!578252 (= lt!264208 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578253 () Bool)

(declare-fun res!366068 () Bool)

(assert (=> b!578253 (=> (not res!366068) (not e!332572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36097 (_ BitVec 32)) Bool)

(assert (=> b!578253 (= res!366068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578254 () Bool)

(declare-fun res!366066 () Bool)

(assert (=> b!578254 (=> (not res!366066) (not e!332573))))

(assert (=> b!578254 (= res!366066 (and (= (size!17687 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17687 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17687 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578255 () Bool)

(declare-fun res!366065 () Bool)

(assert (=> b!578255 (=> (not res!366065) (not e!332573))))

(assert (=> b!578255 (= res!366065 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53196 res!366067) b!578254))

(assert (= (and b!578254 res!366066) b!578249))

(assert (= (and b!578249 res!366071) b!578255))

(assert (= (and b!578255 res!366065) b!578251))

(assert (= (and b!578251 res!366070) b!578252))

(assert (= (and b!578252 res!366069) b!578253))

(assert (= (and b!578253 res!366068) b!578250))

(declare-fun m!556963 () Bool)

(assert (=> start!53196 m!556963))

(declare-fun m!556965 () Bool)

(assert (=> start!53196 m!556965))

(declare-fun m!556967 () Bool)

(assert (=> b!578250 m!556967))

(declare-fun m!556969 () Bool)

(assert (=> b!578253 m!556969))

(declare-fun m!556971 () Bool)

(assert (=> b!578252 m!556971))

(declare-fun m!556973 () Bool)

(assert (=> b!578251 m!556973))

(declare-fun m!556975 () Bool)

(assert (=> b!578255 m!556975))

(declare-fun m!556977 () Bool)

(assert (=> b!578249 m!556977))

(assert (=> b!578249 m!556977))

(declare-fun m!556979 () Bool)

(assert (=> b!578249 m!556979))

(check-sat (not start!53196) (not b!578252) (not b!578250) (not b!578255) (not b!578251) (not b!578249) (not b!578253))
(check-sat)
