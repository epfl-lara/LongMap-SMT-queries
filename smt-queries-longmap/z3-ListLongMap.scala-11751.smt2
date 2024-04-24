; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138248 () Bool)

(assert start!138248)

(declare-fun b!1585555 () Bool)

(declare-fun e!885139 () Bool)

(declare-datatypes ((B!2834 0))(
  ( (B!2835 (val!19779 Int)) )
))
(declare-datatypes ((tuple2!25786 0))(
  ( (tuple2!25787 (_1!12904 (_ BitVec 64)) (_2!12904 B!2834)) )
))
(declare-datatypes ((List!36931 0))(
  ( (Nil!36928) (Cons!36927 (h!38488 tuple2!25786) (t!51837 List!36931)) )
))
(declare-fun l!1065 () List!36931)

(declare-fun key!287 () (_ BitVec 64))

(declare-datatypes ((Option!936 0))(
  ( (Some!935 (v!22460 B!2834)) (None!934) )
))
(declare-fun isDefined!602 (Option!936) Bool)

(declare-fun getValueByKey!828 (List!36931 (_ BitVec 64)) Option!936)

(assert (=> b!1585555 (= e!885139 (not (isDefined!602 (getValueByKey!828 l!1065 key!287))))))

(assert (=> b!1585555 (isDefined!602 (getValueByKey!828 (t!51837 l!1065) key!287))))

(declare-datatypes ((Unit!52186 0))(
  ( (Unit!52187) )
))
(declare-fun lt!678060 () Unit!52186)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!553 (List!36931 (_ BitVec 64)) Unit!52186)

(assert (=> b!1585555 (= lt!678060 (lemmaContainsKeyImpliesGetValueByKeyDefined!553 (t!51837 l!1065) key!287))))

(declare-fun b!1585556 () Bool)

(declare-fun res!1082377 () Bool)

(assert (=> b!1585556 (=> (not res!1082377) (not e!885139))))

(declare-fun isStrictlySorted!1121 (List!36931) Bool)

(assert (=> b!1585556 (= res!1082377 (isStrictlySorted!1121 (t!51837 l!1065)))))

(declare-fun b!1585557 () Bool)

(declare-fun res!1082374 () Bool)

(assert (=> b!1585557 (=> (not res!1082374) (not e!885139))))

(declare-fun containsKey!980 (List!36931 (_ BitVec 64)) Bool)

(assert (=> b!1585557 (= res!1082374 (containsKey!980 l!1065 key!287))))

(declare-fun res!1082376 () Bool)

(assert (=> start!138248 (=> (not res!1082376) (not e!885139))))

(assert (=> start!138248 (= res!1082376 (isStrictlySorted!1121 l!1065))))

(assert (=> start!138248 e!885139))

(declare-fun e!885140 () Bool)

(assert (=> start!138248 e!885140))

(assert (=> start!138248 true))

(declare-fun b!1585558 () Bool)

(declare-fun tp_is_empty!39367 () Bool)

(declare-fun tp!114894 () Bool)

(assert (=> b!1585558 (= e!885140 (and tp_is_empty!39367 tp!114894))))

(declare-fun b!1585559 () Bool)

(declare-fun res!1082375 () Bool)

(assert (=> b!1585559 (=> (not res!1082375) (not e!885139))))

(get-info :version)

(assert (=> b!1585559 (= res!1082375 (and ((_ is Cons!36927) l!1065) (not (= (_1!12904 (h!38488 l!1065)) key!287))))))

(declare-fun b!1585560 () Bool)

(declare-fun res!1082378 () Bool)

(assert (=> b!1585560 (=> (not res!1082378) (not e!885139))))

(assert (=> b!1585560 (= res!1082378 (containsKey!980 (t!51837 l!1065) key!287))))

(assert (= (and start!138248 res!1082376) b!1585557))

(assert (= (and b!1585557 res!1082374) b!1585559))

(assert (= (and b!1585559 res!1082375) b!1585556))

(assert (= (and b!1585556 res!1082377) b!1585560))

(assert (= (and b!1585560 res!1082378) b!1585555))

(assert (= (and start!138248 ((_ is Cons!36927) l!1065)) b!1585558))

(declare-fun m!1455459 () Bool)

(assert (=> start!138248 m!1455459))

(declare-fun m!1455461 () Bool)

(assert (=> b!1585557 m!1455461))

(declare-fun m!1455463 () Bool)

