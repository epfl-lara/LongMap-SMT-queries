; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136378 () Bool)

(assert start!136378)

(declare-fun res!1077498 () Bool)

(declare-fun e!879733 () Bool)

(assert (=> start!136378 (=> (not res!1077498) (not e!879733))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136378 (= res!1077498 (validMask!0 mask!910))))

(assert (=> start!136378 e!879733))

(assert (=> start!136378 true))

(declare-datatypes ((array!105569 0))(
  ( (array!105570 (arr!50905 (Array (_ BitVec 32) (_ BitVec 64))) (size!51455 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105569)

(declare-fun array_inv!39632 (array!105569) Bool)

(assert (=> start!136378 (array_inv!39632 _keys!610)))

(declare-fun b!1577233 () Bool)

(declare-fun res!1077497 () Bool)

(assert (=> b!1577233 (=> (not res!1077497) (not e!879733))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577233 (= res!1077497 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51455 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577234 () Bool)

(declare-fun res!1077496 () Bool)

(assert (=> b!1577234 (=> (not res!1077496) (not e!879733))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577234 (= res!1077496 (validKeyInArray!0 k!768))))

(declare-fun b!1577235 () Bool)

(assert (=> b!1577235 (= e!879733 (bvsge ee!12 (size!51455 _keys!610)))))

(assert (= (and start!136378 res!1077498) b!1577233))

(assert (= (and b!1577233 res!1077497) b!1577234))

(assert (= (and b!1577234 res!1077496) b!1577235))

(declare-fun m!1449541 () Bool)

(assert (=> start!136378 m!1449541))

(declare-fun m!1449543 () Bool)

(assert (=> start!136378 m!1449543))

(declare-fun m!1449545 () Bool)

(assert (=> b!1577234 m!1449545))

(push 1)

(assert (not b!1577234))

(assert (not start!136378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

