; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102412 () Bool)

(assert start!102412)

(declare-fun b!1231308 () Bool)

(declare-fun res!819001 () Bool)

(declare-fun e!698835 () Bool)

(assert (=> b!1231308 (=> (not res!819001) (not e!698835))))

(declare-datatypes ((List!27091 0))(
  ( (Nil!27088) (Cons!27087 (h!28305 (_ BitVec 64)) (t!40546 List!27091)) )
))
(declare-fun acc!823 () List!27091)

(declare-fun contains!7162 (List!27091 (_ BitVec 64)) Bool)

(assert (=> b!1231308 (= res!819001 (not (contains!7162 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231309 () Bool)

(declare-fun res!819012 () Bool)

(assert (=> b!1231309 (=> (not res!819012) (not e!698835))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79383 0))(
  ( (array!79384 (arr!38305 (Array (_ BitVec 32) (_ BitVec 64))) (size!38842 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79383)

(assert (=> b!1231309 (= res!819012 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38842 a!3806)) (bvslt from!3184 (size!38842 a!3806))))))

(declare-fun b!1231310 () Bool)

(declare-fun e!698834 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79383 (_ BitVec 32) List!27091) Bool)

(assert (=> b!1231310 (= e!698834 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27087 (select (arr!38305 a!3806) from!3184) Nil!27088)))))

(declare-fun b!1231311 () Bool)

(declare-fun res!819005 () Bool)

(assert (=> b!1231311 (=> (not res!819005) (not e!698835))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231311 (= res!819005 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231312 () Bool)

(declare-fun res!819006 () Bool)

(assert (=> b!1231312 (=> (not res!819006) (not e!698835))))

(declare-fun noDuplicate!1743 (List!27091) Bool)

(assert (=> b!1231312 (= res!819006 (noDuplicate!1743 acc!823))))

(declare-fun b!1231313 () Bool)

(declare-fun res!819013 () Bool)

(assert (=> b!1231313 (=> (not res!819013) (not e!698835))))

(assert (=> b!1231313 (= res!819013 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!819008 () Bool)

(assert (=> start!102412 (=> (not res!819008) (not e!698835))))

(assert (=> start!102412 (= res!819008 (bvslt (size!38842 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102412 e!698835))

(declare-fun array_inv!29243 (array!79383) Bool)

(assert (=> start!102412 (array_inv!29243 a!3806)))

(assert (=> start!102412 true))

(declare-fun b!1231314 () Bool)

(declare-fun res!819009 () Bool)

(assert (=> b!1231314 (=> (not res!819009) (not e!698835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231314 (= res!819009 (validKeyInArray!0 (select (arr!38305 a!3806) from!3184)))))

(declare-fun b!1231315 () Bool)

(declare-fun e!698836 () Bool)

(assert (=> b!1231315 (= e!698836 true)))

(declare-fun lt!559784 () Bool)

(declare-fun lt!559785 () List!27091)

(assert (=> b!1231315 (= lt!559784 (contains!7162 lt!559785 (select (arr!38305 a!3806) from!3184)))))

(declare-fun b!1231316 () Bool)

(declare-fun res!819002 () Bool)

(assert (=> b!1231316 (=> res!819002 e!698836)))

(assert (=> b!1231316 (= res!819002 (contains!7162 lt!559785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231317 () Bool)

(declare-fun res!819010 () Bool)

(assert (=> b!1231317 (=> res!819010 e!698836)))

(assert (=> b!1231317 (= res!819010 (not (noDuplicate!1743 lt!559785)))))

(declare-fun b!1231318 () Bool)

(declare-fun res!819007 () Bool)

(assert (=> b!1231318 (=> (not res!819007) (not e!698835))))

(assert (=> b!1231318 (= res!819007 (validKeyInArray!0 k!2913))))

(declare-fun b!1231319 () Bool)

(declare-fun res!819003 () Bool)

(assert (=> b!1231319 (=> (not res!819003) (not e!698835))))

(assert (=> b!1231319 (= res!819003 (not (contains!7162 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231320 () Bool)

(assert (=> b!1231320 (= e!698835 (not e!698836))))

(declare-fun res!819004 () Bool)

(assert (=> b!1231320 (=> res!819004 e!698836)))

(assert (=> b!1231320 (= res!819004 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1231320 (= lt!559785 (Cons!27087 (select (arr!38305 a!3806) from!3184) Nil!27088))))

(assert (=> b!1231320 e!698834))

(declare-fun res!819011 () Bool)

(assert (=> b!1231320 (=> (not res!819011) (not e!698834))))

(assert (=> b!1231320 (= res!819011 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27088))))

(declare-datatypes ((Unit!40725 0))(
  ( (Unit!40726) )
))
(declare-fun lt!559783 () Unit!40725)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79383 List!27091 List!27091 (_ BitVec 32)) Unit!40725)

(assert (=> b!1231320 (= lt!559783 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27088 from!3184))))

(assert (=> b!1231320 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27087 (select (arr!38305 a!3806) from!3184) acc!823))))

(declare-fun b!1231321 () Bool)

(declare-fun res!819014 () Bool)

(assert (=> b!1231321 (=> res!819014 e!698836)))

(assert (=> b!1231321 (= res!819014 (contains!7162 lt!559785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102412 res!819008) b!1231318))

(assert (= (and b!1231318 res!819007) b!1231309))

(assert (= (and b!1231309 res!819012) b!1231312))

(assert (= (and b!1231312 res!819006) b!1231308))

(assert (= (and b!1231308 res!819001) b!1231319))

(assert (= (and b!1231319 res!819003) b!1231311))

(assert (= (and b!1231311 res!819005) b!1231313))

(assert (= (and b!1231313 res!819013) b!1231314))

(assert (= (and b!1231314 res!819009) b!1231320))

(assert (= (and b!1231320 res!819011) b!1231310))

(assert (= (and b!1231320 (not res!819004)) b!1231317))

(assert (= (and b!1231317 (not res!819010)) b!1231321))

(assert (= (and b!1231321 (not res!819014)) b!1231316))

(assert (= (and b!1231316 (not res!819002)) b!1231315))

(declare-fun m!1136093 () Bool)

(assert (=> b!1231316 m!1136093))

(declare-fun m!1136095 () Bool)

(assert (=> b!1231313 m!1136095))

(declare-fun m!1136097 () Bool)

(assert (=> b!1231320 m!1136097))

(declare-fun m!1136099 () Bool)

(assert (=> b!1231320 m!1136099))

(declare-fun m!1136101 () Bool)

(assert (=> b!1231320 m!1136101))

(declare-fun m!1136103 () Bool)

(assert (=> b!1231320 m!1136103))

(declare-fun m!1136105 () Bool)

(assert (=> b!1231319 m!1136105))

(declare-fun m!1136107 () Bool)

(assert (=> b!1231318 m!1136107))

(assert (=> b!1231315 m!1136097))

(assert (=> b!1231315 m!1136097))

(declare-fun m!1136109 () Bool)

(assert (=> b!1231315 m!1136109))

(declare-fun m!1136111 () Bool)

(assert (=> b!1231317 m!1136111))

(declare-fun m!1136113 () Bool)

(assert (=> start!102412 m!1136113))

(assert (=> b!1231310 m!1136097))

(declare-fun m!1136115 () Bool)

(assert (=> b!1231310 m!1136115))

(declare-fun m!1136117 () Bool)

(assert (=> b!1231312 m!1136117))

(declare-fun m!1136119 () Bool)

(assert (=> b!1231308 m!1136119))

(assert (=> b!1231314 m!1136097))

(assert (=> b!1231314 m!1136097))

(declare-fun m!1136121 () Bool)

(assert (=> b!1231314 m!1136121))

(declare-fun m!1136123 () Bool)

(assert (=> b!1231311 m!1136123))

(declare-fun m!1136125 () Bool)

(assert (=> b!1231321 m!1136125))

(push 1)

(assert (not b!1231318))

(assert (not b!1231310))

(assert (not b!1231311))

(assert (not b!1231316))

(assert (not b!1231314))

(assert (not b!1231320))

(assert (not start!102412))

(assert (not b!1231321))

(assert (not b!1231319))

(assert (not b!1231308))

(assert (not b!1231312))

(assert (not b!1231315))

(assert (not b!1231317))

(assert (not b!1231313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

