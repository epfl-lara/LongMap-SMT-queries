; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135870 () Bool)

(assert start!135870)

(declare-fun res!1076247 () Bool)

(declare-fun e!879336 () Bool)

(assert (=> start!135870 (=> (not res!1076247) (not e!879336))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135870 (= res!1076247 (validMask!0 mask!877))))

(assert (=> start!135870 e!879336))

(assert (=> start!135870 true))

(declare-datatypes ((array!105308 0))(
  ( (array!105309 (arr!50797 (Array (_ BitVec 32) (_ BitVec 64))) (size!51348 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105308)

(declare-fun array_inv!39752 (array!105308) Bool)

(assert (=> start!135870 (array_inv!39752 _keys!591)))

(declare-fun b!1576532 () Bool)

(declare-fun e!879337 () Bool)

(assert (=> b!1576532 (= e!879336 (not e!879337))))

(declare-fun res!1076249 () Bool)

(assert (=> b!1576532 (=> res!1076249 e!879337)))

(declare-fun i!537 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13592 0))(
  ( (MissingZero!13592 (index!56766 (_ BitVec 32))) (Found!13592 (index!56767 (_ BitVec 32))) (Intermediate!13592 (undefined!14404 Bool) (index!56768 (_ BitVec 32)) (x!141830 (_ BitVec 32))) (Undefined!13592) (MissingVacant!13592 (index!56769 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105308 (_ BitVec 32)) SeekEntryResult!13592)

(assert (=> b!1576532 (= res!1076249 (not (= (seekEntryOrOpen!0 (select (arr!50797 _keys!591) i!537) _keys!591 mask!877) (Found!13592 i!537))))))

(declare-fun arrayContainsKey!0 (array!105308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576532 (arrayContainsKey!0 _keys!591 (select (arr!50797 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52059 0))(
  ( (Unit!52060) )
))
(declare-fun lt!675642 () Unit!52059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105308 (_ BitVec 64) (_ BitVec 32)) Unit!52059)

(assert (=> b!1576532 (= lt!675642 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50797 _keys!591) i!537) i!537))))

(declare-fun b!1576531 () Bool)

(declare-fun res!1076246 () Bool)

(assert (=> b!1576531 (=> (not res!1076246) (not e!879336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576531 (= res!1076246 (validKeyInArray!0 (select (arr!50797 _keys!591) i!537)))))

(declare-fun b!1576530 () Bool)

(declare-fun res!1076248 () Bool)

(assert (=> b!1576530 (=> (not res!1076248) (not e!879336))))

(assert (=> b!1576530 (= res!1076248 (and (= (size!51348 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51348 _keys!591)) (bvslt i!537 (size!51348 _keys!591))))))

(declare-fun b!1576533 () Bool)

(assert (=> b!1576533 (= e!879337 (bvsge (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(assert (= (and start!135870 res!1076247) b!1576530))

(assert (= (and b!1576530 res!1076248) b!1576531))

(assert (= (and b!1576531 res!1076246) b!1576532))

(assert (= (and b!1576532 (not res!1076249)) b!1576533))

(declare-fun m!1449591 () Bool)

(assert (=> start!135870 m!1449591))

(declare-fun m!1449593 () Bool)

(assert (=> start!135870 m!1449593))

(declare-fun m!1449595 () Bool)

(assert (=> b!1576532 m!1449595))

(assert (=> b!1576532 m!1449595))

(declare-fun m!1449597 () Bool)

(assert (=> b!1576532 m!1449597))

(assert (=> b!1576532 m!1449595))

(declare-fun m!1449599 () Bool)

(assert (=> b!1576532 m!1449599))

(assert (=> b!1576532 m!1449595))

(declare-fun m!1449601 () Bool)

(assert (=> b!1576532 m!1449601))

(assert (=> b!1576531 m!1449595))

(assert (=> b!1576531 m!1449595))

(declare-fun m!1449603 () Bool)

(assert (=> b!1576531 m!1449603))

(check-sat (not start!135870) (not b!1576531) (not b!1576532))
(check-sat)
