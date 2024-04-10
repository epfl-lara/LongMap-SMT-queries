; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136390 () Bool)

(assert start!136390)

(declare-fun res!1077550 () Bool)

(declare-fun e!879770 () Bool)

(assert (=> start!136390 (=> (not res!1077550) (not e!879770))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136390 (= res!1077550 (validMask!0 mask!910))))

(assert (=> start!136390 e!879770))

(assert (=> start!136390 true))

(declare-datatypes ((array!105581 0))(
  ( (array!105582 (arr!50911 (Array (_ BitVec 32) (_ BitVec 64))) (size!51461 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105581)

(declare-fun array_inv!39638 (array!105581) Bool)

(assert (=> start!136390 (array_inv!39638 _keys!610)))

(declare-fun b!1577287 () Bool)

(declare-fun res!1077552 () Bool)

(assert (=> b!1577287 (=> (not res!1077552) (not e!879770))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577287 (= res!1077552 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51461 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577288 () Bool)

(declare-fun res!1077551 () Bool)

(assert (=> b!1577288 (=> (not res!1077551) (not e!879770))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577288 (= res!1077551 (validKeyInArray!0 k!768))))

(declare-fun b!1577289 () Bool)

(assert (=> b!1577289 (= e!879770 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50911 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50911 _keys!610) ee!12) (select (arr!50911 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50911 _keys!610) ee!12) k!768)) (bvsge ee!12 (size!51461 _keys!610))))))

(assert (= (and start!136390 res!1077550) b!1577287))

(assert (= (and b!1577287 res!1077552) b!1577288))

(assert (= (and b!1577288 res!1077551) b!1577289))

(declare-fun m!1449583 () Bool)

(assert (=> start!136390 m!1449583))

(declare-fun m!1449585 () Bool)

(assert (=> start!136390 m!1449585))

(declare-fun m!1449587 () Bool)

(assert (=> b!1577288 m!1449587))

(declare-fun m!1449589 () Bool)

(assert (=> b!1577289 m!1449589))

(push 1)

(assert (not start!136390))

(assert (not b!1577288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

