; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95262 () Bool)

(assert start!95262)

(declare-fun res!717561 () Bool)

(declare-fun e!615470 () Bool)

(assert (=> start!95262 (=> (not res!717561) (not e!615470))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95262 (= res!717561 (not (= a1!69 a2!57)))))

(assert (=> start!95262 e!615470))

(assert (=> start!95262 true))

(declare-datatypes ((B!1768 0))(
  ( (B!1769 (val!13087 Int)) )
))
(declare-datatypes ((tuple2!16684 0))(
  ( (tuple2!16685 (_1!8353 (_ BitVec 64)) (_2!8353 B!1768)) )
))
(declare-datatypes ((List!23209 0))(
  ( (Nil!23206) (Cons!23205 (h!24414 tuple2!16684) (t!32568 List!23209)) )
))
(declare-datatypes ((ListLongMap!14653 0))(
  ( (ListLongMap!14654 (toList!7342 List!23209)) )
))
(declare-fun lm!214 () ListLongMap!14653)

(declare-fun e!615471 () Bool)

(declare-fun inv!37854 (ListLongMap!14653) Bool)

(assert (=> start!95262 (and (inv!37854 lm!214) e!615471)))

(declare-fun b!1076643 () Bool)

(declare-fun isStrictlySorted!722 (List!23209) Bool)

(assert (=> b!1076643 (= e!615470 (not (isStrictlySorted!722 (toList!7342 lm!214))))))

(declare-fun b!1076644 () Bool)

(declare-fun tp!78263 () Bool)

(assert (=> b!1076644 (= e!615471 tp!78263)))

(assert (= (and start!95262 res!717561) b!1076643))

(assert (= start!95262 b!1076644))

(declare-fun m!995639 () Bool)

(assert (=> start!95262 m!995639))

(declare-fun m!995641 () Bool)

(assert (=> b!1076643 m!995641))

(check-sat (not b!1076643) (not start!95262) (not b!1076644))
(check-sat)
(get-model)

(declare-fun d!129715 () Bool)

(declare-fun res!717573 () Bool)

(declare-fun e!615486 () Bool)

(assert (=> d!129715 (=> res!717573 e!615486)))

(get-info :version)

(assert (=> d!129715 (= res!717573 (or ((_ is Nil!23206) (toList!7342 lm!214)) ((_ is Nil!23206) (t!32568 (toList!7342 lm!214)))))))

(assert (=> d!129715 (= (isStrictlySorted!722 (toList!7342 lm!214)) e!615486)))

(declare-fun b!1076659 () Bool)

(declare-fun e!615487 () Bool)

(assert (=> b!1076659 (= e!615486 e!615487)))

(declare-fun res!717574 () Bool)

(assert (=> b!1076659 (=> (not res!717574) (not e!615487))))

(assert (=> b!1076659 (= res!717574 (bvslt (_1!8353 (h!24414 (toList!7342 lm!214))) (_1!8353 (h!24414 (t!32568 (toList!7342 lm!214))))))))

(declare-fun b!1076660 () Bool)

(assert (=> b!1076660 (= e!615487 (isStrictlySorted!722 (t!32568 (toList!7342 lm!214))))))

(assert (= (and d!129715 (not res!717573)) b!1076659))

(assert (= (and b!1076659 res!717574) b!1076660))

(declare-fun m!995648 () Bool)

(assert (=> b!1076660 m!995648))

(assert (=> b!1076643 d!129715))

(declare-fun d!129721 () Bool)

(assert (=> d!129721 (= (inv!37854 lm!214) (isStrictlySorted!722 (toList!7342 lm!214)))))

(declare-fun bs!31716 () Bool)

(assert (= bs!31716 d!129721))

(assert (=> bs!31716 m!995641))

(assert (=> start!95262 d!129721))

(declare-fun b!1076677 () Bool)

(declare-fun e!615500 () Bool)

(declare-fun tp_is_empty!26060 () Bool)

(declare-fun tp!78271 () Bool)

(assert (=> b!1076677 (= e!615500 (and tp_is_empty!26060 tp!78271))))

(assert (=> b!1076644 (= tp!78263 e!615500)))

(assert (= (and b!1076644 ((_ is Cons!23205) (toList!7342 lm!214))) b!1076677))

(check-sat (not b!1076660) (not d!129721) (not b!1076677) tp_is_empty!26060)
(check-sat)
