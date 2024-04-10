; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114986 () Bool)

(assert start!114986)

(declare-fun b!1362969 () Bool)

(declare-fun res!906869 () Bool)

(declare-fun e!773027 () Bool)

(assert (=> b!1362969 (=> (not res!906869) (not e!773027))))

(declare-datatypes ((List!31806 0))(
  ( (Nil!31803) (Cons!31802 (h!33011 (_ BitVec 64)) (t!46494 List!31806)) )
))
(declare-fun acc!759 () List!31806)

(declare-fun noDuplicate!2372 (List!31806) Bool)

(assert (=> b!1362969 (= res!906869 (noDuplicate!2372 acc!759))))

(declare-fun b!1362970 () Bool)

(declare-fun res!906866 () Bool)

(assert (=> b!1362970 (=> (not res!906866) (not e!773027))))

(declare-datatypes ((array!92664 0))(
  ( (array!92665 (arr!44765 (Array (_ BitVec 32) (_ BitVec 64))) (size!45315 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92664)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92664 (_ BitVec 32) List!31806) Bool)

(assert (=> b!1362970 (= res!906866 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362971 () Bool)

(declare-datatypes ((Unit!44955 0))(
  ( (Unit!44956) )
))
(declare-fun e!773029 () Unit!44955)

(declare-fun Unit!44957 () Unit!44955)

(assert (=> b!1362971 (= e!773029 Unit!44957)))

(declare-fun b!1362972 () Bool)

(declare-fun res!906868 () Bool)

(assert (=> b!1362972 (=> (not res!906868) (not e!773027))))

(assert (=> b!1362972 (= res!906868 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31803))))

(declare-fun b!1362973 () Bool)

(declare-fun res!906867 () Bool)

(assert (=> b!1362973 (=> (not res!906867) (not e!773027))))

(assert (=> b!1362973 (= res!906867 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45315 a!3742)))))

(declare-fun b!1362974 () Bool)

(assert (=> b!1362974 (= e!773027 false)))

(declare-fun lt!600638 () Unit!44955)

(assert (=> b!1362974 (= lt!600638 e!773029)))

(declare-fun c!127493 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362974 (= c!127493 (validKeyInArray!0 (select (arr!44765 a!3742) from!3120)))))

(declare-fun b!1362975 () Bool)

(declare-fun lt!600640 () Unit!44955)

(assert (=> b!1362975 (= e!773029 lt!600640)))

(declare-fun lt!600639 () Unit!44955)

(declare-fun lemmaListSubSeqRefl!0 (List!31806) Unit!44955)

(assert (=> b!1362975 (= lt!600639 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!917 (List!31806 List!31806) Bool)

(assert (=> b!1362975 (subseq!917 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92664 List!31806 List!31806 (_ BitVec 32)) Unit!44955)

(declare-fun $colon$colon!920 (List!31806 (_ BitVec 64)) List!31806)

(assert (=> b!1362975 (= lt!600640 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!920 acc!759 (select (arr!44765 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362975 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362976 () Bool)

(declare-fun res!906871 () Bool)

(assert (=> b!1362976 (=> (not res!906871) (not e!773027))))

(declare-fun contains!9515 (List!31806 (_ BitVec 64)) Bool)

(assert (=> b!1362976 (= res!906871 (not (contains!9515 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!906863 () Bool)

(assert (=> start!114986 (=> (not res!906863) (not e!773027))))

(assert (=> start!114986 (= res!906863 (and (bvslt (size!45315 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45315 a!3742))))))

(assert (=> start!114986 e!773027))

(assert (=> start!114986 true))

(declare-fun array_inv!33793 (array!92664) Bool)

(assert (=> start!114986 (array_inv!33793 a!3742)))

(declare-fun b!1362977 () Bool)

(declare-fun res!906870 () Bool)

(assert (=> b!1362977 (=> (not res!906870) (not e!773027))))

(assert (=> b!1362977 (= res!906870 (not (contains!9515 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362978 () Bool)

(declare-fun res!906865 () Bool)

(assert (=> b!1362978 (=> (not res!906865) (not e!773027))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362978 (= res!906865 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362979 () Bool)

(declare-fun res!906864 () Bool)

(assert (=> b!1362979 (=> (not res!906864) (not e!773027))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362979 (= res!906864 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45315 a!3742))))))

(assert (= (and start!114986 res!906863) b!1362969))

(assert (= (and b!1362969 res!906869) b!1362977))

(assert (= (and b!1362977 res!906870) b!1362976))

(assert (= (and b!1362976 res!906871) b!1362972))

(assert (= (and b!1362972 res!906868) b!1362970))

(assert (= (and b!1362970 res!906866) b!1362979))

(assert (= (and b!1362979 res!906864) b!1362978))

(assert (= (and b!1362978 res!906865) b!1362973))

(assert (= (and b!1362973 res!906867) b!1362974))

(assert (= (and b!1362974 c!127493) b!1362975))

(assert (= (and b!1362974 (not c!127493)) b!1362971))

(declare-fun m!1247863 () Bool)

(assert (=> b!1362972 m!1247863))

(declare-fun m!1247865 () Bool)

(assert (=> b!1362978 m!1247865))

(declare-fun m!1247867 () Bool)

(assert (=> b!1362977 m!1247867))

(declare-fun m!1247869 () Bool)

(assert (=> b!1362970 m!1247869))

(declare-fun m!1247871 () Bool)

(assert (=> b!1362975 m!1247871))

(declare-fun m!1247873 () Bool)

(assert (=> b!1362975 m!1247873))

(declare-fun m!1247875 () Bool)

(assert (=> b!1362975 m!1247875))

(declare-fun m!1247877 () Bool)

(assert (=> b!1362975 m!1247877))

(declare-fun m!1247879 () Bool)

(assert (=> b!1362975 m!1247879))

(assert (=> b!1362975 m!1247873))

(assert (=> b!1362975 m!1247875))

(declare-fun m!1247881 () Bool)

(assert (=> b!1362975 m!1247881))

(assert (=> b!1362974 m!1247873))

(assert (=> b!1362974 m!1247873))

(declare-fun m!1247883 () Bool)

(assert (=> b!1362974 m!1247883))

(declare-fun m!1247885 () Bool)

(assert (=> b!1362969 m!1247885))

(declare-fun m!1247887 () Bool)

(assert (=> start!114986 m!1247887))

(declare-fun m!1247889 () Bool)

(assert (=> b!1362976 m!1247889))

(push 1)

(assert (not b!1362975))

(assert (not b!1362976))

(assert (not b!1362977))

(assert (not b!1362974))

(assert (not b!1362969))

(assert (not b!1362978))

(assert (not b!1362970))

(assert (not b!1362972))

(assert (not start!114986))

(check-sat)

(pop 1)

