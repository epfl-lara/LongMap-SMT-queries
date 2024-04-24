; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95496 () Bool)

(assert start!95496)

(declare-fun res!718080 () Bool)

(declare-fun e!616319 () Bool)

(assert (=> start!95496 (=> (not res!718080) (not e!616319))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95496 (= res!718080 (not (= a1!69 a2!57)))))

(assert (=> start!95496 e!616319))

(assert (=> start!95496 true))

(declare-datatypes ((B!1766 0))(
  ( (B!1767 (val!13086 Int)) )
))
(declare-datatypes ((tuple2!16674 0))(
  ( (tuple2!16675 (_1!8348 (_ BitVec 64)) (_2!8348 B!1766)) )
))
(declare-datatypes ((List!23216 0))(
  ( (Nil!23213) (Cons!23212 (h!24430 tuple2!16674) (t!32567 List!23216)) )
))
(declare-datatypes ((ListLongMap!14651 0))(
  ( (ListLongMap!14652 (toList!7341 List!23216)) )
))
(declare-fun lm!214 () ListLongMap!14651)

(declare-fun e!616320 () Bool)

(declare-fun inv!37853 (ListLongMap!14651) Bool)

(assert (=> start!95496 (and (inv!37853 lm!214) e!616320)))

(declare-fun b!1077964 () Bool)

(declare-fun isStrictlySorted!709 (List!23216) Bool)

(assert (=> b!1077964 (= e!616319 (not (isStrictlySorted!709 (toList!7341 lm!214))))))

(declare-fun b!1077965 () Bool)

(declare-fun tp!78260 () Bool)

(assert (=> b!1077965 (= e!616320 tp!78260)))

(assert (= (and start!95496 res!718080) b!1077964))

(assert (= start!95496 b!1077965))

(declare-fun m!997307 () Bool)

(assert (=> start!95496 m!997307))

(declare-fun m!997309 () Bool)

(assert (=> b!1077964 m!997309))

(check-sat (not b!1077964) (not start!95496) (not b!1077965))
(check-sat)
(get-model)

(declare-fun d!130179 () Bool)

(declare-fun res!718096 () Bool)

(declare-fun e!616342 () Bool)

(assert (=> d!130179 (=> res!718096 e!616342)))

(get-info :version)

(assert (=> d!130179 (= res!718096 (or ((_ is Nil!23213) (toList!7341 lm!214)) ((_ is Nil!23213) (t!32567 (toList!7341 lm!214)))))))

(assert (=> d!130179 (= (isStrictlySorted!709 (toList!7341 lm!214)) e!616342)))

(declare-fun b!1077987 () Bool)

(declare-fun e!616344 () Bool)

(assert (=> b!1077987 (= e!616342 e!616344)))

(declare-fun res!718098 () Bool)

(assert (=> b!1077987 (=> (not res!718098) (not e!616344))))

(assert (=> b!1077987 (= res!718098 (bvslt (_1!8348 (h!24430 (toList!7341 lm!214))) (_1!8348 (h!24430 (t!32567 (toList!7341 lm!214))))))))

(declare-fun b!1077989 () Bool)

(assert (=> b!1077989 (= e!616344 (isStrictlySorted!709 (t!32567 (toList!7341 lm!214))))))

(assert (= (and d!130179 (not res!718096)) b!1077987))

(assert (= (and b!1077987 res!718098) b!1077989))

(declare-fun m!997321 () Bool)

(assert (=> b!1077989 m!997321))

(assert (=> b!1077964 d!130179))

(declare-fun d!130185 () Bool)

(assert (=> d!130185 (= (inv!37853 lm!214) (isStrictlySorted!709 (toList!7341 lm!214)))))

(declare-fun bs!31737 () Bool)

(assert (= bs!31737 d!130185))

(assert (=> bs!31737 m!997309))

(assert (=> start!95496 d!130185))

(declare-fun b!1078003 () Bool)

(declare-fun e!616354 () Bool)

(declare-fun tp_is_empty!26059 () Bool)

(declare-fun tp!78272 () Bool)

(assert (=> b!1078003 (= e!616354 (and tp_is_empty!26059 tp!78272))))

(assert (=> b!1077965 (= tp!78260 e!616354)))

(assert (= (and b!1077965 ((_ is Cons!23212) (toList!7341 lm!214))) b!1078003))

(check-sat (not d!130185) (not b!1077989) (not b!1078003) tp_is_empty!26059)
(check-sat)
