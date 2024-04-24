; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135944 () Bool)

(assert start!135944)

(declare-fun res!1076435 () Bool)

(declare-fun e!879464 () Bool)

(assert (=> start!135944 (=> (not res!1076435) (not e!879464))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135944 (= res!1076435 (validMask!0 mask!877))))

(assert (=> start!135944 e!879464))

(assert (=> start!135944 true))

(declare-datatypes ((array!105348 0))(
  ( (array!105349 (arr!50814 (Array (_ BitVec 32) (_ BitVec 64))) (size!51365 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105348)

(declare-fun array_inv!39769 (array!105348) Bool)

(assert (=> start!135944 (array_inv!39769 _keys!591)))

(declare-fun b!1576717 () Bool)

(declare-fun res!1076433 () Bool)

(assert (=> b!1576717 (=> (not res!1076433) (not e!879464))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576717 (= res!1076433 (and (= (size!51365 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51365 _keys!591)) (bvslt i!537 (size!51365 _keys!591))))))

(declare-fun b!1576718 () Bool)

(declare-fun res!1076434 () Bool)

(assert (=> b!1576718 (=> (not res!1076434) (not e!879464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576718 (= res!1076434 (validKeyInArray!0 (select (arr!50814 _keys!591) i!537)))))

(declare-fun b!1576719 () Bool)

(assert (=> b!1576719 (= e!879464 (not true))))

(declare-fun arrayContainsKey!0 (array!105348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576719 (arrayContainsKey!0 _keys!591 (select (arr!50814 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52075 0))(
  ( (Unit!52076) )
))
(declare-fun lt!675675 () Unit!52075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105348 (_ BitVec 64) (_ BitVec 32)) Unit!52075)

(assert (=> b!1576719 (= lt!675675 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50814 _keys!591) i!537) i!537))))

(assert (= (and start!135944 res!1076435) b!1576717))

(assert (= (and b!1576717 res!1076433) b!1576718))

(assert (= (and b!1576718 res!1076434) b!1576719))

(declare-fun m!1449783 () Bool)

(assert (=> start!135944 m!1449783))

(declare-fun m!1449785 () Bool)

(assert (=> start!135944 m!1449785))

(declare-fun m!1449787 () Bool)

(assert (=> b!1576718 m!1449787))

(assert (=> b!1576718 m!1449787))

(declare-fun m!1449789 () Bool)

(assert (=> b!1576718 m!1449789))

(assert (=> b!1576719 m!1449787))

(assert (=> b!1576719 m!1449787))

(declare-fun m!1449791 () Bool)

(assert (=> b!1576719 m!1449791))

(assert (=> b!1576719 m!1449787))

(declare-fun m!1449793 () Bool)

(assert (=> b!1576719 m!1449793))

(push 1)

(assert (not start!135944))

(assert (not b!1576719))

(assert (not b!1576718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

