; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136598 () Bool)

(assert start!136598)

(declare-fun res!1078080 () Bool)

(declare-fun e!880051 () Bool)

(assert (=> start!136598 (=> (not res!1078080) (not e!880051))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136598 (= res!1078080 (validMask!0 mask!918))))

(assert (=> start!136598 e!880051))

(assert (=> start!136598 true))

(declare-datatypes ((array!105627 0))(
  ( (array!105628 (arr!50926 (Array (_ BitVec 32) (_ BitVec 64))) (size!51478 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105627)

(declare-fun array_inv!39862 (array!105627) Bool)

(assert (=> start!136598 (array_inv!39862 _keys!614)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun b!1577849 () Bool)

(assert (=> b!1577849 (= e!880051 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51478 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge vacantSpotIndex!10 (size!51478 _keys!614))))))

(assert (= (and start!136598 res!1078080) b!1577849))

(declare-fun m!1449377 () Bool)

(assert (=> start!136598 m!1449377))

(declare-fun m!1449379 () Bool)

(assert (=> start!136598 m!1449379))

(push 1)

(assert (not start!136598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

