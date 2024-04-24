; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102868 () Bool)

(assert start!102868)

(declare-fun b!1234989 () Bool)

(declare-fun res!822381 () Bool)

(declare-fun e!700702 () Bool)

(assert (=> b!1234989 (=> (not res!822381) (not e!700702))))

(declare-datatypes ((array!79556 0))(
  ( (array!79557 (arr!38381 (Array (_ BitVec 32) (_ BitVec 64))) (size!38918 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79556)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234989 (= res!822381 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234990 () Bool)

(declare-fun res!822383 () Bool)

(assert (=> b!1234990 (=> (not res!822383) (not e!700702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234990 (= res!822383 (validKeyInArray!0 k0!2913))))

(declare-fun res!822387 () Bool)

(assert (=> start!102868 (=> (not res!822387) (not e!700702))))

(assert (=> start!102868 (= res!822387 (bvslt (size!38918 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102868 e!700702))

(declare-fun array_inv!29319 (array!79556) Bool)

(assert (=> start!102868 (array_inv!29319 a!3806)))

(assert (=> start!102868 true))

(declare-fun b!1234991 () Bool)

(declare-fun e!700703 () Bool)

(declare-datatypes ((List!27167 0))(
  ( (Nil!27164) (Cons!27163 (h!28381 (_ BitVec 64)) (t!40622 List!27167)) )
))
(declare-fun arrayNoDuplicates!0 (array!79556 (_ BitVec 32) List!27167) Bool)

(assert (=> b!1234991 (= e!700703 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27163 (select (arr!38381 a!3806) from!3184) Nil!27164)))))

(declare-fun b!1234992 () Bool)

(declare-fun res!822379 () Bool)

(assert (=> b!1234992 (=> (not res!822379) (not e!700702))))

(declare-fun acc!823 () List!27167)

(declare-fun contains!7238 (List!27167 (_ BitVec 64)) Bool)

(assert (=> b!1234992 (= res!822379 (not (contains!7238 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234993 () Bool)

(assert (=> b!1234993 (= e!700702 (not true))))

(assert (=> b!1234993 (not (arrayContainsKey!0 a!3806 (select (arr!38381 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40817 0))(
  ( (Unit!40818) )
))
(declare-fun lt!560206 () Unit!40817)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79556 (_ BitVec 32) (_ BitVec 64) List!27167) Unit!40817)

(assert (=> b!1234993 (= lt!560206 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38381 a!3806) from!3184) (Cons!27163 (select (arr!38381 a!3806) from!3184) Nil!27164)))))

(assert (=> b!1234993 e!700703))

(declare-fun res!822386 () Bool)

(assert (=> b!1234993 (=> (not res!822386) (not e!700703))))

(assert (=> b!1234993 (= res!822386 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27164))))

(declare-fun lt!560207 () Unit!40817)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79556 List!27167 List!27167 (_ BitVec 32)) Unit!40817)

(assert (=> b!1234993 (= lt!560207 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27164 from!3184))))

(assert (=> b!1234993 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27163 (select (arr!38381 a!3806) from!3184) acc!823))))

(declare-fun b!1234994 () Bool)

(declare-fun res!822385 () Bool)

(assert (=> b!1234994 (=> (not res!822385) (not e!700702))))

(assert (=> b!1234994 (= res!822385 (validKeyInArray!0 (select (arr!38381 a!3806) from!3184)))))

(declare-fun b!1234995 () Bool)

(declare-fun res!822378 () Bool)

(assert (=> b!1234995 (=> (not res!822378) (not e!700702))))

(assert (=> b!1234995 (= res!822378 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38918 a!3806)) (bvslt from!3184 (size!38918 a!3806))))))

(declare-fun b!1234996 () Bool)

(declare-fun res!822382 () Bool)

(assert (=> b!1234996 (=> (not res!822382) (not e!700702))))

(declare-fun noDuplicate!1819 (List!27167) Bool)

(assert (=> b!1234996 (= res!822382 (noDuplicate!1819 acc!823))))

(declare-fun b!1234997 () Bool)

(declare-fun res!822384 () Bool)

(assert (=> b!1234997 (=> (not res!822384) (not e!700702))))

(assert (=> b!1234997 (= res!822384 (not (contains!7238 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234998 () Bool)

(declare-fun res!822380 () Bool)

(assert (=> b!1234998 (=> (not res!822380) (not e!700702))))

(assert (=> b!1234998 (= res!822380 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102868 res!822387) b!1234990))

(assert (= (and b!1234990 res!822383) b!1234995))

(assert (= (and b!1234995 res!822378) b!1234996))

(assert (= (and b!1234996 res!822382) b!1234997))

(assert (= (and b!1234997 res!822384) b!1234992))

(assert (= (and b!1234992 res!822379) b!1234989))

(assert (= (and b!1234989 res!822381) b!1234998))

(assert (= (and b!1234998 res!822380) b!1234994))

(assert (= (and b!1234994 res!822385) b!1234993))

(assert (= (and b!1234993 res!822386) b!1234991))

(declare-fun m!1139369 () Bool)

(assert (=> b!1234994 m!1139369))

(assert (=> b!1234994 m!1139369))

(declare-fun m!1139371 () Bool)

(assert (=> b!1234994 m!1139371))

(declare-fun m!1139373 () Bool)

(assert (=> b!1234992 m!1139373))

(declare-fun m!1139375 () Bool)

(assert (=> b!1234996 m!1139375))

(declare-fun m!1139377 () Bool)

(assert (=> b!1234990 m!1139377))

(declare-fun m!1139379 () Bool)

(assert (=> b!1234997 m!1139379))

(declare-fun m!1139381 () Bool)

(assert (=> b!1234993 m!1139381))

(declare-fun m!1139383 () Bool)

(assert (=> b!1234993 m!1139383))

(assert (=> b!1234993 m!1139369))

(declare-fun m!1139385 () Bool)

(assert (=> b!1234993 m!1139385))

(assert (=> b!1234993 m!1139369))

(declare-fun m!1139387 () Bool)

(assert (=> b!1234993 m!1139387))

(assert (=> b!1234993 m!1139369))

(declare-fun m!1139389 () Bool)

(assert (=> b!1234993 m!1139389))

(declare-fun m!1139391 () Bool)

(assert (=> b!1234998 m!1139391))

(assert (=> b!1234991 m!1139369))

(declare-fun m!1139393 () Bool)

(assert (=> b!1234991 m!1139393))

(declare-fun m!1139395 () Bool)

(assert (=> start!102868 m!1139395))

(declare-fun m!1139397 () Bool)

(assert (=> b!1234989 m!1139397))

(check-sat (not b!1234994) (not b!1234991) (not b!1234989) (not start!102868) (not b!1234997) (not b!1234992) (not b!1234996) (not b!1234990) (not b!1234998) (not b!1234993))
(check-sat)
