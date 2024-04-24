; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88744 () Bool)

(assert start!88744)

(declare-fun res!683162 () Bool)

(declare-fun e!573558 () Bool)

(assert (=> start!88744 (=> (not res!683162) (not e!573558))))

(declare-datatypes ((B!1608 0))(
  ( (B!1609 (val!11888 Int)) )
))
(declare-datatypes ((tuple2!15326 0))(
  ( (tuple2!15327 (_1!7674 (_ BitVec 64)) (_2!7674 B!1608)) )
))
(declare-datatypes ((List!21565 0))(
  ( (Nil!21562) (Cons!21561 (h!22768 tuple2!15326) (t!30558 List!21565)) )
))
(declare-fun l!1036 () List!21565)

(declare-fun isStrictlySorted!635 (List!21565) Bool)

(assert (=> start!88744 (= res!683162 (isStrictlySorted!635 l!1036))))

(assert (=> start!88744 e!573558))

(declare-fun e!573559 () Bool)

(assert (=> start!88744 e!573559))

(assert (=> start!88744 true))

(declare-fun b!1019275 () Bool)

(declare-fun res!683163 () Bool)

(assert (=> b!1019275 (=> (not res!683163) (not e!573558))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!627 0))(
  ( (Some!626 (v!14477 B!1608)) (None!625) )
))
(declare-fun isDefined!426 (Option!627) Bool)

(declare-fun getValueByKey!576 (List!21565 (_ BitVec 64)) Option!627)

(assert (=> b!1019275 (= res!683163 (isDefined!426 (getValueByKey!576 (t!30558 l!1036) key!271)))))

(declare-fun b!1019276 () Bool)

(declare-fun res!683159 () Bool)

(assert (=> b!1019276 (=> (not res!683159) (not e!573558))))

(assert (=> b!1019276 (= res!683159 (and (is-Cons!21561 l!1036) (not (= (_1!7674 (h!22768 l!1036)) key!271))))))

(declare-fun b!1019277 () Bool)

(declare-fun res!683161 () Bool)

(assert (=> b!1019277 (=> (not res!683161) (not e!573558))))

(assert (=> b!1019277 (= res!683161 (isDefined!426 (getValueByKey!576 l!1036 key!271)))))

(declare-fun b!1019278 () Bool)

(declare-fun tp_is_empty!23675 () Bool)

(declare-fun tp!70961 () Bool)

(assert (=> b!1019278 (= e!573559 (and tp_is_empty!23675 tp!70961))))

(declare-fun b!1019279 () Bool)

(declare-fun containsKey!509 (List!21565 (_ BitVec 64)) Bool)

(assert (=> b!1019279 (= e!573558 (not (containsKey!509 l!1036 key!271)))))

(assert (=> b!1019279 (containsKey!509 (t!30558 l!1036) key!271)))

(declare-datatypes ((Unit!33280 0))(
  ( (Unit!33281) )
))
(declare-fun lt!450002 () Unit!33280)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (List!21565 (_ BitVec 64)) Unit!33280)

(assert (=> b!1019279 (= lt!450002 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (t!30558 l!1036) key!271))))

(declare-fun b!1019280 () Bool)

(declare-fun res!683160 () Bool)

(assert (=> b!1019280 (=> (not res!683160) (not e!573558))))

(assert (=> b!1019280 (= res!683160 (isStrictlySorted!635 (t!30558 l!1036)))))

(assert (= (and start!88744 res!683162) b!1019277))

(assert (= (and b!1019277 res!683161) b!1019276))

(assert (= (and b!1019276 res!683159) b!1019280))

(assert (= (and b!1019280 res!683160) b!1019275))

(assert (= (and b!1019275 res!683163) b!1019279))

(assert (= (and start!88744 (is-Cons!21561 l!1036)) b!1019278))

(declare-fun m!940725 () Bool)

(assert (=> start!88744 m!940725))

(declare-fun m!940727 () Bool)

(assert (=> b!1019277 m!940727))

(assert (=> b!1019277 m!940727))

(declare-fun m!940729 () Bool)

(assert (=> b!1019277 m!940729))

(declare-fun m!940731 () Bool)

(assert (=> b!1019275 m!940731))

(assert (=> b!1019275 m!940731))

