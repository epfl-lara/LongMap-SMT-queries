; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137000 () Bool)

(assert start!137000)

(declare-fun b!1580389 () Bool)

(declare-fun res!1078862 () Bool)

(declare-fun e!881651 () Bool)

(assert (=> b!1580389 (=> (not res!1078862) (not e!881651))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580389 (= res!1078862 (validKeyInArray!0 k!772))))

(declare-fun b!1580391 () Bool)

(assert (=> b!1580391 (= e!881651 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun lt!677043 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580391 (= lt!677043 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun res!1078861 () Bool)

(assert (=> start!137000 (=> (not res!1078861) (not e!881651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137000 (= res!1078861 (validMask!0 mask!918))))

(assert (=> start!137000 e!881651))

(assert (=> start!137000 true))

(declare-datatypes ((array!105783 0))(
  ( (array!105784 (arr!50997 (Array (_ BitVec 32) (_ BitVec 64))) (size!51548 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105783)

(declare-fun array_inv!39952 (array!105783) Bool)

(assert (=> start!137000 (array_inv!39952 _keys!614)))

(declare-fun b!1580390 () Bool)

(declare-fun res!1078859 () Bool)

(assert (=> b!1580390 (=> (not res!1078859) (not e!881651))))

(assert (=> b!1580390 (= res!1078859 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50997 _keys!614) ee!18) k!772)) (not (= (select (arr!50997 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1580388 () Bool)

(declare-fun res!1078860 () Bool)

(assert (=> b!1580388 (=> (not res!1078860) (not e!881651))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1580388 (= res!1078860 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51548 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50997 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!137000 res!1078861) b!1580388))

(assert (= (and b!1580388 res!1078860) b!1580389))

(assert (= (and b!1580389 res!1078862) b!1580390))

(assert (= (and b!1580390 res!1078859) b!1580391))

(declare-fun m!1452303 () Bool)

(assert (=> b!1580391 m!1452303))

(declare-fun m!1452305 () Bool)

(assert (=> b!1580389 m!1452305))

(declare-fun m!1452307 () Bool)

(assert (=> b!1580390 m!1452307))

(declare-fun m!1452309 () Bool)

(assert (=> b!1580388 m!1452309))

(declare-fun m!1452311 () Bool)

(assert (=> start!137000 m!1452311))

(declare-fun m!1452313 () Bool)

(assert (=> start!137000 m!1452313))

(push 1)

(assert (not start!137000))

(assert (not b!1580389))

(assert (not b!1580391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

