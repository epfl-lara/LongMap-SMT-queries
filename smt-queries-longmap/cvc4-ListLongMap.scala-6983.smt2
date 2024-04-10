; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88508 () Bool)

(assert start!88508)

(declare-fun b!1017945 () Bool)

(declare-fun res!682646 () Bool)

(declare-fun e!572706 () Bool)

(assert (=> b!1017945 (=> (not res!682646) (not e!572706))))

(declare-datatypes ((B!1608 0))(
  ( (B!1609 (val!11888 Int)) )
))
(declare-datatypes ((tuple2!15322 0))(
  ( (tuple2!15323 (_1!7672 (_ BitVec 64)) (_2!7672 B!1608)) )
))
(declare-datatypes ((List!21576 0))(
  ( (Nil!21573) (Cons!21572 (h!22770 tuple2!15322) (t!30577 List!21576)) )
))
(declare-fun l!1036 () List!21576)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!631 0))(
  ( (Some!630 (v!14481 B!1608)) (None!629) )
))
(declare-fun isDefined!427 (Option!631) Bool)

(declare-fun getValueByKey!580 (List!21576 (_ BitVec 64)) Option!631)

(assert (=> b!1017945 (= res!682646 (isDefined!427 (getValueByKey!580 l!1036 key!271)))))

(declare-fun b!1017946 () Bool)

(declare-fun res!682648 () Bool)

(assert (=> b!1017946 (=> (not res!682648) (not e!572706))))

(declare-fun isStrictlySorted!647 (List!21576) Bool)

(assert (=> b!1017946 (= res!682648 (isStrictlySorted!647 (t!30577 l!1036)))))

(declare-fun b!1017947 () Bool)

(declare-fun e!572705 () Bool)

(declare-fun tp_is_empty!23675 () Bool)

(declare-fun tp!70960 () Bool)

(assert (=> b!1017947 (= e!572705 (and tp_is_empty!23675 tp!70960))))

(declare-fun b!1017948 () Bool)

(declare-fun containsKey!507 (List!21576 (_ BitVec 64)) Bool)

(assert (=> b!1017948 (= e!572706 (not (containsKey!507 l!1036 key!271)))))

(assert (=> b!1017948 (containsKey!507 (t!30577 l!1036) key!271)))

(declare-datatypes ((Unit!33279 0))(
  ( (Unit!33280) )
))
(declare-fun lt!449487 () Unit!33279)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (List!21576 (_ BitVec 64)) Unit!33279)

(assert (=> b!1017948 (= lt!449487 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (t!30577 l!1036) key!271))))

(declare-fun res!682649 () Bool)

(assert (=> start!88508 (=> (not res!682649) (not e!572706))))

(assert (=> start!88508 (= res!682649 (isStrictlySorted!647 l!1036))))

(assert (=> start!88508 e!572706))

(assert (=> start!88508 e!572705))

(assert (=> start!88508 true))

(declare-fun b!1017949 () Bool)

(declare-fun res!682647 () Bool)

(assert (=> b!1017949 (=> (not res!682647) (not e!572706))))

(assert (=> b!1017949 (= res!682647 (isDefined!427 (getValueByKey!580 (t!30577 l!1036) key!271)))))

(declare-fun b!1017950 () Bool)

(declare-fun res!682645 () Bool)

(assert (=> b!1017950 (=> (not res!682645) (not e!572706))))

(assert (=> b!1017950 (= res!682645 (and (is-Cons!21572 l!1036) (not (= (_1!7672 (h!22770 l!1036)) key!271))))))

(assert (= (and start!88508 res!682649) b!1017945))

(assert (= (and b!1017945 res!682646) b!1017950))

(assert (= (and b!1017950 res!682645) b!1017946))

(assert (= (and b!1017946 res!682648) b!1017949))

(assert (= (and b!1017949 res!682647) b!1017948))

(assert (= (and start!88508 (is-Cons!21572 l!1036)) b!1017947))

(declare-fun m!939055 () Bool)

(assert (=> b!1017945 m!939055))

(assert (=> b!1017945 m!939055))

(declare-fun m!939057 () Bool)

(assert (=> b!1017945 m!939057))

(declare-fun m!939059 () Bool)

(assert (=> b!1017949 m!939059))

(assert (=> b!1017949 m!939059))

