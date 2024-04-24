; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137066 () Bool)

(assert start!137066)

(declare-fun res!1079113 () Bool)

(declare-fun e!881776 () Bool)

(assert (=> start!137066 (=> (not res!1079113) (not e!881776))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137066 (= res!1079113 (validMask!0 mask!918))))

(assert (=> start!137066 e!881776))

(assert (=> start!137066 true))

(declare-datatypes ((array!105828 0))(
  ( (array!105829 (arr!51018 (Array (_ BitVec 32) (_ BitVec 64))) (size!51569 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105828)

(declare-fun array_inv!39973 (array!105828) Bool)

(assert (=> start!137066 (array_inv!39973 _keys!614)))

(declare-fun b!1580641 () Bool)

(declare-fun res!1079112 () Bool)

(assert (=> b!1580641 (=> (not res!1079112) (not e!881776))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580641 (= res!1079112 (validKeyInArray!0 k!772))))

(declare-fun b!1580640 () Bool)

(declare-fun res!1079114 () Bool)

(assert (=> b!1580640 (=> (not res!1079114) (not e!881776))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580640 (= res!1079114 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51569 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51018 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580643 () Bool)

(assert (=> b!1580643 (= e!881776 false)))

(declare-fun lt!677115 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580643 (= lt!677115 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun b!1580642 () Bool)

(declare-fun res!1079111 () Bool)

(assert (=> b!1580642 (=> (not res!1079111) (not e!881776))))

(assert (=> b!1580642 (= res!1079111 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51018 _keys!614) ee!18) k!772)) (not (= (select (arr!51018 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!137066 res!1079113) b!1580640))

(assert (= (and b!1580640 res!1079114) b!1580641))

(assert (= (and b!1580641 res!1079112) b!1580642))

(assert (= (and b!1580642 res!1079111) b!1580643))

(declare-fun m!1452561 () Bool)

(assert (=> b!1580643 m!1452561))

(declare-fun m!1452563 () Bool)

(assert (=> b!1580640 m!1452563))

(declare-fun m!1452565 () Bool)

(assert (=> b!1580642 m!1452565))

(declare-fun m!1452567 () Bool)

(assert (=> start!137066 m!1452567))

(declare-fun m!1452569 () Bool)

(assert (=> start!137066 m!1452569))

(declare-fun m!1452571 () Bool)

(assert (=> b!1580641 m!1452571))

(push 1)

(assert (not start!137066))

(assert (not b!1580643))

(assert (not b!1580641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

