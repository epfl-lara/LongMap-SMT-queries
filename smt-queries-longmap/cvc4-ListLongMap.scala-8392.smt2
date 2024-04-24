; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102374 () Bool)

(assert start!102374)

(declare-fun b!1230510 () Bool)

(declare-fun res!818204 () Bool)

(declare-fun e!698609 () Bool)

(assert (=> b!1230510 (=> (not res!818204) (not e!698609))))

(declare-datatypes ((List!27072 0))(
  ( (Nil!27069) (Cons!27068 (h!28286 (_ BitVec 64)) (t!40527 List!27072)) )
))
(declare-fun acc!823 () List!27072)

(declare-fun noDuplicate!1724 (List!27072) Bool)

(assert (=> b!1230510 (= res!818204 (noDuplicate!1724 acc!823))))

(declare-fun b!1230511 () Bool)

(declare-fun res!818214 () Bool)

(assert (=> b!1230511 (=> (not res!818214) (not e!698609))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79345 0))(
  ( (array!79346 (arr!38286 (Array (_ BitVec 32) (_ BitVec 64))) (size!38823 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79345)

(assert (=> b!1230511 (= res!818214 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38823 a!3806)) (bvslt from!3184 (size!38823 a!3806))))))

(declare-fun b!1230512 () Bool)

(declare-fun res!818203 () Bool)

(declare-fun e!698608 () Bool)

(assert (=> b!1230512 (=> res!818203 e!698608)))

(declare-fun lt!559613 () List!27072)

(declare-fun contains!7143 (List!27072 (_ BitVec 64)) Bool)

