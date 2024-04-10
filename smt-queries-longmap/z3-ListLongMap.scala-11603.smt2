; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135426 () Bool)

(assert start!135426)

(declare-fun res!1075259 () Bool)

(declare-fun e!877741 () Bool)

(assert (=> start!135426 (=> (not res!1075259) (not e!877741))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135426 (= res!1075259 (validMask!0 mask!877))))

(assert (=> start!135426 e!877741))

(assert (=> start!135426 true))

(declare-datatypes ((array!105157 0))(
  ( (array!105158 (arr!50729 (Array (_ BitVec 32) (_ BitVec 64))) (size!51279 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105157)

(declare-fun array_inv!39456 (array!105157) Bool)

(assert (=> start!135426 (array_inv!39456 _keys!591)))

(declare-fun b!1573966 () Bool)

(declare-fun res!1075258 () Bool)

(assert (=> b!1573966 (=> (not res!1075258) (not e!877741))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573966 (= res!1075258 (and (= (size!51279 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51279 _keys!591)) (bvslt i!537 (size!51279 _keys!591))))))

(declare-fun b!1573967 () Bool)

(declare-fun res!1075260 () Bool)

(assert (=> b!1573967 (=> (not res!1075260) (not e!877741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573967 (= res!1075260 (validKeyInArray!0 (select (arr!50729 _keys!591) i!537)))))

(declare-fun b!1573968 () Bool)

(assert (=> b!1573968 (= e!877741 (not (bvsge mask!877 #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!105157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573968 (arrayContainsKey!0 _keys!591 (select (arr!50729 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52122 0))(
  ( (Unit!52123) )
))
(declare-fun lt!674674 () Unit!52122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105157 (_ BitVec 64) (_ BitVec 32)) Unit!52122)

(assert (=> b!1573968 (= lt!674674 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50729 _keys!591) i!537) i!537))))

(assert (= (and start!135426 res!1075259) b!1573966))

(assert (= (and b!1573966 res!1075258) b!1573967))

(assert (= (and b!1573967 res!1075260) b!1573968))

(declare-fun m!1447153 () Bool)

(assert (=> start!135426 m!1447153))

(declare-fun m!1447155 () Bool)

(assert (=> start!135426 m!1447155))

(declare-fun m!1447157 () Bool)

(assert (=> b!1573967 m!1447157))

(assert (=> b!1573967 m!1447157))

(declare-fun m!1447159 () Bool)

(assert (=> b!1573967 m!1447159))

(assert (=> b!1573968 m!1447157))

(assert (=> b!1573968 m!1447157))

(declare-fun m!1447161 () Bool)

(assert (=> b!1573968 m!1447161))

(assert (=> b!1573968 m!1447157))

(declare-fun m!1447163 () Bool)

(assert (=> b!1573968 m!1447163))

(check-sat (not b!1573968) (not b!1573967) (not start!135426))
(check-sat)
