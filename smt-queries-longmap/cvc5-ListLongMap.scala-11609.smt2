; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135460 () Bool)

(assert start!135460)

(declare-fun res!1075421 () Bool)

(declare-fun e!877852 () Bool)

(assert (=> start!135460 (=> (not res!1075421) (not e!877852))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135460 (= res!1075421 (validMask!0 mask!877))))

(assert (=> start!135460 e!877852))

(assert (=> start!135460 true))

(declare-datatypes ((array!105191 0))(
  ( (array!105192 (arr!50746 (Array (_ BitVec 32) (_ BitVec 64))) (size!51296 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105191)

(declare-fun array_inv!39473 (array!105191) Bool)

(assert (=> start!135460 (array_inv!39473 _keys!591)))

(declare-fun b!1574128 () Bool)

(declare-fun res!1075422 () Bool)

(assert (=> b!1574128 (=> (not res!1075422) (not e!877852))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574128 (= res!1075422 (and (= (size!51296 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51296 _keys!591)) (bvslt i!537 (size!51296 _keys!591))))))

(declare-fun b!1574129 () Bool)

(declare-fun res!1075420 () Bool)

(assert (=> b!1574129 (=> (not res!1075420) (not e!877852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574129 (= res!1075420 (validKeyInArray!0 (select (arr!50746 _keys!591) i!537)))))

(declare-fun b!1574130 () Bool)

(assert (=> b!1574130 (= e!877852 (not true))))

(declare-datatypes ((SeekEntryResult!13647 0))(
  ( (MissingZero!13647 (index!56986 (_ BitVec 32))) (Found!13647 (index!56987 (_ BitVec 32))) (Intermediate!13647 (undefined!14459 Bool) (index!56988 (_ BitVec 32)) (x!141842 (_ BitVec 32))) (Undefined!13647) (MissingVacant!13647 (index!56989 (_ BitVec 32))) )
))
(declare-fun lt!674745 () SeekEntryResult!13647)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105191 (_ BitVec 32)) SeekEntryResult!13647)

(assert (=> b!1574130 (= lt!674745 (seekEntryOrOpen!0 (select (arr!50746 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574130 (arrayContainsKey!0 _keys!591 (select (arr!50746 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52156 0))(
  ( (Unit!52157) )
))
(declare-fun lt!674746 () Unit!52156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105191 (_ BitVec 64) (_ BitVec 32)) Unit!52156)

(assert (=> b!1574130 (= lt!674746 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50746 _keys!591) i!537) i!537))))

(assert (= (and start!135460 res!1075421) b!1574128))

(assert (= (and b!1574128 res!1075422) b!1574129))

(assert (= (and b!1574129 res!1075420) b!1574130))

(declare-fun m!1447375 () Bool)

(assert (=> start!135460 m!1447375))

(declare-fun m!1447377 () Bool)

(assert (=> start!135460 m!1447377))

(declare-fun m!1447379 () Bool)

(assert (=> b!1574129 m!1447379))

(assert (=> b!1574129 m!1447379))

(declare-fun m!1447381 () Bool)

(assert (=> b!1574129 m!1447381))

(assert (=> b!1574130 m!1447379))

(assert (=> b!1574130 m!1447379))

(declare-fun m!1447383 () Bool)

(assert (=> b!1574130 m!1447383))

(assert (=> b!1574130 m!1447379))

(declare-fun m!1447385 () Bool)

(assert (=> b!1574130 m!1447385))

(assert (=> b!1574130 m!1447379))

(declare-fun m!1447387 () Bool)

(assert (=> b!1574130 m!1447387))

(push 1)

(assert (not start!135460))

(assert (not b!1574129))

(assert (not b!1574130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

