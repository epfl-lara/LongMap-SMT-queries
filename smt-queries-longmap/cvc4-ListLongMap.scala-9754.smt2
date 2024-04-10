; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115560 () Bool)

(assert start!115560)

(declare-fun b!1366944 () Bool)

(declare-fun res!910499 () Bool)

(declare-fun e!774701 () Bool)

(assert (=> b!1366944 (=> (not res!910499) (not e!774701))))

(declare-datatypes ((array!92836 0))(
  ( (array!92837 (arr!44845 (Array (_ BitVec 32) (_ BitVec 64))) (size!45395 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92836)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31913 0))(
  ( (Nil!31910) (Cons!31909 (h!33118 (_ BitVec 64)) (t!46607 List!31913)) )
))
(declare-fun acc!866 () List!31913)

(declare-fun contains!9595 (List!31913 (_ BitVec 64)) Bool)

(assert (=> b!1366944 (= res!910499 (not (contains!9595 acc!866 (select (arr!44845 a!3861) from!3239))))))

(declare-fun b!1366945 () Bool)

(declare-fun res!910494 () Bool)

(declare-fun e!774703 () Bool)

(assert (=> b!1366945 (=> (not res!910494) (not e!774703))))

(declare-fun newAcc!98 () List!31913)

(assert (=> b!1366945 (= res!910494 (not (contains!9595 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366946 () Bool)

(assert (=> b!1366946 (= e!774703 e!774701)))

(declare-fun res!910500 () Bool)

(assert (=> b!1366946 (=> (not res!910500) (not e!774701))))

(declare-fun arrayNoDuplicates!0 (array!92836 (_ BitVec 32) List!31913) Bool)

(assert (=> b!1366946 (= res!910500 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45127 0))(
  ( (Unit!45128) )
))
(declare-fun lt!601751 () Unit!45127)

(declare-fun noDuplicateSubseq!184 (List!31913 List!31913) Unit!45127)

(assert (=> b!1366946 (= lt!601751 (noDuplicateSubseq!184 newAcc!98 acc!866))))

(declare-fun b!1366948 () Bool)

(declare-fun res!910496 () Bool)

(assert (=> b!1366948 (=> (not res!910496) (not e!774703))))

(assert (=> b!1366948 (= res!910496 (not (contains!9595 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366949 () Bool)

(declare-fun res!910502 () Bool)

(assert (=> b!1366949 (=> (not res!910502) (not e!774703))))

(assert (=> b!1366949 (= res!910502 (not (contains!9595 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366950 () Bool)

(declare-fun res!910504 () Bool)

(assert (=> b!1366950 (=> (not res!910504) (not e!774703))))

(declare-fun noDuplicate!2452 (List!31913) Bool)

(assert (=> b!1366950 (= res!910504 (noDuplicate!2452 acc!866))))

(declare-fun b!1366951 () Bool)

(assert (=> b!1366951 (= e!774701 (not (noDuplicate!2452 newAcc!98)))))

(declare-fun lt!601752 () Unit!45127)

(declare-fun lt!601750 () List!31913)

(declare-fun lt!601753 () List!31913)

(assert (=> b!1366951 (= lt!601752 (noDuplicateSubseq!184 lt!601750 lt!601753))))

(assert (=> b!1366951 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601750)))

(declare-fun lt!601749 () Unit!45127)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92836 List!31913 List!31913 (_ BitVec 32)) Unit!45127)

(assert (=> b!1366951 (= lt!601749 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601753 lt!601750 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366951 (= lt!601750 (Cons!31909 (select (arr!44845 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366951 (= lt!601753 (Cons!31909 (select (arr!44845 a!3861) from!3239) acc!866))))

(declare-fun b!1366952 () Bool)

(declare-fun res!910498 () Bool)

(assert (=> b!1366952 (=> (not res!910498) (not e!774701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366952 (= res!910498 (validKeyInArray!0 (select (arr!44845 a!3861) from!3239)))))

(declare-fun b!1366953 () Bool)

(declare-fun res!910503 () Bool)

(assert (=> b!1366953 (=> (not res!910503) (not e!774701))))

(assert (=> b!1366953 (= res!910503 (bvslt from!3239 (size!45395 a!3861)))))

(declare-fun b!1366954 () Bool)

(declare-fun res!910497 () Bool)

(assert (=> b!1366954 (=> (not res!910497) (not e!774703))))

(assert (=> b!1366954 (= res!910497 (not (contains!9595 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910495 () Bool)

(assert (=> start!115560 (=> (not res!910495) (not e!774703))))

(assert (=> start!115560 (= res!910495 (and (bvslt (size!45395 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45395 a!3861))))))

(assert (=> start!115560 e!774703))

(declare-fun array_inv!33873 (array!92836) Bool)

(assert (=> start!115560 (array_inv!33873 a!3861)))

(assert (=> start!115560 true))

(declare-fun b!1366947 () Bool)

(declare-fun res!910501 () Bool)

(assert (=> b!1366947 (=> (not res!910501) (not e!774703))))

(declare-fun subseq!997 (List!31913 List!31913) Bool)

(assert (=> b!1366947 (= res!910501 (subseq!997 newAcc!98 acc!866))))

(assert (= (and start!115560 res!910495) b!1366950))

(assert (= (and b!1366950 res!910504) b!1366954))

(assert (= (and b!1366954 res!910497) b!1366948))

(assert (= (and b!1366948 res!910496) b!1366949))

(assert (= (and b!1366949 res!910502) b!1366945))

(assert (= (and b!1366945 res!910494) b!1366947))

(assert (= (and b!1366947 res!910501) b!1366946))

(assert (= (and b!1366946 res!910500) b!1366953))

(assert (= (and b!1366953 res!910503) b!1366952))

(assert (= (and b!1366952 res!910498) b!1366944))

(assert (= (and b!1366944 res!910499) b!1366951))

(declare-fun m!1251209 () Bool)

(assert (=> b!1366945 m!1251209))

(declare-fun m!1251211 () Bool)

(assert (=> b!1366948 m!1251211))

(declare-fun m!1251213 () Bool)

(assert (=> b!1366952 m!1251213))

(assert (=> b!1366952 m!1251213))

(declare-fun m!1251215 () Bool)

(assert (=> b!1366952 m!1251215))

(declare-fun m!1251217 () Bool)

(assert (=> start!115560 m!1251217))

(declare-fun m!1251219 () Bool)

(assert (=> b!1366946 m!1251219))

(declare-fun m!1251221 () Bool)

(assert (=> b!1366946 m!1251221))

(declare-fun m!1251223 () Bool)

(assert (=> b!1366951 m!1251223))

(assert (=> b!1366951 m!1251213))

(declare-fun m!1251225 () Bool)

(assert (=> b!1366951 m!1251225))

(declare-fun m!1251227 () Bool)

(assert (=> b!1366951 m!1251227))

(declare-fun m!1251229 () Bool)

(assert (=> b!1366951 m!1251229))

(declare-fun m!1251231 () Bool)

(assert (=> b!1366949 m!1251231))

(declare-fun m!1251233 () Bool)

(assert (=> b!1366947 m!1251233))

(declare-fun m!1251235 () Bool)

(assert (=> b!1366954 m!1251235))

(assert (=> b!1366944 m!1251213))

(assert (=> b!1366944 m!1251213))

(declare-fun m!1251237 () Bool)

(assert (=> b!1366944 m!1251237))

(declare-fun m!1251239 () Bool)

(assert (=> b!1366950 m!1251239))

(push 1)

(assert (not b!1366952))

(assert (not b!1366948))

(assert (not start!115560))

(assert (not b!1366950))

(assert (not b!1366944))

(assert (not b!1366949))

(assert (not b!1366946))

(assert (not b!1366951))

(assert (not b!1366945))

(assert (not b!1366947))

(assert (not b!1366954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146727 () Bool)

(declare-fun lt!601759 () Bool)

(declare-fun content!714 (List!31913) (Set (_ BitVec 64)))

(assert (=> d!146727 (= lt!601759 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!714 newAcc!98)))))

(declare-fun e!774715 () Bool)

(assert (=> d!146727 (= lt!601759 e!774715)))

(declare-fun res!910516 () Bool)

(assert (=> d!146727 (=> (not res!910516) (not e!774715))))

(assert (=> d!146727 (= res!910516 (is-Cons!31909 newAcc!98))))

(assert (=> d!146727 (= (contains!9595 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601759)))

(declare-fun b!1366965 () Bool)

(declare-fun e!774714 () Bool)

(assert (=> b!1366965 (= e!774715 e!774714)))

(declare-fun res!910515 () Bool)

(assert (=> b!1366965 (=> res!910515 e!774714)))

(assert (=> b!1366965 (= res!910515 (= (h!33118 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366966 () Bool)

(assert (=> b!1366966 (= e!774714 (contains!9595 (t!46607 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146727 res!910516) b!1366965))

(assert (= (and b!1366965 (not res!910515)) b!1366966))

(declare-fun m!1251247 () Bool)

(assert (=> d!146727 m!1251247))

(declare-fun m!1251249 () Bool)

(assert (=> d!146727 m!1251249))

(declare-fun m!1251251 () Bool)

(assert (=> b!1366966 m!1251251))

(assert (=> b!1366945 d!146727))

(declare-fun d!146731 () Bool)

(declare-fun res!910533 () Bool)

(declare-fun e!774734 () Bool)

(assert (=> d!146731 (=> res!910533 e!774734)))

(assert (=> d!146731 (= res!910533 (is-Nil!31910 acc!866))))

(assert (=> d!146731 (= (noDuplicate!2452 acc!866) e!774734)))

(declare-fun b!1366987 () Bool)

(declare-fun e!774735 () Bool)

(assert (=> b!1366987 (= e!774734 e!774735)))

(declare-fun res!910534 () Bool)

(assert (=> b!1366987 (=> (not res!910534) (not e!774735))))

(assert (=> b!1366987 (= res!910534 (not (contains!9595 (t!46607 acc!866) (h!33118 acc!866))))))

(declare-fun b!1366988 () Bool)

(assert (=> b!1366988 (= e!774735 (noDuplicate!2452 (t!46607 acc!866)))))

(assert (= (and d!146731 (not res!910533)) b!1366987))

(assert (= (and b!1366987 res!910534) b!1366988))

(declare-fun m!1251259 () Bool)

(assert (=> b!1366987 m!1251259))

(declare-fun m!1251261 () Bool)

(assert (=> b!1366988 m!1251261))

(assert (=> b!1366950 d!146731))

(declare-fun d!146735 () Bool)

(assert (=> d!146735 (= (array_inv!33873 a!3861) (bvsge (size!45395 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115560 d!146735))

(declare-fun d!146739 () Bool)

(declare-fun lt!601764 () Bool)

(assert (=> d!146739 (= lt!601764 (member (select (arr!44845 a!3861) from!3239) (content!714 acc!866)))))

(declare-fun e!774739 () Bool)

(assert (=> d!146739 (= lt!601764 e!774739)))

(declare-fun res!910538 () Bool)

(assert (=> d!146739 (=> (not res!910538) (not e!774739))))

(assert (=> d!146739 (= res!910538 (is-Cons!31909 acc!866))))

(assert (=> d!146739 (= (contains!9595 acc!866 (select (arr!44845 a!3861) from!3239)) lt!601764)))

(declare-fun b!1366991 () Bool)

(declare-fun e!774738 () Bool)

(assert (=> b!1366991 (= e!774739 e!774738)))

(declare-fun res!910537 () Bool)

(assert (=> b!1366991 (=> res!910537 e!774738)))

(assert (=> b!1366991 (= res!910537 (= (h!33118 acc!866) (select (arr!44845 a!3861) from!3239)))))

(declare-fun b!1366992 () Bool)

(assert (=> b!1366992 (= e!774738 (contains!9595 (t!46607 acc!866) (select (arr!44845 a!3861) from!3239)))))

(assert (= (and d!146739 res!910538) b!1366991))

(assert (= (and b!1366991 (not res!910537)) b!1366992))

(declare-fun m!1251269 () Bool)

(assert (=> d!146739 m!1251269))

(assert (=> d!146739 m!1251213))

(declare-fun m!1251271 () Bool)

(assert (=> d!146739 m!1251271))

(assert (=> b!1366992 m!1251213))

(declare-fun m!1251273 () Bool)

(assert (=> b!1366992 m!1251273))

(assert (=> b!1366944 d!146739))

(declare-fun d!146741 () Bool)

(declare-fun lt!601765 () Bool)

(assert (=> d!146741 (= lt!601765 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!714 newAcc!98)))))

(declare-fun e!774741 () Bool)

(assert (=> d!146741 (= lt!601765 e!774741)))

(declare-fun res!910540 () Bool)

(assert (=> d!146741 (=> (not res!910540) (not e!774741))))

(assert (=> d!146741 (= res!910540 (is-Cons!31909 newAcc!98))))

(assert (=> d!146741 (= (contains!9595 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601765)))

(declare-fun b!1366993 () Bool)

(declare-fun e!774740 () Bool)

(assert (=> b!1366993 (= e!774741 e!774740)))

(declare-fun res!910539 () Bool)

(assert (=> b!1366993 (=> res!910539 e!774740)))

(assert (=> b!1366993 (= res!910539 (= (h!33118 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366994 () Bool)

(assert (=> b!1366994 (= e!774740 (contains!9595 (t!46607 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146741 res!910540) b!1366993))

(assert (= (and b!1366993 (not res!910539)) b!1366994))

(assert (=> d!146741 m!1251247))

(declare-fun m!1251275 () Bool)

(assert (=> d!146741 m!1251275))

(declare-fun m!1251277 () Bool)

(assert (=> b!1366994 m!1251277))

(assert (=> b!1366949 d!146741))

(declare-fun d!146743 () Bool)

(declare-fun lt!601766 () Bool)

(assert (=> d!146743 (= lt!601766 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!714 acc!866)))))

(declare-fun e!774743 () Bool)

(assert (=> d!146743 (= lt!601766 e!774743)))

(declare-fun res!910542 () Bool)

(assert (=> d!146743 (=> (not res!910542) (not e!774743))))

(assert (=> d!146743 (= res!910542 (is-Cons!31909 acc!866))))

(assert (=> d!146743 (= (contains!9595 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601766)))

(declare-fun b!1366995 () Bool)

(declare-fun e!774742 () Bool)

(assert (=> b!1366995 (= e!774743 e!774742)))

(declare-fun res!910541 () Bool)

(assert (=> b!1366995 (=> res!910541 e!774742)))

(assert (=> b!1366995 (= res!910541 (= (h!33118 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366996 () Bool)

(assert (=> b!1366996 (= e!774742 (contains!9595 (t!46607 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146743 res!910542) b!1366995))

(assert (= (and b!1366995 (not res!910541)) b!1366996))

(assert (=> d!146743 m!1251269))

(declare-fun m!1251279 () Bool)

(assert (=> d!146743 m!1251279))

(declare-fun m!1251281 () Bool)

(assert (=> b!1366996 m!1251281))

(assert (=> b!1366954 d!146743))

(declare-fun d!146745 () Bool)

(declare-fun lt!601767 () Bool)

(assert (=> d!146745 (= lt!601767 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!714 acc!866)))))

(declare-fun e!774745 () Bool)

(assert (=> d!146745 (= lt!601767 e!774745)))

(declare-fun res!910544 () Bool)

(assert (=> d!146745 (=> (not res!910544) (not e!774745))))

(assert (=> d!146745 (= res!910544 (is-Cons!31909 acc!866))))

(assert (=> d!146745 (= (contains!9595 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601767)))

(declare-fun b!1366997 () Bool)

(declare-fun e!774744 () Bool)

(assert (=> b!1366997 (= e!774745 e!774744)))

(declare-fun res!910543 () Bool)

(assert (=> b!1366997 (=> res!910543 e!774744)))

(assert (=> b!1366997 (= res!910543 (= (h!33118 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366998 () Bool)

(assert (=> b!1366998 (= e!774744 (contains!9595 (t!46607 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146745 res!910544) b!1366997))

(assert (= (and b!1366997 (not res!910543)) b!1366998))

(assert (=> d!146745 m!1251269))

(declare-fun m!1251283 () Bool)

(assert (=> d!146745 m!1251283))

(declare-fun m!1251285 () Bool)

(assert (=> b!1366998 m!1251285))

(assert (=> b!1366948 d!146745))

(declare-fun b!1367027 () Bool)

(declare-fun e!774771 () Bool)

(assert (=> b!1367027 (= e!774771 (subseq!997 newAcc!98 (t!46607 acc!866)))))

(declare-fun d!146747 () Bool)

(declare-fun res!910571 () Bool)

(declare-fun e!774772 () Bool)

(assert (=> d!146747 (=> res!910571 e!774772)))

(assert (=> d!146747 (= res!910571 (is-Nil!31910 newAcc!98))))

(assert (=> d!146747 (= (subseq!997 newAcc!98 acc!866) e!774772)))

(declare-fun b!1367026 () Bool)

(declare-fun e!774770 () Bool)

(assert (=> b!1367026 (= e!774770 (subseq!997 (t!46607 newAcc!98) (t!46607 acc!866)))))

(declare-fun b!1367024 () Bool)

(declare-fun e!774773 () Bool)

(assert (=> b!1367024 (= e!774772 e!774773)))

(declare-fun res!910568 () Bool)

(assert (=> b!1367024 (=> (not res!910568) (not e!774773))))

(assert (=> b!1367024 (= res!910568 (is-Cons!31909 acc!866))))

(declare-fun b!1367025 () Bool)

(assert (=> b!1367025 (= e!774773 e!774771)))

(declare-fun res!910570 () Bool)

(assert (=> b!1367025 (=> res!910570 e!774771)))

(assert (=> b!1367025 (= res!910570 e!774770)))

(declare-fun res!910569 () Bool)

(assert (=> b!1367025 (=> (not res!910569) (not e!774770))))

(assert (=> b!1367025 (= res!910569 (= (h!33118 newAcc!98) (h!33118 acc!866)))))

(assert (= (and d!146747 (not res!910571)) b!1367024))

(assert (= (and b!1367024 res!910568) b!1367025))

(assert (= (and b!1367025 res!910569) b!1367026))

(assert (= (and b!1367025 (not res!910570)) b!1367027))

(declare-fun m!1251305 () Bool)

(assert (=> b!1367027 m!1251305))

(declare-fun m!1251307 () Bool)

(assert (=> b!1367026 m!1251307))

(assert (=> b!1366947 d!146747))

(declare-fun d!146759 () Bool)

(assert (=> d!146759 (= (validKeyInArray!0 (select (arr!44845 a!3861) from!3239)) (and (not (= (select (arr!44845 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44845 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1366952 d!146759))

(declare-fun b!1367054 () Bool)

(declare-fun e!774801 () Bool)

(declare-fun e!774800 () Bool)

(assert (=> b!1367054 (= e!774801 e!774800)))

(declare-fun c!127670 () Bool)

(assert (=> b!1367054 (= c!127670 (validKeyInArray!0 (select (arr!44845 a!3861) from!3239)))))

(declare-fun d!146763 () Bool)

(declare-fun res!910596 () Bool)

(declare-fun e!774798 () Bool)

(assert (=> d!146763 (=> res!910596 e!774798)))

(assert (=> d!146763 (= res!910596 (bvsge from!3239 (size!45395 a!3861)))))

(assert (=> d!146763 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774798)))

(declare-fun b!1367055 () Bool)

(declare-fun call!65477 () Bool)

(assert (=> b!1367055 (= e!774800 call!65477)))

(declare-fun e!774799 () Bool)

(declare-fun b!1367056 () Bool)

(assert (=> b!1367056 (= e!774799 (contains!9595 acc!866 (select (arr!44845 a!3861) from!3239)))))

(declare-fun b!1367057 () Bool)

(assert (=> b!1367057 (= e!774800 call!65477)))

(declare-fun b!1367058 () Bool)

(assert (=> b!1367058 (= e!774798 e!774801)))

(declare-fun res!910595 () Bool)

(assert (=> b!1367058 (=> (not res!910595) (not e!774801))))

(assert (=> b!1367058 (= res!910595 (not e!774799))))

(declare-fun res!910594 () Bool)

(assert (=> b!1367058 (=> (not res!910594) (not e!774799))))

(assert (=> b!1367058 (= res!910594 (validKeyInArray!0 (select (arr!44845 a!3861) from!3239)))))

(declare-fun bm!65474 () Bool)

(assert (=> bm!65474 (= call!65477 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127670 (Cons!31909 (select (arr!44845 a!3861) from!3239) acc!866) acc!866)))))

(assert (= (and d!146763 (not res!910596)) b!1367058))

(assert (= (and b!1367058 res!910594) b!1367056))

(assert (= (and b!1367058 res!910595) b!1367054))

(assert (= (and b!1367054 c!127670) b!1367055))

(assert (= (and b!1367054 (not c!127670)) b!1367057))

(assert (= (or b!1367055 b!1367057) bm!65474))

(assert (=> b!1367054 m!1251213))

(assert (=> b!1367054 m!1251213))

(assert (=> b!1367054 m!1251215))

(assert (=> b!1367056 m!1251213))

(assert (=> b!1367056 m!1251213))

(assert (=> b!1367056 m!1251237))

(assert (=> b!1367058 m!1251213))

(assert (=> b!1367058 m!1251213))

(assert (=> b!1367058 m!1251215))

(assert (=> bm!65474 m!1251213))

(declare-fun m!1251323 () Bool)

(assert (=> bm!65474 m!1251323))

(assert (=> b!1366946 d!146763))

(declare-fun d!146769 () Bool)

(assert (=> d!146769 (noDuplicate!2452 newAcc!98)))

(declare-fun lt!601780 () Unit!45127)

(declare-fun choose!1996 (List!31913 List!31913) Unit!45127)

(assert (=> d!146769 (= lt!601780 (choose!1996 newAcc!98 acc!866))))

(declare-fun e!774818 () Bool)

(assert (=> d!146769 e!774818))

(declare-fun res!910611 () Bool)

(assert (=> d!146769 (=> (not res!910611) (not e!774818))))

(assert (=> d!146769 (= res!910611 (subseq!997 newAcc!98 acc!866))))

(assert (=> d!146769 (= (noDuplicateSubseq!184 newAcc!98 acc!866) lt!601780)))

(declare-fun b!1367077 () Bool)

(assert (=> b!1367077 (= e!774818 (noDuplicate!2452 acc!866))))

(assert (= (and d!146769 res!910611) b!1367077))

(assert (=> d!146769 m!1251223))

(declare-fun m!1251333 () Bool)

(assert (=> d!146769 m!1251333))

(assert (=> d!146769 m!1251233))

(assert (=> b!1367077 m!1251239))

(assert (=> b!1366946 d!146769))

(declare-fun d!146775 () Bool)

(declare-fun res!910614 () Bool)

(declare-fun e!774821 () Bool)

(assert (=> d!146775 (=> res!910614 e!774821)))

(assert (=> d!146775 (= res!910614 (is-Nil!31910 newAcc!98))))

(assert (=> d!146775 (= (noDuplicate!2452 newAcc!98) e!774821)))

(declare-fun b!1367080 () Bool)

(declare-fun e!774822 () Bool)

(assert (=> b!1367080 (= e!774821 e!774822)))

(declare-fun res!910615 () Bool)

(assert (=> b!1367080 (=> (not res!910615) (not e!774822))))

(assert (=> b!1367080 (= res!910615 (not (contains!9595 (t!46607 newAcc!98) (h!33118 newAcc!98))))))

(declare-fun b!1367081 () Bool)

(assert (=> b!1367081 (= e!774822 (noDuplicate!2452 (t!46607 newAcc!98)))))

(assert (= (and d!146775 (not res!910614)) b!1367080))

(assert (= (and b!1367080 res!910615) b!1367081))

(declare-fun m!1251337 () Bool)

(assert (=> b!1367080 m!1251337))

(declare-fun m!1251339 () Bool)

(assert (=> b!1367081 m!1251339))

(assert (=> b!1366951 d!146775))

(declare-fun d!146777 () Bool)

(assert (=> d!146777 (noDuplicate!2452 lt!601750)))

(declare-fun lt!601782 () Unit!45127)

(assert (=> d!146777 (= lt!601782 (choose!1996 lt!601750 lt!601753))))

(declare-fun e!774823 () Bool)

(assert (=> d!146777 e!774823))

(declare-fun res!910616 () Bool)

(assert (=> d!146777 (=> (not res!910616) (not e!774823))))

(assert (=> d!146777 (= res!910616 (subseq!997 lt!601750 lt!601753))))

(assert (=> d!146777 (= (noDuplicateSubseq!184 lt!601750 lt!601753) lt!601782)))

(declare-fun b!1367082 () Bool)

(assert (=> b!1367082 (= e!774823 (noDuplicate!2452 lt!601753))))

(assert (= (and d!146777 res!910616) b!1367082))

(declare-fun m!1251345 () Bool)

(assert (=> d!146777 m!1251345))

(declare-fun m!1251347 () Bool)

(assert (=> d!146777 m!1251347))

(declare-fun m!1251349 () Bool)

(assert (=> d!146777 m!1251349))

(declare-fun m!1251351 () Bool)

(assert (=> b!1367082 m!1251351))

(assert (=> b!1366951 d!146777))

(declare-fun b!1367083 () Bool)

(declare-fun e!774827 () Bool)

(declare-fun e!774826 () Bool)

(assert (=> b!1367083 (= e!774827 e!774826)))

(declare-fun c!127673 () Bool)

(assert (=> b!1367083 (= c!127673 (validKeyInArray!0 (select (arr!44845 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!146781 () Bool)

(declare-fun res!910619 () Bool)

(declare-fun e!774824 () Bool)

(assert (=> d!146781 (=> res!910619 e!774824)))

(assert (=> d!146781 (= res!910619 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45395 a!3861)))))

(assert (=> d!146781 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601750) e!774824)))

(declare-fun b!1367084 () Bool)

(declare-fun call!65480 () Bool)

(assert (=> b!1367084 (= e!774826 call!65480)))

(declare-fun b!1367085 () Bool)

(declare-fun e!774825 () Bool)

(assert (=> b!1367085 (= e!774825 (contains!9595 lt!601750 (select (arr!44845 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367086 () Bool)

(assert (=> b!1367086 (= e!774826 call!65480)))

(declare-fun b!1367087 () Bool)

(assert (=> b!1367087 (= e!774824 e!774827)))

(declare-fun res!910618 () Bool)

(assert (=> b!1367087 (=> (not res!910618) (not e!774827))))

(assert (=> b!1367087 (= res!910618 (not e!774825))))

(declare-fun res!910617 () Bool)

(assert (=> b!1367087 (=> (not res!910617) (not e!774825))))

(assert (=> b!1367087 (= res!910617 (validKeyInArray!0 (select (arr!44845 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65477 () Bool)

(assert (=> bm!65477 (= call!65480 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127673 (Cons!31909 (select (arr!44845 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!601750) lt!601750)))))

(assert (= (and d!146781 (not res!910619)) b!1367087))

(assert (= (and b!1367087 res!910617) b!1367085))

(assert (= (and b!1367087 res!910618) b!1367083))

(assert (= (and b!1367083 c!127673) b!1367084))

(assert (= (and b!1367083 (not c!127673)) b!1367086))

(assert (= (or b!1367084 b!1367086) bm!65477))

(declare-fun m!1251353 () Bool)

(assert (=> b!1367083 m!1251353))

(assert (=> b!1367083 m!1251353))

(declare-fun m!1251355 () Bool)

(assert (=> b!1367083 m!1251355))

(assert (=> b!1367085 m!1251353))

(assert (=> b!1367085 m!1251353))

(declare-fun m!1251357 () Bool)

(assert (=> b!1367085 m!1251357))

(assert (=> b!1367087 m!1251353))

(assert (=> b!1367087 m!1251353))

(assert (=> b!1367087 m!1251355))

(assert (=> bm!65477 m!1251353))

(declare-fun m!1251359 () Bool)

(assert (=> bm!65477 m!1251359))

(assert (=> b!1366951 d!146781))

(declare-fun d!146783 () Bool)

(assert (=> d!146783 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601750)))

(declare-fun lt!601785 () Unit!45127)

(declare-fun choose!80 (array!92836 List!31913 List!31913 (_ BitVec 32)) Unit!45127)

(assert (=> d!146783 (= lt!601785 (choose!80 a!3861 lt!601753 lt!601750 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146783 (bvslt (size!45395 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146783 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601753 lt!601750 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601785)))

(declare-fun bs!39216 () Bool)

