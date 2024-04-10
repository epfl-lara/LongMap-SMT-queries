; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136634 () Bool)

(assert start!136634)

(declare-fun res!1078209 () Bool)

(declare-fun e!880249 () Bool)

(assert (=> start!136634 (=> (not res!1078209) (not e!880249))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136634 (= res!1078209 (validMask!0 mask!918))))

(assert (=> start!136634 e!880249))

(assert (=> start!136634 true))

(declare-datatypes ((array!105696 0))(
  ( (array!105697 (arr!50961 (Array (_ BitVec 32) (_ BitVec 64))) (size!51511 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105696)

(declare-fun array_inv!39688 (array!105696) Bool)

(assert (=> start!136634 (array_inv!39688 _keys!614)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun b!1578162 () Bool)

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578162 (= e!880249 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51511 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge vacantSpotIndex!10 (size!51511 _keys!614))))))

(assert (= (and start!136634 res!1078209) b!1578162))

(declare-fun m!1450269 () Bool)

(assert (=> start!136634 m!1450269))

(declare-fun m!1450271 () Bool)

(assert (=> start!136634 m!1450271))

(push 1)

(assert (not start!136634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

