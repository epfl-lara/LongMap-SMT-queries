; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115494 () Bool)

(assert start!115494)

(declare-fun b!1366463 () Bool)

(declare-fun e!774448 () Bool)

(declare-fun e!774450 () Bool)

(assert (=> b!1366463 (= e!774448 e!774450)))

(declare-fun res!910037 () Bool)

(assert (=> b!1366463 (=> (not res!910037) (not e!774450))))

(declare-datatypes ((array!92815 0))(
  ( (array!92816 (arr!44836 (Array (_ BitVec 32) (_ BitVec 64))) (size!45386 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92815)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31904 0))(
  ( (Nil!31901) (Cons!31900 (h!33109 (_ BitVec 64)) (t!46598 List!31904)) )
))
(declare-fun acc!866 () List!31904)

(declare-fun arrayNoDuplicates!0 (array!92815 (_ BitVec 32) List!31904) Bool)

(assert (=> b!1366463 (= res!910037 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45109 0))(
  ( (Unit!45110) )
))
(declare-fun lt!601578 () Unit!45109)

(declare-fun newAcc!98 () List!31904)

(declare-fun noDuplicateSubseq!175 (List!31904 List!31904) Unit!45109)

(assert (=> b!1366463 (= lt!601578 (noDuplicateSubseq!175 newAcc!98 acc!866))))

(declare-fun b!1366464 () Bool)

(declare-fun res!910047 () Bool)

(assert (=> b!1366464 (=> (not res!910047) (not e!774450))))

(assert (=> b!1366464 (= res!910047 (bvslt from!3239 (size!45386 a!3861)))))

(declare-fun b!1366465 () Bool)

(declare-fun res!910040 () Bool)

(assert (=> b!1366465 (=> (not res!910040) (not e!774448))))

(declare-fun contains!9586 (List!31904 (_ BitVec 64)) Bool)

(assert (=> b!1366465 (= res!910040 (not (contains!9586 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366466 () Bool)

(declare-fun res!910045 () Bool)

(assert (=> b!1366466 (=> (not res!910045) (not e!774448))))

(declare-fun noDuplicate!2443 (List!31904) Bool)

(assert (=> b!1366466 (= res!910045 (noDuplicate!2443 acc!866))))

(declare-fun res!910039 () Bool)

(assert (=> start!115494 (=> (not res!910039) (not e!774448))))

(assert (=> start!115494 (= res!910039 (and (bvslt (size!45386 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45386 a!3861))))))

(assert (=> start!115494 e!774448))

(declare-fun array_inv!33864 (array!92815) Bool)

(assert (=> start!115494 (array_inv!33864 a!3861)))

(assert (=> start!115494 true))

(declare-fun b!1366467 () Bool)

(declare-fun res!910038 () Bool)

(assert (=> b!1366467 (=> (not res!910038) (not e!774450))))

(assert (=> b!1366467 (= res!910038 (not (contains!9586 acc!866 (select (arr!44836 a!3861) from!3239))))))

(declare-fun b!1366468 () Bool)

(declare-fun res!910043 () Bool)

(assert (=> b!1366468 (=> (not res!910043) (not e!774450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366468 (= res!910043 (validKeyInArray!0 (select (arr!44836 a!3861) from!3239)))))

(declare-fun b!1366469 () Bool)

(declare-fun res!910046 () Bool)

(assert (=> b!1366469 (=> (not res!910046) (not e!774448))))

(assert (=> b!1366469 (= res!910046 (not (contains!9586 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366470 () Bool)

(declare-fun res!910041 () Bool)

(assert (=> b!1366470 (=> (not res!910041) (not e!774448))))

(assert (=> b!1366470 (= res!910041 (not (contains!9586 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366471 () Bool)

(declare-fun res!910048 () Bool)

(assert (=> b!1366471 (=> (not res!910048) (not e!774448))))

(assert (=> b!1366471 (= res!910048 (not (contains!9586 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366472 () Bool)

(declare-fun e!774451 () Bool)

(assert (=> b!1366472 (= e!774450 (not e!774451))))

(declare-fun res!910044 () Bool)

(assert (=> b!1366472 (=> (not res!910044) (not e!774451))))

(declare-fun lt!601579 () List!31904)

(declare-fun lt!601576 () List!31904)

(declare-fun subseq!988 (List!31904 List!31904) Bool)

(assert (=> b!1366472 (= res!910044 (subseq!988 lt!601579 lt!601576))))

(assert (=> b!1366472 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601579)))

(declare-fun lt!601577 () Unit!45109)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92815 List!31904 List!31904 (_ BitVec 32)) Unit!45109)

(assert (=> b!1366472 (= lt!601577 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601576 lt!601579 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366472 (= lt!601579 (Cons!31900 (select (arr!44836 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366472 (= lt!601576 (Cons!31900 (select (arr!44836 a!3861) from!3239) acc!866))))

(declare-fun b!1366473 () Bool)

(assert (=> b!1366473 (= e!774451 (noDuplicate!2443 lt!601576))))

(declare-fun b!1366474 () Bool)

(declare-fun res!910042 () Bool)

(assert (=> b!1366474 (=> (not res!910042) (not e!774448))))

(assert (=> b!1366474 (= res!910042 (subseq!988 newAcc!98 acc!866))))

(assert (= (and start!115494 res!910039) b!1366466))

(assert (= (and b!1366466 res!910045) b!1366469))

(assert (= (and b!1366469 res!910046) b!1366470))

(assert (= (and b!1366470 res!910041) b!1366465))

(assert (= (and b!1366465 res!910040) b!1366471))

(assert (= (and b!1366471 res!910048) b!1366474))

(assert (= (and b!1366474 res!910042) b!1366463))

(assert (= (and b!1366463 res!910037) b!1366464))

(assert (= (and b!1366464 res!910047) b!1366468))

(assert (= (and b!1366468 res!910043) b!1366467))

(assert (= (and b!1366467 res!910038) b!1366472))

(assert (= (and b!1366472 res!910044) b!1366473))

(declare-fun m!1250765 () Bool)

(assert (=> b!1366467 m!1250765))

(assert (=> b!1366467 m!1250765))

(declare-fun m!1250767 () Bool)

(assert (=> b!1366467 m!1250767))

(assert (=> b!1366468 m!1250765))

(assert (=> b!1366468 m!1250765))

(declare-fun m!1250769 () Bool)

(assert (=> b!1366468 m!1250769))

(declare-fun m!1250771 () Bool)

(assert (=> b!1366472 m!1250771))

(declare-fun m!1250773 () Bool)

(assert (=> b!1366472 m!1250773))

(declare-fun m!1250775 () Bool)

(assert (=> b!1366472 m!1250775))

(assert (=> b!1366472 m!1250765))

(declare-fun m!1250777 () Bool)

(assert (=> b!1366473 m!1250777))

(declare-fun m!1250779 () Bool)

(assert (=> start!115494 m!1250779))

(declare-fun m!1250781 () Bool)

(assert (=> b!1366466 m!1250781))

(declare-fun m!1250783 () Bool)

(assert (=> b!1366471 m!1250783))

(declare-fun m!1250785 () Bool)

(assert (=> b!1366470 m!1250785))

(declare-fun m!1250787 () Bool)

(assert (=> b!1366463 m!1250787))

(declare-fun m!1250789 () Bool)

(assert (=> b!1366463 m!1250789))

(declare-fun m!1250791 () Bool)

(assert (=> b!1366469 m!1250791))

(declare-fun m!1250793 () Bool)

(assert (=> b!1366465 m!1250793))

(declare-fun m!1250795 () Bool)

(assert (=> b!1366474 m!1250795))

(push 1)

(assert (not b!1366467))

(assert (not b!1366471))

(assert (not b!1366472))

(assert (not b!1366474))

(assert (not b!1366469))

(assert (not b!1366465))

(assert (not start!115494))

(assert (not b!1366470))

(assert (not b!1366463))

(assert (not b!1366466))

(assert (not b!1366468))

(assert (not b!1366473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146637 () Bool)

(declare-fun lt!601590 () Bool)

(declare-fun content!713 (List!31904) (Set (_ BitVec 64)))

(assert (=> d!146637 (= lt!601590 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!713 newAcc!98)))))

(declare-fun e!774478 () Bool)

(assert (=> d!146637 (= lt!601590 e!774478)))

(declare-fun res!910076 () Bool)

(assert (=> d!146637 (=> (not res!910076) (not e!774478))))

(assert (=> d!146637 (= res!910076 (is-Cons!31900 newAcc!98))))

(assert (=> d!146637 (= (contains!9586 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601590)))

(declare-fun b!1366501 () Bool)

(declare-fun e!774479 () Bool)

(assert (=> b!1366501 (= e!774478 e!774479)))

(declare-fun res!910075 () Bool)

(assert (=> b!1366501 (=> res!910075 e!774479)))

(assert (=> b!1366501 (= res!910075 (= (h!33109 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366502 () Bool)

(assert (=> b!1366502 (= e!774479 (contains!9586 (t!46598 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146637 res!910076) b!1366501))

(assert (= (and b!1366501 (not res!910075)) b!1366502))

(declare-fun m!1250821 () Bool)

(assert (=> d!146637 m!1250821))

(declare-fun m!1250823 () Bool)

(assert (=> d!146637 m!1250823))

(declare-fun m!1250825 () Bool)

(assert (=> b!1366502 m!1250825))

(assert (=> b!1366465 d!146637))

(declare-fun d!146645 () Bool)

(declare-fun res!910095 () Bool)

(declare-fun e!774500 () Bool)

(assert (=> d!146645 (=> res!910095 e!774500)))

(assert (=> d!146645 (= res!910095 (is-Nil!31901 acc!866))))

(assert (=> d!146645 (= (noDuplicate!2443 acc!866) e!774500)))

(declare-fun b!1366525 () Bool)

(declare-fun e!774501 () Bool)

(assert (=> b!1366525 (= e!774500 e!774501)))

(declare-fun res!910096 () Bool)

(assert (=> b!1366525 (=> (not res!910096) (not e!774501))))

(assert (=> b!1366525 (= res!910096 (not (contains!9586 (t!46598 acc!866) (h!33109 acc!866))))))

(declare-fun b!1366526 () Bool)

(assert (=> b!1366526 (= e!774501 (noDuplicate!2443 (t!46598 acc!866)))))

(assert (= (and d!146645 (not res!910095)) b!1366525))

(assert (= (and b!1366525 res!910096) b!1366526))

(declare-fun m!1250827 () Bool)

(assert (=> b!1366525 m!1250827))

(declare-fun m!1250829 () Bool)

(assert (=> b!1366526 m!1250829))

(assert (=> b!1366466 d!146645))

(declare-fun d!146647 () Bool)

(declare-fun res!910097 () Bool)

(declare-fun e!774502 () Bool)

(assert (=> d!146647 (=> res!910097 e!774502)))

(assert (=> d!146647 (= res!910097 (is-Nil!31901 lt!601576))))

(assert (=> d!146647 (= (noDuplicate!2443 lt!601576) e!774502)))

(declare-fun b!1366527 () Bool)

(declare-fun e!774503 () Bool)

(assert (=> b!1366527 (= e!774502 e!774503)))

(declare-fun res!910098 () Bool)

(assert (=> b!1366527 (=> (not res!910098) (not e!774503))))

(assert (=> b!1366527 (= res!910098 (not (contains!9586 (t!46598 lt!601576) (h!33109 lt!601576))))))

(declare-fun b!1366528 () Bool)

(assert (=> b!1366528 (= e!774503 (noDuplicate!2443 (t!46598 lt!601576)))))

(assert (= (and d!146647 (not res!910097)) b!1366527))

(assert (= (and b!1366527 res!910098) b!1366528))

(declare-fun m!1250831 () Bool)

(assert (=> b!1366527 m!1250831))

(declare-fun m!1250833 () Bool)

(assert (=> b!1366528 m!1250833))

(assert (=> b!1366473 d!146647))

(declare-fun d!146649 () Bool)

(assert (=> d!146649 (= (array_inv!33864 a!3861) (bvsge (size!45386 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115494 d!146649))

(declare-fun b!1366558 () Bool)

(declare-fun e!774531 () Bool)

(declare-fun e!774532 () Bool)

(assert (=> b!1366558 (= e!774531 e!774532)))

(declare-fun res!910123 () Bool)

(assert (=> b!1366558 (=> (not res!910123) (not e!774532))))

(assert (=> b!1366558 (= res!910123 (is-Cons!31900 acc!866))))

(declare-fun b!1366561 () Bool)

(declare-fun e!774528 () Bool)

(assert (=> b!1366561 (= e!774528 (subseq!988 newAcc!98 (t!46598 acc!866)))))

(declare-fun b!1366559 () Bool)

(assert (=> b!1366559 (= e!774532 e!774528)))

(declare-fun res!910125 () Bool)

(assert (=> b!1366559 (=> res!910125 e!774528)))

(declare-fun e!774530 () Bool)

(assert (=> b!1366559 (= res!910125 e!774530)))

(declare-fun res!910122 () Bool)

(assert (=> b!1366559 (=> (not res!910122) (not e!774530))))

(assert (=> b!1366559 (= res!910122 (= (h!33109 newAcc!98) (h!33109 acc!866)))))

(declare-fun b!1366560 () Bool)

(assert (=> b!1366560 (= e!774530 (subseq!988 (t!46598 newAcc!98) (t!46598 acc!866)))))

(declare-fun d!146651 () Bool)

(declare-fun res!910124 () Bool)

(assert (=> d!146651 (=> res!910124 e!774531)))

(assert (=> d!146651 (= res!910124 (is-Nil!31901 newAcc!98))))

(assert (=> d!146651 (= (subseq!988 newAcc!98 acc!866) e!774531)))

(assert (= (and d!146651 (not res!910124)) b!1366558))

(assert (= (and b!1366558 res!910123) b!1366559))

(assert (= (and b!1366559 res!910122) b!1366560))

(assert (= (and b!1366559 (not res!910125)) b!1366561))

(declare-fun m!1250841 () Bool)

(assert (=> b!1366561 m!1250841))

(declare-fun m!1250843 () Bool)

(assert (=> b!1366560 m!1250843))

(assert (=> b!1366474 d!146651))

(declare-fun b!1366599 () Bool)

(declare-fun e!774569 () Bool)

(declare-fun e!774570 () Bool)

(assert (=> b!1366599 (= e!774569 e!774570)))

(declare-fun res!910157 () Bool)

(assert (=> b!1366599 (=> (not res!910157) (not e!774570))))

(declare-fun e!774567 () Bool)

(assert (=> b!1366599 (= res!910157 (not e!774567))))

(declare-fun res!910156 () Bool)

(assert (=> b!1366599 (=> (not res!910156) (not e!774567))))

(assert (=> b!1366599 (= res!910156 (validKeyInArray!0 (select (arr!44836 a!3861) from!3239)))))

(declare-fun b!1366600 () Bool)

(assert (=> b!1366600 (= e!774567 (contains!9586 acc!866 (select (arr!44836 a!3861) from!3239)))))

(declare-fun d!146657 () Bool)

(declare-fun res!910155 () Bool)

(assert (=> d!146657 (=> res!910155 e!774569)))

(assert (=> d!146657 (= res!910155 (bvsge from!3239 (size!45386 a!3861)))))

(assert (=> d!146657 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774569)))

(declare-fun b!1366601 () Bool)

(declare-fun e!774568 () Bool)

(assert (=> b!1366601 (= e!774570 e!774568)))

(declare-fun c!127662 () Bool)

(assert (=> b!1366601 (= c!127662 (validKeyInArray!0 (select (arr!44836 a!3861) from!3239)))))

(declare-fun b!1366602 () Bool)

(declare-fun call!65469 () Bool)

(assert (=> b!1366602 (= e!774568 call!65469)))

(declare-fun b!1366603 () Bool)

(assert (=> b!1366603 (= e!774568 call!65469)))

(declare-fun bm!65466 () Bool)

(assert (=> bm!65466 (= call!65469 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127662 (Cons!31900 (select (arr!44836 a!3861) from!3239) acc!866) acc!866)))))

(assert (= (and d!146657 (not res!910155)) b!1366599))

(assert (= (and b!1366599 res!910156) b!1366600))

(assert (= (and b!1366599 res!910157) b!1366601))

(assert (= (and b!1366601 c!127662) b!1366602))

(assert (= (and b!1366601 (not c!127662)) b!1366603))

(assert (= (or b!1366602 b!1366603) bm!65466))

(assert (=> b!1366599 m!1250765))

(assert (=> b!1366599 m!1250765))

(assert (=> b!1366599 m!1250769))

(assert (=> b!1366600 m!1250765))

(assert (=> b!1366600 m!1250765))

(assert (=> b!1366600 m!1250767))

(assert (=> b!1366601 m!1250765))

(assert (=> b!1366601 m!1250765))

(assert (=> b!1366601 m!1250769))

(assert (=> bm!65466 m!1250765))

(declare-fun m!1250875 () Bool)

(assert (=> bm!65466 m!1250875))

(assert (=> b!1366463 d!146657))

(declare-fun d!146671 () Bool)

(assert (=> d!146671 (noDuplicate!2443 newAcc!98)))

(declare-fun lt!601605 () Unit!45109)

(declare-fun choose!1993 (List!31904 List!31904) Unit!45109)

(assert (=> d!146671 (= lt!601605 (choose!1993 newAcc!98 acc!866))))

(declare-fun e!774591 () Bool)

(assert (=> d!146671 e!774591))

(declare-fun res!910177 () Bool)

(assert (=> d!146671 (=> (not res!910177) (not e!774591))))

(assert (=> d!146671 (= res!910177 (subseq!988 newAcc!98 acc!866))))

(assert (=> d!146671 (= (noDuplicateSubseq!175 newAcc!98 acc!866) lt!601605)))

(declare-fun b!1366625 () Bool)

(assert (=> b!1366625 (= e!774591 (noDuplicate!2443 acc!866))))

(assert (= (and d!146671 res!910177) b!1366625))

(declare-fun m!1250901 () Bool)

(assert (=> d!146671 m!1250901))

(declare-fun m!1250903 () Bool)

(assert (=> d!146671 m!1250903))

(assert (=> d!146671 m!1250795))

(assert (=> b!1366625 m!1250781))

(assert (=> b!1366463 d!146671))

(declare-fun d!146685 () Bool)

(declare-fun lt!601606 () Bool)

(assert (=> d!146685 (= lt!601606 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!713 acc!866)))))

(declare-fun e!774592 () Bool)

(assert (=> d!146685 (= lt!601606 e!774592)))

(declare-fun res!910179 () Bool)

(assert (=> d!146685 (=> (not res!910179) (not e!774592))))

(assert (=> d!146685 (= res!910179 (is-Cons!31900 acc!866))))

(assert (=> d!146685 (= (contains!9586 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601606)))

(declare-fun b!1366626 () Bool)

(declare-fun e!774593 () Bool)

(assert (=> b!1366626 (= e!774592 e!774593)))

(declare-fun res!910178 () Bool)

(assert (=> b!1366626 (=> res!910178 e!774593)))

(assert (=> b!1366626 (= res!910178 (= (h!33109 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366627 () Bool)

(assert (=> b!1366627 (= e!774593 (contains!9586 (t!46598 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146685 res!910179) b!1366626))

(assert (= (and b!1366626 (not res!910178)) b!1366627))

(declare-fun m!1250907 () Bool)

(assert (=> d!146685 m!1250907))

(declare-fun m!1250909 () Bool)

(assert (=> d!146685 m!1250909))

(declare-fun m!1250911 () Bool)

(assert (=> b!1366627 m!1250911))

(assert (=> b!1366470 d!146685))

(declare-fun d!146689 () Bool)

(declare-fun lt!601607 () Bool)

(assert (=> d!146689 (= lt!601607 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!713 newAcc!98)))))

(declare-fun e!774594 () Bool)

(assert (=> d!146689 (= lt!601607 e!774594)))

(declare-fun res!910181 () Bool)

(assert (=> d!146689 (=> (not res!910181) (not e!774594))))

(assert (=> d!146689 (= res!910181 (is-Cons!31900 newAcc!98))))

(assert (=> d!146689 (= (contains!9586 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601607)))

(declare-fun b!1366628 () Bool)

(declare-fun e!774595 () Bool)

(assert (=> b!1366628 (= e!774594 e!774595)))

(declare-fun res!910180 () Bool)

(assert (=> b!1366628 (=> res!910180 e!774595)))

(assert (=> b!1366628 (= res!910180 (= (h!33109 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366629 () Bool)

(assert (=> b!1366629 (= e!774595 (contains!9586 (t!46598 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146689 res!910181) b!1366628))

(assert (= (and b!1366628 (not res!910180)) b!1366629))

(assert (=> d!146689 m!1250821))

(declare-fun m!1250913 () Bool)

(assert (=> d!146689 m!1250913))

(declare-fun m!1250915 () Bool)

(assert (=> b!1366629 m!1250915))

(assert (=> b!1366471 d!146689))

(declare-fun b!1366630 () Bool)

(declare-fun e!774598 () Bool)

(declare-fun e!774599 () Bool)

(assert (=> b!1366630 (= e!774598 e!774599)))

(declare-fun res!910183 () Bool)

(assert (=> b!1366630 (=> (not res!910183) (not e!774599))))

(assert (=> b!1366630 (= res!910183 (is-Cons!31900 lt!601576))))

(declare-fun b!1366633 () Bool)

(declare-fun e!774596 () Bool)

(assert (=> b!1366633 (= e!774596 (subseq!988 lt!601579 (t!46598 lt!601576)))))

(declare-fun b!1366631 () Bool)

(assert (=> b!1366631 (= e!774599 e!774596)))

(declare-fun res!910185 () Bool)

(assert (=> b!1366631 (=> res!910185 e!774596)))

(declare-fun e!774597 () Bool)

(assert (=> b!1366631 (= res!910185 e!774597)))

(declare-fun res!910182 () Bool)

