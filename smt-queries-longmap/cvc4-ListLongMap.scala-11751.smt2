; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137882 () Bool)

(assert start!137882)

(declare-fun res!1081634 () Bool)

(declare-fun e!883797 () Bool)

(assert (=> start!137882 (=> (not res!1081634) (not e!883797))))

(declare-datatypes ((B!2850 0))(
  ( (B!2851 (val!19787 Int)) )
))
(declare-datatypes ((tuple2!25742 0))(
  ( (tuple2!25743 (_1!12882 (_ BitVec 64)) (_2!12882 B!2850)) )
))
(declare-datatypes ((List!36907 0))(
  ( (Nil!36904) (Cons!36903 (h!38446 tuple2!25742) (t!51821 List!36907)) )
))
(declare-fun l!548 () List!36907)

(declare-fun isStrictlySorted!1141 (List!36907) Bool)

(assert (=> start!137882 (= res!1081634 (isStrictlySorted!1141 l!548))))

(assert (=> start!137882 e!883797))

(declare-fun e!883798 () Bool)

(assert (=> start!137882 e!883798))

(assert (=> start!137882 true))

(declare-fun b!1583375 () Bool)

(declare-fun res!1081633 () Bool)

(assert (=> b!1583375 (=> (not res!1081633) (not e!883797))))

(declare-fun key!159 () (_ BitVec 64))

(assert (=> b!1583375 (= res!1081633 (and (not (= (_1!12882 (h!38446 l!548)) key!159)) (is-Cons!36903 l!548)))))

(declare-fun b!1583376 () Bool)

(assert (=> b!1583376 (= e!883797 (not (isStrictlySorted!1141 (t!51821 l!548))))))

(declare-fun b!1583377 () Bool)

(declare-fun tp_is_empty!39383 () Bool)

(declare-fun tp!114937 () Bool)

(assert (=> b!1583377 (= e!883798 (and tp_is_empty!39383 tp!114937))))

(assert (= (and start!137882 res!1081634) b!1583375))

(assert (= (and b!1583375 res!1081633) b!1583376))

(assert (= (and start!137882 (is-Cons!36903 l!548)) b!1583377))

(declare-fun m!1453291 () Bool)

(assert (=> start!137882 m!1453291))

(declare-fun m!1453293 () Bool)

(assert (=> b!1583376 m!1453293))

(push 1)

(assert (not start!137882))

(assert (not b!1583376))

(assert (not b!1583377))

(assert tp_is_empty!39383)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167217 () Bool)

(declare-fun res!1081651 () Bool)

(declare-fun e!883815 () Bool)

(assert (=> d!167217 (=> res!1081651 e!883815)))

(assert (=> d!167217 (= res!1081651 (or (is-Nil!36904 l!548) (is-Nil!36904 (t!51821 l!548))))))

(assert (=> d!167217 (= (isStrictlySorted!1141 l!548) e!883815)))

(declare-fun b!1583394 () Bool)

(declare-fun e!883816 () Bool)

(assert (=> b!1583394 (= e!883815 e!883816)))

(declare-fun res!1081652 () Bool)

(assert (=> b!1583394 (=> (not res!1081652) (not e!883816))))

(assert (=> b!1583394 (= res!1081652 (bvslt (_1!12882 (h!38446 l!548)) (_1!12882 (h!38446 (t!51821 l!548)))))))

(declare-fun b!1583395 () Bool)

(assert (=> b!1583395 (= e!883816 (isStrictlySorted!1141 (t!51821 l!548)))))

(assert (= (and d!167217 (not res!1081651)) b!1583394))

(assert (= (and b!1583394 res!1081652) b!1583395))

(assert (=> b!1583395 m!1453293))

(assert (=> start!137882 d!167217))

(declare-fun d!167223 () Bool)

(declare-fun res!1081653 () Bool)

(declare-fun e!883819 () Bool)

(assert (=> d!167223 (=> res!1081653 e!883819)))

(assert (=> d!167223 (= res!1081653 (or (is-Nil!36904 (t!51821 l!548)) (is-Nil!36904 (t!51821 (t!51821 l!548)))))))

(assert (=> d!167223 (= (isStrictlySorted!1141 (t!51821 l!548)) e!883819)))

(declare-fun b!1583400 () Bool)

(declare-fun e!883820 () Bool)

(assert (=> b!1583400 (= e!883819 e!883820)))

(declare-fun res!1081654 () Bool)

(assert (=> b!1583400 (=> (not res!1081654) (not e!883820))))

(assert (=> b!1583400 (= res!1081654 (bvslt (_1!12882 (h!38446 (t!51821 l!548))) (_1!12882 (h!38446 (t!51821 (t!51821 l!548))))))))

(declare-fun b!1583401 () Bool)

(assert (=> b!1583401 (= e!883820 (isStrictlySorted!1141 (t!51821 (t!51821 l!548))))))

(assert (= (and d!167223 (not res!1081653)) b!1583400))

(assert (= (and b!1583400 res!1081654) b!1583401))

(declare-fun m!1453297 () Bool)

(assert (=> b!1583401 m!1453297))

(assert (=> b!1583376 d!167223))

(declare-fun b!1583409 () Bool)

(declare-fun e!883826 () Bool)

(declare-fun tp!114943 () Bool)

(assert (=> b!1583409 (= e!883826 (and tp_is_empty!39383 tp!114943))))

(assert (=> b!1583377 (= tp!114937 e!883826)))

(assert (= (and b!1583377 (is-Cons!36903 (t!51821 l!548))) b!1583409))

(push 1)

