; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137810 () Bool)

(assert start!137810)

(declare-fun b!1582905 () Bool)

(declare-fun res!1081423 () Bool)

(declare-fun e!883493 () Bool)

(assert (=> b!1582905 (=> (not res!1081423) (not e!883493))))

(declare-datatypes ((B!2840 0))(
  ( (B!2841 (val!19782 Int)) )
))
(declare-datatypes ((tuple2!25800 0))(
  ( (tuple2!25801 (_1!12911 (_ BitVec 64)) (_2!12911 B!2840)) )
))
(declare-datatypes ((List!36943 0))(
  ( (Nil!36940) (Cons!36939 (h!38483 tuple2!25800) (t!51849 List!36943)) )
))
(declare-fun l!1065 () List!36943)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!980 (List!36943 (_ BitVec 64)) Bool)

(assert (=> b!1582905 (= res!1081423 (containsKey!980 l!1065 key!287))))

(declare-fun b!1582906 () Bool)

(declare-fun res!1081424 () Bool)

(assert (=> b!1582906 (=> (not res!1081424) (not e!883493))))

(get-info :version)

(assert (=> b!1582906 (= res!1081424 (or (not ((_ is Cons!36939) l!1065)) (= (_1!12911 (h!38483 l!1065)) key!287)))))

(declare-fun res!1081425 () Bool)

(assert (=> start!137810 (=> (not res!1081425) (not e!883493))))

(declare-fun isStrictlySorted!1134 (List!36943) Bool)

(assert (=> start!137810 (= res!1081425 (isStrictlySorted!1134 l!1065))))

(assert (=> start!137810 e!883493))

(declare-fun e!883492 () Bool)

(assert (=> start!137810 e!883492))

(assert (=> start!137810 true))

(declare-fun b!1582908 () Bool)

(declare-fun tp_is_empty!39373 () Bool)

(declare-fun tp!114912 () Bool)

(assert (=> b!1582908 (= e!883492 (and tp_is_empty!39373 tp!114912))))

(declare-fun b!1582907 () Bool)

(declare-datatypes ((Option!946 0))(
  ( (Some!945 (v!22467 B!2840)) (None!944) )
))
(declare-fun isDefined!611 (Option!946) Bool)

(declare-fun getValueByKey!838 (List!36943 (_ BitVec 64)) Option!946)

(assert (=> b!1582907 (= e!883493 (not (isDefined!611 (getValueByKey!838 l!1065 key!287))))))

(assert (= (and start!137810 res!1081425) b!1582905))

(assert (= (and b!1582905 res!1081423) b!1582906))

(assert (= (and b!1582906 res!1081424) b!1582907))

(assert (= (and start!137810 ((_ is Cons!36939) l!1065)) b!1582908))

(declare-fun m!1452343 () Bool)

(assert (=> b!1582905 m!1452343))

(declare-fun m!1452345 () Bool)

(assert (=> start!137810 m!1452345))

(declare-fun m!1452347 () Bool)

(assert (=> b!1582907 m!1452347))

(assert (=> b!1582907 m!1452347))

(declare-fun m!1452349 () Bool)

(assert (=> b!1582907 m!1452349))

(check-sat (not b!1582907) (not b!1582905) tp_is_empty!39373 (not start!137810) (not b!1582908))
(check-sat)
(get-model)

(declare-fun d!166935 () Bool)

(declare-fun isEmpty!1193 (Option!946) Bool)

(assert (=> d!166935 (= (isDefined!611 (getValueByKey!838 l!1065 key!287)) (not (isEmpty!1193 (getValueByKey!838 l!1065 key!287))))))

(declare-fun bs!45849 () Bool)

(assert (= bs!45849 d!166935))

(assert (=> bs!45849 m!1452347))

(declare-fun m!1452367 () Bool)

(assert (=> bs!45849 m!1452367))

(assert (=> b!1582907 d!166935))

(declare-fun b!1582948 () Bool)

(declare-fun e!883516 () Option!946)

(declare-fun e!883517 () Option!946)

(assert (=> b!1582948 (= e!883516 e!883517)))

(declare-fun c!146624 () Bool)

(assert (=> b!1582948 (= c!146624 (and ((_ is Cons!36939) l!1065) (not (= (_1!12911 (h!38483 l!1065)) key!287))))))

(declare-fun b!1582949 () Bool)

(assert (=> b!1582949 (= e!883517 (getValueByKey!838 (t!51849 l!1065) key!287))))

(declare-fun b!1582950 () Bool)

(assert (=> b!1582950 (= e!883517 None!944)))

(declare-fun b!1582947 () Bool)

(assert (=> b!1582947 (= e!883516 (Some!945 (_2!12911 (h!38483 l!1065))))))

(declare-fun d!166939 () Bool)

(declare-fun c!146623 () Bool)

