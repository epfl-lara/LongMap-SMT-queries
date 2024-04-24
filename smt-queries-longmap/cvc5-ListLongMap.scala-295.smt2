; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5142 () Bool)

(assert start!5142)

(declare-fun res!22778 () Bool)

(declare-fun e!23889 () Bool)

(assert (=> start!5142 (=> (not res!22778) (not e!23889))))

(declare-datatypes ((List!976 0))(
  ( (Nil!973) (Cons!972 (h!1540 (_ BitVec 64)) (t!3809 List!976)) )
))
(declare-fun keys!14 () List!976)

(assert (=> start!5142 (= res!22778 (not (is-Nil!973 keys!14)))))

(assert (=> start!5142 e!23889))

(assert (=> start!5142 true))

(declare-datatypes ((B!762 0))(
  ( (B!763 (val!881 Int)) )
))
(declare-datatypes ((tuple2!1404 0))(
  ( (tuple2!1405 (_1!713 (_ BitVec 64)) (_2!713 B!762)) )
))
(declare-datatypes ((List!977 0))(
  ( (Nil!974) (Cons!973 (h!1541 tuple2!1404) (t!3810 List!977)) )
))
(declare-datatypes ((ListLongMap!975 0))(
  ( (ListLongMap!976 (toList!503 List!977)) )
))
(declare-fun thiss!221 () ListLongMap!975)

(declare-fun e!23888 () Bool)

(declare-fun inv!1661 (ListLongMap!975) Bool)

(assert (=> start!5142 (and (inv!1661 thiss!221) e!23888)))

(declare-fun b!37692 () Bool)

(declare-fun ListPrimitiveSize!39 (List!976) Int)

(assert (=> b!37692 (= e!23889 (>= (ListPrimitiveSize!39 (t!3809 keys!14)) (ListPrimitiveSize!39 keys!14)))))

(declare-fun lt!13852 () ListLongMap!975)

(declare-fun -!37 (ListLongMap!975 (_ BitVec 64)) ListLongMap!975)

(assert (=> b!37692 (= lt!13852 (-!37 thiss!221 (h!1540 keys!14)))))

(declare-fun b!37693 () Bool)

(declare-fun tp!5576 () Bool)

(assert (=> b!37693 (= e!23888 tp!5576)))

(assert (= (and start!5142 res!22778) b!37692))

(assert (= start!5142 b!37693))

(declare-fun m!30365 () Bool)

(assert (=> start!5142 m!30365))

(declare-fun m!30367 () Bool)

(assert (=> b!37692 m!30367))

(declare-fun m!30369 () Bool)

(assert (=> b!37692 m!30369))

(declare-fun m!30371 () Bool)

(assert (=> b!37692 m!30371))

(push 1)

(assert (not start!5142))

(assert (not b!37692))

(assert (not b!37693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6057 () Bool)

(declare-fun isStrictlySorted!178 (List!977) Bool)

(assert (=> d!6057 (= (inv!1661 thiss!221) (isStrictlySorted!178 (toList!503 thiss!221)))))

(declare-fun bs!1488 () Bool)

(assert (= bs!1488 d!6057))

(declare-fun m!30373 () Bool)

(assert (=> bs!1488 m!30373))

(assert (=> start!5142 d!6057))

(declare-fun d!6063 () Bool)

(declare-fun lt!13857 () Int)

(assert (=> d!6063 (>= lt!13857 0)))

(declare-fun e!23894 () Int)

(assert (=> d!6063 (= lt!13857 e!23894)))

(declare-fun c!4353 () Bool)

(assert (=> d!6063 (= c!4353 (is-Nil!973 (t!3809 keys!14)))))

(assert (=> d!6063 (= (ListPrimitiveSize!39 (t!3809 keys!14)) lt!13857)))

(declare-fun b!37702 () Bool)

(assert (=> b!37702 (= e!23894 0)))

(declare-fun b!37703 () Bool)

(assert (=> b!37703 (= e!23894 (+ 1 (ListPrimitiveSize!39 (t!3809 (t!3809 keys!14)))))))

(assert (= (and d!6063 c!4353) b!37702))

(assert (= (and d!6063 (not c!4353)) b!37703))

(declare-fun m!30379 () Bool)

(assert (=> b!37703 m!30379))

(assert (=> b!37692 d!6063))

(declare-fun d!6069 () Bool)

(declare-fun lt!13861 () Int)

(assert (=> d!6069 (>= lt!13861 0)))

(declare-fun e!23898 () Int)

(assert (=> d!6069 (= lt!13861 e!23898)))

(declare-fun c!4357 () Bool)

(assert (=> d!6069 (= c!4357 (is-Nil!973 keys!14))))

(assert (=> d!6069 (= (ListPrimitiveSize!39 keys!14) lt!13861)))

(declare-fun b!37710 () Bool)

(assert (=> b!37710 (= e!23898 0)))

(declare-fun b!37711 () Bool)

(assert (=> b!37711 (= e!23898 (+ 1 (ListPrimitiveSize!39 (t!3809 keys!14))))))

(assert (= (and d!6069 c!4357) b!37710))

(assert (= (and d!6069 (not c!4357)) b!37711))

(assert (=> b!37711 m!30367))

(assert (=> b!37692 d!6069))

(declare-fun d!6073 () Bool)

(declare-fun lt!13869 () ListLongMap!975)

(declare-fun contains!454 (ListLongMap!975 (_ BitVec 64)) Bool)

(assert (=> d!6073 (not (contains!454 lt!13869 (h!1540 keys!14)))))

(declare-fun removeStrictlySorted!20 (List!977 (_ BitVec 64)) List!977)

(assert (=> d!6073 (= lt!13869 (ListLongMap!976 (removeStrictlySorted!20 (toList!503 thiss!221) (h!1540 keys!14))))))

(assert (=> d!6073 (= (-!37 thiss!221 (h!1540 keys!14)) lt!13869)))

(declare-fun bs!1491 () Bool)

(assert (= bs!1491 d!6073))

(declare-fun m!30385 () Bool)

(assert (=> bs!1491 m!30385))

(declare-fun m!30389 () Bool)

(assert (=> bs!1491 m!30389))

(assert (=> b!37692 d!6073))

(declare-fun b!37726 () Bool)

(declare-fun e!23906 () Bool)

(declare-fun tp_is_empty!1683 () Bool)

(declare-fun tp!5581 () Bool)

(assert (=> b!37726 (= e!23906 (and tp_is_empty!1683 tp!5581))))

(assert (=> b!37693 (= tp!5576 e!23906)))

(assert (= (and b!37693 (is-Cons!973 (toList!503 thiss!221))) b!37726))

(push 1)

(assert tp_is_empty!1683)

(assert (not b!37703))

(assert (not b!37726))

(assert (not d!6073))

(assert (not b!37711))

(assert (not d!6057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

