; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136298 () Bool)

(assert start!136298)

(declare-fun res!1077250 () Bool)

(declare-fun e!879475 () Bool)

(assert (=> start!136298 (=> (not res!1077250) (not e!879475))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136298 (= res!1077250 (validMask!0 mask!910))))

(assert (=> start!136298 e!879475))

(assert (=> start!136298 true))

(declare-datatypes ((array!105477 0))(
  ( (array!105478 (arr!50860 (Array (_ BitVec 32) (_ BitVec 64))) (size!51412 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105477)

(declare-fun array_inv!39796 (array!105477) Bool)

(assert (=> start!136298 (array_inv!39796 _keys!610)))

(declare-fun b!1576805 () Bool)

(assert (=> b!1576805 (= e!879475 false)))

(declare-fun lt!675651 () (_ BitVec 32))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576805 (= lt!675651 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1576804 () Bool)

(declare-fun res!1077249 () Bool)

(assert (=> b!1576804 (=> (not res!1077249) (not e!879475))))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1576804 (= res!1077249 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50860 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50860 _keys!610) ee!12) (select (arr!50860 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1576802 () Bool)

(declare-fun res!1077251 () Bool)

(assert (=> b!1576802 (=> (not res!1077251) (not e!879475))))

(assert (=> b!1576802 (= res!1077251 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51412 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1576803 () Bool)

(declare-fun res!1077252 () Bool)

(assert (=> b!1576803 (=> (not res!1077252) (not e!879475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576803 (= res!1077252 (validKeyInArray!0 k!768))))

(assert (= (and start!136298 res!1077250) b!1576802))

(assert (= (and b!1576802 res!1077251) b!1576803))

(assert (= (and b!1576803 res!1077252) b!1576804))

(assert (= (and b!1576804 res!1077249) b!1576805))

(declare-fun m!1448543 () Bool)

(assert (=> start!136298 m!1448543))

(declare-fun m!1448545 () Bool)

(assert (=> start!136298 m!1448545))

(declare-fun m!1448547 () Bool)

(assert (=> b!1576805 m!1448547))

(declare-fun m!1448549 () Bool)

(assert (=> b!1576804 m!1448549))

(declare-fun m!1448551 () Bool)

(assert (=> b!1576803 m!1448551))

(push 1)

(assert (not b!1576803))

(assert (not start!136298))

(assert (not b!1576805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

