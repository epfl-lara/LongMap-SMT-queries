; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102008 () Bool)

(assert start!102008)

(declare-fun b!1228307 () Bool)

(declare-fun res!816924 () Bool)

(declare-fun e!697183 () Bool)

(assert (=> b!1228307 (=> (not res!816924) (not e!697183))))

(declare-datatypes ((List!27036 0))(
  ( (Nil!27033) (Cons!27032 (h!28241 (_ BitVec 64)) (t!40499 List!27036)) )
))
(declare-fun acc!823 () List!27036)

(declare-fun contains!7098 (List!27036 (_ BitVec 64)) Bool)

(assert (=> b!1228307 (= res!816924 (not (contains!7098 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228308 () Bool)

(declare-fun res!816925 () Bool)

(assert (=> b!1228308 (=> (not res!816925) (not e!697183))))

(assert (=> b!1228308 (= res!816925 (not (contains!7098 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228309 () Bool)

(declare-fun res!816926 () Bool)

(assert (=> b!1228309 (=> (not res!816926) (not e!697183))))

(declare-datatypes ((array!79281 0))(
  ( (array!79282 (arr!38263 (Array (_ BitVec 32) (_ BitVec 64))) (size!38799 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79281)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79281 (_ BitVec 32) List!27036) Bool)

(assert (=> b!1228309 (= res!816926 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!816922 () Bool)

(assert (=> start!102008 (=> (not res!816922) (not e!697183))))

(assert (=> start!102008 (= res!816922 (bvslt (size!38799 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102008 e!697183))

(declare-fun array_inv!29111 (array!79281) Bool)

(assert (=> start!102008 (array_inv!29111 a!3806)))

(assert (=> start!102008 true))

(declare-fun b!1228310 () Bool)

(assert (=> b!1228310 (= e!697183 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1228310 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27033)))

(declare-datatypes ((Unit!40692 0))(
  ( (Unit!40693) )
))
(declare-fun lt!558984 () Unit!40692)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79281 List!27036 List!27036 (_ BitVec 32)) Unit!40692)

(assert (=> b!1228310 (= lt!558984 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27033 from!3184))))

(assert (=> b!1228310 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27032 (select (arr!38263 a!3806) from!3184) acc!823))))

(declare-fun b!1228311 () Bool)

(declare-fun res!816923 () Bool)

(assert (=> b!1228311 (=> (not res!816923) (not e!697183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228311 (= res!816923 (validKeyInArray!0 (select (arr!38263 a!3806) from!3184)))))

(declare-fun b!1228312 () Bool)

(declare-fun res!816927 () Bool)

(assert (=> b!1228312 (=> (not res!816927) (not e!697183))))

(declare-fun noDuplicate!1695 (List!27036) Bool)

(assert (=> b!1228312 (= res!816927 (noDuplicate!1695 acc!823))))

(declare-fun b!1228313 () Bool)

(declare-fun res!816919 () Bool)

(assert (=> b!1228313 (=> (not res!816919) (not e!697183))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228313 (= res!816919 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228314 () Bool)

(declare-fun res!816921 () Bool)

(assert (=> b!1228314 (=> (not res!816921) (not e!697183))))

(assert (=> b!1228314 (= res!816921 (validKeyInArray!0 k!2913))))

(declare-fun b!1228315 () Bool)

(declare-fun res!816920 () Bool)

(assert (=> b!1228315 (=> (not res!816920) (not e!697183))))

(assert (=> b!1228315 (= res!816920 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38799 a!3806)) (bvslt from!3184 (size!38799 a!3806))))))

(assert (= (and start!102008 res!816922) b!1228314))

(assert (= (and b!1228314 res!816921) b!1228315))

(assert (= (and b!1228315 res!816920) b!1228312))

(assert (= (and b!1228312 res!816927) b!1228307))

(assert (= (and b!1228307 res!816924) b!1228308))

(assert (= (and b!1228308 res!816925) b!1228313))

(assert (= (and b!1228313 res!816919) b!1228309))

(assert (= (and b!1228309 res!816926) b!1228311))

(assert (= (and b!1228311 res!816923) b!1228310))

(declare-fun m!1132863 () Bool)

(assert (=> b!1228308 m!1132863))

(declare-fun m!1132865 () Bool)

(assert (=> start!102008 m!1132865))

(declare-fun m!1132867 () Bool)

(assert (=> b!1228314 m!1132867))

(declare-fun m!1132869 () Bool)

(assert (=> b!1228312 m!1132869))

(declare-fun m!1132871 () Bool)

(assert (=> b!1228311 m!1132871))

(assert (=> b!1228311 m!1132871))

(declare-fun m!1132873 () Bool)

(assert (=> b!1228311 m!1132873))

(declare-fun m!1132875 () Bool)

(assert (=> b!1228313 m!1132875))

(declare-fun m!1132877 () Bool)

(assert (=> b!1228310 m!1132877))

(declare-fun m!1132879 () Bool)

(assert (=> b!1228310 m!1132879))

(assert (=> b!1228310 m!1132871))

(declare-fun m!1132881 () Bool)

(assert (=> b!1228310 m!1132881))

(declare-fun m!1132883 () Bool)

(assert (=> b!1228309 m!1132883))

(declare-fun m!1132885 () Bool)

(assert (=> b!1228307 m!1132885))

(push 1)

(assert (not b!1228310))

(assert (not b!1228314))

(assert (not b!1228308))

(assert (not b!1228312))

(assert (not b!1228309))

(assert (not b!1228311))

(assert (not start!102008))

(assert (not b!1228313))

(assert (not b!1228307))

(check-sat)

