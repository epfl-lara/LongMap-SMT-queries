; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88452 () Bool)

(assert start!88452)

(declare-fun b!1017625 () Bool)

(declare-fun e!572534 () Bool)

(declare-fun e!572535 () Bool)

(assert (=> b!1017625 (= e!572534 e!572535)))

(declare-fun res!682496 () Bool)

(assert (=> b!1017625 (=> res!682496 e!572535)))

(declare-datatypes ((B!1594 0))(
  ( (B!1595 (val!11881 Int)) )
))
(declare-datatypes ((tuple2!15308 0))(
  ( (tuple2!15309 (_1!7665 (_ BitVec 64)) (_2!7665 B!1594)) )
))
(declare-datatypes ((List!21569 0))(
  ( (Nil!21566) (Cons!21565 (h!22763 tuple2!15308) (t!30570 List!21569)) )
))
(declare-fun l!1036 () List!21569)

(declare-fun isStrictlySorted!640 (List!21569) Bool)

(assert (=> b!1017625 (= res!682496 (not (isStrictlySorted!640 (t!30570 l!1036))))))

(declare-fun b!1017626 () Bool)

(declare-fun e!572533 () Bool)

(declare-fun tp_is_empty!23661 () Bool)

(declare-fun tp!70921 () Bool)

(assert (=> b!1017626 (= e!572533 (and tp_is_empty!23661 tp!70921))))

(declare-fun b!1017627 () Bool)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!624 0))(
  ( (Some!623 (v!14474 B!1594)) (None!622) )
))
(declare-fun isDefined!420 (Option!624) Bool)

(declare-fun getValueByKey!573 (List!21569 (_ BitVec 64)) Option!624)

(assert (=> b!1017627 (= e!572535 (not (isDefined!420 (getValueByKey!573 (t!30570 l!1036) key!271))))))

(declare-fun b!1017628 () Bool)

(declare-fun res!682499 () Bool)

(assert (=> b!1017628 (=> (not res!682499) (not e!572534))))

(get-info :version)

(assert (=> b!1017628 (= res!682499 (and ((_ is Cons!21565) l!1036) (not (= (_1!7665 (h!22763 l!1036)) key!271))))))

(declare-fun res!682498 () Bool)

(assert (=> start!88452 (=> (not res!682498) (not e!572534))))

(assert (=> start!88452 (= res!682498 (isStrictlySorted!640 l!1036))))

(assert (=> start!88452 e!572534))

(assert (=> start!88452 e!572533))

(assert (=> start!88452 true))

(declare-fun b!1017629 () Bool)

(declare-fun res!682497 () Bool)

(assert (=> b!1017629 (=> (not res!682497) (not e!572534))))

(assert (=> b!1017629 (= res!682497 (isDefined!420 (getValueByKey!573 l!1036 key!271)))))

(assert (= (and start!88452 res!682498) b!1017629))

(assert (= (and b!1017629 res!682497) b!1017628))

(assert (= (and b!1017628 res!682499) b!1017625))

(assert (= (and b!1017625 (not res!682496)) b!1017627))

(assert (= (and start!88452 ((_ is Cons!21565) l!1036)) b!1017626))

(declare-fun m!938893 () Bool)

(assert (=> b!1017625 m!938893))

(declare-fun m!938895 () Bool)

(assert (=> b!1017627 m!938895))

(assert (=> b!1017627 m!938895))

(declare-fun m!938897 () Bool)

(assert (=> b!1017627 m!938897))

(declare-fun m!938899 () Bool)

(assert (=> start!88452 m!938899))

(declare-fun m!938901 () Bool)

(assert (=> b!1017629 m!938901))

(assert (=> b!1017629 m!938901))

(declare-fun m!938903 () Bool)

(assert (=> b!1017629 m!938903))

(check-sat (not start!88452) tp_is_empty!23661 (not b!1017629) (not b!1017625) (not b!1017626) (not b!1017627))
(check-sat)
(get-model)

(declare-fun d!121649 () Bool)

(declare-fun res!682520 () Bool)

(declare-fun e!572553 () Bool)

(assert (=> d!121649 (=> res!682520 e!572553)))

(assert (=> d!121649 (= res!682520 (or ((_ is Nil!21566) l!1036) ((_ is Nil!21566) (t!30570 l!1036))))))

(assert (=> d!121649 (= (isStrictlySorted!640 l!1036) e!572553)))

(declare-fun b!1017653 () Bool)

(declare-fun e!572554 () Bool)

(assert (=> b!1017653 (= e!572553 e!572554)))

(declare-fun res!682521 () Bool)

(assert (=> b!1017653 (=> (not res!682521) (not e!572554))))

(assert (=> b!1017653 (= res!682521 (bvslt (_1!7665 (h!22763 l!1036)) (_1!7665 (h!22763 (t!30570 l!1036)))))))

(declare-fun b!1017654 () Bool)

(assert (=> b!1017654 (= e!572554 (isStrictlySorted!640 (t!30570 l!1036)))))

(assert (= (and d!121649 (not res!682520)) b!1017653))

(assert (= (and b!1017653 res!682521) b!1017654))

(assert (=> b!1017654 m!938893))

(assert (=> start!88452 d!121649))

(declare-fun d!121653 () Bool)

(declare-fun res!682524 () Bool)

(declare-fun e!572557 () Bool)

(assert (=> d!121653 (=> res!682524 e!572557)))

(assert (=> d!121653 (= res!682524 (or ((_ is Nil!21566) (t!30570 l!1036)) ((_ is Nil!21566) (t!30570 (t!30570 l!1036)))))))

(assert (=> d!121653 (= (isStrictlySorted!640 (t!30570 l!1036)) e!572557)))

(declare-fun b!1017657 () Bool)

(declare-fun e!572558 () Bool)

