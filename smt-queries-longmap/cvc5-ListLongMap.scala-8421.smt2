; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102516 () Bool)

(assert start!102516)

(declare-fun b!1232807 () Bool)

(declare-fun e!699282 () Bool)

(declare-datatypes ((array!79496 0))(
  ( (array!79497 (arr!38360 (Array (_ BitVec 32) (_ BitVec 64))) (size!38896 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79496)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27133 0))(
  ( (Nil!27130) (Cons!27129 (h!28338 (_ BitVec 64)) (t!40596 List!27133)) )
))
(declare-fun arrayNoDuplicates!0 (array!79496 (_ BitVec 32) List!27133) Bool)

(assert (=> b!1232807 (= e!699282 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)))))

(declare-fun b!1232808 () Bool)

(declare-fun e!699284 () Bool)

(declare-fun e!699285 () Bool)

(assert (=> b!1232808 (= e!699284 e!699285)))

(declare-fun res!821115 () Bool)

(assert (=> b!1232808 (=> (not res!821115) (not e!699285))))

(declare-fun lt!559570 () List!27133)

(declare-fun contains!7195 (List!27133 (_ BitVec 64)) Bool)

(assert (=> b!1232808 (= res!821115 (not (contains!7195 lt!559570 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232809 () Bool)

(declare-fun res!821107 () Bool)

(declare-fun e!699281 () Bool)

(assert (=> b!1232809 (=> (not res!821107) (not e!699281))))

(assert (=> b!1232809 (= res!821107 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38896 a!3806)) (bvslt from!3184 (size!38896 a!3806))))))

(declare-fun b!1232810 () Bool)

(declare-fun res!821109 () Bool)

(assert (=> b!1232810 (=> (not res!821109) (not e!699281))))

(declare-fun acc!823 () List!27133)

(assert (=> b!1232810 (= res!821109 (not (contains!7195 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232811 () Bool)

(declare-fun res!821112 () Bool)

(assert (=> b!1232811 (=> (not res!821112) (not e!699281))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232811 (= res!821112 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232812 () Bool)

(declare-fun res!821113 () Bool)

(assert (=> b!1232812 (=> (not res!821113) (not e!699281))))

(assert (=> b!1232812 (= res!821113 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232813 () Bool)

(declare-fun res!821118 () Bool)

(assert (=> b!1232813 (=> res!821118 e!699284)))

(declare-fun noDuplicate!1792 (List!27133) Bool)

(assert (=> b!1232813 (= res!821118 (not (noDuplicate!1792 lt!559570)))))

(declare-fun res!821111 () Bool)

(assert (=> start!102516 (=> (not res!821111) (not e!699281))))

(assert (=> start!102516 (= res!821111 (bvslt (size!38896 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102516 e!699281))

(declare-fun array_inv!29208 (array!79496) Bool)

(assert (=> start!102516 (array_inv!29208 a!3806)))

(assert (=> start!102516 true))

(declare-fun b!1232814 () Bool)

(declare-fun res!821110 () Bool)

(assert (=> b!1232814 (=> (not res!821110) (not e!699281))))

(assert (=> b!1232814 (= res!821110 (noDuplicate!1792 acc!823))))

(declare-fun b!1232815 () Bool)

(declare-fun res!821114 () Bool)

(assert (=> b!1232815 (=> (not res!821114) (not e!699281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232815 (= res!821114 (validKeyInArray!0 k!2913))))

(declare-fun b!1232816 () Bool)

(declare-fun res!821108 () Bool)

(assert (=> b!1232816 (=> (not res!821108) (not e!699281))))

(assert (=> b!1232816 (= res!821108 (validKeyInArray!0 (select (arr!38360 a!3806) from!3184)))))

(declare-fun b!1232817 () Bool)

(declare-fun res!821119 () Bool)

(assert (=> b!1232817 (=> (not res!821119) (not e!699281))))

(assert (=> b!1232817 (= res!821119 (not (contains!7195 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232818 () Bool)

(assert (=> b!1232818 (= e!699281 (not e!699284))))

(declare-fun res!821116 () Bool)

(assert (=> b!1232818 (=> res!821116 e!699284)))

(assert (=> b!1232818 (= res!821116 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1232818 (= lt!559570 (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130))))

(assert (=> b!1232818 e!699282))

(declare-fun res!821117 () Bool)

(assert (=> b!1232818 (=> (not res!821117) (not e!699282))))

(assert (=> b!1232818 (= res!821117 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27130))))

(declare-datatypes ((Unit!40826 0))(
  ( (Unit!40827) )
))
(declare-fun lt!559571 () Unit!40826)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79496 List!27133 List!27133 (_ BitVec 32)) Unit!40826)

(assert (=> b!1232818 (= lt!559571 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27130 from!3184))))

(assert (=> b!1232818 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823))))

(declare-fun b!1232819 () Bool)

(assert (=> b!1232819 (= e!699285 (not (contains!7195 lt!559570 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102516 res!821111) b!1232815))

(assert (= (and b!1232815 res!821114) b!1232809))

(assert (= (and b!1232809 res!821107) b!1232814))

(assert (= (and b!1232814 res!821110) b!1232810))

(assert (= (and b!1232810 res!821109) b!1232817))

(assert (= (and b!1232817 res!821119) b!1232811))

(assert (= (and b!1232811 res!821112) b!1232812))

(assert (= (and b!1232812 res!821113) b!1232816))

(assert (= (and b!1232816 res!821108) b!1232818))

(assert (= (and b!1232818 res!821117) b!1232807))

(assert (= (and b!1232818 (not res!821116)) b!1232813))

(assert (= (and b!1232813 (not res!821118)) b!1232808))

(assert (= (and b!1232808 res!821115) b!1232819))

(declare-fun m!1136839 () Bool)

(assert (=> b!1232814 m!1136839))

(declare-fun m!1136841 () Bool)

(assert (=> b!1232812 m!1136841))

(declare-fun m!1136843 () Bool)

(assert (=> b!1232819 m!1136843))

(declare-fun m!1136845 () Bool)

(assert (=> b!1232810 m!1136845))

(declare-fun m!1136847 () Bool)

(assert (=> b!1232808 m!1136847))

(declare-fun m!1136849 () Bool)

(assert (=> b!1232807 m!1136849))

(declare-fun m!1136851 () Bool)

(assert (=> b!1232807 m!1136851))

(declare-fun m!1136853 () Bool)

(assert (=> start!102516 m!1136853))

(declare-fun m!1136855 () Bool)

(assert (=> b!1232811 m!1136855))

(assert (=> b!1232816 m!1136849))

(assert (=> b!1232816 m!1136849))

(declare-fun m!1136857 () Bool)

(assert (=> b!1232816 m!1136857))

(declare-fun m!1136859 () Bool)

(assert (=> b!1232817 m!1136859))

(declare-fun m!1136861 () Bool)

(assert (=> b!1232813 m!1136861))

(declare-fun m!1136863 () Bool)

(assert (=> b!1232815 m!1136863))

(assert (=> b!1232818 m!1136849))

(declare-fun m!1136865 () Bool)

(assert (=> b!1232818 m!1136865))

(declare-fun m!1136867 () Bool)

(assert (=> b!1232818 m!1136867))

(declare-fun m!1136869 () Bool)

(assert (=> b!1232818 m!1136869))

(push 1)

(assert (not b!1232808))

(assert (not b!1232807))

(assert (not b!1232812))

(assert (not b!1232816))

(assert (not b!1232813))

(assert (not b!1232817))

(assert (not b!1232810))

(assert (not b!1232818))

(assert (not b!1232814))

(assert (not start!102516))

(assert (not b!1232819))

(assert (not b!1232811))

(assert (not b!1232815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1232941 () Bool)

(declare-fun e!699356 () Bool)

(assert (=> b!1232941 (= e!699356 (contains!7195 Nil!27130 (select (arr!38360 a!3806) from!3184)))))

(declare-fun b!1232942 () Bool)

(declare-fun e!699357 () Bool)

(declare-fun call!60943 () Bool)

(assert (=> b!1232942 (= e!699357 call!60943)))

(declare-fun b!1232943 () Bool)

(assert (=> b!1232943 (= e!699357 call!60943)))

(declare-fun d!135055 () Bool)

(declare-fun res!821232 () Bool)

(declare-fun e!699355 () Bool)

(assert (=> d!135055 (=> res!821232 e!699355)))

(assert (=> d!135055 (= res!821232 (bvsge from!3184 (size!38896 a!3806)))))

(assert (=> d!135055 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27130) e!699355)))

(declare-fun c!120715 () Bool)

(declare-fun bm!60940 () Bool)

(assert (=> bm!60940 (= call!60943 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120715 (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130) Nil!27130)))))

(declare-fun b!1232944 () Bool)

(declare-fun e!699354 () Bool)

(assert (=> b!1232944 (= e!699354 e!699357)))

(assert (=> b!1232944 (= c!120715 (validKeyInArray!0 (select (arr!38360 a!3806) from!3184)))))

(declare-fun b!1232945 () Bool)

(assert (=> b!1232945 (= e!699355 e!699354)))

(declare-fun res!821233 () Bool)

(assert (=> b!1232945 (=> (not res!821233) (not e!699354))))

(assert (=> b!1232945 (= res!821233 (not e!699356))))

(declare-fun res!821231 () Bool)

(assert (=> b!1232945 (=> (not res!821231) (not e!699356))))

(assert (=> b!1232945 (= res!821231 (validKeyInArray!0 (select (arr!38360 a!3806) from!3184)))))

(assert (= (and d!135055 (not res!821232)) b!1232945))

(assert (= (and b!1232945 res!821231) b!1232941))

(assert (= (and b!1232945 res!821233) b!1232944))

(assert (= (and b!1232944 c!120715) b!1232943))

(assert (= (and b!1232944 (not c!120715)) b!1232942))

(assert (= (or b!1232943 b!1232942) bm!60940))

(assert (=> b!1232941 m!1136849))

(assert (=> b!1232941 m!1136849))

(declare-fun m!1136953 () Bool)

(assert (=> b!1232941 m!1136953))

(assert (=> bm!60940 m!1136849))

(declare-fun m!1136955 () Bool)

(assert (=> bm!60940 m!1136955))

(assert (=> b!1232944 m!1136849))

(assert (=> b!1232944 m!1136849))

(assert (=> b!1232944 m!1136857))

(assert (=> b!1232945 m!1136849))

(assert (=> b!1232945 m!1136849))

(assert (=> b!1232945 m!1136857))

(assert (=> b!1232818 d!135055))

(declare-fun d!135065 () Bool)

(assert (=> d!135065 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27130)))

(declare-fun lt!559595 () Unit!40826)

(declare-fun choose!80 (array!79496 List!27133 List!27133 (_ BitVec 32)) Unit!40826)

(assert (=> d!135065 (= lt!559595 (choose!80 a!3806 acc!823 Nil!27130 from!3184))))

(assert (=> d!135065 (bvslt (size!38896 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135065 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27130 from!3184) lt!559595)))

(declare-fun bs!34647 () Bool)

(assert (= bs!34647 d!135065))

(assert (=> bs!34647 m!1136865))

(declare-fun m!1136971 () Bool)

(assert (=> bs!34647 m!1136971))

(assert (=> b!1232818 d!135065))

(declare-fun e!699376 () Bool)

(declare-fun b!1232963 () Bool)

(assert (=> b!1232963 (= e!699376 (contains!7195 (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823) (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232964 () Bool)

(declare-fun e!699377 () Bool)

(declare-fun call!60945 () Bool)

(assert (=> b!1232964 (= e!699377 call!60945)))

(declare-fun b!1232965 () Bool)

(assert (=> b!1232965 (= e!699377 call!60945)))

(declare-fun d!135077 () Bool)

(declare-fun res!821250 () Bool)

(declare-fun e!699375 () Bool)

(assert (=> d!135077 (=> res!821250 e!699375)))

(assert (=> d!135077 (= res!821250 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38896 a!3806)))))

(assert (=> d!135077 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823)) e!699375)))

(declare-fun bm!60942 () Bool)

(declare-fun c!120717 () Bool)

(assert (=> bm!60942 (= call!60945 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120717 (Cons!27129 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823)) (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823))))))

(declare-fun b!1232966 () Bool)

(declare-fun e!699374 () Bool)

(assert (=> b!1232966 (= e!699374 e!699377)))

(assert (=> b!1232966 (= c!120717 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232967 () Bool)

(assert (=> b!1232967 (= e!699375 e!699374)))

(declare-fun res!821251 () Bool)

(assert (=> b!1232967 (=> (not res!821251) (not e!699374))))

(assert (=> b!1232967 (= res!821251 (not e!699376))))

(declare-fun res!821249 () Bool)

(assert (=> b!1232967 (=> (not res!821249) (not e!699376))))

(assert (=> b!1232967 (= res!821249 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135077 (not res!821250)) b!1232967))

(assert (= (and b!1232967 res!821249) b!1232963))

(assert (= (and b!1232967 res!821251) b!1232966))

(assert (= (and b!1232966 c!120717) b!1232965))

(assert (= (and b!1232966 (not c!120717)) b!1232964))

(assert (= (or b!1232965 b!1232964) bm!60942))

(declare-fun m!1136979 () Bool)

(assert (=> b!1232963 m!1136979))

(assert (=> b!1232963 m!1136979))

(declare-fun m!1136981 () Bool)

(assert (=> b!1232963 m!1136981))

(assert (=> bm!60942 m!1136979))

(declare-fun m!1136983 () Bool)

(assert (=> bm!60942 m!1136983))

(assert (=> b!1232966 m!1136979))

(assert (=> b!1232966 m!1136979))

(declare-fun m!1136987 () Bool)

(assert (=> b!1232966 m!1136987))

(assert (=> b!1232967 m!1136979))

(assert (=> b!1232967 m!1136979))

(assert (=> b!1232967 m!1136987))

(assert (=> b!1232818 d!135077))

(declare-fun b!1232975 () Bool)

(declare-fun e!699386 () Bool)

(assert (=> b!1232975 (= e!699386 (contains!7195 (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130) (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232976 () Bool)

(declare-fun e!699387 () Bool)

(declare-fun call!60947 () Bool)

(assert (=> b!1232976 (= e!699387 call!60947)))

(declare-fun b!1232977 () Bool)

(assert (=> b!1232977 (= e!699387 call!60947)))

(declare-fun d!135081 () Bool)

(declare-fun res!821258 () Bool)

(declare-fun e!699385 () Bool)

(assert (=> d!135081 (=> res!821258 e!699385)))

(assert (=> d!135081 (= res!821258 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38896 a!3806)))))

(assert (=> d!135081 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)) e!699385)))

(declare-fun c!120719 () Bool)

(declare-fun bm!60944 () Bool)

(assert (=> bm!60944 (= call!60947 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120719 (Cons!27129 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130))))))

(declare-fun b!1232978 () Bool)

(declare-fun e!699384 () Bool)

(assert (=> b!1232978 (= e!699384 e!699387)))

(assert (=> b!1232978 (= c!120719 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232979 () Bool)

(assert (=> b!1232979 (= e!699385 e!699384)))

(declare-fun res!821259 () Bool)

(assert (=> b!1232979 (=> (not res!821259) (not e!699384))))

(assert (=> b!1232979 (= res!821259 (not e!699386))))

(declare-fun res!821257 () Bool)

(assert (=> b!1232979 (=> (not res!821257) (not e!699386))))

(assert (=> b!1232979 (= res!821257 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135081 (not res!821258)) b!1232979))

(assert (= (and b!1232979 res!821257) b!1232975))

(assert (= (and b!1232979 res!821259) b!1232978))

(assert (= (and b!1232978 c!120719) b!1232977))

(assert (= (and b!1232978 (not c!120719)) b!1232976))

(assert (= (or b!1232977 b!1232976) bm!60944))

(assert (=> b!1232975 m!1136979))

(assert (=> b!1232975 m!1136979))

(declare-fun m!1136995 () Bool)

(assert (=> b!1232975 m!1136995))

(assert (=> bm!60944 m!1136979))

(declare-fun m!1136997 () Bool)

(assert (=> bm!60944 m!1136997))

(assert (=> b!1232978 m!1136979))

(assert (=> b!1232978 m!1136979))

(assert (=> b!1232978 m!1136987))

(assert (=> b!1232979 m!1136979))

(assert (=> b!1232979 m!1136979))

(assert (=> b!1232979 m!1136987))

(assert (=> b!1232807 d!135081))

(declare-fun d!135091 () Bool)

(declare-fun lt!559603 () Bool)

(declare-fun content!574 (List!27133) (Set (_ BitVec 64)))

(assert (=> d!135091 (= lt!559603 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!574 lt!559570)))))

(declare-fun e!699408 () Bool)

(assert (=> d!135091 (= lt!559603 e!699408)))

(declare-fun res!821280 () Bool)

(assert (=> d!135091 (=> (not res!821280) (not e!699408))))

(assert (=> d!135091 (= res!821280 (is-Cons!27129 lt!559570))))

(assert (=> d!135091 (= (contains!7195 lt!559570 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559603)))

(declare-fun b!1233001 () Bool)

(declare-fun e!699409 () Bool)

(assert (=> b!1233001 (= e!699408 e!699409)))

(declare-fun res!821279 () Bool)

(assert (=> b!1233001 (=> res!821279 e!699409)))

(assert (=> b!1233001 (= res!821279 (= (h!28338 lt!559570) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233002 () Bool)

(assert (=> b!1233002 (= e!699409 (contains!7195 (t!40596 lt!559570) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135091 res!821280) b!1233001))

(assert (= (and b!1233001 (not res!821279)) b!1233002))

(declare-fun m!1137021 () Bool)

(assert (=> d!135091 m!1137021))

(declare-fun m!1137023 () Bool)

(assert (=> d!135091 m!1137023))

(declare-fun m!1137025 () Bool)

(assert (=> b!1233002 m!1137025))

(assert (=> b!1232808 d!135091))

(declare-fun d!135103 () Bool)

(declare-fun lt!559604 () Bool)

(assert (=> d!135103 (= lt!559604 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!574 lt!559570)))))

(declare-fun e!699412 () Bool)

(assert (=> d!135103 (= lt!559604 e!699412)))

(declare-fun res!821284 () Bool)

(assert (=> d!135103 (=> (not res!821284) (not e!699412))))

(assert (=> d!135103 (= res!821284 (is-Cons!27129 lt!559570))))

(assert (=> d!135103 (= (contains!7195 lt!559570 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559604)))

(declare-fun b!1233005 () Bool)

(declare-fun e!699413 () Bool)

(assert (=> b!1233005 (= e!699412 e!699413)))

(declare-fun res!821283 () Bool)

(assert (=> b!1233005 (=> res!821283 e!699413)))

(assert (=> b!1233005 (= res!821283 (= (h!28338 lt!559570) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233006 () Bool)

(assert (=> b!1233006 (= e!699413 (contains!7195 (t!40596 lt!559570) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135103 res!821284) b!1233005))

(assert (= (and b!1233005 (not res!821283)) b!1233006))

(assert (=> d!135103 m!1137021))

(declare-fun m!1137031 () Bool)

(assert (=> d!135103 m!1137031))

(declare-fun m!1137033 () Bool)

(assert (=> b!1233006 m!1137033))

(assert (=> b!1232819 d!135103))

(declare-fun d!135107 () Bool)

(declare-fun lt!559605 () Bool)

(assert (=> d!135107 (= lt!559605 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!574 acc!823)))))

(declare-fun e!699422 () Bool)

(assert (=> d!135107 (= lt!559605 e!699422)))

(declare-fun res!821294 () Bool)

(assert (=> d!135107 (=> (not res!821294) (not e!699422))))

(assert (=> d!135107 (= res!821294 (is-Cons!27129 acc!823))))

(assert (=> d!135107 (= (contains!7195 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559605)))

(declare-fun b!1233017 () Bool)

(declare-fun e!699423 () Bool)

(assert (=> b!1233017 (= e!699422 e!699423)))

(declare-fun res!821293 () Bool)

(assert (=> b!1233017 (=> res!821293 e!699423)))

(assert (=> b!1233017 (= res!821293 (= (h!28338 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233018 () Bool)

(assert (=> b!1233018 (= e!699423 (contains!7195 (t!40596 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135107 res!821294) b!1233017))

(assert (= (and b!1233017 (not res!821293)) b!1233018))

(declare-fun m!1137039 () Bool)

(assert (=> d!135107 m!1137039))

(declare-fun m!1137041 () Bool)

(assert (=> d!135107 m!1137041))

(declare-fun m!1137043 () Bool)

(assert (=> b!1233018 m!1137043))

(assert (=> b!1232810 d!135107))

(declare-fun d!135109 () Bool)

(declare-fun res!821299 () Bool)

(declare-fun e!699430 () Bool)

(assert (=> d!135109 (=> res!821299 e!699430)))

(assert (=> d!135109 (= res!821299 (= (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!135109 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699430)))

(declare-fun b!1233025 () Bool)

(declare-fun e!699431 () Bool)

(assert (=> b!1233025 (= e!699430 e!699431)))

(declare-fun res!821300 () Bool)

(assert (=> b!1233025 (=> (not res!821300) (not e!699431))))

(assert (=> b!1233025 (= res!821300 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38896 a!3806)))))

(declare-fun b!1233026 () Bool)

(assert (=> b!1233026 (= e!699431 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135109 (not res!821299)) b!1233025))

(assert (= (and b!1233025 res!821300) b!1233026))

(assert (=> d!135109 m!1136979))

(declare-fun m!1137045 () Bool)

(assert (=> b!1233026 m!1137045))

(assert (=> b!1232811 d!135109))

(declare-fun d!135111 () Bool)

(declare-fun res!821311 () Bool)

(declare-fun e!699444 () Bool)

(assert (=> d!135111 (=> res!821311 e!699444)))

(assert (=> d!135111 (= res!821311 (is-Nil!27130 lt!559570))))

(assert (=> d!135111 (= (noDuplicate!1792 lt!559570) e!699444)))

(declare-fun b!1233041 () Bool)

(declare-fun e!699445 () Bool)

(assert (=> b!1233041 (= e!699444 e!699445)))

(declare-fun res!821312 () Bool)

(assert (=> b!1233041 (=> (not res!821312) (not e!699445))))

(assert (=> b!1233041 (= res!821312 (not (contains!7195 (t!40596 lt!559570) (h!28338 lt!559570))))))

(declare-fun b!1233042 () Bool)

(assert (=> b!1233042 (= e!699445 (noDuplicate!1792 (t!40596 lt!559570)))))

(assert (= (and d!135111 (not res!821311)) b!1233041))

(assert (= (and b!1233041 res!821312) b!1233042))

(declare-fun m!1137057 () Bool)

(assert (=> b!1233041 m!1137057))

(declare-fun m!1137059 () Bool)

(assert (=> b!1233042 m!1137059))

(assert (=> b!1232813 d!135111))

(declare-fun b!1233048 () Bool)

(declare-fun e!699452 () Bool)

(assert (=> b!1233048 (= e!699452 (contains!7195 acc!823 (select (arr!38360 a!3806) from!3184)))))

(declare-fun b!1233049 () Bool)

(declare-fun e!699453 () Bool)

(declare-fun call!60954 () Bool)

(assert (=> b!1233049 (= e!699453 call!60954)))

(declare-fun b!1233050 () Bool)

(assert (=> b!1233050 (= e!699453 call!60954)))

(declare-fun d!135117 () Bool)

(declare-fun res!821317 () Bool)

(declare-fun e!699451 () Bool)

(assert (=> d!135117 (=> res!821317 e!699451)))

(assert (=> d!135117 (= res!821317 (bvsge from!3184 (size!38896 a!3806)))))

(assert (=> d!135117 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699451)))

(declare-fun c!120726 () Bool)

(declare-fun bm!60951 () Bool)

(assert (=> bm!60951 (= call!60954 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120726 (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1233051 () Bool)

(declare-fun e!699450 () Bool)

(assert (=> b!1233051 (= e!699450 e!699453)))

(assert (=> b!1233051 (= c!120726 (validKeyInArray!0 (select (arr!38360 a!3806) from!3184)))))

(declare-fun b!1233052 () Bool)

(assert (=> b!1233052 (= e!699451 e!699450)))

(declare-fun res!821318 () Bool)

(assert (=> b!1233052 (=> (not res!821318) (not e!699450))))

(assert (=> b!1233052 (= res!821318 (not e!699452))))

(declare-fun res!821316 () Bool)

(assert (=> b!1233052 (=> (not res!821316) (not e!699452))))

(assert (=> b!1233052 (= res!821316 (validKeyInArray!0 (select (arr!38360 a!3806) from!3184)))))

(assert (= (and d!135117 (not res!821317)) b!1233052))

(assert (= (and b!1233052 res!821316) b!1233048))

(assert (= (and b!1233052 res!821318) b!1233051))

(assert (= (and b!1233051 c!120726) b!1233050))

(assert (= (and b!1233051 (not c!120726)) b!1233049))

(assert (= (or b!1233050 b!1233049) bm!60951))

(assert (=> b!1233048 m!1136849))

(assert (=> b!1233048 m!1136849))

(declare-fun m!1137061 () Bool)

(assert (=> b!1233048 m!1137061))

(assert (=> bm!60951 m!1136849))

(declare-fun m!1137065 () Bool)

(assert (=> bm!60951 m!1137065))

(assert (=> b!1233051 m!1136849))

(assert (=> b!1233051 m!1136849))

(assert (=> b!1233051 m!1136857))

(assert (=> b!1233052 m!1136849))

(assert (=> b!1233052 m!1136849))

(assert (=> b!1233052 m!1136857))

(assert (=> b!1232812 d!135117))

(declare-fun d!135121 () Bool)

(declare-fun res!821319 () Bool)

(declare-fun e!699454 () Bool)

(assert (=> d!135121 (=> res!821319 e!699454)))

(assert (=> d!135121 (= res!821319 (is-Nil!27130 acc!823))))

(assert (=> d!135121 (= (noDuplicate!1792 acc!823) e!699454)))

(declare-fun b!1233053 () Bool)

(declare-fun e!699455 () Bool)

(assert (=> b!1233053 (= e!699454 e!699455)))

(declare-fun res!821320 () Bool)

(assert (=> b!1233053 (=> (not res!821320) (not e!699455))))

(assert (=> b!1233053 (= res!821320 (not (contains!7195 (t!40596 acc!823) (h!28338 acc!823))))))

(declare-fun b!1233054 () Bool)

(assert (=> b!1233054 (= e!699455 (noDuplicate!1792 (t!40596 acc!823)))))

(assert (= (and d!135121 (not res!821319)) b!1233053))

(assert (= (and b!1233053 res!821320) b!1233054))

(declare-fun m!1137069 () Bool)

(assert (=> b!1233053 m!1137069))

(declare-fun m!1137071 () Bool)

(assert (=> b!1233054 m!1137071))

(assert (=> b!1232814 d!135121))

(declare-fun d!135123 () Bool)

(assert (=> d!135123 (= (array_inv!29208 a!3806) (bvsge (size!38896 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102516 d!135123))

(declare-fun d!135125 () Bool)

(assert (=> d!135125 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232815 d!135125))

(declare-fun d!135127 () Bool)

(declare-fun lt!559606 () Bool)

(assert (=> d!135127 (= lt!559606 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!574 acc!823)))))

(declare-fun e!699456 () Bool)

(assert (=> d!135127 (= lt!559606 e!699456)))

(declare-fun res!821322 () Bool)

(assert (=> d!135127 (=> (not res!821322) (not e!699456))))

(assert (=> d!135127 (= res!821322 (is-Cons!27129 acc!823))))

(assert (=> d!135127 (= (contains!7195 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559606)))

(declare-fun b!1233055 () Bool)

(declare-fun e!699457 () Bool)

(assert (=> b!1233055 (= e!699456 e!699457)))

(declare-fun res!821321 () Bool)

(assert (=> b!1233055 (=> res!821321 e!699457)))

(assert (=> b!1233055 (= res!821321 (= (h!28338 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233056 () Bool)

(assert (=> b!1233056 (= e!699457 (contains!7195 (t!40596 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135127 res!821322) b!1233055))

(assert (= (and b!1233055 (not res!821321)) b!1233056))

(assert (=> d!135127 m!1137039))

(declare-fun m!1137073 () Bool)

(assert (=> d!135127 m!1137073))

(declare-fun m!1137075 () Bool)

(assert (=> b!1233056 m!1137075))

(assert (=> b!1232817 d!135127))

(declare-fun d!135129 () Bool)

(assert (=> d!135129 (= (validKeyInArray!0 (select (arr!38360 a!3806) from!3184)) (and (not (= (select (arr!38360 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38360 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232816 d!135129))

(push 1)

(assert (not b!1233053))

(assert (not d!135091))

(assert (not b!1232945))

(assert (not d!135103))

(assert (not b!1233048))

(assert (not b!1232967))

(assert (not b!1233042))

(assert (not b!1233006))

(assert (not bm!60940))

(assert (not b!1232978))

(assert (not b!1232941))

(assert (not b!1232975))

(assert (not b!1232944))

(assert (not bm!60951))

(assert (not b!1232979))

(assert (not b!1233051))

(assert (not b!1233002))

(assert (not d!135065))

(assert (not b!1233041))

(assert (not b!1233018))

(assert (not bm!60942))

(assert (not d!135127))

(assert (not b!1233054))

(assert (not b!1233052))

(assert (not b!1233056))

(assert (not b!1232966))

(assert (not d!135107))

(assert (not b!1232963))

(assert (not b!1233026))

(assert (not bm!60944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1233120 () Bool)

(declare-fun e!699514 () Bool)

(assert (=> b!1233120 (= e!699514 (contains!7195 (ite c!120726 (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823) acc!823) (select (arr!38360 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233121 () Bool)

(declare-fun e!699515 () Bool)

(declare-fun call!60960 () Bool)

(assert (=> b!1233121 (= e!699515 call!60960)))

(declare-fun b!1233122 () Bool)

(assert (=> b!1233122 (= e!699515 call!60960)))

(declare-fun d!135181 () Bool)

(declare-fun res!821369 () Bool)

(declare-fun e!699513 () Bool)

(assert (=> d!135181 (=> res!821369 e!699513)))

(assert (=> d!135181 (= res!821369 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38896 a!3806)))))

(assert (=> d!135181 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120726 (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823) acc!823)) e!699513)))

(declare-fun bm!60957 () Bool)

(declare-fun c!120736 () Bool)

(assert (=> bm!60957 (= call!60960 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120736 (Cons!27129 (select (arr!38360 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120726 (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823) acc!823)) (ite c!120726 (Cons!27129 (select (arr!38360 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1233123 () Bool)

(declare-fun e!699512 () Bool)

(assert (=> b!1233123 (= e!699512 e!699515)))

(assert (=> b!1233123 (= c!120736 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233124 () Bool)

(assert (=> b!1233124 (= e!699513 e!699512)))

(declare-fun res!821370 () Bool)

(assert (=> b!1233124 (=> (not res!821370) (not e!699512))))

(assert (=> b!1233124 (= res!821370 (not e!699514))))

(declare-fun res!821368 () Bool)

(assert (=> b!1233124 (=> (not res!821368) (not e!699514))))

(assert (=> b!1233124 (= res!821368 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135181 (not res!821369)) b!1233124))

(assert (= (and b!1233124 res!821368) b!1233120))

(assert (= (and b!1233124 res!821370) b!1233123))

(assert (= (and b!1233123 c!120736) b!1233122))

(assert (= (and b!1233123 (not c!120736)) b!1233121))

(assert (= (or b!1233122 b!1233121) bm!60957))

(declare-fun m!1137179 () Bool)

(assert (=> b!1233120 m!1137179))

(assert (=> b!1233120 m!1137179))

(declare-fun m!1137181 () Bool)

(assert (=> b!1233120 m!1137181))

(assert (=> bm!60957 m!1137179))

(declare-fun m!1137183 () Bool)

(assert (=> bm!60957 m!1137183))

(assert (=> b!1233123 m!1137179))

(assert (=> b!1233123 m!1137179))

(declare-fun m!1137185 () Bool)

(assert (=> b!1233123 m!1137185))

(assert (=> b!1233124 m!1137179))

(assert (=> b!1233124 m!1137179))

(assert (=> b!1233124 m!1137185))

(assert (=> bm!60951 d!135181))

(declare-fun d!135183 () Bool)

(declare-fun lt!559621 () Bool)

(assert (=> d!135183 (= lt!559621 (set.member (h!28338 acc!823) (content!574 (t!40596 acc!823))))))

(declare-fun e!699516 () Bool)

(assert (=> d!135183 (= lt!559621 e!699516)))

(declare-fun res!821372 () Bool)

(assert (=> d!135183 (=> (not res!821372) (not e!699516))))

(assert (=> d!135183 (= res!821372 (is-Cons!27129 (t!40596 acc!823)))))

(assert (=> d!135183 (= (contains!7195 (t!40596 acc!823) (h!28338 acc!823)) lt!559621)))

(declare-fun b!1233125 () Bool)

(declare-fun e!699517 () Bool)

(assert (=> b!1233125 (= e!699516 e!699517)))

(declare-fun res!821371 () Bool)

(assert (=> b!1233125 (=> res!821371 e!699517)))

(assert (=> b!1233125 (= res!821371 (= (h!28338 (t!40596 acc!823)) (h!28338 acc!823)))))

(declare-fun b!1233126 () Bool)

(assert (=> b!1233126 (= e!699517 (contains!7195 (t!40596 (t!40596 acc!823)) (h!28338 acc!823)))))

(assert (= (and d!135183 res!821372) b!1233125))

(assert (= (and b!1233125 (not res!821371)) b!1233126))

(declare-fun m!1137187 () Bool)

(assert (=> d!135183 m!1137187))

(declare-fun m!1137189 () Bool)

(assert (=> d!135183 m!1137189))

(declare-fun m!1137191 () Bool)

(assert (=> b!1233126 m!1137191))

(assert (=> b!1233053 d!135183))

(declare-fun d!135185 () Bool)

(declare-fun lt!559622 () Bool)

(assert (=> d!135185 (= lt!559622 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!574 (t!40596 lt!559570))))))

(declare-fun e!699518 () Bool)

(assert (=> d!135185 (= lt!559622 e!699518)))

(declare-fun res!821374 () Bool)

(assert (=> d!135185 (=> (not res!821374) (not e!699518))))

(assert (=> d!135185 (= res!821374 (is-Cons!27129 (t!40596 lt!559570)))))

(assert (=> d!135185 (= (contains!7195 (t!40596 lt!559570) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559622)))

(declare-fun b!1233127 () Bool)

(declare-fun e!699519 () Bool)

(assert (=> b!1233127 (= e!699518 e!699519)))

(declare-fun res!821373 () Bool)

(assert (=> b!1233127 (=> res!821373 e!699519)))

(assert (=> b!1233127 (= res!821373 (= (h!28338 (t!40596 lt!559570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233128 () Bool)

(assert (=> b!1233128 (= e!699519 (contains!7195 (t!40596 (t!40596 lt!559570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135185 res!821374) b!1233127))

(assert (= (and b!1233127 (not res!821373)) b!1233128))

(declare-fun m!1137193 () Bool)

(assert (=> d!135185 m!1137193))

(declare-fun m!1137195 () Bool)

(assert (=> d!135185 m!1137195))

(declare-fun m!1137197 () Bool)

(assert (=> b!1233128 m!1137197))

(assert (=> b!1233006 d!135185))

(declare-fun d!135187 () Bool)

(declare-fun lt!559623 () Bool)

(assert (=> d!135187 (= lt!559623 (set.member (select (arr!38360 a!3806) from!3184) (content!574 acc!823)))))

(declare-fun e!699520 () Bool)

(assert (=> d!135187 (= lt!559623 e!699520)))

(declare-fun res!821376 () Bool)

(assert (=> d!135187 (=> (not res!821376) (not e!699520))))

(assert (=> d!135187 (= res!821376 (is-Cons!27129 acc!823))))

(assert (=> d!135187 (= (contains!7195 acc!823 (select (arr!38360 a!3806) from!3184)) lt!559623)))

(declare-fun b!1233129 () Bool)

(declare-fun e!699521 () Bool)

(assert (=> b!1233129 (= e!699520 e!699521)))

(declare-fun res!821375 () Bool)

(assert (=> b!1233129 (=> res!821375 e!699521)))

(assert (=> b!1233129 (= res!821375 (= (h!28338 acc!823) (select (arr!38360 a!3806) from!3184)))))

(declare-fun b!1233130 () Bool)

(assert (=> b!1233130 (= e!699521 (contains!7195 (t!40596 acc!823) (select (arr!38360 a!3806) from!3184)))))

(assert (= (and d!135187 res!821376) b!1233129))

(assert (= (and b!1233129 (not res!821375)) b!1233130))

(assert (=> d!135187 m!1137039))

(assert (=> d!135187 m!1136849))

(declare-fun m!1137199 () Bool)

(assert (=> d!135187 m!1137199))

(assert (=> b!1233130 m!1136849))

(declare-fun m!1137201 () Bool)

(assert (=> b!1233130 m!1137201))

(assert (=> b!1233048 d!135187))

(declare-fun d!135189 () Bool)

(declare-fun c!120739 () Bool)

(assert (=> d!135189 (= c!120739 (is-Nil!27130 lt!559570))))

(declare-fun e!699524 () (Set (_ BitVec 64)))

(assert (=> d!135189 (= (content!574 lt!559570) e!699524)))

(declare-fun b!1233135 () Bool)

(assert (=> b!1233135 (= e!699524 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!1233136 () Bool)

(assert (=> b!1233136 (= e!699524 (set.union (set.insert (h!28338 lt!559570) (as set.empty (Set (_ BitVec 64)))) (content!574 (t!40596 lt!559570))))))

(assert (= (and d!135189 c!120739) b!1233135))

(assert (= (and d!135189 (not c!120739)) b!1233136))

(declare-fun m!1137203 () Bool)

(assert (=> b!1233136 m!1137203))

(assert (=> b!1233136 m!1137193))

(assert (=> d!135091 d!135189))

(declare-fun d!135191 () Bool)

(declare-fun lt!559624 () Bool)

(assert (=> d!135191 (= lt!559624 (set.member (select (arr!38360 a!3806) from!3184) (content!574 Nil!27130)))))

(declare-fun e!699525 () Bool)

(assert (=> d!135191 (= lt!559624 e!699525)))

(declare-fun res!821378 () Bool)

(assert (=> d!135191 (=> (not res!821378) (not e!699525))))

(assert (=> d!135191 (= res!821378 (is-Cons!27129 Nil!27130))))

(assert (=> d!135191 (= (contains!7195 Nil!27130 (select (arr!38360 a!3806) from!3184)) lt!559624)))

(declare-fun b!1233137 () Bool)

(declare-fun e!699526 () Bool)

(assert (=> b!1233137 (= e!699525 e!699526)))

(declare-fun res!821377 () Bool)

(assert (=> b!1233137 (=> res!821377 e!699526)))

(assert (=> b!1233137 (= res!821377 (= (h!28338 Nil!27130) (select (arr!38360 a!3806) from!3184)))))

(declare-fun b!1233138 () Bool)

(assert (=> b!1233138 (= e!699526 (contains!7195 (t!40596 Nil!27130) (select (arr!38360 a!3806) from!3184)))))

(assert (= (and d!135191 res!821378) b!1233137))

(assert (= (and b!1233137 (not res!821377)) b!1233138))

(declare-fun m!1137205 () Bool)

(assert (=> d!135191 m!1137205))

(assert (=> d!135191 m!1136849))

(declare-fun m!1137207 () Bool)

(assert (=> d!135191 m!1137207))

(assert (=> b!1233138 m!1136849))

(declare-fun m!1137209 () Bool)

(assert (=> b!1233138 m!1137209))

(assert (=> b!1232941 d!135191))

(declare-fun b!1233139 () Bool)

(declare-fun e!699529 () Bool)

(assert (=> b!1233139 (= e!699529 (contains!7195 (ite c!120719 (Cons!27129 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)) (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233140 () Bool)

(declare-fun e!699530 () Bool)

(declare-fun call!60961 () Bool)

(assert (=> b!1233140 (= e!699530 call!60961)))

(declare-fun b!1233141 () Bool)

(assert (=> b!1233141 (= e!699530 call!60961)))

(declare-fun d!135193 () Bool)

(declare-fun res!821380 () Bool)

(declare-fun e!699528 () Bool)

(assert (=> d!135193 (=> res!821380 e!699528)))

(assert (=> d!135193 (= res!821380 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38896 a!3806)))))

(assert (=> d!135193 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120719 (Cons!27129 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130))) e!699528)))

(declare-fun c!120740 () Bool)

(declare-fun bm!60958 () Bool)

(assert (=> bm!60958 (= call!60961 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120740 (Cons!27129 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120719 (Cons!27129 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130))) (ite c!120719 (Cons!27129 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)) (Cons!27129 (select (arr!38360 a!3806) from!3184) Nil!27130)))))))

(declare-fun b!1233142 () Bool)

(declare-fun e!699527 () Bool)

(assert (=> b!1233142 (= e!699527 e!699530)))

(assert (=> b!1233142 (= c!120740 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233143 () Bool)

(assert (=> b!1233143 (= e!699528 e!699527)))

(declare-fun res!821381 () Bool)

(assert (=> b!1233143 (=> (not res!821381) (not e!699527))))

(assert (=> b!1233143 (= res!821381 (not e!699529))))

(declare-fun res!821379 () Bool)

(assert (=> b!1233143 (=> (not res!821379) (not e!699529))))

(assert (=> b!1233143 (= res!821379 (validKeyInArray!0 (select (arr!38360 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135193 (not res!821380)) b!1233143))

(assert (= (and b!1233143 res!821379) b!1233139))

(assert (= (and b!1233143 res!821381) b!1233142))

(assert (= (and b!1233142 c!120740) b!1233141))

(assert (= (and b!1233142 (not c!120740)) b!1233140))

(assert (= (or b!1233141 b!1233140) bm!60958))

(declare-fun m!1137211 () Bool)

(assert (=> b!1233139 m!1137211))

(assert (=> b!1233139 m!1137211))

(declare-fun m!1137213 () Bool)

(assert (=> b!1233139 m!1137213))

(assert (=> bm!60958 m!1137211))

(declare-fun m!1137215 () Bool)

(assert (=> bm!60958 m!1137215))

(assert (=> b!1233142 m!1137211))

(assert (=> b!1233142 m!1137211))

(declare-fun m!1137217 () Bool)

(assert (=> b!1233142 m!1137217))

(assert (=> b!1233143 m!1137211))

(assert (=> b!1233143 m!1137211))

(assert (=> b!1233143 m!1137217))

(assert (=> bm!60944 d!135193))

(declare-fun d!135195 () Bool)

(declare-fun res!821382 () Bool)

(declare-fun e!699531 () Bool)

(assert (=> d!135195 (=> res!821382 e!699531)))

(assert (=> d!135195 (= res!821382 (is-Nil!27130 (t!40596 acc!823)))))

(assert (=> d!135195 (= (noDuplicate!1792 (t!40596 acc!823)) e!699531)))

(declare-fun b!1233144 () Bool)

(declare-fun e!699532 () Bool)

(assert (=> b!1233144 (= e!699531 e!699532)))

(declare-fun res!821383 () Bool)

(assert (=> b!1233144 (=> (not res!821383) (not e!699532))))

(assert (=> b!1233144 (= res!821383 (not (contains!7195 (t!40596 (t!40596 acc!823)) (h!28338 (t!40596 acc!823)))))))

(declare-fun b!1233145 () Bool)

(assert (=> b!1233145 (= e!699532 (noDuplicate!1792 (t!40596 (t!40596 acc!823))))))

(assert (= (and d!135195 (not res!821382)) b!1233144))

(assert (= (and b!1233144 res!821383) b!1233145))

(declare-fun m!1137219 () Bool)

(assert (=> b!1233144 m!1137219))

(declare-fun m!1137221 () Bool)

(assert (=> b!1233145 m!1137221))

(assert (=> b!1233054 d!135195))

