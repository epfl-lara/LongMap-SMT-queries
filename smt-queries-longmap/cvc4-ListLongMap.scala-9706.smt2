; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114690 () Bool)

(assert start!114690)

(declare-fun b!1360637 () Bool)

(declare-fun res!904906 () Bool)

(declare-fun e!771871 () Bool)

(assert (=> b!1360637 (=> (not res!904906) (not e!771871))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92578 0))(
  ( (array!92579 (arr!44728 (Array (_ BitVec 32) (_ BitVec 64))) (size!45278 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92578)

(assert (=> b!1360637 (= res!904906 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45278 a!3742)))))

(declare-fun b!1360638 () Bool)

(declare-fun res!904898 () Bool)

(assert (=> b!1360638 (=> (not res!904898) (not e!771871))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360638 (= res!904898 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45278 a!3742))))))

(declare-fun b!1360639 () Bool)

(declare-datatypes ((List!31769 0))(
  ( (Nil!31766) (Cons!31765 (h!32974 (_ BitVec 64)) (t!46445 List!31769)) )
))
(declare-fun acc!759 () List!31769)

(declare-fun e!771873 () Bool)

(declare-fun noDuplicate!2335 (List!31769) Bool)

(declare-fun $colon$colon!883 (List!31769 (_ BitVec 64)) List!31769)

(assert (=> b!1360639 (= e!771873 (not (noDuplicate!2335 ($colon$colon!883 acc!759 (select (arr!44728 a!3742) from!3120)))))))

(declare-fun b!1360640 () Bool)

(declare-fun res!904905 () Bool)

(assert (=> b!1360640 (=> (not res!904905) (not e!771871))))

(declare-fun arrayNoDuplicates!0 (array!92578 (_ BitVec 32) List!31769) Bool)

