; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102508 () Bool)

(assert start!102508)

(declare-fun b!1232234 () Bool)

(declare-fun res!819907 () Bool)

(declare-fun e!699151 () Bool)

(assert (=> b!1232234 (=> (not res!819907) (not e!699151))))

(declare-datatypes ((List!27121 0))(
  ( (Nil!27118) (Cons!27117 (h!28335 (_ BitVec 64)) (t!40576 List!27121)) )
))
(declare-fun acc!823 () List!27121)

(declare-fun noDuplicate!1773 (List!27121) Bool)

(assert (=> b!1232234 (= res!819907 (noDuplicate!1773 acc!823))))

(declare-fun b!1232235 () Bool)

(declare-fun res!819905 () Bool)

(assert (=> b!1232235 (=> (not res!819905) (not e!699151))))

(declare-fun contains!7192 (List!27121 (_ BitVec 64)) Bool)

(assert (=> b!1232235 (= res!819905 (not (contains!7192 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232236 () Bool)

(declare-fun res!819909 () Bool)

(assert (=> b!1232236 (=> (not res!819909) (not e!699151))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79446 0))(
  ( (array!79447 (arr!38335 (Array (_ BitVec 32) (_ BitVec 64))) (size!38872 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79446)

(assert (=> b!1232236 (= res!819909 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38872 a!3806)) (bvslt from!3184 (size!38872 a!3806))))))

(declare-fun b!1232237 () Bool)

(declare-fun res!819903 () Bool)

(assert (=> b!1232237 (=> (not res!819903) (not e!699151))))

(declare-fun arrayNoDuplicates!0 (array!79446 (_ BitVec 32) List!27121) Bool)

(assert (=> b!1232237 (= res!819903 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232239 () Bool)

(declare-fun res!819911 () Bool)

(assert (=> b!1232239 (=> (not res!819911) (not e!699151))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232239 (= res!819911 (validKeyInArray!0 k!2913))))

(declare-fun b!1232240 () Bool)

(assert (=> b!1232240 (= e!699151 (not true))))

(assert (=> b!1232240 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27117 (select (arr!38335 a!3806) from!3184) acc!823))))

(declare-fun b!1232241 () Bool)

(declare-fun res!819906 () Bool)

(assert (=> b!1232241 (=> (not res!819906) (not e!699151))))

(assert (=> b!1232241 (= res!819906 (not (contains!7192 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232242 () Bool)

(declare-fun res!819908 () Bool)

(assert (=> b!1232242 (=> (not res!819908) (not e!699151))))

(assert (=> b!1232242 (= res!819908 (validKeyInArray!0 (select (arr!38335 a!3806) from!3184)))))

(declare-fun res!819904 () Bool)

(assert (=> start!102508 (=> (not res!819904) (not e!699151))))

(assert (=> start!102508 (= res!819904 (bvslt (size!38872 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102508 e!699151))

(declare-fun array_inv!29273 (array!79446) Bool)

(assert (=> start!102508 (array_inv!29273 a!3806)))

(assert (=> start!102508 true))

(declare-fun b!1232238 () Bool)

(declare-fun res!819910 () Bool)

(assert (=> b!1232238 (=> (not res!819910) (not e!699151))))

(declare-fun arrayContainsKey!0 (array!79446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232238 (= res!819910 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102508 res!819904) b!1232239))

(assert (= (and b!1232239 res!819911) b!1232236))

(assert (= (and b!1232236 res!819909) b!1232234))

(assert (= (and b!1232234 res!819907) b!1232235))

(assert (= (and b!1232235 res!819905) b!1232241))

(assert (= (and b!1232241 res!819906) b!1232238))

(assert (= (and b!1232238 res!819910) b!1232237))

(assert (= (and b!1232237 res!819903) b!1232242))

(assert (= (and b!1232242 res!819908) b!1232240))

(declare-fun m!1136845 () Bool)

(assert (=> b!1232240 m!1136845))

(declare-fun m!1136847 () Bool)

(assert (=> b!1232240 m!1136847))

(declare-fun m!1136849 () Bool)

(assert (=> start!102508 m!1136849))

(declare-fun m!1136851 () Bool)

(assert (=> b!1232237 m!1136851))

(assert (=> b!1232242 m!1136845))

(assert (=> b!1232242 m!1136845))

(declare-fun m!1136853 () Bool)

(assert (=> b!1232242 m!1136853))

(declare-fun m!1136855 () Bool)

(assert (=> b!1232238 m!1136855))

(declare-fun m!1136857 () Bool)

(assert (=> b!1232239 m!1136857))

(declare-fun m!1136859 () Bool)

(assert (=> b!1232241 m!1136859))

(declare-fun m!1136861 () Bool)

(assert (=> b!1232234 m!1136861))

(declare-fun m!1136863 () Bool)

(assert (=> b!1232235 m!1136863))

(push 1)

(assert (not b!1232242))

(assert (not b!1232239))

(assert (not b!1232240))

(assert (not b!1232238))

(assert (not b!1232241))

(assert (not b!1232237))

(assert (not b!1232234))

(assert (not b!1232235))

(assert (not start!102508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

