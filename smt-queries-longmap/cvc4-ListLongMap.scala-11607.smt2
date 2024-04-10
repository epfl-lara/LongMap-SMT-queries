; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135452 () Bool)

(assert start!135452)

(declare-fun res!1075377 () Bool)

(declare-fun e!877819 () Bool)

(assert (=> start!135452 (=> (not res!1075377) (not e!877819))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135452 (= res!1075377 (validMask!0 mask!877))))

(assert (=> start!135452 e!877819))

(assert (=> start!135452 true))

(declare-datatypes ((array!105183 0))(
  ( (array!105184 (arr!50742 (Array (_ BitVec 32) (_ BitVec 64))) (size!51292 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105183)

(declare-fun array_inv!39469 (array!105183) Bool)

(assert (=> start!135452 (array_inv!39469 _keys!591)))

(declare-fun b!1574083 () Bool)

(declare-fun res!1075376 () Bool)

(assert (=> b!1574083 (=> (not res!1075376) (not e!877819))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574083 (= res!1075376 (and (= (size!51292 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51292 _keys!591)) (bvslt i!537 (size!51292 _keys!591))))))

(declare-fun b!1574084 () Bool)

(declare-fun res!1075375 () Bool)

(assert (=> b!1574084 (=> (not res!1075375) (not e!877819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574084 (= res!1075375 (validKeyInArray!0 (select (arr!50742 _keys!591) i!537)))))

(declare-fun b!1574085 () Bool)

(assert (=> b!1574085 (= e!877819 (not true))))

(declare-datatypes ((SeekEntryResult!13643 0))(
  ( (MissingZero!13643 (index!56970 (_ BitVec 32))) (Found!13643 (index!56971 (_ BitVec 32))) (Intermediate!13643 (undefined!14455 Bool) (index!56972 (_ BitVec 32)) (x!141822 (_ BitVec 32))) (Undefined!13643) (MissingVacant!13643 (index!56973 (_ BitVec 32))) )
))
(declare-fun lt!674730 () SeekEntryResult!13643)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105183 (_ BitVec 32)) SeekEntryResult!13643)

(assert (=> b!1574085 (= lt!674730 (seekEntryOrOpen!0 (select (arr!50742 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574085 (arrayContainsKey!0 _keys!591 (select (arr!50742 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52148 0))(
  ( (Unit!52149) )
))
(declare-fun lt!674731 () Unit!52148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105183 (_ BitVec 64) (_ BitVec 32)) Unit!52148)

(assert (=> b!1574085 (= lt!674731 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50742 _keys!591) i!537) i!537))))

(assert (= (and start!135452 res!1075377) b!1574083))

(assert (= (and b!1574083 res!1075376) b!1574084))

(assert (= (and b!1574084 res!1075375) b!1574085))

(declare-fun m!1447319 () Bool)

(assert (=> start!135452 m!1447319))

(declare-fun m!1447321 () Bool)

(assert (=> start!135452 m!1447321))

(declare-fun m!1447323 () Bool)

(assert (=> b!1574084 m!1447323))

(assert (=> b!1574084 m!1447323))

(declare-fun m!1447325 () Bool)

(assert (=> b!1574084 m!1447325))

(assert (=> b!1574085 m!1447323))

(assert (=> b!1574085 m!1447323))

(declare-fun m!1447327 () Bool)

(assert (=> b!1574085 m!1447327))

(assert (=> b!1574085 m!1447323))

(declare-fun m!1447329 () Bool)

(assert (=> b!1574085 m!1447329))

(assert (=> b!1574085 m!1447323))

(declare-fun m!1447331 () Bool)

(assert (=> b!1574085 m!1447331))

(push 1)

(assert (not b!1574084))

(assert (not b!1574085))

(assert (not start!135452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

