; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103682 () Bool)

(assert start!103682)

(declare-fun res!828104 () Bool)

(declare-fun e!703837 () Bool)

(assert (=> start!103682 (=> (not res!828104) (not e!703837))))

(declare-datatypes ((array!79962 0))(
  ( (array!79963 (arr!38572 (Array (_ BitVec 32) (_ BitVec 64))) (size!39109 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79962)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103682 (= res!828104 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39109 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39109 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103682 e!703837))

(assert (=> start!103682 true))

(declare-fun array_inv!29510 (array!79962) Bool)

(assert (=> start!103682 (array_inv!29510 a!3575)))

(declare-fun b!1241609 () Bool)

(declare-fun res!828105 () Bool)

(assert (=> b!1241609 (=> (not res!828105) (not e!703837))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241609 (= res!828105 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1241610 () Bool)

(assert (=> b!1241610 (= e!703837 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) (size!39109 a!3575))))))

(assert (= (and start!103682 res!828104) b!1241609))

(assert (= (and b!1241609 res!828105) b!1241610))

(declare-fun m!1145269 () Bool)

(assert (=> start!103682 m!1145269))

(declare-fun m!1145271 () Bool)

(assert (=> b!1241609 m!1145271))

(push 1)

(assert (not start!103682))

(assert (not b!1241609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

