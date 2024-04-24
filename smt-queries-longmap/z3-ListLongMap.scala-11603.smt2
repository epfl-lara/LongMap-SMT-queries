; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135840 () Bool)

(assert start!135840)

(declare-fun res!1076110 () Bool)

(declare-fun e!879245 () Bool)

(assert (=> start!135840 (=> (not res!1076110) (not e!879245))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135840 (= res!1076110 (validMask!0 mask!877))))

(assert (=> start!135840 e!879245))

(assert (=> start!135840 true))

(declare-datatypes ((array!105278 0))(
  ( (array!105279 (arr!50782 (Array (_ BitVec 32) (_ BitVec 64))) (size!51333 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105278)

(declare-fun array_inv!39737 (array!105278) Bool)

(assert (=> start!135840 (array_inv!39737 _keys!591)))

(declare-fun b!1576393 () Bool)

(declare-fun res!1076111 () Bool)

(assert (=> b!1576393 (=> (not res!1076111) (not e!879245))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576393 (= res!1076111 (and (= (size!51333 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51333 _keys!591)) (bvslt i!537 (size!51333 _keys!591))))))

(declare-fun b!1576394 () Bool)

(declare-fun res!1076109 () Bool)

(assert (=> b!1576394 (=> (not res!1076109) (not e!879245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576394 (= res!1076109 (validKeyInArray!0 (select (arr!50782 _keys!591) i!537)))))

(declare-fun b!1576395 () Bool)

(assert (=> b!1576395 (= e!879245 (not (bvsge mask!877 #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!105278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576395 (arrayContainsKey!0 _keys!591 (select (arr!50782 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52029 0))(
  ( (Unit!52030) )
))
(declare-fun lt!675579 () Unit!52029)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105278 (_ BitVec 64) (_ BitVec 32)) Unit!52029)

(assert (=> b!1576395 (= lt!675579 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50782 _keys!591) i!537) i!537))))

(assert (= (and start!135840 res!1076110) b!1576393))

(assert (= (and b!1576393 res!1076111) b!1576394))

(assert (= (and b!1576394 res!1076109) b!1576395))

(declare-fun m!1449399 () Bool)

(assert (=> start!135840 m!1449399))

(declare-fun m!1449401 () Bool)

(assert (=> start!135840 m!1449401))

(declare-fun m!1449403 () Bool)

(assert (=> b!1576394 m!1449403))

(assert (=> b!1576394 m!1449403))

(declare-fun m!1449405 () Bool)

(assert (=> b!1576394 m!1449405))

(assert (=> b!1576395 m!1449403))

(assert (=> b!1576395 m!1449403))

(declare-fun m!1449407 () Bool)

(assert (=> b!1576395 m!1449407))

(assert (=> b!1576395 m!1449403))

(declare-fun m!1449409 () Bool)

(assert (=> b!1576395 m!1449409))

(check-sat (not b!1576394) (not start!135840) (not b!1576395))
(check-sat)