(assert (=> b!1017657 (= e!572557 e!572558)))

(declare-fun res!682525 () Bool)

(assert (=> b!1017657 (=> (not res!682525) (not e!572558))))

(assert (=> b!1017657 (= res!682525 (bvslt (_1!7665 (h!22763 (t!30570 l!1036))) (_1!7665 (h!22763 (t!30570 (t!30570 l!1036))))))))

(declare-fun b!1017658 () Bool)

(assert (=> b!1017658 (= e!572558 (isStrictlySorted!640 (t!30570 (t!30570 l!1036))))))

(assert (= (and d!121653 (not res!682524)) b!1017657))

(assert (= (and b!1017657 res!682525) b!1017658))

(declare-fun m!938917 () Bool)

(assert (=> b!1017658 m!938917))

(assert (=> b!1017625 d!121653))

(declare-fun d!121659 () Bool)

(declare-fun isEmpty!911 (Option!624) Bool)

(assert (=> d!121659 (= (isDefined!420 (getValueByKey!573 (t!30570 l!1036) key!271)) (not (isEmpty!911 (getValueByKey!573 (t!30570 l!1036) key!271))))))

(declare-fun bs!29618 () Bool)

(assert (= bs!29618 d!121659))

(assert (=> bs!29618 m!938895))

(declare-fun m!938921 () Bool)

(assert (=> bs!29618 m!938921))

(assert (=> b!1017627 d!121659))

(declare-fun b!1017692 () Bool)

(declare-fun e!572579 () Option!624)

(declare-fun e!572580 () Option!624)

(assert (=> b!1017692 (= e!572579 e!572580)))

(declare-fun c!103047 () Bool)

(assert (=> b!1017692 (= c!103047 (and ((_ is Cons!21565) (t!30570 l!1036)) (not (= (_1!7665 (h!22763 (t!30570 l!1036))) key!271))))))

(declare-fun b!1017691 () Bool)

(assert (=> b!1017691 (= e!572579 (Some!623 (_2!7665 (h!22763 (t!30570 l!1036)))))))

(declare-fun b!1017694 () Bool)

(assert (=> b!1017694 (= e!572580 None!622)))

(declare-fun d!121663 () Bool)

(declare-fun c!103046 () Bool)

(assert (=> d!121663 (= c!103046 (and ((_ is Cons!21565) (t!30570 l!1036)) (= (_1!7665 (h!22763 (t!30570 l!1036))) key!271)))))

(assert (=> d!121663 (= (getValueByKey!573 (t!30570 l!1036) key!271) e!572579)))

(declare-fun b!1017693 () Bool)

(assert (=> b!1017693 (= e!572580 (getValueByKey!573 (t!30570 (t!30570 l!1036)) key!271))))

(assert (= (and d!121663 c!103046) b!1017691))

(assert (= (and d!121663 (not c!103046)) b!1017692))

(assert (= (and b!1017692 c!103047) b!1017693))

(assert (= (and b!1017692 (not c!103047)) b!1017694))

(declare-fun m!938931 () Bool)

(assert (=> b!1017693 m!938931))

(assert (=> b!1017627 d!121663))

(declare-fun d!121677 () Bool)

(assert (=> d!121677 (= (isDefined!420 (getValueByKey!573 l!1036 key!271)) (not (isEmpty!911 (getValueByKey!573 l!1036 key!271))))))

(declare-fun bs!29621 () Bool)

(assert (= bs!29621 d!121677))

(assert (=> bs!29621 m!938901))

(declare-fun m!938935 () Bool)

(assert (=> bs!29621 m!938935))

(assert (=> b!1017629 d!121677))

(declare-fun b!1017700 () Bool)

(declare-fun e!572583 () Option!624)

(declare-fun e!572584 () Option!624)

(assert (=> b!1017700 (= e!572583 e!572584)))

(declare-fun c!103049 () Bool)

(assert (=> b!1017700 (= c!103049 (and ((_ is Cons!21565) l!1036) (not (= (_1!7665 (h!22763 l!1036)) key!271))))))

(declare-fun b!1017699 () Bool)

(assert (=> b!1017699 (= e!572583 (Some!623 (_2!7665 (h!22763 l!1036))))))

(declare-fun b!1017702 () Bool)

(assert (=> b!1017702 (= e!572584 None!622)))

(declare-fun d!121679 () Bool)

(declare-fun c!103048 () Bool)

(assert (=> d!121679 (= c!103048 (and ((_ is Cons!21565) l!1036) (= (_1!7665 (h!22763 l!1036)) key!271)))))

(assert (=> d!121679 (= (getValueByKey!573 l!1036 key!271) e!572583)))

(declare-fun b!1017701 () Bool)

(assert (=> b!1017701 (= e!572584 (getValueByKey!573 (t!30570 l!1036) key!271))))

(assert (= (and d!121679 c!103048) b!1017699))

(assert (= (and d!121679 (not c!103048)) b!1017700))

(assert (= (and b!1017700 c!103049) b!1017701))

(assert (= (and b!1017700 (not c!103049)) b!1017702))

(assert (=> b!1017701 m!938895))

(assert (=> b!1017629 d!121679))

(declare-fun b!1017718 () Bool)

(declare-fun e!572594 () Bool)

(declare-fun tp!70930 () Bool)

(assert (=> b!1017718 (= e!572594 (and tp_is_empty!23661 tp!70930))))

(assert (=> b!1017626 (= tp!70921 e!572594)))

(assert (= (and b!1017626 ((_ is Cons!21565) (t!30570 l!1036))) b!1017718))

(check-sat (not b!1017654) (not b!1017693) (not d!121659) (not b!1017701) (not b!1017658) (not b!1017718) tp_is_empty!23661 (not d!121677))
(check-sat)
