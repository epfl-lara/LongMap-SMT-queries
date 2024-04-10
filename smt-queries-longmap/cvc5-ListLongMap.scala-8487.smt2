; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103440 () Bool)

(assert start!103440)

(declare-fun res!827559 () Bool)

(declare-fun e!702962 () Bool)

(assert (=> start!103440 (=> (not res!827559) (not e!702962))))

(declare-datatypes ((array!79922 0))(
  ( (array!79923 (arr!38558 (Array (_ BitVec 32) (_ BitVec 64))) (size!39094 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79922)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103440 (= res!827559 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39094 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39094 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103440 e!702962))

(assert (=> start!103440 true))

(declare-fun array_inv!29406 (array!79922) Bool)

(assert (=> start!103440 (array_inv!29406 a!3575)))

(declare-fun b!1240273 () Bool)

(declare-fun res!827560 () Bool)

(assert (=> b!1240273 (=> (not res!827560) (not e!702962))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240273 (= res!827560 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240274 () Bool)

(assert (=> b!1240274 (= e!702962 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) (size!39094 a!3575))))))

(assert (= (and start!103440 res!827559) b!1240273))

(assert (= (and b!1240273 res!827560) b!1240274))

(declare-fun m!1143613 () Bool)

(assert (=> start!103440 m!1143613))

(declare-fun m!1143615 () Bool)

(assert (=> b!1240273 m!1143615))

(push 1)

(assert (not b!1240273))

(assert (not start!103440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

