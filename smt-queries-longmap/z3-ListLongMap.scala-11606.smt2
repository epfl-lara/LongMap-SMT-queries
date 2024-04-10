; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135444 () Bool)

(assert start!135444)

(declare-fun res!1075339 () Bool)

(declare-fun e!877795 () Bool)

(assert (=> start!135444 (=> (not res!1075339) (not e!877795))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135444 (= res!1075339 (validMask!0 mask!877))))

(assert (=> start!135444 e!877795))

(assert (=> start!135444 true))

(declare-datatypes ((array!105175 0))(
  ( (array!105176 (arr!50738 (Array (_ BitVec 32) (_ BitVec 64))) (size!51288 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105175)

(declare-fun array_inv!39465 (array!105175) Bool)

(assert (=> start!135444 (array_inv!39465 _keys!591)))

(declare-fun b!1574047 () Bool)

(declare-fun res!1075341 () Bool)

(assert (=> b!1574047 (=> (not res!1075341) (not e!877795))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574047 (= res!1075341 (and (= (size!51288 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51288 _keys!591)) (bvslt i!537 (size!51288 _keys!591))))))

(declare-fun b!1574048 () Bool)

(declare-fun res!1075340 () Bool)

(assert (=> b!1574048 (=> (not res!1075340) (not e!877795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574048 (= res!1075340 (validKeyInArray!0 (select (arr!50738 _keys!591) i!537)))))

(declare-fun b!1574049 () Bool)

(assert (=> b!1574049 (= e!877795 (not true))))

(declare-datatypes ((SeekEntryResult!13639 0))(
  ( (MissingZero!13639 (index!56954 (_ BitVec 32))) (Found!13639 (index!56955 (_ BitVec 32))) (Intermediate!13639 (undefined!14451 Bool) (index!56956 (_ BitVec 32)) (x!141810 (_ BitVec 32))) (Undefined!13639) (MissingVacant!13639 (index!56957 (_ BitVec 32))) )
))
(declare-fun lt!674706 () SeekEntryResult!13639)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105175 (_ BitVec 32)) SeekEntryResult!13639)

(assert (=> b!1574049 (= lt!674706 (seekEntryOrOpen!0 (select (arr!50738 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574049 (arrayContainsKey!0 _keys!591 (select (arr!50738 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52140 0))(
  ( (Unit!52141) )
))
(declare-fun lt!674707 () Unit!52140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105175 (_ BitVec 64) (_ BitVec 32)) Unit!52140)

(assert (=> b!1574049 (= lt!674707 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50738 _keys!591) i!537) i!537))))

(assert (= (and start!135444 res!1075339) b!1574047))

(assert (= (and b!1574047 res!1075341) b!1574048))

(assert (= (and b!1574048 res!1075340) b!1574049))

(declare-fun m!1447263 () Bool)

(assert (=> start!135444 m!1447263))

(declare-fun m!1447265 () Bool)

(assert (=> start!135444 m!1447265))

(declare-fun m!1447267 () Bool)

(assert (=> b!1574048 m!1447267))

(assert (=> b!1574048 m!1447267))

(declare-fun m!1447269 () Bool)

(assert (=> b!1574048 m!1447269))

(assert (=> b!1574049 m!1447267))

(assert (=> b!1574049 m!1447267))

(declare-fun m!1447271 () Bool)

(assert (=> b!1574049 m!1447271))

(assert (=> b!1574049 m!1447267))

(declare-fun m!1447273 () Bool)

(assert (=> b!1574049 m!1447273))

(assert (=> b!1574049 m!1447267))

(declare-fun m!1447275 () Bool)

(assert (=> b!1574049 m!1447275))

(check-sat (not b!1574048) (not b!1574049) (not start!135444))
