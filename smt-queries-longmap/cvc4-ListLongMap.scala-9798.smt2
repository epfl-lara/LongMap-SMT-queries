; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116358 () Bool)

(assert start!116358)

(declare-fun res!916684 () Bool)

(declare-fun e!777968 () Bool)

(assert (=> start!116358 (=> (not res!916684) (not e!777968))))

(declare-datatypes ((array!93136 0))(
  ( (array!93137 (arr!44977 (Array (_ BitVec 32) (_ BitVec 64))) (size!45527 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93136)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116358 (= res!916684 (and (bvslt (size!45527 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45527 a!3861))))))

(assert (=> start!116358 e!777968))

(declare-fun array_inv!34005 (array!93136) Bool)

(assert (=> start!116358 (array_inv!34005 a!3861)))

(assert (=> start!116358 true))

(declare-fun b!1373432 () Bool)

(declare-fun res!916676 () Bool)

(assert (=> b!1373432 (=> (not res!916676) (not e!777968))))

(declare-datatypes ((List!32045 0))(
  ( (Nil!32042) (Cons!32041 (h!33250 (_ BitVec 64)) (t!46739 List!32045)) )
))
(declare-fun acc!866 () List!32045)

(declare-fun contains!9727 (List!32045 (_ BitVec 64)) Bool)

(assert (=> b!1373432 (= res!916676 (not (contains!9727 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun newAcc!98 () List!32045)

(declare-fun e!777969 () Bool)

(declare-fun b!1373433 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93136 (_ BitVec 32) List!32045) Bool)

(assert (=> b!1373433 (= e!777969 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(assert (=> b!1373433 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45391 0))(
  ( (Unit!45392) )
))
(declare-fun lt!603052 () Unit!45391)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93136 List!32045 List!32045 (_ BitVec 32)) Unit!45391)

(assert (=> b!1373433 (= lt!603052 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1373434 () Bool)

(declare-fun res!916683 () Bool)

(assert (=> b!1373434 (=> (not res!916683) (not e!777968))))

(assert (=> b!1373434 (= res!916683 (not (contains!9727 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373435 () Bool)

(declare-fun res!916686 () Bool)

(assert (=> b!1373435 (=> (not res!916686) (not e!777968))))

(declare-fun subseq!1129 (List!32045 List!32045) Bool)

(assert (=> b!1373435 (= res!916686 (subseq!1129 newAcc!98 acc!866))))

(declare-fun b!1373436 () Bool)

(declare-fun res!916678 () Bool)

(assert (=> b!1373436 (=> (not res!916678) (not e!777968))))

(assert (=> b!1373436 (= res!916678 (not (contains!9727 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373437 () Bool)

(declare-fun res!916685 () Bool)

(assert (=> b!1373437 (=> (not res!916685) (not e!777969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373437 (= res!916685 (not (validKeyInArray!0 (select (arr!44977 a!3861) from!3239))))))

(declare-fun b!1373438 () Bool)

(declare-fun res!916687 () Bool)

(assert (=> b!1373438 (=> (not res!916687) (not e!777969))))

(assert (=> b!1373438 (= res!916687 (bvslt from!3239 (size!45527 a!3861)))))

(declare-fun b!1373439 () Bool)

(assert (=> b!1373439 (= e!777968 e!777969)))

(declare-fun res!916682 () Bool)

(assert (=> b!1373439 (=> (not res!916682) (not e!777969))))

(assert (=> b!1373439 (= res!916682 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!603051 () Unit!45391)

(declare-fun noDuplicateSubseq!316 (List!32045 List!32045) Unit!45391)

(assert (=> b!1373439 (= lt!603051 (noDuplicateSubseq!316 newAcc!98 acc!866))))

(declare-fun b!1373440 () Bool)

(declare-fun res!916680 () Bool)

(assert (=> b!1373440 (=> (not res!916680) (not e!777968))))

(assert (=> b!1373440 (= res!916680 (not (contains!9727 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373441 () Bool)

(declare-fun res!916681 () Bool)

(assert (=> b!1373441 (=> (not res!916681) (not e!777969))))

(assert (=> b!1373441 (= res!916681 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1373442 () Bool)

(declare-fun res!916679 () Bool)

(assert (=> b!1373442 (=> (not res!916679) (not e!777968))))

(declare-fun noDuplicate!2584 (List!32045) Bool)

(assert (=> b!1373442 (= res!916679 (noDuplicate!2584 acc!866))))

(declare-fun b!1373443 () Bool)

(declare-fun res!916677 () Bool)

(assert (=> b!1373443 (=> (not res!916677) (not e!777969))))

(assert (=> b!1373443 (= res!916677 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (= (and start!116358 res!916684) b!1373442))

(assert (= (and b!1373442 res!916679) b!1373432))

(assert (= (and b!1373432 res!916676) b!1373434))

(assert (= (and b!1373434 res!916683) b!1373440))

(assert (= (and b!1373440 res!916680) b!1373436))

(assert (= (and b!1373436 res!916678) b!1373435))

(assert (= (and b!1373435 res!916686) b!1373439))

(assert (= (and b!1373439 res!916682) b!1373438))

(assert (= (and b!1373438 res!916687) b!1373437))

(assert (= (and b!1373437 res!916685) b!1373443))

(assert (= (and b!1373443 res!916677) b!1373441))

(assert (= (and b!1373441 res!916681) b!1373433))

(declare-fun m!1256677 () Bool)

(assert (=> b!1373441 m!1256677))

(declare-fun m!1256679 () Bool)

(assert (=> b!1373433 m!1256679))

(declare-fun m!1256681 () Bool)

(assert (=> b!1373433 m!1256681))

(declare-fun m!1256683 () Bool)

(assert (=> b!1373433 m!1256683))

(declare-fun m!1256685 () Bool)

(assert (=> b!1373440 m!1256685))

(declare-fun m!1256687 () Bool)

(assert (=> b!1373439 m!1256687))

(declare-fun m!1256689 () Bool)

(assert (=> b!1373439 m!1256689))

(declare-fun m!1256691 () Bool)

(assert (=> b!1373436 m!1256691))

(declare-fun m!1256693 () Bool)

(assert (=> b!1373435 m!1256693))

(declare-fun m!1256695 () Bool)

(assert (=> b!1373437 m!1256695))

(assert (=> b!1373437 m!1256695))

(declare-fun m!1256697 () Bool)

(assert (=> b!1373437 m!1256697))

(declare-fun m!1256699 () Bool)

(assert (=> b!1373432 m!1256699))

(declare-fun m!1256701 () Bool)

(assert (=> b!1373434 m!1256701))

(declare-fun m!1256703 () Bool)

(assert (=> start!116358 m!1256703))

(declare-fun m!1256705 () Bool)

(assert (=> b!1373442 m!1256705))

(push 1)

(assert (not b!1373437))

(assert (not b!1373434))

(assert (not b!1373441))

(assert (not start!116358))

(assert (not b!1373440))

(assert (not b!1373435))

(assert (not b!1373432))

(assert (not b!1373433))

(assert (not b!1373436))

(assert (not b!1373439))

(assert (not b!1373442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147957 () Bool)

(declare-fun lt!603055 () Bool)

(declare-fun content!750 (List!32045) (Set (_ BitVec 64)))

(assert (=> d!147957 (= lt!603055 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!750 acc!866)))))

(declare-fun e!777984 () Bool)

(assert (=> d!147957 (= lt!603055 e!777984)))

(declare-fun res!916699 () Bool)

(assert (=> d!147957 (=> (not res!916699) (not e!777984))))

(assert (=> d!147957 (= res!916699 (is-Cons!32041 acc!866))))

(assert (=> d!147957 (= (contains!9727 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603055)))

(declare-fun b!1373458 () Bool)

(declare-fun e!777983 () Bool)

(assert (=> b!1373458 (= e!777984 e!777983)))

(declare-fun res!916698 () Bool)

(assert (=> b!1373458 (=> res!916698 e!777983)))

(assert (=> b!1373458 (= res!916698 (= (h!33250 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373459 () Bool)

(assert (=> b!1373459 (= e!777983 (contains!9727 (t!46739 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147957 res!916699) b!1373458))

(assert (= (and b!1373458 (not res!916698)) b!1373459))

(declare-fun m!1256707 () Bool)

(assert (=> d!147957 m!1256707))

(declare-fun m!1256709 () Bool)

(assert (=> d!147957 m!1256709))

(declare-fun m!1256711 () Bool)

(assert (=> b!1373459 m!1256711))

(assert (=> b!1373432 d!147957))

(declare-fun d!147959 () Bool)

(assert (=> d!147959 (= (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)) (and (not (= (select (arr!44977 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44977 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1373437 d!147959))

(declare-fun d!147963 () Bool)

(declare-fun res!916709 () Bool)

(declare-fun e!777995 () Bool)

(assert (=> d!147963 (=> res!916709 e!777995)))

(assert (=> d!147963 (= res!916709 (is-Nil!32042 acc!866))))

(assert (=> d!147963 (= (noDuplicate!2584 acc!866) e!777995)))

(declare-fun b!1373471 () Bool)

(declare-fun e!777996 () Bool)

(assert (=> b!1373471 (= e!777995 e!777996)))

(declare-fun res!916710 () Bool)

(assert (=> b!1373471 (=> (not res!916710) (not e!777996))))

(assert (=> b!1373471 (= res!916710 (not (contains!9727 (t!46739 acc!866) (h!33250 acc!866))))))

(declare-fun b!1373472 () Bool)

(assert (=> b!1373472 (= e!777996 (noDuplicate!2584 (t!46739 acc!866)))))

(assert (= (and d!147963 (not res!916709)) b!1373471))

(assert (= (and b!1373471 res!916710) b!1373472))

(declare-fun m!1256717 () Bool)

(assert (=> b!1373471 m!1256717))

(declare-fun m!1256719 () Bool)

(assert (=> b!1373472 m!1256719))

(assert (=> b!1373442 d!147963))

(declare-fun d!147967 () Bool)

(assert (=> d!147967 (= (array_inv!34005 a!3861) (bvsge (size!45527 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116358 d!147967))

(declare-fun d!147971 () Bool)

(declare-fun lt!603061 () Bool)

(assert (=> d!147971 (= lt!603061 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!750 newAcc!98)))))

(declare-fun e!778003 () Bool)

(assert (=> d!147971 (= lt!603061 e!778003)))

(declare-fun res!916717 () Bool)

(assert (=> d!147971 (=> (not res!916717) (not e!778003))))

(assert (=> d!147971 (= res!916717 (is-Cons!32041 newAcc!98))))

(assert (=> d!147971 (= (contains!9727 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603061)))

(declare-fun b!1373478 () Bool)

(declare-fun e!778002 () Bool)

(assert (=> b!1373478 (= e!778003 e!778002)))

(declare-fun res!916716 () Bool)

(assert (=> b!1373478 (=> res!916716 e!778002)))

(assert (=> b!1373478 (= res!916716 (= (h!33250 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373479 () Bool)

(assert (=> b!1373479 (= e!778002 (contains!9727 (t!46739 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147971 res!916717) b!1373478))

(assert (= (and b!1373478 (not res!916716)) b!1373479))

(declare-fun m!1256725 () Bool)

(assert (=> d!147971 m!1256725))

(declare-fun m!1256727 () Bool)

(assert (=> d!147971 m!1256727))

(declare-fun m!1256729 () Bool)

(assert (=> b!1373479 m!1256729))

(assert (=> b!1373436 d!147971))

(declare-fun b!1373528 () Bool)

(declare-fun e!778047 () Bool)

(declare-fun e!778046 () Bool)

(assert (=> b!1373528 (= e!778047 e!778046)))

(declare-fun c!127827 () Bool)

(assert (=> b!1373528 (= c!127827 (validKeyInArray!0 (select (arr!44977 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373529 () Bool)

(declare-fun call!65620 () Bool)

(assert (=> b!1373529 (= e!778046 call!65620)))

(declare-fun d!147973 () Bool)

(declare-fun res!916755 () Bool)

(declare-fun e!778049 () Bool)

(assert (=> d!147973 (=> res!916755 e!778049)))

(assert (=> d!147973 (= res!916755 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45527 a!3861)))))

(assert (=> d!147973 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!778049)))

(declare-fun b!1373530 () Bool)

(assert (=> b!1373530 (= e!778049 e!778047)))

(declare-fun res!916754 () Bool)

(assert (=> b!1373530 (=> (not res!916754) (not e!778047))))

(declare-fun e!778048 () Bool)

(assert (=> b!1373530 (= res!916754 (not e!778048))))

(declare-fun res!916756 () Bool)

(assert (=> b!1373530 (=> (not res!916756) (not e!778048))))

(assert (=> b!1373530 (= res!916756 (validKeyInArray!0 (select (arr!44977 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65617 () Bool)

(assert (=> bm!65617 (= call!65620 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127827 (Cons!32041 (select (arr!44977 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1373531 () Bool)

(assert (=> b!1373531 (= e!778048 (contains!9727 acc!866 (select (arr!44977 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373532 () Bool)

(assert (=> b!1373532 (= e!778046 call!65620)))

(assert (= (and d!147973 (not res!916755)) b!1373530))

(assert (= (and b!1373530 res!916756) b!1373531))

(assert (= (and b!1373530 res!916754) b!1373528))

(assert (= (and b!1373528 c!127827) b!1373529))

(assert (= (and b!1373528 (not c!127827)) b!1373532))

(assert (= (or b!1373529 b!1373532) bm!65617))

(declare-fun m!1256779 () Bool)

(assert (=> b!1373528 m!1256779))

(assert (=> b!1373528 m!1256779))

(declare-fun m!1256781 () Bool)

(assert (=> b!1373528 m!1256781))

(assert (=> b!1373530 m!1256779))

(assert (=> b!1373530 m!1256779))

(assert (=> b!1373530 m!1256781))

(assert (=> bm!65617 m!1256779))

(declare-fun m!1256783 () Bool)

(assert (=> bm!65617 m!1256783))

(assert (=> b!1373531 m!1256779))

(assert (=> b!1373531 m!1256779))

(declare-fun m!1256785 () Bool)

(assert (=> b!1373531 m!1256785))

(assert (=> b!1373441 d!147973))

(declare-fun b!1373555 () Bool)

(declare-fun e!778070 () Bool)

(assert (=> b!1373555 (= e!778070 (subseq!1129 (t!46739 newAcc!98) (t!46739 acc!866)))))

(declare-fun b!1373553 () Bool)

(declare-fun e!778069 () Bool)

(declare-fun e!778071 () Bool)

(assert (=> b!1373553 (= e!778069 e!778071)))

(declare-fun res!916776 () Bool)

(assert (=> b!1373553 (=> (not res!916776) (not e!778071))))

(assert (=> b!1373553 (= res!916776 (is-Cons!32041 acc!866))))

(declare-fun b!1373554 () Bool)

(declare-fun e!778068 () Bool)

(assert (=> b!1373554 (= e!778071 e!778068)))

(declare-fun res!916775 () Bool)

(assert (=> b!1373554 (=> res!916775 e!778068)))

(assert (=> b!1373554 (= res!916775 e!778070)))

(declare-fun res!916774 () Bool)

(assert (=> b!1373554 (=> (not res!916774) (not e!778070))))

(assert (=> b!1373554 (= res!916774 (= (h!33250 newAcc!98) (h!33250 acc!866)))))

(declare-fun b!1373556 () Bool)

(assert (=> b!1373556 (= e!778068 (subseq!1129 newAcc!98 (t!46739 acc!866)))))

(declare-fun d!147997 () Bool)

(declare-fun res!916773 () Bool)

(assert (=> d!147997 (=> res!916773 e!778069)))

(assert (=> d!147997 (= res!916773 (is-Nil!32042 newAcc!98))))

(assert (=> d!147997 (= (subseq!1129 newAcc!98 acc!866) e!778069)))

(assert (= (and d!147997 (not res!916773)) b!1373553))

(assert (= (and b!1373553 res!916776) b!1373554))

(assert (= (and b!1373554 res!916774) b!1373555))

(assert (= (and b!1373554 (not res!916775)) b!1373556))

(declare-fun m!1256805 () Bool)

(assert (=> b!1373555 m!1256805))

(declare-fun m!1256807 () Bool)

(assert (=> b!1373556 m!1256807))

(assert (=> b!1373435 d!147997))

(declare-fun d!148009 () Bool)

(declare-fun lt!603075 () Bool)

(assert (=> d!148009 (= lt!603075 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!750 newAcc!98)))))

(declare-fun e!778073 () Bool)

(assert (=> d!148009 (= lt!603075 e!778073)))

(declare-fun res!916778 () Bool)

(assert (=> d!148009 (=> (not res!916778) (not e!778073))))

(assert (=> d!148009 (= res!916778 (is-Cons!32041 newAcc!98))))

(assert (=> d!148009 (= (contains!9727 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603075)))

(declare-fun b!1373557 () Bool)

(declare-fun e!778072 () Bool)

(assert (=> b!1373557 (= e!778073 e!778072)))

(declare-fun res!916777 () Bool)

(assert (=> b!1373557 (=> res!916777 e!778072)))

(assert (=> b!1373557 (= res!916777 (= (h!33250 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373558 () Bool)

(assert (=> b!1373558 (= e!778072 (contains!9727 (t!46739 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148009 res!916778) b!1373557))

(assert (= (and b!1373557 (not res!916777)) b!1373558))

(assert (=> d!148009 m!1256725))

(declare-fun m!1256809 () Bool)

(assert (=> d!148009 m!1256809))

(declare-fun m!1256811 () Bool)

(assert (=> b!1373558 m!1256811))

(assert (=> b!1373440 d!148009))

(declare-fun d!148011 () Bool)

(declare-fun lt!603076 () Bool)

(assert (=> d!148011 (= lt!603076 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!750 acc!866)))))

(declare-fun e!778075 () Bool)

(assert (=> d!148011 (= lt!603076 e!778075)))

(declare-fun res!916780 () Bool)

(assert (=> d!148011 (=> (not res!916780) (not e!778075))))

(assert (=> d!148011 (= res!916780 (is-Cons!32041 acc!866))))

(assert (=> d!148011 (= (contains!9727 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603076)))

(declare-fun b!1373559 () Bool)

(declare-fun e!778074 () Bool)

(assert (=> b!1373559 (= e!778075 e!778074)))

(declare-fun res!916779 () Bool)

(assert (=> b!1373559 (=> res!916779 e!778074)))

(assert (=> b!1373559 (= res!916779 (= (h!33250 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373560 () Bool)

(assert (=> b!1373560 (= e!778074 (contains!9727 (t!46739 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148011 res!916780) b!1373559))

(assert (= (and b!1373559 (not res!916779)) b!1373560))

(assert (=> d!148011 m!1256707))

(declare-fun m!1256813 () Bool)

(assert (=> d!148011 m!1256813))

(declare-fun m!1256815 () Bool)

(assert (=> b!1373560 m!1256815))

(assert (=> b!1373434 d!148011))

(declare-fun b!1373561 () Bool)

(declare-fun e!778077 () Bool)

(declare-fun e!778076 () Bool)

(assert (=> b!1373561 (= e!778077 e!778076)))

(declare-fun c!127830 () Bool)

(assert (=> b!1373561 (= c!127830 (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)))))

(declare-fun b!1373562 () Bool)

(declare-fun call!65625 () Bool)

(assert (=> b!1373562 (= e!778076 call!65625)))

(declare-fun d!148013 () Bool)

(declare-fun res!916782 () Bool)

(declare-fun e!778079 () Bool)

(assert (=> d!148013 (=> res!916782 e!778079)))

(assert (=> d!148013 (= res!916782 (bvsge from!3239 (size!45527 a!3861)))))

(assert (=> d!148013 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778079)))

(declare-fun b!1373563 () Bool)

(assert (=> b!1373563 (= e!778079 e!778077)))

(declare-fun res!916781 () Bool)

(assert (=> b!1373563 (=> (not res!916781) (not e!778077))))

(declare-fun e!778078 () Bool)

(assert (=> b!1373563 (= res!916781 (not e!778078))))

(declare-fun res!916783 () Bool)

(assert (=> b!1373563 (=> (not res!916783) (not e!778078))))

(assert (=> b!1373563 (= res!916783 (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)))))

(declare-fun bm!65622 () Bool)

(assert (=> bm!65622 (= call!65625 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127830 (Cons!32041 (select (arr!44977 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373564 () Bool)

(assert (=> b!1373564 (= e!778078 (contains!9727 acc!866 (select (arr!44977 a!3861) from!3239)))))

(declare-fun b!1373565 () Bool)

(assert (=> b!1373565 (= e!778076 call!65625)))

(assert (= (and d!148013 (not res!916782)) b!1373563))

(assert (= (and b!1373563 res!916783) b!1373564))

(assert (= (and b!1373563 res!916781) b!1373561))

(assert (= (and b!1373561 c!127830) b!1373562))

(assert (= (and b!1373561 (not c!127830)) b!1373565))

(assert (= (or b!1373562 b!1373565) bm!65622))

(assert (=> b!1373561 m!1256695))

(assert (=> b!1373561 m!1256695))

(assert (=> b!1373561 m!1256697))

(assert (=> b!1373563 m!1256695))

(assert (=> b!1373563 m!1256695))

(assert (=> b!1373563 m!1256697))

(assert (=> bm!65622 m!1256695))

(declare-fun m!1256817 () Bool)

(assert (=> bm!65622 m!1256817))

(assert (=> b!1373564 m!1256695))

(assert (=> b!1373564 m!1256695))

(declare-fun m!1256819 () Bool)

(assert (=> b!1373564 m!1256819))

(assert (=> b!1373439 d!148013))

(declare-fun d!148015 () Bool)

(assert (=> d!148015 (noDuplicate!2584 newAcc!98)))

(declare-fun lt!603082 () Unit!45391)

(declare-fun choose!2025 (List!32045 List!32045) Unit!45391)

(assert (=> d!148015 (= lt!603082 (choose!2025 newAcc!98 acc!866))))

(declare-fun e!778102 () Bool)

(assert (=> d!148015 e!778102))

(declare-fun res!916804 () Bool)

(assert (=> d!148015 (=> (not res!916804) (not e!778102))))

(assert (=> d!148015 (= res!916804 (subseq!1129 newAcc!98 acc!866))))

(assert (=> d!148015 (= (noDuplicateSubseq!316 newAcc!98 acc!866) lt!603082)))

(declare-fun b!1373590 () Bool)

(assert (=> b!1373590 (= e!778102 (noDuplicate!2584 acc!866))))

(assert (= (and d!148015 res!916804) b!1373590))

(declare-fun m!1256835 () Bool)

(assert (=> d!148015 m!1256835))

(declare-fun m!1256837 () Bool)

(assert (=> d!148015 m!1256837))

(assert (=> d!148015 m!1256693))

(assert (=> b!1373590 m!1256705))

(assert (=> b!1373439 d!148015))

(declare-fun b!1373591 () Bool)

(declare-fun e!778104 () Bool)

(declare-fun e!778103 () Bool)

(assert (=> b!1373591 (= e!778104 e!778103)))

(declare-fun c!127833 () Bool)

(assert (=> b!1373591 (= c!127833 (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)))))

(declare-fun b!1373592 () Bool)

(declare-fun call!65628 () Bool)

(assert (=> b!1373592 (= e!778103 call!65628)))

(declare-fun d!148027 () Bool)

(declare-fun res!916806 () Bool)

(declare-fun e!778106 () Bool)

(assert (=> d!148027 (=> res!916806 e!778106)))

(assert (=> d!148027 (= res!916806 (bvsge from!3239 (size!45527 a!3861)))))

(assert (=> d!148027 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778106)))

(declare-fun b!1373593 () Bool)

(assert (=> b!1373593 (= e!778106 e!778104)))

(declare-fun res!916805 () Bool)

(assert (=> b!1373593 (=> (not res!916805) (not e!778104))))

(declare-fun e!778105 () Bool)

(assert (=> b!1373593 (= res!916805 (not e!778105))))

(declare-fun res!916807 () Bool)

(assert (=> b!1373593 (=> (not res!916807) (not e!778105))))

(assert (=> b!1373593 (= res!916807 (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)))))

(declare-fun bm!65625 () Bool)

(assert (=> bm!65625 (= call!65628 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127833 (Cons!32041 (select (arr!44977 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1373594 () Bool)

(assert (=> b!1373594 (= e!778105 (contains!9727 newAcc!98 (select (arr!44977 a!3861) from!3239)))))

(declare-fun b!1373595 () Bool)

(assert (=> b!1373595 (= e!778103 call!65628)))

(assert (= (and d!148027 (not res!916806)) b!1373593))

(assert (= (and b!1373593 res!916807) b!1373594))

(assert (= (and b!1373593 res!916805) b!1373591))

(assert (= (and b!1373591 c!127833) b!1373592))

(assert (= (and b!1373591 (not c!127833)) b!1373595))

(assert (= (or b!1373592 b!1373595) bm!65625))

(assert (=> b!1373591 m!1256695))

(assert (=> b!1373591 m!1256695))

(assert (=> b!1373591 m!1256697))

(assert (=> b!1373593 m!1256695))

(assert (=> b!1373593 m!1256695))

(assert (=> b!1373593 m!1256697))

(assert (=> bm!65625 m!1256695))

(declare-fun m!1256839 () Bool)

(assert (=> bm!65625 m!1256839))

(assert (=> b!1373594 m!1256695))

