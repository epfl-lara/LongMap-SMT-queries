; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136372 () Bool)

(assert start!136372)

(declare-fun res!1077464 () Bool)

(declare-fun e!879716 () Bool)

(assert (=> start!136372 (=> (not res!1077464) (not e!879716))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136372 (= res!1077464 (validMask!0 mask!910))))

(assert (=> start!136372 e!879716))

(assert (=> start!136372 true))

(declare-datatypes ((array!105563 0))(
  ( (array!105564 (arr!50902 (Array (_ BitVec 32) (_ BitVec 64))) (size!51452 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105563)

(declare-fun array_inv!39629 (array!105563) Bool)

(assert (=> start!136372 (array_inv!39629 _keys!610)))

(declare-fun b!1577201 () Bool)

(declare-fun res!1077463 () Bool)

(assert (=> b!1577201 (=> (not res!1077463) (not e!879716))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1577201 (= res!1077463 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50902 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50902 _keys!610) ee!12) (select (arr!50902 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577202 () Bool)

(assert (=> b!1577202 (= e!879716 false)))

(declare-fun lt!675967 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577202 (= lt!675967 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577200 () Bool)

(declare-fun res!1077462 () Bool)

(assert (=> b!1577200 (=> (not res!1077462) (not e!879716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577200 (= res!1077462 (validKeyInArray!0 k!768))))

(declare-fun b!1577199 () Bool)

(declare-fun res!1077465 () Bool)

(assert (=> b!1577199 (=> (not res!1077465) (not e!879716))))

(assert (=> b!1577199 (= res!1077465 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51452 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136372 res!1077464) b!1577199))

(assert (= (and b!1577199 res!1077465) b!1577200))

(assert (= (and b!1577200 res!1077462) b!1577201))

(assert (= (and b!1577201 res!1077463) b!1577202))

(declare-fun m!1449511 () Bool)

(assert (=> start!136372 m!1449511))

(declare-fun m!1449513 () Bool)

(assert (=> start!136372 m!1449513))

(declare-fun m!1449515 () Bool)

(assert (=> b!1577201 m!1449515))

(declare-fun m!1449517 () Bool)

(assert (=> b!1577202 m!1449517))

(declare-fun m!1449519 () Bool)

(assert (=> b!1577200 m!1449519))

(push 1)

(assert (not b!1577202))

(assert (not b!1577200))

(assert (not start!136372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

