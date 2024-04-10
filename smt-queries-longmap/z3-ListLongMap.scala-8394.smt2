; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102146 () Bool)

(assert start!102146)

(declare-fun b!1229434 () Bool)

(declare-fun e!697814 () Bool)

(declare-datatypes ((array!79321 0))(
  ( (array!79322 (arr!38280 (Array (_ BitVec 32) (_ BitVec 64))) (size!38816 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79321)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27053 0))(
  ( (Nil!27050) (Cons!27049 (h!28258 (_ BitVec 64)) (t!40516 List!27053)) )
))
(declare-fun arrayNoDuplicates!0 (array!79321 (_ BitVec 32) List!27053) Bool)

(assert (=> b!1229434 (= e!697814 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27049 (select (arr!38280 a!3806) from!3184) Nil!27050)))))

(declare-fun b!1229435 () Bool)

(declare-fun res!817931 () Bool)

(declare-fun e!697812 () Bool)

(assert (=> b!1229435 (=> (not res!817931) (not e!697812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229435 (= res!817931 (validKeyInArray!0 (select (arr!38280 a!3806) from!3184)))))

(declare-fun b!1229436 () Bool)

(declare-fun res!817926 () Bool)

(assert (=> b!1229436 (=> (not res!817926) (not e!697812))))

(declare-fun acc!823 () List!27053)

(declare-fun noDuplicate!1712 (List!27053) Bool)

(assert (=> b!1229436 (= res!817926 (noDuplicate!1712 acc!823))))

(declare-fun b!1229437 () Bool)

(declare-fun res!817930 () Bool)

(assert (=> b!1229437 (=> (not res!817930) (not e!697812))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229437 (= res!817930 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229438 () Bool)

(declare-fun res!817928 () Bool)

(declare-fun e!697813 () Bool)

(assert (=> b!1229438 (=> res!817928 e!697813)))

(declare-fun lt!559179 () List!27053)

(declare-fun contains!7115 (List!27053 (_ BitVec 64)) Bool)

(assert (=> b!1229438 (= res!817928 (contains!7115 lt!559179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229439 () Bool)

(declare-fun res!817920 () Bool)

(assert (=> b!1229439 (=> (not res!817920) (not e!697812))))

(assert (=> b!1229439 (= res!817920 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229440 () Bool)

(declare-fun res!817932 () Bool)

(assert (=> b!1229440 (=> (not res!817932) (not e!697812))))

(assert (=> b!1229440 (= res!817932 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38816 a!3806)) (bvslt from!3184 (size!38816 a!3806))))))

(declare-fun res!817925 () Bool)

(assert (=> start!102146 (=> (not res!817925) (not e!697812))))

(assert (=> start!102146 (= res!817925 (bvslt (size!38816 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102146 e!697812))

(declare-fun array_inv!29128 (array!79321) Bool)

(assert (=> start!102146 (array_inv!29128 a!3806)))

(assert (=> start!102146 true))

(declare-fun b!1229441 () Bool)

(declare-fun res!817921 () Bool)

(assert (=> b!1229441 (=> (not res!817921) (not e!697812))))

(assert (=> b!1229441 (= res!817921 (not (contains!7115 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229442 () Bool)

(declare-fun res!817927 () Bool)

(assert (=> b!1229442 (=> (not res!817927) (not e!697812))))

(assert (=> b!1229442 (= res!817927 (not (contains!7115 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229443 () Bool)

(declare-fun res!817933 () Bool)

(assert (=> b!1229443 (=> res!817933 e!697813)))

(assert (=> b!1229443 (= res!817933 (contains!7115 lt!559179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229444 () Bool)

(declare-fun res!817922 () Bool)

(assert (=> b!1229444 (=> (not res!817922) (not e!697812))))

(assert (=> b!1229444 (= res!817922 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229445 () Bool)

(assert (=> b!1229445 (= e!697812 (not e!697813))))

(declare-fun res!817924 () Bool)

(assert (=> b!1229445 (=> res!817924 e!697813)))

(assert (=> b!1229445 (= res!817924 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229445 (= lt!559179 (Cons!27049 (select (arr!38280 a!3806) from!3184) Nil!27050))))

(assert (=> b!1229445 e!697814))

(declare-fun res!817923 () Bool)

(assert (=> b!1229445 (=> (not res!817923) (not e!697814))))

(assert (=> b!1229445 (= res!817923 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27050))))

(declare-datatypes ((Unit!40726 0))(
  ( (Unit!40727) )
))
(declare-fun lt!559181 () Unit!40726)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79321 List!27053 List!27053 (_ BitVec 32)) Unit!40726)

(assert (=> b!1229445 (= lt!559181 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27050 from!3184))))

(assert (=> b!1229445 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27049 (select (arr!38280 a!3806) from!3184) acc!823))))

(declare-fun b!1229446 () Bool)

(assert (=> b!1229446 (= e!697813 true)))

(declare-fun lt!559180 () Bool)

(assert (=> b!1229446 (= lt!559180 (contains!7115 lt!559179 (select (arr!38280 a!3806) from!3184)))))

(declare-fun b!1229447 () Bool)

(declare-fun res!817929 () Bool)

(assert (=> b!1229447 (=> res!817929 e!697813)))

(assert (=> b!1229447 (= res!817929 (not (noDuplicate!1712 lt!559179)))))

(assert (= (and start!102146 res!817925) b!1229439))

(assert (= (and b!1229439 res!817920) b!1229440))

(assert (= (and b!1229440 res!817932) b!1229436))

(assert (= (and b!1229436 res!817926) b!1229442))

(assert (= (and b!1229442 res!817927) b!1229441))

(assert (= (and b!1229441 res!817921) b!1229437))

(assert (= (and b!1229437 res!817930) b!1229444))

(assert (= (and b!1229444 res!817922) b!1229435))

(assert (= (and b!1229435 res!817931) b!1229445))

(assert (= (and b!1229445 res!817923) b!1229434))

(assert (= (and b!1229445 (not res!817924)) b!1229447))

(assert (= (and b!1229447 (not res!817929)) b!1229443))

(assert (= (and b!1229443 (not res!817933)) b!1229438))

(assert (= (and b!1229438 (not res!817928)) b!1229446))

(declare-fun m!1133993 () Bool)

(assert (=> b!1229435 m!1133993))

(assert (=> b!1229435 m!1133993))

(declare-fun m!1133995 () Bool)

(assert (=> b!1229435 m!1133995))

(declare-fun m!1133997 () Bool)

(assert (=> b!1229444 m!1133997))

(assert (=> b!1229434 m!1133993))

(declare-fun m!1133999 () Bool)

(assert (=> b!1229434 m!1133999))

(declare-fun m!1134001 () Bool)

(assert (=> b!1229439 m!1134001))

(declare-fun m!1134003 () Bool)

(assert (=> b!1229438 m!1134003))

(declare-fun m!1134005 () Bool)

(assert (=> start!102146 m!1134005))

(assert (=> b!1229446 m!1133993))

(assert (=> b!1229446 m!1133993))

(declare-fun m!1134007 () Bool)

(assert (=> b!1229446 m!1134007))

(declare-fun m!1134009 () Bool)

(assert (=> b!1229436 m!1134009))

(declare-fun m!1134011 () Bool)

(assert (=> b!1229443 m!1134011))

(declare-fun m!1134013 () Bool)

(assert (=> b!1229437 m!1134013))

(declare-fun m!1134015 () Bool)

(assert (=> b!1229442 m!1134015))

(assert (=> b!1229445 m!1133993))

(declare-fun m!1134017 () Bool)

(assert (=> b!1229445 m!1134017))

(declare-fun m!1134019 () Bool)

(assert (=> b!1229445 m!1134019))

(declare-fun m!1134021 () Bool)

(assert (=> b!1229445 m!1134021))

(declare-fun m!1134023 () Bool)

(assert (=> b!1229447 m!1134023))

(declare-fun m!1134025 () Bool)

(assert (=> b!1229441 m!1134025))

(check-sat (not b!1229434) (not b!1229446) (not b!1229445) (not b!1229441) (not b!1229443) (not start!102146) (not b!1229439) (not b!1229442) (not b!1229444) (not b!1229435) (not b!1229437) (not b!1229436) (not b!1229447) (not b!1229438))
(check-sat)
