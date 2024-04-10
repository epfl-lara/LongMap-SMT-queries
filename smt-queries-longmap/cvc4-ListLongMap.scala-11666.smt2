; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136406 () Bool)

(assert start!136406)

(declare-fun res!1077623 () Bool)

(declare-fun e!879817 () Bool)

(assert (=> start!136406 (=> (not res!1077623) (not e!879817))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136406 (= res!1077623 (validMask!0 mask!910))))

(assert (=> start!136406 e!879817))

(assert (=> start!136406 true))

(declare-datatypes ((array!105597 0))(
  ( (array!105598 (arr!50919 (Array (_ BitVec 32) (_ BitVec 64))) (size!51469 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105597)

(declare-fun array_inv!39646 (array!105597) Bool)

(assert (=> start!136406 (array_inv!39646 _keys!610)))

(declare-fun b!1577359 () Bool)

(declare-fun res!1077622 () Bool)

(assert (=> b!1577359 (=> (not res!1077622) (not e!879817))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577359 (= res!1077622 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51469 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577360 () Bool)

(declare-fun res!1077624 () Bool)

(assert (=> b!1577360 (=> (not res!1077624) (not e!879817))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577360 (= res!1077624 (validKeyInArray!0 k!768))))

(declare-fun b!1577361 () Bool)

(assert (=> b!1577361 (= e!879817 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50919 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50919 _keys!610) ee!12) (select (arr!50919 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50919 _keys!610) ee!12) k!768)) (not (= (select (arr!50919 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50919 _keys!610) ee!12) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136406 res!1077623) b!1577359))

(assert (= (and b!1577359 res!1077622) b!1577360))

(assert (= (and b!1577360 res!1077624) b!1577361))

(declare-fun m!1449647 () Bool)

(assert (=> start!136406 m!1449647))

(declare-fun m!1449649 () Bool)

(assert (=> start!136406 m!1449649))

(declare-fun m!1449651 () Bool)

(assert (=> b!1577360 m!1449651))

(declare-fun m!1449653 () Bool)

(assert (=> b!1577361 m!1449653))

(push 1)

(assert (not start!136406))

(assert (not b!1577360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

