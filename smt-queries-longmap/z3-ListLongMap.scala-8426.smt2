; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102880 () Bool)

(assert start!102880)

(declare-fun b!1235169 () Bool)

(declare-fun res!822566 () Bool)

(declare-fun e!700756 () Bool)

(assert (=> b!1235169 (=> (not res!822566) (not e!700756))))

(declare-datatypes ((array!79568 0))(
  ( (array!79569 (arr!38387 (Array (_ BitVec 32) (_ BitVec 64))) (size!38924 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79568)

(declare-datatypes ((List!27173 0))(
  ( (Nil!27170) (Cons!27169 (h!28387 (_ BitVec 64)) (t!40628 List!27173)) )
))
(declare-fun acc!823 () List!27173)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79568 (_ BitVec 32) List!27173) Bool)

(assert (=> b!1235169 (= res!822566 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1235170 () Bool)

(declare-fun res!822562 () Bool)

(assert (=> b!1235170 (=> (not res!822562) (not e!700756))))

(declare-fun contains!7244 (List!27173 (_ BitVec 64)) Bool)

(assert (=> b!1235170 (= res!822562 (not (contains!7244 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235171 () Bool)

(declare-fun res!822559 () Bool)

(assert (=> b!1235171 (=> (not res!822559) (not e!700756))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235171 (= res!822559 (validKeyInArray!0 k0!2913))))

(declare-fun b!1235172 () Bool)

(declare-fun res!822560 () Bool)

(assert (=> b!1235172 (=> (not res!822560) (not e!700756))))

(assert (=> b!1235172 (= res!822560 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38924 a!3806)) (bvslt from!3184 (size!38924 a!3806))))))

(declare-fun res!822564 () Bool)

(assert (=> start!102880 (=> (not res!822564) (not e!700756))))

(assert (=> start!102880 (= res!822564 (bvslt (size!38924 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102880 e!700756))

(declare-fun array_inv!29325 (array!79568) Bool)

(assert (=> start!102880 (array_inv!29325 a!3806)))

(assert (=> start!102880 true))

(declare-fun b!1235173 () Bool)

(declare-fun e!700755 () Bool)

(assert (=> b!1235173 (= e!700755 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27169 (select (arr!38387 a!3806) from!3184) Nil!27170)))))

(declare-fun b!1235174 () Bool)

(declare-fun res!822565 () Bool)

(assert (=> b!1235174 (=> (not res!822565) (not e!700756))))

(assert (=> b!1235174 (= res!822565 (not (contains!7244 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235175 () Bool)

(assert (=> b!1235175 (= e!700756 (not true))))

(declare-fun arrayContainsKey!0 (array!79568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1235175 (not (arrayContainsKey!0 a!3806 (select (arr!38387 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40829 0))(
  ( (Unit!40830) )
))
(declare-fun lt!560243 () Unit!40829)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79568 (_ BitVec 32) (_ BitVec 64) List!27173) Unit!40829)

(assert (=> b!1235175 (= lt!560243 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38387 a!3806) from!3184) (Cons!27169 (select (arr!38387 a!3806) from!3184) Nil!27170)))))

(assert (=> b!1235175 e!700755))

(declare-fun res!822567 () Bool)

(assert (=> b!1235175 (=> (not res!822567) (not e!700755))))

(assert (=> b!1235175 (= res!822567 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27170))))

(declare-fun lt!560242 () Unit!40829)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79568 List!27173 List!27173 (_ BitVec 32)) Unit!40829)

(assert (=> b!1235175 (= lt!560242 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27170 from!3184))))

(assert (=> b!1235175 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27169 (select (arr!38387 a!3806) from!3184) acc!823))))

(declare-fun b!1235176 () Bool)

(declare-fun res!822561 () Bool)

(assert (=> b!1235176 (=> (not res!822561) (not e!700756))))

(assert (=> b!1235176 (= res!822561 (validKeyInArray!0 (select (arr!38387 a!3806) from!3184)))))

(declare-fun b!1235177 () Bool)

(declare-fun res!822558 () Bool)

(assert (=> b!1235177 (=> (not res!822558) (not e!700756))))

(assert (=> b!1235177 (= res!822558 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1235178 () Bool)

(declare-fun res!822563 () Bool)

(assert (=> b!1235178 (=> (not res!822563) (not e!700756))))

(declare-fun noDuplicate!1825 (List!27173) Bool)

(assert (=> b!1235178 (= res!822563 (noDuplicate!1825 acc!823))))

(assert (= (and start!102880 res!822564) b!1235171))

(assert (= (and b!1235171 res!822559) b!1235172))

(assert (= (and b!1235172 res!822560) b!1235178))

(assert (= (and b!1235178 res!822563) b!1235170))

(assert (= (and b!1235170 res!822562) b!1235174))

(assert (= (and b!1235174 res!822565) b!1235177))

(assert (= (and b!1235177 res!822558) b!1235169))

(assert (= (and b!1235169 res!822566) b!1235176))

(assert (= (and b!1235176 res!822561) b!1235175))

(assert (= (and b!1235175 res!822567) b!1235173))

(declare-fun m!1139549 () Bool)

(assert (=> start!102880 m!1139549))

(declare-fun m!1139551 () Bool)

(assert (=> b!1235177 m!1139551))

(declare-fun m!1139553 () Bool)

(assert (=> b!1235169 m!1139553))

(declare-fun m!1139555 () Bool)

(assert (=> b!1235178 m!1139555))

(declare-fun m!1139557 () Bool)

(assert (=> b!1235171 m!1139557))

(declare-fun m!1139559 () Bool)

(assert (=> b!1235174 m!1139559))

(declare-fun m!1139561 () Bool)

(assert (=> b!1235173 m!1139561))

(declare-fun m!1139563 () Bool)

(assert (=> b!1235173 m!1139563))

(declare-fun m!1139565 () Bool)

(assert (=> b!1235170 m!1139565))

(assert (=> b!1235176 m!1139561))

(assert (=> b!1235176 m!1139561))

(declare-fun m!1139567 () Bool)

(assert (=> b!1235176 m!1139567))

(declare-fun m!1139569 () Bool)

(assert (=> b!1235175 m!1139569))

(declare-fun m!1139571 () Bool)

(assert (=> b!1235175 m!1139571))

(assert (=> b!1235175 m!1139561))

(declare-fun m!1139573 () Bool)

(assert (=> b!1235175 m!1139573))

(assert (=> b!1235175 m!1139561))

(declare-fun m!1139575 () Bool)

(assert (=> b!1235175 m!1139575))

(assert (=> b!1235175 m!1139561))

(declare-fun m!1139577 () Bool)

(assert (=> b!1235175 m!1139577))

(check-sat (not b!1235171) (not b!1235173) (not b!1235169) (not b!1235175) (not b!1235170) (not b!1235178) (not b!1235177) (not b!1235176) (not start!102880) (not b!1235174))
(check-sat)
