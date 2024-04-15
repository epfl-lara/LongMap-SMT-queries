; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102194 () Bool)

(assert start!102194)

(declare-fun b!1230252 () Bool)

(declare-fun res!818779 () Bool)

(declare-fun e!698035 () Bool)

(assert (=> b!1230252 (=> (not res!818779) (not e!698035))))

(declare-datatypes ((array!79292 0))(
  ( (array!79293 (arr!38266 (Array (_ BitVec 32) (_ BitVec 64))) (size!38804 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79292)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230252 (= res!818779 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230253 () Bool)

(assert (=> b!1230253 (= e!698035 false)))

(declare-datatypes ((List!27140 0))(
  ( (Nil!27137) (Cons!27136 (h!28345 (_ BitVec 64)) (t!40594 List!27140)) )
))
(declare-fun acc!823 () List!27140)

(declare-fun lt!559187 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79292 (_ BitVec 32) List!27140) Bool)

(assert (=> b!1230253 (= lt!559187 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!818778 () Bool)

(assert (=> start!102194 (=> (not res!818778) (not e!698035))))

(assert (=> start!102194 (= res!818778 (bvslt (size!38804 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102194 e!698035))

(declare-fun array_inv!29249 (array!79292) Bool)

(assert (=> start!102194 (array_inv!29249 a!3806)))

(assert (=> start!102194 true))

(declare-fun b!1230254 () Bool)

(declare-fun res!818776 () Bool)

(assert (=> b!1230254 (=> (not res!818776) (not e!698035))))

(declare-fun noDuplicate!1755 (List!27140) Bool)

(assert (=> b!1230254 (= res!818776 (noDuplicate!1755 acc!823))))

(declare-fun b!1230255 () Bool)

(declare-fun res!818780 () Bool)

(assert (=> b!1230255 (=> (not res!818780) (not e!698035))))

(declare-fun contains!7112 (List!27140 (_ BitVec 64)) Bool)

(assert (=> b!1230255 (= res!818780 (not (contains!7112 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230256 () Bool)

(declare-fun res!818774 () Bool)

(assert (=> b!1230256 (=> (not res!818774) (not e!698035))))

(assert (=> b!1230256 (= res!818774 (not (contains!7112 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230257 () Bool)

(declare-fun res!818777 () Bool)

(assert (=> b!1230257 (=> (not res!818777) (not e!698035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230257 (= res!818777 (validKeyInArray!0 k!2913))))

(declare-fun b!1230258 () Bool)

(declare-fun res!818775 () Bool)

(assert (=> b!1230258 (=> (not res!818775) (not e!698035))))

(assert (=> b!1230258 (= res!818775 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38804 a!3806)) (bvslt from!3184 (size!38804 a!3806))))))

(assert (= (and start!102194 res!818778) b!1230257))

(assert (= (and b!1230257 res!818777) b!1230258))

(assert (= (and b!1230258 res!818775) b!1230254))

(assert (= (and b!1230254 res!818776) b!1230255))

(assert (= (and b!1230255 res!818780) b!1230256))

(assert (= (and b!1230256 res!818774) b!1230252))

(assert (= (and b!1230252 res!818779) b!1230253))

(declare-fun m!1134271 () Bool)

(assert (=> b!1230257 m!1134271))

(declare-fun m!1134273 () Bool)

(assert (=> b!1230255 m!1134273))

(declare-fun m!1134275 () Bool)

(assert (=> b!1230256 m!1134275))

(declare-fun m!1134277 () Bool)

(assert (=> start!102194 m!1134277))

(declare-fun m!1134279 () Bool)

(assert (=> b!1230252 m!1134279))

(declare-fun m!1134281 () Bool)

(assert (=> b!1230254 m!1134281))

(declare-fun m!1134283 () Bool)

(assert (=> b!1230253 m!1134283))

(push 1)

(assert (not start!102194))

(assert (not b!1230256))

(assert (not b!1230253))

(assert (not b!1230252))

(assert (not b!1230255))

(assert (not b!1230257))

(assert (not b!1230254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

