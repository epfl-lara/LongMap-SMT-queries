; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135524 () Bool)

(assert start!135524)

(declare-fun b!1574306 () Bool)

(declare-fun e!877971 () Bool)

(declare-fun e!877973 () Bool)

(assert (=> b!1574306 (= e!877971 (not e!877973))))

(declare-fun res!1075596 () Bool)

(assert (=> b!1574306 (=> res!1075596 e!877973)))

(declare-datatypes ((array!105227 0))(
  ( (array!105228 (arr!50762 (Array (_ BitVec 32) (_ BitVec 64))) (size!51312 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105227)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun mask!877 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13651 0))(
  ( (MissingZero!13651 (index!57002 (_ BitVec 32))) (Found!13651 (index!57003 (_ BitVec 32))) (Intermediate!13651 (undefined!14463 Bool) (index!57004 (_ BitVec 32)) (x!141886 (_ BitVec 32))) (Undefined!13651) (MissingVacant!13651 (index!57005 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105227 (_ BitVec 32)) SeekEntryResult!13651)

(assert (=> b!1574306 (= res!1075596 (not (= (seekEntryOrOpen!0 (select (arr!50762 _keys!591) i!537) _keys!591 mask!877) (Found!13651 i!537))))))

(declare-fun arrayContainsKey!0 (array!105227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574306 (arrayContainsKey!0 _keys!591 (select (arr!50762 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52170 0))(
  ( (Unit!52171) )
))
(declare-fun lt!674773 () Unit!52170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105227 (_ BitVec 64) (_ BitVec 32)) Unit!52170)

(assert (=> b!1574306 (= lt!674773 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50762 _keys!591) i!537) i!537))))

(declare-fun b!1574307 () Bool)

(assert (=> b!1574307 (= e!877973 (bvslt (bvsub (size!51312 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51312 _keys!591) i!537)))))

(declare-fun b!1574304 () Bool)

(declare-fun res!1075598 () Bool)

(assert (=> b!1574304 (=> (not res!1075598) (not e!877971))))

(assert (=> b!1574304 (= res!1075598 (and (= (size!51312 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51312 _keys!591)) (bvslt i!537 (size!51312 _keys!591))))))

(declare-fun res!1075597 () Bool)

(assert (=> start!135524 (=> (not res!1075597) (not e!877971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135524 (= res!1075597 (validMask!0 mask!877))))

(assert (=> start!135524 e!877971))

(assert (=> start!135524 true))

(declare-fun array_inv!39489 (array!105227) Bool)

(assert (=> start!135524 (array_inv!39489 _keys!591)))

(declare-fun b!1574305 () Bool)

(declare-fun res!1075599 () Bool)

(assert (=> b!1574305 (=> (not res!1075599) (not e!877971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574305 (= res!1075599 (validKeyInArray!0 (select (arr!50762 _keys!591) i!537)))))

(assert (= (and start!135524 res!1075597) b!1574304))

(assert (= (and b!1574304 res!1075598) b!1574305))

(assert (= (and b!1574305 res!1075599) b!1574306))

(assert (= (and b!1574306 (not res!1075596)) b!1574307))

(declare-fun m!1447551 () Bool)

(assert (=> b!1574306 m!1447551))

(assert (=> b!1574306 m!1447551))

(declare-fun m!1447553 () Bool)

(assert (=> b!1574306 m!1447553))

(assert (=> b!1574306 m!1447551))

(declare-fun m!1447555 () Bool)

(assert (=> b!1574306 m!1447555))

(assert (=> b!1574306 m!1447551))

(declare-fun m!1447557 () Bool)

(assert (=> b!1574306 m!1447557))

(declare-fun m!1447559 () Bool)

(assert (=> start!135524 m!1447559))

(declare-fun m!1447561 () Bool)

(assert (=> start!135524 m!1447561))

(assert (=> b!1574305 m!1447551))

(assert (=> b!1574305 m!1447551))

(declare-fun m!1447563 () Bool)

(assert (=> b!1574305 m!1447563))

(check-sat (not b!1574306) (not start!135524) (not b!1574305))
(check-sat)
