; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103472 () Bool)

(assert start!103472)

(declare-fun res!827676 () Bool)

(declare-fun e!703020 () Bool)

(assert (=> start!103472 (=> (not res!827676) (not e!703020))))

(declare-datatypes ((array!79873 0))(
  ( (array!79874 (arr!38533 (Array (_ BitVec 32) (_ BitVec 64))) (size!39071 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79873)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103472 (= res!827676 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39071 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39071 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103472 e!703020))

(assert (=> start!103472 true))

(declare-fun array_inv!29516 (array!79873) Bool)

(assert (=> start!103472 (array_inv!29516 a!3575)))

(declare-fun b!1240346 () Bool)

(declare-fun res!827675 () Bool)

(assert (=> b!1240346 (=> (not res!827675) (not e!703020))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240346 (= res!827675 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240347 () Bool)

(declare-fun res!827674 () Bool)

(assert (=> b!1240347 (=> (not res!827674) (not e!703020))))

(assert (=> b!1240347 (= res!827674 (bvsle from!2953 newFrom!281))))

(declare-fun b!1240348 () Bool)

(assert (=> b!1240348 (= e!703020 (not (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))))

(assert (= (and start!103472 res!827676) b!1240346))

(assert (= (and b!1240346 res!827675) b!1240347))

(assert (= (and b!1240347 res!827674) b!1240348))

(declare-fun m!1143195 () Bool)

(assert (=> start!103472 m!1143195))

(declare-fun m!1143197 () Bool)

(assert (=> b!1240346 m!1143197))

(declare-fun m!1143199 () Bool)

(assert (=> b!1240348 m!1143199))

(push 1)

(assert (not start!103472))

(assert (not b!1240346))

(assert (not b!1240348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

