; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88454 () Bool)

(assert start!88454)

(declare-fun b!1017640 () Bool)

(declare-fun e!572543 () Bool)

(declare-fun tp_is_empty!23663 () Bool)

(declare-fun tp!70924 () Bool)

(assert (=> b!1017640 (= e!572543 (and tp_is_empty!23663 tp!70924))))

(declare-fun b!1017641 () Bool)

(declare-fun res!682511 () Bool)

(declare-fun e!572544 () Bool)

(assert (=> b!1017641 (=> (not res!682511) (not e!572544))))

(declare-datatypes ((B!1596 0))(
  ( (B!1597 (val!11882 Int)) )
))
(declare-datatypes ((tuple2!15310 0))(
  ( (tuple2!15311 (_1!7666 (_ BitVec 64)) (_2!7666 B!1596)) )
))
(declare-datatypes ((List!21570 0))(
  ( (Nil!21567) (Cons!21566 (h!22764 tuple2!15310) (t!30571 List!21570)) )
))
(declare-fun l!1036 () List!21570)

(declare-fun key!271 () (_ BitVec 64))

(assert (=> b!1017641 (= res!682511 (and (is-Cons!21566 l!1036) (not (= (_1!7666 (h!22764 l!1036)) key!271))))))

(declare-fun b!1017643 () Bool)

(declare-fun e!572542 () Bool)

(assert (=> b!1017643 (= e!572544 e!572542)))

(declare-fun res!682509 () Bool)

(assert (=> b!1017643 (=> res!682509 e!572542)))

(declare-fun isStrictlySorted!641 (List!21570) Bool)

(assert (=> b!1017643 (= res!682509 (not (isStrictlySorted!641 (t!30571 l!1036))))))

(declare-fun b!1017644 () Bool)

(declare-fun res!682510 () Bool)

(assert (=> b!1017644 (=> (not res!682510) (not e!572544))))

(declare-datatypes ((Option!625 0))(
  ( (Some!624 (v!14475 B!1596)) (None!623) )
))
(declare-fun isDefined!421 (Option!625) Bool)

(declare-fun getValueByKey!574 (List!21570 (_ BitVec 64)) Option!625)

(assert (=> b!1017644 (= res!682510 (isDefined!421 (getValueByKey!574 l!1036 key!271)))))

(declare-fun res!682508 () Bool)

(assert (=> start!88454 (=> (not res!682508) (not e!572544))))

(assert (=> start!88454 (= res!682508 (isStrictlySorted!641 l!1036))))

(assert (=> start!88454 e!572544))

(assert (=> start!88454 e!572543))

(assert (=> start!88454 true))

(declare-fun b!1017642 () Bool)

(assert (=> b!1017642 (= e!572542 (not (isDefined!421 (getValueByKey!574 (t!30571 l!1036) key!271))))))

(assert (= (and start!88454 res!682508) b!1017644))

(assert (= (and b!1017644 res!682510) b!1017641))

(assert (= (and b!1017641 res!682511) b!1017643))

(assert (= (and b!1017643 (not res!682509)) b!1017642))

(assert (= (and start!88454 (is-Cons!21566 l!1036)) b!1017640))

(declare-fun m!938905 () Bool)

(assert (=> b!1017643 m!938905))

(declare-fun m!938907 () Bool)

(assert (=> b!1017644 m!938907))

(assert (=> b!1017644 m!938907))

(declare-fun m!938909 () Bool)

(assert (=> b!1017644 m!938909))

(declare-fun m!938911 () Bool)

(assert (=> start!88454 m!938911))

(declare-fun m!938913 () Bool)

(assert (=> b!1017642 m!938913))

(assert (=> b!1017642 m!938913))

(declare-fun m!938915 () Bool)

(assert (=> b!1017642 m!938915))

(push 1)

(assert (not b!1017640))

(assert (not b!1017642))

(assert (not b!1017643))

(assert (not start!88454))

(assert tp_is_empty!23663)

