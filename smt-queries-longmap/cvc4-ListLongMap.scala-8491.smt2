; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103714 () Bool)

(assert start!103714)

(declare-fun res!828244 () Bool)

(declare-fun e!703927 () Bool)

(assert (=> start!103714 (=> (not res!828244) (not e!703927))))

(declare-datatypes ((array!79986 0))(
  ( (array!79987 (arr!38583 (Array (_ BitVec 32) (_ BitVec 64))) (size!39120 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79986)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103714 (= res!828244 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39120 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39120 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103714 e!703927))

(assert (=> start!103714 true))

(declare-fun array_inv!29521 (array!79986) Bool)

(assert (=> start!103714 (array_inv!29521 a!3575)))

(declare-fun b!1241749 () Bool)

(declare-fun res!828246 () Bool)

(assert (=> b!1241749 (=> (not res!828246) (not e!703927))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241749 (= res!828246 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1241750 () Bool)

(declare-fun res!828245 () Bool)

(assert (=> b!1241750 (=> (not res!828245) (not e!703927))))

(assert (=> b!1241750 (= res!828245 (bvsle from!2953 newFrom!281))))

(declare-fun b!1241751 () Bool)

(assert (=> b!1241751 (= e!703927 (not (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))))

(assert (= (and start!103714 res!828244) b!1241749))

(assert (= (and b!1241749 res!828246) b!1241750))

(assert (= (and b!1241750 res!828245) b!1241751))

(declare-fun m!1145365 () Bool)

(assert (=> start!103714 m!1145365))

(declare-fun m!1145367 () Bool)

(assert (=> b!1241749 m!1145367))

(declare-fun m!1145369 () Bool)

(assert (=> b!1241751 m!1145369))

(push 1)

(assert (not b!1241751))

(assert (not b!1241749))

(assert (not start!103714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

