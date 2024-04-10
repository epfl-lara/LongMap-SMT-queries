; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114360 () Bool)

(assert start!114360)

(declare-fun b!1357923 () Bool)

(declare-fun e!770655 () Bool)

(declare-datatypes ((List!31712 0))(
  ( (Nil!31709) (Cons!31708 (h!32917 (_ BitVec 64)) (t!46376 List!31712)) )
))
(declare-fun acc!759 () List!31712)

(declare-fun lt!599245 () List!31712)

(declare-fun subseq!823 (List!31712 List!31712) Bool)

(assert (=> b!1357923 (= e!770655 (subseq!823 acc!759 lt!599245))))

(declare-fun b!1357924 () Bool)

(declare-fun res!902635 () Bool)

(declare-fun e!770656 () Bool)

(assert (=> b!1357924 (=> (not res!902635) (not e!770656))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92452 0))(
  ( (array!92453 (arr!44671 (Array (_ BitVec 32) (_ BitVec 64))) (size!45221 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92452)

(assert (=> b!1357924 (= res!902635 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45221 a!3742)))))

(declare-fun b!1357925 () Bool)

(declare-fun res!902637 () Bool)

(assert (=> b!1357925 (=> res!902637 e!770655)))

(declare-fun contains!9421 (List!31712 (_ BitVec 64)) Bool)

(assert (=> b!1357925 (= res!902637 (contains!9421 lt!599245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!902634 () Bool)

(assert (=> start!114360 (=> (not res!902634) (not e!770656))))

(assert (=> start!114360 (= res!902634 (and (bvslt (size!45221 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45221 a!3742))))))

(assert (=> start!114360 e!770656))

(assert (=> start!114360 true))

(declare-fun array_inv!33699 (array!92452) Bool)

(assert (=> start!114360 (array_inv!33699 a!3742)))

(declare-fun b!1357926 () Bool)

(declare-fun res!902638 () Bool)

(assert (=> b!1357926 (=> (not res!902638) (not e!770656))))

(declare-fun noDuplicate!2278 (List!31712) Bool)

(assert (=> b!1357926 (= res!902638 (noDuplicate!2278 acc!759))))

(declare-fun b!1357927 () Bool)

(assert (=> b!1357927 (= e!770656 (not e!770655))))

(declare-fun res!902644 () Bool)

(assert (=> b!1357927 (=> res!902644 e!770655)))

(assert (=> b!1357927 (= res!902644 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!826 (List!31712 (_ BitVec 64)) List!31712)

(assert (=> b!1357927 (= lt!599245 ($colon$colon!826 acc!759 (select (arr!44671 a!3742) from!3120)))))

(assert (=> b!1357927 (subseq!823 acc!759 acc!759)))

(declare-datatypes ((Unit!44677 0))(
  ( (Unit!44678) )
))
(declare-fun lt!599244 () Unit!44677)

(declare-fun lemmaListSubSeqRefl!0 (List!31712) Unit!44677)

(assert (=> b!1357927 (= lt!599244 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357928 () Bool)

(declare-fun res!902641 () Bool)

(assert (=> b!1357928 (=> (not res!902641) (not e!770656))))

(assert (=> b!1357928 (= res!902641 (not (contains!9421 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357929 () Bool)

(declare-fun res!902632 () Bool)

(assert (=> b!1357929 (=> res!902632 e!770655)))

(assert (=> b!1357929 (= res!902632 (contains!9421 lt!599245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357930 () Bool)

(declare-fun res!902639 () Bool)

(assert (=> b!1357930 (=> (not res!902639) (not e!770656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357930 (= res!902639 (validKeyInArray!0 (select (arr!44671 a!3742) from!3120)))))

(declare-fun b!1357931 () Bool)

(declare-fun res!902642 () Bool)

(assert (=> b!1357931 (=> (not res!902642) (not e!770656))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357931 (= res!902642 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357932 () Bool)

(declare-fun res!902636 () Bool)

(assert (=> b!1357932 (=> (not res!902636) (not e!770656))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357932 (= res!902636 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45221 a!3742))))))

(declare-fun b!1357933 () Bool)

(declare-fun res!902643 () Bool)

(assert (=> b!1357933 (=> res!902643 e!770655)))

(assert (=> b!1357933 (= res!902643 (not (noDuplicate!2278 lt!599245)))))

(declare-fun b!1357934 () Bool)

(declare-fun res!902640 () Bool)

(assert (=> b!1357934 (=> (not res!902640) (not e!770656))))

(declare-fun arrayNoDuplicates!0 (array!92452 (_ BitVec 32) List!31712) Bool)

(assert (=> b!1357934 (= res!902640 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31709))))

(declare-fun b!1357935 () Bool)

(declare-fun res!902633 () Bool)

(assert (=> b!1357935 (=> (not res!902633) (not e!770656))))

(assert (=> b!1357935 (= res!902633 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357936 () Bool)

(declare-fun res!902631 () Bool)

(assert (=> b!1357936 (=> (not res!902631) (not e!770656))))

(assert (=> b!1357936 (= res!902631 (not (contains!9421 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114360 res!902634) b!1357926))

(assert (= (and b!1357926 res!902638) b!1357928))

(assert (= (and b!1357928 res!902641) b!1357936))

(assert (= (and b!1357936 res!902631) b!1357934))

(assert (= (and b!1357934 res!902640) b!1357935))

(assert (= (and b!1357935 res!902633) b!1357932))

(assert (= (and b!1357932 res!902636) b!1357931))

(assert (= (and b!1357931 res!902642) b!1357924))

(assert (= (and b!1357924 res!902635) b!1357930))

(assert (= (and b!1357930 res!902639) b!1357927))

(assert (= (and b!1357927 (not res!902644)) b!1357933))

(assert (= (and b!1357933 (not res!902643)) b!1357925))

(assert (= (and b!1357925 (not res!902637)) b!1357929))

(assert (= (and b!1357929 (not res!902632)) b!1357923))

(declare-fun m!1243565 () Bool)

(assert (=> b!1357934 m!1243565))

(declare-fun m!1243567 () Bool)

(assert (=> b!1357936 m!1243567))

(declare-fun m!1243569 () Bool)

(assert (=> b!1357931 m!1243569))

(declare-fun m!1243571 () Bool)

(assert (=> b!1357930 m!1243571))

(assert (=> b!1357930 m!1243571))

(declare-fun m!1243573 () Bool)

(assert (=> b!1357930 m!1243573))

(declare-fun m!1243575 () Bool)

(assert (=> b!1357935 m!1243575))

(declare-fun m!1243577 () Bool)

(assert (=> start!114360 m!1243577))

(declare-fun m!1243579 () Bool)

(assert (=> b!1357926 m!1243579))

(declare-fun m!1243581 () Bool)

(assert (=> b!1357933 m!1243581))

(declare-fun m!1243583 () Bool)

(assert (=> b!1357929 m!1243583))

(declare-fun m!1243585 () Bool)

(assert (=> b!1357923 m!1243585))

(declare-fun m!1243587 () Bool)

(assert (=> b!1357928 m!1243587))

(assert (=> b!1357927 m!1243571))

(assert (=> b!1357927 m!1243571))

(declare-fun m!1243589 () Bool)

(assert (=> b!1357927 m!1243589))

(declare-fun m!1243591 () Bool)

(assert (=> b!1357927 m!1243591))

(declare-fun m!1243593 () Bool)

(assert (=> b!1357927 m!1243593))

(declare-fun m!1243595 () Bool)

(assert (=> b!1357925 m!1243595))

(push 1)

(assert (not b!1357928))

(assert (not b!1357934))

(assert (not b!1357931))

(assert (not b!1357930))

(assert (not b!1357926))

(assert (not b!1357935))

(assert (not b!1357923))

(assert (not b!1357933))

(assert (not b!1357925))

(assert (not b!1357929))

(assert (not b!1357927))

(assert (not start!114360))

(assert (not b!1357936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145273 () Bool)

(declare-fun lt!599263 () Bool)

(declare-fun content!681 (List!31712) (Set (_ BitVec 64)))

(assert (=> d!145273 (= lt!599263 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!681 acc!759)))))

(declare-fun e!770713 () Bool)

(assert (=> d!145273 (= lt!599263 e!770713)))

(declare-fun res!902701 () Bool)

(assert (=> d!145273 (=> (not res!902701) (not e!770713))))

(assert (=> d!145273 (= res!902701 (is-Cons!31708 acc!759))))

(assert (=> d!145273 (= (contains!9421 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599263)))

(declare-fun b!1357993 () Bool)

(declare-fun e!770714 () Bool)

(assert (=> b!1357993 (= e!770713 e!770714)))

(declare-fun res!902702 () Bool)

(assert (=> b!1357993 (=> res!902702 e!770714)))

(assert (=> b!1357993 (= res!902702 (= (h!32917 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357994 () Bool)

(assert (=> b!1357994 (= e!770714 (contains!9421 (t!46376 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145273 res!902701) b!1357993))

(assert (= (and b!1357993 (not res!902702)) b!1357994))

(declare-fun m!1243643 () Bool)

(assert (=> d!145273 m!1243643))

(declare-fun m!1243645 () Bool)

(assert (=> d!145273 m!1243645))

(declare-fun m!1243647 () Bool)

(assert (=> b!1357994 m!1243647))

(assert (=> b!1357928 d!145273))

(declare-fun d!145283 () Bool)

(declare-fun lt!599264 () Bool)

(assert (=> d!145283 (= lt!599264 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!681 lt!599245)))))

(declare-fun e!770715 () Bool)

(assert (=> d!145283 (= lt!599264 e!770715)))

(declare-fun res!902703 () Bool)

(assert (=> d!145283 (=> (not res!902703) (not e!770715))))

(assert (=> d!145283 (= res!902703 (is-Cons!31708 lt!599245))))

(assert (=> d!145283 (= (contains!9421 lt!599245 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599264)))

(declare-fun b!1357995 () Bool)

(declare-fun e!770716 () Bool)

(assert (=> b!1357995 (= e!770715 e!770716)))

(declare-fun res!902704 () Bool)

(assert (=> b!1357995 (=> res!902704 e!770716)))

(assert (=> b!1357995 (= res!902704 (= (h!32917 lt!599245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357996 () Bool)

(assert (=> b!1357996 (= e!770716 (contains!9421 (t!46376 lt!599245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145283 res!902703) b!1357995))

(assert (= (and b!1357995 (not res!902704)) b!1357996))

(declare-fun m!1243649 () Bool)

(assert (=> d!145283 m!1243649))

(declare-fun m!1243651 () Bool)

(assert (=> d!145283 m!1243651))

(declare-fun m!1243653 () Bool)

(assert (=> b!1357996 m!1243653))

(assert (=> b!1357929 d!145283))

(declare-fun d!145285 () Bool)

(assert (=> d!145285 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357931 d!145285))

(declare-fun d!145287 () Bool)

(assert (=> d!145287 (= (validKeyInArray!0 (select (arr!44671 a!3742) from!3120)) (and (not (= (select (arr!44671 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44671 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357930 d!145287))

(declare-fun b!1358036 () Bool)

(declare-fun e!770749 () Bool)

(declare-fun e!770752 () Bool)

(assert (=> b!1358036 (= e!770749 e!770752)))

(declare-fun res!902734 () Bool)

(assert (=> b!1358036 (=> res!902734 e!770752)))

(declare-fun e!770751 () Bool)

(assert (=> b!1358036 (= res!902734 e!770751)))

(declare-fun res!902733 () Bool)

(assert (=> b!1358036 (=> (not res!902733) (not e!770751))))

(assert (=> b!1358036 (= res!902733 (= (h!32917 acc!759) (h!32917 lt!599245)))))

(declare-fun b!1358038 () Bool)

(assert (=> b!1358038 (= e!770752 (subseq!823 acc!759 (t!46376 lt!599245)))))

(declare-fun b!1358035 () Bool)

(declare-fun e!770750 () Bool)

(assert (=> b!1358035 (= e!770750 e!770749)))

(declare-fun res!902731 () Bool)

(assert (=> b!1358035 (=> (not res!902731) (not e!770749))))

(assert (=> b!1358035 (= res!902731 (is-Cons!31708 lt!599245))))

(declare-fun d!145289 () Bool)

(declare-fun res!902732 () Bool)

(assert (=> d!145289 (=> res!902732 e!770750)))

(assert (=> d!145289 (= res!902732 (is-Nil!31709 acc!759))))

(assert (=> d!145289 (= (subseq!823 acc!759 lt!599245) e!770750)))

(declare-fun b!1358037 () Bool)

(assert (=> b!1358037 (= e!770751 (subseq!823 (t!46376 acc!759) (t!46376 lt!599245)))))

(assert (= (and d!145289 (not res!902732)) b!1358035))

(assert (= (and b!1358035 res!902731) b!1358036))

(assert (= (and b!1358036 res!902733) b!1358037))

(assert (= (and b!1358036 (not res!902734)) b!1358038))

(declare-fun m!1243663 () Bool)

(assert (=> b!1358038 m!1243663))

(declare-fun m!1243667 () Bool)

(assert (=> b!1358037 m!1243667))

(assert (=> b!1357923 d!145289))

(declare-fun d!145297 () Bool)

(declare-fun res!902751 () Bool)

(declare-fun e!770771 () Bool)

(assert (=> d!145297 (=> res!902751 e!770771)))

(assert (=> d!145297 (= res!902751 (is-Nil!31709 lt!599245))))

(assert (=> d!145297 (= (noDuplicate!2278 lt!599245) e!770771)))

(declare-fun b!1358059 () Bool)

(declare-fun e!770772 () Bool)

(assert (=> b!1358059 (= e!770771 e!770772)))

(declare-fun res!902752 () Bool)

(assert (=> b!1358059 (=> (not res!902752) (not e!770772))))

(assert (=> b!1358059 (= res!902752 (not (contains!9421 (t!46376 lt!599245) (h!32917 lt!599245))))))

(declare-fun b!1358060 () Bool)

(assert (=> b!1358060 (= e!770772 (noDuplicate!2278 (t!46376 lt!599245)))))

(assert (= (and d!145297 (not res!902751)) b!1358059))

(assert (= (and b!1358059 res!902752) b!1358060))

(declare-fun m!1243697 () Bool)

(assert (=> b!1358059 m!1243697))

(declare-fun m!1243699 () Bool)

(assert (=> b!1358060 m!1243699))

(assert (=> b!1357933 d!145297))

(declare-fun b!1358085 () Bool)

(declare-fun e!770796 () Bool)

(declare-fun call!65275 () Bool)

(assert (=> b!1358085 (= e!770796 call!65275)))

(declare-fun c!127096 () Bool)

(declare-fun bm!65272 () Bool)

(assert (=> bm!65272 (= call!65275 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127096 (Cons!31708 (select (arr!44671 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1358086 () Bool)

(declare-fun e!770798 () Bool)

(declare-fun e!770797 () Bool)

(assert (=> b!1358086 (= e!770798 e!770797)))

(declare-fun res!902775 () Bool)

(assert (=> b!1358086 (=> (not res!902775) (not e!770797))))

(declare-fun e!770795 () Bool)

(assert (=> b!1358086 (= res!902775 (not e!770795))))

(declare-fun res!902773 () Bool)

(assert (=> b!1358086 (=> (not res!902773) (not e!770795))))

(assert (=> b!1358086 (= res!902773 (validKeyInArray!0 (select (arr!44671 a!3742) from!3120)))))

(declare-fun b!1358087 () Bool)

(assert (=> b!1358087 (= e!770796 call!65275)))

(declare-fun d!145311 () Bool)

(declare-fun res!902774 () Bool)

(assert (=> d!145311 (=> res!902774 e!770798)))

(assert (=> d!145311 (= res!902774 (bvsge from!3120 (size!45221 a!3742)))))

(assert (=> d!145311 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770798)))

(declare-fun b!1358088 () Bool)

(assert (=> b!1358088 (= e!770795 (contains!9421 acc!759 (select (arr!44671 a!3742) from!3120)))))

(declare-fun b!1358089 () Bool)

(assert (=> b!1358089 (= e!770797 e!770796)))

(assert (=> b!1358089 (= c!127096 (validKeyInArray!0 (select (arr!44671 a!3742) from!3120)))))

(assert (= (and d!145311 (not res!902774)) b!1358086))

(assert (= (and b!1358086 res!902773) b!1358088))

(assert (= (and b!1358086 res!902775) b!1358089))

(assert (= (and b!1358089 c!127096) b!1358085))

(assert (= (and b!1358089 (not c!127096)) b!1358087))

(assert (= (or b!1358085 b!1358087) bm!65272))

(assert (=> bm!65272 m!1243571))

(declare-fun m!1243717 () Bool)

(assert (=> bm!65272 m!1243717))

(assert (=> b!1358086 m!1243571))

(assert (=> b!1358086 m!1243571))

(assert (=> b!1358086 m!1243573))

(assert (=> b!1358088 m!1243571))

(assert (=> b!1358088 m!1243571))

(declare-fun m!1243719 () Bool)

(assert (=> b!1358088 m!1243719))

(assert (=> b!1358089 m!1243571))

(assert (=> b!1358089 m!1243571))

(assert (=> b!1358089 m!1243573))

(assert (=> b!1357935 d!145311))

(declare-fun d!145323 () Bool)

(assert (=> d!145323 (= (array_inv!33699 a!3742) (bvsge (size!45221 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114360 d!145323))

(declare-fun b!1358090 () Bool)

(declare-fun e!770800 () Bool)

(declare-fun call!65276 () Bool)

(assert (=> b!1358090 (= e!770800 call!65276)))

(declare-fun bm!65273 () Bool)

(declare-fun c!127097 () Bool)

(assert (=> bm!65273 (= call!65276 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127097 (Cons!31708 (select (arr!44671 a!3742) #b00000000000000000000000000000000) Nil!31709) Nil!31709)))))

(declare-fun b!1358091 () Bool)

(declare-fun e!770802 () Bool)

(declare-fun e!770801 () Bool)

(assert (=> b!1358091 (= e!770802 e!770801)))

(declare-fun res!902778 () Bool)

(assert (=> b!1358091 (=> (not res!902778) (not e!770801))))

(declare-fun e!770799 () Bool)

