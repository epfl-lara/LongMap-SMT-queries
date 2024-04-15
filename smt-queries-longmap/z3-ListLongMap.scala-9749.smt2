; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115468 () Bool)

(assert start!115468)

(declare-fun b!1366007 () Bool)

(declare-fun res!909641 () Bool)

(declare-fun e!774319 () Bool)

(assert (=> b!1366007 (=> (not res!909641) (not e!774319))))

(declare-datatypes ((List!31949 0))(
  ( (Nil!31946) (Cons!31945 (h!33154 (_ BitVec 64)) (t!46635 List!31949)) )
))
(declare-fun lt!601280 () List!31949)

(declare-fun noDuplicate!2457 (List!31949) Bool)

(assert (=> b!1366007 (= res!909641 (noDuplicate!2457 lt!601280))))

(declare-fun b!1366008 () Bool)

(declare-fun res!909628 () Bool)

(declare-fun e!774320 () Bool)

(assert (=> b!1366008 (=> (not res!909628) (not e!774320))))

(declare-fun acc!866 () List!31949)

(declare-fun contains!9542 (List!31949 (_ BitVec 64)) Bool)

(assert (=> b!1366008 (= res!909628 (not (contains!9542 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366009 () Bool)

(declare-fun res!909633 () Bool)

(declare-fun e!774321 () Bool)

(assert (=> b!1366009 (=> (not res!909633) (not e!774321))))

(declare-datatypes ((array!92748 0))(
  ( (array!92749 (arr!44803 (Array (_ BitVec 32) (_ BitVec 64))) (size!45355 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92748)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1366009 (= res!909633 (not (contains!9542 acc!866 (select (arr!44803 a!3861) from!3239))))))

(declare-fun b!1366010 () Bool)

(declare-fun res!909626 () Bool)

(assert (=> b!1366010 (=> (not res!909626) (not e!774319))))

(declare-fun lt!601279 () List!31949)

(assert (=> b!1366010 (= res!909626 (not (contains!9542 lt!601279 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366011 () Bool)

(declare-fun res!909638 () Bool)

(assert (=> b!1366011 (=> (not res!909638) (not e!774320))))

(assert (=> b!1366011 (= res!909638 (noDuplicate!2457 acc!866))))

(declare-fun b!1366012 () Bool)

(declare-fun res!909632 () Bool)

(assert (=> b!1366012 (=> (not res!909632) (not e!774319))))

(declare-fun subseq!980 (List!31949 List!31949) Bool)

(assert (=> b!1366012 (= res!909632 (subseq!980 lt!601279 lt!601280))))

(declare-fun b!1366013 () Bool)

(declare-fun res!909635 () Bool)

(assert (=> b!1366013 (=> (not res!909635) (not e!774319))))

(assert (=> b!1366013 (= res!909635 (not (contains!9542 lt!601279 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366014 () Bool)

(declare-fun res!909627 () Bool)

(assert (=> b!1366014 (=> (not res!909627) (not e!774320))))

(declare-fun newAcc!98 () List!31949)

(assert (=> b!1366014 (= res!909627 (not (contains!9542 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366015 () Bool)

(declare-fun res!909625 () Bool)

(assert (=> b!1366015 (=> (not res!909625) (not e!774320))))

(assert (=> b!1366015 (= res!909625 (subseq!980 newAcc!98 acc!866))))

(declare-fun res!909631 () Bool)

(assert (=> start!115468 (=> (not res!909631) (not e!774320))))

(assert (=> start!115468 (= res!909631 (and (bvslt (size!45355 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45355 a!3861))))))

(assert (=> start!115468 e!774320))

(declare-fun array_inv!34036 (array!92748) Bool)

(assert (=> start!115468 (array_inv!34036 a!3861)))

(assert (=> start!115468 true))

(declare-fun b!1366016 () Bool)

(assert (=> b!1366016 (= e!774320 e!774321)))

(declare-fun res!909629 () Bool)

(assert (=> b!1366016 (=> (not res!909629) (not e!774321))))

(declare-fun arrayNoDuplicates!0 (array!92748 (_ BitVec 32) List!31949) Bool)

(assert (=> b!1366016 (= res!909629 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44934 0))(
  ( (Unit!44935) )
))
(declare-fun lt!601277 () Unit!44934)

(declare-fun noDuplicateSubseq!167 (List!31949 List!31949) Unit!44934)

(assert (=> b!1366016 (= lt!601277 (noDuplicateSubseq!167 newAcc!98 acc!866))))

(declare-fun b!1366017 () Bool)

(declare-fun res!909640 () Bool)

(assert (=> b!1366017 (=> (not res!909640) (not e!774320))))

(assert (=> b!1366017 (= res!909640 (not (contains!9542 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366018 () Bool)

(assert (=> b!1366018 (= e!774321 e!774319)))

(declare-fun res!909639 () Bool)

(assert (=> b!1366018 (=> (not res!909639) (not e!774319))))

(assert (=> b!1366018 (= res!909639 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366018 (= lt!601279 (Cons!31945 (select (arr!44803 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366018 (= lt!601280 (Cons!31945 (select (arr!44803 a!3861) from!3239) acc!866))))

(declare-fun b!1366019 () Bool)

(declare-fun res!909634 () Bool)

(assert (=> b!1366019 (=> (not res!909634) (not e!774321))))

(assert (=> b!1366019 (= res!909634 (bvslt from!3239 (size!45355 a!3861)))))

(declare-fun b!1366020 () Bool)

(assert (=> b!1366020 (= e!774319 false)))

(declare-fun lt!601278 () Bool)

(assert (=> b!1366020 (= lt!601278 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601280))))

(declare-fun lt!601281 () Unit!44934)

(assert (=> b!1366020 (= lt!601281 (noDuplicateSubseq!167 lt!601279 lt!601280))))

(declare-fun b!1366021 () Bool)

(declare-fun res!909637 () Bool)

(assert (=> b!1366021 (=> (not res!909637) (not e!774319))))

(assert (=> b!1366021 (= res!909637 (not (contains!9542 lt!601280 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366022 () Bool)

(declare-fun res!909624 () Bool)

(assert (=> b!1366022 (=> (not res!909624) (not e!774319))))

(assert (=> b!1366022 (= res!909624 (not (contains!9542 lt!601280 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366023 () Bool)

(declare-fun res!909630 () Bool)

(assert (=> b!1366023 (=> (not res!909630) (not e!774320))))

(assert (=> b!1366023 (= res!909630 (not (contains!9542 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366024 () Bool)

(declare-fun res!909636 () Bool)

(assert (=> b!1366024 (=> (not res!909636) (not e!774321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366024 (= res!909636 (validKeyInArray!0 (select (arr!44803 a!3861) from!3239)))))

(assert (= (and start!115468 res!909631) b!1366011))

(assert (= (and b!1366011 res!909638) b!1366023))

(assert (= (and b!1366023 res!909630) b!1366008))

(assert (= (and b!1366008 res!909628) b!1366017))

(assert (= (and b!1366017 res!909640) b!1366014))

(assert (= (and b!1366014 res!909627) b!1366015))

(assert (= (and b!1366015 res!909625) b!1366016))

(assert (= (and b!1366016 res!909629) b!1366019))

(assert (= (and b!1366019 res!909634) b!1366024))

(assert (= (and b!1366024 res!909636) b!1366009))

(assert (= (and b!1366009 res!909633) b!1366018))

(assert (= (and b!1366018 res!909639) b!1366007))

(assert (= (and b!1366007 res!909641) b!1366021))

(assert (= (and b!1366021 res!909637) b!1366022))

(assert (= (and b!1366022 res!909624) b!1366013))

(assert (= (and b!1366013 res!909635) b!1366010))

(assert (= (and b!1366010 res!909626) b!1366012))

(assert (= (and b!1366012 res!909632) b!1366020))

(declare-fun m!1249935 () Bool)

(assert (=> b!1366021 m!1249935))

(declare-fun m!1249937 () Bool)

(assert (=> b!1366009 m!1249937))

(assert (=> b!1366009 m!1249937))

(declare-fun m!1249939 () Bool)

(assert (=> b!1366009 m!1249939))

(declare-fun m!1249941 () Bool)

(assert (=> b!1366010 m!1249941))

(assert (=> b!1366018 m!1249937))

(assert (=> b!1366024 m!1249937))

(assert (=> b!1366024 m!1249937))

(declare-fun m!1249943 () Bool)

(assert (=> b!1366024 m!1249943))

(declare-fun m!1249945 () Bool)

(assert (=> b!1366016 m!1249945))

(declare-fun m!1249947 () Bool)

(assert (=> b!1366016 m!1249947))

(declare-fun m!1249949 () Bool)

(assert (=> start!115468 m!1249949))

(declare-fun m!1249951 () Bool)

(assert (=> b!1366015 m!1249951))

(declare-fun m!1249953 () Bool)

(assert (=> b!1366023 m!1249953))

(declare-fun m!1249955 () Bool)

(assert (=> b!1366007 m!1249955))

(declare-fun m!1249957 () Bool)

(assert (=> b!1366008 m!1249957))

(declare-fun m!1249959 () Bool)

(assert (=> b!1366017 m!1249959))

(declare-fun m!1249961 () Bool)

(assert (=> b!1366020 m!1249961))

(declare-fun m!1249963 () Bool)

(assert (=> b!1366020 m!1249963))

(declare-fun m!1249965 () Bool)

(assert (=> b!1366022 m!1249965))

(declare-fun m!1249967 () Bool)

(assert (=> b!1366011 m!1249967))

(declare-fun m!1249969 () Bool)

(assert (=> b!1366012 m!1249969))

(declare-fun m!1249971 () Bool)

(assert (=> b!1366014 m!1249971))

(declare-fun m!1249973 () Bool)

(assert (=> b!1366013 m!1249973))

(check-sat (not b!1366011) (not b!1366022) (not b!1366010) (not b!1366012) (not b!1366021) (not b!1366015) (not b!1366008) (not b!1366013) (not b!1366007) (not b!1366024) (not start!115468) (not b!1366009) (not b!1366014) (not b!1366016) (not b!1366017) (not b!1366023) (not b!1366020))
(check-sat)
