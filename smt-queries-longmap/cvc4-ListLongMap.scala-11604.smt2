; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135434 () Bool)

(assert start!135434)

(declare-fun res!1075296 () Bool)

(declare-fun e!877765 () Bool)

(assert (=> start!135434 (=> (not res!1075296) (not e!877765))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135434 (= res!1075296 (validMask!0 mask!877))))

(assert (=> start!135434 e!877765))

(assert (=> start!135434 true))

(declare-datatypes ((array!105165 0))(
  ( (array!105166 (arr!50733 (Array (_ BitVec 32) (_ BitVec 64))) (size!51283 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105165)

(declare-fun array_inv!39460 (array!105165) Bool)

(assert (=> start!135434 (array_inv!39460 _keys!591)))

(declare-fun b!1574002 () Bool)

(declare-fun res!1075295 () Bool)

(assert (=> b!1574002 (=> (not res!1075295) (not e!877765))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574002 (= res!1075295 (and (= (size!51283 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51283 _keys!591)) (bvslt i!537 (size!51283 _keys!591))))))

(declare-fun b!1574003 () Bool)

(declare-fun res!1075294 () Bool)

(assert (=> b!1574003 (=> (not res!1075294) (not e!877765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574003 (= res!1075294 (validKeyInArray!0 (select (arr!50733 _keys!591) i!537)))))

(declare-fun b!1574004 () Bool)

(assert (=> b!1574004 (= e!877765 (not true))))

(declare-fun arrayContainsKey!0 (array!105165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574004 (arrayContainsKey!0 _keys!591 (select (arr!50733 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52130 0))(
  ( (Unit!52131) )
))
(declare-fun lt!674686 () Unit!52130)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105165 (_ BitVec 64) (_ BitVec 32)) Unit!52130)

(assert (=> b!1574004 (= lt!674686 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50733 _keys!591) i!537) i!537))))

(assert (= (and start!135434 res!1075296) b!1574002))

(assert (= (and b!1574002 res!1075295) b!1574003))

(assert (= (and b!1574003 res!1075294) b!1574004))

(declare-fun m!1447201 () Bool)

(assert (=> start!135434 m!1447201))

(declare-fun m!1447203 () Bool)

(assert (=> start!135434 m!1447203))

(declare-fun m!1447205 () Bool)

(assert (=> b!1574003 m!1447205))

(assert (=> b!1574003 m!1447205))

(declare-fun m!1447207 () Bool)

(assert (=> b!1574003 m!1447207))

(assert (=> b!1574004 m!1447205))

(assert (=> b!1574004 m!1447205))

(declare-fun m!1447209 () Bool)

(assert (=> b!1574004 m!1447209))

(assert (=> b!1574004 m!1447205))

(declare-fun m!1447211 () Bool)

(assert (=> b!1574004 m!1447211))

(push 1)

(assert (not b!1574003))

