; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1216 () Bool)

(assert start!1216)

(declare-datatypes ((B!312 0))(
  ( (B!313 (val!251 Int)) )
))
(declare-datatypes ((tuple2!302 0))(
  ( (tuple2!303 (_1!151 (_ BitVec 64)) (_2!151 B!312)) )
))
(declare-datatypes ((List!303 0))(
  ( (Nil!300) (Cons!299 (h!865 tuple2!302) (t!2450 List!303)) )
))
(declare-fun l!408 () List!303)

(declare-fun ListPrimitiveSize!3 (List!303) Int)

(assert (=> start!1216 (< (ListPrimitiveSize!3 l!408) 0)))

(declare-fun e!5945 () Bool)

(assert (=> start!1216 e!5945))

(declare-fun b!10295 () Bool)

(declare-fun tp_is_empty!485 () Bool)

(declare-fun tp!1469 () Bool)

(assert (=> b!10295 (= e!5945 (and tp_is_empty!485 tp!1469))))

(assert (= (and start!1216 (is-Cons!299 l!408)) b!10295))

(declare-fun m!6699 () Bool)

(assert (=> start!1216 m!6699))

(push 1)

(assert (not start!1216))

(assert (not b!10295))

(assert tp_is_empty!485)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1085 () Bool)

(declare-fun lt!2538 () Int)

(assert (=> d!1085 (>= lt!2538 0)))

(declare-fun e!5953 () Int)

(assert (=> d!1085 (= lt!2538 e!5953)))

(declare-fun c!922 () Bool)

(assert (=> d!1085 (= c!922 (is-Nil!300 l!408))))

(assert (=> d!1085 (= (ListPrimitiveSize!3 l!408) lt!2538)))

(declare-fun b!10310 () Bool)

(assert (=> b!10310 (= e!5953 0)))

(declare-fun b!10311 () Bool)

(assert (=> b!10311 (= e!5953 (+ 1 (ListPrimitiveSize!3 (t!2450 l!408))))))

(assert (= (and d!1085 c!922) b!10310))

(assert (= (and d!1085 (not c!922)) b!10311))

(declare-fun m!6703 () Bool)

(assert (=> b!10311 m!6703))

(assert (=> start!1216 d!1085))

(declare-fun b!10328 () Bool)

(declare-fun e!5963 () Bool)

(declare-fun tp!1478 () Bool)

(assert (=> b!10328 (= e!5963 (and tp_is_empty!485 tp!1478))))

(assert (=> b!10295 (= tp!1469 e!5963)))

(assert (= (and b!10295 (is-Cons!299 (t!2450 l!408))) b!10328))

(push 1)

