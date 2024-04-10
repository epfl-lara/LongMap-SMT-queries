; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88422 () Bool)

(assert start!88422)

(declare-fun res!682450 () Bool)

(declare-fun e!572456 () Bool)

(assert (=> start!88422 (=> (not res!682450) (not e!572456))))

(declare-datatypes ((B!1588 0))(
  ( (B!1589 (val!11878 Int)) )
))
(declare-datatypes ((tuple2!15302 0))(
  ( (tuple2!15303 (_1!7662 (_ BitVec 64)) (_2!7662 B!1588)) )
))
(declare-datatypes ((List!21566 0))(
  ( (Nil!21563) (Cons!21562 (h!22760 tuple2!15302) (t!30567 List!21566)) )
))
(declare-fun l!1036 () List!21566)

(declare-fun isStrictlySorted!637 (List!21566) Bool)

(assert (=> start!88422 (= res!682450 (isStrictlySorted!637 l!1036))))

(assert (=> start!88422 e!572456))

(declare-fun e!572457 () Bool)

(assert (=> start!88422 e!572457))

(assert (=> start!88422 true))

(declare-fun b!1017501 () Bool)

(declare-fun res!682451 () Bool)

(assert (=> b!1017501 (=> (not res!682451) (not e!572456))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!621 0))(
  ( (Some!620 (v!14471 B!1588)) (None!619) )
))
(declare-fun isDefined!417 (Option!621) Bool)

(declare-fun getValueByKey!570 (List!21566 (_ BitVec 64)) Option!621)

(assert (=> b!1017501 (= res!682451 (isDefined!417 (getValueByKey!570 l!1036 key!271)))))

(declare-fun b!1017502 () Bool)

(declare-fun ListPrimitiveSize!128 (List!21566) Int)

(assert (=> b!1017502 (= e!572456 (< (ListPrimitiveSize!128 l!1036) 0))))

(declare-fun b!1017503 () Bool)

(declare-fun tp_is_empty!23655 () Bool)

(declare-fun tp!70903 () Bool)

(assert (=> b!1017503 (= e!572457 (and tp_is_empty!23655 tp!70903))))

(assert (= (and start!88422 res!682450) b!1017501))

(assert (= (and b!1017501 res!682451) b!1017502))

(get-info :version)

(assert (= (and start!88422 ((_ is Cons!21562) l!1036)) b!1017503))

(declare-fun m!938841 () Bool)

(assert (=> start!88422 m!938841))

(declare-fun m!938843 () Bool)

(assert (=> b!1017501 m!938843))

(assert (=> b!1017501 m!938843))

(declare-fun m!938845 () Bool)

(assert (=> b!1017501 m!938845))

(declare-fun m!938847 () Bool)

(assert (=> b!1017502 m!938847))

(check-sat (not b!1017503) (not b!1017502) (not start!88422) tp_is_empty!23655 (not b!1017501))
(check-sat)
(get-model)

(declare-fun d!121631 () Bool)

(declare-fun lt!449460 () Int)

(assert (=> d!121631 (>= lt!449460 0)))

(declare-fun e!572478 () Int)

(assert (=> d!121631 (= lt!449460 e!572478)))

(declare-fun c!103021 () Bool)

(assert (=> d!121631 (= c!103021 ((_ is Nil!21563) l!1036))))

(assert (=> d!121631 (= (ListPrimitiveSize!128 l!1036) lt!449460)))

(declare-fun b!1017541 () Bool)

(assert (=> b!1017541 (= e!572478 0)))

(declare-fun b!1017542 () Bool)

(assert (=> b!1017542 (= e!572478 (+ 1 (ListPrimitiveSize!128 (t!30567 l!1036))))))

(assert (= (and d!121631 c!103021) b!1017541))

(assert (= (and d!121631 (not c!103021)) b!1017542))

(declare-fun m!938865 () Bool)

(assert (=> b!1017542 m!938865))

(assert (=> b!1017502 d!121631))

(declare-fun d!121637 () Bool)

