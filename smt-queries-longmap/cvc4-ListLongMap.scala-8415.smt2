; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102430 () Bool)

(assert start!102430)

(declare-fun b!1232012 () Bool)

(declare-fun res!820391 () Bool)

(declare-fun e!698863 () Bool)

(assert (=> b!1232012 (=> (not res!820391) (not e!698863))))

(declare-datatypes ((array!79461 0))(
  ( (array!79462 (arr!38344 (Array (_ BitVec 32) (_ BitVec 64))) (size!38880 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79461)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232012 (= res!820391 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!820399 () Bool)

(assert (=> start!102430 (=> (not res!820399) (not e!698863))))

(assert (=> start!102430 (= res!820399 (bvslt (size!38880 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102430 e!698863))

(declare-fun array_inv!29192 (array!79461) Bool)

(assert (=> start!102430 (array_inv!29192 a!3806)))

(assert (=> start!102430 true))

(declare-fun b!1232013 () Bool)

(declare-fun e!698864 () Bool)

(declare-datatypes ((List!27117 0))(
  ( (Nil!27114) (Cons!27113 (h!28322 (_ BitVec 64)) (t!40580 List!27117)) )
))
(declare-fun arrayNoDuplicates!0 (array!79461 (_ BitVec 32) List!27117) Bool)

(assert (=> b!1232013 (= e!698864 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27113 (select (arr!38344 a!3806) from!3184) Nil!27114)))))

(declare-fun b!1232014 () Bool)

(declare-fun res!820390 () Bool)

(assert (=> b!1232014 (=> (not res!820390) (not e!698863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232014 (= res!820390 (validKeyInArray!0 (select (arr!38344 a!3806) from!3184)))))

(declare-fun b!1232015 () Bool)

(declare-fun res!820397 () Bool)

(assert (=> b!1232015 (=> (not res!820397) (not e!698863))))

(declare-fun acc!823 () List!27117)

(declare-fun noDuplicate!1776 (List!27117) Bool)

(assert (=> b!1232015 (= res!820397 (noDuplicate!1776 acc!823))))

(declare-fun b!1232016 () Bool)

(assert (=> b!1232016 (= e!698863 (not true))))

(assert (=> b!1232016 e!698864))

(declare-fun res!820392 () Bool)

(assert (=> b!1232016 (=> (not res!820392) (not e!698864))))

(assert (=> b!1232016 (= res!820392 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27114))))

(declare-datatypes ((Unit!40794 0))(
  ( (Unit!40795) )
))
(declare-fun lt!559475 () Unit!40794)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79461 List!27117 List!27117 (_ BitVec 32)) Unit!40794)

(assert (=> b!1232016 (= lt!559475 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27114 from!3184))))

(assert (=> b!1232016 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27113 (select (arr!38344 a!3806) from!3184) acc!823))))

(declare-fun b!1232017 () Bool)

(declare-fun res!820393 () Bool)

(assert (=> b!1232017 (=> (not res!820393) (not e!698863))))

(assert (=> b!1232017 (= res!820393 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38880 a!3806)) (bvslt from!3184 (size!38880 a!3806))))))

(declare-fun b!1232018 () Bool)

(declare-fun res!820394 () Bool)

(assert (=> b!1232018 (=> (not res!820394) (not e!698863))))

(assert (=> b!1232018 (= res!820394 (validKeyInArray!0 k!2913))))

(declare-fun b!1232019 () Bool)

(declare-fun res!820395 () Bool)

(assert (=> b!1232019 (=> (not res!820395) (not e!698863))))

(assert (=> b!1232019 (= res!820395 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232020 () Bool)

(declare-fun res!820396 () Bool)

(assert (=> b!1232020 (=> (not res!820396) (not e!698863))))

(declare-fun contains!7179 (List!27117 (_ BitVec 64)) Bool)

(assert (=> b!1232020 (= res!820396 (not (contains!7179 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232021 () Bool)

(declare-fun res!820398 () Bool)

(assert (=> b!1232021 (=> (not res!820398) (not e!698863))))

(assert (=> b!1232021 (= res!820398 (not (contains!7179 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102430 res!820399) b!1232018))

(assert (= (and b!1232018 res!820394) b!1232017))

(assert (= (and b!1232017 res!820393) b!1232015))

(assert (= (and b!1232015 res!820397) b!1232020))

(assert (= (and b!1232020 res!820396) b!1232021))

(assert (= (and b!1232021 res!820398) b!1232012))

(assert (= (and b!1232012 res!820391) b!1232019))

(assert (= (and b!1232019 res!820395) b!1232014))

(assert (= (and b!1232014 res!820390) b!1232016))

(assert (= (and b!1232016 res!820392) b!1232013))

(declare-fun m!1136057 () Bool)

(assert (=> b!1232016 m!1136057))

(declare-fun m!1136059 () Bool)

(assert (=> b!1232016 m!1136059))

(declare-fun m!1136061 () Bool)

(assert (=> b!1232016 m!1136061))

(declare-fun m!1136063 () Bool)

(assert (=> b!1232016 m!1136063))

(declare-fun m!1136065 () Bool)

(assert (=> b!1232020 m!1136065))

(declare-fun m!1136067 () Bool)

(assert (=> b!1232019 m!1136067))

(assert (=> b!1232014 m!1136061))

(assert (=> b!1232014 m!1136061))

(declare-fun m!1136069 () Bool)

(assert (=> b!1232014 m!1136069))

(declare-fun m!1136071 () Bool)

(assert (=> start!102430 m!1136071))

(declare-fun m!1136073 () Bool)

(assert (=> b!1232021 m!1136073))

(declare-fun m!1136075 () Bool)

(assert (=> b!1232018 m!1136075))

(declare-fun m!1136077 () Bool)

(assert (=> b!1232012 m!1136077))

(assert (=> b!1232013 m!1136061))

(declare-fun m!1136079 () Bool)

(assert (=> b!1232013 m!1136079))

(declare-fun m!1136081 () Bool)

(assert (=> b!1232015 m!1136081))

(push 1)

(assert (not b!1232018))

(assert (not b!1232015))

(assert (not b!1232021))

(assert (not b!1232019))

(assert (not b!1232020))

(assert (not b!1232012))

(assert (not start!102430))

(assert (not b!1232016))

(assert (not b!1232013))

(assert (not b!1232014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

