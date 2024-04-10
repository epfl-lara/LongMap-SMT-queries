; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95264 () Bool)

(assert start!95264)

(declare-fun res!717564 () Bool)

(declare-fun e!615476 () Bool)

(assert (=> start!95264 (=> (not res!717564) (not e!615476))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95264 (= res!717564 (not (= a1!69 a2!57)))))

(assert (=> start!95264 e!615476))

(assert (=> start!95264 true))

(declare-datatypes ((B!1770 0))(
  ( (B!1771 (val!13088 Int)) )
))
(declare-datatypes ((tuple2!16686 0))(
  ( (tuple2!16687 (_1!8354 (_ BitVec 64)) (_2!8354 B!1770)) )
))
(declare-datatypes ((List!23210 0))(
  ( (Nil!23207) (Cons!23206 (h!24415 tuple2!16686) (t!32569 List!23210)) )
))
(declare-datatypes ((ListLongMap!14655 0))(
  ( (ListLongMap!14656 (toList!7343 List!23210)) )
))
(declare-fun lm!214 () ListLongMap!14655)

(declare-fun e!615477 () Bool)

(declare-fun inv!37855 (ListLongMap!14655) Bool)

(assert (=> start!95264 (and (inv!37855 lm!214) e!615477)))

(declare-fun b!1076649 () Bool)

(declare-fun isStrictlySorted!723 (List!23210) Bool)

(assert (=> b!1076649 (= e!615476 (not (isStrictlySorted!723 (toList!7343 lm!214))))))

(declare-fun b!1076650 () Bool)

(declare-fun tp!78266 () Bool)

(assert (=> b!1076650 (= e!615477 tp!78266)))

(assert (= (and start!95264 res!717564) b!1076649))

(assert (= start!95264 b!1076650))

(declare-fun m!995643 () Bool)

(assert (=> start!95264 m!995643))

(declare-fun m!995645 () Bool)

(assert (=> b!1076649 m!995645))

(push 1)

(assert (not b!1076649))

(assert (not start!95264))

(assert (not b!1076650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!129713 () Bool)

(declare-fun res!717575 () Bool)

(declare-fun e!615488 () Bool)

(assert (=> d!129713 (=> res!717575 e!615488)))

(assert (=> d!129713 (= res!717575 (or (is-Nil!23207 (toList!7343 lm!214)) (is-Nil!23207 (t!32569 (toList!7343 lm!214)))))))

(assert (=> d!129713 (= (isStrictlySorted!723 (toList!7343 lm!214)) e!615488)))

(declare-fun b!1076661 () Bool)

(declare-fun e!615489 () Bool)

(assert (=> b!1076661 (= e!615488 e!615489)))

(declare-fun res!717576 () Bool)

(assert (=> b!1076661 (=> (not res!717576) (not e!615489))))

(assert (=> b!1076661 (= res!717576 (bvslt (_1!8354 (h!24415 (toList!7343 lm!214))) (_1!8354 (h!24415 (t!32569 (toList!7343 lm!214))))))))

(declare-fun b!1076662 () Bool)

(assert (=> b!1076662 (= e!615489 (isStrictlySorted!723 (t!32569 (toList!7343 lm!214))))))

(assert (= (and d!129713 (not res!717575)) b!1076661))

(assert (= (and b!1076661 res!717576) b!1076662))

(declare-fun m!995649 () Bool)

(assert (=> b!1076662 m!995649))

(assert (=> b!1076649 d!129713))

(declare-fun d!129720 () Bool)

(assert (=> d!129720 (= (inv!37855 lm!214) (isStrictlySorted!723 (toList!7343 lm!214)))))

(declare-fun bs!31717 () Bool)

(assert (= bs!31717 d!129720))

(assert (=> bs!31717 m!995645))

(assert (=> start!95264 d!129720))

(declare-fun b!1076678 () Bool)

(declare-fun e!615501 () Bool)

(declare-fun tp_is_empty!26061 () Bool)

(declare-fun tp!78272 () Bool)

(assert (=> b!1076678 (= e!615501 (and tp_is_empty!26061 tp!78272))))

(assert (=> b!1076650 (= tp!78266 e!615501)))

(assert (= (and b!1076650 (is-Cons!23206 (toList!7343 lm!214))) b!1076678))

(push 1)

