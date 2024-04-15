; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136330 () Bool)

(assert start!136330)

(declare-fun b!1576852 () Bool)

(declare-fun res!1077300 () Bool)

(declare-fun e!879500 () Bool)

(assert (=> b!1576852 (=> (not res!1077300) (not e!879500))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105488 0))(
  ( (array!105489 (arr!50864 (Array (_ BitVec 32) (_ BitVec 64))) (size!51416 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105488)

(declare-fun k0!768 () (_ BitVec 64))

(assert (=> b!1576852 (= res!1077300 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50864 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50864 _keys!610) ee!12) (select (arr!50864 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1576851 () Bool)

(declare-fun res!1077299 () Bool)

(assert (=> b!1576851 (=> (not res!1077299) (not e!879500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576851 (= res!1077299 (validKeyInArray!0 k0!768))))

(declare-fun b!1576850 () Bool)

(declare-fun res!1077298 () Bool)

(assert (=> b!1576850 (=> (not res!1077298) (not e!879500))))

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1576850 (= res!1077298 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51416 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun lt!675672 () (_ BitVec 32))

(declare-fun b!1576853 () Bool)

(assert (=> b!1576853 (= e!879500 (and (bvsge lt!675672 #b00000000000000000000000000000000) (bvslt lt!675672 (bvadd #b00000000000000000000000000000001 mask!910)) (bvslt (bvadd #b00000000000000000000000000000001 x!458) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576853 (= lt!675672 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun res!1077297 () Bool)

(assert (=> start!136330 (=> (not res!1077297) (not e!879500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136330 (= res!1077297 (validMask!0 mask!910))))

(assert (=> start!136330 e!879500))

(assert (=> start!136330 true))

(declare-fun array_inv!39800 (array!105488) Bool)

(assert (=> start!136330 (array_inv!39800 _keys!610)))

(assert (= (and start!136330 res!1077297) b!1576850))

(assert (= (and b!1576850 res!1077298) b!1576851))

(assert (= (and b!1576851 res!1077299) b!1576852))

(assert (= (and b!1576852 res!1077300) b!1576853))

(declare-fun m!1448589 () Bool)

(assert (=> b!1576852 m!1448589))

(declare-fun m!1448591 () Bool)

(assert (=> b!1576851 m!1448591))

(declare-fun m!1448593 () Bool)

(assert (=> b!1576853 m!1448593))

(declare-fun m!1448595 () Bool)

(assert (=> start!136330 m!1448595))

(declare-fun m!1448597 () Bool)

(assert (=> start!136330 m!1448597))

(check-sat (not start!136330) (not b!1576853) (not b!1576851))
(check-sat)
