; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7170 () Bool)

(assert start!7170)

(declare-fun res!26877 () Bool)

(declare-fun e!29217 () Bool)

(assert (=> start!7170 (=> (not res!26877) (not e!29217))))

(declare-datatypes ((B!854 0))(
  ( (B!855 (val!1014 Int)) )
))
(declare-datatypes ((tuple2!1680 0))(
  ( (tuple2!1681 (_1!851 (_ BitVec 64)) (_2!851 B!854)) )
))
(declare-datatypes ((List!1225 0))(
  ( (Nil!1222) (Cons!1221 (h!1801 tuple2!1680) (t!4249 List!1225)) )
))
(declare-fun l!812 () List!1225)

(declare-fun isStrictlySorted!221 (List!1225) Bool)

(assert (=> start!7170 (= res!26877 (isStrictlySorted!221 l!812))))

(assert (=> start!7170 e!29217))

(declare-fun e!29218 () Bool)

(assert (=> start!7170 e!29218))

(assert (=> start!7170 true))

(declare-fun b!45895 () Bool)

(declare-fun res!26878 () Bool)

(assert (=> b!45895 (=> (not res!26878) (not e!29217))))

(get-info :version)

(assert (=> b!45895 (= res!26878 (not ((_ is Cons!1221) l!812)))))

(declare-fun b!45896 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!36 (List!1225 (_ BitVec 64)) List!1225)

(assert (=> b!45896 (= e!29217 (not (isStrictlySorted!221 (removeStrictlySorted!36 l!812 key1!43))))))

(declare-fun b!45897 () Bool)

(declare-fun tp_is_empty!1951 () Bool)

(declare-fun tp!6038 () Bool)

(assert (=> b!45897 (= e!29218 (and tp_is_empty!1951 tp!6038))))

(assert (= (and start!7170 res!26877) b!45895))

(assert (= (and b!45895 res!26878) b!45896))

(assert (= (and start!7170 ((_ is Cons!1221) l!812)) b!45897))

(declare-fun m!40445 () Bool)

(assert (=> start!7170 m!40445))

(declare-fun m!40447 () Bool)

(assert (=> b!45896 m!40447))

(assert (=> b!45896 m!40447))

(declare-fun m!40449 () Bool)

(assert (=> b!45896 m!40449))

(check-sat (not b!45896) (not start!7170) (not b!45897) tp_is_empty!1951)
(check-sat)
(get-model)

(declare-fun d!8967 () Bool)

(declare-fun res!26899 () Bool)

(declare-fun e!29239 () Bool)

(assert (=> d!8967 (=> res!26899 e!29239)))

(assert (=> d!8967 (= res!26899 (or ((_ is Nil!1222) (removeStrictlySorted!36 l!812 key1!43)) ((_ is Nil!1222) (t!4249 (removeStrictlySorted!36 l!812 key1!43)))))))

(assert (=> d!8967 (= (isStrictlySorted!221 (removeStrictlySorted!36 l!812 key1!43)) e!29239)))

(declare-fun b!45924 () Bool)

(declare-fun e!29240 () Bool)

(assert (=> b!45924 (= e!29239 e!29240)))

(declare-fun res!26900 () Bool)

(assert (=> b!45924 (=> (not res!26900) (not e!29240))))

(assert (=> b!45924 (= res!26900 (bvslt (_1!851 (h!1801 (removeStrictlySorted!36 l!812 key1!43))) (_1!851 (h!1801 (t!4249 (removeStrictlySorted!36 l!812 key1!43))))))))

(declare-fun b!45925 () Bool)

(assert (=> b!45925 (= e!29240 (isStrictlySorted!221 (t!4249 (removeStrictlySorted!36 l!812 key1!43))))))

(assert (= (and d!8967 (not res!26899)) b!45924))

(assert (= (and b!45924 res!26900) b!45925))

(declare-fun m!40463 () Bool)

(assert (=> b!45925 m!40463))

(assert (=> b!45896 d!8967))

(declare-fun b!45959 () Bool)

(declare-fun e!29266 () List!1225)

(assert (=> b!45959 (= e!29266 Nil!1222)))

(declare-fun d!8971 () Bool)

(declare-fun e!29265 () Bool)

(assert (=> d!8971 e!29265))

(declare-fun res!26914 () Bool)

