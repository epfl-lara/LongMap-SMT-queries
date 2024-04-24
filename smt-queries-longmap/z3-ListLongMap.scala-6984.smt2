; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88776 () Bool)

(assert start!88776)

(declare-fun b!1019412 () Bool)

(declare-fun e!573655 () Bool)

(declare-fun tp_is_empty!23677 () Bool)

(declare-fun tp!70973 () Bool)

(assert (=> b!1019412 (= e!573655 (and tp_is_empty!23677 tp!70973))))

(declare-fun b!1019409 () Bool)

(declare-fun res!683229 () Bool)

(declare-fun e!573654 () Bool)

(assert (=> b!1019409 (=> (not res!683229) (not e!573654))))

(declare-datatypes ((B!1610 0))(
  ( (B!1611 (val!11889 Int)) )
))
(declare-datatypes ((tuple2!15328 0))(
  ( (tuple2!15329 (_1!7675 (_ BitVec 64)) (_2!7675 B!1610)) )
))
(declare-datatypes ((List!21566 0))(
  ( (Nil!21563) (Cons!21562 (h!22769 tuple2!15328) (t!30559 List!21566)) )
))
(declare-fun l!1036 () List!21566)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!628 0))(
  ( (Some!627 (v!14478 B!1610)) (None!626) )
))
(declare-fun isDefined!427 (Option!628) Bool)

(declare-fun getValueByKey!577 (List!21566 (_ BitVec 64)) Option!628)

(assert (=> b!1019409 (= res!683229 (isDefined!427 (getValueByKey!577 l!1036 key!271)))))

(declare-fun b!1019410 () Bool)

(declare-fun res!683227 () Bool)

(assert (=> b!1019410 (=> (not res!683227) (not e!573654))))

(get-info :version)

(assert (=> b!1019410 (= res!683227 (or (not ((_ is Cons!21562) l!1036)) (= (_1!7675 (h!22769 l!1036)) key!271)))))

(declare-fun res!683228 () Bool)

(assert (=> start!88776 (=> (not res!683228) (not e!573654))))

(declare-fun isStrictlySorted!636 (List!21566) Bool)

(assert (=> start!88776 (= res!683228 (isStrictlySorted!636 l!1036))))

(assert (=> start!88776 e!573654))

(assert (=> start!88776 e!573655))

(assert (=> start!88776 true))

(declare-fun b!1019411 () Bool)

(declare-fun containsKey!510 (List!21566 (_ BitVec 64)) Bool)

(assert (=> b!1019411 (= e!573654 (not (containsKey!510 l!1036 key!271)))))

(assert (= (and start!88776 res!683228) b!1019409))

(assert (= (and b!1019409 res!683229) b!1019410))

(assert (= (and b!1019410 res!683227) b!1019411))

(assert (= (and start!88776 ((_ is Cons!21562) l!1036)) b!1019412))

(declare-fun m!940779 () Bool)

(assert (=> b!1019409 m!940779))

(assert (=> b!1019409 m!940779))

(declare-fun m!940781 () Bool)

(assert (=> b!1019409 m!940781))

(declare-fun m!940783 () Bool)

(assert (=> start!88776 m!940783))

(declare-fun m!940785 () Bool)

(assert (=> b!1019411 m!940785))

(check-sat tp_is_empty!23677 (not b!1019411) (not b!1019412) (not start!88776) (not b!1019409))
(check-sat)
(get-model)

(declare-fun d!122263 () Bool)

(declare-fun isEmpty!923 (Option!628) Bool)

(assert (=> d!122263 (= (isDefined!427 (getValueByKey!577 l!1036 key!271)) (not (isEmpty!923 (getValueByKey!577 l!1036 key!271))))))

(declare-fun bs!29664 () Bool)

(assert (= bs!29664 d!122263))

(assert (=> bs!29664 m!940779))

(declare-fun m!940803 () Bool)

(assert (=> bs!29664 m!940803))

(assert (=> b!1019409 d!122263))

(declare-fun b!1019446 () Bool)

(declare-fun e!573672 () Option!628)

(declare-fun e!573673 () Option!628)

(assert (=> b!1019446 (= e!573672 e!573673)))

(declare-fun c!103538 () Bool)

(assert (=> b!1019446 (= c!103538 (and ((_ is Cons!21562) l!1036) (not (= (_1!7675 (h!22769 l!1036)) key!271))))))

(declare-fun b!1019447 () Bool)

(assert (=> b!1019447 (= e!573673 (getValueByKey!577 (t!30559 l!1036) key!271))))

(declare-fun b!1019448 () Bool)

(assert (=> b!1019448 (= e!573673 None!626)))

(declare-fun b!1019445 () Bool)

(assert (=> b!1019445 (= e!573672 (Some!627 (_2!7675 (h!22769 l!1036))))))

