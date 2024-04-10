; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135422 () Bool)

(assert start!135422)

(declare-fun res!1075242 () Bool)

(declare-fun e!877729 () Bool)

(assert (=> start!135422 (=> (not res!1075242) (not e!877729))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135422 (= res!1075242 (validMask!0 mask!877))))

(assert (=> start!135422 e!877729))

(assert (=> start!135422 true))

(declare-datatypes ((array!105153 0))(
  ( (array!105154 (arr!50727 (Array (_ BitVec 32) (_ BitVec 64))) (size!51277 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105153)

(declare-fun array_inv!39454 (array!105153) Bool)

(assert (=> start!135422 (array_inv!39454 _keys!591)))

(declare-fun b!1573948 () Bool)

(declare-fun res!1075241 () Bool)

(assert (=> b!1573948 (=> (not res!1075241) (not e!877729))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573948 (= res!1075241 (and (= (size!51277 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51277 _keys!591)) (bvslt i!537 (size!51277 _keys!591))))))

(declare-fun b!1573949 () Bool)

(declare-fun res!1075240 () Bool)

(assert (=> b!1573949 (=> (not res!1075240) (not e!877729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573949 (= res!1075240 (validKeyInArray!0 (select (arr!50727 _keys!591) i!537)))))

(declare-fun b!1573950 () Bool)

(assert (=> b!1573950 (= e!877729 (not true))))

(declare-fun arrayContainsKey!0 (array!105153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573950 (arrayContainsKey!0 _keys!591 (select (arr!50727 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52118 0))(
  ( (Unit!52119) )
))
(declare-fun lt!674668 () Unit!52118)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105153 (_ BitVec 64) (_ BitVec 32)) Unit!52118)

(assert (=> b!1573950 (= lt!674668 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50727 _keys!591) i!537) i!537))))

(assert (= (and start!135422 res!1075242) b!1573948))

(assert (= (and b!1573948 res!1075241) b!1573949))

(assert (= (and b!1573949 res!1075240) b!1573950))

(declare-fun m!1447129 () Bool)

(assert (=> start!135422 m!1447129))

(declare-fun m!1447131 () Bool)

(assert (=> start!135422 m!1447131))

(declare-fun m!1447133 () Bool)

(assert (=> b!1573949 m!1447133))

(assert (=> b!1573949 m!1447133))

(declare-fun m!1447135 () Bool)

(assert (=> b!1573949 m!1447135))

(assert (=> b!1573950 m!1447133))

(assert (=> b!1573950 m!1447133))

(declare-fun m!1447137 () Bool)

(assert (=> b!1573950 m!1447137))

(assert (=> b!1573950 m!1447133))

(declare-fun m!1447139 () Bool)

(assert (=> b!1573950 m!1447139))

(push 1)

