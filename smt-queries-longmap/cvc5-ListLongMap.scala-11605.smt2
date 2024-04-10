; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135436 () Bool)

(assert start!135436)

(declare-fun res!1075304 () Bool)

(declare-fun e!877771 () Bool)

(assert (=> start!135436 (=> (not res!1075304) (not e!877771))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135436 (= res!1075304 (validMask!0 mask!877))))

(assert (=> start!135436 e!877771))

(assert (=> start!135436 true))

(declare-datatypes ((array!105167 0))(
  ( (array!105168 (arr!50734 (Array (_ BitVec 32) (_ BitVec 64))) (size!51284 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105167)

(declare-fun array_inv!39461 (array!105167) Bool)

(assert (=> start!135436 (array_inv!39461 _keys!591)))

(declare-fun b!1574011 () Bool)

(declare-fun res!1075303 () Bool)

(assert (=> b!1574011 (=> (not res!1075303) (not e!877771))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574011 (= res!1075303 (and (= (size!51284 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51284 _keys!591)) (bvslt i!537 (size!51284 _keys!591))))))

(declare-fun b!1574012 () Bool)

(declare-fun res!1075305 () Bool)

(assert (=> b!1574012 (=> (not res!1075305) (not e!877771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574012 (= res!1075305 (validKeyInArray!0 (select (arr!50734 _keys!591) i!537)))))

(declare-fun b!1574013 () Bool)

(assert (=> b!1574013 (= e!877771 (not true))))

(declare-fun arrayContainsKey!0 (array!105167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574013 (arrayContainsKey!0 _keys!591 (select (arr!50734 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52132 0))(
  ( (Unit!52133) )
))
(declare-fun lt!674689 () Unit!52132)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105167 (_ BitVec 64) (_ BitVec 32)) Unit!52132)

(assert (=> b!1574013 (= lt!674689 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50734 _keys!591) i!537) i!537))))

(assert (= (and start!135436 res!1075304) b!1574011))

(assert (= (and b!1574011 res!1075303) b!1574012))

(assert (= (and b!1574012 res!1075305) b!1574013))

(declare-fun m!1447213 () Bool)

(assert (=> start!135436 m!1447213))

(declare-fun m!1447215 () Bool)

(assert (=> start!135436 m!1447215))

(declare-fun m!1447217 () Bool)

(assert (=> b!1574012 m!1447217))

(assert (=> b!1574012 m!1447217))

(declare-fun m!1447219 () Bool)

(assert (=> b!1574012 m!1447219))

(assert (=> b!1574013 m!1447217))

(assert (=> b!1574013 m!1447217))

(declare-fun m!1447221 () Bool)

(assert (=> b!1574013 m!1447221))

(assert (=> b!1574013 m!1447217))

(declare-fun m!1447223 () Bool)

(assert (=> b!1574013 m!1447223))

(push 1)

(assert (not b!1574012))

(assert (not b!1574013))

(assert (not start!135436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

