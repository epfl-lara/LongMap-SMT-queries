; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136328 () Bool)

(assert start!136328)

(declare-fun b!1577082 () Bool)

(declare-fun e!879655 () Bool)

(assert (=> b!1577082 (= e!879655 false)))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun lt!675928 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577082 (= lt!675928 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577080 () Bool)

(declare-fun res!1077344 () Bool)

(assert (=> b!1577080 (=> (not res!1077344) (not e!879655))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577080 (= res!1077344 (validKeyInArray!0 k!768))))

(declare-fun b!1577081 () Bool)

(declare-fun res!1077345 () Bool)

(assert (=> b!1577081 (=> (not res!1077345) (not e!879655))))

(declare-datatypes ((array!105540 0))(
  ( (array!105541 (arr!50892 (Array (_ BitVec 32) (_ BitVec 64))) (size!51442 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105540)

(assert (=> b!1577081 (= res!1077345 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50892 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50892 _keys!610) ee!12) (select (arr!50892 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577079 () Bool)

(declare-fun res!1077343 () Bool)

(assert (=> b!1577079 (=> (not res!1077343) (not e!879655))))

(assert (=> b!1577079 (= res!1077343 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51442 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077342 () Bool)

(assert (=> start!136328 (=> (not res!1077342) (not e!879655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136328 (= res!1077342 (validMask!0 mask!910))))

(assert (=> start!136328 e!879655))

(assert (=> start!136328 true))

(declare-fun array_inv!39619 (array!105540) Bool)

(assert (=> start!136328 (array_inv!39619 _keys!610)))

(assert (= (and start!136328 res!1077342) b!1577079))

(assert (= (and b!1577079 res!1077343) b!1577080))

(assert (= (and b!1577080 res!1077344) b!1577081))

(assert (= (and b!1577081 res!1077345) b!1577082))

(declare-fun m!1449405 () Bool)

(assert (=> b!1577082 m!1449405))

(declare-fun m!1449407 () Bool)

(assert (=> b!1577080 m!1449407))

(declare-fun m!1449409 () Bool)

(assert (=> b!1577081 m!1449409))

(declare-fun m!1449411 () Bool)

(assert (=> start!136328 m!1449411))

(declare-fun m!1449413 () Bool)

(assert (=> start!136328 m!1449413))

(push 1)

(assert (not b!1577082))

(assert (not start!136328))

(assert (not b!1577080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

