; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7802 () Bool)

(assert start!7802)

(declare-datatypes ((B!1014 0))(
  ( (B!1015 (val!1127 Int)) )
))
(declare-datatypes ((tuple2!1836 0))(
  ( (tuple2!1837 (_1!929 (_ BitVec 64)) (_2!929 B!1014)) )
))
(declare-datatypes ((List!1324 0))(
  ( (Nil!1321) (Cons!1320 (h!1900 tuple2!1836) (t!4358 List!1324)) )
))
(declare-fun keyValues!2 () List!1324)

(declare-fun ListPrimitiveSize!57 (List!1324) Int)

(assert (=> start!7802 (< (ListPrimitiveSize!57 keyValues!2) 0)))

(declare-fun e!31789 () Bool)

(assert (=> start!7802 e!31789))

(declare-fun b!49463 () Bool)

(declare-fun tp_is_empty!2165 () Bool)

(declare-fun tp!6557 () Bool)

(assert (=> b!49463 (= e!31789 (and tp_is_empty!2165 tp!6557))))

(assert (= (and start!7802 (is-Cons!1320 keyValues!2)) b!49463))

(declare-fun m!42859 () Bool)

(assert (=> start!7802 m!42859))

(push 1)

(assert (not start!7802))

(assert (not b!49463))

(assert tp_is_empty!2165)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9911 () Bool)

(declare-fun lt!20761 () Int)

(assert (=> d!9911 (>= lt!20761 0)))

(declare-fun e!31797 () Int)

(assert (=> d!9911 (= lt!20761 e!31797)))

(declare-fun c!6683 () Bool)

(assert (=> d!9911 (= c!6683 (is-Nil!1321 keyValues!2))))

(assert (=> d!9911 (= (ListPrimitiveSize!57 keyValues!2) lt!20761)))

(declare-fun b!49478 () Bool)

(assert (=> b!49478 (= e!31797 0)))

(declare-fun b!49479 () Bool)

(assert (=> b!49479 (= e!31797 (+ 1 (ListPrimitiveSize!57 (t!4358 keyValues!2))))))

(assert (= (and d!9911 c!6683) b!49478))

(assert (= (and d!9911 (not c!6683)) b!49479))

(declare-fun m!42863 () Bool)

(assert (=> b!49479 m!42863))

(assert (=> start!7802 d!9911))

(declare-fun b!49495 () Bool)

(declare-fun e!31806 () Bool)

(declare-fun tp!6565 () Bool)

(assert (=> b!49495 (= e!31806 (and tp_is_empty!2165 tp!6565))))

(assert (=> b!49463 (= tp!6557 e!31806)))

(assert (= (and b!49463 (is-Cons!1320 (t!4358 keyValues!2))) b!49495))

(push 1)

