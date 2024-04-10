; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137846 () Bool)

(assert start!137846)

(declare-fun b!1583232 () Bool)

(declare-fun e!883697 () Bool)

(declare-datatypes ((B!2842 0))(
  ( (B!2843 (val!19783 Int)) )
))
(declare-datatypes ((tuple2!25734 0))(
  ( (tuple2!25735 (_1!12878 (_ BitVec 64)) (_2!12878 B!2842)) )
))
(declare-datatypes ((List!36903 0))(
  ( (Nil!36900) (Cons!36899 (h!38442 tuple2!25734) (t!51817 List!36903)) )
))
(declare-fun l!1065 () List!36903)

(declare-fun key!287 () (_ BitVec 64))

(declare-datatypes ((Option!945 0))(
  ( (Some!944 (v!22472 B!2842)) (None!943) )
))
(declare-fun isDefined!610 (Option!945) Bool)

(declare-fun getValueByKey!836 (List!36903 (_ BitVec 64)) Option!945)

(assert (=> b!1583232 (= e!883697 (not (isDefined!610 (getValueByKey!836 l!1065 key!287))))))

(declare-fun res!1081561 () Bool)

(assert (=> start!137846 (=> (not res!1081561) (not e!883697))))

(declare-fun isStrictlySorted!1137 (List!36903) Bool)

(assert (=> start!137846 (= res!1081561 (isStrictlySorted!1137 l!1065))))

(assert (=> start!137846 e!883697))

(declare-fun e!883696 () Bool)

(assert (=> start!137846 e!883696))

(assert (=> start!137846 true))

(declare-fun b!1583231 () Bool)

(declare-fun res!1081562 () Bool)

(assert (=> b!1583231 (=> (not res!1081562) (not e!883697))))

(get-info :version)

(assert (=> b!1583231 (= res!1081562 (or (not ((_ is Cons!36899) l!1065)) (= (_1!12878 (h!38442 l!1065)) key!287)))))

(declare-fun b!1583233 () Bool)

(declare-fun tp_is_empty!39375 () Bool)

(declare-fun tp!114914 () Bool)

(assert (=> b!1583233 (= e!883696 (and tp_is_empty!39375 tp!114914))))

(declare-fun b!1583230 () Bool)

(declare-fun res!1081563 () Bool)

(assert (=> b!1583230 (=> (not res!1081563) (not e!883697))))

(declare-fun containsKey!983 (List!36903 (_ BitVec 64)) Bool)

(assert (=> b!1583230 (= res!1081563 (containsKey!983 l!1065 key!287))))

(assert (= (and start!137846 res!1081561) b!1583230))

(assert (= (and b!1583230 res!1081563) b!1583231))

(assert (= (and b!1583231 res!1081562) b!1583232))

(assert (= (and start!137846 ((_ is Cons!36899) l!1065)) b!1583233))

(declare-fun m!1453231 () Bool)

(assert (=> b!1583232 m!1453231))

(assert (=> b!1583232 m!1453231))

(declare-fun m!1453233 () Bool)

(assert (=> b!1583232 m!1453233))

(declare-fun m!1453235 () Bool)

(assert (=> start!137846 m!1453235))

(declare-fun m!1453237 () Bool)

(assert (=> b!1583230 m!1453237))

(check-sat (not b!1583233) (not b!1583230) (not b!1583232) (not start!137846) tp_is_empty!39375)
(check-sat)
(get-model)

(declare-fun d!167173 () Bool)

(declare-fun res!1081577 () Bool)

(declare-fun e!883708 () Bool)

(assert (=> d!167173 (=> res!1081577 e!883708)))

(assert (=> d!167173 (= res!1081577 (or ((_ is Nil!36900) l!1065) ((_ is Nil!36900) (t!51817 l!1065))))))

(assert (=> d!167173 (= (isStrictlySorted!1137 l!1065) e!883708)))

(declare-fun b!1583250 () Bool)

(declare-fun e!883709 () Bool)

(assert (=> b!1583250 (= e!883708 e!883709)))

(declare-fun res!1081578 () Bool)

(assert (=> b!1583250 (=> (not res!1081578) (not e!883709))))

(assert (=> b!1583250 (= res!1081578 (bvslt (_1!12878 (h!38442 l!1065)) (_1!12878 (h!38442 (t!51817 l!1065)))))))

(declare-fun b!1583251 () Bool)

(assert (=> b!1583251 (= e!883709 (isStrictlySorted!1137 (t!51817 l!1065)))))

(assert (= (and d!167173 (not res!1081577)) b!1583250))

(assert (= (and b!1583250 res!1081578) b!1583251))

(declare-fun m!1453247 () Bool)

(assert (=> b!1583251 m!1453247))

(assert (=> start!137846 d!167173))

(declare-fun d!167179 () Bool)

(declare-fun isEmpty!1190 (Option!945) Bool)

