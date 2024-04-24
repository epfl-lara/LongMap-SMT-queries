; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115912 () Bool)

(assert start!115912)

(declare-fun b!1369182 () Bool)

(declare-fun res!911916 () Bool)

(declare-fun e!776025 () Bool)

(assert (=> b!1369182 (=> (not res!911916) (not e!776025))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92995 0))(
  ( (array!92996 (arr!44917 (Array (_ BitVec 32) (_ BitVec 64))) (size!45468 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92995)

(assert (=> b!1369182 (= res!911916 (bvslt from!3239 (size!45468 a!3861)))))

(declare-fun b!1369183 () Bool)

(declare-fun e!776024 () Bool)

(assert (=> b!1369183 (= e!776024 e!776025)))

(declare-fun res!911910 () Bool)

(assert (=> b!1369183 (=> (not res!911910) (not e!776025))))

(declare-datatypes ((List!31972 0))(
  ( (Nil!31969) (Cons!31968 (h!33186 (_ BitVec 64)) (t!46658 List!31972)) )
))
(declare-fun acc!866 () List!31972)

(declare-fun arrayNoDuplicates!0 (array!92995 (_ BitVec 32) List!31972) Bool)

(assert (=> b!1369183 (= res!911910 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45104 0))(
  ( (Unit!45105) )
))
(declare-fun lt!602442 () Unit!45104)

(declare-fun newAcc!98 () List!31972)

(declare-fun noDuplicateSubseq!203 (List!31972 List!31972) Unit!45104)

(assert (=> b!1369183 (= lt!602442 (noDuplicateSubseq!203 newAcc!98 acc!866))))

(declare-fun b!1369184 () Bool)

(declare-fun res!911913 () Bool)

(assert (=> b!1369184 (=> (not res!911913) (not e!776025))))

(assert (=> b!1369184 (= res!911913 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369185 () Bool)

(declare-fun res!911914 () Bool)

(assert (=> b!1369185 (=> (not res!911914) (not e!776024))))

(declare-fun contains!9657 (List!31972 (_ BitVec 64)) Bool)

(assert (=> b!1369185 (= res!911914 (not (contains!9657 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369186 () Bool)

(declare-fun res!911919 () Bool)

(assert (=> b!1369186 (=> (not res!911919) (not e!776024))))

(assert (=> b!1369186 (= res!911919 (not (contains!9657 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369187 () Bool)

(declare-fun res!911918 () Bool)

(assert (=> b!1369187 (=> (not res!911918) (not e!776025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369187 (= res!911918 (not (validKeyInArray!0 (select (arr!44917 a!3861) from!3239))))))

(declare-fun b!1369188 () Bool)

(assert (=> b!1369188 (= e!776025 false)))

(declare-fun lt!602441 () Bool)

(assert (=> b!1369188 (= lt!602441 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369189 () Bool)

(declare-fun res!911917 () Bool)

(assert (=> b!1369189 (=> (not res!911917) (not e!776024))))

(declare-fun noDuplicate!2488 (List!31972) Bool)

(assert (=> b!1369189 (= res!911917 (noDuplicate!2488 acc!866))))

(declare-fun b!1369191 () Bool)

(declare-fun res!911915 () Bool)

(assert (=> b!1369191 (=> (not res!911915) (not e!776024))))

(declare-fun subseq!1016 (List!31972 List!31972) Bool)

(assert (=> b!1369191 (= res!911915 (subseq!1016 newAcc!98 acc!866))))

(declare-fun b!1369192 () Bool)

(declare-fun res!911909 () Bool)

(assert (=> b!1369192 (=> (not res!911909) (not e!776024))))

(assert (=> b!1369192 (= res!911909 (not (contains!9657 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369190 () Bool)

(declare-fun res!911911 () Bool)

(assert (=> b!1369190 (=> (not res!911911) (not e!776024))))

(assert (=> b!1369190 (= res!911911 (not (contains!9657 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911912 () Bool)

(assert (=> start!115912 (=> (not res!911912) (not e!776024))))

(assert (=> start!115912 (= res!911912 (and (bvslt (size!45468 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45468 a!3861))))))

(assert (=> start!115912 e!776024))

(declare-fun array_inv!34198 (array!92995) Bool)

(assert (=> start!115912 (array_inv!34198 a!3861)))

(assert (=> start!115912 true))

(assert (= (and start!115912 res!911912) b!1369189))

(assert (= (and b!1369189 res!911917) b!1369186))

(assert (= (and b!1369186 res!911919) b!1369185))

(assert (= (and b!1369185 res!911914) b!1369192))

(assert (= (and b!1369192 res!911909) b!1369190))

(assert (= (and b!1369190 res!911911) b!1369191))

(assert (= (and b!1369191 res!911915) b!1369183))

(assert (= (and b!1369183 res!911910) b!1369182))

(assert (= (and b!1369182 res!911916) b!1369187))

(assert (= (and b!1369187 res!911918) b!1369184))

(assert (= (and b!1369184 res!911913) b!1369188))

(declare-fun m!1253599 () Bool)

(assert (=> b!1369190 m!1253599))

(declare-fun m!1253601 () Bool)

(assert (=> b!1369191 m!1253601))

(declare-fun m!1253603 () Bool)

(assert (=> b!1369186 m!1253603))

(declare-fun m!1253605 () Bool)

(assert (=> b!1369183 m!1253605))

(declare-fun m!1253607 () Bool)

(assert (=> b!1369183 m!1253607))

(declare-fun m!1253609 () Bool)

(assert (=> b!1369187 m!1253609))

(assert (=> b!1369187 m!1253609))

(declare-fun m!1253611 () Bool)

(assert (=> b!1369187 m!1253611))

(declare-fun m!1253613 () Bool)

(assert (=> b!1369192 m!1253613))

(declare-fun m!1253615 () Bool)

(assert (=> start!115912 m!1253615))

(declare-fun m!1253617 () Bool)

(assert (=> b!1369185 m!1253617))

(declare-fun m!1253619 () Bool)

(assert (=> b!1369189 m!1253619))

(declare-fun m!1253621 () Bool)

(assert (=> b!1369188 m!1253621))

(check-sat (not b!1369191) (not b!1369187) (not start!115912) (not b!1369189) (not b!1369190) (not b!1369192) (not b!1369188) (not b!1369185) (not b!1369183) (not b!1369186))
(check-sat)
