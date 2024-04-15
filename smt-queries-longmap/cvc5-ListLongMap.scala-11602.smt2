; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135376 () Bool)

(assert start!135376)

(declare-fun res!1075113 () Bool)

(declare-fun e!877532 () Bool)

(assert (=> start!135376 (=> (not res!1075113) (not e!877532))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135376 (= res!1075113 (validMask!0 mask!877))))

(assert (=> start!135376 e!877532))

(assert (=> start!135376 true))

(declare-datatypes ((array!105082 0))(
  ( (array!105083 (arr!50692 (Array (_ BitVec 32) (_ BitVec 64))) (size!51244 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105082)

(declare-fun array_inv!39628 (array!105082) Bool)

(assert (=> start!135376 (array_inv!39628 _keys!591)))

(declare-fun b!1573635 () Bool)

(declare-fun res!1075112 () Bool)

(assert (=> b!1573635 (=> (not res!1075112) (not e!877532))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573635 (= res!1075112 (and (= (size!51244 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51244 _keys!591)) (bvslt i!537 (size!51244 _keys!591))))))

(declare-fun b!1573636 () Bool)

(declare-fun res!1075111 () Bool)

(assert (=> b!1573636 (=> (not res!1075111) (not e!877532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573636 (= res!1075111 (validKeyInArray!0 (select (arr!50692 _keys!591) i!537)))))

(declare-fun b!1573637 () Bool)

(assert (=> b!1573637 (= e!877532 (not true))))

(declare-fun arrayContainsKey!0 (array!105082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573637 (arrayContainsKey!0 _keys!591 (select (arr!50692 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51927 0))(
  ( (Unit!51928) )
))
(declare-fun lt!674382 () Unit!51927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105082 (_ BitVec 64) (_ BitVec 32)) Unit!51927)

(assert (=> b!1573637 (= lt!674382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50692 _keys!591) i!537) i!537))))

(assert (= (and start!135376 res!1075113) b!1573635))

(assert (= (and b!1573635 res!1075112) b!1573636))

(assert (= (and b!1573636 res!1075111) b!1573637))

(declare-fun m!1446237 () Bool)

(assert (=> start!135376 m!1446237))

(declare-fun m!1446239 () Bool)

(assert (=> start!135376 m!1446239))

(declare-fun m!1446241 () Bool)

(assert (=> b!1573636 m!1446241))

(assert (=> b!1573636 m!1446241))

(declare-fun m!1446243 () Bool)

(assert (=> b!1573636 m!1446243))

(assert (=> b!1573637 m!1446241))

(assert (=> b!1573637 m!1446241))

(declare-fun m!1446245 () Bool)

(assert (=> b!1573637 m!1446245))

(assert (=> b!1573637 m!1446241))

(declare-fun m!1446247 () Bool)

(assert (=> b!1573637 m!1446247))

(push 1)

(assert (not start!135376))

(assert (not b!1573636))

(assert (not b!1573637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