(assert (=> d!167179 (= (isDefined!610 (getValueByKey!836 l!1065 key!287)) (not (isEmpty!1190 (getValueByKey!836 l!1065 key!287))))))

(declare-fun bs!45895 () Bool)

(assert (= bs!45895 d!167179))

(assert (=> bs!45895 m!1453231))

(declare-fun m!1453251 () Bool)

(assert (=> bs!45895 m!1453251))

(assert (=> b!1583232 d!167179))

(declare-fun b!1583281 () Bool)

(declare-fun e!883727 () Option!945)

(assert (=> b!1583281 (= e!883727 None!943)))

(declare-fun b!1583278 () Bool)

(declare-fun e!883726 () Option!945)

(assert (=> b!1583278 (= e!883726 (Some!944 (_2!12878 (h!38442 l!1065))))))

(declare-fun b!1583279 () Bool)

(assert (=> b!1583279 (= e!883726 e!883727)))

(declare-fun c!146719 () Bool)

(assert (=> b!1583279 (= c!146719 (and ((_ is Cons!36899) l!1065) (not (= (_1!12878 (h!38442 l!1065)) key!287))))))

(declare-fun d!167183 () Bool)

(declare-fun c!146718 () Bool)

(assert (=> d!167183 (= c!146718 (and ((_ is Cons!36899) l!1065) (= (_1!12878 (h!38442 l!1065)) key!287)))))

(assert (=> d!167183 (= (getValueByKey!836 l!1065 key!287) e!883726)))

(declare-fun b!1583280 () Bool)

(assert (=> b!1583280 (= e!883727 (getValueByKey!836 (t!51817 l!1065) key!287))))

(assert (= (and d!167183 c!146718) b!1583278))

(assert (= (and d!167183 (not c!146718)) b!1583279))

(assert (= (and b!1583279 c!146719) b!1583280))

(assert (= (and b!1583279 (not c!146719)) b!1583281))

(declare-fun m!1453257 () Bool)

(assert (=> b!1583280 m!1453257))

(assert (=> b!1583232 d!167183))

(declare-fun d!167189 () Bool)

(declare-fun res!1081601 () Bool)

(declare-fun e!883744 () Bool)

(assert (=> d!167189 (=> res!1081601 e!883744)))

(assert (=> d!167189 (= res!1081601 (and ((_ is Cons!36899) l!1065) (= (_1!12878 (h!38442 l!1065)) key!287)))))

(assert (=> d!167189 (= (containsKey!983 l!1065 key!287) e!883744)))

(declare-fun b!1583298 () Bool)

(declare-fun e!883745 () Bool)

(assert (=> b!1583298 (= e!883744 e!883745)))

(declare-fun res!1081602 () Bool)

(assert (=> b!1583298 (=> (not res!1081602) (not e!883745))))

(assert (=> b!1583298 (= res!1081602 (and (or (not ((_ is Cons!36899) l!1065)) (bvsle (_1!12878 (h!38442 l!1065)) key!287)) ((_ is Cons!36899) l!1065) (bvslt (_1!12878 (h!38442 l!1065)) key!287)))))

(declare-fun b!1583299 () Bool)

(assert (=> b!1583299 (= e!883745 (containsKey!983 (t!51817 l!1065) key!287))))

(assert (= (and d!167189 (not res!1081601)) b!1583298))

(assert (= (and b!1583298 res!1081602) b!1583299))

(declare-fun m!1453265 () Bool)

(assert (=> b!1583299 m!1453265))

(assert (=> b!1583230 d!167189))

(declare-fun b!1583312 () Bool)

(declare-fun e!883752 () Bool)

(declare-fun tp!114920 () Bool)

(assert (=> b!1583312 (= e!883752 (and tp_is_empty!39375 tp!114920))))

(assert (=> b!1583233 (= tp!114914 e!883752)))

(assert (= (and b!1583233 ((_ is Cons!36899) (t!51817 l!1065))) b!1583312))

(check-sat (not b!1583312) (not b!1583299) (not b!1583280) (not b!1583251) (not d!167179) tp_is_empty!39375)
(check-sat)
(get-model)

(declare-fun d!167197 () Bool)

(declare-fun res!1081609 () Bool)

(declare-fun e!883767 () Bool)

(assert (=> d!167197 (=> res!1081609 e!883767)))

(assert (=> d!167197 (= res!1081609 (and ((_ is Cons!36899) (t!51817 l!1065)) (= (_1!12878 (h!38442 (t!51817 l!1065))) key!287)))))

(assert (=> d!167197 (= (containsKey!983 (t!51817 l!1065) key!287) e!883767)))

(declare-fun b!1583333 () Bool)

(declare-fun e!883768 () Bool)

(assert (=> b!1583333 (= e!883767 e!883768)))

(declare-fun res!1081610 () Bool)

