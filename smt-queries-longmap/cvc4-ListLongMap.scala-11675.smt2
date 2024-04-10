; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136580 () Bool)

(assert start!136580)

(declare-fun res!1078055 () Bool)

(declare-fun e!880160 () Bool)

(assert (=> start!136580 (=> (not res!1078055) (not e!880160))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136580 (= res!1078055 (validMask!0 mask!918))))

(assert (=> start!136580 e!880160))

(assert (=> start!136580 true))

(declare-datatypes ((array!105663 0))(
  ( (array!105664 (arr!50946 (Array (_ BitVec 32) (_ BitVec 64))) (size!51496 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105663)

(declare-fun array_inv!39673 (array!105663) Bool)

(assert (=> start!136580 (array_inv!39673 _keys!614)))

(declare-fun b!1578006 () Bool)

(declare-fun res!1078053 () Bool)

(assert (=> b!1578006 (=> (not res!1078053) (not e!880160))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578006 (= res!1078053 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51496 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50946 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578008 () Bool)

(declare-fun res!1078054 () Bool)

(assert (=> b!1578008 (=> (not res!1078054) (not e!880160))))

(declare-fun k!772 () (_ BitVec 64))

(assert (=> b!1578008 (= res!1078054 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50946 _keys!614) ee!18) k!772)) (not (= (select (arr!50946 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578009 () Bool)

(declare-fun lt!676162 () (_ BitVec 32))

(assert (=> b!1578009 (= e!880160 (or (bvslt lt!676162 #b00000000000000000000000000000000) (bvsge lt!676162 (bvadd #b00000000000000000000000000000001 mask!918))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578009 (= lt!676162 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578007 () Bool)

(declare-fun res!1078056 () Bool)

(assert (=> b!1578007 (=> (not res!1078056) (not e!880160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578007 (= res!1078056 (validKeyInArray!0 k!772))))

(assert (= (and start!136580 res!1078055) b!1578006))

(assert (= (and b!1578006 res!1078053) b!1578007))

(assert (= (and b!1578007 res!1078056) b!1578008))

(assert (= (and b!1578008 res!1078054) b!1578009))

(declare-fun m!1450099 () Bool)

(assert (=> start!136580 m!1450099))

(declare-fun m!1450101 () Bool)

(assert (=> start!136580 m!1450101))

(declare-fun m!1450103 () Bool)

(assert (=> b!1578008 m!1450103))

(declare-fun m!1450105 () Bool)

(assert (=> b!1578009 m!1450105))

(declare-fun m!1450107 () Bool)

(assert (=> b!1578007 m!1450107))

(declare-fun m!1450109 () Bool)

(assert (=> b!1578006 m!1450109))

(push 1)

(assert (not b!1578007))

(assert (not start!136580))

(assert (not b!1578009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166011 () Bool)

(assert (=> d!166011 (= (validKeyInArray!0 k!772) (and (not (= k!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578007 d!166011))

(declare-fun d!166013 () Bool)

(assert (=> d!166013 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136580 d!166013))

(declare-fun d!166017 () Bool)

(assert (=> d!166017 (= (array_inv!39673 _keys!614) (bvsge (size!51496 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136580 d!166017))

(declare-fun d!166019 () Bool)

(declare-fun lt!676171 () (_ BitVec 32))

(assert (=> d!166019 (and (bvsge lt!676171 #b00000000000000000000000000000000) (bvslt lt!676171 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166019 (= lt!676171 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!166019 (validMask!0 mask!918)))

(assert (=> d!166019 (= (nextIndex!0 ee!18 x!466 mask!918) lt!676171)))

(declare-fun bs!45618 () Bool)

(assert (= bs!45618 d!166019))

(declare-fun m!1450115 () Bool)

(assert (=> bs!45618 m!1450115))

(assert (=> bs!45618 m!1450099))

(assert (=> b!1578009 d!166019))

(push 1)

(assert (not d!166019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