(assert (=> b!1360640 (= res!904905 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360641 () Bool)

(declare-fun res!904897 () Bool)

(assert (=> b!1360641 (=> (not res!904897) (not e!771871))))

(assert (=> b!1360641 (= res!904897 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31766))))

(declare-fun b!1360642 () Bool)

(declare-datatypes ((Unit!44844 0))(
  ( (Unit!44845) )
))
(declare-fun e!771874 () Unit!44844)

(declare-fun Unit!44846 () Unit!44844)

(assert (=> b!1360642 (= e!771874 Unit!44846)))

(declare-fun b!1360643 () Bool)

(declare-fun res!904899 () Bool)

(assert (=> b!1360643 (=> (not res!904899) (not e!771871))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360643 (= res!904899 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!904902 () Bool)

(assert (=> start!114690 (=> (not res!904902) (not e!771871))))

(assert (=> start!114690 (= res!904902 (and (bvslt (size!45278 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45278 a!3742))))))

(assert (=> start!114690 e!771871))

(assert (=> start!114690 true))

(declare-fun array_inv!33756 (array!92578) Bool)

(assert (=> start!114690 (array_inv!33756 a!3742)))

(declare-fun b!1360644 () Bool)

(declare-fun res!904900 () Bool)

(assert (=> b!1360644 (=> (not res!904900) (not e!771871))))

(declare-fun contains!9478 (List!31769 (_ BitVec 64)) Bool)

(assert (=> b!1360644 (= res!904900 (not (contains!9478 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360645 () Bool)

(declare-fun lt!599951 () Unit!44844)

(assert (=> b!1360645 (= e!771874 lt!599951)))

(declare-fun lt!599950 () Unit!44844)

(declare-fun lemmaListSubSeqRefl!0 (List!31769) Unit!44844)

(assert (=> b!1360645 (= lt!599950 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!880 (List!31769 List!31769) Bool)

(assert (=> b!1360645 (subseq!880 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92578 List!31769 List!31769 (_ BitVec 32)) Unit!44844)

(assert (=> b!1360645 (= lt!599951 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!883 acc!759 (select (arr!44728 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360645 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360646 () Bool)

(declare-fun res!904901 () Bool)

(assert (=> b!1360646 (=> (not res!904901) (not e!771871))))

(assert (=> b!1360646 (= res!904901 (not (contains!9478 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360647 () Bool)

(declare-fun res!904904 () Bool)

(assert (=> b!1360647 (=> (not res!904904) (not e!771871))))

(assert (=> b!1360647 (= res!904904 (noDuplicate!2335 acc!759))))

(declare-fun b!1360648 () Bool)

(assert (=> b!1360648 (= e!771871 e!771873)))

(declare-fun res!904903 () Bool)

(assert (=> b!1360648 (=> (not res!904903) (not e!771873))))

(declare-fun lt!599953 () Bool)

(assert (=> b!1360648 (= res!904903 (and (not (= from!3120 i!1404)) lt!599953 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599952 () Unit!44844)

(assert (=> b!1360648 (= lt!599952 e!771874)))

(declare-fun c!127310 () Bool)

(assert (=> b!1360648 (= c!127310 lt!599953)))

(assert (=> b!1360648 (= lt!599953 (validKeyInArray!0 (select (arr!44728 a!3742) from!3120)))))

(assert (= (and start!114690 res!904902) b!1360647))

(assert (= (and b!1360647 res!904904) b!1360646))

(assert (= (and b!1360646 res!904901) b!1360644))

(assert (= (and b!1360644 res!904900) b!1360641))

(assert (= (and b!1360641 res!904897) b!1360640))

(assert (= (and b!1360640 res!904905) b!1360638))

(assert (= (and b!1360638 res!904898) b!1360643))

(assert (= (and b!1360643 res!904899) b!1360637))

(assert (= (and b!1360637 res!904906) b!1360648))

(assert (= (and b!1360648 c!127310) b!1360645))

(assert (= (and b!1360648 (not c!127310)) b!1360642))

(assert (= (and b!1360648 res!904903) b!1360639))

(declare-fun m!1245877 () Bool)

(assert (=> b!1360639 m!1245877))

(assert (=> b!1360639 m!1245877))

(declare-fun m!1245879 () Bool)

(assert (=> b!1360639 m!1245879))

(assert (=> b!1360639 m!1245879))

(declare-fun m!1245881 () Bool)

(assert (=> b!1360639 m!1245881))

(assert (=> b!1360648 m!1245877))

(assert (=> b!1360648 m!1245877))

(declare-fun m!1245883 () Bool)

(assert (=> b!1360648 m!1245883))

(declare-fun m!1245885 () Bool)

(assert (=> b!1360641 m!1245885))

(declare-fun m!1245887 () Bool)

(assert (=> b!1360643 m!1245887))

(declare-fun m!1245889 () Bool)

(assert (=> b!1360647 m!1245889))

(declare-fun m!1245891 () Bool)

(assert (=> b!1360640 m!1245891))

(declare-fun m!1245893 () Bool)

(assert (=> b!1360644 m!1245893))

(declare-fun m!1245895 () Bool)

(assert (=> b!1360646 m!1245895))

(declare-fun m!1245897 () Bool)

(assert (=> start!114690 m!1245897))

(declare-fun m!1245899 () Bool)

(assert (=> b!1360645 m!1245899))

(assert (=> b!1360645 m!1245877))

(assert (=> b!1360645 m!1245879))

(declare-fun m!1245901 () Bool)

(assert (=> b!1360645 m!1245901))

(declare-fun m!1245903 () Bool)

(assert (=> b!1360645 m!1245903))

(assert (=> b!1360645 m!1245877))

(assert (=> b!1360645 m!1245879))

(declare-fun m!1245905 () Bool)

(assert (=> b!1360645 m!1245905))

(push 1)

(assert (not b!1360646))

(assert (not b!1360639))

(assert (not b!1360643))

(assert (not b!1360645))

(assert (not b!1360647))

(assert (not b!1360641))

(assert (not b!1360644))

(assert (not b!1360648))

(assert (not b!1360640))

(assert (not start!114690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145659 () Bool)

(declare-fun res!904935 () Bool)

(declare-fun e!771907 () Bool)

(assert (=> d!145659 (=> res!904935 e!771907)))

(assert (=> d!145659 (= res!904935 (is-Nil!31766 acc!759))))

(assert (=> d!145659 (= (noDuplicate!2335 acc!759) e!771907)))

(declare-fun b!1360685 () Bool)

(declare-fun e!771908 () Bool)

(assert (=> b!1360685 (= e!771907 e!771908)))

(declare-fun res!904936 () Bool)

(assert (=> b!1360685 (=> (not res!904936) (not e!771908))))

(assert (=> b!1360685 (= res!904936 (not (contains!9478 (t!46445 acc!759) (h!32974 acc!759))))))

(declare-fun b!1360686 () Bool)

(assert (=> b!1360686 (= e!771908 (noDuplicate!2335 (t!46445 acc!759)))))

(assert (= (and d!145659 (not res!904935)) b!1360685))

(assert (= (and b!1360685 res!904936) b!1360686))

(declare-fun m!1245929 () Bool)

(assert (=> b!1360685 m!1245929))

(declare-fun m!1245931 () Bool)

(assert (=> b!1360686 m!1245931))

(assert (=> b!1360647 d!145659))

(declare-fun d!145669 () Bool)

(declare-fun lt!599964 () Bool)

(declare-fun content!690 (List!31769) (Set (_ BitVec 64)))

(assert (=> d!145669 (= lt!599964 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!690 acc!759)))))

(declare-fun e!771925 () Bool)

(assert (=> d!145669 (= lt!599964 e!771925)))

(declare-fun res!904951 () Bool)

(assert (=> d!145669 (=> (not res!904951) (not e!771925))))

(assert (=> d!145669 (= res!904951 (is-Cons!31765 acc!759))))

(assert (=> d!145669 (= (contains!9478 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599964)))

(declare-fun b!1360705 () Bool)

(declare-fun e!771926 () Bool)

(assert (=> b!1360705 (= e!771925 e!771926)))

(declare-fun res!904952 () Bool)

(assert (=> b!1360705 (=> res!904952 e!771926)))

(assert (=> b!1360705 (= res!904952 (= (h!32974 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360706 () Bool)

(assert (=> b!1360706 (= e!771926 (contains!9478 (t!46445 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145669 res!904951) b!1360705))

(assert (= (and b!1360705 (not res!904952)) b!1360706))

(declare-fun m!1245935 () Bool)

(assert (=> d!145669 m!1245935))

(declare-fun m!1245937 () Bool)

(assert (=> d!145669 m!1245937))

(declare-fun m!1245939 () Bool)

(assert (=> b!1360706 m!1245939))

(assert (=> b!1360646 d!145669))

(declare-fun b!1360749 () Bool)

(declare-fun e!771968 () Bool)

(assert (=> b!1360749 (= e!771968 (contains!9478 Nil!31766 (select (arr!44728 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360750 () Bool)

(declare-fun e!771965 () Bool)

(declare-fun call!65338 () Bool)

(assert (=> b!1360750 (= e!771965 call!65338)))

(declare-fun b!1360751 () Bool)

(declare-fun e!771966 () Bool)

(assert (=> b!1360751 (= e!771966 e!771965)))

(declare-fun c!127321 () Bool)

(assert (=> b!1360751 (= c!127321 (validKeyInArray!0 (select (arr!44728 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65335 () Bool)

(assert (=> bm!65335 (= call!65338 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127321 (Cons!31765 (select (arr!44728 a!3742) #b00000000000000000000000000000000) Nil!31766) Nil!31766)))))

(declare-fun d!145673 () Bool)

(declare-fun res!904988 () Bool)

(declare-fun e!771967 () Bool)

(assert (=> d!145673 (=> res!904988 e!771967)))

(assert (=> d!145673 (= res!904988 (bvsge #b00000000000000000000000000000000 (size!45278 a!3742)))))

(assert (=> d!145673 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31766) e!771967)))

(declare-fun b!1360752 () Bool)

(assert (=> b!1360752 (= e!771967 e!771966)))

(declare-fun res!904989 () Bool)

(assert (=> b!1360752 (=> (not res!904989) (not e!771966))))

(assert (=> b!1360752 (= res!904989 (not e!771968))))

(declare-fun res!904987 () Bool)

(assert (=> b!1360752 (=> (not res!904987) (not e!771968))))

(assert (=> b!1360752 (= res!904987 (validKeyInArray!0 (select (arr!44728 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360753 () Bool)

(assert (=> b!1360753 (= e!771965 call!65338)))

(assert (= (and d!145673 (not res!904988)) b!1360752))

(assert (= (and b!1360752 res!904987) b!1360749))

(assert (= (and b!1360752 res!904989) b!1360751))

(assert (= (and b!1360751 c!127321) b!1360753))

(assert (= (and b!1360751 (not c!127321)) b!1360750))

(assert (= (or b!1360753 b!1360750) bm!65335))

(declare-fun m!1245971 () Bool)

(assert (=> b!1360749 m!1245971))

(assert (=> b!1360749 m!1245971))

(declare-fun m!1245973 () Bool)

(assert (=> b!1360749 m!1245973))

(assert (=> b!1360751 m!1245971))

(assert (=> b!1360751 m!1245971))

(declare-fun m!1245975 () Bool)

(assert (=> b!1360751 m!1245975))

(assert (=> bm!65335 m!1245971))

(declare-fun m!1245977 () Bool)

(assert (=> bm!65335 m!1245977))

(assert (=> b!1360752 m!1245971))

(assert (=> b!1360752 m!1245971))

(assert (=> b!1360752 m!1245975))

(assert (=> b!1360641 d!145673))

(declare-fun e!771974 () Bool)

(declare-fun b!1360756 () Bool)

(assert (=> b!1360756 (= e!771974 (contains!9478 acc!759 (select (arr!44728 a!3742) from!3120)))))

(declare-fun b!1360757 () Bool)

(declare-fun e!771969 () Bool)

(declare-fun call!65339 () Bool)

(assert (=> b!1360757 (= e!771969 call!65339)))

(declare-fun b!1360758 () Bool)

(declare-fun e!771971 () Bool)

(assert (=> b!1360758 (= e!771971 e!771969)))

(declare-fun c!127322 () Bool)

(assert (=> b!1360758 (= c!127322 (validKeyInArray!0 (select (arr!44728 a!3742) from!3120)))))

(declare-fun bm!65336 () Bool)

(assert (=> bm!65336 (= call!65339 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127322 (Cons!31765 (select (arr!44728 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!145695 () Bool)

(declare-fun res!904993 () Bool)

(declare-fun e!771973 () Bool)

(assert (=> d!145695 (=> res!904993 e!771973)))

(assert (=> d!145695 (= res!904993 (bvsge from!3120 (size!45278 a!3742)))))

(assert (=> d!145695 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771973)))

(declare-fun b!1360759 () Bool)

(assert (=> b!1360759 (= e!771973 e!771971)))

(declare-fun res!904994 () Bool)

(assert (=> b!1360759 (=> (not res!904994) (not e!771971))))

(assert (=> b!1360759 (= res!904994 (not e!771974))))

(declare-fun res!904992 () Bool)

(assert (=> b!1360759 (=> (not res!904992) (not e!771974))))

(assert (=> b!1360759 (= res!904992 (validKeyInArray!0 (select (arr!44728 a!3742) from!3120)))))

(declare-fun b!1360760 () Bool)

(assert (=> b!1360760 (= e!771969 call!65339)))

(assert (= (and d!145695 (not res!904993)) b!1360759))

(assert (= (and b!1360759 res!904992) b!1360756))

(assert (= (and b!1360759 res!904994) b!1360758))

(assert (= (and b!1360758 c!127322) b!1360760))

(assert (= (and b!1360758 (not c!127322)) b!1360757))

(assert (= (or b!1360760 b!1360757) bm!65336))

(assert (=> b!1360756 m!1245877))

(assert (=> b!1360756 m!1245877))

(declare-fun m!1245985 () Bool)

(assert (=> b!1360756 m!1245985))

(assert (=> b!1360758 m!1245877))

(assert (=> b!1360758 m!1245877))

(assert (=> b!1360758 m!1245883))

(assert (=> bm!65336 m!1245877))

(declare-fun m!1245991 () Bool)

