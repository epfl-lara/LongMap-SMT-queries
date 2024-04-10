; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135446 () Bool)

(assert start!135446)

(declare-fun res!1075348 () Bool)

(declare-fun e!877802 () Bool)

(assert (=> start!135446 (=> (not res!1075348) (not e!877802))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135446 (= res!1075348 (validMask!0 mask!877))))

(assert (=> start!135446 e!877802))

(assert (=> start!135446 true))

(declare-datatypes ((array!105177 0))(
  ( (array!105178 (arr!50739 (Array (_ BitVec 32) (_ BitVec 64))) (size!51289 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105177)

(declare-fun array_inv!39466 (array!105177) Bool)

(assert (=> start!135446 (array_inv!39466 _keys!591)))

(declare-fun b!1574056 () Bool)

(declare-fun res!1075349 () Bool)

(assert (=> b!1574056 (=> (not res!1075349) (not e!877802))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574056 (= res!1075349 (and (= (size!51289 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51289 _keys!591)) (bvslt i!537 (size!51289 _keys!591))))))

(declare-fun b!1574057 () Bool)

(declare-fun res!1075350 () Bool)

(assert (=> b!1574057 (=> (not res!1075350) (not e!877802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574057 (= res!1075350 (validKeyInArray!0 (select (arr!50739 _keys!591) i!537)))))

(declare-fun b!1574058 () Bool)

(assert (=> b!1574058 (= e!877802 (not true))))

(declare-datatypes ((SeekEntryResult!13640 0))(
  ( (MissingZero!13640 (index!56958 (_ BitVec 32))) (Found!13640 (index!56959 (_ BitVec 32))) (Intermediate!13640 (undefined!14452 Bool) (index!56960 (_ BitVec 32)) (x!141811 (_ BitVec 32))) (Undefined!13640) (MissingVacant!13640 (index!56961 (_ BitVec 32))) )
))
(declare-fun lt!674712 () SeekEntryResult!13640)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105177 (_ BitVec 32)) SeekEntryResult!13640)

(assert (=> b!1574058 (= lt!674712 (seekEntryOrOpen!0 (select (arr!50739 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574058 (arrayContainsKey!0 _keys!591 (select (arr!50739 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52142 0))(
  ( (Unit!52143) )
))
(declare-fun lt!674713 () Unit!52142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105177 (_ BitVec 64) (_ BitVec 32)) Unit!52142)

(assert (=> b!1574058 (= lt!674713 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50739 _keys!591) i!537) i!537))))

(assert (= (and start!135446 res!1075348) b!1574056))

(assert (= (and b!1574056 res!1075349) b!1574057))

(assert (= (and b!1574057 res!1075350) b!1574058))

(declare-fun m!1447277 () Bool)

(assert (=> start!135446 m!1447277))

(declare-fun m!1447279 () Bool)

(assert (=> start!135446 m!1447279))

(declare-fun m!1447281 () Bool)

(assert (=> b!1574057 m!1447281))

(assert (=> b!1574057 m!1447281))

(declare-fun m!1447283 () Bool)

(assert (=> b!1574057 m!1447283))

(assert (=> b!1574058 m!1447281))

(assert (=> b!1574058 m!1447281))

(declare-fun m!1447285 () Bool)

(assert (=> b!1574058 m!1447285))

(assert (=> b!1574058 m!1447281))

(declare-fun m!1447287 () Bool)

(assert (=> b!1574058 m!1447287))

(assert (=> b!1574058 m!1447281))

(declare-fun m!1447289 () Bool)

(assert (=> b!1574058 m!1447289))

(push 1)

(assert (not b!1574057))

(assert (not b!1574058))

