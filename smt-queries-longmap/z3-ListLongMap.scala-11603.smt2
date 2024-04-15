; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135378 () Bool)

(assert start!135378)

(declare-fun res!1075122 () Bool)

(declare-fun e!877537 () Bool)

(assert (=> start!135378 (=> (not res!1075122) (not e!877537))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135378 (= res!1075122 (validMask!0 mask!877))))

(assert (=> start!135378 e!877537))

(assert (=> start!135378 true))

(declare-datatypes ((array!105084 0))(
  ( (array!105085 (arr!50693 (Array (_ BitVec 32) (_ BitVec 64))) (size!51245 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105084)

(declare-fun array_inv!39629 (array!105084) Bool)

(assert (=> start!135378 (array_inv!39629 _keys!591)))

(declare-fun b!1573644 () Bool)

(declare-fun res!1075121 () Bool)

(assert (=> b!1573644 (=> (not res!1075121) (not e!877537))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573644 (= res!1075121 (and (= (size!51245 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51245 _keys!591)) (bvslt i!537 (size!51245 _keys!591))))))

(declare-fun b!1573645 () Bool)

(declare-fun res!1075120 () Bool)

(assert (=> b!1573645 (=> (not res!1075120) (not e!877537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573645 (= res!1075120 (validKeyInArray!0 (select (arr!50693 _keys!591) i!537)))))

(declare-fun b!1573646 () Bool)

(assert (=> b!1573646 (= e!877537 (not (bvsge mask!877 #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!105084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573646 (arrayContainsKey!0 _keys!591 (select (arr!50693 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51929 0))(
  ( (Unit!51930) )
))
(declare-fun lt!674385 () Unit!51929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105084 (_ BitVec 64) (_ BitVec 32)) Unit!51929)

(assert (=> b!1573646 (= lt!674385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50693 _keys!591) i!537) i!537))))

(assert (= (and start!135378 res!1075122) b!1573644))

(assert (= (and b!1573644 res!1075121) b!1573645))

(assert (= (and b!1573645 res!1075120) b!1573646))

(declare-fun m!1446249 () Bool)

(assert (=> start!135378 m!1446249))

(declare-fun m!1446251 () Bool)

(assert (=> start!135378 m!1446251))

(declare-fun m!1446253 () Bool)

(assert (=> b!1573645 m!1446253))

(assert (=> b!1573645 m!1446253))

(declare-fun m!1446255 () Bool)

(assert (=> b!1573645 m!1446255))

(assert (=> b!1573646 m!1446253))

(assert (=> b!1573646 m!1446253))

(declare-fun m!1446257 () Bool)

(assert (=> b!1573646 m!1446257))

(assert (=> b!1573646 m!1446253))

(declare-fun m!1446259 () Bool)

(assert (=> b!1573646 m!1446259))

(check-sat (not b!1573645) (not start!135378) (not b!1573646))
(check-sat)