(declare-fun m!940733 () Bool)

(assert (=> b!1019275 m!940733))

(declare-fun m!940735 () Bool)

(assert (=> b!1019279 m!940735))

(declare-fun m!940737 () Bool)

(assert (=> b!1019279 m!940737))

(declare-fun m!940739 () Bool)

(assert (=> b!1019279 m!940739))

(declare-fun m!940741 () Bool)

(assert (=> b!1019280 m!940741))

(push 1)

(assert tp_is_empty!23675)

(assert (not b!1019277))

(assert (not b!1019278))

(assert (not b!1019279))

(assert (not start!88744))

(assert (not b!1019280))

(assert (not b!1019275))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122211 () Bool)

(declare-fun res!683184 () Bool)

(declare-fun e!573580 () Bool)

(assert (=> d!122211 (=> res!683184 e!573580)))

(assert (=> d!122211 (= res!683184 (and (is-Cons!21561 l!1036) (= (_1!7674 (h!22768 l!1036)) key!271)))))

(assert (=> d!122211 (= (containsKey!509 l!1036 key!271) e!573580)))

(declare-fun b!1019301 () Bool)

(declare-fun e!573581 () Bool)

(assert (=> b!1019301 (= e!573580 e!573581)))

(declare-fun res!683185 () Bool)

(assert (=> b!1019301 (=> (not res!683185) (not e!573581))))

(assert (=> b!1019301 (= res!683185 (and (or (not (is-Cons!21561 l!1036)) (bvsle (_1!7674 (h!22768 l!1036)) key!271)) (is-Cons!21561 l!1036) (bvslt (_1!7674 (h!22768 l!1036)) key!271)))))

(declare-fun b!1019302 () Bool)

(assert (=> b!1019302 (= e!573581 (containsKey!509 (t!30558 l!1036) key!271))))

(assert (= (and d!122211 (not res!683184)) b!1019301))

(assert (= (and b!1019301 res!683185) b!1019302))

(assert (=> b!1019302 m!940737))

(assert (=> b!1019279 d!122211))

(declare-fun d!122217 () Bool)

(declare-fun res!683188 () Bool)

(declare-fun e!573584 () Bool)

(assert (=> d!122217 (=> res!683188 e!573584)))

(assert (=> d!122217 (= res!683188 (and (is-Cons!21561 (t!30558 l!1036)) (= (_1!7674 (h!22768 (t!30558 l!1036))) key!271)))))

(assert (=> d!122217 (= (containsKey!509 (t!30558 l!1036) key!271) e!573584)))

(declare-fun b!1019305 () Bool)

(declare-fun e!573585 () Bool)

(assert (=> b!1019305 (= e!573584 e!573585)))

(declare-fun res!683189 () Bool)

(assert (=> b!1019305 (=> (not res!683189) (not e!573585))))

(assert (=> b!1019305 (= res!683189 (and (or (not (is-Cons!21561 (t!30558 l!1036))) (bvsle (_1!7674 (h!22768 (t!30558 l!1036))) key!271)) (is-Cons!21561 (t!30558 l!1036)) (bvslt (_1!7674 (h!22768 (t!30558 l!1036))) key!271)))))

(declare-fun b!1019306 () Bool)

(assert (=> b!1019306 (= e!573585 (containsKey!509 (t!30558 (t!30558 l!1036)) key!271))))

(assert (= (and d!122217 (not res!683188)) b!1019305))

(assert (= (and b!1019305 res!683189) b!1019306))

(declare-fun m!940747 () Bool)

(assert (=> b!1019306 m!940747))

(assert (=> b!1019279 d!122217))

(declare-fun d!122221 () Bool)

(assert (=> d!122221 (containsKey!509 (t!30558 l!1036) key!271)))

(declare-fun lt!450008 () Unit!33280)

(declare-fun choose!1676 (List!21565 (_ BitVec 64)) Unit!33280)

(assert (=> d!122221 (= lt!450008 (choose!1676 (t!30558 l!1036) key!271))))

(declare-fun e!573597 () Bool)

(assert (=> d!122221 e!573597))

(declare-fun res!683201 () Bool)

(assert (=> d!122221 (=> (not res!683201) (not e!573597))))

(assert (=> d!122221 (= res!683201 (isStrictlySorted!635 (t!30558 l!1036)))))

