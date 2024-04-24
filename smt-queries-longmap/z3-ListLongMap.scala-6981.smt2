; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88686 () Bool)

(assert start!88686)

(declare-fun b!1018940 () Bool)

(declare-fun res!683001 () Bool)

(declare-fun e!573378 () Bool)

(assert (=> b!1018940 (=> (not res!683001) (not e!573378))))

(declare-datatypes ((B!1592 0))(
  ( (B!1593 (val!11880 Int)) )
))
(declare-datatypes ((tuple2!15310 0))(
  ( (tuple2!15311 (_1!7666 (_ BitVec 64)) (_2!7666 B!1592)) )
))
(declare-datatypes ((List!21557 0))(
  ( (Nil!21554) (Cons!21553 (h!22760 tuple2!15310) (t!30550 List!21557)) )
))
(declare-fun l!1036 () List!21557)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!619 0))(
  ( (Some!618 (v!14469 B!1592)) (None!617) )
))
(declare-fun isDefined!418 (Option!619) Bool)

(declare-fun getValueByKey!568 (List!21557 (_ BitVec 64)) Option!619)

(assert (=> b!1018940 (= res!683001 (isDefined!418 (getValueByKey!568 l!1036 key!271)))))

(declare-fun b!1018941 () Bool)

(declare-fun e!573377 () Bool)

(declare-fun tp_is_empty!23659 () Bool)

(declare-fun tp!70919 () Bool)

(assert (=> b!1018941 (= e!573377 (and tp_is_empty!23659 tp!70919))))

(declare-fun res!682999 () Bool)

(assert (=> start!88686 (=> (not res!682999) (not e!573378))))

(declare-fun isStrictlySorted!627 (List!21557) Bool)

(assert (=> start!88686 (= res!682999 (isStrictlySorted!627 l!1036))))

(assert (=> start!88686 e!573378))

(assert (=> start!88686 e!573377))

(assert (=> start!88686 true))

(declare-fun b!1018942 () Bool)

(declare-fun res!683000 () Bool)

(assert (=> b!1018942 (=> (not res!683000) (not e!573378))))

(get-info :version)

(assert (=> b!1018942 (= res!683000 (and ((_ is Cons!21553) l!1036) (not (= (_1!7666 (h!22760 l!1036)) key!271))))))

(declare-fun b!1018943 () Bool)

(declare-fun e!573379 () Bool)

(assert (=> b!1018943 (= e!573378 e!573379)))

(declare-fun res!682998 () Bool)

(assert (=> b!1018943 (=> res!682998 e!573379)))

(assert (=> b!1018943 (= res!682998 (not (isStrictlySorted!627 (t!30550 l!1036))))))

(declare-fun b!1018944 () Bool)

(assert (=> b!1018944 (= e!573379 (not (isDefined!418 (getValueByKey!568 (t!30550 l!1036) key!271))))))

(assert (= (and start!88686 res!682999) b!1018940))

(assert (= (and b!1018940 res!683001) b!1018942))

(assert (= (and b!1018942 res!683000) b!1018943))

(assert (= (and b!1018943 (not res!682998)) b!1018944))

(assert (= (and start!88686 ((_ is Cons!21553) l!1036)) b!1018941))

(declare-fun m!940551 () Bool)

(assert (=> b!1018940 m!940551))

(assert (=> b!1018940 m!940551))

(declare-fun m!940553 () Bool)

(assert (=> b!1018940 m!940553))

(declare-fun m!940555 () Bool)

(assert (=> start!88686 m!940555))

(declare-fun m!940557 () Bool)

(assert (=> b!1018943 m!940557))

(declare-fun m!940559 () Bool)

(assert (=> b!1018944 m!940559))

(assert (=> b!1018944 m!940559))

(declare-fun m!940561 () Bool)

(assert (=> b!1018944 m!940561))

