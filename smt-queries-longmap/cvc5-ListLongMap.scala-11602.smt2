; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135418 () Bool)

(assert start!135418)

(declare-fun res!1075223 () Bool)

(declare-fun e!877718 () Bool)

(assert (=> start!135418 (=> (not res!1075223) (not e!877718))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135418 (= res!1075223 (validMask!0 mask!877))))

(assert (=> start!135418 e!877718))

(assert (=> start!135418 true))

(declare-datatypes ((array!105149 0))(
  ( (array!105150 (arr!50725 (Array (_ BitVec 32) (_ BitVec 64))) (size!51275 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105149)

(declare-fun array_inv!39452 (array!105149) Bool)

(assert (=> start!135418 (array_inv!39452 _keys!591)))

(declare-fun b!1573930 () Bool)

(declare-fun res!1075224 () Bool)

(assert (=> b!1573930 (=> (not res!1075224) (not e!877718))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573930 (= res!1075224 (and (= (size!51275 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51275 _keys!591)) (bvslt i!537 (size!51275 _keys!591))))))

(declare-fun b!1573931 () Bool)

(declare-fun res!1075222 () Bool)

(assert (=> b!1573931 (=> (not res!1075222) (not e!877718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573931 (= res!1075222 (validKeyInArray!0 (select (arr!50725 _keys!591) i!537)))))

(declare-fun b!1573932 () Bool)

(assert (=> b!1573932 (= e!877718 (not true))))

(declare-fun arrayContainsKey!0 (array!105149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573932 (arrayContainsKey!0 _keys!591 (select (arr!50725 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52114 0))(
  ( (Unit!52115) )
))
(declare-fun lt!674662 () Unit!52114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105149 (_ BitVec 64) (_ BitVec 32)) Unit!52114)

(assert (=> b!1573932 (= lt!674662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50725 _keys!591) i!537) i!537))))

(assert (= (and start!135418 res!1075223) b!1573930))

(assert (= (and b!1573930 res!1075224) b!1573931))

(assert (= (and b!1573931 res!1075222) b!1573932))

(declare-fun m!1447105 () Bool)

(assert (=> start!135418 m!1447105))

(declare-fun m!1447107 () Bool)

(assert (=> start!135418 m!1447107))

(declare-fun m!1447109 () Bool)

(assert (=> b!1573931 m!1447109))

(assert (=> b!1573931 m!1447109))

(declare-fun m!1447111 () Bool)

(assert (=> b!1573931 m!1447111))

(assert (=> b!1573932 m!1447109))

(assert (=> b!1573932 m!1447109))

(declare-fun m!1447113 () Bool)

(assert (=> b!1573932 m!1447113))

(assert (=> b!1573932 m!1447109))

(declare-fun m!1447115 () Bool)

(assert (=> b!1573932 m!1447115))

(push 1)

(assert (not b!1573931))

(assert (not start!135418))

(assert (not b!1573932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

