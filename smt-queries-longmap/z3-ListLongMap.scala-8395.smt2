; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102148 () Bool)

(assert start!102148)

(declare-fun b!1229450 () Bool)

(declare-fun res!817976 () Bool)

(declare-fun e!697804 () Bool)

(assert (=> b!1229450 (=> (not res!817976) (not e!697804))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229450 (= res!817976 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229451 () Bool)

(declare-fun res!817977 () Bool)

(declare-fun e!697805 () Bool)

(assert (=> b!1229451 (=> res!817977 e!697805)))

(declare-datatypes ((List!27117 0))(
  ( (Nil!27114) (Cons!27113 (h!28322 (_ BitVec 64)) (t!40571 List!27117)) )
))
(declare-fun lt!559023 () List!27117)

(declare-fun contains!7089 (List!27117 (_ BitVec 64)) Bool)

(assert (=> b!1229451 (= res!817977 (contains!7089 lt!559023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229452 () Bool)

(declare-fun res!817981 () Bool)

(assert (=> b!1229452 (=> (not res!817981) (not e!697804))))

(declare-fun acc!823 () List!27117)

(assert (=> b!1229452 (= res!817981 (not (contains!7089 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229453 () Bool)

(declare-fun res!817983 () Bool)

(assert (=> b!1229453 (=> (not res!817983) (not e!697804))))

(declare-datatypes ((array!79246 0))(
  ( (array!79247 (arr!38243 (Array (_ BitVec 32) (_ BitVec 64))) (size!38781 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79246)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229453 (= res!817983 (validKeyInArray!0 (select (arr!38243 a!3806) from!3184)))))

(declare-fun b!1229455 () Bool)

(declare-fun res!817982 () Bool)

(assert (=> b!1229455 (=> (not res!817982) (not e!697804))))

(declare-fun arrayNoDuplicates!0 (array!79246 (_ BitVec 32) List!27117) Bool)

(assert (=> b!1229455 (= res!817982 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229456 () Bool)

(declare-fun res!817985 () Bool)

(assert (=> b!1229456 (=> (not res!817985) (not e!697804))))

(declare-fun noDuplicate!1732 (List!27117) Bool)

(assert (=> b!1229456 (= res!817985 (noDuplicate!1732 acc!823))))

(declare-fun b!1229457 () Bool)

(assert (=> b!1229457 (= e!697804 (not e!697805))))

(declare-fun res!817978 () Bool)

(assert (=> b!1229457 (=> res!817978 e!697805)))

(assert (=> b!1229457 (= res!817978 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229457 (= lt!559023 (Cons!27113 (select (arr!38243 a!3806) from!3184) Nil!27114))))

(declare-fun e!697803 () Bool)

(assert (=> b!1229457 e!697803))

(declare-fun res!817979 () Bool)

(assert (=> b!1229457 (=> (not res!817979) (not e!697803))))

(assert (=> b!1229457 (= res!817979 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27114))))

(declare-datatypes ((Unit!40577 0))(
  ( (Unit!40578) )
))
(declare-fun lt!559025 () Unit!40577)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79246 List!27117 List!27117 (_ BitVec 32)) Unit!40577)

(assert (=> b!1229457 (= lt!559025 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27114 from!3184))))

(assert (=> b!1229457 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27113 (select (arr!38243 a!3806) from!3184) acc!823))))

(declare-fun b!1229458 () Bool)

(declare-fun res!817972 () Bool)

(assert (=> b!1229458 (=> (not res!817972) (not e!697804))))

(declare-fun arrayContainsKey!0 (array!79246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229458 (= res!817972 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229459 () Bool)

(declare-fun res!817974 () Bool)

(assert (=> b!1229459 (=> (not res!817974) (not e!697804))))

(assert (=> b!1229459 (= res!817974 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38781 a!3806)) (bvslt from!3184 (size!38781 a!3806))))))

(declare-fun b!1229460 () Bool)

(declare-fun res!817975 () Bool)

(assert (=> b!1229460 (=> (not res!817975) (not e!697804))))

(assert (=> b!1229460 (= res!817975 (not (contains!7089 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229461 () Bool)

(assert (=> b!1229461 (= e!697805 true)))

(declare-fun lt!559024 () Bool)

(assert (=> b!1229461 (= lt!559024 (contains!7089 lt!559023 (select (arr!38243 a!3806) from!3184)))))

(declare-fun b!1229454 () Bool)

(declare-fun res!817973 () Bool)

(assert (=> b!1229454 (=> res!817973 e!697805)))

(assert (=> b!1229454 (= res!817973 (contains!7089 lt!559023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!817984 () Bool)

(assert (=> start!102148 (=> (not res!817984) (not e!697804))))

(assert (=> start!102148 (= res!817984 (bvslt (size!38781 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102148 e!697804))

(declare-fun array_inv!29226 (array!79246) Bool)

(assert (=> start!102148 (array_inv!29226 a!3806)))

(assert (=> start!102148 true))

(declare-fun b!1229462 () Bool)

(assert (=> b!1229462 (= e!697803 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27113 (select (arr!38243 a!3806) from!3184) Nil!27114)))))

(declare-fun b!1229463 () Bool)

(declare-fun res!817980 () Bool)

(assert (=> b!1229463 (=> res!817980 e!697805)))

(assert (=> b!1229463 (= res!817980 (not (noDuplicate!1732 lt!559023)))))

(assert (= (and start!102148 res!817984) b!1229450))

(assert (= (and b!1229450 res!817976) b!1229459))

(assert (= (and b!1229459 res!817974) b!1229456))

(assert (= (and b!1229456 res!817985) b!1229452))

(assert (= (and b!1229452 res!817981) b!1229460))

(assert (= (and b!1229460 res!817975) b!1229458))

(assert (= (and b!1229458 res!817972) b!1229455))

(assert (= (and b!1229455 res!817982) b!1229453))

(assert (= (and b!1229453 res!817983) b!1229457))

(assert (= (and b!1229457 res!817979) b!1229462))

(assert (= (and b!1229457 (not res!817978)) b!1229463))

(assert (= (and b!1229463 (not res!817980)) b!1229451))

(assert (= (and b!1229451 (not res!817977)) b!1229454))

(assert (= (and b!1229454 (not res!817973)) b!1229461))

(declare-fun m!1133565 () Bool)

(assert (=> b!1229460 m!1133565))

(declare-fun m!1133567 () Bool)

(assert (=> b!1229452 m!1133567))

(declare-fun m!1133569 () Bool)

(assert (=> b!1229462 m!1133569))

(declare-fun m!1133571 () Bool)

(assert (=> b!1229462 m!1133571))

(declare-fun m!1133573 () Bool)

(assert (=> start!102148 m!1133573))

(assert (=> b!1229453 m!1133569))

(assert (=> b!1229453 m!1133569))

(declare-fun m!1133575 () Bool)

(assert (=> b!1229453 m!1133575))

(declare-fun m!1133577 () Bool)

(assert (=> b!1229451 m!1133577))

(declare-fun m!1133579 () Bool)

(assert (=> b!1229450 m!1133579))

(declare-fun m!1133581 () Bool)

(assert (=> b!1229455 m!1133581))

(assert (=> b!1229461 m!1133569))

(assert (=> b!1229461 m!1133569))

(declare-fun m!1133583 () Bool)

(assert (=> b!1229461 m!1133583))

(declare-fun m!1133585 () Bool)

(assert (=> b!1229456 m!1133585))

(declare-fun m!1133587 () Bool)

(assert (=> b!1229463 m!1133587))

(assert (=> b!1229457 m!1133569))

(declare-fun m!1133589 () Bool)

(assert (=> b!1229457 m!1133589))

(declare-fun m!1133591 () Bool)

(assert (=> b!1229457 m!1133591))

(declare-fun m!1133593 () Bool)

(assert (=> b!1229457 m!1133593))

(declare-fun m!1133595 () Bool)

(assert (=> b!1229458 m!1133595))

(declare-fun m!1133597 () Bool)

(assert (=> b!1229454 m!1133597))

(check-sat (not start!102148) (not b!1229451) (not b!1229458) (not b!1229457) (not b!1229453) (not b!1229456) (not b!1229455) (not b!1229462) (not b!1229463) (not b!1229460) (not b!1229461) (not b!1229452) (not b!1229454) (not b!1229450))
(check-sat)