(declare-fun res!682462 () Bool)

(declare-fun e!572488 () Bool)

(assert (=> d!121637 (=> res!682462 e!572488)))

(assert (=> d!121637 (= res!682462 (or ((_ is Nil!21563) l!1036) ((_ is Nil!21563) (t!30567 l!1036))))))

(assert (=> d!121637 (= (isStrictlySorted!637 l!1036) e!572488)))

(declare-fun b!1017557 () Bool)

(declare-fun e!572489 () Bool)

(assert (=> b!1017557 (= e!572488 e!572489)))

(declare-fun res!682463 () Bool)

(assert (=> b!1017557 (=> (not res!682463) (not e!572489))))

(assert (=> b!1017557 (= res!682463 (bvslt (_1!7662 (h!22760 l!1036)) (_1!7662 (h!22760 (t!30567 l!1036)))))))

(declare-fun b!1017558 () Bool)

(assert (=> b!1017558 (= e!572489 (isStrictlySorted!637 (t!30567 l!1036)))))

(assert (= (and d!121637 (not res!682462)) b!1017557))

(assert (= (and b!1017557 res!682463) b!1017558))

(declare-fun m!938869 () Bool)

(assert (=> b!1017558 m!938869))

(assert (=> start!88422 d!121637))

(declare-fun d!121641 () Bool)

(declare-fun isEmpty!909 (Option!621) Bool)

(assert (=> d!121641 (= (isDefined!417 (getValueByKey!570 l!1036 key!271)) (not (isEmpty!909 (getValueByKey!570 l!1036 key!271))))))

(declare-fun bs!29613 () Bool)

(assert (= bs!29613 d!121641))

(assert (=> bs!29613 m!938843))

(declare-fun m!938871 () Bool)

(assert (=> bs!29613 m!938871))

(assert (=> b!1017501 d!121641))

(declare-fun b!1017587 () Bool)

(declare-fun e!572510 () Option!621)

(declare-fun e!572511 () Option!621)

(assert (=> b!1017587 (= e!572510 e!572511)))

(declare-fun c!103033 () Bool)

(assert (=> b!1017587 (= c!103033 (and ((_ is Cons!21562) l!1036) (not (= (_1!7662 (h!22760 l!1036)) key!271))))))

(declare-fun b!1017588 () Bool)

(assert (=> b!1017588 (= e!572511 (getValueByKey!570 (t!30567 l!1036) key!271))))

(declare-fun b!1017586 () Bool)

(assert (=> b!1017586 (= e!572510 (Some!620 (_2!7662 (h!22760 l!1036))))))

(declare-fun b!1017589 () Bool)

(assert (=> b!1017589 (= e!572511 None!619)))

(declare-fun d!121643 () Bool)

(declare-fun c!103032 () Bool)

(assert (=> d!121643 (= c!103032 (and ((_ is Cons!21562) l!1036) (= (_1!7662 (h!22760 l!1036)) key!271)))))

(assert (=> d!121643 (= (getValueByKey!570 l!1036 key!271) e!572510)))

(assert (= (and d!121643 c!103032) b!1017586))

(assert (= (and d!121643 (not c!103032)) b!1017587))

(assert (= (and b!1017587 c!103033) b!1017588))

(assert (= (and b!1017587 (not c!103033)) b!1017589))

(declare-fun m!938879 () Bool)

(assert (=> b!1017588 m!938879))

(assert (=> b!1017501 d!121643))

(declare-fun b!1017599 () Bool)

(declare-fun e!572517 () Bool)

(declare-fun tp!70915 () Bool)

(assert (=> b!1017599 (= e!572517 (and tp_is_empty!23655 tp!70915))))

(assert (=> b!1017503 (= tp!70903 e!572517)))

(assert (= (and b!1017503 ((_ is Cons!21562) (t!30567 l!1036))) b!1017599))

(check-sat (not b!1017542) (not b!1017558) tp_is_empty!23655 (not d!121641) (not b!1017588) (not b!1017599))
(check-sat)
