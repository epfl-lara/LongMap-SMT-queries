; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135856 () Bool)

(assert start!135856)

(declare-fun res!1076183 () Bool)

(declare-fun e!879292 () Bool)

(assert (=> start!135856 (=> (not res!1076183) (not e!879292))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135856 (= res!1076183 (validMask!0 mask!877))))

(assert (=> start!135856 e!879292))

(assert (=> start!135856 true))

(declare-datatypes ((array!105294 0))(
  ( (array!105295 (arr!50790 (Array (_ BitVec 32) (_ BitVec 64))) (size!51341 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105294)

(declare-fun array_inv!39745 (array!105294) Bool)

(assert (=> start!135856 (array_inv!39745 _keys!591)))

(declare-fun b!1576465 () Bool)

(declare-fun res!1076181 () Bool)

(assert (=> b!1576465 (=> (not res!1076181) (not e!879292))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576465 (= res!1076181 (and (= (size!51341 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51341 _keys!591)) (bvslt i!537 (size!51341 _keys!591))))))

(declare-fun b!1576466 () Bool)

(declare-fun res!1076182 () Bool)

(assert (=> b!1576466 (=> (not res!1076182) (not e!879292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576466 (= res!1076182 (validKeyInArray!0 (select (arr!50790 _keys!591) i!537)))))

(declare-fun b!1576467 () Bool)

(assert (=> b!1576467 (= e!879292 (not true))))

(declare-fun arrayContainsKey!0 (array!105294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576467 (arrayContainsKey!0 _keys!591 (select (arr!50790 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52045 0))(
  ( (Unit!52046) )
))
(declare-fun lt!675603 () Unit!52045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105294 (_ BitVec 64) (_ BitVec 32)) Unit!52045)

(assert (=> b!1576467 (= lt!675603 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50790 _keys!591) i!537) i!537))))

(assert (= (and start!135856 res!1076183) b!1576465))

(assert (= (and b!1576465 res!1076181) b!1576466))

(assert (= (and b!1576466 res!1076182) b!1576467))

(declare-fun m!1449495 () Bool)

(assert (=> start!135856 m!1449495))

(declare-fun m!1449497 () Bool)

(assert (=> start!135856 m!1449497))

(declare-fun m!1449499 () Bool)

(assert (=> b!1576466 m!1449499))

(assert (=> b!1576466 m!1449499))

(declare-fun m!1449501 () Bool)

(assert (=> b!1576466 m!1449501))

(assert (=> b!1576467 m!1449499))

(assert (=> b!1576467 m!1449499))

(declare-fun m!1449503 () Bool)

(assert (=> b!1576467 m!1449503))

(assert (=> b!1576467 m!1449499))

(declare-fun m!1449505 () Bool)

(assert (=> b!1576467 m!1449505))

(push 1)

(assert (not b!1576466))

(assert (not start!135856))

(assert (not b!1576467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

