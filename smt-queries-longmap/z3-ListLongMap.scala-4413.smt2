; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60878 () Bool)

(assert start!60878)

(declare-fun b!682923 () Bool)

(declare-fun res!448921 () Bool)

(declare-fun e!388985 () Bool)

(assert (=> b!682923 (=> (not res!448921) (not e!388985))))

(declare-datatypes ((List!13048 0))(
  ( (Nil!13045) (Cons!13044 (h!14089 (_ BitVec 64)) (t!19282 List!13048)) )
))
(declare-fun acc!681 () List!13048)

(declare-fun contains!3570 (List!13048 (_ BitVec 64)) Bool)

(assert (=> b!682923 (= res!448921 (not (contains!3570 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682924 () Bool)

(declare-fun e!388982 () Bool)

(assert (=> b!682924 (= e!388985 (not e!388982))))

(declare-fun res!448908 () Bool)

(assert (=> b!682924 (=> res!448908 e!388982)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682924 (= res!448908 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!313569 () List!13048)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun -!138 (List!13048 (_ BitVec 64)) List!13048)

(assert (=> b!682924 (= (-!138 lt!313569 k0!2843) acc!681)))

(declare-fun $colon$colon!337 (List!13048 (_ BitVec 64)) List!13048)

(assert (=> b!682924 (= lt!313569 ($colon$colon!337 acc!681 k0!2843))))

(declare-datatypes ((Unit!23990 0))(
  ( (Unit!23991) )
))
(declare-fun lt!313563 () Unit!23990)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13048) Unit!23990)

(assert (=> b!682924 (= lt!313563 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!173 (List!13048 List!13048) Bool)

(assert (=> b!682924 (subseq!173 acc!681 acc!681)))

(declare-fun lt!313568 () Unit!23990)

(declare-fun lemmaListSubSeqRefl!0 (List!13048) Unit!23990)

(assert (=> b!682924 (= lt!313568 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39573 0))(
  ( (array!39574 (arr!18968 (Array (_ BitVec 32) (_ BitVec 64))) (size!19333 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39573)

(declare-fun arrayNoDuplicates!0 (array!39573 (_ BitVec 32) List!13048) Bool)

(assert (=> b!682924 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313567 () Unit!23990)

(declare-fun e!388987 () Unit!23990)

(assert (=> b!682924 (= lt!313567 e!388987)))

(declare-fun c!77376 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682924 (= c!77376 (validKeyInArray!0 (select (arr!18968 a!3626) from!3004)))))

(declare-fun lt!313566 () Unit!23990)

(declare-fun e!388986 () Unit!23990)

(assert (=> b!682924 (= lt!313566 e!388986)))

(declare-fun c!77375 () Bool)

(declare-fun arrayContainsKey!0 (array!39573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682924 (= c!77375 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682924 (arrayContainsKey!0 (array!39574 (store (arr!18968 a!3626) i!1382 k0!2843) (size!19333 a!3626)) k0!2843 from!3004)))

(declare-fun b!682925 () Bool)

(declare-fun res!448914 () Bool)

(assert (=> b!682925 (=> (not res!448914) (not e!388985))))

(assert (=> b!682925 (= res!448914 (validKeyInArray!0 k0!2843))))

(declare-fun b!682926 () Bool)

(declare-fun res!448909 () Bool)

(assert (=> b!682926 (=> (not res!448909) (not e!388985))))

(assert (=> b!682926 (= res!448909 (not (contains!3570 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682927 () Bool)

(declare-fun res!448920 () Bool)

(assert (=> b!682927 (=> (not res!448920) (not e!388985))))

(assert (=> b!682927 (= res!448920 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682928 () Bool)

(declare-fun res!448915 () Bool)

(assert (=> b!682928 (=> (not res!448915) (not e!388985))))

(assert (=> b!682928 (= res!448915 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13045))))

(declare-fun res!448910 () Bool)

(assert (=> start!60878 (=> (not res!448910) (not e!388985))))

(assert (=> start!60878 (= res!448910 (and (bvslt (size!19333 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19333 a!3626))))))

(assert (=> start!60878 e!388985))

(assert (=> start!60878 true))

(declare-fun array_inv!14851 (array!39573) Bool)

(assert (=> start!60878 (array_inv!14851 a!3626)))

(declare-fun b!682929 () Bool)

(declare-fun e!388988 () Bool)

(assert (=> b!682929 (= e!388988 (contains!3570 acc!681 k0!2843))))

(declare-fun b!682930 () Bool)

(declare-fun noDuplicate!839 (List!13048) Bool)

(assert (=> b!682930 (= e!388982 (noDuplicate!839 lt!313569))))

(declare-fun b!682931 () Bool)

(declare-fun res!448911 () Bool)

(assert (=> b!682931 (=> (not res!448911) (not e!388985))))

(assert (=> b!682931 (= res!448911 (noDuplicate!839 acc!681))))

(declare-fun b!682932 () Bool)

(declare-fun Unit!23992 () Unit!23990)

(assert (=> b!682932 (= e!388986 Unit!23992)))

(declare-fun b!682933 () Bool)

(declare-fun Unit!23993 () Unit!23990)

(assert (=> b!682933 (= e!388986 Unit!23993)))

(declare-fun lt!313564 () Unit!23990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39573 (_ BitVec 64) (_ BitVec 32)) Unit!23990)

(assert (=> b!682933 (= lt!313564 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682933 false))

(declare-fun b!682934 () Bool)

(declare-fun res!448916 () Bool)

(assert (=> b!682934 (=> (not res!448916) (not e!388985))))

(assert (=> b!682934 (= res!448916 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19333 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682935 () Bool)

(declare-fun e!388984 () Bool)

(declare-fun e!388983 () Bool)

(assert (=> b!682935 (= e!388984 e!388983)))

(declare-fun res!448913 () Bool)

(assert (=> b!682935 (=> (not res!448913) (not e!388983))))

(assert (=> b!682935 (= res!448913 (bvsle from!3004 i!1382))))

(declare-fun b!682936 () Bool)

(declare-fun lt!313565 () Unit!23990)

(assert (=> b!682936 (= e!388987 lt!313565)))

(declare-fun lt!313562 () Unit!23990)

(assert (=> b!682936 (= lt!313562 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682936 (subseq!173 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39573 List!13048 List!13048 (_ BitVec 32)) Unit!23990)

(assert (=> b!682936 (= lt!313565 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!337 acc!681 (select (arr!18968 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682936 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682937 () Bool)

(assert (=> b!682937 (= e!388983 (not (contains!3570 acc!681 k0!2843)))))

(declare-fun b!682938 () Bool)

(declare-fun res!448919 () Bool)

(assert (=> b!682938 (=> (not res!448919) (not e!388985))))

(assert (=> b!682938 (= res!448919 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19333 a!3626))))))

(declare-fun b!682939 () Bool)

(declare-fun res!448917 () Bool)

(assert (=> b!682939 (=> (not res!448917) (not e!388985))))

(assert (=> b!682939 (= res!448917 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682940 () Bool)

(declare-fun res!448912 () Bool)

(assert (=> b!682940 (=> (not res!448912) (not e!388985))))

(assert (=> b!682940 (= res!448912 e!388984)))

(declare-fun res!448907 () Bool)

(assert (=> b!682940 (=> res!448907 e!388984)))

(assert (=> b!682940 (= res!448907 e!388988)))

(declare-fun res!448918 () Bool)

(assert (=> b!682940 (=> (not res!448918) (not e!388988))))

(assert (=> b!682940 (= res!448918 (bvsgt from!3004 i!1382))))

(declare-fun b!682941 () Bool)

(declare-fun Unit!23994 () Unit!23990)

(assert (=> b!682941 (= e!388987 Unit!23994)))

(assert (= (and start!60878 res!448910) b!682931))

(assert (= (and b!682931 res!448911) b!682923))

(assert (= (and b!682923 res!448921) b!682926))

(assert (= (and b!682926 res!448909) b!682940))

(assert (= (and b!682940 res!448918) b!682929))

(assert (= (and b!682940 (not res!448907)) b!682935))

(assert (= (and b!682935 res!448913) b!682937))

(assert (= (and b!682940 res!448912) b!682928))

(assert (= (and b!682928 res!448915) b!682939))

(assert (= (and b!682939 res!448917) b!682938))

(assert (= (and b!682938 res!448919) b!682925))

(assert (= (and b!682925 res!448914) b!682927))

(assert (= (and b!682927 res!448920) b!682934))

(assert (= (and b!682934 res!448916) b!682924))

(assert (= (and b!682924 c!77375) b!682933))

(assert (= (and b!682924 (not c!77375)) b!682932))

(assert (= (and b!682924 c!77376) b!682936))

(assert (= (and b!682924 (not c!77376)) b!682941))

(assert (= (and b!682924 (not res!448908)) b!682930))

(declare-fun m!647007 () Bool)

(assert (=> b!682929 m!647007))

(declare-fun m!647009 () Bool)

(assert (=> b!682939 m!647009))

(declare-fun m!647011 () Bool)

(assert (=> b!682926 m!647011))

(declare-fun m!647013 () Bool)

(assert (=> b!682923 m!647013))

(declare-fun m!647015 () Bool)

(assert (=> b!682927 m!647015))

(declare-fun m!647017 () Bool)

(assert (=> b!682933 m!647017))

(declare-fun m!647019 () Bool)

(assert (=> b!682924 m!647019))

(declare-fun m!647021 () Bool)

(assert (=> b!682924 m!647021))

(declare-fun m!647023 () Bool)

(assert (=> b!682924 m!647023))

(declare-fun m!647025 () Bool)

(assert (=> b!682924 m!647025))

(declare-fun m!647027 () Bool)

(assert (=> b!682924 m!647027))

(declare-fun m!647029 () Bool)

(assert (=> b!682924 m!647029))

(assert (=> b!682924 m!647021))

(declare-fun m!647031 () Bool)

(assert (=> b!682924 m!647031))

(declare-fun m!647033 () Bool)

(assert (=> b!682924 m!647033))

(declare-fun m!647035 () Bool)

(assert (=> b!682924 m!647035))

(declare-fun m!647037 () Bool)

(assert (=> b!682924 m!647037))

(declare-fun m!647039 () Bool)

(assert (=> b!682924 m!647039))

(declare-fun m!647041 () Bool)

(assert (=> b!682931 m!647041))

(assert (=> b!682937 m!647007))

(declare-fun m!647043 () Bool)

(assert (=> b!682925 m!647043))

(declare-fun m!647045 () Bool)

(assert (=> b!682928 m!647045))

(declare-fun m!647047 () Bool)

(assert (=> start!60878 m!647047))

(declare-fun m!647049 () Bool)

(assert (=> b!682930 m!647049))

(assert (=> b!682936 m!647019))

(assert (=> b!682936 m!647021))

(declare-fun m!647051 () Bool)

(assert (=> b!682936 m!647051))

(declare-fun m!647053 () Bool)

(assert (=> b!682936 m!647053))

(assert (=> b!682936 m!647021))

(assert (=> b!682936 m!647051))

(assert (=> b!682936 m!647033))

(assert (=> b!682936 m!647039))

(check-sat (not b!682927) (not b!682931) (not b!682923) (not b!682926) (not b!682933) (not b!682936) (not b!682929) (not b!682937) (not b!682930) (not b!682925) (not b!682928) (not start!60878) (not b!682939) (not b!682924))
(check-sat)
(get-model)

(declare-fun d!93955 () Bool)

(declare-fun lt!313620 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!282 (List!13048) (InoxSet (_ BitVec 64)))

(assert (=> d!93955 (= lt!313620 (select (content!282 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389042 () Bool)

(assert (=> d!93955 (= lt!313620 e!389042)))

(declare-fun res!449016 () Bool)

(assert (=> d!93955 (=> (not res!449016) (not e!389042))))

(get-info :version)

(assert (=> d!93955 (= res!449016 ((_ is Cons!13044) acc!681))))

(assert (=> d!93955 (= (contains!3570 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313620)))

(declare-fun b!683060 () Bool)

(declare-fun e!389041 () Bool)

(assert (=> b!683060 (= e!389042 e!389041)))

(declare-fun res!449017 () Bool)

(assert (=> b!683060 (=> res!449017 e!389041)))

(assert (=> b!683060 (= res!449017 (= (h!14089 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!683061 () Bool)

(assert (=> b!683061 (= e!389041 (contains!3570 (t!19282 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93955 res!449016) b!683060))

(assert (= (and b!683060 (not res!449017)) b!683061))

(declare-fun m!647151 () Bool)

(assert (=> d!93955 m!647151))

(declare-fun m!647153 () Bool)

(assert (=> d!93955 m!647153))

(declare-fun m!647155 () Bool)

(assert (=> b!683061 m!647155))

(assert (=> b!682926 d!93955))

(declare-fun d!93957 () Bool)

(assert (=> d!93957 (= ($colon$colon!337 acc!681 (select (arr!18968 a!3626) from!3004)) (Cons!13044 (select (arr!18968 a!3626) from!3004) acc!681))))

(assert (=> b!682936 d!93957))

(declare-fun b!683071 () Bool)

(declare-fun e!389051 () Bool)

(declare-fun e!389054 () Bool)

(assert (=> b!683071 (= e!389051 e!389054)))

(declare-fun res!449027 () Bool)

(assert (=> b!683071 (=> res!449027 e!389054)))

(declare-fun e!389053 () Bool)

(assert (=> b!683071 (= res!449027 e!389053)))

(declare-fun res!449026 () Bool)

(assert (=> b!683071 (=> (not res!449026) (not e!389053))))

(assert (=> b!683071 (= res!449026 (= (h!14089 acc!681) (h!14089 acc!681)))))

(declare-fun d!93959 () Bool)

(declare-fun res!449029 () Bool)

(declare-fun e!389052 () Bool)

(assert (=> d!93959 (=> res!449029 e!389052)))

(assert (=> d!93959 (= res!449029 ((_ is Nil!13045) acc!681))))

(assert (=> d!93959 (= (subseq!173 acc!681 acc!681) e!389052)))

(declare-fun b!683072 () Bool)

(assert (=> b!683072 (= e!389053 (subseq!173 (t!19282 acc!681) (t!19282 acc!681)))))

(declare-fun b!683070 () Bool)

(assert (=> b!683070 (= e!389052 e!389051)))

(declare-fun res!449028 () Bool)

(assert (=> b!683070 (=> (not res!449028) (not e!389051))))

(assert (=> b!683070 (= res!449028 ((_ is Cons!13044) acc!681))))

(declare-fun b!683073 () Bool)

(assert (=> b!683073 (= e!389054 (subseq!173 acc!681 (t!19282 acc!681)))))

(assert (= (and d!93959 (not res!449029)) b!683070))

(assert (= (and b!683070 res!449028) b!683071))

(assert (= (and b!683071 res!449026) b!683072))

(assert (= (and b!683071 (not res!449027)) b!683073))

(declare-fun m!647157 () Bool)

(assert (=> b!683072 m!647157))

(declare-fun m!647159 () Bool)

(assert (=> b!683073 m!647159))

(assert (=> b!682936 d!93959))

(declare-fun d!93961 () Bool)

(assert (=> d!93961 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313623 () Unit!23990)

(declare-fun choose!80 (array!39573 List!13048 List!13048 (_ BitVec 32)) Unit!23990)

(assert (=> d!93961 (= lt!313623 (choose!80 a!3626 ($colon$colon!337 acc!681 (select (arr!18968 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!93961 (bvslt (size!19333 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!93961 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!337 acc!681 (select (arr!18968 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313623)))

(declare-fun bs!20013 () Bool)

(assert (= bs!20013 d!93961))

(assert (=> bs!20013 m!647019))

(assert (=> bs!20013 m!647051))

(declare-fun m!647161 () Bool)

(assert (=> bs!20013 m!647161))

(assert (=> b!682936 d!93961))

(declare-fun d!93965 () Bool)

(assert (=> d!93965 (subseq!173 acc!681 acc!681)))

(declare-fun lt!313626 () Unit!23990)

(declare-fun choose!36 (List!13048) Unit!23990)

(assert (=> d!93965 (= lt!313626 (choose!36 acc!681))))

(assert (=> d!93965 (= (lemmaListSubSeqRefl!0 acc!681) lt!313626)))

(declare-fun bs!20014 () Bool)

(assert (= bs!20014 d!93965))

(assert (=> bs!20014 m!647039))

(declare-fun m!647163 () Bool)

(assert (=> bs!20014 m!647163))

(assert (=> b!682936 d!93965))

(declare-fun b!683097 () Bool)

(declare-fun e!389076 () Bool)

(declare-fun e!389077 () Bool)

(assert (=> b!683097 (= e!389076 e!389077)))

(declare-fun res!449049 () Bool)

(assert (=> b!683097 (=> (not res!449049) (not e!389077))))

(declare-fun e!389078 () Bool)

(assert (=> b!683097 (= res!449049 (not e!389078))))

(declare-fun res!449050 () Bool)

(assert (=> b!683097 (=> (not res!449050) (not e!389078))))

(assert (=> b!683097 (= res!449050 (validKeyInArray!0 (select (arr!18968 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!683098 () Bool)

(assert (=> b!683098 (= e!389078 (contains!3570 acc!681 (select (arr!18968 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!683099 () Bool)

(declare-fun e!389075 () Bool)

(assert (=> b!683099 (= e!389077 e!389075)))

(declare-fun c!77391 () Bool)

(assert (=> b!683099 (= c!77391 (validKeyInArray!0 (select (arr!18968 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!33976 () Bool)

(declare-fun call!33979 () Bool)

(assert (=> bm!33976 (= call!33979 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77391 (Cons!13044 (select (arr!18968 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!683100 () Bool)

(assert (=> b!683100 (= e!389075 call!33979)))

(declare-fun b!683096 () Bool)

(assert (=> b!683096 (= e!389075 call!33979)))

(declare-fun d!93969 () Bool)

(declare-fun res!449048 () Bool)

(assert (=> d!93969 (=> res!449048 e!389076)))

(assert (=> d!93969 (= res!449048 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19333 a!3626)))))

(assert (=> d!93969 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!389076)))

(assert (= (and d!93969 (not res!449048)) b!683097))

(assert (= (and b!683097 res!449050) b!683098))

(assert (= (and b!683097 res!449049) b!683099))

(assert (= (and b!683099 c!77391) b!683100))

(assert (= (and b!683099 (not c!77391)) b!683096))

(assert (= (or b!683100 b!683096) bm!33976))

(declare-fun m!647175 () Bool)

(assert (=> b!683097 m!647175))

(assert (=> b!683097 m!647175))

(declare-fun m!647177 () Bool)

(assert (=> b!683097 m!647177))

(assert (=> b!683098 m!647175))

(assert (=> b!683098 m!647175))

(declare-fun m!647179 () Bool)

(assert (=> b!683098 m!647179))

(assert (=> b!683099 m!647175))

(assert (=> b!683099 m!647175))

(assert (=> b!683099 m!647177))

(assert (=> bm!33976 m!647175))

(declare-fun m!647181 () Bool)

(assert (=> bm!33976 m!647181))

(assert (=> b!682936 d!93969))

(declare-fun d!93979 () Bool)

(assert (=> d!93979 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682925 d!93979))

(declare-fun d!93981 () Bool)

(declare-fun res!449073 () Bool)

(declare-fun e!389103 () Bool)

(assert (=> d!93981 (=> res!449073 e!389103)))

(assert (=> d!93981 (= res!449073 (= (select (arr!18968 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93981 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!389103)))

(declare-fun b!683127 () Bool)

(declare-fun e!389104 () Bool)

(assert (=> b!683127 (= e!389103 e!389104)))

(declare-fun res!449074 () Bool)

(assert (=> b!683127 (=> (not res!449074) (not e!389104))))

(assert (=> b!683127 (= res!449074 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19333 a!3626)))))

(declare-fun b!683128 () Bool)

(assert (=> b!683128 (= e!389104 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93981 (not res!449073)) b!683127))

(assert (= (and b!683127 res!449074) b!683128))

(declare-fun m!647187 () Bool)

(assert (=> d!93981 m!647187))

(declare-fun m!647189 () Bool)

(assert (=> b!683128 m!647189))

(assert (=> b!682927 d!93981))

(declare-fun d!93985 () Bool)

(declare-fun lt!313630 () Bool)

(assert (=> d!93985 (= lt!313630 (select (content!282 acc!681) k0!2843))))

(declare-fun e!389106 () Bool)

(assert (=> d!93985 (= lt!313630 e!389106)))

(declare-fun res!449075 () Bool)

(assert (=> d!93985 (=> (not res!449075) (not e!389106))))

(assert (=> d!93985 (= res!449075 ((_ is Cons!13044) acc!681))))

(assert (=> d!93985 (= (contains!3570 acc!681 k0!2843) lt!313630)))

(declare-fun b!683129 () Bool)

(declare-fun e!389105 () Bool)

(assert (=> b!683129 (= e!389106 e!389105)))

(declare-fun res!449076 () Bool)

(assert (=> b!683129 (=> res!449076 e!389105)))

(assert (=> b!683129 (= res!449076 (= (h!14089 acc!681) k0!2843))))

(declare-fun b!683130 () Bool)

(assert (=> b!683130 (= e!389105 (contains!3570 (t!19282 acc!681) k0!2843))))

(assert (= (and d!93985 res!449075) b!683129))

(assert (= (and b!683129 (not res!449076)) b!683130))

(assert (=> d!93985 m!647151))

(declare-fun m!647191 () Bool)

(assert (=> d!93985 m!647191))

(declare-fun m!647193 () Bool)

(assert (=> b!683130 m!647193))

(assert (=> b!682937 d!93985))

(declare-fun d!93987 () Bool)

(declare-fun lt!313631 () Bool)

(assert (=> d!93987 (= lt!313631 (select (content!282 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389108 () Bool)

(assert (=> d!93987 (= lt!313631 e!389108)))

(declare-fun res!449077 () Bool)

(assert (=> d!93987 (=> (not res!449077) (not e!389108))))

(assert (=> d!93987 (= res!449077 ((_ is Cons!13044) acc!681))))

(assert (=> d!93987 (= (contains!3570 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313631)))

(declare-fun b!683131 () Bool)

(declare-fun e!389107 () Bool)

(assert (=> b!683131 (= e!389108 e!389107)))

(declare-fun res!449078 () Bool)

(assert (=> b!683131 (=> res!449078 e!389107)))

(assert (=> b!683131 (= res!449078 (= (h!14089 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!683132 () Bool)

(assert (=> b!683132 (= e!389107 (contains!3570 (t!19282 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93987 res!449077) b!683131))

(assert (= (and b!683131 (not res!449078)) b!683132))

(assert (=> d!93987 m!647151))

(declare-fun m!647195 () Bool)

(assert (=> d!93987 m!647195))

(declare-fun m!647197 () Bool)

(assert (=> b!683132 m!647197))

(assert (=> b!682923 d!93987))

(declare-fun d!93989 () Bool)

(assert (=> d!93989 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313637 () Unit!23990)

(declare-fun choose!13 (array!39573 (_ BitVec 64) (_ BitVec 32)) Unit!23990)

(assert (=> d!93989 (= lt!313637 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93989 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93989 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313637)))

(declare-fun bs!20016 () Bool)

(assert (= bs!20016 d!93989))

(assert (=> bs!20016 m!647015))

(declare-fun m!647201 () Bool)

(assert (=> bs!20016 m!647201))

(assert (=> b!682933 d!93989))

(declare-fun b!683171 () Bool)

(declare-fun e!389142 () List!13048)

(declare-fun e!389141 () List!13048)

(assert (=> b!683171 (= e!389142 e!389141)))

(declare-fun c!77403 () Bool)

(assert (=> b!683171 (= c!77403 (= k0!2843 (h!14089 lt!313569)))))

(declare-fun b!683172 () Bool)

(declare-fun call!33988 () List!13048)

(assert (=> b!683172 (= e!389141 (Cons!13044 (h!14089 lt!313569) call!33988))))

(declare-fun d!93993 () Bool)

(declare-fun e!389140 () Bool)

(assert (=> d!93993 e!389140))

(declare-fun res!449101 () Bool)

(assert (=> d!93993 (=> (not res!449101) (not e!389140))))

(declare-fun lt!313643 () List!13048)

(declare-fun size!19336 (List!13048) Int)

(assert (=> d!93993 (= res!449101 (<= (size!19336 lt!313643) (size!19336 lt!313569)))))

(assert (=> d!93993 (= lt!313643 e!389142)))

(declare-fun c!77402 () Bool)

(assert (=> d!93993 (= c!77402 ((_ is Cons!13044) lt!313569))))

(assert (=> d!93993 (= (-!138 lt!313569 k0!2843) lt!313643)))

(declare-fun b!683173 () Bool)

(assert (=> b!683173 (= e!389142 Nil!13045)))

(declare-fun bm!33985 () Bool)

(assert (=> bm!33985 (= call!33988 (-!138 (t!19282 lt!313569) k0!2843))))

(declare-fun b!683174 () Bool)

(assert (=> b!683174 (= e!389140 (= (content!282 lt!313643) ((_ map and) (content!282 lt!313569) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!683175 () Bool)

(assert (=> b!683175 (= e!389141 call!33988)))

(assert (= (and d!93993 c!77402) b!683171))

(assert (= (and d!93993 (not c!77402)) b!683173))

(assert (= (and b!683171 c!77403) b!683175))

(assert (= (and b!683171 (not c!77403)) b!683172))

(assert (= (or b!683175 b!683172) bm!33985))

(assert (= (and d!93993 res!449101) b!683174))

(declare-fun m!647217 () Bool)

(assert (=> d!93993 m!647217))

(declare-fun m!647219 () Bool)

(assert (=> d!93993 m!647219))

(declare-fun m!647221 () Bool)

(assert (=> bm!33985 m!647221))

(declare-fun m!647223 () Bool)

(assert (=> b!683174 m!647223))

(declare-fun m!647225 () Bool)

(assert (=> b!683174 m!647225))

(declare-fun m!647227 () Bool)

(assert (=> b!683174 m!647227))

(assert (=> b!682924 d!93993))

(assert (=> b!682924 d!93959))

(declare-fun d!94001 () Bool)

(declare-fun res!449102 () Bool)

(declare-fun e!389143 () Bool)

(assert (=> d!94001 (=> res!449102 e!389143)))

(assert (=> d!94001 (= res!449102 (= (select (arr!18968 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94001 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389143)))

(declare-fun b!683176 () Bool)

(declare-fun e!389144 () Bool)

(assert (=> b!683176 (= e!389143 e!389144)))

(declare-fun res!449103 () Bool)

(assert (=> b!683176 (=> (not res!449103) (not e!389144))))

(assert (=> b!683176 (= res!449103 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19333 a!3626)))))

(declare-fun b!683177 () Bool)

(assert (=> b!683177 (= e!389144 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94001 (not res!449102)) b!683176))

(assert (= (and b!683176 res!449103) b!683177))

(assert (=> d!94001 m!647175))

(declare-fun m!647229 () Bool)

(assert (=> b!683177 m!647229))

(assert (=> b!682924 d!94001))

(declare-fun d!94003 () Bool)

(assert (=> d!94003 (= (-!138 ($colon$colon!337 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313646 () Unit!23990)

(declare-fun choose!16 ((_ BitVec 64) List!13048) Unit!23990)

(assert (=> d!94003 (= lt!313646 (choose!16 k0!2843 acc!681))))

(assert (=> d!94003 (not (contains!3570 acc!681 k0!2843))))

(assert (=> d!94003 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!313646)))

(declare-fun bs!20018 () Bool)

(assert (= bs!20018 d!94003))

(assert (=> bs!20018 m!647029))

(assert (=> bs!20018 m!647029))

(declare-fun m!647243 () Bool)

(assert (=> bs!20018 m!647243))

(declare-fun m!647245 () Bool)

(assert (=> bs!20018 m!647245))

(assert (=> bs!20018 m!647007))

(assert (=> b!682924 d!94003))

(declare-fun d!94009 () Bool)

(declare-fun res!449117 () Bool)

(declare-fun e!389159 () Bool)

(assert (=> d!94009 (=> res!449117 e!389159)))

(assert (=> d!94009 (= res!449117 (= (select (arr!18968 (array!39574 (store (arr!18968 a!3626) i!1382 k0!2843) (size!19333 a!3626))) from!3004) k0!2843))))

(assert (=> d!94009 (= (arrayContainsKey!0 (array!39574 (store (arr!18968 a!3626) i!1382 k0!2843) (size!19333 a!3626)) k0!2843 from!3004) e!389159)))

(declare-fun b!683193 () Bool)

(declare-fun e!389160 () Bool)

(assert (=> b!683193 (= e!389159 e!389160)))

(declare-fun res!449118 () Bool)

(assert (=> b!683193 (=> (not res!449118) (not e!389160))))

(assert (=> b!683193 (= res!449118 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19333 (array!39574 (store (arr!18968 a!3626) i!1382 k0!2843) (size!19333 a!3626)))))))

(declare-fun b!683194 () Bool)

(assert (=> b!683194 (= e!389160 (arrayContainsKey!0 (array!39574 (store (arr!18968 a!3626) i!1382 k0!2843) (size!19333 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94009 (not res!449117)) b!683193))

(assert (= (and b!683193 res!449118) b!683194))

(declare-fun m!647249 () Bool)

(assert (=> d!94009 m!647249))

(declare-fun m!647253 () Bool)

(assert (=> b!683194 m!647253))

(assert (=> b!682924 d!94009))

(assert (=> b!682924 d!93965))

(declare-fun d!94015 () Bool)

(assert (=> d!94015 (= (validKeyInArray!0 (select (arr!18968 a!3626) from!3004)) (and (not (= (select (arr!18968 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18968 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682924 d!94015))

(declare-fun d!94017 () Bool)

(assert (=> d!94017 (= ($colon$colon!337 acc!681 k0!2843) (Cons!13044 k0!2843 acc!681))))

(assert (=> b!682924 d!94017))

(assert (=> b!682924 d!93969))

(declare-fun d!94019 () Bool)

(assert (=> d!94019 (= (array_inv!14851 a!3626) (bvsge (size!19333 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60878 d!94019))

(declare-fun d!94023 () Bool)

(declare-fun res!449133 () Bool)

(declare-fun e!389175 () Bool)

(assert (=> d!94023 (=> res!449133 e!389175)))

(assert (=> d!94023 (= res!449133 ((_ is Nil!13045) acc!681))))

(assert (=> d!94023 (= (noDuplicate!839 acc!681) e!389175)))

(declare-fun b!683209 () Bool)

(declare-fun e!389176 () Bool)

(assert (=> b!683209 (= e!389175 e!389176)))

(declare-fun res!449134 () Bool)

(assert (=> b!683209 (=> (not res!449134) (not e!389176))))

(assert (=> b!683209 (= res!449134 (not (contains!3570 (t!19282 acc!681) (h!14089 acc!681))))))

(declare-fun b!683210 () Bool)

(assert (=> b!683210 (= e!389176 (noDuplicate!839 (t!19282 acc!681)))))

(assert (= (and d!94023 (not res!449133)) b!683209))

(assert (= (and b!683209 res!449134) b!683210))

(declare-fun m!647267 () Bool)

(assert (=> b!683209 m!647267))

(declare-fun m!647269 () Bool)

(assert (=> b!683210 m!647269))

(assert (=> b!682931 d!94023))

(declare-fun b!683212 () Bool)

(declare-fun e!389178 () Bool)

(declare-fun e!389179 () Bool)

(assert (=> b!683212 (= e!389178 e!389179)))

(declare-fun res!449136 () Bool)

(assert (=> b!683212 (=> (not res!449136) (not e!389179))))

(declare-fun e!389180 () Bool)

(assert (=> b!683212 (= res!449136 (not e!389180))))

(declare-fun res!449137 () Bool)

(assert (=> b!683212 (=> (not res!449137) (not e!389180))))

(assert (=> b!683212 (= res!449137 (validKeyInArray!0 (select (arr!18968 a!3626) from!3004)))))

(declare-fun b!683213 () Bool)

(assert (=> b!683213 (= e!389180 (contains!3570 acc!681 (select (arr!18968 a!3626) from!3004)))))

(declare-fun b!683214 () Bool)

(declare-fun e!389177 () Bool)

(assert (=> b!683214 (= e!389179 e!389177)))

(declare-fun c!77405 () Bool)

(assert (=> b!683214 (= c!77405 (validKeyInArray!0 (select (arr!18968 a!3626) from!3004)))))

(declare-fun call!33990 () Bool)

(declare-fun bm!33987 () Bool)

(assert (=> bm!33987 (= call!33990 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77405 (Cons!13044 (select (arr!18968 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!683215 () Bool)

(assert (=> b!683215 (= e!389177 call!33990)))

(declare-fun b!683211 () Bool)

(assert (=> b!683211 (= e!389177 call!33990)))

(declare-fun d!94029 () Bool)

(declare-fun res!449135 () Bool)

(assert (=> d!94029 (=> res!449135 e!389178)))

(assert (=> d!94029 (= res!449135 (bvsge from!3004 (size!19333 a!3626)))))

(assert (=> d!94029 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!389178)))

(assert (= (and d!94029 (not res!449135)) b!683212))

(assert (= (and b!683212 res!449137) b!683213))

(assert (= (and b!683212 res!449136) b!683214))

(assert (= (and b!683214 c!77405) b!683215))

(assert (= (and b!683214 (not c!77405)) b!683211))

(assert (= (or b!683215 b!683211) bm!33987))

(assert (=> b!683212 m!647021))

(assert (=> b!683212 m!647021))

(assert (=> b!683212 m!647031))

(assert (=> b!683213 m!647021))

(assert (=> b!683213 m!647021))

(declare-fun m!647271 () Bool)

(assert (=> b!683213 m!647271))

(assert (=> b!683214 m!647021))

(assert (=> b!683214 m!647021))

(assert (=> b!683214 m!647031))

(assert (=> bm!33987 m!647021))

(declare-fun m!647273 () Bool)

(assert (=> bm!33987 m!647273))

(assert (=> b!682939 d!94029))

(declare-fun b!683217 () Bool)

(declare-fun e!389182 () Bool)

(declare-fun e!389183 () Bool)

(assert (=> b!683217 (= e!389182 e!389183)))

(declare-fun res!449139 () Bool)

(assert (=> b!683217 (=> (not res!449139) (not e!389183))))

(declare-fun e!389184 () Bool)

(assert (=> b!683217 (= res!449139 (not e!389184))))

(declare-fun res!449140 () Bool)

(assert (=> b!683217 (=> (not res!449140) (not e!389184))))

(assert (=> b!683217 (= res!449140 (validKeyInArray!0 (select (arr!18968 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!683218 () Bool)

(assert (=> b!683218 (= e!389184 (contains!3570 Nil!13045 (select (arr!18968 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!683219 () Bool)

(declare-fun e!389181 () Bool)

(assert (=> b!683219 (= e!389183 e!389181)))

(declare-fun c!77406 () Bool)

(assert (=> b!683219 (= c!77406 (validKeyInArray!0 (select (arr!18968 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33988 () Bool)

(declare-fun call!33991 () Bool)

(assert (=> bm!33988 (= call!33991 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77406 (Cons!13044 (select (arr!18968 a!3626) #b00000000000000000000000000000000) Nil!13045) Nil!13045)))))

(declare-fun b!683220 () Bool)

(assert (=> b!683220 (= e!389181 call!33991)))

(declare-fun b!683216 () Bool)

(assert (=> b!683216 (= e!389181 call!33991)))

(declare-fun d!94031 () Bool)

(declare-fun res!449138 () Bool)

(assert (=> d!94031 (=> res!449138 e!389182)))

(assert (=> d!94031 (= res!449138 (bvsge #b00000000000000000000000000000000 (size!19333 a!3626)))))

(assert (=> d!94031 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13045) e!389182)))

(assert (= (and d!94031 (not res!449138)) b!683217))

(assert (= (and b!683217 res!449140) b!683218))

(assert (= (and b!683217 res!449139) b!683219))

(assert (= (and b!683219 c!77406) b!683220))

(assert (= (and b!683219 (not c!77406)) b!683216))

(assert (= (or b!683220 b!683216) bm!33988))

(assert (=> b!683217 m!647187))

(assert (=> b!683217 m!647187))

(declare-fun m!647275 () Bool)

(assert (=> b!683217 m!647275))

(assert (=> b!683218 m!647187))

(assert (=> b!683218 m!647187))

(declare-fun m!647277 () Bool)

(assert (=> b!683218 m!647277))

(assert (=> b!683219 m!647187))

(assert (=> b!683219 m!647187))

(assert (=> b!683219 m!647275))

(assert (=> bm!33988 m!647187))

(declare-fun m!647279 () Bool)

(assert (=> bm!33988 m!647279))

(assert (=> b!682928 d!94031))

(declare-fun d!94033 () Bool)

(declare-fun res!449141 () Bool)

(declare-fun e!389185 () Bool)

(assert (=> d!94033 (=> res!449141 e!389185)))

(assert (=> d!94033 (= res!449141 ((_ is Nil!13045) lt!313569))))

(assert (=> d!94033 (= (noDuplicate!839 lt!313569) e!389185)))

(declare-fun b!683221 () Bool)

(declare-fun e!389186 () Bool)

(assert (=> b!683221 (= e!389185 e!389186)))

(declare-fun res!449142 () Bool)

(assert (=> b!683221 (=> (not res!449142) (not e!389186))))

(assert (=> b!683221 (= res!449142 (not (contains!3570 (t!19282 lt!313569) (h!14089 lt!313569))))))

(declare-fun b!683222 () Bool)

(assert (=> b!683222 (= e!389186 (noDuplicate!839 (t!19282 lt!313569)))))

(assert (= (and d!94033 (not res!449141)) b!683221))

(assert (= (and b!683221 res!449142) b!683222))

(declare-fun m!647281 () Bool)

(assert (=> b!683221 m!647281))

(declare-fun m!647283 () Bool)

(assert (=> b!683222 m!647283))

(assert (=> b!682930 d!94033))

(assert (=> b!682929 d!93985))

(check-sat (not b!683219) (not b!683217) (not b!683218) (not d!93987) (not b!683130) (not b!683128) (not d!93993) (not b!683222) (not b!683210) (not b!683174) (not b!683061) (not d!93955) (not b!683132) (not bm!33976) (not b!683221) (not bm!33985) (not bm!33987) (not b!683194) (not b!683097) (not b!683209) (not b!683098) (not b!683214) (not b!683213) (not b!683099) (not d!94003) (not bm!33988) (not d!93965) (not b!683212) (not d!93985) (not d!93961) (not b!683073) (not b!683177) (not d!93989) (not b!683072))
(check-sat)
