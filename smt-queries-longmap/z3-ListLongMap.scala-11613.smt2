; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135518 () Bool)

(assert start!135518)

(declare-fun res!1075565 () Bool)

(declare-fun e!877949 () Bool)

(assert (=> start!135518 (=> (not res!1075565) (not e!877949))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135518 (= res!1075565 (validMask!0 mask!877))))

(assert (=> start!135518 e!877949))

(assert (=> start!135518 true))

(declare-datatypes ((array!105221 0))(
  ( (array!105222 (arr!50759 (Array (_ BitVec 32) (_ BitVec 64))) (size!51309 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105221)

(declare-fun array_inv!39486 (array!105221) Bool)

(assert (=> start!135518 (array_inv!39486 _keys!591)))

(declare-fun b!1574272 () Bool)

(declare-fun res!1075566 () Bool)

(assert (=> b!1574272 (=> (not res!1075566) (not e!877949))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574272 (= res!1075566 (and (= (size!51309 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51309 _keys!591)) (bvslt i!537 (size!51309 _keys!591))))))

(declare-fun b!1574273 () Bool)

(declare-fun res!1075564 () Bool)

(assert (=> b!1574273 (=> (not res!1075564) (not e!877949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574273 (= res!1075564 (validKeyInArray!0 (select (arr!50759 _keys!591) i!537)))))

(declare-fun b!1574274 () Bool)

(assert (=> b!1574274 (= e!877949 (not true))))

(declare-fun arrayContainsKey!0 (array!105221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574274 (arrayContainsKey!0 _keys!591 (select (arr!50759 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52164 0))(
  ( (Unit!52165) )
))
(declare-fun lt!674764 () Unit!52164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105221 (_ BitVec 64) (_ BitVec 32)) Unit!52164)

(assert (=> b!1574274 (= lt!674764 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50759 _keys!591) i!537) i!537))))

(assert (= (and start!135518 res!1075565) b!1574272))

(assert (= (and b!1574272 res!1075566) b!1574273))

(assert (= (and b!1574273 res!1075564) b!1574274))

(declare-fun m!1447513 () Bool)

(assert (=> start!135518 m!1447513))

(declare-fun m!1447515 () Bool)

(assert (=> start!135518 m!1447515))

(declare-fun m!1447517 () Bool)

(assert (=> b!1574273 m!1447517))

(assert (=> b!1574273 m!1447517))

(declare-fun m!1447519 () Bool)

(assert (=> b!1574273 m!1447519))

(assert (=> b!1574274 m!1447517))

(assert (=> b!1574274 m!1447517))

(declare-fun m!1447521 () Bool)

(assert (=> b!1574274 m!1447521))

(assert (=> b!1574274 m!1447517))

(declare-fun m!1447523 () Bool)

(assert (=> b!1574274 m!1447523))

(check-sat (not b!1574273) (not b!1574274) (not start!135518))
