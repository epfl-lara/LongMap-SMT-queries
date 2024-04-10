; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103420 () Bool)

(assert start!103420)

(declare-fun b!1240196 () Bool)

(declare-fun e!702902 () Bool)

(declare-fun newFrom!281 () (_ BitVec 32))

(declare-datatypes ((array!79902 0))(
  ( (array!79903 (arr!38548 (Array (_ BitVec 32) (_ BitVec 64))) (size!39084 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79902)

(assert (=> b!1240196 (= e!702902 (not (bvslt newFrom!281 (size!39084 a!3575))))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240196 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41217 0))(
  ( (Unit!41218) )
))
(declare-fun lt!561905 () Unit!41217)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79902 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41217)

(assert (=> b!1240196 (= lt!561905 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240195 () Bool)

(declare-fun res!827481 () Bool)

(assert (=> b!1240195 (=> (not res!827481) (not e!702902))))

(assert (=> b!1240195 (= res!827481 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun res!827479 () Bool)

(assert (=> start!103420 (=> (not res!827479) (not e!702902))))

(assert (=> start!103420 (= res!827479 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39084 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39084 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103420 e!702902))

(assert (=> start!103420 true))

(declare-fun array_inv!29396 (array!79902) Bool)

(assert (=> start!103420 (array_inv!29396 a!3575)))

(declare-fun b!1240194 () Bool)

(declare-fun res!827480 () Bool)

(assert (=> b!1240194 (=> (not res!827480) (not e!702902))))

(assert (=> b!1240194 (= res!827480 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39084 a!3575))))))

(declare-fun b!1240193 () Bool)

(declare-fun res!827482 () Bool)

(assert (=> b!1240193 (=> (not res!827482) (not e!702902))))

(assert (=> b!1240193 (= res!827482 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(assert (= (and start!103420 res!827479) b!1240193))

(assert (= (and b!1240193 res!827482) b!1240194))

(assert (= (and b!1240194 res!827480) b!1240195))

(assert (= (and b!1240195 res!827481) b!1240196))

(declare-fun m!1143549 () Bool)

(assert (=> b!1240196 m!1143549))

(declare-fun m!1143551 () Bool)

(assert (=> b!1240196 m!1143551))

(declare-fun m!1143553 () Bool)

(assert (=> b!1240195 m!1143553))

(declare-fun m!1143555 () Bool)

(assert (=> start!103420 m!1143555))

(declare-fun m!1143557 () Bool)

(assert (=> b!1240193 m!1143557))

(push 1)

(assert (not b!1240196))

(assert (not start!103420))

(assert (not b!1240195))

(assert (not b!1240193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

