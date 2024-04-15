; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103438 () Bool)

(assert start!103438)

(declare-fun res!827527 () Bool)

(declare-fun e!702925 () Bool)

(assert (=> start!103438 (=> (not res!827527) (not e!702925))))

(declare-datatypes ((array!79847 0))(
  ( (array!79848 (arr!38521 (Array (_ BitVec 32) (_ BitVec 64))) (size!39059 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79847)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103438 (= res!827527 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39059 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39059 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103438 e!702925))

(assert (=> start!103438 true))

(declare-fun array_inv!29504 (array!79847) Bool)

(assert (=> start!103438 (array_inv!29504 a!3575)))

(declare-fun b!1240199 () Bool)

(declare-fun res!827528 () Bool)

(assert (=> b!1240199 (=> (not res!827528) (not e!702925))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240199 (= res!827528 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240200 () Bool)

(assert (=> b!1240200 (= e!702925 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) (size!39059 a!3575))))))

(assert (= (and start!103438 res!827527) b!1240199))

(assert (= (and b!1240199 res!827528) b!1240200))

(declare-fun m!1143097 () Bool)

(assert (=> start!103438 m!1143097))

(declare-fun m!1143099 () Bool)

(assert (=> b!1240199 m!1143099))

(push 1)

(assert (not b!1240199))

(assert (not start!103438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

