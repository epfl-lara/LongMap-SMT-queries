; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1698 () Bool)

(assert start!1698)

(declare-fun res!9823 () Bool)

(declare-fun e!7144 () Bool)

(assert (=> start!1698 (=> (not res!9823) (not e!7144))))

(declare-datatypes ((B!434 0))(
  ( (B!435 (val!312 Int)) )
))
(declare-datatypes ((tuple2!420 0))(
  ( (tuple2!421 (_1!210 (_ BitVec 64)) (_2!210 B!434)) )
))
(declare-datatypes ((List!360 0))(
  ( (Nil!357) (Cons!356 (h!922 tuple2!420) (t!2747 List!360)) )
))
(declare-fun l!1094 () List!360)

(declare-fun isStrictlySorted!51 (List!360) Bool)

(assert (=> start!1698 (= res!9823 (isStrictlySorted!51 l!1094))))

(assert (=> start!1698 e!7144))

(declare-fun e!7145 () Bool)

(assert (=> start!1698 e!7145))

(assert (=> start!1698 true))

(declare-fun tp_is_empty!607 () Bool)

(assert (=> start!1698 tp_is_empty!607))

(declare-fun b!11985 () Bool)

(declare-fun res!9822 () Bool)

(assert (=> b!11985 (=> (not res!9822) (not e!7144))))

(declare-fun key!303 () (_ BitVec 64))

(declare-fun v!194 () B!434)

(declare-datatypes ((Option!44 0))(
  ( (Some!43 (v!1358 B!434)) (None!42) )
))
(declare-fun getValueByKey!38 (List!360 (_ BitVec 64)) Option!44)

(assert (=> b!11985 (= res!9822 (= (getValueByKey!38 l!1094 key!303) (Some!43 v!194)))))

(declare-fun b!11986 () Bool)

(declare-fun ListPrimitiveSize!13 (List!360) Int)

(assert (=> b!11986 (= e!7144 (< (ListPrimitiveSize!13 l!1094) 0))))

(declare-fun b!11987 () Bool)

(declare-fun tp!2024 () Bool)

(assert (=> b!11987 (= e!7145 (and tp_is_empty!607 tp!2024))))

(assert (= (and start!1698 res!9823) b!11985))

(assert (= (and b!11985 res!9822) b!11986))

(get-info :version)

(assert (= (and start!1698 ((_ is Cons!356) l!1094)) b!11987))

(declare-fun m!8323 () Bool)

(assert (=> start!1698 m!8323))

(declare-fun m!8325 () Bool)

(assert (=> b!11985 m!8325))

(declare-fun m!8327 () Bool)

(assert (=> b!11986 m!8327))

(check-sat (not b!11987) (not start!1698) tp_is_empty!607 (not b!11985) (not b!11986))
(check-sat)
(get-model)

(declare-fun b!12027 () Bool)

(declare-fun e!7168 () Option!44)

(declare-fun e!7169 () Option!44)

(assert (=> b!12027 (= e!7168 e!7169)))

(declare-fun c!1025 () Bool)

(assert (=> b!12027 (= c!1025 (and ((_ is Cons!356) l!1094) (not (= (_1!210 (h!922 l!1094)) key!303))))))

(declare-fun b!12029 () Bool)

(assert (=> b!12029 (= e!7169 None!42)))

(declare-fun b!12028 () Bool)

(assert (=> b!12028 (= e!7169 (getValueByKey!38 (t!2747 l!1094) key!303))))

(declare-fun d!1671 () Bool)

(declare-fun c!1024 () Bool)

(assert (=> d!1671 (= c!1024 (and ((_ is Cons!356) l!1094) (= (_1!210 (h!922 l!1094)) key!303)))))

(assert (=> d!1671 (= (getValueByKey!38 l!1094 key!303) e!7168)))

(declare-fun b!12026 () Bool)

(assert (=> b!12026 (= e!7168 (Some!43 (_2!210 (h!922 l!1094))))))

(assert (= (and d!1671 c!1024) b!12026))

(assert (= (and d!1671 (not c!1024)) b!12027))

(assert (= (and b!12027 c!1025) b!12028))

(assert (= (and b!12027 (not c!1025)) b!12029))

(declare-fun m!8343 () Bool)

(assert (=> b!12028 m!8343))

(assert (=> b!11985 d!1671))

(declare-fun d!1677 () Bool)

(declare-fun lt!3093 () Int)

(assert (=> d!1677 (>= lt!3093 0)))

(declare-fun e!7179 () Int)

(assert (=> d!1677 (= lt!3093 e!7179)))

(declare-fun c!1035 () Bool)

(assert (=> d!1677 (= c!1035 ((_ is Nil!357) l!1094))))

(assert (=> d!1677 (= (ListPrimitiveSize!13 l!1094) lt!3093)))

(declare-fun b!12048 () Bool)

(assert (=> b!12048 (= e!7179 0)))

(declare-fun b!12049 () Bool)

(assert (=> b!12049 (= e!7179 (+ 1 (ListPrimitiveSize!13 (t!2747 l!1094))))))

(assert (= (and d!1677 c!1035) b!12048))

(assert (= (and d!1677 (not c!1035)) b!12049))

(declare-fun m!8347 () Bool)

(assert (=> b!12049 m!8347))

(assert (=> b!11986 d!1677))

(declare-fun d!1681 () Bool)

(declare-fun res!9845 () Bool)

(declare-fun e!7191 () Bool)

(assert (=> d!1681 (=> res!9845 e!7191)))

(assert (=> d!1681 (= res!9845 (or ((_ is Nil!357) l!1094) ((_ is Nil!357) (t!2747 l!1094))))))

(assert (=> d!1681 (= (isStrictlySorted!51 l!1094) e!7191)))

(declare-fun b!12062 () Bool)

(declare-fun e!7193 () Bool)

(assert (=> b!12062 (= e!7191 e!7193)))

(declare-fun res!9847 () Bool)

(assert (=> b!12062 (=> (not res!9847) (not e!7193))))

(assert (=> b!12062 (= res!9847 (bvslt (_1!210 (h!922 l!1094)) (_1!210 (h!922 (t!2747 l!1094)))))))

(declare-fun b!12064 () Bool)

(assert (=> b!12064 (= e!7193 (isStrictlySorted!51 (t!2747 l!1094)))))

(assert (= (and d!1681 (not res!9845)) b!12062))

(assert (= (and b!12062 res!9847) b!12064))

(declare-fun m!8351 () Bool)

(assert (=> b!12064 m!8351))

(assert (=> start!1698 d!1681))

(declare-fun b!12074 () Bool)

(declare-fun e!7198 () Bool)

(declare-fun tp!2035 () Bool)

(assert (=> b!12074 (= e!7198 (and tp_is_empty!607 tp!2035))))

(assert (=> b!11987 (= tp!2024 e!7198)))

(assert (= (and b!11987 ((_ is Cons!356) (t!2747 l!1094))) b!12074))

(check-sat (not b!12064) (not b!12049) tp_is_empty!607 (not b!12074) (not b!12028))
(check-sat)
