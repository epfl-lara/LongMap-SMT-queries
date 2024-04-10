; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136376 () Bool)

(assert start!136376)

(declare-fun b!1577226 () Bool)

(declare-fun e!879727 () Bool)

(assert (=> b!1577226 (= e!879727 false)))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun lt!675973 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577226 (= lt!675973 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577223 () Bool)

(declare-fun res!1077486 () Bool)

(assert (=> b!1577223 (=> (not res!1077486) (not e!879727))))

(declare-datatypes ((array!105567 0))(
  ( (array!105568 (arr!50904 (Array (_ BitVec 32) (_ BitVec 64))) (size!51454 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105567)

(assert (=> b!1577223 (= res!1077486 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51454 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077488 () Bool)

(assert (=> start!136376 (=> (not res!1077488) (not e!879727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136376 (= res!1077488 (validMask!0 mask!910))))

(assert (=> start!136376 e!879727))

(assert (=> start!136376 true))

(declare-fun array_inv!39631 (array!105567) Bool)

(assert (=> start!136376 (array_inv!39631 _keys!610)))

(declare-fun b!1577224 () Bool)

(declare-fun res!1077489 () Bool)

(assert (=> b!1577224 (=> (not res!1077489) (not e!879727))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577224 (= res!1077489 (validKeyInArray!0 k!768))))

(declare-fun b!1577225 () Bool)

(declare-fun res!1077487 () Bool)

(assert (=> b!1577225 (=> (not res!1077487) (not e!879727))))

(assert (=> b!1577225 (= res!1077487 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50904 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50904 _keys!610) ee!12) (select (arr!50904 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136376 res!1077488) b!1577223))

(assert (= (and b!1577223 res!1077486) b!1577224))

(assert (= (and b!1577224 res!1077489) b!1577225))

(assert (= (and b!1577225 res!1077487) b!1577226))

(declare-fun m!1449531 () Bool)

(assert (=> b!1577226 m!1449531))

(declare-fun m!1449533 () Bool)

(assert (=> start!136376 m!1449533))

(declare-fun m!1449535 () Bool)

(assert (=> start!136376 m!1449535))

(declare-fun m!1449537 () Bool)

(assert (=> b!1577224 m!1449537))

(declare-fun m!1449539 () Bool)

(assert (=> b!1577225 m!1449539))

(push 1)

(assert (not b!1577224))

(assert (not start!136376))

(assert (not b!1577226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

