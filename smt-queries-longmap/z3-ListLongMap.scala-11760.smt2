; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137988 () Bool)

(assert start!137988)

(declare-fun b!1583957 () Bool)

(declare-fun res!1081939 () Bool)

(declare-fun e!884173 () Bool)

(assert (=> b!1583957 (=> (not res!1081939) (not e!884173))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((B!2902 0))(
  ( (B!2903 (val!19813 Int)) )
))
(declare-datatypes ((tuple2!25794 0))(
  ( (tuple2!25795 (_1!12908 (_ BitVec 64)) (_2!12908 B!2902)) )
))
(declare-datatypes ((List!36933 0))(
  ( (Nil!36930) (Cons!36929 (h!38472 tuple2!25794) (t!51847 List!36933)) )
))
(declare-fun l!1251 () List!36933)

(get-info :version)

(assert (=> b!1583957 (= res!1081939 (and (not (= otherKey!56 newKey!123)) (not ((_ is Cons!36929) l!1251))))))

(declare-fun b!1583958 () Bool)

(declare-fun newValue!123 () B!2902)

(declare-fun isStrictlySorted!1158 (List!36933) Bool)

(declare-fun insertStrictlySorted!624 (List!36933 (_ BitVec 64) B!2902) List!36933)

(assert (=> b!1583958 (= e!884173 (not (isStrictlySorted!1158 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))

(declare-fun b!1583956 () Bool)

(declare-fun res!1081940 () Bool)

(assert (=> b!1583956 (=> (not res!1081940) (not e!884173))))

(declare-fun containsKey!992 (List!36933 (_ BitVec 64)) Bool)

(assert (=> b!1583956 (= res!1081940 (not (containsKey!992 l!1251 otherKey!56)))))

(declare-fun b!1583959 () Bool)

(declare-fun e!884172 () Bool)

(declare-fun tp_is_empty!39435 () Bool)

(declare-fun tp!115051 () Bool)

(assert (=> b!1583959 (= e!884172 (and tp_is_empty!39435 tp!115051))))

(declare-fun res!1081938 () Bool)

(assert (=> start!137988 (=> (not res!1081938) (not e!884173))))

(assert (=> start!137988 (= res!1081938 (isStrictlySorted!1158 l!1251))))

(assert (=> start!137988 e!884173))

(assert (=> start!137988 e!884172))

(assert (=> start!137988 true))

(assert (=> start!137988 tp_is_empty!39435))

(assert (= (and start!137988 res!1081938) b!1583956))

(assert (= (and b!1583956 res!1081940) b!1583957))

(assert (= (and b!1583957 res!1081939) b!1583958))

(assert (= (and start!137988 ((_ is Cons!36929) l!1251)) b!1583959))

(declare-fun m!1453549 () Bool)

(assert (=> b!1583958 m!1453549))

(assert (=> b!1583958 m!1453549))

(declare-fun m!1453551 () Bool)

(assert (=> b!1583958 m!1453551))

(declare-fun m!1453553 () Bool)

(assert (=> b!1583956 m!1453553))

(declare-fun m!1453555 () Bool)

(assert (=> start!137988 m!1453555))

(check-sat (not b!1583959) tp_is_empty!39435 (not start!137988) (not b!1583956) (not b!1583958))
(check-sat)
(get-model)

(declare-fun d!167331 () Bool)

(declare-fun res!1081962 () Bool)

(declare-fun e!884192 () Bool)

(assert (=> d!167331 (=> res!1081962 e!884192)))

(assert (=> d!167331 (= res!1081962 (and ((_ is Cons!36929) l!1251) (= (_1!12908 (h!38472 l!1251)) otherKey!56)))))

(assert (=> d!167331 (= (containsKey!992 l!1251 otherKey!56) e!884192)))

(declare-fun b!1583984 () Bool)

(declare-fun e!884193 () Bool)

(assert (=> b!1583984 (= e!884192 e!884193)))

(declare-fun res!1081963 () Bool)

(assert (=> b!1583984 (=> (not res!1081963) (not e!884193))))

(assert (=> b!1583984 (= res!1081963 (and (or (not ((_ is Cons!36929) l!1251)) (bvsle (_1!12908 (h!38472 l!1251)) otherKey!56)) ((_ is Cons!36929) l!1251) (bvslt (_1!12908 (h!38472 l!1251)) otherKey!56)))))

(declare-fun b!1583985 () Bool)

(assert (=> b!1583985 (= e!884193 (containsKey!992 (t!51847 l!1251) otherKey!56))))

(assert (= (and d!167331 (not res!1081962)) b!1583984))

(assert (= (and b!1583984 res!1081963) b!1583985))

(declare-fun m!1453567 () Bool)

(assert (=> b!1583985 m!1453567))

(assert (=> b!1583956 d!167331))

(declare-fun d!167337 () Bool)

(declare-fun res!1081980 () Bool)

(declare-fun e!884210 () Bool)

(assert (=> d!167337 (=> res!1081980 e!884210)))

(assert (=> d!167337 (= res!1081980 (or ((_ is Nil!36930) (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)) ((_ is Nil!36930) (t!51847 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167337 (= (isStrictlySorted!1158 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)) e!884210)))

(declare-fun b!1584002 () Bool)

(declare-fun e!884211 () Bool)

(assert (=> b!1584002 (= e!884210 e!884211)))

(declare-fun res!1081981 () Bool)

(assert (=> b!1584002 (=> (not res!1081981) (not e!884211))))

(assert (=> b!1584002 (= res!1081981 (bvslt (_1!12908 (h!38472 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))) (_1!12908 (h!38472 (t!51847 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1584003 () Bool)

(assert (=> b!1584003 (= e!884211 (isStrictlySorted!1158 (t!51847 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167337 (not res!1081980)) b!1584002))

(assert (= (and b!1584002 res!1081981) b!1584003))

(declare-fun m!1453575 () Bool)

(assert (=> b!1584003 m!1453575))

(assert (=> b!1583958 d!167337))

(declare-fun lt!677235 () List!36933)

(declare-fun e!884256 () Bool)

(declare-fun b!1584084 () Bool)

(declare-fun contains!10523 (List!36933 tuple2!25794) Bool)

(assert (=> b!1584084 (= e!884256 (contains!10523 lt!677235 (tuple2!25795 newKey!123 newValue!123)))))

(declare-fun b!1584085 () Bool)

(declare-fun c!146832 () Bool)

(declare-fun c!146831 () Bool)

(declare-fun e!884254 () List!36933)

(assert (=> b!1584085 (= e!884254 (ite c!146832 (t!51847 l!1251) (ite c!146831 (Cons!36929 (h!38472 l!1251) (t!51847 l!1251)) Nil!36930)))))

(declare-fun b!1584086 () Bool)

(declare-fun e!884252 () List!36933)

(declare-fun call!72541 () List!36933)

(assert (=> b!1584086 (= e!884252 call!72541)))

(declare-fun b!1584087 () Bool)

(declare-fun e!884253 () List!36933)

(declare-fun call!72542 () List!36933)

(assert (=> b!1584087 (= e!884253 call!72542)))

(declare-fun d!167345 () Bool)

(assert (=> d!167345 e!884256))

(declare-fun res!1081998 () Bool)

(assert (=> d!167345 (=> (not res!1081998) (not e!884256))))

(assert (=> d!167345 (= res!1081998 (isStrictlySorted!1158 lt!677235))))

(assert (=> d!167345 (= lt!677235 e!884253)))

(declare-fun c!146833 () Bool)

(assert (=> d!167345 (= c!146833 (and ((_ is Cons!36929) l!1251) (bvslt (_1!12908 (h!38472 l!1251)) newKey!123)))))

(assert (=> d!167345 (isStrictlySorted!1158 l!1251)))

(assert (=> d!167345 (= (insertStrictlySorted!624 l!1251 newKey!123 newValue!123) lt!677235)))

(declare-fun b!1584088 () Bool)

(assert (=> b!1584088 (= c!146831 (and ((_ is Cons!36929) l!1251) (bvsgt (_1!12908 (h!38472 l!1251)) newKey!123)))))

(declare-fun e!884255 () List!36933)

(assert (=> b!1584088 (= e!884255 e!884252)))

(declare-fun bm!72537 () Bool)

(declare-fun call!72540 () List!36933)

(assert (=> bm!72537 (= call!72540 call!72542)))

(declare-fun b!1584089 () Bool)

(assert (=> b!1584089 (= e!884253 e!884255)))

(assert (=> b!1584089 (= c!146832 (and ((_ is Cons!36929) l!1251) (= (_1!12908 (h!38472 l!1251)) newKey!123)))))

(declare-fun bm!72538 () Bool)

(assert (=> bm!72538 (= call!72541 call!72540)))

(declare-fun bm!72539 () Bool)

(declare-fun $colon$colon!1020 (List!36933 tuple2!25794) List!36933)

(assert (=> bm!72539 (= call!72542 ($colon$colon!1020 e!884254 (ite c!146833 (h!38472 l!1251) (tuple2!25795 newKey!123 newValue!123))))))

(declare-fun c!146834 () Bool)

(assert (=> bm!72539 (= c!146834 c!146833)))

(declare-fun b!1584090 () Bool)

(declare-fun res!1081999 () Bool)

(assert (=> b!1584090 (=> (not res!1081999) (not e!884256))))

(assert (=> b!1584090 (= res!1081999 (containsKey!992 lt!677235 newKey!123))))

(declare-fun b!1584091 () Bool)

(assert (=> b!1584091 (= e!884255 call!72540)))

(declare-fun b!1584092 () Bool)

(assert (=> b!1584092 (= e!884252 call!72541)))

(declare-fun b!1584093 () Bool)

(assert (=> b!1584093 (= e!884254 (insertStrictlySorted!624 (t!51847 l!1251) newKey!123 newValue!123))))

(assert (= (and d!167345 c!146833) b!1584087))

(assert (= (and d!167345 (not c!146833)) b!1584089))

(assert (= (and b!1584089 c!146832) b!1584091))

(assert (= (and b!1584089 (not c!146832)) b!1584088))

(assert (= (and b!1584088 c!146831) b!1584086))

(assert (= (and b!1584088 (not c!146831)) b!1584092))

(assert (= (or b!1584086 b!1584092) bm!72538))

(assert (= (or b!1584091 bm!72538) bm!72537))

(assert (= (or b!1584087 bm!72537) bm!72539))

(assert (= (and bm!72539 c!146834) b!1584093))

(assert (= (and bm!72539 (not c!146834)) b!1584085))

(assert (= (and d!167345 res!1081998) b!1584090))

(assert (= (and b!1584090 res!1081999) b!1584084))

(declare-fun m!1453597 () Bool)

(assert (=> bm!72539 m!1453597))

(declare-fun m!1453599 () Bool)

(assert (=> b!1584090 m!1453599))

(declare-fun m!1453601 () Bool)

(assert (=> b!1584084 m!1453601))

(declare-fun m!1453603 () Bool)

(assert (=> d!167345 m!1453603))

(assert (=> d!167345 m!1453555))

(declare-fun m!1453605 () Bool)

(assert (=> b!1584093 m!1453605))

(assert (=> b!1583958 d!167345))

(declare-fun d!167351 () Bool)

(declare-fun res!1082004 () Bool)

(declare-fun e!884261 () Bool)

(assert (=> d!167351 (=> res!1082004 e!884261)))

(assert (=> d!167351 (= res!1082004 (or ((_ is Nil!36930) l!1251) ((_ is Nil!36930) (t!51847 l!1251))))))

(assert (=> d!167351 (= (isStrictlySorted!1158 l!1251) e!884261)))

(declare-fun b!1584098 () Bool)

(declare-fun e!884262 () Bool)

(assert (=> b!1584098 (= e!884261 e!884262)))

(declare-fun res!1082005 () Bool)

(assert (=> b!1584098 (=> (not res!1082005) (not e!884262))))

(assert (=> b!1584098 (= res!1082005 (bvslt (_1!12908 (h!38472 l!1251)) (_1!12908 (h!38472 (t!51847 l!1251)))))))

(declare-fun b!1584099 () Bool)

(assert (=> b!1584099 (= e!884262 (isStrictlySorted!1158 (t!51847 l!1251)))))

(assert (= (and d!167351 (not res!1082004)) b!1584098))

(assert (= (and b!1584098 res!1082005) b!1584099))

(declare-fun m!1453609 () Bool)

(assert (=> b!1584099 m!1453609))

(assert (=> start!137988 d!167351))

(declare-fun b!1584111 () Bool)

(declare-fun e!884270 () Bool)

(declare-fun tp!115060 () Bool)

(assert (=> b!1584111 (= e!884270 (and tp_is_empty!39435 tp!115060))))

(assert (=> b!1583959 (= tp!115051 e!884270)))

(assert (= (and b!1583959 ((_ is Cons!36929) (t!51847 l!1251))) b!1584111))

(check-sat (not b!1584090) (not b!1584084) (not b!1584093) (not d!167345) (not bm!72539) tp_is_empty!39435 (not b!1584099) (not b!1583985) (not b!1584003) (not b!1584111))
(check-sat)
