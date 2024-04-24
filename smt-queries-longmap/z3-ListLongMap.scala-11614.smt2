; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135946 () Bool)

(assert start!135946)

(declare-fun b!1576731 () Bool)

(declare-fun e!879471 () Bool)

(declare-datatypes ((array!105350 0))(
  ( (array!105351 (arr!50815 (Array (_ BitVec 32) (_ BitVec 64))) (size!51366 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105350)

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576731 (= e!879471 (bvslt (bvsub (size!51366 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51366 _keys!591) i!537)))))

(declare-fun b!1576730 () Bool)

(declare-fun e!879472 () Bool)

(assert (=> b!1576730 (= e!879472 (not e!879471))))

(declare-fun res!1076446 () Bool)

(assert (=> b!1576730 (=> res!1076446 e!879471)))

(declare-fun mask!877 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13598 0))(
  ( (MissingZero!13598 (index!56790 (_ BitVec 32))) (Found!13598 (index!56791 (_ BitVec 32))) (Intermediate!13598 (undefined!14410 Bool) (index!56792 (_ BitVec 32)) (x!141884 (_ BitVec 32))) (Undefined!13598) (MissingVacant!13598 (index!56793 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105350 (_ BitVec 32)) SeekEntryResult!13598)

(assert (=> b!1576730 (= res!1076446 (not (= (seekEntryOrOpen!0 (select (arr!50815 _keys!591) i!537) _keys!591 mask!877) (Found!13598 i!537))))))

(declare-fun arrayContainsKey!0 (array!105350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576730 (arrayContainsKey!0 _keys!591 (select (arr!50815 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52077 0))(
  ( (Unit!52078) )
))
(declare-fun lt!675678 () Unit!52077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105350 (_ BitVec 64) (_ BitVec 32)) Unit!52077)

(assert (=> b!1576730 (= lt!675678 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50815 _keys!591) i!537) i!537))))

(declare-fun b!1576729 () Bool)

(declare-fun res!1076447 () Bool)

(assert (=> b!1576729 (=> (not res!1076447) (not e!879472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576729 (= res!1076447 (validKeyInArray!0 (select (arr!50815 _keys!591) i!537)))))

(declare-fun b!1576728 () Bool)

(declare-fun res!1076444 () Bool)

(assert (=> b!1576728 (=> (not res!1076444) (not e!879472))))

(assert (=> b!1576728 (= res!1076444 (and (= (size!51366 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51366 _keys!591)) (bvslt i!537 (size!51366 _keys!591))))))

(declare-fun res!1076445 () Bool)

(assert (=> start!135946 (=> (not res!1076445) (not e!879472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135946 (= res!1076445 (validMask!0 mask!877))))

(assert (=> start!135946 e!879472))

(assert (=> start!135946 true))

(declare-fun array_inv!39770 (array!105350) Bool)

(assert (=> start!135946 (array_inv!39770 _keys!591)))

(assert (= (and start!135946 res!1076445) b!1576728))

(assert (= (and b!1576728 res!1076444) b!1576729))

(assert (= (and b!1576729 res!1076447) b!1576730))

(assert (= (and b!1576730 (not res!1076446)) b!1576731))

(declare-fun m!1449795 () Bool)

(assert (=> b!1576730 m!1449795))

(assert (=> b!1576730 m!1449795))

(declare-fun m!1449797 () Bool)

(assert (=> b!1576730 m!1449797))

(assert (=> b!1576730 m!1449795))

(declare-fun m!1449799 () Bool)

(assert (=> b!1576730 m!1449799))

(assert (=> b!1576730 m!1449795))

(declare-fun m!1449801 () Bool)

(assert (=> b!1576730 m!1449801))

(assert (=> b!1576729 m!1449795))

(assert (=> b!1576729 m!1449795))

(declare-fun m!1449803 () Bool)

(assert (=> b!1576729 m!1449803))

(declare-fun m!1449805 () Bool)

(assert (=> start!135946 m!1449805))

(declare-fun m!1449807 () Bool)

(assert (=> start!135946 m!1449807))

(check-sat (not start!135946) (not b!1576730) (not b!1576729))
(check-sat)
