; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135456 () Bool)

(assert start!135456)

(declare-fun b!1574109 () Bool)

(declare-fun e!877838 () Bool)

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574109 (= e!877838 (bvsge (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(declare-fun b!1574107 () Bool)

(declare-fun res!1075400 () Bool)

(declare-fun e!877837 () Bool)

(assert (=> b!1574107 (=> (not res!1075400) (not e!877837))))

(declare-datatypes ((array!105187 0))(
  ( (array!105188 (arr!50744 (Array (_ BitVec 32) (_ BitVec 64))) (size!51294 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105187)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574107 (= res!1075400 (validKeyInArray!0 (select (arr!50744 _keys!591) i!537)))))

(declare-fun b!1574108 () Bool)

(assert (=> b!1574108 (= e!877837 (not e!877838))))

(declare-fun res!1075401 () Bool)

(assert (=> b!1574108 (=> res!1075401 e!877838)))

(declare-fun mask!877 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13645 0))(
  ( (MissingZero!13645 (index!56978 (_ BitVec 32))) (Found!13645 (index!56979 (_ BitVec 32))) (Intermediate!13645 (undefined!14457 Bool) (index!56980 (_ BitVec 32)) (x!141832 (_ BitVec 32))) (Undefined!13645) (MissingVacant!13645 (index!56981 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105187 (_ BitVec 32)) SeekEntryResult!13645)

(assert (=> b!1574108 (= res!1075401 (not (= (seekEntryOrOpen!0 (select (arr!50744 _keys!591) i!537) _keys!591 mask!877) (Found!13645 i!537))))))

(declare-fun arrayContainsKey!0 (array!105187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574108 (arrayContainsKey!0 _keys!591 (select (arr!50744 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52152 0))(
  ( (Unit!52153) )
))
(declare-fun lt!674737 () Unit!52152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105187 (_ BitVec 64) (_ BitVec 32)) Unit!52152)

(assert (=> b!1574108 (= lt!674737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50744 _keys!591) i!537) i!537))))

(declare-fun b!1574106 () Bool)

(declare-fun res!1075398 () Bool)

(assert (=> b!1574106 (=> (not res!1075398) (not e!877837))))

(assert (=> b!1574106 (= res!1075398 (and (= (size!51294 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51294 _keys!591)) (bvslt i!537 (size!51294 _keys!591))))))

(declare-fun res!1075399 () Bool)

(assert (=> start!135456 (=> (not res!1075399) (not e!877837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135456 (= res!1075399 (validMask!0 mask!877))))

(assert (=> start!135456 e!877837))

(assert (=> start!135456 true))

(declare-fun array_inv!39471 (array!105187) Bool)

(assert (=> start!135456 (array_inv!39471 _keys!591)))

(assert (= (and start!135456 res!1075399) b!1574106))

(assert (= (and b!1574106 res!1075398) b!1574107))

(assert (= (and b!1574107 res!1075400) b!1574108))

(assert (= (and b!1574108 (not res!1075401)) b!1574109))

(declare-fun m!1447347 () Bool)

(assert (=> b!1574107 m!1447347))

(assert (=> b!1574107 m!1447347))

(declare-fun m!1447349 () Bool)

(assert (=> b!1574107 m!1447349))

(assert (=> b!1574108 m!1447347))

(assert (=> b!1574108 m!1447347))

(declare-fun m!1447351 () Bool)

(assert (=> b!1574108 m!1447351))

(assert (=> b!1574108 m!1447347))

(declare-fun m!1447353 () Bool)

(assert (=> b!1574108 m!1447353))

(assert (=> b!1574108 m!1447347))

(declare-fun m!1447355 () Bool)

(assert (=> b!1574108 m!1447355))

(declare-fun m!1447357 () Bool)

(assert (=> start!135456 m!1447357))

(declare-fun m!1447359 () Bool)

(assert (=> start!135456 m!1447359))

(check-sat (not start!135456) (not b!1574107) (not b!1574108))
(check-sat)
