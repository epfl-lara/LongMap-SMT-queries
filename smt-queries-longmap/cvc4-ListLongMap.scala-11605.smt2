; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135440 () Bool)

(assert start!135440)

(declare-fun res!1075322 () Bool)

(declare-fun e!877783 () Bool)

(assert (=> start!135440 (=> (not res!1075322) (not e!877783))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135440 (= res!1075322 (validMask!0 mask!877))))

(assert (=> start!135440 e!877783))

(assert (=> start!135440 true))

(declare-datatypes ((array!105171 0))(
  ( (array!105172 (arr!50736 (Array (_ BitVec 32) (_ BitVec 64))) (size!51286 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105171)

(declare-fun array_inv!39463 (array!105171) Bool)

(assert (=> start!135440 (array_inv!39463 _keys!591)))

(declare-fun b!1574029 () Bool)

(declare-fun res!1075323 () Bool)

(assert (=> b!1574029 (=> (not res!1075323) (not e!877783))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574029 (= res!1075323 (and (= (size!51286 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51286 _keys!591)) (bvslt i!537 (size!51286 _keys!591))))))

(declare-fun b!1574030 () Bool)

(declare-fun res!1075321 () Bool)

(assert (=> b!1574030 (=> (not res!1075321) (not e!877783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574030 (= res!1075321 (validKeyInArray!0 (select (arr!50736 _keys!591) i!537)))))

(declare-fun b!1574031 () Bool)

(assert (=> b!1574031 (= e!877783 (not true))))

(declare-fun arrayContainsKey!0 (array!105171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574031 (arrayContainsKey!0 _keys!591 (select (arr!50736 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52136 0))(
  ( (Unit!52137) )
))
(declare-fun lt!674695 () Unit!52136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105171 (_ BitVec 64) (_ BitVec 32)) Unit!52136)

(assert (=> b!1574031 (= lt!674695 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50736 _keys!591) i!537) i!537))))

(assert (= (and start!135440 res!1075322) b!1574029))

(assert (= (and b!1574029 res!1075323) b!1574030))

(assert (= (and b!1574030 res!1075321) b!1574031))

(declare-fun m!1447237 () Bool)

(assert (=> start!135440 m!1447237))

(declare-fun m!1447239 () Bool)

(assert (=> start!135440 m!1447239))

(declare-fun m!1447241 () Bool)

(assert (=> b!1574030 m!1447241))

(assert (=> b!1574030 m!1447241))

(declare-fun m!1447243 () Bool)

(assert (=> b!1574030 m!1447243))

(assert (=> b!1574031 m!1447241))

(assert (=> b!1574031 m!1447241))

(declare-fun m!1447245 () Bool)

(assert (=> b!1574031 m!1447245))

(assert (=> b!1574031 m!1447241))

(declare-fun m!1447247 () Bool)

(assert (=> b!1574031 m!1447247))

(push 1)

(assert (not b!1574030))

(assert (not b!1574031))

(assert (not start!135440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

