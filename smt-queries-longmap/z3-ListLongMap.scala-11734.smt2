; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137564 () Bool)

(assert start!137564)

(declare-fun res!1080822 () Bool)

(declare-fun e!882778 () Bool)

(assert (=> start!137564 (=> (not res!1080822) (not e!882778))))

(declare-datatypes ((B!2744 0))(
  ( (B!2745 (val!19734 Int)) )
))
(declare-datatypes ((tuple2!25704 0))(
  ( (tuple2!25705 (_1!12863 (_ BitVec 64)) (_2!12863 B!2744)) )
))
(declare-datatypes ((List!36895 0))(
  ( (Nil!36892) (Cons!36891 (h!38435 tuple2!25704) (t!51801 List!36895)) )
))
(declare-fun l!1356 () List!36895)

(declare-fun isStrictlySorted!1107 (List!36895) Bool)

(assert (=> start!137564 (= res!1080822 (isStrictlySorted!1107 l!1356))))

(assert (=> start!137564 e!882778))

(declare-fun e!882779 () Bool)

(assert (=> start!137564 e!882779))

(assert (=> start!137564 true))

(declare-fun b!1581906 () Bool)

(declare-fun res!1080820 () Bool)

(assert (=> b!1581906 (=> (not res!1080820) (not e!882778))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!953 (List!36895 (_ BitVec 64)) Bool)

(assert (=> b!1581906 (= res!1080820 (not (containsKey!953 l!1356 key!387)))))

(declare-fun b!1581908 () Bool)

(declare-fun ListPrimitiveSize!202 (List!36895) Int)

(assert (=> b!1581908 (= e!882778 (>= (ListPrimitiveSize!202 (t!51801 l!1356)) (ListPrimitiveSize!202 l!1356)))))

(declare-fun b!1581909 () Bool)

(declare-fun tp_is_empty!39289 () Bool)

(declare-fun tp!114696 () Bool)

(assert (=> b!1581909 (= e!882779 (and tp_is_empty!39289 tp!114696))))

(declare-fun b!1581907 () Bool)

(declare-fun res!1080821 () Bool)

(assert (=> b!1581907 (=> (not res!1080821) (not e!882778))))

(get-info :version)

(assert (=> b!1581907 (= res!1080821 (not ((_ is Nil!36892) l!1356)))))

(assert (= (and start!137564 res!1080822) b!1581906))

(assert (= (and b!1581906 res!1080820) b!1581907))

(assert (= (and b!1581907 res!1080821) b!1581908))

(assert (= (and start!137564 ((_ is Cons!36891) l!1356)) b!1581909))

(declare-fun m!1451899 () Bool)

(assert (=> start!137564 m!1451899))

(declare-fun m!1451901 () Bool)

(assert (=> b!1581906 m!1451901))

(declare-fun m!1451903 () Bool)

(assert (=> b!1581908 m!1451903))

(declare-fun m!1451905 () Bool)

(assert (=> b!1581908 m!1451905))

(check-sat tp_is_empty!39289 (not b!1581909) (not b!1581908) (not b!1581906) (not start!137564))
(check-sat)
(get-model)

(declare-fun d!166693 () Bool)

(declare-fun res!1080849 () Bool)

(declare-fun e!882804 () Bool)

(assert (=> d!166693 (=> res!1080849 e!882804)))

(assert (=> d!166693 (= res!1080849 (and ((_ is Cons!36891) l!1356) (= (_1!12863 (h!38435 l!1356)) key!387)))))

(assert (=> d!166693 (= (containsKey!953 l!1356 key!387) e!882804)))

(declare-fun b!1581948 () Bool)

(declare-fun e!882805 () Bool)

(assert (=> b!1581948 (= e!882804 e!882805)))

(declare-fun res!1080850 () Bool)

(assert (=> b!1581948 (=> (not res!1080850) (not e!882805))))

(assert (=> b!1581948 (= res!1080850 (and (or (not ((_ is Cons!36891) l!1356)) (bvsle (_1!12863 (h!38435 l!1356)) key!387)) ((_ is Cons!36891) l!1356) (bvslt (_1!12863 (h!38435 l!1356)) key!387)))))

(declare-fun b!1581949 () Bool)

(assert (=> b!1581949 (= e!882805 (containsKey!953 (t!51801 l!1356) key!387))))

(assert (= (and d!166693 (not res!1080849)) b!1581948))

(assert (= (and b!1581948 res!1080850) b!1581949))

(declare-fun m!1451925 () Bool)

(assert (=> b!1581949 m!1451925))

(assert (=> b!1581906 d!166693))

(declare-fun d!166703 () Bool)

(declare-fun lt!676778 () Int)

(assert (=> d!166703 (>= lt!676778 0)))

(declare-fun e!882815 () Int)

(assert (=> d!166703 (= lt!676778 e!882815)))

(declare-fun c!146560 () Bool)

(assert (=> d!166703 (= c!146560 ((_ is Nil!36892) (t!51801 l!1356)))))

(assert (=> d!166703 (= (ListPrimitiveSize!202 (t!51801 l!1356)) lt!676778)))

(declare-fun b!1581966 () Bool)

(assert (=> b!1581966 (= e!882815 0)))

(declare-fun b!1581967 () Bool)

(assert (=> b!1581967 (= e!882815 (+ 1 (ListPrimitiveSize!202 (t!51801 (t!51801 l!1356)))))))

(assert (= (and d!166703 c!146560) b!1581966))

(assert (= (and d!166703 (not c!146560)) b!1581967))

(declare-fun m!1451929 () Bool)

(assert (=> b!1581967 m!1451929))

(assert (=> b!1581908 d!166703))

(declare-fun d!166707 () Bool)

(declare-fun lt!676779 () Int)

(assert (=> d!166707 (>= lt!676779 0)))

(declare-fun e!882819 () Int)

(assert (=> d!166707 (= lt!676779 e!882819)))

(declare-fun c!146562 () Bool)

(assert (=> d!166707 (= c!146562 ((_ is Nil!36892) l!1356))))

(assert (=> d!166707 (= (ListPrimitiveSize!202 l!1356) lt!676779)))

(declare-fun b!1581970 () Bool)

(assert (=> b!1581970 (= e!882819 0)))

(declare-fun b!1581971 () Bool)

(assert (=> b!1581971 (= e!882819 (+ 1 (ListPrimitiveSize!202 (t!51801 l!1356))))))

(assert (= (and d!166707 c!146562) b!1581970))

(assert (= (and d!166707 (not c!146562)) b!1581971))

(assert (=> b!1581971 m!1451903))

(assert (=> b!1581908 d!166707))

(declare-fun d!166711 () Bool)

(declare-fun res!1080869 () Bool)

(declare-fun e!882832 () Bool)

(assert (=> d!166711 (=> res!1080869 e!882832)))

(assert (=> d!166711 (= res!1080869 (or ((_ is Nil!36892) l!1356) ((_ is Nil!36892) (t!51801 l!1356))))))

(assert (=> d!166711 (= (isStrictlySorted!1107 l!1356) e!882832)))

(declare-fun b!1581986 () Bool)

(declare-fun e!882833 () Bool)

(assert (=> b!1581986 (= e!882832 e!882833)))

(declare-fun res!1080870 () Bool)

(assert (=> b!1581986 (=> (not res!1080870) (not e!882833))))

(assert (=> b!1581986 (= res!1080870 (bvslt (_1!12863 (h!38435 l!1356)) (_1!12863 (h!38435 (t!51801 l!1356)))))))

(declare-fun b!1581987 () Bool)

(assert (=> b!1581987 (= e!882833 (isStrictlySorted!1107 (t!51801 l!1356)))))

(assert (= (and d!166711 (not res!1080869)) b!1581986))

(assert (= (and b!1581986 res!1080870) b!1581987))

(declare-fun m!1451935 () Bool)

(assert (=> b!1581987 m!1451935))

(assert (=> start!137564 d!166711))

(declare-fun b!1581996 () Bool)

(declare-fun e!882840 () Bool)

(declare-fun tp!114705 () Bool)

(assert (=> b!1581996 (= e!882840 (and tp_is_empty!39289 tp!114705))))

(assert (=> b!1581909 (= tp!114696 e!882840)))

(assert (= (and b!1581909 ((_ is Cons!36891) (t!51801 l!1356))) b!1581996))

(check-sat (not b!1581967) (not b!1581949) tp_is_empty!39289 (not b!1581996) (not b!1581971) (not b!1581987))
(check-sat)
