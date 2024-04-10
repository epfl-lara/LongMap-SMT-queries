; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115632 () Bool)

(assert start!115632)

(declare-fun b!1367496 () Bool)

(declare-fun res!911022 () Bool)

(declare-fun e!774971 () Bool)

(assert (=> b!1367496 (=> (not res!911022) (not e!774971))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92863 0))(
  ( (array!92864 (arr!44857 (Array (_ BitVec 32) (_ BitVec 64))) (size!45407 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92863)

(assert (=> b!1367496 (= res!911022 (bvslt from!3239 (size!45407 a!3861)))))

(declare-fun b!1367497 () Bool)

(declare-fun res!911028 () Bool)

(declare-fun e!774973 () Bool)

(assert (=> b!1367497 (=> (not res!911028) (not e!774973))))

(declare-datatypes ((List!31925 0))(
  ( (Nil!31922) (Cons!31921 (h!33130 (_ BitVec 64)) (t!46619 List!31925)) )
))
(declare-fun acc!866 () List!31925)

(declare-fun contains!9607 (List!31925 (_ BitVec 64)) Bool)

(assert (=> b!1367497 (= res!911028 (not (contains!9607 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911029 () Bool)

(assert (=> start!115632 (=> (not res!911029) (not e!774973))))

(assert (=> start!115632 (= res!911029 (and (bvslt (size!45407 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45407 a!3861))))))

(assert (=> start!115632 e!774973))

(declare-fun array_inv!33885 (array!92863) Bool)

(assert (=> start!115632 (array_inv!33885 a!3861)))

(assert (=> start!115632 true))

(declare-fun b!1367498 () Bool)

(declare-fun newAcc!98 () List!31925)

(declare-fun noDuplicate!2464 (List!31925) Bool)

(assert (=> b!1367498 (= e!774971 (not (noDuplicate!2464 newAcc!98)))))

(declare-fun b!1367499 () Bool)

(declare-fun res!911025 () Bool)

(assert (=> b!1367499 (=> (not res!911025) (not e!774973))))

(assert (=> b!1367499 (= res!911025 (not (contains!9607 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367500 () Bool)

(assert (=> b!1367500 (= e!774973 e!774971)))

(declare-fun res!911030 () Bool)

(assert (=> b!1367500 (=> (not res!911030) (not e!774971))))

(declare-fun arrayNoDuplicates!0 (array!92863 (_ BitVec 32) List!31925) Bool)

(assert (=> b!1367500 (= res!911030 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45151 0))(
  ( (Unit!45152) )
))
(declare-fun lt!601894 () Unit!45151)

(declare-fun noDuplicateSubseq!196 (List!31925 List!31925) Unit!45151)

(assert (=> b!1367500 (= lt!601894 (noDuplicateSubseq!196 newAcc!98 acc!866))))

(declare-fun b!1367501 () Bool)

(declare-fun res!911032 () Bool)

(assert (=> b!1367501 (=> (not res!911032) (not e!774973))))

(assert (=> b!1367501 (= res!911032 (not (contains!9607 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367502 () Bool)

(declare-fun res!911027 () Bool)

(assert (=> b!1367502 (=> (not res!911027) (not e!774973))))

(assert (=> b!1367502 (= res!911027 (noDuplicate!2464 acc!866))))

(declare-fun b!1367503 () Bool)

(declare-fun res!911031 () Bool)

(assert (=> b!1367503 (=> (not res!911031) (not e!774973))))

(declare-fun subseq!1009 (List!31925 List!31925) Bool)

(assert (=> b!1367503 (= res!911031 (subseq!1009 newAcc!98 acc!866))))

(declare-fun b!1367504 () Bool)

(declare-fun res!911024 () Bool)

(assert (=> b!1367504 (=> (not res!911024) (not e!774971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367504 (= res!911024 (validKeyInArray!0 (select (arr!44857 a!3861) from!3239)))))

(declare-fun b!1367505 () Bool)

(declare-fun res!911026 () Bool)

(assert (=> b!1367505 (=> (not res!911026) (not e!774973))))

(assert (=> b!1367505 (= res!911026 (not (contains!9607 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367506 () Bool)

(declare-fun res!911023 () Bool)

(assert (=> b!1367506 (=> (not res!911023) (not e!774971))))

(assert (=> b!1367506 (= res!911023 (contains!9607 acc!866 (select (arr!44857 a!3861) from!3239)))))

(assert (= (and start!115632 res!911029) b!1367502))

(assert (= (and b!1367502 res!911027) b!1367497))

(assert (= (and b!1367497 res!911028) b!1367505))

(assert (= (and b!1367505 res!911026) b!1367499))

(assert (= (and b!1367499 res!911025) b!1367501))

(assert (= (and b!1367501 res!911032) b!1367503))

(assert (= (and b!1367503 res!911031) b!1367500))

(assert (= (and b!1367500 res!911030) b!1367496))

(assert (= (and b!1367496 res!911022) b!1367504))

(assert (= (and b!1367504 res!911024) b!1367506))

(assert (= (and b!1367506 res!911023) b!1367498))

(declare-fun m!1251707 () Bool)

(assert (=> b!1367502 m!1251707))

(declare-fun m!1251709 () Bool)

(assert (=> b!1367498 m!1251709))

(declare-fun m!1251711 () Bool)

(assert (=> b!1367499 m!1251711))

(declare-fun m!1251713 () Bool)

(assert (=> b!1367501 m!1251713))

(declare-fun m!1251715 () Bool)

(assert (=> b!1367506 m!1251715))

(assert (=> b!1367506 m!1251715))

(declare-fun m!1251717 () Bool)

(assert (=> b!1367506 m!1251717))

(declare-fun m!1251719 () Bool)

(assert (=> b!1367497 m!1251719))

(assert (=> b!1367504 m!1251715))

(assert (=> b!1367504 m!1251715))

(declare-fun m!1251721 () Bool)

(assert (=> b!1367504 m!1251721))

(declare-fun m!1251723 () Bool)

(assert (=> start!115632 m!1251723))

(declare-fun m!1251725 () Bool)

(assert (=> b!1367505 m!1251725))

(declare-fun m!1251727 () Bool)

(assert (=> b!1367500 m!1251727))

(declare-fun m!1251729 () Bool)

(assert (=> b!1367500 m!1251729))

(declare-fun m!1251731 () Bool)

(assert (=> b!1367503 m!1251731))

(push 1)

(assert (not b!1367499))

(assert (not b!1367503))

(assert (not b!1367497))

(assert (not start!115632))

(assert (not b!1367504))

(assert (not b!1367500))

(assert (not b!1367502))

(assert (not b!1367498))

(assert (not b!1367506))

(assert (not b!1367501))

(assert (not b!1367505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1367539 () Bool)

(declare-fun e!775005 () Bool)

(declare-fun e!775004 () Bool)

(assert (=> b!1367539 (= e!775005 e!775004)))

(declare-fun res!911060 () Bool)

(assert (=> b!1367539 (=> (not res!911060) (not e!775004))))

(declare-fun e!775007 () Bool)

(assert (=> b!1367539 (= res!911060 (not e!775007))))

(declare-fun res!911061 () Bool)

(assert (=> b!1367539 (=> (not res!911061) (not e!775007))))

(assert (=> b!1367539 (= res!911061 (validKeyInArray!0 (select (arr!44857 a!3861) from!3239)))))

(declare-fun b!1367540 () Bool)

(assert (=> b!1367540 (= e!775007 (contains!9607 acc!866 (select (arr!44857 a!3861) from!3239)))))

(declare-fun b!1367541 () Bool)

(declare-fun e!775006 () Bool)

(assert (=> b!1367541 (= e!775004 e!775006)))

(declare-fun c!127681 () Bool)

(assert (=> b!1367541 (= c!127681 (validKeyInArray!0 (select (arr!44857 a!3861) from!3239)))))

(declare-fun bm!65485 () Bool)

(declare-fun call!65488 () Bool)

(assert (=> bm!65485 (= call!65488 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127681 (Cons!31921 (select (arr!44857 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1367543 () Bool)

(assert (=> b!1367543 (= e!775006 call!65488)))

(declare-fun b!1367542 () Bool)

(assert (=> b!1367542 (= e!775006 call!65488)))

(declare-fun d!146827 () Bool)

(declare-fun res!911059 () Bool)

(assert (=> d!146827 (=> res!911059 e!775005)))

(assert (=> d!146827 (= res!911059 (bvsge from!3239 (size!45407 a!3861)))))

(assert (=> d!146827 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775005)))

(assert (= (and d!146827 (not res!911059)) b!1367539))

(assert (= (and b!1367539 res!911061) b!1367540))

(assert (= (and b!1367539 res!911060) b!1367541))

(assert (= (and b!1367541 c!127681) b!1367542))

(assert (= (and b!1367541 (not c!127681)) b!1367543))

(assert (= (or b!1367542 b!1367543) bm!65485))

(assert (=> b!1367539 m!1251715))

(assert (=> b!1367539 m!1251715))

(assert (=> b!1367539 m!1251721))

(assert (=> b!1367540 m!1251715))

(assert (=> b!1367540 m!1251715))

(assert (=> b!1367540 m!1251717))

(assert (=> b!1367541 m!1251715))

(assert (=> b!1367541 m!1251715))

(assert (=> b!1367541 m!1251721))

(assert (=> bm!65485 m!1251715))

(declare-fun m!1251745 () Bool)

(assert (=> bm!65485 m!1251745))

(assert (=> b!1367500 d!146827))

(declare-fun d!146833 () Bool)

(assert (=> d!146833 (noDuplicate!2464 newAcc!98)))

(declare-fun lt!601901 () Unit!45151)

(declare-fun choose!1997 (List!31925 List!31925) Unit!45151)

(assert (=> d!146833 (= lt!601901 (choose!1997 newAcc!98 acc!866))))

(declare-fun e!775020 () Bool)

(assert (=> d!146833 e!775020))

(declare-fun res!911073 () Bool)

(assert (=> d!146833 (=> (not res!911073) (not e!775020))))

(assert (=> d!146833 (= res!911073 (subseq!1009 newAcc!98 acc!866))))

(assert (=> d!146833 (= (noDuplicateSubseq!196 newAcc!98 acc!866) lt!601901)))

(declare-fun b!1367559 () Bool)

(assert (=> b!1367559 (= e!775020 (noDuplicate!2464 acc!866))))

(assert (= (and d!146833 res!911073) b!1367559))

(assert (=> d!146833 m!1251709))

(declare-fun m!1251753 () Bool)

(assert (=> d!146833 m!1251753))

(assert (=> d!146833 m!1251731))

(assert (=> b!1367559 m!1251707))

(assert (=> b!1367500 d!146833))

(declare-fun d!146839 () Bool)

(declare-fun lt!601908 () Bool)

(declare-fun content!718 (List!31925) (Set (_ BitVec 64)))

(assert (=> d!146839 (= lt!601908 (member (select (arr!44857 a!3861) from!3239) (content!718 acc!866)))))

(declare-fun e!775032 () Bool)

(assert (=> d!146839 (= lt!601908 e!775032)))

(declare-fun res!911085 () Bool)

(assert (=> d!146839 (=> (not res!911085) (not e!775032))))

(assert (=> d!146839 (= res!911085 (is-Cons!31921 acc!866))))

(assert (=> d!146839 (= (contains!9607 acc!866 (select (arr!44857 a!3861) from!3239)) lt!601908)))

(declare-fun b!1367570 () Bool)

(declare-fun e!775031 () Bool)

(assert (=> b!1367570 (= e!775032 e!775031)))

(declare-fun res!911084 () Bool)

(assert (=> b!1367570 (=> res!911084 e!775031)))

(assert (=> b!1367570 (= res!911084 (= (h!33130 acc!866) (select (arr!44857 a!3861) from!3239)))))

(declare-fun b!1367571 () Bool)

(assert (=> b!1367571 (= e!775031 (contains!9607 (t!46619 acc!866) (select (arr!44857 a!3861) from!3239)))))

(assert (= (and d!146839 res!911085) b!1367570))

(assert (= (and b!1367570 (not res!911084)) b!1367571))

(declare-fun m!1251755 () Bool)

(assert (=> d!146839 m!1251755))

(assert (=> d!146839 m!1251715))

(declare-fun m!1251757 () Bool)

(assert (=> d!146839 m!1251757))

(assert (=> b!1367571 m!1251715))

(declare-fun m!1251759 () Bool)

(assert (=> b!1367571 m!1251759))

(assert (=> b!1367506 d!146839))

(declare-fun d!146841 () Bool)

(declare-fun lt!601909 () Bool)

(assert (=> d!146841 (= lt!601909 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!718 newAcc!98)))))

(declare-fun e!775034 () Bool)

(assert (=> d!146841 (= lt!601909 e!775034)))

(declare-fun res!911087 () Bool)

(assert (=> d!146841 (=> (not res!911087) (not e!775034))))

(assert (=> d!146841 (= res!911087 (is-Cons!31921 newAcc!98))))

(assert (=> d!146841 (= (contains!9607 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601909)))

(declare-fun b!1367572 () Bool)

(declare-fun e!775033 () Bool)

(assert (=> b!1367572 (= e!775034 e!775033)))

(declare-fun res!911086 () Bool)

(assert (=> b!1367572 (=> res!911086 e!775033)))

(assert (=> b!1367572 (= res!911086 (= (h!33130 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367573 () Bool)

(assert (=> b!1367573 (= e!775033 (contains!9607 (t!46619 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146841 res!911087) b!1367572))

(assert (= (and b!1367572 (not res!911086)) b!1367573))

(declare-fun m!1251761 () Bool)

(assert (=> d!146841 m!1251761))

(declare-fun m!1251763 () Bool)

(assert (=> d!146841 m!1251763))

(declare-fun m!1251765 () Bool)

(assert (=> b!1367573 m!1251765))

(assert (=> b!1367501 d!146841))

(declare-fun d!146843 () Bool)

(assert (=> d!146843 (= (validKeyInArray!0 (select (arr!44857 a!3861) from!3239)) (and (not (= (select (arr!44857 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44857 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1367504 d!146843))

(declare-fun d!146849 () Bool)

(declare-fun lt!601912 () Bool)

(assert (=> d!146849 (= lt!601912 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!718 newAcc!98)))))

(declare-fun e!775039 () Bool)

(assert (=> d!146849 (= lt!601912 e!775039)))

(declare-fun res!911092 () Bool)

(assert (=> d!146849 (=> (not res!911092) (not e!775039))))

(assert (=> d!146849 (= res!911092 (is-Cons!31921 newAcc!98))))

(assert (=> d!146849 (= (contains!9607 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601912)))

(declare-fun b!1367577 () Bool)

(declare-fun e!775038 () Bool)

(assert (=> b!1367577 (= e!775039 e!775038)))

(declare-fun res!911091 () Bool)

(assert (=> b!1367577 (=> res!911091 e!775038)))

(assert (=> b!1367577 (= res!911091 (= (h!33130 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367578 () Bool)

(assert (=> b!1367578 (= e!775038 (contains!9607 (t!46619 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146849 res!911092) b!1367577))

(assert (= (and b!1367577 (not res!911091)) b!1367578))

(assert (=> d!146849 m!1251761))

(declare-fun m!1251775 () Bool)

(assert (=> d!146849 m!1251775))

(declare-fun m!1251777 () Bool)

(assert (=> b!1367578 m!1251777))

(assert (=> b!1367499 d!146849))

(declare-fun d!146851 () Bool)

(declare-fun lt!601913 () Bool)

(assert (=> d!146851 (= lt!601913 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!718 acc!866)))))

(declare-fun e!775041 () Bool)

(assert (=> d!146851 (= lt!601913 e!775041)))

(declare-fun res!911094 () Bool)

(assert (=> d!146851 (=> (not res!911094) (not e!775041))))

(assert (=> d!146851 (= res!911094 (is-Cons!31921 acc!866))))

(assert (=> d!146851 (= (contains!9607 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601913)))

(declare-fun b!1367579 () Bool)

(declare-fun e!775040 () Bool)

(assert (=> b!1367579 (= e!775041 e!775040)))

(declare-fun res!911093 () Bool)

(assert (=> b!1367579 (=> res!911093 e!775040)))

(assert (=> b!1367579 (= res!911093 (= (h!33130 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367580 () Bool)

(assert (=> b!1367580 (= e!775040 (contains!9607 (t!46619 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146851 res!911094) b!1367579))

(assert (= (and b!1367579 (not res!911093)) b!1367580))

(assert (=> d!146851 m!1251755))

(declare-fun m!1251779 () Bool)

(assert (=> d!146851 m!1251779))

(declare-fun m!1251781 () Bool)

(assert (=> b!1367580 m!1251781))

(assert (=> b!1367505 d!146851))

(declare-fun d!146855 () Bool)

(assert (=> d!146855 (= (array_inv!33885 a!3861) (bvsge (size!45407 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115632 d!146855))

(declare-fun b!1367606 () Bool)

(declare-fun e!775066 () Bool)

(declare-fun e!775069 () Bool)

(assert (=> b!1367606 (= e!775066 e!775069)))

(declare-fun res!911122 () Bool)

(assert (=> b!1367606 (=> res!911122 e!775069)))

(declare-fun e!775068 () Bool)

(assert (=> b!1367606 (= res!911122 e!775068)))

(declare-fun res!911119 () Bool)

(assert (=> b!1367606 (=> (not res!911119) (not e!775068))))

(assert (=> b!1367606 (= res!911119 (= (h!33130 newAcc!98) (h!33130 acc!866)))))

(declare-fun b!1367607 () Bool)

(assert (=> b!1367607 (= e!775068 (subseq!1009 (t!46619 newAcc!98) (t!46619 acc!866)))))

(declare-fun b!1367608 () Bool)

(assert (=> b!1367608 (= e!775069 (subseq!1009 newAcc!98 (t!46619 acc!866)))))

(declare-fun b!1367605 () Bool)

(declare-fun e!775067 () Bool)

(assert (=> b!1367605 (= e!775067 e!775066)))

(declare-fun res!911120 () Bool)

(assert (=> b!1367605 (=> (not res!911120) (not e!775066))))

(assert (=> b!1367605 (= res!911120 (is-Cons!31921 acc!866))))

(declare-fun d!146859 () Bool)

(declare-fun res!911121 () Bool)

(assert (=> d!146859 (=> res!911121 e!775067)))

(assert (=> d!146859 (= res!911121 (is-Nil!31922 newAcc!98))))

(assert (=> d!146859 (= (subseq!1009 newAcc!98 acc!866) e!775067)))

(assert (= (and d!146859 (not res!911121)) b!1367605))

(assert (= (and b!1367605 res!911120) b!1367606))

(assert (= (and b!1367606 res!911119) b!1367607))

(assert (= (and b!1367606 (not res!911122)) b!1367608))

(declare-fun m!1251805 () Bool)

(assert (=> b!1367607 m!1251805))

(declare-fun m!1251809 () Bool)

(assert (=> b!1367608 m!1251809))

(assert (=> b!1367503 d!146859))

(declare-fun d!146871 () Bool)

(declare-fun res!911137 () Bool)

(declare-fun e!775086 () Bool)

(assert (=> d!146871 (=> res!911137 e!775086)))

(assert (=> d!146871 (= res!911137 (is-Nil!31922 newAcc!98))))

(assert (=> d!146871 (= (noDuplicate!2464 newAcc!98) e!775086)))

(declare-fun b!1367627 () Bool)

(declare-fun e!775087 () Bool)

(assert (=> b!1367627 (= e!775086 e!775087)))

(declare-fun res!911138 () Bool)

(assert (=> b!1367627 (=> (not res!911138) (not e!775087))))

(assert (=> b!1367627 (= res!911138 (not (contains!9607 (t!46619 newAcc!98) (h!33130 newAcc!98))))))

(declare-fun b!1367628 () Bool)

(assert (=> b!1367628 (= e!775087 (noDuplicate!2464 (t!46619 newAcc!98)))))

(assert (= (and d!146871 (not res!911137)) b!1367627))

(assert (= (and b!1367627 res!911138) b!1367628))

(declare-fun m!1251821 () Bool)

(assert (=> b!1367627 m!1251821))

(declare-fun m!1251823 () Bool)

(assert (=> b!1367628 m!1251823))

(assert (=> b!1367498 d!146871))

(declare-fun d!146879 () Bool)

(declare-fun res!911139 () Bool)

(declare-fun e!775088 () Bool)

(assert (=> d!146879 (=> res!911139 e!775088)))

(assert (=> d!146879 (= res!911139 (is-Nil!31922 acc!866))))

(assert (=> d!146879 (= (noDuplicate!2464 acc!866) e!775088)))

(declare-fun b!1367629 () Bool)

(declare-fun e!775089 () Bool)

(assert (=> b!1367629 (= e!775088 e!775089)))

(declare-fun res!911140 () Bool)

(assert (=> b!1367629 (=> (not res!911140) (not e!775089))))

(assert (=> b!1367629 (= res!911140 (not (contains!9607 (t!46619 acc!866) (h!33130 acc!866))))))

(declare-fun b!1367630 () Bool)

(assert (=> b!1367630 (= e!775089 (noDuplicate!2464 (t!46619 acc!866)))))

(assert (= (and d!146879 (not res!911139)) b!1367629))

(assert (= (and b!1367629 res!911140) b!1367630))

(declare-fun m!1251825 () Bool)

(assert (=> b!1367629 m!1251825))

(declare-fun m!1251827 () Bool)

(assert (=> b!1367630 m!1251827))

(assert (=> b!1367502 d!146879))

(declare-fun d!146881 () Bool)

(declare-fun lt!601920 () Bool)

(assert (=> d!146881 (= lt!601920 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!718 acc!866)))))

(declare-fun e!775091 () Bool)

(assert (=> d!146881 (= lt!601920 e!775091)))

(declare-fun res!911142 () Bool)

(assert (=> d!146881 (=> (not res!911142) (not e!775091))))

(assert (=> d!146881 (= res!911142 (is-Cons!31921 acc!866))))

(assert (=> d!146881 (= (contains!9607 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601920)))

(declare-fun b!1367631 () Bool)

(declare-fun e!775090 () Bool)