(assert (=> d!166939 (= c!146623 (and ((_ is Cons!36939) l!1065) (= (_1!12911 (h!38483 l!1065)) key!287)))))

(assert (=> d!166939 (= (getValueByKey!838 l!1065 key!287) e!883516)))

(assert (= (and d!166939 c!146623) b!1582947))

(assert (= (and d!166939 (not c!146623)) b!1582948))

(assert (= (and b!1582948 c!146624) b!1582949))

(assert (= (and b!1582948 (not c!146624)) b!1582950))

(declare-fun m!1452373 () Bool)

(assert (=> b!1582949 m!1452373))

(assert (=> b!1582907 d!166939))

(declare-fun d!166947 () Bool)

(declare-fun res!1081454 () Bool)

(declare-fun e!883532 () Bool)

(assert (=> d!166947 (=> res!1081454 e!883532)))

(assert (=> d!166947 (= res!1081454 (or ((_ is Nil!36940) l!1065) ((_ is Nil!36940) (t!51849 l!1065))))))

(assert (=> d!166947 (= (isStrictlySorted!1134 l!1065) e!883532)))

(declare-fun b!1582975 () Bool)

(declare-fun e!883533 () Bool)

(assert (=> b!1582975 (= e!883532 e!883533)))

(declare-fun res!1081455 () Bool)

(assert (=> b!1582975 (=> (not res!1081455) (not e!883533))))

(assert (=> b!1582975 (= res!1081455 (bvslt (_1!12911 (h!38483 l!1065)) (_1!12911 (h!38483 (t!51849 l!1065)))))))

(declare-fun b!1582976 () Bool)

(assert (=> b!1582976 (= e!883533 (isStrictlySorted!1134 (t!51849 l!1065)))))

(assert (= (and d!166947 (not res!1081454)) b!1582975))

(assert (= (and b!1582975 res!1081455) b!1582976))

(declare-fun m!1452379 () Bool)

(assert (=> b!1582976 m!1452379))

(assert (=> start!137810 d!166947))

(declare-fun d!166953 () Bool)

(declare-fun res!1081470 () Bool)

(declare-fun e!883550 () Bool)

(assert (=> d!166953 (=> res!1081470 e!883550)))

(assert (=> d!166953 (= res!1081470 (and ((_ is Cons!36939) l!1065) (= (_1!12911 (h!38483 l!1065)) key!287)))))

(assert (=> d!166953 (= (containsKey!980 l!1065 key!287) e!883550)))

(declare-fun b!1582995 () Bool)

(declare-fun e!883551 () Bool)

(assert (=> b!1582995 (= e!883550 e!883551)))

(declare-fun res!1081471 () Bool)

(assert (=> b!1582995 (=> (not res!1081471) (not e!883551))))

(assert (=> b!1582995 (= res!1081471 (and (or (not ((_ is Cons!36939) l!1065)) (bvsle (_1!12911 (h!38483 l!1065)) key!287)) ((_ is Cons!36939) l!1065) (bvslt (_1!12911 (h!38483 l!1065)) key!287)))))

(declare-fun b!1582996 () Bool)

(assert (=> b!1582996 (= e!883551 (containsKey!980 (t!51849 l!1065) key!287))))

(assert (= (and d!166953 (not res!1081470)) b!1582995))

(assert (= (and b!1582995 res!1081471) b!1582996))

(declare-fun m!1452385 () Bool)

(assert (=> b!1582996 m!1452385))

(assert (=> b!1582905 d!166953))

(declare-fun b!1583003 () Bool)

(declare-fun e!883556 () Bool)

(declare-fun tp!114921 () Bool)

(assert (=> b!1583003 (= e!883556 (and tp_is_empty!39373 tp!114921))))

(assert (=> b!1582908 (= tp!114912 e!883556)))

(assert (= (and b!1582908 ((_ is Cons!36939) (t!51849 l!1065))) b!1583003))

(check-sat (not b!1582949) (not b!1583003) (not d!166935) (not b!1582976) tp_is_empty!39373 (not b!1582996))
(check-sat)
(get-model)

(declare-fun d!166959 () Bool)

(assert (=> d!166959 (= (isEmpty!1193 (getValueByKey!838 l!1065 key!287)) (not ((_ is Some!945) (getValueByKey!838 l!1065 key!287))))))

(assert (=> d!166935 d!166959))

(declare-fun d!166961 () Bool)

(declare-fun res!1081480 () Bool)

(declare-fun e!883569 () Bool)

(assert (=> d!166961 (=> res!1081480 e!883569)))

(assert (=> d!166961 (= res!1081480 (and ((_ is Cons!36939) (t!51849 l!1065)) (= (_1!12911 (h!38483 (t!51849 l!1065))) key!287)))))

(assert (=> d!166961 (= (containsKey!980 (t!51849 l!1065) key!287) e!883569)))

