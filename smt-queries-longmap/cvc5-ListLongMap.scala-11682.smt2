; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137072 () Bool)

(assert start!137072)

(declare-fun res!1079123 () Bool)

(declare-fun e!881794 () Bool)

(assert (=> start!137072 (=> (not res!1079123) (not e!881794))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137072 (= res!1079123 (validMask!0 mask!918))))

(assert (=> start!137072 e!881794))

(assert (=> start!137072 true))

(declare-datatypes ((array!105834 0))(
  ( (array!105835 (arr!51021 (Array (_ BitVec 32) (_ BitVec 64))) (size!51572 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105834)

(declare-fun array_inv!39976 (array!105834) Bool)

(assert (=> start!137072 (array_inv!39976 _keys!614)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun b!1580652 () Bool)

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580652 (= e!881794 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51572 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge vacantSpotIndex!10 (size!51572 _keys!614))))))

(assert (= (and start!137072 res!1079123) b!1580652))

(declare-fun m!1452581 () Bool)

(assert (=> start!137072 m!1452581))

(declare-fun m!1452583 () Bool)

(assert (=> start!137072 m!1452583))

(push 1)

(assert (not start!137072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

