; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103428 () Bool)

(assert start!103428)

(declare-fun res!827523 () Bool)

(declare-fun e!702926 () Bool)

(assert (=> start!103428 (=> (not res!827523) (not e!702926))))

(declare-datatypes ((array!79910 0))(
  ( (array!79911 (arr!38552 (Array (_ BitVec 32) (_ BitVec 64))) (size!39088 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79910)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103428 (= res!827523 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39088 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39088 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103428 e!702926))

(assert (=> start!103428 true))

(declare-fun array_inv!29400 (array!79910) Bool)

(assert (=> start!103428 (array_inv!29400 a!3575)))

(declare-fun b!1240237 () Bool)

(declare-fun res!827524 () Bool)

(assert (=> b!1240237 (=> (not res!827524) (not e!702926))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240237 (= res!827524 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240238 () Bool)

(assert (=> b!1240238 (= e!702926 (and (bvsle from!2953 newFrom!281) (bvsge newFrom!281 (size!39088 a!3575))))))

(assert (= (and start!103428 res!827523) b!1240237))

(assert (= (and b!1240237 res!827524) b!1240238))

(declare-fun m!1143589 () Bool)

(assert (=> start!103428 m!1143589))

(declare-fun m!1143591 () Bool)

(assert (=> b!1240237 m!1143591))

(push 1)

(assert (not start!103428))

(assert (not b!1240237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

