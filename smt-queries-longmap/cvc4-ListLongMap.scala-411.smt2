; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7694 () Bool)

(assert start!7694)

(declare-fun b!49024 () Bool)

(declare-fun e!31480 () Bool)

(declare-datatypes ((B!984 0))(
  ( (B!985 (val!1112 Int)) )
))
(declare-datatypes ((tuple2!1806 0))(
  ( (tuple2!1807 (_1!914 (_ BitVec 64)) (_2!914 B!984)) )
))
(declare-datatypes ((List!1309 0))(
  ( (Nil!1306) (Cons!1305 (h!1885 tuple2!1806) (t!4340 List!1309)) )
))
(declare-fun l!1333 () List!1309)

(declare-fun ListPrimitiveSize!54 (List!1309) Int)

(assert (=> b!49024 (= e!31480 (>= (ListPrimitiveSize!54 (t!4340 l!1333)) (ListPrimitiveSize!54 l!1333)))))

(declare-fun b!49025 () Bool)

(declare-fun e!31479 () Bool)

(declare-fun tp_is_empty!2135 () Bool)

(declare-fun tp!6482 () Bool)

(assert (=> b!49025 (= e!31479 (and tp_is_empty!2135 tp!6482))))

(declare-fun b!49022 () Bool)

(declare-fun res!28429 () Bool)

