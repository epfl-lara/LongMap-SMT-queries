; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88474 () Bool)

(assert start!88474)

(declare-fun b!1017744 () Bool)

(declare-fun e!572607 () Bool)

(declare-fun tp_is_empty!23665 () Bool)

(declare-fun tp!70936 () Bool)

(assert (=> b!1017744 (= e!572607 (and tp_is_empty!23665 tp!70936))))

(declare-fun res!682547 () Bool)

(declare-fun e!572606 () Bool)

(assert (=> start!88474 (=> (not res!682547) (not e!572606))))

(declare-datatypes ((B!1598 0))(
  ( (B!1599 (val!11883 Int)) )
))
(declare-datatypes ((tuple2!15312 0))(
  ( (tuple2!15313 (_1!7667 (_ BitVec 64)) (_2!7667 B!1598)) )
))
(declare-datatypes ((List!21571 0))(
  ( (Nil!21568) (Cons!21567 (h!22765 tuple2!15312) (t!30572 List!21571)) )
))
(declare-fun l!1036 () List!21571)

(declare-fun isStrictlySorted!642 (List!21571) Bool)

(assert (=> start!88474 (= res!682547 (isStrictlySorted!642 l!1036))))

(assert (=> start!88474 e!572606))

(assert (=> start!88474 e!572607))

(assert (=> start!88474 true))

(declare-fun b!1017745 () Bool)

(declare-fun res!682546 () Bool)

(assert (=> b!1017745 (=> (not res!682546) (not e!572606))))

(declare-fun key!271 () (_ BitVec 64))

(assert (=> b!1017745 (= res!682546 (and (is-Cons!21567 l!1036) (not (= (_1!7667 (h!22765 l!1036)) key!271))))))

(declare-fun b!1017746 () Bool)

(declare-fun res!682548 () Bool)

(assert (=> b!1017746 (=> (not res!682548) (not e!572606))))

(declare-datatypes ((Option!626 0))(
  ( (Some!625 (v!14476 B!1598)) (None!624) )
))
(declare-fun isDefined!422 (Option!626) Bool)

(declare-fun getValueByKey!575 (List!21571 (_ BitVec 64)) Option!626)

(assert (=> b!1017746 (= res!682548 (isDefined!422 (getValueByKey!575 l!1036 key!271)))))

(declare-fun b!1017747 () Bool)

(declare-fun ListPrimitiveSize!130 (List!21571) Int)

(assert (=> b!1017747 (= e!572606 (>= (ListPrimitiveSize!130 (t!30572 l!1036)) (ListPrimitiveSize!130 l!1036)))))

(declare-fun b!1017748 () Bool)

(declare-fun res!682549 () Bool)

(assert (=> b!1017748 (=> (not res!682549) (not e!572606))))

(assert (=> b!1017748 (= res!682549 (isStrictlySorted!642 (t!30572 l!1036)))))

(declare-fun b!1017749 () Bool)

(declare-fun res!682550 () Bool)

(assert (=> b!1017749 (=> (not res!682550) (not e!572606))))

(assert (=> b!1017749 (= res!682550 (isDefined!422 (getValueByKey!575 (t!30572 l!1036) key!271)))))

(assert (= (and start!88474 res!682547) b!1017746))

(assert (= (and b!1017746 res!682548) b!1017745))

(assert (= (and b!1017745 res!682546) b!1017748))

(assert (= (and b!1017748 res!682549) b!1017749))

(assert (= (and b!1017749 res!682550) b!1017747))

(assert (= (and start!88474 (is-Cons!21567 l!1036)) b!1017744))

(declare-fun m!938941 () Bool)

(assert (=> b!1017747 m!938941))

(declare-fun m!938943 () Bool)

(assert (=> b!1017747 m!938943))

(declare-fun m!938945 () Bool)

(assert (=> start!88474 m!938945))

(declare-fun m!938947 () Bool)

(assert (=> b!1017749 m!938947))

(assert (=> b!1017749 m!938947))

(declare-fun m!938949 () Bool)

(assert (=> b!1017749 m!938949))

(declare-fun m!938951 () Bool)

(assert (=> b!1017746 m!938951))

(assert (=> b!1017746 m!938951))

(declare-fun m!938953 () Bool)

(assert (=> b!1017746 m!938953))

(declare-fun m!938955 () Bool)

(assert (=> b!1017748 m!938955))

(push 1)

(assert tp_is_empty!23665)

(assert (not start!88474))

(assert (not b!1017746))

(assert (not b!1017749))

(assert (not b!1017748))

(assert (not b!1017744))

