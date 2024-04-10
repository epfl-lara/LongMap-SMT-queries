; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2314 () Bool)

(assert start!2314)

(declare-fun res!11533 () Bool)

(declare-fun e!9172 () Bool)

(assert (=> start!2314 (=> (not res!11533) (not e!9172))))

(declare-datatypes ((B!588 0))(
  ( (B!589 (val!392 Int)) )
))
(declare-datatypes ((tuple2!584 0))(
  ( (tuple2!585 (_1!292 (_ BitVec 64)) (_2!292 B!588)) )
))
(declare-datatypes ((List!450 0))(
  ( (Nil!447) (Cons!446 (h!1012 tuple2!584) (t!2852 List!450)) )
))
(declare-datatypes ((ListLongMap!415 0))(
  ( (ListLongMap!416 (toList!223 List!450)) )
))
(declare-fun thiss!169 () ListLongMap!415)

(declare-fun isEmpty!113 (ListLongMap!415) Bool)

(assert (=> start!2314 (= res!11533 (not (isEmpty!113 thiss!169)))))

(assert (=> start!2314 e!9172))

(declare-fun e!9173 () Bool)

(declare-fun inv!754 (ListLongMap!415) Bool)

(assert (=> start!2314 (and (inv!754 thiss!169) e!9173)))

(declare-fun b!15172 () Bool)

(assert (=> b!15172 (= e!9172 (= (toList!223 thiss!169) Nil!447))))

(declare-fun b!15173 () Bool)

(declare-fun tp!2453 () Bool)

(assert (=> b!15173 (= e!9173 tp!2453)))

(assert (= (and start!2314 res!11533) b!15172))

(assert (= start!2314 b!15173))

(declare-fun m!10105 () Bool)

(assert (=> start!2314 m!10105))

(declare-fun m!10107 () Bool)

(assert (=> start!2314 m!10107))

(push 1)

(assert (not start!2314))

(assert (not b!15173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2529 () Bool)

(declare-fun isEmpty!116 (List!450) Bool)

(assert (=> d!2529 (= (isEmpty!113 thiss!169) (isEmpty!116 (toList!223 thiss!169)))))

(declare-fun bs!635 () Bool)

(assert (= bs!635 d!2529))

(declare-fun m!10113 () Bool)

(assert (=> bs!635 m!10113))

(assert (=> start!2314 d!2529))

(declare-fun d!2535 () Bool)

(declare-fun isStrictlySorted!134 (List!450) Bool)

(assert (=> d!2535 (= (inv!754 thiss!169) (isStrictlySorted!134 (toList!223 thiss!169)))))

(declare-fun bs!638 () Bool)

(assert (= bs!638 d!2535))

(declare-fun m!10119 () Bool)

(assert (=> bs!638 m!10119))

(assert (=> start!2314 d!2535))

(declare-fun b!15188 () Bool)

(declare-fun e!9182 () Bool)

(declare-fun tp_is_empty!767 () Bool)

(declare-fun tp!2462 () Bool)

(assert (=> b!15188 (= e!9182 (and tp_is_empty!767 tp!2462))))

(assert (=> b!15173 (= tp!2453 e!9182)))

(assert (= (and b!15173 (is-Cons!446 (toList!223 thiss!169))) b!15188))

(push 1)

(assert (not d!2529))

(assert (not d!2535))

(assert (not b!15188))

(assert tp_is_empty!767)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2545 () Bool)

(assert (=> d!2545 (= (isEmpty!116 (toList!223 thiss!169)) (is-Nil!447 (toList!223 thiss!169)))))

(assert (=> d!2529 d!2545))

(declare-fun d!2547 () Bool)

(declare-fun res!11550 () Bool)

(declare-fun e!9201 () Bool)

(assert (=> d!2547 (=> res!11550 e!9201)))

(assert (=> d!2547 (= res!11550 (or (is-Nil!447 (toList!223 thiss!169)) (is-Nil!447 (t!2852 (toList!223 thiss!169)))))))

(assert (=> d!2547 (= (isStrictlySorted!134 (toList!223 thiss!169)) e!9201)))

(declare-fun b!15207 () Bool)

(declare-fun e!9202 () Bool)

(assert (=> b!15207 (= e!9201 e!9202)))

(declare-fun res!11551 () Bool)

(assert (=> b!15207 (=> (not res!11551) (not e!9202))))

(assert (=> b!15207 (= res!11551 (bvslt (_1!292 (h!1012 (toList!223 thiss!169))) (_1!292 (h!1012 (t!2852 (toList!223 thiss!169))))))))

(declare-fun b!15208 () Bool)

(assert (=> b!15208 (= e!9202 (isStrictlySorted!134 (t!2852 (toList!223 thiss!169))))))

(assert (= (and d!2547 (not res!11550)) b!15207))

