; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102182 () Bool)

(assert start!102182)

(declare-fun b!1230096 () Bool)

(declare-fun e!697989 () Bool)

(declare-datatypes ((array!79280 0))(
  ( (array!79281 (arr!38260 (Array (_ BitVec 32) (_ BitVec 64))) (size!38798 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79280)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27134 0))(
  ( (Nil!27131) (Cons!27130 (h!28339 (_ BitVec 64)) (t!40588 List!27134)) )
))
(declare-fun arrayNoDuplicates!0 (array!79280 (_ BitVec 32) List!27134) Bool)

(assert (=> b!1230096 (= e!697989 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27130 (select (arr!38260 a!3806) from!3184) Nil!27131)))))

(declare-fun b!1230097 () Bool)

(declare-fun res!818627 () Bool)

(declare-fun e!697991 () Bool)

(assert (=> b!1230097 (=> (not res!818627) (not e!697991))))

(declare-fun acc!823 () List!27134)

(declare-fun noDuplicate!1749 (List!27134) Bool)

(assert (=> b!1230097 (= res!818627 (noDuplicate!1749 acc!823))))

(declare-fun b!1230098 () Bool)

(declare-fun res!818625 () Bool)

(assert (=> b!1230098 (=> (not res!818625) (not e!697991))))

(assert (=> b!1230098 (= res!818625 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230099 () Bool)

(declare-fun res!818626 () Bool)

(assert (=> b!1230099 (=> (not res!818626) (not e!697991))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230099 (= res!818626 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230100 () Bool)

(declare-fun res!818621 () Bool)

(assert (=> b!1230100 (=> (not res!818621) (not e!697991))))

(assert (=> b!1230100 (= res!818621 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38798 a!3806)) (bvslt from!3184 (size!38798 a!3806))))))

(declare-fun b!1230101 () Bool)

(assert (=> b!1230101 (= e!697991 (not true))))

(assert (=> b!1230101 (not (arrayContainsKey!0 a!3806 (select (arr!38260 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40611 0))(
  ( (Unit!40612) )
))
(declare-fun lt!559160 () Unit!40611)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79280 (_ BitVec 32) (_ BitVec 64) List!27134) Unit!40611)

(assert (=> b!1230101 (= lt!559160 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38260 a!3806) from!3184) (Cons!27130 (select (arr!38260 a!3806) from!3184) Nil!27131)))))

(assert (=> b!1230101 e!697989))

(declare-fun res!818619 () Bool)

(assert (=> b!1230101 (=> (not res!818619) (not e!697989))))

(assert (=> b!1230101 (= res!818619 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27131))))

(declare-fun lt!559159 () Unit!40611)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79280 List!27134 List!27134 (_ BitVec 32)) Unit!40611)

(assert (=> b!1230101 (= lt!559159 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27131 from!3184))))

(assert (=> b!1230101 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27130 (select (arr!38260 a!3806) from!3184) acc!823))))

(declare-fun res!818620 () Bool)

(assert (=> start!102182 (=> (not res!818620) (not e!697991))))

(assert (=> start!102182 (= res!818620 (bvslt (size!38798 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102182 e!697991))

(declare-fun array_inv!29243 (array!79280) Bool)

(assert (=> start!102182 (array_inv!29243 a!3806)))

(assert (=> start!102182 true))

(declare-fun b!1230102 () Bool)

(declare-fun res!818624 () Bool)

(assert (=> b!1230102 (=> (not res!818624) (not e!697991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230102 (= res!818624 (validKeyInArray!0 k!2913))))

(declare-fun b!1230103 () Bool)

(declare-fun res!818618 () Bool)

(assert (=> b!1230103 (=> (not res!818618) (not e!697991))))

(declare-fun contains!7106 (List!27134 (_ BitVec 64)) Bool)

(assert (=> b!1230103 (= res!818618 (not (contains!7106 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230104 () Bool)

(declare-fun res!818622 () Bool)

(assert (=> b!1230104 (=> (not res!818622) (not e!697991))))

(assert (=> b!1230104 (= res!818622 (not (contains!7106 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230105 () Bool)

(declare-fun res!818623 () Bool)

(assert (=> b!1230105 (=> (not res!818623) (not e!697991))))

(assert (=> b!1230105 (= res!818623 (validKeyInArray!0 (select (arr!38260 a!3806) from!3184)))))

(assert (= (and start!102182 res!818620) b!1230102))

(assert (= (and b!1230102 res!818624) b!1230100))

(assert (= (and b!1230100 res!818621) b!1230097))

(assert (= (and b!1230097 res!818627) b!1230104))

(assert (= (and b!1230104 res!818622) b!1230103))

(assert (= (and b!1230103 res!818618) b!1230099))

(assert (= (and b!1230099 res!818626) b!1230098))

(assert (= (and b!1230098 res!818625) b!1230105))

(assert (= (and b!1230105 res!818623) b!1230101))

(assert (= (and b!1230101 res!818619) b!1230096))

(declare-fun m!1134123 () Bool)

(assert (=> b!1230102 m!1134123))

(declare-fun m!1134125 () Bool)

(assert (=> b!1230104 m!1134125))

(declare-fun m!1134127 () Bool)

(assert (=> b!1230099 m!1134127))

(declare-fun m!1134129 () Bool)

(assert (=> b!1230103 m!1134129))

(declare-fun m!1134131 () Bool)

(assert (=> b!1230098 m!1134131))

(declare-fun m!1134133 () Bool)

(assert (=> b!1230096 m!1134133))

(declare-fun m!1134135 () Bool)

(assert (=> b!1230096 m!1134135))

(declare-fun m!1134137 () Bool)

(assert (=> start!102182 m!1134137))

(declare-fun m!1134139 () Bool)

(assert (=> b!1230097 m!1134139))

(assert (=> b!1230105 m!1134133))

(assert (=> b!1230105 m!1134133))

(declare-fun m!1134141 () Bool)

(assert (=> b!1230105 m!1134141))

(declare-fun m!1134143 () Bool)

(assert (=> b!1230101 m!1134143))

(declare-fun m!1134145 () Bool)

(assert (=> b!1230101 m!1134145))

(assert (=> b!1230101 m!1134133))

(declare-fun m!1134147 () Bool)

(assert (=> b!1230101 m!1134147))

(assert (=> b!1230101 m!1134133))

(declare-fun m!1134149 () Bool)

(assert (=> b!1230101 m!1134149))

(assert (=> b!1230101 m!1134133))

(declare-fun m!1134151 () Bool)

(assert (=> b!1230101 m!1134151))

(push 1)

(assert (not b!1230101))

(assert (not b!1230104))

(assert (not b!1230103))

(assert (not b!1230105))

(assert (not b!1230102))

(assert (not b!1230097))

(assert (not b!1230099))

(assert (not b!1230096))

(assert (not start!102182))

(assert (not b!1230098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

