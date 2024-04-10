; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135430 () Bool)

(assert start!135430)

(declare-fun res!1075278 () Bool)

(declare-fun e!877753 () Bool)

(assert (=> start!135430 (=> (not res!1075278) (not e!877753))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135430 (= res!1075278 (validMask!0 mask!877))))

(assert (=> start!135430 e!877753))

(assert (=> start!135430 true))

(declare-datatypes ((array!105161 0))(
  ( (array!105162 (arr!50731 (Array (_ BitVec 32) (_ BitVec 64))) (size!51281 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105161)

(declare-fun array_inv!39458 (array!105161) Bool)

(assert (=> start!135430 (array_inv!39458 _keys!591)))

(declare-fun b!1573984 () Bool)

(declare-fun res!1075277 () Bool)

(assert (=> b!1573984 (=> (not res!1075277) (not e!877753))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573984 (= res!1075277 (and (= (size!51281 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51281 _keys!591)) (bvslt i!537 (size!51281 _keys!591))))))

(declare-fun b!1573985 () Bool)

(declare-fun res!1075276 () Bool)

(assert (=> b!1573985 (=> (not res!1075276) (not e!877753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573985 (= res!1075276 (validKeyInArray!0 (select (arr!50731 _keys!591) i!537)))))

(declare-fun b!1573986 () Bool)

(assert (=> b!1573986 (= e!877753 (not true))))

(declare-fun arrayContainsKey!0 (array!105161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573986 (arrayContainsKey!0 _keys!591 (select (arr!50731 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52126 0))(
  ( (Unit!52127) )
))
(declare-fun lt!674680 () Unit!52126)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105161 (_ BitVec 64) (_ BitVec 32)) Unit!52126)

(assert (=> b!1573986 (= lt!674680 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50731 _keys!591) i!537) i!537))))

(assert (= (and start!135430 res!1075278) b!1573984))

(assert (= (and b!1573984 res!1075277) b!1573985))

(assert (= (and b!1573985 res!1075276) b!1573986))

(declare-fun m!1447177 () Bool)

(assert (=> start!135430 m!1447177))

(declare-fun m!1447179 () Bool)

(assert (=> start!135430 m!1447179))

(declare-fun m!1447181 () Bool)

(assert (=> b!1573985 m!1447181))

(assert (=> b!1573985 m!1447181))

(declare-fun m!1447183 () Bool)

(assert (=> b!1573985 m!1447183))

(assert (=> b!1573986 m!1447181))

(assert (=> b!1573986 m!1447181))

(declare-fun m!1447185 () Bool)

(assert (=> b!1573986 m!1447185))

(assert (=> b!1573986 m!1447181))

(declare-fun m!1447187 () Bool)

(assert (=> b!1573986 m!1447187))

(push 1)

(assert (not b!1573985))

(assert (not b!1573986))

(assert (not start!135430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