(assert (=> b!49022 (=> (not res!28429) (not e!31480))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!122 (List!1309 (_ BitVec 64)) Bool)

(assert (=> b!49022 (= res!28429 (not (containsKey!122 l!1333 newKey!147)))))

(declare-fun b!49023 () Bool)

(declare-fun res!28428 () Bool)

(assert (=> b!49023 (=> (not res!28428) (not e!31480))))

(assert (=> b!49023 (= res!28428 (not (is-Nil!1306 l!1333)))))

(declare-fun res!28430 () Bool)

(assert (=> start!7694 (=> (not res!28430) (not e!31480))))

(declare-fun isStrictlySorted!273 (List!1309) Bool)

(assert (=> start!7694 (= res!28430 (isStrictlySorted!273 l!1333))))

(assert (=> start!7694 e!31480))

(assert (=> start!7694 e!31479))

(assert (=> start!7694 true))

(assert (= (and start!7694 res!28430) b!49022))

(assert (= (and b!49022 res!28429) b!49023))

(assert (= (and b!49023 res!28428) b!49024))

(assert (= (and start!7694 (is-Cons!1305 l!1333)) b!49025))

(declare-fun m!42583 () Bool)

(assert (=> b!49024 m!42583))

(declare-fun m!42585 () Bool)

(assert (=> b!49024 m!42585))

(declare-fun m!42587 () Bool)

(assert (=> b!49022 m!42587))

(declare-fun m!42589 () Bool)

(assert (=> start!7694 m!42589))

(push 1)

(assert tp_is_empty!2135)

(assert (not b!49022))

(assert (not b!49024))

(assert (not start!7694))

(assert (not b!49025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9765 () Bool)

(declare-fun lt!20705 () Int)

(assert (=> d!9765 (>= lt!20705 0)))

(declare-fun e!31495 () Int)

(assert (=> d!9765 (= lt!20705 e!31495)))

(declare-fun c!6597 () Bool)

(assert (=> d!9765 (= c!6597 (is-Nil!1306 (t!4340 l!1333)))))

(assert (=> d!9765 (= (ListPrimitiveSize!54 (t!4340 l!1333)) lt!20705)))

(declare-fun b!49042 () Bool)

(assert (=> b!49042 (= e!31495 0)))

(declare-fun b!49043 () Bool)

(assert (=> b!49043 (= e!31495 (+ 1 (ListPrimitiveSize!54 (t!4340 (t!4340 l!1333)))))))

(assert (= (and d!9765 c!6597) b!49042))

(assert (= (and d!9765 (not c!6597)) b!49043))

(declare-fun m!42595 () Bool)

(assert (=> b!49043 m!42595))

(assert (=> b!49024 d!9765))

(declare-fun d!9771 () Bool)

(declare-fun lt!20706 () Int)

(assert (=> d!9771 (>= lt!20706 0)))

(declare-fun e!31496 () Int)

(assert (=> d!9771 (= lt!20706 e!31496)))

(declare-fun c!6598 () Bool)

(assert (=> d!9771 (= c!6598 (is-Nil!1306 l!1333))))

(assert (=> d!9771 (= (ListPrimitiveSize!54 l!1333) lt!20706)))

(declare-fun b!49044 () Bool)

(assert (=> b!49044 (= e!31496 0)))

(declare-fun b!49045 () Bool)

(assert (=> b!49045 (= e!31496 (+ 1 (ListPrimitiveSize!54 (t!4340 l!1333))))))

(assert (= (and d!9771 c!6598) b!49044))

(assert (= (and d!9771 (not c!6598)) b!49045))

(assert (=> b!49045 m!42583))

(assert (=> b!49024 d!9771))

(declare-fun d!9773 () Bool)

(declare-fun res!28453 () Bool)

(declare-fun e!31511 () Bool)

(assert (=> d!9773 (=> res!28453 e!31511)))

(assert (=> d!9773 (= res!28453 (or (is-Nil!1306 l!1333) (is-Nil!1306 (t!4340 l!1333))))))

(assert (=> d!9773 (= (isStrictlySorted!273 l!1333) e!31511)))

(declare-fun b!49064 () Bool)

(declare-fun e!31512 () Bool)

(assert (=> b!49064 (= e!31511 e!31512)))

(declare-fun res!28454 () Bool)

(assert (=> b!49064 (=> (not res!28454) (not e!31512))))

(assert (=> b!49064 (= res!28454 (bvslt (_1!914 (h!1885 l!1333)) (_1!914 (h!1885 (t!4340 l!1333)))))))

(declare-fun b!49065 () Bool)

(assert (=> b!49065 (= e!31512 (isStrictlySorted!273 (t!4340 l!1333)))))

(assert (= (and d!9773 (not res!28453)) b!49064))

(assert (= (and b!49064 res!28454) b!49065))

(declare-fun m!42601 () Bool)

(assert (=> b!49065 m!42601))

(assert (=> start!7694 d!9773))

(declare-fun d!9781 () Bool)

(declare-fun res!28465 () Bool)

(declare-fun e!31532 () Bool)

(assert (=> d!9781 (=> res!28465 e!31532)))

(assert (=> d!9781 (= res!28465 (and (is-Cons!1305 l!1333) (= (_1!914 (h!1885 l!1333)) newKey!147)))))

(assert (=> d!9781 (= (containsKey!122 l!1333 newKey!147) e!31532)))

(declare-fun b!49093 () Bool)

(declare-fun e!31533 () Bool)

(assert (=> b!49093 (= e!31532 e!31533)))

(declare-fun res!28466 () Bool)

(assert (=> b!49093 (=> (not res!28466) (not e!31533))))

(assert (=> b!49093 (= res!28466 (and (or (not (is-Cons!1305 l!1333)) (bvsle (_1!914 (h!1885 l!1333)) newKey!147)) (is-Cons!1305 l!1333) (bvslt (_1!914 (h!1885 l!1333)) newKey!147)))))

(declare-fun b!49094 () Bool)

(assert (=> b!49094 (= e!31533 (containsKey!122 (t!4340 l!1333) newKey!147))))

(assert (= (and d!9781 (not res!28465)) b!49093))

(assert (= (and b!49093 res!28466) b!49094))

(declare-fun m!42607 () Bool)

(assert (=> b!49094 m!42607))

(assert (=> b!49022 d!9781))

(declare-fun b!49100 () Bool)

(declare-fun e!31537 () Bool)

(declare-fun tp!6491 () Bool)

(assert (=> b!49100 (= e!31537 (and tp_is_empty!2135 tp!6491))))

(assert (=> b!49025 (= tp!6482 e!31537)))

(assert (= (and b!49025 (is-Cons!1305 (t!4340 l!1333))) b!49100))

(push 1)

(assert tp_is_empty!2135)

