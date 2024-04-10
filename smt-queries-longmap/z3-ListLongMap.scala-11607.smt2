; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135450 () Bool)

(assert start!135450)

(declare-fun res!1075368 () Bool)

(declare-fun e!877814 () Bool)

(assert (=> start!135450 (=> (not res!1075368) (not e!877814))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135450 (= res!1075368 (validMask!0 mask!877))))

(assert (=> start!135450 e!877814))

(assert (=> start!135450 true))

(declare-datatypes ((array!105181 0))(
  ( (array!105182 (arr!50741 (Array (_ BitVec 32) (_ BitVec 64))) (size!51291 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105181)

(declare-fun array_inv!39468 (array!105181) Bool)

(assert (=> start!135450 (array_inv!39468 _keys!591)))

(declare-fun b!1574074 () Bool)

(declare-fun res!1075367 () Bool)

(assert (=> b!1574074 (=> (not res!1075367) (not e!877814))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574074 (= res!1075367 (and (= (size!51291 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51291 _keys!591)) (bvslt i!537 (size!51291 _keys!591))))))

(declare-fun b!1574075 () Bool)

(declare-fun res!1075366 () Bool)

(assert (=> b!1574075 (=> (not res!1075366) (not e!877814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574075 (= res!1075366 (validKeyInArray!0 (select (arr!50741 _keys!591) i!537)))))

(declare-fun b!1574076 () Bool)

(assert (=> b!1574076 (= e!877814 (not true))))

(declare-datatypes ((SeekEntryResult!13642 0))(
  ( (MissingZero!13642 (index!56966 (_ BitVec 32))) (Found!13642 (index!56967 (_ BitVec 32))) (Intermediate!13642 (undefined!14454 Bool) (index!56968 (_ BitVec 32)) (x!141821 (_ BitVec 32))) (Undefined!13642) (MissingVacant!13642 (index!56969 (_ BitVec 32))) )
))
(declare-fun lt!674724 () SeekEntryResult!13642)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105181 (_ BitVec 32)) SeekEntryResult!13642)

(assert (=> b!1574076 (= lt!674724 (seekEntryOrOpen!0 (select (arr!50741 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574076 (arrayContainsKey!0 _keys!591 (select (arr!50741 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52146 0))(
  ( (Unit!52147) )
))
(declare-fun lt!674725 () Unit!52146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105181 (_ BitVec 64) (_ BitVec 32)) Unit!52146)

(assert (=> b!1574076 (= lt!674725 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50741 _keys!591) i!537) i!537))))

(assert (= (and start!135450 res!1075368) b!1574074))

(assert (= (and b!1574074 res!1075367) b!1574075))

(assert (= (and b!1574075 res!1075366) b!1574076))

(declare-fun m!1447305 () Bool)

(assert (=> start!135450 m!1447305))

(declare-fun m!1447307 () Bool)

(assert (=> start!135450 m!1447307))

(declare-fun m!1447309 () Bool)

(assert (=> b!1574075 m!1447309))

(assert (=> b!1574075 m!1447309))

(declare-fun m!1447311 () Bool)

(assert (=> b!1574075 m!1447311))

(assert (=> b!1574076 m!1447309))

(assert (=> b!1574076 m!1447309))

(declare-fun m!1447313 () Bool)

(assert (=> b!1574076 m!1447313))

(assert (=> b!1574076 m!1447309))

(declare-fun m!1447315 () Bool)

(assert (=> b!1574076 m!1447315))

(assert (=> b!1574076 m!1447309))

(declare-fun m!1447317 () Bool)

(assert (=> b!1574076 m!1447317))

(check-sat (not b!1574076) (not b!1574075) (not start!135450))
