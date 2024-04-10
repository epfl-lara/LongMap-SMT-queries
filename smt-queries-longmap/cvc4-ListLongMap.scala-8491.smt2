; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103480 () Bool)

(assert start!103480)

(declare-fun res!827721 () Bool)

(declare-fun e!703070 () Bool)

(assert (=> start!103480 (=> (not res!827721) (not e!703070))))

(declare-datatypes ((array!79953 0))(
  ( (array!79954 (arr!38572 (Array (_ BitVec 32) (_ BitVec 64))) (size!39108 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79953)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103480 (= res!827721 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39108 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39108 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103480 e!703070))

(assert (=> start!103480 true))

(declare-fun array_inv!29420 (array!79953) Bool)

(assert (=> start!103480 (array_inv!29420 a!3575)))

(declare-fun b!1240434 () Bool)

(declare-fun res!827722 () Bool)

(assert (=> b!1240434 (=> (not res!827722) (not e!703070))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240434 (= res!827722 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240435 () Bool)

(declare-fun res!827720 () Bool)

(assert (=> b!1240435 (=> (not res!827720) (not e!703070))))

(assert (=> b!1240435 (= res!827720 (bvsle from!2953 newFrom!281))))

(declare-fun b!1240436 () Bool)

(assert (=> b!1240436 (= e!703070 (not (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))))

(assert (= (and start!103480 res!827721) b!1240434))

(assert (= (and b!1240434 res!827722) b!1240435))

(assert (= (and b!1240435 res!827720) b!1240436))

(declare-fun m!1143727 () Bool)

(assert (=> start!103480 m!1143727))

(declare-fun m!1143729 () Bool)

(assert (=> b!1240434 m!1143729))

(declare-fun m!1143731 () Bool)

(assert (=> b!1240436 m!1143731))

(push 1)

(assert (not b!1240436))

(assert (not start!103480))

(assert (not b!1240434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