(declare-fun m!939061 () Bool)

(assert (=> b!1017949 m!939061))

(declare-fun m!939063 () Bool)

(assert (=> b!1017946 m!939063))

(declare-fun m!939065 () Bool)

(assert (=> b!1017948 m!939065))

(declare-fun m!939067 () Bool)

(assert (=> b!1017948 m!939067))

(declare-fun m!939069 () Bool)

(assert (=> b!1017948 m!939069))

(declare-fun m!939071 () Bool)

(assert (=> start!88508 m!939071))

(push 1)

(assert tp_is_empty!23675)

(assert (not b!1017945))

(assert (not b!1017946))

(assert (not b!1017947))

(assert (not start!88508))

(assert (not b!1017949))

(assert (not b!1017948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121737 () Bool)

(declare-fun res!682660 () Bool)

(declare-fun e!572717 () Bool)

(assert (=> d!121737 (=> res!682660 e!572717)))

(assert (=> d!121737 (= res!682660 (or (is-Nil!21573 (t!30577 l!1036)) (is-Nil!21573 (t!30577 (t!30577 l!1036)))))))

(assert (=> d!121737 (= (isStrictlySorted!647 (t!30577 l!1036)) e!572717)))

(declare-fun b!1017961 () Bool)

(declare-fun e!572718 () Bool)

(assert (=> b!1017961 (= e!572717 e!572718)))

(declare-fun res!682661 () Bool)

(assert (=> b!1017961 (=> (not res!682661) (not e!572718))))

(assert (=> b!1017961 (= res!682661 (bvslt (_1!7672 (h!22770 (t!30577 l!1036))) (_1!7672 (h!22770 (t!30577 (t!30577 l!1036))))))))

(declare-fun b!1017962 () Bool)

(assert (=> b!1017962 (= e!572718 (isStrictlySorted!647 (t!30577 (t!30577 l!1036))))))

(assert (= (and d!121737 (not res!682660)) b!1017961))

(assert (= (and b!1017961 res!682661) b!1017962))

(declare-fun m!939075 () Bool)

(assert (=> b!1017962 m!939075))

(assert (=> b!1017946 d!121737))

(declare-fun d!121745 () Bool)

(declare-fun res!682662 () Bool)

(declare-fun e!572719 () Bool)

(assert (=> d!121745 (=> res!682662 e!572719)))

(assert (=> d!121745 (= res!682662 (or (is-Nil!21573 l!1036) (is-Nil!21573 (t!30577 l!1036))))))

(assert (=> d!121745 (= (isStrictlySorted!647 l!1036) e!572719)))

(declare-fun b!1017963 () Bool)

(declare-fun e!572720 () Bool)

(assert (=> b!1017963 (= e!572719 e!572720)))

(declare-fun res!682663 () Bool)

(assert (=> b!1017963 (=> (not res!682663) (not e!572720))))

(assert (=> b!1017963 (= res!682663 (bvslt (_1!7672 (h!22770 l!1036)) (_1!7672 (h!22770 (t!30577 l!1036)))))))

(declare-fun b!1017964 () Bool)

(assert (=> b!1017964 (= e!572720 (isStrictlySorted!647 (t!30577 l!1036)))))

(assert (= (and d!121745 (not res!682662)) b!1017963))

(assert (= (and b!1017963 res!682663) b!1017964))

(assert (=> b!1017964 m!939063))

(assert (=> start!88508 d!121745))

(declare-fun d!121747 () Bool)

(declare-fun res!682676 () Bool)

(declare-fun e!572733 () Bool)

(assert (=> d!121747 (=> res!682676 e!572733)))

(assert (=> d!121747 (= res!682676 (and (is-Cons!21572 l!1036) (= (_1!7672 (h!22770 l!1036)) key!271)))))

(assert (=> d!121747 (= (containsKey!507 l!1036 key!271) e!572733)))

(declare-fun b!1017977 () Bool)

(declare-fun e!572734 () Bool)

(assert (=> b!1017977 (= e!572733 e!572734)))

(declare-fun res!682677 () Bool)

(assert (=> b!1017977 (=> (not res!682677) (not e!572734))))

(assert (=> b!1017977 (= res!682677 (and (or (not (is-Cons!21572 l!1036)) (bvsle (_1!7672 (h!22770 l!1036)) key!271)) (is-Cons!21572 l!1036) (bvslt (_1!7672 (h!22770 l!1036)) key!271)))))

(declare-fun b!1017978 () Bool)

(assert (=> b!1017978 (= e!572734 (containsKey!507 (t!30577 l!1036) key!271))))

(assert (= (and d!121747 (not res!682676)) b!1017977))

(assert (= (and b!1017977 res!682677) b!1017978))

(assert (=> b!1017978 m!939067))

(assert (=> b!1017948 d!121747))

(declare-fun d!121753 () Bool)

(declare-fun res!682678 () Bool)

(declare-fun e!572735 () Bool)

(assert (=> d!121753 (=> res!682678 e!572735)))

(assert (=> d!121753 (= res!682678 (and (is-Cons!21572 (t!30577 l!1036)) (= (_1!7672 (h!22770 (t!30577 l!1036))) key!271)))))

(assert (=> d!121753 (= (containsKey!507 (t!30577 l!1036) key!271) e!572735)))

(declare-fun b!1017979 () Bool)

(declare-fun e!572736 () Bool)

(assert (=> b!1017979 (= e!572735 e!572736)))

(declare-fun res!682679 () Bool)

(assert (=> b!1017979 (=> (not res!682679) (not e!572736))))

(assert (=> b!1017979 (= res!682679 (and (or (not (is-Cons!21572 (t!30577 l!1036))) (bvsle (_1!7672 (h!22770 (t!30577 l!1036))) key!271)) (is-Cons!21572 (t!30577 l!1036)) (bvslt (_1!7672 (h!22770 (t!30577 l!1036))) key!271)))))

(declare-fun b!1017980 () Bool)

(assert (=> b!1017980 (= e!572736 (containsKey!507 (t!30577 (t!30577 l!1036)) key!271))))

(assert (= (and d!121753 (not res!682678)) b!1017979))

(assert (= (and b!1017979 res!682679) b!1017980))

(declare-fun m!939079 () Bool)

(assert (=> b!1017980 m!939079))

(assert (=> b!1017948 d!121753))

(declare-fun d!121755 () Bool)

(assert (=> d!121755 (containsKey!507 (t!30577 l!1036) key!271)))

(declare-fun lt!449493 () Unit!33279)

(declare-fun choose!1674 (List!21576 (_ BitVec 64)) Unit!33279)

(assert (=> d!121755 (= lt!449493 (choose!1674 (t!30577 l!1036) key!271))))

(declare-fun e!572748 () Bool)

(assert (=> d!121755 e!572748))

(declare-fun res!682691 () Bool)

(assert (=> d!121755 (=> (not res!682691) (not e!572748))))

(assert (=> d!121755 (= res!682691 (isStrictlySorted!647 (t!30577 l!1036)))))

(assert (=> d!121755 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (t!30577 l!1036) key!271) lt!449493)))

