; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103470 () Bool)

(assert start!103470)

(declare-fun res!827669 () Bool)

(declare-fun e!703041 () Bool)

(assert (=> start!103470 (=> (not res!827669) (not e!703041))))

(declare-datatypes ((array!79943 0))(
  ( (array!79944 (arr!38567 (Array (_ BitVec 32) (_ BitVec 64))) (size!39103 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79943)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103470 (= res!827669 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39103 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39103 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103470 e!703041))

(assert (=> start!103470 true))

(declare-fun array_inv!29415 (array!79943) Bool)

(assert (=> start!103470 (array_inv!29415 a!3575)))

(declare-fun b!1240382 () Bool)

(declare-fun res!827670 () Bool)

(assert (=> b!1240382 (=> (not res!827670) (not e!703041))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240382 (= res!827670 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240383 () Bool)

(declare-fun res!827668 () Bool)

(assert (=> b!1240383 (=> (not res!827668) (not e!703041))))

(assert (=> b!1240383 (= res!827668 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39103 a!3575))))))

(declare-fun b!1240385 () Bool)

(assert (=> b!1240385 (= e!703041 (not true))))

(assert (=> b!1240385 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41225 0))(
  ( (Unit!41226) )
))
(declare-fun lt!561917 () Unit!41225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79943 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41225)

(assert (=> b!1240385 (= lt!561917 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240384 () Bool)

(declare-fun res!827671 () Bool)

(assert (=> b!1240384 (=> (not res!827671) (not e!703041))))

(assert (=> b!1240384 (= res!827671 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(assert (= (and start!103470 res!827669) b!1240382))

(assert (= (and b!1240382 res!827670) b!1240383))

(assert (= (and b!1240383 res!827668) b!1240384))

(assert (= (and b!1240384 res!827671) b!1240385))

(declare-fun m!1143685 () Bool)

(assert (=> start!103470 m!1143685))

(declare-fun m!1143687 () Bool)

(assert (=> b!1240382 m!1143687))

(declare-fun m!1143689 () Bool)

(assert (=> b!1240385 m!1143689))

(declare-fun m!1143691 () Bool)

(assert (=> b!1240385 m!1143691))

(declare-fun m!1143693 () Bool)

(assert (=> b!1240384 m!1143693))

(push 1)

(assert (not b!1240382))

(assert (not b!1240385))

(assert (not start!103470))

(assert (not b!1240384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