(declare-fun d!122265 () Bool)

(declare-fun c!103537 () Bool)

(assert (=> d!122265 (= c!103537 (and ((_ is Cons!21562) l!1036) (= (_1!7675 (h!22769 l!1036)) key!271)))))

(assert (=> d!122265 (= (getValueByKey!577 l!1036 key!271) e!573672)))

(assert (= (and d!122265 c!103537) b!1019445))

(assert (= (and d!122265 (not c!103537)) b!1019446))

(assert (= (and b!1019446 c!103538) b!1019447))

(assert (= (and b!1019446 (not c!103538)) b!1019448))

(declare-fun m!940807 () Bool)

(assert (=> b!1019447 m!940807))

(assert (=> b!1019409 d!122265))

(declare-fun d!122273 () Bool)

(declare-fun res!683258 () Bool)

(declare-fun e!573690 () Bool)

(assert (=> d!122273 (=> res!683258 e!573690)))

(assert (=> d!122273 (= res!683258 (or ((_ is Nil!21563) l!1036) ((_ is Nil!21563) (t!30559 l!1036))))))

(assert (=> d!122273 (= (isStrictlySorted!636 l!1036) e!573690)))

(declare-fun b!1019471 () Bool)

(declare-fun e!573691 () Bool)

(assert (=> b!1019471 (= e!573690 e!573691)))

(declare-fun res!683259 () Bool)

(assert (=> b!1019471 (=> (not res!683259) (not e!573691))))

(assert (=> b!1019471 (= res!683259 (bvslt (_1!7675 (h!22769 l!1036)) (_1!7675 (h!22769 (t!30559 l!1036)))))))

(declare-fun b!1019472 () Bool)

(assert (=> b!1019472 (= e!573691 (isStrictlySorted!636 (t!30559 l!1036)))))

(assert (= (and d!122273 (not res!683258)) b!1019471))

(assert (= (and b!1019471 res!683259) b!1019472))

(declare-fun m!940813 () Bool)

(assert (=> b!1019472 m!940813))

(assert (=> start!88776 d!122273))

(declare-fun d!122279 () Bool)

(declare-fun res!683276 () Bool)

(declare-fun e!573708 () Bool)

(assert (=> d!122279 (=> res!683276 e!573708)))

(assert (=> d!122279 (= res!683276 (and ((_ is Cons!21562) l!1036) (= (_1!7675 (h!22769 l!1036)) key!271)))))

(assert (=> d!122279 (= (containsKey!510 l!1036 key!271) e!573708)))

(declare-fun b!1019489 () Bool)

(declare-fun e!573709 () Bool)

(assert (=> b!1019489 (= e!573708 e!573709)))

(declare-fun res!683277 () Bool)

(assert (=> b!1019489 (=> (not res!683277) (not e!573709))))

(assert (=> b!1019489 (= res!683277 (and (or (not ((_ is Cons!21562) l!1036)) (bvsle (_1!7675 (h!22769 l!1036)) key!271)) ((_ is Cons!21562) l!1036) (bvslt (_1!7675 (h!22769 l!1036)) key!271)))))

(declare-fun b!1019490 () Bool)

(assert (=> b!1019490 (= e!573709 (containsKey!510 (t!30559 l!1036) key!271))))

(assert (= (and d!122279 (not res!683276)) b!1019489))

(assert (= (and b!1019489 res!683277) b!1019490))

(declare-fun m!940821 () Bool)

(assert (=> b!1019490 m!940821))

(assert (=> b!1019411 d!122279))

(declare-fun b!1019495 () Bool)

(declare-fun e!573712 () Bool)

(declare-fun tp!70982 () Bool)

(assert (=> b!1019495 (= e!573712 (and tp_is_empty!23677 tp!70982))))

(assert (=> b!1019412 (= tp!70973 e!573712)))

(assert (= (and b!1019412 ((_ is Cons!21562) (t!30559 l!1036))) b!1019495))

(check-sat (not b!1019490) tp_is_empty!23677 (not b!1019472) (not d!122263) (not b!1019447) (not b!1019495))
(check-sat)
(get-model)

(declare-fun d!122287 () Bool)

(declare-fun res!683284 () Bool)

(declare-fun e!573731 () Bool)

(assert (=> d!122287 (=> res!683284 e!573731)))

(assert (=> d!122287 (= res!683284 (or ((_ is Nil!21563) (t!30559 l!1036)) ((_ is Nil!21563) (t!30559 (t!30559 l!1036)))))))

(assert (=> d!122287 (= (isStrictlySorted!636 (t!30559 l!1036)) e!573731)))

(declare-fun b!1019524 () Bool)

(declare-fun e!573732 () Bool)

(assert (=> b!1019524 (= e!573731 e!573732)))

(declare-fun res!683285 () Bool)

