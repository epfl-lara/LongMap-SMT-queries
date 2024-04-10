; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102010 () Bool)

(assert start!102010)

(declare-fun b!1228334 () Bool)

(declare-fun res!816948 () Bool)

(declare-fun e!697190 () Bool)

(assert (=> b!1228334 (=> (not res!816948) (not e!697190))))

(declare-datatypes ((List!27037 0))(
  ( (Nil!27034) (Cons!27033 (h!28242 (_ BitVec 64)) (t!40500 List!27037)) )
))
(declare-fun acc!823 () List!27037)

(declare-fun noDuplicate!1696 (List!27037) Bool)

(assert (=> b!1228334 (= res!816948 (noDuplicate!1696 acc!823))))

(declare-fun res!816950 () Bool)

(assert (=> start!102010 (=> (not res!816950) (not e!697190))))

(declare-datatypes ((array!79283 0))(
  ( (array!79284 (arr!38264 (Array (_ BitVec 32) (_ BitVec 64))) (size!38800 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79283)

(assert (=> start!102010 (= res!816950 (bvslt (size!38800 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102010 e!697190))

(declare-fun array_inv!29112 (array!79283) Bool)

(assert (=> start!102010 (array_inv!29112 a!3806)))

(assert (=> start!102010 true))

(declare-fun b!1228335 () Bool)

(declare-fun res!816947 () Bool)

(assert (=> b!1228335 (=> (not res!816947) (not e!697190))))

(declare-fun contains!7099 (List!27037 (_ BitVec 64)) Bool)

(assert (=> b!1228335 (= res!816947 (not (contains!7099 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228336 () Bool)

(declare-fun res!816953 () Bool)

(assert (=> b!1228336 (=> (not res!816953) (not e!697190))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228336 (= res!816953 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228337 () Bool)

(declare-fun res!816946 () Bool)

(assert (=> b!1228337 (=> (not res!816946) (not e!697190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228337 (= res!816946 (validKeyInArray!0 k!2913))))

(declare-fun b!1228338 () Bool)

(declare-fun res!816949 () Bool)

(assert (=> b!1228338 (=> (not res!816949) (not e!697190))))

(assert (=> b!1228338 (= res!816949 (not (contains!7099 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228339 () Bool)

(declare-fun res!816954 () Bool)

(assert (=> b!1228339 (=> (not res!816954) (not e!697190))))

(assert (=> b!1228339 (= res!816954 (validKeyInArray!0 (select (arr!38264 a!3806) from!3184)))))

(declare-fun b!1228340 () Bool)

(declare-fun res!816952 () Bool)

(assert (=> b!1228340 (=> (not res!816952) (not e!697190))))

(assert (=> b!1228340 (= res!816952 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38800 a!3806)) (bvslt from!3184 (size!38800 a!3806))))))

(declare-fun b!1228341 () Bool)

(assert (=> b!1228341 (= e!697190 (not true))))

(declare-fun arrayNoDuplicates!0 (array!79283 (_ BitVec 32) List!27037) Bool)

(assert (=> b!1228341 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27034)))

(declare-datatypes ((Unit!40694 0))(
  ( (Unit!40695) )
))
(declare-fun lt!558987 () Unit!40694)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79283 List!27037 List!27037 (_ BitVec 32)) Unit!40694)

(assert (=> b!1228341 (= lt!558987 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27034 from!3184))))

(assert (=> b!1228341 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27033 (select (arr!38264 a!3806) from!3184) acc!823))))

(declare-fun b!1228342 () Bool)

(declare-fun res!816951 () Bool)

(assert (=> b!1228342 (=> (not res!816951) (not e!697190))))

(assert (=> b!1228342 (= res!816951 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102010 res!816950) b!1228337))

(assert (= (and b!1228337 res!816946) b!1228340))

(assert (= (and b!1228340 res!816952) b!1228334))

(assert (= (and b!1228334 res!816948) b!1228338))

(assert (= (and b!1228338 res!816949) b!1228335))

(assert (= (and b!1228335 res!816947) b!1228336))

(assert (= (and b!1228336 res!816953) b!1228342))

(assert (= (and b!1228342 res!816951) b!1228339))

(assert (= (and b!1228339 res!816954) b!1228341))

(declare-fun m!1132887 () Bool)

(assert (=> start!102010 m!1132887))

(declare-fun m!1132889 () Bool)

(assert (=> b!1228337 m!1132889))

(declare-fun m!1132891 () Bool)

(assert (=> b!1228336 m!1132891))

(declare-fun m!1132893 () Bool)

(assert (=> b!1228342 m!1132893))

(declare-fun m!1132895 () Bool)

(assert (=> b!1228339 m!1132895))

(assert (=> b!1228339 m!1132895))

(declare-fun m!1132897 () Bool)

(assert (=> b!1228339 m!1132897))

(declare-fun m!1132899 () Bool)

(assert (=> b!1228341 m!1132899))

(declare-fun m!1132901 () Bool)

(assert (=> b!1228341 m!1132901))

(assert (=> b!1228341 m!1132895))

(declare-fun m!1132903 () Bool)

(assert (=> b!1228341 m!1132903))

(declare-fun m!1132905 () Bool)

(assert (=> b!1228338 m!1132905))

(declare-fun m!1132907 () Bool)

(assert (=> b!1228335 m!1132907))

(declare-fun m!1132909 () Bool)

(assert (=> b!1228334 m!1132909))

(push 1)

(assert (not b!1228341))

(assert (not b!1228339))

(assert (not b!1228336))

(assert (not b!1228337))

(assert (not b!1228338))

(assert (not b!1228334))

(assert (not start!102010))

(assert (not b!1228342))

(assert (not b!1228335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

