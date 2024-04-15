; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103460 () Bool)

(assert start!103460)

(declare-fun b!1240285 () Bool)

(declare-fun e!702983 () Bool)

(declare-fun from!2953 () (_ BitVec 32))

(assert (=> b!1240285 (= e!702983 (bvsge (bvsub from!2953 #b00000000000000000000000000000001) from!2953))))

(declare-fun res!827610 () Bool)

(assert (=> start!103460 (=> (not res!827610) (not e!702983))))

(declare-datatypes ((array!79861 0))(
  ( (array!79862 (arr!38527 (Array (_ BitVec 32) (_ BitVec 64))) (size!39065 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79861)

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103460 (= res!827610 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39065 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39065 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103460 e!702983))

(assert (=> start!103460 true))

(declare-fun array_inv!29510 (array!79861) Bool)

(assert (=> start!103460 (array_inv!29510 a!3575)))

(declare-fun b!1240284 () Bool)

(declare-fun res!827611 () Bool)

(assert (=> b!1240284 (=> (not res!827611) (not e!702983))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240284 (= res!827611 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240282 () Bool)

(declare-fun res!827612 () Bool)

(assert (=> b!1240282 (=> (not res!827612) (not e!702983))))

(assert (=> b!1240282 (= res!827612 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240283 () Bool)

(declare-fun res!827613 () Bool)

(assert (=> b!1240283 (=> (not res!827613) (not e!702983))))

(assert (=> b!1240283 (= res!827613 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39065 a!3575))))))

(assert (= (and start!103460 res!827610) b!1240282))

(assert (= (and b!1240282 res!827612) b!1240283))

(assert (= (and b!1240283 res!827613) b!1240284))

(assert (= (and b!1240284 res!827611) b!1240285))

(declare-fun m!1143147 () Bool)

(assert (=> start!103460 m!1143147))

(declare-fun m!1143149 () Bool)

(assert (=> b!1240284 m!1143149))

(declare-fun m!1143151 () Bool)

(assert (=> b!1240282 m!1143151))

(push 1)

(assert (not b!1240282))

(assert (not start!103460))

(assert (not b!1240284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

