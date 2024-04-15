; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136624 () Bool)

(assert start!136624)

(declare-fun b!1577969 () Bool)

(declare-fun e!880130 () Bool)

(declare-fun x!466 () (_ BitVec 32))

(assert (=> b!1577969 (= e!880130 (bvsge (bvsub #b01111111111111111111111111111111 (bvadd #b00000000000000000000000000000001 x!466)) (bvsub #b01111111111111111111111111111111 x!466)))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun lt!675924 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577969 (= lt!675924 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1078199 () Bool)

(assert (=> start!136624 (=> (not res!1078199) (not e!880130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136624 (= res!1078199 (validMask!0 mask!918))))

(assert (=> start!136624 e!880130))

(assert (=> start!136624 true))

(declare-datatypes ((array!105653 0))(
  ( (array!105654 (arr!50939 (Array (_ BitVec 32) (_ BitVec 64))) (size!51491 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105653)

(declare-fun array_inv!39875 (array!105653) Bool)

(assert (=> start!136624 (array_inv!39875 _keys!614)))

(declare-fun b!1577967 () Bool)

(declare-fun res!1078198 () Bool)

(assert (=> b!1577967 (=> (not res!1078198) (not e!880130))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577967 (= res!1078198 (validKeyInArray!0 k0!772))))

(declare-fun b!1577966 () Bool)

(declare-fun res!1078200 () Bool)

(assert (=> b!1577966 (=> (not res!1078200) (not e!880130))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577966 (= res!1078200 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51491 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50939 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577968 () Bool)

(declare-fun res!1078197 () Bool)

(assert (=> b!1577968 (=> (not res!1078197) (not e!880130))))

(assert (=> b!1577968 (= res!1078197 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50939 _keys!614) ee!18) k0!772)) (not (= (select (arr!50939 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136624 res!1078199) b!1577966))

(assert (= (and b!1577966 res!1078200) b!1577967))

(assert (= (and b!1577967 res!1078198) b!1577968))

(assert (= (and b!1577968 res!1078197) b!1577969))

(declare-fun m!1449489 () Bool)

(assert (=> b!1577969 m!1449489))

(declare-fun m!1449491 () Bool)

(assert (=> start!136624 m!1449491))

(declare-fun m!1449493 () Bool)

(assert (=> start!136624 m!1449493))

(declare-fun m!1449495 () Bool)

(assert (=> b!1577968 m!1449495))

(declare-fun m!1449497 () Bool)

(assert (=> b!1577967 m!1449497))

(declare-fun m!1449499 () Bool)

(assert (=> b!1577966 m!1449499))

(check-sat (not b!1577967) (not start!136624) (not b!1577969))
(check-sat)
