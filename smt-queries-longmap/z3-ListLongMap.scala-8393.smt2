; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102140 () Bool)

(assert start!102140)

(declare-fun b!1229308 () Bool)

(declare-fun res!817795 () Bool)

(declare-fun e!697776 () Bool)

(assert (=> b!1229308 (=> (not res!817795) (not e!697776))))

(declare-datatypes ((array!79315 0))(
  ( (array!79316 (arr!38277 (Array (_ BitVec 32) (_ BitVec 64))) (size!38813 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79315)

(declare-datatypes ((List!27050 0))(
  ( (Nil!27047) (Cons!27046 (h!28255 (_ BitVec 64)) (t!40513 List!27050)) )
))
(declare-fun acc!823 () List!27050)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79315 (_ BitVec 32) List!27050) Bool)

(assert (=> b!1229308 (= res!817795 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229309 () Bool)

(declare-fun res!817798 () Bool)

(declare-fun e!697779 () Bool)

(assert (=> b!1229309 (=> res!817798 e!697779)))

(declare-fun lt!559153 () List!27050)

(declare-fun contains!7112 (List!27050 (_ BitVec 64)) Bool)

(assert (=> b!1229309 (= res!817798 (contains!7112 lt!559153 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229310 () Bool)

(declare-fun res!817794 () Bool)

(assert (=> b!1229310 (=> res!817794 e!697779)))

(assert (=> b!1229310 (= res!817794 (contains!7112 lt!559153 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229311 () Bool)

(declare-fun res!817801 () Bool)

(assert (=> b!1229311 (=> (not res!817801) (not e!697776))))

(assert (=> b!1229311 (= res!817801 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38813 a!3806)) (bvslt from!3184 (size!38813 a!3806))))))

(declare-fun b!1229312 () Bool)

(declare-fun res!817802 () Bool)

(assert (=> b!1229312 (=> (not res!817802) (not e!697776))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229312 (= res!817802 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229313 () Bool)

(declare-fun res!817803 () Bool)

(assert (=> b!1229313 (=> res!817803 e!697779)))

(declare-fun noDuplicate!1709 (List!27050) Bool)

(assert (=> b!1229313 (= res!817803 (not (noDuplicate!1709 lt!559153)))))

(declare-fun b!1229314 () Bool)

(declare-fun e!697777 () Bool)

(assert (=> b!1229314 (= e!697777 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27046 (select (arr!38277 a!3806) from!3184) Nil!27047)))))

(declare-fun b!1229315 () Bool)

(declare-fun res!817804 () Bool)

(assert (=> b!1229315 (=> (not res!817804) (not e!697776))))

(assert (=> b!1229315 (= res!817804 (validKeyInArray!0 (select (arr!38277 a!3806) from!3184)))))

(declare-fun b!1229316 () Bool)

(declare-fun res!817797 () Bool)

(assert (=> b!1229316 (=> (not res!817797) (not e!697776))))

(assert (=> b!1229316 (= res!817797 (not (contains!7112 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229317 () Bool)

(declare-fun res!817796 () Bool)

(assert (=> b!1229317 (=> (not res!817796) (not e!697776))))

(assert (=> b!1229317 (= res!817796 (noDuplicate!1709 acc!823))))

(declare-fun res!817805 () Bool)

(assert (=> start!102140 (=> (not res!817805) (not e!697776))))

(assert (=> start!102140 (= res!817805 (bvslt (size!38813 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102140 e!697776))

(declare-fun array_inv!29125 (array!79315) Bool)

(assert (=> start!102140 (array_inv!29125 a!3806)))

(assert (=> start!102140 true))

(declare-fun b!1229318 () Bool)

(declare-fun res!817807 () Bool)

(assert (=> b!1229318 (=> (not res!817807) (not e!697776))))

(assert (=> b!1229318 (= res!817807 (not (contains!7112 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229319 () Bool)

(assert (=> b!1229319 (= e!697779 true)))

(declare-fun lt!559154 () Bool)

(assert (=> b!1229319 (= lt!559154 (contains!7112 lt!559153 (select (arr!38277 a!3806) from!3184)))))

(declare-fun b!1229320 () Bool)

(assert (=> b!1229320 (= e!697776 (not e!697779))))

(declare-fun res!817806 () Bool)

(assert (=> b!1229320 (=> res!817806 e!697779)))

(assert (=> b!1229320 (= res!817806 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229320 (= lt!559153 (Cons!27046 (select (arr!38277 a!3806) from!3184) Nil!27047))))

(assert (=> b!1229320 e!697777))

(declare-fun res!817800 () Bool)

(assert (=> b!1229320 (=> (not res!817800) (not e!697777))))

(assert (=> b!1229320 (= res!817800 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27047))))

(declare-datatypes ((Unit!40720 0))(
  ( (Unit!40721) )
))
(declare-fun lt!559152 () Unit!40720)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79315 List!27050 List!27050 (_ BitVec 32)) Unit!40720)

(assert (=> b!1229320 (= lt!559152 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27047 from!3184))))

(assert (=> b!1229320 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27046 (select (arr!38277 a!3806) from!3184) acc!823))))

(declare-fun b!1229321 () Bool)

(declare-fun res!817799 () Bool)

(assert (=> b!1229321 (=> (not res!817799) (not e!697776))))

(declare-fun arrayContainsKey!0 (array!79315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229321 (= res!817799 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102140 res!817805) b!1229312))

(assert (= (and b!1229312 res!817802) b!1229311))

(assert (= (and b!1229311 res!817801) b!1229317))

(assert (= (and b!1229317 res!817796) b!1229318))

(assert (= (and b!1229318 res!817807) b!1229316))

(assert (= (and b!1229316 res!817797) b!1229321))

(assert (= (and b!1229321 res!817799) b!1229308))

(assert (= (and b!1229308 res!817795) b!1229315))

(assert (= (and b!1229315 res!817804) b!1229320))

(assert (= (and b!1229320 res!817800) b!1229314))

(assert (= (and b!1229320 (not res!817806)) b!1229313))

(assert (= (and b!1229313 (not res!817803)) b!1229310))

(assert (= (and b!1229310 (not res!817794)) b!1229309))

(assert (= (and b!1229309 (not res!817798)) b!1229319))

(declare-fun m!1133891 () Bool)

(assert (=> b!1229312 m!1133891))

(declare-fun m!1133893 () Bool)

(assert (=> start!102140 m!1133893))

(declare-fun m!1133895 () Bool)

(assert (=> b!1229310 m!1133895))

(declare-fun m!1133897 () Bool)

(assert (=> b!1229319 m!1133897))

(assert (=> b!1229319 m!1133897))

(declare-fun m!1133899 () Bool)

(assert (=> b!1229319 m!1133899))

(assert (=> b!1229320 m!1133897))

(declare-fun m!1133901 () Bool)

(assert (=> b!1229320 m!1133901))

(declare-fun m!1133903 () Bool)

(assert (=> b!1229320 m!1133903))

(declare-fun m!1133905 () Bool)

(assert (=> b!1229320 m!1133905))

(declare-fun m!1133907 () Bool)

(assert (=> b!1229309 m!1133907))

(assert (=> b!1229314 m!1133897))

(declare-fun m!1133909 () Bool)

(assert (=> b!1229314 m!1133909))

(declare-fun m!1133911 () Bool)

(assert (=> b!1229321 m!1133911))

(declare-fun m!1133913 () Bool)

(assert (=> b!1229316 m!1133913))

(declare-fun m!1133915 () Bool)

(assert (=> b!1229317 m!1133915))

(assert (=> b!1229315 m!1133897))

(assert (=> b!1229315 m!1133897))

(declare-fun m!1133917 () Bool)

(assert (=> b!1229315 m!1133917))

(declare-fun m!1133919 () Bool)

(assert (=> b!1229308 m!1133919))

(declare-fun m!1133921 () Bool)

(assert (=> b!1229313 m!1133921))

(declare-fun m!1133923 () Bool)

(assert (=> b!1229318 m!1133923))

(check-sat (not b!1229310) (not b!1229316) (not b!1229317) (not b!1229312) (not b!1229320) (not b!1229321) (not b!1229314) (not b!1229319) (not b!1229308) (not b!1229313) (not b!1229318) (not b!1229315) (not b!1229309) (not start!102140))
(check-sat)
