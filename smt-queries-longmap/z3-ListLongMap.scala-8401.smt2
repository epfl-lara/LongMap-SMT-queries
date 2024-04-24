; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102426 () Bool)

(assert start!102426)

(declare-fun b!1231523 () Bool)

(declare-fun res!819221 () Bool)

(declare-fun e!698898 () Bool)

(assert (=> b!1231523 (=> (not res!819221) (not e!698898))))

(declare-datatypes ((List!27098 0))(
  ( (Nil!27095) (Cons!27094 (h!28312 (_ BitVec 64)) (t!40553 List!27098)) )
))
(declare-fun acc!823 () List!27098)

(declare-fun contains!7169 (List!27098 (_ BitVec 64)) Bool)

(assert (=> b!1231523 (= res!819221 (not (contains!7169 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231524 () Bool)

(declare-fun res!819215 () Bool)

(assert (=> b!1231524 (=> (not res!819215) (not e!698898))))

(assert (=> b!1231524 (= res!819215 (not (contains!7169 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231525 () Bool)

(declare-fun res!819217 () Bool)

(assert (=> b!1231525 (=> (not res!819217) (not e!698898))))

(declare-datatypes ((array!79397 0))(
  ( (array!79398 (arr!38312 (Array (_ BitVec 32) (_ BitVec 64))) (size!38849 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79397)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79397 (_ BitVec 32) List!27098) Bool)

(assert (=> b!1231525 (= res!819217 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231526 () Bool)

(declare-fun res!819223 () Bool)

(assert (=> b!1231526 (=> (not res!819223) (not e!698898))))

(assert (=> b!1231526 (= res!819223 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38849 a!3806)) (bvslt from!3184 (size!38849 a!3806))))))

(declare-fun b!1231527 () Bool)

(assert (=> b!1231527 (= e!698898 (not true))))

(declare-fun arrayContainsKey!0 (array!79397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231527 (not (arrayContainsKey!0 a!3806 (select (arr!38312 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40739 0))(
  ( (Unit!40740) )
))
(declare-fun lt!559827 () Unit!40739)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79397 (_ BitVec 32) (_ BitVec 64) List!27098) Unit!40739)

(assert (=> b!1231527 (= lt!559827 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38312 a!3806) from!3184) (Cons!27094 (select (arr!38312 a!3806) from!3184) Nil!27095)))))

(declare-fun e!698899 () Bool)

(assert (=> b!1231527 e!698899))

(declare-fun res!819220 () Bool)

(assert (=> b!1231527 (=> (not res!819220) (not e!698899))))

(assert (=> b!1231527 (= res!819220 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27095))))

(declare-fun lt!559826 () Unit!40739)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79397 List!27098 List!27098 (_ BitVec 32)) Unit!40739)

(assert (=> b!1231527 (= lt!559826 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27095 from!3184))))

(assert (=> b!1231527 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27094 (select (arr!38312 a!3806) from!3184) acc!823))))

(declare-fun b!1231528 () Bool)

(declare-fun res!819216 () Bool)

(assert (=> b!1231528 (=> (not res!819216) (not e!698898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231528 (= res!819216 (validKeyInArray!0 (select (arr!38312 a!3806) from!3184)))))

(declare-fun b!1231529 () Bool)

(assert (=> b!1231529 (= e!698899 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27094 (select (arr!38312 a!3806) from!3184) Nil!27095)))))

(declare-fun res!819219 () Bool)

(assert (=> start!102426 (=> (not res!819219) (not e!698898))))

(assert (=> start!102426 (= res!819219 (bvslt (size!38849 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102426 e!698898))

(declare-fun array_inv!29250 (array!79397) Bool)

(assert (=> start!102426 (array_inv!29250 a!3806)))

(assert (=> start!102426 true))

(declare-fun b!1231522 () Bool)

(declare-fun res!819222 () Bool)

(assert (=> b!1231522 (=> (not res!819222) (not e!698898))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1231522 (= res!819222 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231530 () Bool)

(declare-fun res!819218 () Bool)

(assert (=> b!1231530 (=> (not res!819218) (not e!698898))))

(declare-fun noDuplicate!1750 (List!27098) Bool)

(assert (=> b!1231530 (= res!819218 (noDuplicate!1750 acc!823))))

(declare-fun b!1231531 () Bool)

(declare-fun res!819224 () Bool)

(assert (=> b!1231531 (=> (not res!819224) (not e!698898))))

(assert (=> b!1231531 (= res!819224 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102426 res!819219) b!1231522))

(assert (= (and b!1231522 res!819222) b!1231526))

(assert (= (and b!1231526 res!819223) b!1231530))

(assert (= (and b!1231530 res!819218) b!1231523))

(assert (= (and b!1231523 res!819221) b!1231524))

(assert (= (and b!1231524 res!819215) b!1231531))

(assert (= (and b!1231531 res!819224) b!1231525))

(assert (= (and b!1231525 res!819217) b!1231528))

(assert (= (and b!1231528 res!819216) b!1231527))

(assert (= (and b!1231527 res!819220) b!1231529))

(declare-fun m!1136307 () Bool)

(assert (=> b!1231530 m!1136307))

(declare-fun m!1136309 () Bool)

(assert (=> b!1231524 m!1136309))

(declare-fun m!1136311 () Bool)

(assert (=> b!1231528 m!1136311))

(assert (=> b!1231528 m!1136311))

(declare-fun m!1136313 () Bool)

(assert (=> b!1231528 m!1136313))

(assert (=> b!1231529 m!1136311))

(declare-fun m!1136315 () Bool)

(assert (=> b!1231529 m!1136315))

(declare-fun m!1136317 () Bool)

(assert (=> b!1231525 m!1136317))

(declare-fun m!1136319 () Bool)

(assert (=> b!1231531 m!1136319))

(declare-fun m!1136321 () Bool)

(assert (=> b!1231527 m!1136321))

(declare-fun m!1136323 () Bool)

(assert (=> b!1231527 m!1136323))

(assert (=> b!1231527 m!1136311))

(declare-fun m!1136325 () Bool)

(assert (=> b!1231527 m!1136325))

(assert (=> b!1231527 m!1136311))

(declare-fun m!1136327 () Bool)

(assert (=> b!1231527 m!1136327))

(assert (=> b!1231527 m!1136311))

(declare-fun m!1136329 () Bool)

(assert (=> b!1231527 m!1136329))

(declare-fun m!1136331 () Bool)

(assert (=> b!1231522 m!1136331))

(declare-fun m!1136333 () Bool)

(assert (=> b!1231523 m!1136333))

(declare-fun m!1136335 () Bool)

(assert (=> start!102426 m!1136335))

(check-sat (not b!1231529) (not b!1231525) (not b!1231522) (not b!1231523) (not b!1231524) (not start!102426) (not b!1231531) (not b!1231527) (not b!1231528) (not b!1231530))
(check-sat)