(declare-fun b!1583020 () Bool)

(declare-fun e!883570 () Bool)

(assert (=> b!1583020 (= e!883569 e!883570)))

(declare-fun res!1081481 () Bool)

(assert (=> b!1583020 (=> (not res!1081481) (not e!883570))))

(assert (=> b!1583020 (= res!1081481 (and (or (not ((_ is Cons!36939) (t!51849 l!1065))) (bvsle (_1!12911 (h!38483 (t!51849 l!1065))) key!287)) ((_ is Cons!36939) (t!51849 l!1065)) (bvslt (_1!12911 (h!38483 (t!51849 l!1065))) key!287)))))

(declare-fun b!1583021 () Bool)

(assert (=> b!1583021 (= e!883570 (containsKey!980 (t!51849 (t!51849 l!1065)) key!287))))

(assert (= (and d!166961 (not res!1081480)) b!1583020))

(assert (= (and b!1583020 res!1081481) b!1583021))

(declare-fun m!1452391 () Bool)

(assert (=> b!1583021 m!1452391))

(assert (=> b!1582996 d!166961))

(declare-fun b!1583023 () Bool)

(declare-fun e!883571 () Option!946)

(declare-fun e!883572 () Option!946)

(assert (=> b!1583023 (= e!883571 e!883572)))

(declare-fun c!146638 () Bool)

(assert (=> b!1583023 (= c!146638 (and ((_ is Cons!36939) (t!51849 l!1065)) (not (= (_1!12911 (h!38483 (t!51849 l!1065))) key!287))))))

(declare-fun b!1583024 () Bool)

(assert (=> b!1583024 (= e!883572 (getValueByKey!838 (t!51849 (t!51849 l!1065)) key!287))))

(declare-fun b!1583025 () Bool)

(assert (=> b!1583025 (= e!883572 None!944)))

(declare-fun b!1583022 () Bool)

(assert (=> b!1583022 (= e!883571 (Some!945 (_2!12911 (h!38483 (t!51849 l!1065)))))))

(declare-fun d!166963 () Bool)

(declare-fun c!146637 () Bool)

(assert (=> d!166963 (= c!146637 (and ((_ is Cons!36939) (t!51849 l!1065)) (= (_1!12911 (h!38483 (t!51849 l!1065))) key!287)))))

(assert (=> d!166963 (= (getValueByKey!838 (t!51849 l!1065) key!287) e!883571)))

(assert (= (and d!166963 c!146637) b!1583022))

(assert (= (and d!166963 (not c!146637)) b!1583023))

(assert (= (and b!1583023 c!146638) b!1583024))

(assert (= (and b!1583023 (not c!146638)) b!1583025))

(declare-fun m!1452393 () Bool)

(assert (=> b!1583024 m!1452393))

(assert (=> b!1582949 d!166963))

(declare-fun d!166965 () Bool)

(declare-fun res!1081482 () Bool)

(declare-fun e!883573 () Bool)

(assert (=> d!166965 (=> res!1081482 e!883573)))

(assert (=> d!166965 (= res!1081482 (or ((_ is Nil!36940) (t!51849 l!1065)) ((_ is Nil!36940) (t!51849 (t!51849 l!1065)))))))

(assert (=> d!166965 (= (isStrictlySorted!1134 (t!51849 l!1065)) e!883573)))

(declare-fun b!1583026 () Bool)

(declare-fun e!883574 () Bool)

(assert (=> b!1583026 (= e!883573 e!883574)))

(declare-fun res!1081483 () Bool)

(assert (=> b!1583026 (=> (not res!1081483) (not e!883574))))

(assert (=> b!1583026 (= res!1081483 (bvslt (_1!12911 (h!38483 (t!51849 l!1065))) (_1!12911 (h!38483 (t!51849 (t!51849 l!1065))))))))

(declare-fun b!1583027 () Bool)

(assert (=> b!1583027 (= e!883574 (isStrictlySorted!1134 (t!51849 (t!51849 l!1065))))))

(assert (= (and d!166965 (not res!1081482)) b!1583026))

(assert (= (and b!1583026 res!1081483) b!1583027))

(declare-fun m!1452395 () Bool)

(assert (=> b!1583027 m!1452395))

(assert (=> b!1582976 d!166965))

(declare-fun b!1583028 () Bool)

(declare-fun e!883575 () Bool)

(declare-fun tp!114928 () Bool)

(assert (=> b!1583028 (= e!883575 (and tp_is_empty!39373 tp!114928))))

(assert (=> b!1583003 (= tp!114921 e!883575)))

(assert (= (and b!1583003 ((_ is Cons!36939) (t!51849 (t!51849 l!1065)))) b!1583028))

(check-sat (not b!1583027) (not b!1583021) tp_is_empty!39373 (not b!1583028) (not b!1583024))
(check-sat)
