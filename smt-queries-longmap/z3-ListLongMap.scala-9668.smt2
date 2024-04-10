; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114148 () Bool)

(assert start!114148)

(declare-fun b!1355870 () Bool)

(declare-fun res!900728 () Bool)

(declare-fun e!769890 () Bool)

(assert (=> b!1355870 (=> (not res!900728) (not e!769890))))

(declare-datatypes ((List!31654 0))(
  ( (Nil!31651) (Cons!31650 (h!32859 (_ BitVec 64)) (t!46312 List!31654)) )
))
(declare-fun acc!759 () List!31654)

(declare-fun noDuplicate!2220 (List!31654) Bool)

(assert (=> b!1355870 (= res!900728 (noDuplicate!2220 acc!759))))

(declare-fun b!1355871 () Bool)

(declare-fun e!769889 () Bool)

(assert (=> b!1355871 (= e!769889 false)))

(declare-fun lt!598810 () Bool)

(declare-datatypes ((array!92330 0))(
  ( (array!92331 (arr!44613 (Array (_ BitVec 32) (_ BitVec 64))) (size!45163 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92330)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92330 (_ BitVec 32) List!31654) Bool)

(assert (=> b!1355871 (= lt!598810 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355872 () Bool)

(declare-datatypes ((Unit!44580 0))(
  ( (Unit!44581) )
))
(declare-fun e!769888 () Unit!44580)

(declare-fun Unit!44582 () Unit!44580)

(assert (=> b!1355872 (= e!769888 Unit!44582)))

(declare-fun b!1355874 () Bool)

(declare-fun res!900733 () Bool)

(assert (=> b!1355874 (=> (not res!900733) (not e!769890))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355874 (= res!900733 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355875 () Bool)

(declare-fun lt!598811 () Unit!44580)

(assert (=> b!1355875 (= e!769888 lt!598811)))

(declare-fun lt!598813 () Unit!44580)

(declare-fun lemmaListSubSeqRefl!0 (List!31654) Unit!44580)

(assert (=> b!1355875 (= lt!598813 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!783 (List!31654 List!31654) Bool)

(assert (=> b!1355875 (subseq!783 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92330 List!31654 List!31654 (_ BitVec 32)) Unit!44580)

(declare-fun $colon$colon!798 (List!31654 (_ BitVec 64)) List!31654)

(assert (=> b!1355875 (= lt!598811 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!798 acc!759 (select (arr!44613 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355875 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355876 () Bool)

(declare-fun res!900726 () Bool)

(assert (=> b!1355876 (=> (not res!900726) (not e!769890))))

(assert (=> b!1355876 (= res!900726 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45163 a!3742)))))

(declare-fun b!1355877 () Bool)

(declare-fun res!900724 () Bool)

(assert (=> b!1355877 (=> (not res!900724) (not e!769890))))

(declare-fun contains!9363 (List!31654 (_ BitVec 64)) Bool)

(assert (=> b!1355877 (= res!900724 (not (contains!9363 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355873 () Bool)

(declare-fun res!900727 () Bool)

(assert (=> b!1355873 (=> (not res!900727) (not e!769890))))

(assert (=> b!1355873 (= res!900727 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31651))))

(declare-fun res!900725 () Bool)

(assert (=> start!114148 (=> (not res!900725) (not e!769890))))

(assert (=> start!114148 (= res!900725 (and (bvslt (size!45163 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45163 a!3742))))))

(assert (=> start!114148 e!769890))

(assert (=> start!114148 true))

(declare-fun array_inv!33641 (array!92330) Bool)

(assert (=> start!114148 (array_inv!33641 a!3742)))

(declare-fun b!1355878 () Bool)

(declare-fun res!900730 () Bool)

(assert (=> b!1355878 (=> (not res!900730) (not e!769890))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355878 (= res!900730 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45163 a!3742))))))

(declare-fun b!1355879 () Bool)

(assert (=> b!1355879 (= e!769890 e!769889)))

(declare-fun res!900731 () Bool)

(assert (=> b!1355879 (=> (not res!900731) (not e!769889))))

(declare-fun lt!598812 () Bool)

(assert (=> b!1355879 (= res!900731 (and (not (= from!3120 i!1404)) (not lt!598812) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598809 () Unit!44580)

(assert (=> b!1355879 (= lt!598809 e!769888)))

(declare-fun c!127013 () Bool)

(assert (=> b!1355879 (= c!127013 lt!598812)))

(assert (=> b!1355879 (= lt!598812 (validKeyInArray!0 (select (arr!44613 a!3742) from!3120)))))

(declare-fun b!1355880 () Bool)

(declare-fun res!900732 () Bool)

(assert (=> b!1355880 (=> (not res!900732) (not e!769890))))

(assert (=> b!1355880 (= res!900732 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355881 () Bool)

(declare-fun res!900729 () Bool)

(assert (=> b!1355881 (=> (not res!900729) (not e!769890))))

(assert (=> b!1355881 (= res!900729 (not (contains!9363 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114148 res!900725) b!1355870))

(assert (= (and b!1355870 res!900728) b!1355881))

(assert (= (and b!1355881 res!900729) b!1355877))

(assert (= (and b!1355877 res!900724) b!1355873))

(assert (= (and b!1355873 res!900727) b!1355880))

(assert (= (and b!1355880 res!900732) b!1355878))

(assert (= (and b!1355878 res!900730) b!1355874))

(assert (= (and b!1355874 res!900733) b!1355876))

(assert (= (and b!1355876 res!900726) b!1355879))

(assert (= (and b!1355879 c!127013) b!1355875))

(assert (= (and b!1355879 (not c!127013)) b!1355872))

(assert (= (and b!1355879 res!900731) b!1355871))

(declare-fun m!1241957 () Bool)

(assert (=> b!1355877 m!1241957))

(declare-fun m!1241959 () Bool)

(assert (=> b!1355875 m!1241959))

(declare-fun m!1241961 () Bool)

(assert (=> b!1355875 m!1241961))

(declare-fun m!1241963 () Bool)

(assert (=> b!1355875 m!1241963))

(declare-fun m!1241965 () Bool)

(assert (=> b!1355875 m!1241965))

(declare-fun m!1241967 () Bool)

(assert (=> b!1355875 m!1241967))

(assert (=> b!1355875 m!1241961))

(assert (=> b!1355875 m!1241963))

(declare-fun m!1241969 () Bool)

(assert (=> b!1355875 m!1241969))

(assert (=> b!1355879 m!1241961))

(assert (=> b!1355879 m!1241961))

(declare-fun m!1241971 () Bool)

(assert (=> b!1355879 m!1241971))

(assert (=> b!1355871 m!1241967))

(declare-fun m!1241973 () Bool)

(assert (=> start!114148 m!1241973))

(declare-fun m!1241975 () Bool)

(assert (=> b!1355873 m!1241975))

(declare-fun m!1241977 () Bool)

(assert (=> b!1355881 m!1241977))

(declare-fun m!1241979 () Bool)

(assert (=> b!1355880 m!1241979))

(declare-fun m!1241981 () Bool)

(assert (=> b!1355870 m!1241981))

(declare-fun m!1241983 () Bool)

(assert (=> b!1355874 m!1241983))

(check-sat (not b!1355870) (not b!1355877) (not b!1355875) (not b!1355874) (not b!1355879) (not b!1355871) (not b!1355873) (not b!1355880) (not b!1355881) (not start!114148))
(check-sat)
