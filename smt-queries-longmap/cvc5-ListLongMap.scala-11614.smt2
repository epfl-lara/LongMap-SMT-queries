; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135522 () Bool)

(assert start!135522)

(declare-fun b!1574292 () Bool)

(declare-fun res!1075585 () Bool)

(declare-fun e!877962 () Bool)

(assert (=> b!1574292 (=> (not res!1075585) (not e!877962))))

(declare-datatypes ((array!105225 0))(
  ( (array!105226 (arr!50761 (Array (_ BitVec 32) (_ BitVec 64))) (size!51311 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105225)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun mask!877 () (_ BitVec 32))

(assert (=> b!1574292 (= res!1075585 (and (= (size!51311 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51311 _keys!591)) (bvslt i!537 (size!51311 _keys!591))))))

(declare-fun b!1574293 () Bool)

(declare-fun res!1075587 () Bool)

(assert (=> b!1574293 (=> (not res!1075587) (not e!877962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574293 (= res!1075587 (validKeyInArray!0 (select (arr!50761 _keys!591) i!537)))))

(declare-fun res!1075584 () Bool)

(assert (=> start!135522 (=> (not res!1075584) (not e!877962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135522 (= res!1075584 (validMask!0 mask!877))))

(assert (=> start!135522 e!877962))

(assert (=> start!135522 true))

(declare-fun array_inv!39488 (array!105225) Bool)

(assert (=> start!135522 (array_inv!39488 _keys!591)))

(declare-fun b!1574294 () Bool)

(declare-fun e!877963 () Bool)

(assert (=> b!1574294 (= e!877962 (not e!877963))))

(declare-fun res!1075586 () Bool)

(assert (=> b!1574294 (=> res!1075586 e!877963)))

(declare-datatypes ((SeekEntryResult!13650 0))(
  ( (MissingZero!13650 (index!56998 (_ BitVec 32))) (Found!13650 (index!56999 (_ BitVec 32))) (Intermediate!13650 (undefined!14462 Bool) (index!57000 (_ BitVec 32)) (x!141885 (_ BitVec 32))) (Undefined!13650) (MissingVacant!13650 (index!57001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105225 (_ BitVec 32)) SeekEntryResult!13650)

(assert (=> b!1574294 (= res!1075586 (not (= (seekEntryOrOpen!0 (select (arr!50761 _keys!591) i!537) _keys!591 mask!877) (Found!13650 i!537))))))

(declare-fun arrayContainsKey!0 (array!105225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574294 (arrayContainsKey!0 _keys!591 (select (arr!50761 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52168 0))(
  ( (Unit!52169) )
))
(declare-fun lt!674770 () Unit!52168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105225 (_ BitVec 64) (_ BitVec 32)) Unit!52168)

(assert (=> b!1574294 (= lt!674770 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50761 _keys!591) i!537) i!537))))

(declare-fun b!1574295 () Bool)

(assert (=> b!1574295 (= e!877963 (bvslt (bvsub (size!51311 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51311 _keys!591) i!537)))))

(assert (= (and start!135522 res!1075584) b!1574292))

(assert (= (and b!1574292 res!1075585) b!1574293))

(assert (= (and b!1574293 res!1075587) b!1574294))

(assert (= (and b!1574294 (not res!1075586)) b!1574295))

(declare-fun m!1447537 () Bool)

(assert (=> b!1574293 m!1447537))

(assert (=> b!1574293 m!1447537))

(declare-fun m!1447539 () Bool)

(assert (=> b!1574293 m!1447539))

(declare-fun m!1447541 () Bool)

(assert (=> start!135522 m!1447541))

(declare-fun m!1447543 () Bool)

(assert (=> start!135522 m!1447543))

(assert (=> b!1574294 m!1447537))

(assert (=> b!1574294 m!1447537))

(declare-fun m!1447545 () Bool)

(assert (=> b!1574294 m!1447545))

(assert (=> b!1574294 m!1447537))

(declare-fun m!1447547 () Bool)

(assert (=> b!1574294 m!1447547))

(assert (=> b!1574294 m!1447537))

(declare-fun m!1447549 () Bool)

(assert (=> b!1574294 m!1447549))

(push 1)

(assert (not start!135522))

(assert (not b!1574293))

(assert (not b!1574294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

