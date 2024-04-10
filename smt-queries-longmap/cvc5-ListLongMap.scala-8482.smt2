; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103410 () Bool)

(assert start!103410)

(declare-fun b!1240134 () Bool)

(declare-fun res!827420 () Bool)

(declare-fun e!702873 () Bool)

(assert (=> b!1240134 (=> (not res!827420) (not e!702873))))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(declare-datatypes ((array!79892 0))(
  ( (array!79893 (arr!38543 (Array (_ BitVec 32) (_ BitVec 64))) (size!39079 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79892)

(assert (=> b!1240134 (= res!827420 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39079 a!3575))))))

(declare-fun b!1240136 () Bool)

(assert (=> b!1240136 (= e!702873 (not true))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240136 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41207 0))(
  ( (Unit!41208) )
))
(declare-fun lt!561890 () Unit!41207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79892 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41207)

(assert (=> b!1240136 (= lt!561890 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240135 () Bool)

(declare-fun res!827421 () Bool)

(assert (=> b!1240135 (=> (not res!827421) (not e!702873))))

(assert (=> b!1240135 (= res!827421 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun res!827422 () Bool)

(assert (=> start!103410 (=> (not res!827422) (not e!702873))))

(assert (=> start!103410 (= res!827422 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39079 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39079 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103410 e!702873))

(assert (=> start!103410 true))

(declare-fun array_inv!29391 (array!79892) Bool)

(assert (=> start!103410 (array_inv!29391 a!3575)))

(declare-fun b!1240133 () Bool)

(declare-fun res!827419 () Bool)

(assert (=> b!1240133 (=> (not res!827419) (not e!702873))))

(assert (=> b!1240133 (= res!827419 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(assert (= (and start!103410 res!827422) b!1240133))

(assert (= (and b!1240133 res!827419) b!1240134))

(assert (= (and b!1240134 res!827420) b!1240135))

(assert (= (and b!1240135 res!827421) b!1240136))

(declare-fun m!1143499 () Bool)

(assert (=> b!1240136 m!1143499))

(declare-fun m!1143501 () Bool)

(assert (=> b!1240136 m!1143501))

(declare-fun m!1143503 () Bool)

(assert (=> b!1240135 m!1143503))

(declare-fun m!1143505 () Bool)

(assert (=> start!103410 m!1143505))

(declare-fun m!1143507 () Bool)

(assert (=> b!1240133 m!1143507))

(push 1)

(assert (not start!103410))

(assert (not b!1240135))

(assert (not b!1240133))

(assert (not b!1240136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

