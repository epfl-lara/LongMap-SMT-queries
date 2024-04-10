; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5278 () Bool)

(assert start!5278)

(declare-datatypes ((B!806 0))(
  ( (B!807 (val!903 Int)) )
))
(declare-datatypes ((tuple2!1466 0))(
  ( (tuple2!1467 (_1!744 (_ BitVec 64)) (_2!744 B!806)) )
))
(declare-datatypes ((List!1016 0))(
  ( (Nil!1013) (Cons!1012 (h!1580 tuple2!1466) (t!3849 List!1016)) )
))
(declare-datatypes ((ListLongMap!1043 0))(
  ( (ListLongMap!1044 (toList!537 List!1016)) )
))
(declare-fun lm!266 () ListLongMap!1043)

(declare-fun ListLongMapPrimitiveSize!1 (ListLongMap!1043) Int)

(assert (=> start!5278 (< (ListLongMapPrimitiveSize!1 lm!266) 0)))

(declare-fun e!24274 () Bool)

(declare-fun inv!1723 (ListLongMap!1043) Bool)

(assert (=> start!5278 (and (inv!1723 lm!266) e!24274)))

(declare-fun b!38200 () Bool)

(declare-fun tp!5687 () Bool)

(assert (=> b!38200 (= e!24274 tp!5687)))

(assert (= start!5278 b!38200))

(declare-fun m!30799 () Bool)

(assert (=> start!5278 m!30799))

(declare-fun m!30801 () Bool)

(assert (=> start!5278 m!30801))

(push 1)

(assert (not start!5278))

(assert (not b!38200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6197 () Bool)

(declare-fun lt!14095 () Int)

(assert (=> d!6197 (>= lt!14095 0)))

(declare-fun ListPrimitiveSize!40 (List!1016) Int)

(assert (=> d!6197 (= lt!14095 (+ 1 (ListPrimitiveSize!40 (toList!537 lm!266))))))

(assert (=> d!6197 (= (ListLongMapPrimitiveSize!1 lm!266) lt!14095)))

(declare-fun bs!1553 () Bool)

(assert (= bs!1553 d!6197))

(declare-fun m!30813 () Bool)

(assert (=> bs!1553 m!30813))

(assert (=> start!5278 d!6197))

(declare-fun d!6203 () Bool)

(declare-fun isStrictlySorted!210 (List!1016) Bool)

(assert (=> d!6203 (= (inv!1723 lm!266) (isStrictlySorted!210 (toList!537 lm!266)))))

(declare-fun bs!1556 () Bool)

(assert (= bs!1556 d!6203))

(declare-fun m!30819 () Bool)

(assert (=> bs!1556 m!30819))

(assert (=> start!5278 d!6203))

(declare-fun b!38220 () Bool)

(declare-fun e!24288 () Bool)

(declare-fun tp_is_empty!1731 () Bool)

(declare-fun tp!5701 () Bool)

(assert (=> b!38220 (= e!24288 (and tp_is_empty!1731 tp!5701))))

(assert (=> b!38200 (= tp!5687 e!24288)))

(assert (= (and b!38200 (is-Cons!1012 (toList!537 lm!266))) b!38220))

(push 1)

