; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115556 () Bool)

(assert start!115556)

(declare-fun b!1366878 () Bool)

(declare-fun res!910436 () Bool)

(declare-fun e!774684 () Bool)

(assert (=> b!1366878 (=> (not res!910436) (not e!774684))))

(declare-datatypes ((List!31911 0))(
  ( (Nil!31908) (Cons!31907 (h!33116 (_ BitVec 64)) (t!46605 List!31911)) )
))
(declare-fun newAcc!98 () List!31911)

(declare-fun acc!866 () List!31911)

(declare-fun subseq!995 (List!31911 List!31911) Bool)

(assert (=> b!1366878 (= res!910436 (subseq!995 newAcc!98 acc!866))))

(declare-fun b!1366879 () Bool)

(declare-fun res!910429 () Bool)

(declare-fun e!774685 () Bool)

(assert (=> b!1366879 (=> (not res!910429) (not e!774685))))

(declare-datatypes ((array!92832 0))(
  ( (array!92833 (arr!44843 (Array (_ BitVec 32) (_ BitVec 64))) (size!45393 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92832)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun contains!9593 (List!31911 (_ BitVec 64)) Bool)

(assert (=> b!1366879 (= res!910429 (not (contains!9593 acc!866 (select (arr!44843 a!3861) from!3239))))))

(declare-fun b!1366880 () Bool)

(declare-fun res!910428 () Bool)

(assert (=> b!1366880 (=> (not res!910428) (not e!774684))))

(assert (=> b!1366880 (= res!910428 (not (contains!9593 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366881 () Bool)

(declare-fun res!910430 () Bool)

(assert (=> b!1366881 (=> (not res!910430) (not e!774684))))

(assert (=> b!1366881 (= res!910430 (not (contains!9593 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366882 () Bool)

(declare-fun res!910435 () Bool)

(assert (=> b!1366882 (=> (not res!910435) (not e!774685))))

(assert (=> b!1366882 (= res!910435 (bvslt from!3239 (size!45393 a!3861)))))

(declare-fun res!910432 () Bool)

(assert (=> start!115556 (=> (not res!910432) (not e!774684))))

(assert (=> start!115556 (= res!910432 (and (bvslt (size!45393 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45393 a!3861))))))

(assert (=> start!115556 e!774684))

(declare-fun array_inv!33871 (array!92832) Bool)

(assert (=> start!115556 (array_inv!33871 a!3861)))

(assert (=> start!115556 true))

(declare-fun b!1366883 () Bool)

(assert (=> b!1366883 (= e!774684 e!774685)))

(declare-fun res!910433 () Bool)

(assert (=> b!1366883 (=> (not res!910433) (not e!774685))))

(declare-fun arrayNoDuplicates!0 (array!92832 (_ BitVec 32) List!31911) Bool)

(assert (=> b!1366883 (= res!910433 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45123 0))(
  ( (Unit!45124) )
))
(declare-fun lt!601720 () Unit!45123)

(declare-fun noDuplicateSubseq!182 (List!31911 List!31911) Unit!45123)

(assert (=> b!1366883 (= lt!601720 (noDuplicateSubseq!182 newAcc!98 acc!866))))

(declare-fun b!1366884 () Bool)

(declare-fun noDuplicate!2450 (List!31911) Bool)

(assert (=> b!1366884 (= e!774685 (not (noDuplicate!2450 newAcc!98)))))

(declare-fun lt!601719 () Unit!45123)

(declare-fun lt!601721 () List!31911)

(declare-fun lt!601722 () List!31911)

(assert (=> b!1366884 (= lt!601719 (noDuplicateSubseq!182 lt!601721 lt!601722))))

(assert (=> b!1366884 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601721)))

(declare-fun lt!601723 () Unit!45123)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92832 List!31911 List!31911 (_ BitVec 32)) Unit!45123)

(assert (=> b!1366884 (= lt!601723 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601722 lt!601721 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366884 (= lt!601721 (Cons!31907 (select (arr!44843 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366884 (= lt!601722 (Cons!31907 (select (arr!44843 a!3861) from!3239) acc!866))))

(declare-fun b!1366885 () Bool)

(declare-fun res!910437 () Bool)

(assert (=> b!1366885 (=> (not res!910437) (not e!774684))))

(assert (=> b!1366885 (= res!910437 (not (contains!9593 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366886 () Bool)

(declare-fun res!910434 () Bool)

(assert (=> b!1366886 (=> (not res!910434) (not e!774684))))

(assert (=> b!1366886 (= res!910434 (noDuplicate!2450 acc!866))))

(declare-fun b!1366887 () Bool)

(declare-fun res!910438 () Bool)

(assert (=> b!1366887 (=> (not res!910438) (not e!774684))))

(assert (=> b!1366887 (= res!910438 (not (contains!9593 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366888 () Bool)

(declare-fun res!910431 () Bool)

(assert (=> b!1366888 (=> (not res!910431) (not e!774685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366888 (= res!910431 (validKeyInArray!0 (select (arr!44843 a!3861) from!3239)))))

(assert (= (and start!115556 res!910432) b!1366886))

(assert (= (and b!1366886 res!910434) b!1366881))

(assert (= (and b!1366881 res!910430) b!1366880))

(assert (= (and b!1366880 res!910428) b!1366885))

(assert (= (and b!1366885 res!910437) b!1366887))

(assert (= (and b!1366887 res!910438) b!1366878))

(assert (= (and b!1366878 res!910436) b!1366883))

(assert (= (and b!1366883 res!910433) b!1366882))

(assert (= (and b!1366882 res!910435) b!1366888))

(assert (= (and b!1366888 res!910431) b!1366879))

(assert (= (and b!1366879 res!910429) b!1366884))

(declare-fun m!1251145 () Bool)

(assert (=> b!1366883 m!1251145))

(declare-fun m!1251147 () Bool)

(assert (=> b!1366883 m!1251147))

(declare-fun m!1251149 () Bool)

(assert (=> b!1366880 m!1251149))

(declare-fun m!1251151 () Bool)

(assert (=> b!1366885 m!1251151))

(declare-fun m!1251153 () Bool)

(assert (=> b!1366879 m!1251153))

(assert (=> b!1366879 m!1251153))

(declare-fun m!1251155 () Bool)

(assert (=> b!1366879 m!1251155))

(declare-fun m!1251157 () Bool)

(assert (=> start!115556 m!1251157))

(declare-fun m!1251159 () Bool)

(assert (=> b!1366881 m!1251159))

(declare-fun m!1251161 () Bool)

(assert (=> b!1366887 m!1251161))

(declare-fun m!1251163 () Bool)

(assert (=> b!1366886 m!1251163))

(assert (=> b!1366888 m!1251153))

(assert (=> b!1366888 m!1251153))

(declare-fun m!1251165 () Bool)

(assert (=> b!1366888 m!1251165))

(declare-fun m!1251167 () Bool)

(assert (=> b!1366878 m!1251167))

(declare-fun m!1251169 () Bool)

(assert (=> b!1366884 m!1251169))

(declare-fun m!1251171 () Bool)

(assert (=> b!1366884 m!1251171))

(assert (=> b!1366884 m!1251153))

(declare-fun m!1251173 () Bool)

(assert (=> b!1366884 m!1251173))

(declare-fun m!1251175 () Bool)

(assert (=> b!1366884 m!1251175))

(push 1)

(assert (not b!1366878))

(assert (not b!1366880))

(assert (not b!1366887))

(assert (not b!1366884))

(assert (not b!1366888))

(assert (not b!1366886))

(assert (not b!1366881))

(assert (not start!115556))

(assert (not b!1366879))

(assert (not b!1366885))

(assert (not b!1366883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146729 () Bool)

(declare-fun lt!601762 () Bool)

(declare-fun content!716 (List!31911) (Set (_ BitVec 64)))

(assert (=> d!146729 (= lt!601762 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!716 newAcc!98)))))

(declare-fun e!774733 () Bool)

(assert (=> d!146729 (= lt!601762 e!774733)))

(declare-fun res!910531 () Bool)

(assert (=> d!146729 (=> (not res!910531) (not e!774733))))

(assert (=> d!146729 (= res!910531 (is-Cons!31907 newAcc!98))))

(assert (=> d!146729 (= (contains!9593 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601762)))

(declare-fun b!1366985 () Bool)

(declare-fun e!774732 () Bool)

(assert (=> b!1366985 (= e!774733 e!774732)))

(declare-fun res!910532 () Bool)

(assert (=> b!1366985 (=> res!910532 e!774732)))

(assert (=> b!1366985 (= res!910532 (= (h!33116 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366986 () Bool)

(assert (=> b!1366986 (= e!774732 (contains!9593 (t!46605 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146729 res!910531) b!1366985))

(assert (= (and b!1366985 (not res!910532)) b!1366986))

(declare-fun m!1251253 () Bool)

(assert (=> d!146729 m!1251253))

(declare-fun m!1251255 () Bool)

(assert (=> d!146729 m!1251255))

(declare-fun m!1251257 () Bool)

(assert (=> b!1366986 m!1251257))

(assert (=> b!1366887 d!146729))

(declare-fun d!146733 () Bool)

(declare-fun lt!601763 () Bool)

(assert (=> d!146733 (= lt!601763 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!716 acc!866)))))

(declare-fun e!774737 () Bool)

(assert (=> d!146733 (= lt!601763 e!774737)))

(declare-fun res!910535 () Bool)

(assert (=> d!146733 (=> (not res!910535) (not e!774737))))

(assert (=> d!146733 (= res!910535 (is-Cons!31907 acc!866))))

(assert (=> d!146733 (= (contains!9593 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601763)))

(declare-fun b!1366989 () Bool)

(declare-fun e!774736 () Bool)

(assert (=> b!1366989 (= e!774737 e!774736)))

(declare-fun res!910536 () Bool)

(assert (=> b!1366989 (=> res!910536 e!774736)))

(assert (=> b!1366989 (= res!910536 (= (h!33116 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366990 () Bool)

(assert (=> b!1366990 (= e!774736 (contains!9593 (t!46605 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146733 res!910535) b!1366989))

(assert (= (and b!1366989 (not res!910536)) b!1366990))

(declare-fun m!1251263 () Bool)

(assert (=> d!146733 m!1251263))

(declare-fun m!1251265 () Bool)

(assert (=> d!146733 m!1251265))

(declare-fun m!1251267 () Bool)

(assert (=> b!1366990 m!1251267))

(assert (=> b!1366881 d!146733))

(declare-fun d!146737 () Bool)

(declare-fun res!910552 () Bool)

(declare-fun e!774754 () Bool)

(assert (=> d!146737 (=> res!910552 e!774754)))

(assert (=> d!146737 (= res!910552 (is-Nil!31908 acc!866))))

(assert (=> d!146737 (= (noDuplicate!2450 acc!866) e!774754)))

(declare-fun b!1367008 () Bool)

(declare-fun e!774755 () Bool)

(assert (=> b!1367008 (= e!774754 e!774755)))

(declare-fun res!910553 () Bool)

(assert (=> b!1367008 (=> (not res!910553) (not e!774755))))

(assert (=> b!1367008 (= res!910553 (not (contains!9593 (t!46605 acc!866) (h!33116 acc!866))))))

(declare-fun b!1367009 () Bool)

(assert (=> b!1367009 (= e!774755 (noDuplicate!2450 (t!46605 acc!866)))))

(assert (= (and d!146737 (not res!910552)) b!1367008))

(assert (= (and b!1367008 res!910553) b!1367009))

(declare-fun m!1251287 () Bool)

(assert (=> b!1367008 m!1251287))

(declare-fun m!1251289 () Bool)

(assert (=> b!1367009 m!1251289))

(assert (=> b!1366886 d!146737))

(declare-fun d!146749 () Bool)

(declare-fun lt!601768 () Bool)

(assert (=> d!146749 (= lt!601768 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!716 acc!866)))))

(declare-fun e!774759 () Bool)

(assert (=> d!146749 (= lt!601768 e!774759)))

(declare-fun res!910556 () Bool)

(assert (=> d!146749 (=> (not res!910556) (not e!774759))))

(assert (=> d!146749 (= res!910556 (is-Cons!31907 acc!866))))

(assert (=> d!146749 (= (contains!9593 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601768)))

(declare-fun b!1367012 () Bool)

(declare-fun e!774758 () Bool)

(assert (=> b!1367012 (= e!774759 e!774758)))

(declare-fun res!910557 () Bool)

(assert (=> b!1367012 (=> res!910557 e!774758)))

(assert (=> b!1367012 (= res!910557 (= (h!33116 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367013 () Bool)

(assert (=> b!1367013 (= e!774758 (contains!9593 (t!46605 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146749 res!910556) b!1367012))

(assert (= (and b!1367012 (not res!910557)) b!1367013))

(assert (=> d!146749 m!1251263))

(declare-fun m!1251293 () Bool)

(assert (=> d!146749 m!1251293))

(declare-fun m!1251295 () Bool)

(assert (=> b!1367013 m!1251295))

(assert (=> b!1366880 d!146749))

(declare-fun d!146753 () Bool)

(declare-fun lt!601769 () Bool)

(assert (=> d!146753 (= lt!601769 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!716 newAcc!98)))))

(declare-fun e!774767 () Bool)

(assert (=> d!146753 (= lt!601769 e!774767)))

(declare-fun res!910564 () Bool)

(assert (=> d!146753 (=> (not res!910564) (not e!774767))))

(assert (=> d!146753 (= res!910564 (is-Cons!31907 newAcc!98))))

(assert (=> d!146753 (= (contains!9593 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601769)))

(declare-fun b!1367020 () Bool)

(declare-fun e!774766 () Bool)

(assert (=> b!1367020 (= e!774767 e!774766)))

(declare-fun res!910565 () Bool)

(assert (=> b!1367020 (=> res!910565 e!774766)))

(assert (=> b!1367020 (= res!910565 (= (h!33116 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367021 () Bool)

(assert (=> b!1367021 (= e!774766 (contains!9593 (t!46605 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146753 res!910564) b!1367020))

(assert (= (and b!1367020 (not res!910565)) b!1367021))

(assert (=> d!146753 m!1251253))

(declare-fun m!1251297 () Bool)

(assert (=> d!146753 m!1251297))

(declare-fun m!1251299 () Bool)

(assert (=> b!1367021 m!1251299))

(assert (=> b!1366885 d!146753))

(declare-fun d!146755 () Bool)

(declare-fun lt!601770 () Bool)

(assert (=> d!146755 (= lt!601770 (set.member (select (arr!44843 a!3861) from!3239) (content!716 acc!866)))))

(declare-fun e!774769 () Bool)

(assert (=> d!146755 (= lt!601770 e!774769)))

(declare-fun res!910566 () Bool)

(assert (=> d!146755 (=> (not res!910566) (not e!774769))))

(assert (=> d!146755 (= res!910566 (is-Cons!31907 acc!866))))

(assert (=> d!146755 (= (contains!9593 acc!866 (select (arr!44843 a!3861) from!3239)) lt!601770)))

(declare-fun b!1367022 () Bool)

(declare-fun e!774768 () Bool)

(assert (=> b!1367022 (= e!774769 e!774768)))

(declare-fun res!910567 () Bool)

(assert (=> b!1367022 (=> res!910567 e!774768)))

(assert (=> b!1367022 (= res!910567 (= (h!33116 acc!866) (select (arr!44843 a!3861) from!3239)))))

(declare-fun b!1367023 () Bool)

(assert (=> b!1367023 (= e!774768 (contains!9593 (t!46605 acc!866) (select (arr!44843 a!3861) from!3239)))))

(assert (= (and d!146755 res!910566) b!1367022))

(assert (= (and b!1367022 (not res!910567)) b!1367023))

(assert (=> d!146755 m!1251263))

(assert (=> d!146755 m!1251153))

(declare-fun m!1251301 () Bool)

(assert (=> d!146755 m!1251301))

(assert (=> b!1367023 m!1251153))

(declare-fun m!1251303 () Bool)

(assert (=> b!1367023 m!1251303))

(assert (=> b!1366879 d!146755))

(declare-fun d!146757 () Bool)

(declare-fun res!910572 () Bool)

(declare-fun e!774774 () Bool)

(assert (=> d!146757 (=> res!910572 e!774774)))

(assert (=> d!146757 (= res!910572 (is-Nil!31908 newAcc!98))))

(assert (=> d!146757 (= (noDuplicate!2450 newAcc!98) e!774774)))

(declare-fun b!1367028 () Bool)

(declare-fun e!774775 () Bool)

(assert (=> b!1367028 (= e!774774 e!774775)))

(declare-fun res!910573 () Bool)

(assert (=> b!1367028 (=> (not res!910573) (not e!774775))))

(assert (=> b!1367028 (= res!910573 (not (contains!9593 (t!46605 newAcc!98) (h!33116 newAcc!98))))))

(declare-fun b!1367029 () Bool)

(assert (=> b!1367029 (= e!774775 (noDuplicate!2450 (t!46605 newAcc!98)))))

(assert (= (and d!146757 (not res!910572)) b!1367028))

(assert (= (and b!1367028 res!910573) b!1367029))

(declare-fun m!1251309 () Bool)

(assert (=> b!1367028 m!1251309))

(declare-fun m!1251311 () Bool)

(assert (=> b!1367029 m!1251311))

(assert (=> b!1366884 d!146757))

(declare-fun d!146761 () Bool)

(assert (=> d!146761 (noDuplicate!2450 lt!601721)))

(declare-fun lt!601776 () Unit!45123)

(declare-fun choose!1995 (List!31911 List!31911) Unit!45123)

(assert (=> d!146761 (= lt!601776 (choose!1995 lt!601721 lt!601722))))

(declare-fun e!774789 () Bool)

(assert (=> d!146761 e!774789))

(declare-fun res!910585 () Bool)

(assert (=> d!146761 (=> (not res!910585) (not e!774789))))

(assert (=> d!146761 (= res!910585 (subseq!995 lt!601721 lt!601722))))

(assert (=> d!146761 (= (noDuplicateSubseq!182 lt!601721 lt!601722) lt!601776)))

(declare-fun b!1367045 () Bool)

(assert (=> b!1367045 (= e!774789 (noDuplicate!2450 lt!601722))))

(assert (= (and d!146761 res!910585) b!1367045))

(declare-fun m!1251315 () Bool)

(assert (=> d!146761 m!1251315))

(declare-fun m!1251317 () Bool)

(assert (=> d!146761 m!1251317))

(declare-fun m!1251319 () Bool)

(assert (=> d!146761 m!1251319))

(declare-fun m!1251321 () Bool)

(assert (=> b!1367045 m!1251321))

(assert (=> b!1366884 d!146761))

(declare-fun b!1367094 () Bool)

(declare-fun e!774836 () Bool)

(assert (=> b!1367094 (= e!774836 (contains!9593 lt!601721 (select (arr!44843 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367095 () Bool)

(declare-fun e!774837 () Bool)

(declare-fun e!774834 () Bool)

(assert (=> b!1367095 (= e!774837 e!774834)))

(declare-fun c!127674 () Bool)

(assert (=> b!1367095 (= c!127674 (validKeyInArray!0 (select (arr!44843 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367096 () Bool)

(declare-fun call!65481 () Bool)

(assert (=> b!1367096 (= e!774834 call!65481)))

(declare-fun b!1367097 () Bool)

(assert (=> b!1367097 (= e!774834 call!65481)))

(declare-fun bm!65478 () Bool)

(assert (=> bm!65478 (= call!65481 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127674 (Cons!31907 (select (arr!44843 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!601721) lt!601721)))))

(declare-fun d!146767 () Bool)

(declare-fun res!910627 () Bool)

(declare-fun e!774835 () Bool)

(assert (=> d!146767 (=> res!910627 e!774835)))

(assert (=> d!146767 (= res!910627 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45393 a!3861)))))

(assert (=> d!146767 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601721) e!774835)))

(declare-fun b!1367098 () Bool)

(assert (=> b!1367098 (= e!774835 e!774837)))

(declare-fun res!910628 () Bool)

(assert (=> b!1367098 (=> (not res!910628) (not e!774837))))

(assert (=> b!1367098 (= res!910628 (not e!774836))))

(declare-fun res!910626 () Bool)

(assert (=> b!1367098 (=> (not res!910626) (not e!774836))))

(assert (=> b!1367098 (= res!910626 (validKeyInArray!0 (select (arr!44843 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!146767 (not res!910627)) b!1367098))

(assert (= (and b!1367098 res!910626) b!1367094))

(assert (= (and b!1367098 res!910628) b!1367095))

(assert (= (and b!1367095 c!127674) b!1367096))

(assert (= (and b!1367095 (not c!127674)) b!1367097))

(assert (= (or b!1367096 b!1367097) bm!65478))

(declare-fun m!1251367 () Bool)

(assert (=> b!1367094 m!1251367))

(assert (=> b!1367094 m!1251367))

(declare-fun m!1251369 () Bool)

(assert (=> b!1367094 m!1251369))

(assert (=> b!1367095 m!1251367))

(assert (=> b!1367095 m!1251367))

(declare-fun m!1251371 () Bool)

(assert (=> b!1367095 m!1251371))

(assert (=> bm!65478 m!1251367))

(declare-fun m!1251373 () Bool)

(assert (=> bm!65478 m!1251373))

(assert (=> b!1367098 m!1251367))

(assert (=> b!1367098 m!1251367))

(assert (=> b!1367098 m!1251371))

(assert (=> b!1366884 d!146767))

(declare-fun d!146789 () Bool)

(assert (=> d!146789 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601721)))

(declare-fun lt!601790 () Unit!45123)

(declare-fun choose!80 (array!92832 List!31911 List!31911 (_ BitVec 32)) Unit!45123)

(assert (=> d!146789 (= lt!601790 (choose!80 a!3861 lt!601722 lt!601721 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146789 (bvslt (size!45393 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146789 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601722 lt!601721 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601790)))

(declare-fun bs!39217 () Bool)

(assert (= bs!39217 d!146789))

(assert (=> bs!39217 m!1251169))

(declare-fun m!1251399 () Bool)

(assert (=> bs!39217 m!1251399))

(assert (=> b!1366884 d!146789))

(declare-fun d!146799 () Bool)

(assert (=> d!146799 (= (array_inv!33871 a!3861) (bvsge (size!45393 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115556 d!146799))

(declare-fun b!1367121 () Bool)

(declare-fun e!774857 () Bool)

(assert (=> b!1367121 (= e!774857 (subseq!995 (t!46605 newAcc!98) (t!46605 acc!866)))))

(declare-fun b!1367120 () Bool)

(declare-fun e!774859 () Bool)

(declare-fun e!774858 () Bool)

(assert (=> b!1367120 (= e!774859 e!774858)))

(declare-fun res!910648 () Bool)

(assert (=> b!1367120 (=> res!910648 e!774858)))

(assert (=> b!1367120 (= res!910648 e!774857)))

(declare-fun res!910650 () Bool)

(assert (=> b!1367120 (=> (not res!910650) (not e!774857))))

(assert (=> b!1367120 (= res!910650 (= (h!33116 newAcc!98) (h!33116 acc!866)))))

(declare-fun b!1367122 () Bool)

(assert (=> b!1367122 (= e!774858 (subseq!995 newAcc!98 (t!46605 acc!866)))))

(declare-fun b!1367119 () Bool)

(declare-fun e!774860 () Bool)

(assert (=> b!1367119 (= e!774860 e!774859)))

(declare-fun res!910647 () Bool)

(assert (=> b!1367119 (=> (not res!910647) (not e!774859))))

(assert (=> b!1367119 (= res!910647 (is-Cons!31907 acc!866))))

(declare-fun d!146801 () Bool)

(declare-fun res!910649 () Bool)

(assert (=> d!146801 (=> res!910649 e!774860)))

(assert (=> d!146801 (= res!910649 (is-Nil!31908 newAcc!98))))

(assert (=> d!146801 (= (subseq!995 newAcc!98 acc!866) e!774860)))

(assert (= (and d!146801 (not res!910649)) b!1367119))

(assert (= (and b!1367119 res!910647) b!1367120))

(assert (= (and b!1367120 res!910650) b!1367121))

(assert (= (and b!1367120 (not res!910648)) b!1367122))

(declare-fun m!1251407 () Bool)

(assert (=> b!1367121 m!1251407))

(declare-fun m!1251409 () Bool)

(assert (=> b!1367122 m!1251409))

(assert (=> b!1366878 d!146801))

(declare-fun e!774863 () Bool)

(declare-fun b!1367123 () Bool)

(assert (=> b!1367123 (= e!774863 (contains!9593 acc!866 (select (arr!44843 a!3861) from!3239)))))

(declare-fun b!1367124 () Bool)

(declare-fun e!774864 () Bool)

(declare-fun e!774861 () Bool)

(assert (=> b!1367124 (= e!774864 e!774861)))

(declare-fun c!127676 () Bool)

(assert (=> b!1367124 (= c!127676 (validKeyInArray!0 (select (arr!44843 a!3861) from!3239)))))

(declare-fun b!1367125 () Bool)

(declare-fun call!65483 () Bool)

(assert (=> b!1367125 (= e!774861 call!65483)))

(declare-fun b!1367126 () Bool)

(assert (=> b!1367126 (= e!774861 call!65483)))

(declare-fun bm!65480 () Bool)

(assert (=> bm!65480 (= call!65483 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127676 (Cons!31907 (select (arr!44843 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun d!146805 () Bool)

(declare-fun res!910652 () Bool)

(declare-fun e!774862 () Bool)

(assert (=> d!146805 (=> res!910652 e!774862)))

(assert (=> d!146805 (= res!910652 (bvsge from!3239 (size!45393 a!3861)))))

(assert (=> d!146805 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774862)))

(declare-fun b!1367127 () Bool)

(assert (=> b!1367127 (= e!774862 e!774864)))

(declare-fun res!910653 () Bool)

(assert (=> b!1367127 (=> (not res!910653) (not e!774864))))

(assert (=> b!1367127 (= res!910653 (not e!774863))))

(declare-fun res!910651 () Bool)

(assert (=> b!1367127 (=> (not res!910651) (not e!774863))))

(assert (=> b!1367127 (= res!910651 (validKeyInArray!0 (select (arr!44843 a!3861) from!3239)))))

(assert (= (and d!146805 (not res!910652)) b!1367127))

(assert (= (and b!1367127 res!910651) b!1367123))

(assert (= (and b!1367127 res!910653) b!1367124))

(assert (= (and b!1367124 c!127676) b!1367125))

(assert (= (and b!1367124 (not c!127676)) b!1367126))

(assert (= (or b!1367125 b!1367126) bm!65480))

(assert (=> b!1367123 m!1251153))

