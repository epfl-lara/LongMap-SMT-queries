; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135394 () Bool)

(assert start!135394)

(declare-fun res!1075192 () Bool)

(declare-fun e!877586 () Bool)

(assert (=> start!135394 (=> (not res!1075192) (not e!877586))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135394 (= res!1075192 (validMask!0 mask!877))))

(assert (=> start!135394 e!877586))

(assert (=> start!135394 true))

(declare-datatypes ((array!105100 0))(
  ( (array!105101 (arr!50701 (Array (_ BitVec 32) (_ BitVec 64))) (size!51253 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105100)

(declare-fun array_inv!39637 (array!105100) Bool)

(assert (=> start!135394 (array_inv!39637 _keys!591)))

(declare-fun b!1573716 () Bool)

(declare-fun res!1075193 () Bool)

(assert (=> b!1573716 (=> (not res!1075193) (not e!877586))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573716 (= res!1075193 (and (= (size!51253 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51253 _keys!591)) (bvslt i!537 (size!51253 _keys!591))))))

(declare-fun b!1573717 () Bool)

(declare-fun res!1075194 () Bool)

(assert (=> b!1573717 (=> (not res!1075194) (not e!877586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573717 (= res!1075194 (validKeyInArray!0 (select (arr!50701 _keys!591) i!537)))))

(declare-fun b!1573718 () Bool)

(assert (=> b!1573718 (= e!877586 (not true))))

(declare-fun arrayContainsKey!0 (array!105100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573718 (arrayContainsKey!0 _keys!591 (select (arr!50701 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51945 0))(
  ( (Unit!51946) )
))
(declare-fun lt!674409 () Unit!51945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105100 (_ BitVec 64) (_ BitVec 32)) Unit!51945)

(assert (=> b!1573718 (= lt!674409 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50701 _keys!591) i!537) i!537))))

(assert (= (and start!135394 res!1075192) b!1573716))

(assert (= (and b!1573716 res!1075193) b!1573717))

(assert (= (and b!1573717 res!1075194) b!1573718))

(declare-fun m!1446345 () Bool)

(assert (=> start!135394 m!1446345))

(declare-fun m!1446347 () Bool)

(assert (=> start!135394 m!1446347))

(declare-fun m!1446349 () Bool)

(assert (=> b!1573717 m!1446349))

(assert (=> b!1573717 m!1446349))

(declare-fun m!1446351 () Bool)

(assert (=> b!1573717 m!1446351))

(assert (=> b!1573718 m!1446349))

(assert (=> b!1573718 m!1446349))

(declare-fun m!1446353 () Bool)

(assert (=> b!1573718 m!1446353))

(assert (=> b!1573718 m!1446349))

(declare-fun m!1446355 () Bool)

(assert (=> b!1573718 m!1446355))

(push 1)

(assert (not b!1573717))

(assert (not b!1573718))

(assert (not start!135394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

