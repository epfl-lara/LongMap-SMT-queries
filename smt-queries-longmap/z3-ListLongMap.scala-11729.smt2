; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137906 () Bool)

(assert start!137906)

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2702 0))(
  ( (B!2703 (val!19713 Int)) )
))
(declare-datatypes ((tuple2!25648 0))(
  ( (tuple2!25649 (_1!12835 (_ BitVec 64)) (_2!12835 B!2702)) )
))
(declare-datatypes ((List!36865 0))(
  ( (Nil!36862) (Cons!36861 (h!38422 tuple2!25648) (t!51771 List!36865)) )
))
(declare-fun l!1390 () List!36865)

(declare-fun b!1584192 () Bool)

(declare-fun e!884138 () Bool)

(declare-fun value!194 () B!2702)

(declare-datatypes ((Option!924 0))(
  ( (Some!923 (v!22439 B!2702)) (None!922) )
))
(declare-fun getValueByKey!819 (List!36865 (_ BitVec 64)) Option!924)

(assert (=> b!1584192 (= e!884138 (not (= (getValueByKey!819 l!1390 key!405) (Some!923 value!194))))))

(declare-fun b!1584193 () Bool)

(declare-fun res!1081515 () Bool)

(declare-fun e!884141 () Bool)

(assert (=> b!1584193 (=> (not res!1081515) (not e!884141))))

(declare-fun contains!10550 (List!36865 tuple2!25648) Bool)

(assert (=> b!1584193 (= res!1081515 (contains!10550 l!1390 (tuple2!25649 key!405 value!194)))))

(declare-fun b!1584194 () Bool)

(assert (=> b!1584194 (= e!884141 e!884138)))

(declare-fun res!1081513 () Bool)

(assert (=> b!1584194 (=> (not res!1081513) (not e!884138))))

(declare-fun e!884140 () Bool)

(assert (=> b!1584194 (= res!1081513 e!884140)))

(declare-fun res!1081517 () Bool)

(assert (=> b!1584194 (=> res!1081517 e!884140)))

(declare-datatypes ((tuple2!25650 0))(
  ( (tuple2!25651 (_1!12836 tuple2!25648) (_2!12836 List!36865)) )
))
(declare-datatypes ((Option!925 0))(
  ( (Some!924 (v!22440 tuple2!25650)) (None!923) )
))
(declare-fun lt!677910 () Option!925)

(declare-fun isEmpty!1187 (Option!925) Bool)

(assert (=> b!1584194 (= res!1081517 (isEmpty!1187 lt!677910))))

(declare-fun unapply!100 (List!36865) Option!925)

(assert (=> b!1584194 (= lt!677910 (unapply!100 l!1390))))

(declare-fun b!1584196 () Bool)

(declare-fun res!1081512 () Bool)

(assert (=> b!1584196 (=> (not res!1081512) (not e!884141))))

(declare-fun containsKey!938 (List!36865 (_ BitVec 64)) Bool)

(assert (=> b!1584196 (= res!1081512 (containsKey!938 l!1390 key!405))))

(declare-fun b!1584197 () Bool)

(get-info :version)

(declare-fun get!26867 (Option!925) tuple2!25650)

(assert (=> b!1584197 (= e!884140 (not ((_ is Nil!36862) (_2!12836 (get!26867 lt!677910)))))))

(declare-fun b!1584198 () Bool)

(declare-fun e!884139 () Bool)

(declare-fun tp_is_empty!39247 () Bool)

(declare-fun tp!114597 () Bool)

(assert (=> b!1584198 (= e!884139 (and tp_is_empty!39247 tp!114597))))

(declare-fun b!1584195 () Bool)

(declare-fun res!1081514 () Bool)

(assert (=> b!1584195 (=> (not res!1081514) (not e!884138))))

(assert (=> b!1584195 (= res!1081514 (not ((_ is Cons!36861) l!1390)))))

(declare-fun res!1081516 () Bool)

(assert (=> start!137906 (=> (not res!1081516) (not e!884141))))

(declare-fun isStrictlySorted!1079 (List!36865) Bool)

(assert (=> start!137906 (= res!1081516 (isStrictlySorted!1079 l!1390))))

(assert (=> start!137906 e!884141))

(assert (=> start!137906 e!884139))

(assert (=> start!137906 true))

(assert (=> start!137906 tp_is_empty!39247))

(assert (= (and start!137906 res!1081516) b!1584196))

