; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102436 () Bool)

(assert start!102436)

(declare-fun b!1232102 () Bool)

(declare-fun res!820485 () Bool)

(declare-fun e!698891 () Bool)

(assert (=> b!1232102 (=> (not res!820485) (not e!698891))))

(declare-datatypes ((array!79467 0))(
  ( (array!79468 (arr!38347 (Array (_ BitVec 32) (_ BitVec 64))) (size!38883 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79467)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232102 (= res!820485 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232103 () Bool)

(assert (=> b!1232103 (= e!698891 (not true))))

(declare-fun e!698890 () Bool)

(assert (=> b!1232103 e!698890))

(declare-fun res!820480 () Bool)

(assert (=> b!1232103 (=> (not res!820480) (not e!698890))))

(declare-datatypes ((List!27120 0))(
  ( (Nil!27117) (Cons!27116 (h!28325 (_ BitVec 64)) (t!40583 List!27120)) )
))
(declare-fun arrayNoDuplicates!0 (array!79467 (_ BitVec 32) List!27120) Bool)

(assert (=> b!1232103 (= res!820480 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27117))))

(declare-fun acc!823 () List!27120)

(declare-datatypes ((Unit!40800 0))(
  ( (Unit!40801) )
))
(declare-fun lt!559484 () Unit!40800)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79467 List!27120 List!27120 (_ BitVec 32)) Unit!40800)

(assert (=> b!1232103 (= lt!559484 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27117 from!3184))))

(assert (=> b!1232103 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27116 (select (arr!38347 a!3806) from!3184) acc!823))))

(declare-fun b!1232104 () Bool)

(declare-fun res!820484 () Bool)

(assert (=> b!1232104 (=> (not res!820484) (not e!698891))))

(declare-fun noDuplicate!1779 (List!27120) Bool)

(assert (=> b!1232104 (= res!820484 (noDuplicate!1779 acc!823))))

(declare-fun b!1232105 () Bool)

(declare-fun res!820486 () Bool)

(assert (=> b!1232105 (=> (not res!820486) (not e!698891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232105 (= res!820486 (validKeyInArray!0 k!2913))))

(declare-fun b!1232106 () Bool)

(declare-fun res!820488 () Bool)

(assert (=> b!1232106 (=> (not res!820488) (not e!698891))))

(assert (=> b!1232106 (= res!820488 (validKeyInArray!0 (select (arr!38347 a!3806) from!3184)))))

(declare-fun b!1232107 () Bool)

(declare-fun res!820482 () Bool)

(assert (=> b!1232107 (=> (not res!820482) (not e!698891))))

(assert (=> b!1232107 (= res!820482 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232109 () Bool)

(assert (=> b!1232109 (= e!698890 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27116 (select (arr!38347 a!3806) from!3184) Nil!27117)))))

(declare-fun b!1232110 () Bool)

(declare-fun res!820489 () Bool)

(assert (=> b!1232110 (=> (not res!820489) (not e!698891))))

(assert (=> b!1232110 (= res!820489 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38883 a!3806)) (bvslt from!3184 (size!38883 a!3806))))))

(declare-fun b!1232111 () Bool)

(declare-fun res!820487 () Bool)

(assert (=> b!1232111 (=> (not res!820487) (not e!698891))))

(declare-fun contains!7182 (List!27120 (_ BitVec 64)) Bool)

(assert (=> b!1232111 (= res!820487 (not (contains!7182 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820481 () Bool)

(assert (=> start!102436 (=> (not res!820481) (not e!698891))))

(assert (=> start!102436 (= res!820481 (bvslt (size!38883 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102436 e!698891))

(declare-fun array_inv!29195 (array!79467) Bool)

(assert (=> start!102436 (array_inv!29195 a!3806)))

(assert (=> start!102436 true))

(declare-fun b!1232108 () Bool)

(declare-fun res!820483 () Bool)

(assert (=> b!1232108 (=> (not res!820483) (not e!698891))))

(assert (=> b!1232108 (= res!820483 (not (contains!7182 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102436 res!820481) b!1232105))

(assert (= (and b!1232105 res!820486) b!1232110))

(assert (= (and b!1232110 res!820489) b!1232104))

(assert (= (and b!1232104 res!820484) b!1232108))

(assert (= (and b!1232108 res!820483) b!1232111))

(assert (= (and b!1232111 res!820487) b!1232102))

(assert (= (and b!1232102 res!820485) b!1232107))

(assert (= (and b!1232107 res!820482) b!1232106))

(assert (= (and b!1232106 res!820488) b!1232103))

(assert (= (and b!1232103 res!820480) b!1232109))

(declare-fun m!1136135 () Bool)

(assert (=> b!1232102 m!1136135))

(declare-fun m!1136137 () Bool)

(assert (=> b!1232111 m!1136137))

(declare-fun m!1136139 () Bool)

(assert (=> start!102436 m!1136139))

(declare-fun m!1136141 () Bool)

(assert (=> b!1232108 m!1136141))

(declare-fun m!1136143 () Bool)

(assert (=> b!1232107 m!1136143))

(declare-fun m!1136145 () Bool)

(assert (=> b!1232103 m!1136145))

(declare-fun m!1136147 () Bool)

(assert (=> b!1232103 m!1136147))

(declare-fun m!1136149 () Bool)

(assert (=> b!1232103 m!1136149))

(declare-fun m!1136151 () Bool)

(assert (=> b!1232103 m!1136151))

(assert (=> b!1232109 m!1136149))

(declare-fun m!1136153 () Bool)

(assert (=> b!1232109 m!1136153))

(assert (=> b!1232106 m!1136149))

(assert (=> b!1232106 m!1136149))

(declare-fun m!1136155 () Bool)

(assert (=> b!1232106 m!1136155))

(declare-fun m!1136157 () Bool)

(assert (=> b!1232105 m!1136157))

(declare-fun m!1136159 () Bool)

(assert (=> b!1232104 m!1136159))

(push 1)

(assert (not start!102436))

(assert (not b!1232106))

(assert (not b!1232107))

(assert (not b!1232104))

(assert (not b!1232102))

(assert (not b!1232105))

(assert (not b!1232109))

(assert (not b!1232111))

(assert (not b!1232103))

(assert (not b!1232108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

