; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113956 () Bool)

(assert start!113956)

(declare-fun b!1351874 () Bool)

(declare-fun res!897312 () Bool)

(declare-fun e!768622 () Bool)

(assert (=> b!1351874 (=> (not res!897312) (not e!768622))))

(declare-datatypes ((List!31558 0))(
  ( (Nil!31555) (Cons!31554 (h!32763 (_ BitVec 64)) (t!46216 List!31558)) )
))
(declare-fun acc!759 () List!31558)

(declare-fun noDuplicate!2124 (List!31558) Bool)

(assert (=> b!1351874 (= res!897312 (noDuplicate!2124 acc!759))))

(declare-fun b!1351875 () Bool)

(declare-fun res!897313 () Bool)

(assert (=> b!1351875 (=> (not res!897313) (not e!768622))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92138 0))(
  ( (array!92139 (arr!44517 (Array (_ BitVec 32) (_ BitVec 64))) (size!45067 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92138)

(assert (=> b!1351875 (= res!897313 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45067 a!3742)))))

(declare-fun b!1351876 () Bool)

(declare-fun res!897308 () Bool)

(assert (=> b!1351876 (=> (not res!897308) (not e!768622))))

(declare-fun contains!9267 (List!31558 (_ BitVec 64)) Bool)

(assert (=> b!1351876 (= res!897308 (not (contains!9267 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351877 () Bool)

(declare-fun res!897307 () Bool)

(assert (=> b!1351877 (=> (not res!897307) (not e!768622))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351877 (= res!897307 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351878 () Bool)

(declare-fun res!897306 () Bool)

(assert (=> b!1351878 (=> (not res!897306) (not e!768622))))

(declare-fun arrayNoDuplicates!0 (array!92138 (_ BitVec 32) List!31558) Bool)

(assert (=> b!1351878 (= res!897306 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31555))))

(declare-fun b!1351879 () Bool)

(declare-fun e!768619 () Bool)

(assert (=> b!1351879 (= e!768622 e!768619)))

(declare-fun res!897311 () Bool)

(assert (=> b!1351879 (=> (not res!897311) (not e!768619))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351879 (= res!897311 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44292 0))(
  ( (Unit!44293) )
))
(declare-fun lt!597356 () Unit!44292)

(declare-fun e!768621 () Unit!44292)

(assert (=> b!1351879 (= lt!597356 e!768621)))

(declare-fun c!126725 () Bool)

(assert (=> b!1351879 (= c!126725 (validKeyInArray!0 (select (arr!44517 a!3742) from!3120)))))

(declare-fun b!1351880 () Bool)

(declare-fun lt!597355 () Unit!44292)

(assert (=> b!1351880 (= e!768621 lt!597355)))

(declare-fun lt!597358 () Unit!44292)

(declare-fun lemmaListSubSeqRefl!0 (List!31558) Unit!44292)

(assert (=> b!1351880 (= lt!597358 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!687 (List!31558 List!31558) Bool)

(assert (=> b!1351880 (subseq!687 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92138 List!31558 List!31558 (_ BitVec 32)) Unit!44292)

(declare-fun $colon$colon!702 (List!31558 (_ BitVec 64)) List!31558)

(assert (=> b!1351880 (= lt!597355 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!702 acc!759 (select (arr!44517 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351880 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351881 () Bool)

(declare-fun res!897310 () Bool)

(assert (=> b!1351881 (=> (not res!897310) (not e!768622))))

(assert (=> b!1351881 (= res!897310 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351882 () Bool)

(declare-fun res!897305 () Bool)

(assert (=> b!1351882 (=> (not res!897305) (not e!768622))))

(assert (=> b!1351882 (= res!897305 (not (contains!9267 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!897309 () Bool)

(assert (=> start!113956 (=> (not res!897309) (not e!768622))))

(assert (=> start!113956 (= res!897309 (and (bvslt (size!45067 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45067 a!3742))))))

(assert (=> start!113956 e!768622))

(assert (=> start!113956 true))

(declare-fun array_inv!33545 (array!92138) Bool)

(assert (=> start!113956 (array_inv!33545 a!3742)))

(declare-fun b!1351883 () Bool)

(declare-fun Unit!44294 () Unit!44292)

(assert (=> b!1351883 (= e!768621 Unit!44294)))

(declare-fun b!1351884 () Bool)

(assert (=> b!1351884 (= e!768619 false)))

(declare-fun lt!597357 () Bool)

(assert (=> b!1351884 (= lt!597357 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351885 () Bool)

(declare-fun res!897304 () Bool)

(assert (=> b!1351885 (=> (not res!897304) (not e!768622))))

(assert (=> b!1351885 (= res!897304 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45067 a!3742))))))

(assert (= (and start!113956 res!897309) b!1351874))

(assert (= (and b!1351874 res!897312) b!1351882))

(assert (= (and b!1351882 res!897305) b!1351876))

(assert (= (and b!1351876 res!897308) b!1351878))

(assert (= (and b!1351878 res!897306) b!1351881))

(assert (= (and b!1351881 res!897310) b!1351885))

(assert (= (and b!1351885 res!897304) b!1351877))

(assert (= (and b!1351877 res!897307) b!1351875))

(assert (= (and b!1351875 res!897313) b!1351879))

(assert (= (and b!1351879 c!126725) b!1351880))

(assert (= (and b!1351879 (not c!126725)) b!1351883))

(assert (= (and b!1351879 res!897311) b!1351884))

(declare-fun m!1238813 () Bool)

(assert (=> b!1351876 m!1238813))

(declare-fun m!1238815 () Bool)

(assert (=> b!1351874 m!1238815))

(declare-fun m!1238817 () Bool)

(assert (=> b!1351880 m!1238817))

(declare-fun m!1238819 () Bool)

(assert (=> b!1351880 m!1238819))

(declare-fun m!1238821 () Bool)

(assert (=> b!1351880 m!1238821))

(declare-fun m!1238823 () Bool)

(assert (=> b!1351880 m!1238823))

(declare-fun m!1238825 () Bool)

(assert (=> b!1351880 m!1238825))

(assert (=> b!1351880 m!1238819))

(assert (=> b!1351880 m!1238821))

(declare-fun m!1238827 () Bool)

(assert (=> b!1351880 m!1238827))

(assert (=> b!1351879 m!1238819))

(assert (=> b!1351879 m!1238819))

(declare-fun m!1238829 () Bool)

(assert (=> b!1351879 m!1238829))

(declare-fun m!1238831 () Bool)

(assert (=> b!1351878 m!1238831))

(declare-fun m!1238833 () Bool)

(assert (=> start!113956 m!1238833))

(declare-fun m!1238835 () Bool)

(assert (=> b!1351881 m!1238835))

(declare-fun m!1238837 () Bool)

(assert (=> b!1351877 m!1238837))

(declare-fun m!1238839 () Bool)

(assert (=> b!1351882 m!1238839))

(assert (=> b!1351884 m!1238825))

(check-sat (not b!1351882) (not b!1351878) (not b!1351879) (not b!1351877) (not b!1351880) (not start!113956) (not b!1351876) (not b!1351884) (not b!1351881) (not b!1351874))
(check-sat)
