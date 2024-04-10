; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115696 () Bool)

(assert start!115696)

(declare-fun b!1368015 () Bool)

(declare-fun res!911531 () Bool)

(declare-fun e!775218 () Bool)

(assert (=> b!1368015 (=> (not res!911531) (not e!775218))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1368015 (= res!911531 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368016 () Bool)

(declare-fun res!911533 () Bool)

(declare-fun e!775217 () Bool)

(assert (=> b!1368016 (=> (not res!911533) (not e!775217))))

(declare-datatypes ((List!31936 0))(
  ( (Nil!31933) (Cons!31932 (h!33141 (_ BitVec 64)) (t!46630 List!31936)) )
))
(declare-fun acc!866 () List!31936)

(declare-fun contains!9618 (List!31936 (_ BitVec 64)) Bool)

(assert (=> b!1368016 (= res!911533 (not (contains!9618 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368017 () Bool)

(declare-fun res!911532 () Bool)

(assert (=> b!1368017 (=> (not res!911532) (not e!775217))))

(declare-fun newAcc!98 () List!31936)

(assert (=> b!1368017 (= res!911532 (not (contains!9618 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368018 () Bool)

(assert (=> b!1368018 (= e!775218 false)))

(declare-datatypes ((array!92888 0))(
  ( (array!92889 (arr!44868 (Array (_ BitVec 32) (_ BitVec 64))) (size!45418 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92888)

(declare-fun lt!601989 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92888 (_ BitVec 32) List!31936) Bool)

(assert (=> b!1368018 (= lt!601989 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun res!911530 () Bool)

(assert (=> start!115696 (=> (not res!911530) (not e!775217))))

(assert (=> start!115696 (= res!911530 (and (bvslt (size!45418 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45418 a!3861))))))

(assert (=> start!115696 e!775217))

(declare-fun array_inv!33896 (array!92888) Bool)

(assert (=> start!115696 (array_inv!33896 a!3861)))

(assert (=> start!115696 true))

(declare-fun b!1368019 () Bool)

(declare-fun res!911525 () Bool)

(assert (=> b!1368019 (=> (not res!911525) (not e!775217))))

(declare-fun noDuplicate!2475 (List!31936) Bool)

(assert (=> b!1368019 (= res!911525 (noDuplicate!2475 acc!866))))

(declare-fun b!1368020 () Bool)

(declare-fun res!911526 () Bool)

(assert (=> b!1368020 (=> (not res!911526) (not e!775218))))

(assert (=> b!1368020 (= res!911526 (bvslt from!3239 (size!45418 a!3861)))))

(declare-fun b!1368021 () Bool)

(declare-fun res!911529 () Bool)

(assert (=> b!1368021 (=> (not res!911529) (not e!775217))))

(assert (=> b!1368021 (= res!911529 (not (contains!9618 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368022 () Bool)

(declare-fun res!911528 () Bool)

(assert (=> b!1368022 (=> (not res!911528) (not e!775217))))

(declare-fun subseq!1020 (List!31936 List!31936) Bool)

(assert (=> b!1368022 (= res!911528 (subseq!1020 newAcc!98 acc!866))))

(declare-fun b!1368023 () Bool)

(declare-fun res!911524 () Bool)

(assert (=> b!1368023 (=> (not res!911524) (not e!775218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368023 (= res!911524 (not (validKeyInArray!0 (select (arr!44868 a!3861) from!3239))))))

(declare-fun b!1368024 () Bool)

(assert (=> b!1368024 (= e!775217 e!775218)))

(declare-fun res!911527 () Bool)

(assert (=> b!1368024 (=> (not res!911527) (not e!775218))))

(assert (=> b!1368024 (= res!911527 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45173 0))(
  ( (Unit!45174) )
))
(declare-fun lt!601990 () Unit!45173)

(declare-fun noDuplicateSubseq!207 (List!31936 List!31936) Unit!45173)

(assert (=> b!1368024 (= lt!601990 (noDuplicateSubseq!207 newAcc!98 acc!866))))

(declare-fun b!1368025 () Bool)

(declare-fun res!911523 () Bool)

(assert (=> b!1368025 (=> (not res!911523) (not e!775217))))

(assert (=> b!1368025 (= res!911523 (not (contains!9618 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115696 res!911530) b!1368019))

(assert (= (and b!1368019 res!911525) b!1368021))

(assert (= (and b!1368021 res!911529) b!1368016))

(assert (= (and b!1368016 res!911533) b!1368017))

(assert (= (and b!1368017 res!911532) b!1368025))

(assert (= (and b!1368025 res!911523) b!1368022))

(assert (= (and b!1368022 res!911528) b!1368024))

(assert (= (and b!1368024 res!911527) b!1368020))

(assert (= (and b!1368020 res!911526) b!1368023))

(assert (= (and b!1368023 res!911524) b!1368015))

(assert (= (and b!1368015 res!911531) b!1368018))

(declare-fun m!1252099 () Bool)

(assert (=> b!1368019 m!1252099))

(declare-fun m!1252101 () Bool)

(assert (=> b!1368024 m!1252101))

(declare-fun m!1252103 () Bool)

(assert (=> b!1368024 m!1252103))

(declare-fun m!1252105 () Bool)

(assert (=> b!1368018 m!1252105))

(declare-fun m!1252107 () Bool)

(assert (=> b!1368017 m!1252107))

(declare-fun m!1252109 () Bool)

(assert (=> b!1368025 m!1252109))

(declare-fun m!1252111 () Bool)

(assert (=> b!1368023 m!1252111))

(assert (=> b!1368023 m!1252111))

(declare-fun m!1252113 () Bool)

(assert (=> b!1368023 m!1252113))

(declare-fun m!1252115 () Bool)

(assert (=> start!115696 m!1252115))

(declare-fun m!1252117 () Bool)

(assert (=> b!1368021 m!1252117))

(declare-fun m!1252119 () Bool)

(assert (=> b!1368016 m!1252119))

(declare-fun m!1252121 () Bool)

(assert (=> b!1368022 m!1252121))

(check-sat (not start!115696) (not b!1368016) (not b!1368021) (not b!1368019) (not b!1368025) (not b!1368017) (not b!1368023) (not b!1368024) (not b!1368018) (not b!1368022))
(check-sat)