(assert (=> b!1583333 (=> (not res!1081610) (not e!883768))))

(assert (=> b!1583333 (= res!1081610 (and (or (not ((_ is Cons!36899) (t!51817 l!1065))) (bvsle (_1!12878 (h!38442 (t!51817 l!1065))) key!287)) ((_ is Cons!36899) (t!51817 l!1065)) (bvslt (_1!12878 (h!38442 (t!51817 l!1065))) key!287)))))

(declare-fun b!1583334 () Bool)

(assert (=> b!1583334 (= e!883768 (containsKey!983 (t!51817 (t!51817 l!1065)) key!287))))

(assert (= (and d!167197 (not res!1081609)) b!1583333))

(assert (= (and b!1583333 res!1081610) b!1583334))

(declare-fun m!1453271 () Bool)

(assert (=> b!1583334 m!1453271))

(assert (=> b!1583299 d!167197))

(declare-fun b!1583338 () Bool)

(declare-fun e!883770 () Option!945)

(assert (=> b!1583338 (= e!883770 None!943)))

(declare-fun b!1583335 () Bool)

(declare-fun e!883769 () Option!945)

(assert (=> b!1583335 (= e!883769 (Some!944 (_2!12878 (h!38442 (t!51817 l!1065)))))))

(declare-fun b!1583336 () Bool)

(assert (=> b!1583336 (= e!883769 e!883770)))

(declare-fun c!146727 () Bool)

(assert (=> b!1583336 (= c!146727 (and ((_ is Cons!36899) (t!51817 l!1065)) (not (= (_1!12878 (h!38442 (t!51817 l!1065))) key!287))))))

(declare-fun d!167199 () Bool)

(declare-fun c!146726 () Bool)

(assert (=> d!167199 (= c!146726 (and ((_ is Cons!36899) (t!51817 l!1065)) (= (_1!12878 (h!38442 (t!51817 l!1065))) key!287)))))

(assert (=> d!167199 (= (getValueByKey!836 (t!51817 l!1065) key!287) e!883769)))

(declare-fun b!1583337 () Bool)

(assert (=> b!1583337 (= e!883770 (getValueByKey!836 (t!51817 (t!51817 l!1065)) key!287))))

(assert (= (and d!167199 c!146726) b!1583335))

(assert (= (and d!167199 (not c!146726)) b!1583336))

(assert (= (and b!1583336 c!146727) b!1583337))

(assert (= (and b!1583336 (not c!146727)) b!1583338))

(declare-fun m!1453273 () Bool)

(assert (=> b!1583337 m!1453273))

(assert (=> b!1583280 d!167199))

(declare-fun d!167201 () Bool)

(assert (=> d!167201 (= (isEmpty!1190 (getValueByKey!836 l!1065 key!287)) (not ((_ is Some!944) (getValueByKey!836 l!1065 key!287))))))

(assert (=> d!167179 d!167201))

(declare-fun d!167203 () Bool)

(declare-fun res!1081611 () Bool)

(declare-fun e!883771 () Bool)

(assert (=> d!167203 (=> res!1081611 e!883771)))

(assert (=> d!167203 (= res!1081611 (or ((_ is Nil!36900) (t!51817 l!1065)) ((_ is Nil!36900) (t!51817 (t!51817 l!1065)))))))

(assert (=> d!167203 (= (isStrictlySorted!1137 (t!51817 l!1065)) e!883771)))

(declare-fun b!1583339 () Bool)

(declare-fun e!883772 () Bool)

(assert (=> b!1583339 (= e!883771 e!883772)))

(declare-fun res!1081612 () Bool)

(assert (=> b!1583339 (=> (not res!1081612) (not e!883772))))

(assert (=> b!1583339 (= res!1081612 (bvslt (_1!12878 (h!38442 (t!51817 l!1065))) (_1!12878 (h!38442 (t!51817 (t!51817 l!1065))))))))

(declare-fun b!1583340 () Bool)

(assert (=> b!1583340 (= e!883772 (isStrictlySorted!1137 (t!51817 (t!51817 l!1065))))))

(assert (= (and d!167203 (not res!1081611)) b!1583339))

(assert (= (and b!1583339 res!1081612) b!1583340))

(declare-fun m!1453275 () Bool)

(assert (=> b!1583340 m!1453275))

(assert (=> b!1583251 d!167203))

(declare-fun b!1583341 () Bool)

(declare-fun e!883773 () Bool)

(declare-fun tp!114927 () Bool)

(assert (=> b!1583341 (= e!883773 (and tp_is_empty!39375 tp!114927))))

(assert (=> b!1583312 (= tp!114920 e!883773)))

(assert (= (and b!1583312 ((_ is Cons!36899) (t!51817 (t!51817 l!1065)))) b!1583341))

(check-sat (not b!1583340) (not b!1583337) (not b!1583334) (not b!1583341) tp_is_empty!39375)
(check-sat)
