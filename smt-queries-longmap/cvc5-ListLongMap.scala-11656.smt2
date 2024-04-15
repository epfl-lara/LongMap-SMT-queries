; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136286 () Bool)

(assert start!136286)

(declare-fun b!1576733 () Bool)

(declare-fun e!879439 () Bool)

(assert (=> b!1576733 (= e!879439 false)))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun lt!675633 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576733 (= lt!675633 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1576731 () Bool)

(declare-fun res!1077180 () Bool)

(assert (=> b!1576731 (=> (not res!1077180) (not e!879439))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576731 (= res!1077180 (validKeyInArray!0 k!768))))

(declare-fun b!1576732 () Bool)

(declare-fun res!1077177 () Bool)

(assert (=> b!1576732 (=> (not res!1077177) (not e!879439))))

(declare-datatypes ((array!105465 0))(
  ( (array!105466 (arr!50854 (Array (_ BitVec 32) (_ BitVec 64))) (size!51406 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105465)

(assert (=> b!1576732 (= res!1077177 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50854 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50854 _keys!610) ee!12) (select (arr!50854 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1576730 () Bool)

(declare-fun res!1077179 () Bool)

(assert (=> b!1576730 (=> (not res!1077179) (not e!879439))))

(assert (=> b!1576730 (= res!1077179 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51406 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077178 () Bool)

(assert (=> start!136286 (=> (not res!1077178) (not e!879439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136286 (= res!1077178 (validMask!0 mask!910))))

(assert (=> start!136286 e!879439))

(assert (=> start!136286 true))

(declare-fun array_inv!39790 (array!105465) Bool)

(assert (=> start!136286 (array_inv!39790 _keys!610)))

(assert (= (and start!136286 res!1077178) b!1576730))

(assert (= (and b!1576730 res!1077179) b!1576731))

(assert (= (and b!1576731 res!1077180) b!1576732))

(assert (= (and b!1576732 res!1077177) b!1576733))

(declare-fun m!1448483 () Bool)

(assert (=> b!1576733 m!1448483))

(declare-fun m!1448485 () Bool)

(assert (=> b!1576731 m!1448485))

(declare-fun m!1448487 () Bool)

(assert (=> b!1576732 m!1448487))

(declare-fun m!1448489 () Bool)

(assert (=> start!136286 m!1448489))

(declare-fun m!1448491 () Bool)

(assert (=> start!136286 m!1448491))

(push 1)

(assert (not b!1576731))

(assert (not start!136286))

(assert (not b!1576733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