(assert (=> d!8971 (=> (not res!26914) (not e!29265))))

(declare-fun lt!20247 () List!1225)

(assert (=> d!8971 (= res!26914 (isStrictlySorted!221 lt!20247))))

(declare-fun e!29264 () List!1225)

(assert (=> d!8971 (= lt!20247 e!29264)))

(declare-fun c!6195 () Bool)

(assert (=> d!8971 (= c!6195 (and ((_ is Cons!1221) l!812) (= (_1!851 (h!1801 l!812)) key1!43)))))

(assert (=> d!8971 (isStrictlySorted!221 l!812)))

(assert (=> d!8971 (= (removeStrictlySorted!36 l!812 key1!43) lt!20247)))

(declare-fun b!45960 () Bool)

(declare-fun containsKey!84 (List!1225 (_ BitVec 64)) Bool)

(assert (=> b!45960 (= e!29265 (not (containsKey!84 lt!20247 key1!43)))))

(declare-fun b!45961 () Bool)

(declare-fun $colon$colon!38 (List!1225 tuple2!1680) List!1225)

(assert (=> b!45961 (= e!29266 ($colon$colon!38 (removeStrictlySorted!36 (t!4249 l!812) key1!43) (h!1801 l!812)))))

(declare-fun b!45962 () Bool)

(assert (=> b!45962 (= e!29264 (t!4249 l!812))))

(declare-fun b!45963 () Bool)

(assert (=> b!45963 (= e!29264 e!29266)))

(declare-fun c!6196 () Bool)

(assert (=> b!45963 (= c!6196 (and ((_ is Cons!1221) l!812) (not (= (_1!851 (h!1801 l!812)) key1!43))))))

(assert (= (and d!8971 c!6195) b!45962))

(assert (= (and d!8971 (not c!6195)) b!45963))

(assert (= (and b!45963 c!6196) b!45961))

(assert (= (and b!45963 (not c!6196)) b!45959))

(assert (= (and d!8971 res!26914) b!45960))

(declare-fun m!40471 () Bool)

(assert (=> d!8971 m!40471))

(assert (=> d!8971 m!40445))

(declare-fun m!40475 () Bool)

(assert (=> b!45960 m!40475))

(declare-fun m!40477 () Bool)

(assert (=> b!45961 m!40477))

(assert (=> b!45961 m!40477))

(declare-fun m!40483 () Bool)

(assert (=> b!45961 m!40483))

(assert (=> b!45896 d!8971))

(declare-fun d!8981 () Bool)

(declare-fun res!26916 () Bool)

(declare-fun e!29268 () Bool)

(assert (=> d!8981 (=> res!26916 e!29268)))

(assert (=> d!8981 (= res!26916 (or ((_ is Nil!1222) l!812) ((_ is Nil!1222) (t!4249 l!812))))))

(assert (=> d!8981 (= (isStrictlySorted!221 l!812) e!29268)))

(declare-fun b!45965 () Bool)

(declare-fun e!29270 () Bool)

(assert (=> b!45965 (= e!29268 e!29270)))

(declare-fun res!26918 () Bool)

(assert (=> b!45965 (=> (not res!26918) (not e!29270))))

(assert (=> b!45965 (= res!26918 (bvslt (_1!851 (h!1801 l!812)) (_1!851 (h!1801 (t!4249 l!812)))))))

(declare-fun b!45967 () Bool)

(assert (=> b!45967 (= e!29270 (isStrictlySorted!221 (t!4249 l!812)))))

(assert (= (and d!8981 (not res!26916)) b!45965))

(assert (= (and b!45965 res!26918) b!45967))

(declare-fun m!40485 () Bool)

(assert (=> b!45967 m!40485))

(assert (=> start!7170 d!8981))

(declare-fun b!45977 () Bool)

(declare-fun e!29276 () Bool)

(declare-fun tp!6050 () Bool)

(assert (=> b!45977 (= e!29276 (and tp_is_empty!1951 tp!6050))))

(assert (=> b!45897 (= tp!6038 e!29276)))

(assert (= (and b!45897 ((_ is Cons!1221) (t!4249 l!812))) b!45977))

(check-sat (not b!45925) (not b!45967) (not b!45961) (not d!8971) (not b!45960) (not b!45977) tp_is_empty!1951)
(check-sat)
