; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102654 () Bool)

(assert start!102654)

(declare-fun res!822201 () Bool)

(declare-fun e!699945 () Bool)

(assert (=> start!102654 (=> (not res!822201) (not e!699945))))

(declare-datatypes ((array!79544 0))(
  ( (array!79545 (arr!38381 (Array (_ BitVec 32) (_ BitVec 64))) (size!38917 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79544)

(assert (=> start!102654 (= res!822201 (bvslt (size!38917 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102654 e!699945))

(declare-fun array_inv!29229 (array!79544) Bool)

(assert (=> start!102654 (array_inv!29229 a!3806)))

(assert (=> start!102654 true))

(declare-fun b!1234019 () Bool)

(declare-fun res!822203 () Bool)

(assert (=> b!1234019 (=> (not res!822203) (not e!699945))))

(declare-datatypes ((List!27154 0))(
  ( (Nil!27151) (Cons!27150 (h!28359 (_ BitVec 64)) (t!40617 List!27154)) )
))
(declare-fun acc!823 () List!27154)

(declare-fun contains!7216 (List!27154 (_ BitVec 64)) Bool)

(assert (=> b!1234019 (= res!822203 (not (contains!7216 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234020 () Bool)

(declare-fun res!822205 () Bool)

(assert (=> b!1234020 (=> (not res!822205) (not e!699945))))

(assert (=> b!1234020 (= res!822205 (not (contains!7216 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234021 () Bool)

(declare-fun res!822202 () Bool)

(assert (=> b!1234021 (=> (not res!822202) (not e!699945))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234021 (= res!822202 (validKeyInArray!0 k!2913))))

(declare-fun b!1234022 () Bool)

(assert (=> b!1234022 (= e!699945 false)))

(declare-fun lt!559790 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79544 (_ BitVec 32) List!27154) Bool)

(assert (=> b!1234022 (= lt!559790 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234023 () Bool)

(declare-fun res!822199 () Bool)

(assert (=> b!1234023 (=> (not res!822199) (not e!699945))))

(declare-fun arrayContainsKey!0 (array!79544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234023 (= res!822199 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234024 () Bool)

(declare-fun res!822204 () Bool)

(assert (=> b!1234024 (=> (not res!822204) (not e!699945))))

(assert (=> b!1234024 (= res!822204 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38917 a!3806)) (bvslt from!3184 (size!38917 a!3806))))))

(declare-fun b!1234025 () Bool)

(declare-fun res!822200 () Bool)

(assert (=> b!1234025 (=> (not res!822200) (not e!699945))))

(declare-fun noDuplicate!1813 (List!27154) Bool)

(assert (=> b!1234025 (= res!822200 (noDuplicate!1813 acc!823))))

(assert (= (and start!102654 res!822201) b!1234021))

(assert (= (and b!1234021 res!822202) b!1234024))

(assert (= (and b!1234024 res!822204) b!1234025))

(assert (= (and b!1234025 res!822200) b!1234020))

(assert (= (and b!1234020 res!822205) b!1234019))

(assert (= (and b!1234019 res!822203) b!1234023))

(assert (= (and b!1234023 res!822199) b!1234022))

(declare-fun m!1138081 () Bool)

(assert (=> b!1234023 m!1138081))

(declare-fun m!1138083 () Bool)

(assert (=> b!1234025 m!1138083))

(declare-fun m!1138085 () Bool)

(assert (=> b!1234019 m!1138085))

(declare-fun m!1138087 () Bool)

(assert (=> b!1234021 m!1138087))

(declare-fun m!1138089 () Bool)

(assert (=> b!1234020 m!1138089))

(declare-fun m!1138091 () Bool)

(assert (=> b!1234022 m!1138091))

(declare-fun m!1138093 () Bool)

(assert (=> start!102654 m!1138093))

(push 1)

(assert (not b!1234021))

(assert (not b!1234025))

(assert (not b!1234019))

(assert (not b!1234020))

(assert (not start!102654))

(assert (not b!1234022))

(assert (not b!1234023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

