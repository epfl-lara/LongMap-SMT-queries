; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103444 () Bool)

(assert start!103444)

(declare-fun res!827571 () Bool)

(declare-fun e!702974 () Bool)

(assert (=> start!103444 (=> (not res!827571) (not e!702974))))

(declare-datatypes ((array!79926 0))(
  ( (array!79927 (arr!38560 (Array (_ BitVec 32) (_ BitVec 64))) (size!39096 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79926)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103444 (= res!827571 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39096 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39096 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103444 e!702974))

(assert (=> start!103444 true))

(declare-fun array_inv!29408 (array!79926) Bool)

(assert (=> start!103444 (array_inv!29408 a!3575)))

(declare-fun b!1240285 () Bool)

(declare-fun res!827572 () Bool)

(assert (=> b!1240285 (=> (not res!827572) (not e!702974))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240285 (= res!827572 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240286 () Bool)

(assert (=> b!1240286 (= e!702974 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) (size!39096 a!3575))))))

(assert (= (and start!103444 res!827571) b!1240285))

(assert (= (and b!1240285 res!827572) b!1240286))

(declare-fun m!1143621 () Bool)

(assert (=> start!103444 m!1143621))

(declare-fun m!1143623 () Bool)

(assert (=> b!1240285 m!1143623))

(push 1)

(assert (not start!103444))

(assert (not b!1240285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