(assert (= (and b!1584196 res!1081512) b!1584193))

(assert (= (and b!1584193 res!1081515) b!1584194))

(assert (= (and b!1584194 (not res!1081517)) b!1584197))

(assert (= (and b!1584194 res!1081513) b!1584195))

(assert (= (and b!1584195 res!1081514) b!1584192))

(assert (= (and start!137906 ((_ is Cons!36861) l!1390)) b!1584198))

(declare-fun m!1454871 () Bool)

(assert (=> b!1584192 m!1454871))

(declare-fun m!1454873 () Bool)

(assert (=> b!1584194 m!1454873))

(declare-fun m!1454875 () Bool)

(assert (=> b!1584194 m!1454875))

(declare-fun m!1454877 () Bool)

(assert (=> start!137906 m!1454877))

(declare-fun m!1454879 () Bool)

(assert (=> b!1584193 m!1454879))

(declare-fun m!1454881 () Bool)

(assert (=> b!1584197 m!1454881))

(declare-fun m!1454883 () Bool)

(assert (=> b!1584196 m!1454883))

(check-sat (not b!1584194) (not b!1584196) (not b!1584197) (not b!1584193) tp_is_empty!39247 (not start!137906) (not b!1584198) (not b!1584192))
(check-sat)
(get-model)

(declare-fun d!167549 () Bool)

(assert (=> d!167549 (= (isEmpty!1187 lt!677910) (not ((_ is Some!924) lt!677910)))))

(assert (=> b!1584194 d!167549))

(declare-fun d!167551 () Bool)

(assert (=> d!167551 (= (unapply!100 l!1390) (ite ((_ is Nil!36862) l!1390) None!923 (Some!924 (tuple2!25651 (h!38422 l!1390) (t!51771 l!1390)))))))

(assert (=> b!1584194 d!167551))

(declare-fun d!167553 () Bool)

(declare-fun lt!677924 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!839 (List!36865) (InoxSet tuple2!25648))

(assert (=> d!167553 (= lt!677924 (select (content!839 l!1390) (tuple2!25649 key!405 value!194)))))

(declare-fun e!884190 () Bool)

(assert (=> d!167553 (= lt!677924 e!884190)))

(declare-fun res!1081578 () Bool)

(assert (=> d!167553 (=> (not res!1081578) (not e!884190))))

(assert (=> d!167553 (= res!1081578 ((_ is Cons!36861) l!1390))))

(assert (=> d!167553 (= (contains!10550 l!1390 (tuple2!25649 key!405 value!194)) lt!677924)))

(declare-fun b!1584265 () Bool)

(declare-fun e!884191 () Bool)

(assert (=> b!1584265 (= e!884190 e!884191)))

(declare-fun res!1081579 () Bool)

(assert (=> b!1584265 (=> res!1081579 e!884191)))

(assert (=> b!1584265 (= res!1081579 (= (h!38422 l!1390) (tuple2!25649 key!405 value!194)))))

(declare-fun b!1584266 () Bool)

(assert (=> b!1584266 (= e!884191 (contains!10550 (t!51771 l!1390) (tuple2!25649 key!405 value!194)))))

(assert (= (and d!167553 res!1081578) b!1584265))

(assert (= (and b!1584265 (not res!1081579)) b!1584266))

(declare-fun m!1454921 () Bool)

(assert (=> d!167553 m!1454921))

(declare-fun m!1454923 () Bool)

(assert (=> d!167553 m!1454923))

(declare-fun m!1454925 () Bool)

(assert (=> b!1584266 m!1454925))

(assert (=> b!1584193 d!167553))

(declare-fun d!167559 () Bool)

(declare-fun res!1081588 () Bool)

(declare-fun e!884200 () Bool)

(assert (=> d!167559 (=> res!1081588 e!884200)))

(assert (=> d!167559 (= res!1081588 (or ((_ is Nil!36862) l!1390) ((_ is Nil!36862) (t!51771 l!1390))))))

(assert (=> d!167559 (= (isStrictlySorted!1079 l!1390) e!884200)))

(declare-fun b!1584275 () Bool)

(declare-fun e!884201 () Bool)

(assert (=> b!1584275 (= e!884200 e!884201)))

(declare-fun res!1081589 () Bool)

(assert (=> b!1584275 (=> (not res!1081589) (not e!884201))))

