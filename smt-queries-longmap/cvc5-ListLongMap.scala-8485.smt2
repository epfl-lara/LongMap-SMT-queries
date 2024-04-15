; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103426 () Bool)

(assert start!103426)

(declare-fun res!827491 () Bool)

(declare-fun e!702889 () Bool)

(assert (=> start!103426 (=> (not res!827491) (not e!702889))))

(declare-datatypes ((array!79835 0))(
  ( (array!79836 (arr!38515 (Array (_ BitVec 32) (_ BitVec 64))) (size!39053 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79835)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103426 (= res!827491 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39053 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39053 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103426 e!702889))

(assert (=> start!103426 true))

(declare-fun array_inv!29498 (array!79835) Bool)

(assert (=> start!103426 (array_inv!29498 a!3575)))

(declare-fun b!1240163 () Bool)

(declare-fun res!827492 () Bool)

(assert (=> b!1240163 (=> (not res!827492) (not e!702889))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240163 (= res!827492 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240164 () Bool)

(assert (=> b!1240164 (= e!702889 (and (bvsle from!2953 newFrom!281) (bvsge newFrom!281 (size!39053 a!3575))))))

(assert (= (and start!103426 res!827491) b!1240163))

(assert (= (and b!1240163 res!827492) b!1240164))

(declare-fun m!1143073 () Bool)

(assert (=> start!103426 m!1143073))

(declare-fun m!1143075 () Bool)

(assert (=> b!1240163 m!1143075))

(push 1)

(assert (not b!1240163))

(assert (not start!103426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

