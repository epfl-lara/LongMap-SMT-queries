; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7780 () Bool)

(assert start!7780)

(declare-datatypes ((B!1004 0))(
  ( (B!1005 (val!1122 Int)) )
))
(declare-datatypes ((tuple2!1826 0))(
  ( (tuple2!1827 (_1!924 (_ BitVec 64)) (_2!924 B!1004)) )
))
(declare-datatypes ((List!1319 0))(
  ( (Nil!1316) (Cons!1315 (h!1895 tuple2!1826) (t!4353 List!1319)) )
))
(declare-datatypes ((ListLongMap!1247 0))(
  ( (ListLongMap!1248 (toList!639 List!1319)) )
))
(declare-fun thiss!192 () ListLongMap!1247)

(declare-fun isStrictlySorted!277 (List!1319) Bool)

(assert (=> start!7780 (not (isStrictlySorted!277 (toList!639 thiss!192)))))

(declare-fun e!31747 () Bool)

(declare-fun inv!2304 (ListLongMap!1247) Bool)

(assert (=> start!7780 (and (inv!2304 thiss!192) e!31747)))

(declare-fun b!49415 () Bool)

(declare-fun tp!6533 () Bool)

(assert (=> b!49415 (= e!31747 tp!6533)))

(assert (= start!7780 b!49415))

(declare-fun m!42837 () Bool)

(assert (=> start!7780 m!42837))

(declare-fun m!42839 () Bool)

(assert (=> start!7780 m!42839))

(push 1)

(assert (not start!7780))

(assert (not b!49415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9899 () Bool)

(declare-fun res!28612 () Bool)

(declare-fun e!31770 () Bool)

(assert (=> d!9899 (=> res!28612 e!31770)))

(assert (=> d!9899 (= res!28612 (or (is-Nil!1316 (toList!639 thiss!192)) (is-Nil!1316 (t!4353 (toList!639 thiss!192)))))))

(assert (=> d!9899 (= (isStrictlySorted!277 (toList!639 thiss!192)) e!31770)))

(declare-fun b!49438 () Bool)

(declare-fun e!31771 () Bool)

(assert (=> b!49438 (= e!31770 e!31771)))

(declare-fun res!28613 () Bool)

(assert (=> b!49438 (=> (not res!28613) (not e!31771))))

(assert (=> b!49438 (= res!28613 (bvslt (_1!924 (h!1895 (toList!639 thiss!192))) (_1!924 (h!1895 (t!4353 (toList!639 thiss!192))))))))

(declare-fun b!49439 () Bool)

(assert (=> b!49439 (= e!31771 (isStrictlySorted!277 (t!4353 (toList!639 thiss!192))))))

(assert (= (and d!9899 (not res!28612)) b!49438))

(assert (= (and b!49438 res!28613) b!49439))

(declare-fun m!42853 () Bool)

(assert (=> b!49439 m!42853))

(assert (=> start!7780 d!9899))

(declare-fun d!9905 () Bool)

(assert (=> d!9905 (= (inv!2304 thiss!192) (isStrictlySorted!277 (toList!639 thiss!192)))))

(declare-fun bs!2298 () Bool)

(assert (= bs!2298 d!9905))

(assert (=> bs!2298 m!42837))

(assert (=> start!7780 d!9905))

(declare-fun b!49454 () Bool)

(declare-fun e!31780 () Bool)

(declare-fun tp_is_empty!2159 () Bool)

(declare-fun tp!6548 () Bool)

(assert (=> b!49454 (= e!31780 (and tp_is_empty!2159 tp!6548))))

(assert (=> b!49415 (= tp!6533 e!31780)))

(assert (= (and b!49415 (is-Cons!1315 (toList!639 thiss!192))) b!49454))

(push 1)

(assert (not b!49439))

(assert (not d!9905))

(assert (not b!49454))

(assert tp_is_empty!2159)

