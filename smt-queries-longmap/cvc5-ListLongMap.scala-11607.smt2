; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135448 () Bool)

(assert start!135448)

(declare-fun res!1075359 () Bool)

(declare-fun e!877807 () Bool)

(assert (=> start!135448 (=> (not res!1075359) (not e!877807))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135448 (= res!1075359 (validMask!0 mask!877))))

(assert (=> start!135448 e!877807))

(assert (=> start!135448 true))

(declare-datatypes ((array!105179 0))(
  ( (array!105180 (arr!50740 (Array (_ BitVec 32) (_ BitVec 64))) (size!51290 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105179)

(declare-fun array_inv!39467 (array!105179) Bool)

(assert (=> start!135448 (array_inv!39467 _keys!591)))

(declare-fun b!1574065 () Bool)

(declare-fun res!1075357 () Bool)

(assert (=> b!1574065 (=> (not res!1075357) (not e!877807))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574065 (= res!1075357 (and (= (size!51290 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51290 _keys!591)) (bvslt i!537 (size!51290 _keys!591))))))

(declare-fun b!1574066 () Bool)

(declare-fun res!1075358 () Bool)

(assert (=> b!1574066 (=> (not res!1075358) (not e!877807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574066 (= res!1075358 (validKeyInArray!0 (select (arr!50740 _keys!591) i!537)))))

(declare-fun b!1574067 () Bool)

(assert (=> b!1574067 (= e!877807 (not true))))

(declare-datatypes ((SeekEntryResult!13641 0))(
  ( (MissingZero!13641 (index!56962 (_ BitVec 32))) (Found!13641 (index!56963 (_ BitVec 32))) (Intermediate!13641 (undefined!14453 Bool) (index!56964 (_ BitVec 32)) (x!141820 (_ BitVec 32))) (Undefined!13641) (MissingVacant!13641 (index!56965 (_ BitVec 32))) )
))
(declare-fun lt!674719 () SeekEntryResult!13641)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105179 (_ BitVec 32)) SeekEntryResult!13641)

(assert (=> b!1574067 (= lt!674719 (seekEntryOrOpen!0 (select (arr!50740 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574067 (arrayContainsKey!0 _keys!591 (select (arr!50740 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52144 0))(
  ( (Unit!52145) )
))
(declare-fun lt!674718 () Unit!52144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105179 (_ BitVec 64) (_ BitVec 32)) Unit!52144)

(assert (=> b!1574067 (= lt!674718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50740 _keys!591) i!537) i!537))))

(assert (= (and start!135448 res!1075359) b!1574065))

(assert (= (and b!1574065 res!1075357) b!1574066))

(assert (= (and b!1574066 res!1075358) b!1574067))

(declare-fun m!1447291 () Bool)

(assert (=> start!135448 m!1447291))

(declare-fun m!1447293 () Bool)

(assert (=> start!135448 m!1447293))

(declare-fun m!1447295 () Bool)

(assert (=> b!1574066 m!1447295))

(assert (=> b!1574066 m!1447295))

(declare-fun m!1447297 () Bool)

(assert (=> b!1574066 m!1447297))

(assert (=> b!1574067 m!1447295))

(assert (=> b!1574067 m!1447295))

(declare-fun m!1447299 () Bool)

(assert (=> b!1574067 m!1447299))

(assert (=> b!1574067 m!1447295))

(declare-fun m!1447301 () Bool)

(assert (=> b!1574067 m!1447301))

(assert (=> b!1574067 m!1447295))

(declare-fun m!1447303 () Bool)

(assert (=> b!1574067 m!1447303))

(push 1)

(assert (not b!1574067))

(assert (not start!135448))

(assert (not b!1574066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

