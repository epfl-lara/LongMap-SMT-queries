; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103414 () Bool)

(assert start!103414)

(declare-fun b!1240109 () Bool)

(declare-fun res!827438 () Bool)

(declare-fun e!702853 () Bool)

(assert (=> b!1240109 (=> (not res!827438) (not e!702853))))

(declare-datatypes ((array!79823 0))(
  ( (array!79824 (arr!38509 (Array (_ BitVec 32) (_ BitVec 64))) (size!39047 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79823)

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240109 (= res!827438 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240108 () Bool)

(declare-fun res!827436 () Bool)

(assert (=> b!1240108 (=> (not res!827436) (not e!702853))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240108 (= res!827436 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39047 a!3575))))))

(declare-fun b!1240107 () Bool)

(declare-fun res!827435 () Bool)

(assert (=> b!1240107 (=> (not res!827435) (not e!702853))))

(assert (=> b!1240107 (= res!827435 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun res!827437 () Bool)

(assert (=> start!103414 (=> (not res!827437) (not e!702853))))

(assert (=> start!103414 (= res!827437 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39047 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39047 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103414 e!702853))

(assert (=> start!103414 true))

(declare-fun array_inv!29492 (array!79823) Bool)

(assert (=> start!103414 (array_inv!29492 a!3575)))

(declare-fun b!1240110 () Bool)

(assert (=> b!1240110 (= e!702853 (not (bvslt newFrom!281 (size!39047 a!3575))))))

(assert (=> b!1240110 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41062 0))(
  ( (Unit!41063) )
))
(declare-fun lt!561726 () Unit!41062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79823 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41062)

(assert (=> b!1240110 (= lt!561726 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(assert (= (and start!103414 res!827437) b!1240107))

(assert (= (and b!1240107 res!827435) b!1240108))

(assert (= (and b!1240108 res!827436) b!1240109))

(assert (= (and b!1240109 res!827438) b!1240110))

(declare-fun m!1143025 () Bool)

(assert (=> b!1240109 m!1143025))

(declare-fun m!1143027 () Bool)

(assert (=> b!1240107 m!1143027))

(declare-fun m!1143029 () Bool)

(assert (=> start!103414 m!1143029))

(declare-fun m!1143031 () Bool)

(assert (=> b!1240110 m!1143031))

(declare-fun m!1143033 () Bool)

(assert (=> b!1240110 m!1143033))

(push 1)

(assert (not b!1240110))

(assert (not start!103414))

(assert (not b!1240109))

(assert (not b!1240107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

