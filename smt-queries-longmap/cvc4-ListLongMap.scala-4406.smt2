; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60720 () Bool)

(assert start!60720)

(declare-fun b!681770 () Bool)

(declare-fun res!447894 () Bool)

(declare-fun e!388386 () Bool)

(assert (=> b!681770 (=> res!447894 e!388386)))

(declare-datatypes ((List!12991 0))(
  ( (Nil!12988) (Cons!12987 (h!14032 (_ BitVec 64)) (t!19228 List!12991)) )
))
(declare-fun lt!313359 () List!12991)

(declare-fun contains!3568 (List!12991 (_ BitVec 64)) Bool)

(assert (=> b!681770 (= res!447894 (contains!3568 lt!313359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681771 () Bool)

(declare-fun res!447884 () Bool)

(declare-fun e!388387 () Bool)

(assert (=> b!681771 (=> (not res!447884) (not e!388387))))

(declare-fun acc!681 () List!12991)

(assert (=> b!681771 (= res!447884 (not (contains!3568 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681772 () Bool)

(declare-fun res!447897 () Bool)

(assert (=> b!681772 (=> (not res!447897) (not e!388387))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681772 (= res!447897 (validKeyInArray!0 k!2843))))

(declare-fun b!681773 () Bool)

(declare-fun e!388385 () Bool)

(assert (=> b!681773 (= e!388385 e!388386)))

(declare-fun res!447888 () Bool)

(assert (=> b!681773 (=> res!447888 e!388386)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!681773 (= res!447888 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39530 0))(
  ( (array!39531 (arr!18950 (Array (_ BitVec 32) (_ BitVec 64))) (size!19314 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39530)

(declare-fun $colon$colon!319 (List!12991 (_ BitVec 64)) List!12991)

(assert (=> b!681773 (= lt!313359 ($colon$colon!319 acc!681 (select (arr!18950 a!3626) from!3004)))))

(declare-fun subseq!154 (List!12991 List!12991) Bool)

(assert (=> b!681773 (subseq!154 acc!681 acc!681)))

(declare-datatypes ((Unit!23918 0))(
  ( (Unit!23919) )
))
(declare-fun lt!313356 () Unit!23918)

(declare-fun lemmaListSubSeqRefl!0 (List!12991) Unit!23918)

(assert (=> b!681773 (= lt!313356 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681774 () Bool)

(declare-fun res!447882 () Bool)

(assert (=> b!681774 (=> (not res!447882) (not e!388387))))

(declare-fun arrayContainsKey!0 (array!39530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681774 (= res!447882 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681775 () Bool)

(declare-fun res!447899 () Bool)

(assert (=> b!681775 (=> res!447899 e!388386)))

(assert (=> b!681775 (= res!447899 (contains!3568 lt!313359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681776 () Bool)

(declare-fun res!447895 () Bool)

(assert (=> b!681776 (=> (not res!447895) (not e!388387))))

(declare-fun arrayNoDuplicates!0 (array!39530 (_ BitVec 32) List!12991) Bool)

(assert (=> b!681776 (= res!447895 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12988))))

(declare-fun b!681777 () Bool)

(assert (=> b!681777 (= e!388387 (not e!388385))))

(declare-fun res!447885 () Bool)

(assert (=> b!681777 (=> res!447885 e!388385)))

(assert (=> b!681777 (= res!447885 (not (validKeyInArray!0 (select (arr!18950 a!3626) from!3004))))))

(declare-fun lt!313358 () Unit!23918)

(declare-fun e!388389 () Unit!23918)

(assert (=> b!681777 (= lt!313358 e!388389)))

(declare-fun c!77312 () Bool)

(assert (=> b!681777 (= c!77312 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681777 (arrayContainsKey!0 (array!39531 (store (arr!18950 a!3626) i!1382 k!2843) (size!19314 a!3626)) k!2843 from!3004)))

(declare-fun b!681779 () Bool)

(declare-fun res!447898 () Bool)

(assert (=> b!681779 (=> (not res!447898) (not e!388387))))

(assert (=> b!681779 (= res!447898 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19314 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681780 () Bool)

(declare-fun res!447891 () Bool)

(assert (=> b!681780 (=> (not res!447891) (not e!388387))))

(declare-fun noDuplicate!815 (List!12991) Bool)

(assert (=> b!681780 (= res!447891 (noDuplicate!815 acc!681))))

(declare-fun b!681781 () Bool)

(declare-fun res!447886 () Bool)

(assert (=> b!681781 (=> (not res!447886) (not e!388387))))

(declare-fun e!388384 () Bool)

(assert (=> b!681781 (= res!447886 e!388384)))

(declare-fun res!447887 () Bool)

(assert (=> b!681781 (=> res!447887 e!388384)))

(declare-fun e!388388 () Bool)

(assert (=> b!681781 (= res!447887 e!388388)))

(declare-fun res!447880 () Bool)

(assert (=> b!681781 (=> (not res!447880) (not e!388388))))

(assert (=> b!681781 (= res!447880 (bvsgt from!3004 i!1382))))

(declare-fun b!681782 () Bool)

(declare-fun res!447890 () Bool)

(assert (=> b!681782 (=> (not res!447890) (not e!388387))))

(assert (=> b!681782 (= res!447890 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681783 () Bool)

(assert (=> b!681783 (= e!388388 (contains!3568 acc!681 k!2843))))

(declare-fun b!681784 () Bool)

(declare-fun Unit!23920 () Unit!23918)

(assert (=> b!681784 (= e!388389 Unit!23920)))

(declare-fun lt!313360 () Unit!23918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39530 (_ BitVec 64) (_ BitVec 32)) Unit!23918)

(assert (=> b!681784 (= lt!313360 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!681784 false))

(declare-fun b!681785 () Bool)

(declare-fun res!447883 () Bool)

(assert (=> b!681785 (=> res!447883 e!388386)))

(assert (=> b!681785 (= res!447883 (not (noDuplicate!815 lt!313359)))))

(declare-fun b!681786 () Bool)

(declare-fun res!447896 () Bool)

(assert (=> b!681786 (=> (not res!447896) (not e!388387))))

(assert (=> b!681786 (= res!447896 (not (contains!3568 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681787 () Bool)

(declare-fun Unit!23921 () Unit!23918)

(assert (=> b!681787 (= e!388389 Unit!23921)))

(declare-fun b!681788 () Bool)

(declare-fun res!447889 () Bool)

(assert (=> b!681788 (=> res!447889 e!388386)))

(assert (=> b!681788 (= res!447889 (not (subseq!154 acc!681 lt!313359)))))

(declare-fun b!681789 () Bool)

(declare-fun e!388382 () Bool)

(assert (=> b!681789 (= e!388384 e!388382)))

(declare-fun res!447892 () Bool)

(assert (=> b!681789 (=> (not res!447892) (not e!388382))))

(assert (=> b!681789 (= res!447892 (bvsle from!3004 i!1382))))

(declare-fun res!447893 () Bool)

(assert (=> start!60720 (=> (not res!447893) (not e!388387))))

(assert (=> start!60720 (= res!447893 (and (bvslt (size!19314 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19314 a!3626))))))

(assert (=> start!60720 e!388387))

(assert (=> start!60720 true))

(declare-fun array_inv!14746 (array!39530) Bool)

(assert (=> start!60720 (array_inv!14746 a!3626)))

(declare-fun b!681778 () Bool)

(assert (=> b!681778 (= e!388386 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313359))))

(declare-fun lt!313357 () Unit!23918)

(declare-fun noDuplicateSubseq!28 (List!12991 List!12991) Unit!23918)

(assert (=> b!681778 (= lt!313357 (noDuplicateSubseq!28 acc!681 lt!313359))))

(declare-fun b!681790 () Bool)

(declare-fun res!447881 () Bool)

(assert (=> b!681790 (=> (not res!447881) (not e!388387))))

(assert (=> b!681790 (= res!447881 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19314 a!3626))))))

(declare-fun b!681791 () Bool)

(assert (=> b!681791 (= e!388382 (not (contains!3568 acc!681 k!2843)))))

(assert (= (and start!60720 res!447893) b!681780))

(assert (= (and b!681780 res!447891) b!681771))

(assert (= (and b!681771 res!447884) b!681786))

(assert (= (and b!681786 res!447896) b!681781))

(assert (= (and b!681781 res!447880) b!681783))

(assert (= (and b!681781 (not res!447887)) b!681789))

(assert (= (and b!681789 res!447892) b!681791))

(assert (= (and b!681781 res!447886) b!681776))

(assert (= (and b!681776 res!447895) b!681782))

(assert (= (and b!681782 res!447890) b!681790))

(assert (= (and b!681790 res!447881) b!681772))

(assert (= (and b!681772 res!447897) b!681774))

(assert (= (and b!681774 res!447882) b!681779))

(assert (= (and b!681779 res!447898) b!681777))

(assert (= (and b!681777 c!77312) b!681784))

(assert (= (and b!681777 (not c!77312)) b!681787))

(assert (= (and b!681777 (not res!447885)) b!681773))

(assert (= (and b!681773 (not res!447888)) b!681785))

(assert (= (and b!681785 (not res!447883)) b!681770))

(assert (= (and b!681770 (not res!447894)) b!681775))

(assert (= (and b!681775 (not res!447899)) b!681788))

(assert (= (and b!681788 (not res!447889)) b!681778))

(declare-fun m!646559 () Bool)

(assert (=> b!681777 m!646559))

(declare-fun m!646561 () Bool)

(assert (=> b!681777 m!646561))

(declare-fun m!646563 () Bool)

(assert (=> b!681777 m!646563))

(assert (=> b!681777 m!646559))

(declare-fun m!646565 () Bool)

(assert (=> b!681777 m!646565))

(declare-fun m!646567 () Bool)

(assert (=> b!681777 m!646567))

(declare-fun m!646569 () Bool)

(assert (=> b!681786 m!646569))

(declare-fun m!646571 () Bool)

(assert (=> start!60720 m!646571))

(declare-fun m!646573 () Bool)

(assert (=> b!681774 m!646573))

(declare-fun m!646575 () Bool)

(assert (=> b!681770 m!646575))

(declare-fun m!646577 () Bool)

(assert (=> b!681775 m!646577))

(declare-fun m!646579 () Bool)

(assert (=> b!681785 m!646579))

(declare-fun m!646581 () Bool)

(assert (=> b!681783 m!646581))

(declare-fun m!646583 () Bool)

(assert (=> b!681776 m!646583))

(declare-fun m!646585 () Bool)

(assert (=> b!681784 m!646585))

(declare-fun m!646587 () Bool)

(assert (=> b!681788 m!646587))

(declare-fun m!646589 () Bool)

(assert (=> b!681778 m!646589))

(declare-fun m!646591 () Bool)

(assert (=> b!681778 m!646591))

(assert (=> b!681773 m!646559))

(assert (=> b!681773 m!646559))

(declare-fun m!646593 () Bool)

(assert (=> b!681773 m!646593))

(declare-fun m!646595 () Bool)

(assert (=> b!681773 m!646595))

(declare-fun m!646597 () Bool)

(assert (=> b!681773 m!646597))

(declare-fun m!646599 () Bool)

(assert (=> b!681771 m!646599))

(assert (=> b!681791 m!646581))

(declare-fun m!646601 () Bool)

(assert (=> b!681782 m!646601))

(declare-fun m!646603 () Bool)

(assert (=> b!681780 m!646603))

(declare-fun m!646605 () Bool)

(assert (=> b!681772 m!646605))

(push 1)

(assert (not b!681788))

(assert (not b!681773))

(assert (not b!681776))

(assert (not b!681778))

(assert (not b!681780))

(assert (not b!681783))

(assert (not b!681774))

(assert (not b!681785))

(assert (not b!681770))

(assert (not start!60720))

(assert (not b!681784))

(assert (not b!681782))

(assert (not b!681786))

(assert (not b!681791))

(assert (not b!681771))

(assert (not b!681775))

(assert (not b!681772))

(assert (not b!681777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93921 () Bool)

(assert (=> d!93921 (= (validKeyInArray!0 (select (arr!18950 a!3626) from!3004)) (and (not (= (select (arr!18950 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18950 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681777 d!93921))

(declare-fun d!93923 () Bool)

(declare-fun res!447917 () Bool)

(declare-fun e!388410 () Bool)

(assert (=> d!93923 (=> res!447917 e!388410)))

(assert (=> d!93923 (= res!447917 (= (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93923 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388410)))

(declare-fun b!681815 () Bool)

(declare-fun e!388411 () Bool)

(assert (=> b!681815 (= e!388410 e!388411)))

(declare-fun res!447918 () Bool)

(assert (=> b!681815 (=> (not res!447918) (not e!388411))))

(assert (=> b!681815 (= res!447918 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19314 a!3626)))))

(declare-fun b!681816 () Bool)

(assert (=> b!681816 (= e!388411 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93923 (not res!447917)) b!681815))

(assert (= (and b!681815 res!447918) b!681816))

(declare-fun m!646617 () Bool)

(assert (=> d!93923 m!646617))

(declare-fun m!646619 () Bool)

(assert (=> b!681816 m!646619))

(assert (=> b!681777 d!93923))

(declare-fun d!93929 () Bool)

(declare-fun res!447919 () Bool)

(declare-fun e!388412 () Bool)

(assert (=> d!93929 (=> res!447919 e!388412)))

(assert (=> d!93929 (= res!447919 (= (select (arr!18950 (array!39531 (store (arr!18950 a!3626) i!1382 k!2843) (size!19314 a!3626))) from!3004) k!2843))))

(assert (=> d!93929 (= (arrayContainsKey!0 (array!39531 (store (arr!18950 a!3626) i!1382 k!2843) (size!19314 a!3626)) k!2843 from!3004) e!388412)))

(declare-fun b!681817 () Bool)

(declare-fun e!388413 () Bool)

(assert (=> b!681817 (= e!388412 e!388413)))

(declare-fun res!447920 () Bool)

(assert (=> b!681817 (=> (not res!447920) (not e!388413))))

(assert (=> b!681817 (= res!447920 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19314 (array!39531 (store (arr!18950 a!3626) i!1382 k!2843) (size!19314 a!3626)))))))

(declare-fun b!681818 () Bool)

(assert (=> b!681818 (= e!388413 (arrayContainsKey!0 (array!39531 (store (arr!18950 a!3626) i!1382 k!2843) (size!19314 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93929 (not res!447919)) b!681817))

(assert (= (and b!681817 res!447920) b!681818))

(declare-fun m!646621 () Bool)

(assert (=> d!93929 m!646621))

(declare-fun m!646623 () Bool)

(assert (=> b!681818 m!646623))

(assert (=> b!681777 d!93929))

(declare-fun b!681846 () Bool)

(declare-fun e!388439 () Bool)

(assert (=> b!681846 (= e!388439 (subseq!154 acc!681 (t!19228 lt!313359)))))

(declare-fun b!681844 () Bool)

(declare-fun e!388441 () Bool)

(assert (=> b!681844 (= e!388441 e!388439)))

(declare-fun res!447945 () Bool)

(assert (=> b!681844 (=> res!447945 e!388439)))

(declare-fun e!388440 () Bool)

(assert (=> b!681844 (= res!447945 e!388440)))

(declare-fun res!447948 () Bool)

(assert (=> b!681844 (=> (not res!447948) (not e!388440))))

(assert (=> b!681844 (= res!447948 (= (h!14032 acc!681) (h!14032 lt!313359)))))

(declare-fun b!681845 () Bool)

(assert (=> b!681845 (= e!388440 (subseq!154 (t!19228 acc!681) (t!19228 lt!313359)))))

(declare-fun b!681843 () Bool)

(declare-fun e!388438 () Bool)

(assert (=> b!681843 (= e!388438 e!388441)))

(declare-fun res!447947 () Bool)

(assert (=> b!681843 (=> (not res!447947) (not e!388441))))

(assert (=> b!681843 (= res!447947 (is-Cons!12987 lt!313359))))

(declare-fun d!93931 () Bool)

(declare-fun res!447946 () Bool)

(assert (=> d!93931 (=> res!447946 e!388438)))

(assert (=> d!93931 (= res!447946 (is-Nil!12988 acc!681))))

(assert (=> d!93931 (= (subseq!154 acc!681 lt!313359) e!388438)))

(assert (= (and d!93931 (not res!447946)) b!681843))

(assert (= (and b!681843 res!447947) b!681844))

(assert (= (and b!681844 res!447948) b!681845))

(assert (= (and b!681844 (not res!447945)) b!681846))

(declare-fun m!646649 () Bool)

(assert (=> b!681846 m!646649))

(declare-fun m!646651 () Bool)

(assert (=> b!681845 m!646651))

(assert (=> b!681788 d!93931))

(declare-fun b!681886 () Bool)

(declare-fun e!388481 () Bool)

(assert (=> b!681886 (= e!388481 (contains!3568 lt!313359 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun c!77319 () Bool)

(declare-fun bm!33978 () Bool)

(declare-fun call!33981 () Bool)

(assert (=> bm!33978 (= call!33981 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77319 (Cons!12987 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!313359) lt!313359)))))

(declare-fun b!681887 () Bool)

(declare-fun e!388479 () Bool)

(declare-fun e!388480 () Bool)

(assert (=> b!681887 (= e!388479 e!388480)))

(assert (=> b!681887 (= c!77319 (validKeyInArray!0 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!681888 () Bool)

(assert (=> b!681888 (= e!388480 call!33981)))

(declare-fun b!681890 () Bool)

(declare-fun e!388478 () Bool)

(assert (=> b!681890 (= e!388478 e!388479)))

(declare-fun res!447982 () Bool)

(assert (=> b!681890 (=> (not res!447982) (not e!388479))))

(assert (=> b!681890 (= res!447982 (not e!388481))))

(declare-fun res!447983 () Bool)

(assert (=> b!681890 (=> (not res!447983) (not e!388481))))

(assert (=> b!681890 (= res!447983 (validKeyInArray!0 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!681889 () Bool)

(assert (=> b!681889 (= e!388480 call!33981)))

(declare-fun d!93947 () Bool)

(declare-fun res!447984 () Bool)

(assert (=> d!93947 (=> res!447984 e!388478)))

(assert (=> d!93947 (= res!447984 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19314 a!3626)))))

(assert (=> d!93947 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313359) e!388478)))

(assert (= (and d!93947 (not res!447984)) b!681890))

(assert (= (and b!681890 res!447983) b!681886))

(assert (= (and b!681890 res!447982) b!681887))

(assert (= (and b!681887 c!77319) b!681888))

(assert (= (and b!681887 (not c!77319)) b!681889))

(assert (= (or b!681888 b!681889) bm!33978))

(assert (=> b!681886 m!646617))

(assert (=> b!681886 m!646617))

(declare-fun m!646665 () Bool)

(assert (=> b!681886 m!646665))

(assert (=> bm!33978 m!646617))

(declare-fun m!646669 () Bool)

(assert (=> bm!33978 m!646669))

(assert (=> b!681887 m!646617))

(assert (=> b!681887 m!646617))

(declare-fun m!646673 () Bool)

(assert (=> b!681887 m!646673))

(assert (=> b!681890 m!646617))

(assert (=> b!681890 m!646617))

(assert (=> b!681890 m!646673))

(assert (=> b!681778 d!93947))

(declare-fun d!93961 () Bool)

(assert (=> d!93961 (noDuplicate!815 acc!681)))

(declare-fun lt!313381 () Unit!23918)

(declare-fun choose!1385 (List!12991 List!12991) Unit!23918)

(assert (=> d!93961 (= lt!313381 (choose!1385 acc!681 lt!313359))))

(declare-fun e!388502 () Bool)

(assert (=> d!93961 e!388502))

(declare-fun res!448003 () Bool)

(assert (=> d!93961 (=> (not res!448003) (not e!388502))))

(assert (=> d!93961 (= res!448003 (subseq!154 acc!681 lt!313359))))

(assert (=> d!93961 (= (noDuplicateSubseq!28 acc!681 lt!313359) lt!313381)))

(declare-fun b!681913 () Bool)

(assert (=> b!681913 (= e!388502 (noDuplicate!815 lt!313359))))

(assert (= (and d!93961 res!448003) b!681913))

(assert (=> d!93961 m!646603))

(declare-fun m!646691 () Bool)

(assert (=> d!93961 m!646691))

(assert (=> d!93961 m!646587))

(assert (=> b!681913 m!646579))

(assert (=> b!681778 d!93961))

(declare-fun d!93973 () Bool)

(declare-fun res!448019 () Bool)

(declare-fun e!388519 () Bool)

(assert (=> d!93973 (=> res!448019 e!388519)))

(assert (=> d!93973 (= res!448019 (is-Nil!12988 acc!681))))

(assert (=> d!93973 (= (noDuplicate!815 acc!681) e!388519)))

(declare-fun b!681931 () Bool)

(declare-fun e!388520 () Bool)

(assert (=> b!681931 (= e!388519 e!388520)))

(declare-fun res!448020 () Bool)

(assert (=> b!681931 (=> (not res!448020) (not e!388520))))

(assert (=> b!681931 (= res!448020 (not (contains!3568 (t!19228 acc!681) (h!14032 acc!681))))))

(declare-fun b!681932 () Bool)

(assert (=> b!681932 (= e!388520 (noDuplicate!815 (t!19228 acc!681)))))

(assert (= (and d!93973 (not res!448019)) b!681931))

(assert (= (and b!681931 res!448020) b!681932))

(declare-fun m!646707 () Bool)

(assert (=> b!681931 m!646707))

(declare-fun m!646709 () Bool)

(assert (=> b!681932 m!646709))

(assert (=> b!681780 d!93973))

(declare-fun d!93981 () Bool)

(declare-fun lt!313386 () Bool)

(declare-fun content!278 (List!12991) (Set (_ BitVec 64)))

(assert (=> d!93981 (= lt!313386 (member k!2843 (content!278 acc!681)))))

(declare-fun e!388543 () Bool)

(assert (=> d!93981 (= lt!313386 e!388543)))

(declare-fun res!448041 () Bool)

(assert (=> d!93981 (=> (not res!448041) (not e!388543))))

(assert (=> d!93981 (= res!448041 (is-Cons!12987 acc!681))))

(assert (=> d!93981 (= (contains!3568 acc!681 k!2843) lt!313386)))

(declare-fun b!681957 () Bool)

(declare-fun e!388544 () Bool)

(assert (=> b!681957 (= e!388543 e!388544)))

(declare-fun res!448042 () Bool)

(assert (=> b!681957 (=> res!448042 e!388544)))

(assert (=> b!681957 (= res!448042 (= (h!14032 acc!681) k!2843))))

(declare-fun b!681958 () Bool)

(assert (=> b!681958 (= e!388544 (contains!3568 (t!19228 acc!681) k!2843))))

(assert (= (and d!93981 res!448041) b!681957))

(assert (= (and b!681957 (not res!448042)) b!681958))

(declare-fun m!646733 () Bool)

(assert (=> d!93981 m!646733))

(declare-fun m!646735 () Bool)

(assert (=> d!93981 m!646735))

(declare-fun m!646737 () Bool)

(assert (=> b!681958 m!646737))

(assert (=> b!681791 d!93981))

(declare-fun d!93995 () Bool)

(declare-fun lt!313389 () Bool)

(assert (=> d!93995 (= lt!313389 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!278 lt!313359)))))

(declare-fun e!388549 () Bool)

(assert (=> d!93995 (= lt!313389 e!388549)))

(declare-fun res!448047 () Bool)

(assert (=> d!93995 (=> (not res!448047) (not e!388549))))

(assert (=> d!93995 (= res!448047 (is-Cons!12987 lt!313359))))

(assert (=> d!93995 (= (contains!3568 lt!313359 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313389)))

(declare-fun b!681963 () Bool)

(declare-fun e!388550 () Bool)

(assert (=> b!681963 (= e!388549 e!388550)))

(declare-fun res!448048 () Bool)

(assert (=> b!681963 (=> res!448048 e!388550)))

(assert (=> b!681963 (= res!448048 (= (h!14032 lt!313359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681964 () Bool)

(assert (=> b!681964 (= e!388550 (contains!3568 (t!19228 lt!313359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93995 res!448047) b!681963))

(assert (= (and b!681963 (not res!448048)) b!681964))

(declare-fun m!646743 () Bool)

(assert (=> d!93995 m!646743))

(declare-fun m!646745 () Bool)

(assert (=> d!93995 m!646745))

(declare-fun m!646747 () Bool)

(assert (=> b!681964 m!646747))

(assert (=> b!681770 d!93995))

(declare-fun d!93999 () Bool)

(declare-fun lt!313390 () Bool)

(assert (=> d!93999 (= lt!313390 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!278 acc!681)))))

(declare-fun e!388551 () Bool)

(assert (=> d!93999 (= lt!313390 e!388551)))

(declare-fun res!448049 () Bool)

(assert (=> d!93999 (=> (not res!448049) (not e!388551))))

(assert (=> d!93999 (= res!448049 (is-Cons!12987 acc!681))))

(assert (=> d!93999 (= (contains!3568 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313390)))

(declare-fun b!681965 () Bool)

(declare-fun e!388552 () Bool)

(assert (=> b!681965 (= e!388551 e!388552)))

(declare-fun res!448050 () Bool)

(assert (=> b!681965 (=> res!448050 e!388552)))

(assert (=> b!681965 (= res!448050 (= (h!14032 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681966 () Bool)

(assert (=> b!681966 (= e!388552 (contains!3568 (t!19228 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93999 res!448049) b!681965))

(assert (= (and b!681965 (not res!448050)) b!681966))

(assert (=> d!93999 m!646733))

(declare-fun m!646749 () Bool)

(assert (=> d!93999 m!646749))

(declare-fun m!646751 () Bool)

(assert (=> b!681966 m!646751))

(assert (=> b!681771 d!93999))

(declare-fun e!388561 () Bool)

(declare-fun b!681972 () Bool)

(assert (=> b!681972 (= e!388561 (contains!3568 acc!681 (select (arr!18950 a!3626) from!3004)))))

(declare-fun call!33987 () Bool)

(declare-fun c!77325 () Bool)

(declare-fun bm!33984 () Bool)

(assert (=> bm!33984 (= call!33987 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77325 (Cons!12987 (select (arr!18950 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681973 () Bool)

(declare-fun e!388559 () Bool)

(declare-fun e!388560 () Bool)

(assert (=> b!681973 (= e!388559 e!388560)))

(assert (=> b!681973 (= c!77325 (validKeyInArray!0 (select (arr!18950 a!3626) from!3004)))))

(declare-fun b!681974 () Bool)

(assert (=> b!681974 (= e!388560 call!33987)))

(declare-fun b!681976 () Bool)

(declare-fun e!388558 () Bool)

(assert (=> b!681976 (= e!388558 e!388559)))

(declare-fun res!448056 () Bool)

(assert (=> b!681976 (=> (not res!448056) (not e!388559))))

(assert (=> b!681976 (= res!448056 (not e!388561))))

(declare-fun res!448057 () Bool)

(assert (=> b!681976 (=> (not res!448057) (not e!388561))))

(assert (=> b!681976 (= res!448057 (validKeyInArray!0 (select (arr!18950 a!3626) from!3004)))))

(declare-fun b!681975 () Bool)

(assert (=> b!681975 (= e!388560 call!33987)))

(declare-fun d!94003 () Bool)

(declare-fun res!448058 () Bool)

(assert (=> d!94003 (=> res!448058 e!388558)))

(assert (=> d!94003 (= res!448058 (bvsge from!3004 (size!19314 a!3626)))))

(assert (=> d!94003 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388558)))

(assert (= (and d!94003 (not res!448058)) b!681976))

(assert (= (and b!681976 res!448057) b!681972))

(assert (= (and b!681976 res!448056) b!681973))

(assert (= (and b!681973 c!77325) b!681974))

(assert (= (and b!681973 (not c!77325)) b!681975))

(assert (= (or b!681974 b!681975) bm!33984))

(assert (=> b!681972 m!646559))

(assert (=> b!681972 m!646559))

(declare-fun m!646763 () Bool)

(assert (=> b!681972 m!646763))

(assert (=> bm!33984 m!646559))

(declare-fun m!646765 () Bool)

(assert (=> bm!33984 m!646765))

(assert (=> b!681973 m!646559))

(assert (=> b!681973 m!646559))

(assert (=> b!681973 m!646565))

(assert (=> b!681976 m!646559))

(assert (=> b!681976 m!646559))

(assert (=> b!681976 m!646565))

(assert (=> b!681782 d!94003))

(declare-fun d!94013 () Bool)

(assert (=> d!94013 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681772 d!94013))

(assert (=> b!681783 d!93981))

(declare-fun d!94015 () Bool)

(assert (=> d!94015 (= (array_inv!14746 a!3626) (bvsge (size!19314 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60720 d!94015))

(declare-fun d!94019 () Bool)

(assert (=> d!94019 (= ($colon$colon!319 acc!681 (select (arr!18950 a!3626) from!3004)) (Cons!12987 (select (arr!18950 a!3626) from!3004) acc!681))))

(assert (=> b!681773 d!94019))

(declare-fun b!681986 () Bool)

(declare-fun e!388569 () Bool)

(assert (=> b!681986 (= e!388569 (subseq!154 acc!681 (t!19228 acc!681)))))

(declare-fun b!681984 () Bool)

(declare-fun e!388571 () Bool)

(assert (=> b!681984 (= e!388571 e!388569)))

(declare-fun res!448065 () Bool)

(assert (=> b!681984 (=> res!448065 e!388569)))

(declare-fun e!388570 () Bool)

(assert (=> b!681984 (= res!448065 e!388570)))

(declare-fun res!448068 () Bool)

(assert (=> b!681984 (=> (not res!448068) (not e!388570))))

