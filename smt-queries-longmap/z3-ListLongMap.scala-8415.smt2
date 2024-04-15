; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102424 () Bool)

(assert start!102424)

(declare-fun b!1231884 () Bool)

(declare-fun res!820304 () Bool)

(declare-fun e!698811 () Bool)

(assert (=> b!1231884 (=> (not res!820304) (not e!698811))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231884 (= res!820304 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231885 () Bool)

(declare-fun res!820303 () Bool)

(assert (=> b!1231885 (=> (not res!820303) (not e!698811))))

(declare-datatypes ((array!79378 0))(
  ( (array!79379 (arr!38303 (Array (_ BitVec 32) (_ BitVec 64))) (size!38841 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79378)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1231885 (= res!820303 (validKeyInArray!0 (select (arr!38303 a!3806) from!3184)))))

(declare-fun b!1231886 () Bool)

(declare-fun res!820300 () Bool)

(assert (=> b!1231886 (=> (not res!820300) (not e!698811))))

(declare-datatypes ((List!27177 0))(
  ( (Nil!27174) (Cons!27173 (h!28382 (_ BitVec 64)) (t!40631 List!27177)) )
))
(declare-fun acc!823 () List!27177)

(declare-fun contains!7149 (List!27177 (_ BitVec 64)) Bool)

(assert (=> b!1231886 (= res!820300 (not (contains!7149 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231887 () Bool)

(declare-fun res!820307 () Bool)

(assert (=> b!1231887 (=> (not res!820307) (not e!698811))))

(declare-fun arrayNoDuplicates!0 (array!79378 (_ BitVec 32) List!27177) Bool)

(assert (=> b!1231887 (= res!820307 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!820306 () Bool)

(assert (=> start!102424 (=> (not res!820306) (not e!698811))))

(assert (=> start!102424 (= res!820306 (bvslt (size!38841 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102424 e!698811))

(declare-fun array_inv!29286 (array!79378) Bool)

(assert (=> start!102424 (array_inv!29286 a!3806)))

(assert (=> start!102424 true))

(declare-fun b!1231888 () Bool)

(declare-fun res!820302 () Bool)

(assert (=> b!1231888 (=> (not res!820302) (not e!698811))))

(declare-fun arrayContainsKey!0 (array!79378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231888 (= res!820302 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231889 () Bool)

(declare-fun res!820305 () Bool)

(assert (=> b!1231889 (=> (not res!820305) (not e!698811))))

(assert (=> b!1231889 (= res!820305 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38841 a!3806)) (bvslt from!3184 (size!38841 a!3806))))))

(declare-fun b!1231890 () Bool)

(assert (=> b!1231890 (= e!698811 (not true))))

(declare-fun e!698812 () Bool)

(assert (=> b!1231890 e!698812))

(declare-fun res!820299 () Bool)

(assert (=> b!1231890 (=> (not res!820299) (not e!698812))))

(assert (=> b!1231890 (= res!820299 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27174))))

(declare-datatypes ((Unit!40637 0))(
  ( (Unit!40638) )
))
(declare-fun lt!559295 () Unit!40637)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79378 List!27177 List!27177 (_ BitVec 32)) Unit!40637)

(assert (=> b!1231890 (= lt!559295 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27174 from!3184))))

(assert (=> b!1231890 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27173 (select (arr!38303 a!3806) from!3184) acc!823))))

(declare-fun b!1231891 () Bool)

(declare-fun res!820301 () Bool)

(assert (=> b!1231891 (=> (not res!820301) (not e!698811))))

(assert (=> b!1231891 (= res!820301 (not (contains!7149 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231892 () Bool)

(assert (=> b!1231892 (= e!698812 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27173 (select (arr!38303 a!3806) from!3184) Nil!27174)))))

(declare-fun b!1231893 () Bool)

(declare-fun res!820298 () Bool)

(assert (=> b!1231893 (=> (not res!820298) (not e!698811))))

(declare-fun noDuplicate!1792 (List!27177) Bool)

(assert (=> b!1231893 (= res!820298 (noDuplicate!1792 acc!823))))

(assert (= (and start!102424 res!820306) b!1231884))

(assert (= (and b!1231884 res!820304) b!1231889))

(assert (= (and b!1231889 res!820305) b!1231893))

(assert (= (and b!1231893 res!820298) b!1231886))

(assert (= (and b!1231886 res!820300) b!1231891))

(assert (= (and b!1231891 res!820301) b!1231888))

(assert (= (and b!1231888 res!820302) b!1231887))

(assert (= (and b!1231887 res!820307) b!1231885))

(assert (= (and b!1231885 res!820303) b!1231890))

(assert (= (and b!1231890 res!820299) b!1231892))

(declare-fun m!1135509 () Bool)

(assert (=> b!1231886 m!1135509))

(declare-fun m!1135511 () Bool)

(assert (=> b!1231884 m!1135511))

(declare-fun m!1135513 () Bool)

(assert (=> b!1231890 m!1135513))

(declare-fun m!1135515 () Bool)

(assert (=> b!1231890 m!1135515))

(declare-fun m!1135517 () Bool)

(assert (=> b!1231890 m!1135517))

(declare-fun m!1135519 () Bool)

(assert (=> b!1231890 m!1135519))

(declare-fun m!1135521 () Bool)

(assert (=> b!1231887 m!1135521))

(declare-fun m!1135523 () Bool)

(assert (=> b!1231891 m!1135523))

(declare-fun m!1135525 () Bool)

(assert (=> b!1231888 m!1135525))

(assert (=> b!1231892 m!1135517))

(declare-fun m!1135527 () Bool)

(assert (=> b!1231892 m!1135527))

(declare-fun m!1135529 () Bool)

(assert (=> b!1231893 m!1135529))

(assert (=> b!1231885 m!1135517))

(assert (=> b!1231885 m!1135517))

(declare-fun m!1135531 () Bool)

(assert (=> b!1231885 m!1135531))

(declare-fun m!1135533 () Bool)

(assert (=> start!102424 m!1135533))

(check-sat (not start!102424) (not b!1231890) (not b!1231891) (not b!1231893) (not b!1231885) (not b!1231892) (not b!1231886) (not b!1231888) (not b!1231887) (not b!1231884))
(check-sat)
