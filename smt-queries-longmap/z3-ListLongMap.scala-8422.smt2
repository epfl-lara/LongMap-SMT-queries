; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102814 () Bool)

(assert start!102814)

(declare-fun b!1234578 () Bool)

(declare-fun res!822006 () Bool)

(declare-fun e!700476 () Bool)

(assert (=> b!1234578 (=> (not res!822006) (not e!700476))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79541 0))(
  ( (array!79542 (arr!38375 (Array (_ BitVec 32) (_ BitVec 64))) (size!38912 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79541)

(assert (=> b!1234578 (= res!822006 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38912 a!3806)) (bvslt from!3184 (size!38912 a!3806))))))

(declare-fun res!822005 () Bool)

(assert (=> start!102814 (=> (not res!822005) (not e!700476))))

(assert (=> start!102814 (= res!822005 (bvslt (size!38912 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102814 e!700476))

(declare-fun array_inv!29313 (array!79541) Bool)

(assert (=> start!102814 (array_inv!29313 a!3806)))

(assert (=> start!102814 true))

(declare-fun b!1234579 () Bool)

(declare-fun res!822007 () Bool)

(declare-fun e!700477 () Bool)

(assert (=> b!1234579 (=> res!822007 e!700477)))

(declare-datatypes ((List!27161 0))(
  ( (Nil!27158) (Cons!27157 (h!28375 (_ BitVec 64)) (t!40616 List!27161)) )
))
(declare-fun lt!560135 () List!27161)

(declare-fun contains!7232 (List!27161 (_ BitVec 64)) Bool)

(assert (=> b!1234579 (= res!822007 (contains!7232 lt!560135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234580 () Bool)

(declare-fun res!822010 () Bool)

(assert (=> b!1234580 (=> (not res!822010) (not e!700476))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234580 (= res!822010 (validKeyInArray!0 k0!2913))))

(declare-fun b!1234581 () Bool)

(declare-fun res!822008 () Bool)

(assert (=> b!1234581 (=> (not res!822008) (not e!700476))))

(declare-fun acc!823 () List!27161)

(declare-fun noDuplicate!1813 (List!27161) Bool)

(assert (=> b!1234581 (= res!822008 (noDuplicate!1813 acc!823))))

(declare-fun b!1234582 () Bool)

(declare-fun res!822012 () Bool)

(assert (=> b!1234582 (=> (not res!822012) (not e!700476))))

(declare-fun arrayContainsKey!0 (array!79541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234582 (= res!822012 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234583 () Bool)

(declare-fun e!700475 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79541 (_ BitVec 32) List!27161) Bool)

(assert (=> b!1234583 (= e!700475 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27157 (select (arr!38375 a!3806) from!3184) Nil!27158)))))

(declare-fun b!1234584 () Bool)

(declare-fun res!822009 () Bool)

(assert (=> b!1234584 (=> (not res!822009) (not e!700476))))

(assert (=> b!1234584 (= res!822009 (not (contains!7232 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234585 () Bool)

(declare-fun res!822014 () Bool)

(assert (=> b!1234585 (=> (not res!822014) (not e!700476))))

(assert (=> b!1234585 (= res!822014 (validKeyInArray!0 (select (arr!38375 a!3806) from!3184)))))

(declare-fun b!1234586 () Bool)

(declare-fun res!822003 () Bool)

(assert (=> b!1234586 (=> (not res!822003) (not e!700476))))

(assert (=> b!1234586 (= res!822003 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234587 () Bool)

(assert (=> b!1234587 (= e!700477 true)))

(declare-fun lt!560133 () Bool)

(assert (=> b!1234587 (= lt!560133 (contains!7232 lt!560135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234588 () Bool)

(assert (=> b!1234588 (= e!700476 (not e!700477))))

(declare-fun res!822004 () Bool)

(assert (=> b!1234588 (=> res!822004 e!700477)))

(assert (=> b!1234588 (= res!822004 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1234588 (= lt!560135 (Cons!27157 (select (arr!38375 a!3806) from!3184) Nil!27158))))

(assert (=> b!1234588 e!700475))

(declare-fun res!822011 () Bool)

(assert (=> b!1234588 (=> (not res!822011) (not e!700475))))

(assert (=> b!1234588 (= res!822011 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27158))))

(declare-datatypes ((Unit!40805 0))(
  ( (Unit!40806) )
))
(declare-fun lt!560134 () Unit!40805)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79541 List!27161 List!27161 (_ BitVec 32)) Unit!40805)

(assert (=> b!1234588 (= lt!560134 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27158 from!3184))))

(assert (=> b!1234588 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27157 (select (arr!38375 a!3806) from!3184) acc!823))))

(declare-fun b!1234589 () Bool)

(declare-fun res!822015 () Bool)

(assert (=> b!1234589 (=> res!822015 e!700477)))

(assert (=> b!1234589 (= res!822015 (not (noDuplicate!1813 lt!560135)))))

(declare-fun b!1234590 () Bool)

(declare-fun res!822013 () Bool)

(assert (=> b!1234590 (=> (not res!822013) (not e!700476))))

(assert (=> b!1234590 (= res!822013 (not (contains!7232 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102814 res!822005) b!1234580))

(assert (= (and b!1234580 res!822010) b!1234578))

(assert (= (and b!1234578 res!822006) b!1234581))

(assert (= (and b!1234581 res!822008) b!1234590))

(assert (= (and b!1234590 res!822013) b!1234584))

(assert (= (and b!1234584 res!822009) b!1234582))

(assert (= (and b!1234582 res!822012) b!1234586))

(assert (= (and b!1234586 res!822003) b!1234585))

(assert (= (and b!1234585 res!822014) b!1234588))

(assert (= (and b!1234588 res!822011) b!1234583))

(assert (= (and b!1234588 (not res!822004)) b!1234589))

(assert (= (and b!1234589 (not res!822015)) b!1234579))

(assert (= (and b!1234579 (not res!822007)) b!1234587))

(declare-fun m!1139003 () Bool)

(assert (=> b!1234579 m!1139003))

(declare-fun m!1139005 () Bool)

(assert (=> b!1234590 m!1139005))

(declare-fun m!1139007 () Bool)

(assert (=> b!1234587 m!1139007))

(declare-fun m!1139009 () Bool)

(assert (=> b!1234584 m!1139009))

(declare-fun m!1139011 () Bool)

(assert (=> b!1234580 m!1139011))

(declare-fun m!1139013 () Bool)

(assert (=> b!1234585 m!1139013))

(assert (=> b!1234585 m!1139013))

(declare-fun m!1139015 () Bool)

(assert (=> b!1234585 m!1139015))

(assert (=> b!1234583 m!1139013))

(declare-fun m!1139017 () Bool)

(assert (=> b!1234583 m!1139017))

(assert (=> b!1234588 m!1139013))

(declare-fun m!1139019 () Bool)

(assert (=> b!1234588 m!1139019))

(declare-fun m!1139021 () Bool)

(assert (=> b!1234588 m!1139021))

(declare-fun m!1139023 () Bool)

(assert (=> b!1234588 m!1139023))

(declare-fun m!1139025 () Bool)

(assert (=> start!102814 m!1139025))

(declare-fun m!1139027 () Bool)

(assert (=> b!1234581 m!1139027))

(declare-fun m!1139029 () Bool)

(assert (=> b!1234589 m!1139029))

(declare-fun m!1139031 () Bool)

(assert (=> b!1234586 m!1139031))

(declare-fun m!1139033 () Bool)

(assert (=> b!1234582 m!1139033))

(check-sat (not b!1234581) (not b!1234589) (not b!1234586) (not b!1234583) (not b!1234590) (not b!1234582) (not start!102814) (not b!1234585) (not b!1234584) (not b!1234587) (not b!1234579) (not b!1234588) (not b!1234580))
(check-sat)
