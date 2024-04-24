; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138224 () Bool)

(assert start!138224)

(declare-fun b!1585414 () Bool)

(declare-fun res!1082282 () Bool)

(declare-fun e!885053 () Bool)

(assert (=> b!1585414 (=> (not res!1082282) (not e!885053))))

(declare-datatypes ((B!2828 0))(
  ( (B!2829 (val!19776 Int)) )
))
(declare-datatypes ((tuple2!25780 0))(
  ( (tuple2!25781 (_1!12901 (_ BitVec 64)) (_2!12901 B!2828)) )
))
(declare-datatypes ((List!36928 0))(
  ( (Nil!36925) (Cons!36924 (h!38485 tuple2!25780) (t!51834 List!36928)) )
))
(declare-fun l!1065 () List!36928)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!977 (List!36928 (_ BitVec 64)) Bool)

(assert (=> b!1585414 (= res!1082282 (containsKey!977 l!1065 key!287))))

(declare-fun b!1585415 () Bool)

(declare-fun res!1082285 () Bool)

(assert (=> b!1585415 (=> (not res!1082285) (not e!885053))))

(get-info :version)

(assert (=> b!1585415 (= res!1082285 (and ((_ is Cons!36924) l!1065) (not (= (_1!12901 (h!38485 l!1065)) key!287))))))

(declare-fun b!1585416 () Bool)

(declare-fun ListPrimitiveSize!208 (List!36928) Int)

(assert (=> b!1585416 (= e!885053 (>= (ListPrimitiveSize!208 (t!51834 l!1065)) (ListPrimitiveSize!208 l!1065)))))

(declare-fun b!1585417 () Bool)

(declare-fun res!1082281 () Bool)

(assert (=> b!1585417 (=> (not res!1082281) (not e!885053))))

(declare-fun isStrictlySorted!1118 (List!36928) Bool)

(assert (=> b!1585417 (= res!1082281 (isStrictlySorted!1118 (t!51834 l!1065)))))

(declare-fun b!1585418 () Bool)

(declare-fun e!885052 () Bool)

(declare-fun tp_is_empty!39361 () Bool)

(declare-fun tp!114876 () Bool)

(assert (=> b!1585418 (= e!885052 (and tp_is_empty!39361 tp!114876))))

(declare-fun res!1082283 () Bool)

(assert (=> start!138224 (=> (not res!1082283) (not e!885053))))

(assert (=> start!138224 (= res!1082283 (isStrictlySorted!1118 l!1065))))

(assert (=> start!138224 e!885053))

(assert (=> start!138224 e!885052))

(assert (=> start!138224 true))

(declare-fun b!1585419 () Bool)

(declare-fun res!1082284 () Bool)

(assert (=> b!1585419 (=> (not res!1082284) (not e!885053))))

(assert (=> b!1585419 (= res!1082284 (containsKey!977 (t!51834 l!1065) key!287))))

(assert (= (and start!138224 res!1082283) b!1585414))

(assert (= (and b!1585414 res!1082282) b!1585415))

(assert (= (and b!1585415 res!1082285) b!1585417))

(assert (= (and b!1585417 res!1082281) b!1585419))

(assert (= (and b!1585419 res!1082284) b!1585416))

(assert (= (and start!138224 ((_ is Cons!36924) l!1065)) b!1585418))

(declare-fun m!1455405 () Bool)

(assert (=> b!1585416 m!1455405))

(declare-fun m!1455407 () Bool)

(assert (=> b!1585416 m!1455407))

(declare-fun m!1455409 () Bool)

(assert (=> start!138224 m!1455409))

(declare-fun m!1455411 () Bool)

(assert (=> b!1585417 m!1455411))

(declare-fun m!1455413 () Bool)

(assert (=> b!1585419 m!1455413))

(declare-fun m!1455415 () Bool)

(assert (=> b!1585414 m!1455415))

(check-sat (not b!1585418) tp_is_empty!39361 (not start!138224) (not b!1585419) (not b!1585417) (not b!1585416) (not b!1585414))
(check-sat)
(get-model)

(declare-fun d!167809 () Bool)

(declare-fun res!1082320 () Bool)

(declare-fun e!885070 () Bool)

