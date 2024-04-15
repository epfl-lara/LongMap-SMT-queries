; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102374 () Bool)

(assert start!102374)

(declare-fun b!1231624 () Bool)

(declare-fun res!820080 () Bool)

(declare-fun e!698654 () Bool)

(assert (=> b!1231624 (=> (not res!820080) (not e!698654))))

(declare-datatypes ((array!79367 0))(
  ( (array!79368 (arr!38299 (Array (_ BitVec 32) (_ BitVec 64))) (size!38837 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79367)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231624 (= res!820080 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!820074 () Bool)

(assert (=> start!102374 (=> (not res!820074) (not e!698654))))

(assert (=> start!102374 (= res!820074 (bvslt (size!38837 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102374 e!698654))

(declare-fun array_inv!29282 (array!79367) Bool)

(assert (=> start!102374 (array_inv!29282 a!3806)))

(assert (=> start!102374 true))

(declare-fun b!1231625 () Bool)

(declare-fun res!820076 () Bool)

(assert (=> b!1231625 (=> (not res!820076) (not e!698654))))

(declare-datatypes ((List!27173 0))(
  ( (Nil!27170) (Cons!27169 (h!28378 (_ BitVec 64)) (t!40627 List!27173)) )
))
(declare-fun acc!823 () List!27173)

(declare-fun contains!7145 (List!27173 (_ BitVec 64)) Bool)

(assert (=> b!1231625 (= res!820076 (not (contains!7145 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231626 () Bool)

(assert (=> b!1231626 (= e!698654 (not true))))

(declare-fun arrayNoDuplicates!0 (array!79367 (_ BitVec 32) List!27173) Bool)

(assert (=> b!1231626 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27170)))

(declare-datatypes ((Unit!40629 0))(
  ( (Unit!40630) )
))
(declare-fun lt!559262 () Unit!40629)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79367 List!27173 List!27173 (_ BitVec 32)) Unit!40629)

(assert (=> b!1231626 (= lt!559262 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27170 from!3184))))

(assert (=> b!1231626 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27169 (select (arr!38299 a!3806) from!3184) acc!823))))

(declare-fun b!1231627 () Bool)

(declare-fun res!820081 () Bool)

(assert (=> b!1231627 (=> (not res!820081) (not e!698654))))

(declare-fun noDuplicate!1788 (List!27173) Bool)

(assert (=> b!1231627 (= res!820081 (noDuplicate!1788 acc!823))))

(declare-fun b!1231628 () Bool)

(declare-fun res!820075 () Bool)

(assert (=> b!1231628 (=> (not res!820075) (not e!698654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231628 (= res!820075 (validKeyInArray!0 k!2913))))

(declare-fun b!1231629 () Bool)

(declare-fun res!820077 () Bool)

(assert (=> b!1231629 (=> (not res!820077) (not e!698654))))

(assert (=> b!1231629 (= res!820077 (not (contains!7145 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231630 () Bool)

(declare-fun res!820079 () Bool)

(assert (=> b!1231630 (=> (not res!820079) (not e!698654))))

(assert (=> b!1231630 (= res!820079 (validKeyInArray!0 (select (arr!38299 a!3806) from!3184)))))

(declare-fun b!1231631 () Bool)

(declare-fun res!820078 () Bool)

(assert (=> b!1231631 (=> (not res!820078) (not e!698654))))

(assert (=> b!1231631 (= res!820078 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231632 () Bool)

(declare-fun res!820082 () Bool)

(assert (=> b!1231632 (=> (not res!820082) (not e!698654))))

(assert (=> b!1231632 (= res!820082 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38837 a!3806)) (bvslt from!3184 (size!38837 a!3806))))))

(assert (= (and start!102374 res!820074) b!1231628))

(assert (= (and b!1231628 res!820075) b!1231632))

(assert (= (and b!1231632 res!820082) b!1231627))

(assert (= (and b!1231627 res!820081) b!1231625))

(assert (= (and b!1231625 res!820076) b!1231629))

(assert (= (and b!1231629 res!820077) b!1231624))

(assert (= (and b!1231624 res!820080) b!1231631))

(assert (= (and b!1231631 res!820078) b!1231630))

(assert (= (and b!1231630 res!820079) b!1231626))

(declare-fun m!1135293 () Bool)

(assert (=> b!1231624 m!1135293))

(declare-fun m!1135295 () Bool)

(assert (=> b!1231631 m!1135295))

(declare-fun m!1135297 () Bool)

(assert (=> start!102374 m!1135297))

(declare-fun m!1135299 () Bool)

(assert (=> b!1231627 m!1135299))

(declare-fun m!1135301 () Bool)

(assert (=> b!1231629 m!1135301))

(declare-fun m!1135303 () Bool)

(assert (=> b!1231626 m!1135303))

(declare-fun m!1135305 () Bool)

(assert (=> b!1231626 m!1135305))

(declare-fun m!1135307 () Bool)

(assert (=> b!1231626 m!1135307))

(declare-fun m!1135309 () Bool)

(assert (=> b!1231626 m!1135309))

(declare-fun m!1135311 () Bool)

(assert (=> b!1231628 m!1135311))

(assert (=> b!1231630 m!1135307))

(assert (=> b!1231630 m!1135307))

(declare-fun m!1135313 () Bool)

(assert (=> b!1231630 m!1135313))

(declare-fun m!1135315 () Bool)

(assert (=> b!1231625 m!1135315))

(push 1)

(assert (not b!1231625))

(assert (not b!1231630))

(assert (not b!1231626))

(assert (not start!102374))

(assert (not b!1231627))

(assert (not b!1231624))

(assert (not b!1231629))

(assert (not b!1231631))

(assert (not b!1231628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

