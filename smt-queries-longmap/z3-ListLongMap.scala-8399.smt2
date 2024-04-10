; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102176 () Bool)

(assert start!102176)

(declare-fun b!1230044 () Bool)

(declare-fun res!818539 () Bool)

(declare-fun e!697987 () Bool)

(assert (=> b!1230044 (=> (not res!818539) (not e!697987))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79351 0))(
  ( (array!79352 (arr!38295 (Array (_ BitVec 32) (_ BitVec 64))) (size!38831 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79351)

(assert (=> b!1230044 (= res!818539 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38831 a!3806)) (bvslt from!3184 (size!38831 a!3806))))))

(declare-fun res!818537 () Bool)

(assert (=> start!102176 (=> (not res!818537) (not e!697987))))

(assert (=> start!102176 (= res!818537 (bvslt (size!38831 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102176 e!697987))

(declare-fun array_inv!29143 (array!79351) Bool)

(assert (=> start!102176 (array_inv!29143 a!3806)))

(assert (=> start!102176 true))

(declare-fun b!1230045 () Bool)

(declare-fun res!818531 () Bool)

(assert (=> b!1230045 (=> (not res!818531) (not e!697987))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230045 (= res!818531 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230046 () Bool)

(assert (=> b!1230046 (= e!697987 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1230046 (not (arrayContainsKey!0 a!3806 (select (arr!38295 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40756 0))(
  ( (Unit!40757) )
))
(declare-fun lt!559310 () Unit!40756)

(declare-datatypes ((List!27068 0))(
  ( (Nil!27065) (Cons!27064 (h!28273 (_ BitVec 64)) (t!40531 List!27068)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79351 (_ BitVec 32) (_ BitVec 64) List!27068) Unit!40756)

(assert (=> b!1230046 (= lt!559310 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38295 a!3806) from!3184) (Cons!27064 (select (arr!38295 a!3806) from!3184) Nil!27065)))))

(declare-fun e!697989 () Bool)

(assert (=> b!1230046 e!697989))

(declare-fun res!818535 () Bool)

(assert (=> b!1230046 (=> (not res!818535) (not e!697989))))

(declare-fun arrayNoDuplicates!0 (array!79351 (_ BitVec 32) List!27068) Bool)

(assert (=> b!1230046 (= res!818535 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27065))))

(declare-fun lt!559309 () Unit!40756)

(declare-fun acc!823 () List!27068)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79351 List!27068 List!27068 (_ BitVec 32)) Unit!40756)

(assert (=> b!1230046 (= lt!559309 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27065 from!3184))))

(assert (=> b!1230046 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27064 (select (arr!38295 a!3806) from!3184) acc!823))))

(declare-fun b!1230047 () Bool)

(declare-fun res!818532 () Bool)

(assert (=> b!1230047 (=> (not res!818532) (not e!697987))))

(declare-fun contains!7130 (List!27068 (_ BitVec 64)) Bool)

(assert (=> b!1230047 (= res!818532 (not (contains!7130 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230048 () Bool)

(declare-fun res!818536 () Bool)

(assert (=> b!1230048 (=> (not res!818536) (not e!697987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230048 (= res!818536 (validKeyInArray!0 k0!2913))))

(declare-fun b!1230049 () Bool)

(declare-fun res!818534 () Bool)

(assert (=> b!1230049 (=> (not res!818534) (not e!697987))))

(declare-fun noDuplicate!1727 (List!27068) Bool)

(assert (=> b!1230049 (= res!818534 (noDuplicate!1727 acc!823))))

(declare-fun b!1230050 () Bool)

(declare-fun res!818530 () Bool)

(assert (=> b!1230050 (=> (not res!818530) (not e!697987))))

(assert (=> b!1230050 (= res!818530 (validKeyInArray!0 (select (arr!38295 a!3806) from!3184)))))

(declare-fun b!1230051 () Bool)

(declare-fun res!818533 () Bool)

(assert (=> b!1230051 (=> (not res!818533) (not e!697987))))

(assert (=> b!1230051 (= res!818533 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230052 () Bool)

(assert (=> b!1230052 (= e!697989 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27064 (select (arr!38295 a!3806) from!3184) Nil!27065)))))

(declare-fun b!1230053 () Bool)

(declare-fun res!818538 () Bool)

(assert (=> b!1230053 (=> (not res!818538) (not e!697987))))

(assert (=> b!1230053 (= res!818538 (not (contains!7130 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102176 res!818537) b!1230048))

(assert (= (and b!1230048 res!818536) b!1230044))

(assert (= (and b!1230044 res!818539) b!1230049))

(assert (= (and b!1230049 res!818534) b!1230047))

(assert (= (and b!1230047 res!818532) b!1230053))

(assert (= (and b!1230053 res!818538) b!1230045))

(assert (= (and b!1230045 res!818531) b!1230051))

(assert (= (and b!1230051 res!818533) b!1230050))

(assert (= (and b!1230050 res!818530) b!1230046))

(assert (= (and b!1230046 res!818535) b!1230052))

(declare-fun m!1134499 () Bool)

(assert (=> b!1230051 m!1134499))

(declare-fun m!1134501 () Bool)

(assert (=> b!1230045 m!1134501))

(declare-fun m!1134503 () Bool)

(assert (=> b!1230048 m!1134503))

(declare-fun m!1134505 () Bool)

(assert (=> b!1230049 m!1134505))

(declare-fun m!1134507 () Bool)

(assert (=> start!102176 m!1134507))

(declare-fun m!1134509 () Bool)

(assert (=> b!1230052 m!1134509))

(declare-fun m!1134511 () Bool)

(assert (=> b!1230052 m!1134511))

(declare-fun m!1134513 () Bool)

(assert (=> b!1230046 m!1134513))

(declare-fun m!1134515 () Bool)

(assert (=> b!1230046 m!1134515))

(assert (=> b!1230046 m!1134509))

(declare-fun m!1134517 () Bool)

(assert (=> b!1230046 m!1134517))

(assert (=> b!1230046 m!1134509))

(declare-fun m!1134519 () Bool)

(assert (=> b!1230046 m!1134519))

(assert (=> b!1230046 m!1134509))

(declare-fun m!1134521 () Bool)

(assert (=> b!1230046 m!1134521))

(declare-fun m!1134523 () Bool)

(assert (=> b!1230047 m!1134523))

(declare-fun m!1134525 () Bool)

(assert (=> b!1230053 m!1134525))

(assert (=> b!1230050 m!1134509))

(assert (=> b!1230050 m!1134509))

(declare-fun m!1134527 () Bool)

(assert (=> b!1230050 m!1134527))

(check-sat (not b!1230051) (not b!1230045) (not b!1230050) (not b!1230048) (not b!1230052) (not b!1230049) (not b!1230053) (not start!102176) (not b!1230047) (not b!1230046))
(check-sat)
