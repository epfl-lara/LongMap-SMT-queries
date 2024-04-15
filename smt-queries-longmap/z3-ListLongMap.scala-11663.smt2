; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136348 () Bool)

(assert start!136348)

(declare-fun res!1077394 () Bool)

(declare-fun e!879554 () Bool)

(assert (=> start!136348 (=> (not res!1077394) (not e!879554))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136348 (= res!1077394 (validMask!0 mask!910))))

(assert (=> start!136348 e!879554))

(assert (=> start!136348 true))

(declare-datatypes ((array!105506 0))(
  ( (array!105507 (arr!50873 (Array (_ BitVec 32) (_ BitVec 64))) (size!51425 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105506)

(declare-fun array_inv!39809 (array!105506) Bool)

(assert (=> start!136348 (array_inv!39809 _keys!610)))

(declare-fun b!1576947 () Bool)

(declare-fun res!1077395 () Bool)

(assert (=> b!1576947 (=> (not res!1077395) (not e!879554))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1576947 (= res!1077395 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51425 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1576948 () Bool)

(declare-fun res!1077396 () Bool)

(assert (=> b!1576948 (=> (not res!1077396) (not e!879554))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576948 (= res!1077396 (validKeyInArray!0 k0!768))))

(declare-fun b!1576949 () Bool)

(assert (=> b!1576949 (= e!879554 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50873 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50873 _keys!610) ee!12) (select (arr!50873 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51425 _keys!610))))))

(assert (= (and start!136348 res!1077394) b!1576947))

(assert (= (and b!1576947 res!1077395) b!1576948))

(assert (= (and b!1576948 res!1077396) b!1576949))

(declare-fun m!1448667 () Bool)

(assert (=> start!136348 m!1448667))

(declare-fun m!1448669 () Bool)

(assert (=> start!136348 m!1448669))

(declare-fun m!1448671 () Bool)

(assert (=> b!1576948 m!1448671))

(declare-fun m!1448673 () Bool)

(assert (=> b!1576949 m!1448673))

(check-sat (not start!136348) (not b!1576948))
(check-sat)