(check-sat (not b!1018940) (not b!1018944) tp_is_empty!23659 (not b!1018943) (not start!88686) (not b!1018941))
(check-sat)
(get-model)

(declare-fun d!122119 () Bool)

(declare-fun res!683030 () Bool)

(declare-fun e!573402 () Bool)

(assert (=> d!122119 (=> res!683030 e!573402)))

(assert (=> d!122119 (= res!683030 (or ((_ is Nil!21554) (t!30550 l!1036)) ((_ is Nil!21554) (t!30550 (t!30550 l!1036)))))))

(assert (=> d!122119 (= (isStrictlySorted!627 (t!30550 l!1036)) e!573402)))

(declare-fun b!1018979 () Bool)

(declare-fun e!573403 () Bool)

(assert (=> b!1018979 (= e!573402 e!573403)))

(declare-fun res!683031 () Bool)

(assert (=> b!1018979 (=> (not res!683031) (not e!573403))))

(assert (=> b!1018979 (= res!683031 (bvslt (_1!7666 (h!22760 (t!30550 l!1036))) (_1!7666 (h!22760 (t!30550 (t!30550 l!1036))))))))

(declare-fun b!1018980 () Bool)

(assert (=> b!1018980 (= e!573403 (isStrictlySorted!627 (t!30550 (t!30550 l!1036))))))

(assert (= (and d!122119 (not res!683030)) b!1018979))

(assert (= (and b!1018979 res!683031) b!1018980))

(declare-fun m!940587 () Bool)

(assert (=> b!1018980 m!940587))

(assert (=> b!1018943 d!122119))

(declare-fun d!122121 () Bool)

(declare-fun isEmpty!915 (Option!619) Bool)

(assert (=> d!122121 (= (isDefined!418 (getValueByKey!568 (t!30550 l!1036) key!271)) (not (isEmpty!915 (getValueByKey!568 (t!30550 l!1036) key!271))))))

(declare-fun bs!29637 () Bool)

(assert (= bs!29637 d!122121))

(assert (=> bs!29637 m!940559))

(declare-fun m!940589 () Bool)

(assert (=> bs!29637 m!940589))

(assert (=> b!1018944 d!122121))

(declare-fun b!1019000 () Bool)

(declare-fun e!573413 () Option!619)

(assert (=> b!1019000 (= e!573413 None!617)))

(declare-fun b!1018997 () Bool)

(declare-fun e!573412 () Option!619)

(assert (=> b!1018997 (= e!573412 (Some!618 (_2!7666 (h!22760 (t!30550 l!1036)))))))

(declare-fun b!1018998 () Bool)

(assert (=> b!1018998 (= e!573412 e!573413)))

(declare-fun c!103458 () Bool)

(assert (=> b!1018998 (= c!103458 (and ((_ is Cons!21553) (t!30550 l!1036)) (not (= (_1!7666 (h!22760 (t!30550 l!1036))) key!271))))))

(declare-fun b!1018999 () Bool)

(assert (=> b!1018999 (= e!573413 (getValueByKey!568 (t!30550 (t!30550 l!1036)) key!271))))

(declare-fun d!122125 () Bool)

(declare-fun c!103457 () Bool)

(assert (=> d!122125 (= c!103457 (and ((_ is Cons!21553) (t!30550 l!1036)) (= (_1!7666 (h!22760 (t!30550 l!1036))) key!271)))))

(assert (=> d!122125 (= (getValueByKey!568 (t!30550 l!1036) key!271) e!573412)))

(assert (= (and d!122125 c!103457) b!1018997))

(assert (= (and d!122125 (not c!103457)) b!1018998))

(assert (= (and b!1018998 c!103458) b!1018999))

(assert (= (and b!1018998 (not c!103458)) b!1019000))

(declare-fun m!940595 () Bool)

(assert (=> b!1018999 m!940595))

(assert (=> b!1018944 d!122125))

(declare-fun d!122133 () Bool)

