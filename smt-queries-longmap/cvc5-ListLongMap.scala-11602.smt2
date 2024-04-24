; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135838 () Bool)

(assert start!135838)

(declare-fun res!1076101 () Bool)

(declare-fun e!879238 () Bool)

(assert (=> start!135838 (=> (not res!1076101) (not e!879238))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135838 (= res!1076101 (validMask!0 mask!877))))

(assert (=> start!135838 e!879238))

(assert (=> start!135838 true))

(declare-datatypes ((array!105276 0))(
  ( (array!105277 (arr!50781 (Array (_ BitVec 32) (_ BitVec 64))) (size!51332 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105276)

(declare-fun array_inv!39736 (array!105276) Bool)

(assert (=> start!135838 (array_inv!39736 _keys!591)))

(declare-fun b!1576384 () Bool)

(declare-fun res!1076100 () Bool)

(assert (=> b!1576384 (=> (not res!1076100) (not e!879238))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576384 (= res!1076100 (and (= (size!51332 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51332 _keys!591)) (bvslt i!537 (size!51332 _keys!591))))))

(declare-fun b!1576385 () Bool)

(declare-fun res!1076102 () Bool)

(assert (=> b!1576385 (=> (not res!1076102) (not e!879238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576385 (= res!1076102 (validKeyInArray!0 (select (arr!50781 _keys!591) i!537)))))

(declare-fun b!1576386 () Bool)

(assert (=> b!1576386 (= e!879238 (not true))))

(declare-fun arrayContainsKey!0 (array!105276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576386 (arrayContainsKey!0 _keys!591 (select (arr!50781 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52027 0))(
  ( (Unit!52028) )
))
(declare-fun lt!675576 () Unit!52027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105276 (_ BitVec 64) (_ BitVec 32)) Unit!52027)

(assert (=> b!1576386 (= lt!675576 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50781 _keys!591) i!537) i!537))))

(assert (= (and start!135838 res!1076101) b!1576384))

(assert (= (and b!1576384 res!1076100) b!1576385))

(assert (= (and b!1576385 res!1076102) b!1576386))

(declare-fun m!1449387 () Bool)

(assert (=> start!135838 m!1449387))

(declare-fun m!1449389 () Bool)

(assert (=> start!135838 m!1449389))

(declare-fun m!1449391 () Bool)

(assert (=> b!1576385 m!1449391))

(assert (=> b!1576385 m!1449391))

(declare-fun m!1449393 () Bool)

(assert (=> b!1576385 m!1449393))

(assert (=> b!1576386 m!1449391))

(assert (=> b!1576386 m!1449391))

(declare-fun m!1449395 () Bool)

(assert (=> b!1576386 m!1449395))

(assert (=> b!1576386 m!1449391))

(declare-fun m!1449397 () Bool)

(assert (=> b!1576386 m!1449397))

(push 1)

(assert (not start!135838))

(assert (not b!1576385))

(assert (not b!1576386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

