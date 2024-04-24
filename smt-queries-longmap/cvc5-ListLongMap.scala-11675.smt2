; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137006 () Bool)

(assert start!137006)

(declare-fun b!1580427 () Bool)

(declare-fun e!881668 () Bool)

(assert (=> b!1580427 (= e!881668 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun lt!677052 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580427 (= lt!677052 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun b!1580424 () Bool)

(declare-fun res!1078896 () Bool)

(assert (=> b!1580424 (=> (not res!1078896) (not e!881668))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-datatypes ((array!105789 0))(
  ( (array!105790 (arr!51000 (Array (_ BitVec 32) (_ BitVec 64))) (size!51551 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105789)

(assert (=> b!1580424 (= res!1078896 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51551 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51000 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1078898 () Bool)

(assert (=> start!137006 (=> (not res!1078898) (not e!881668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137006 (= res!1078898 (validMask!0 mask!918))))

(assert (=> start!137006 e!881668))

(assert (=> start!137006 true))

(declare-fun array_inv!39955 (array!105789) Bool)

(assert (=> start!137006 (array_inv!39955 _keys!614)))

(declare-fun b!1580426 () Bool)

(declare-fun res!1078897 () Bool)

(assert (=> b!1580426 (=> (not res!1078897) (not e!881668))))

(declare-fun k!772 () (_ BitVec 64))

(assert (=> b!1580426 (= res!1078897 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51000 _keys!614) ee!18) k!772)) (not (= (select (arr!51000 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1580425 () Bool)

(declare-fun res!1078895 () Bool)

(assert (=> b!1580425 (=> (not res!1078895) (not e!881668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580425 (= res!1078895 (validKeyInArray!0 k!772))))

(assert (= (and start!137006 res!1078898) b!1580424))

(assert (= (and b!1580424 res!1078896) b!1580425))

(assert (= (and b!1580425 res!1078895) b!1580426))

(assert (= (and b!1580426 res!1078897) b!1580427))

(declare-fun m!1452339 () Bool)

(assert (=> start!137006 m!1452339))

(declare-fun m!1452341 () Bool)

(assert (=> start!137006 m!1452341))

(declare-fun m!1452343 () Bool)

(assert (=> b!1580427 m!1452343))

(declare-fun m!1452345 () Bool)

(assert (=> b!1580426 m!1452345))

(declare-fun m!1452347 () Bool)

(assert (=> b!1580425 m!1452347))

(declare-fun m!1452349 () Bool)

(assert (=> b!1580424 m!1452349))

(push 1)

(assert (not b!1580425))

(assert (not b!1580427))

(assert (not start!137006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

