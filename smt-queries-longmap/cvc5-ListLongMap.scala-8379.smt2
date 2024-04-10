; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101914 () Bool)

(assert start!101914)

(declare-fun res!815733 () Bool)

(declare-fun e!696810 () Bool)

(assert (=> start!101914 (=> (not res!815733) (not e!696810))))

(declare-datatypes ((array!79220 0))(
  ( (array!79221 (arr!38234 (Array (_ BitVec 32) (_ BitVec 64))) (size!38770 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79220)

(assert (=> start!101914 (= res!815733 (bvslt (size!38770 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101914 e!696810))

(declare-fun array_inv!29082 (array!79220) Bool)

(assert (=> start!101914 (array_inv!29082 a!3806)))

(assert (=> start!101914 true))

(declare-fun b!1227092 () Bool)

(declare-fun res!815732 () Bool)

(assert (=> b!1227092 (=> (not res!815732) (not e!696810))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227092 (= res!815732 (validKeyInArray!0 (select (arr!38234 a!3806) from!3184)))))

(declare-fun b!1227093 () Bool)

(declare-fun res!815727 () Bool)

(assert (=> b!1227093 (=> (not res!815727) (not e!696810))))

(assert (=> b!1227093 (= res!815727 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38770 a!3806)) (bvslt from!3184 (size!38770 a!3806))))))

(declare-fun b!1227094 () Bool)

(declare-fun res!815729 () Bool)

(assert (=> b!1227094 (=> (not res!815729) (not e!696810))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227094 (= res!815729 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227095 () Bool)

(declare-fun res!815723 () Bool)

(assert (=> b!1227095 (=> (not res!815723) (not e!696810))))

(declare-datatypes ((List!27007 0))(
  ( (Nil!27004) (Cons!27003 (h!28212 (_ BitVec 64)) (t!40470 List!27007)) )
))
(declare-fun acc!823 () List!27007)

(declare-fun noDuplicate!1666 (List!27007) Bool)

(assert (=> b!1227095 (= res!815723 (noDuplicate!1666 acc!823))))

(declare-fun b!1227096 () Bool)

(declare-fun res!815725 () Bool)

(declare-fun e!696812 () Bool)

(assert (=> b!1227096 (=> (not res!815725) (not e!696812))))

(declare-fun lt!558879 () List!27007)

(assert (=> b!1227096 (= res!815725 (noDuplicate!1666 lt!558879))))

(declare-fun b!1227097 () Bool)

(declare-fun e!696809 () Bool)

(declare-fun contains!7069 (List!27007 (_ BitVec 64)) Bool)

(assert (=> b!1227097 (= e!696809 (contains!7069 lt!558879 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227098 () Bool)

(declare-fun res!815726 () Bool)

(assert (=> b!1227098 (=> (not res!815726) (not e!696810))))

(declare-fun arrayNoDuplicates!0 (array!79220 (_ BitVec 32) List!27007) Bool)

(assert (=> b!1227098 (= res!815726 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227099 () Bool)

(declare-fun res!815722 () Bool)

(assert (=> b!1227099 (=> (not res!815722) (not e!696810))))

(assert (=> b!1227099 (= res!815722 (validKeyInArray!0 k!2913))))

(declare-fun b!1227100 () Bool)

(declare-fun res!815728 () Bool)

(assert (=> b!1227100 (=> (not res!815728) (not e!696810))))

(assert (=> b!1227100 (= res!815728 (not (contains!7069 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227101 () Bool)

(assert (=> b!1227101 (= e!696812 e!696809)))

(declare-fun res!815731 () Bool)

(assert (=> b!1227101 (=> res!815731 e!696809)))

(assert (=> b!1227101 (= res!815731 (contains!7069 lt!558879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227102 () Bool)

(declare-fun res!815730 () Bool)

(assert (=> b!1227102 (=> (not res!815730) (not e!696810))))

(assert (=> b!1227102 (= res!815730 (not (contains!7069 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227103 () Bool)

(assert (=> b!1227103 (= e!696810 e!696812)))

(declare-fun res!815724 () Bool)

(assert (=> b!1227103 (=> (not res!815724) (not e!696812))))

(assert (=> b!1227103 (= res!815724 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1227103 (= lt!558879 (Cons!27003 (select (arr!38234 a!3806) from!3184) acc!823))))

(assert (= (and start!101914 res!815733) b!1227099))

(assert (= (and b!1227099 res!815722) b!1227093))

(assert (= (and b!1227093 res!815727) b!1227095))

(assert (= (and b!1227095 res!815723) b!1227102))

(assert (= (and b!1227102 res!815730) b!1227100))

(assert (= (and b!1227100 res!815728) b!1227094))

(assert (= (and b!1227094 res!815729) b!1227098))

(assert (= (and b!1227098 res!815726) b!1227092))

(assert (= (and b!1227092 res!815732) b!1227103))

(assert (= (and b!1227103 res!815724) b!1227096))

(assert (= (and b!1227096 res!815725) b!1227101))

(assert (= (and b!1227101 (not res!815731)) b!1227097))

(declare-fun m!1131963 () Bool)

(assert (=> b!1227102 m!1131963))

(declare-fun m!1131965 () Bool)

(assert (=> b!1227098 m!1131965))

(declare-fun m!1131967 () Bool)

(assert (=> b!1227099 m!1131967))

(declare-fun m!1131969 () Bool)

(assert (=> b!1227103 m!1131969))

(assert (=> b!1227092 m!1131969))

(assert (=> b!1227092 m!1131969))

(declare-fun m!1131971 () Bool)

(assert (=> b!1227092 m!1131971))

(declare-fun m!1131973 () Bool)

(assert (=> b!1227095 m!1131973))

(declare-fun m!1131975 () Bool)

(assert (=> start!101914 m!1131975))

(declare-fun m!1131977 () Bool)

(assert (=> b!1227101 m!1131977))

(declare-fun m!1131979 () Bool)

(assert (=> b!1227096 m!1131979))

(declare-fun m!1131981 () Bool)

(assert (=> b!1227100 m!1131981))

(declare-fun m!1131983 () Bool)

(assert (=> b!1227094 m!1131983))

(declare-fun m!1131985 () Bool)

(assert (=> b!1227097 m!1131985))

(push 1)

(assert (not b!1227099))

(assert (not b!1227092))

(assert (not b!1227100))

(assert (not b!1227098))

(assert (not b!1227097))

(assert (not b!1227102))

(assert (not b!1227101))

(assert (not b!1227094))

(assert (not b!1227096))

(assert (not b!1227095))

(assert (not start!101914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1227241 () Bool)

(declare-fun e!696896 () Bool)

(declare-fun call!60807 () Bool)

(assert (=> b!1227241 (= e!696896 call!60807)))

(declare-fun b!1227242 () Bool)

(declare-fun e!696898 () Bool)

(assert (=> b!1227242 (= e!696898 e!696896)))

(declare-fun c!120552 () Bool)

(assert (=> b!1227242 (= c!120552 (validKeyInArray!0 (select (arr!38234 a!3806) from!3184)))))

(declare-fun bm!60804 () Bool)

(assert (=> bm!60804 (= call!60807 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120552 (Cons!27003 (select (arr!38234 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!134133 () Bool)

(declare-fun res!815858 () Bool)

(declare-fun e!696895 () Bool)

(assert (=> d!134133 (=> res!815858 e!696895)))

(assert (=> d!134133 (= res!815858 (bvsge from!3184 (size!38770 a!3806)))))

(assert (=> d!134133 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!696895)))

(declare-fun b!1227243 () Bool)

(assert (=> b!1227243 (= e!696896 call!60807)))

(declare-fun b!1227244 () Bool)

(assert (=> b!1227244 (= e!696895 e!696898)))

(declare-fun res!815859 () Bool)

(assert (=> b!1227244 (=> (not res!815859) (not e!696898))))

(declare-fun e!696897 () Bool)

(assert (=> b!1227244 (= res!815859 (not e!696897))))

(declare-fun res!815857 () Bool)

(assert (=> b!1227244 (=> (not res!815857) (not e!696897))))

(assert (=> b!1227244 (= res!815857 (validKeyInArray!0 (select (arr!38234 a!3806) from!3184)))))

(declare-fun b!1227245 () Bool)

(assert (=> b!1227245 (= e!696897 (contains!7069 acc!823 (select (arr!38234 a!3806) from!3184)))))

(assert (= (and d!134133 (not res!815858)) b!1227244))

(assert (= (and b!1227244 res!815857) b!1227245))

(assert (= (and b!1227244 res!815859) b!1227242))

(assert (= (and b!1227242 c!120552) b!1227243))

(assert (= (and b!1227242 (not c!120552)) b!1227241))

(assert (= (or b!1227243 b!1227241) bm!60804))

(assert (=> b!1227242 m!1131969))

(assert (=> b!1227242 m!1131969))

(assert (=> b!1227242 m!1131971))

(assert (=> bm!60804 m!1131969))

(declare-fun m!1132071 () Bool)

(assert (=> bm!60804 m!1132071))

(assert (=> b!1227244 m!1131969))

(assert (=> b!1227244 m!1131969))

(assert (=> b!1227244 m!1131971))

(assert (=> b!1227245 m!1131969))

(assert (=> b!1227245 m!1131969))

(declare-fun m!1132077 () Bool)

(assert (=> b!1227245 m!1132077))

(assert (=> b!1227098 d!134133))

(declare-fun d!134143 () Bool)

(assert (=> d!134143 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1227099 d!134143))

(declare-fun d!134151 () Bool)

(declare-fun lt!558899 () Bool)

(declare-fun content!552 (List!27007) (Set (_ BitVec 64)))

(assert (=> d!134151 (= lt!558899 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!552 lt!558879)))))

(declare-fun e!696926 () Bool)

(assert (=> d!134151 (= lt!558899 e!696926)))

(declare-fun res!815885 () Bool)

(assert (=> d!134151 (=> (not res!815885) (not e!696926))))

(assert (=> d!134151 (= res!815885 (is-Cons!27003 lt!558879))))

(assert (=> d!134151 (= (contains!7069 lt!558879 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558899)))

(declare-fun b!1227273 () Bool)

(declare-fun e!696925 () Bool)

(assert (=> b!1227273 (= e!696926 e!696925)))

(declare-fun res!815886 () Bool)

(assert (=> b!1227273 (=> res!815886 e!696925)))

(assert (=> b!1227273 (= res!815886 (= (h!28212 lt!558879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227274 () Bool)

(assert (=> b!1227274 (= e!696925 (contains!7069 (t!40470 lt!558879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134151 res!815885) b!1227273))

(assert (= (and b!1227273 (not res!815886)) b!1227274))

(declare-fun m!1132103 () Bool)

(assert (=> d!134151 m!1132103))

(declare-fun m!1132105 () Bool)

(assert (=> d!134151 m!1132105))

(declare-fun m!1132107 () Bool)

(assert (=> b!1227274 m!1132107))

(assert (=> b!1227097 d!134151))

(declare-fun d!134159 () Bool)

(declare-fun lt!558900 () Bool)

(assert (=> d!134159 (= lt!558900 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!552 acc!823)))))

(declare-fun e!696928 () Bool)

(assert (=> d!134159 (= lt!558900 e!696928)))

(declare-fun res!815887 () Bool)

(assert (=> d!134159 (=> (not res!815887) (not e!696928))))

(assert (=> d!134159 (= res!815887 (is-Cons!27003 acc!823))))

(assert (=> d!134159 (= (contains!7069 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558900)))

(declare-fun b!1227275 () Bool)

(declare-fun e!696927 () Bool)

(assert (=> b!1227275 (= e!696928 e!696927)))

(declare-fun res!815888 () Bool)

(assert (=> b!1227275 (=> res!815888 e!696927)))

(assert (=> b!1227275 (= res!815888 (= (h!28212 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227276 () Bool)

(assert (=> b!1227276 (= e!696927 (contains!7069 (t!40470 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134159 res!815887) b!1227275))

(assert (= (and b!1227275 (not res!815888)) b!1227276))

(declare-fun m!1132109 () Bool)

(assert (=> d!134159 m!1132109))

(declare-fun m!1132111 () Bool)

(assert (=> d!134159 m!1132111))

(declare-fun m!1132113 () Bool)

(assert (=> b!1227276 m!1132113))

(assert (=> b!1227102 d!134159))

(declare-fun d!134163 () Bool)

(assert (=> d!134163 (= (validKeyInArray!0 (select (arr!38234 a!3806) from!3184)) (and (not (= (select (arr!38234 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38234 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1227092 d!134163))

(declare-fun d!134165 () Bool)

(declare-fun lt!558902 () Bool)

(assert (=> d!134165 (= lt!558902 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!552 lt!558879)))))

(declare-fun e!696934 () Bool)

(assert (=> d!134165 (= lt!558902 e!696934)))

(declare-fun res!815893 () Bool)

(assert (=> d!134165 (=> (not res!815893) (not e!696934))))

(assert (=> d!134165 (= res!815893 (is-Cons!27003 lt!558879))))

(assert (=> d!134165 (= (contains!7069 lt!558879 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558902)))

(declare-fun b!1227281 () Bool)

(declare-fun e!696933 () Bool)

(assert (=> b!1227281 (= e!696934 e!696933)))

(declare-fun res!815894 () Bool)

(assert (=> b!1227281 (=> res!815894 e!696933)))

(assert (=> b!1227281 (= res!815894 (= (h!28212 lt!558879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227282 () Bool)

(assert (=> b!1227282 (= e!696933 (contains!7069 (t!40470 lt!558879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134165 res!815893) b!1227281))

(assert (= (and b!1227281 (not res!815894)) b!1227282))

(assert (=> d!134165 m!1132103))

(declare-fun m!1132123 () Bool)

(assert (=> d!134165 m!1132123))

(declare-fun m!1132125 () Bool)

(assert (=> b!1227282 m!1132125))

(assert (=> b!1227101 d!134165))

(declare-fun d!134171 () Bool)

(assert (=> d!134171 (= (array_inv!29082 a!3806) (bvsge (size!38770 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!101914 d!134171))

(declare-fun d!134173 () Bool)

(declare-fun res!815899 () Bool)

(declare-fun e!696939 () Bool)

(assert (=> d!134173 (=> res!815899 e!696939)))

(assert (=> d!134173 (= res!815899 (is-Nil!27004 lt!558879))))

(assert (=> d!134173 (= (noDuplicate!1666 lt!558879) e!696939)))

(declare-fun b!1227287 () Bool)

(declare-fun e!696940 () Bool)

(assert (=> b!1227287 (= e!696939 e!696940)))

(declare-fun res!815900 () Bool)

(assert (=> b!1227287 (=> (not res!815900) (not e!696940))))

(assert (=> b!1227287 (= res!815900 (not (contains!7069 (t!40470 lt!558879) (h!28212 lt!558879))))))

(declare-fun b!1227288 () Bool)

(assert (=> b!1227288 (= e!696940 (noDuplicate!1666 (t!40470 lt!558879)))))

(assert (= (and d!134173 (not res!815899)) b!1227287))

(assert (= (and b!1227287 res!815900) b!1227288))