(declare-fun b!1017992 () Bool)

(assert (=> b!1017992 (= e!572748 (isDefined!427 (getValueByKey!580 (t!30577 l!1036) key!271)))))

(assert (= (and d!121755 res!682691) b!1017992))

(assert (=> d!121755 m!939067))

(declare-fun m!939083 () Bool)

(assert (=> d!121755 m!939083))

(assert (=> d!121755 m!939063))

(assert (=> b!1017992 m!939059))

(assert (=> b!1017992 m!939059))

(assert (=> b!1017992 m!939061))

(assert (=> b!1017948 d!121755))

(declare-fun d!121763 () Bool)

(declare-fun isEmpty!918 (Option!631) Bool)

(assert (=> d!121763 (= (isDefined!427 (getValueByKey!580 (t!30577 l!1036) key!271)) (not (isEmpty!918 (getValueByKey!580 (t!30577 l!1036) key!271))))))

(declare-fun bs!29636 () Bool)

(assert (= bs!29636 d!121763))

(assert (=> bs!29636 m!939059))

(declare-fun m!939089 () Bool)

(assert (=> bs!29636 m!939089))

(assert (=> b!1017949 d!121763))

(declare-fun b!1018023 () Bool)

(declare-fun e!572767 () Option!631)

(assert (=> b!1018023 (= e!572767 None!629)))

(declare-fun b!1018021 () Bool)

(declare-fun e!572766 () Option!631)

