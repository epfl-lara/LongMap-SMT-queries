; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114356 () Bool)

(assert start!114356)

(declare-fun b!1357839 () Bool)

(declare-fun res!902553 () Bool)

(declare-fun e!770638 () Bool)

(assert (=> b!1357839 (=> (not res!902553) (not e!770638))))

(declare-datatypes ((array!92448 0))(
  ( (array!92449 (arr!44669 (Array (_ BitVec 32) (_ BitVec 64))) (size!45219 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92448)

(declare-datatypes ((List!31710 0))(
  ( (Nil!31707) (Cons!31706 (h!32915 (_ BitVec 64)) (t!46374 List!31710)) )
))
(declare-fun arrayNoDuplicates!0 (array!92448 (_ BitVec 32) List!31710) Bool)

(assert (=> b!1357839 (= res!902553 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31707))))

(declare-fun b!1357840 () Bool)

(declare-fun res!902547 () Bool)

(assert (=> b!1357840 (=> (not res!902547) (not e!770638))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357840 (= res!902547 (validKeyInArray!0 (select (arr!44669 a!3742) from!3120)))))

(declare-fun b!1357841 () Bool)

(declare-fun res!902551 () Bool)

(declare-fun e!770637 () Bool)

(assert (=> b!1357841 (=> res!902551 e!770637)))

(declare-fun lt!599233 () List!31710)

(declare-fun contains!9419 (List!31710 (_ BitVec 64)) Bool)

(assert (=> b!1357841 (= res!902551 (contains!9419 lt!599233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357842 () Bool)

(declare-fun res!902552 () Bool)

(assert (=> b!1357842 (=> (not res!902552) (not e!770638))))

(assert (=> b!1357842 (= res!902552 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45219 a!3742)))))

(declare-fun b!1357843 () Bool)

(declare-fun res!902556 () Bool)

(assert (=> b!1357843 (=> (not res!902556) (not e!770638))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357843 (= res!902556 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357844 () Bool)

(assert (=> b!1357844 (= e!770638 (not e!770637))))

(declare-fun res!902560 () Bool)

(assert (=> b!1357844 (=> res!902560 e!770637)))

(assert (=> b!1357844 (= res!902560 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31710)

(declare-fun $colon$colon!824 (List!31710 (_ BitVec 64)) List!31710)

(assert (=> b!1357844 (= lt!599233 ($colon$colon!824 acc!759 (select (arr!44669 a!3742) from!3120)))))

(declare-fun subseq!821 (List!31710 List!31710) Bool)

(assert (=> b!1357844 (subseq!821 acc!759 acc!759)))

(declare-datatypes ((Unit!44673 0))(
  ( (Unit!44674) )
))
(declare-fun lt!599232 () Unit!44673)

(declare-fun lemmaListSubSeqRefl!0 (List!31710) Unit!44673)

(assert (=> b!1357844 (= lt!599232 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357845 () Bool)

(declare-fun res!902555 () Bool)

(assert (=> b!1357845 (=> (not res!902555) (not e!770638))))

(assert (=> b!1357845 (= res!902555 (not (contains!9419 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357846 () Bool)

(declare-fun res!902550 () Bool)

(assert (=> b!1357846 (=> (not res!902550) (not e!770638))))

(assert (=> b!1357846 (= res!902550 (not (contains!9419 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357847 () Bool)

(declare-fun res!902548 () Bool)

(assert (=> b!1357847 (=> (not res!902548) (not e!770638))))

(assert (=> b!1357847 (= res!902548 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!902554 () Bool)

(assert (=> start!114356 (=> (not res!902554) (not e!770638))))

(assert (=> start!114356 (= res!902554 (and (bvslt (size!45219 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45219 a!3742))))))

(assert (=> start!114356 e!770638))

(assert (=> start!114356 true))

(declare-fun array_inv!33697 (array!92448) Bool)

(assert (=> start!114356 (array_inv!33697 a!3742)))

(declare-fun b!1357848 () Bool)

(declare-fun res!902559 () Bool)

(assert (=> b!1357848 (=> (not res!902559) (not e!770638))))

(declare-fun noDuplicate!2276 (List!31710) Bool)

(assert (=> b!1357848 (= res!902559 (noDuplicate!2276 acc!759))))

(declare-fun b!1357849 () Bool)

(assert (=> b!1357849 (= e!770637 (subseq!821 acc!759 lt!599233))))

(declare-fun b!1357850 () Bool)

(declare-fun res!902549 () Bool)

(assert (=> b!1357850 (=> res!902549 e!770637)))

(assert (=> b!1357850 (= res!902549 (contains!9419 lt!599233 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357851 () Bool)

(declare-fun res!902557 () Bool)

(assert (=> b!1357851 (=> (not res!902557) (not e!770638))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357851 (= res!902557 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45219 a!3742))))))

(declare-fun b!1357852 () Bool)

(declare-fun res!902558 () Bool)

(assert (=> b!1357852 (=> res!902558 e!770637)))

(assert (=> b!1357852 (= res!902558 (not (noDuplicate!2276 lt!599233)))))

(assert (= (and start!114356 res!902554) b!1357848))

(assert (= (and b!1357848 res!902559) b!1357845))

(assert (= (and b!1357845 res!902555) b!1357846))

(assert (= (and b!1357846 res!902550) b!1357839))

(assert (= (and b!1357839 res!902553) b!1357847))

(assert (= (and b!1357847 res!902548) b!1357851))

(assert (= (and b!1357851 res!902557) b!1357843))

(assert (= (and b!1357843 res!902556) b!1357842))

(assert (= (and b!1357842 res!902552) b!1357840))

(assert (= (and b!1357840 res!902547) b!1357844))

(assert (= (and b!1357844 (not res!902560)) b!1357852))

(assert (= (and b!1357852 (not res!902558)) b!1357841))

(assert (= (and b!1357841 (not res!902551)) b!1357850))

(assert (= (and b!1357850 (not res!902549)) b!1357849))

(declare-fun m!1243501 () Bool)

(assert (=> start!114356 m!1243501))

(declare-fun m!1243503 () Bool)

(assert (=> b!1357846 m!1243503))

(declare-fun m!1243505 () Bool)

(assert (=> b!1357849 m!1243505))

(declare-fun m!1243507 () Bool)

(assert (=> b!1357841 m!1243507))

(declare-fun m!1243509 () Bool)

(assert (=> b!1357843 m!1243509))

(declare-fun m!1243511 () Bool)

(assert (=> b!1357845 m!1243511))

(declare-fun m!1243513 () Bool)

(assert (=> b!1357852 m!1243513))

(declare-fun m!1243515 () Bool)

(assert (=> b!1357847 m!1243515))

(declare-fun m!1243517 () Bool)

(assert (=> b!1357839 m!1243517))

(declare-fun m!1243519 () Bool)

(assert (=> b!1357844 m!1243519))

(assert (=> b!1357844 m!1243519))

(declare-fun m!1243521 () Bool)

(assert (=> b!1357844 m!1243521))

(declare-fun m!1243523 () Bool)

(assert (=> b!1357844 m!1243523))

(declare-fun m!1243525 () Bool)

(assert (=> b!1357844 m!1243525))

(declare-fun m!1243527 () Bool)

(assert (=> b!1357848 m!1243527))

(declare-fun m!1243529 () Bool)

(assert (=> b!1357850 m!1243529))

(assert (=> b!1357840 m!1243519))

(assert (=> b!1357840 m!1243519))

(declare-fun m!1243531 () Bool)

(assert (=> b!1357840 m!1243531))

(push 1)

(assert (not b!1357850))

(assert (not start!114356))

(assert (not b!1357846))

(assert (not b!1357840))

(assert (not b!1357841))

(assert (not b!1357849))

(assert (not b!1357844))

(assert (not b!1357847))

(assert (not b!1357839))

(assert (not b!1357843))

(assert (not b!1357852))

(assert (not b!1357848))

(assert (not b!1357845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145253 () Bool)

(assert (=> d!145253 (= ($colon$colon!824 acc!759 (select (arr!44669 a!3742) from!3120)) (Cons!31706 (select (arr!44669 a!3742) from!3120) acc!759))))

(assert (=> b!1357844 d!145253))

(declare-fun d!145255 () Bool)

(declare-fun res!902677 () Bool)

(declare-fun e!770690 () Bool)

(assert (=> d!145255 (=> res!902677 e!770690)))

(assert (=> d!145255 (= res!902677 (is-Nil!31707 acc!759))))

(assert (=> d!145255 (= (subseq!821 acc!759 acc!759) e!770690)))

(declare-fun b!1357969 () Bool)

(declare-fun e!770691 () Bool)

(assert (=> b!1357969 (= e!770690 e!770691)))

(declare-fun res!902680 () Bool)

(assert (=> b!1357969 (=> (not res!902680) (not e!770691))))

(assert (=> b!1357969 (= res!902680 (is-Cons!31706 acc!759))))

(declare-fun b!1357970 () Bool)

(declare-fun e!770689 () Bool)

(assert (=> b!1357970 (= e!770691 e!770689)))

(declare-fun res!902679 () Bool)

(assert (=> b!1357970 (=> res!902679 e!770689)))

(declare-fun e!770692 () Bool)

(assert (=> b!1357970 (= res!902679 e!770692)))

(declare-fun res!902678 () Bool)

(assert (=> b!1357970 (=> (not res!902678) (not e!770692))))

(assert (=> b!1357970 (= res!902678 (= (h!32915 acc!759) (h!32915 acc!759)))))

(declare-fun b!1357971 () Bool)

(assert (=> b!1357971 (= e!770692 (subseq!821 (t!46374 acc!759) (t!46374 acc!759)))))

(declare-fun b!1357972 () Bool)

(assert (=> b!1357972 (= e!770689 (subseq!821 acc!759 (t!46374 acc!759)))))

(assert (= (and d!145255 (not res!902677)) b!1357969))

(assert (= (and b!1357969 res!902680) b!1357970))

(assert (= (and b!1357970 res!902678) b!1357971))

(assert (= (and b!1357970 (not res!902679)) b!1357972))

(declare-fun m!1243621 () Bool)

(assert (=> b!1357971 m!1243621))

(declare-fun m!1243623 () Bool)

(assert (=> b!1357972 m!1243623))

(assert (=> b!1357844 d!145255))

(declare-fun d!145265 () Bool)

(assert (=> d!145265 (subseq!821 acc!759 acc!759)))

(declare-fun lt!599254 () Unit!44673)

(declare-fun choose!36 (List!31710) Unit!44673)

(assert (=> d!145265 (= lt!599254 (choose!36 acc!759))))

(assert (=> d!145265 (= (lemmaListSubSeqRefl!0 acc!759) lt!599254)))

(declare-fun bs!38943 () Bool)

(assert (= bs!38943 d!145265))

(assert (=> bs!38943 m!1243523))

(declare-fun m!1243625 () Bool)

(assert (=> bs!38943 m!1243625))

(assert (=> b!1357844 d!145265))

(declare-fun d!145267 () Bool)

(declare-fun lt!599257 () Bool)

(declare-fun content!680 (List!31710) (Set (_ BitVec 64)))

(assert (=> d!145267 (= lt!599257 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!680 acc!759)))))

(declare-fun e!770708 () Bool)

(assert (=> d!145267 (= lt!599257 e!770708)))

(declare-fun res!902695 () Bool)

(assert (=> d!145267 (=> (not res!902695) (not e!770708))))

(assert (=> d!145267 (= res!902695 (is-Cons!31706 acc!759))))

(assert (=> d!145267 (= (contains!9419 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599257)))

(declare-fun b!1357987 () Bool)

(declare-fun e!770707 () Bool)

(assert (=> b!1357987 (= e!770708 e!770707)))

(declare-fun res!902696 () Bool)

(assert (=> b!1357987 (=> res!902696 e!770707)))

(assert (=> b!1357987 (= res!902696 (= (h!32915 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357988 () Bool)

(assert (=> b!1357988 (= e!770707 (contains!9419 (t!46374 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145267 res!902695) b!1357987))

(assert (= (and b!1357987 (not res!902696)) b!1357988))

(declare-fun m!1243635 () Bool)

(assert (=> d!145267 m!1243635))

(declare-fun m!1243637 () Bool)

(assert (=> d!145267 m!1243637))

(declare-fun m!1243639 () Bool)

(assert (=> b!1357988 m!1243639))

(assert (=> b!1357845 d!145267))

(declare-fun d!145277 () Bool)

(assert (=> d!145277 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357843 d!145277))

(declare-fun b!1358030 () Bool)

(declare-fun e!770747 () Bool)

(declare-fun call!65270 () Bool)

(assert (=> b!1358030 (= e!770747 call!65270)))

(declare-fun b!1358031 () Bool)

(assert (=> b!1358031 (= e!770747 call!65270)))

(declare-fun b!1358032 () Bool)

(declare-fun e!770748 () Bool)

(declare-fun e!770745 () Bool)

(assert (=> b!1358032 (= e!770748 e!770745)))

(declare-fun res!902728 () Bool)

(assert (=> b!1358032 (=> (not res!902728) (not e!770745))))

(declare-fun e!770746 () Bool)

(assert (=> b!1358032 (= res!902728 (not e!770746))))

(declare-fun res!902730 () Bool)

(assert (=> b!1358032 (=> (not res!902730) (not e!770746))))

(assert (=> b!1358032 (= res!902730 (validKeyInArray!0 (select (arr!44669 a!3742) from!3120)))))

(declare-fun b!1358033 () Bool)

(assert (=> b!1358033 (= e!770746 (contains!9419 acc!759 (select (arr!44669 a!3742) from!3120)))))

(declare-fun b!1358034 () Bool)

(assert (=> b!1358034 (= e!770745 e!770747)))

(declare-fun c!127091 () Bool)

(assert (=> b!1358034 (= c!127091 (validKeyInArray!0 (select (arr!44669 a!3742) from!3120)))))

(declare-fun bm!65267 () Bool)

(assert (=> bm!65267 (= call!65270 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127091 (Cons!31706 (select (arr!44669 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!145281 () Bool)

(declare-fun res!902729 () Bool)

(assert (=> d!145281 (=> res!902729 e!770748)))

(assert (=> d!145281 (= res!902729 (bvsge from!3120 (size!45219 a!3742)))))

(assert (=> d!145281 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770748)))

(assert (= (and d!145281 (not res!902729)) b!1358032))

(assert (= (and b!1358032 res!902730) b!1358033))

(assert (= (and b!1358032 res!902728) b!1358034))

(assert (= (and b!1358034 c!127091) b!1358030))

(assert (= (and b!1358034 (not c!127091)) b!1358031))

(assert (= (or b!1358030 b!1358031) bm!65267))

(assert (=> b!1358032 m!1243519))

(assert (=> b!1358032 m!1243519))

(assert (=> b!1358032 m!1243531))

(assert (=> b!1358033 m!1243519))

(assert (=> b!1358033 m!1243519))

(declare-fun m!1243659 () Bool)

(assert (=> b!1358033 m!1243659))

(assert (=> b!1358034 m!1243519))

(assert (=> b!1358034 m!1243519))

(assert (=> b!1358034 m!1243531))

(assert (=> bm!65267 m!1243519))

(declare-fun m!1243661 () Bool)

(assert (=> bm!65267 m!1243661))

(assert (=> b!1357847 d!145281))

(declare-fun d!145293 () Bool)

(declare-fun lt!599265 () Bool)

(assert (=> d!145293 (= lt!599265 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!680 acc!759)))))

(declare-fun e!770754 () Bool)

(assert (=> d!145293 (= lt!599265 e!770754)))

(declare-fun res!902735 () Bool)

(assert (=> d!145293 (=> (not res!902735) (not e!770754))))

(assert (=> d!145293 (= res!902735 (is-Cons!31706 acc!759))))

(assert (=> d!145293 (= (contains!9419 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599265)))

(declare-fun b!1358039 () Bool)

(declare-fun e!770753 () Bool)

(assert (=> b!1358039 (= e!770754 e!770753)))

(declare-fun res!902736 () Bool)

(assert (=> b!1358039 (=> res!902736 e!770753)))

(assert (=> b!1358039 (= res!902736 (= (h!32915 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358040 () Bool)

(assert (=> b!1358040 (= e!770753 (contains!9419 (t!46374 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145293 res!902735) b!1358039))

(assert (= (and b!1358039 (not res!902736)) b!1358040))

(assert (=> d!145293 m!1243635))

(declare-fun m!1243665 () Bool)

(assert (=> d!145293 m!1243665))

(declare-fun m!1243669 () Bool)

(assert (=> b!1358040 m!1243669))

(assert (=> b!1357846 d!145293))

(declare-fun b!1358046 () Bool)

(declare-fun e!770761 () Bool)

(declare-fun call!65272 () Bool)

(assert (=> b!1358046 (= e!770761 call!65272)))

(declare-fun b!1358047 () Bool)

(assert (=> b!1358047 (= e!770761 call!65272)))

(declare-fun b!1358048 () Bool)

(declare-fun e!770762 () Bool)

(declare-fun e!770759 () Bool)

(assert (=> b!1358048 (= e!770762 e!770759)))

(declare-fun res!902740 () Bool)

(assert (=> b!1358048 (=> (not res!902740) (not e!770759))))

(declare-fun e!770760 () Bool)

(assert (=> b!1358048 (= res!902740 (not e!770760))))

(declare-fun res!902742 () Bool)

(assert (=> b!1358048 (=> (not res!902742) (not e!770760))))

(assert (=> b!1358048 (= res!902742 (validKeyInArray!0 (select (arr!44669 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358049 () Bool)

(assert (=> b!1358049 (= e!770760 (contains!9419 Nil!31707 (select (arr!44669 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358050 () Bool)

(assert (=> b!1358050 (= e!770759 e!770761)))

(declare-fun c!127093 () Bool)

(assert (=> b!1358050 (= c!127093 (validKeyInArray!0 (select (arr!44669 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65269 () Bool)

(assert (=> bm!65269 (= call!65272 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127093 (Cons!31706 (select (arr!44669 a!3742) #b00000000000000000000000000000000) Nil!31707) Nil!31707)))))

(declare-fun d!145299 () Bool)

(declare-fun res!902741 () Bool)

(assert (=> d!145299 (=> res!902741 e!770762)))

(assert (=> d!145299 (= res!902741 (bvsge #b00000000000000000000000000000000 (size!45219 a!3742)))))

(assert (=> d!145299 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31707) e!770762)))

(assert (= (and d!145299 (not res!902741)) b!1358048))

(assert (= (and b!1358048 res!902742) b!1358049))

(assert (= (and b!1358048 res!902740) b!1358050))

(assert (= (and b!1358050 c!127093) b!1358046))

(assert (= (and b!1358050 (not c!127093)) b!1358047))

(assert (= (or b!1358046 b!1358047) bm!65269))

(declare-fun m!1243675 () Bool)

(assert (=> b!1358048 m!1243675))

(assert (=> b!1358048 m!1243675))

(declare-fun m!1243679 () Bool)

(assert (=> b!1358048 m!1243679))

(assert (=> b!1358049 m!1243675))

(assert (=> b!1358049 m!1243675))

(declare-fun m!1243681 () Bool)

(assert (=> b!1358049 m!1243681))

(assert (=> b!1358050 m!1243675))

(assert (=> b!1358050 m!1243675))

(assert (=> b!1358050 m!1243679))

(assert (=> bm!65269 m!1243675))

(declare-fun m!1243685 () Bool)

(assert (=> bm!65269 m!1243685))

(assert (=> b!1357839 d!145299))

(declare-fun d!145303 () Bool)

(declare-fun lt!599266 () Bool)

(assert (=> d!145303 (= lt!599266 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!680 lt!599233)))))

(declare-fun e!770766 () Bool)

(assert (=> d!145303 (= lt!599266 e!770766)))

(declare-fun res!902745 () Bool)

(assert (=> d!145303 (=> (not res!902745) (not e!770766))))

(assert (=> d!145303 (= res!902745 (is-Cons!31706 lt!599233))))

(assert (=> d!145303 (= (contains!9419 lt!599233 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599266)))

(declare-fun b!1358053 () Bool)

(declare-fun e!770765 () Bool)

(assert (=> b!1358053 (= e!770766 e!770765)))

(declare-fun res!902746 () Bool)

(assert (=> b!1358053 (=> res!902746 e!770765)))

(assert (=> b!1358053 (= res!902746 (= (h!32915 lt!599233) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358054 () Bool)

(assert (=> b!1358054 (= e!770765 (contains!9419 (t!46374 lt!599233) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145303 res!902745) b!1358053))

(assert (= (and b!1358053 (not res!902746)) b!1358054))

(declare-fun m!1243691 () Bool)

(assert (=> d!145303 m!1243691))

(declare-fun m!1243693 () Bool)

(assert (=> d!145303 m!1243693))

(declare-fun m!1243695 () Bool)

(assert (=> b!1358054 m!1243695))

(assert (=> b!1357850 d!145303))

(declare-fun d!145307 () Bool)

(declare-fun res!902757 () Bool)

(declare-fun e!770777 () Bool)

(assert (=> d!145307 (=> res!902757 e!770777)))

(assert (=> d!145307 (= res!902757 (is-Nil!31707 acc!759))))

(assert (=> d!145307 (= (noDuplicate!2276 acc!759) e!770777)))

(declare-fun b!1358065 () Bool)

(declare-fun e!770778 () Bool)

(assert (=> b!1358065 (= e!770777 e!770778)))

(declare-fun res!902758 () Bool)

(assert (=> b!1358065 (=> (not res!902758) (not e!770778))))

(assert (=> b!1358065 (= res!902758 (not (contains!9419 (t!46374 acc!759) (h!32915 acc!759))))))

(declare-fun b!1358066 () Bool)

(assert (=> b!1358066 (= e!770778 (noDuplicate!2276 (t!46374 acc!759)))))

(assert (= (and d!145307 (not res!902757)) b!1358065))

(assert (= (and b!1358065 res!902758) b!1358066))

(declare-fun m!1243701 () Bool)

(assert (=> b!1358065 m!1243701))

(declare-fun m!1243703 () Bool)

(assert (=> b!1358066 m!1243703))

(assert (=> b!1357848 d!145307))

(declare-fun d!145313 () Bool)

(assert (=> d!145313 (= (array_inv!33697 a!3742) (bvsge (size!45219 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114356 d!145313))

(declare-fun d!145315 () Bool)

(declare-fun res!902759 () Bool)

(declare-fun e!770780 () Bool)

(assert (=> d!145315 (=> res!902759 e!770780)))

(assert (=> d!145315 (= res!902759 (is-Nil!31707 acc!759))))

(assert (=> d!145315 (= (subseq!821 acc!759 lt!599233) e!770780)))

(declare-fun b!1358067 () Bool)

(declare-fun e!770781 () Bool)

(assert (=> b!1358067 (= e!770780 e!770781)))

(declare-fun res!902762 () Bool)

(assert (=> b!1358067 (=> (not res!902762) (not e!770781))))

(assert (=> b!1358067 (= res!902762 (is-Cons!31706 lt!599233))))

(declare-fun b!1358068 () Bool)

(declare-fun e!770779 () Bool)

(assert (=> b!1358068 (= e!770781 e!770779)))

(declare-fun res!902761 () Bool)

(assert (=> b!1358068 (=> res!902761 e!770779)))

(declare-fun e!770782 () Bool)

(assert (=> b!1358068 (= res!902761 e!770782)))

(declare-fun res!902760 () Bool)

(assert (=> b!1358068 (=> (not res!902760) (not e!770782))))

(assert (=> b!1358068 (= res!902760 (= (h!32915 acc!759) (h!32915 lt!599233)))))

(declare-fun b!1358069 () Bool)

(assert (=> b!1358069 (= e!770782 (subseq!821 (t!46374 acc!759) (t!46374 lt!599233)))))

(declare-fun b!1358070 () Bool)

(assert (=> b!1358070 (= e!770779 (subseq!821 acc!759 (t!46374 lt!599233)))))

(assert (= (and d!145315 (not res!902759)) b!1358067))

(assert (= (and b!1358067 res!902762) b!1358068))

(assert (= (and b!1358068 res!902760) b!1358069))

(assert (= (and b!1358068 (not res!902761)) b!1358070))

(declare-fun m!1243705 () Bool)

(assert (=> b!1358069 m!1243705))

(declare-fun m!1243707 () Bool)

(assert (=> b!1358070 m!1243707))

(assert (=> b!1357849 d!145315))

(declare-fun d!145317 () Bool)

(declare-fun res!902763 () Bool)

(declare-fun e!770783 () Bool)

(assert (=> d!145317 (=> res!902763 e!770783)))

(assert (=> d!145317 (= res!902763 (is-Nil!31707 lt!599233))))

(assert (=> d!145317 (= (noDuplicate!2276 lt!599233) e!770783)))

(declare-fun b!1358071 () Bool)

(declare-fun e!770784 () Bool)

(assert (=> b!1358071 (= e!770783 e!770784)))

(declare-fun res!902764 () Bool)

(assert (=> b!1358071 (=> (not res!902764) (not e!770784))))

(assert (=> b!1358071 (= res!902764 (not (contains!9419 (t!46374 lt!599233) (h!32915 lt!599233))))))

(declare-fun b!1358072 () Bool)

(assert (=> b!1358072 (= e!770784 (noDuplicate!2276 (t!46374 lt!599233)))))

(assert (= (and d!145317 (not res!902763)) b!1358071))

(assert (= (and b!1358071 res!902764) b!1358072))

(declare-fun m!1243709 () Bool)

(assert (=> b!1358071 m!1243709))

(declare-fun m!1243711 () Bool)

(assert (=> b!1358072 m!1243711))

(assert (=> b!1357852 d!145317))

(declare-fun d!145319 () Bool)

(assert (=> d!145319 (= (validKeyInArray!0 (select (arr!44669 a!3742) from!3120)) (and (not (= (select (arr!44669 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44669 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357840 d!145319))

(declare-fun d!145321 () Bool)

(declare-fun lt!599267 () Bool)

(assert (=> d!145321 (= lt!599267 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!680 lt!599233)))))

(declare-fun e!770788 () Bool)

(assert (=> d!145321 (= lt!599267 e!770788)))

(declare-fun res!902767 () Bool)

(assert (=> d!145321 (=> (not res!902767) (not e!770788))))

(assert (=> d!145321 (= res!902767 (is-Cons!31706 lt!599233))))

(assert (=> d!145321 (= (contains!9419 lt!599233 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599267)))

(declare-fun b!1358074 () Bool)

(declare-fun e!770787 () Bool)

(assert (=> b!1358074 (= e!770788 e!770787)))

(declare-fun res!902768 () Bool)

(assert (=> b!1358074 (=> res!902768 e!770787)))

(assert (=> b!1358074 (= res!902768 (= (h!32915 lt!599233) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358076 () Bool)

(assert (=> b!1358076 (= e!770787 (contains!9419 (t!46374 lt!599233) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145321 res!902767) b!1358074))

(assert (= (and b!1358074 (not res!902768)) b!1358076))

(assert (=> d!145321 m!1243691))

(declare-fun m!1243713 () Bool)

(assert (=> d!145321 m!1243713))

(declare-fun m!1243715 () Bool)

(assert (=> b!1358076 m!1243715))

(assert (=> b!1357841 d!145321))

(push 1)

