; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103650 () Bool)

(assert start!103650)

(declare-fun b!1241469 () Bool)

(declare-fun res!827966 () Bool)

(declare-fun e!703742 () Bool)

(assert (=> b!1241469 (=> (not res!827966) (not e!703742))))

(declare-datatypes ((array!79930 0))(
  ( (array!79931 (arr!38556 (Array (_ BitVec 32) (_ BitVec 64))) (size!39093 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79930)

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241469 (= res!827966 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1241472 () Bool)

(assert (=> b!1241472 (= e!703742 (not true))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1241472 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41182 0))(
  ( (Unit!41183) )
))
(declare-fun lt!562379 () Unit!41182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79930 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41182)

(assert (=> b!1241472 (= lt!562379 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1241471 () Bool)

(declare-fun res!827967 () Bool)

(assert (=> b!1241471 (=> (not res!827967) (not e!703742))))

(assert (=> b!1241471 (= res!827967 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1241470 () Bool)

(declare-fun res!827964 () Bool)

(assert (=> b!1241470 (=> (not res!827964) (not e!703742))))

(assert (=> b!1241470 (= res!827964 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39093 a!3575))))))

(declare-fun res!827965 () Bool)

(assert (=> start!103650 (=> (not res!827965) (not e!703742))))

(assert (=> start!103650 (= res!827965 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39093 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39093 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103650 e!703742))

(assert (=> start!103650 true))

(declare-fun array_inv!29494 (array!79930) Bool)

(assert (=> start!103650 (array_inv!29494 a!3575)))

(assert (= (and start!103650 res!827965) b!1241469))

(assert (= (and b!1241469 res!827966) b!1241470))

(assert (= (and b!1241470 res!827964) b!1241471))

(assert (= (and b!1241471 res!827967) b!1241472))

(declare-fun m!1145157 () Bool)

(assert (=> b!1241469 m!1145157))

(declare-fun m!1145159 () Bool)

(assert (=> b!1241472 m!1145159))

(declare-fun m!1145161 () Bool)

(assert (=> b!1241472 m!1145161))

(declare-fun m!1145163 () Bool)

(assert (=> b!1241471 m!1145163))

(declare-fun m!1145165 () Bool)

(assert (=> start!103650 m!1145165))

(push 1)

(assert (not b!1241472))

(assert (not start!103650))

(assert (not b!1241471))

(assert (not b!1241469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

