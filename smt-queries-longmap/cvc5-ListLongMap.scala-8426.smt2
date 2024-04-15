; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102644 () Bool)

(assert start!102644)

(declare-fun b!1233837 () Bool)

(declare-fun e!699876 () Bool)

(assert (=> b!1233837 (= e!699876 (not true))))

(declare-datatypes ((array!79457 0))(
  ( (array!79458 (arr!38338 (Array (_ BitVec 32) (_ BitVec 64))) (size!38876 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79457)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233837 (not (arrayContainsKey!0 a!3806 (select (arr!38338 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40707 0))(
  ( (Unit!40708) )
))
(declare-fun lt!559594 () Unit!40707)

(declare-datatypes ((List!27212 0))(
  ( (Nil!27209) (Cons!27208 (h!28417 (_ BitVec 64)) (t!40666 List!27212)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79457 (_ BitVec 32) (_ BitVec 64) List!27212) Unit!40707)

(assert (=> b!1233837 (= lt!559594 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38338 a!3806) from!3184) (Cons!27208 (select (arr!38338 a!3806) from!3184) Nil!27209)))))

(declare-fun e!699878 () Bool)

(assert (=> b!1233837 e!699878))

(declare-fun res!822062 () Bool)

(assert (=> b!1233837 (=> (not res!822062) (not e!699878))))

(declare-fun arrayNoDuplicates!0 (array!79457 (_ BitVec 32) List!27212) Bool)

(assert (=> b!1233837 (= res!822062 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27209))))

(declare-fun lt!559595 () Unit!40707)

(declare-fun acc!823 () List!27212)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79457 List!27212 List!27212 (_ BitVec 32)) Unit!40707)

(assert (=> b!1233837 (= lt!559595 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27209 from!3184))))

(assert (=> b!1233837 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27208 (select (arr!38338 a!3806) from!3184) acc!823))))

(declare-fun b!1233838 () Bool)

(assert (=> b!1233838 (= e!699878 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27208 (select (arr!38338 a!3806) from!3184) Nil!27209)))))

(declare-fun b!1233839 () Bool)

(declare-fun res!822061 () Bool)

(assert (=> b!1233839 (=> (not res!822061) (not e!699876))))

(declare-fun contains!7184 (List!27212 (_ BitVec 64)) Bool)

(assert (=> b!1233839 (= res!822061 (not (contains!7184 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233840 () Bool)

(declare-fun res!822054 () Bool)

(assert (=> b!1233840 (=> (not res!822054) (not e!699876))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1233840 (= res!822054 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233841 () Bool)

(declare-fun res!822055 () Bool)

(assert (=> b!1233841 (=> (not res!822055) (not e!699876))))

(assert (=> b!1233841 (= res!822055 (not (contains!7184 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!822053 () Bool)

(assert (=> start!102644 (=> (not res!822053) (not e!699876))))

(assert (=> start!102644 (= res!822053 (bvslt (size!38876 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102644 e!699876))

(declare-fun array_inv!29321 (array!79457) Bool)

(assert (=> start!102644 (array_inv!29321 a!3806)))

(assert (=> start!102644 true))

(declare-fun b!1233842 () Bool)

(declare-fun res!822059 () Bool)

(assert (=> b!1233842 (=> (not res!822059) (not e!699876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233842 (= res!822059 (validKeyInArray!0 k!2913))))

(declare-fun b!1233843 () Bool)

(declare-fun res!822056 () Bool)

(assert (=> b!1233843 (=> (not res!822056) (not e!699876))))

(assert (=> b!1233843 (= res!822056 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38876 a!3806)) (bvslt from!3184 (size!38876 a!3806))))))

(declare-fun b!1233844 () Bool)

(declare-fun res!822058 () Bool)

(assert (=> b!1233844 (=> (not res!822058) (not e!699876))))

(assert (=> b!1233844 (= res!822058 (validKeyInArray!0 (select (arr!38338 a!3806) from!3184)))))

(declare-fun b!1233845 () Bool)

(declare-fun res!822057 () Bool)

(assert (=> b!1233845 (=> (not res!822057) (not e!699876))))

(declare-fun noDuplicate!1827 (List!27212) Bool)

(assert (=> b!1233845 (= res!822057 (noDuplicate!1827 acc!823))))

(declare-fun b!1233846 () Bool)

(declare-fun res!822060 () Bool)

(assert (=> b!1233846 (=> (not res!822060) (not e!699876))))

(assert (=> b!1233846 (= res!822060 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102644 res!822053) b!1233842))

(assert (= (and b!1233842 res!822059) b!1233843))

(assert (= (and b!1233843 res!822056) b!1233845))

(assert (= (and b!1233845 res!822057) b!1233839))

(assert (= (and b!1233839 res!822061) b!1233841))

(assert (= (and b!1233841 res!822055) b!1233840))

(assert (= (and b!1233840 res!822054) b!1233846))

(assert (= (and b!1233846 res!822060) b!1233844))

(assert (= (and b!1233844 res!822058) b!1233837))

(assert (= (and b!1233837 res!822062) b!1233838))

(declare-fun m!1137465 () Bool)

(assert (=> b!1233842 m!1137465))

(declare-fun m!1137467 () Bool)

(assert (=> b!1233838 m!1137467))

(declare-fun m!1137469 () Bool)

(assert (=> b!1233838 m!1137469))

(declare-fun m!1137471 () Bool)

(assert (=> b!1233841 m!1137471))

(declare-fun m!1137473 () Bool)

(assert (=> b!1233840 m!1137473))

(declare-fun m!1137475 () Bool)

(assert (=> start!102644 m!1137475))

(declare-fun m!1137477 () Bool)

(assert (=> b!1233846 m!1137477))

(assert (=> b!1233844 m!1137467))

(assert (=> b!1233844 m!1137467))

(declare-fun m!1137479 () Bool)

(assert (=> b!1233844 m!1137479))

(declare-fun m!1137481 () Bool)

(assert (=> b!1233839 m!1137481))

(declare-fun m!1137483 () Bool)

(assert (=> b!1233845 m!1137483))

(declare-fun m!1137485 () Bool)

(assert (=> b!1233837 m!1137485))

(declare-fun m!1137487 () Bool)

(assert (=> b!1233837 m!1137487))

(assert (=> b!1233837 m!1137467))

(declare-fun m!1137489 () Bool)

(assert (=> b!1233837 m!1137489))

(assert (=> b!1233837 m!1137467))

(declare-fun m!1137491 () Bool)

(assert (=> b!1233837 m!1137491))

(assert (=> b!1233837 m!1137467))

(declare-fun m!1137493 () Bool)

(assert (=> b!1233837 m!1137493))

(push 1)

(assert (not b!1233844))

(assert (not b!1233838))

(assert (not b!1233841))

(assert (not b!1233839))

(assert (not b!1233842))

(assert (not start!102644))

(assert (not b!1233845))

(assert (not b!1233837))

(assert (not b!1233840))

(assert (not b!1233846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

