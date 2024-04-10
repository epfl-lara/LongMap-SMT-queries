; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102006 () Bool)

(assert start!102006)

(declare-fun b!1228280 () Bool)

(declare-fun res!816895 () Bool)

(declare-fun e!697178 () Bool)

(assert (=> b!1228280 (=> (not res!816895) (not e!697178))))

(declare-datatypes ((List!27035 0))(
  ( (Nil!27032) (Cons!27031 (h!28240 (_ BitVec 64)) (t!40498 List!27035)) )
))
(declare-fun acc!823 () List!27035)

(declare-fun contains!7097 (List!27035 (_ BitVec 64)) Bool)

(assert (=> b!1228280 (= res!816895 (not (contains!7097 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228282 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228282 (= e!697178 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(declare-datatypes ((array!79279 0))(
  ( (array!79280 (arr!38262 (Array (_ BitVec 32) (_ BitVec 64))) (size!38798 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79279)

(declare-fun arrayNoDuplicates!0 (array!79279 (_ BitVec 32) List!27035) Bool)

(assert (=> b!1228282 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27032)))

(declare-datatypes ((Unit!40690 0))(
  ( (Unit!40691) )
))
(declare-fun lt!558981 () Unit!40690)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79279 List!27035 List!27035 (_ BitVec 32)) Unit!40690)

(assert (=> b!1228282 (= lt!558981 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27032 from!3184))))

(assert (=> b!1228282 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27031 (select (arr!38262 a!3806) from!3184) acc!823))))

(declare-fun b!1228283 () Bool)

(declare-fun res!816898 () Bool)

(assert (=> b!1228283 (=> (not res!816898) (not e!697178))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228283 (= res!816898 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228284 () Bool)

(declare-fun res!816897 () Bool)

(assert (=> b!1228284 (=> (not res!816897) (not e!697178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228284 (= res!816897 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228285 () Bool)

(declare-fun res!816892 () Bool)

(assert (=> b!1228285 (=> (not res!816892) (not e!697178))))

(assert (=> b!1228285 (= res!816892 (validKeyInArray!0 (select (arr!38262 a!3806) from!3184)))))

(declare-fun b!1228286 () Bool)

(declare-fun res!816896 () Bool)

(assert (=> b!1228286 (=> (not res!816896) (not e!697178))))

(assert (=> b!1228286 (= res!816896 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38798 a!3806)) (bvslt from!3184 (size!38798 a!3806))))))

(declare-fun b!1228281 () Bool)

(declare-fun res!816893 () Bool)

(assert (=> b!1228281 (=> (not res!816893) (not e!697178))))

(assert (=> b!1228281 (= res!816893 (not (contains!7097 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816899 () Bool)

(assert (=> start!102006 (=> (not res!816899) (not e!697178))))

(assert (=> start!102006 (= res!816899 (bvslt (size!38798 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102006 e!697178))

(declare-fun array_inv!29110 (array!79279) Bool)

(assert (=> start!102006 (array_inv!29110 a!3806)))

(assert (=> start!102006 true))

(declare-fun b!1228287 () Bool)

(declare-fun res!816894 () Bool)

(assert (=> b!1228287 (=> (not res!816894) (not e!697178))))

(declare-fun noDuplicate!1694 (List!27035) Bool)

(assert (=> b!1228287 (= res!816894 (noDuplicate!1694 acc!823))))

(declare-fun b!1228288 () Bool)

(declare-fun res!816900 () Bool)

(assert (=> b!1228288 (=> (not res!816900) (not e!697178))))

(assert (=> b!1228288 (= res!816900 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102006 res!816899) b!1228284))

(assert (= (and b!1228284 res!816897) b!1228286))

(assert (= (and b!1228286 res!816896) b!1228287))

(assert (= (and b!1228287 res!816894) b!1228281))

(assert (= (and b!1228281 res!816893) b!1228280))

(assert (= (and b!1228280 res!816895) b!1228283))

(assert (= (and b!1228283 res!816898) b!1228288))

(assert (= (and b!1228288 res!816900) b!1228285))

(assert (= (and b!1228285 res!816892) b!1228282))

(declare-fun m!1132839 () Bool)

(assert (=> b!1228288 m!1132839))

(declare-fun m!1132841 () Bool)

(assert (=> b!1228285 m!1132841))

(assert (=> b!1228285 m!1132841))

(declare-fun m!1132843 () Bool)

(assert (=> b!1228285 m!1132843))

(declare-fun m!1132845 () Bool)

(assert (=> b!1228282 m!1132845))

(declare-fun m!1132847 () Bool)

(assert (=> b!1228282 m!1132847))

(assert (=> b!1228282 m!1132841))

(declare-fun m!1132849 () Bool)

(assert (=> b!1228282 m!1132849))

(declare-fun m!1132851 () Bool)

(assert (=> b!1228280 m!1132851))

(declare-fun m!1132853 () Bool)

(assert (=> start!102006 m!1132853))

(declare-fun m!1132855 () Bool)

(assert (=> b!1228287 m!1132855))

(declare-fun m!1132857 () Bool)

(assert (=> b!1228281 m!1132857))

(declare-fun m!1132859 () Bool)

(assert (=> b!1228284 m!1132859))

(declare-fun m!1132861 () Bool)

(assert (=> b!1228283 m!1132861))

(check-sat (not b!1228287) (not b!1228280) (not b!1228281) (not b!1228283) (not b!1228288) (not start!102006) (not b!1228285) (not b!1228284) (not b!1228282))
(check-sat)
