; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136384 () Bool)

(assert start!136384)

(declare-fun res!1077525 () Bool)

(declare-fun e!879751 () Bool)

(assert (=> start!136384 (=> (not res!1077525) (not e!879751))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136384 (= res!1077525 (validMask!0 mask!910))))

(assert (=> start!136384 e!879751))

(assert (=> start!136384 true))

(declare-datatypes ((array!105575 0))(
  ( (array!105576 (arr!50908 (Array (_ BitVec 32) (_ BitVec 64))) (size!51458 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105575)

(declare-fun array_inv!39635 (array!105575) Bool)

(assert (=> start!136384 (array_inv!39635 _keys!610)))

(declare-fun b!1577260 () Bool)

(declare-fun res!1077524 () Bool)

(assert (=> b!1577260 (=> (not res!1077524) (not e!879751))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577260 (= res!1077524 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51458 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577261 () Bool)

(declare-fun res!1077523 () Bool)

(assert (=> b!1577261 (=> (not res!1077523) (not e!879751))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577261 (= res!1077523 (validKeyInArray!0 k!768))))

(declare-fun b!1577262 () Bool)

(assert (=> b!1577262 (= e!879751 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50908 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50908 _keys!610) ee!12) (select (arr!50908 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51458 _keys!610))))))

(assert (= (and start!136384 res!1077525) b!1577260))

(assert (= (and b!1577260 res!1077524) b!1577261))

(assert (= (and b!1577261 res!1077523) b!1577262))

(declare-fun m!1449559 () Bool)

(assert (=> start!136384 m!1449559))

(declare-fun m!1449561 () Bool)

(assert (=> start!136384 m!1449561))

(declare-fun m!1449563 () Bool)

(assert (=> b!1577261 m!1449563))

(declare-fun m!1449565 () Bool)

(assert (=> b!1577262 m!1449565))

(push 1)

(assert (not start!136384))

(assert (not b!1577261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

