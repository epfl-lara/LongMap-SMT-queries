; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102874 () Bool)

(assert start!102874)

(declare-fun b!1235079 () Bool)

(declare-fun res!822476 () Bool)

(declare-fun e!700728 () Bool)

(assert (=> b!1235079 (=> (not res!822476) (not e!700728))))

(declare-datatypes ((array!79562 0))(
  ( (array!79563 (arr!38384 (Array (_ BitVec 32) (_ BitVec 64))) (size!38921 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79562)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1235079 (= res!822476 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1235080 () Bool)

(assert (=> b!1235080 (= e!700728 (not true))))

(assert (=> b!1235080 (not (arrayContainsKey!0 a!3806 (select (arr!38384 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40823 0))(
  ( (Unit!40824) )
))
(declare-fun lt!560224 () Unit!40823)

(declare-datatypes ((List!27170 0))(
  ( (Nil!27167) (Cons!27166 (h!28384 (_ BitVec 64)) (t!40625 List!27170)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79562 (_ BitVec 32) (_ BitVec 64) List!27170) Unit!40823)

(assert (=> b!1235080 (= lt!560224 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38384 a!3806) from!3184) (Cons!27166 (select (arr!38384 a!3806) from!3184) Nil!27167)))))

(declare-fun e!700729 () Bool)

(assert (=> b!1235080 e!700729))

(declare-fun res!822470 () Bool)

(assert (=> b!1235080 (=> (not res!822470) (not e!700729))))

(declare-fun arrayNoDuplicates!0 (array!79562 (_ BitVec 32) List!27170) Bool)

(assert (=> b!1235080 (= res!822470 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27167))))

(declare-fun acc!823 () List!27170)

(declare-fun lt!560225 () Unit!40823)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79562 List!27170 List!27170 (_ BitVec 32)) Unit!40823)

(assert (=> b!1235080 (= lt!560225 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27167 from!3184))))

(assert (=> b!1235080 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27166 (select (arr!38384 a!3806) from!3184) acc!823))))

(declare-fun b!1235081 () Bool)

(declare-fun res!822473 () Bool)

(assert (=> b!1235081 (=> (not res!822473) (not e!700728))))

(assert (=> b!1235081 (= res!822473 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38921 a!3806)) (bvslt from!3184 (size!38921 a!3806))))))

(declare-fun b!1235082 () Bool)

(declare-fun res!822475 () Bool)

(assert (=> b!1235082 (=> (not res!822475) (not e!700728))))

(declare-fun contains!7241 (List!27170 (_ BitVec 64)) Bool)

(assert (=> b!1235082 (= res!822475 (not (contains!7241 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235084 () Bool)

(declare-fun res!822469 () Bool)

(assert (=> b!1235084 (=> (not res!822469) (not e!700728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235084 (= res!822469 (validKeyInArray!0 (select (arr!38384 a!3806) from!3184)))))

(declare-fun b!1235085 () Bool)

(assert (=> b!1235085 (= e!700729 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27166 (select (arr!38384 a!3806) from!3184) Nil!27167)))))

(declare-fun b!1235086 () Bool)

(declare-fun res!822474 () Bool)

(assert (=> b!1235086 (=> (not res!822474) (not e!700728))))

(assert (=> b!1235086 (= res!822474 (not (contains!7241 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235087 () Bool)

(declare-fun res!822468 () Bool)

(assert (=> b!1235087 (=> (not res!822468) (not e!700728))))

(declare-fun noDuplicate!1822 (List!27170) Bool)

(assert (=> b!1235087 (= res!822468 (noDuplicate!1822 acc!823))))

(declare-fun b!1235088 () Bool)

(declare-fun res!822472 () Bool)

(assert (=> b!1235088 (=> (not res!822472) (not e!700728))))

(assert (=> b!1235088 (= res!822472 (validKeyInArray!0 k0!2913))))

(declare-fun res!822477 () Bool)

(assert (=> start!102874 (=> (not res!822477) (not e!700728))))

(assert (=> start!102874 (= res!822477 (bvslt (size!38921 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102874 e!700728))

(declare-fun array_inv!29322 (array!79562) Bool)

(assert (=> start!102874 (array_inv!29322 a!3806)))

(assert (=> start!102874 true))

(declare-fun b!1235083 () Bool)

(declare-fun res!822471 () Bool)

(assert (=> b!1235083 (=> (not res!822471) (not e!700728))))

(assert (=> b!1235083 (= res!822471 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102874 res!822477) b!1235088))

(assert (= (and b!1235088 res!822472) b!1235081))

(assert (= (and b!1235081 res!822473) b!1235087))

(assert (= (and b!1235087 res!822468) b!1235082))

(assert (= (and b!1235082 res!822475) b!1235086))

(assert (= (and b!1235086 res!822474) b!1235079))

(assert (= (and b!1235079 res!822476) b!1235083))

(assert (= (and b!1235083 res!822471) b!1235084))

(assert (= (and b!1235084 res!822469) b!1235080))

(assert (= (and b!1235080 res!822470) b!1235085))

(declare-fun m!1139459 () Bool)

(assert (=> b!1235088 m!1139459))

(declare-fun m!1139461 () Bool)

(assert (=> b!1235080 m!1139461))

(declare-fun m!1139463 () Bool)

(assert (=> b!1235080 m!1139463))

(declare-fun m!1139465 () Bool)

(assert (=> b!1235080 m!1139465))

(declare-fun m!1139467 () Bool)

(assert (=> b!1235080 m!1139467))

(assert (=> b!1235080 m!1139465))

(declare-fun m!1139469 () Bool)

(assert (=> b!1235080 m!1139469))

(assert (=> b!1235080 m!1139465))

(declare-fun m!1139471 () Bool)

(assert (=> b!1235080 m!1139471))

(assert (=> b!1235084 m!1139465))

(assert (=> b!1235084 m!1139465))

(declare-fun m!1139473 () Bool)

(assert (=> b!1235084 m!1139473))

(declare-fun m!1139475 () Bool)

(assert (=> b!1235079 m!1139475))

(declare-fun m!1139477 () Bool)

(assert (=> b!1235086 m!1139477))

(assert (=> b!1235085 m!1139465))

(declare-fun m!1139479 () Bool)

(assert (=> b!1235085 m!1139479))

(declare-fun m!1139481 () Bool)

(assert (=> start!102874 m!1139481))

(declare-fun m!1139483 () Bool)

(assert (=> b!1235087 m!1139483))

(declare-fun m!1139485 () Bool)

(assert (=> b!1235082 m!1139485))

(declare-fun m!1139487 () Bool)

(assert (=> b!1235083 m!1139487))

(check-sat (not b!1235084) (not b!1235088) (not b!1235082) (not b!1235080) (not b!1235079) (not b!1235087) (not start!102874) (not b!1235085) (not b!1235083) (not b!1235086))
(check-sat)
