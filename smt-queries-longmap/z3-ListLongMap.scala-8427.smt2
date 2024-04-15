; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102646 () Bool)

(assert start!102646)

(declare-fun b!1233867 () Bool)

(declare-fun e!699887 () Bool)

(declare-datatypes ((array!79459 0))(
  ( (array!79460 (arr!38339 (Array (_ BitVec 32) (_ BitVec 64))) (size!38877 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79459)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27213 0))(
  ( (Nil!27210) (Cons!27209 (h!28418 (_ BitVec 64)) (t!40667 List!27213)) )
))
(declare-fun arrayNoDuplicates!0 (array!79459 (_ BitVec 32) List!27213) Bool)

(assert (=> b!1233867 (= e!699887 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27209 (select (arr!38339 a!3806) from!3184) Nil!27210)))))

(declare-fun b!1233868 () Bool)

(declare-fun res!822086 () Bool)

(declare-fun e!699885 () Bool)

(assert (=> b!1233868 (=> (not res!822086) (not e!699885))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233868 (= res!822086 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233870 () Bool)

(declare-fun res!822092 () Bool)

(assert (=> b!1233870 (=> (not res!822092) (not e!699885))))

(assert (=> b!1233870 (= res!822092 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38877 a!3806)) (bvslt from!3184 (size!38877 a!3806))))))

(declare-fun b!1233871 () Bool)

(declare-fun res!822089 () Bool)

(assert (=> b!1233871 (=> (not res!822089) (not e!699885))))

(assert (=> b!1233871 (= res!822089 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1233872 () Bool)

(assert (=> b!1233872 (= e!699885 (not (not (= (select (arr!38339 a!3806) from!3184) k0!2913))))))

(declare-fun arrayContainsKey!0 (array!79459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233872 (not (arrayContainsKey!0 a!3806 (select (arr!38339 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40709 0))(
  ( (Unit!40710) )
))
(declare-fun lt!559600 () Unit!40709)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79459 (_ BitVec 32) (_ BitVec 64) List!27213) Unit!40709)

(assert (=> b!1233872 (= lt!559600 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38339 a!3806) from!3184) (Cons!27209 (select (arr!38339 a!3806) from!3184) Nil!27210)))))

(assert (=> b!1233872 e!699887))

(declare-fun res!822083 () Bool)

(assert (=> b!1233872 (=> (not res!822083) (not e!699887))))

(assert (=> b!1233872 (= res!822083 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27210))))

(declare-fun acc!823 () List!27213)

(declare-fun lt!559601 () Unit!40709)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79459 List!27213 List!27213 (_ BitVec 32)) Unit!40709)

(assert (=> b!1233872 (= lt!559601 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27210 from!3184))))

(assert (=> b!1233872 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27209 (select (arr!38339 a!3806) from!3184) acc!823))))

(declare-fun b!1233873 () Bool)

(declare-fun res!822088 () Bool)

(assert (=> b!1233873 (=> (not res!822088) (not e!699885))))

(declare-fun contains!7185 (List!27213 (_ BitVec 64)) Bool)

(assert (=> b!1233873 (= res!822088 (not (contains!7185 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233874 () Bool)

(declare-fun res!822087 () Bool)

(assert (=> b!1233874 (=> (not res!822087) (not e!699885))))

(assert (=> b!1233874 (= res!822087 (not (contains!7185 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!822091 () Bool)

(assert (=> start!102646 (=> (not res!822091) (not e!699885))))

(assert (=> start!102646 (= res!822091 (bvslt (size!38877 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102646 e!699885))

(declare-fun array_inv!29322 (array!79459) Bool)

(assert (=> start!102646 (array_inv!29322 a!3806)))

(assert (=> start!102646 true))

(declare-fun b!1233869 () Bool)

(declare-fun res!822085 () Bool)

(assert (=> b!1233869 (=> (not res!822085) (not e!699885))))

(assert (=> b!1233869 (= res!822085 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233875 () Bool)

(declare-fun res!822090 () Bool)

(assert (=> b!1233875 (=> (not res!822090) (not e!699885))))

(assert (=> b!1233875 (= res!822090 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233876 () Bool)

(declare-fun res!822084 () Bool)

(assert (=> b!1233876 (=> (not res!822084) (not e!699885))))

(declare-fun noDuplicate!1828 (List!27213) Bool)

(assert (=> b!1233876 (= res!822084 (noDuplicate!1828 acc!823))))

(assert (= (and start!102646 res!822091) b!1233868))

(assert (= (and b!1233868 res!822086) b!1233870))

(assert (= (and b!1233870 res!822092) b!1233876))

(assert (= (and b!1233876 res!822084) b!1233873))

(assert (= (and b!1233873 res!822088) b!1233874))

(assert (= (and b!1233874 res!822087) b!1233875))

(assert (= (and b!1233875 res!822090) b!1233869))

(assert (= (and b!1233869 res!822085) b!1233871))

(assert (= (and b!1233871 res!822089) b!1233872))

(assert (= (and b!1233872 res!822083) b!1233867))

(declare-fun m!1137495 () Bool)

(assert (=> b!1233873 m!1137495))

(declare-fun m!1137497 () Bool)

(assert (=> b!1233872 m!1137497))

(declare-fun m!1137499 () Bool)

(assert (=> b!1233872 m!1137499))

(declare-fun m!1137501 () Bool)

(assert (=> b!1233872 m!1137501))

(declare-fun m!1137503 () Bool)

(assert (=> b!1233872 m!1137503))

(assert (=> b!1233872 m!1137501))

(declare-fun m!1137505 () Bool)

(assert (=> b!1233872 m!1137505))

(assert (=> b!1233872 m!1137501))

(declare-fun m!1137507 () Bool)

(assert (=> b!1233872 m!1137507))

(declare-fun m!1137509 () Bool)

(assert (=> b!1233869 m!1137509))

(declare-fun m!1137511 () Bool)

(assert (=> b!1233868 m!1137511))

(assert (=> b!1233867 m!1137501))

(declare-fun m!1137513 () Bool)

(assert (=> b!1233867 m!1137513))

(declare-fun m!1137515 () Bool)

(assert (=> b!1233876 m!1137515))

(declare-fun m!1137517 () Bool)

(assert (=> start!102646 m!1137517))

(declare-fun m!1137519 () Bool)

(assert (=> b!1233874 m!1137519))

(assert (=> b!1233871 m!1137501))

(assert (=> b!1233871 m!1137501))

(declare-fun m!1137521 () Bool)

(assert (=> b!1233871 m!1137521))

(declare-fun m!1137523 () Bool)

(assert (=> b!1233875 m!1137523))

(check-sat (not start!102646) (not b!1233875) (not b!1233876) (not b!1233871) (not b!1233869) (not b!1233873) (not b!1233868) (not b!1233867) (not b!1233872) (not b!1233874))
(check-sat)
