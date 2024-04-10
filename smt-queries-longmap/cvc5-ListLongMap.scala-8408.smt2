; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102264 () Bool)

(assert start!102264)

(declare-fun b!1230852 () Bool)

(declare-fun e!698273 () Bool)

(assert (=> b!1230852 (= e!698273 (not true))))

(declare-datatypes ((array!79406 0))(
  ( (array!79407 (arr!38321 (Array (_ BitVec 32) (_ BitVec 64))) (size!38857 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79406)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27094 0))(
  ( (Nil!27091) (Cons!27090 (h!28299 (_ BitVec 64)) (t!40557 List!27094)) )
))
(declare-fun acc!823 () List!27094)

(declare-fun arrayNoDuplicates!0 (array!79406 (_ BitVec 32) List!27094) Bool)

(assert (=> b!1230852 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27090 (select (arr!38321 a!3806) from!3184) acc!823))))

(declare-fun b!1230853 () Bool)

(declare-fun res!819314 () Bool)

(assert (=> b!1230853 (=> (not res!819314) (not e!698273))))

(declare-fun contains!7156 (List!27094 (_ BitVec 64)) Bool)

(assert (=> b!1230853 (= res!819314 (not (contains!7156 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!819315 () Bool)

(assert (=> start!102264 (=> (not res!819315) (not e!698273))))

(assert (=> start!102264 (= res!819315 (bvslt (size!38857 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102264 e!698273))

(declare-fun array_inv!29169 (array!79406) Bool)

(assert (=> start!102264 (array_inv!29169 a!3806)))

(assert (=> start!102264 true))

(declare-fun b!1230854 () Bool)

(declare-fun res!819317 () Bool)

(assert (=> b!1230854 (=> (not res!819317) (not e!698273))))

(declare-fun noDuplicate!1753 (List!27094) Bool)

(assert (=> b!1230854 (= res!819317 (noDuplicate!1753 acc!823))))

(declare-fun b!1230855 () Bool)

(declare-fun res!819321 () Bool)

(assert (=> b!1230855 (=> (not res!819321) (not e!698273))))

(assert (=> b!1230855 (= res!819321 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38857 a!3806)) (bvslt from!3184 (size!38857 a!3806))))))

(declare-fun b!1230856 () Bool)

(declare-fun res!819318 () Bool)

(assert (=> b!1230856 (=> (not res!819318) (not e!698273))))

(assert (=> b!1230856 (= res!819318 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230857 () Bool)

(declare-fun res!819320 () Bool)

(assert (=> b!1230857 (=> (not res!819320) (not e!698273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230857 (= res!819320 (validKeyInArray!0 (select (arr!38321 a!3806) from!3184)))))

(declare-fun b!1230858 () Bool)

(declare-fun res!819319 () Bool)

(assert (=> b!1230858 (=> (not res!819319) (not e!698273))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1230858 (= res!819319 (validKeyInArray!0 k!2913))))

(declare-fun b!1230859 () Bool)

(declare-fun res!819322 () Bool)

(assert (=> b!1230859 (=> (not res!819322) (not e!698273))))

(assert (=> b!1230859 (= res!819322 (not (contains!7156 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230860 () Bool)

(declare-fun res!819316 () Bool)

(assert (=> b!1230860 (=> (not res!819316) (not e!698273))))

(declare-fun arrayContainsKey!0 (array!79406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230860 (= res!819316 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102264 res!819315) b!1230858))

(assert (= (and b!1230858 res!819319) b!1230855))

(assert (= (and b!1230855 res!819321) b!1230854))

(assert (= (and b!1230854 res!819317) b!1230853))

(assert (= (and b!1230853 res!819314) b!1230859))

(assert (= (and b!1230859 res!819322) b!1230860))

(assert (= (and b!1230860 res!819316) b!1230856))

(assert (= (and b!1230856 res!819318) b!1230857))

(assert (= (and b!1230857 res!819320) b!1230852))

(declare-fun m!1135147 () Bool)

(assert (=> b!1230860 m!1135147))

(declare-fun m!1135149 () Bool)

(assert (=> start!102264 m!1135149))

(declare-fun m!1135151 () Bool)

(assert (=> b!1230857 m!1135151))

(assert (=> b!1230857 m!1135151))

(declare-fun m!1135153 () Bool)

(assert (=> b!1230857 m!1135153))

(declare-fun m!1135155 () Bool)

(assert (=> b!1230859 m!1135155))

(assert (=> b!1230852 m!1135151))

(declare-fun m!1135157 () Bool)

(assert (=> b!1230852 m!1135157))

(declare-fun m!1135159 () Bool)

(assert (=> b!1230854 m!1135159))

(declare-fun m!1135161 () Bool)

(assert (=> b!1230856 m!1135161))

(declare-fun m!1135163 () Bool)

(assert (=> b!1230858 m!1135163))

(declare-fun m!1135165 () Bool)

(assert (=> b!1230853 m!1135165))

(push 1)

(assert (not b!1230852))

(assert (not b!1230853))

(assert (not b!1230854))

(assert (not b!1230857))

(assert (not b!1230859))

(assert (not start!102264))

(assert (not b!1230860))

(assert (not b!1230856))

(assert (not b!1230858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

