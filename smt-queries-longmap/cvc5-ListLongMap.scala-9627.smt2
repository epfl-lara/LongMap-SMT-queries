; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113904 () Bool)

(assert start!113904)

(declare-fun res!896178 () Bool)

(declare-fun e!768338 () Bool)

(assert (=> start!113904 (=> (not res!896178) (not e!768338))))

(declare-datatypes ((array!92035 0))(
  ( (array!92036 (arr!44466 (Array (_ BitVec 32) (_ BitVec 64))) (size!45018 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92035)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113904 (= res!896178 (and (bvslt (size!45018 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45018 a!3742))))))

(assert (=> start!113904 e!768338))

(assert (=> start!113904 true))

(declare-fun array_inv!33699 (array!92035) Bool)

(assert (=> start!113904 (array_inv!33699 a!3742)))

(declare-fun b!1350676 () Bool)

(declare-fun res!896180 () Bool)

(assert (=> b!1350676 (=> (not res!896180) (not e!768338))))

(assert (=> b!1350676 (= res!896180 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45018 a!3742)))))

(declare-fun b!1350677 () Bool)

(declare-fun res!896184 () Bool)

(assert (=> b!1350677 (=> (not res!896184) (not e!768338))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350677 (= res!896184 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350678 () Bool)

(declare-fun res!896175 () Bool)

(declare-fun e!768340 () Bool)

(assert (=> b!1350678 (=> res!896175 e!768340)))

(declare-datatypes ((List!31585 0))(
  ( (Nil!31582) (Cons!31581 (h!32790 (_ BitVec 64)) (t!46235 List!31585)) )
))
(declare-fun lt!596860 () List!31585)

(declare-fun contains!9205 (List!31585 (_ BitVec 64)) Bool)

(assert (=> b!1350678 (= res!896175 (contains!9205 lt!596860 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350679 () Bool)

(declare-fun res!896182 () Bool)

(assert (=> b!1350679 (=> res!896182 e!768340)))

(declare-fun acc!759 () List!31585)

(declare-fun subseq!661 (List!31585 List!31585) Bool)

(assert (=> b!1350679 (= res!896182 (not (subseq!661 acc!759 lt!596860)))))

(declare-fun b!1350680 () Bool)

(declare-fun res!896176 () Bool)

(assert (=> b!1350680 (=> (not res!896176) (not e!768338))))

(assert (=> b!1350680 (= res!896176 (not (contains!9205 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350681 () Bool)

(declare-fun res!896181 () Bool)

(assert (=> b!1350681 (=> (not res!896181) (not e!768338))))

(declare-fun noDuplicate!2120 (List!31585) Bool)

(assert (=> b!1350681 (= res!896181 (noDuplicate!2120 acc!759))))

(declare-fun b!1350682 () Bool)

(assert (=> b!1350682 (= e!768338 (not e!768340))))

(declare-fun res!896188 () Bool)

(assert (=> b!1350682 (=> res!896188 e!768340)))

(assert (=> b!1350682 (= res!896188 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!678 (List!31585 (_ BitVec 64)) List!31585)

(assert (=> b!1350682 (= lt!596860 ($colon$colon!678 acc!759 (select (arr!44466 a!3742) from!3120)))))

(assert (=> b!1350682 (subseq!661 acc!759 acc!759)))

(declare-datatypes ((Unit!44077 0))(
  ( (Unit!44078) )
))
(declare-fun lt!596857 () Unit!44077)

(declare-fun lemmaListSubSeqRefl!0 (List!31585) Unit!44077)

(assert (=> b!1350682 (= lt!596857 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350683 () Bool)

(assert (=> b!1350683 (= e!768340 true)))

(declare-fun lt!596859 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92035 (_ BitVec 32) List!31585) Bool)

(assert (=> b!1350683 (= lt!596859 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!596860))))

(declare-fun lt!596858 () Unit!44077)

(declare-fun noDuplicateSubseq!112 (List!31585 List!31585) Unit!44077)

(assert (=> b!1350683 (= lt!596858 (noDuplicateSubseq!112 acc!759 lt!596860))))

(declare-fun b!1350684 () Bool)

(declare-fun res!896183 () Bool)

(assert (=> b!1350684 (=> res!896183 e!768340)))

(assert (=> b!1350684 (= res!896183 (not (noDuplicate!2120 lt!596860)))))

(declare-fun b!1350685 () Bool)

(declare-fun res!896177 () Bool)

(assert (=> b!1350685 (=> (not res!896177) (not e!768338))))

(assert (=> b!1350685 (= res!896177 (validKeyInArray!0 (select (arr!44466 a!3742) from!3120)))))

(declare-fun b!1350686 () Bool)

(declare-fun res!896189 () Bool)

(assert (=> b!1350686 (=> (not res!896189) (not e!768338))))

(assert (=> b!1350686 (= res!896189 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350687 () Bool)

(declare-fun res!896179 () Bool)

(assert (=> b!1350687 (=> (not res!896179) (not e!768338))))

(assert (=> b!1350687 (= res!896179 (not (contains!9205 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350688 () Bool)

(declare-fun res!896187 () Bool)

(assert (=> b!1350688 (=> (not res!896187) (not e!768338))))

(assert (=> b!1350688 (= res!896187 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31582))))

(declare-fun b!1350689 () Bool)

(declare-fun res!896186 () Bool)

(assert (=> b!1350689 (=> res!896186 e!768340)))

(assert (=> b!1350689 (= res!896186 (contains!9205 lt!596860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350690 () Bool)

(declare-fun res!896185 () Bool)

(assert (=> b!1350690 (=> (not res!896185) (not e!768338))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350690 (= res!896185 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45018 a!3742))))))

(assert (= (and start!113904 res!896178) b!1350681))

(assert (= (and b!1350681 res!896181) b!1350680))

(assert (= (and b!1350680 res!896176) b!1350687))

(assert (= (and b!1350687 res!896179) b!1350688))

(assert (= (and b!1350688 res!896187) b!1350686))

(assert (= (and b!1350686 res!896189) b!1350690))

(assert (= (and b!1350690 res!896185) b!1350677))

(assert (= (and b!1350677 res!896184) b!1350676))

(assert (= (and b!1350676 res!896180) b!1350685))

(assert (= (and b!1350685 res!896177) b!1350682))

(assert (= (and b!1350682 (not res!896188)) b!1350684))

(assert (= (and b!1350684 (not res!896183)) b!1350689))

(assert (= (and b!1350689 (not res!896186)) b!1350678))

(assert (= (and b!1350678 (not res!896175)) b!1350679))

(assert (= (and b!1350679 (not res!896182)) b!1350683))

(declare-fun m!1237393 () Bool)

(assert (=> b!1350688 m!1237393))

(declare-fun m!1237395 () Bool)

(assert (=> b!1350681 m!1237395))

(declare-fun m!1237397 () Bool)

(assert (=> b!1350683 m!1237397))

(declare-fun m!1237399 () Bool)

(assert (=> b!1350683 m!1237399))

(declare-fun m!1237401 () Bool)

(assert (=> b!1350677 m!1237401))

(declare-fun m!1237403 () Bool)

(assert (=> b!1350680 m!1237403))

(declare-fun m!1237405 () Bool)

(assert (=> b!1350686 m!1237405))

(declare-fun m!1237407 () Bool)

(assert (=> b!1350685 m!1237407))

(assert (=> b!1350685 m!1237407))

(declare-fun m!1237409 () Bool)

(assert (=> b!1350685 m!1237409))

(declare-fun m!1237411 () Bool)

(assert (=> start!113904 m!1237411))

(declare-fun m!1237413 () Bool)

(assert (=> b!1350684 m!1237413))

(declare-fun m!1237415 () Bool)

(assert (=> b!1350678 m!1237415))

(declare-fun m!1237417 () Bool)

(assert (=> b!1350687 m!1237417))

(declare-fun m!1237419 () Bool)

(assert (=> b!1350679 m!1237419))

(assert (=> b!1350682 m!1237407))

(assert (=> b!1350682 m!1237407))

(declare-fun m!1237421 () Bool)

(assert (=> b!1350682 m!1237421))

(declare-fun m!1237423 () Bool)

(assert (=> b!1350682 m!1237423))

(declare-fun m!1237425 () Bool)

(assert (=> b!1350682 m!1237425))

(declare-fun m!1237427 () Bool)

(assert (=> b!1350689 m!1237427))

(push 1)

(assert (not b!1350677))

(assert (not b!1350681))

(assert (not b!1350685))

(assert (not b!1350689))

(assert (not b!1350687))

(assert (not b!1350678))

(assert (not b!1350683))

(assert (not b!1350680))

(assert (not start!113904))

(assert (not b!1350688))

(assert (not b!1350682))

(assert (not b!1350686))

(assert (not b!1350679))

(assert (not b!1350684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

