; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7604 () Bool)

(assert start!7604)

(declare-fun b!48436 () Bool)

(declare-fun e!31082 () Bool)

(declare-datatypes ((B!954 0))(
  ( (B!955 (val!1097 Int)) )
))
(declare-datatypes ((tuple2!1758 0))(
  ( (tuple2!1759 (_1!890 (_ BitVec 64)) (_2!890 B!954)) )
))
(declare-datatypes ((List!1280 0))(
  ( (Nil!1277) (Cons!1276 (h!1856 tuple2!1758) (t!4308 List!1280)) )
))
(declare-fun l!1333 () List!1280)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!110 (List!1280 (_ BitVec 64)) Bool)

(assert (=> b!48436 (= e!31082 (containsKey!110 (t!4308 l!1333) newKey!147))))

(declare-fun b!48437 () Bool)

(declare-fun e!31083 () Bool)

(declare-fun tp_is_empty!2105 () Bool)

(declare-fun tp!6407 () Bool)

(assert (=> b!48437 (= e!31083 (and tp_is_empty!2105 tp!6407))))

(declare-fun b!48438 () Bool)

(declare-fun res!28119 () Bool)

(assert (=> b!48438 (=> (not res!28119) (not e!31082))))

(assert (=> b!48438 (= res!28119 (not (containsKey!110 l!1333 newKey!147)))))

(declare-fun b!48440 () Bool)

(declare-fun res!28120 () Bool)

(assert (=> b!48440 (=> (not res!28120) (not e!31082))))

(declare-fun isStrictlySorted!249 (List!1280) Bool)

(assert (=> b!48440 (= res!28120 (isStrictlySorted!249 (t!4308 l!1333)))))

(declare-fun b!48439 () Bool)

(declare-fun res!28117 () Bool)

(assert (=> b!48439 (=> (not res!28117) (not e!31082))))

(assert (=> b!48439 (= res!28117 (not (is-Nil!1277 l!1333)))))

(declare-fun res!28118 () Bool)

(assert (=> start!7604 (=> (not res!28118) (not e!31082))))

(assert (=> start!7604 (= res!28118 (isStrictlySorted!249 l!1333))))

(assert (=> start!7604 e!31082))

(assert (=> start!7604 e!31083))

(assert (=> start!7604 true))

(assert (= (and start!7604 res!28118) b!48438))

(assert (= (and b!48438 res!28119) b!48439))

(assert (= (and b!48439 res!28117) b!48440))

(assert (= (and b!48440 res!28120) b!48436))

(assert (= (and start!7604 (is-Cons!1276 l!1333)) b!48437))

(declare-fun m!42171 () Bool)

(assert (=> b!48436 m!42171))

(declare-fun m!42173 () Bool)

(assert (=> b!48438 m!42173))

(declare-fun m!42175 () Bool)

(assert (=> b!48440 m!42175))

(declare-fun m!42177 () Bool)

(assert (=> start!7604 m!42177))

(push 1)

(assert (not b!48438))

(assert (not b!48440))

(assert (not b!48436))

(assert (not start!7604))

(assert (not b!48437))

(assert tp_is_empty!2105)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9614 () Bool)

(declare-fun res!28129 () Bool)

(declare-fun e!31092 () Bool)

(assert (=> d!9614 (=> res!28129 e!31092)))

(assert (=> d!9614 (= res!28129 (and (is-Cons!1276 (t!4308 l!1333)) (= (_1!890 (h!1856 (t!4308 l!1333))) newKey!147)))))

(assert (=> d!9614 (= (containsKey!110 (t!4308 l!1333) newKey!147) e!31092)))

(declare-fun b!48449 () Bool)

(declare-fun e!31093 () Bool)

(assert (=> b!48449 (= e!31092 e!31093)))

(declare-fun res!28130 () Bool)

(assert (=> b!48449 (=> (not res!28130) (not e!31093))))

(assert (=> b!48449 (= res!28130 (and (or (not (is-Cons!1276 (t!4308 l!1333))) (bvsle (_1!890 (h!1856 (t!4308 l!1333))) newKey!147)) (is-Cons!1276 (t!4308 l!1333)) (bvslt (_1!890 (h!1856 (t!4308 l!1333))) newKey!147)))))

(declare-fun b!48450 () Bool)

(assert (=> b!48450 (= e!31093 (containsKey!110 (t!4308 (t!4308 l!1333)) newKey!147))))

(assert (= (and d!9614 (not res!28129)) b!48449))

(assert (= (and b!48449 res!28130) b!48450))

(declare-fun m!42179 () Bool)

(assert (=> b!48450 m!42179))

