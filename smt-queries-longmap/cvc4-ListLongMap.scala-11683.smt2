; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136652 () Bool)

(assert start!136652)

(declare-fun res!1078288 () Bool)

(declare-fun e!880304 () Bool)

(assert (=> start!136652 (=> (not res!1078288) (not e!880304))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136652 (= res!1078288 (validMask!0 mask!918))))

(assert (=> start!136652 e!880304))

(assert (=> start!136652 true))

(declare-datatypes ((array!105714 0))(
  ( (array!105715 (arr!50970 (Array (_ BitVec 32) (_ BitVec 64))) (size!51520 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105714)

(declare-fun array_inv!39697 (array!105714) Bool)

(assert (=> start!136652 (array_inv!39697 _keys!614)))

(declare-fun b!1578241 () Bool)

(declare-fun res!1078290 () Bool)

(assert (=> b!1578241 (=> (not res!1078290) (not e!880304))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578241 (= res!1078290 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51520 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50970 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578242 () Bool)

(declare-fun res!1078289 () Bool)

(assert (=> b!1578242 (=> (not res!1078289) (not e!880304))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578242 (= res!1078289 (validKeyInArray!0 k!772))))

(declare-fun b!1578243 () Bool)

(assert (=> b!1578243 (= e!880304 (and (bvslt x!466 #b01111111111111111111111111111110) (= (select (arr!50970 _keys!614) ee!18) k!772) (bvsge ee!18 (size!51520 _keys!614))))))

(assert (= (and start!136652 res!1078288) b!1578241))

(assert (= (and b!1578241 res!1078290) b!1578242))

(assert (= (and b!1578242 res!1078289) b!1578243))

(declare-fun m!1450341 () Bool)

(assert (=> start!136652 m!1450341))

(declare-fun m!1450343 () Bool)

(assert (=> start!136652 m!1450343))

(declare-fun m!1450345 () Bool)

(assert (=> b!1578241 m!1450345))

(declare-fun m!1450347 () Bool)

(assert (=> b!1578242 m!1450347))

(declare-fun m!1450349 () Bool)

(assert (=> b!1578243 m!1450349))

(push 1)

(assert (not start!136652))

(assert (not b!1578242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

