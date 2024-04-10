; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5240 () Bool)

(assert start!5240)

(declare-datatypes ((B!798 0))(
  ( (B!799 (val!899 Int)) )
))
(declare-datatypes ((tuple2!1458 0))(
  ( (tuple2!1459 (_1!740 (_ BitVec 64)) (_2!740 B!798)) )
))
(declare-datatypes ((List!1009 0))(
  ( (Nil!1006) (Cons!1005 (h!1573 tuple2!1458) (t!3842 List!1009)) )
))
(declare-datatypes ((ListLongMap!1035 0))(
  ( (ListLongMap!1036 (toList!533 List!1009)) )
))
(declare-fun lm!266 () ListLongMap!1035)

(declare-fun isStrictlySorted!205 (List!1009) Bool)

(assert (=> start!5240 (not (isStrictlySorted!205 (toList!533 lm!266)))))

(declare-fun e!24172 () Bool)

(declare-fun inv!1709 (ListLongMap!1035) Bool)

(assert (=> start!5240 (and (inv!1709 lm!266) e!24172)))

(declare-fun b!38026 () Bool)

(declare-fun tp!5657 () Bool)

(assert (=> b!38026 (= e!24172 tp!5657)))

(assert (= start!5240 b!38026))

(declare-fun m!30717 () Bool)

(assert (=> start!5240 m!30717))

(declare-fun m!30719 () Bool)

(assert (=> start!5240 m!30719))

(push 1)

(assert (not start!5240))

(assert (not b!38026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6157 () Bool)

(declare-fun res!22969 () Bool)

(declare-fun e!24185 () Bool)

(assert (=> d!6157 (=> res!22969 e!24185)))

(assert (=> d!6157 (= res!22969 (or (is-Nil!1006 (toList!533 lm!266)) (is-Nil!1006 (t!3842 (toList!533 lm!266)))))))

(assert (=> d!6157 (= (isStrictlySorted!205 (toList!533 lm!266)) e!24185)))

(declare-fun b!38039 () Bool)

(declare-fun e!24186 () Bool)

(assert (=> b!38039 (= e!24185 e!24186)))

(declare-fun res!22970 () Bool)

(assert (=> b!38039 (=> (not res!22970) (not e!24186))))

(assert (=> b!38039 (= res!22970 (bvslt (_1!740 (h!1573 (toList!533 lm!266))) (_1!740 (h!1573 (t!3842 (toList!533 lm!266))))))))

(declare-fun b!38040 () Bool)

(assert (=> b!38040 (= e!24186 (isStrictlySorted!205 (t!3842 (toList!533 lm!266))))))

(assert (= (and d!6157 (not res!22969)) b!38039))

(assert (= (and b!38039 res!22970) b!38040))

(declare-fun m!30721 () Bool)

(assert (=> b!38040 m!30721))

(assert (=> start!5240 d!6157))

(declare-fun d!6161 () Bool)

(assert (=> d!6161 (= (inv!1709 lm!266) (isStrictlySorted!205 (toList!533 lm!266)))))

(declare-fun bs!1519 () Bool)

(assert (= bs!1519 d!6161))

(assert (=> bs!1519 m!30717))

(assert (=> start!5240 d!6161))

(declare-fun b!38049 () Bool)

(declare-fun e!24193 () Bool)

(declare-fun tp_is_empty!1717 () Bool)

(declare-fun tp!5660 () Bool)

(assert (=> b!38049 (= e!24193 (and tp_is_empty!1717 tp!5660))))

(assert (=> b!38026 (= tp!5657 e!24193)))

(assert (= (and b!38026 (is-Cons!1005 (toList!533 lm!266))) b!38049))

(push 1)

