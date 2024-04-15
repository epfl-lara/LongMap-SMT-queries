; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102200 () Bool)

(assert start!102200)

(declare-fun res!818839 () Bool)

(declare-fun e!698053 () Bool)

(assert (=> start!102200 (=> (not res!818839) (not e!698053))))

(declare-datatypes ((array!79298 0))(
  ( (array!79299 (arr!38269 (Array (_ BitVec 32) (_ BitVec 64))) (size!38807 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79298)

(assert (=> start!102200 (= res!818839 (bvslt (size!38807 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102200 e!698053))

(declare-fun array_inv!29252 (array!79298) Bool)

(assert (=> start!102200 (array_inv!29252 a!3806)))

(assert (=> start!102200 true))

(declare-fun b!1230315 () Bool)

(declare-fun res!818841 () Bool)

(assert (=> b!1230315 (=> (not res!818841) (not e!698053))))

(declare-datatypes ((List!27143 0))(
  ( (Nil!27140) (Cons!27139 (h!28348 (_ BitVec 64)) (t!40597 List!27143)) )
))
(declare-fun acc!823 () List!27143)

(declare-fun contains!7115 (List!27143 (_ BitVec 64)) Bool)

(assert (=> b!1230315 (= res!818841 (not (contains!7115 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230316 () Bool)

(declare-fun res!818838 () Bool)

(assert (=> b!1230316 (=> (not res!818838) (not e!698053))))

(declare-fun noDuplicate!1758 (List!27143) Bool)

(assert (=> b!1230316 (= res!818838 (noDuplicate!1758 acc!823))))

(declare-fun b!1230317 () Bool)

(declare-fun res!818840 () Bool)

(assert (=> b!1230317 (=> (not res!818840) (not e!698053))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1230317 (= res!818840 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38807 a!3806)) (bvslt from!3184 (size!38807 a!3806))))))

(declare-fun b!1230318 () Bool)

(declare-fun res!818837 () Bool)

(assert (=> b!1230318 (=> (not res!818837) (not e!698053))))

(assert (=> b!1230318 (= res!818837 (not (contains!7115 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230319 () Bool)

(assert (=> b!1230319 (= e!698053 false)))

(declare-fun lt!559196 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79298 (_ BitVec 32) List!27143) Bool)

(assert (=> b!1230319 (= lt!559196 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230320 () Bool)

(declare-fun res!818842 () Bool)

(assert (=> b!1230320 (=> (not res!818842) (not e!698053))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230320 (= res!818842 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230321 () Bool)

(declare-fun res!818843 () Bool)

(assert (=> b!1230321 (=> (not res!818843) (not e!698053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230321 (= res!818843 (validKeyInArray!0 k!2913))))

(assert (= (and start!102200 res!818839) b!1230321))

(assert (= (and b!1230321 res!818843) b!1230317))

(assert (= (and b!1230317 res!818840) b!1230316))

(assert (= (and b!1230316 res!818838) b!1230315))

(assert (= (and b!1230315 res!818841) b!1230318))

(assert (= (and b!1230318 res!818837) b!1230320))

(assert (= (and b!1230320 res!818842) b!1230319))

(declare-fun m!1134313 () Bool)

(assert (=> b!1230316 m!1134313))

(declare-fun m!1134315 () Bool)

(assert (=> start!102200 m!1134315))

(declare-fun m!1134317 () Bool)

(assert (=> b!1230318 m!1134317))

(declare-fun m!1134319 () Bool)

(assert (=> b!1230320 m!1134319))

(declare-fun m!1134321 () Bool)

(assert (=> b!1230319 m!1134321))

(declare-fun m!1134323 () Bool)

(assert (=> b!1230321 m!1134323))

(declare-fun m!1134325 () Bool)

(assert (=> b!1230315 m!1134325))

(push 1)

(assert (not b!1230318))

(assert (not b!1230315))

(assert (not b!1230319))

(assert (not start!102200))

(assert (not b!1230320))

(assert (not b!1230316))

(assert (not b!1230321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

