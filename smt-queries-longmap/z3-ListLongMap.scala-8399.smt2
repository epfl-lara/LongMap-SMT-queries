; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102414 () Bool)

(assert start!102414)

(declare-fun b!1231342 () Bool)

(declare-fun res!819043 () Bool)

(declare-fun e!698846 () Bool)

(assert (=> b!1231342 (=> (not res!819043) (not e!698846))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79385 0))(
  ( (array!79386 (arr!38306 (Array (_ BitVec 32) (_ BitVec 64))) (size!38843 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79385)

(assert (=> b!1231342 (= res!819043 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38843 a!3806)) (bvslt from!3184 (size!38843 a!3806))))))

(declare-fun b!1231343 () Bool)

(declare-fun res!819042 () Bool)

(assert (=> b!1231343 (=> (not res!819042) (not e!698846))))

(declare-datatypes ((List!27092 0))(
  ( (Nil!27089) (Cons!27088 (h!28306 (_ BitVec 64)) (t!40547 List!27092)) )
))
(declare-fun acc!823 () List!27092)

(declare-fun noDuplicate!1744 (List!27092) Bool)

(assert (=> b!1231343 (= res!819042 (noDuplicate!1744 acc!823))))

(declare-fun b!1231344 () Bool)

(assert (=> b!1231344 (= e!698846 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!79385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231344 (not (arrayContainsKey!0 a!3806 (select (arr!38306 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40727 0))(
  ( (Unit!40728) )
))
(declare-fun lt!559790 () Unit!40727)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79385 (_ BitVec 32) (_ BitVec 64) List!27092) Unit!40727)

(assert (=> b!1231344 (= lt!559790 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38306 a!3806) from!3184) (Cons!27088 (select (arr!38306 a!3806) from!3184) Nil!27089)))))

(declare-fun e!698844 () Bool)

(assert (=> b!1231344 e!698844))

(declare-fun res!819035 () Bool)

(assert (=> b!1231344 (=> (not res!819035) (not e!698844))))

(declare-fun arrayNoDuplicates!0 (array!79385 (_ BitVec 32) List!27092) Bool)

(assert (=> b!1231344 (= res!819035 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27089))))

(declare-fun lt!559791 () Unit!40727)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79385 List!27092 List!27092 (_ BitVec 32)) Unit!40727)

(assert (=> b!1231344 (= lt!559791 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27089 from!3184))))

(assert (=> b!1231344 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27088 (select (arr!38306 a!3806) from!3184) acc!823))))

(declare-fun b!1231345 () Bool)

(declare-fun res!819038 () Bool)

(assert (=> b!1231345 (=> (not res!819038) (not e!698846))))

(declare-fun contains!7163 (List!27092 (_ BitVec 64)) Bool)

(assert (=> b!1231345 (= res!819038 (not (contains!7163 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231346 () Bool)

(declare-fun res!819037 () Bool)

(assert (=> b!1231346 (=> (not res!819037) (not e!698846))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1231346 (= res!819037 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231347 () Bool)

(declare-fun res!819041 () Bool)

(assert (=> b!1231347 (=> (not res!819041) (not e!698846))))

(assert (=> b!1231347 (= res!819041 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231348 () Bool)

(declare-fun res!819036 () Bool)

(assert (=> b!1231348 (=> (not res!819036) (not e!698846))))

(assert (=> b!1231348 (= res!819036 (not (contains!7163 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231350 () Bool)

(declare-fun res!819044 () Bool)

(assert (=> b!1231350 (=> (not res!819044) (not e!698846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231350 (= res!819044 (validKeyInArray!0 (select (arr!38306 a!3806) from!3184)))))

(declare-fun b!1231351 () Bool)

(assert (=> b!1231351 (= e!698844 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27088 (select (arr!38306 a!3806) from!3184) Nil!27089)))))

(declare-fun b!1231349 () Bool)

(declare-fun res!819039 () Bool)

(assert (=> b!1231349 (=> (not res!819039) (not e!698846))))

(assert (=> b!1231349 (= res!819039 (validKeyInArray!0 k0!2913))))

(declare-fun res!819040 () Bool)

(assert (=> start!102414 (=> (not res!819040) (not e!698846))))

(assert (=> start!102414 (= res!819040 (bvslt (size!38843 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102414 e!698846))

(declare-fun array_inv!29244 (array!79385) Bool)

(assert (=> start!102414 (array_inv!29244 a!3806)))

(assert (=> start!102414 true))

(assert (= (and start!102414 res!819040) b!1231349))

(assert (= (and b!1231349 res!819039) b!1231342))

(assert (= (and b!1231342 res!819043) b!1231343))

(assert (= (and b!1231343 res!819042) b!1231345))

(assert (= (and b!1231345 res!819038) b!1231348))

(assert (= (and b!1231348 res!819036) b!1231346))

(assert (= (and b!1231346 res!819037) b!1231347))

(assert (= (and b!1231347 res!819041) b!1231350))

(assert (= (and b!1231350 res!819044) b!1231344))

(assert (= (and b!1231344 res!819035) b!1231351))

(declare-fun m!1136127 () Bool)

(assert (=> b!1231343 m!1136127))

(declare-fun m!1136129 () Bool)

(assert (=> b!1231347 m!1136129))

(declare-fun m!1136131 () Bool)

(assert (=> b!1231344 m!1136131))

(declare-fun m!1136133 () Bool)

(assert (=> b!1231344 m!1136133))

(declare-fun m!1136135 () Bool)

(assert (=> b!1231344 m!1136135))

(declare-fun m!1136137 () Bool)

(assert (=> b!1231344 m!1136137))

(assert (=> b!1231344 m!1136135))

(declare-fun m!1136139 () Bool)

(assert (=> b!1231344 m!1136139))

(assert (=> b!1231344 m!1136135))

(declare-fun m!1136141 () Bool)

(assert (=> b!1231344 m!1136141))

(declare-fun m!1136143 () Bool)

(assert (=> b!1231348 m!1136143))

(declare-fun m!1136145 () Bool)

(assert (=> b!1231349 m!1136145))

(assert (=> b!1231351 m!1136135))

(declare-fun m!1136147 () Bool)

(assert (=> b!1231351 m!1136147))

(declare-fun m!1136149 () Bool)

(assert (=> b!1231346 m!1136149))

(declare-fun m!1136151 () Bool)

(assert (=> b!1231345 m!1136151))

(assert (=> b!1231350 m!1136135))

(assert (=> b!1231350 m!1136135))

(declare-fun m!1136153 () Bool)

(assert (=> b!1231350 m!1136153))

(declare-fun m!1136155 () Bool)

(assert (=> start!102414 m!1136155))

(check-sat (not b!1231351) (not b!1231348) (not b!1231344) (not b!1231346) (not b!1231343) (not b!1231350) (not b!1231347) (not b!1231349) (not start!102414) (not b!1231345))
(check-sat)
