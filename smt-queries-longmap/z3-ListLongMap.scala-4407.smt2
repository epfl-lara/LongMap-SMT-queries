; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60776 () Bool)

(assert start!60776)

(declare-fun b!681760 () Bool)

(declare-datatypes ((Unit!23900 0))(
  ( (Unit!23901) )
))
(declare-fun e!388433 () Unit!23900)

(declare-fun Unit!23902 () Unit!23900)

(assert (=> b!681760 (= e!388433 Unit!23902)))

(declare-fun b!681761 () Bool)

(declare-fun res!447999 () Bool)

(declare-fun e!388427 () Bool)

(assert (=> b!681761 (=> (not res!447999) (not e!388427))))

(declare-datatypes ((array!39534 0))(
  ( (array!39535 (arr!18950 (Array (_ BitVec 32) (_ BitVec 64))) (size!19315 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39534)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681761 (= res!447999 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681762 () Bool)

(declare-fun res!448002 () Bool)

(assert (=> b!681762 (=> (not res!448002) (not e!388427))))

(declare-datatypes ((List!13030 0))(
  ( (Nil!13027) (Cons!13026 (h!14071 (_ BitVec 64)) (t!19261 List!13030)) )
))
(declare-fun acc!681 () List!13030)

(declare-fun noDuplicate!821 (List!13030) Bool)

(assert (=> b!681762 (= res!448002 (noDuplicate!821 acc!681))))

(declare-fun b!681763 () Bool)

(declare-fun e!388432 () Bool)

(declare-fun contains!3552 (List!13030 (_ BitVec 64)) Bool)

(assert (=> b!681763 (= e!388432 (not (contains!3552 acc!681 k0!2843)))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun b!681764 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39534 (_ BitVec 32) List!13030) Bool)

(assert (=> b!681764 (= e!388427 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun lt!313165 () Unit!23900)

(declare-fun e!388428 () Unit!23900)

(assert (=> b!681764 (= lt!313165 e!388428)))

(declare-fun c!77252 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681764 (= c!77252 (validKeyInArray!0 (select (arr!18950 a!3626) from!3004)))))

(declare-fun lt!313164 () Unit!23900)

(assert (=> b!681764 (= lt!313164 e!388433)))

(declare-fun c!77253 () Bool)

(assert (=> b!681764 (= c!77253 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681764 (arrayContainsKey!0 (array!39535 (store (arr!18950 a!3626) i!1382 k0!2843) (size!19315 a!3626)) k0!2843 from!3004)))

(declare-fun b!681765 () Bool)

(declare-fun e!388429 () Bool)

(assert (=> b!681765 (= e!388429 e!388432)))

(declare-fun res!447994 () Bool)

(assert (=> b!681765 (=> (not res!447994) (not e!388432))))

(assert (=> b!681765 (= res!447994 (bvsle from!3004 i!1382))))

(declare-fun b!681766 () Bool)

(declare-fun res!447996 () Bool)

(assert (=> b!681766 (=> (not res!447996) (not e!388427))))

(assert (=> b!681766 (= res!447996 (validKeyInArray!0 k0!2843))))

(declare-fun b!681768 () Bool)

(declare-fun Unit!23903 () Unit!23900)

(assert (=> b!681768 (= e!388433 Unit!23903)))

(declare-fun lt!313166 () Unit!23900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39534 (_ BitVec 64) (_ BitVec 32)) Unit!23900)

(assert (=> b!681768 (= lt!313166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681768 false))

(declare-fun b!681769 () Bool)

(declare-fun res!447991 () Bool)

(assert (=> b!681769 (=> (not res!447991) (not e!388427))))

(assert (=> b!681769 (= res!447991 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681770 () Bool)

(declare-fun res!447993 () Bool)

(assert (=> b!681770 (=> (not res!447993) (not e!388427))))

(assert (=> b!681770 (= res!447993 (not (contains!3552 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681771 () Bool)

(declare-fun e!388431 () Bool)

(assert (=> b!681771 (= e!388431 (contains!3552 acc!681 k0!2843))))

(declare-fun b!681772 () Bool)

(declare-fun Unit!23904 () Unit!23900)

(assert (=> b!681772 (= e!388428 Unit!23904)))

(declare-fun b!681773 () Bool)

(declare-fun res!447997 () Bool)

(assert (=> b!681773 (=> (not res!447997) (not e!388427))))

(assert (=> b!681773 (= res!447997 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19315 a!3626))))))

(declare-fun b!681774 () Bool)

(declare-fun res!448000 () Bool)

(assert (=> b!681774 (=> (not res!448000) (not e!388427))))

(assert (=> b!681774 (= res!448000 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19315 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681775 () Bool)

(declare-fun res!447992 () Bool)

(assert (=> b!681775 (=> (not res!447992) (not e!388427))))

(assert (=> b!681775 (= res!447992 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13027))))

(declare-fun b!681776 () Bool)

(declare-fun lt!313163 () Unit!23900)

(assert (=> b!681776 (= e!388428 lt!313163)))

(declare-fun lt!313167 () Unit!23900)

(declare-fun lemmaListSubSeqRefl!0 (List!13030) Unit!23900)

(assert (=> b!681776 (= lt!313167 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!155 (List!13030 List!13030) Bool)

(assert (=> b!681776 (subseq!155 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39534 List!13030 List!13030 (_ BitVec 32)) Unit!23900)

(declare-fun $colon$colon!319 (List!13030 (_ BitVec 64)) List!13030)

(assert (=> b!681776 (= lt!313163 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!319 acc!681 (select (arr!18950 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681776 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!681777 () Bool)

(declare-fun res!447990 () Bool)

(assert (=> b!681777 (=> (not res!447990) (not e!388427))))

(assert (=> b!681777 (= res!447990 e!388429)))

(declare-fun res!447995 () Bool)

(assert (=> b!681777 (=> res!447995 e!388429)))

(assert (=> b!681777 (= res!447995 e!388431)))

(declare-fun res!448001 () Bool)

(assert (=> b!681777 (=> (not res!448001) (not e!388431))))

(assert (=> b!681777 (= res!448001 (bvsgt from!3004 i!1382))))

(declare-fun res!447998 () Bool)

(assert (=> start!60776 (=> (not res!447998) (not e!388427))))

(assert (=> start!60776 (= res!447998 (and (bvslt (size!19315 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19315 a!3626))))))

(assert (=> start!60776 e!388427))

(assert (=> start!60776 true))

(declare-fun array_inv!14833 (array!39534) Bool)

(assert (=> start!60776 (array_inv!14833 a!3626)))

(declare-fun b!681767 () Bool)

(declare-fun res!448003 () Bool)

(assert (=> b!681767 (=> (not res!448003) (not e!388427))))

(assert (=> b!681767 (= res!448003 (not (contains!3552 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60776 res!447998) b!681762))

(assert (= (and b!681762 res!448002) b!681767))

(assert (= (and b!681767 res!448003) b!681770))

(assert (= (and b!681770 res!447993) b!681777))

(assert (= (and b!681777 res!448001) b!681771))

(assert (= (and b!681777 (not res!447995)) b!681765))

(assert (= (and b!681765 res!447994) b!681763))

(assert (= (and b!681777 res!447990) b!681775))

(assert (= (and b!681775 res!447992) b!681769))

(assert (= (and b!681769 res!447991) b!681773))

(assert (= (and b!681773 res!447997) b!681766))

(assert (= (and b!681766 res!447996) b!681761))

(assert (= (and b!681761 res!447999) b!681774))

(assert (= (and b!681774 res!448000) b!681764))

(assert (= (and b!681764 c!77253) b!681768))

(assert (= (and b!681764 (not c!77253)) b!681760))

(assert (= (and b!681764 c!77252) b!681776))

(assert (= (and b!681764 (not c!77252)) b!681772))

(declare-fun m!646047 () Bool)

(assert (=> b!681776 m!646047))

(declare-fun m!646049 () Bool)

(assert (=> b!681776 m!646049))

(declare-fun m!646051 () Bool)

(assert (=> b!681776 m!646051))

(declare-fun m!646053 () Bool)

(assert (=> b!681776 m!646053))

(assert (=> b!681776 m!646049))

(assert (=> b!681776 m!646051))

(declare-fun m!646055 () Bool)

(assert (=> b!681776 m!646055))

(declare-fun m!646057 () Bool)

(assert (=> b!681776 m!646057))

(declare-fun m!646059 () Bool)

(assert (=> b!681761 m!646059))

(declare-fun m!646061 () Bool)

(assert (=> b!681767 m!646061))

(declare-fun m!646063 () Bool)

(assert (=> b!681768 m!646063))

(declare-fun m!646065 () Bool)

(assert (=> b!681769 m!646065))

(declare-fun m!646067 () Bool)

(assert (=> start!60776 m!646067))

(assert (=> b!681764 m!646047))

(assert (=> b!681764 m!646049))

(declare-fun m!646069 () Bool)

(assert (=> b!681764 m!646069))

(declare-fun m!646071 () Bool)

(assert (=> b!681764 m!646071))

(assert (=> b!681764 m!646049))

(declare-fun m!646073 () Bool)

(assert (=> b!681764 m!646073))

(declare-fun m!646075 () Bool)

(assert (=> b!681764 m!646075))

(declare-fun m!646077 () Bool)

(assert (=> b!681766 m!646077))

(declare-fun m!646079 () Bool)

(assert (=> b!681770 m!646079))

(declare-fun m!646081 () Bool)

(assert (=> b!681775 m!646081))

(declare-fun m!646083 () Bool)

(assert (=> b!681771 m!646083))

(declare-fun m!646085 () Bool)

(assert (=> b!681762 m!646085))

(assert (=> b!681763 m!646083))

(check-sat (not b!681768) (not b!681771) (not b!681776) (not b!681764) (not b!681767) (not b!681769) (not b!681761) (not b!681763) (not b!681762) (not b!681770) (not b!681775) (not start!60776) (not b!681766))
(check-sat)
(get-model)

(declare-fun d!93835 () Bool)

(declare-fun lt!313200 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!279 (List!13030) (InoxSet (_ BitVec 64)))

(assert (=> d!93835 (= lt!313200 (select (content!279 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388481 () Bool)

(assert (=> d!93835 (= lt!313200 e!388481)))

(declare-fun res!448093 () Bool)

(assert (=> d!93835 (=> (not res!448093) (not e!388481))))

(get-info :version)

(assert (=> d!93835 (= res!448093 ((_ is Cons!13026) acc!681))))

(assert (=> d!93835 (= (contains!3552 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313200)))

(declare-fun b!681890 () Bool)

(declare-fun e!388480 () Bool)

(assert (=> b!681890 (= e!388481 e!388480)))

(declare-fun res!448092 () Bool)

(assert (=> b!681890 (=> res!448092 e!388480)))

(assert (=> b!681890 (= res!448092 (= (h!14071 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681891 () Bool)

(assert (=> b!681891 (= e!388480 (contains!3552 (t!19261 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93835 res!448093) b!681890))

(assert (= (and b!681890 (not res!448092)) b!681891))

(declare-fun m!646167 () Bool)

(assert (=> d!93835 m!646167))

(declare-fun m!646169 () Bool)

(assert (=> d!93835 m!646169))

(declare-fun m!646171 () Bool)

(assert (=> b!681891 m!646171))

(assert (=> b!681767 d!93835))

(declare-fun d!93837 () Bool)

(assert (=> d!93837 (= (array_inv!14833 a!3626) (bvsge (size!19315 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60776 d!93837))

(declare-fun d!93839 () Bool)

(assert (=> d!93839 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313203 () Unit!23900)

(declare-fun choose!13 (array!39534 (_ BitVec 64) (_ BitVec 32)) Unit!23900)

(assert (=> d!93839 (= lt!313203 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93839 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93839 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313203)))

(declare-fun bs!19986 () Bool)

(assert (= bs!19986 d!93839))

(assert (=> bs!19986 m!646059))

(declare-fun m!646173 () Bool)

(assert (=> bs!19986 m!646173))

(assert (=> b!681768 d!93839))

(declare-fun b!681906 () Bool)

(declare-fun e!388497 () Bool)

(declare-fun e!388496 () Bool)

(assert (=> b!681906 (= e!388497 e!388496)))

(declare-fun c!77268 () Bool)

(assert (=> b!681906 (= c!77268 (validKeyInArray!0 (select (arr!18950 a!3626) from!3004)))))

(declare-fun b!681907 () Bool)

(declare-fun e!388495 () Bool)

(assert (=> b!681907 (= e!388495 e!388497)))

(declare-fun res!448106 () Bool)

(assert (=> b!681907 (=> (not res!448106) (not e!388497))))

(declare-fun e!388494 () Bool)

(assert (=> b!681907 (= res!448106 (not e!388494))))

(declare-fun res!448104 () Bool)

(assert (=> b!681907 (=> (not res!448104) (not e!388494))))

(assert (=> b!681907 (= res!448104 (validKeyInArray!0 (select (arr!18950 a!3626) from!3004)))))

(declare-fun d!93841 () Bool)

(declare-fun res!448105 () Bool)

(assert (=> d!93841 (=> res!448105 e!388495)))

(assert (=> d!93841 (= res!448105 (bvsge from!3004 (size!19315 a!3626)))))

(assert (=> d!93841 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388495)))

(declare-fun bm!33961 () Bool)

(declare-fun call!33964 () Bool)

(assert (=> bm!33961 (= call!33964 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77268 (Cons!13026 (select (arr!18950 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681908 () Bool)

(assert (=> b!681908 (= e!388496 call!33964)))

(declare-fun b!681909 () Bool)

(assert (=> b!681909 (= e!388496 call!33964)))

(declare-fun b!681910 () Bool)

(assert (=> b!681910 (= e!388494 (contains!3552 acc!681 (select (arr!18950 a!3626) from!3004)))))

(assert (= (and d!93841 (not res!448105)) b!681907))

(assert (= (and b!681907 res!448104) b!681910))

(assert (= (and b!681907 res!448106) b!681906))

(assert (= (and b!681906 c!77268) b!681908))

(assert (= (and b!681906 (not c!77268)) b!681909))

(assert (= (or b!681908 b!681909) bm!33961))

(assert (=> b!681906 m!646049))

(assert (=> b!681906 m!646049))

(assert (=> b!681906 m!646073))

(assert (=> b!681907 m!646049))

(assert (=> b!681907 m!646049))

(assert (=> b!681907 m!646073))

(assert (=> bm!33961 m!646049))

(declare-fun m!646179 () Bool)

(assert (=> bm!33961 m!646179))

(assert (=> b!681910 m!646049))

(assert (=> b!681910 m!646049))

(declare-fun m!646181 () Bool)

(assert (=> b!681910 m!646181))

(assert (=> b!681769 d!93841))

(declare-fun d!93847 () Bool)

(declare-fun lt!313204 () Bool)

(assert (=> d!93847 (= lt!313204 (select (content!279 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388501 () Bool)

(assert (=> d!93847 (= lt!313204 e!388501)))

(declare-fun res!448110 () Bool)

(assert (=> d!93847 (=> (not res!448110) (not e!388501))))

(assert (=> d!93847 (= res!448110 ((_ is Cons!13026) acc!681))))

(assert (=> d!93847 (= (contains!3552 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313204)))

(declare-fun b!681913 () Bool)

(declare-fun e!388500 () Bool)

(assert (=> b!681913 (= e!388501 e!388500)))

(declare-fun res!448109 () Bool)

(assert (=> b!681913 (=> res!448109 e!388500)))

(assert (=> b!681913 (= res!448109 (= (h!14071 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681914 () Bool)

(assert (=> b!681914 (= e!388500 (contains!3552 (t!19261 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93847 res!448110) b!681913))

(assert (= (and b!681913 (not res!448109)) b!681914))

(assert (=> d!93847 m!646167))

(declare-fun m!646183 () Bool)

(assert (=> d!93847 m!646183))

(declare-fun m!646185 () Bool)

(assert (=> b!681914 m!646185))

(assert (=> b!681770 d!93847))

(declare-fun d!93849 () Bool)

(declare-fun lt!313205 () Bool)

(assert (=> d!93849 (= lt!313205 (select (content!279 acc!681) k0!2843))))

(declare-fun e!388503 () Bool)

(assert (=> d!93849 (= lt!313205 e!388503)))

(declare-fun res!448112 () Bool)

(assert (=> d!93849 (=> (not res!448112) (not e!388503))))

(assert (=> d!93849 (= res!448112 ((_ is Cons!13026) acc!681))))

(assert (=> d!93849 (= (contains!3552 acc!681 k0!2843) lt!313205)))

(declare-fun b!681915 () Bool)

(declare-fun e!388502 () Bool)

(assert (=> b!681915 (= e!388503 e!388502)))

(declare-fun res!448111 () Bool)

(assert (=> b!681915 (=> res!448111 e!388502)))

(assert (=> b!681915 (= res!448111 (= (h!14071 acc!681) k0!2843))))

(declare-fun b!681916 () Bool)

(assert (=> b!681916 (= e!388502 (contains!3552 (t!19261 acc!681) k0!2843))))

(assert (= (and d!93849 res!448112) b!681915))

(assert (= (and b!681915 (not res!448111)) b!681916))

(assert (=> d!93849 m!646167))

(declare-fun m!646187 () Bool)

(assert (=> d!93849 m!646187))

(declare-fun m!646189 () Bool)

(assert (=> b!681916 m!646189))

(assert (=> b!681771 d!93849))

(declare-fun d!93851 () Bool)

(declare-fun res!448123 () Bool)

(declare-fun e!388516 () Bool)

(assert (=> d!93851 (=> res!448123 e!388516)))

(assert (=> d!93851 (= res!448123 (= (select (arr!18950 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93851 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388516)))

(declare-fun b!681931 () Bool)

(declare-fun e!388517 () Bool)

(assert (=> b!681931 (= e!388516 e!388517)))

(declare-fun res!448124 () Bool)

(assert (=> b!681931 (=> (not res!448124) (not e!388517))))

(assert (=> b!681931 (= res!448124 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19315 a!3626)))))

(declare-fun b!681932 () Bool)

(assert (=> b!681932 (= e!388517 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93851 (not res!448123)) b!681931))

(assert (= (and b!681931 res!448124) b!681932))

(declare-fun m!646191 () Bool)

(assert (=> d!93851 m!646191))

(declare-fun m!646193 () Bool)

(assert (=> b!681932 m!646193))

(assert (=> b!681761 d!93851))

(declare-fun d!93853 () Bool)

(declare-fun res!448132 () Bool)

(declare-fun e!388526 () Bool)

(assert (=> d!93853 (=> res!448132 e!388526)))

(assert (=> d!93853 (= res!448132 ((_ is Nil!13027) acc!681))))

(assert (=> d!93853 (= (noDuplicate!821 acc!681) e!388526)))

(declare-fun b!681942 () Bool)

(declare-fun e!388527 () Bool)

(assert (=> b!681942 (= e!388526 e!388527)))

(declare-fun res!448133 () Bool)

(assert (=> b!681942 (=> (not res!448133) (not e!388527))))

(assert (=> b!681942 (= res!448133 (not (contains!3552 (t!19261 acc!681) (h!14071 acc!681))))))

(declare-fun b!681943 () Bool)

(assert (=> b!681943 (= e!388527 (noDuplicate!821 (t!19261 acc!681)))))

(assert (= (and d!93853 (not res!448132)) b!681942))

(assert (= (and b!681942 res!448133) b!681943))

(declare-fun m!646199 () Bool)

(assert (=> b!681942 m!646199))

(declare-fun m!646201 () Bool)

(assert (=> b!681943 m!646201))

(assert (=> b!681762 d!93853))

(assert (=> b!681763 d!93849))

(declare-fun b!681944 () Bool)

(declare-fun e!388531 () Bool)

(declare-fun e!388530 () Bool)

(assert (=> b!681944 (= e!388531 e!388530)))

(declare-fun c!77272 () Bool)

(assert (=> b!681944 (= c!77272 (validKeyInArray!0 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!681945 () Bool)

(declare-fun e!388529 () Bool)

(assert (=> b!681945 (= e!388529 e!388531)))

(declare-fun res!448136 () Bool)

(assert (=> b!681945 (=> (not res!448136) (not e!388531))))

(declare-fun e!388528 () Bool)

(assert (=> b!681945 (= res!448136 (not e!388528))))

(declare-fun res!448134 () Bool)

(assert (=> b!681945 (=> (not res!448134) (not e!388528))))

(assert (=> b!681945 (= res!448134 (validKeyInArray!0 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!93859 () Bool)

(declare-fun res!448135 () Bool)

(assert (=> d!93859 (=> res!448135 e!388529)))

(assert (=> d!93859 (= res!448135 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19315 a!3626)))))

(assert (=> d!93859 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!388529)))

(declare-fun call!33968 () Bool)

(declare-fun bm!33965 () Bool)

(assert (=> bm!33965 (= call!33968 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77272 (Cons!13026 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!681946 () Bool)

(assert (=> b!681946 (= e!388530 call!33968)))

(declare-fun b!681947 () Bool)

(assert (=> b!681947 (= e!388530 call!33968)))

(declare-fun b!681948 () Bool)

(assert (=> b!681948 (= e!388528 (contains!3552 acc!681 (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!93859 (not res!448135)) b!681945))

(assert (= (and b!681945 res!448134) b!681948))

(assert (= (and b!681945 res!448136) b!681944))

(assert (= (and b!681944 c!77272) b!681946))

(assert (= (and b!681944 (not c!77272)) b!681947))

(assert (= (or b!681946 b!681947) bm!33965))

(declare-fun m!646203 () Bool)

(assert (=> b!681944 m!646203))

(assert (=> b!681944 m!646203))

(declare-fun m!646205 () Bool)

(assert (=> b!681944 m!646205))

(assert (=> b!681945 m!646203))

(assert (=> b!681945 m!646203))

(assert (=> b!681945 m!646205))

(assert (=> bm!33965 m!646203))

(declare-fun m!646207 () Bool)

(assert (=> bm!33965 m!646207))

(assert (=> b!681948 m!646203))

(assert (=> b!681948 m!646203))

(declare-fun m!646209 () Bool)

(assert (=> b!681948 m!646209))

(assert (=> b!681764 d!93859))

(declare-fun d!93861 () Bool)

(assert (=> d!93861 (= (validKeyInArray!0 (select (arr!18950 a!3626) from!3004)) (and (not (= (select (arr!18950 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18950 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681764 d!93861))

(declare-fun d!93863 () Bool)

(declare-fun res!448141 () Bool)

(declare-fun e!388536 () Bool)

(assert (=> d!93863 (=> res!448141 e!388536)))

(assert (=> d!93863 (= res!448141 (= (select (arr!18950 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93863 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388536)))

(declare-fun b!681953 () Bool)

(declare-fun e!388537 () Bool)

(assert (=> b!681953 (= e!388536 e!388537)))

(declare-fun res!448142 () Bool)

(assert (=> b!681953 (=> (not res!448142) (not e!388537))))

(assert (=> b!681953 (= res!448142 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19315 a!3626)))))

(declare-fun b!681954 () Bool)

(assert (=> b!681954 (= e!388537 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93863 (not res!448141)) b!681953))

(assert (= (and b!681953 res!448142) b!681954))

(assert (=> d!93863 m!646203))

(declare-fun m!646211 () Bool)

(assert (=> b!681954 m!646211))

(assert (=> b!681764 d!93863))

(declare-fun d!93865 () Bool)

(declare-fun res!448143 () Bool)

(declare-fun e!388538 () Bool)

(assert (=> d!93865 (=> res!448143 e!388538)))

(assert (=> d!93865 (= res!448143 (= (select (arr!18950 (array!39535 (store (arr!18950 a!3626) i!1382 k0!2843) (size!19315 a!3626))) from!3004) k0!2843))))

(assert (=> d!93865 (= (arrayContainsKey!0 (array!39535 (store (arr!18950 a!3626) i!1382 k0!2843) (size!19315 a!3626)) k0!2843 from!3004) e!388538)))

(declare-fun b!681955 () Bool)

(declare-fun e!388539 () Bool)

(assert (=> b!681955 (= e!388538 e!388539)))

(declare-fun res!448144 () Bool)

(assert (=> b!681955 (=> (not res!448144) (not e!388539))))

(assert (=> b!681955 (= res!448144 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19315 (array!39535 (store (arr!18950 a!3626) i!1382 k0!2843) (size!19315 a!3626)))))))

(declare-fun b!681956 () Bool)

(assert (=> b!681956 (= e!388539 (arrayContainsKey!0 (array!39535 (store (arr!18950 a!3626) i!1382 k0!2843) (size!19315 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93865 (not res!448143)) b!681955))

(assert (= (and b!681955 res!448144) b!681956))

(declare-fun m!646213 () Bool)

(assert (=> d!93865 m!646213))

(declare-fun m!646215 () Bool)

(assert (=> b!681956 m!646215))

(assert (=> b!681764 d!93865))

(declare-fun b!681961 () Bool)

(declare-fun e!388549 () Bool)

(declare-fun e!388548 () Bool)

(assert (=> b!681961 (= e!388549 e!388548)))

(declare-fun c!77273 () Bool)

(assert (=> b!681961 (= c!77273 (validKeyInArray!0 (select (arr!18950 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681962 () Bool)

(declare-fun e!388547 () Bool)

(assert (=> b!681962 (= e!388547 e!388549)))

(declare-fun res!448153 () Bool)

(assert (=> b!681962 (=> (not res!448153) (not e!388549))))

(declare-fun e!388546 () Bool)

(assert (=> b!681962 (= res!448153 (not e!388546))))

(declare-fun res!448151 () Bool)

(assert (=> b!681962 (=> (not res!448151) (not e!388546))))

(assert (=> b!681962 (= res!448151 (validKeyInArray!0 (select (arr!18950 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93867 () Bool)

(declare-fun res!448152 () Bool)

(assert (=> d!93867 (=> res!448152 e!388547)))

(assert (=> d!93867 (= res!448152 (bvsge #b00000000000000000000000000000000 (size!19315 a!3626)))))

(assert (=> d!93867 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13027) e!388547)))

(declare-fun bm!33966 () Bool)

(declare-fun call!33969 () Bool)

(assert (=> bm!33966 (= call!33969 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77273 (Cons!13026 (select (arr!18950 a!3626) #b00000000000000000000000000000000) Nil!13027) Nil!13027)))))

(declare-fun b!681963 () Bool)

(assert (=> b!681963 (= e!388548 call!33969)))

(declare-fun b!681965 () Bool)

(assert (=> b!681965 (= e!388548 call!33969)))

(declare-fun b!681967 () Bool)

(assert (=> b!681967 (= e!388546 (contains!3552 Nil!13027 (select (arr!18950 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93867 (not res!448152)) b!681962))

(assert (= (and b!681962 res!448151) b!681967))

(assert (= (and b!681962 res!448153) b!681961))

(assert (= (and b!681961 c!77273) b!681963))

(assert (= (and b!681961 (not c!77273)) b!681965))

(assert (= (or b!681963 b!681965) bm!33966))

(assert (=> b!681961 m!646191))

(assert (=> b!681961 m!646191))

(declare-fun m!646223 () Bool)

(assert (=> b!681961 m!646223))

(assert (=> b!681962 m!646191))

(assert (=> b!681962 m!646191))

(assert (=> b!681962 m!646223))

(assert (=> bm!33966 m!646191))

(declare-fun m!646225 () Bool)

(assert (=> bm!33966 m!646225))

(assert (=> b!681967 m!646191))

(assert (=> b!681967 m!646191))

(declare-fun m!646227 () Bool)

(assert (=> b!681967 m!646227))

(assert (=> b!681775 d!93867))

(declare-fun d!93871 () Bool)

(assert (=> d!93871 (= ($colon$colon!319 acc!681 (select (arr!18950 a!3626) from!3004)) (Cons!13026 (select (arr!18950 a!3626) from!3004) acc!681))))

(assert (=> b!681776 d!93871))

(declare-fun b!681997 () Bool)

(declare-fun e!388576 () Bool)

(declare-fun e!388577 () Bool)

(assert (=> b!681997 (= e!388576 e!388577)))

(declare-fun res!448179 () Bool)

(assert (=> b!681997 (=> (not res!448179) (not e!388577))))

(assert (=> b!681997 (= res!448179 ((_ is Cons!13026) acc!681))))

(declare-fun b!682000 () Bool)

(declare-fun e!388579 () Bool)

(assert (=> b!682000 (= e!388579 (subseq!155 acc!681 (t!19261 acc!681)))))

(declare-fun b!681998 () Bool)

(assert (=> b!681998 (= e!388577 e!388579)))

(declare-fun res!448178 () Bool)

(assert (=> b!681998 (=> res!448178 e!388579)))

(declare-fun e!388578 () Bool)

(assert (=> b!681998 (= res!448178 e!388578)))

(declare-fun res!448177 () Bool)

(assert (=> b!681998 (=> (not res!448177) (not e!388578))))

(assert (=> b!681998 (= res!448177 (= (h!14071 acc!681) (h!14071 acc!681)))))

(declare-fun b!681999 () Bool)

(assert (=> b!681999 (= e!388578 (subseq!155 (t!19261 acc!681) (t!19261 acc!681)))))

(declare-fun d!93873 () Bool)

(declare-fun res!448180 () Bool)

(assert (=> d!93873 (=> res!448180 e!388576)))

(assert (=> d!93873 (= res!448180 ((_ is Nil!13027) acc!681))))

(assert (=> d!93873 (= (subseq!155 acc!681 acc!681) e!388576)))

(assert (= (and d!93873 (not res!448180)) b!681997))

(assert (= (and b!681997 res!448179) b!681998))

(assert (= (and b!681998 res!448177) b!681999))

(assert (= (and b!681998 (not res!448178)) b!682000))

(declare-fun m!646251 () Bool)

(assert (=> b!682000 m!646251))

(declare-fun m!646253 () Bool)

(assert (=> b!681999 m!646253))

(assert (=> b!681776 d!93873))

(declare-fun d!93887 () Bool)

(assert (=> d!93887 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313217 () Unit!23900)

(declare-fun choose!80 (array!39534 List!13030 List!13030 (_ BitVec 32)) Unit!23900)

(assert (=> d!93887 (= lt!313217 (choose!80 a!3626 ($colon$colon!319 acc!681 (select (arr!18950 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!93887 (bvslt (size!19315 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!93887 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!319 acc!681 (select (arr!18950 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313217)))

(declare-fun bs!19987 () Bool)

(assert (= bs!19987 d!93887))

(assert (=> bs!19987 m!646047))

(assert (=> bs!19987 m!646051))

(declare-fun m!646263 () Bool)

(assert (=> bs!19987 m!646263))

(assert (=> b!681776 d!93887))

(declare-fun d!93895 () Bool)

(assert (=> d!93895 (subseq!155 acc!681 acc!681)))

(declare-fun lt!313220 () Unit!23900)

(declare-fun choose!36 (List!13030) Unit!23900)

(assert (=> d!93895 (= lt!313220 (choose!36 acc!681))))

(assert (=> d!93895 (= (lemmaListSubSeqRefl!0 acc!681) lt!313220)))

(declare-fun bs!19988 () Bool)

(assert (= bs!19988 d!93895))

(assert (=> bs!19988 m!646057))

(declare-fun m!646269 () Bool)

(assert (=> bs!19988 m!646269))

(assert (=> b!681776 d!93895))

(assert (=> b!681776 d!93859))

(declare-fun d!93899 () Bool)

(assert (=> d!93899 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681766 d!93899))

(check-sat (not b!681945) (not bm!33965) (not d!93847) (not b!681962) (not b!681916) (not d!93849) (not d!93887) (not b!681906) (not b!681907) (not b!681948) (not b!681932) (not d!93839) (not b!681954) (not d!93895) (not bm!33961) (not b!681942) (not d!93835) (not b!681910) (not b!681956) (not b!681891) (not b!682000) (not b!681943) (not b!681944) (not b!681999) (not b!681961) (not bm!33966) (not b!681914) (not b!681967))
(check-sat)
