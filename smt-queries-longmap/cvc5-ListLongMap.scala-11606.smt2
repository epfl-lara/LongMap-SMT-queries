; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135400 () Bool)

(assert start!135400)

(declare-fun res!1075219 () Bool)

(declare-fun e!877604 () Bool)

(assert (=> start!135400 (=> (not res!1075219) (not e!877604))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135400 (= res!1075219 (validMask!0 mask!877))))

(assert (=> start!135400 e!877604))

(assert (=> start!135400 true))

(declare-datatypes ((array!105106 0))(
  ( (array!105107 (arr!50704 (Array (_ BitVec 32) (_ BitVec 64))) (size!51256 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105106)

(declare-fun array_inv!39640 (array!105106) Bool)

(assert (=> start!135400 (array_inv!39640 _keys!591)))

(declare-fun b!1573743 () Bool)

(declare-fun res!1075221 () Bool)

(assert (=> b!1573743 (=> (not res!1075221) (not e!877604))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573743 (= res!1075221 (and (= (size!51256 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51256 _keys!591)) (bvslt i!537 (size!51256 _keys!591))))))

(declare-fun b!1573744 () Bool)

(declare-fun res!1075220 () Bool)

(assert (=> b!1573744 (=> (not res!1075220) (not e!877604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573744 (= res!1075220 (validKeyInArray!0 (select (arr!50704 _keys!591) i!537)))))

(declare-fun b!1573745 () Bool)

(assert (=> b!1573745 (= e!877604 (not true))))

(declare-datatypes ((SeekEntryResult!13640 0))(
  ( (MissingZero!13640 (index!56958 (_ BitVec 32))) (Found!13640 (index!56959 (_ BitVec 32))) (Intermediate!13640 (undefined!14452 Bool) (index!56960 (_ BitVec 32)) (x!141806 (_ BitVec 32))) (Undefined!13640) (MissingVacant!13640 (index!56961 (_ BitVec 32))) )
))
(declare-fun lt!674426 () SeekEntryResult!13640)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105106 (_ BitVec 32)) SeekEntryResult!13640)

(assert (=> b!1573745 (= lt!674426 (seekEntryOrOpen!0 (select (arr!50704 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573745 (arrayContainsKey!0 _keys!591 (select (arr!50704 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51951 0))(
  ( (Unit!51952) )
))
(declare-fun lt!674427 () Unit!51951)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105106 (_ BitVec 64) (_ BitVec 32)) Unit!51951)

(assert (=> b!1573745 (= lt!674427 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50704 _keys!591) i!537) i!537))))

(assert (= (and start!135400 res!1075219) b!1573743))

(assert (= (and b!1573743 res!1075221) b!1573744))

(assert (= (and b!1573744 res!1075220) b!1573745))

(declare-fun m!1446385 () Bool)

(assert (=> start!135400 m!1446385))

(declare-fun m!1446387 () Bool)

(assert (=> start!135400 m!1446387))

(declare-fun m!1446389 () Bool)

(assert (=> b!1573744 m!1446389))

(assert (=> b!1573744 m!1446389))

(declare-fun m!1446391 () Bool)

(assert (=> b!1573744 m!1446391))

(assert (=> b!1573745 m!1446389))

(assert (=> b!1573745 m!1446389))

(declare-fun m!1446393 () Bool)

(assert (=> b!1573745 m!1446393))

(assert (=> b!1573745 m!1446389))

(declare-fun m!1446395 () Bool)

(assert (=> b!1573745 m!1446395))

(assert (=> b!1573745 m!1446389))

(declare-fun m!1446397 () Bool)

(assert (=> b!1573745 m!1446397))

(push 1)

(assert (not start!135400))

(assert (not b!1573745))

(assert (not b!1573744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

