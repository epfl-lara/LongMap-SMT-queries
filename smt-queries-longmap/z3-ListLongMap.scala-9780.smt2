; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115876 () Bool)

(assert start!115876)

(declare-fun b!1369867 () Bool)

(declare-fun e!775932 () Bool)

(assert (=> b!1369867 (= e!775932 false)))

(declare-datatypes ((array!92949 0))(
  ( (array!92950 (arr!44896 (Array (_ BitVec 32) (_ BitVec 64))) (size!45448 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92949)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602174 () Bool)

(declare-datatypes ((List!32042 0))(
  ( (Nil!32039) (Cons!32038 (h!33247 (_ BitVec 64)) (t!46728 List!32042)) )
))
(declare-fun acc!866 () List!32042)

(declare-fun contains!9635 (List!32042 (_ BitVec 64)) Bool)

(assert (=> b!1369867 (= lt!602174 (contains!9635 acc!866 (select (arr!44896 a!3861) from!3239)))))

(declare-fun b!1369868 () Bool)

(declare-fun res!913377 () Bool)

(declare-fun e!775930 () Bool)

(assert (=> b!1369868 (=> (not res!913377) (not e!775930))))

(declare-fun newAcc!98 () List!32042)

(assert (=> b!1369868 (= res!913377 (not (contains!9635 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369869 () Bool)

(assert (=> b!1369869 (= e!775930 e!775932)))

(declare-fun res!913374 () Bool)

(assert (=> b!1369869 (=> (not res!913374) (not e!775932))))

(declare-fun arrayNoDuplicates!0 (array!92949 (_ BitVec 32) List!32042) Bool)

(assert (=> b!1369869 (= res!913374 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45120 0))(
  ( (Unit!45121) )
))
(declare-fun lt!602175 () Unit!45120)

(declare-fun noDuplicateSubseq!260 (List!32042 List!32042) Unit!45120)

(assert (=> b!1369869 (= lt!602175 (noDuplicateSubseq!260 newAcc!98 acc!866))))

(declare-fun b!1369870 () Bool)

(declare-fun res!913373 () Bool)

(assert (=> b!1369870 (=> (not res!913373) (not e!775930))))

(assert (=> b!1369870 (= res!913373 (not (contains!9635 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369872 () Bool)

(declare-fun res!913375 () Bool)

(assert (=> b!1369872 (=> (not res!913375) (not e!775930))))

(declare-fun noDuplicate!2550 (List!32042) Bool)

(assert (=> b!1369872 (= res!913375 (noDuplicate!2550 acc!866))))

(declare-fun b!1369873 () Bool)

(declare-fun res!913378 () Bool)

(assert (=> b!1369873 (=> (not res!913378) (not e!775930))))

(assert (=> b!1369873 (= res!913378 (not (contains!9635 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369874 () Bool)

(declare-fun res!913372 () Bool)

(assert (=> b!1369874 (=> (not res!913372) (not e!775930))))

(assert (=> b!1369874 (= res!913372 (not (contains!9635 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369875 () Bool)

(declare-fun res!913371 () Bool)

(assert (=> b!1369875 (=> (not res!913371) (not e!775930))))

(declare-fun subseq!1073 (List!32042 List!32042) Bool)

(assert (=> b!1369875 (= res!913371 (subseq!1073 newAcc!98 acc!866))))

(declare-fun b!1369876 () Bool)

(declare-fun res!913376 () Bool)

(assert (=> b!1369876 (=> (not res!913376) (not e!775932))))

(assert (=> b!1369876 (= res!913376 (bvslt from!3239 (size!45448 a!3861)))))

(declare-fun b!1369871 () Bool)

(declare-fun res!913370 () Bool)

(assert (=> b!1369871 (=> (not res!913370) (not e!775932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369871 (= res!913370 (validKeyInArray!0 (select (arr!44896 a!3861) from!3239)))))

(declare-fun res!913379 () Bool)

(assert (=> start!115876 (=> (not res!913379) (not e!775930))))

(assert (=> start!115876 (= res!913379 (and (bvslt (size!45448 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45448 a!3861))))))

(assert (=> start!115876 e!775930))

(declare-fun array_inv!34129 (array!92949) Bool)

(assert (=> start!115876 (array_inv!34129 a!3861)))

(assert (=> start!115876 true))

(assert (= (and start!115876 res!913379) b!1369872))

(assert (= (and b!1369872 res!913375) b!1369870))

(assert (= (and b!1369870 res!913373) b!1369874))

(assert (= (and b!1369874 res!913372) b!1369873))

(assert (= (and b!1369873 res!913378) b!1369868))

(assert (= (and b!1369868 res!913377) b!1369875))

(assert (= (and b!1369875 res!913371) b!1369869))

(assert (= (and b!1369869 res!913374) b!1369876))

(assert (= (and b!1369876 res!913376) b!1369871))

(assert (= (and b!1369871 res!913370) b!1369867))

(declare-fun m!1253091 () Bool)

(assert (=> b!1369868 m!1253091))

(declare-fun m!1253093 () Bool)

(assert (=> b!1369873 m!1253093))

(declare-fun m!1253095 () Bool)

(assert (=> b!1369867 m!1253095))

(assert (=> b!1369867 m!1253095))

(declare-fun m!1253097 () Bool)

(assert (=> b!1369867 m!1253097))

(declare-fun m!1253099 () Bool)

(assert (=> b!1369872 m!1253099))

(declare-fun m!1253101 () Bool)

(assert (=> b!1369869 m!1253101))

(declare-fun m!1253103 () Bool)

(assert (=> b!1369869 m!1253103))

(declare-fun m!1253105 () Bool)

(assert (=> b!1369875 m!1253105))

(assert (=> b!1369871 m!1253095))

(assert (=> b!1369871 m!1253095))

(declare-fun m!1253107 () Bool)

(assert (=> b!1369871 m!1253107))

(declare-fun m!1253109 () Bool)

(assert (=> b!1369874 m!1253109))

(declare-fun m!1253111 () Bool)

(assert (=> b!1369870 m!1253111))

(declare-fun m!1253113 () Bool)

(assert (=> start!115876 m!1253113))

(check-sat (not b!1369871) (not b!1369874) (not b!1369868) (not b!1369869) (not start!115876) (not b!1369872) (not b!1369875) (not b!1369867) (not b!1369873) (not b!1369870))
(check-sat)
