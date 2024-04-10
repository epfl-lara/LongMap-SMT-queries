; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102650 () Bool)

(assert start!102650)

(declare-fun b!1233965 () Bool)

(declare-fun res!822149 () Bool)

(declare-fun e!699929 () Bool)

(assert (=> b!1233965 (=> (not res!822149) (not e!699929))))

(declare-datatypes ((array!79540 0))(
  ( (array!79541 (arr!38379 (Array (_ BitVec 32) (_ BitVec 64))) (size!38915 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79540)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233965 (= res!822149 (validKeyInArray!0 (select (arr!38379 a!3806) from!3184)))))

(declare-fun b!1233966 () Bool)

(declare-fun res!822145 () Bool)

(assert (=> b!1233966 (=> (not res!822145) (not e!699929))))

(declare-datatypes ((List!27152 0))(
  ( (Nil!27149) (Cons!27148 (h!28357 (_ BitVec 64)) (t!40615 List!27152)) )
))
(declare-fun acc!823 () List!27152)

(declare-fun arrayNoDuplicates!0 (array!79540 (_ BitVec 32) List!27152) Bool)

(assert (=> b!1233966 (= res!822145 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233967 () Bool)

(declare-fun res!822146 () Bool)

(assert (=> b!1233967 (=> (not res!822146) (not e!699929))))

(declare-fun noDuplicate!1811 (List!27152) Bool)

(assert (=> b!1233967 (= res!822146 (noDuplicate!1811 acc!823))))

(declare-fun b!1233968 () Bool)

(declare-fun res!822147 () Bool)

(assert (=> b!1233968 (=> (not res!822147) (not e!699929))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233968 (= res!822147 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233969 () Bool)

(declare-fun res!822151 () Bool)

(assert (=> b!1233969 (=> (not res!822151) (not e!699929))))

(assert (=> b!1233969 (= res!822151 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38915 a!3806)) (bvslt from!3184 (size!38915 a!3806))))))

(declare-fun b!1233970 () Bool)

(assert (=> b!1233970 (= e!699929 (not (not (= (select (arr!38379 a!3806) from!3184) k0!2913))))))

(assert (=> b!1233970 (not (arrayContainsKey!0 a!3806 (select (arr!38379 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40864 0))(
  ( (Unit!40865) )
))
(declare-fun lt!559781 () Unit!40864)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79540 (_ BitVec 32) (_ BitVec 64) List!27152) Unit!40864)

(assert (=> b!1233970 (= lt!559781 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38379 a!3806) from!3184) (Cons!27148 (select (arr!38379 a!3806) from!3184) Nil!27149)))))

(declare-fun e!699930 () Bool)

(assert (=> b!1233970 e!699930))

(declare-fun res!822148 () Bool)

(assert (=> b!1233970 (=> (not res!822148) (not e!699930))))

(assert (=> b!1233970 (= res!822148 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27149))))

(declare-fun lt!559780 () Unit!40864)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79540 List!27152 List!27152 (_ BitVec 32)) Unit!40864)

(assert (=> b!1233970 (= lt!559780 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27149 from!3184))))

(assert (=> b!1233970 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27148 (select (arr!38379 a!3806) from!3184) acc!823))))

(declare-fun b!1233971 () Bool)

(assert (=> b!1233971 (= e!699930 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27148 (select (arr!38379 a!3806) from!3184) Nil!27149)))))

(declare-fun b!1233972 () Bool)

(declare-fun res!822152 () Bool)

(assert (=> b!1233972 (=> (not res!822152) (not e!699929))))

(declare-fun contains!7214 (List!27152 (_ BitVec 64)) Bool)

(assert (=> b!1233972 (= res!822152 (not (contains!7214 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233973 () Bool)

(declare-fun res!822150 () Bool)

(assert (=> b!1233973 (=> (not res!822150) (not e!699929))))

(assert (=> b!1233973 (= res!822150 (not (contains!7214 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!822153 () Bool)

(assert (=> start!102650 (=> (not res!822153) (not e!699929))))

(assert (=> start!102650 (= res!822153 (bvslt (size!38915 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102650 e!699929))

(declare-fun array_inv!29227 (array!79540) Bool)

(assert (=> start!102650 (array_inv!29227 a!3806)))

(assert (=> start!102650 true))

(declare-fun b!1233974 () Bool)

(declare-fun res!822154 () Bool)

(assert (=> b!1233974 (=> (not res!822154) (not e!699929))))

(assert (=> b!1233974 (= res!822154 (validKeyInArray!0 k0!2913))))

(assert (= (and start!102650 res!822153) b!1233974))

(assert (= (and b!1233974 res!822154) b!1233969))

(assert (= (and b!1233969 res!822151) b!1233967))

(assert (= (and b!1233967 res!822146) b!1233972))

(assert (= (and b!1233972 res!822152) b!1233973))

(assert (= (and b!1233973 res!822150) b!1233968))

(assert (= (and b!1233968 res!822147) b!1233966))

(assert (= (and b!1233966 res!822145) b!1233965))

(assert (= (and b!1233965 res!822149) b!1233970))

(assert (= (and b!1233970 res!822148) b!1233971))

(declare-fun m!1138021 () Bool)

(assert (=> start!102650 m!1138021))

(declare-fun m!1138023 () Bool)

(assert (=> b!1233966 m!1138023))

(declare-fun m!1138025 () Bool)

(assert (=> b!1233972 m!1138025))

(declare-fun m!1138027 () Bool)

(assert (=> b!1233973 m!1138027))

(declare-fun m!1138029 () Bool)

(assert (=> b!1233965 m!1138029))

(assert (=> b!1233965 m!1138029))

(declare-fun m!1138031 () Bool)

(assert (=> b!1233965 m!1138031))

(declare-fun m!1138033 () Bool)

(assert (=> b!1233967 m!1138033))

(declare-fun m!1138035 () Bool)

(assert (=> b!1233970 m!1138035))

(declare-fun m!1138037 () Bool)

(assert (=> b!1233970 m!1138037))

(assert (=> b!1233970 m!1138029))

(declare-fun m!1138039 () Bool)

(assert (=> b!1233970 m!1138039))

(assert (=> b!1233970 m!1138029))

(declare-fun m!1138041 () Bool)

(assert (=> b!1233970 m!1138041))

(assert (=> b!1233970 m!1138029))

(declare-fun m!1138043 () Bool)

(assert (=> b!1233970 m!1138043))

(declare-fun m!1138045 () Bool)

(assert (=> b!1233968 m!1138045))

(assert (=> b!1233971 m!1138029))

(declare-fun m!1138047 () Bool)

(assert (=> b!1233971 m!1138047))

(declare-fun m!1138049 () Bool)

(assert (=> b!1233974 m!1138049))

(check-sat (not b!1233970) (not b!1233974) (not b!1233973) (not b!1233968) (not start!102650) (not b!1233971) (not b!1233972) (not b!1233966) (not b!1233965) (not b!1233967))
(check-sat)
