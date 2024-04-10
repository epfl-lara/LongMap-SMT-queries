; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102450 () Bool)

(assert start!102450)

(declare-fun b!1232312 () Bool)

(declare-fun res!820693 () Bool)

(declare-fun e!698953 () Bool)

(assert (=> b!1232312 (=> (not res!820693) (not e!698953))))

(declare-datatypes ((List!27127 0))(
  ( (Nil!27124) (Cons!27123 (h!28332 (_ BitVec 64)) (t!40590 List!27127)) )
))
(declare-fun acc!823 () List!27127)

(declare-fun noDuplicate!1786 (List!27127) Bool)

(assert (=> b!1232312 (= res!820693 (noDuplicate!1786 acc!823))))

(declare-fun res!820692 () Bool)

(assert (=> start!102450 (=> (not res!820692) (not e!698953))))

(declare-datatypes ((array!79481 0))(
  ( (array!79482 (arr!38354 (Array (_ BitVec 32) (_ BitVec 64))) (size!38890 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79481)

(assert (=> start!102450 (= res!820692 (bvslt (size!38890 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102450 e!698953))

(declare-fun array_inv!29202 (array!79481) Bool)

(assert (=> start!102450 (array_inv!29202 a!3806)))

(assert (=> start!102450 true))

(declare-fun b!1232313 () Bool)

(declare-fun res!820696 () Bool)

(assert (=> b!1232313 (=> (not res!820696) (not e!698953))))

(declare-fun contains!7189 (List!27127 (_ BitVec 64)) Bool)

(assert (=> b!1232313 (= res!820696 (not (contains!7189 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232314 () Bool)

(declare-fun res!820698 () Bool)

(assert (=> b!1232314 (=> (not res!820698) (not e!698953))))

(assert (=> b!1232314 (= res!820698 (not (contains!7189 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232315 () Bool)

(assert (=> b!1232315 (= e!698953 (not true))))

(declare-fun e!698954 () Bool)

(assert (=> b!1232315 e!698954))

(declare-fun res!820697 () Bool)

(assert (=> b!1232315 (=> (not res!820697) (not e!698954))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79481 (_ BitVec 32) List!27127) Bool)

(assert (=> b!1232315 (= res!820697 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27124))))

(declare-datatypes ((Unit!40814 0))(
  ( (Unit!40815) )
))
(declare-fun lt!559505 () Unit!40814)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79481 List!27127 List!27127 (_ BitVec 32)) Unit!40814)

(assert (=> b!1232315 (= lt!559505 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27124 from!3184))))

(assert (=> b!1232315 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27123 (select (arr!38354 a!3806) from!3184) acc!823))))

(declare-fun b!1232316 () Bool)

(declare-fun res!820691 () Bool)

(assert (=> b!1232316 (=> (not res!820691) (not e!698953))))

(assert (=> b!1232316 (= res!820691 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232317 () Bool)

(declare-fun res!820694 () Bool)

(assert (=> b!1232317 (=> (not res!820694) (not e!698953))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232317 (= res!820694 (validKeyInArray!0 k!2913))))

(declare-fun b!1232318 () Bool)

(declare-fun res!820699 () Bool)

(assert (=> b!1232318 (=> (not res!820699) (not e!698953))))

(assert (=> b!1232318 (= res!820699 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38890 a!3806)) (bvslt from!3184 (size!38890 a!3806))))))

(declare-fun b!1232319 () Bool)

(assert (=> b!1232319 (= e!698954 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27123 (select (arr!38354 a!3806) from!3184) Nil!27124)))))

(declare-fun b!1232320 () Bool)

(declare-fun res!820695 () Bool)

(assert (=> b!1232320 (=> (not res!820695) (not e!698953))))

(declare-fun arrayContainsKey!0 (array!79481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232320 (= res!820695 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232321 () Bool)

(declare-fun res!820690 () Bool)

(assert (=> b!1232321 (=> (not res!820690) (not e!698953))))

(assert (=> b!1232321 (= res!820690 (validKeyInArray!0 (select (arr!38354 a!3806) from!3184)))))

(assert (= (and start!102450 res!820692) b!1232317))

(assert (= (and b!1232317 res!820694) b!1232318))

(assert (= (and b!1232318 res!820699) b!1232312))

(assert (= (and b!1232312 res!820693) b!1232314))

(assert (= (and b!1232314 res!820698) b!1232313))

(assert (= (and b!1232313 res!820696) b!1232320))

(assert (= (and b!1232320 res!820695) b!1232316))

(assert (= (and b!1232316 res!820691) b!1232321))

(assert (= (and b!1232321 res!820690) b!1232315))

(assert (= (and b!1232315 res!820697) b!1232319))

(declare-fun m!1136317 () Bool)

(assert (=> b!1232312 m!1136317))

(declare-fun m!1136319 () Bool)

(assert (=> b!1232316 m!1136319))

(declare-fun m!1136321 () Bool)

(assert (=> start!102450 m!1136321))

(declare-fun m!1136323 () Bool)

(assert (=> b!1232314 m!1136323))

(declare-fun m!1136325 () Bool)

(assert (=> b!1232317 m!1136325))

(declare-fun m!1136327 () Bool)

(assert (=> b!1232321 m!1136327))

(assert (=> b!1232321 m!1136327))

(declare-fun m!1136329 () Bool)

(assert (=> b!1232321 m!1136329))

(declare-fun m!1136331 () Bool)

(assert (=> b!1232315 m!1136331))

(declare-fun m!1136333 () Bool)

(assert (=> b!1232315 m!1136333))

(assert (=> b!1232315 m!1136327))

(declare-fun m!1136335 () Bool)

(assert (=> b!1232315 m!1136335))

(assert (=> b!1232319 m!1136327))

(declare-fun m!1136337 () Bool)

(assert (=> b!1232319 m!1136337))

(declare-fun m!1136339 () Bool)

(assert (=> b!1232320 m!1136339))

(declare-fun m!1136341 () Bool)

(assert (=> b!1232313 m!1136341))

(push 1)

(assert (not b!1232312))

(assert (not b!1232320))

(assert (not b!1232316))

(assert (not b!1232321))

(assert (not b!1232315))

(assert (not b!1232314))

(assert (not b!1232317))

(assert (not b!1232319))

(assert (not b!1232313))

(assert (not start!102450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

