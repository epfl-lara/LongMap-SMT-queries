; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103464 () Bool)

(assert start!103464)

(declare-fun b!1240346 () Bool)

(declare-fun res!827634 () Bool)

(declare-fun e!703022 () Bool)

(assert (=> b!1240346 (=> (not res!827634) (not e!703022))))

(declare-datatypes ((array!79937 0))(
  ( (array!79938 (arr!38564 (Array (_ BitVec 32) (_ BitVec 64))) (size!39100 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79937)

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240346 (= res!827634 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240348 () Bool)

(declare-fun res!827632 () Bool)

(assert (=> b!1240348 (=> (not res!827632) (not e!703022))))

(assert (=> b!1240348 (= res!827632 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240349 () Bool)

(assert (=> b!1240349 (= e!703022 (bvsge (bvsub from!2953 #b00000000000000000000000000000001) from!2953))))

(declare-fun b!1240347 () Bool)

(declare-fun res!827633 () Bool)

(assert (=> b!1240347 (=> (not res!827633) (not e!703022))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240347 (= res!827633 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39100 a!3575))))))

(declare-fun res!827635 () Bool)

(assert (=> start!103464 (=> (not res!827635) (not e!703022))))

(assert (=> start!103464 (= res!827635 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39100 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39100 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103464 e!703022))

(assert (=> start!103464 true))

(declare-fun array_inv!29412 (array!79937) Bool)

(assert (=> start!103464 (array_inv!29412 a!3575)))

(assert (= (and start!103464 res!827635) b!1240346))

(assert (= (and b!1240346 res!827634) b!1240347))

(assert (= (and b!1240347 res!827633) b!1240348))

(assert (= (and b!1240348 res!827632) b!1240349))

(declare-fun m!1143667 () Bool)

(assert (=> b!1240346 m!1143667))

(declare-fun m!1143669 () Bool)

(assert (=> b!1240348 m!1143669))

(declare-fun m!1143671 () Bool)

(assert (=> start!103464 m!1143671))

(push 1)

(assert (not start!103464))

(assert (not b!1240346))

(assert (not b!1240348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

