; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103426 () Bool)

(assert start!103426)

(declare-fun b!1240230 () Bool)

(declare-fun res!827517 () Bool)

(declare-fun e!702921 () Bool)

(assert (=> b!1240230 (=> (not res!827517) (not e!702921))))

(declare-datatypes ((array!79908 0))(
  ( (array!79909 (arr!38551 (Array (_ BitVec 32) (_ BitVec 64))) (size!39087 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79908)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240230 (= res!827517 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39087 a!3575))))))

(declare-fun b!1240232 () Bool)

(assert (=> b!1240232 (= e!702921 (not true))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240232 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41223 0))(
  ( (Unit!41224) )
))
(declare-fun lt!561914 () Unit!41223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79908 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41223)

(assert (=> b!1240232 (= lt!561914 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240231 () Bool)

(declare-fun res!827518 () Bool)

(assert (=> b!1240231 (=> (not res!827518) (not e!702921))))

(assert (=> b!1240231 (= res!827518 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240229 () Bool)

(declare-fun res!827515 () Bool)

(assert (=> b!1240229 (=> (not res!827515) (not e!702921))))

(assert (=> b!1240229 (= res!827515 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun res!827516 () Bool)

(assert (=> start!103426 (=> (not res!827516) (not e!702921))))

(assert (=> start!103426 (= res!827516 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39087 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39087 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103426 e!702921))

(assert (=> start!103426 true))

(declare-fun array_inv!29399 (array!79908) Bool)

(assert (=> start!103426 (array_inv!29399 a!3575)))

(assert (= (and start!103426 res!827516) b!1240229))

(assert (= (and b!1240229 res!827515) b!1240230))

(assert (= (and b!1240230 res!827517) b!1240231))

(assert (= (and b!1240231 res!827518) b!1240232))

(declare-fun m!1143579 () Bool)

(assert (=> b!1240232 m!1143579))

(declare-fun m!1143581 () Bool)

(assert (=> b!1240232 m!1143581))

(declare-fun m!1143583 () Bool)

(assert (=> b!1240231 m!1143583))

(declare-fun m!1143585 () Bool)

(assert (=> b!1240229 m!1143585))

(declare-fun m!1143587 () Bool)

(assert (=> start!103426 m!1143587))

(push 1)

(assert (not b!1240229))

(assert (not b!1240232))

