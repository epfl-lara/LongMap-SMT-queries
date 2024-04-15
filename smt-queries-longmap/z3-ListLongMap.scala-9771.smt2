; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115786 () Bool)

(assert start!115786)

(declare-fun b!1369010 () Bool)

(declare-fun res!912536 () Bool)

(declare-fun e!775582 () Bool)

(assert (=> b!1369010 (=> (not res!912536) (not e!775582))))

(declare-datatypes ((array!92892 0))(
  ( (array!92893 (arr!44869 (Array (_ BitVec 32) (_ BitVec 64))) (size!45421 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92892)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32015 0))(
  ( (Nil!32012) (Cons!32011 (h!33220 (_ BitVec 64)) (t!46701 List!32015)) )
))
(declare-fun acc!866 () List!32015)

(declare-fun arrayNoDuplicates!0 (array!92892 (_ BitVec 32) List!32015) Bool)

(assert (=> b!1369010 (= res!912536 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369011 () Bool)

(declare-fun res!912533 () Bool)

(assert (=> b!1369011 (=> (not res!912533) (not e!775582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369011 (= res!912533 (not (validKeyInArray!0 (select (arr!44869 a!3861) from!3239))))))

(declare-fun b!1369012 () Bool)

(declare-fun res!912534 () Bool)

(declare-fun e!775584 () Bool)

(assert (=> b!1369012 (=> (not res!912534) (not e!775584))))

(declare-fun contains!9608 (List!32015 (_ BitVec 64)) Bool)

(assert (=> b!1369012 (= res!912534 (not (contains!9608 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369013 () Bool)

(declare-fun res!912540 () Bool)

(assert (=> b!1369013 (=> (not res!912540) (not e!775584))))

(assert (=> b!1369013 (= res!912540 (not (contains!9608 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369014 () Bool)

(declare-fun res!912542 () Bool)

(assert (=> b!1369014 (=> (not res!912542) (not e!775584))))

(declare-fun newAcc!98 () List!32015)

(declare-fun subseq!1046 (List!32015 List!32015) Bool)

(assert (=> b!1369014 (= res!912542 (subseq!1046 newAcc!98 acc!866))))

(declare-fun b!1369015 () Bool)

(assert (=> b!1369015 (= e!775584 e!775582)))

(declare-fun res!912532 () Bool)

(assert (=> b!1369015 (=> (not res!912532) (not e!775582))))

(assert (=> b!1369015 (= res!912532 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45066 0))(
  ( (Unit!45067) )
))
(declare-fun lt!601998 () Unit!45066)

(declare-fun noDuplicateSubseq!233 (List!32015 List!32015) Unit!45066)

(assert (=> b!1369015 (= lt!601998 (noDuplicateSubseq!233 newAcc!98 acc!866))))

(declare-fun res!912541 () Bool)

(assert (=> start!115786 (=> (not res!912541) (not e!775584))))

(assert (=> start!115786 (= res!912541 (and (bvslt (size!45421 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45421 a!3861))))))

(assert (=> start!115786 e!775584))

(declare-fun array_inv!34102 (array!92892) Bool)

(assert (=> start!115786 (array_inv!34102 a!3861)))

(assert (=> start!115786 true))

(declare-fun b!1369016 () Bool)

(assert (=> b!1369016 (= e!775582 (not true))))

(declare-fun lt!601997 () Bool)

(declare-fun noDuplicate!2523 (List!32015) Bool)

(assert (=> b!1369016 (= lt!601997 (noDuplicate!2523 newAcc!98))))

(assert (=> b!1369016 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!601996 () Unit!45066)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92892 List!32015 List!32015 (_ BitVec 32)) Unit!45066)

(assert (=> b!1369016 (= lt!601996 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1369017 () Bool)

(declare-fun res!912539 () Bool)

(assert (=> b!1369017 (=> (not res!912539) (not e!775582))))

(assert (=> b!1369017 (= res!912539 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369018 () Bool)

(declare-fun res!912531 () Bool)

(assert (=> b!1369018 (=> (not res!912531) (not e!775584))))

(assert (=> b!1369018 (= res!912531 (not (contains!9608 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369019 () Bool)

(declare-fun res!912535 () Bool)

(assert (=> b!1369019 (=> (not res!912535) (not e!775582))))

(assert (=> b!1369019 (= res!912535 (bvslt from!3239 (size!45421 a!3861)))))

(declare-fun b!1369020 () Bool)

(declare-fun res!912537 () Bool)

(assert (=> b!1369020 (=> (not res!912537) (not e!775584))))

(assert (=> b!1369020 (= res!912537 (noDuplicate!2523 acc!866))))

(declare-fun b!1369021 () Bool)

(declare-fun res!912538 () Bool)

(assert (=> b!1369021 (=> (not res!912538) (not e!775584))))

(assert (=> b!1369021 (= res!912538 (not (contains!9608 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115786 res!912541) b!1369020))

(assert (= (and b!1369020 res!912537) b!1369013))

(assert (= (and b!1369013 res!912540) b!1369012))

(assert (= (and b!1369012 res!912534) b!1369018))

(assert (= (and b!1369018 res!912531) b!1369021))

(assert (= (and b!1369021 res!912538) b!1369014))

(assert (= (and b!1369014 res!912542) b!1369015))

(assert (= (and b!1369015 res!912532) b!1369019))

(assert (= (and b!1369019 res!912535) b!1369011))

(assert (= (and b!1369011 res!912533) b!1369017))

(assert (= (and b!1369017 res!912539) b!1369010))

(assert (= (and b!1369010 res!912536) b!1369016))

(declare-fun m!1252395 () Bool)

(assert (=> b!1369013 m!1252395))

(declare-fun m!1252397 () Bool)

(assert (=> b!1369014 m!1252397))

(declare-fun m!1252399 () Bool)

(assert (=> b!1369012 m!1252399))

(declare-fun m!1252401 () Bool)

(assert (=> b!1369011 m!1252401))

(assert (=> b!1369011 m!1252401))

(declare-fun m!1252403 () Bool)

(assert (=> b!1369011 m!1252403))

(declare-fun m!1252405 () Bool)

(assert (=> b!1369015 m!1252405))

(declare-fun m!1252407 () Bool)

(assert (=> b!1369015 m!1252407))

(declare-fun m!1252409 () Bool)

(assert (=> b!1369018 m!1252409))

(declare-fun m!1252411 () Bool)

(assert (=> b!1369016 m!1252411))

(declare-fun m!1252413 () Bool)

(assert (=> b!1369016 m!1252413))

(declare-fun m!1252415 () Bool)

(assert (=> b!1369016 m!1252415))

(declare-fun m!1252417 () Bool)

(assert (=> start!115786 m!1252417))

(declare-fun m!1252419 () Bool)

(assert (=> b!1369020 m!1252419))

(declare-fun m!1252421 () Bool)

(assert (=> b!1369010 m!1252421))

(declare-fun m!1252423 () Bool)

(assert (=> b!1369021 m!1252423))

(check-sat (not b!1369021) (not b!1369018) (not start!115786) (not b!1369014) (not b!1369011) (not b!1369020) (not b!1369010) (not b!1369012) (not b!1369015) (not b!1369016) (not b!1369013))
(check-sat)