(assert (=> b!1019524 (=> (not res!683285) (not e!573732))))

(assert (=> b!1019524 (= res!683285 (bvslt (_1!7675 (h!22769 (t!30559 l!1036))) (_1!7675 (h!22769 (t!30559 (t!30559 l!1036))))))))

(declare-fun b!1019525 () Bool)

(assert (=> b!1019525 (= e!573732 (isStrictlySorted!636 (t!30559 (t!30559 l!1036))))))

(assert (= (and d!122287 (not res!683284)) b!1019524))

(assert (= (and b!1019524 res!683285) b!1019525))

(declare-fun m!940827 () Bool)

(assert (=> b!1019525 m!940827))

(assert (=> b!1019472 d!122287))

(declare-fun b!1019527 () Bool)

(declare-fun e!573733 () Option!628)

(declare-fun e!573734 () Option!628)

(assert (=> b!1019527 (= e!573733 e!573734)))

(declare-fun c!103552 () Bool)

(assert (=> b!1019527 (= c!103552 (and ((_ is Cons!21562) (t!30559 l!1036)) (not (= (_1!7675 (h!22769 (t!30559 l!1036))) key!271))))))

(declare-fun b!1019528 () Bool)

(assert (=> b!1019528 (= e!573734 (getValueByKey!577 (t!30559 (t!30559 l!1036)) key!271))))

(declare-fun b!1019529 () Bool)

(assert (=> b!1019529 (= e!573734 None!626)))

(declare-fun b!1019526 () Bool)

(assert (=> b!1019526 (= e!573733 (Some!627 (_2!7675 (h!22769 (t!30559 l!1036)))))))

(declare-fun d!122289 () Bool)

(declare-fun c!103551 () Bool)

(assert (=> d!122289 (= c!103551 (and ((_ is Cons!21562) (t!30559 l!1036)) (= (_1!7675 (h!22769 (t!30559 l!1036))) key!271)))))

(assert (=> d!122289 (= (getValueByKey!577 (t!30559 l!1036) key!271) e!573733)))

(assert (= (and d!122289 c!103551) b!1019526))

(assert (= (and d!122289 (not c!103551)) b!1019527))

(assert (= (and b!1019527 c!103552) b!1019528))

(assert (= (and b!1019527 (not c!103552)) b!1019529))

(declare-fun m!940829 () Bool)

(assert (=> b!1019528 m!940829))

(assert (=> b!1019447 d!122289))

(declare-fun d!122291 () Bool)

(assert (=> d!122291 (= (isEmpty!923 (getValueByKey!577 l!1036 key!271)) (not ((_ is Some!627) (getValueByKey!577 l!1036 key!271))))))

(assert (=> d!122263 d!122291))

(declare-fun d!122293 () Bool)

(declare-fun res!683286 () Bool)

(declare-fun e!573735 () Bool)

(assert (=> d!122293 (=> res!683286 e!573735)))

(assert (=> d!122293 (= res!683286 (and ((_ is Cons!21562) (t!30559 l!1036)) (= (_1!7675 (h!22769 (t!30559 l!1036))) key!271)))))

(assert (=> d!122293 (= (containsKey!510 (t!30559 l!1036) key!271) e!573735)))

(declare-fun b!1019530 () Bool)

(declare-fun e!573736 () Bool)

(assert (=> b!1019530 (= e!573735 e!573736)))

(declare-fun res!683287 () Bool)

(assert (=> b!1019530 (=> (not res!683287) (not e!573736))))

(assert (=> b!1019530 (= res!683287 (and (or (not ((_ is Cons!21562) (t!30559 l!1036))) (bvsle (_1!7675 (h!22769 (t!30559 l!1036))) key!271)) ((_ is Cons!21562) (t!30559 l!1036)) (bvslt (_1!7675 (h!22769 (t!30559 l!1036))) key!271)))))

(declare-fun b!1019531 () Bool)

(assert (=> b!1019531 (= e!573736 (containsKey!510 (t!30559 (t!30559 l!1036)) key!271))))

(assert (= (and d!122293 (not res!683286)) b!1019530))

(assert (= (and b!1019530 res!683287) b!1019531))

(declare-fun m!940831 () Bool)

(assert (=> b!1019531 m!940831))

(assert (=> b!1019490 d!122293))

(declare-fun b!1019532 () Bool)

(declare-fun e!573737 () Bool)

(declare-fun tp!70989 () Bool)

(assert (=> b!1019532 (= e!573737 (and tp_is_empty!23677 tp!70989))))

(assert (=> b!1019495 (= tp!70982 e!573737)))

(assert (= (and b!1019495 ((_ is Cons!21562) (t!30559 (t!30559 l!1036)))) b!1019532))

(check-sat (not b!1019532) tp_is_empty!23677 (not b!1019528) (not b!1019525) (not b!1019531))
(check-sat)