(assert (=> b!1230512 (= res!818203 (contains!7143 lt!559613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230513 () Bool)

(declare-fun res!818215 () Bool)

(assert (=> b!1230513 (=> res!818215 e!698608)))

(assert (=> b!1230513 (= res!818215 (not (noDuplicate!1724 lt!559613)))))

(declare-fun b!1230514 () Bool)

(assert (=> b!1230514 (= e!698608 true)))

(declare-fun lt!559612 () Bool)

(assert (=> b!1230514 (= lt!559612 (contains!7143 lt!559613 (select (arr!38286 a!3806) from!3184)))))

(declare-fun b!1230515 () Bool)

(declare-fun res!818208 () Bool)

(assert (=> b!1230515 (=> (not res!818208) (not e!698609))))

(assert (=> b!1230515 (= res!818208 (not (contains!7143 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230516 () Bool)

(declare-fun res!818216 () Bool)

(assert (=> b!1230516 (=> (not res!818216) (not e!698609))))

(assert (=> b!1230516 (= res!818216 (not (contains!7143 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230517 () Bool)

(declare-fun res!818212 () Bool)

(assert (=> b!1230517 (=> (not res!818212) (not e!698609))))

(declare-fun arrayNoDuplicates!0 (array!79345 (_ BitVec 32) List!27072) Bool)

(assert (=> b!1230517 (= res!818212 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230518 () Bool)

(assert (=> b!1230518 (= e!698609 (not e!698608))))

(declare-fun res!818209 () Bool)

(assert (=> b!1230518 (=> res!818209 e!698608)))

(assert (=> b!1230518 (= res!818209 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1230518 (= lt!559613 (Cons!27068 (select (arr!38286 a!3806) from!3184) Nil!27069))))

(declare-fun e!698606 () Bool)

(assert (=> b!1230518 e!698606))

(declare-fun res!818206 () Bool)

(assert (=> b!1230518 (=> (not res!818206) (not e!698606))))

(assert (=> b!1230518 (= res!818206 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27069))))

(declare-datatypes ((Unit!40687 0))(
  ( (Unit!40688) )
))
(declare-fun lt!559614 () Unit!40687)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79345 List!27072 List!27072 (_ BitVec 32)) Unit!40687)

(assert (=> b!1230518 (= lt!559614 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27069 from!3184))))

(assert (=> b!1230518 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27068 (select (arr!38286 a!3806) from!3184) acc!823))))

(declare-fun b!1230519 () Bool)

(declare-fun res!818211 () Bool)

(assert (=> b!1230519 (=> res!818211 e!698608)))

(assert (=> b!1230519 (= res!818211 (contains!7143 lt!559613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230520 () Bool)

(declare-fun res!818210 () Bool)

(assert (=> b!1230520 (=> (not res!818210) (not e!698609))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230520 (= res!818210 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230521 () Bool)

(assert (=> b!1230521 (= e!698606 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27068 (select (arr!38286 a!3806) from!3184) Nil!27069)))))

(declare-fun res!818213 () Bool)

(assert (=> start!102374 (=> (not res!818213) (not e!698609))))

(assert (=> start!102374 (= res!818213 (bvslt (size!38823 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102374 e!698609))

(declare-fun array_inv!29224 (array!79345) Bool)

(assert (=> start!102374 (array_inv!29224 a!3806)))

(assert (=> start!102374 true))

(declare-fun b!1230522 () Bool)

(declare-fun res!818205 () Bool)

(assert (=> b!1230522 (=> (not res!818205) (not e!698609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230522 (= res!818205 (validKeyInArray!0 k!2913))))

(declare-fun b!1230523 () Bool)

(declare-fun res!818207 () Bool)

(assert (=> b!1230523 (=> (not res!818207) (not e!698609))))

(assert (=> b!1230523 (= res!818207 (validKeyInArray!0 (select (arr!38286 a!3806) from!3184)))))

(assert (= (and start!102374 res!818213) b!1230522))

(assert (= (and b!1230522 res!818205) b!1230511))

(assert (= (and b!1230511 res!818214) b!1230510))

(assert (= (and b!1230510 res!818204) b!1230515))

(assert (= (and b!1230515 res!818208) b!1230516))

(assert (= (and b!1230516 res!818216) b!1230520))

(assert (= (and b!1230520 res!818210) b!1230517))

(assert (= (and b!1230517 res!818212) b!1230523))

(assert (= (and b!1230523 res!818207) b!1230518))

(assert (= (and b!1230518 res!818206) b!1230521))

(assert (= (and b!1230518 (not res!818209)) b!1230513))

(assert (= (and b!1230513 (not res!818215)) b!1230512))

(assert (= (and b!1230512 (not res!818203)) b!1230519))

(assert (= (and b!1230519 (not res!818211)) b!1230514))

(declare-fun m!1135447 () Bool)

(assert (=> b!1230510 m!1135447))

(declare-fun m!1135449 () Bool)

(assert (=> start!102374 m!1135449))

(declare-fun m!1135451 () Bool)

(assert (=> b!1230522 m!1135451))

(declare-fun m!1135453 () Bool)

(assert (=> b!1230521 m!1135453))

(declare-fun m!1135455 () Bool)

(assert (=> b!1230521 m!1135455))

(declare-fun m!1135457 () Bool)

(assert (=> b!1230519 m!1135457))

(assert (=> b!1230514 m!1135453))

(assert (=> b!1230514 m!1135453))

(declare-fun m!1135459 () Bool)

(assert (=> b!1230514 m!1135459))

(declare-fun m!1135461 () Bool)

(assert (=> b!1230513 m!1135461))

(declare-fun m!1135463 () Bool)

(assert (=> b!1230516 m!1135463))

(assert (=> b!1230523 m!1135453))

(assert (=> b!1230523 m!1135453))

(declare-fun m!1135465 () Bool)

(assert (=> b!1230523 m!1135465))

(declare-fun m!1135467 () Bool)

(assert (=> b!1230515 m!1135467))

(declare-fun m!1135469 () Bool)

(assert (=> b!1230512 m!1135469))

(assert (=> b!1230518 m!1135453))

(declare-fun m!1135471 () Bool)

(assert (=> b!1230518 m!1135471))

(declare-fun m!1135473 () Bool)

(assert (=> b!1230518 m!1135473))

(declare-fun m!1135475 () Bool)

(assert (=> b!1230518 m!1135475))

(declare-fun m!1135477 () Bool)

(assert (=> b!1230517 m!1135477))

(declare-fun m!1135479 () Bool)

(assert (=> b!1230520 m!1135479))

(push 1)

(assert (not b!1230517))

(assert (not b!1230512))

(assert (not b!1230513))

(assert (not b!1230516))

(assert (not b!1230510))

(assert (not b!1230514))

(assert (not b!1230523))

(assert (not b!1230519))

(assert (not b!1230518))

(assert (not start!102374))

(assert (not b!1230522))

(assert (not b!1230515))

(assert (not b!1230521))

(assert (not b!1230520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

