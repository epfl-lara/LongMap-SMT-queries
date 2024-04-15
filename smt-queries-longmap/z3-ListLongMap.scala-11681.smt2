; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136600 () Bool)

(assert start!136600)

(declare-fun res!1078088 () Bool)

(declare-fun e!880058 () Bool)

(assert (=> start!136600 (=> (not res!1078088) (not e!880058))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136600 (= res!1078088 (validMask!0 mask!918))))

(assert (=> start!136600 e!880058))

(assert (=> start!136600 true))

(declare-datatypes ((array!105629 0))(
  ( (array!105630 (arr!50927 (Array (_ BitVec 32) (_ BitVec 64))) (size!51479 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105629)

(declare-fun array_inv!39863 (array!105629) Bool)

(assert (=> start!136600 (array_inv!39863 _keys!614)))

(declare-fun b!1577856 () Bool)

(declare-fun res!1078089 () Bool)

(assert (=> b!1577856 (=> (not res!1078089) (not e!880058))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577856 (= res!1078089 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51479 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50927 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577857 () Bool)

(declare-fun res!1078087 () Bool)

(assert (=> b!1577857 (=> (not res!1078087) (not e!880058))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577857 (= res!1078087 (validKeyInArray!0 k0!772))))

(declare-fun b!1577858 () Bool)

(assert (=> b!1577858 (= e!880058 (bvslt (bvsub #b01111111111111111111111111111111 x!466) #b00000000000000000000000000000000))))

(assert (= (and start!136600 res!1078088) b!1577856))

(assert (= (and b!1577856 res!1078089) b!1577857))

(assert (= (and b!1577857 res!1078087) b!1577858))

(declare-fun m!1449381 () Bool)

(assert (=> start!136600 m!1449381))

(declare-fun m!1449383 () Bool)

(assert (=> start!136600 m!1449383))

(declare-fun m!1449385 () Bool)

(assert (=> b!1577856 m!1449385))

(declare-fun m!1449387 () Bool)

(assert (=> b!1577857 m!1449387))

(check-sat (not b!1577857) (not start!136600))
(check-sat)