(assert (not b!1017644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121651 () Bool)

(declare-fun res!682522 () Bool)

(declare-fun e!572555 () Bool)

(assert (=> d!121651 (=> res!682522 e!572555)))

(assert (=> d!121651 (= res!682522 (or (is-Nil!21567 l!1036) (is-Nil!21567 (t!30571 l!1036))))))

(assert (=> d!121651 (= (isStrictlySorted!641 l!1036) e!572555)))

(declare-fun b!1017655 () Bool)

(declare-fun e!572556 () Bool)

(assert (=> b!1017655 (= e!572555 e!572556)))

(declare-fun res!682523 () Bool)

(assert (=> b!1017655 (=> (not res!682523) (not e!572556))))

(assert (=> b!1017655 (= res!682523 (bvslt (_1!7666 (h!22764 l!1036)) (_1!7666 (h!22764 (t!30571 l!1036)))))))

(declare-fun b!1017656 () Bool)

(assert (=> b!1017656 (= e!572556 (isStrictlySorted!641 (t!30571 l!1036)))))

(assert (= (and d!121651 (not res!682522)) b!1017655))

(assert (= (and b!1017655 res!682523) b!1017656))

(assert (=> b!1017656 m!938905))

(assert (=> start!88454 d!121651))

(declare-fun d!121655 () Bool)

(declare-fun isEmpty!910 (Option!625) Bool)

(assert (=> d!121655 (= (isDefined!421 (getValueByKey!574 (t!30571 l!1036) key!271)) (not (isEmpty!910 (getValueByKey!574 (t!30571 l!1036) key!271))))))

(declare-fun bs!29617 () Bool)

(assert (= bs!29617 d!121655))

(assert (=> bs!29617 m!938913))

(declare-fun m!938919 () Bool)

(assert (=> bs!29617 m!938919))

(assert (=> b!1017642 d!121655))

(declare-fun b!1017685 () Bool)

(declare-fun e!572576 () Option!625)

(assert (=> b!1017685 (= e!572576 (getValueByKey!574 (t!30571 (t!30571 l!1036)) key!271))))

(declare-fun b!1017686 () Bool)

(assert (=> b!1017686 (= e!572576 None!623)))

(declare-fun b!1017684 () Bool)

(declare-fun e!572575 () Option!625)

(assert (=> b!1017684 (= e!572575 e!572576)))

(declare-fun c!103043 () Bool)

(assert (=> b!1017684 (= c!103043 (and (is-Cons!21566 (t!30571 l!1036)) (not (= (_1!7666 (h!22764 (t!30571 l!1036))) key!271))))))

(declare-fun b!1017683 () Bool)

(assert (=> b!1017683 (= e!572575 (Some!624 (_2!7666 (h!22764 (t!30571 l!1036)))))))

(declare-fun d!121661 () Bool)

(declare-fun c!103042 () Bool)

(assert (=> d!121661 (= c!103042 (and (is-Cons!21566 (t!30571 l!1036)) (= (_1!7666 (h!22764 (t!30571 l!1036))) key!271)))))

(assert (=> d!121661 (= (getValueByKey!574 (t!30571 l!1036) key!271) e!572575)))

(assert (= (and d!121661 c!103042) b!1017683))

(assert (= (and d!121661 (not c!103042)) b!1017684))

(assert (= (and b!1017684 c!103043) b!1017685))

(assert (= (and b!1017684 (not c!103043)) b!1017686))

(declare-fun m!938927 () Bool)

(assert (=> b!1017685 m!938927))

(assert (=> b!1017642 d!121661))

(declare-fun d!121671 () Bool)

(assert (=> d!121671 (= (isDefined!421 (getValueByKey!574 l!1036 key!271)) (not (isEmpty!910 (getValueByKey!574 l!1036 key!271))))))

(declare-fun bs!29620 () Bool)

(assert (= bs!29620 d!121671))

(assert (=> bs!29620 m!938907))

(declare-fun m!938929 () Bool)

(assert (=> bs!29620 m!938929))

(assert (=> b!1017644 d!121671))

(declare-fun b!1017689 () Bool)

(declare-fun e!572578 () Option!625)

(assert (=> b!1017689 (= e!572578 (getValueByKey!574 (t!30571 l!1036) key!271))))

(declare-fun b!1017690 () Bool)

(assert (=> b!1017690 (= e!572578 None!623)))

(declare-fun b!1017688 () Bool)

(declare-fun e!572577 () Option!625)

(assert (=> b!1017688 (= e!572577 e!572578)))

(declare-fun c!103045 () Bool)

(assert (=> b!1017688 (= c!103045 (and (is-Cons!21566 l!1036) (not (= (_1!7666 (h!22764 l!1036)) key!271))))))

(declare-fun b!1017687 () Bool)

(assert (=> b!1017687 (= e!572577 (Some!624 (_2!7666 (h!22764 l!1036))))))

(declare-fun d!121673 () Bool)

(declare-fun c!103044 () Bool)

(assert (=> d!121673 (= c!103044 (and (is-Cons!21566 l!1036) (= (_1!7666 (h!22764 l!1036)) key!271)))))

(assert (=> d!121673 (= (getValueByKey!574 l!1036 key!271) e!572577)))

(assert (= (and d!121673 c!103044) b!1017687))

(assert (= (and d!121673 (not c!103044)) b!1017688))

(assert (= (and b!1017688 c!103045) b!1017689))

(assert (= (and b!1017688 (not c!103045)) b!1017690))

(assert (=> b!1017689 m!938913))

(assert (=> b!1017644 d!121673))

(declare-fun d!121675 () Bool)

(declare-fun res!682534 () Bool)

(declare-fun e!572581 () Bool)

(assert (=> d!121675 (=> res!682534 e!572581)))

(assert (=> d!121675 (= res!682534 (or (is-Nil!21567 (t!30571 l!1036)) (is-Nil!21567 (t!30571 (t!30571 l!1036)))))))

(assert (=> d!121675 (= (isStrictlySorted!641 (t!30571 l!1036)) e!572581)))

(declare-fun b!1017695 () Bool)

(declare-fun e!572582 () Bool)

(assert (=> b!1017695 (= e!572581 e!572582)))

(declare-fun res!682535 () Bool)

(assert (=> b!1017695 (=> (not res!682535) (not e!572582))))

(assert (=> b!1017695 (= res!682535 (bvslt (_1!7666 (h!22764 (t!30571 l!1036))) (_1!7666 (h!22764 (t!30571 (t!30571 l!1036))))))))

(declare-fun b!1017696 () Bool)

(assert (=> b!1017696 (= e!572582 (isStrictlySorted!641 (t!30571 (t!30571 l!1036))))))

(assert (= (and d!121675 (not res!682534)) b!1017695))