(assert (=> d!167809 (=> res!1082320 e!885070)))

(assert (=> d!167809 (= res!1082320 (and ((_ is Cons!36924) (t!51834 l!1065)) (= (_1!12901 (h!38485 (t!51834 l!1065))) key!287)))))

(assert (=> d!167809 (= (containsKey!977 (t!51834 l!1065) key!287) e!885070)))

(declare-fun b!1585460 () Bool)

(declare-fun e!885071 () Bool)

(assert (=> b!1585460 (= e!885070 e!885071)))

(declare-fun res!1082321 () Bool)

(assert (=> b!1585460 (=> (not res!1082321) (not e!885071))))

(assert (=> b!1585460 (= res!1082321 (and (or (not ((_ is Cons!36924) (t!51834 l!1065))) (bvsle (_1!12901 (h!38485 (t!51834 l!1065))) key!287)) ((_ is Cons!36924) (t!51834 l!1065)) (bvslt (_1!12901 (h!38485 (t!51834 l!1065))) key!287)))))

(declare-fun b!1585461 () Bool)

(assert (=> b!1585461 (= e!885071 (containsKey!977 (t!51834 (t!51834 l!1065)) key!287))))

(assert (= (and d!167809 (not res!1082320)) b!1585460))

(assert (= (and b!1585460 res!1082321) b!1585461))

(declare-fun m!1455441 () Bool)

(assert (=> b!1585461 m!1455441))

(assert (=> b!1585419 d!167809))

(declare-fun d!167815 () Bool)

(declare-fun res!1082322 () Bool)

(declare-fun e!885072 () Bool)

(assert (=> d!167815 (=> res!1082322 e!885072)))

(assert (=> d!167815 (= res!1082322 (and ((_ is Cons!36924) l!1065) (= (_1!12901 (h!38485 l!1065)) key!287)))))

(assert (=> d!167815 (= (containsKey!977 l!1065 key!287) e!885072)))

(declare-fun b!1585462 () Bool)

(declare-fun e!885073 () Bool)

(assert (=> b!1585462 (= e!885072 e!885073)))

(declare-fun res!1082323 () Bool)

(assert (=> b!1585462 (=> (not res!1082323) (not e!885073))))

(assert (=> b!1585462 (= res!1082323 (and (or (not ((_ is Cons!36924) l!1065)) (bvsle (_1!12901 (h!38485 l!1065)) key!287)) ((_ is Cons!36924) l!1065) (bvslt (_1!12901 (h!38485 l!1065)) key!287)))))

(declare-fun b!1585463 () Bool)

(assert (=> b!1585463 (= e!885073 (containsKey!977 (t!51834 l!1065) key!287))))

(assert (= (and d!167815 (not res!1082322)) b!1585462))

(assert (= (and b!1585462 res!1082323) b!1585463))

(assert (=> b!1585463 m!1455413))

(assert (=> b!1585414 d!167815))

(declare-fun d!167817 () Bool)

(declare-fun res!1082342 () Bool)

(declare-fun e!885092 () Bool)

(assert (=> d!167817 (=> res!1082342 e!885092)))

(assert (=> d!167817 (= res!1082342 (or ((_ is Nil!36925) l!1065) ((_ is Nil!36925) (t!51834 l!1065))))))

(assert (=> d!167817 (= (isStrictlySorted!1118 l!1065) e!885092)))

(declare-fun b!1585482 () Bool)

(declare-fun e!885093 () Bool)

(assert (=> b!1585482 (= e!885092 e!885093)))

(declare-fun res!1082343 () Bool)

(assert (=> b!1585482 (=> (not res!1082343) (not e!885093))))

(assert (=> b!1585482 (= res!1082343 (bvslt (_1!12901 (h!38485 l!1065)) (_1!12901 (h!38485 (t!51834 l!1065)))))))

(declare-fun b!1585483 () Bool)

(assert (=> b!1585483 (= e!885093 (isStrictlySorted!1118 (t!51834 l!1065)))))

(assert (= (and d!167817 (not res!1082342)) b!1585482))

(assert (= (and b!1585482 res!1082343) b!1585483))

(assert (=> b!1585483 m!1455411))

