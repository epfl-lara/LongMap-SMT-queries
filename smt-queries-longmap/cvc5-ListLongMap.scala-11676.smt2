; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137012 () Bool)

(assert start!137012)

(declare-fun res!1078934 () Bool)

(declare-fun e!881687 () Bool)

(assert (=> start!137012 (=> (not res!1078934) (not e!881687))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137012 (= res!1078934 (validMask!0 mask!918))))

(assert (=> start!137012 e!881687))

(assert (=> start!137012 true))

(declare-datatypes ((array!105795 0))(
  ( (array!105796 (arr!51003 (Array (_ BitVec 32) (_ BitVec 64))) (size!51554 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105795)

(declare-fun array_inv!39958 (array!105795) Bool)

(assert (=> start!137012 (array_inv!39958 _keys!614)))

(declare-fun b!1580463 () Bool)

(assert (=> b!1580463 (= e!881687 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun lt!677061 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580463 (= lt!677061 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun b!1580460 () Bool)

(declare-fun res!1078931 () Bool)

(assert (=> b!1580460 (=> (not res!1078931) (not e!881687))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1580460 (= res!1078931 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51554 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51003 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580461 () Bool)

(declare-fun res!1078933 () Bool)

(assert (=> b!1580461 (=> (not res!1078933) (not e!881687))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580461 (= res!1078933 (validKeyInArray!0 k!772))))

(declare-fun b!1580462 () Bool)

(declare-fun res!1078932 () Bool)

(assert (=> b!1580462 (=> (not res!1078932) (not e!881687))))

(assert (=> b!1580462 (= res!1078932 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51003 _keys!614) ee!18) k!772)) (not (= (select (arr!51003 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!137012 res!1078934) b!1580460))

(assert (= (and b!1580460 res!1078931) b!1580461))

(assert (= (and b!1580461 res!1078933) b!1580462))

(assert (= (and b!1580462 res!1078932) b!1580463))

(declare-fun m!1452375 () Bool)

(assert (=> b!1580461 m!1452375))

(declare-fun m!1452377 () Bool)

(assert (=> b!1580462 m!1452377))

(declare-fun m!1452379 () Bool)

(assert (=> b!1580463 m!1452379))

(declare-fun m!1452381 () Bool)

(assert (=> b!1580460 m!1452381))

(declare-fun m!1452383 () Bool)

(assert (=> start!137012 m!1452383))

(declare-fun m!1452385 () Bool)

(assert (=> start!137012 m!1452385))

(push 1)

(assert (not b!1580463))

(assert (not b!1580461))

(assert (not start!137012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

