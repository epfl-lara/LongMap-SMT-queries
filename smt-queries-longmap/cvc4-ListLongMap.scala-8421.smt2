; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102520 () Bool)

(assert start!102520)

(declare-fun b!1232885 () Bool)

(declare-fun e!699315 () Bool)

(declare-fun e!699313 () Bool)

(assert (=> b!1232885 (= e!699315 (not e!699313))))

(declare-fun res!821191 () Bool)

(assert (=> b!1232885 (=> res!821191 e!699313)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1232885 (= res!821191 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27135 0))(
  ( (Nil!27132) (Cons!27131 (h!28340 (_ BitVec 64)) (t!40598 List!27135)) )
))
(declare-fun lt!559583 () List!27135)

(declare-datatypes ((array!79500 0))(
  ( (array!79501 (arr!38362 (Array (_ BitVec 32) (_ BitVec 64))) (size!38898 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79500)

(assert (=> b!1232885 (= lt!559583 (Cons!27131 (select (arr!38362 a!3806) from!3184) Nil!27132))))

(declare-fun e!699314 () Bool)

(assert (=> b!1232885 e!699314))

(declare-fun res!821196 () Bool)

(assert (=> b!1232885 (=> (not res!821196) (not e!699314))))

(declare-fun arrayNoDuplicates!0 (array!79500 (_ BitVec 32) List!27135) Bool)

(assert (=> b!1232885 (= res!821196 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27132))))

(declare-datatypes ((Unit!40830 0))(
  ( (Unit!40831) )
))
(declare-fun lt!559582 () Unit!40830)

(declare-fun acc!823 () List!27135)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79500 List!27135 List!27135 (_ BitVec 32)) Unit!40830)

(assert (=> b!1232885 (= lt!559582 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27132 from!3184))))

(assert (=> b!1232885 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27131 (select (arr!38362 a!3806) from!3184) acc!823))))

(declare-fun b!1232886 () Bool)

(declare-fun res!821188 () Bool)

(assert (=> b!1232886 (=> (not res!821188) (not e!699315))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232886 (= res!821188 (validKeyInArray!0 k!2913))))

(declare-fun b!1232887 () Bool)

(declare-fun res!821193 () Bool)

(assert (=> b!1232887 (=> (not res!821193) (not e!699315))))

(declare-fun noDuplicate!1794 (List!27135) Bool)

(assert (=> b!1232887 (= res!821193 (noDuplicate!1794 acc!823))))

(declare-fun b!1232888 () Bool)

(declare-fun res!821197 () Bool)

(assert (=> b!1232888 (=> (not res!821197) (not e!699315))))

(assert (=> b!1232888 (= res!821197 (validKeyInArray!0 (select (arr!38362 a!3806) from!3184)))))

(declare-fun b!1232889 () Bool)

(declare-fun res!821185 () Bool)

(assert (=> b!1232889 (=> (not res!821185) (not e!699315))))