(assert (=> d!122221 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (t!30558 l!1036) key!271) lt!450008)))

(declare-fun b!1019316 () Bool)

(assert (=> b!1019316 (= e!573597 (isDefined!426 (getValueByKey!576 (t!30558 l!1036) key!271)))))

(assert (= (and d!122221 res!683201) b!1019316))

(assert (=> d!122221 m!940737))

(declare-fun m!940753 () Bool)

(assert (=> d!122221 m!940753))

(assert (=> d!122221 m!940741))

(assert (=> b!1019316 m!940731))

(assert (=> b!1019316 m!940731))

(assert (=> b!1019316 m!940733))

(assert (=> b!1019279 d!122221))

(declare-fun d!122229 () Bool)

(declare-fun isEmpty!920 (Option!627) Bool)

(assert (=> d!122229 (= (isDefined!426 (getValueByKey!576 (t!30558 l!1036) key!271)) (not (isEmpty!920 (getValueByKey!576 (t!30558 l!1036) key!271))))))

(declare-fun bs!29655 () Bool)

(assert (= bs!29655 d!122229))

(assert (=> bs!29655 m!940731))

(declare-fun m!940755 () Bool)

(assert (=> bs!29655 m!940755))

(assert (=> b!1019275 d!122229))

(declare-fun b!1019345 () Bool)

(declare-fun e!573615 () Option!627)

(declare-fun e!573616 () Option!627)

(assert (=> b!1019345 (= e!573615 e!573616)))

(declare-fun c!103518 () Bool)

(assert (=> b!1019345 (= c!103518 (and (is-Cons!21561 (t!30558 l!1036)) (not (= (_1!7674 (h!22768 (t!30558 l!1036))) key!271))))))

(declare-fun b!1019346 () Bool)

(assert (=> b!1019346 (= e!573616 (getValueByKey!576 (t!30558 (t!30558 l!1036)) key!271))))

(declare-fun d!122231 () Bool)

(declare-fun c!103517 () Bool)

(assert (=> d!122231 (= c!103517 (and (is-Cons!21561 (t!30558 l!1036)) (= (_1!7674 (h!22768 (t!30558 l!1036))) key!271)))))

(assert (=> d!122231 (= (getValueByKey!576 (t!30558 l!1036) key!271) e!573615)))

(declare-fun b!1019344 () Bool)

(assert (=> b!1019344 (= e!573615 (Some!626 (_2!7674 (h!22768 (t!30558 l!1036)))))))

(declare-fun b!1019347 () Bool)

(assert (=> b!1019347 (= e!573616 None!625)))

(assert (= (and d!122231 c!103517) b!1019344))

(assert (= (and d!122231 (not c!103517)) b!1019345))

(assert (= (and b!1019345 c!103518) b!1019346))

(assert (= (and b!1019345 (not c!103518)) b!1019347))

(declare-fun m!940765 () Bool)

(assert (=> b!1019346 m!940765))

(assert (=> b!1019275 d!122231))

(declare-fun d!122243 () Bool)

(declare-fun res!683217 () Bool)

(declare-fun e!573635 () Bool)

(assert (=> d!122243 (=> res!683217 e!573635)))

(assert (=> d!122243 (= res!683217 (or (is-Nil!21562 (t!30558 l!1036)) (is-Nil!21562 (t!30558 (t!30558 l!1036)))))))

(assert (=> d!122243 (= (isStrictlySorted!635 (t!30558 l!1036)) e!573635)))

(declare-fun b!1019378 () Bool)

(declare-fun e!573636 () Bool)

(assert (=> b!1019378 (= e!573635 e!573636)))

(declare-fun res!683218 () Bool)

(assert (=> b!1019378 (=> (not res!683218) (not e!573636))))

(assert (=> b!1019378 (= res!683218 (bvslt (_1!7674 (h!22768 (t!30558 l!1036))) (_1!7674 (h!22768 (t!30558 (t!30558 l!1036))))))))

(declare-fun b!1019379 () Bool)

(assert (=> b!1019379 (= e!573636 (isStrictlySorted!635 (t!30558 (t!30558 l!1036))))))

(assert (= (and d!122243 (not res!683217)) b!1019378))

