; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113934 () Bool)

(assert start!113934)

(declare-fun b!1351351 () Bool)

(declare-fun res!896852 () Bool)

(declare-fun e!768474 () Bool)

(assert (=> b!1351351 (=> (not res!896852) (not e!768474))))

(declare-datatypes ((List!31600 0))(
  ( (Nil!31597) (Cons!31596 (h!32805 (_ BitVec 64)) (t!46250 List!31600)) )
))
(declare-fun acc!759 () List!31600)

(declare-fun contains!9220 (List!31600 (_ BitVec 64)) Bool)

(assert (=> b!1351351 (= res!896852 (not (contains!9220 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351352 () Bool)

(declare-fun res!896862 () Bool)

(assert (=> b!1351352 (=> (not res!896862) (not e!768474))))

(assert (=> b!1351352 (= res!896862 (not (contains!9220 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351353 () Bool)

(declare-fun res!896856 () Bool)

(assert (=> b!1351353 (=> (not res!896856) (not e!768474))))

(declare-datatypes ((array!92065 0))(
  ( (array!92066 (arr!44481 (Array (_ BitVec 32) (_ BitVec 64))) (size!45033 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92065)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351353 (= res!896856 (validKeyInArray!0 (select (arr!44481 a!3742) from!3120)))))

(declare-fun b!1351354 () Bool)

(declare-fun res!896859 () Bool)

(assert (=> b!1351354 (=> (not res!896859) (not e!768474))))

(assert (=> b!1351354 (= res!896859 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45033 a!3742)))))

(declare-fun b!1351355 () Bool)

(declare-fun res!896864 () Bool)

(assert (=> b!1351355 (=> (not res!896864) (not e!768474))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351355 (= res!896864 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351356 () Bool)

(declare-fun res!896855 () Bool)

(declare-fun e!768473 () Bool)

(assert (=> b!1351356 (=> res!896855 e!768473)))

(declare-fun lt!597038 () List!31600)

(assert (=> b!1351356 (= res!896855 (contains!9220 lt!597038 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351357 () Bool)

(declare-fun res!896851 () Bool)

(assert (=> b!1351357 (=> res!896851 e!768473)))

(declare-fun noDuplicate!2135 (List!31600) Bool)

(assert (=> b!1351357 (= res!896851 (not (noDuplicate!2135 lt!597038)))))

(declare-fun b!1351358 () Bool)

(declare-fun res!896863 () Bool)

(assert (=> b!1351358 (=> (not res!896863) (not e!768474))))

(declare-fun arrayNoDuplicates!0 (array!92065 (_ BitVec 32) List!31600) Bool)

(assert (=> b!1351358 (= res!896863 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31597))))

(declare-fun b!1351359 () Bool)

(declare-fun res!896857 () Bool)

(assert (=> b!1351359 (=> (not res!896857) (not e!768474))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351359 (= res!896857 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45033 a!3742))))))

(declare-fun b!1351360 () Bool)

(declare-fun res!896860 () Bool)

(assert (=> b!1351360 (=> (not res!896860) (not e!768474))))

(assert (=> b!1351360 (= res!896860 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351361 () Bool)

(assert (=> b!1351361 (= e!768473 true)))

(declare-fun lt!597037 () Bool)

(assert (=> b!1351361 (= lt!597037 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597038))))

(declare-datatypes ((Unit!44107 0))(
  ( (Unit!44108) )
))
(declare-fun lt!597040 () Unit!44107)

(declare-fun noDuplicateSubseq!127 (List!31600 List!31600) Unit!44107)

(assert (=> b!1351361 (= lt!597040 (noDuplicateSubseq!127 acc!759 lt!597038))))

(declare-fun b!1351362 () Bool)

(assert (=> b!1351362 (= e!768474 (not e!768473))))

(declare-fun res!896858 () Bool)

(assert (=> b!1351362 (=> res!896858 e!768473)))

(assert (=> b!1351362 (= res!896858 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!693 (List!31600 (_ BitVec 64)) List!31600)

(assert (=> b!1351362 (= lt!597038 ($colon$colon!693 acc!759 (select (arr!44481 a!3742) from!3120)))))

(declare-fun subseq!676 (List!31600 List!31600) Bool)

(assert (=> b!1351362 (subseq!676 acc!759 acc!759)))

(declare-fun lt!597039 () Unit!44107)

(declare-fun lemmaListSubSeqRefl!0 (List!31600) Unit!44107)

(assert (=> b!1351362 (= lt!597039 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351363 () Bool)

(declare-fun res!896853 () Bool)

(assert (=> b!1351363 (=> res!896853 e!768473)))

(assert (=> b!1351363 (= res!896853 (contains!9220 lt!597038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!896850 () Bool)

(assert (=> start!113934 (=> (not res!896850) (not e!768474))))

(assert (=> start!113934 (= res!896850 (and (bvslt (size!45033 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45033 a!3742))))))

(assert (=> start!113934 e!768474))

(assert (=> start!113934 true))

(declare-fun array_inv!33714 (array!92065) Bool)

(assert (=> start!113934 (array_inv!33714 a!3742)))

(declare-fun b!1351364 () Bool)

(declare-fun res!896854 () Bool)

(assert (=> b!1351364 (=> (not res!896854) (not e!768474))))

(assert (=> b!1351364 (= res!896854 (noDuplicate!2135 acc!759))))

(declare-fun b!1351365 () Bool)

(declare-fun res!896861 () Bool)

(assert (=> b!1351365 (=> res!896861 e!768473)))

(assert (=> b!1351365 (= res!896861 (not (subseq!676 acc!759 lt!597038)))))

(assert (= (and start!113934 res!896850) b!1351364))

(assert (= (and b!1351364 res!896854) b!1351351))

(assert (= (and b!1351351 res!896852) b!1351352))

(assert (= (and b!1351352 res!896862) b!1351358))

(assert (= (and b!1351358 res!896863) b!1351360))

(assert (= (and b!1351360 res!896860) b!1351359))

(assert (= (and b!1351359 res!896857) b!1351355))

(assert (= (and b!1351355 res!896864) b!1351354))

(assert (= (and b!1351354 res!896859) b!1351353))

(assert (= (and b!1351353 res!896856) b!1351362))

(assert (= (and b!1351362 (not res!896858)) b!1351357))

(assert (= (and b!1351357 (not res!896851)) b!1351363))

(assert (= (and b!1351363 (not res!896853)) b!1351356))

(assert (= (and b!1351356 (not res!896855)) b!1351365))

(assert (= (and b!1351365 (not res!896861)) b!1351361))

(declare-fun m!1237933 () Bool)

(assert (=> b!1351357 m!1237933))

(declare-fun m!1237935 () Bool)

(assert (=> b!1351365 m!1237935))

(declare-fun m!1237937 () Bool)

(assert (=> b!1351364 m!1237937))

(declare-fun m!1237939 () Bool)

(assert (=> b!1351361 m!1237939))

(declare-fun m!1237941 () Bool)

(assert (=> b!1351361 m!1237941))

(declare-fun m!1237943 () Bool)

(assert (=> b!1351351 m!1237943))

(declare-fun m!1237945 () Bool)

(assert (=> start!113934 m!1237945))

(declare-fun m!1237947 () Bool)

(assert (=> b!1351360 m!1237947))

(declare-fun m!1237949 () Bool)

(assert (=> b!1351352 m!1237949))

(declare-fun m!1237951 () Bool)

(assert (=> b!1351362 m!1237951))

(assert (=> b!1351362 m!1237951))

(declare-fun m!1237953 () Bool)

(assert (=> b!1351362 m!1237953))

(declare-fun m!1237955 () Bool)

(assert (=> b!1351362 m!1237955))

(declare-fun m!1237957 () Bool)

(assert (=> b!1351362 m!1237957))

(declare-fun m!1237959 () Bool)

(assert (=> b!1351355 m!1237959))

(declare-fun m!1237961 () Bool)

(assert (=> b!1351358 m!1237961))

(declare-fun m!1237963 () Bool)

(assert (=> b!1351356 m!1237963))

(assert (=> b!1351353 m!1237951))

(assert (=> b!1351353 m!1237951))

(declare-fun m!1237965 () Bool)

(assert (=> b!1351353 m!1237965))

(declare-fun m!1237967 () Bool)

(assert (=> b!1351363 m!1237967))

(push 1)

(assert (not b!1351355))

(assert (not b!1351360))

(assert (not b!1351357))

(assert (not b!1351365))

(assert (not b!1351356))

(assert (not b!1351351))

(assert (not b!1351353))

(assert (not b!1351364))

(assert (not start!113934))

(assert (not b!1351352))

(assert (not b!1351363))

(assert (not b!1351361))

(assert (not b!1351358))

(assert (not b!1351362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