(assert (=> b!1584275 (= res!1081589 (bvslt (_1!12835 (h!38422 l!1390)) (_1!12835 (h!38422 (t!51771 l!1390)))))))

(declare-fun b!1584276 () Bool)

(assert (=> b!1584276 (= e!884201 (isStrictlySorted!1079 (t!51771 l!1390)))))

(assert (= (and d!167559 (not res!1081588)) b!1584275))

(assert (= (and b!1584275 res!1081589) b!1584276))

(declare-fun m!1454935 () Bool)

(assert (=> b!1584276 m!1454935))

(assert (=> start!137906 d!167559))

(declare-fun d!167565 () Bool)

(assert (=> d!167565 (= (get!26867 lt!677910) (v!22440 lt!677910))))

(assert (=> b!1584197 d!167565))

(declare-fun b!1584298 () Bool)

(declare-fun e!884218 () Option!924)

(declare-fun e!884219 () Option!924)

(assert (=> b!1584298 (= e!884218 e!884219)))

(declare-fun c!147425 () Bool)

(assert (=> b!1584298 (= c!147425 (and ((_ is Cons!36861) l!1390) (not (= (_1!12835 (h!38422 l!1390)) key!405))))))

(declare-fun b!1584297 () Bool)

(assert (=> b!1584297 (= e!884218 (Some!923 (_2!12835 (h!38422 l!1390))))))

(declare-fun b!1584299 () Bool)

(assert (=> b!1584299 (= e!884219 (getValueByKey!819 (t!51771 l!1390) key!405))))

(declare-fun d!167567 () Bool)

(declare-fun c!147424 () Bool)

(assert (=> d!167567 (= c!147424 (and ((_ is Cons!36861) l!1390) (= (_1!12835 (h!38422 l!1390)) key!405)))))

(assert (=> d!167567 (= (getValueByKey!819 l!1390 key!405) e!884218)))

(declare-fun b!1584300 () Bool)

(assert (=> b!1584300 (= e!884219 None!922)))

(assert (= (and d!167567 c!147424) b!1584297))

(assert (= (and d!167567 (not c!147424)) b!1584298))

(assert (= (and b!1584298 c!147425) b!1584299))

(assert (= (and b!1584298 (not c!147425)) b!1584300))

(declare-fun m!1454941 () Bool)

(assert (=> b!1584299 m!1454941))

(assert (=> b!1584192 d!167567))

(declare-fun d!167583 () Bool)

(declare-fun res!1081606 () Bool)

(declare-fun e!884238 () Bool)

(assert (=> d!167583 (=> res!1081606 e!884238)))

(assert (=> d!167583 (= res!1081606 (and ((_ is Cons!36861) l!1390) (= (_1!12835 (h!38422 l!1390)) key!405)))))

(assert (=> d!167583 (= (containsKey!938 l!1390 key!405) e!884238)))

(declare-fun b!1584333 () Bool)

(declare-fun e!884239 () Bool)

(assert (=> b!1584333 (= e!884238 e!884239)))

(declare-fun res!1081607 () Bool)

(assert (=> b!1584333 (=> (not res!1081607) (not e!884239))))

(assert (=> b!1584333 (= res!1081607 (and (or (not ((_ is Cons!36861) l!1390)) (bvsle (_1!12835 (h!38422 l!1390)) key!405)) ((_ is Cons!36861) l!1390) (bvslt (_1!12835 (h!38422 l!1390)) key!405)))))

(declare-fun b!1584334 () Bool)

(assert (=> b!1584334 (= e!884239 (containsKey!938 (t!51771 l!1390) key!405))))

(assert (= (and d!167583 (not res!1081606)) b!1584333))

(assert (= (and b!1584333 res!1081607) b!1584334))

(declare-fun m!1454947 () Bool)

(assert (=> b!1584334 m!1454947))

(assert (=> b!1584196 d!167583))

(declare-fun b!1584345 () Bool)

(declare-fun e!884246 () Bool)

(declare-fun tp!114612 () Bool)

(assert (=> b!1584345 (= e!884246 (and tp_is_empty!39247 tp!114612))))

(assert (=> b!1584198 (= tp!114597 e!884246)))

(assert (= (and b!1584198 ((_ is Cons!36861) (t!51771 l!1390))) b!1584345))

(check-sat (not b!1584345) (not b!1584266) (not d!167553) (not b!1584299) (not b!1584334) (not b!1584276) tp_is_empty!39247)
(check-sat)
