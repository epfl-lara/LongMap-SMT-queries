; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102684 () Bool)

(assert start!102684)

(declare-fun b!1233550 () Bool)

(declare-fun res!821144 () Bool)

(declare-fun e!699794 () Bool)

(assert (=> b!1233550 (=> (not res!821144) (not e!699794))))

(declare-datatypes ((array!79511 0))(
  ( (array!79512 (arr!38363 (Array (_ BitVec 32) (_ BitVec 64))) (size!38900 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79511)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233550 (= res!821144 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233551 () Bool)

(declare-fun e!699793 () Bool)

(declare-datatypes ((List!27149 0))(
  ( (Nil!27146) (Cons!27145 (h!28363 (_ BitVec 64)) (t!40604 List!27149)) )
))
(declare-fun arrayNoDuplicates!0 (array!79511 (_ BitVec 32) List!27149) Bool)

(assert (=> b!1233551 (= e!699793 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27145 (select (arr!38363 a!3806) from!3184) Nil!27146)))))

(declare-fun b!1233552 () Bool)

(declare-fun res!821136 () Bool)

(assert (=> b!1233552 (=> (not res!821136) (not e!699794))))

(declare-fun acc!823 () List!27149)

(declare-fun contains!7220 (List!27149 (_ BitVec 64)) Bool)

(assert (=> b!1233552 (= res!821136 (not (contains!7220 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!821137 () Bool)

(assert (=> start!102684 (=> (not res!821137) (not e!699794))))

(assert (=> start!102684 (= res!821137 (bvslt (size!38900 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102684 e!699794))

(declare-fun array_inv!29301 (array!79511) Bool)

(assert (=> start!102684 (array_inv!29301 a!3806)))

(assert (=> start!102684 true))

(declare-fun b!1233553 () Bool)

(assert (=> b!1233553 (= e!699794 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1233553 e!699793))

(declare-fun res!821138 () Bool)

(assert (=> b!1233553 (=> (not res!821138) (not e!699793))))

(assert (=> b!1233553 (= res!821138 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27146))))

(declare-datatypes ((Unit!40781 0))(
  ( (Unit!40782) )
))
(declare-fun lt!559983 () Unit!40781)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79511 List!27149 List!27149 (_ BitVec 32)) Unit!40781)

(assert (=> b!1233553 (= lt!559983 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27146 from!3184))))

(assert (=> b!1233553 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27145 (select (arr!38363 a!3806) from!3184) acc!823))))

(declare-fun b!1233554 () Bool)

(declare-fun res!821143 () Bool)

(assert (=> b!1233554 (=> (not res!821143) (not e!699794))))

(assert (=> b!1233554 (= res!821143 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38900 a!3806)) (bvslt from!3184 (size!38900 a!3806))))))

(declare-fun b!1233555 () Bool)

(declare-fun res!821142 () Bool)

(assert (=> b!1233555 (=> (not res!821142) (not e!699794))))

(assert (=> b!1233555 (= res!821142 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233556 () Bool)

(declare-fun res!821139 () Bool)

(assert (=> b!1233556 (=> (not res!821139) (not e!699794))))

(assert (=> b!1233556 (= res!821139 (not (contains!7220 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233557 () Bool)

(declare-fun res!821141 () Bool)

(assert (=> b!1233557 (=> (not res!821141) (not e!699794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233557 (= res!821141 (validKeyInArray!0 (select (arr!38363 a!3806) from!3184)))))

(declare-fun b!1233558 () Bool)

(declare-fun res!821140 () Bool)

(assert (=> b!1233558 (=> (not res!821140) (not e!699794))))

(assert (=> b!1233558 (= res!821140 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233559 () Bool)

(declare-fun res!821135 () Bool)

(assert (=> b!1233559 (=> (not res!821135) (not e!699794))))

(declare-fun noDuplicate!1801 (List!27149) Bool)

(assert (=> b!1233559 (= res!821135 (noDuplicate!1801 acc!823))))

(assert (= (and start!102684 res!821137) b!1233558))

(assert (= (and b!1233558 res!821140) b!1233554))

(assert (= (and b!1233554 res!821143) b!1233559))

(assert (= (and b!1233559 res!821135) b!1233552))

(assert (= (and b!1233552 res!821136) b!1233556))

(assert (= (and b!1233556 res!821139) b!1233550))

(assert (= (and b!1233550 res!821144) b!1233555))

(assert (= (and b!1233555 res!821142) b!1233557))

(assert (= (and b!1233557 res!821141) b!1233553))

(assert (= (and b!1233553 res!821138) b!1233551))

(declare-fun m!1137897 () Bool)

(assert (=> b!1233556 m!1137897))

(declare-fun m!1137899 () Bool)

(assert (=> b!1233559 m!1137899))

(declare-fun m!1137901 () Bool)

(assert (=> b!1233553 m!1137901))

(declare-fun m!1137903 () Bool)

(assert (=> b!1233553 m!1137903))

(declare-fun m!1137905 () Bool)

(assert (=> b!1233553 m!1137905))

(declare-fun m!1137907 () Bool)

(assert (=> b!1233553 m!1137907))

(declare-fun m!1137909 () Bool)

(assert (=> start!102684 m!1137909))

(declare-fun m!1137911 () Bool)

(assert (=> b!1233555 m!1137911))

(assert (=> b!1233557 m!1137905))

(assert (=> b!1233557 m!1137905))

(declare-fun m!1137913 () Bool)

(assert (=> b!1233557 m!1137913))

(assert (=> b!1233551 m!1137905))

(declare-fun m!1137915 () Bool)

(assert (=> b!1233551 m!1137915))

(declare-fun m!1137917 () Bool)

(assert (=> b!1233552 m!1137917))

(declare-fun m!1137919 () Bool)

(assert (=> b!1233558 m!1137919))

(declare-fun m!1137921 () Bool)

(assert (=> b!1233550 m!1137921))

(check-sat (not b!1233559) (not start!102684) (not b!1233558) (not b!1233551) (not b!1233556) (not b!1233555) (not b!1233557) (not b!1233550) (not b!1233553) (not b!1233552))
(check-sat)
