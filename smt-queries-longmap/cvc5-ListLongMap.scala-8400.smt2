; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102180 () Bool)

(assert start!102180)

(declare-fun b!1230104 () Bool)

(declare-fun res!818592 () Bool)

(declare-fun e!698007 () Bool)

(assert (=> b!1230104 (=> (not res!818592) (not e!698007))))

(declare-datatypes ((array!79355 0))(
  ( (array!79356 (arr!38297 (Array (_ BitVec 32) (_ BitVec 64))) (size!38833 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79355)

(declare-datatypes ((List!27070 0))(
  ( (Nil!27067) (Cons!27066 (h!28275 (_ BitVec 64)) (t!40533 List!27070)) )
))
(declare-fun acc!823 () List!27070)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79355 (_ BitVec 32) List!27070) Bool)

(assert (=> b!1230104 (= res!818592 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230105 () Bool)

(declare-fun res!818590 () Bool)

(assert (=> b!1230105 (=> (not res!818590) (not e!698007))))

(assert (=> b!1230105 (= res!818590 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38833 a!3806)) (bvslt from!3184 (size!38833 a!3806))))))

(declare-fun b!1230106 () Bool)

(declare-fun res!818593 () Bool)

(assert (=> b!1230106 (=> (not res!818593) (not e!698007))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230106 (= res!818593 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!818595 () Bool)

(assert (=> start!102180 (=> (not res!818595) (not e!698007))))

(assert (=> start!102180 (= res!818595 (bvslt (size!38833 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102180 e!698007))

(declare-fun array_inv!29145 (array!79355) Bool)

(assert (=> start!102180 (array_inv!29145 a!3806)))

(assert (=> start!102180 true))

(declare-fun b!1230107 () Bool)

(declare-fun res!818597 () Bool)

(assert (=> b!1230107 (=> (not res!818597) (not e!698007))))

(declare-fun contains!7132 (List!27070 (_ BitVec 64)) Bool)

(assert (=> b!1230107 (= res!818597 (not (contains!7132 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230108 () Bool)

(declare-fun res!818598 () Bool)

(assert (=> b!1230108 (=> (not res!818598) (not e!698007))))

(assert (=> b!1230108 (= res!818598 (not (contains!7132 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230109 () Bool)

(declare-fun res!818599 () Bool)

(assert (=> b!1230109 (=> (not res!818599) (not e!698007))))

(declare-fun noDuplicate!1729 (List!27070) Bool)

(assert (=> b!1230109 (= res!818599 (noDuplicate!1729 acc!823))))

(declare-fun b!1230110 () Bool)

(declare-fun res!818591 () Bool)

(assert (=> b!1230110 (=> (not res!818591) (not e!698007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230110 (= res!818591 (validKeyInArray!0 k!2913))))

(declare-fun b!1230111 () Bool)

(assert (=> b!1230111 (= e!698007 (not true))))

(assert (=> b!1230111 (not (arrayContainsKey!0 a!3806 (select (arr!38297 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40760 0))(
  ( (Unit!40761) )
))
(declare-fun lt!559321 () Unit!40760)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79355 (_ BitVec 32) (_ BitVec 64) List!27070) Unit!40760)

(assert (=> b!1230111 (= lt!559321 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38297 a!3806) from!3184) (Cons!27066 (select (arr!38297 a!3806) from!3184) Nil!27067)))))

(declare-fun e!698006 () Bool)

(assert (=> b!1230111 e!698006))

(declare-fun res!818594 () Bool)

(assert (=> b!1230111 (=> (not res!818594) (not e!698006))))

(assert (=> b!1230111 (= res!818594 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27067))))

(declare-fun lt!559322 () Unit!40760)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79355 List!27070 List!27070 (_ BitVec 32)) Unit!40760)

(assert (=> b!1230111 (= lt!559322 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27067 from!3184))))

(assert (=> b!1230111 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27066 (select (arr!38297 a!3806) from!3184) acc!823))))

(declare-fun b!1230112 () Bool)

(assert (=> b!1230112 (= e!698006 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27066 (select (arr!38297 a!3806) from!3184) Nil!27067)))))

(declare-fun b!1230113 () Bool)

(declare-fun res!818596 () Bool)

(assert (=> b!1230113 (=> (not res!818596) (not e!698007))))

(assert (=> b!1230113 (= res!818596 (validKeyInArray!0 (select (arr!38297 a!3806) from!3184)))))

(assert (= (and start!102180 res!818595) b!1230110))

(assert (= (and b!1230110 res!818591) b!1230105))

(assert (= (and b!1230105 res!818590) b!1230109))

(assert (= (and b!1230109 res!818599) b!1230107))

(assert (= (and b!1230107 res!818597) b!1230108))

(assert (= (and b!1230108 res!818598) b!1230106))

(assert (= (and b!1230106 res!818593) b!1230104))

(assert (= (and b!1230104 res!818592) b!1230113))

(assert (= (and b!1230113 res!818596) b!1230111))

(assert (= (and b!1230111 res!818594) b!1230112))

(declare-fun m!1134559 () Bool)

(assert (=> start!102180 m!1134559))

(declare-fun m!1134561 () Bool)

(assert (=> b!1230110 m!1134561))

(declare-fun m!1134563 () Bool)

(assert (=> b!1230108 m!1134563))

(declare-fun m!1134565 () Bool)

(assert (=> b!1230109 m!1134565))

(declare-fun m!1134567 () Bool)

(assert (=> b!1230107 m!1134567))

(declare-fun m!1134569 () Bool)

(assert (=> b!1230111 m!1134569))

(declare-fun m!1134571 () Bool)

(assert (=> b!1230111 m!1134571))

(declare-fun m!1134573 () Bool)

(assert (=> b!1230111 m!1134573))

(declare-fun m!1134575 () Bool)

(assert (=> b!1230111 m!1134575))

(assert (=> b!1230111 m!1134573))

(declare-fun m!1134577 () Bool)

(assert (=> b!1230111 m!1134577))

(assert (=> b!1230111 m!1134573))

(declare-fun m!1134579 () Bool)

(assert (=> b!1230111 m!1134579))

(declare-fun m!1134581 () Bool)

(assert (=> b!1230104 m!1134581))

(assert (=> b!1230113 m!1134573))

(assert (=> b!1230113 m!1134573))

(declare-fun m!1134583 () Bool)

(assert (=> b!1230113 m!1134583))

(declare-fun m!1134585 () Bool)

(assert (=> b!1230106 m!1134585))

(assert (=> b!1230112 m!1134573))

(declare-fun m!1134587 () Bool)

(assert (=> b!1230112 m!1134587))

(push 1)

(assert (not b!1230110))

(assert (not start!102180))

(assert (not b!1230108))

(assert (not b!1230106))

(assert (not b!1230113))

(assert (not b!1230109))

(assert (not b!1230104))

(assert (not b!1230111))

(assert (not b!1230107))

(assert (not b!1230112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

