; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135424 () Bool)

(assert start!135424)

(declare-fun res!1075249 () Bool)

(declare-fun e!877736 () Bool)

(assert (=> start!135424 (=> (not res!1075249) (not e!877736))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135424 (= res!1075249 (validMask!0 mask!877))))

(assert (=> start!135424 e!877736))

(assert (=> start!135424 true))

(declare-datatypes ((array!105155 0))(
  ( (array!105156 (arr!50728 (Array (_ BitVec 32) (_ BitVec 64))) (size!51278 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105155)

(declare-fun array_inv!39455 (array!105155) Bool)

(assert (=> start!135424 (array_inv!39455 _keys!591)))

(declare-fun b!1573957 () Bool)

(declare-fun res!1075250 () Bool)

(assert (=> b!1573957 (=> (not res!1075250) (not e!877736))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573957 (= res!1075250 (and (= (size!51278 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51278 _keys!591)) (bvslt i!537 (size!51278 _keys!591))))))

(declare-fun b!1573958 () Bool)

(declare-fun res!1075251 () Bool)

(assert (=> b!1573958 (=> (not res!1075251) (not e!877736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573958 (= res!1075251 (validKeyInArray!0 (select (arr!50728 _keys!591) i!537)))))

(declare-fun b!1573959 () Bool)

(assert (=> b!1573959 (= e!877736 (not (bvsge mask!877 #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!105155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573959 (arrayContainsKey!0 _keys!591 (select (arr!50728 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52120 0))(
  ( (Unit!52121) )
))
(declare-fun lt!674671 () Unit!52120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105155 (_ BitVec 64) (_ BitVec 32)) Unit!52120)

(assert (=> b!1573959 (= lt!674671 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50728 _keys!591) i!537) i!537))))

(assert (= (and start!135424 res!1075249) b!1573957))

(assert (= (and b!1573957 res!1075250) b!1573958))

(assert (= (and b!1573958 res!1075251) b!1573959))

(declare-fun m!1447141 () Bool)

(assert (=> start!135424 m!1447141))

(declare-fun m!1447143 () Bool)

(assert (=> start!135424 m!1447143))

(declare-fun m!1447145 () Bool)

(assert (=> b!1573958 m!1447145))

(assert (=> b!1573958 m!1447145))

(declare-fun m!1447147 () Bool)

(assert (=> b!1573958 m!1447147))

(assert (=> b!1573959 m!1447145))

(assert (=> b!1573959 m!1447145))

(declare-fun m!1447149 () Bool)

(assert (=> b!1573959 m!1447149))

(assert (=> b!1573959 m!1447145))

(declare-fun m!1447151 () Bool)

(assert (=> b!1573959 m!1447151))

(push 1)

(assert (not b!1573959))

(assert (not b!1573958))

(assert (not start!135424))

(check-sat)

(pop 1)