(assert (=> b!1585555 m!1455463))

(declare-fun m!1455465 () Bool)

(assert (=> b!1585555 m!1455465))

(assert (=> b!1585555 m!1455463))

(declare-fun m!1455467 () Bool)

(assert (=> b!1585555 m!1455467))

(declare-fun m!1455469 () Bool)

(assert (=> b!1585555 m!1455469))

(assert (=> b!1585555 m!1455465))

(declare-fun m!1455471 () Bool)

(assert (=> b!1585555 m!1455471))

(declare-fun m!1455473 () Bool)

(assert (=> b!1585556 m!1455473))

(declare-fun m!1455475 () Bool)

(assert (=> b!1585560 m!1455475))

(check-sat (not b!1585555) tp_is_empty!39367 (not start!138248) (not b!1585557) (not b!1585558) (not b!1585556) (not b!1585560))
(check-sat)
(get-model)

(declare-fun d!167847 () Bool)

(declare-fun isEmpty!1190 (Option!936) Bool)

(assert (=> d!167847 (= (isDefined!602 (getValueByKey!828 l!1065 key!287)) (not (isEmpty!1190 (getValueByKey!828 l!1065 key!287))))))

(declare-fun bs!45909 () Bool)

(assert (= bs!45909 d!167847))

(assert (=> bs!45909 m!1455463))

(declare-fun m!1455513 () Bool)

(assert (=> bs!45909 m!1455513))

(assert (=> b!1585555 d!167847))

(declare-fun b!1585612 () Bool)

(declare-fun e!885162 () Option!936)

(assert (=> b!1585612 (= e!885162 None!934)))

(declare-fun b!1585610 () Bool)

(declare-fun e!885161 () Option!936)

(assert (=> b!1585610 (= e!885161 e!885162)))

(declare-fun c!147494 () Bool)

(assert (=> b!1585610 (= c!147494 (and ((_ is Cons!36927) l!1065) (not (= (_1!12904 (h!38488 l!1065)) key!287))))))

(declare-fun b!1585611 () Bool)

(assert (=> b!1585611 (= e!885162 (getValueByKey!828 (t!51837 l!1065) key!287))))

(declare-fun b!1585609 () Bool)

(assert (=> b!1585609 (= e!885161 (Some!935 (_2!12904 (h!38488 l!1065))))))

(declare-fun d!167849 () Bool)

(declare-fun c!147493 () Bool)

(assert (=> d!167849 (= c!147493 (and ((_ is Cons!36927) l!1065) (= (_1!12904 (h!38488 l!1065)) key!287)))))

(assert (=> d!167849 (= (getValueByKey!828 l!1065 key!287) e!885161)))

(assert (= (and d!167849 c!147493) b!1585609))

(assert (= (and d!167849 (not c!147493)) b!1585610))

(assert (= (and b!1585610 c!147494) b!1585611))

(assert (= (and b!1585610 (not c!147494)) b!1585612))

(assert (=> b!1585611 m!1455465))

(assert (=> b!1585555 d!167849))

(declare-fun b!1585620 () Bool)

(declare-fun e!885168 () Option!936)

(assert (=> b!1585620 (= e!885168 None!934)))

(declare-fun b!1585618 () Bool)

(declare-fun e!885167 () Option!936)

(assert (=> b!1585618 (= e!885167 e!885168)))

(declare-fun c!147496 () Bool)

(assert (=> b!1585618 (= c!147496 (and ((_ is Cons!36927) (t!51837 l!1065)) (not (= (_1!12904 (h!38488 (t!51837 l!1065))) key!287))))))

(declare-fun b!1585619 () Bool)

(assert (=> b!1585619 (= e!885168 (getValueByKey!828 (t!51837 (t!51837 l!1065)) key!287))))

(declare-fun b!1585617 () Bool)

(assert (=> b!1585617 (= e!885167 (Some!935 (_2!12904 (h!38488 (t!51837 l!1065)))))))

(declare-fun d!167855 () Bool)

(declare-fun c!147495 () Bool)

(assert (=> d!167855 (= c!147495 (and ((_ is Cons!36927) (t!51837 l!1065)) (= (_1!12904 (h!38488 (t!51837 l!1065))) key!287)))))

(assert (=> d!167855 (= (getValueByKey!828 (t!51837 l!1065) key!287) e!885167)))

(assert (= (and d!167855 c!147495) b!1585617))

