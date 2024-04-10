; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103422 () Bool)

(assert start!103422)

(declare-fun b!1240206 () Bool)

(declare-fun res!827491 () Bool)

(declare-fun e!702908 () Bool)

(assert (=> b!1240206 (=> (not res!827491) (not e!702908))))

(declare-datatypes ((array!79904 0))(
  ( (array!79905 (arr!38549 (Array (_ BitVec 32) (_ BitVec 64))) (size!39085 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79904)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240206 (= res!827491 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39085 a!3575))))))

(declare-fun b!1240208 () Bool)

(assert (=> b!1240208 (= e!702908 (not true))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240208 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41219 0))(
  ( (Unit!41220) )
))
(declare-fun lt!561908 () Unit!41219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79904 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41219)

(assert (=> b!1240208 (= lt!561908 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun res!827494 () Bool)

(assert (=> start!103422 (=> (not res!827494) (not e!702908))))

(assert (=> start!103422 (= res!827494 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39085 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39085 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103422 e!702908))

(assert (=> start!103422 true))

(declare-fun array_inv!29397 (array!79904) Bool)

(assert (=> start!103422 (array_inv!29397 a!3575)))

(declare-fun b!1240205 () Bool)

(declare-fun res!827492 () Bool)

(assert (=> b!1240205 (=> (not res!827492) (not e!702908))))

(assert (=> b!1240205 (= res!827492 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240207 () Bool)

(declare-fun res!827493 () Bool)

(assert (=> b!1240207 (=> (not res!827493) (not e!702908))))

(assert (=> b!1240207 (= res!827493 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(assert (= (and start!103422 res!827494) b!1240205))

(assert (= (and b!1240205 res!827492) b!1240206))

(assert (= (and b!1240206 res!827491) b!1240207))

(assert (= (and b!1240207 res!827493) b!1240208))

(declare-fun m!1143559 () Bool)

(assert (=> b!1240208 m!1143559))

(declare-fun m!1143561 () Bool)

(assert (=> b!1240208 m!1143561))

(declare-fun m!1143563 () Bool)

(assert (=> start!103422 m!1143563))

(declare-fun m!1143565 () Bool)

(assert (=> b!1240205 m!1143565))

(declare-fun m!1143567 () Bool)

(assert (=> b!1240207 m!1143567))

(push 1)

(assert (not b!1240208))

(assert (not start!103422))

(assert (not b!1240207))

(assert (not b!1240205))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