(assert (= (and b!1019378 res!683218) b!1019379))

(declare-fun m!940773 () Bool)

(assert (=> b!1019379 m!940773))

(assert (=> b!1019280 d!122243))

(declare-fun d!122253 () Bool)

(declare-fun res!683219 () Bool)

(declare-fun e!573638 () Bool)

(assert (=> d!122253 (=> res!683219 e!573638)))

(assert (=> d!122253 (= res!683219 (or (is-Nil!21562 l!1036) (is-Nil!21562 (t!30558 l!1036))))))

(assert (=> d!122253 (= (isStrictlySorted!635 l!1036) e!573638)))

(declare-fun b!1019381 () Bool)

(declare-fun e!573639 () Bool)

(assert (=> b!1019381 (= e!573638 e!573639)))

(declare-fun res!683220 () Bool)

(assert (=> b!1019381 (=> (not res!683220) (not e!573639))))

(assert (=> b!1019381 (= res!683220 (bvslt (_1!7674 (h!22768 l!1036)) (_1!7674 (h!22768 (t!30558 l!1036)))))))

(declare-fun b!1019382 () Bool)

(assert (=> b!1019382 (= e!573639 (isStrictlySorted!635 (t!30558 l!1036)))))

(assert (= (and d!122253 (not res!683219)) b!1019381))

(assert (= (and b!1019381 res!683220) b!1019382))

(assert (=> b!1019382 m!940741))

(assert (=> start!88744 d!122253))

(declare-fun d!122257 () Bool)

(assert (=> d!122257 (= (isDefined!426 (getValueByKey!576 l!1036 key!271)) (not (isEmpty!920 (getValueByKey!576 l!1036 key!271))))))

(declare-fun bs!29660 () Bool)

(assert (= bs!29660 d!122257))

(assert (=> bs!29660 m!940727))

(declare-fun m!940777 () Bool)

(assert (=> bs!29660 m!940777))

(assert (=> b!1019277 d!122257))

(declare-fun b!1019388 () Bool)

(declare-fun e!573642 () Option!627)

(declare-fun e!573643 () Option!627)

(assert (=> b!1019388 (= e!573642 e!573643)))

(declare-fun c!103532 () Bool)

(assert (=> b!1019388 (= c!103532 (and (is-Cons!21561 l!1036) (not (= (_1!7674 (h!22768 l!1036)) key!271))))))

(declare-fun b!1019389 () Bool)

(assert (=> b!1019389 (= e!573643 (getValueByKey!576 (t!30558 l!1036) key!271))))

(declare-fun d!122259 () Bool)

(declare-fun c!103531 () Bool)

(assert (=> d!122259 (= c!103531 (and (is-Cons!21561 l!1036) (= (_1!7674 (h!22768 l!1036)) key!271)))))

(assert (=> d!122259 (= (getValueByKey!576 l!1036 key!271) e!573642)))

(declare-fun b!1019387 () Bool)

(assert (=> b!1019387 (= e!573642 (Some!626 (_2!7674 (h!22768 l!1036))))))

(declare-fun b!1019390 () Bool)

(assert (=> b!1019390 (= e!573643 None!625)))

(assert (= (and d!122259 c!103531) b!1019387))

(assert (= (and d!122259 (not c!103531)) b!1019388))

(assert (= (and b!1019388 c!103532) b!1019389))

(assert (= (and b!1019388 (not c!103532)) b!1019390))

(assert (=> b!1019389 m!940731))

(assert (=> b!1019277 d!122259))

(declare-fun b!1019400 () Bool)

(declare-fun e!573649 () Bool)

(declare-fun tp!70970 () Bool)

(assert (=> b!1019400 (= e!573649 (and tp_is_empty!23675 tp!70970))))

(assert (=> b!1019278 (= tp!70961 e!573649)))

(assert (= (and b!1019278 (is-Cons!21561 (t!30558 l!1036))) b!1019400))

(push 1)

(assert (not d!122221))

(assert (not b!1019316))

(assert (not b!1019302))

(assert (not b!1019389))

(assert (not b!1019379))

(assert (not b!1019346))

(assert (not d!122257))

(assert (not b!1019306))

(assert tp_is_empty!23675)

(assert (not b!1019382))

(assert (not b!1019400))

(assert (not d!122229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

