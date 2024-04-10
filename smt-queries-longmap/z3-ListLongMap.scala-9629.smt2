; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113914 () Bool)

(assert start!113914)

(declare-fun b!1350971 () Bool)

(declare-fun res!896438 () Bool)

(declare-fun e!768418 () Bool)

(assert (=> b!1350971 (=> (not res!896438) (not e!768418))))

(declare-datatypes ((array!92096 0))(
  ( (array!92097 (arr!44496 (Array (_ BitVec 32) (_ BitVec 64))) (size!45046 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92096)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350971 (= res!896438 (validKeyInArray!0 (select (arr!44496 a!3742) from!3120)))))

(declare-fun b!1350972 () Bool)

(declare-fun res!896442 () Bool)

(assert (=> b!1350972 (=> (not res!896442) (not e!768418))))

(declare-datatypes ((List!31537 0))(
  ( (Nil!31534) (Cons!31533 (h!32742 (_ BitVec 64)) (t!46195 List!31537)) )
))
(declare-fun arrayNoDuplicates!0 (array!92096 (_ BitVec 32) List!31537) Bool)

(assert (=> b!1350972 (= res!896442 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31534))))

(declare-fun b!1350974 () Bool)

(declare-fun res!896433 () Bool)

(declare-fun e!768417 () Bool)

(assert (=> b!1350974 (=> res!896433 e!768417)))

(declare-fun lt!597106 () List!31537)

(declare-fun contains!9246 (List!31537 (_ BitVec 64)) Bool)

(assert (=> b!1350974 (= res!896433 (contains!9246 lt!597106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350975 () Bool)

(declare-fun res!896434 () Bool)

(assert (=> b!1350975 (=> (not res!896434) (not e!768418))))

(assert (=> b!1350975 (= res!896434 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45046 a!3742)))))

(declare-fun b!1350976 () Bool)

(declare-fun res!896429 () Bool)

(assert (=> b!1350976 (=> (not res!896429) (not e!768418))))

(declare-fun acc!759 () List!31537)

(assert (=> b!1350976 (= res!896429 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350977 () Bool)

(declare-fun res!896436 () Bool)

(assert (=> b!1350977 (=> (not res!896436) (not e!768418))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1350977 (= res!896436 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350973 () Bool)

(declare-fun res!896437 () Bool)

(assert (=> b!1350973 (=> res!896437 e!768417)))

(declare-fun subseq!666 (List!31537 List!31537) Bool)

(assert (=> b!1350973 (= res!896437 (not (subseq!666 acc!759 lt!597106)))))

(declare-fun res!896431 () Bool)

(assert (=> start!113914 (=> (not res!896431) (not e!768418))))

(assert (=> start!113914 (= res!896431 (and (bvslt (size!45046 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45046 a!3742))))))

(assert (=> start!113914 e!768418))

(assert (=> start!113914 true))

(declare-fun array_inv!33524 (array!92096) Bool)

(assert (=> start!113914 (array_inv!33524 a!3742)))

(declare-fun b!1350978 () Bool)

(declare-fun res!896441 () Bool)

(assert (=> b!1350978 (=> res!896441 e!768417)))

(assert (=> b!1350978 (= res!896441 (contains!9246 lt!597106 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350979 () Bool)

(assert (=> b!1350979 (= e!768417 true)))

(declare-fun lt!597104 () Bool)

(assert (=> b!1350979 (= lt!597104 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597106))))

(declare-datatypes ((Unit!44246 0))(
  ( (Unit!44247) )
))
(declare-fun lt!597103 () Unit!44246)

(declare-fun noDuplicateSubseq!117 (List!31537 List!31537) Unit!44246)

(assert (=> b!1350979 (= lt!597103 (noDuplicateSubseq!117 acc!759 lt!597106))))

(declare-fun b!1350980 () Bool)

(declare-fun res!896440 () Bool)

(assert (=> b!1350980 (=> (not res!896440) (not e!768418))))

(declare-fun noDuplicate!2103 (List!31537) Bool)

(assert (=> b!1350980 (= res!896440 (noDuplicate!2103 acc!759))))

(declare-fun b!1350981 () Bool)

(declare-fun res!896443 () Bool)

(assert (=> b!1350981 (=> (not res!896443) (not e!768418))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350981 (= res!896443 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45046 a!3742))))))

(declare-fun b!1350982 () Bool)

(assert (=> b!1350982 (= e!768418 (not e!768417))))

(declare-fun res!896430 () Bool)

(assert (=> b!1350982 (=> res!896430 e!768417)))

(assert (=> b!1350982 (= res!896430 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!681 (List!31537 (_ BitVec 64)) List!31537)

(assert (=> b!1350982 (= lt!597106 ($colon$colon!681 acc!759 (select (arr!44496 a!3742) from!3120)))))

(assert (=> b!1350982 (subseq!666 acc!759 acc!759)))

(declare-fun lt!597105 () Unit!44246)

(declare-fun lemmaListSubSeqRefl!0 (List!31537) Unit!44246)

(assert (=> b!1350982 (= lt!597105 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350983 () Bool)

(declare-fun res!896432 () Bool)

(assert (=> b!1350983 (=> (not res!896432) (not e!768418))))

(assert (=> b!1350983 (= res!896432 (not (contains!9246 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350984 () Bool)

(declare-fun res!896439 () Bool)

(assert (=> b!1350984 (=> (not res!896439) (not e!768418))))

(assert (=> b!1350984 (= res!896439 (not (contains!9246 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350985 () Bool)

(declare-fun res!896435 () Bool)

(assert (=> b!1350985 (=> res!896435 e!768417)))

(assert (=> b!1350985 (= res!896435 (not (noDuplicate!2103 lt!597106)))))

(assert (= (and start!113914 res!896431) b!1350980))

(assert (= (and b!1350980 res!896440) b!1350983))

(assert (= (and b!1350983 res!896432) b!1350984))

(assert (= (and b!1350984 res!896439) b!1350972))

(assert (= (and b!1350972 res!896442) b!1350976))

(assert (= (and b!1350976 res!896429) b!1350981))

(assert (= (and b!1350981 res!896443) b!1350977))

(assert (= (and b!1350977 res!896436) b!1350975))

(assert (= (and b!1350975 res!896434) b!1350971))

(assert (= (and b!1350971 res!896438) b!1350982))

(assert (= (and b!1350982 (not res!896430)) b!1350985))

(assert (= (and b!1350985 (not res!896435)) b!1350974))

(assert (= (and b!1350974 (not res!896433)) b!1350978))

(assert (= (and b!1350978 (not res!896441)) b!1350973))

(assert (= (and b!1350973 (not res!896437)) b!1350979))

(declare-fun m!1238089 () Bool)

(assert (=> b!1350973 m!1238089))

(declare-fun m!1238091 () Bool)

(assert (=> b!1350980 m!1238091))

(declare-fun m!1238093 () Bool)

(assert (=> b!1350984 m!1238093))

(declare-fun m!1238095 () Bool)

(assert (=> b!1350972 m!1238095))

(declare-fun m!1238097 () Bool)

(assert (=> b!1350978 m!1238097))

(declare-fun m!1238099 () Bool)

(assert (=> b!1350971 m!1238099))

(assert (=> b!1350971 m!1238099))

(declare-fun m!1238101 () Bool)

(assert (=> b!1350971 m!1238101))

(declare-fun m!1238103 () Bool)

(assert (=> b!1350985 m!1238103))

(declare-fun m!1238105 () Bool)

(assert (=> b!1350983 m!1238105))

(declare-fun m!1238107 () Bool)

(assert (=> b!1350979 m!1238107))

(declare-fun m!1238109 () Bool)

(assert (=> b!1350979 m!1238109))

(assert (=> b!1350982 m!1238099))

(assert (=> b!1350982 m!1238099))

(declare-fun m!1238111 () Bool)

(assert (=> b!1350982 m!1238111))

(declare-fun m!1238113 () Bool)

(assert (=> b!1350982 m!1238113))

(declare-fun m!1238115 () Bool)

(assert (=> b!1350982 m!1238115))

(declare-fun m!1238117 () Bool)

(assert (=> start!113914 m!1238117))

(declare-fun m!1238119 () Bool)

(assert (=> b!1350977 m!1238119))

(declare-fun m!1238121 () Bool)

(assert (=> b!1350976 m!1238121))

(declare-fun m!1238123 () Bool)

(assert (=> b!1350974 m!1238123))

(check-sat (not b!1350971) (not start!113914) (not b!1350974) (not b!1350985) (not b!1350980) (not b!1350973) (not b!1350978) (not b!1350983) (not b!1350977) (not b!1350972) (not b!1350984) (not b!1350976) (not b!1350979) (not b!1350982))
