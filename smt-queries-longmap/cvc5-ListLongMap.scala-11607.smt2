; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135406 () Bool)

(assert start!135406)

(declare-fun res!1075247 () Bool)

(declare-fun e!877621 () Bool)

(assert (=> start!135406 (=> (not res!1075247) (not e!877621))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135406 (= res!1075247 (validMask!0 mask!877))))

(assert (=> start!135406 e!877621))

(assert (=> start!135406 true))

(declare-datatypes ((array!105112 0))(
  ( (array!105113 (arr!50707 (Array (_ BitVec 32) (_ BitVec 64))) (size!51259 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105112)

(declare-fun array_inv!39643 (array!105112) Bool)

(assert (=> start!135406 (array_inv!39643 _keys!591)))

(declare-fun b!1573770 () Bool)

(declare-fun res!1075246 () Bool)

(assert (=> b!1573770 (=> (not res!1075246) (not e!877621))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573770 (= res!1075246 (and (= (size!51259 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51259 _keys!591)) (bvslt i!537 (size!51259 _keys!591))))))

(declare-fun b!1573771 () Bool)

(declare-fun res!1075248 () Bool)

(assert (=> b!1573771 (=> (not res!1075248) (not e!877621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573771 (= res!1075248 (validKeyInArray!0 (select (arr!50707 _keys!591) i!537)))))

(declare-fun b!1573772 () Bool)

(assert (=> b!1573772 (= e!877621 (not true))))

(declare-datatypes ((SeekEntryResult!13643 0))(
  ( (MissingZero!13643 (index!56970 (_ BitVec 32))) (Found!13643 (index!56971 (_ BitVec 32))) (Intermediate!13643 (undefined!14455 Bool) (index!56972 (_ BitVec 32)) (x!141817 (_ BitVec 32))) (Undefined!13643) (MissingVacant!13643 (index!56973 (_ BitVec 32))) )
))
(declare-fun lt!674444 () SeekEntryResult!13643)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105112 (_ BitVec 32)) SeekEntryResult!13643)

(assert (=> b!1573772 (= lt!674444 (seekEntryOrOpen!0 (select (arr!50707 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573772 (arrayContainsKey!0 _keys!591 (select (arr!50707 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51957 0))(
  ( (Unit!51958) )
))
(declare-fun lt!674445 () Unit!51957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105112 (_ BitVec 64) (_ BitVec 32)) Unit!51957)

(assert (=> b!1573772 (= lt!674445 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50707 _keys!591) i!537) i!537))))

(assert (= (and start!135406 res!1075247) b!1573770))

(assert (= (and b!1573770 res!1075246) b!1573771))

(assert (= (and b!1573771 res!1075248) b!1573772))

(declare-fun m!1446427 () Bool)

(assert (=> start!135406 m!1446427))

(declare-fun m!1446429 () Bool)

(assert (=> start!135406 m!1446429))

(declare-fun m!1446431 () Bool)

(assert (=> b!1573771 m!1446431))

(assert (=> b!1573771 m!1446431))

(declare-fun m!1446433 () Bool)

(assert (=> b!1573771 m!1446433))

(assert (=> b!1573772 m!1446431))

(assert (=> b!1573772 m!1446431))

(declare-fun m!1446435 () Bool)

(assert (=> b!1573772 m!1446435))

(assert (=> b!1573772 m!1446431))

(declare-fun m!1446437 () Bool)

(assert (=> b!1573772 m!1446437))

(assert (=> b!1573772 m!1446431))

(declare-fun m!1446439 () Bool)

(assert (=> b!1573772 m!1446439))

(push 1)

(assert (not start!135406))

(assert (not b!1573771))

(assert (not b!1573772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

