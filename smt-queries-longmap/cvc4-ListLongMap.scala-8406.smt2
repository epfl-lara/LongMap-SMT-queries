; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102256 () Bool)

(assert start!102256)

(declare-fun b!1230744 () Bool)

(declare-fun e!698249 () Bool)

(assert (=> b!1230744 (= e!698249 (not true))))

(declare-datatypes ((array!79398 0))(
  ( (array!79399 (arr!38317 (Array (_ BitVec 32) (_ BitVec 64))) (size!38853 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79398)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27090 0))(
  ( (Nil!27087) (Cons!27086 (h!28295 (_ BitVec 64)) (t!40553 List!27090)) )
))
(declare-fun acc!823 () List!27090)

(declare-fun arrayNoDuplicates!0 (array!79398 (_ BitVec 32) List!27090) Bool)

(assert (=> b!1230744 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27086 (select (arr!38317 a!3806) from!3184) acc!823))))

(declare-fun b!1230745 () Bool)

(declare-fun res!819214 () Bool)

(assert (=> b!1230745 (=> (not res!819214) (not e!698249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230745 (= res!819214 (validKeyInArray!0 (select (arr!38317 a!3806) from!3184)))))

(declare-fun res!819206 () Bool)

(assert (=> start!102256 (=> (not res!819206) (not e!698249))))

(assert (=> start!102256 (= res!819206 (bvslt (size!38853 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102256 e!698249))

(declare-fun array_inv!29165 (array!79398) Bool)

(assert (=> start!102256 (array_inv!29165 a!3806)))

(assert (=> start!102256 true))

(declare-fun b!1230746 () Bool)

(declare-fun res!819208 () Bool)

(assert (=> b!1230746 (=> (not res!819208) (not e!698249))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1230746 (= res!819208 (validKeyInArray!0 k!2913))))

(declare-fun b!1230747 () Bool)

(declare-fun res!819207 () Bool)

(assert (=> b!1230747 (=> (not res!819207) (not e!698249))))

(assert (=> b!1230747 (= res!819207 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230748 () Bool)

(declare-fun res!819210 () Bool)

(assert (=> b!1230748 (=> (not res!819210) (not e!698249))))

(declare-fun noDuplicate!1749 (List!27090) Bool)

(assert (=> b!1230748 (= res!819210 (noDuplicate!1749 acc!823))))

(declare-fun b!1230749 () Bool)

(declare-fun res!819212 () Bool)

(assert (=> b!1230749 (=> (not res!819212) (not e!698249))))

(declare-fun contains!7152 (List!27090 (_ BitVec 64)) Bool)

(assert (=> b!1230749 (= res!819212 (not (contains!7152 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230750 () Bool)

(declare-fun res!819209 () Bool)

(assert (=> b!1230750 (=> (not res!819209) (not e!698249))))

(declare-fun arrayContainsKey!0 (array!79398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230750 (= res!819209 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230751 () Bool)

(declare-fun res!819211 () Bool)

(assert (=> b!1230751 (=> (not res!819211) (not e!698249))))

(assert (=> b!1230751 (= res!819211 (not (contains!7152 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230752 () Bool)

(declare-fun res!819213 () Bool)

(assert (=> b!1230752 (=> (not res!819213) (not e!698249))))

(assert (=> b!1230752 (= res!819213 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38853 a!3806)) (bvslt from!3184 (size!38853 a!3806))))))

(assert (= (and start!102256 res!819206) b!1230746))

(assert (= (and b!1230746 res!819208) b!1230752))

(assert (= (and b!1230752 res!819213) b!1230748))

(assert (= (and b!1230748 res!819210) b!1230749))

(assert (= (and b!1230749 res!819212) b!1230751))

(assert (= (and b!1230751 res!819211) b!1230750))

(assert (= (and b!1230750 res!819209) b!1230747))

(assert (= (and b!1230747 res!819207) b!1230745))

(assert (= (and b!1230745 res!819214) b!1230744))

(declare-fun m!1135067 () Bool)

(assert (=> b!1230746 m!1135067))

(declare-fun m!1135069 () Bool)

(assert (=> b!1230744 m!1135069))

(declare-fun m!1135071 () Bool)

(assert (=> b!1230744 m!1135071))

(declare-fun m!1135073 () Bool)

(assert (=> b!1230747 m!1135073))

(declare-fun m!1135075 () Bool)

(assert (=> start!102256 m!1135075))

(declare-fun m!1135077 () Bool)

(assert (=> b!1230751 m!1135077))

(assert (=> b!1230745 m!1135069))

(assert (=> b!1230745 m!1135069))

(declare-fun m!1135079 () Bool)

(assert (=> b!1230745 m!1135079))

(declare-fun m!1135081 () Bool)

(assert (=> b!1230748 m!1135081))

(declare-fun m!1135083 () Bool)

(assert (=> b!1230750 m!1135083))

(declare-fun m!1135085 () Bool)

(assert (=> b!1230749 m!1135085))

(push 1)

(assert (not b!1230747))

(assert (not b!1230745))

(assert (not start!102256))

(assert (not b!1230751))

(assert (not b!1230749))

(assert (not b!1230750))

(assert (not b!1230746))

(assert (not b!1230744))

(assert (not b!1230748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

