; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136354 () Bool)

(assert start!136354)

(declare-fun res!1077423 () Bool)

(declare-fun e!879572 () Bool)

(assert (=> start!136354 (=> (not res!1077423) (not e!879572))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136354 (= res!1077423 (validMask!0 mask!910))))

(assert (=> start!136354 e!879572))

(assert (=> start!136354 true))

(declare-datatypes ((array!105512 0))(
  ( (array!105513 (arr!50876 (Array (_ BitVec 32) (_ BitVec 64))) (size!51428 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105512)

(declare-fun array_inv!39812 (array!105512) Bool)

(assert (=> start!136354 (array_inv!39812 _keys!610)))

(declare-fun b!1576974 () Bool)

(declare-fun res!1077422 () Bool)

(assert (=> b!1576974 (=> (not res!1077422) (not e!879572))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1576974 (= res!1077422 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51428 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1576975 () Bool)

(declare-fun res!1077421 () Bool)

(assert (=> b!1576975 (=> (not res!1077421) (not e!879572))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576975 (= res!1077421 (validKeyInArray!0 k0!768))))

(declare-fun b!1576976 () Bool)

(assert (=> b!1576976 (= e!879572 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50876 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50876 _keys!610) ee!12) (select (arr!50876 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50876 _keys!610) ee!12) k0!768)) (bvsge ee!12 (size!51428 _keys!610))))))

(assert (= (and start!136354 res!1077423) b!1576974))

(assert (= (and b!1576974 res!1077422) b!1576975))

(assert (= (and b!1576975 res!1077421) b!1576976))

(declare-fun m!1448691 () Bool)

(assert (=> start!136354 m!1448691))

(declare-fun m!1448693 () Bool)

(assert (=> start!136354 m!1448693))

(declare-fun m!1448695 () Bool)

(assert (=> b!1576975 m!1448695))

(declare-fun m!1448697 () Bool)

(assert (=> b!1576976 m!1448697))

(check-sat (not start!136354) (not b!1576975))
(check-sat)