(assert (not b!1017747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121689 () Bool)

(declare-fun lt!449469 () Int)

(assert (=> d!121689 (>= lt!449469 0)))

(declare-fun e!572628 () Int)

(assert (=> d!121689 (= lt!449469 e!572628)))

(declare-fun c!103060 () Bool)

(assert (=> d!121689 (= c!103060 (is-Nil!21568 (t!30572 l!1036)))))

(assert (=> d!121689 (= (ListPrimitiveSize!130 (t!30572 l!1036)) lt!449469)))

(declare-fun b!1017796 () Bool)

(assert (=> b!1017796 (= e!572628 0)))

(declare-fun b!1017797 () Bool)

(assert (=> b!1017797 (= e!572628 (+ 1 (ListPrimitiveSize!130 (t!30572 (t!30572 l!1036)))))))

(assert (= (and d!121689 c!103060) b!1017796))

(assert (= (and d!121689 (not c!103060)) b!1017797))

(declare-fun m!938989 () Bool)

(assert (=> b!1017797 m!938989))

(assert (=> b!1017747 d!121689))

(declare-fun d!121693 () Bool)

(declare-fun lt!449470 () Int)

(assert (=> d!121693 (>= lt!449470 0)))

(declare-fun e!572629 () Int)

(assert (=> d!121693 (= lt!449470 e!572629)))

(declare-fun c!103061 () Bool)

(assert (=> d!121693 (= c!103061 (is-Nil!21568 l!1036))))

(assert (=> d!121693 (= (ListPrimitiveSize!130 l!1036) lt!449470)))

(declare-fun b!1017798 () Bool)

(assert (=> b!1017798 (= e!572629 0)))

(declare-fun b!1017799 () Bool)

(assert (=> b!1017799 (= e!572629 (+ 1 (ListPrimitiveSize!130 (t!30572 l!1036))))))

(assert (= (and d!121693 c!103061) b!1017798))

(assert (= (and d!121693 (not c!103061)) b!1017799))

(assert (=> b!1017799 m!938941))

(assert (=> b!1017747 d!121693))

(declare-fun d!121695 () Bool)

(declare-fun res!682591 () Bool)

(declare-fun e!572638 () Bool)

(assert (=> d!121695 (=> res!682591 e!572638)))

(assert (=> d!121695 (= res!682591 (or (is-Nil!21568 l!1036) (is-Nil!21568 (t!30572 l!1036))))))

(assert (=> d!121695 (= (isStrictlySorted!642 l!1036) e!572638)))

(declare-fun b!1017812 () Bool)

(declare-fun e!572639 () Bool)

(assert (=> b!1017812 (= e!572638 e!572639)))

(declare-fun res!682592 () Bool)

(assert (=> b!1017812 (=> (not res!682592) (not e!572639))))

(assert (=> b!1017812 (= res!682592 (bvslt (_1!7667 (h!22765 l!1036)) (_1!7667 (h!22765 (t!30572 l!1036)))))))

(declare-fun b!1017813 () Bool)

(assert (=> b!1017813 (= e!572639 (isStrictlySorted!642 (t!30572 l!1036)))))

(assert (= (and d!121695 (not res!682591)) b!1017812))

(assert (= (and b!1017812 res!682592) b!1017813))

(assert (=> b!1017813 m!938955))

(assert (=> start!88474 d!121695))

(declare-fun d!121705 () Bool)

(declare-fun res!682593 () Bool)

(declare-fun e!572642 () Bool)

(assert (=> d!121705 (=> res!682593 e!572642)))

(assert (=> d!121705 (= res!682593 (or (is-Nil!21568 (t!30572 l!1036)) (is-Nil!21568 (t!30572 (t!30572 l!1036)))))))

(assert (=> d!121705 (= (isStrictlySorted!642 (t!30572 l!1036)) e!572642)))

(declare-fun b!1017818 () Bool)

(declare-fun e!572643 () Bool)

(assert (=> b!1017818 (= e!572642 e!572643)))

(declare-fun res!682594 () Bool)

(assert (=> b!1017818 (=> (not res!682594) (not e!572643))))

(assert (=> b!1017818 (= res!682594 (bvslt (_1!7667 (h!22765 (t!30572 l!1036))) (_1!7667 (h!22765 (t!30572 (t!30572 l!1036))))))))

(declare-fun b!1017819 () Bool)

(assert (=> b!1017819 (= e!572643 (isStrictlySorted!642 (t!30572 (t!30572 l!1036))))))

(assert (= (and d!121705 (not res!682593)) b!1017818))

(assert (= (and b!1017818 res!682594) b!1017819))

(declare-fun m!938995 () Bool)

(assert (=> b!1017819 m!938995))

(assert (=> b!1017748 d!121705))

(declare-fun d!121707 () Bool)

(declare-fun isEmpty!914 (Option!626) Bool)

(assert (=> d!121707 (= (isDefined!422 (getValueByKey!575 (t!30572 l!1036) key!271)) (not (isEmpty!914 (getValueByKey!575 (t!30572 l!1036) key!271))))))

(declare-fun bs!29627 () Bool)

(assert (= bs!29627 d!121707))

(assert (=> bs!29627 m!938947))

(declare-fun m!938997 () Bool)

(assert (=> bs!29627 m!938997))

(assert (=> b!1017749 d!121707))

(declare-fun b!1017854 () Bool)

(declare-fun e!572664 () Option!626)

(assert (=> b!1017854 (= e!572664 (Some!625 (_2!7667 (h!22765 (t!30572 l!1036)))))))

(declare-fun b!1017855 () Bool)

(declare-fun e!572665 () Option!626)

(assert (=> b!1017855 (= e!572664 e!572665)))

(declare-fun c!103083 () Bool)

(assert (=> b!1017855 (= c!103083 (and (is-Cons!21567 (t!30572 l!1036)) (not (= (_1!7667 (h!22765 (t!30572 l!1036))) key!271))))))

(declare-fun d!121709 () Bool)

(declare-fun c!103082 () Bool)

(assert (=> d!121709 (= c!103082 (and (is-Cons!21567 (t!30572 l!1036)) (= (_1!7667 (h!22765 (t!30572 l!1036))) key!271)))))

(assert (=> d!121709 (= (getValueByKey!575 (t!30572 l!1036) key!271) e!572664)))

(declare-fun b!1017856 () Bool)

(assert (=> b!1017856 (= e!572665 (getValueByKey!575 (t!30572 (t!30572 l!1036)) key!271))))

(declare-fun b!1017857 () Bool)

(assert (=> b!1017857 (= e!572665 None!624)))

(assert (= (and d!121709 c!103082) b!1017854))

(assert (= (and d!121709 (not c!103082)) b!1017855))

(assert (= (and b!1017855 c!103083) b!1017856))

(assert (= (and b!1017855 (not c!103083)) b!1017857))

(declare-fun m!939007 () Bool)

(assert (=> b!1017856 m!939007))

(assert (=> b!1017749 d!121709))

(declare-fun d!121721 () Bool)

(assert (=> d!121721 (= (isDefined!422 (getValueByKey!575 l!1036 key!271)) (not (isEmpty!914 (getValueByKey!575 l!1036 key!271))))))

(declare-fun bs!29629 () Bool)

(assert (= bs!29629 d!121721))

(assert (=> bs!29629 m!938951))

(declare-fun m!939009 () Bool)

(assert (=> bs!29629 m!939009))

(assert (=> b!1017746 d!121721))

(declare-fun b!1017862 () Bool)

(declare-fun e!572668 () Option!626)

(assert (=> b!1017862 (= e!572668 (Some!625 (_2!7667 (h!22765 l!1036))))))

(declare-fun b!1017863 () Bool)

(declare-fun e!572669 () Option!626)

(assert (=> b!1017863 (= e!572668 e!572669)))

(declare-fun c!103085 () Bool)

(assert (=> b!1017863 (= c!103085 (and (is-Cons!21567 l!1036) (not (= (_1!7667 (h!22765 l!1036)) key!271))))))

(declare-fun d!121723 () Bool)

(declare-fun c!103084 () Bool)

(assert (=> d!121723 (= c!103084 (and (is-Cons!21567 l!1036) (= (_1!7667 (h!22765 l!1036)) key!271)))))

(assert (=> d!121723 (= (getValueByKey!575 l!1036 key!271) e!572668)))

(declare-fun b!1017864 () Bool)

(assert (=> b!1017864 (= e!572669 (getValueByKey!575 (t!30572 l!1036) key!271))))

(declare-fun b!1017865 () Bool)

(assert (=> b!1017865 (= e!572669 None!624)))

(assert (= (and d!121723 c!103084) b!1017862))

(assert (= (and d!121723 (not c!103084)) b!1017863))

(assert (= (and b!1017863 c!103085) b!1017864))

(assert (= (and b!1017863 (not c!103085)) b!1017865))

(assert (=> b!1017864 m!938947))

(assert (=> b!1017746 d!121723))

(declare-fun b!1017873 () Bool)

(declare-fun e!572675 () Bool)

(declare-fun tp!70948 () Bool)

(assert (=> b!1017873 (= e!572675 (and tp_is_empty!23665 tp!70948))))

(assert (=> b!1017744 (= tp!70936 e!572675)))

(assert (= (and b!1017744 (is-Cons!21567 (t!30572 l!1036))) b!1017873))

(push 1)

(assert tp_is_empty!23665)

(assert (not b!1017873))

(assert (not b!1017856))

(assert (not b!1017797))

(assert (not b!1017864))

(assert (not b!1017813))

(assert (not b!1017819))

(assert (not d!121707))

(assert (not d!121721))

(assert (not b!1017799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

