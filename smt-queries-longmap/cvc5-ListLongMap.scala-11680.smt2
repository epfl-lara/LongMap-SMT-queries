; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137060 () Bool)

(assert start!137060)

(declare-fun b!1580607 () Bool)

(declare-fun e!881758 () Bool)

(assert (=> b!1580607 (= e!881758 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun lt!677106 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580607 (= lt!677106 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(declare-fun b!1580604 () Bool)

(declare-fun res!1079078 () Bool)

(assert (=> b!1580604 (=> (not res!1079078) (not e!881758))))

(declare-datatypes ((array!105822 0))(
  ( (array!105823 (arr!51015 (Array (_ BitVec 32) (_ BitVec 64))) (size!51566 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105822)

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1580604 (= res!1079078 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51566 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51015 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580605 () Bool)

(declare-fun res!1079075 () Bool)

(assert (=> b!1580605 (=> (not res!1079075) (not e!881758))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580605 (= res!1079075 (validKeyInArray!0 k!772))))

(declare-fun b!1580606 () Bool)

(declare-fun res!1079077 () Bool)

(assert (=> b!1580606 (=> (not res!1079077) (not e!881758))))

(assert (=> b!1580606 (= res!1079077 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51015 _keys!614) ee!18) k!772)) (not (= (select (arr!51015 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1079076 () Bool)

(assert (=> start!137060 (=> (not res!1079076) (not e!881758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137060 (= res!1079076 (validMask!0 mask!918))))

(assert (=> start!137060 e!881758))

(assert (=> start!137060 true))

(declare-fun array_inv!39970 (array!105822) Bool)

(assert (=> start!137060 (array_inv!39970 _keys!614)))

(assert (= (and start!137060 res!1079076) b!1580604))

(assert (= (and b!1580604 res!1079078) b!1580605))

(assert (= (and b!1580605 res!1079075) b!1580606))

(assert (= (and b!1580606 res!1079077) b!1580607))

(declare-fun m!1452525 () Bool)

(assert (=> b!1580606 m!1452525))

(declare-fun m!1452527 () Bool)

(assert (=> b!1580605 m!1452527))

(declare-fun m!1452529 () Bool)

(assert (=> b!1580604 m!1452529))

(declare-fun m!1452531 () Bool)

(assert (=> start!137060 m!1452531))

(declare-fun m!1452533 () Bool)

(assert (=> start!137060 m!1452533))

(declare-fun m!1452535 () Bool)

(assert (=> b!1580607 m!1452535))

(push 1)

(assert (not b!1580607))

(assert (not b!1580605))

(assert (not start!137060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