(assert (=> b!48436 d!9614))

(declare-fun d!9619 () Bool)

(declare-fun res!28145 () Bool)

(declare-fun e!31108 () Bool)

(assert (=> d!9619 (=> res!28145 e!31108)))

(assert (=> d!9619 (= res!28145 (or (is-Nil!1277 (t!4308 l!1333)) (is-Nil!1277 (t!4308 (t!4308 l!1333)))))))

(assert (=> d!9619 (= (isStrictlySorted!249 (t!4308 l!1333)) e!31108)))

(declare-fun b!48465 () Bool)

(declare-fun e!31109 () Bool)

(assert (=> b!48465 (= e!31108 e!31109)))

(declare-fun res!28146 () Bool)

(assert (=> b!48465 (=> (not res!28146) (not e!31109))))

(assert (=> b!48465 (= res!28146 (bvslt (_1!890 (h!1856 (t!4308 l!1333))) (_1!890 (h!1856 (t!4308 (t!4308 l!1333))))))))

(declare-fun b!48466 () Bool)

(assert (=> b!48466 (= e!31109 (isStrictlySorted!249 (t!4308 (t!4308 l!1333))))))

(assert (= (and d!9619 (not res!28145)) b!48465))

(assert (= (and b!48465 res!28146) b!48466))

(declare-fun m!42185 () Bool)

(assert (=> b!48466 m!42185))

(assert (=> b!48440 d!9619))

(declare-fun d!9627 () Bool)

(declare-fun res!28147 () Bool)

(declare-fun e!31110 () Bool)

(assert (=> d!9627 (=> res!28147 e!31110)))

(assert (=> d!9627 (= res!28147 (or (is-Nil!1277 l!1333) (is-Nil!1277 (t!4308 l!1333))))))

(assert (=> d!9627 (= (isStrictlySorted!249 l!1333) e!31110)))

(declare-fun b!48467 () Bool)

(declare-fun e!31111 () Bool)

(assert (=> b!48467 (= e!31110 e!31111)))

(declare-fun res!28148 () Bool)

(assert (=> b!48467 (=> (not res!28148) (not e!31111))))

(assert (=> b!48467 (= res!28148 (bvslt (_1!890 (h!1856 l!1333)) (_1!890 (h!1856 (t!4308 l!1333)))))))

(declare-fun b!48468 () Bool)

(assert (=> b!48468 (= e!31111 (isStrictlySorted!249 (t!4308 l!1333)))))

(assert (= (and d!9627 (not res!28147)) b!48467))

(assert (= (and b!48467 res!28148) b!48468))

(assert (=> b!48468 m!42175))

(assert (=> start!7604 d!9627))

(declare-fun d!9629 () Bool)

(declare-fun res!28149 () Bool)

(declare-fun e!31112 () Bool)

(assert (=> d!9629 (=> res!28149 e!31112)))

(assert (=> d!9629 (= res!28149 (and (is-Cons!1276 l!1333) (= (_1!890 (h!1856 l!1333)) newKey!147)))))

(assert (=> d!9629 (= (containsKey!110 l!1333 newKey!147) e!31112)))

(declare-fun b!48469 () Bool)

(declare-fun e!31113 () Bool)

(assert (=> b!48469 (= e!31112 e!31113)))

(declare-fun res!28150 () Bool)

(assert (=> b!48469 (=> (not res!28150) (not e!31113))))

(assert (=> b!48469 (= res!28150 (and (or (not (is-Cons!1276 l!1333)) (bvsle (_1!890 (h!1856 l!1333)) newKey!147)) (is-Cons!1276 l!1333) (bvslt (_1!890 (h!1856 l!1333)) newKey!147)))))

(declare-fun b!48470 () Bool)

(assert (=> b!48470 (= e!31113 (containsKey!110 (t!4308 l!1333) newKey!147))))

(assert (= (and d!9629 (not res!28149)) b!48469))

(assert (= (and b!48469 res!28150) b!48470))

(assert (=> b!48470 m!42171))

(assert (=> b!48438 d!9629))

(declare-fun b!48479 () Bool)

(declare-fun e!31120 () Bool)

(declare-fun tp!6410 () Bool)

(assert (=> b!48479 (= e!31120 (and tp_is_empty!2105 tp!6410))))

(assert (=> b!48437 (= tp!6407 e!31120)))

(assert (= (and b!48437 (is-Cons!1276 (t!4308 l!1333))) b!48479))

(push 1)

(assert (not b!48466))

(assert (not b!48450))

(assert (not b!48479))

(assert tp_is_empty!2105)

(assert (not b!48468))

(assert (not b!48470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

