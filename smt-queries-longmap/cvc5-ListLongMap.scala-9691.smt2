; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114710 () Bool)

(assert start!114710)

(declare-fun b!1360017 () Bool)

(declare-fun res!903839 () Bool)

(declare-fun e!771938 () Bool)

(assert (=> b!1360017 (=> (not res!903839) (not e!771938))))

(declare-datatypes ((List!31764 0))(
  ( (Nil!31761) (Cons!31760 (h!32978 (_ BitVec 64)) (t!46426 List!31764)) )
))
(declare-fun acc!759 () List!31764)

(declare-fun contains!9476 (List!31764 (_ BitVec 64)) Bool)

(assert (=> b!1360017 (= res!903839 (not (contains!9476 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360018 () Bool)

(declare-fun res!903841 () Bool)

(assert (=> b!1360018 (=> (not res!903841) (not e!771938))))

(assert (=> b!1360018 (= res!903841 (not (contains!9476 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!903842 () Bool)

(assert (=> start!114710 (=> (not res!903842) (not e!771938))))

(declare-datatypes ((array!92597 0))(
  ( (array!92598 (arr!44736 (Array (_ BitVec 32) (_ BitVec 64))) (size!45287 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92597)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114710 (= res!903842 (and (bvslt (size!45287 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45287 a!3742))))))

(assert (=> start!114710 e!771938))

(assert (=> start!114710 true))

(declare-fun array_inv!34017 (array!92597) Bool)

(assert (=> start!114710 (array_inv!34017 a!3742)))

(declare-fun b!1360019 () Bool)

(declare-datatypes ((Unit!44648 0))(
  ( (Unit!44649) )
))
(declare-fun e!771940 () Unit!44648)

(declare-fun lt!599890 () Unit!44648)

(assert (=> b!1360019 (= e!771940 lt!599890)))

(declare-fun lt!599892 () Unit!44648)

(declare-fun lemmaListSubSeqRefl!0 (List!31764) Unit!44648)

(assert (=> b!1360019 (= lt!599892 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!835 (List!31764 List!31764) Bool)

(assert (=> b!1360019 (subseq!835 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92597 List!31764 List!31764 (_ BitVec 32)) Unit!44648)

(declare-fun $colon$colon!837 (List!31764 (_ BitVec 64)) List!31764)

(assert (=> b!1360019 (= lt!599890 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!837 acc!759 (select (arr!44736 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92597 (_ BitVec 32) List!31764) Bool)

(assert (=> b!1360019 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360020 () Bool)

(declare-fun res!903845 () Bool)

(assert (=> b!1360020 (=> (not res!903845) (not e!771938))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360020 (= res!903845 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360021 () Bool)

(declare-fun res!903844 () Bool)

(assert (=> b!1360021 (=> (not res!903844) (not e!771938))))

(assert (=> b!1360021 (= res!903844 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31761))))

(declare-fun b!1360022 () Bool)

(declare-fun res!903846 () Bool)

(assert (=> b!1360022 (=> (not res!903846) (not e!771938))))

(declare-fun noDuplicate!2307 (List!31764) Bool)

(assert (=> b!1360022 (= res!903846 (noDuplicate!2307 acc!759))))

(declare-fun b!1360023 () Bool)

(declare-fun res!903843 () Bool)

(assert (=> b!1360023 (=> (not res!903843) (not e!771938))))

(assert (=> b!1360023 (= res!903843 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45287 a!3742)))))

(declare-fun b!1360024 () Bool)

(assert (=> b!1360024 (= e!771938 false)))

(declare-fun lt!599891 () Unit!44648)

(assert (=> b!1360024 (= lt!599891 e!771940)))

(declare-fun c!127537 () Bool)

(assert (=> b!1360024 (= c!127537 (validKeyInArray!0 (select (arr!44736 a!3742) from!3120)))))

(declare-fun b!1360025 () Bool)

(declare-fun Unit!44650 () Unit!44648)

(assert (=> b!1360025 (= e!771940 Unit!44650)))

(declare-fun b!1360026 () Bool)

(declare-fun res!903840 () Bool)

(assert (=> b!1360026 (=> (not res!903840) (not e!771938))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360026 (= res!903840 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45287 a!3742))))))

(declare-fun b!1360027 () Bool)

(declare-fun res!903838 () Bool)

(assert (=> b!1360027 (=> (not res!903838) (not e!771938))))

(assert (=> b!1360027 (= res!903838 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114710 res!903842) b!1360022))

(assert (= (and b!1360022 res!903846) b!1360017))

(assert (= (and b!1360017 res!903839) b!1360018))

(assert (= (and b!1360018 res!903841) b!1360021))

(assert (= (and b!1360021 res!903844) b!1360027))

(assert (= (and b!1360027 res!903838) b!1360026))

(assert (= (and b!1360026 res!903840) b!1360020))

(assert (= (and b!1360020 res!903845) b!1360023))

(assert (= (and b!1360023 res!903843) b!1360024))

(assert (= (and b!1360024 c!127537) b!1360019))

(assert (= (and b!1360024 (not c!127537)) b!1360025))

(declare-fun m!1245855 () Bool)

(assert (=> b!1360017 m!1245855))

(declare-fun m!1245857 () Bool)

(assert (=> b!1360021 m!1245857))

(declare-fun m!1245859 () Bool)

(assert (=> b!1360018 m!1245859))

(declare-fun m!1245861 () Bool)

(assert (=> b!1360027 m!1245861))

(declare-fun m!1245863 () Bool)

(assert (=> start!114710 m!1245863))

(declare-fun m!1245865 () Bool)

(assert (=> b!1360019 m!1245865))

(declare-fun m!1245867 () Bool)

(assert (=> b!1360019 m!1245867))

(declare-fun m!1245869 () Bool)

(assert (=> b!1360019 m!1245869))

(declare-fun m!1245871 () Bool)

(assert (=> b!1360019 m!1245871))

(declare-fun m!1245873 () Bool)

(assert (=> b!1360019 m!1245873))

(assert (=> b!1360019 m!1245867))

(assert (=> b!1360019 m!1245869))

(declare-fun m!1245875 () Bool)

(assert (=> b!1360019 m!1245875))

(assert (=> b!1360024 m!1245867))

(assert (=> b!1360024 m!1245867))

(declare-fun m!1245877 () Bool)

(assert (=> b!1360024 m!1245877))

(declare-fun m!1245879 () Bool)

(assert (=> b!1360020 m!1245879))

(declare-fun m!1245881 () Bool)

(assert (=> b!1360022 m!1245881))

(push 1)

(assert (not b!1360020))

(assert (not b!1360022))

(assert (not b!1360021))

(assert (not b!1360017))

(assert (not b!1360027))

(assert (not b!1360024))

(assert (not b!1360019))

(assert (not start!114710))

(assert (not b!1360018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

