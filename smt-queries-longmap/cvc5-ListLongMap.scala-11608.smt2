; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135454 () Bool)

(assert start!135454)

(declare-fun b!1574097 () Bool)

(declare-fun e!877829 () Bool)

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574097 (= e!877829 (bvsge (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(declare-fun b!1574096 () Bool)

(declare-fun e!877827 () Bool)

(assert (=> b!1574096 (= e!877827 (not e!877829))))

(declare-fun res!1075387 () Bool)

(assert (=> b!1574096 (=> res!1075387 e!877829)))

(declare-datatypes ((array!105185 0))(
  ( (array!105186 (arr!50743 (Array (_ BitVec 32) (_ BitVec 64))) (size!51293 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105185)

(declare-fun mask!877 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13644 0))(
  ( (MissingZero!13644 (index!56974 (_ BitVec 32))) (Found!13644 (index!56975 (_ BitVec 32))) (Intermediate!13644 (undefined!14456 Bool) (index!56976 (_ BitVec 32)) (x!141831 (_ BitVec 32))) (Undefined!13644) (MissingVacant!13644 (index!56977 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105185 (_ BitVec 32)) SeekEntryResult!13644)

(assert (=> b!1574096 (= res!1075387 (not (= (seekEntryOrOpen!0 (select (arr!50743 _keys!591) i!537) _keys!591 mask!877) (Found!13644 i!537))))))

(declare-fun arrayContainsKey!0 (array!105185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574096 (arrayContainsKey!0 _keys!591 (select (arr!50743 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52150 0))(
  ( (Unit!52151) )
))
(declare-fun lt!674734 () Unit!52150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105185 (_ BitVec 64) (_ BitVec 32)) Unit!52150)

(assert (=> b!1574096 (= lt!674734 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50743 _keys!591) i!537) i!537))))

(declare-fun res!1075386 () Bool)

(assert (=> start!135454 (=> (not res!1075386) (not e!877827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135454 (= res!1075386 (validMask!0 mask!877))))

(assert (=> start!135454 e!877827))

(assert (=> start!135454 true))

(declare-fun array_inv!39470 (array!105185) Bool)

(assert (=> start!135454 (array_inv!39470 _keys!591)))

(declare-fun b!1574094 () Bool)

(declare-fun res!1075389 () Bool)

(assert (=> b!1574094 (=> (not res!1075389) (not e!877827))))

(assert (=> b!1574094 (= res!1075389 (and (= (size!51293 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51293 _keys!591)) (bvslt i!537 (size!51293 _keys!591))))))

(declare-fun b!1574095 () Bool)

(declare-fun res!1075388 () Bool)

(assert (=> b!1574095 (=> (not res!1075388) (not e!877827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574095 (= res!1075388 (validKeyInArray!0 (select (arr!50743 _keys!591) i!537)))))

(assert (= (and start!135454 res!1075386) b!1574094))

(assert (= (and b!1574094 res!1075389) b!1574095))

(assert (= (and b!1574095 res!1075388) b!1574096))

(assert (= (and b!1574096 (not res!1075387)) b!1574097))

(declare-fun m!1447333 () Bool)

(assert (=> b!1574096 m!1447333))

(assert (=> b!1574096 m!1447333))

(declare-fun m!1447335 () Bool)

(assert (=> b!1574096 m!1447335))

(assert (=> b!1574096 m!1447333))

(declare-fun m!1447337 () Bool)

(assert (=> b!1574096 m!1447337))

(assert (=> b!1574096 m!1447333))

(declare-fun m!1447339 () Bool)

(assert (=> b!1574096 m!1447339))

(declare-fun m!1447341 () Bool)

(assert (=> start!135454 m!1447341))

(declare-fun m!1447343 () Bool)

(assert (=> start!135454 m!1447343))

(assert (=> b!1574095 m!1447333))

(assert (=> b!1574095 m!1447333))

(declare-fun m!1447345 () Bool)

(assert (=> b!1574095 m!1447345))

(push 1)

(assert (not start!135454))

(assert (not b!1574095))

(assert (not b!1574096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

