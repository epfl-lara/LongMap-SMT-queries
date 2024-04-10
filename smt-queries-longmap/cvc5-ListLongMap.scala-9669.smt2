; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114152 () Bool)

(assert start!114152)

(declare-fun b!1355942 () Bool)

(declare-fun res!900790 () Bool)

(declare-fun e!769915 () Bool)

(assert (=> b!1355942 (=> (not res!900790) (not e!769915))))

(declare-datatypes ((array!92334 0))(
  ( (array!92335 (arr!44615 (Array (_ BitVec 32) (_ BitVec 64))) (size!45165 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92334)

(declare-datatypes ((List!31656 0))(
  ( (Nil!31653) (Cons!31652 (h!32861 (_ BitVec 64)) (t!46314 List!31656)) )
))
(declare-fun arrayNoDuplicates!0 (array!92334 (_ BitVec 32) List!31656) Bool)

(assert (=> b!1355942 (= res!900790 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31653))))

(declare-fun b!1355943 () Bool)

(declare-fun res!900793 () Bool)

(assert (=> b!1355943 (=> (not res!900793) (not e!769915))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355943 (= res!900793 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45165 a!3742))))))

(declare-fun b!1355944 () Bool)

(declare-fun res!900788 () Bool)

(assert (=> b!1355944 (=> (not res!900788) (not e!769915))))

(declare-fun acc!759 () List!31656)

(declare-fun contains!9365 (List!31656 (_ BitVec 64)) Bool)

(assert (=> b!1355944 (= res!900788 (not (contains!9365 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355945 () Bool)

(declare-datatypes ((Unit!44586 0))(
  ( (Unit!44587) )
))
(declare-fun e!769913 () Unit!44586)

(declare-fun Unit!44588 () Unit!44586)

(assert (=> b!1355945 (= e!769913 Unit!44588)))

(declare-fun b!1355946 () Bool)

(declare-fun res!900791 () Bool)

(assert (=> b!1355946 (=> (not res!900791) (not e!769915))))

(declare-fun noDuplicate!2222 (List!31656) Bool)

(assert (=> b!1355946 (= res!900791 (noDuplicate!2222 acc!759))))

(declare-fun b!1355948 () Bool)

(declare-fun lt!598841 () Unit!44586)

(assert (=> b!1355948 (= e!769913 lt!598841)))

(declare-fun lt!598840 () Unit!44586)

(declare-fun lemmaListSubSeqRefl!0 (List!31656) Unit!44586)

(assert (=> b!1355948 (= lt!598840 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!785 (List!31656 List!31656) Bool)

(assert (=> b!1355948 (subseq!785 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92334 List!31656 List!31656 (_ BitVec 32)) Unit!44586)

(declare-fun $colon$colon!800 (List!31656 (_ BitVec 64)) List!31656)

(assert (=> b!1355948 (= lt!598841 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!800 acc!759 (select (arr!44615 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355948 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355949 () Bool)

(declare-fun e!769914 () Bool)

(assert (=> b!1355949 (= e!769914 false)))

(declare-fun lt!598842 () Bool)

(assert (=> b!1355949 (= lt!598842 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355950 () Bool)

(declare-fun res!900792 () Bool)

(assert (=> b!1355950 (=> (not res!900792) (not e!769915))))

(assert (=> b!1355950 (= res!900792 (not (contains!9365 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355951 () Bool)

(declare-fun res!900789 () Bool)

(assert (=> b!1355951 (=> (not res!900789) (not e!769915))))

(assert (=> b!1355951 (= res!900789 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45165 a!3742)))))

(declare-fun b!1355952 () Bool)

(assert (=> b!1355952 (= e!769915 e!769914)))

(declare-fun res!900785 () Bool)

(assert (=> b!1355952 (=> (not res!900785) (not e!769914))))

(declare-fun lt!598839 () Bool)

(assert (=> b!1355952 (= res!900785 (and (not (= from!3120 i!1404)) (not lt!598839) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598843 () Unit!44586)

(assert (=> b!1355952 (= lt!598843 e!769913)))

(declare-fun c!127019 () Bool)

(assert (=> b!1355952 (= c!127019 lt!598839)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355952 (= lt!598839 (validKeyInArray!0 (select (arr!44615 a!3742) from!3120)))))

(declare-fun b!1355953 () Bool)

(declare-fun res!900787 () Bool)

(assert (=> b!1355953 (=> (not res!900787) (not e!769915))))

(assert (=> b!1355953 (= res!900787 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355947 () Bool)

(declare-fun res!900784 () Bool)

(assert (=> b!1355947 (=> (not res!900784) (not e!769915))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355947 (= res!900784 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!900786 () Bool)

(assert (=> start!114152 (=> (not res!900786) (not e!769915))))

(assert (=> start!114152 (= res!900786 (and (bvslt (size!45165 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45165 a!3742))))))

(assert (=> start!114152 e!769915))

(assert (=> start!114152 true))

(declare-fun array_inv!33643 (array!92334) Bool)

(assert (=> start!114152 (array_inv!33643 a!3742)))

(assert (= (and start!114152 res!900786) b!1355946))

(assert (= (and b!1355946 res!900791) b!1355950))

(assert (= (and b!1355950 res!900792) b!1355944))

(assert (= (and b!1355944 res!900788) b!1355942))

(assert (= (and b!1355942 res!900790) b!1355953))

(assert (= (and b!1355953 res!900787) b!1355943))

(assert (= (and b!1355943 res!900793) b!1355947))

(assert (= (and b!1355947 res!900784) b!1355951))

(assert (= (and b!1355951 res!900789) b!1355952))

(assert (= (and b!1355952 c!127019) b!1355948))

(assert (= (and b!1355952 (not c!127019)) b!1355945))

(assert (= (and b!1355952 res!900785) b!1355949))

(declare-fun m!1242013 () Bool)

(assert (=> b!1355948 m!1242013))

(declare-fun m!1242015 () Bool)

(assert (=> b!1355948 m!1242015))

(declare-fun m!1242017 () Bool)

(assert (=> b!1355948 m!1242017))

(declare-fun m!1242019 () Bool)

(assert (=> b!1355948 m!1242019))

(declare-fun m!1242021 () Bool)

(assert (=> b!1355948 m!1242021))

(assert (=> b!1355948 m!1242015))

(assert (=> b!1355948 m!1242017))

(declare-fun m!1242023 () Bool)

(assert (=> b!1355948 m!1242023))

(assert (=> b!1355949 m!1242021))

(declare-fun m!1242025 () Bool)

(assert (=> b!1355953 m!1242025))

(declare-fun m!1242027 () Bool)

(assert (=> b!1355942 m!1242027))

(declare-fun m!1242029 () Bool)

(assert (=> b!1355944 m!1242029))

(assert (=> b!1355952 m!1242015))

(assert (=> b!1355952 m!1242015))

(declare-fun m!1242031 () Bool)

(assert (=> b!1355952 m!1242031))

(declare-fun m!1242033 () Bool)

(assert (=> b!1355950 m!1242033))

(declare-fun m!1242035 () Bool)

(assert (=> b!1355946 m!1242035))

(declare-fun m!1242037 () Bool)

(assert (=> start!114152 m!1242037))

(declare-fun m!1242039 () Bool)

(assert (=> b!1355947 m!1242039))

(push 1)

(assert (not b!1355942))

(assert (not start!114152))

(assert (not b!1355952))

(assert (not b!1355950))

