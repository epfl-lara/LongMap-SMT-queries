; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103416 () Bool)

(assert start!103416)

(declare-fun b!1240172 () Bool)

(declare-fun e!702890 () Bool)

(declare-fun newFrom!281 () (_ BitVec 32))

(declare-datatypes ((array!79898 0))(
  ( (array!79899 (arr!38546 (Array (_ BitVec 32) (_ BitVec 64))) (size!39082 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79898)

(assert (=> b!1240172 (= e!702890 (not (bvslt newFrom!281 (size!39082 a!3575))))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240172 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-fun from!2953 () (_ BitVec 32))

(declare-datatypes ((Unit!41213 0))(
  ( (Unit!41214) )
))
(declare-fun lt!561899 () Unit!41213)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79898 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41213)

(assert (=> b!1240172 (= lt!561899 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240170 () Bool)

(declare-fun res!827455 () Bool)

(assert (=> b!1240170 (=> (not res!827455) (not e!702890))))

(assert (=> b!1240170 (= res!827455 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39082 a!3575))))))

(declare-fun b!1240171 () Bool)

(declare-fun res!827456 () Bool)

(assert (=> b!1240171 (=> (not res!827456) (not e!702890))))

(assert (=> b!1240171 (= res!827456 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun res!827457 () Bool)

(assert (=> start!103416 (=> (not res!827457) (not e!702890))))

(assert (=> start!103416 (= res!827457 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39082 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39082 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103416 e!702890))

(assert (=> start!103416 true))

(declare-fun array_inv!29394 (array!79898) Bool)

(assert (=> start!103416 (array_inv!29394 a!3575)))

(declare-fun b!1240169 () Bool)

(declare-fun res!827458 () Bool)

(assert (=> b!1240169 (=> (not res!827458) (not e!702890))))

(assert (=> b!1240169 (= res!827458 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(assert (= (and start!103416 res!827457) b!1240169))

(assert (= (and b!1240169 res!827458) b!1240170))

(assert (= (and b!1240170 res!827455) b!1240171))

(assert (= (and b!1240171 res!827456) b!1240172))

(declare-fun m!1143529 () Bool)

(assert (=> b!1240172 m!1143529))

(declare-fun m!1143531 () Bool)

(assert (=> b!1240172 m!1143531))

(declare-fun m!1143533 () Bool)

(assert (=> b!1240171 m!1143533))

(declare-fun m!1143535 () Bool)

(assert (=> start!103416 m!1143535))

(declare-fun m!1143537 () Bool)

(assert (=> b!1240169 m!1143537))

(push 1)

(assert (not b!1240169))

(assert (not b!1240172))

(assert (not start!103416))

(assert (not b!1240171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