(assert (= (and d!167855 (not c!147495)) b!1585618))

(assert (= (and b!1585618 c!147496) b!1585619))

(assert (= (and b!1585618 (not c!147496)) b!1585620))

(declare-fun m!1455515 () Bool)

(assert (=> b!1585619 m!1455515))

(assert (=> b!1585555 d!167855))

(declare-fun d!167859 () Bool)

(assert (=> d!167859 (= (isDefined!602 (getValueByKey!828 (t!51837 l!1065) key!287)) (not (isEmpty!1190 (getValueByKey!828 (t!51837 l!1065) key!287))))))

(declare-fun bs!45910 () Bool)

(assert (= bs!45910 d!167859))

(assert (=> bs!45910 m!1455465))

(declare-fun m!1455517 () Bool)

(assert (=> bs!45910 m!1455517))

(assert (=> b!1585555 d!167859))

(declare-fun d!167861 () Bool)

(assert (=> d!167861 (isDefined!602 (getValueByKey!828 (t!51837 l!1065) key!287))))

(declare-fun lt!678069 () Unit!52186)

(declare-fun choose!2097 (List!36931 (_ BitVec 64)) Unit!52186)

(assert (=> d!167861 (= lt!678069 (choose!2097 (t!51837 l!1065) key!287))))

(declare-fun e!885179 () Bool)

(assert (=> d!167861 e!885179))

(declare-fun res!1082423 () Bool)

(assert (=> d!167861 (=> (not res!1082423) (not e!885179))))

(assert (=> d!167861 (= res!1082423 (isStrictlySorted!1121 (t!51837 l!1065)))))

(assert (=> d!167861 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!553 (t!51837 l!1065) key!287) lt!678069)))

(declare-fun b!1585635 () Bool)

(assert (=> b!1585635 (= e!885179 (containsKey!980 (t!51837 l!1065) key!287))))

(assert (= (and d!167861 res!1082423) b!1585635))

(assert (=> d!167861 m!1455465))

(assert (=> d!167861 m!1455465))

(assert (=> d!167861 m!1455471))

(declare-fun m!1455525 () Bool)

(assert (=> d!167861 m!1455525))

(assert (=> d!167861 m!1455473))

(assert (=> b!1585635 m!1455475))

(assert (=> b!1585555 d!167861))

(declare-fun d!167869 () Bool)

(declare-fun res!1082428 () Bool)

(declare-fun e!885196 () Bool)

(assert (=> d!167869 (=> res!1082428 e!885196)))

(assert (=> d!167869 (= res!1082428 (and ((_ is Cons!36927) (t!51837 l!1065)) (= (_1!12904 (h!38488 (t!51837 l!1065))) key!287)))))

(assert (=> d!167869 (= (containsKey!980 (t!51837 l!1065) key!287) e!885196)))

(declare-fun b!1585664 () Bool)

(declare-fun e!885197 () Bool)

(assert (=> b!1585664 (= e!885196 e!885197)))

(declare-fun res!1082429 () Bool)

(assert (=> b!1585664 (=> (not res!1082429) (not e!885197))))

(assert (=> b!1585664 (= res!1082429 (and (or (not ((_ is Cons!36927) (t!51837 l!1065))) (bvsle (_1!12904 (h!38488 (t!51837 l!1065))) key!287)) ((_ is Cons!36927) (t!51837 l!1065)) (bvslt (_1!12904 (h!38488 (t!51837 l!1065))) key!287)))))

(declare-fun b!1585665 () Bool)

(assert (=> b!1585665 (= e!885197 (containsKey!980 (t!51837 (t!51837 l!1065)) key!287))))

(assert (= (and d!167869 (not res!1082428)) b!1585664))

(assert (= (and b!1585664 res!1082429) b!1585665))

(declare-fun m!1455535 () Bool)

(assert (=> b!1585665 m!1455535))

(assert (=> b!1585560 d!167869))

(declare-fun d!167883 () Bool)

(declare-fun res!1082430 () Bool)

(declare-fun e!885198 () Bool)

(assert (=> d!167883 (=> res!1082430 e!885198)))

(assert (=> d!167883 (= res!1082430 (and ((_ is Cons!36927) l!1065) (= (_1!12904 (h!38488 l!1065)) key!287)))))

(assert (=> d!167883 (= (containsKey!980 l!1065 key!287) e!885198)))

