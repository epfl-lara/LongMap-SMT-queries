; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135420 () Bool)

(assert start!135420)

(declare-fun res!1075231 () Bool)

(declare-fun e!877724 () Bool)

(assert (=> start!135420 (=> (not res!1075231) (not e!877724))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135420 (= res!1075231 (validMask!0 mask!877))))

(assert (=> start!135420 e!877724))

(assert (=> start!135420 true))

(declare-datatypes ((array!105151 0))(
  ( (array!105152 (arr!50726 (Array (_ BitVec 32) (_ BitVec 64))) (size!51276 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105151)

(declare-fun array_inv!39453 (array!105151) Bool)

(assert (=> start!135420 (array_inv!39453 _keys!591)))

(declare-fun b!1573939 () Bool)

(declare-fun res!1075232 () Bool)

(assert (=> b!1573939 (=> (not res!1075232) (not e!877724))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573939 (= res!1075232 (and (= (size!51276 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51276 _keys!591)) (bvslt i!537 (size!51276 _keys!591))))))

(declare-fun b!1573940 () Bool)

(declare-fun res!1075233 () Bool)

(assert (=> b!1573940 (=> (not res!1075233) (not e!877724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573940 (= res!1075233 (validKeyInArray!0 (select (arr!50726 _keys!591) i!537)))))

(declare-fun b!1573941 () Bool)

(assert (=> b!1573941 (= e!877724 (not true))))

(declare-fun arrayContainsKey!0 (array!105151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573941 (arrayContainsKey!0 _keys!591 (select (arr!50726 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52116 0))(
  ( (Unit!52117) )
))
(declare-fun lt!674665 () Unit!52116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105151 (_ BitVec 64) (_ BitVec 32)) Unit!52116)

(assert (=> b!1573941 (= lt!674665 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50726 _keys!591) i!537) i!537))))

(assert (= (and start!135420 res!1075231) b!1573939))

(assert (= (and b!1573939 res!1075232) b!1573940))

(assert (= (and b!1573940 res!1075233) b!1573941))

(declare-fun m!1447117 () Bool)

(assert (=> start!135420 m!1447117))

(declare-fun m!1447119 () Bool)

(assert (=> start!135420 m!1447119))

(declare-fun m!1447121 () Bool)

(assert (=> b!1573940 m!1447121))

(assert (=> b!1573940 m!1447121))

(declare-fun m!1447123 () Bool)

(assert (=> b!1573940 m!1447123))

(assert (=> b!1573941 m!1447121))

(assert (=> b!1573941 m!1447121))

(declare-fun m!1447125 () Bool)

(assert (=> b!1573941 m!1447125))

(assert (=> b!1573941 m!1447121))

(declare-fun m!1447127 () Bool)

(assert (=> b!1573941 m!1447127))

(check-sat (not b!1573940) (not start!135420) (not b!1573941))
