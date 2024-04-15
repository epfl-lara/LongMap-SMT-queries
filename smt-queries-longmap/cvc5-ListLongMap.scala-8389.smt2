; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102008 () Bool)

(assert start!102008)

(declare-fun b!1228279 () Bool)

(declare-fun res!816947 () Bool)

(declare-fun e!697132 () Bool)

(assert (=> b!1228279 (=> (not res!816947) (not e!697132))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228279 (= res!816947 (validKeyInArray!0 k!2913))))

(declare-fun b!1228280 () Bool)

(declare-fun res!816940 () Bool)

(assert (=> b!1228280 (=> (not res!816940) (not e!697132))))

(declare-datatypes ((array!79208 0))(
  ( (array!79209 (arr!38227 (Array (_ BitVec 32) (_ BitVec 64))) (size!38765 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79208)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228280 (= res!816940 (validKeyInArray!0 (select (arr!38227 a!3806) from!3184)))))

(declare-fun b!1228281 () Bool)

(declare-fun res!816941 () Bool)

(assert (=> b!1228281 (=> (not res!816941) (not e!697132))))

(declare-datatypes ((List!27101 0))(
  ( (Nil!27098) (Cons!27097 (h!28306 (_ BitVec 64)) (t!40555 List!27101)) )
))
(declare-fun acc!823 () List!27101)

(declare-fun contains!7073 (List!27101 (_ BitVec 64)) Bool)

(assert (=> b!1228281 (= res!816941 (not (contains!7073 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228282 () Bool)

(declare-fun res!816943 () Bool)

(assert (=> b!1228282 (=> (not res!816943) (not e!697132))))

(declare-fun arrayContainsKey!0 (array!79208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228282 (= res!816943 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228283 () Bool)

(declare-fun res!816946 () Bool)

(assert (=> b!1228283 (=> (not res!816946) (not e!697132))))

(declare-fun noDuplicate!1716 (List!27101) Bool)

(assert (=> b!1228283 (= res!816946 (noDuplicate!1716 acc!823))))

(declare-fun b!1228284 () Bool)

(declare-fun res!816942 () Bool)

(assert (=> b!1228284 (=> (not res!816942) (not e!697132))))

(assert (=> b!1228284 (= res!816942 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38765 a!3806)) (bvslt from!3184 (size!38765 a!3806))))))

(declare-fun b!1228285 () Bool)

(declare-fun res!816939 () Bool)

(assert (=> b!1228285 (=> (not res!816939) (not e!697132))))

(declare-fun arrayNoDuplicates!0 (array!79208 (_ BitVec 32) List!27101) Bool)

(assert (=> b!1228285 (= res!816939 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!816945 () Bool)

(assert (=> start!102008 (=> (not res!816945) (not e!697132))))

(assert (=> start!102008 (= res!816945 (bvslt (size!38765 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102008 e!697132))

(declare-fun array_inv!29210 (array!79208) Bool)

(assert (=> start!102008 (array_inv!29210 a!3806)))

(assert (=> start!102008 true))

(declare-fun b!1228286 () Bool)

(declare-fun res!816944 () Bool)

(assert (=> b!1228286 (=> (not res!816944) (not e!697132))))

(assert (=> b!1228286 (= res!816944 (not (contains!7073 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228287 () Bool)

(assert (=> b!1228287 (= e!697132 (not true))))

(assert (=> b!1228287 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27098)))

(declare-datatypes ((Unit!40545 0))(
  ( (Unit!40546) )
))
(declare-fun lt!558812 () Unit!40545)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79208 List!27101 List!27101 (_ BitVec 32)) Unit!40545)

(assert (=> b!1228287 (= lt!558812 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27098 from!3184))))

(assert (=> b!1228287 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27097 (select (arr!38227 a!3806) from!3184) acc!823))))

(assert (= (and start!102008 res!816945) b!1228279))

(assert (= (and b!1228279 res!816947) b!1228284))

(assert (= (and b!1228284 res!816942) b!1228283))

(assert (= (and b!1228283 res!816946) b!1228281))

(assert (= (and b!1228281 res!816941) b!1228286))

(assert (= (and b!1228286 res!816944) b!1228282))

(assert (= (and b!1228282 res!816943) b!1228285))

(assert (= (and b!1228285 res!816939) b!1228280))

(assert (= (and b!1228280 res!816940) b!1228287))

(declare-fun m!1132371 () Bool)

(assert (=> start!102008 m!1132371))

(declare-fun m!1132373 () Bool)

(assert (=> b!1228282 m!1132373))

(declare-fun m!1132375 () Bool)

(assert (=> b!1228280 m!1132375))

(assert (=> b!1228280 m!1132375))

(declare-fun m!1132377 () Bool)

(assert (=> b!1228280 m!1132377))

(declare-fun m!1132379 () Bool)

(assert (=> b!1228283 m!1132379))

(declare-fun m!1132381 () Bool)

(assert (=> b!1228285 m!1132381))

(declare-fun m!1132383 () Bool)

(assert (=> b!1228287 m!1132383))

(declare-fun m!1132385 () Bool)

(assert (=> b!1228287 m!1132385))

(assert (=> b!1228287 m!1132375))

(declare-fun m!1132387 () Bool)

(assert (=> b!1228287 m!1132387))

(declare-fun m!1132389 () Bool)

(assert (=> b!1228279 m!1132389))

(declare-fun m!1132391 () Bool)

(assert (=> b!1228286 m!1132391))

(declare-fun m!1132393 () Bool)

(assert (=> b!1228281 m!1132393))

(push 1)

(assert (not b!1228282))

(assert (not b!1228283))

(assert (not b!1228280))

(assert (not start!102008))

(assert (not b!1228286))

(assert (not b!1228287))

(assert (not b!1228281))

(assert (not b!1228285))

(assert (not b!1228279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

