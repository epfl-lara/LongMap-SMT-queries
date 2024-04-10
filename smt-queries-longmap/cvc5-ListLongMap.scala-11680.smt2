; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136630 () Bool)

(assert start!136630)

(declare-fun res!1078203 () Bool)

(declare-fun e!880237 () Bool)

(assert (=> start!136630 (=> (not res!1078203) (not e!880237))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136630 (= res!1078203 (validMask!0 mask!918))))

(assert (=> start!136630 e!880237))

(assert (=> start!136630 true))

(declare-datatypes ((array!105692 0))(
  ( (array!105693 (arr!50959 (Array (_ BitVec 32) (_ BitVec 64))) (size!51509 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105692)

(declare-fun array_inv!39686 (array!105692) Bool)

(assert (=> start!136630 (array_inv!39686 _keys!614)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun b!1578156 () Bool)

(assert (=> b!1578156 (= e!880237 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51509 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge vacantSpotIndex!10 (size!51509 _keys!614))))))

(assert (= (and start!136630 res!1078203) b!1578156))

(declare-fun m!1450261 () Bool)

(assert (=> start!136630 m!1450261))

(declare-fun m!1450263 () Bool)

(assert (=> start!136630 m!1450263))

(push 1)

(assert (not start!136630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

