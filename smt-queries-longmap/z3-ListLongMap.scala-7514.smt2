; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95254 () Bool)

(assert start!95254)

(declare-fun res!717489 () Bool)

(declare-fun e!615371 () Bool)

(assert (=> start!95254 (=> (not res!717489) (not e!615371))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95254 (= res!717489 (not (= a1!69 a2!57)))))

(assert (=> start!95254 e!615371))

(assert (=> start!95254 true))

(declare-datatypes ((B!1766 0))(
  ( (B!1767 (val!13086 Int)) )
))
(declare-datatypes ((tuple2!16750 0))(
  ( (tuple2!16751 (_1!8386 (_ BitVec 64)) (_2!8386 B!1766)) )
))
(declare-datatypes ((List!23259 0))(
  ( (Nil!23256) (Cons!23255 (h!24464 tuple2!16750) (t!32609 List!23259)) )
))
(declare-datatypes ((ListLongMap!14719 0))(
  ( (ListLongMap!14720 (toList!7375 List!23259)) )
))
(declare-fun lm!214 () ListLongMap!14719)

(declare-fun e!615372 () Bool)

(declare-fun inv!37853 (ListLongMap!14719) Bool)

(assert (=> start!95254 (and (inv!37853 lm!214) e!615372)))

(declare-fun b!1076484 () Bool)

(declare-fun isStrictlySorted!717 (List!23259) Bool)

(assert (=> b!1076484 (= e!615371 (not (isStrictlySorted!717 (toList!7375 lm!214))))))

(declare-fun b!1076485 () Bool)

(declare-fun tp!78260 () Bool)

(assert (=> b!1076485 (= e!615372 tp!78260)))

(assert (= (and start!95254 res!717489) b!1076484))

(assert (= start!95254 b!1076485))

(declare-fun m!995009 () Bool)

(assert (=> start!95254 m!995009))

(declare-fun m!995011 () Bool)

(assert (=> b!1076484 m!995011))

(check-sat (not b!1076484) (not start!95254) (not b!1076485))
(check-sat)
(get-model)

(declare-fun d!129557 () Bool)

(declare-fun res!717504 () Bool)

(declare-fun e!615393 () Bool)

(assert (=> d!129557 (=> res!717504 e!615393)))

(get-info :version)

(assert (=> d!129557 (= res!717504 (or ((_ is Nil!23256) (toList!7375 lm!214)) ((_ is Nil!23256) (t!32609 (toList!7375 lm!214)))))))

(assert (=> d!129557 (= (isStrictlySorted!717 (toList!7375 lm!214)) e!615393)))

(declare-fun b!1076506 () Bool)

(declare-fun e!615394 () Bool)

(assert (=> b!1076506 (= e!615393 e!615394)))

(declare-fun res!717505 () Bool)

(assert (=> b!1076506 (=> (not res!717505) (not e!615394))))

(assert (=> b!1076506 (= res!717505 (bvslt (_1!8386 (h!24464 (toList!7375 lm!214))) (_1!8386 (h!24464 (t!32609 (toList!7375 lm!214))))))))

(declare-fun b!1076507 () Bool)

(assert (=> b!1076507 (= e!615394 (isStrictlySorted!717 (t!32609 (toList!7375 lm!214))))))

(assert (= (and d!129557 (not res!717504)) b!1076506))

(assert (= (and b!1076506 res!717505) b!1076507))

(declare-fun m!995021 () Bool)

(assert (=> b!1076507 m!995021))

(assert (=> b!1076484 d!129557))

(declare-fun d!129565 () Bool)

(assert (=> d!129565 (= (inv!37853 lm!214) (isStrictlySorted!717 (toList!7375 lm!214)))))

(declare-fun bs!31689 () Bool)

(assert (= bs!31689 d!129565))

(assert (=> bs!31689 m!995011))

(assert (=> start!95254 d!129565))

(declare-fun b!1076518 () Bool)

(declare-fun e!615401 () Bool)

(declare-fun tp_is_empty!26059 () Bool)

(declare-fun tp!78271 () Bool)

(assert (=> b!1076518 (= e!615401 (and tp_is_empty!26059 tp!78271))))

(assert (=> b!1076485 (= tp!78260 e!615401)))

(assert (= (and b!1076485 ((_ is Cons!23255) (toList!7375 lm!214))) b!1076518))

(check-sat (not b!1076507) (not d!129565) (not b!1076518) tp_is_empty!26059)
(check-sat)
