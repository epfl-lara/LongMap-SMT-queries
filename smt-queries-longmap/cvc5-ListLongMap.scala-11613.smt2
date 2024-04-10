; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135516 () Bool)

(assert start!135516)

(declare-fun res!1075557 () Bool)

(declare-fun e!877943 () Bool)

(assert (=> start!135516 (=> (not res!1075557) (not e!877943))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135516 (= res!1075557 (validMask!0 mask!877))))

(assert (=> start!135516 e!877943))

(assert (=> start!135516 true))

(declare-datatypes ((array!105219 0))(
  ( (array!105220 (arr!50758 (Array (_ BitVec 32) (_ BitVec 64))) (size!51308 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105219)

(declare-fun array_inv!39485 (array!105219) Bool)

(assert (=> start!135516 (array_inv!39485 _keys!591)))

(declare-fun b!1574263 () Bool)

(declare-fun res!1075555 () Bool)

(assert (=> b!1574263 (=> (not res!1075555) (not e!877943))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574263 (= res!1075555 (and (= (size!51308 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51308 _keys!591)) (bvslt i!537 (size!51308 _keys!591))))))

(declare-fun b!1574264 () Bool)

(declare-fun res!1075556 () Bool)

(assert (=> b!1574264 (=> (not res!1075556) (not e!877943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574264 (= res!1075556 (validKeyInArray!0 (select (arr!50758 _keys!591) i!537)))))

(declare-fun b!1574265 () Bool)

(assert (=> b!1574265 (= e!877943 (not true))))

(declare-fun arrayContainsKey!0 (array!105219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574265 (arrayContainsKey!0 _keys!591 (select (arr!50758 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52162 0))(
  ( (Unit!52163) )
))
(declare-fun lt!674761 () Unit!52162)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105219 (_ BitVec 64) (_ BitVec 32)) Unit!52162)

(assert (=> b!1574265 (= lt!674761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50758 _keys!591) i!537) i!537))))

(assert (= (and start!135516 res!1075557) b!1574263))

(assert (= (and b!1574263 res!1075555) b!1574264))

(assert (= (and b!1574264 res!1075556) b!1574265))

(declare-fun m!1447501 () Bool)

(assert (=> start!135516 m!1447501))

(declare-fun m!1447503 () Bool)

(assert (=> start!135516 m!1447503))

(declare-fun m!1447505 () Bool)

(assert (=> b!1574264 m!1447505))

(assert (=> b!1574264 m!1447505))

(declare-fun m!1447507 () Bool)

(assert (=> b!1574264 m!1447507))

(assert (=> b!1574265 m!1447505))

(assert (=> b!1574265 m!1447505))

(declare-fun m!1447509 () Bool)

(assert (=> b!1574265 m!1447509))

(assert (=> b!1574265 m!1447505))

(declare-fun m!1447511 () Bool)

(assert (=> b!1574265 m!1447511))

(push 1)

(assert (not b!1574264))

(assert (not b!1574265))

(assert (not start!135516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

