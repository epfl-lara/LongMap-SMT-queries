; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114746 () Bool)

(assert start!114746)

(declare-fun b!1360768 () Bool)

(declare-fun res!905040 () Bool)

(declare-fun e!772000 () Bool)

(assert (=> b!1360768 (=> (not res!905040) (not e!772000))))

(declare-datatypes ((List!31823 0))(
  ( (Nil!31820) (Cons!31819 (h!33028 (_ BitVec 64)) (t!46494 List!31823)) )
))
(declare-fun acc!759 () List!31823)

(declare-datatypes ((array!92532 0))(
  ( (array!92533 (arr!44704 (Array (_ BitVec 32) (_ BitVec 64))) (size!45256 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92532)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92532 (_ BitVec 32) List!31823) Bool)

(assert (=> b!1360768 (= res!905040 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360769 () Bool)

(declare-datatypes ((Unit!44688 0))(
  ( (Unit!44689) )
))
(declare-fun e!771998 () Unit!44688)

(declare-fun lt!599810 () Unit!44688)

(assert (=> b!1360769 (= e!771998 lt!599810)))

(declare-fun lt!599808 () Unit!44688)

(declare-fun lemmaListSubSeqRefl!0 (List!31823) Unit!44688)

(assert (=> b!1360769 (= lt!599808 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!881 (List!31823 List!31823) Bool)

(assert (=> b!1360769 (subseq!881 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92532 List!31823 List!31823 (_ BitVec 32)) Unit!44688)

(declare-fun $colon$colon!886 (List!31823 (_ BitVec 64)) List!31823)

(assert (=> b!1360769 (= lt!599810 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!886 acc!759 (select (arr!44704 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360769 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360770 () Bool)

(declare-fun res!905043 () Bool)

(assert (=> b!1360770 (=> (not res!905043) (not e!772000))))

(assert (=> b!1360770 (= res!905043 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45256 a!3742)))))

(declare-fun b!1360771 () Bool)

(declare-fun res!905038 () Bool)

(declare-fun e!772003 () Bool)

(assert (=> b!1360771 (=> (not res!905038) (not e!772003))))

(declare-fun lt!599811 () List!31823)

(declare-fun noDuplicate!2358 (List!31823) Bool)

(assert (=> b!1360771 (= res!905038 (noDuplicate!2358 lt!599811))))

(declare-fun b!1360772 () Bool)

(declare-fun res!905041 () Bool)

(assert (=> b!1360772 (=> (not res!905041) (not e!772000))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360772 (= res!905041 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45256 a!3742))))))

(declare-fun b!1360773 () Bool)

(declare-fun res!905045 () Bool)

(assert (=> b!1360773 (=> (not res!905045) (not e!772000))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360773 (= res!905045 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360774 () Bool)

(declare-fun res!905036 () Bool)

(assert (=> b!1360774 (=> (not res!905036) (not e!772000))))

(declare-fun contains!9443 (List!31823 (_ BitVec 64)) Bool)

(assert (=> b!1360774 (= res!905036 (not (contains!9443 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360775 () Bool)

(declare-fun res!905044 () Bool)

(assert (=> b!1360775 (=> (not res!905044) (not e!772000))))

(assert (=> b!1360775 (= res!905044 (noDuplicate!2358 acc!759))))

(declare-fun b!1360776 () Bool)

(declare-fun e!771999 () Bool)

(assert (=> b!1360776 (= e!772000 e!771999)))

(declare-fun res!905033 () Bool)

(assert (=> b!1360776 (=> (not res!905033) (not e!771999))))

(declare-fun lt!599809 () Bool)

(assert (=> b!1360776 (= res!905033 (and (not (= from!3120 i!1404)) lt!599809))))

(declare-fun lt!599812 () Unit!44688)

(assert (=> b!1360776 (= lt!599812 e!771998)))

(declare-fun c!127310 () Bool)

(assert (=> b!1360776 (= c!127310 lt!599809)))

(assert (=> b!1360776 (= lt!599809 (validKeyInArray!0 (select (arr!44704 a!3742) from!3120)))))

(declare-fun b!1360778 () Bool)

(declare-fun res!905035 () Bool)

(assert (=> b!1360778 (=> (not res!905035) (not e!772000))))

(assert (=> b!1360778 (= res!905035 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31820))))

(declare-fun b!1360779 () Bool)

(declare-fun Unit!44690 () Unit!44688)

(assert (=> b!1360779 (= e!771998 Unit!44690)))

(declare-fun b!1360780 () Bool)

(declare-fun e!772001 () Bool)

(assert (=> b!1360780 (= e!772001 (contains!9443 lt!599811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360781 () Bool)

(assert (=> b!1360781 (= e!772003 e!772001)))

(declare-fun res!905037 () Bool)

(assert (=> b!1360781 (=> res!905037 e!772001)))

(assert (=> b!1360781 (= res!905037 (contains!9443 lt!599811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360782 () Bool)

(declare-fun res!905042 () Bool)

(assert (=> b!1360782 (=> (not res!905042) (not e!772000))))

(assert (=> b!1360782 (= res!905042 (not (contains!9443 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360777 () Bool)

(assert (=> b!1360777 (= e!771999 e!772003)))

(declare-fun res!905039 () Bool)

(assert (=> b!1360777 (=> (not res!905039) (not e!772003))))

(assert (=> b!1360777 (= res!905039 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1360777 (= lt!599811 ($colon$colon!886 acc!759 (select (arr!44704 a!3742) from!3120)))))

(declare-fun res!905034 () Bool)

(assert (=> start!114746 (=> (not res!905034) (not e!772000))))

(assert (=> start!114746 (= res!905034 (and (bvslt (size!45256 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45256 a!3742))))))

(assert (=> start!114746 e!772000))

(assert (=> start!114746 true))

(declare-fun array_inv!33937 (array!92532) Bool)

(assert (=> start!114746 (array_inv!33937 a!3742)))

(assert (= (and start!114746 res!905034) b!1360775))

(assert (= (and b!1360775 res!905044) b!1360782))

(assert (= (and b!1360782 res!905042) b!1360774))

(assert (= (and b!1360774 res!905036) b!1360778))

(assert (= (and b!1360778 res!905035) b!1360768))

(assert (= (and b!1360768 res!905040) b!1360772))

(assert (= (and b!1360772 res!905041) b!1360773))

(assert (= (and b!1360773 res!905045) b!1360770))

(assert (= (and b!1360770 res!905043) b!1360776))

(assert (= (and b!1360776 c!127310) b!1360769))

(assert (= (and b!1360776 (not c!127310)) b!1360779))

(assert (= (and b!1360776 res!905033) b!1360777))

(assert (= (and b!1360777 res!905039) b!1360771))

(assert (= (and b!1360771 res!905038) b!1360781))

(assert (= (and b!1360781 (not res!905037)) b!1360780))

(declare-fun m!1245529 () Bool)

(assert (=> b!1360781 m!1245529))

(declare-fun m!1245531 () Bool)

(assert (=> b!1360778 m!1245531))

(declare-fun m!1245533 () Bool)

(assert (=> b!1360777 m!1245533))

(assert (=> b!1360777 m!1245533))

(declare-fun m!1245535 () Bool)

(assert (=> b!1360777 m!1245535))

(declare-fun m!1245537 () Bool)

(assert (=> start!114746 m!1245537))

(declare-fun m!1245539 () Bool)

(assert (=> b!1360769 m!1245539))

(assert (=> b!1360769 m!1245533))

(assert (=> b!1360769 m!1245535))

(declare-fun m!1245541 () Bool)

(assert (=> b!1360769 m!1245541))

(declare-fun m!1245543 () Bool)

(assert (=> b!1360769 m!1245543))

(assert (=> b!1360769 m!1245533))

(assert (=> b!1360769 m!1245535))

(declare-fun m!1245545 () Bool)

(assert (=> b!1360769 m!1245545))

(declare-fun m!1245547 () Bool)

(assert (=> b!1360780 m!1245547))

(declare-fun m!1245549 () Bool)

(assert (=> b!1360773 m!1245549))

(assert (=> b!1360776 m!1245533))

(assert (=> b!1360776 m!1245533))

(declare-fun m!1245551 () Bool)

(assert (=> b!1360776 m!1245551))

(declare-fun m!1245553 () Bool)

(assert (=> b!1360775 m!1245553))

(declare-fun m!1245555 () Bool)

(assert (=> b!1360771 m!1245555))

(declare-fun m!1245557 () Bool)

(assert (=> b!1360774 m!1245557))

(declare-fun m!1245559 () Bool)

(assert (=> b!1360782 m!1245559))

(declare-fun m!1245561 () Bool)

(assert (=> b!1360768 m!1245561))

(check-sat (not b!1360776) (not start!114746) (not b!1360769) (not b!1360781) (not b!1360768) (not b!1360775) (not b!1360771) (not b!1360774) (not b!1360780) (not b!1360778) (not b!1360782) (not b!1360773) (not b!1360777))
(check-sat)
(get-model)

(declare-fun d!145623 () Bool)

(declare-fun lt!599845 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!691 (List!31823) (InoxSet (_ BitVec 64)))

(assert (=> d!145623 (= lt!599845 (select (content!691 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772044 () Bool)

(assert (=> d!145623 (= lt!599845 e!772044)))

(declare-fun res!905128 () Bool)

(assert (=> d!145623 (=> (not res!905128) (not e!772044))))

(get-info :version)

(assert (=> d!145623 (= res!905128 ((_ is Cons!31819) acc!759))))

(assert (=> d!145623 (= (contains!9443 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599845)))

(declare-fun b!1360877 () Bool)

(declare-fun e!772045 () Bool)

(assert (=> b!1360877 (= e!772044 e!772045)))

(declare-fun res!905129 () Bool)

(assert (=> b!1360877 (=> res!905129 e!772045)))

(assert (=> b!1360877 (= res!905129 (= (h!33028 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360878 () Bool)

(assert (=> b!1360878 (= e!772045 (contains!9443 (t!46494 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145623 res!905128) b!1360877))

(assert (= (and b!1360877 (not res!905129)) b!1360878))

(declare-fun m!1245631 () Bool)

(assert (=> d!145623 m!1245631))

(declare-fun m!1245633 () Bool)

(assert (=> d!145623 m!1245633))

(declare-fun m!1245635 () Bool)

(assert (=> b!1360878 m!1245635))

(assert (=> b!1360774 d!145623))

(declare-fun d!145625 () Bool)

(assert (=> d!145625 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360773 d!145625))

(declare-fun d!145627 () Bool)

(assert (=> d!145627 (= (validKeyInArray!0 (select (arr!44704 a!3742) from!3120)) (and (not (= (select (arr!44704 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44704 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360776 d!145627))

(declare-fun d!145629 () Bool)

(declare-fun res!905134 () Bool)

(declare-fun e!772050 () Bool)

(assert (=> d!145629 (=> res!905134 e!772050)))

(assert (=> d!145629 (= res!905134 ((_ is Nil!31820) acc!759))))

(assert (=> d!145629 (= (noDuplicate!2358 acc!759) e!772050)))

(declare-fun b!1360883 () Bool)

(declare-fun e!772051 () Bool)

(assert (=> b!1360883 (= e!772050 e!772051)))

(declare-fun res!905135 () Bool)

(assert (=> b!1360883 (=> (not res!905135) (not e!772051))))

(assert (=> b!1360883 (= res!905135 (not (contains!9443 (t!46494 acc!759) (h!33028 acc!759))))))

(declare-fun b!1360884 () Bool)

(assert (=> b!1360884 (= e!772051 (noDuplicate!2358 (t!46494 acc!759)))))

(assert (= (and d!145629 (not res!905134)) b!1360883))

(assert (= (and b!1360883 res!905135) b!1360884))

(declare-fun m!1245637 () Bool)

(assert (=> b!1360883 m!1245637))

(declare-fun m!1245639 () Bool)

(assert (=> b!1360884 m!1245639))

(assert (=> b!1360775 d!145629))

(declare-fun d!145631 () Bool)

(assert (=> d!145631 (= (array_inv!33937 a!3742) (bvsge (size!45256 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114746 d!145631))

(declare-fun d!145633 () Bool)

(declare-fun res!905142 () Bool)

(declare-fun e!772060 () Bool)

(assert (=> d!145633 (=> res!905142 e!772060)))

(assert (=> d!145633 (= res!905142 (bvsge from!3120 (size!45256 a!3742)))))

(assert (=> d!145633 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772060)))

(declare-fun b!1360895 () Bool)

(declare-fun e!772062 () Bool)

(declare-fun e!772063 () Bool)

(assert (=> b!1360895 (= e!772062 e!772063)))

(declare-fun c!127319 () Bool)

(assert (=> b!1360895 (= c!127319 (validKeyInArray!0 (select (arr!44704 a!3742) from!3120)))))

(declare-fun b!1360896 () Bool)

(declare-fun call!65326 () Bool)

(assert (=> b!1360896 (= e!772063 call!65326)))

(declare-fun b!1360897 () Bool)

(assert (=> b!1360897 (= e!772060 e!772062)))

(declare-fun res!905143 () Bool)

(assert (=> b!1360897 (=> (not res!905143) (not e!772062))))

(declare-fun e!772061 () Bool)

(assert (=> b!1360897 (= res!905143 (not e!772061))))

(declare-fun res!905144 () Bool)

(assert (=> b!1360897 (=> (not res!905144) (not e!772061))))

(assert (=> b!1360897 (= res!905144 (validKeyInArray!0 (select (arr!44704 a!3742) from!3120)))))

(declare-fun b!1360898 () Bool)

(assert (=> b!1360898 (= e!772063 call!65326)))

(declare-fun bm!65323 () Bool)

(assert (=> bm!65323 (= call!65326 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127319 (Cons!31819 (select (arr!44704 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1360899 () Bool)

(assert (=> b!1360899 (= e!772061 (contains!9443 acc!759 (select (arr!44704 a!3742) from!3120)))))

(assert (= (and d!145633 (not res!905142)) b!1360897))

(assert (= (and b!1360897 res!905144) b!1360899))

(assert (= (and b!1360897 res!905143) b!1360895))

(assert (= (and b!1360895 c!127319) b!1360896))

(assert (= (and b!1360895 (not c!127319)) b!1360898))

(assert (= (or b!1360896 b!1360898) bm!65323))

(assert (=> b!1360895 m!1245533))

(assert (=> b!1360895 m!1245533))

(assert (=> b!1360895 m!1245551))

(assert (=> b!1360897 m!1245533))

(assert (=> b!1360897 m!1245533))

(assert (=> b!1360897 m!1245551))

(assert (=> bm!65323 m!1245533))

(declare-fun m!1245641 () Bool)

(assert (=> bm!65323 m!1245641))

(assert (=> b!1360899 m!1245533))

(assert (=> b!1360899 m!1245533))

(declare-fun m!1245643 () Bool)

(assert (=> b!1360899 m!1245643))

(assert (=> b!1360768 d!145633))

(declare-fun d!145635 () Bool)

(declare-fun res!905145 () Bool)

(declare-fun e!772064 () Bool)

(assert (=> d!145635 (=> res!905145 e!772064)))

(assert (=> d!145635 (= res!905145 (bvsge #b00000000000000000000000000000000 (size!45256 a!3742)))))

(assert (=> d!145635 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31820) e!772064)))

(declare-fun b!1360900 () Bool)

(declare-fun e!772066 () Bool)

(declare-fun e!772067 () Bool)

(assert (=> b!1360900 (= e!772066 e!772067)))

(declare-fun c!127320 () Bool)

(assert (=> b!1360900 (= c!127320 (validKeyInArray!0 (select (arr!44704 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360901 () Bool)

(declare-fun call!65327 () Bool)

(assert (=> b!1360901 (= e!772067 call!65327)))

(declare-fun b!1360902 () Bool)

(assert (=> b!1360902 (= e!772064 e!772066)))

(declare-fun res!905146 () Bool)

(assert (=> b!1360902 (=> (not res!905146) (not e!772066))))

(declare-fun e!772065 () Bool)

(assert (=> b!1360902 (= res!905146 (not e!772065))))

(declare-fun res!905147 () Bool)

(assert (=> b!1360902 (=> (not res!905147) (not e!772065))))

(assert (=> b!1360902 (= res!905147 (validKeyInArray!0 (select (arr!44704 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360903 () Bool)

(assert (=> b!1360903 (= e!772067 call!65327)))

(declare-fun bm!65324 () Bool)

(assert (=> bm!65324 (= call!65327 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127320 (Cons!31819 (select (arr!44704 a!3742) #b00000000000000000000000000000000) Nil!31820) Nil!31820)))))

(declare-fun b!1360904 () Bool)

(assert (=> b!1360904 (= e!772065 (contains!9443 Nil!31820 (select (arr!44704 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145635 (not res!905145)) b!1360902))

(assert (= (and b!1360902 res!905147) b!1360904))

(assert (= (and b!1360902 res!905146) b!1360900))

(assert (= (and b!1360900 c!127320) b!1360901))

(assert (= (and b!1360900 (not c!127320)) b!1360903))

(assert (= (or b!1360901 b!1360903) bm!65324))

(declare-fun m!1245645 () Bool)

(assert (=> b!1360900 m!1245645))

(assert (=> b!1360900 m!1245645))

(declare-fun m!1245647 () Bool)

(assert (=> b!1360900 m!1245647))

(assert (=> b!1360902 m!1245645))

(assert (=> b!1360902 m!1245645))

(assert (=> b!1360902 m!1245647))

(assert (=> bm!65324 m!1245645))

(declare-fun m!1245649 () Bool)

(assert (=> bm!65324 m!1245649))

(assert (=> b!1360904 m!1245645))

(assert (=> b!1360904 m!1245645))

(declare-fun m!1245651 () Bool)

(assert (=> b!1360904 m!1245651))

(assert (=> b!1360778 d!145635))

(declare-fun d!145637 () Bool)

(assert (=> d!145637 (= ($colon$colon!886 acc!759 (select (arr!44704 a!3742) from!3120)) (Cons!31819 (select (arr!44704 a!3742) from!3120) acc!759))))

(assert (=> b!1360777 d!145637))

(declare-fun d!145639 () Bool)

(declare-fun res!905148 () Bool)

(declare-fun e!772068 () Bool)

(assert (=> d!145639 (=> res!905148 e!772068)))

(assert (=> d!145639 (= res!905148 ((_ is Nil!31820) lt!599811))))

(assert (=> d!145639 (= (noDuplicate!2358 lt!599811) e!772068)))

(declare-fun b!1360905 () Bool)

(declare-fun e!772069 () Bool)

(assert (=> b!1360905 (= e!772068 e!772069)))

(declare-fun res!905149 () Bool)

(assert (=> b!1360905 (=> (not res!905149) (not e!772069))))

(assert (=> b!1360905 (= res!905149 (not (contains!9443 (t!46494 lt!599811) (h!33028 lt!599811))))))

(declare-fun b!1360906 () Bool)

(assert (=> b!1360906 (= e!772069 (noDuplicate!2358 (t!46494 lt!599811)))))

(assert (= (and d!145639 (not res!905148)) b!1360905))

(assert (= (and b!1360905 res!905149) b!1360906))

(declare-fun m!1245653 () Bool)

(assert (=> b!1360905 m!1245653))

(declare-fun m!1245655 () Bool)

(assert (=> b!1360906 m!1245655))

(assert (=> b!1360771 d!145639))

(declare-fun d!145641 () Bool)

(declare-fun lt!599846 () Bool)

(assert (=> d!145641 (= lt!599846 (select (content!691 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772070 () Bool)

(assert (=> d!145641 (= lt!599846 e!772070)))

(declare-fun res!905150 () Bool)

(assert (=> d!145641 (=> (not res!905150) (not e!772070))))

(assert (=> d!145641 (= res!905150 ((_ is Cons!31819) acc!759))))

(assert (=> d!145641 (= (contains!9443 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599846)))

(declare-fun b!1360907 () Bool)

(declare-fun e!772071 () Bool)

(assert (=> b!1360907 (= e!772070 e!772071)))

(declare-fun res!905151 () Bool)

(assert (=> b!1360907 (=> res!905151 e!772071)))

(assert (=> b!1360907 (= res!905151 (= (h!33028 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360908 () Bool)

(assert (=> b!1360908 (= e!772071 (contains!9443 (t!46494 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145641 res!905150) b!1360907))

(assert (= (and b!1360907 (not res!905151)) b!1360908))

(assert (=> d!145641 m!1245631))

(declare-fun m!1245657 () Bool)

(assert (=> d!145641 m!1245657))

(declare-fun m!1245659 () Bool)

(assert (=> b!1360908 m!1245659))

(assert (=> b!1360782 d!145641))

(declare-fun d!145643 () Bool)

(declare-fun lt!599847 () Bool)

(assert (=> d!145643 (= lt!599847 (select (content!691 lt!599811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772072 () Bool)

(assert (=> d!145643 (= lt!599847 e!772072)))

(declare-fun res!905152 () Bool)

(assert (=> d!145643 (=> (not res!905152) (not e!772072))))

(assert (=> d!145643 (= res!905152 ((_ is Cons!31819) lt!599811))))

(assert (=> d!145643 (= (contains!9443 lt!599811 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599847)))

(declare-fun b!1360909 () Bool)

(declare-fun e!772073 () Bool)

(assert (=> b!1360909 (= e!772072 e!772073)))

(declare-fun res!905153 () Bool)

(assert (=> b!1360909 (=> res!905153 e!772073)))

(assert (=> b!1360909 (= res!905153 (= (h!33028 lt!599811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360910 () Bool)

(assert (=> b!1360910 (= e!772073 (contains!9443 (t!46494 lt!599811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145643 res!905152) b!1360909))

(assert (= (and b!1360909 (not res!905153)) b!1360910))

(declare-fun m!1245661 () Bool)

(assert (=> d!145643 m!1245661))

(declare-fun m!1245663 () Bool)

(assert (=> d!145643 m!1245663))

(declare-fun m!1245665 () Bool)

(assert (=> b!1360910 m!1245665))

(assert (=> b!1360781 d!145643))

(declare-fun d!145647 () Bool)

(assert (=> d!145647 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599850 () Unit!44688)

(declare-fun choose!80 (array!92532 List!31823 List!31823 (_ BitVec 32)) Unit!44688)

(assert (=> d!145647 (= lt!599850 (choose!80 a!3742 ($colon$colon!886 acc!759 (select (arr!44704 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145647 (bvslt (size!45256 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145647 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!886 acc!759 (select (arr!44704 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599850)))

(declare-fun bs!39000 () Bool)

(assert (= bs!39000 d!145647))

(assert (=> bs!39000 m!1245543))

(assert (=> bs!39000 m!1245535))

(declare-fun m!1245667 () Bool)

(assert (=> bs!39000 m!1245667))

(assert (=> b!1360769 d!145647))

(declare-fun d!145651 () Bool)

(declare-fun res!905173 () Bool)

(declare-fun e!772092 () Bool)

(assert (=> d!145651 (=> res!905173 e!772092)))

(assert (=> d!145651 (= res!905173 ((_ is Nil!31820) acc!759))))

(assert (=> d!145651 (= (subseq!881 acc!759 acc!759) e!772092)))

(declare-fun b!1360930 () Bool)

(declare-fun e!772091 () Bool)

(assert (=> b!1360930 (= e!772091 (subseq!881 acc!759 (t!46494 acc!759)))))

(declare-fun b!1360928 () Bool)

(declare-fun e!772093 () Bool)

(assert (=> b!1360928 (= e!772093 e!772091)))

(declare-fun res!905172 () Bool)

(assert (=> b!1360928 (=> res!905172 e!772091)))

(declare-fun e!772090 () Bool)

(assert (=> b!1360928 (= res!905172 e!772090)))

(declare-fun res!905171 () Bool)

(assert (=> b!1360928 (=> (not res!905171) (not e!772090))))

(assert (=> b!1360928 (= res!905171 (= (h!33028 acc!759) (h!33028 acc!759)))))

(declare-fun b!1360929 () Bool)

(assert (=> b!1360929 (= e!772090 (subseq!881 (t!46494 acc!759) (t!46494 acc!759)))))

(declare-fun b!1360927 () Bool)

(assert (=> b!1360927 (= e!772092 e!772093)))

(declare-fun res!905170 () Bool)

(assert (=> b!1360927 (=> (not res!905170) (not e!772093))))

(assert (=> b!1360927 (= res!905170 ((_ is Cons!31819) acc!759))))

(assert (= (and d!145651 (not res!905173)) b!1360927))

(assert (= (and b!1360927 res!905170) b!1360928))

(assert (= (and b!1360928 res!905171) b!1360929))

(assert (= (and b!1360928 (not res!905172)) b!1360930))

(declare-fun m!1245681 () Bool)

(assert (=> b!1360930 m!1245681))

(declare-fun m!1245683 () Bool)

(assert (=> b!1360929 m!1245683))

(assert (=> b!1360769 d!145651))

(declare-fun d!145659 () Bool)

(declare-fun res!905174 () Bool)

(declare-fun e!772094 () Bool)

(assert (=> d!145659 (=> res!905174 e!772094)))

(assert (=> d!145659 (= res!905174 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45256 a!3742)))))

(assert (=> d!145659 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772094)))

(declare-fun b!1360931 () Bool)

(declare-fun e!772096 () Bool)

(declare-fun e!772097 () Bool)

(assert (=> b!1360931 (= e!772096 e!772097)))

(declare-fun c!127321 () Bool)

(assert (=> b!1360931 (= c!127321 (validKeyInArray!0 (select (arr!44704 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360932 () Bool)

(declare-fun call!65328 () Bool)

(assert (=> b!1360932 (= e!772097 call!65328)))

(declare-fun b!1360933 () Bool)

(assert (=> b!1360933 (= e!772094 e!772096)))

(declare-fun res!905175 () Bool)

(assert (=> b!1360933 (=> (not res!905175) (not e!772096))))

(declare-fun e!772095 () Bool)

(assert (=> b!1360933 (= res!905175 (not e!772095))))

(declare-fun res!905176 () Bool)

(assert (=> b!1360933 (=> (not res!905176) (not e!772095))))

(assert (=> b!1360933 (= res!905176 (validKeyInArray!0 (select (arr!44704 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360934 () Bool)

(assert (=> b!1360934 (= e!772097 call!65328)))

(declare-fun bm!65325 () Bool)

(assert (=> bm!65325 (= call!65328 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127321 (Cons!31819 (select (arr!44704 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1360935 () Bool)

(assert (=> b!1360935 (= e!772095 (contains!9443 acc!759 (select (arr!44704 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145659 (not res!905174)) b!1360933))

(assert (= (and b!1360933 res!905176) b!1360935))

(assert (= (and b!1360933 res!905175) b!1360931))

(assert (= (and b!1360931 c!127321) b!1360932))

(assert (= (and b!1360931 (not c!127321)) b!1360934))

(assert (= (or b!1360932 b!1360934) bm!65325))

(declare-fun m!1245685 () Bool)

(assert (=> b!1360931 m!1245685))

(assert (=> b!1360931 m!1245685))

(declare-fun m!1245687 () Bool)

(assert (=> b!1360931 m!1245687))

(assert (=> b!1360933 m!1245685))

(assert (=> b!1360933 m!1245685))

(assert (=> b!1360933 m!1245687))

(assert (=> bm!65325 m!1245685))

(declare-fun m!1245689 () Bool)

(assert (=> bm!65325 m!1245689))

(assert (=> b!1360935 m!1245685))

(assert (=> b!1360935 m!1245685))

(declare-fun m!1245691 () Bool)

(assert (=> b!1360935 m!1245691))

(assert (=> b!1360769 d!145659))

(assert (=> b!1360769 d!145637))

(declare-fun d!145665 () Bool)

(assert (=> d!145665 (subseq!881 acc!759 acc!759)))

(declare-fun lt!599857 () Unit!44688)

(declare-fun choose!36 (List!31823) Unit!44688)

(assert (=> d!145665 (= lt!599857 (choose!36 acc!759))))

(assert (=> d!145665 (= (lemmaListSubSeqRefl!0 acc!759) lt!599857)))

(declare-fun bs!39001 () Bool)

(assert (= bs!39001 d!145665))

(assert (=> bs!39001 m!1245545))

(declare-fun m!1245693 () Bool)

(assert (=> bs!39001 m!1245693))

(assert (=> b!1360769 d!145665))

(declare-fun d!145667 () Bool)

(declare-fun lt!599858 () Bool)

(assert (=> d!145667 (= lt!599858 (select (content!691 lt!599811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772110 () Bool)

(assert (=> d!145667 (= lt!599858 e!772110)))

(declare-fun res!905187 () Bool)

(assert (=> d!145667 (=> (not res!905187) (not e!772110))))

(assert (=> d!145667 (= res!905187 ((_ is Cons!31819) lt!599811))))

(assert (=> d!145667 (= (contains!9443 lt!599811 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599858)))

(declare-fun b!1360948 () Bool)

(declare-fun e!772111 () Bool)

(assert (=> b!1360948 (= e!772110 e!772111)))

(declare-fun res!905188 () Bool)

(assert (=> b!1360948 (=> res!905188 e!772111)))

(assert (=> b!1360948 (= res!905188 (= (h!33028 lt!599811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360949 () Bool)

(assert (=> b!1360949 (= e!772111 (contains!9443 (t!46494 lt!599811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145667 res!905187) b!1360948))

(assert (= (and b!1360948 (not res!905188)) b!1360949))

(assert (=> d!145667 m!1245661))

(declare-fun m!1245695 () Bool)

(assert (=> d!145667 m!1245695))

(declare-fun m!1245697 () Bool)

(assert (=> b!1360949 m!1245697))

(assert (=> b!1360780 d!145667))

(check-sat (not b!1360935) (not b!1360933) (not bm!65325) (not d!145647) (not b!1360910) (not b!1360930) (not b!1360878) (not d!145641) (not d!145665) (not b!1360929) (not b!1360906) (not b!1360895) (not b!1360949) (not d!145623) (not b!1360884) (not b!1360908) (not d!145643) (not bm!65323) (not b!1360931) (not d!145667) (not b!1360904) (not b!1360897) (not bm!65324) (not b!1360905) (not b!1360883) (not b!1360902) (not b!1360900) (not b!1360899))
(check-sat)
