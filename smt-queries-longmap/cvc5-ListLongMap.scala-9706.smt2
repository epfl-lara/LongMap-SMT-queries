; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114686 () Bool)

(assert start!114686)

(declare-fun res!904838 () Bool)

(declare-fun e!771847 () Bool)

(assert (=> start!114686 (=> (not res!904838) (not e!771847))))

(declare-datatypes ((array!92574 0))(
  ( (array!92575 (arr!44726 (Array (_ BitVec 32) (_ BitVec 64))) (size!45276 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92574)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114686 (= res!904838 (and (bvslt (size!45276 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45276 a!3742))))))

(assert (=> start!114686 e!771847))

(assert (=> start!114686 true))

(declare-fun array_inv!33754 (array!92574) Bool)

(assert (=> start!114686 (array_inv!33754 a!3742)))

(declare-fun b!1360565 () Bool)

(declare-fun res!904842 () Bool)

(assert (=> b!1360565 (=> (not res!904842) (not e!771847))))

(declare-datatypes ((List!31767 0))(
  ( (Nil!31764) (Cons!31763 (h!32972 (_ BitVec 64)) (t!46443 List!31767)) )
))
(declare-fun acc!759 () List!31767)

(declare-fun contains!9476 (List!31767 (_ BitVec 64)) Bool)

(assert (=> b!1360565 (= res!904842 (not (contains!9476 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360566 () Bool)

(declare-fun res!904837 () Bool)

(assert (=> b!1360566 (=> (not res!904837) (not e!771847))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360566 (= res!904837 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45276 a!3742))))))

(declare-fun b!1360567 () Bool)

(declare-datatypes ((Unit!44838 0))(
  ( (Unit!44839) )
))
(declare-fun e!771850 () Unit!44838)

(declare-fun Unit!44840 () Unit!44838)

(assert (=> b!1360567 (= e!771850 Unit!44840)))

(declare-fun b!1360568 () Bool)

(declare-fun lt!599928 () Unit!44838)

(assert (=> b!1360568 (= e!771850 lt!599928)))

(declare-fun lt!599926 () Unit!44838)

(declare-fun lemmaListSubSeqRefl!0 (List!31767) Unit!44838)

(assert (=> b!1360568 (= lt!599926 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!878 (List!31767 List!31767) Bool)

(assert (=> b!1360568 (subseq!878 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92574 List!31767 List!31767 (_ BitVec 32)) Unit!44838)

(declare-fun $colon$colon!881 (List!31767 (_ BitVec 64)) List!31767)

(assert (=> b!1360568 (= lt!599928 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92574 (_ BitVec 32) List!31767) Bool)

(assert (=> b!1360568 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360569 () Bool)

(declare-fun res!904845 () Bool)

(assert (=> b!1360569 (=> (not res!904845) (not e!771847))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360569 (= res!904845 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360570 () Bool)

(declare-fun res!904840 () Bool)

(assert (=> b!1360570 (=> (not res!904840) (not e!771847))))

(assert (=> b!1360570 (= res!904840 (not (contains!9476 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360571 () Bool)

(declare-fun res!904839 () Bool)

(assert (=> b!1360571 (=> (not res!904839) (not e!771847))))

(assert (=> b!1360571 (= res!904839 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360572 () Bool)

(declare-fun res!904841 () Bool)

(assert (=> b!1360572 (=> (not res!904841) (not e!771847))))

(assert (=> b!1360572 (= res!904841 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31764))))

(declare-fun b!1360573 () Bool)

(declare-fun res!904843 () Bool)

(assert (=> b!1360573 (=> (not res!904843) (not e!771847))))

(declare-fun noDuplicate!2333 (List!31767) Bool)

(assert (=> b!1360573 (= res!904843 (noDuplicate!2333 acc!759))))

(declare-fun b!1360574 () Bool)

(declare-fun e!771848 () Bool)

(assert (=> b!1360574 (= e!771847 e!771848)))

(declare-fun res!904846 () Bool)

(assert (=> b!1360574 (=> (not res!904846) (not e!771848))))

(declare-fun lt!599927 () Bool)

(assert (=> b!1360574 (= res!904846 (and (not (= from!3120 i!1404)) lt!599927 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599929 () Unit!44838)

(assert (=> b!1360574 (= lt!599929 e!771850)))

(declare-fun c!127304 () Bool)

(assert (=> b!1360574 (= c!127304 lt!599927)))

(assert (=> b!1360574 (= lt!599927 (validKeyInArray!0 (select (arr!44726 a!3742) from!3120)))))

(declare-fun b!1360575 () Bool)

(declare-fun res!904844 () Bool)

(assert (=> b!1360575 (=> (not res!904844) (not e!771847))))

(assert (=> b!1360575 (= res!904844 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45276 a!3742)))))

(declare-fun b!1360576 () Bool)

(assert (=> b!1360576 (= e!771848 (not (noDuplicate!2333 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120)))))))

(assert (= (and start!114686 res!904838) b!1360573))

(assert (= (and b!1360573 res!904843) b!1360570))

(assert (= (and b!1360570 res!904840) b!1360565))

(assert (= (and b!1360565 res!904842) b!1360572))

(assert (= (and b!1360572 res!904841) b!1360571))

(assert (= (and b!1360571 res!904839) b!1360566))

(assert (= (and b!1360566 res!904837) b!1360569))

(assert (= (and b!1360569 res!904845) b!1360575))

(assert (= (and b!1360575 res!904844) b!1360574))

(assert (= (and b!1360574 c!127304) b!1360568))

(assert (= (and b!1360574 (not c!127304)) b!1360567))

(assert (= (and b!1360574 res!904846) b!1360576))

(declare-fun m!1245817 () Bool)

(assert (=> b!1360573 m!1245817))

(declare-fun m!1245819 () Bool)

(assert (=> b!1360572 m!1245819))

(declare-fun m!1245821 () Bool)

(assert (=> b!1360570 m!1245821))

(declare-fun m!1245823 () Bool)

(assert (=> b!1360568 m!1245823))

(declare-fun m!1245825 () Bool)

(assert (=> b!1360568 m!1245825))

(declare-fun m!1245827 () Bool)

(assert (=> b!1360568 m!1245827))

(declare-fun m!1245829 () Bool)

(assert (=> b!1360568 m!1245829))

(declare-fun m!1245831 () Bool)

(assert (=> b!1360568 m!1245831))

(assert (=> b!1360568 m!1245825))

(assert (=> b!1360568 m!1245827))

(declare-fun m!1245833 () Bool)

(assert (=> b!1360568 m!1245833))

(declare-fun m!1245835 () Bool)

(assert (=> b!1360571 m!1245835))

(assert (=> b!1360574 m!1245825))

(assert (=> b!1360574 m!1245825))

(declare-fun m!1245837 () Bool)

(assert (=> b!1360574 m!1245837))

(declare-fun m!1245839 () Bool)

(assert (=> start!114686 m!1245839))

(declare-fun m!1245841 () Bool)

(assert (=> b!1360565 m!1245841))

(assert (=> b!1360576 m!1245825))

(assert (=> b!1360576 m!1245825))

(assert (=> b!1360576 m!1245827))

(assert (=> b!1360576 m!1245827))

(declare-fun m!1245843 () Bool)

(assert (=> b!1360576 m!1245843))

(declare-fun m!1245845 () Bool)

(assert (=> b!1360569 m!1245845))

(push 1)

(assert (not start!114686))

(assert (not b!1360565))

(assert (not b!1360568))

(assert (not b!1360574))

(assert (not b!1360571))

(assert (not b!1360576))

(assert (not b!1360569))

(assert (not b!1360573))

(assert (not b!1360570))

(assert (not b!1360572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun call!65334 () Bool)

(declare-fun bm!65331 () Bool)

(declare-fun c!127317 () Bool)

(assert (=> bm!65331 (= call!65334 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127317 (Cons!31763 (select (arr!44726 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1360707 () Bool)

(declare-fun e!771929 () Bool)

(assert (=> b!1360707 (= e!771929 call!65334)))

(declare-fun b!1360709 () Bool)

(assert (=> b!1360709 (= e!771929 call!65334)))

(declare-fun b!1360710 () Bool)

(declare-fun e!771930 () Bool)

(assert (=> b!1360710 (= e!771930 (contains!9476 acc!759 (select (arr!44726 a!3742) from!3120)))))

(declare-fun b!1360711 () Bool)

(declare-fun e!771928 () Bool)

(declare-fun e!771927 () Bool)

(assert (=> b!1360711 (= e!771928 e!771927)))

(declare-fun res!904955 () Bool)

(assert (=> b!1360711 (=> (not res!904955) (not e!771927))))

(assert (=> b!1360711 (= res!904955 (not e!771930))))

(declare-fun res!904953 () Bool)

(assert (=> b!1360711 (=> (not res!904953) (not e!771930))))

(assert (=> b!1360711 (= res!904953 (validKeyInArray!0 (select (arr!44726 a!3742) from!3120)))))

(declare-fun d!145661 () Bool)

(declare-fun res!904954 () Bool)

(assert (=> d!145661 (=> res!904954 e!771928)))

(assert (=> d!145661 (= res!904954 (bvsge from!3120 (size!45276 a!3742)))))

(assert (=> d!145661 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771928)))

(declare-fun b!1360708 () Bool)

(assert (=> b!1360708 (= e!771927 e!771929)))

(assert (=> b!1360708 (= c!127317 (validKeyInArray!0 (select (arr!44726 a!3742) from!3120)))))

(assert (= (and d!145661 (not res!904954)) b!1360711))

(assert (= (and b!1360711 res!904953) b!1360710))

(assert (= (and b!1360711 res!904955) b!1360708))

(assert (= (and b!1360708 c!127317) b!1360707))

(assert (= (and b!1360708 (not c!127317)) b!1360709))

(assert (= (or b!1360707 b!1360709) bm!65331))

(assert (=> bm!65331 m!1245825))

(declare-fun m!1245945 () Bool)

(assert (=> bm!65331 m!1245945))

(assert (=> b!1360710 m!1245825))

(assert (=> b!1360710 m!1245825))

(declare-fun m!1245949 () Bool)

(assert (=> b!1360710 m!1245949))

(assert (=> b!1360711 m!1245825))

(assert (=> b!1360711 m!1245825))

(assert (=> b!1360711 m!1245837))

(assert (=> b!1360708 m!1245825))

(assert (=> b!1360708 m!1245825))

(assert (=> b!1360708 m!1245837))

(assert (=> b!1360571 d!145661))

(declare-fun d!145677 () Bool)

(declare-fun res!904966 () Bool)

(declare-fun e!771941 () Bool)

(assert (=> d!145677 (=> res!904966 e!771941)))

(assert (=> d!145677 (= res!904966 (is-Nil!31764 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120))))))

(assert (=> d!145677 (= (noDuplicate!2333 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120))) e!771941)))

(declare-fun b!1360722 () Bool)

(declare-fun e!771942 () Bool)

(assert (=> b!1360722 (= e!771941 e!771942)))

(declare-fun res!904967 () Bool)

(assert (=> b!1360722 (=> (not res!904967) (not e!771942))))

(assert (=> b!1360722 (= res!904967 (not (contains!9476 (t!46443 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120))) (h!32972 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120))))))))

(declare-fun b!1360723 () Bool)

(assert (=> b!1360723 (= e!771942 (noDuplicate!2333 (t!46443 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120)))))))

(assert (= (and d!145677 (not res!904966)) b!1360722))

(assert (= (and b!1360722 res!904967) b!1360723))

(declare-fun m!1245955 () Bool)

(assert (=> b!1360722 m!1245955))

(declare-fun m!1245957 () Bool)

(assert (=> b!1360723 m!1245957))

(assert (=> b!1360576 d!145677))

(declare-fun d!145683 () Bool)

(assert (=> d!145683 (= ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120)) (Cons!31763 (select (arr!44726 a!3742) from!3120) acc!759))))

(assert (=> b!1360576 d!145683))

(declare-fun d!145685 () Bool)

(declare-fun lt!599969 () Bool)

(declare-fun content!692 (List!31767) (Set (_ BitVec 64)))

(assert (=> d!145685 (= lt!599969 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!692 acc!759)))))

(declare-fun e!771970 () Bool)

(assert (=> d!145685 (= lt!599969 e!771970)))

(declare-fun res!904991 () Bool)

(assert (=> d!145685 (=> (not res!904991) (not e!771970))))

(assert (=> d!145685 (= res!904991 (is-Cons!31763 acc!759))))

(assert (=> d!145685 (= (contains!9476 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599969)))

(declare-fun b!1360754 () Bool)

(declare-fun e!771972 () Bool)

(assert (=> b!1360754 (= e!771970 e!771972)))

(declare-fun res!904990 () Bool)

(assert (=> b!1360754 (=> res!904990 e!771972)))

(assert (=> b!1360754 (= res!904990 (= (h!32972 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360755 () Bool)

(assert (=> b!1360755 (= e!771972 (contains!9476 (t!46443 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145685 res!904991) b!1360754))

(assert (= (and b!1360754 (not res!904990)) b!1360755))

(declare-fun m!1245979 () Bool)

(assert (=> d!145685 m!1245979))

(declare-fun m!1245981 () Bool)

(assert (=> d!145685 m!1245981))

(declare-fun m!1245983 () Bool)

(assert (=> b!1360755 m!1245983))

(assert (=> b!1360565 d!145685))

(declare-fun d!145697 () Bool)

(declare-fun lt!599970 () Bool)

(assert (=> d!145697 (= lt!599970 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!692 acc!759)))))

(declare-fun e!771975 () Bool)

(assert (=> d!145697 (= lt!599970 e!771975)))

(declare-fun res!904996 () Bool)

(assert (=> d!145697 (=> (not res!904996) (not e!771975))))

(assert (=> d!145697 (= res!904996 (is-Cons!31763 acc!759))))

(assert (=> d!145697 (= (contains!9476 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599970)))

(declare-fun b!1360761 () Bool)

(declare-fun e!771976 () Bool)

(assert (=> b!1360761 (= e!771975 e!771976)))

(declare-fun res!904995 () Bool)

(assert (=> b!1360761 (=> res!904995 e!771976)))

(assert (=> b!1360761 (= res!904995 (= (h!32972 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360762 () Bool)

(assert (=> b!1360762 (= e!771976 (contains!9476 (t!46443 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145697 res!904996) b!1360761))

(assert (= (and b!1360761 (not res!904995)) b!1360762))

(assert (=> d!145697 m!1245979))

(declare-fun m!1245987 () Bool)

(assert (=> d!145697 m!1245987))

(declare-fun m!1245989 () Bool)

(assert (=> b!1360762 m!1245989))

(assert (=> b!1360570 d!145697))

(declare-fun d!145699 () Bool)

(assert (=> d!145699 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360569 d!145699))

(declare-fun d!145705 () Bool)

(assert (=> d!145705 (= (validKeyInArray!0 (select (arr!44726 a!3742) from!3120)) (and (not (= (select (arr!44726 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44726 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360574 d!145705))

(declare-fun d!145707 () Bool)

(assert (=> d!145707 (= (array_inv!33754 a!3742) (bvsge (size!45276 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114686 d!145707))

(declare-fun d!145709 () Bool)

(assert (=> d!145709 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599976 () Unit!44838)

(declare-fun choose!80 (array!92574 List!31767 List!31767 (_ BitVec 32)) Unit!44838)

(assert (=> d!145709 (= lt!599976 (choose!80 a!3742 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145709 (bvslt (size!45276 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145709 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!881 acc!759 (select (arr!44726 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599976)))

(declare-fun bs!39021 () Bool)

(assert (= bs!39021 d!145709))

(assert (=> bs!39021 m!1245831))

(assert (=> bs!39021 m!1245827))

(declare-fun m!1245995 () Bool)

(assert (=> bs!39021 m!1245995))

(assert (=> b!1360568 d!145709))

(declare-fun b!1360788 () Bool)

(declare-fun e!772002 () Bool)

(declare-fun e!772001 () Bool)

(assert (=> b!1360788 (= e!772002 e!772001)))

(declare-fun res!905022 () Bool)

(assert (=> b!1360788 (=> (not res!905022) (not e!772001))))

(assert (=> b!1360788 (= res!905022 (is-Cons!31763 acc!759))))

(declare-fun b!1360790 () Bool)

(declare-fun e!772004 () Bool)

(assert (=> b!1360790 (= e!772004 (subseq!878 (t!46443 acc!759) (t!46443 acc!759)))))

(declare-fun b!1360791 () Bool)

(declare-fun e!772003 () Bool)

(assert (=> b!1360791 (= e!772003 (subseq!878 acc!759 (t!46443 acc!759)))))

(declare-fun d!145713 () Bool)

(declare-fun res!905023 () Bool)

(assert (=> d!145713 (=> res!905023 e!772002)))

(assert (=> d!145713 (= res!905023 (is-Nil!31764 acc!759))))

(assert (=> d!145713 (= (subseq!878 acc!759 acc!759) e!772002)))

(declare-fun b!1360789 () Bool)

(assert (=> b!1360789 (= e!772001 e!772003)))

(declare-fun res!905021 () Bool)

(assert (=> b!1360789 (=> res!905021 e!772003)))

(assert (=> b!1360789 (= res!905021 e!772004)))

(declare-fun res!905020 () Bool)

(assert (=> b!1360789 (=> (not res!905020) (not e!772004))))

(assert (=> b!1360789 (= res!905020 (= (h!32972 acc!759) (h!32972 acc!759)))))

(assert (= (and d!145713 (not res!905023)) b!1360788))

(assert (= (and b!1360788 res!905022) b!1360789))

(assert (= (and b!1360789 res!905020) b!1360790))

(assert (= (and b!1360789 (not res!905021)) b!1360791))

(declare-fun m!1246007 () Bool)

(assert (=> b!1360790 m!1246007))

(declare-fun m!1246011 () Bool)

(assert (=> b!1360791 m!1246011))

(assert (=> b!1360568 d!145713))

(declare-fun call!65341 () Bool)

(declare-fun bm!65338 () Bool)

(declare-fun c!127324 () Bool)

(assert (=> bm!65338 (= call!65341 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127324 (Cons!31763 (select (arr!44726 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1360792 () Bool)

