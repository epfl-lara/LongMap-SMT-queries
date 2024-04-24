; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135850 () Bool)

(assert start!135850)

(declare-fun res!1076155 () Bool)

(declare-fun e!879275 () Bool)

(assert (=> start!135850 (=> (not res!1076155) (not e!879275))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135850 (= res!1076155 (validMask!0 mask!877))))

(assert (=> start!135850 e!879275))

(assert (=> start!135850 true))

(declare-datatypes ((array!105288 0))(
  ( (array!105289 (arr!50787 (Array (_ BitVec 32) (_ BitVec 64))) (size!51338 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105288)

(declare-fun array_inv!39742 (array!105288) Bool)

(assert (=> start!135850 (array_inv!39742 _keys!591)))

(declare-fun b!1576438 () Bool)

(declare-fun res!1076154 () Bool)

(assert (=> b!1576438 (=> (not res!1076154) (not e!879275))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576438 (= res!1076154 (and (= (size!51338 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51338 _keys!591)) (bvslt i!537 (size!51338 _keys!591))))))

(declare-fun b!1576439 () Bool)

(declare-fun res!1076156 () Bool)

(assert (=> b!1576439 (=> (not res!1076156) (not e!879275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576439 (= res!1076156 (validKeyInArray!0 (select (arr!50787 _keys!591) i!537)))))

(declare-fun b!1576440 () Bool)

(assert (=> b!1576440 (= e!879275 (not true))))

(declare-fun arrayContainsKey!0 (array!105288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576440 (arrayContainsKey!0 _keys!591 (select (arr!50787 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52039 0))(
  ( (Unit!52040) )
))
(declare-fun lt!675594 () Unit!52039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105288 (_ BitVec 64) (_ BitVec 32)) Unit!52039)

(assert (=> b!1576440 (= lt!675594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50787 _keys!591) i!537) i!537))))

(assert (= (and start!135850 res!1076155) b!1576438))

(assert (= (and b!1576438 res!1076154) b!1576439))

(assert (= (and b!1576439 res!1076156) b!1576440))

(declare-fun m!1449459 () Bool)

(assert (=> start!135850 m!1449459))

(declare-fun m!1449461 () Bool)

(assert (=> start!135850 m!1449461))

(declare-fun m!1449463 () Bool)

(assert (=> b!1576439 m!1449463))

(assert (=> b!1576439 m!1449463))

(declare-fun m!1449465 () Bool)

(assert (=> b!1576439 m!1449465))

(assert (=> b!1576440 m!1449463))

(assert (=> b!1576440 m!1449463))

(declare-fun m!1449467 () Bool)

(assert (=> b!1576440 m!1449467))

(assert (=> b!1576440 m!1449463))

(declare-fun m!1449469 () Bool)

(assert (=> b!1576440 m!1449469))

(push 1)

(assert (not b!1576439))

(assert (not b!1576440))

(assert (not start!135850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

