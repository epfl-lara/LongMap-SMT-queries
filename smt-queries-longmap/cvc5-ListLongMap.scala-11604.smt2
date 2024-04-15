; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135388 () Bool)

(assert start!135388)

(declare-fun res!1075167 () Bool)

(declare-fun e!877567 () Bool)

(assert (=> start!135388 (=> (not res!1075167) (not e!877567))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135388 (= res!1075167 (validMask!0 mask!877))))

(assert (=> start!135388 e!877567))

(assert (=> start!135388 true))

(declare-datatypes ((array!105094 0))(
  ( (array!105095 (arr!50698 (Array (_ BitVec 32) (_ BitVec 64))) (size!51250 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105094)

(declare-fun array_inv!39634 (array!105094) Bool)

(assert (=> start!135388 (array_inv!39634 _keys!591)))

(declare-fun b!1573689 () Bool)

(declare-fun res!1075165 () Bool)

(assert (=> b!1573689 (=> (not res!1075165) (not e!877567))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573689 (= res!1075165 (and (= (size!51250 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51250 _keys!591)) (bvslt i!537 (size!51250 _keys!591))))))

(declare-fun b!1573690 () Bool)

(declare-fun res!1075166 () Bool)

(assert (=> b!1573690 (=> (not res!1075166) (not e!877567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573690 (= res!1075166 (validKeyInArray!0 (select (arr!50698 _keys!591) i!537)))))

(declare-fun b!1573691 () Bool)

(assert (=> b!1573691 (= e!877567 (not true))))

(declare-fun arrayContainsKey!0 (array!105094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573691 (arrayContainsKey!0 _keys!591 (select (arr!50698 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51939 0))(
  ( (Unit!51940) )
))
(declare-fun lt!674400 () Unit!51939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105094 (_ BitVec 64) (_ BitVec 32)) Unit!51939)

(assert (=> b!1573691 (= lt!674400 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50698 _keys!591) i!537) i!537))))

(assert (= (and start!135388 res!1075167) b!1573689))

(assert (= (and b!1573689 res!1075165) b!1573690))

(assert (= (and b!1573690 res!1075166) b!1573691))

(declare-fun m!1446309 () Bool)

(assert (=> start!135388 m!1446309))

(declare-fun m!1446311 () Bool)

(assert (=> start!135388 m!1446311))

(declare-fun m!1446313 () Bool)

(assert (=> b!1573690 m!1446313))

(assert (=> b!1573690 m!1446313))

(declare-fun m!1446315 () Bool)

(assert (=> b!1573690 m!1446315))

(assert (=> b!1573691 m!1446313))

(assert (=> b!1573691 m!1446313))

(declare-fun m!1446317 () Bool)

(assert (=> b!1573691 m!1446317))

(assert (=> b!1573691 m!1446313))

(declare-fun m!1446319 () Bool)

(assert (=> b!1573691 m!1446319))

(push 1)

(assert (not b!1573690))

(assert (not b!1573691))

(assert (not start!135388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

