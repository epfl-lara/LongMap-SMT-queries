; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102136 () Bool)

(assert start!102136)

(declare-fun b!1229224 () Bool)

(declare-fun res!817715 () Bool)

(declare-fun e!697755 () Bool)

(assert (=> b!1229224 (=> (not res!817715) (not e!697755))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229224 (= res!817715 (validKeyInArray!0 k!2913))))

(declare-fun b!1229225 () Bool)

(declare-fun res!817721 () Bool)

(assert (=> b!1229225 (=> (not res!817721) (not e!697755))))

(declare-datatypes ((array!79311 0))(
  ( (array!79312 (arr!38275 (Array (_ BitVec 32) (_ BitVec 64))) (size!38811 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79311)

(declare-datatypes ((List!27048 0))(
  ( (Nil!27045) (Cons!27044 (h!28253 (_ BitVec 64)) (t!40511 List!27048)) )
))
(declare-fun acc!823 () List!27048)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79311 (_ BitVec 32) List!27048) Bool)

(assert (=> b!1229225 (= res!817721 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229226 () Bool)

(declare-fun e!697753 () Bool)

(assert (=> b!1229226 (= e!697753 true)))

(declare-fun lt!559136 () Bool)

(declare-fun lt!559134 () List!27048)

(declare-fun contains!7110 (List!27048 (_ BitVec 64)) Bool)

(assert (=> b!1229226 (= lt!559136 (contains!7110 lt!559134 (select (arr!38275 a!3806) from!3184)))))

(declare-fun b!1229227 () Bool)

(declare-fun res!817720 () Bool)

(assert (=> b!1229227 (=> res!817720 e!697753)))

(declare-fun noDuplicate!1707 (List!27048) Bool)

(assert (=> b!1229227 (= res!817720 (not (noDuplicate!1707 lt!559134)))))

(declare-fun b!1229228 () Bool)

(declare-fun res!817712 () Bool)

(assert (=> b!1229228 (=> (not res!817712) (not e!697755))))

(declare-fun arrayContainsKey!0 (array!79311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229228 (= res!817712 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229229 () Bool)

(declare-fun res!817713 () Bool)

(assert (=> b!1229229 (=> (not res!817713) (not e!697755))))

(assert (=> b!1229229 (= res!817713 (validKeyInArray!0 (select (arr!38275 a!3806) from!3184)))))

(declare-fun b!1229230 () Bool)

(assert (=> b!1229230 (= e!697755 (not e!697753))))

(declare-fun res!817716 () Bool)

(assert (=> b!1229230 (=> res!817716 e!697753)))

(assert (=> b!1229230 (= res!817716 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229230 (= lt!559134 (Cons!27044 (select (arr!38275 a!3806) from!3184) Nil!27045))))

(declare-fun e!697754 () Bool)

(assert (=> b!1229230 e!697754))

(declare-fun res!817718 () Bool)

(assert (=> b!1229230 (=> (not res!817718) (not e!697754))))

(assert (=> b!1229230 (= res!817718 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27045))))

(declare-datatypes ((Unit!40716 0))(
  ( (Unit!40717) )
))
(declare-fun lt!559135 () Unit!40716)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79311 List!27048 List!27048 (_ BitVec 32)) Unit!40716)

(assert (=> b!1229230 (= lt!559135 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27045 from!3184))))

(assert (=> b!1229230 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27044 (select (arr!38275 a!3806) from!3184) acc!823))))

(declare-fun b!1229231 () Bool)

(declare-fun res!817714 () Bool)

(assert (=> b!1229231 (=> (not res!817714) (not e!697755))))

(assert (=> b!1229231 (= res!817714 (not (contains!7110 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!817719 () Bool)

(assert (=> start!102136 (=> (not res!817719) (not e!697755))))

(assert (=> start!102136 (= res!817719 (bvslt (size!38811 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102136 e!697755))

(declare-fun array_inv!29123 (array!79311) Bool)

(assert (=> start!102136 (array_inv!29123 a!3806)))

(assert (=> start!102136 true))

(declare-fun b!1229232 () Bool)

(declare-fun res!817710 () Bool)

(assert (=> b!1229232 (=> (not res!817710) (not e!697755))))

(assert (=> b!1229232 (= res!817710 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38811 a!3806)) (bvslt from!3184 (size!38811 a!3806))))))

(declare-fun b!1229233 () Bool)

(declare-fun res!817717 () Bool)

(assert (=> b!1229233 (=> (not res!817717) (not e!697755))))

(assert (=> b!1229233 (= res!817717 (not (contains!7110 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229234 () Bool)

(declare-fun res!817722 () Bool)

(assert (=> b!1229234 (=> (not res!817722) (not e!697755))))

(assert (=> b!1229234 (= res!817722 (noDuplicate!1707 acc!823))))

(declare-fun b!1229235 () Bool)

(assert (=> b!1229235 (= e!697754 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27044 (select (arr!38275 a!3806) from!3184) Nil!27045)))))

(declare-fun b!1229236 () Bool)

(declare-fun res!817711 () Bool)

(assert (=> b!1229236 (=> res!817711 e!697753)))

(assert (=> b!1229236 (= res!817711 (contains!7110 lt!559134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229237 () Bool)

(declare-fun res!817723 () Bool)

(assert (=> b!1229237 (=> res!817723 e!697753)))

(assert (=> b!1229237 (= res!817723 (contains!7110 lt!559134 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102136 res!817719) b!1229224))

(assert (= (and b!1229224 res!817715) b!1229232))

(assert (= (and b!1229232 res!817710) b!1229234))

(assert (= (and b!1229234 res!817722) b!1229231))

(assert (= (and b!1229231 res!817714) b!1229233))

(assert (= (and b!1229233 res!817717) b!1229228))

(assert (= (and b!1229228 res!817712) b!1229225))

(assert (= (and b!1229225 res!817721) b!1229229))

(assert (= (and b!1229229 res!817713) b!1229230))

(assert (= (and b!1229230 res!817718) b!1229235))

(assert (= (and b!1229230 (not res!817716)) b!1229227))

(assert (= (and b!1229227 (not res!817720)) b!1229236))

(assert (= (and b!1229236 (not res!817711)) b!1229237))

(assert (= (and b!1229237 (not res!817723)) b!1229226))

(declare-fun m!1133823 () Bool)

(assert (=> b!1229224 m!1133823))

(declare-fun m!1133825 () Bool)

(assert (=> b!1229225 m!1133825))

(declare-fun m!1133827 () Bool)

(assert (=> b!1229233 m!1133827))

(declare-fun m!1133829 () Bool)

(assert (=> start!102136 m!1133829))

(declare-fun m!1133831 () Bool)

(assert (=> b!1229235 m!1133831))

(declare-fun m!1133833 () Bool)

(assert (=> b!1229235 m!1133833))

(declare-fun m!1133835 () Bool)

(assert (=> b!1229228 m!1133835))

(assert (=> b!1229229 m!1133831))

(assert (=> b!1229229 m!1133831))

(declare-fun m!1133837 () Bool)

(assert (=> b!1229229 m!1133837))

(declare-fun m!1133839 () Bool)

(assert (=> b!1229231 m!1133839))

(assert (=> b!1229226 m!1133831))

(assert (=> b!1229226 m!1133831))

(declare-fun m!1133841 () Bool)

(assert (=> b!1229226 m!1133841))

(declare-fun m!1133843 () Bool)

(assert (=> b!1229236 m!1133843))

(declare-fun m!1133845 () Bool)

(assert (=> b!1229227 m!1133845))

(assert (=> b!1229230 m!1133831))

(declare-fun m!1133847 () Bool)

(assert (=> b!1229230 m!1133847))

(declare-fun m!1133849 () Bool)

(assert (=> b!1229230 m!1133849))

(declare-fun m!1133851 () Bool)

(assert (=> b!1229230 m!1133851))

(declare-fun m!1133853 () Bool)

(assert (=> b!1229237 m!1133853))

(declare-fun m!1133855 () Bool)

(assert (=> b!1229234 m!1133855))

(push 1)

(assert (not b!1229228))

(assert (not b!1229234))

(assert (not b!1229233))

(assert (not b!1229227))

(assert (not start!102136))

(assert (not b!1229229))

(assert (not b!1229231))

(assert (not b!1229235))

(assert (not b!1229230))

(assert (not b!1229225))

(assert (not b!1229236))

(assert (not b!1229237))

(assert (not b!1229226))

(assert (not b!1229224))

(check-sat)

(pop 1)

