; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135438 () Bool)

(assert start!135438)

(declare-fun res!1075313 () Bool)

(declare-fun e!877777 () Bool)

(assert (=> start!135438 (=> (not res!1075313) (not e!877777))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135438 (= res!1075313 (validMask!0 mask!877))))

(assert (=> start!135438 e!877777))

(assert (=> start!135438 true))

(declare-datatypes ((array!105169 0))(
  ( (array!105170 (arr!50735 (Array (_ BitVec 32) (_ BitVec 64))) (size!51285 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105169)

(declare-fun array_inv!39462 (array!105169) Bool)

(assert (=> start!135438 (array_inv!39462 _keys!591)))

(declare-fun b!1574020 () Bool)

(declare-fun res!1075312 () Bool)

(assert (=> b!1574020 (=> (not res!1075312) (not e!877777))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574020 (= res!1075312 (and (= (size!51285 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51285 _keys!591)) (bvslt i!537 (size!51285 _keys!591))))))

(declare-fun b!1574021 () Bool)

(declare-fun res!1075314 () Bool)

(assert (=> b!1574021 (=> (not res!1075314) (not e!877777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574021 (= res!1075314 (validKeyInArray!0 (select (arr!50735 _keys!591) i!537)))))

(declare-fun b!1574022 () Bool)

(assert (=> b!1574022 (= e!877777 (not true))))

(declare-fun arrayContainsKey!0 (array!105169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574022 (arrayContainsKey!0 _keys!591 (select (arr!50735 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52134 0))(
  ( (Unit!52135) )
))
(declare-fun lt!674692 () Unit!52134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105169 (_ BitVec 64) (_ BitVec 32)) Unit!52134)

(assert (=> b!1574022 (= lt!674692 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50735 _keys!591) i!537) i!537))))

(assert (= (and start!135438 res!1075313) b!1574020))

(assert (= (and b!1574020 res!1075312) b!1574021))

(assert (= (and b!1574021 res!1075314) b!1574022))

(declare-fun m!1447225 () Bool)

(assert (=> start!135438 m!1447225))

(declare-fun m!1447227 () Bool)

(assert (=> start!135438 m!1447227))

(declare-fun m!1447229 () Bool)

(assert (=> b!1574021 m!1447229))

(assert (=> b!1574021 m!1447229))

(declare-fun m!1447231 () Bool)

(assert (=> b!1574021 m!1447231))

(assert (=> b!1574022 m!1447229))

(assert (=> b!1574022 m!1447229))

(declare-fun m!1447233 () Bool)

(assert (=> b!1574022 m!1447233))

(assert (=> b!1574022 m!1447229))

(declare-fun m!1447235 () Bool)

(assert (=> b!1574022 m!1447235))

(check-sat (not b!1574021) (not b!1574022) (not start!135438))