(assert (=> start!138224 d!167817))

(declare-fun d!167825 () Bool)

(declare-fun res!1082344 () Bool)

(declare-fun e!885096 () Bool)

(assert (=> d!167825 (=> res!1082344 e!885096)))

(assert (=> d!167825 (= res!1082344 (or ((_ is Nil!36925) (t!51834 l!1065)) ((_ is Nil!36925) (t!51834 (t!51834 l!1065)))))))

(assert (=> d!167825 (= (isStrictlySorted!1118 (t!51834 l!1065)) e!885096)))

(declare-fun b!1585488 () Bool)

(declare-fun e!885097 () Bool)

(assert (=> b!1585488 (= e!885096 e!885097)))

(declare-fun res!1082345 () Bool)

(assert (=> b!1585488 (=> (not res!1082345) (not e!885097))))

(assert (=> b!1585488 (= res!1082345 (bvslt (_1!12901 (h!38485 (t!51834 l!1065))) (_1!12901 (h!38485 (t!51834 (t!51834 l!1065))))))))

(declare-fun b!1585489 () Bool)

(assert (=> b!1585489 (= e!885097 (isStrictlySorted!1118 (t!51834 (t!51834 l!1065))))))

(assert (= (and d!167825 (not res!1082344)) b!1585488))

(assert (= (and b!1585488 res!1082345) b!1585489))

(declare-fun m!1455445 () Bool)

(assert (=> b!1585489 m!1455445))

(assert (=> b!1585417 d!167825))

(declare-fun d!167827 () Bool)

(declare-fun lt!678056 () Int)

(assert (=> d!167827 (>= lt!678056 0)))

(declare-fun e!885106 () Int)

(assert (=> d!167827 (= lt!678056 e!885106)))

(declare-fun c!147487 () Bool)

(assert (=> d!167827 (= c!147487 ((_ is Nil!36925) (t!51834 l!1065)))))

(assert (=> d!167827 (= (ListPrimitiveSize!208 (t!51834 l!1065)) lt!678056)))

(declare-fun b!1585506 () Bool)

(assert (=> b!1585506 (= e!885106 0)))

(declare-fun b!1585507 () Bool)

(assert (=> b!1585507 (= e!885106 (+ 1 (ListPrimitiveSize!208 (t!51834 (t!51834 l!1065)))))))

(assert (= (and d!167827 c!147487) b!1585506))

(assert (= (and d!167827 (not c!147487)) b!1585507))

(declare-fun m!1455451 () Bool)

(assert (=> b!1585507 m!1455451))

(assert (=> b!1585416 d!167827))

(declare-fun d!167837 () Bool)

(declare-fun lt!678057 () Int)

(assert (=> d!167837 (>= lt!678057 0)))

(declare-fun e!885107 () Int)

(assert (=> d!167837 (= lt!678057 e!885107)))

(declare-fun c!147488 () Bool)

(assert (=> d!167837 (= c!147488 ((_ is Nil!36925) l!1065))))

(assert (=> d!167837 (= (ListPrimitiveSize!208 l!1065) lt!678057)))

(declare-fun b!1585508 () Bool)

(assert (=> b!1585508 (= e!885107 0)))

(declare-fun b!1585509 () Bool)

(assert (=> b!1585509 (= e!885107 (+ 1 (ListPrimitiveSize!208 (t!51834 l!1065))))))

(assert (= (and d!167837 c!147488) b!1585508))

(assert (= (and d!167837 (not c!147488)) b!1585509))

(assert (=> b!1585509 m!1455405))

(assert (=> b!1585416 d!167837))

(declare-fun b!1585518 () Bool)

(declare-fun e!885114 () Bool)

(declare-fun tp!114885 () Bool)

(assert (=> b!1585518 (= e!885114 (and tp_is_empty!39361 tp!114885))))

(assert (=> b!1585418 (= tp!114876 e!885114)))

(assert (= (and b!1585418 ((_ is Cons!36924) (t!51834 l!1065))) b!1585518))

(check-sat (not b!1585507) tp_is_empty!39361 (not b!1585509) (not b!1585461) (not b!1585489) (not b!1585483) (not b!1585518) (not b!1585463))
(check-sat)
