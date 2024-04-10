; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5282 () Bool)

(assert start!5282)

(declare-datatypes ((B!810 0))(
  ( (B!811 (val!905 Int)) )
))
(declare-datatypes ((tuple2!1470 0))(
  ( (tuple2!1471 (_1!746 (_ BitVec 64)) (_2!746 B!810)) )
))
(declare-datatypes ((List!1018 0))(
  ( (Nil!1015) (Cons!1014 (h!1582 tuple2!1470) (t!3851 List!1018)) )
))
(declare-datatypes ((ListLongMap!1047 0))(
  ( (ListLongMap!1048 (toList!539 List!1018)) )
))
(declare-fun lm!266 () ListLongMap!1047)

(declare-fun ListLongMapPrimitiveSize!3 (ListLongMap!1047) Int)

(assert (=> start!5282 (< (ListLongMapPrimitiveSize!3 lm!266) 0)))

(declare-fun e!24280 () Bool)

(declare-fun inv!1725 (ListLongMap!1047) Bool)

(assert (=> start!5282 (and (inv!1725 lm!266) e!24280)))

(declare-fun b!38206 () Bool)

(declare-fun tp!5693 () Bool)

(assert (=> b!38206 (= e!24280 tp!5693)))

(assert (= start!5282 b!38206))

(declare-fun m!30807 () Bool)

(assert (=> start!5282 m!30807))

(declare-fun m!30809 () Bool)

(assert (=> start!5282 m!30809))

(push 1)

(assert (not start!5282))

(assert (not b!38206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6199 () Bool)

(declare-fun lt!14096 () Int)

(assert (=> d!6199 (>= lt!14096 0)))

(declare-fun ListPrimitiveSize!42 (List!1018) Int)

(assert (=> d!6199 (= lt!14096 (+ 1 (ListPrimitiveSize!42 (toList!539 lm!266))))))

(assert (=> d!6199 (= (ListLongMapPrimitiveSize!3 lm!266) lt!14096)))

(declare-fun bs!1554 () Bool)

(assert (= bs!1554 d!6199))

(declare-fun m!30815 () Bool)

(assert (=> bs!1554 m!30815))

(assert (=> start!5282 d!6199))

(declare-fun d!6205 () Bool)

(declare-fun isStrictlySorted!211 (List!1018) Bool)

(assert (=> d!6205 (= (inv!1725 lm!266) (isStrictlySorted!211 (toList!539 lm!266)))))

(declare-fun bs!1557 () Bool)

(assert (= bs!1557 d!6205))

(declare-fun m!30821 () Bool)

(assert (=> bs!1557 m!30821))

(assert (=> start!5282 d!6205))

(declare-fun b!38221 () Bool)

(declare-fun e!24289 () Bool)

(declare-fun tp_is_empty!1733 () Bool)

(declare-fun tp!5702 () Bool)

(assert (=> b!38221 (= e!24289 (and tp_is_empty!1733 tp!5702))))

(assert (=> b!38206 (= tp!5693 e!24289)))