(declare-fun res!683032 () Bool)

(declare-fun e!573418 () Bool)

(assert (=> d!122133 (=> res!683032 e!573418)))

(assert (=> d!122133 (= res!683032 (or ((_ is Nil!21554) l!1036) ((_ is Nil!21554) (t!30550 l!1036))))))

(assert (=> d!122133 (= (isStrictlySorted!627 l!1036) e!573418)))

(declare-fun b!1019012 () Bool)

(declare-fun e!573419 () Bool)

(assert (=> b!1019012 (= e!573418 e!573419)))

(declare-fun res!683033 () Bool)

(assert (=> b!1019012 (=> (not res!683033) (not e!573419))))

(assert (=> b!1019012 (= res!683033 (bvslt (_1!7666 (h!22760 l!1036)) (_1!7666 (h!22760 (t!30550 l!1036)))))))

(declare-fun b!1019014 () Bool)

(assert (=> b!1019014 (= e!573419 (isStrictlySorted!627 (t!30550 l!1036)))))

(assert (= (and d!122133 (not res!683032)) b!1019012))

(assert (= (and b!1019012 res!683033) b!1019014))

(assert (=> b!1019014 m!940557))

(assert (=> start!88686 d!122133))

(declare-fun d!122135 () Bool)

(assert (=> d!122135 (= (isDefined!418 (getValueByKey!568 l!1036 key!271)) (not (isEmpty!915 (getValueByKey!568 l!1036 key!271))))))

(declare-fun bs!29640 () Bool)

(assert (= bs!29640 d!122135))

(assert (=> bs!29640 m!940551))

(declare-fun m!940597 () Bool)

(assert (=> bs!29640 m!940597))

(assert (=> b!1018940 d!122135))

(declare-fun b!1019018 () Bool)

(declare-fun e!573423 () Option!619)

(assert (=> b!1019018 (= e!573423 None!617)))

(declare-fun b!1019015 () Bool)

(declare-fun e!573422 () Option!619)

(assert (=> b!1019015 (= e!573422 (Some!618 (_2!7666 (h!22760 l!1036))))))

(declare-fun b!1019016 () Bool)

(assert (=> b!1019016 (= e!573422 e!573423)))

(declare-fun c!103466 () Bool)

(assert (=> b!1019016 (= c!103466 (and ((_ is Cons!21553) l!1036) (not (= (_1!7666 (h!22760 l!1036)) key!271))))))

(declare-fun b!1019017 () Bool)

(assert (=> b!1019017 (= e!573423 (getValueByKey!568 (t!30550 l!1036) key!271))))

(declare-fun d!122139 () Bool)

(declare-fun c!103465 () Bool)

(assert (=> d!122139 (= c!103465 (and ((_ is Cons!21553) l!1036) (= (_1!7666 (h!22760 l!1036)) key!271)))))

(assert (=> d!122139 (= (getValueByKey!568 l!1036 key!271) e!573422)))

(assert (= (and d!122139 c!103465) b!1019015))

(assert (= (and d!122139 (not c!103465)) b!1019016))

(assert (= (and b!1019016 c!103466) b!1019017))

(assert (= (and b!1019016 (not c!103466)) b!1019018))

(assert (=> b!1019017 m!940559))

(assert (=> b!1018940 d!122139))

(declare-fun b!1019023 () Bool)

(declare-fun e!573426 () Bool)

(declare-fun tp!70928 () Bool)

(assert (=> b!1019023 (= e!573426 (and tp_is_empty!23659 tp!70928))))

(assert (=> b!1018941 (= tp!70919 e!573426)))

(assert (= (and b!1018941 ((_ is Cons!21553) (t!30550 l!1036))) b!1019023))

(check-sat (not b!1019017) (not b!1019023) (not b!1018980) (not b!1019014) (not b!1018999) (not d!122121) (not d!122135) tp_is_empty!23659)
(check-sat)
