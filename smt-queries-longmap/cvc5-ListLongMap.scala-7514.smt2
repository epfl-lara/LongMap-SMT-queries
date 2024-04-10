; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95260 () Bool)

(assert start!95260)

(declare-fun res!717558 () Bool)

(declare-fun e!615464 () Bool)

(assert (=> start!95260 (=> (not res!717558) (not e!615464))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95260 (= res!717558 (not (= a1!69 a2!57)))))

(assert (=> start!95260 e!615464))

(assert (=> start!95260 true))

(declare-datatypes ((B!1766 0))(
  ( (B!1767 (val!13086 Int)) )
))
(declare-datatypes ((tuple2!16682 0))(
  ( (tuple2!16683 (_1!8352 (_ BitVec 64)) (_2!8352 B!1766)) )
))
(declare-datatypes ((List!23208 0))(
  ( (Nil!23205) (Cons!23204 (h!24413 tuple2!16682) (t!32567 List!23208)) )
))
(declare-datatypes ((ListLongMap!14651 0))(
  ( (ListLongMap!14652 (toList!7341 List!23208)) )
))
(declare-fun lm!214 () ListLongMap!14651)

(declare-fun e!615465 () Bool)

(declare-fun inv!37853 (ListLongMap!14651) Bool)

(assert (=> start!95260 (and (inv!37853 lm!214) e!615465)))

(declare-fun b!1076637 () Bool)

(declare-fun isStrictlySorted!721 (List!23208) Bool)

(assert (=> b!1076637 (= e!615464 (not (isStrictlySorted!721 (toList!7341 lm!214))))))

(declare-fun b!1076638 () Bool)

(declare-fun tp!78260 () Bool)

(assert (=> b!1076638 (= e!615465 tp!78260)))

(assert (= (and start!95260 res!717558) b!1076637))

(assert (= start!95260 b!1076638))

(declare-fun m!995635 () Bool)

(assert (=> start!95260 m!995635))

(declare-fun m!995637 () Bool)

(assert (=> b!1076637 m!995637))

(push 1)

(assert (not b!1076637))

(assert (not start!95260))

(assert (not b!1076638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!129717 () Bool)

(declare-fun res!717581 () Bool)

(declare-fun e!615498 () Bool)

(assert (=> d!129717 (=> res!717581 e!615498)))

(assert (=> d!129717 (= res!717581 (or (is-Nil!23205 (toList!7341 lm!214)) (is-Nil!23205 (t!32567 (toList!7341 lm!214)))))))

(assert (=> d!129717 (= (isStrictlySorted!721 (toList!7341 lm!214)) e!615498)))

(declare-fun b!1076675 () Bool)

(declare-fun e!615499 () Bool)

(assert (=> b!1076675 (= e!615498 e!615499)))

(declare-fun res!717582 () Bool)

(assert (=> b!1076675 (=> (not res!717582) (not e!615499))))

(assert (=> b!1076675 (= res!717582 (bvslt (_1!8352 (h!24413 (toList!7341 lm!214))) (_1!8352 (h!24413 (t!32567 (toList!7341 lm!214))))))))

(declare-fun b!1076676 () Bool)

(assert (=> b!1076676 (= e!615499 (isStrictlySorted!721 (t!32567 (toList!7341 lm!214))))))

(assert (= (and d!129717 (not res!717581)) b!1076675))

(assert (= (and b!1076675 res!717582) b!1076676))

(declare-fun m!995651 () Bool)

(assert (=> b!1076676 m!995651))

(assert (=> b!1076637 d!129717))

(declare-fun d!129723 () Bool)

(assert (=> d!129723 (= (inv!37853 lm!214) (isStrictlySorted!721 (toList!7341 lm!214)))))

(declare-fun bs!31718 () Bool)

(assert (= bs!31718 d!129723))

(assert (=> bs!31718 m!995637))

(assert (=> start!95260 d!129723))

(declare-fun b!1076683 () Bool)

(declare-fun e!615504 () Bool)

(declare-fun tp_is_empty!26063 () Bool)

(declare-fun tp!78275 () Bool)

(assert (=> b!1076683 (= e!615504 (and tp_is_empty!26063 tp!78275))))

(assert (=> b!1076638 (= tp!78260 e!615504)))

(assert (= (and b!1076638 (is-Cons!23204 (toList!7341 lm!214))) b!1076683))