(assert (=> b!1018021 (= e!572766 e!572767)))

(declare-fun c!103105 () Bool)

(assert (=> b!1018021 (= c!103105 (and (is-Cons!21572 (t!30577 l!1036)) (not (= (_1!7672 (h!22770 (t!30577 l!1036))) key!271))))))

(declare-fun b!1018020 () Bool)

(assert (=> b!1018020 (= e!572766 (Some!630 (_2!7672 (h!22770 (t!30577 l!1036)))))))

(declare-fun d!121769 () Bool)

(declare-fun c!103104 () Bool)

(assert (=> d!121769 (= c!103104 (and (is-Cons!21572 (t!30577 l!1036)) (= (_1!7672 (h!22770 (t!30577 l!1036))) key!271)))))

(assert (=> d!121769 (= (getValueByKey!580 (t!30577 l!1036) key!271) e!572766)))

(declare-fun b!1018022 () Bool)

(assert (=> b!1018022 (= e!572767 (getValueByKey!580 (t!30577 (t!30577 l!1036)) key!271))))

(assert (= (and d!121769 c!103104) b!1018020))

(assert (= (and d!121769 (not c!103104)) b!1018021))

(assert (= (and b!1018021 c!103105) b!1018022))

(assert (= (and b!1018021 (not c!103105)) b!1018023))

(declare-fun m!939094 () Bool)

(assert (=> b!1018022 m!939094))

(assert (=> b!1017949 d!121769))

(declare-fun d!121775 () Bool)

(assert (=> d!121775 (= (isDefined!427 (getValueByKey!580 l!1036 key!271)) (not (isEmpty!918 (getValueByKey!580 l!1036 key!271))))))

(declare-fun bs!29638 () Bool)

(assert (= bs!29638 d!121775))

(assert (=> bs!29638 m!939055))

(declare-fun m!939099 () Bool)

(assert (=> bs!29638 m!939099))

(assert (=> b!1017945 d!121775))

(declare-fun b!1018031 () Bool)

(declare-fun e!572771 () Option!631)

(assert (=> b!1018031 (= e!572771 None!629)))

(declare-fun b!1018029 () Bool)

(declare-fun e!572770 () Option!631)

(assert (=> b!1018029 (= e!572770 e!572771)))

(declare-fun c!103109 () Bool)

(assert (=> b!1018029 (= c!103109 (and (is-Cons!21572 l!1036) (not (= (_1!7672 (h!22770 l!1036)) key!271))))))

(declare-fun b!1018028 () Bool)

(assert (=> b!1018028 (= e!572770 (Some!630 (_2!7672 (h!22770 l!1036))))))

(declare-fun d!121779 () Bool)

(declare-fun c!103108 () Bool)

(assert (=> d!121779 (= c!103108 (and (is-Cons!21572 l!1036) (= (_1!7672 (h!22770 l!1036)) key!271)))))

(assert (=> d!121779 (= (getValueByKey!580 l!1036 key!271) e!572770)))

(declare-fun b!1018030 () Bool)

(assert (=> b!1018030 (= e!572771 (getValueByKey!580 (t!30577 l!1036) key!271))))

(assert (= (and d!121779 c!103108) b!1018028))

(assert (= (and d!121779 (not c!103108)) b!1018029))

(assert (= (and b!1018029 c!103109) b!1018030))

(assert (= (and b!1018029 (not c!103109)) b!1018031))

(assert (=> b!1018030 m!939059))

(assert (=> b!1017945 d!121779))

(declare-fun b!1018041 () Bool)

(declare-fun e!572777 () Bool)

(declare-fun tp!70966 () Bool)

(assert (=> b!1018041 (= e!572777 (and tp_is_empty!23675 tp!70966))))

(assert (=> b!1017947 (= tp!70960 e!572777)))

(assert (= (and b!1017947 (is-Cons!21572 (t!30577 l!1036))) b!1018041))

(push 1)

(assert (not d!121775))

(assert tp_is_empty!23675)

(assert (not d!121763))

(assert (not b!1017964))

(assert (not b!1017980))

(assert (not b!1017962))

(assert (not b!1018022))

(assert (not b!1017992))

(assert (not b!1017978))

(assert (not d!121755))

(assert (not b!1018041))

(assert (not b!1018030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

