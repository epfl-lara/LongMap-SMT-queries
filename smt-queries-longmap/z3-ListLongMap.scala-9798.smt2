; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116578 () Bool)

(assert start!116578)

(declare-fun b!1374659 () Bool)

(declare-fun res!917122 () Bool)

(declare-fun e!778793 () Bool)

(assert (=> b!1374659 (=> (not res!917122) (not e!778793))))

(declare-datatypes ((List!32083 0))(
  ( (Nil!32080) (Cons!32079 (h!33297 (_ BitVec 64)) (t!46769 List!32083)) )
))
(declare-fun acc!866 () List!32083)

(declare-fun contains!9768 (List!32083 (_ BitVec 64)) Bool)

(assert (=> b!1374659 (= res!917122 (not (contains!9768 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374660 () Bool)

(declare-fun res!917127 () Bool)

(assert (=> b!1374660 (=> (not res!917127) (not e!778793))))

(assert (=> b!1374660 (= res!917127 (not (contains!9768 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374661 () Bool)

(declare-fun res!917130 () Bool)

(declare-fun e!778794 () Bool)

(assert (=> b!1374661 (=> (not res!917130) (not e!778794))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93247 0))(
  ( (array!93248 (arr!45028 (Array (_ BitVec 32) (_ BitVec 64))) (size!45579 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93247)

(assert (=> b!1374661 (= res!917130 (bvslt from!3239 (size!45579 a!3861)))))

(declare-fun b!1374663 () Bool)

(declare-fun res!917132 () Bool)

(assert (=> b!1374663 (=> (not res!917132) (not e!778793))))

(declare-fun newAcc!98 () List!32083)

(declare-fun subseq!1127 (List!32083 List!32083) Bool)

(assert (=> b!1374663 (= res!917132 (subseq!1127 newAcc!98 acc!866))))

(declare-fun b!1374664 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93247 (_ BitVec 32) List!32083) Bool)

(assert (=> b!1374664 (= e!778794 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(assert (=> b!1374664 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45326 0))(
  ( (Unit!45327) )
))
(declare-fun lt!603515 () Unit!45326)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93247 List!32083 List!32083 (_ BitVec 32)) Unit!45326)

(assert (=> b!1374664 (= lt!603515 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1374665 () Bool)

(declare-fun res!917128 () Bool)

(assert (=> b!1374665 (=> (not res!917128) (not e!778794))))

(assert (=> b!1374665 (= res!917128 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1374666 () Bool)

(declare-fun res!917133 () Bool)

(assert (=> b!1374666 (=> (not res!917133) (not e!778793))))

(declare-fun noDuplicate!2599 (List!32083) Bool)

(assert (=> b!1374666 (= res!917133 (noDuplicate!2599 acc!866))))

(declare-fun b!1374667 () Bool)

(declare-fun res!917123 () Bool)

(assert (=> b!1374667 (=> (not res!917123) (not e!778793))))

(assert (=> b!1374667 (= res!917123 (not (contains!9768 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374668 () Bool)

(declare-fun res!917124 () Bool)

(assert (=> b!1374668 (=> (not res!917124) (not e!778794))))

(assert (=> b!1374668 (= res!917124 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun res!917125 () Bool)

(assert (=> start!116578 (=> (not res!917125) (not e!778793))))

(assert (=> start!116578 (= res!917125 (and (bvslt (size!45579 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45579 a!3861))))))

(assert (=> start!116578 e!778793))

(declare-fun array_inv!34309 (array!93247) Bool)

(assert (=> start!116578 (array_inv!34309 a!3861)))

(assert (=> start!116578 true))

(declare-fun b!1374662 () Bool)

(assert (=> b!1374662 (= e!778793 e!778794)))

(declare-fun res!917129 () Bool)

(assert (=> b!1374662 (=> (not res!917129) (not e!778794))))

(assert (=> b!1374662 (= res!917129 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!603516 () Unit!45326)

(declare-fun noDuplicateSubseq!314 (List!32083 List!32083) Unit!45326)

(assert (=> b!1374662 (= lt!603516 (noDuplicateSubseq!314 newAcc!98 acc!866))))

(declare-fun b!1374669 () Bool)

(declare-fun res!917126 () Bool)

(assert (=> b!1374669 (=> (not res!917126) (not e!778793))))

(assert (=> b!1374669 (= res!917126 (not (contains!9768 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374670 () Bool)

(declare-fun res!917131 () Bool)

(assert (=> b!1374670 (=> (not res!917131) (not e!778794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374670 (= res!917131 (not (validKeyInArray!0 (select (arr!45028 a!3861) from!3239))))))

(assert (= (and start!116578 res!917125) b!1374666))

(assert (= (and b!1374666 res!917133) b!1374659))

(assert (= (and b!1374659 res!917122) b!1374660))

(assert (= (and b!1374660 res!917127) b!1374667))

(assert (= (and b!1374667 res!917123) b!1374669))

(assert (= (and b!1374669 res!917126) b!1374663))

(assert (= (and b!1374663 res!917132) b!1374662))

(assert (= (and b!1374662 res!917129) b!1374661))

(assert (= (and b!1374661 res!917130) b!1374670))

(assert (= (and b!1374670 res!917131) b!1374668))

(assert (= (and b!1374668 res!917124) b!1374665))

(assert (= (and b!1374665 res!917128) b!1374664))

(declare-fun m!1258213 () Bool)

(assert (=> b!1374659 m!1258213))

(declare-fun m!1258215 () Bool)

(assert (=> b!1374663 m!1258215))

(declare-fun m!1258217 () Bool)

(assert (=> b!1374670 m!1258217))

(assert (=> b!1374670 m!1258217))

(declare-fun m!1258219 () Bool)

(assert (=> b!1374670 m!1258219))

(declare-fun m!1258221 () Bool)

(assert (=> b!1374669 m!1258221))

(declare-fun m!1258223 () Bool)

(assert (=> b!1374667 m!1258223))

(declare-fun m!1258225 () Bool)

(assert (=> b!1374664 m!1258225))

(declare-fun m!1258227 () Bool)

(assert (=> b!1374664 m!1258227))

(declare-fun m!1258229 () Bool)

(assert (=> b!1374664 m!1258229))

(declare-fun m!1258231 () Bool)

(assert (=> b!1374665 m!1258231))

(declare-fun m!1258233 () Bool)

(assert (=> b!1374662 m!1258233))

(declare-fun m!1258235 () Bool)

(assert (=> b!1374662 m!1258235))

(declare-fun m!1258237 () Bool)

(assert (=> b!1374666 m!1258237))

(declare-fun m!1258239 () Bool)

(assert (=> b!1374660 m!1258239))

(declare-fun m!1258241 () Bool)

(assert (=> start!116578 m!1258241))

(check-sat (not b!1374664) (not b!1374666) (not b!1374662) (not b!1374670) (not b!1374659) (not start!116578) (not b!1374663) (not b!1374665) (not b!1374669) (not b!1374660) (not b!1374667))
(check-sat)
(get-model)

(declare-fun d!148399 () Bool)

(declare-fun lt!603531 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!746 (List!32083) (InoxSet (_ BitVec 64)))

(assert (=> d!148399 (= lt!603531 (select (content!746 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778819 () Bool)

(assert (=> d!148399 (= lt!603531 e!778819)))

(declare-fun res!917211 () Bool)

(assert (=> d!148399 (=> (not res!917211) (not e!778819))))

(get-info :version)

(assert (=> d!148399 (= res!917211 ((_ is Cons!32079) newAcc!98))))

(assert (=> d!148399 (= (contains!9768 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603531)))

(declare-fun b!1374747 () Bool)

(declare-fun e!778818 () Bool)

(assert (=> b!1374747 (= e!778819 e!778818)))

(declare-fun res!917210 () Bool)

(assert (=> b!1374747 (=> res!917210 e!778818)))

(assert (=> b!1374747 (= res!917210 (= (h!33297 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374748 () Bool)

(assert (=> b!1374748 (= e!778818 (contains!9768 (t!46769 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148399 res!917211) b!1374747))

(assert (= (and b!1374747 (not res!917210)) b!1374748))

(declare-fun m!1258303 () Bool)

(assert (=> d!148399 m!1258303))

(declare-fun m!1258305 () Bool)

(assert (=> d!148399 m!1258305))

(declare-fun m!1258307 () Bool)

(assert (=> b!1374748 m!1258307))

(assert (=> b!1374669 d!148399))

(declare-fun d!148401 () Bool)

(declare-fun lt!603532 () Bool)

(assert (=> d!148401 (= lt!603532 (select (content!746 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778821 () Bool)

(assert (=> d!148401 (= lt!603532 e!778821)))

(declare-fun res!917213 () Bool)

(assert (=> d!148401 (=> (not res!917213) (not e!778821))))

(assert (=> d!148401 (= res!917213 ((_ is Cons!32079) acc!866))))

(assert (=> d!148401 (= (contains!9768 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603532)))

(declare-fun b!1374749 () Bool)

(declare-fun e!778820 () Bool)

(assert (=> b!1374749 (= e!778821 e!778820)))

(declare-fun res!917212 () Bool)

(assert (=> b!1374749 (=> res!917212 e!778820)))

(assert (=> b!1374749 (= res!917212 (= (h!33297 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374750 () Bool)

(assert (=> b!1374750 (= e!778820 (contains!9768 (t!46769 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148401 res!917213) b!1374749))

(assert (= (and b!1374749 (not res!917212)) b!1374750))

(declare-fun m!1258309 () Bool)

(assert (=> d!148401 m!1258309))

(declare-fun m!1258311 () Bool)

(assert (=> d!148401 m!1258311))

(declare-fun m!1258313 () Bool)

(assert (=> b!1374750 m!1258313))

(assert (=> b!1374659 d!148401))

(declare-fun bm!65677 () Bool)

(declare-fun c!128220 () Bool)

(declare-fun call!65680 () Bool)

(assert (=> bm!65677 (= call!65680 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128220 (Cons!32079 (select (arr!45028 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1374771 () Bool)

(declare-fun e!778840 () Bool)

(assert (=> b!1374771 (= e!778840 (contains!9768 newAcc!98 (select (arr!45028 a!3861) from!3239)))))

(declare-fun b!1374772 () Bool)

(declare-fun e!778841 () Bool)

(declare-fun e!778838 () Bool)

(assert (=> b!1374772 (= e!778841 e!778838)))

(assert (=> b!1374772 (= c!128220 (validKeyInArray!0 (select (arr!45028 a!3861) from!3239)))))

(declare-fun b!1374773 () Bool)

(assert (=> b!1374773 (= e!778838 call!65680)))

(declare-fun b!1374774 () Bool)

(assert (=> b!1374774 (= e!778838 call!65680)))

(declare-fun d!148403 () Bool)

(declare-fun res!917226 () Bool)

(declare-fun e!778839 () Bool)

(assert (=> d!148403 (=> res!917226 e!778839)))

(assert (=> d!148403 (= res!917226 (bvsge from!3239 (size!45579 a!3861)))))

(assert (=> d!148403 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778839)))

(declare-fun b!1374775 () Bool)

(assert (=> b!1374775 (= e!778839 e!778841)))

(declare-fun res!917228 () Bool)

(assert (=> b!1374775 (=> (not res!917228) (not e!778841))))

(assert (=> b!1374775 (= res!917228 (not e!778840))))

(declare-fun res!917227 () Bool)

(assert (=> b!1374775 (=> (not res!917227) (not e!778840))))

(assert (=> b!1374775 (= res!917227 (validKeyInArray!0 (select (arr!45028 a!3861) from!3239)))))

(assert (= (and d!148403 (not res!917226)) b!1374775))

(assert (= (and b!1374775 res!917227) b!1374771))

(assert (= (and b!1374775 res!917228) b!1374772))

(assert (= (and b!1374772 c!128220) b!1374773))

(assert (= (and b!1374772 (not c!128220)) b!1374774))

(assert (= (or b!1374773 b!1374774) bm!65677))

(assert (=> bm!65677 m!1258217))

(declare-fun m!1258315 () Bool)

(assert (=> bm!65677 m!1258315))

(assert (=> b!1374771 m!1258217))

(assert (=> b!1374771 m!1258217))

(declare-fun m!1258317 () Bool)

(assert (=> b!1374771 m!1258317))

(assert (=> b!1374772 m!1258217))

(assert (=> b!1374772 m!1258217))

(assert (=> b!1374772 m!1258219))

(assert (=> b!1374775 m!1258217))

(assert (=> b!1374775 m!1258217))

(assert (=> b!1374775 m!1258219))

(assert (=> b!1374664 d!148403))

(declare-fun c!128221 () Bool)

(declare-fun bm!65680 () Bool)

(declare-fun call!65683 () Bool)

(assert (=> bm!65680 (= call!65683 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128221 (Cons!32079 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(declare-fun b!1374776 () Bool)

(declare-fun e!778844 () Bool)

(assert (=> b!1374776 (= e!778844 (contains!9768 newAcc!98 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1374777 () Bool)

(declare-fun e!778845 () Bool)

(declare-fun e!778842 () Bool)

(assert (=> b!1374777 (= e!778845 e!778842)))

(assert (=> b!1374777 (= c!128221 (validKeyInArray!0 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1374778 () Bool)

(assert (=> b!1374778 (= e!778842 call!65683)))

(declare-fun b!1374779 () Bool)

(assert (=> b!1374779 (= e!778842 call!65683)))

(declare-fun d!148409 () Bool)

(declare-fun res!917229 () Bool)

(declare-fun e!778843 () Bool)

(assert (=> d!148409 (=> res!917229 e!778843)))

(assert (=> d!148409 (= res!917229 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45579 a!3861)))))

(assert (=> d!148409 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!778843)))

(declare-fun b!1374780 () Bool)

(assert (=> b!1374780 (= e!778843 e!778845)))

(declare-fun res!917231 () Bool)

(assert (=> b!1374780 (=> (not res!917231) (not e!778845))))

(assert (=> b!1374780 (= res!917231 (not e!778844))))

(declare-fun res!917230 () Bool)

(assert (=> b!1374780 (=> (not res!917230) (not e!778844))))

(assert (=> b!1374780 (= res!917230 (validKeyInArray!0 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!148409 (not res!917229)) b!1374780))

(assert (= (and b!1374780 res!917230) b!1374776))

(assert (= (and b!1374780 res!917231) b!1374777))

(assert (= (and b!1374777 c!128221) b!1374778))

(assert (= (and b!1374777 (not c!128221)) b!1374779))

(assert (= (or b!1374778 b!1374779) bm!65680))

(declare-fun m!1258319 () Bool)

(assert (=> bm!65680 m!1258319))

(declare-fun m!1258321 () Bool)

(assert (=> bm!65680 m!1258321))

(assert (=> b!1374776 m!1258319))

(assert (=> b!1374776 m!1258319))

(declare-fun m!1258323 () Bool)

(assert (=> b!1374776 m!1258323))

(assert (=> b!1374777 m!1258319))

(assert (=> b!1374777 m!1258319))

(declare-fun m!1258325 () Bool)

(assert (=> b!1374777 m!1258325))

(assert (=> b!1374780 m!1258319))

(assert (=> b!1374780 m!1258319))

(assert (=> b!1374780 m!1258325))

(assert (=> b!1374664 d!148409))

(declare-fun d!148411 () Bool)

(assert (=> d!148411 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!603535 () Unit!45326)

(declare-fun choose!80 (array!93247 List!32083 List!32083 (_ BitVec 32)) Unit!45326)

(assert (=> d!148411 (= lt!603535 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!148411 (bvslt (size!45579 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!148411 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!603535)))

(declare-fun bs!39382 () Bool)

(assert (= bs!39382 d!148411))

(assert (=> bs!39382 m!1258227))

(declare-fun m!1258339 () Bool)

(assert (=> bs!39382 m!1258339))

(assert (=> b!1374664 d!148411))

(declare-fun bm!65683 () Bool)

(declare-fun c!128224 () Bool)

(declare-fun call!65686 () Bool)

(assert (=> bm!65683 (= call!65686 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128224 (Cons!32079 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun e!778868 () Bool)

(declare-fun b!1374803 () Bool)

(assert (=> b!1374803 (= e!778868 (contains!9768 acc!866 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1374804 () Bool)

(declare-fun e!778869 () Bool)

(declare-fun e!778866 () Bool)

(assert (=> b!1374804 (= e!778869 e!778866)))

(assert (=> b!1374804 (= c!128224 (validKeyInArray!0 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1374805 () Bool)

(assert (=> b!1374805 (= e!778866 call!65686)))

(declare-fun b!1374806 () Bool)

(assert (=> b!1374806 (= e!778866 call!65686)))

(declare-fun d!148417 () Bool)

(declare-fun res!917250 () Bool)

(declare-fun e!778867 () Bool)

(assert (=> d!148417 (=> res!917250 e!778867)))

(assert (=> d!148417 (= res!917250 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45579 a!3861)))))

(assert (=> d!148417 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!778867)))

(declare-fun b!1374807 () Bool)

(assert (=> b!1374807 (= e!778867 e!778869)))

(declare-fun res!917252 () Bool)

(assert (=> b!1374807 (=> (not res!917252) (not e!778869))))

(assert (=> b!1374807 (= res!917252 (not e!778868))))

(declare-fun res!917251 () Bool)

(assert (=> b!1374807 (=> (not res!917251) (not e!778868))))

(assert (=> b!1374807 (= res!917251 (validKeyInArray!0 (select (arr!45028 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!148417 (not res!917250)) b!1374807))

(assert (= (and b!1374807 res!917251) b!1374803))

(assert (= (and b!1374807 res!917252) b!1374804))

(assert (= (and b!1374804 c!128224) b!1374805))

(assert (= (and b!1374804 (not c!128224)) b!1374806))

(assert (= (or b!1374805 b!1374806) bm!65683))

(assert (=> bm!65683 m!1258319))

(declare-fun m!1258345 () Bool)

(assert (=> bm!65683 m!1258345))

(assert (=> b!1374803 m!1258319))

(assert (=> b!1374803 m!1258319))

(declare-fun m!1258347 () Bool)

(assert (=> b!1374803 m!1258347))

(assert (=> b!1374804 m!1258319))

(assert (=> b!1374804 m!1258319))

(assert (=> b!1374804 m!1258325))

(assert (=> b!1374807 m!1258319))

(assert (=> b!1374807 m!1258319))

(assert (=> b!1374807 m!1258325))

(assert (=> b!1374665 d!148417))

(declare-fun d!148421 () Bool)

(assert (=> d!148421 (= (validKeyInArray!0 (select (arr!45028 a!3861) from!3239)) (and (not (= (select (arr!45028 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45028 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374670 d!148421))

(declare-fun d!148423 () Bool)

(declare-fun lt!603540 () Bool)

(assert (=> d!148423 (= lt!603540 (select (content!746 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778873 () Bool)

(assert (=> d!148423 (= lt!603540 e!778873)))

(declare-fun res!917256 () Bool)

(assert (=> d!148423 (=> (not res!917256) (not e!778873))))

(assert (=> d!148423 (= res!917256 ((_ is Cons!32079) acc!866))))

(assert (=> d!148423 (= (contains!9768 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603540)))

(declare-fun b!1374810 () Bool)

(declare-fun e!778872 () Bool)

(assert (=> b!1374810 (= e!778873 e!778872)))

(declare-fun res!917255 () Bool)

(assert (=> b!1374810 (=> res!917255 e!778872)))

(assert (=> b!1374810 (= res!917255 (= (h!33297 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374811 () Bool)

(assert (=> b!1374811 (= e!778872 (contains!9768 (t!46769 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148423 res!917256) b!1374810))

(assert (= (and b!1374810 (not res!917255)) b!1374811))

(assert (=> d!148423 m!1258309))

(declare-fun m!1258349 () Bool)

(assert (=> d!148423 m!1258349))

(declare-fun m!1258351 () Bool)

(assert (=> b!1374811 m!1258351))

(assert (=> b!1374660 d!148423))

(declare-fun d!148425 () Bool)

(declare-fun res!917267 () Bool)

(declare-fun e!778884 () Bool)

(assert (=> d!148425 (=> res!917267 e!778884)))

(assert (=> d!148425 (= res!917267 ((_ is Nil!32080) acc!866))))

(assert (=> d!148425 (= (noDuplicate!2599 acc!866) e!778884)))

(declare-fun b!1374822 () Bool)

(declare-fun e!778885 () Bool)

(assert (=> b!1374822 (= e!778884 e!778885)))

(declare-fun res!917268 () Bool)

(assert (=> b!1374822 (=> (not res!917268) (not e!778885))))

(assert (=> b!1374822 (= res!917268 (not (contains!9768 (t!46769 acc!866) (h!33297 acc!866))))))

(declare-fun b!1374823 () Bool)

(assert (=> b!1374823 (= e!778885 (noDuplicate!2599 (t!46769 acc!866)))))

(assert (= (and d!148425 (not res!917267)) b!1374822))

(assert (= (and b!1374822 res!917268) b!1374823))

(declare-fun m!1258367 () Bool)

(assert (=> b!1374822 m!1258367))

(declare-fun m!1258369 () Bool)

(assert (=> b!1374823 m!1258369))

(assert (=> b!1374666 d!148425))

(declare-fun d!148435 () Bool)

(declare-fun lt!603545 () Bool)

(assert (=> d!148435 (= lt!603545 (select (content!746 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778893 () Bool)

(assert (=> d!148435 (= lt!603545 e!778893)))

(declare-fun res!917276 () Bool)

(assert (=> d!148435 (=> (not res!917276) (not e!778893))))

(assert (=> d!148435 (= res!917276 ((_ is Cons!32079) newAcc!98))))

(assert (=> d!148435 (= (contains!9768 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603545)))

(declare-fun b!1374830 () Bool)

(declare-fun e!778892 () Bool)

(assert (=> b!1374830 (= e!778893 e!778892)))

(declare-fun res!917275 () Bool)

(assert (=> b!1374830 (=> res!917275 e!778892)))

(assert (=> b!1374830 (= res!917275 (= (h!33297 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374831 () Bool)

(assert (=> b!1374831 (= e!778892 (contains!9768 (t!46769 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148435 res!917276) b!1374830))

(assert (= (and b!1374830 (not res!917275)) b!1374831))

(assert (=> d!148435 m!1258303))

(declare-fun m!1258375 () Bool)

(assert (=> d!148435 m!1258375))

(declare-fun m!1258377 () Bool)

(assert (=> b!1374831 m!1258377))

(assert (=> b!1374667 d!148435))

(declare-fun call!65687 () Bool)

(declare-fun c!128225 () Bool)

(declare-fun bm!65684 () Bool)

(assert (=> bm!65684 (= call!65687 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128225 (Cons!32079 (select (arr!45028 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1374836 () Bool)

(declare-fun e!778900 () Bool)

(assert (=> b!1374836 (= e!778900 (contains!9768 acc!866 (select (arr!45028 a!3861) from!3239)))))

(declare-fun b!1374837 () Bool)

(declare-fun e!778901 () Bool)

(declare-fun e!778898 () Bool)

(assert (=> b!1374837 (= e!778901 e!778898)))

(assert (=> b!1374837 (= c!128225 (validKeyInArray!0 (select (arr!45028 a!3861) from!3239)))))

(declare-fun b!1374838 () Bool)

(assert (=> b!1374838 (= e!778898 call!65687)))

(declare-fun b!1374839 () Bool)

(assert (=> b!1374839 (= e!778898 call!65687)))

(declare-fun d!148439 () Bool)

(declare-fun res!917281 () Bool)

(declare-fun e!778899 () Bool)

(assert (=> d!148439 (=> res!917281 e!778899)))

(assert (=> d!148439 (= res!917281 (bvsge from!3239 (size!45579 a!3861)))))

(assert (=> d!148439 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778899)))

(declare-fun b!1374840 () Bool)

(assert (=> b!1374840 (= e!778899 e!778901)))

(declare-fun res!917283 () Bool)

(assert (=> b!1374840 (=> (not res!917283) (not e!778901))))

(assert (=> b!1374840 (= res!917283 (not e!778900))))

(declare-fun res!917282 () Bool)

(assert (=> b!1374840 (=> (not res!917282) (not e!778900))))

(assert (=> b!1374840 (= res!917282 (validKeyInArray!0 (select (arr!45028 a!3861) from!3239)))))

(assert (= (and d!148439 (not res!917281)) b!1374840))

(assert (= (and b!1374840 res!917282) b!1374836))

(assert (= (and b!1374840 res!917283) b!1374837))

(assert (= (and b!1374837 c!128225) b!1374838))

(assert (= (and b!1374837 (not c!128225)) b!1374839))

(assert (= (or b!1374838 b!1374839) bm!65684))

(assert (=> bm!65684 m!1258217))

(declare-fun m!1258379 () Bool)

(assert (=> bm!65684 m!1258379))

(assert (=> b!1374836 m!1258217))

(assert (=> b!1374836 m!1258217))

(declare-fun m!1258381 () Bool)

(assert (=> b!1374836 m!1258381))

(assert (=> b!1374837 m!1258217))

(assert (=> b!1374837 m!1258217))

(assert (=> b!1374837 m!1258219))

(assert (=> b!1374840 m!1258217))

(assert (=> b!1374840 m!1258217))

(assert (=> b!1374840 m!1258219))

(assert (=> b!1374662 d!148439))

(declare-fun d!148441 () Bool)

(assert (=> d!148441 (noDuplicate!2599 newAcc!98)))

(declare-fun lt!603550 () Unit!45326)

(declare-fun choose!2021 (List!32083 List!32083) Unit!45326)

(assert (=> d!148441 (= lt!603550 (choose!2021 newAcc!98 acc!866))))

(declare-fun e!778918 () Bool)

(assert (=> d!148441 e!778918))

(declare-fun res!917300 () Bool)

(assert (=> d!148441 (=> (not res!917300) (not e!778918))))

(assert (=> d!148441 (= res!917300 (subseq!1127 newAcc!98 acc!866))))

(assert (=> d!148441 (= (noDuplicateSubseq!314 newAcc!98 acc!866) lt!603550)))

(declare-fun b!1374857 () Bool)

(assert (=> b!1374857 (= e!778918 (noDuplicate!2599 acc!866))))

(assert (= (and d!148441 res!917300) b!1374857))

(declare-fun m!1258391 () Bool)

(assert (=> d!148441 m!1258391))

(declare-fun m!1258393 () Bool)

(assert (=> d!148441 m!1258393))

(assert (=> d!148441 m!1258215))

(assert (=> b!1374857 m!1258237))

(assert (=> b!1374662 d!148441))

(declare-fun d!148447 () Bool)

(assert (=> d!148447 (= (array_inv!34309 a!3861) (bvsge (size!45579 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116578 d!148447))

(declare-fun b!1374897 () Bool)

(declare-fun e!778954 () Bool)

(declare-fun e!778955 () Bool)

(assert (=> b!1374897 (= e!778954 e!778955)))

(declare-fun res!917333 () Bool)

(assert (=> b!1374897 (=> res!917333 e!778955)))

(declare-fun e!778953 () Bool)

(assert (=> b!1374897 (= res!917333 e!778953)))

(declare-fun res!917331 () Bool)

(assert (=> b!1374897 (=> (not res!917331) (not e!778953))))

(assert (=> b!1374897 (= res!917331 (= (h!33297 newAcc!98) (h!33297 acc!866)))))

(declare-fun b!1374899 () Bool)

(assert (=> b!1374899 (= e!778955 (subseq!1127 newAcc!98 (t!46769 acc!866)))))

(declare-fun b!1374896 () Bool)

(declare-fun e!778956 () Bool)

(assert (=> b!1374896 (= e!778956 e!778954)))

(declare-fun res!917332 () Bool)

(assert (=> b!1374896 (=> (not res!917332) (not e!778954))))

(assert (=> b!1374896 (= res!917332 ((_ is Cons!32079) acc!866))))

(declare-fun b!1374898 () Bool)

(assert (=> b!1374898 (= e!778953 (subseq!1127 (t!46769 newAcc!98) (t!46769 acc!866)))))

(declare-fun d!148449 () Bool)

(declare-fun res!917334 () Bool)

(assert (=> d!148449 (=> res!917334 e!778956)))

(assert (=> d!148449 (= res!917334 ((_ is Nil!32080) newAcc!98))))

(assert (=> d!148449 (= (subseq!1127 newAcc!98 acc!866) e!778956)))

(assert (= (and d!148449 (not res!917334)) b!1374896))

(assert (= (and b!1374896 res!917332) b!1374897))

(assert (= (and b!1374897 res!917331) b!1374898))

(assert (= (and b!1374897 (not res!917333)) b!1374899))

(declare-fun m!1258415 () Bool)

(assert (=> b!1374899 m!1258415))

(declare-fun m!1258419 () Bool)

(assert (=> b!1374898 m!1258419))

(assert (=> b!1374663 d!148449))

(check-sat (not b!1374807) (not bm!65684) (not d!148401) (not b!1374857) (not b!1374822) (not b!1374748) (not b!1374899) (not b!1374823) (not b!1374804) (not bm!65680) (not d!148435) (not b!1374803) (not b!1374772) (not b!1374771) (not d!148441) (not d!148411) (not b!1374831) (not b!1374836) (not bm!65677) (not d!148399) (not bm!65683) (not b!1374777) (not b!1374776) (not b!1374837) (not b!1374780) (not b!1374898) (not b!1374775) (not d!148423) (not b!1374750) (not b!1374811) (not b!1374840))
(check-sat)
