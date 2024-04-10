; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2310 () Bool)

(assert start!2310)

(declare-fun res!11527 () Bool)

(declare-fun e!9160 () Bool)

(assert (=> start!2310 (=> (not res!11527) (not e!9160))))

(declare-datatypes ((B!584 0))(
  ( (B!585 (val!390 Int)) )
))
(declare-datatypes ((tuple2!580 0))(
  ( (tuple2!581 (_1!290 (_ BitVec 64)) (_2!290 B!584)) )
))
(declare-datatypes ((List!448 0))(
  ( (Nil!445) (Cons!444 (h!1010 tuple2!580) (t!2850 List!448)) )
))
(declare-datatypes ((ListLongMap!411 0))(
  ( (ListLongMap!412 (toList!221 List!448)) )
))
(declare-fun thiss!169 () ListLongMap!411)

(declare-fun isEmpty!111 (ListLongMap!411) Bool)

(assert (=> start!2310 (= res!11527 (not (isEmpty!111 thiss!169)))))

(assert (=> start!2310 e!9160))

(declare-fun e!9161 () Bool)

(declare-fun inv!752 (ListLongMap!411) Bool)

(assert (=> start!2310 (and (inv!752 thiss!169) e!9161)))

(declare-fun b!15160 () Bool)

(assert (=> b!15160 (= e!9160 (= (toList!221 thiss!169) Nil!445))))

(declare-fun b!15161 () Bool)

(declare-fun tp!2447 () Bool)

(assert (=> b!15161 (= e!9161 tp!2447)))

(assert (= (and start!2310 res!11527) b!15160))

(assert (= start!2310 b!15161))

(declare-fun m!10097 () Bool)

(assert (=> start!2310 m!10097))

(declare-fun m!10099 () Bool)

(assert (=> start!2310 m!10099))

(push 1)

(assert (not start!2310))

(assert (not b!15161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2527 () Bool)

(declare-fun isEmpty!114 (List!448) Bool)

(assert (=> d!2527 (= (isEmpty!111 thiss!169) (isEmpty!114 (toList!221 thiss!169)))))

(declare-fun bs!634 () Bool)

(assert (= bs!634 d!2527))

(declare-fun m!10110 () Bool)

(assert (=> bs!634 m!10110))

(assert (=> start!2310 d!2527))

(declare-fun d!2533 () Bool)

(declare-fun isStrictlySorted!132 (List!448) Bool)

(assert (=> d!2533 (= (inv!752 thiss!169) (isStrictlySorted!132 (toList!221 thiss!169)))))

(declare-fun bs!636 () Bool)

(assert (= bs!636 d!2533))

(declare-fun m!10115 () Bool)

(assert (=> bs!636 m!10115))

(assert (=> start!2310 d!2533))

(declare-fun b!15187 () Bool)

(declare-fun e!9181 () Bool)

(declare-fun tp_is_empty!764 () Bool)

(declare-fun tp!2461 () Bool)

(assert (=> b!15187 (= e!9181 (and tp_is_empty!764 tp!2461))))

(assert (=> b!15161 (= tp!2447 e!9181)))

(assert (= (and b!15161 (is-Cons!444 (toList!221 thiss!169))) b!15187))

(push 1)

(assert (not d!2533))

(assert (not d!2527))

(assert (not b!15187))

(assert tp_is_empty!764)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2537 () Bool)

(declare-fun res!11538 () Bool)

(declare-fun e!9187 () Bool)

(assert (=> d!2537 (=> res!11538 e!9187)))

(assert (=> d!2537 (= res!11538 (or (is-Nil!445 (toList!221 thiss!169)) (is-Nil!445 (t!2850 (toList!221 thiss!169)))))))

(assert (=> d!2537 (= (isStrictlySorted!132 (toList!221 thiss!169)) e!9187)))

(declare-fun b!15193 () Bool)

(declare-fun e!9188 () Bool)

(assert (=> b!15193 (= e!9187 e!9188)))

(declare-fun res!11539 () Bool)

(assert (=> b!15193 (=> (not res!11539) (not e!9188))))

(assert (=> b!15193 (= res!11539 (bvslt (_1!290 (h!1010 (toList!221 thiss!169))) (_1!290 (h!1010 (t!2850 (toList!221 thiss!169))))))))

(declare-fun b!15194 () Bool)

(assert (=> b!15194 (= e!9188 (isStrictlySorted!132 (t!2850 (toList!221 thiss!169))))))

(assert (= (and d!2537 (not res!11538)) b!15193))

(assert (= (and b!15193 res!11539) b!15194))

(declare-fun m!10121 () Bool)

(assert (=> b!15194 m!10121))

(assert (=> d!2533 d!2537))

(declare-fun d!2543 () Bool)

(assert (=> d!2543 (= (isEmpty!114 (toList!221 thiss!169)) (is-Nil!445 (toList!221 thiss!169)))))

(assert (=> d!2527 d!2543))

(declare-fun b!15199 () Bool)

(declare-fun e!9193 () Bool)

(declare-fun tp!2463 () Bool)

(assert (=> b!15199 (= e!9193 (and tp_is_empty!764 tp!2463))))

(assert (=> b!15187 (= tp!2461 e!9193)))

(assert (= (and b!15187 (is-Cons!444 (t!2850 (toList!221 thiss!169)))) b!15199))

(push 1)

(assert (not b!15194))

(assert (not b!15199))

(assert tp_is_empty!764)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