(declare-fun b!1585666 () Bool)

(declare-fun e!885199 () Bool)

(assert (=> b!1585666 (= e!885198 e!885199)))

(declare-fun res!1082431 () Bool)

(assert (=> b!1585666 (=> (not res!1082431) (not e!885199))))

(assert (=> b!1585666 (= res!1082431 (and (or (not ((_ is Cons!36927) l!1065)) (bvsle (_1!12904 (h!38488 l!1065)) key!287)) ((_ is Cons!36927) l!1065) (bvslt (_1!12904 (h!38488 l!1065)) key!287)))))

(declare-fun b!1585667 () Bool)

(assert (=> b!1585667 (= e!885199 (containsKey!980 (t!51837 l!1065) key!287))))

(assert (= (and d!167883 (not res!1082430)) b!1585666))

(assert (= (and b!1585666 res!1082431) b!1585667))

(assert (=> b!1585667 m!1455475))

(assert (=> b!1585557 d!167883))

(declare-fun d!167885 () Bool)

(declare-fun res!1082442 () Bool)

(declare-fun e!885210 () Bool)

(assert (=> d!167885 (=> res!1082442 e!885210)))

(assert (=> d!167885 (= res!1082442 (or ((_ is Nil!36928) l!1065) ((_ is Nil!36928) (t!51837 l!1065))))))

(assert (=> d!167885 (= (isStrictlySorted!1121 l!1065) e!885210)))

(declare-fun b!1585678 () Bool)

(declare-fun e!885211 () Bool)

(assert (=> b!1585678 (= e!885210 e!885211)))

(declare-fun res!1082443 () Bool)

(assert (=> b!1585678 (=> (not res!1082443) (not e!885211))))

(assert (=> b!1585678 (= res!1082443 (bvslt (_1!12904 (h!38488 l!1065)) (_1!12904 (h!38488 (t!51837 l!1065)))))))

(declare-fun b!1585679 () Bool)

(assert (=> b!1585679 (= e!885211 (isStrictlySorted!1121 (t!51837 l!1065)))))

(assert (= (and d!167885 (not res!1082442)) b!1585678))

(assert (= (and b!1585678 res!1082443) b!1585679))

(assert (=> b!1585679 m!1455473))

(assert (=> start!138248 d!167885))

(declare-fun d!167891 () Bool)

(declare-fun res!1082446 () Bool)

(declare-fun e!885214 () Bool)

(assert (=> d!167891 (=> res!1082446 e!885214)))

(assert (=> d!167891 (= res!1082446 (or ((_ is Nil!36928) (t!51837 l!1065)) ((_ is Nil!36928) (t!51837 (t!51837 l!1065)))))))

(assert (=> d!167891 (= (isStrictlySorted!1121 (t!51837 l!1065)) e!885214)))

(declare-fun b!1585680 () Bool)

(declare-fun e!885215 () Bool)

(assert (=> b!1585680 (= e!885214 e!885215)))

(declare-fun res!1082447 () Bool)

(assert (=> b!1585680 (=> (not res!1082447) (not e!885215))))

(assert (=> b!1585680 (= res!1082447 (bvslt (_1!12904 (h!38488 (t!51837 l!1065))) (_1!12904 (h!38488 (t!51837 (t!51837 l!1065))))))))

(declare-fun b!1585681 () Bool)

(assert (=> b!1585681 (= e!885215 (isStrictlySorted!1121 (t!51837 (t!51837 l!1065))))))

(assert (= (and d!167891 (not res!1082446)) b!1585680))

(assert (= (and b!1585680 res!1082447) b!1585681))

(declare-fun m!1455541 () Bool)

(assert (=> b!1585681 m!1455541))

(assert (=> b!1585556 d!167891))

(declare-fun b!1585694 () Bool)

(declare-fun e!885224 () Bool)

(declare-fun tp!114903 () Bool)

(assert (=> b!1585694 (= e!885224 (and tp_is_empty!39367 tp!114903))))

(assert (=> b!1585558 (= tp!114894 e!885224)))

(assert (= (and b!1585558 ((_ is Cons!36927) (t!51837 l!1065))) b!1585694))

(check-sat (not b!1585681) (not d!167847) (not b!1585694) tp_is_empty!39367 (not b!1585635) (not b!1585665) (not b!1585679) (not b!1585611) (not b!1585619) (not d!167859) (not b!1585667) (not d!167861))
(check-sat)
