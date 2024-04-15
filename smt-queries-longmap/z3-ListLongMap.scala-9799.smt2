; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116398 () Bool)

(assert start!116398)

(declare-fun res!916833 () Bool)

(declare-fun e!778116 () Bool)

(assert (=> start!116398 (=> (not res!916833) (not e!778116))))

(declare-datatypes ((array!93090 0))(
  ( (array!93091 (arr!44953 (Array (_ BitVec 32) (_ BitVec 64))) (size!45505 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93090)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116398 (= res!916833 (and (bvslt (size!45505 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45505 a!3861))))))

(assert (=> start!116398 e!778116))

(declare-fun array_inv!34186 (array!93090) Bool)

(assert (=> start!116398 (array_inv!34186 a!3861)))

(assert (=> start!116398 true))

(declare-fun b!1373579 () Bool)

(declare-fun res!916832 () Bool)

(assert (=> b!1373579 (=> (not res!916832) (not e!778116))))

(declare-datatypes ((List!32099 0))(
  ( (Nil!32096) (Cons!32095 (h!33304 (_ BitVec 64)) (t!46785 List!32099)) )
))
(declare-fun newAcc!98 () List!32099)

(declare-fun contains!9692 (List!32099 (_ BitVec 64)) Bool)

(assert (=> b!1373579 (= res!916832 (not (contains!9692 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373580 () Bool)

(declare-fun res!916831 () Bool)

(assert (=> b!1373580 (=> (not res!916831) (not e!778116))))

(declare-fun acc!866 () List!32099)

(declare-fun noDuplicate!2607 (List!32099) Bool)

(assert (=> b!1373580 (= res!916831 (noDuplicate!2607 acc!866))))

(declare-fun b!1373581 () Bool)

(declare-fun e!778115 () Bool)

(assert (=> b!1373581 (= e!778116 e!778115)))

(declare-fun res!916836 () Bool)

(assert (=> b!1373581 (=> (not res!916836) (not e!778115))))

(declare-fun arrayNoDuplicates!0 (array!93090 (_ BitVec 32) List!32099) Bool)

(assert (=> b!1373581 (= res!916836 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45234 0))(
  ( (Unit!45235) )
))
(declare-fun lt!602904 () Unit!45234)

(declare-fun noDuplicateSubseq!317 (List!32099 List!32099) Unit!45234)

(assert (=> b!1373581 (= lt!602904 (noDuplicateSubseq!317 newAcc!98 acc!866))))

(declare-fun b!1373582 () Bool)

(assert (=> b!1373582 (= e!778115 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1373583 () Bool)

(declare-fun res!916834 () Bool)

(assert (=> b!1373583 (=> (not res!916834) (not e!778116))))

(assert (=> b!1373583 (= res!916834 (not (contains!9692 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373584 () Bool)

(declare-fun res!916838 () Bool)

(assert (=> b!1373584 (=> (not res!916838) (not e!778116))))

(assert (=> b!1373584 (= res!916838 (not (contains!9692 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373585 () Bool)

(declare-fun res!916830 () Bool)

(assert (=> b!1373585 (=> (not res!916830) (not e!778116))))

(assert (=> b!1373585 (= res!916830 (not (contains!9692 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373586 () Bool)

(declare-fun res!916835 () Bool)

(assert (=> b!1373586 (=> (not res!916835) (not e!778116))))

(declare-fun subseq!1130 (List!32099 List!32099) Bool)

(assert (=> b!1373586 (= res!916835 (subseq!1130 newAcc!98 acc!866))))

(declare-fun b!1373587 () Bool)

(declare-fun res!916837 () Bool)

(assert (=> b!1373587 (=> (not res!916837) (not e!778115))))

(assert (=> b!1373587 (= res!916837 (bvsge from!3239 (size!45505 a!3861)))))

(assert (= (and start!116398 res!916833) b!1373580))

(assert (= (and b!1373580 res!916831) b!1373584))

(assert (= (and b!1373584 res!916838) b!1373585))

(assert (= (and b!1373585 res!916830) b!1373583))

(assert (= (and b!1373583 res!916834) b!1373579))

(assert (= (and b!1373579 res!916832) b!1373586))

(assert (= (and b!1373586 res!916835) b!1373581))

(assert (= (and b!1373581 res!916836) b!1373587))

(assert (= (and b!1373587 res!916837) b!1373582))

(declare-fun m!1256343 () Bool)

(assert (=> b!1373579 m!1256343))

(declare-fun m!1256345 () Bool)

(assert (=> b!1373586 m!1256345))

(declare-fun m!1256347 () Bool)

(assert (=> b!1373580 m!1256347))

(declare-fun m!1256349 () Bool)

(assert (=> b!1373582 m!1256349))

(declare-fun m!1256351 () Bool)

(assert (=> start!116398 m!1256351))

(declare-fun m!1256353 () Bool)

(assert (=> b!1373584 m!1256353))

(declare-fun m!1256355 () Bool)

(assert (=> b!1373583 m!1256355))

(declare-fun m!1256357 () Bool)

(assert (=> b!1373581 m!1256357))

(declare-fun m!1256359 () Bool)

(assert (=> b!1373581 m!1256359))

(declare-fun m!1256361 () Bool)

(assert (=> b!1373585 m!1256361))

(check-sat (not start!116398) (not b!1373583) (not b!1373582) (not b!1373586) (not b!1373579) (not b!1373584) (not b!1373580) (not b!1373581) (not b!1373585))
(check-sat)
(get-model)

(declare-fun d!147913 () Bool)

(declare-fun lt!602913 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!749 (List!32099) (InoxSet (_ BitVec 64)))

(assert (=> d!147913 (= lt!602913 (select (content!749 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778139 () Bool)

(assert (=> d!147913 (= lt!602913 e!778139)))

(declare-fun res!916898 () Bool)

(assert (=> d!147913 (=> (not res!916898) (not e!778139))))

(get-info :version)

(assert (=> d!147913 (= res!916898 ((_ is Cons!32095) newAcc!98))))

(assert (=> d!147913 (= (contains!9692 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602913)))

(declare-fun b!1373646 () Bool)

(declare-fun e!778140 () Bool)

(assert (=> b!1373646 (= e!778139 e!778140)))

(declare-fun res!916897 () Bool)

(assert (=> b!1373646 (=> res!916897 e!778140)))

(assert (=> b!1373646 (= res!916897 (= (h!33304 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373647 () Bool)

(assert (=> b!1373647 (= e!778140 (contains!9692 (t!46785 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147913 res!916898) b!1373646))

(assert (= (and b!1373646 (not res!916897)) b!1373647))

(declare-fun m!1256403 () Bool)

(assert (=> d!147913 m!1256403))

(declare-fun m!1256405 () Bool)

(assert (=> d!147913 m!1256405))

(declare-fun m!1256407 () Bool)

(assert (=> b!1373647 m!1256407))

(assert (=> b!1373583 d!147913))

(declare-fun b!1373688 () Bool)

(declare-fun e!778174 () Bool)

(assert (=> b!1373688 (= e!778174 (contains!9692 newAcc!98 (select (arr!44953 a!3861) from!3239)))))

(declare-fun b!1373689 () Bool)

(declare-fun e!778173 () Bool)

(declare-fun call!65620 () Bool)

(assert (=> b!1373689 (= e!778173 call!65620)))

(declare-fun b!1373690 () Bool)

(declare-fun e!778176 () Bool)

(declare-fun e!778175 () Bool)

(assert (=> b!1373690 (= e!778176 e!778175)))

(declare-fun res!916925 () Bool)

(assert (=> b!1373690 (=> (not res!916925) (not e!778175))))

(assert (=> b!1373690 (= res!916925 (not e!778174))))

(declare-fun res!916923 () Bool)

(assert (=> b!1373690 (=> (not res!916923) (not e!778174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373690 (= res!916923 (validKeyInArray!0 (select (arr!44953 a!3861) from!3239)))))

(declare-fun d!147919 () Bool)

(declare-fun res!916924 () Bool)

(assert (=> d!147919 (=> res!916924 e!778176)))

(assert (=> d!147919 (= res!916924 (bvsge from!3239 (size!45505 a!3861)))))

(assert (=> d!147919 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778176)))

(declare-fun b!1373691 () Bool)

(assert (=> b!1373691 (= e!778175 e!778173)))

(declare-fun c!127825 () Bool)

(assert (=> b!1373691 (= c!127825 (validKeyInArray!0 (select (arr!44953 a!3861) from!3239)))))

(declare-fun bm!65617 () Bool)

(assert (=> bm!65617 (= call!65620 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127825 (Cons!32095 (select (arr!44953 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1373692 () Bool)

(assert (=> b!1373692 (= e!778173 call!65620)))

(assert (= (and d!147919 (not res!916924)) b!1373690))

(assert (= (and b!1373690 res!916923) b!1373688))

(assert (= (and b!1373690 res!916925) b!1373691))

(assert (= (and b!1373691 c!127825) b!1373692))

(assert (= (and b!1373691 (not c!127825)) b!1373689))

(assert (= (or b!1373692 b!1373689) bm!65617))

(declare-fun m!1256425 () Bool)

(assert (=> b!1373688 m!1256425))

(assert (=> b!1373688 m!1256425))

(declare-fun m!1256427 () Bool)

(assert (=> b!1373688 m!1256427))

(assert (=> b!1373690 m!1256425))

(assert (=> b!1373690 m!1256425))

(declare-fun m!1256429 () Bool)

(assert (=> b!1373690 m!1256429))

(assert (=> b!1373691 m!1256425))

(assert (=> b!1373691 m!1256425))

(assert (=> b!1373691 m!1256429))

(assert (=> bm!65617 m!1256425))

(declare-fun m!1256431 () Bool)

(assert (=> bm!65617 m!1256431))

(assert (=> b!1373582 d!147919))

(declare-fun e!778182 () Bool)

(declare-fun b!1373697 () Bool)

(assert (=> b!1373697 (= e!778182 (contains!9692 acc!866 (select (arr!44953 a!3861) from!3239)))))

(declare-fun b!1373698 () Bool)

(declare-fun e!778181 () Bool)

(declare-fun call!65621 () Bool)

(assert (=> b!1373698 (= e!778181 call!65621)))

(declare-fun b!1373699 () Bool)

(declare-fun e!778184 () Bool)

(declare-fun e!778183 () Bool)

(assert (=> b!1373699 (= e!778184 e!778183)))

(declare-fun res!916932 () Bool)

(assert (=> b!1373699 (=> (not res!916932) (not e!778183))))

(assert (=> b!1373699 (= res!916932 (not e!778182))))

(declare-fun res!916930 () Bool)

(assert (=> b!1373699 (=> (not res!916930) (not e!778182))))

(assert (=> b!1373699 (= res!916930 (validKeyInArray!0 (select (arr!44953 a!3861) from!3239)))))

(declare-fun d!147925 () Bool)

(declare-fun res!916931 () Bool)

(assert (=> d!147925 (=> res!916931 e!778184)))

(assert (=> d!147925 (= res!916931 (bvsge from!3239 (size!45505 a!3861)))))

(assert (=> d!147925 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778184)))

(declare-fun b!1373700 () Bool)

(assert (=> b!1373700 (= e!778183 e!778181)))

(declare-fun c!127826 () Bool)

(assert (=> b!1373700 (= c!127826 (validKeyInArray!0 (select (arr!44953 a!3861) from!3239)))))

(declare-fun bm!65618 () Bool)

(assert (=> bm!65618 (= call!65621 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127826 (Cons!32095 (select (arr!44953 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373701 () Bool)

(assert (=> b!1373701 (= e!778181 call!65621)))

(assert (= (and d!147925 (not res!916931)) b!1373699))

(assert (= (and b!1373699 res!916930) b!1373697))

(assert (= (and b!1373699 res!916932) b!1373700))

(assert (= (and b!1373700 c!127826) b!1373701))

(assert (= (and b!1373700 (not c!127826)) b!1373698))

(assert (= (or b!1373701 b!1373698) bm!65618))

(assert (=> b!1373697 m!1256425))

(assert (=> b!1373697 m!1256425))

(declare-fun m!1256433 () Bool)

(assert (=> b!1373697 m!1256433))

(assert (=> b!1373699 m!1256425))

(assert (=> b!1373699 m!1256425))

(assert (=> b!1373699 m!1256429))

(assert (=> b!1373700 m!1256425))

(assert (=> b!1373700 m!1256425))

(assert (=> b!1373700 m!1256429))

(assert (=> bm!65618 m!1256425))

(declare-fun m!1256435 () Bool)

(assert (=> bm!65618 m!1256435))

(assert (=> b!1373581 d!147925))

(declare-fun d!147927 () Bool)

(assert (=> d!147927 (noDuplicate!2607 newAcc!98)))

(declare-fun lt!602923 () Unit!45234)

(declare-fun choose!2036 (List!32099 List!32099) Unit!45234)

(assert (=> d!147927 (= lt!602923 (choose!2036 newAcc!98 acc!866))))

(declare-fun e!778205 () Bool)

(assert (=> d!147927 e!778205))

(declare-fun res!916952 () Bool)

(assert (=> d!147927 (=> (not res!916952) (not e!778205))))

(assert (=> d!147927 (= res!916952 (subseq!1130 newAcc!98 acc!866))))

(assert (=> d!147927 (= (noDuplicateSubseq!317 newAcc!98 acc!866) lt!602923)))

(declare-fun b!1373723 () Bool)

(assert (=> b!1373723 (= e!778205 (noDuplicate!2607 acc!866))))

(assert (= (and d!147927 res!916952) b!1373723))

(declare-fun m!1256459 () Bool)

(assert (=> d!147927 m!1256459))

(declare-fun m!1256461 () Bool)

(assert (=> d!147927 m!1256461))

(assert (=> d!147927 m!1256345))

(assert (=> b!1373723 m!1256347))

(assert (=> b!1373581 d!147927))

(declare-fun d!147939 () Bool)

(declare-fun res!916974 () Bool)

(declare-fun e!778230 () Bool)

(assert (=> d!147939 (=> res!916974 e!778230)))

(assert (=> d!147939 (= res!916974 ((_ is Nil!32096) newAcc!98))))

(assert (=> d!147939 (= (subseq!1130 newAcc!98 acc!866) e!778230)))

(declare-fun b!1373746 () Bool)

(declare-fun e!778229 () Bool)

(assert (=> b!1373746 (= e!778230 e!778229)))

(declare-fun res!916975 () Bool)

(assert (=> b!1373746 (=> (not res!916975) (not e!778229))))

(assert (=> b!1373746 (= res!916975 ((_ is Cons!32095) acc!866))))

(declare-fun b!1373747 () Bool)

(declare-fun e!778228 () Bool)

(assert (=> b!1373747 (= e!778229 e!778228)))

(declare-fun res!916976 () Bool)

(assert (=> b!1373747 (=> res!916976 e!778228)))

(declare-fun e!778227 () Bool)

(assert (=> b!1373747 (= res!916976 e!778227)))

(declare-fun res!916973 () Bool)

(assert (=> b!1373747 (=> (not res!916973) (not e!778227))))

(assert (=> b!1373747 (= res!916973 (= (h!33304 newAcc!98) (h!33304 acc!866)))))

(declare-fun b!1373748 () Bool)

(assert (=> b!1373748 (= e!778227 (subseq!1130 (t!46785 newAcc!98) (t!46785 acc!866)))))

(declare-fun b!1373749 () Bool)

(assert (=> b!1373749 (= e!778228 (subseq!1130 newAcc!98 (t!46785 acc!866)))))

(assert (= (and d!147939 (not res!916974)) b!1373746))

(assert (= (and b!1373746 res!916975) b!1373747))

(assert (= (and b!1373747 res!916973) b!1373748))

(assert (= (and b!1373747 (not res!916976)) b!1373749))

(declare-fun m!1256479 () Bool)

(assert (=> b!1373748 m!1256479))

(declare-fun m!1256481 () Bool)

(assert (=> b!1373749 m!1256481))

(assert (=> b!1373586 d!147939))

(declare-fun d!147949 () Bool)

(declare-fun res!916996 () Bool)

(declare-fun e!778250 () Bool)

(assert (=> d!147949 (=> res!916996 e!778250)))

(assert (=> d!147949 (= res!916996 ((_ is Nil!32096) acc!866))))

(assert (=> d!147949 (= (noDuplicate!2607 acc!866) e!778250)))

(declare-fun b!1373769 () Bool)

(declare-fun e!778251 () Bool)

(assert (=> b!1373769 (= e!778250 e!778251)))

(declare-fun res!916997 () Bool)

(assert (=> b!1373769 (=> (not res!916997) (not e!778251))))

(assert (=> b!1373769 (= res!916997 (not (contains!9692 (t!46785 acc!866) (h!33304 acc!866))))))

(declare-fun b!1373770 () Bool)

(assert (=> b!1373770 (= e!778251 (noDuplicate!2607 (t!46785 acc!866)))))

(assert (= (and d!147949 (not res!916996)) b!1373769))

(assert (= (and b!1373769 res!916997) b!1373770))

(declare-fun m!1256497 () Bool)

(assert (=> b!1373769 m!1256497))

(declare-fun m!1256501 () Bool)

(assert (=> b!1373770 m!1256501))

(assert (=> b!1373580 d!147949))

(declare-fun d!147959 () Bool)

(assert (=> d!147959 (= (array_inv!34186 a!3861) (bvsge (size!45505 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116398 d!147959))

(declare-fun d!147965 () Bool)

(declare-fun lt!602935 () Bool)

(assert (=> d!147965 (= lt!602935 (select (content!749 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778258 () Bool)

(assert (=> d!147965 (= lt!602935 e!778258)))

(declare-fun res!917005 () Bool)

(assert (=> d!147965 (=> (not res!917005) (not e!778258))))

(assert (=> d!147965 (= res!917005 ((_ is Cons!32095) acc!866))))

(assert (=> d!147965 (= (contains!9692 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602935)))

(declare-fun b!1373777 () Bool)

(declare-fun e!778259 () Bool)

(assert (=> b!1373777 (= e!778258 e!778259)))

(declare-fun res!917004 () Bool)

(assert (=> b!1373777 (=> res!917004 e!778259)))

(assert (=> b!1373777 (= res!917004 (= (h!33304 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373778 () Bool)

(assert (=> b!1373778 (= e!778259 (contains!9692 (t!46785 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147965 res!917005) b!1373777))

(assert (= (and b!1373777 (not res!917004)) b!1373778))

(declare-fun m!1256513 () Bool)

(assert (=> d!147965 m!1256513))

(declare-fun m!1256515 () Bool)

(assert (=> d!147965 m!1256515))

(declare-fun m!1256517 () Bool)

(assert (=> b!1373778 m!1256517))

(assert (=> b!1373585 d!147965))

(declare-fun d!147969 () Bool)

(declare-fun lt!602936 () Bool)

(assert (=> d!147969 (= lt!602936 (select (content!749 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778260 () Bool)

(assert (=> d!147969 (= lt!602936 e!778260)))

(declare-fun res!917007 () Bool)

(assert (=> d!147969 (=> (not res!917007) (not e!778260))))

(assert (=> d!147969 (= res!917007 ((_ is Cons!32095) newAcc!98))))

(assert (=> d!147969 (= (contains!9692 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602936)))

(declare-fun b!1373779 () Bool)

(declare-fun e!778261 () Bool)

(assert (=> b!1373779 (= e!778260 e!778261)))

(declare-fun res!917006 () Bool)

(assert (=> b!1373779 (=> res!917006 e!778261)))

(assert (=> b!1373779 (= res!917006 (= (h!33304 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373780 () Bool)

(assert (=> b!1373780 (= e!778261 (contains!9692 (t!46785 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147969 res!917007) b!1373779))

(assert (= (and b!1373779 (not res!917006)) b!1373780))

(assert (=> d!147969 m!1256403))

(declare-fun m!1256519 () Bool)

(assert (=> d!147969 m!1256519))

(declare-fun m!1256521 () Bool)

(assert (=> b!1373780 m!1256521))

(assert (=> b!1373579 d!147969))

(declare-fun d!147971 () Bool)

(declare-fun lt!602937 () Bool)

(assert (=> d!147971 (= lt!602937 (select (content!749 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778262 () Bool)

(assert (=> d!147971 (= lt!602937 e!778262)))

(declare-fun res!917009 () Bool)

(assert (=> d!147971 (=> (not res!917009) (not e!778262))))

(assert (=> d!147971 (= res!917009 ((_ is Cons!32095) acc!866))))

(assert (=> d!147971 (= (contains!9692 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602937)))

(declare-fun b!1373781 () Bool)

(declare-fun e!778263 () Bool)

(assert (=> b!1373781 (= e!778262 e!778263)))

(declare-fun res!917008 () Bool)

(assert (=> b!1373781 (=> res!917008 e!778263)))

(assert (=> b!1373781 (= res!917008 (= (h!33304 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373782 () Bool)

(assert (=> b!1373782 (= e!778263 (contains!9692 (t!46785 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147971 res!917009) b!1373781))

(assert (= (and b!1373781 (not res!917008)) b!1373782))

(assert (=> d!147971 m!1256513))

(declare-fun m!1256523 () Bool)

(assert (=> d!147971 m!1256523))

(declare-fun m!1256525 () Bool)

(assert (=> b!1373782 m!1256525))

(assert (=> b!1373584 d!147971))

(check-sat (not b!1373782) (not b!1373778) (not b!1373690) (not d!147971) (not d!147913) (not b!1373700) (not b!1373699) (not b!1373697) (not b!1373749) (not b!1373647) (not d!147965) (not b!1373770) (not bm!65618) (not b!1373769) (not d!147927) (not b!1373688) (not b!1373723) (not b!1373780) (not d!147969) (not bm!65617) (not b!1373691) (not b!1373748))
(check-sat)
