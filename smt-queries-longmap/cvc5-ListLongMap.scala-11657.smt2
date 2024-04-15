; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136292 () Bool)

(assert start!136292)

(declare-fun b!1576766 () Bool)

(declare-fun res!1077214 () Bool)

(declare-fun e!879457 () Bool)

(assert (=> b!1576766 (=> (not res!1077214) (not e!879457))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105471 0))(
  ( (array!105472 (arr!50857 (Array (_ BitVec 32) (_ BitVec 64))) (size!51409 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105471)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1576766 (= res!1077214 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51409 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077213 () Bool)

(assert (=> start!136292 (=> (not res!1077213) (not e!879457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136292 (= res!1077213 (validMask!0 mask!910))))

(assert (=> start!136292 e!879457))

(assert (=> start!136292 true))

(declare-fun array_inv!39793 (array!105471) Bool)

(assert (=> start!136292 (array_inv!39793 _keys!610)))

(declare-fun b!1576769 () Bool)

(assert (=> b!1576769 (= e!879457 false)))

(declare-fun lt!675642 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576769 (= lt!675642 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1576767 () Bool)

(declare-fun res!1077216 () Bool)

(assert (=> b!1576767 (=> (not res!1077216) (not e!879457))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576767 (= res!1077216 (validKeyInArray!0 k!768))))

(declare-fun b!1576768 () Bool)

(declare-fun res!1077215 () Bool)

(assert (=> b!1576768 (=> (not res!1077215) (not e!879457))))

(assert (=> b!1576768 (= res!1077215 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50857 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50857 _keys!610) ee!12) (select (arr!50857 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136292 res!1077213) b!1576766))

(assert (= (and b!1576766 res!1077214) b!1576767))

(assert (= (and b!1576767 res!1077216) b!1576768))

(assert (= (and b!1576768 res!1077215) b!1576769))

(declare-fun m!1448513 () Bool)

(assert (=> start!136292 m!1448513))

(declare-fun m!1448515 () Bool)

(assert (=> start!136292 m!1448515))

(declare-fun m!1448517 () Bool)

(assert (=> b!1576769 m!1448517))

(declare-fun m!1448519 () Bool)

(assert (=> b!1576767 m!1448519))

(declare-fun m!1448521 () Bool)

(assert (=> b!1576768 m!1448521))

(push 1)

(assert (not b!1576767))

(assert (not start!136292))

(assert (not b!1576769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