(declare-fun arrayContainsKey!0 (array!79500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232889 (= res!821185 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232890 () Bool)

(declare-fun res!821189 () Bool)

(assert (=> b!1232890 (=> res!821189 e!699313)))

(assert (=> b!1232890 (= res!821189 (not (noDuplicate!1794 lt!559583)))))

(declare-fun b!1232891 () Bool)

(declare-fun e!699311 () Bool)

(assert (=> b!1232891 (= e!699313 e!699311)))

(declare-fun res!821192 () Bool)

(assert (=> b!1232891 (=> (not res!821192) (not e!699311))))

(declare-fun contains!7197 (List!27135 (_ BitVec 64)) Bool)

(assert (=> b!1232891 (= res!821192 (not (contains!7197 lt!559583 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232892 () Bool)

(declare-fun res!821195 () Bool)

(assert (=> b!1232892 (=> (not res!821195) (not e!699315))))

(assert (=> b!1232892 (= res!821195 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38898 a!3806)) (bvslt from!3184 (size!38898 a!3806))))))

(declare-fun b!1232893 () Bool)

(assert (=> b!1232893 (= e!699311 (not (contains!7197 lt!559583 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232894 () Bool)

(assert (=> b!1232894 (= e!699314 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27131 (select (arr!38362 a!3806) from!3184) Nil!27132)))))

(declare-fun b!1232895 () Bool)

(declare-fun res!821186 () Bool)

(assert (=> b!1232895 (=> (not res!821186) (not e!699315))))

(assert (=> b!1232895 (= res!821186 (not (contains!7197 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!821190 () Bool)

(assert (=> start!102520 (=> (not res!821190) (not e!699315))))

(assert (=> start!102520 (= res!821190 (bvslt (size!38898 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102520 e!699315))

(declare-fun array_inv!29210 (array!79500) Bool)

(assert (=> start!102520 (array_inv!29210 a!3806)))

(assert (=> start!102520 true))

(declare-fun b!1232896 () Bool)

(declare-fun res!821187 () Bool)

(assert (=> b!1232896 (=> (not res!821187) (not e!699315))))

(assert (=> b!1232896 (= res!821187 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232897 () Bool)

(declare-fun res!821194 () Bool)

(assert (=> b!1232897 (=> (not res!821194) (not e!699315))))

(assert (=> b!1232897 (= res!821194 (not (contains!7197 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102520 res!821190) b!1232886))

(assert (= (and b!1232886 res!821188) b!1232892))

(assert (= (and b!1232892 res!821195) b!1232887))

(assert (= (and b!1232887 res!821193) b!1232897))

(assert (= (and b!1232897 res!821194) b!1232895))

(assert (= (and b!1232895 res!821186) b!1232889))

(assert (= (and b!1232889 res!821185) b!1232896))

(assert (= (and b!1232896 res!821187) b!1232888))

(assert (= (and b!1232888 res!821197) b!1232885))

(assert (= (and b!1232885 res!821196) b!1232894))

(assert (= (and b!1232885 (not res!821191)) b!1232890))

(assert (= (and b!1232890 (not res!821189)) b!1232891))

(assert (= (and b!1232891 res!821192) b!1232893))

(declare-fun m!1136903 () Bool)

(assert (=> b!1232895 m!1136903))

(declare-fun m!1136905 () Bool)

(assert (=> b!1232888 m!1136905))

(assert (=> b!1232888 m!1136905))

(declare-fun m!1136907 () Bool)

(assert (=> b!1232888 m!1136907))

(declare-fun m!1136909 () Bool)

(assert (=> b!1232887 m!1136909))

(declare-fun m!1136911 () Bool)

(assert (=> start!102520 m!1136911))

(declare-fun m!1136913 () Bool)

(assert (=> b!1232896 m!1136913))

(assert (=> b!1232894 m!1136905))

(declare-fun m!1136915 () Bool)

(assert (=> b!1232894 m!1136915))

(declare-fun m!1136917 () Bool)

(assert (=> b!1232897 m!1136917))

(declare-fun m!1136919 () Bool)

(assert (=> b!1232890 m!1136919))

(declare-fun m!1136921 () Bool)

(assert (=> b!1232891 m!1136921))

(declare-fun m!1136923 () Bool)

(assert (=> b!1232889 m!1136923))

(declare-fun m!1136925 () Bool)

(assert (=> b!1232886 m!1136925))

(assert (=> b!1232885 m!1136905))

(declare-fun m!1136927 () Bool)

(assert (=> b!1232885 m!1136927))

(declare-fun m!1136929 () Bool)

(assert (=> b!1232885 m!1136929))

(declare-fun m!1136931 () Bool)

(assert (=> b!1232885 m!1136931))

(declare-fun m!1136933 () Bool)

(assert (=> b!1232893 m!1136933))

(push 1)

(assert (not b!1232886))

(assert (not b!1232888))

(assert (not b!1232895))

(assert (not b!1232894))

(assert (not b!1232896))

(assert (not b!1232889))

(assert (not b!1232885))

(assert (not b!1232893))

(assert (not b!1232887))

(assert (not b!1232897))

(assert (not b!1232890))

(assert (not b!1232891))

(assert (not start!102520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135057 () Bool)

(assert (=> d!135057 (= (validKeyInArray!0 (select (arr!38362 a!3806) from!3184)) (and (not (= (select (arr!38362 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38362 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232888 d!135057))

(declare-fun d!135059 () Bool)

(declare-fun res!821229 () Bool)

(declare-fun e!699352 () Bool)

(assert (=> d!135059 (=> res!821229 e!699352)))

(assert (=> d!135059 (= res!821229 (= (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!135059 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699352)))

(declare-fun b!1232939 () Bool)

(declare-fun e!699353 () Bool)

(assert (=> b!1232939 (= e!699352 e!699353)))

(declare-fun res!821230 () Bool)

(assert (=> b!1232939 (=> (not res!821230) (not e!699353))))

(assert (=> b!1232939 (= res!821230 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38898 a!3806)))))

(declare-fun b!1232940 () Bool)

(assert (=> b!1232940 (= e!699353 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135059 (not res!821229)) b!1232939))

(assert (= (and b!1232939 res!821230) b!1232940))

(declare-fun m!1136949 () Bool)

(assert (=> d!135059 m!1136949))

(declare-fun m!1136951 () Bool)

(assert (=> b!1232940 m!1136951))

(assert (=> b!1232889 d!135059))

(declare-fun d!135063 () Bool)

(declare-fun lt!559592 () Bool)

(declare-fun content!573 (List!27135) (Set (_ BitVec 64)))

(assert (=> d!135063 (= lt!559592 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!573 lt!559583)))))

(declare-fun e!699367 () Bool)

(assert (=> d!135063 (= lt!559592 e!699367)))

(declare-fun res!821242 () Bool)

(assert (=> d!135063 (=> (not res!821242) (not e!699367))))

(assert (=> d!135063 (= res!821242 (is-Cons!27131 lt!559583))))

(assert (=> d!135063 (= (contains!7197 lt!559583 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559592)))

(declare-fun b!1232955 () Bool)

(declare-fun e!699366 () Bool)

(assert (=> b!1232955 (= e!699367 e!699366)))

(declare-fun res!821241 () Bool)

(assert (=> b!1232955 (=> res!821241 e!699366)))

(assert (=> b!1232955 (= res!821241 (= (h!28340 lt!559583) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232956 () Bool)

(assert (=> b!1232956 (= e!699366 (contains!7197 (t!40598 lt!559583) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135063 res!821242) b!1232955))

(assert (= (and b!1232955 (not res!821241)) b!1232956))

(declare-fun m!1136965 () Bool)

(assert (=> d!135063 m!1136965))

(declare-fun m!1136967 () Bool)

(assert (=> d!135063 m!1136967))

(declare-fun m!1136969 () Bool)

(assert (=> b!1232956 m!1136969))

(assert (=> b!1232891 d!135063))

(declare-fun d!135071 () Bool)

(declare-fun res!821255 () Bool)

(declare-fun e!699382 () Bool)

(assert (=> d!135071 (=> res!821255 e!699382)))

(assert (=> d!135071 (= res!821255 (is-Nil!27132 lt!559583))))

(assert (=> d!135071 (= (noDuplicate!1794 lt!559583) e!699382)))

(declare-fun b!1232973 () Bool)

(declare-fun e!699383 () Bool)

(assert (=> b!1232973 (= e!699382 e!699383)))

(declare-fun res!821256 () Bool)

(assert (=> b!1232973 (=> (not res!821256) (not e!699383))))

(assert (=> b!1232973 (= res!821256 (not (contains!7197 (t!40598 lt!559583) (h!28340 lt!559583))))))

(declare-fun b!1232974 () Bool)

(assert (=> b!1232974 (= e!699383 (noDuplicate!1794 (t!40598 lt!559583)))))

(assert (= (and d!135071 (not res!821255)) b!1232973))

(assert (= (and b!1232973 res!821256) b!1232974))

(declare-fun m!1136991 () Bool)

(assert (=> b!1232973 m!1136991))

(declare-fun m!1136993 () Bool)

(assert (=> b!1232974 m!1136993))

(assert (=> b!1232890 d!135071))

(declare-fun d!135085 () Bool)

(assert (=> d!135085 (= (array_inv!29210 a!3806) (bvsge (size!38898 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102520 d!135085))

(declare-fun d!135089 () Bool)

(declare-fun lt!559598 () Bool)

(assert (=> d!135089 (= lt!559598 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!573 lt!559583)))))

(declare-fun e!699391 () Bool)

(assert (=> d!135089 (= lt!559598 e!699391)))

(declare-fun res!821263 () Bool)

(assert (=> d!135089 (=> (not res!821263) (not e!699391))))

(assert (=> d!135089 (= res!821263 (is-Cons!27131 lt!559583))))

(assert (=> d!135089 (= (contains!7197 lt!559583 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559598)))

(declare-fun b!1232982 () Bool)

(declare-fun e!699390 () Bool)

(assert (=> b!1232982 (= e!699391 e!699390)))

(declare-fun res!821262 () Bool)

(assert (=> b!1232982 (=> res!821262 e!699390)))

(assert (=> b!1232982 (= res!821262 (= (h!28340 lt!559583) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232983 () Bool)

(assert (=> b!1232983 (= e!699390 (contains!7197 (t!40598 lt!559583) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135089 res!821263) b!1232982))

(assert (= (and b!1232982 (not res!821262)) b!1232983))

(assert (=> d!135089 m!1136965))

(declare-fun m!1137003 () Bool)

(assert (=> d!135089 m!1137003))

(declare-fun m!1137005 () Bool)

(assert (=> b!1232983 m!1137005))

(assert (=> b!1232893 d!135089))

(declare-fun d!135095 () Bool)

(declare-fun lt!559599 () Bool)

(assert (=> d!135095 (= lt!559599 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!573 acc!823)))))

(declare-fun e!699397 () Bool)

(assert (=> d!135095 (= lt!559599 e!699397)))

(declare-fun res!821268 () Bool)

(assert (=> d!135095 (=> (not res!821268) (not e!699397))))

(assert (=> d!135095 (= res!821268 (is-Cons!27131 acc!823))))

(assert (=> d!135095 (= (contains!7197 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559599)))

(declare-fun b!1232989 () Bool)

(declare-fun e!699396 () Bool)

(assert (=> b!1232989 (= e!699397 e!699396)))

(declare-fun res!821267 () Bool)

(assert (=> b!1232989 (=> res!821267 e!699396)))

(assert (=> b!1232989 (= res!821267 (= (h!28340 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232990 () Bool)

(assert (=> b!1232990 (= e!699396 (contains!7197 (t!40598 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135095 res!821268) b!1232989))

(assert (= (and b!1232989 (not res!821267)) b!1232990))

(declare-fun m!1137007 () Bool)

(assert (=> d!135095 m!1137007))

(declare-fun m!1137009 () Bool)

(assert (=> d!135095 m!1137009))

(declare-fun m!1137011 () Bool)

(assert (=> b!1232990 m!1137011))

(assert (=> b!1232895 d!135095))

(declare-fun b!1233027 () Bool)

(declare-fun e!699433 () Bool)

(declare-fun call!60951 () Bool)

(assert (=> b!1233027 (= e!699433 call!60951)))

(declare-fun b!1233028 () Bool)

(declare-fun e!699432 () Bool)

(assert (=> b!1233028 (= e!699432 e!699433)))

(declare-fun c!120723 () Bool)

(assert (=> b!1233028 (= c!120723 (validKeyInArray!0 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!135097 () Bool)

(declare-fun res!821303 () Bool)

(declare-fun e!699434 () Bool)

(assert (=> d!135097 (=> res!821303 e!699434)))

(assert (=> d!135097 (= res!821303 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38898 a!3806)))))

(assert (=> d!135097 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27131 (select (arr!38362 a!3806) from!3184) Nil!27132)) e!699434)))

(declare-fun bm!60948 () Bool)

(assert (=> bm!60948 (= call!60951 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120723 (Cons!27131 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27131 (select (arr!38362 a!3806) from!3184) Nil!27132)) (Cons!27131 (select (arr!38362 a!3806) from!3184) Nil!27132))))))

(declare-fun b!1233029 () Bool)

(assert (=> b!1233029 (= e!699433 call!60951)))

(declare-fun b!1233030 () Bool)

(assert (=> b!1233030 (= e!699434 e!699432)))

(declare-fun res!821301 () Bool)

(assert (=> b!1233030 (=> (not res!821301) (not e!699432))))

(declare-fun e!699435 () Bool)

(assert (=> b!1233030 (= res!821301 (not e!699435))))

(declare-fun res!821302 () Bool)

(assert (=> b!1233030 (=> (not res!821302) (not e!699435))))

(assert (=> b!1233030 (= res!821302 (validKeyInArray!0 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233031 () Bool)

(assert (=> b!1233031 (= e!699435 (contains!7197 (Cons!27131 (select (arr!38362 a!3806) from!3184) Nil!27132) (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135097 (not res!821303)) b!1233030))

(assert (= (and b!1233030 res!821302) b!1233031))

(assert (= (and b!1233030 res!821301) b!1233028))

(assert (= (and b!1233028 c!120723) b!1233027))

(assert (= (and b!1233028 (not c!120723)) b!1233029))

(assert (= (or b!1233027 b!1233029) bm!60948))

(assert (=> b!1233028 m!1136949))

(assert (=> b!1233028 m!1136949))

(declare-fun m!1137047 () Bool)

(assert (=> b!1233028 m!1137047))

(assert (=> bm!60948 m!1136949))

(declare-fun m!1137049 () Bool)

(assert (=> bm!60948 m!1137049))

(assert (=> b!1233030 m!1136949))

(assert (=> b!1233030 m!1136949))

(assert (=> b!1233030 m!1137047))

(assert (=> b!1233031 m!1136949))

(assert (=> b!1233031 m!1136949))

(declare-fun m!1137051 () Bool)

(assert (=> b!1233031 m!1137051))

(assert (=> b!1232894 d!135097))

(declare-fun b!1233036 () Bool)

(declare-fun e!699441 () Bool)

(declare-fun call!60952 () Bool)

(assert (=> b!1233036 (= e!699441 call!60952)))

(declare-fun b!1233037 () Bool)

(declare-fun e!699440 () Bool)

(assert (=> b!1233037 (= e!699440 e!699441)))

(declare-fun c!120724 () Bool)

(assert (=> b!1233037 (= c!120724 (validKeyInArray!0 (select (arr!38362 a!3806) from!3184)))))

(declare-fun d!135113 () Bool)

(declare-fun res!821310 () Bool)

(declare-fun e!699442 () Bool)

(assert (=> d!135113 (=> res!821310 e!699442)))

(assert (=> d!135113 (= res!821310 (bvsge from!3184 (size!38898 a!3806)))))

(assert (=> d!135113 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699442)))

(declare-fun bm!60949 () Bool)

(assert (=> bm!60949 (= call!60952 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120724 (Cons!27131 (select (arr!38362 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1233038 () Bool)

(assert (=> b!1233038 (= e!699441 call!60952)))

(declare-fun b!1233039 () Bool)

(assert (=> b!1233039 (= e!699442 e!699440)))

(declare-fun res!821308 () Bool)

(assert (=> b!1233039 (=> (not res!821308) (not e!699440))))

(declare-fun e!699443 () Bool)

(assert (=> b!1233039 (= res!821308 (not e!699443))))

(declare-fun res!821309 () Bool)

(assert (=> b!1233039 (=> (not res!821309) (not e!699443))))

(assert (=> b!1233039 (= res!821309 (validKeyInArray!0 (select (arr!38362 a!3806) from!3184)))))

(declare-fun b!1233040 () Bool)

(assert (=> b!1233040 (= e!699443 (contains!7197 acc!823 (select (arr!38362 a!3806) from!3184)))))

(assert (= (and d!135113 (not res!821310)) b!1233039))

(assert (= (and b!1233039 res!821309) b!1233040))

(assert (= (and b!1233039 res!821308) b!1233037))

(assert (= (and b!1233037 c!120724) b!1233036))

(assert (= (and b!1233037 (not c!120724)) b!1233038))

(assert (= (or b!1233036 b!1233038) bm!60949))

(assert (=> b!1233037 m!1136905))

(assert (=> b!1233037 m!1136905))

(assert (=> b!1233037 m!1136907))

(assert (=> bm!60949 m!1136905))

(declare-fun m!1137053 () Bool)

(assert (=> bm!60949 m!1137053))

(assert (=> b!1233039 m!1136905))

(assert (=> b!1233039 m!1136905))

(assert (=> b!1233039 m!1136907))

(assert (=> b!1233040 m!1136905))

(assert (=> b!1233040 m!1136905))

(declare-fun m!1137055 () Bool)

(assert (=> b!1233040 m!1137055))

(assert (=> b!1232896 d!135113))

(declare-fun b!1233043 () Bool)

(declare-fun e!699447 () Bool)

(declare-fun call!60953 () Bool)

(assert (=> b!1233043 (= e!699447 call!60953)))

(declare-fun b!1233044 () Bool)

(declare-fun e!699446 () Bool)

(assert (=> b!1233044 (= e!699446 e!699447)))

(declare-fun c!120725 () Bool)

(assert (=> b!1233044 (= c!120725 (validKeyInArray!0 (select (arr!38362 a!3806) from!3184)))))

(declare-fun d!135115 () Bool)

(declare-fun res!821315 () Bool)

(declare-fun e!699448 () Bool)

(assert (=> d!135115 (=> res!821315 e!699448)))

(assert (=> d!135115 (= res!821315 (bvsge from!3184 (size!38898 a!3806)))))

(assert (=> d!135115 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27132) e!699448)))

(declare-fun bm!60950 () Bool)

(assert (=> bm!60950 (= call!60953 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120725 (Cons!27131 (select (arr!38362 a!3806) from!3184) Nil!27132) Nil!27132)))))

(declare-fun b!1233045 () Bool)

(assert (=> b!1233045 (= e!699447 call!60953)))

(declare-fun b!1233046 () Bool)

(assert (=> b!1233046 (= e!699448 e!699446)))

(declare-fun res!821313 () Bool)

(assert (=> b!1233046 (=> (not res!821313) (not e!699446))))

(declare-fun e!699449 () Bool)

(assert (=> b!1233046 (= res!821313 (not e!699449))))

(declare-fun res!821314 () Bool)

(assert (=> b!1233046 (=> (not res!821314) (not e!699449))))

(assert (=> b!1233046 (= res!821314 (validKeyInArray!0 (select (arr!38362 a!3806) from!3184)))))

(declare-fun b!1233047 () Bool)

(assert (=> b!1233047 (= e!699449 (contains!7197 Nil!27132 (select (arr!38362 a!3806) from!3184)))))

(assert (= (and d!135115 (not res!821315)) b!1233046))

(assert (= (and b!1233046 res!821314) b!1233047))

(assert (= (and b!1233046 res!821313) b!1233044))

(assert (= (and b!1233044 c!120725) b!1233043))

(assert (= (and b!1233044 (not c!120725)) b!1233045))

(assert (= (or b!1233043 b!1233045) bm!60950))

(assert (=> b!1233044 m!1136905))

(assert (=> b!1233044 m!1136905))

(assert (=> b!1233044 m!1136907))

(assert (=> bm!60950 m!1136905))

(declare-fun m!1137063 () Bool)

(assert (=> bm!60950 m!1137063))

(assert (=> b!1233046 m!1136905))

(assert (=> b!1233046 m!1136905))

(assert (=> b!1233046 m!1136907))

(assert (=> b!1233047 m!1136905))

(assert (=> b!1233047 m!1136905))

(declare-fun m!1137067 () Bool)

(assert (=> b!1233047 m!1137067))

(assert (=> b!1232885 d!135115))

(declare-fun d!135119 () Bool)

(assert (=> d!135119 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27132)))

(declare-fun lt!559609 () Unit!40830)

(declare-fun choose!80 (array!79500 List!27135 List!27135 (_ BitVec 32)) Unit!40830)

(assert (=> d!135119 (= lt!559609 (choose!80 a!3806 acc!823 Nil!27132 from!3184))))

(assert (=> d!135119 (bvslt (size!38898 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135119 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27132 from!3184) lt!559609)))

(declare-fun bs!34648 () Bool)

(assert (= bs!34648 d!135119))

(assert (=> bs!34648 m!1136927))

(declare-fun m!1137077 () Bool)

(assert (=> bs!34648 m!1137077))

(assert (=> b!1232885 d!135119))

(declare-fun b!1233057 () Bool)

(declare-fun e!699459 () Bool)

(declare-fun call!60955 () Bool)

(assert (=> b!1233057 (= e!699459 call!60955)))

(declare-fun b!1233058 () Bool)

(declare-fun e!699458 () Bool)

(assert (=> b!1233058 (= e!699458 e!699459)))

(declare-fun c!120727 () Bool)

(assert (=> b!1233058 (= c!120727 (validKeyInArray!0 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!135131 () Bool)

(declare-fun res!821325 () Bool)

(declare-fun e!699460 () Bool)

(assert (=> d!135131 (=> res!821325 e!699460)))

(assert (=> d!135131 (= res!821325 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38898 a!3806)))))

(assert (=> d!135131 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27131 (select (arr!38362 a!3806) from!3184) acc!823)) e!699460)))

(declare-fun bm!60952 () Bool)

(assert (=> bm!60952 (= call!60955 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120727 (Cons!27131 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27131 (select (arr!38362 a!3806) from!3184) acc!823)) (Cons!27131 (select (arr!38362 a!3806) from!3184) acc!823))))))

(declare-fun b!1233059 () Bool)

(assert (=> b!1233059 (= e!699459 call!60955)))

(declare-fun b!1233060 () Bool)

(assert (=> b!1233060 (= e!699460 e!699458)))

(declare-fun res!821323 () Bool)

(assert (=> b!1233060 (=> (not res!821323) (not e!699458))))

(declare-fun e!699461 () Bool)

(assert (=> b!1233060 (= res!821323 (not e!699461))))

(declare-fun res!821324 () Bool)

(assert (=> b!1233060 (=> (not res!821324) (not e!699461))))

(assert (=> b!1233060 (= res!821324 (validKeyInArray!0 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233061 () Bool)

(assert (=> b!1233061 (= e!699461 (contains!7197 (Cons!27131 (select (arr!38362 a!3806) from!3184) acc!823) (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135131 (not res!821325)) b!1233060))

(assert (= (and b!1233060 res!821324) b!1233061))

(assert (= (and b!1233060 res!821323) b!1233058))

(assert (= (and b!1233058 c!120727) b!1233057))

(assert (= (and b!1233058 (not c!120727)) b!1233059))

(assert (= (or b!1233057 b!1233059) bm!60952))

(assert (=> b!1233058 m!1136949))

(assert (=> b!1233058 m!1136949))

(assert (=> b!1233058 m!1137047))

(assert (=> bm!60952 m!1136949))

(declare-fun m!1137079 () Bool)

(assert (=> bm!60952 m!1137079))

(assert (=> b!1233060 m!1136949))

(assert (=> b!1233060 m!1136949))

(assert (=> b!1233060 m!1137047))

(assert (=> b!1233061 m!1136949))

(assert (=> b!1233061 m!1136949))

(declare-fun m!1137081 () Bool)

(assert (=> b!1233061 m!1137081))

(assert (=> b!1232885 d!135131))

(declare-fun d!135133 () Bool)

(declare-fun res!821326 () Bool)

(declare-fun e!699462 () Bool)

(assert (=> d!135133 (=> res!821326 e!699462)))

(assert (=> d!135133 (= res!821326 (is-Nil!27132 acc!823))))

(assert (=> d!135133 (= (noDuplicate!1794 acc!823) e!699462)))

(declare-fun b!1233062 () Bool)

(declare-fun e!699463 () Bool)

(assert (=> b!1233062 (= e!699462 e!699463)))

(declare-fun res!821327 () Bool)

(assert (=> b!1233062 (=> (not res!821327) (not e!699463))))

(assert (=> b!1233062 (= res!821327 (not (contains!7197 (t!40598 acc!823) (h!28340 acc!823))))))

(declare-fun b!1233063 () Bool)

(assert (=> b!1233063 (= e!699463 (noDuplicate!1794 (t!40598 acc!823)))))

(assert (= (and d!135133 (not res!821326)) b!1233062))

(assert (= (and b!1233062 res!821327) b!1233063))

(declare-fun m!1137083 () Bool)

(assert (=> b!1233062 m!1137083))

(declare-fun m!1137085 () Bool)

(assert (=> b!1233063 m!1137085))

(assert (=> b!1232887 d!135133))

(declare-fun d!135135 () Bool)

(assert (=> d!135135 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232886 d!135135))

(declare-fun d!135137 () Bool)

(declare-fun lt!559610 () Bool)

(assert (=> d!135137 (= lt!559610 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!573 acc!823)))))

(declare-fun e!699465 () Bool)

(assert (=> d!135137 (= lt!559610 e!699465)))

(declare-fun res!821329 () Bool)

(assert (=> d!135137 (=> (not res!821329) (not e!699465))))

(assert (=> d!135137 (= res!821329 (is-Cons!27131 acc!823))))

(assert (=> d!135137 (= (contains!7197 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559610)))

(declare-fun b!1233064 () Bool)

(declare-fun e!699464 () Bool)

(assert (=> b!1233064 (= e!699465 e!699464)))

(declare-fun res!821328 () Bool)

(assert (=> b!1233064 (=> res!821328 e!699464)))

(assert (=> b!1233064 (= res!821328 (= (h!28340 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233065 () Bool)

(assert (=> b!1233065 (= e!699464 (contains!7197 (t!40598 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135137 res!821329) b!1233064))

(assert (= (and b!1233064 (not res!821328)) b!1233065))

(assert (=> d!135137 m!1137007))

(declare-fun m!1137087 () Bool)

(assert (=> d!135137 m!1137087))

(declare-fun m!1137089 () Bool)

(assert (=> b!1233065 m!1137089))

(assert (=> b!1232897 d!135137))

(push 1)

(assert (not d!135137))

(assert (not b!1232983))

(assert (not b!1232973))

(assert (not b!1233040))

(assert (not b!1232990))

(assert (not bm!60948))

(assert (not b!1232974))

(assert (not b!1233062))

(assert (not b!1233037))

(assert (not d!135063))

(assert (not b!1232956))

(assert (not b!1233028))

(assert (not b!1233058))

(assert (not b!1233063))

(assert (not b!1233060))

(assert (not bm!60952))

(assert (not b!1233061))

(assert (not d!135119))

(assert (not d!135089))

(assert (not b!1233030))

(assert (not b!1233065))

(assert (not bm!60949))

(assert (not b!1232940))

(assert (not b!1233031))

(assert (not bm!60950))

(assert (not b!1233039))

(assert (not d!135095))

(assert (not b!1233044))

(assert (not b!1233046))

(assert (not b!1233047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135223 () Bool)

(assert (=> d!135223 (= (validKeyInArray!0 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233028 d!135223))

(declare-fun d!135225 () Bool)

(declare-fun lt!559631 () Bool)

(assert (=> d!135225 (= lt!559631 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!573 (t!40598 lt!559583))))))

(declare-fun e!699559 () Bool)

(assert (=> d!135225 (= lt!559631 e!699559)))

(declare-fun res!821407 () Bool)

(assert (=> d!135225 (=> (not res!821407) (not e!699559))))

(assert (=> d!135225 (= res!821407 (is-Cons!27131 (t!40598 lt!559583)))))

(assert (=> d!135225 (= (contains!7197 (t!40598 lt!559583) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559631)))

(declare-fun b!1233174 () Bool)

(declare-fun e!699558 () Bool)

(assert (=> b!1233174 (= e!699559 e!699558)))

(declare-fun res!821406 () Bool)

(assert (=> b!1233174 (=> res!821406 e!699558)))

(assert (=> b!1233174 (= res!821406 (= (h!28340 (t!40598 lt!559583)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233175 () Bool)

(assert (=> b!1233175 (= e!699558 (contains!7197 (t!40598 (t!40598 lt!559583)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135225 res!821407) b!1233174))

(assert (= (and b!1233174 (not res!821406)) b!1233175))

(declare-fun m!1137267 () Bool)

(assert (=> d!135225 m!1137267))

(declare-fun m!1137269 () Bool)

(assert (=> d!135225 m!1137269))

(declare-fun m!1137271 () Bool)

(assert (=> b!1233175 m!1137271))

(assert (=> b!1232983 d!135225))

(declare-fun lt!559632 () Bool)

(declare-fun d!135227 () Bool)

(assert (=> d!135227 (= lt!559632 (member (select (arr!38362 a!3806) from!3184) (content!573 acc!823)))))

(declare-fun e!699561 () Bool)

(assert (=> d!135227 (= lt!559632 e!699561)))

(declare-fun res!821409 () Bool)

(assert (=> d!135227 (=> (not res!821409) (not e!699561))))

(assert (=> d!135227 (= res!821409 (is-Cons!27131 acc!823))))

(assert (=> d!135227 (= (contains!7197 acc!823 (select (arr!38362 a!3806) from!3184)) lt!559632)))

(declare-fun b!1233176 () Bool)

(declare-fun e!699560 () Bool)

(assert (=> b!1233176 (= e!699561 e!699560)))

(declare-fun res!821408 () Bool)

(assert (=> b!1233176 (=> res!821408 e!699560)))

(assert (=> b!1233176 (= res!821408 (= (h!28340 acc!823) (select (arr!38362 a!3806) from!3184)))))

(declare-fun b!1233177 () Bool)

(assert (=> b!1233177 (= e!699560 (contains!7197 (t!40598 acc!823) (select (arr!38362 a!3806) from!3184)))))

(assert (= (and d!135227 res!821409) b!1233176))

(assert (= (and b!1233176 (not res!821408)) b!1233177))

(assert (=> d!135227 m!1137007))

(assert (=> d!135227 m!1136905))

(declare-fun m!1137273 () Bool)

(assert (=> d!135227 m!1137273))

(assert (=> b!1233177 m!1136905))

(declare-fun m!1137275 () Bool)

(assert (=> b!1233177 m!1137275))

(assert (=> b!1233040 d!135227))

(declare-fun b!1233178 () Bool)

(declare-fun e!699563 () Bool)

(declare-fun call!60964 () Bool)

(assert (=> b!1233178 (= e!699563 call!60964)))

(declare-fun b!1233179 () Bool)

(declare-fun e!699562 () Bool)

(assert (=> b!1233179 (= e!699562 e!699563)))

(declare-fun c!120744 () Bool)

(assert (=> b!1233179 (= c!120744 (validKeyInArray!0 (select (arr!38362 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!135229 () Bool)

(declare-fun res!821412 () Bool)

(declare-fun e!699564 () Bool)

(assert (=> d!135229 (=> res!821412 e!699564)))

(assert (=> d!135229 (= res!821412 (bvsge (bvadd 